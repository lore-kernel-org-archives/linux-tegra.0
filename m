From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1] sdhci: tegra: Add workaround for Broadcom WiFi
Date: Tue, 10 Dec 2019 13:52:08 +0100
Message-ID: <20191210125208.GD2703785@ulmo>
References: <20191210014011.21987-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="AkbCVLjbJ9qUtAXD"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191210014011.21987-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--AkbCVLjbJ9qUtAXD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2019 at 04:40:11AM +0300, Dmitry Osipenko wrote:
> All Tegra20 boards that have embedded Broadcom WiFi SDIO chip are affected
> by a problem where WiFi chip reports CCCR v1.10, while it should v1.20.
> In a result high-speed mode isn't enabled for the WiFi card and this
> results in a malfunctioning SDIO communication.
>=20
>  brcmfmac: brcmf_sdio_readframes: read 304 bytes from channel 1 failed: -=
84
>  brcmfmac: brcmf_sdio_rxfail: abort command, terminate frame, send NAK
>=20
> Downstream kernels are overriding card's CCCR info in SDHCI driver to fix
> the problem, let's do the same in upstream.
>=20
> The change is inspired by omap_hsmmc_init_card() of OMAP's HSMMC driver,
> which overrides card's info for the TI wl1251 WiFi.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/mmc/host/sdhci-tegra.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)

This seems like the wrong place to do this. If this is specific to this
WiFi SDIO chip this should be handled at the SDIO card or function
level. It seems like the SDIO infrastructure doesn't currently allow
this because the OF nodes are attached to the card after
mmc_sdio_init_card(), whereas it seems like the quirk is already needed
during mmc_sdio_init_card().

That said, I think we could have some common code that's executed as
part of mmc_attach_sdio() (and before mmc_sdio_init_card()).

Actually, it looks like we already have something like that.
mmc_sdio_init_card() calls mmc_fixup_device() with sdio_fixup_methods
after doing some very basic initialization. Do you know if things start
to go wrong before or after that point? It might be worth looking at
that SDIO fixup array and add something that would override the CCCR
support. That would fix things in a more generic way rather than
requiring every host controller driver to duplicate this quirk.

Thierry

> diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegr=
a.c
> index 7bc950520fd9..2ad87da98f2c 100644
> --- a/drivers/mmc/host/sdhci-tegra.c
> +++ b/drivers/mmc/host/sdhci-tegra.c
> @@ -1501,6 +1501,32 @@ static int sdhci_tegra_add_host(struct sdhci_host =
*host)
>  	return ret;
>  }
> =20
> +static void sdhci_tegra_init_card(struct mmc_host *mmc, struct mmc_card =
*card)
> +{
> +	if (card->type =3D=3D MMC_TYPE_SDIO) {
> +		struct device_node *np =3D mmc_dev(mmc)->of_node;
> +
> +		np =3D of_get_compatible_child(np, "brcm,bcm4329-fmac");
> +		if (np) {
> +			dev_info(mmc_dev(mmc), "found bcm4329\n");
> +
> +			/*
> +			 * All Tegra20 boards that have embedded BCM4329
> +			 * chip need to enable high speed for SDIO, otherwise
> +			 * further communication with the card doesn't work
> +			 * well.
> +			 *
> +			 * Later BCM43xx chips do not need this workaround,
> +			 * but there is no good way to differentiate chip's
> +			 * version at this stage and it doesn't cause any
> +			 * harm for the later chips.
> +			 */
> +			card->cccr.high_speed =3D 1;
> +			of_node_put(np);
> +		}
> +	}
> +}
> +
>  static int sdhci_tegra_probe(struct platform_device *pdev)
>  {
>  	const struct of_device_id *match;
> @@ -1545,6 +1571,8 @@ static int sdhci_tegra_probe(struct platform_device=
 *pdev)
>  		host->mmc_host_ops.execute_tuning =3D
>  				tegra_sdhci_execute_hw_tuning;
> =20
> +	host->mmc_host_ops.init_card =3D sdhci_tegra_init_card;
> +
>  	rc =3D mmc_of_parse(host->mmc);
>  	if (rc)
>  		goto err_parse_dt;
> --=20
> 2.24.0
>=20

--AkbCVLjbJ9qUtAXD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3vlPYACgkQ3SOs138+
s6EEig/9G0UHUk7Bmvo/1xi3zh1yjTsm5ZG90FSCRQnrnd1QEHZ7beKfoyHh1ZyX
YQLtTtZN0f5d6kAr69+1HTqUR22+AsM5XY5zWjWyUsySiPKwbx/hKcPl+PeHGPlS
oUjEI3R9oq6XRlaOFYdFKO1l4JfUbO6SvPvCDLnf/SbiQm6qx9mfc21sYj9eyoA2
XNlcJVthp5S/E3VcyNMx4YArblHPtrKRaZW4KnfboauU7PJwfwgCCn14FD/muF+M
kKusUMsYKNWGvu9VofWyr2kg0Ms76nvzKbQJfgZNJejm+BzwcsJvqGasyGOI9mSp
h0+ldVUl1mgGa+90iY9cpEE7AarfX0lfvX2ZFBOkmQP+LiG7/kMaxkNFTyKl+Nz8
3+VUhEq3BIc64lv4k1/yiVcI6kdozo+Aa4gREaR23VpiXzRhT+q1uVoHxVg5MoEN
YtN/LXuBXczfZHUnpmb1/pZKYGhF4DPrzLWqxS/xaKlWdw6Sjb/WPpYj9DOhLysG
eVtYN7o8f1E22dEPOcV8PCa7X6SLMG6eY2PRS+QFQJdz/gbYEJDNsrE6n9zqcd5r
Izun4caxrjgCZGszzsnavN61vRkxmJu9cFyl4s9knv8vnj6P3IN5bDpW5wOo9hVu
PiwVybFkXCqO3mt0Zu4r4xkzlcbKRi7IxYLrdCceWI78zLvP128=
=3qZu
-----END PGP SIGNATURE-----

--AkbCVLjbJ9qUtAXD--
