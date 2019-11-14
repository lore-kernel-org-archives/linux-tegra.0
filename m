From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2] drm/tegra: Turn off and reset hardware across
 suspend-resume
Date: Thu, 14 Nov 2019 21:31:17 +0100
Message-ID: <20191114203117.GA761559@ulmo>
References: <20190811183932.15850-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="EVF5PPMfhYS0aIcm"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190811183932.15850-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 11, 2019 at 09:39:32PM +0300, Dmitry Osipenko wrote:
> The drivers core bumps runtime PM refcount during of entering into
> suspend to workaround some problem where parent device may become turned
> off before its children. In order to disable and reset CRTCs/HDMI/etc
> hardware, the runtime PM needs to be "forced" into suspend mode.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>=20
> Changelog:
>=20
> v2: The SYSTEM_SLEEP_PM_OPS are now set for all of the relevant drivers a=
nd
>     not only for the DC because turned out that they all should enforce t=
he
>     suspending.
>=20
>  drivers/gpu/drm/tegra/dc.c    | 2 ++
>  drivers/gpu/drm/tegra/dpaux.c | 2 ++
>  drivers/gpu/drm/tegra/dsi.c   | 2 ++
>  drivers/gpu/drm/tegra/hdmi.c  | 2 ++
>  drivers/gpu/drm/tegra/hub.c   | 2 ++
>  drivers/gpu/drm/tegra/sor.c   | 2 ++
>  drivers/gpu/drm/tegra/vic.c   | 2 ++
>  7 files changed, 14 insertions(+)

I'm not exactly sure I understand why this is necessary. Runtime PM is
controlled by the drivers themselves so that when an output (say SOR) is
disabled, it drops the runtime PM reference. The idea is that since the
disabled output is no longer needed it can just go into a low power mode
which on Tegra usually means clocks off and reset asserted (and in some
cases also power domain off).

DRM/KMS has system-level suspend support, which we use to disable all
outputs when entering suspend. I see that, unfortunately, this doesn't
seem to actually cause the devices to runtime suspend. I'm pretty sure
that this used to work at some point, so I don't know what changed. I'd
have to look into this a little more. The core doing something like this
behind the driver's back seems wrong and having to force the device into
suspend mode seems like it's just piling up on the workarounds.

Thierry

>=20
> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> index 4a75d149e368..6c8f5222d558 100644
> --- a/drivers/gpu/drm/tegra/dc.c
> +++ b/drivers/gpu/drm/tegra/dc.c
> @@ -2572,6 +2572,8 @@ static int tegra_dc_resume(struct device *dev)
> =20
>  static const struct dev_pm_ops tegra_dc_pm_ops =3D {
>  	SET_RUNTIME_PM_OPS(tegra_dc_suspend, tegra_dc_resume, NULL)
> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +				pm_runtime_force_resume)
>  };
> =20
>  struct platform_driver tegra_dc_driver =3D {
> diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
> index 2d94da225e51..22f80f69ffb8 100644
> --- a/drivers/gpu/drm/tegra/dpaux.c
> +++ b/drivers/gpu/drm/tegra/dpaux.c
> @@ -638,6 +638,8 @@ static int tegra_dpaux_resume(struct device *dev)
> =20
>  static const struct dev_pm_ops tegra_dpaux_pm_ops =3D {
>  	SET_RUNTIME_PM_OPS(tegra_dpaux_suspend, tegra_dpaux_resume, NULL)
> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +				pm_runtime_force_resume)
>  };
> =20
>  static const struct of_device_id tegra_dpaux_of_match[] =3D {
> diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
> index 2fbfefe9cb42..fd0f8cec8c7e 100644
> --- a/drivers/gpu/drm/tegra/dsi.c
> +++ b/drivers/gpu/drm/tegra/dsi.c
> @@ -1665,6 +1665,8 @@ static int tegra_dsi_resume(struct device *dev)
> =20
>  static const struct dev_pm_ops tegra_dsi_pm_ops =3D {
>  	SET_RUNTIME_PM_OPS(tegra_dsi_suspend, tegra_dsi_resume, NULL)
> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +				pm_runtime_force_resume)
>  };
> =20
>  static const struct of_device_id tegra_dsi_of_match[] =3D {
> diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
> index 334c4d7d238b..ef66defac767 100644
> --- a/drivers/gpu/drm/tegra/hdmi.c
> +++ b/drivers/gpu/drm/tegra/hdmi.c
> @@ -1739,6 +1739,8 @@ static int tegra_hdmi_resume(struct device *dev)
> =20
>  static const struct dev_pm_ops tegra_hdmi_pm_ops =3D {
>  	SET_RUNTIME_PM_OPS(tegra_hdmi_suspend, tegra_hdmi_resume, NULL)
> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +				pm_runtime_force_resume)
>  };
> =20
>  struct platform_driver tegra_hdmi_driver =3D {
> diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
> index 92f202ec0577..3d33d0360169 100644
> --- a/drivers/gpu/drm/tegra/hub.c
> +++ b/drivers/gpu/drm/tegra/hub.c
> @@ -931,6 +931,8 @@ static int __maybe_unused tegra_display_hub_resume(st=
ruct device *dev)
>  static const struct dev_pm_ops tegra_display_hub_pm_ops =3D {
>  	SET_RUNTIME_PM_OPS(tegra_display_hub_suspend,
>  			   tegra_display_hub_resume, NULL)
> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +				pm_runtime_force_resume)
>  };
> =20
>  static const struct tegra_display_hub_soc tegra186_display_hub =3D {
> diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
> index 4ffe3794e6d3..b743193bf0b1 100644
> --- a/drivers/gpu/drm/tegra/sor.c
> +++ b/drivers/gpu/drm/tegra/sor.c
> @@ -3572,6 +3572,8 @@ static int tegra_sor_resume(struct device *dev)
> =20
>  static const struct dev_pm_ops tegra_sor_pm_ops =3D {
>  	SET_RUNTIME_PM_OPS(tegra_sor_suspend, tegra_sor_resume, NULL)
> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +				pm_runtime_force_resume)
>  };
> =20
>  struct platform_driver tegra_sor_driver =3D {
> diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
> index 958548ef69e7..880304a65c5c 100644
> --- a/drivers/gpu/drm/tegra/vic.c
> +++ b/drivers/gpu/drm/tegra/vic.c
> @@ -476,6 +476,8 @@ static int vic_remove(struct platform_device *pdev)
> =20
>  static const struct dev_pm_ops vic_pm_ops =3D {
>  	SET_RUNTIME_PM_OPS(vic_runtime_suspend, vic_runtime_resume, NULL)
> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +				pm_runtime_force_resume)
>  };
> =20
>  struct platform_driver tegra_vic_driver =3D {
> --=20
> 2.22.0
>=20

--EVF5PPMfhYS0aIcm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3NuYwACgkQ3SOs138+
s6G+7Q/+P+mkojE+rHRI4ZMc+b9mOvTUZBtwAj53oa4TdGYuTCZdSb3SxsOHtkCV
ILcEuY1Wjbw1JEAWclTVaFXJy3eWlJHcG+tDZf3NKZefuAQ+HJbPUJ2Z1YBwfy7n
DqcXdpTY5lfFWbuZCaU35bPlL7Bfd2MEZD7SxLdC+Tfcv8I7jfFZjBPZJN3GdGfk
KEPwXFBfQ2XeQmUHcidkEjJFADGwKGApU6MORS1UnV6epF3d5mLLF5CUqajIPZh7
Nd4mseykcmfoARHRLAmlK3dV9zHE5JGgFLpbWCF/NKvS7eP7Ke4qMetp3qhPOUto
ZNSMloJiSbEimHsZbG9YlyCvYulkDz4u2ECK13iE13rnROjSt06qhqR91G20ibFJ
axYyZHlV1UGg0DvGliyHlkgBKWnjiXuc4mPYlzJxutmo7B+uRkiQ0wqLo8vlf72o
4NBizcSzfmy+TYPL2jkMqePvJJyrGz+0xhFyxb6Ft7zR+x1vQFYpSw5TPksZ/O0k
doGZrJRDZPvGCiCr8iJnI1qjTo2Y/WZS5kRmheFDO2Q6qdNfxLKEtlOtJDA2l3lU
vwphL1XBC8oa/OKCHBqTW5G5iCR28/9+YIb4mq5OorBUdY+bVl1hgyiNFYvjsVHW
GN4sSS9gy0l50Znta4ecJ9k1eYTuPBvBWTenJ3+T4ealVDNm2R4=
=XCS8
-----END PGP SIGNATURE-----

--EVF5PPMfhYS0aIcm--
