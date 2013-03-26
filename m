From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH V5 8/9] ARM: tegra: Provide regulator to pwm-backlight
Date: Tue, 26 Mar 2013 08:26:13 +0100
Message-ID: <20130326072613.GA31388@avionic-0098.mockup.avionic-design.de>
References: <1364260913-25490-1-git-send-email-achew@nvidia.com>
 <1364260913-25490-9-git-send-email-achew@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SUOF0GtieIMvvwua"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1364260913-25490-9-git-send-email-achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: romain.naour-oid7hba3+9NWj0EZb7rXcA@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, drwyrm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, stefan-WB6LKoYH/xlAfugRpC6u6w@public.gmane.org, laforge-WB6LKoYH/xlAfugRpC6u6w@public.gmane.org, philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lost.distance-/E1597aS9LQAvxtiuMwx3w@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, gxt-TG0Ac1+ktVePQbnJrJN+5g@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, openezx-devel-ZwoEplunGu3n3BO9LpVK+9i2O/JbrIOy@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--SUOF0GtieIMvvwua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2013 at 06:21:52PM -0700, Andrew Chew wrote:
> The pwm-backlight driver now takes a mandatory regulator that is gotten
> during driver probe.  Initialize a dummy regulator to satisfy this
> requirement.
>=20
> Signed-off-by: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Acked-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/tegra20-medcom-wide.dts | 1 +
>  arch/arm/boot/dts/tegra20-tamonten.dtsi   | 5 +++++
>  2 files changed, 6 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/tegra20-medcom-wide.dts b/arch/arm/boot/dt=
s/tegra20-medcom-wide.dts
> index a2d6d65..90d665e 100644
> --- a/arch/arm/boot/dts/tegra20-medcom-wide.dts
> +++ b/arch/arm/boot/dts/tegra20-medcom-wide.dts
> @@ -32,6 +32,7 @@
> =20
>  		brightness-levels =3D <0 4 8 16 32 64 128 255>;
>  		default-brightness-level =3D <6>;
> +		power-supply =3D <&backlight_power_reg>;
>  	};
> =20
>  	sound {
> diff --git a/arch/arm/boot/dts/tegra20-tamonten.dtsi b/arch/arm/boot/dts/=
tegra20-tamonten.dtsi
> index 6e9d91f..2d8e7f2 100644
> --- a/arch/arm/boot/dts/tegra20-tamonten.dtsi
> +++ b/arch/arm/boot/dts/tegra20-tamonten.dtsi
> @@ -485,5 +485,10 @@
>  			regulator-max-microvolt =3D <5000000>;
>  			regulator-always-on;
>  		};
> +
> +		backlight_power_reg: regulator@1 {
> +			compatible =3D "regulator-fixed";
> +			regulator-name =3D "backlight-power";
> +		};

This is missing a reg property to mirror the unit address "@1". I've
just checked the schematics and there is indeed a physical pin that
can be used to enable backlight power on Tamonten. It just happens to
not be connected on Medcom-Wide for some reason.

The physical pin is Tegra's GPIO PB5 and the schematic calls the supply
"lcd_bl_en", so I think a more accurate description of this would be:

	backlight_power_reg: regulator@1 {
		compatible =3D "regulator-fixed";
		reg =3D <1>;
		regulator-name =3D "lcd_bl_en";
		regulator-min-microvolt =3D <3300000>;
		regulator-max-microvolt =3D <3300000>;
		gpio =3D <&gpio 13 0>; /* gpio PB5 */
		enable-active-high;
	};

Thierry

--SUOF0GtieIMvvwua
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRUU2VAAoJEN0jrNd/PrOh++8QALQEfL2zD6mXhJiREp+4lMw2
ggcqxBlOZu3kYkFJKcOfc7MpG27p08eqSyJjFOvcBITlQwrShRQOyd7sULeUa6gR
doMLgfQwQ3BUERf1ugUKJ4v+W7+UWLNUBQSfQIoBDbPT1TTxq+nq4pGcAWjo+nrP
+ZaarSiStgvX7wUK+nD53FixTWCCu8TfbtH0IqmwQjV1NuYcaysWQufmWCCfTZrf
d65VYjfCC8A1wc55N1SAQWe4TB1jklZIj+kC1qepNyIxbzQTjU/3V5PamMkNjxfc
fGjwqZ4OCeq60zkig6H363vfuxMvvvpn9+x0ncUogaaYhwA2qUKeuoXQcyKbQeN5
HUd22sW8ltxKENRQNuwC2XIGdgVXzCwfWVa89em8K/y0NgiUPU3KC8nv5ziZN0Gp
41bfrK4LQiSKOabaFg7LFA3Yt/6U9SghHtBjDVXXTfseFLJvicX7aGOWcOP5t04A
oQIKOIPqKXmKxSvqcclJBe+SSpEfYVpDSt2cT4T4D1sLg0xFEe1B1pzM39uBEcgp
NJBlIEy1/HSFtzhWF436Bn+fMPdfNhNM3zc8MeKRmJKD4OlPGd6Ev2v0hTrUeRPv
yORlwVcDnDbWNtVhgBYmdY3LXTrQvCdwNZZ+faKfghRd/Cod3XDLew61tO3/Jdwp
FMFUxg7kBfUf/T6pbhVx
=VuzH
-----END PGP SIGNATURE-----

--SUOF0GtieIMvvwua--
