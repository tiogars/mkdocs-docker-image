from pathlib import Path
from urllib.parse import urlsplit

from mkdocs.config.defaults import MkDocsConfig
from mkdocs.plugins import event_priority
from mkdocs.structure.files import File, Files


@event_priority(100)
def on_config(config: MkDocsConfig) -> MkDocsConfig:
    pdf = config.plugins.get("to-pdf")
    if pdf is not None:
        config_dir = Path(config.config_file_path).parent
        if pdf.config["custom_template_path"]:
            pdf.config["custom_template_path"] = str(
                config_dir / pdf.config["custom_template_path"]
            )
        logo = pdf.config["cover_logo"]
        if logo and not urlsplit(logo).scheme and not urlsplit(logo).netloc:
            logo_path = (config_dir / logo).resolve()
            if not logo_path.is_file():
                raise FileNotFoundError(f"PDF cover logo not found: {logo_path}")
            pdf.config["cover_logo"] = logo_path.as_uri()
    return config


@event_priority(100)
def on_files(files: Files, config: MkDocsConfig) -> Files:
    config_dir = Path(config.config_file_path).parent
    for asset in sorted((config_dir / "assets").rglob("*")):
        if asset.is_file():
            asset_path = asset.relative_to(config_dir).as_posix()
            existing = files.get_file_from_path(asset_path)
            if existing is not None:
                files.remove(existing)
            files.append(
                File(
                    asset_path,
                    str(config_dir),
                    config.site_dir,
                    config.use_directory_urls,
                )
            )
    return files
