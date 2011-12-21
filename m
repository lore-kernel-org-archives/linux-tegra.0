From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [RFC 3/7] of: Add PWM support.
Date: Wed, 21 Dec 2011 09:09:35 +0100
Message-ID: <20111221080935.GC542@avionic-0098.mockup.avionic-design.de>
References: <1324377138-32129-1-git-send-email-thierry.reding@avionic-design.de>
 <1324377138-32129-4-git-send-email-thierry.reding@avionic-design.de>
 <74CDBE0F657A3D45AFBB94109FB122FF176BE92E6A@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="t0UkRYy7tHLRMCai"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF176BE92E6A-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--t0UkRYy7tHLRMCai
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Stephen Warren wrote:
> Thierry Reding wrote at Tuesday, December 20, 2011 3:32 AM:
> > This patch adds helpers to support device-tree bindings for the generic
> > PWM API.
>=20
> > diff --git a/drivers/of/pwm.c b/drivers/of/pwm.c
>=20
> > +/**
> > + * of_get_named_pwm() - get a PWM number and period to use with the PW=
M API
> > + * @np:		device node to get the PWM from
> > + * @propname:	property name containing PWM specifier(s)
> > + * @index:	index of the PWM
> > + * @period_ns:	a pointer to the PWM period (in ns) to fill in
> > + *
> > + * Returns PWM number to use with the Linux generic PWM API or a negat=
ive
> > + * error code on failure. If @period_ns is not NULL the function fills=
 in
> > + * the value parsed from the period-ns property.
> > + */
> > +int of_get_named_pwm(struct device_node *np, const char *propname,
> > +		     int index, unsigned int *period_ns)
> > +{
> ...
> > +	if ((cells > 1) && period_ns)
> > +		*period_ns =3D be32_to_cpu(spec[1]);
>=20
> What if the client needs to know period_ns, yet the DT doesn't provide
> it?
>=20
> I think a better approach would be to use an "of_xlate" function like
> GPIO and IRQ do. This way, the PWM device's own bindings get to define
> what the extra cells mean, and the definition of of_xlate can be such
> that it must return a period_ns value in all cases; in some cases, the
> driver may return a hard-coded value if the HW doesn't support the
> feature, whereas in most cases the value would be parsed from the
> extra cells.
>=20
> Without seeing the complete binding documentation and an example, it's
> difficult to think about whether it's a good idea to include period_ns
> in the PWM specifier or not. An alternative might be a property in the
> PWM node itself.

I like the "of_xlate" alternative better. Adding a property to the PWM node
would hard-code the period regardless of the user. That doesn't really
reflect the PWM API.

I will play around with it a bit and make sure to include PWM binding
documentation in the next version.

> Actually, even better would be for struct pwm_chip to contain a struct
> device * instead. That'd allow the PWM core to use that for e.g. dev_err
> calls, and it includes the of_node for use in the match function above.

I like that idea. I'll address that in the next version.

Thierry

--t0UkRYy7tHLRMCai
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk7xlD8ACgkQZ+BJyKLjJp9hNwCgijBDUJB4BsQ3oHvQQd2ggFlN
EWIAn3wjv+1u9dSzxY7IPwXH2F9PPnbH
=AIfI
-----END PGP SIGNATURE-----

--t0UkRYy7tHLRMCai--
