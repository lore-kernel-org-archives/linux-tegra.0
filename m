From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH V5 9/9] pwm_bl: Add mandatory backlight power regulator
Date: Tue, 26 Mar 2013 08:37:09 +0100
Message-ID: <20130326073709.GB31388@avionic-0098.mockup.avionic-design.de>
References: <1364260913-25490-1-git-send-email-achew@nvidia.com>
 <1364260913-25490-10-git-send-email-achew@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nVMJ2NtxeReIH9PS"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1364260913-25490-10-git-send-email-achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: romain.naour-oid7hba3+9NWj0EZb7rXcA@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, drwyrm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, stefan-WB6LKoYH/xlAfugRpC6u6w@public.gmane.org, laforge-WB6LKoYH/xlAfugRpC6u6w@public.gmane.org, philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lost.distance-/E1597aS9LQAvxtiuMwx3w@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, gxt-TG0Ac1+ktVePQbnJrJN+5g@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, openezx-devel-ZwoEplunGu3n3BO9LpVK+9i2O/JbrIOy@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--nVMJ2NtxeReIH9PS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2013 at 06:21:53PM -0700, Andrew Chew wrote:
[...]
> diff --git a/Documentation/devicetree/bindings/video/backlight/pwm-backli=
ght.txt b/Documentation/devicetree/bindings/video/backlight/pwm-backlight.t=
xt
> index 1e4fc72..cb2d46a 100644
> --- a/Documentation/devicetree/bindings/video/backlight/pwm-backlight.txt
> +++ b/Documentation/devicetree/bindings/video/backlight/pwm-backlight.txt
> @@ -10,6 +10,11 @@ Required properties:
>        last value in the array represents a 100% duty cycle (brightest).
>    - default-brightness-level: the default brightness level (index into t=
he
>        array defined by the "brightness-levels" property)
> +  - power-supply: A phandle to the regulator device tree node. This
> +      regulator will be turned on and off as the pwm is enabled and disa=
bled.

Please use "PWM" instead of "pwm" in prose.

>  Optional properties:
>    - pwm-names: a list of names for the PWM devices specified in the
> @@ -19,10 +24,19 @@ Optional properties:
> =20
>  Example:
> =20
> +	bl_en: fixed-regulator {
> +                compatible =3D "regulator-fixed";
> +                regulator-name =3D "bl-en-supply";
> +                regulator-boot-on;
> +                gpio =3D <&some_gpio>;
> +                enable-active-high;
> +	};

This uses a mix of tabs and spaces for indentation. Please stick to
tabs.

Thierry

--nVMJ2NtxeReIH9PS
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRUVAlAAoJEN0jrNd/PrOhMYoP/RfLpBFpwLUOpaBkJOP2GqZa
mVzNmG2ZZkTt4MqAfauyToh0tuJ3Hi/g8BTF08O51zf4FAsvsFrTdGQrAY9Rkz4h
13MVtOyH6kDVLru56K7xgzYcYJmOTGOSAl0elexhS9elVwnX73M75oWT4zuGj97g
AQUNG7tKv9tAf5UJBQ+smmr3dheyKMVsXT3GLpVKkUKGK4Vf/fq1y80QjXJjO5nk
BpiEOUsDq7uAS3lJY9LUb+opy82q/qZmhnHCX+CJXdVrSoPwjFEgMWTPmLB8rW4U
v4gN86j8mm+wym7JRJXUwmvQT4lWx1PzbXp1+vKRydyJoX319J8R+iLmel5VpRGX
PSjKmcKXkrrnr+3JaSaUc6C19iqGHp30/NDE4QR3zFj1xTjauwTZXiDKEXaexckh
+JcwLV6uQXh636PyCr+L21hb1JY29Y8LVzhPUfMwUPNXuwdYkxxnJ4k/dfjRinrI
LWBwVBkEtZI/UX6lg93V/AOob1OlTape67Sq2MSmoUn4+U3Cq1InZ2wAosEYp+pL
lOQqfbCAsHgb13ug66kCOoGcNtncHEvCuT0tB5mdZL7pDYf/gd92CZoFi62ttl7L
ba/8sSKV8i4O/pXEpNMY/XM+b9z1d1JLs6PtY0IE0wWAGxPYXycd+iBxLYhHMBaI
fmXjupyKZL+ug7eYG4tW
=xLZg
-----END PGP SIGNATURE-----

--nVMJ2NtxeReIH9PS--
