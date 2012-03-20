From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v4 10/10] pwm-backlight: Add rudimentary device tree
 support
Date: Tue, 20 Mar 2012 16:43:30 +0100
Message-ID: <20120320154330.GA8651@avionic-0098.mockup.avionic-design.de>
References: <1331740593-10807-1-git-send-email-thierry.reding@avionic-design.de>
 <1331740593-10807-11-git-send-email-thierry.reding@avionic-design.de>
 <4F67F2AF.3020404@wwwdotorg.org>
 <20120320083943.GA20249@avionic-0098.adnet.avionic-design.de>
 <4F68A1C8.5080608@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Qxx1br4bt0+wmkIi"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F68A1C8.5080608-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Ryan Mallon <rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--Qxx1br4bt0+wmkIi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Stephen Warren wrote:
> On 03/20/2012 02:39 AM, Thierry Reding wrote:
> > * Stephen Warren wrote:
> >> On 03/14/2012 09:56 AM, Thierry Reding wrote:
> >>> This commit adds very basic support for device tree probing. Currentl=
y,
> >>> only a PWM and a list of distinct brightness levels can be specified.
> >>> Enabling or disabling backlight power via GPIOs is not yet supported.
> >>>
> >>> A pointer to the exit() callback is stored in the driver data to keep=
 it
> >>> around until the driver is unloaded.
> ...
> >>>  static int pwm_backlight_probe(struct platform_device *pdev)
> >> ...
> >>> -	pb->pwm =3D pwm_request(data->pwm_id, "backlight");
> >>> -	if (IS_ERR(pb->pwm)) {
> >>> -		dev_err(&pdev->dev, "unable to request PWM for backlight\n");
> >>> -		ret =3D PTR_ERR(pb->pwm);
> >>> -		goto err_alloc;
> >>> -	} else
> >>> -		dev_dbg(&pdev->dev, "got pwm for backlight\n");
> >>> +	if (!pb->pwm) {
> >>> +		pb->pwm =3D pwm_request(data->pwm_id, "backlight");
> >>> +		if (IS_ERR(pb->pwm)) {
> >>> +			dev_err(&pdev->dev, "unable to request PWM for backlight\n");
> >>> +			ret =3D PTR_ERR(pb->pwm);
> >>> +			goto err_alloc;
> >>> +		} else
> >>> +			dev_dbg(&pdev->dev, "got pwm for backlight\n");
> >>> +	}
> >>
> >> Hmmm. It'd be more consistent if pwm_backlight_parse_dt() called
> >> something like of_pwm_get() instead of of_pwm_request(), so that this
> >> code could always call pwm_request() on the PWM and hence operate the
> >> same irrespective of DT vs non-DT. GPIOs work that way at least.
> >=20
> > That's actually what the initial patch had. Unfortunately that's pretty=
 much
> > the opposite direction of where the PWM framework is headed because it =
would
> > involve getting a global index to request the PWM.
>=20
> Not necessarily; get() could return a controller+index pair, which could
> then be passed to request().

This is pretty much what of_pwm_request() does internally (actually via the
of_xlate() function), and it goes one step further by requesting the
corresponding PWM.

I don't really like the fact that the DT parsing code needs to store a
requested PWM device in the platform data. The only other solution would be,
as you suggest, to obtain two indices and request based on them. However th=
at
comes with a whole lot of problems of its own (race between getting the
controller index and the actual requesting of the PWM device, ...).

One other alternative could be to not pass the PWM device via platform data
but rather return it from the pwm_backlight_parse_dt() function (either via
the return value or an output parameter).

> > I think in the long run it
> > would be much better to get rid of pwm_request() altogether and unify by
> > having the non-DT case request the PWM device on a per-chip basis.
>=20
> That might also work.

What I'm not sure about is how to represent this in the non-DT case. The
problem would be how to identify the individual PWM chips. From a quick
glance, pinctrl seems to do this purely on a name lookup basis, similar to
the clock framework.

What would be a good way to represent this in platform data?

Thierry

--Qxx1br4bt0+wmkIi
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAk9opaIACgkQZ+BJyKLjJp9U0wCfTe+EnIgLf5uCuOTSASerI4YS
AKoAn1H1dFtHXCTTybEKB04QSzllFLZB
=sAny
-----END PGP SIGNATURE-----

--Qxx1br4bt0+wmkIi--
