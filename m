From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: paz00: Add host1x support
Date: Fri, 16 Nov 2012 23:35:10 +0100
Message-ID: <20121116223510.GA21755@avionic-0098.mockup.avionic-design.de>
References: <ae44d3c1f4ceecb0f6a486d569608eec3c892ba1.1353104179.git.marvin24@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jRHKVT23PllUwdXP"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <ae44d3c1f4ceecb0f6a486d569608eec3c892ba1.1353104179.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 16, 2012 at 11:20:55PM +0100, Marc Dietrich wrote:
> This adds host1x support which includes HDMI and LVDS support.
>=20
> Signed-off-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
> ---
>  arch/arm/boot/dts/tegra20-paz00.dts |   27 ++++++++++++++++++++++-----
>  1 file changed, 22 insertions(+), 5 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/tegr=
a20-paz00.dts
> index e884fa5..3f7f5a2 100644
> --- a/arch/arm/boot/dts/tegra20-paz00.dts
> +++ b/arch/arm/boot/dts/tegra20-paz00.dts
> @@ -244,7 +244,7 @@
>  		clock-frequency =3D <216000000>;
>  	};
> =20
> -	i2c@7000c000 {
> +	lvds_ddc: i2c@7000c000 {
>  		status =3D "okay";
>  		clock-frequency =3D <400000>;

You might want to change this to 100 kHz as well. I think some displays
don't like fast mode. Then again, if you've verified that this works on
AC100 I suppose it can just as well stay as is.

On a side-note, I've found that Tegra doesn't do proper 400 kHz either,
but rather something like 375 kHz. Stephen, is this a known issue or is
it actually supposed to be able to do exactly 400 kHz?

> =20
> @@ -256,9 +256,9 @@
>  		};
>  	};
> =20
> -	i2c@7000c400 {
> +	hdmi_ddc: i2c@7000c400 {
>  		status =3D "okay";
> -		clock-frequency =3D <400000>;
> +		clock-frequency =3D <100000>;
>  	};
> =20
>  	nvec {
> @@ -399,13 +399,13 @@
>  					regulator-max-microvolt =3D <1800000>;
>  				};
> =20
> -				ldo7 {
> +				hdmi_vdd_reg: ldo7 {
>  					regulator-name =3D "+3.3vs_ldo7,avdd_hdmi";
>  					regulator-min-microvolt =3D <3300000>;
>  					regulator-max-microvolt =3D <3300000>;
>  				};
> =20
> -				ldo8 {
> +				hdmi_pll_reg: ldo8 {
>  					regulator-name =3D "+1.8vs_ldo8,avdd_hdmi_pll";
>  					regulator-min-microvolt =3D <1800000>;
>  					regulator-max-microvolt =3D <1800000>;
> @@ -499,6 +499,23 @@
>  		};
>  	};
> =20
> +	host1x {

The host1x node should be sorted earlier, according to its bus address.

> +		dc@54200000 {
> +			rgb {
> +				status =3D "okay";
> +				nvidia,ddc-i2c-bus =3D <&lvds_ddc>;
> +			};
> +		};
> +
> +		hdmi {
> +			status =3D "okay";
> +			vdd-supply =3D <&hdmi_vdd_reg>;
> +			pll-supply =3D <&hdmi_pll_reg>;
> +			nvidia,ddc-i2c-bus =3D <&hdmi_ddc>;
> +			nvidia,hpd-gpio =3D <&gpio 111 0>; /* PN7 */
> +		};
> +	};

As Stephen already mentioned, and I think you already experienced,
tegra-drm has issues with two enabled outputs that run at different
resolutions, so you should probably keep HDMI disabled for now.

Thierry

--jRHKVT23PllUwdXP
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQpr+eAAoJEN0jrNd/PrOhh0MP/10ZrEuxh2acd9A9FAV0SYaL
zuBtz2IIyy2z8sK+zPFeM20b6MedcI/69DiRkcqeJOfpJvdTN10F2Q430buHpnmp
XtWV7+zUYotMyW2cRc4r233Vz1bwHWpK6lNLVQeQc5bQvStBv670upPwfdfgfKc4
f6PYvZlIE0sIKy+rivhRDHj44/USYVs+q5Bp9u/9yREUoC5zplpXSUTxo4Z8vAOu
lFniEqkBtZx8hDxVG5TxdIZixF9hr4xdu+Qc49N2vdR78nyLncABwd/tVUWUoEdG
hZyWf5B+HZfThb73sPmZ0ucOd/wyPgs7uaJlIad7EvnHN/gZtt746p0XPd8G7iT/
GtJoaPbT9qGCUq5CnaFMJ32+tD9Mv0TTEmYdTl5Dm06x+VfC/JZx5JJU9swMrBUA
bmopTtPxdXMVAKp4djIUc8LfF3Qx9KN2/pCvVnyQu0Pijo66Wl9BPy4pB6F8qXXq
m8SnthkKUWG1DgDMx8W8IjQzvnVjhxdQSLsHSLD+Lhvioa1VeVK8Dyo3VmNiVw5M
6EecUPTC4y1vURcUtSMQoh9a08W+DJmVVvjW56Bbtn78dOA0n7Z1FvAvIYiH0C5I
OllvRiTzSqwxC4aqlvZpeJ0j1OPGaQnXJRaMugAyEHZ7qyragkN2dCPN5y6NJitJ
rPHns6sIUYNNfC4G6SOA
=eB1p
-----END PGP SIGNATURE-----

--jRHKVT23PllUwdXP--
