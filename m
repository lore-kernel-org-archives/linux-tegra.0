From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 3/5] ARM: tegra: Initialize interrupt controller from
 DT
Date: Fri, 29 Aug 2014 16:24:10 +0200
Message-ID: <20140829142408.GA31264@ulmo>
References: <1409239879-12376-1-git-send-email-thierry.reding@gmail.com>
 <1409239879-12376-3-git-send-email-thierry.reding@gmail.com>
 <3056623.fB9uqpleQ5@wuerfel>
 <20140829073139.GG13106@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="r5Pyd7+fXNt84Ff3"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140829073139.GG13106@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--r5Pyd7+fXNt84Ff3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 29, 2014 at 09:31:40AM +0200, Thierry Reding wrote:
> On Thu, Aug 28, 2014 at 06:10:55PM +0200, Arnd Bergmann wrote:
> > On Thursday 28 August 2014 17:31:17 Thierry Reding wrote:
> >=20
> > >  void __init tegra_init_irq(void)
> > >  {
> > > -	int i;
> > > -	void __iomem *distbase;
> > > +	unsigned int max_ictlrs =3D ARRAY_SIZE(ictlr_regs), i;
> > > +	const struct of_device_id *match;
> > > +	struct device_node *np;
> > > +	struct resource res;
> > > +
> > > +	np =3D of_find_matching_node_and_match(NULL, ictlr_matches, &match);
> > > +	if (np) {
> > > +		const struct tegra_ictlr_soc *soc =3D match->data;
> > > +
> > > +		for (i =3D 0; i < soc->num_ictlrs; i++) {
> > > +			if (of_address_to_resource(np, i, &res) < 0)
> > > +				break;
> > > +
> > > +			ictlr_regs[i] =3D res;
> > > +		}
> > > +
> > > +		WARN(i !=3D soc->num_ictlrs,
> > > +		     "Found %u interrupt controllers in DT; expected %u.\n",
> > > +		     i, soc->num_ictlrs);
> > > +
> > > +		max_ictlrs =3D soc->num_ictlrs;
> > > +		of_node_put(np);
> > > +	} else {
> > > +		/*
> > > +		 * If no matching device node was found, fall back to using
> > > +		 * the chip ID.
> > > +		 */
> > > +
> > > +		/* Tegra30 and later have five interrupt controllers, ... */
> > > +		max_ictlrs =3D ARRAY_SIZE(ictlr_regs);
> > > +
> > > +		/* ..., but Tegra20 only has four. */
> > > +		if (of_machine_is_compatible("nvidia,tegra20"))
> > > +			max_ictlrs--;
> > > +	}
> >=20
> > How about moving the entire file to drivers/irqchip and using the
> > IRQCHIP_DECLARE() helper for the DT case?
> >=20
> > For the fallback, you can have an entry into that file that just takes
> > the address and number, which you can call from platform code here.
>=20
> I think I did try that at some point, but there were issues that I don't
> remember. I'll give it another shot.

So I got pretty far with this and the system still boots. But for some
reason suspend/resume is now broken. The difference seems to be that
earlier the legacy interrupt controller would be registered first, and
the GIC second. When the legacy interrupt controller is initialized
after the GIC (which happens when I use IRQCHIP_DECLARE), then suspend
and resume won't work (for some yet unknown reason). Unfortunately the
of_irq_init() code is too clever, so I can't even work around it by
changing link order or device tree order.

I'll see if I can find out what causes this combination to malfunction
when initialized in the opposite order.

Thierry

--r5Pyd7+fXNt84Ff3
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUAI0IAAoJEN0jrNd/PrOhlRcP/iOs5546AJjCPcmDRLwm6DJE
Va+kOhzxWNSlHsMieMsSaa2S9yAXTuiR/m0Qbx2o60jRHEO44jYVupTCQt2b3jyE
o3bsYfi5oFbnAT0+hdnYlLDOAdfyTKtvuIpGbk/77YXuPU59MDVdRGsP1TAhOTLT
cquH4RaIojOvtJHxkLXc8x15y4DKucZpbYNXtaRmVROQgwOSmp6kJuOVbwK3VR6B
MXI6KJqXY2k/O3CraNYbQysu5Xic4OaMCZQt+MqdBTwJ5q5bmf1jgs/jCM/K/iPL
xRRuak8Opy2z00bMMGm0M02Vqy1maPij+HAu5ZesiRM1zzxDGYslcbrl+il2yIho
51fJ+wtw6YGXes8PFkR6tKywV6GXJGk52/W74AViPTKILLXn0Ow7shyzsbqe5fhC
4TQOKMUeimfqwQvoOtTaBJ1erUYCHZez7sBr4bJif4v+XRS7kBuTDTdrGwzN7CNa
NcMoszkxihWlKOaRz2lT6xTQx4aCd40+V4b0BKka1l8k1Cj4YFQ7AZ7wkfvGd42E
J1R5q8ZrKidgEkE0UerDa+613qp826CcYdlX9saTRsEypvT0OATC+O09p5drNm1U
f3WUJR0QmEjTARA92NPvq9QTKG1TQmmdR4kc5cs2y99feDXaKl6CQ2XnWYcI4qjP
mGKEi4BRxBK9njN4Ol7V
=hfai
-----END PGP SIGNATURE-----

--r5Pyd7+fXNt84Ff3--
