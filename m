From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v3 03/10] of: Add PWM support.
Date: Fri, 24 Feb 2012 07:47:49 +0100
Message-ID: <20120224064749.GB18786@avionic-0098.mockup.avionic-design.de>
References: <1329923841-32017-1-git-send-email-thierry.reding@avionic-design.de>
 <201202221615.11605.arnd@arndb.de>
 <20120223075537.GB8621@avionic-0098.mockup.avionic-design.de>
 <201202231403.01614.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ADZbWkCsHQ7r3kzd"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201202231403.01614.arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Ryan Mallon <rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--ADZbWkCsHQ7r3kzd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Arnd Bergmann wrote:
> On Thursday 23 February 2012, Thierry Reding wrote:
> > * Arnd Bergmann wrote:
> > > On Wednesday 22 February 2012, Thierry Reding wrote:
> > > > This patch adds helpers to support device tree bindings for the gen=
eric
> > > > PWM API. Device tree binding documentation for PWM controllers is a=
lso
> > > > provided.
> > > >=20
> > > > Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> > > >=20
> > > >  Documentation/devicetree/bindings/pwm/pwm.txt |   48 +++++++++
> > > >  drivers/of/Kconfig                            |    6 +
> > > >  drivers/of/Makefile                           |    1 +
> > > >  drivers/of/pwm.c                              |  130 +++++++++++++=
++++++++++++
> > > >  include/linux/of_pwm.h                        |   51 ++++++++++
> > > >  include/linux/pwm.h                           |   17 +++
> > >=20
> > > I think it would make more sense to stick the device tree specific pa=
rts
> > > into drivers/pwm/of.c instead of drivers/of/pwm.c, but it's not a str=
ong
> > > preference on my part.
> >=20
> > I was just following what everybody else seemed to be doing. drivers/of/
> > already has support code for GPIO, IRQ, I2C, PCI and whatnot.
>=20
> Yes, as I said, it's not entirely clear what's best here, and it would
> be nice if other people could weigh in when they have a strong opinion
> one way or another.

Okay, I'll wait some more for others to join in.

[...]
> > > * Why not include the pwm_request() call in this and return the
> > >   pwm_device directly? You said that you want to get rid of the
> > >   pwm_id eventually, which is a good idea, but this interface still
> > >   forces one to use it.
> >=20
> > Okay, that sounds sensible. I propose to rename the function to somethi=
ng like
> > of_request_pwm().
>=20
> Sounds good.
>=20
> > It would of course need an additional parameter (name) to
> > forward to pwm_request().
>=20
> Not necessarily, it could use the dev_name(device) or the name
> of the property, or a combination of the two.

The problem with that is that usually the device would be named something
generic like "pwm", while in case where the PWM is used for the backlight
it makes sense to label the PWM device "backlight".

Looking at debugfs and seeing an entry "backlight" is much more straight-
forward than "pwm.0". I mean "pwm.0" doesn't carry any useful information
really, does it?

> > > * It is not clear what a pwm_spec is used for, or why a device
> > >   driver would need to be bothered by this. Maybe it just needs
> > >   more explanation, but it seems to me that if you do the previous
> > >   change, the pwm_spec would not be needed either.
> >=20
> > pwm_spec is pretty much what the of_xlate() callback parses out of the =
data
> > provided by the device tree. Currently, of_pwm_simple_xlate() only pars=
es the
> > period (in ns) but the idea was that if at some point in the future it =
was
> > decided to provide more than the period via the device tree it could be
> > extended without changing every call to of_get_named_pwm(). As I said, =
it also
> > plays quite nicely with the concept of the of_xlate() callback and sort=
 of
> > serves as interface between the lower layer that retrieves PWM paramete=
rs and
> > the upper layers that use it.
> >=20
> > Thinking about it, perhaps renaming it to pwm_params may be more descri=
ptive.
> > Also to avoid breakage or confusion if fields get added it may be good =
to
> > provide a bitmask of valid fields filled in by the of_xlate() callback.
> >=20
> > 	enum {
> > 		PWM_PARAMS_PERIOD,
> > 		...
> > 	};
> >=20
> > 	struct pwm_params {
> > 		unsigned long fields;
> > 		unsigned int period;
> > 	};
> >=20
> > Then again, maybe that's just over-engineering and directly returning v=
ia an
> > unsigned int *period_ns parameter would be better?
>=20
> It certainly sounds like over-engineering to me. Why not keep all that
> information hidden inside the struct pwm_device and provide accessor
> functions like this?
>=20
> unsigned int pwm_get_period(struct pwm_device *pwm);

Heh, I like that. It is the obvious thing to do. Why didn't I think of it?
:-)

> > > > +EXPORT_SYMBOL(of_get_named_pwm);
> > >=20
> > > EXPORT_SYMBOL_GPL?
> >=20
> > It was brought up at some point that it might be nice to allow non-GPL
> > drivers to use the PWM framework as well. I don't remember any discussi=
on
> > resulting from the comment. Perhaps we should have that discussion now =
and
> > decide whether or not we want to keep it GPL-only or not.
>=20
> I would definitely use EXPORT_SYMBOL_GPL for all new code unless it
> replaces an earlier interface that was available as EXPORT_SYMBOL.

I just grepped the code and noticed this:

	$ $ git grep -n 'EXPORT_SYMBOL.*(pwm_request)'
	arch/arm/mach-vt8500/pwm.c:139:EXPORT_SYMBOL(pwm_request);
	arch/arm/plat-mxc/pwm.c:183:EXPORT_SYMBOL(pwm_request);
	arch/arm/plat-samsung/pwm.c:83:EXPORT_SYMBOL(pwm_request);
	arch/unicore32/kernel/pwm.c:132:EXPORT_SYMBOL(pwm_request);
	drivers/mfd/twl6030-pwm.c:156:EXPORT_SYMBOL(pwm_request);
	drivers/misc/ab8500-pwm.c:108:EXPORT_SYMBOL(pwm_request);
	drivers/pwm/core.c:262:EXPORT_SYMBOL_GPL(pwm_request);

It seems like the legacy PWM API used to be non-GPL. Should I switch it bac=
k?
Also does it make sense to have something like of_request_pwm() GPL when the
rest of the API isn't?

Thierry

--ADZbWkCsHQ7r3kzd
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAk9HMpUACgkQZ+BJyKLjJp/MtwCgmnw1+sRwDC/d4o8oKM/FzrOA
iQcAnj+5Do4b6qXmnDmc8EWyEpoT961h
=LGJb
-----END PGP SIGNATURE-----

--ADZbWkCsHQ7r3kzd--
