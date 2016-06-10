From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] soc/tegra: pmc: Use register definitions instead of
 magic values
Date: Fri, 10 Jun 2016 16:05:56 +0200
Message-ID: <20160610140556.GM27142@ulmo.ba.sec>
References: <20160608171530.19396-1-thierry.reding@gmail.com>
 <575926DA.50904@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="um2V5WpqCyd73IVb"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <575926DA.50904-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--um2V5WpqCyd73IVb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 09, 2016 at 09:20:42AM +0100, Jon Hunter wrote:
>=20
> On 08/06/16 18:15, Thierry Reding wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > Use register definitions for the main SoC reset operation instead of
> > hard-coding magic values. Note that the PMC_RST_STATUS register isn't
> > actually accessed, but since it is mentioned in a comment the
> > definitions are added for completeness.
> >=20
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  drivers/soc/tegra/pmc.c | 16 +++++++++++++---
> >  1 file changed, 13 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> > index 852f8470d6e7..70acad7ceca0 100644
> > --- a/drivers/soc/tegra/pmc.c
> > +++ b/drivers/soc/tegra/pmc.c
> > @@ -51,6 +51,7 @@
> >  #define  PMC_CNTRL_CPU_PWRREQ_POLARITY	(1 << 15)  /* CPU pwr req polar=
ity */
> >  #define  PMC_CNTRL_CPU_PWRREQ_OE	(1 << 16)  /* CPU pwr req enable */
> >  #define  PMC_CNTRL_INTR_POLARITY	(1 << 17)  /* inverts INTR polarity */
> > +#define  PMC_CNTRL_MAIN_RST		(1 <<  4)
> > =20
> >  #define DPD_SAMPLE			0x020
> >  #define  DPD_SAMPLE_ENABLE		(1 << 0)
> > @@ -80,6 +81,14 @@
> >  #define PMC_SENSOR_CTRL_SCRATCH_WRITE	(1 << 2)
> >  #define PMC_SENSOR_CTRL_ENABLE_RST	(1 << 1)
> > =20
> > +#define PMC_RST_STATUS			0x1b4
> > +#define  PMC_RST_STATUS_AOTAG		(1 << 5)
> > +#define  PMC_RST_STATUS_LP0		(1 << 4)
> > +#define  PMC_RST_STATUS_SW_MAIN		(1 << 3)
> > +#define  PMC_RST_STATUS_SENSOR		(1 << 2)
> > +#define  PMC_RST_STATUS_WATCHDOG	(1 << 1)
> > +#define  PMC_RST_STATUS_POR		(1 << 0)
>=20
> Looking at the TRM, the PMC_RST_STATUS register only has one field
> called "RST_SOURCE" and the above are possible values for this field.
> However, these are integer values and not actual bits (as it is a 3-bit
> field). I believe that they should just be ...
>=20
> #define PMC_RST_STATUS			0x1b4
> #define  PMC_RST_STATUS_AOTAG		5
> #define  PMC_RST_STATUS_LP0		4
> #define  PMC_RST_STATUS_SW_MAIN		3
> #define  PMC_RST_STATUS_SENSOR		2
> #define  PMC_RST_STATUS_WATCHDOG	1
> #define  PMC_RST_STATUS_POR		0

Ugh... indeed. No idea how I came up with this.

> >  #define IO_DPD_REQ			0x1b8
> >  #define  IO_DPD_REQ_CODE_IDLE		(0 << 30)
> >  #define  IO_DPD_REQ_CODE_OFF		(1 << 30)
> > @@ -638,9 +647,10 @@ static int tegra_pmc_restart_notify(struct notifie=
r_block *this,
> > =20
> >  	tegra_pmc_writel(value, PMC_SCRATCH0);
> > =20
> > -	value =3D tegra_pmc_readl(0);
> > -	value |=3D 0x10;
> > -	tegra_pmc_writel(value, 0);
> > +	/* reset everything but PMC_SCRATCH0 and PMC_RST_STATUS */
>=20
> Not sure I understand the comment about PMC_RST_STATUS because this is
> just a status register and it will log source of the reset. The TRM does
> show that it is a R/W register. Are you just saying that source of the
> reset will be preserved by the PMC_RST_STATUS register?

Yes, PMC_SCRATCH0 and PMC_RST_STATUS are the only two registers that are
preserved over the reset, whereas all other registers will be reset.

Thierry

--um2V5WpqCyd73IVb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXWslEAAoJEN0jrNd/PrOhKgMP/R77zJdGctmV5AC8veprPZpd
CNjRtz7pw0Hj9RiQ3dnXiQFKafhz76anmMtCe1RuBv+rfStSwjrUrxP12E2rJbma
UMOyenXQW5hcDPsPAjwDKEV4R+61AwuJXS/CNBX+RAGvF0MlCsxdb2yWWeBSjRf+
3rkk8qBcXEj6aA4+NDi3MB7t/mMXsZk+TJRdNkX8HgilZNCkACGlOFMnjnX7Vknk
7o6fY2rTDxA4ftT4un2biKsFnHH9P1Ksyt82N0vEbCRSJb6OtGK9SGdNgyLBBglP
9Az/0fc9x1IwrzO+jlVVyvq5A51YNSt3npn4DEIVI8tpV1mYsZscFSci9oIbwTXS
aMVjyRyk4VXH9pa42EBsOT3THu+v0otwOPgFawhVV5l4zn1qNd/Y6Bc9woC1PbSF
2qDbsJIDyje1LmV1mbVwRReMMEiCknnJOZL2iH6C5y9sbV7app7vOyC7JICo+hjB
kHFvtXBc3GrssvFHKGpUvI+wNle3CeifM5RoQQn471+FAD50T3y4LIaTfhCl39Oa
B9W6OOSLKT6VIlZxC9d8QwIiXU/gp8mDZna7NU50LGhno4hALIZ8pa99GYLV+IGj
LIRp+6i4IJtRfBTtqsi95jjlvQKQDEI1LYAAjSBPKF+5OtMuhUS7UMZJFr/ilE4q
Sis6wkOcpSq5yYcOAbC8
=PZWU
-----END PGP SIGNATURE-----

--um2V5WpqCyd73IVb--
