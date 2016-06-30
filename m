From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/6] soc/tegra: pmc: Fix early initialisation of PMC
Date: Thu, 30 Jun 2016 12:03:06 +0200
Message-ID: <20160630100306.GE1776@ulmo.ba.sec>
References: <1467110308-22126-1-git-send-email-jonathanh@nvidia.com>
 <1467110308-22126-3-git-send-email-jonathanh@nvidia.com>
 <5773F485.8090504@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wchHw8dVAp53YPj8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5773F485.8090504-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--wchHw8dVAp53YPj8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 29, 2016 at 05:17:09PM +0100, Jon Hunter wrote:
>=20
> On 28/06/16 11:38, Jon Hunter wrote:
> > During early initialisation, the available power partitions for a given
> > device is configured as well as the polarity of the PMC interrupt. Both
> > of which should only be configured if there is a valid device node for
> > the PMC device. This is because the soc data used for configuring the
> > power partitions is only available if a device node for the PMC is found
> > and the code to configure the interrupt polarity uses the device node
> > pointer directly.
> >=20
> > Some early device-tree images may not have this device node and so fix
> > this by ensuring the device node pointer is valid when configuring these
> > items.
> >=20
> > Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  drivers/soc/tegra/pmc.c | 34 ++++++++++++++++++----------------
> >  1 file changed, 18 insertions(+), 16 deletions(-)
> >=20
> > diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> > index 52a9e9703668..2e031c4ad547 100644
> > --- a/drivers/soc/tegra/pmc.c
> > +++ b/drivers/soc/tegra/pmc.c
> > @@ -1550,27 +1550,29 @@ static int __init tegra_pmc_early_init(void)
> >  		return -ENXIO;
> >  	}
> > =20
> > -	/* Create a bit-map of the available and valid partitions */
> > -	for (i =3D 0; i < pmc->soc->num_powergates; i++)
> > -		if (pmc->soc->powergates[i])
> > -			set_bit(i, pmc->powergates_available);
> > -
> >  	mutex_init(&pmc->powergates_lock);
> > =20
> > -	/*
> > -	 * Invert the interrupt polarity if a PMC device tree node exists and
> > -	 * contains the nvidia,invert-interrupt property.
> > -	 */
> > -	invert =3D of_property_read_bool(np, "nvidia,invert-interrupt");
> > +	if (np) {
> > +		/* Create a bit-map of the available and valid partitions */
> > +		for (i =3D 0; i < pmc->soc->num_powergates; i++)
> > +			if (pmc->soc->powergates[i])
> > +				set_bit(i, pmc->powergates_available);
> > =20
> > -	value =3D tegra_pmc_readl(PMC_CNTRL);
> > +		/*
> > +		 * Invert the interrupt polarity if a PMC device tree node
> > +		 * exists and contains the nvidia,invert-interrupt property.
> > +		 */
> > +		invert =3D of_property_read_bool(np, "nvidia,invert-interrupt");
> > =20
> > -	if (invert)
> > -		value |=3D PMC_CNTRL_INTR_POLARITY;
> > -	else
> > -		value &=3D ~PMC_CNTRL_INTR_POLARITY;
> > +		value =3D tegra_pmc_readl(PMC_CNTRL);
> > =20
> > -	tegra_pmc_writel(value, PMC_CNTRL);
> > +		if (invert)
> > +			value |=3D PMC_CNTRL_INTR_POLARITY;
> > +		else
> > +			value &=3D ~PMC_CNTRL_INTR_POLARITY;
> > +
> > +		tegra_pmc_writel(value, PMC_CNTRL);
> > +	}
> > =20
> >  	return 0;
> >  }
>=20
> By the way, the more I think about this, if there is no valid 'pmc'
> node in the device-tree blob, then I wonder if we should even bother
> mapping the pmc address space at all? The reason being, if there is
> no 'pmc' node then we cannot look-up the SoC data and so all the
> public PMC APIs are pretty useless AFAICT. I wonder if we should do
> something like ...

I think it's fine as-is. The PMC driver does more than just powergates
and it'd be useful to have the rest continue to work even on old DTBs.
Everything should already be properly guarded against this exception.

Thierry

--wchHw8dVAp53YPj8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXdO5YAAoJEN0jrNd/PrOhcokP/1kiIFzbjOSMQ0m77jVI0+bf
bSLfHsLLJ76W1hDwBi7UzP4prok62aWVN1xrZ6B0AdY2FpOHSnD+UyNTXWlyJatD
sBUJ6bwXAd+qOnwy2uAoEe3mJ+Tq6RtyS0s2MoCa8UH9zvRM/I3KvGoOLtTtAzMe
EH1Tl9daHIZLdsxqjtzVJbCTjqbxRTvmYj2HGIZ76RgwesYqblThXGA7tTzIoUJY
3vgoD7tbERjuozK03cvWxf1AgfyBMVp+pnr/dXItDtSd9fYHfiQ0D0qWwB+mjAro
1mE+rFity3c43uYidnxVtzC+tMYDvqx5wJ6dLrlMjvJk7EedncI1A+wybbpHpM0g
77G8SRgomnjO4MlX/TWOgfzxBaQkRSnw07FFk9LfQztpX/S2dU4MH9afR01p/Ln5
bzs14H09mz9l9REUClxAaVnLiY/nvTGvMnCFRQ/IFswC8a0AqhSLiANj2FSeaSBA
WTARiIzLMmM4KYNNMd1dDHaF/oqVywLaasy1rCrl1LE/FxiChlGo/kz+/Wh6kB7L
xRIC7ZODjkSH07ImKlOISVpq+OSFOMt2RY2r43PpyRsCwJMbTLq+imm5otOjvF3s
u6NcQWbcWJADcjNm7nWLH0l8nRQ0Q49mY92+iWFnyH4Te0arbH2pfNAf4B7lYleN
kfpd+EamiLOv/Vzk99DW
=yoa0
-----END PGP SIGNATURE-----

--wchHw8dVAp53YPj8--
