From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] sdhci: tegra: Avoid reading autocal timeout values when
 not applicable
Date: Fri, 22 May 2020 14:26:44 +0200
Message-ID: <20200522122644.GE2163848@ulmo>
References: <1590005337-1087-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="SWTRyWv/ijrBap1m"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1590005337-1087-1-git-send-email-skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mmc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--SWTRyWv/ijrBap1m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2020 at 01:08:57PM -0700, Sowjanya Komatineni wrote:
> When auto calibration timeouts, calibration is disabled and fail-safe
> drive strength values are programmed based on the signal voltage.
>=20
> Different fail-safe drive strength values based on voltage are
> applicable only for SoCs supporting 3V3 and 1V8 pad controls.
>=20
> So, this patch avoids reading these properties from the device tree
> for SoCs not using pad controls and the warning of missing properties
> will not show up on these SoC platforms.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/mmc/host/sdhci-tegra.c | 57 ++++++++++++++++++++++++------------=
------
>  1 file changed, 33 insertions(+), 24 deletions(-)
>=20
> diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegr=
a.c
> index 3e2c510..141b49b 100644
> --- a/drivers/mmc/host/sdhci-tegra.c
> +++ b/drivers/mmc/host/sdhci-tegra.c
> @@ -605,6 +605,39 @@ static void tegra_sdhci_parse_pad_autocal_dt(struct =
sdhci_host *host)
>  		autocal->pull_down_1v8 =3D 0;
> =20
>  	err =3D device_property_read_u32(host->mmc->parent,
> +			"nvidia,pad-autocal-pull-up-offset-sdr104",
> +			&autocal->pull_up_sdr104);
> +	if (err)
> +		autocal->pull_up_sdr104 =3D autocal->pull_up_1v8;
> +
> +	err =3D device_property_read_u32(host->mmc->parent,
> +			"nvidia,pad-autocal-pull-down-offset-sdr104",
> +			&autocal->pull_down_sdr104);
> +	if (err)
> +		autocal->pull_down_sdr104 =3D autocal->pull_down_1v8;
> +
> +	err =3D device_property_read_u32(host->mmc->parent,
> +			"nvidia,pad-autocal-pull-up-offset-hs400",
> +			&autocal->pull_up_hs400);
> +	if (err)
> +		autocal->pull_up_hs400 =3D autocal->pull_up_1v8;
> +
> +	err =3D device_property_read_u32(host->mmc->parent,
> +			"nvidia,pad-autocal-pull-down-offset-hs400",
> +			&autocal->pull_down_hs400);
> +	if (err)
> +		autocal->pull_down_hs400 =3D autocal->pull_down_1v8;
> +
> +	/*
> +	 * Different fail-safe drive strength values based on the signaling
> +	 * voltage are applicable for SoCs supporting 3V3 and 1V8 pad controls.
> +	 * So, avoid reading below device tree properies for SoCs that don't
> +	 * have NVQUIRK_NEEDS_PAD_CONTROL.
> +	 */
> +	if (!(tegra_host->soc_data->nvquirks & NVQUIRK_NEEDS_PAD_CONTROL))
> +		return;

Hm... so what exactly is the difference between NVQUIRK_HAS_PADCALIB? I
think Tegra30 will also end up calling tegra_sdhci_set_padctrl(), but it
will then write the default (0) value for these drive strength. Is that
okay?

Thierry

--SWTRyWv/ijrBap1m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7HxQIACgkQ3SOs138+
s6ECKQ/+MUyZimUTr+GNyYhG0txsozb2smT7J9qvfa3wFzJQt8aO9n84YGm4Hlng
V6xRd8ZOd96YaY05+gWu9CUiymbHSNQISxCb2K1IghSf+LNJcMxQQMAnEnhgtHHF
LaAR5bZtaaSxvxE3ToKP9cJkRjMgwYloEEaK+voYD+PPSzltvr3juqJe8SxDQKy/
1Kc64KUbdYA7xFjMCZzDJ6mdNkZ5P74p7ftp7mfjhI4cTIVy62YGQuaQOmLpb7Sc
4NthQrnlM64CZyD9okaqpArOw5hthoSQUD+vBGVEUCnyM6SBUmHZegSkxP51YJuF
x6ehf/ubBhc0YbviwSPW/ErmY1wp/w/FWM6P+j4sryxRoTMPuGcj25Pw7ZQa3VGz
NPtpMZLedcdftFSfUmqfuAUZ2wVMQEU1acm2lLNZMTtziICudTYfuivu4l6a7tf4
nm0MGXiqjaGq1V2uafvzBEBGlTapRKLWFUQSb9mlL6xKh3KMQQunrUEg4uJaxk3V
MAOHVWw8Igp3xC+DDUe9TuF7/RtwNiD1TiRQTiJgM4l0GbCShgP9iOJ2aN7vA2QR
fUL6aULacD6eoT1HNE78TQjhqNddT5F5zuA6jETEJedUitUPmzHYKy8XITli0hTi
VtsGGz9DVDvAkUhkQ9eKmsQFkJGYT5je7yRzOjpokZim2xSZg8A=
=npis
-----END PGP SIGNATURE-----

--SWTRyWv/ijrBap1m--
