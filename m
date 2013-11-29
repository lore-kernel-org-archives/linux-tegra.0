From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/5] clk: tegra: fix blink clock rate
Date: Fri, 29 Nov 2013 16:37:09 +0100
Message-ID: <20131129153708.GN9712@ulmo.nvidia.com>
References: <1384991242-13596-1-git-send-email-swarren@wwwdotorg.org>
 <20131129152241.GM9712@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="p1Od3smaOkJqivj4"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131129152241.GM9712-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--p1Od3smaOkJqivj4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 29, 2013 at 04:22:42PM +0100, Thierry Reding wrote:
> On Wed, Nov 20, 2013 at 04:47:18PM -0700, Stephen Warren wrote:
> > From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > The blink clock rate needs to be configured, or it will run at ~1Hz
> > rather than the desired 32KHz. If it runs at the wrong rate, e.g. the
> > SDIO WiFi on Seaboard and Cardhu will fail to be detected.
>=20
> How is this related to WiFi?
>=20
> >=20
> > Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> > This probably needs to be squashed into commit 32721a734a3d "clk: tegra:
> > move PMC, fixed clocks to common files".
> > ---
> >  drivers/clk/tegra/clk-tegra-pmc.c | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/drivers/clk/tegra/clk-tegra-pmc.c b/drivers/clk/tegra/clk-=
tegra-pmc.c
> > index 00e8275a7178..08b21c1ee867 100644
> > --- a/drivers/clk/tegra/clk-tegra-pmc.c
> > +++ b/drivers/clk/tegra/clk-tegra-pmc.c
> > @@ -114,6 +114,7 @@ void __init tegra_pmc_clk_init(void __iomem *pmc_ba=
se,
> >  	}
> > =20
> >  	/* blink */
> > +	writel_relaxed(0, pmc_base + PMC_BLINK_TIMER);
> >  	clk =3D clk_register_gate(NULL, "blink_override", "clk_32k", 0,
> >  				pmc_base + PMC_DPD_PADS_ORIDE,
> >  				PMC_DPD_PADS_ORIDE_BLINK_ENB, 0, NULL);
>=20
> Perhaps a better location would be a few lines below, where the "blink"
> clock is registered, since this actually controls the "blink" clock
> rather than "blink_override". But either way:

Just realized that Peter already squashed all of these into his -next
branch, so nevermind.

Thierry

--p1Od3smaOkJqivj4
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSmLSkAAoJEN0jrNd/PrOh2dAP/jwvgXpqAlTpILazyYrhcxM3
eA8DycmRZ3yoidQgP7paF4Mhfb6m1TJ5+RO7x+tdp84DE2pNUhQXoPnQnsHAv9bZ
UOXgstftXlDDAVZUy3YSOxNb5fccFtYpv/LPxjTtq/A3/Q47TsmoweUGt437QypB
/IuogDeLtRXdBQmeWcDTQLuqEWUOaPYjiFEmxkVMgBM59flJDUeJhJa1stp5zQSP
mMT5+2gMMf7g1TTtt5FSWqlJ/QYe7kFu64kXDkUaARGWteT6ocnQ2Lsq1N83H7BJ
xPakSS6cM8jSOW1aJ6evhR3sui6CEjusuEHRBbqro3sYqf4f8zYz/38VZAG7xZ8m
AeOfPBseVVC+fHJrFvTj7Ax99CVQDm/G/6cNiimqSe/2uT89WmXC+ax6V+eQBj7L
NB7Kf9IJmsW/PQCybu27TutKOIe7qRvTQ9ec4AYNpPcFZC0qhEqBuMmOHxNqdYxl
g2GAgYx13WszUC9g4l90ogYRqplFOKlqxdwK6MSOfmrEhbglmhxf6oscxFqjErsS
nv4O/kpd4RfbE+nixKySRw4r2BUyPhvvIIoG9X2Lp3jV/+uaIGkMv1YE2QnBN3Sa
wrr04SK9TgChcK5xDNctSayiCHS0anCGgNAUMka2KWib6zfSqBKW+EwSesI7Rcdb
BwXtNeB+RBWh4eqBadji
=8Ze1
-----END PGP SIGNATURE-----

--p1Od3smaOkJqivj4--
