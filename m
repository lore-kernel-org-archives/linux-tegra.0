From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/4] dt-bindings: sram: add documentation for
 reserved-only flag
Date: Wed, 20 May 2020 10:40:32 +0200
Message-ID: <20200520084032.GA2136208@ulmo>
References: <20200512144803.24344-1-ykaukab@suse.de>
 <20200512144803.24344-2-ykaukab@suse.de>
 <52f099e4-5c03-2141-f049-cd3adeb04c5b@wwwdotorg.org>
 <20200513104127.GA2309@suse.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="EVF5PPMfhYS0aIcm"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200513104127.GA2309-l3A5Bk7waGM@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mian Yousaf Kaukab <ykaukab-l3A5Bk7waGM@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robin.murphy-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, afaerber-l3A5Bk7waGM@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 13, 2020 at 12:41:27PM +0200, Mian Yousaf Kaukab wrote:
> On Tue, May 12, 2020 at 01:45:28PM -0600, Stephen Warren wrote:
> > On 5/12/20 8:48 AM, Mian Yousaf Kaukab wrote:
> > > Add documentation for the new optional flag added for SRAM driver.
> >=20
> > > diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Docum=
entation/devicetree/bindings/sram/sram.yaml
> >=20
> > > +  reserved-only:
> > > +    description:
> > > +      The flag indicating, that only SRAM reserved regions have to b=
e remapped.
> > > +      remapping type is selected depending upon no-memory-wc as usua=
l.
> > > +    type: boolean
> >=20
> > This feels a bit like a SW flag rather than a HW description, so I'm not
> > sure it's appropriate to put it into DT.
>=20
> Reserved regions themselves are software descriptions, no? Then we have '=
pool'
> flag which is again a software flag and so on. This flag falls into same
> category and nothing out of ordinary.
> >=20
> > Are there any cases where the SW should map all of the SRAM, i.e. where
> > we wouldn't expect to set reserved-only? [...]
>=20
> Yes, here are a few examples:
> arch/arm/boot/dts/aspeed-g*.dtsi

Looking at the implementation of the sole user of this, which is in
drivers/fsi/fsi-master-ast-cf.c, it looks like this really should've
specified a partition because the driver basically goes on to allocate
a fixed 4 KiB region of memory anyway.

> arch/arm/boot/dts/at91*.dtsi

While these define SRAM nodes, I don't see them referenced anywhere.

> arch/arm/boot/dts/bcm7445.dtsi
> Then arch/arm/boot/dts/dra7.dtsi is an example where we should map everyt=
hing
> except the reserved region.

The driver currently maps everything, so if this relies on this
particular reserved region not being mapped then that's already broken
anyway.

> > [...] I'd expect reserved-only to be
> > the default, and perhaps only, mode of operation for the SRAM driver.
>=20
> It will break compatibility with existing dtbs.

Yes, that's a bit unfortunate. I think this driver may suffer from a
slightly ambiguous device tree binding and then people just trying to
fit it to their use-cases.

However, I think we could preserve DTB backwards-compatibility while at
the same time correcting course and establish some sort of consistency.

Looking at the examples that you've provided and others, there are two
classes of users: users that don't specify any partitions either use all
of the available SRAM exclusively or manually allocate some part of it,
whereas users that have specified partitions all seem to use only the
defined partitions.

Given that, I think what we could do is check if there are any child
nodes and if not, keep the existing behaviour of mapping the whole SRAM
area. For cases where child nodes exist we could decide to go with the
default that Stephen suggested and only map regions for which a child
node has been defined.

This should allow both categories of users to work the way that they
were probably expected to work.

Any thoughts?

Thierry

--EVF5PPMfhYS0aIcm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7E7PsACgkQ3SOs138+
s6HYyxAAkPk+vwNmlH7ETZWk+tDpu9p1jU53hBHo7thEwHCr+xFIaNlJFGmXWpOO
62hcSRW2fLx8upTQ5D9z+/lB5q9G6Uu1vSWl3fLqDx7EkUBTo5V9llrbjUUmDNXJ
rkMC3yYYfSPeXcQhkh+INMS3njREgduS3mJff6MbG6P6KTYd/sM67J5QxAX1CD0u
rYH1mTanQW0CVRwY99yl1vIcYHL+PFNTDkQLt8zG2tvqTWYlHCbkNhHG2cQLFpoI
wAwxgmnsD3ebq3/5UEH/1ba0x9XaRwMtzj/hNnG1EhqlQlpywfbOofy/xTz4LCgv
Z1bBt6w2wvtAW665KtBUHPFVVqLdTmEiyAMyDfTcHeDUPuv6KjXTqZcFjTQ6cK/E
MT0vPgePDZZ1CGqWa4vb6vWpkEvkAiXz5Bj3tZLHVyuKKtzLSjaneURKx8xYe6IH
vrzQamDlLlooFHHM8vOLTKU0nA3vXgRN9bQZrrn4fZBMa+vUyM69xHuQ+/4l4VJg
Aa0U0edhlzaX3067VcWJhZc+1VZ4OSLpH/JKEQfl3dPPM04e+yXtYelwpqaUWPwh
tZ+vY6oS6MefZiXFvsskxbbHwhO71Sq7SCWdNrKE2qw5zFMx9LWskGFXGJehUIoT
l54CPDD33NfU2N3T0j0Y6Pr5kPjKnaZq8NJQxMYBr3oZJZ/ix7s=
=r/Os
-----END PGP SIGNATURE-----

--EVF5PPMfhYS0aIcm--
