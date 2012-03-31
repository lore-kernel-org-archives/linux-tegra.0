From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v5 04/16] pwm: Add table-based lookup for static mappings
Date: Sat, 31 Mar 2012 16:30:21 +0200
Message-ID: <20120331143021.GA18382@avionic-0098.mockup.avionic-design.de>
References: <1332945238-14897-1-git-send-email-thierry.reding@avionic-design.de>
 <1332945238-14897-5-git-send-email-thierry.reding@avionic-design.de>
 <20120329220342.GK4153@opensource.wolfsonmicro.com>
 <20120330050641.GA21823@avionic-0098.mockup.avionic-design.de>
 <20120330101800.GD21950@opensource.wolfsonmicro.com>
 <20120330103840.GB961@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="envbJBWh7q8WU6mo"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120330103840.GB961-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Ryan Mallon <rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bernhard Walle <walle-pDveNdigDaDu9UdzE1sIFA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Thierry Reding wrote:
> * Mark Brown wrote:
> > On Fri, Mar 30, 2012 at 07:06:41AM +0200, Thierry Reding wrote:
> > > * Mark Brown wrote:
> >=20
> > > > The clock and regulator APIs namespace the consumers by struct devi=
ce -
> > > > might this not be sensible here?  pwm_get() does already take the d=
evice
> > > > as an argument.  It'd feel safer, and for example there's plenty of
> > > > phones out there with two backlit displays...
> >=20
> > > That's actually how this is supposed to work. "pwm-backlight" in the =
above
> > > case is matched against the name of the struct device that you pass i=
n to
> > > pwm_get(). The only difference, at least as far as I can tell, to the=
 clock
> > > and regulator APIs is that a second name is not listed explicitly in =
the
> > > lookup table.
> >=20
> > Both clock and regulator APIs map (source) -> (dev, name).  This only
> > has a mapping (source) -> (dev).
> >=20
> > > So compared with the clock and regulator APIs it doesn't make too muc=
h sense
> > > to pass both the struct device and the name to pwm_get() because it w=
ill
> > > match the device name against the consumer name in the lookup table f=
irst and
> > > only use the passed name if no match was found.
> >=20
> > This is different to what the clock and regulator APIs do - they look up
> > the name in the context of the struct device.  This is because...
> >=20
> > > In case you have two backlight devices I would expect the following t=
o work:
> >=20
> > > 	static struct pwm_lookup board_pwm_lookup[] =3D {
> > > 		PWM_LOOKUP("tegra-pwm", 0, "pwm-backlight.0"),
> > > 		PWM_LOOKUP("tegra-pwm", 1, "pwm-backlight.1"),
> > > 	};
> >=20
> > ...if a single device uses more than one PWM then the above scheme won't
> > work - unless I'm missing something?
>=20
> Right, now it makes more sense. So basically if I have a single device us=
ing
> two PWM devices, then I'll need to have something like this:
>=20
> 	static struct pwm_lookup board_pwm_lookup[] =3D {
> 		PWM_LOOKUP("tegra-pwm", 0, "pwm-foo.0", "bar"),
> 		PWM_LOOKUP("tegra-pwm", 1, "pwm-foo.0", "baz"),
> 	};
>=20
> And then of course I'll need to have a second field by which the PWM devi=
ce
> can be identified. Good, I'll fix that up for the next round.

I've been thinking about this some more, and I can see this becoming a litt=
le
problem with the DT bindings because the unified pwm_get() always requests
the first PWM specified in the "pwms" property.

The best solution that I could come up with is to not pass the index into t=
he
of_pwm_request() function but rather forward the consumer name as passed in=
to
pwm_get(). The of_pwm_request() could use the "pwm-names" property to do a
reverse lookup of the index and request that. One good thing about that wou=
ld
be that I no longer need to export the of_pwm_request() function. The "bad"
thing is that it'll make the "pwm-names" property mandatory if more than a
single PWM is requested.

Does that sound reasonable?

Thierry

--envbJBWh7q8WU6mo
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk93FP0ACgkQZ+BJyKLjJp+IiACgnhpj1BGz3xcbtREZdtHiHRSG
yRYAnAry7fS/+aQg1lSkscGgBDdq7LiV
=tu8R
-----END PGP SIGNATURE-----

--envbJBWh7q8WU6mo--
