From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V3 07/11] of: Add bindings of hw-trips for soctherm
Date: Thu, 21 Jan 2016 15:52:51 +0100
Message-ID: <20160121145251.GD32301@ulmo>
References: <1453111448-12445-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/3yNEOqWowh/8j+e"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1453111448-12445-1-git-send-email-wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, MLongnecker-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, mikko.perttunen-/1wQRMveznE@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--/3yNEOqWowh/8j+e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 18, 2016 at 06:04:08PM +0800, Wei Ni wrote:
> Add hw-trips sub-node for soctherm, which is
> used to describe the hardware trip points for
> each soctherm sensors.

Please make use of the full 78 characters in each line. Otherwise looks
good to me.

Oh, also make sure to Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org on device tree
binding patches. Doing that now, hence quoting verbatim.

Thierry

>=20
> Signed-off-by: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  .../devicetree/bindings/thermal/tegra-soctherm.txt | 24 ++++++++++++++++=
++++++
>  1 file changed, 24 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/thermal/tegra-soctherm.txt=
 b/Documentation/devicetree/bindings/thermal/tegra-soctherm.txt
> index 6b68cd150405..75dc9dbe7e1a 100644
> --- a/Documentation/devicetree/bindings/thermal/tegra-soctherm.txt
> +++ b/Documentation/devicetree/bindings/thermal/tegra-soctherm.txt
> @@ -26,6 +26,15 @@ Required properties :
>      of this property. See <dt-bindings/thermal/tegra124-soctherm.h> for a
>      list of valid values when referring to thermal sensors.
> =20
> +Optional properties:
> +- hw-trip-points : A sub-node which is a container of hardware trip poin=
ts
> +    for each sensors.
> +  * sensors: Sub-nodes which are used to describe the HW trip points inf=
o,
> +        must be named as "cpu", "gpu", "mem", "pll".
> +      Properties:
> +      - thermtrip-temperature : Shutdown or reset temperature in millice=
lsius,
> +        once the temperature of this sensor is higher than the
> +        thermtrip-temperature, the system will be shutdown or reset.
> =20
>  Example :
> =20
> @@ -40,6 +49,21 @@ Example :
>  		reset-names =3D "soctherm";
> =20
>  		#thermal-sensor-cells =3D <1>;
> +
> +		hw-trip-points {
> +			cpu {
> +				thermtrip-temperature =3D <103000>;
> +			};
> +			gpu {
> +				thermtrip-temperature =3D <103500>;
> +			};
> +			mem {
> +				thermtrip-temperature =3D <103500>;
> +			};
> +			pll {
> +				thermtrip-temperature =3D <105000>;
> +			};
> +		};
>  	};
> =20
>  Example: referring to thermal sensors :
> --=20
> 1.9.1
>=20

--/3yNEOqWowh/8j+e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWoPDCAAoJEN0jrNd/PrOhgHQP/0A4EQ9vvJA3H57hVKRACe5z
1KAezYKbFod0rQHDvO0ISQQFSwYO1MnTq4qEiJdfaw1/DGbbxPUSfBJ8B6y0w+GV
TOQJb/kec28bXuhbMFPGnL0VoFnPNoagzFaSNsjETEJo8RdkFQ3PD4CO/Rl2QuUh
Ue8SS96ohqlWfC3HbdjQMpp6RGWlHKYm74eLurGWjlqoYXQs0DjJkBXYJeVo1sbQ
tnAhhEbNwtpMIcZY2VCeImz4v8fFgT+SG44Wj1tWwfMy/7VuWnpS5r0SFZ7173iL
ZxllPrkQa6JJi3O3rkS1zzymEoAgWOvtusPDA/xKl13tP2KEQGhr6QuDBu6vBZzM
WNRSB2IxjvCgGaDGaplRFN/QyaRp1p+tEiBgbZhNkZl+Chbrus9Oa/Es8XDhWpsZ
uilzK0oX7m+7SGctxiGfzW1wcin4eAj8A7H2xgwxYKMg1eme24XWd9YXjUJsSe7h
lavknsccBpzAlIUHnfat/K4Fuj9UoG0kIrKwK+80RXo4X/EzdH+qKnefgnteKwxN
6TyHeY5AupZGg3HNQE4+vRw3k0HjvSp360/7us+cofrA1Rf4v/lgMc1tlrklX484
saVBmn/nj/LOfsuqVc5qvhhYYcxg3sl4nc+49SdBHALPWKXniQr4lkPuEdHVUiu2
mLbCGKaASfAodNs0vH+N
=Pb8u
-----END PGP SIGNATURE-----

--/3yNEOqWowh/8j+e--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
