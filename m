From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH V4 8/9] ARM: tegra: Provide regulator to pwm-backlight
Date: Fri, 22 Mar 2013 11:29:30 +0100
Message-ID: <20130322102930.GA4567@avionic-0098.mockup.avionic-design.de>
References: <1363719573-20926-1-git-send-email-achew@nvidia.com>
 <1363719573-20926-9-git-send-email-achew@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cWoXeonUoKmBZSoM"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1363719573-20926-9-git-send-email-achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: romain.naour-oid7hba3+9NWj0EZb7rXcA@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, drwyrm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, stefan-WB6LKoYH/xlAfugRpC6u6w@public.gmane.org, laforge-WB6LKoYH/xlAfugRpC6u6w@public.gmane.org, philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lost.distance-/E1597aS9LQAvxtiuMwx3w@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, gxt-TG0Ac1+ktVePQbnJrJN+5g@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, openezx-devel-ZwoEplunGu3n3BO9LpVK+9i2O/JbrIOy@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--cWoXeonUoKmBZSoM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 19, 2013 at 11:59:32AM -0700, Andrew Chew wrote:
> The pwm-backlight driver now takes a mandatory regulator that is gotten
> during driver probe.  Initialize a dummy regulator to satisfy this
> requirement.
>=20
> Signed-off-by: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/tegra20-medcom-wide.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/tegra20-medcom-wide.dts b/arch/arm/boot/dt=
s/tegra20-medcom-wide.dts
> index a2d6d65..bf7fdd7 100644
> --- a/arch/arm/boot/dts/tegra20-medcom-wide.dts
> +++ b/arch/arm/boot/dts/tegra20-medcom-wide.dts
> @@ -26,12 +26,18 @@
>  		};
>  	};
> =20
> +	bl_en: fixed-regulator {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "bl-en-supply";
> +	};

This should go into the top-level regulators node which this DTS
inherits from tegra20-tamonten.dtsi.

I think it'd be nice to rename it to something like backlight_reg for
consistency with other regulators in that node.

Thierry

--cWoXeonUoKmBZSoM
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRTDKKAAoJEN0jrNd/PrOhM5QP/2Dy8MQaBX+mjh8XByPcS3OB
H++sro1E+TRMQdgSDFzCIZVv9l1JkyBv9ojPzNPLaG+LO+qsVML5zKUsfpId+r3K
WRND2EfChR2fZNh5hA+HlmfxpBS+YbYSpxaYZNGSLo/KHyQPX5VxhciGRlDkCExw
JhHgfl9SkvlppfxIfXoduxU+ueREfoRiFGG68ITPWcb7RizkOobMyTSYFdCCi2KS
RmHv8Fg61ZqFsK8uyseClexXF7RuAAbltu4ogNLQLcBZ0Ip93C6LHTwkTjKD0tfV
3Ptai2tWjPY7wQlv8F6tOSn+cCDH6Uq3eMpNdOsJIiIVEvcjb4NppcIwmkhlVYDp
yjwdtiLB4pN1FPJB104F2gq5iwvkRfhr44Qae13YJnInFR/6fM2DSD0E7Tj8qg8X
FCdxOhX8hsict4TBRhNZJb5sS4+Ygov65xWtMyT+SrsUg5I3TeZUJB0bGeK0F+eN
+1IXVCKmgvzfE/5oIf3aP0X0MIRP4BviFssJu/Fwt58BgrJH7Vqd8k6/6wZgG/ZA
pezCNZTX30mIyCyFUx3f65JjgIvvR6aITK7hH2twSZeJhNm0EL0Z81qWDupCHLzp
EVi1xXYLeH++bJhle3gQZ7Q/RuX7AjTf5eknuTqyKcZarBsf6vBAkNfNYu1jS+dA
gwHqxad1XjDsx0UuNMLv
=Uy8W
-----END PGP SIGNATURE-----

--cWoXeonUoKmBZSoM--
