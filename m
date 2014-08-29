From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 3/5] ARM: tegra: Initialize interrupt controller from
 DT
Date: Fri, 29 Aug 2014 09:31:40 +0200
Message-ID: <20140829073139.GG13106@ulmo>
References: <1409239879-12376-1-git-send-email-thierry.reding@gmail.com>
 <1409239879-12376-3-git-send-email-thierry.reding@gmail.com>
 <3056623.fB9uqpleQ5@wuerfel>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4eRLI4hEmsdu6Npr"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <3056623.fB9uqpleQ5@wuerfel>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--4eRLI4hEmsdu6Npr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 28, 2014 at 06:10:55PM +0200, Arnd Bergmann wrote:
> On Thursday 28 August 2014 17:31:17 Thierry Reding wrote:
>=20
> >  void __init tegra_init_irq(void)
> >  {
> > -	int i;
> > -	void __iomem *distbase;
> > +	unsigned int max_ictlrs =3D ARRAY_SIZE(ictlr_regs), i;
> > +	const struct of_device_id *match;
> > +	struct device_node *np;
> > +	struct resource res;
> > +
> > +	np =3D of_find_matching_node_and_match(NULL, ictlr_matches, &match);
> > +	if (np) {
> > +		const struct tegra_ictlr_soc *soc =3D match->data;
> > +
> > +		for (i =3D 0; i < soc->num_ictlrs; i++) {
> > +			if (of_address_to_resource(np, i, &res) < 0)
> > +				break;
> > +
> > +			ictlr_regs[i] =3D res;
> > +		}
> > +
> > +		WARN(i !=3D soc->num_ictlrs,
> > +		     "Found %u interrupt controllers in DT; expected %u.\n",
> > +		     i, soc->num_ictlrs);
> > +
> > +		max_ictlrs =3D soc->num_ictlrs;
> > +		of_node_put(np);
> > +	} else {
> > +		/*
> > +		 * If no matching device node was found, fall back to using
> > +		 * the chip ID.
> > +		 */
> > +
> > +		/* Tegra30 and later have five interrupt controllers, ... */
> > +		max_ictlrs =3D ARRAY_SIZE(ictlr_regs);
> > +
> > +		/* ..., but Tegra20 only has four. */
> > +		if (of_machine_is_compatible("nvidia,tegra20"))
> > +			max_ictlrs--;
> > +	}
>=20
> How about moving the entire file to drivers/irqchip and using the
> IRQCHIP_DECLARE() helper for the DT case?
>=20
> For the fallback, you can have an entry into that file that just takes
> the address and number, which you can call from platform code here.

I think I did try that at some point, but there were issues that I don't
remember. I'll give it another shot.

Thierry

--4eRLI4hEmsdu6Npr
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUACxbAAoJEN0jrNd/PrOh2MUP/RLmUAv4CHJoW2V7HzcmUhi3
rutQh7bxdJtK8Z+dfjV5PF4ajsZFf6PG7+Ey8MGUC4WZBoVpR3HAxGRYL0DwT+pE
nIsVgVnfYSYc7uePRFH6N4byP6SMxyIObZI74BcYScGJtAsYdARlk1yAJChQInt8
tstRU7VsLN1WW9yJFjpN6q99ZO/8aT3mPF7+q8y5MMrNFl21tO8tBwR3UcXV7xKR
XN3xSI+Lm8+pk7qpgKYn9VnnOcjEvePxea6c5Fzd/jM/3i0PefJachWe0BeWG5uu
5D45I9LYyK1atxbp+PzT6g9lNGlQ8GBD2S1cwXXrVb+4SN7ClGeQO5tDlRguM1GL
qoH89+1aa6Pbh24Wd3WpaBhasD0qD+oveqxUEG8R/5SzkHEH5YZX052272GtsjWF
Z1SLXwef+wte1HsKJdE8BjAALVY3tL1JwIo97akV55XPZW8oyhIjRMJauh3x7bjC
0N7KESbCb7ZduLSWXR5nBBeMXrrWLSdUWoOLfqgGfKADkXu2DIGA+ufZweD9+Dr/
7DQISmkavQlloGcez+T6MA2NOBQ1B4ekoEscpiPPQkPDxFOBEyVbcTnHhqyKqg1c
c/G3sEuosaJZR6S5FS6SGUWvMqHPFClex8mMi4am002m+0c7UtVUwjtjnqSxTyqX
KyTBmHjStyS8DIiHJ5Mw
=WcaH
-----END PGP SIGNATURE-----

--4eRLI4hEmsdu6Npr--
