From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Remove 3.3V supply and modem regulators
Date: Wed, 8 Jan 2014 14:41:07 +0100
Message-ID: <20140108134106.GE1592@ulmo.nvidia.com>
References: <1389021933-6675-1-git-send-email-treding@nvidia.com>
 <52CB192F.2020700@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EXKGNeO8l0xGFBjy"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52CB192F.2020700-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--EXKGNeO8l0xGFBjy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 06, 2014 at 01:59:27PM -0700, Stephen Warren wrote:
> On 01/06/2014 08:25 AM, Thierry Reding wrote:
> > GPIO 1 and 2 of the PMIC are not used for the described purpose, so
> > remove them.
>=20
> As far as I can tell, this patch is correct, since those GPIOs are in
> fact used to discharge the rails after disabling them, rather than to
> enable/disable the rails.
>=20
> Equally, these GPIOs affect multiple rails at once, so listing the GPIO
> as a property of a single regulator seems wrong either way.
>=20
> However, PMU_REGEN1 does seem to feed the "EN" pin of U13C1, a DC/DC
> switcher for power rail 3.3v_modem, so perhaps there's more going on
> here than I see?
>=20
> In summary, I need Laxman to comment on this and ack the change, and
> explain why these GPIOs were listed as regulator enables when it doesn't
> seem that they are.
>=20
> > Note: Removing these makes the work-in-progress eDP support work again.
>=20
> > diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts=
/tegra124-venice2.dts
>=20
> > -		vdd_3v3_reg: regulator@1 {
> > -			compatible =3D "regulator-fixed";
> > -			reg =3D <1>;
> > -			regulator-name =3D "vdd_3v3";
> > -			regulator-min-microvolt =3D <3300000>;
> > -			regulator-max-microvolt =3D <3300000>;
> > -			regulator-always-on;
> > -			regulator-boot-on;
> > -			enable-active-high;
> > -			gpio =3D <&as3722 1 GPIO_ACTIVE_HIGH>;
> > -		};
> > -
> > -		vdd_3v3_modem_reg: regulator@2 {
> > -			compatible =3D "regulator-fixed";
> > -			reg =3D <2>;
> > -			regulator-name =3D "vdd-modem-3v3";
> > -			regulator-min-microvolt =3D <3300000>;
> > -			regulator-max-microvolt =3D <3300000>;
> > -			enable-active-high;
> > -			gpio =3D <&as3722 2 GPIO_ACTIVE_HIGH>;
> > -		};
>=20
> Don't you want to simply remove the "enable-active-high" and "gpio"
> properties, but leave the regulator definitions present, in case
> something wants to reference these fixed(?) rails as their supply?

Yes, I guess that could probably work.

Thierry

--EXKGNeO8l0xGFBjy
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSzVVyAAoJEN0jrNd/PrOhG6sP/1WYD33aemERW9YlpVu6iYvr
dj/9CuaeyZkwf6NhWKvIA6msIkEOz/1YoW6j03uMLlNHj0uVBylN8CYAmb2NsFmj
s+X7UPR+MZuub+xwHwyQVRd43qfen3uSzd0rKb7Wd6+Zk3M5TVg36PLnO9cWZstx
g6OIHZTsRAdtQ4avzSw83ADimajW9pEqZYEG5N4kfYi6YYamWKFO7N68A/hPafdL
i57UDiYAKsscshMGBne+/Xm0HCS3Fwm3I8jANGWywcyG3qhV7qys0mynT4gYPFm5
qC3mJmbYQUIc90sd6WdUi4w8Rv1p0jO9a/tn9hfTlGeq/6mBFKAI9Af5zIFf4ymk
9wsau7AAkK9u8A0k3vJpTIFQMgn5wS1xlIpOsL44zGWyoH2SGk9AOx5Z4lWmn0Dh
+HC+UkfVi6fo45QDK8kgMuwAQmbi5LdGygbxoQDchIQX1HaS9JQrFes9zqjF0JaF
QQT7+93p5X6goxUyYpz3CKQh8zFsnEv4vkvymY79upfbMQYBrehVSmpUeaZr/jdc
nqCHa8US9qI1jCeLLLM+u4evpk8tkolaPgG4X3Uc7Bo3tbVclwTtC7Wi77zgPaVO
CSb4Fmjdo52ZOanwNICdFMmnA7CLTapcC9YmA8soBswfIIAe3rCm1JGt/xZSuBw+
d4pVwISpyWk/7vp1Kd1E
=bEp+
-----END PGP SIGNATURE-----

--EXKGNeO8l0xGFBjy--
