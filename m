From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v6 05/17] pwm: Add device tree support
Date: Wed, 11 Apr 2012 15:14:19 +0200
Message-ID: <20120411131419.GC27337@avionic-0098.adnet.avionic-design.de>
References: <1334070400-25013-1-git-send-email-thierry.reding@avionic-design.de>
 <1334070400-25013-6-git-send-email-thierry.reding@avionic-design.de>
 <20120411130208.GC2445@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9UV9rz0O2dU/yYYn"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120411130208.GC2445-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Ryan Mallon <rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bernhard Walle <walle-pDveNdigDaDu9UdzE1sIFA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--9UV9rz0O2dU/yYYn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Shawn Guo wrote:
> On Tue, Apr 10, 2012 at 05:06:28PM +0200, Thierry Reding wrote:
> > This patch adds helpers to support device tree bindings for the generic
> > PWM API. Device tree binding documentation for PWM controllers is also
> > provided.
> >=20
> > Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> > Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> > ---
> > Changes in v6:
> > - don't override error code in of_pwm_simple_xlate()
> > - no longer export of_pwm_request(), only pwm_get() should be used
>=20
> Ok, I read this here ...
>=20
> > +/**
> > + * of_pwm_request() - request a PWM via the PWM framework
> > + * @np: device node to get the PWM from
> > + * @con_id: consumer name
> > + *
> > + * Returns the PWM device parsed from the phandle and index specified =
in the
> > + * "pwms" property of a device tree node or a negative error-code on f=
ailure.
> > + * Values parsed from the device tree are stored in the returned PWM d=
evice
> > + * object.
> > + *
> > + * If con_id is NULL, the first PWM device listed in the "pwms" proper=
ty will
> > + * be requested. Otherwise the "pwm-names" property is used to do a re=
verse
> > + * lookup of the PWM index. This also means that the "pwm-names" prope=
rty
> > + * becomes mandatory for devices that look up the PWM device via the c=
on_id
> > + * parameter.
> > + */
> > +static struct pwm_device *of_pwm_request(struct device_node *np,
> > +					 const char *con_id)
> > +{
> ...
> > +}
> > +EXPORT_SYMBOL(of_pwm_request);
>=20
> ... so this line should be removed.  Otherwise,

You are absolutely right. I always thought that gcc would complain if you
tried to export a static function. Funny also that my compile tests haven't
caught this in the !OF configuration. Anyway, since of_pwm_request() is no
longer exported, I've replaced this by an IS_ENABLED(CONFIG_OF) construct
similar to the calls to of_pwmchip_add() and of_pwmchip_remove().

> Reviewed-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Thanks,
Thierry

--9UV9rz0O2dU/yYYn
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+Fg6sACgkQZ+BJyKLjJp/VvQCePfjSbdQ2w4S8Uo5VsXafOtQs
swIAnRgjph3JDJI8SgzngEll4qkY3MWV
=UlgC
-----END PGP SIGNATURE-----

--9UV9rz0O2dU/yYYn--
