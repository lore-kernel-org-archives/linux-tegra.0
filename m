From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1] sdhci: tegra: Add workaround for Broadcom WiFi
Date: Tue, 10 Dec 2019 15:32:43 +0100
Message-ID: <20191210143243.GH2703785@ulmo>
References: <20191210014011.21987-1-digetx@gmail.com>
 <20191210125208.GD2703785@ulmo>
 <61b7a865-6a6f-5edf-7463-cfdd6b20f687@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="0OWHXb1mYLuhj1Ox"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <61b7a865-6a6f-5edf-7463-cfdd6b20f687@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulf.hansson@linaro.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-mmc@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--0OWHXb1mYLuhj1Ox
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2019 at 05:15:58PM +0300, Dmitry Osipenko wrote:
> 10.12.2019 15:52, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Tue, Dec 10, 2019 at 04:40:11AM +0300, Dmitry Osipenko wrote:
> >> All Tegra20 boards that have embedded Broadcom WiFi SDIO chip are affe=
cted
> >> by a problem where WiFi chip reports CCCR v1.10, while it should v1.20.
> >> In a result high-speed mode isn't enabled for the WiFi card and this
> >> results in a malfunctioning SDIO communication.
> >>
> >>  brcmfmac: brcmf_sdio_readframes: read 304 bytes from channel 1 failed=
: -84
> >>  brcmfmac: brcmf_sdio_rxfail: abort command, terminate frame, send NAK
> >>
> >> Downstream kernels are overriding card's CCCR info in SDHCI driver to =
fix
> >> the problem, let's do the same in upstream.
> >>
> >> The change is inspired by omap_hsmmc_init_card() of OMAP's HSMMC drive=
r,
> >> which overrides card's info for the TI wl1251 WiFi.
> >>
> >> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> >> ---
> >>  drivers/mmc/host/sdhci-tegra.c | 28 ++++++++++++++++++++++++++++
> >>  1 file changed, 28 insertions(+)
> >=20
> > This seems like the wrong place to do this. If this is specific to this
> > WiFi SDIO chip this should be handled at the SDIO card or function
> > level. It seems like the SDIO infrastructure doesn't currently allow
> > this because the OF nodes are attached to the card after
> > mmc_sdio_init_card(), whereas it seems like the quirk is already needed
> > during mmc_sdio_init_card().
> >=20
> > That said, I think we could have some common code that's executed as
> > part of mmc_attach_sdio() (and before mmc_sdio_init_card()).
> >=20
> > Actually, it looks like we already have something like that.
> > mmc_sdio_init_card() calls mmc_fixup_device() with sdio_fixup_methods
> > after doing some very basic initialization. Do you know if things start
> > to go wrong before or after that point? It might be worth looking at
> > that SDIO fixup array and add something that would override the CCCR
> > support. That would fix things in a more generic way rather than
> > requiring every host controller driver to duplicate this quirk.
>=20
> Hello Thierry,
>=20
> Thank you very much for the suggestion, looks like indeed it is possible
> to make workaround in a generic way.
>=20
> Ulf / Adrian, will something like this be acceptable:
>=20
> diff --git a/drivers/mmc/core/card.h b/drivers/mmc/core/card.h
> index 7bd392d55cfa..a6001f210b9e 100644
> --- a/drivers/mmc/core/card.h
> +++ b/drivers/mmc/core/card.h
> @@ -150,6 +150,12 @@ static inline void __maybe_unused
> add_limit_rate_quirk(struct mmc_card *card,
>  	card->quirk_max_rate =3D data;
>  }
>=20
> +static inline void __maybe_unused add_high_speed_quirk(struct mmc_card
> *card,
> +						       int data)
> +{
> +	card->cccr.high_speed =3D data;
> +}
> +
>  /*
>   * Quirk add/remove for MMC products.
>   */
> diff --git a/drivers/mmc/core/quirks.h b/drivers/mmc/core/quirks.h
> index 3dba15bccce2..a824c0caa7fb 100644
> --- a/drivers/mmc/core/quirks.h
> +++ b/drivers/mmc/core/quirks.h
> @@ -142,6 +142,9 @@ static const struct mmc_fixup sdio_fixup_methods[] =
=3D {
>  	SDIO_FIXUP(SDIO_VENDOR_ID_MARVELL, SDIO_DEVICE_ID_MARVELL_8887WLAN,
>  		   add_limit_rate_quirk, 150000000),
>=20
> +	SDIO_FIXUP(SDIO_VENDOR_ID_BROADCOM, SDIO_DEVICE_ID_BROADCOM_4329,
> +		   add_high_speed_quirk, 1),
> +
>  	END_FIXUP
>  };
>=20

Looks good to me:

Reviewed-by: Thierry Reding <treding@nvidia.com>

--0OWHXb1mYLuhj1Ox
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3vrIgACgkQ3SOs138+
s6EzRg//bnep9XJO8K7TeIDvFcLEtl3K1l0+f9fV5cDqNfwNx8Fv3IJCRX4HhfHO
GkMnFAsfxPG7P/e9xD9FaaykAcOx2Jowfi7VZdxpPlgTLrGwqGqdSTQMkSyeXwIA
oLK987art7xvUZtEJ0Dv5RNunT0OzNKY/11euzjfxQRrI3ZP2DaMoNFzC6MwCsFz
iVMvfFNDXiwmUsRTRsLdx/kjAU6wf0qu9waOTlrQshGFaYQbU1LWWqUhrzBLKGhF
S8QvZvYA+ZXA0mSlMzQQQMlMnZn9TA7iOhA/mBFpJ59YLYecOaHzcOjS2DHTl2eE
g5CySU4FHSkLtLPWl83d7grmLF+aver+zys7KZs7pTRwGbPysu9FhdW3DXG6Mn/Y
/PjdpT3n4L/TE2sn0hxeeLv0GmCN3FfQkqH7Dr/U7GRCqsJLVRaRFDr20UKwrDHc
ZRqn36kIHh5oEioJKSGXBz4aG7Nd0505xJEmM430IPiPdbQfVPAxOytw8yX7GUKZ
6f0gOmrqrSJ70oH9Mr5OUoEL50V/7rJclQLMvDTONPr2xbzSxapaE1YXOUoC5OMF
+iERtaVzjK4pczy6KAleZclCxWQsHz1Uj6MNWo4fkHFRLOiXnf+QHVYcm9KzlCzk
6Aw3KN1odW6TZ9nrO8Pq+6MzsPX1tNS3EXlc7UhFBT7g0mzOKQM=
=HiyQ
-----END PGP SIGNATURE-----

--0OWHXb1mYLuhj1Ox--
