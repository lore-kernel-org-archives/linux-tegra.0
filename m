From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/4] ARM: tegra: add MMC controllers to Tegra124 DT
Date: Fri, 29 Nov 2013 17:04:27 +0100
Message-ID: <20131129160426.GT9712@ulmo.nvidia.com>
References: <1385419160-11511-1-git-send-email-swarren@wwwdotorg.org>
 <1385419160-11511-4-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pd495SECmvzXpBRb"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1385419160-11511-4-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--pd495SECmvzXpBRb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 25, 2013 at 03:39:20PM -0700, Stephen Warren wrote:
[...]
> diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts/t=
egra124-venice2.dts
> index a0b028384658..bc502112eb04 100644
> --- a/arch/arm/boot/dts/tegra124-venice2.dts
> +++ b/arch/arm/boot/dts/tegra124-venice2.dts
> @@ -25,6 +25,17 @@
>  		nvidia,sys-clock-req-active-high;
>  	};
> =20
> +	sdhci@700b0400 {
> +		cd-gpios =3D <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_HIGH>;

I have a local patch which adds this here:

		power-gpios =3D <&gpio TEGRA_GPIO(R, 0) GPIO_ACTIVE_HIGH>;

> +		status =3D "okay";
> +		bus-width =3D <4>;

And:

		vmmc-supply =3D <&vddio_sdmmc3>;

here. The latter doesn't probably matter because we don't have the PMIC
node yet and the regulator seems to be on by default.

Thierry

--pd495SECmvzXpBRb
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSmLsKAAoJEN0jrNd/PrOhOIoP/i0Qg7onmbKd+qDxz4bQ/k5f
Y0EsQGLm17hOFdcMrsXZ2wLwq5T6EIxXuNlWdW3PZ85JmR56DY/F1Ny/30dql1vp
XX8+UJCNgPc+JfISSpdI8c9+57CxpaYEuuG1siFXiyi1xFU0vSdrSGqWT52iEzon
XhX08uPxSHX6rAn4P0U0v/XGLU2nuFmP7ekPB/YQ18SiTbZWgJ7IloIPFW6wl8lA
+M4vNRsAdljMnA7IoEnKRajPg81+ihgzShuEmFZAZy7FAMJyCap/5eGe9I4DvjS7
/0ejfATN7XDulA47IV0gHgh1EKbHhALxuQh9oKW+vmi3Vwa7o9AmRDlaBB5Pff7p
ucNS2CWX9Q/hHYtk5EPyKzgugP5U7GurYEUVBE6U0IovPIOMjGsk7qF4+obz9qFv
tU4IilWv01gPEljutAhJaZuQDxTpR5MnQRYLAuir4olEh+2rptaYkEmhN9YBATSV
UExIttr7c2soVLwqN6vwA3zs2L66mPZJh8FyYzHGEDkEI0cf04s+dsTlT2h+dVFm
jSuacyElF59LbDjoMQoHjcoxiIi9FfHAL41e4oG3rSQlW4djpRqcr828k2ULBbM+
ov4l+2O2FJ7CaMDr1zoDiOdCB2XzFbizz4kRAkDPpnhjwh8fK+ivuiI9ZYnvvxzt
Nf8eeP2S2col6Q5hSrNZ
=O+Y4
-----END PGP SIGNATURE-----

--pd495SECmvzXpBRb--
