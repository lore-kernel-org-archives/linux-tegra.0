From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] arm64: tegra210-smaug: Add gpio-key nodes
Date: Fri, 4 Mar 2016 09:30:02 +0100
Message-ID: <20160304083002.GA4038@ulmo>
References: <1457034865-17826-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1457034865-17826-1-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Olof Johansson <olof-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 03, 2016 at 02:54:25PM -0500, Rhyland Klein wrote:
> Add gpio-key nodes for the volumn controls, lid switch,
> tablet mode and power button.
>=20
> Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 43 +++++++++++++++++++++=
++++++
>  1 file changed, 43 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/b=
oot/dts/nvidia/tegra210-smaug.dts
> index 750e85c45135..9c0ec3031e98 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> @@ -1,5 +1,7 @@
>  /dts-v1/;
> =20
> +#include <dt-bindings/input/input.h>
> +
>  #include "tegra210.dtsi"
> =20
>  / {
> @@ -76,6 +78,47 @@
>  		};
>  	};
> =20
> +	gpio-keys {
> +		compatible =3D "gpio-keys";
> +		gpio-keys,name =3D "gpio-keys";
> +
> +		power {
> +			label =3D "Power";
> +			gpios =3D <&gpio TEGRA_GPIO(X, 5) GPIO_ACTIVE_LOW>;
> +			linux,code =3D <KEY_POWER>;
> +			debounce-interval =3D <30>;
> +			gpio-key,wakeup;

This property was recently deprecated in favour of the standard generic
wakeup-source property.

> +		};
> +
> +		lid {
> +			label =3D "Lid";
> +			gpios =3D <&gpio TEGRA_GPIO(B, 4) GPIO_ACTIVE_LOW>;
> +			linux,input-type =3D <5>; /* EV_SW */
> +			linux,code =3D <0>; /* SW_LID */

The dt-bindings/input/input.h header defines the symbolic names for
these in upstream versions of the Linux kernel.

> +			gpio-key,wakeup;
> +		};
> +
> +		tablet_mode {
> +			label =3D "Tablet Mode";
> +			gpios =3D <&gpio TEGRA_GPIO(Z, 2) GPIO_ACTIVE_HIGH>;
> +			linux,input-type =3D <5>; /* EV_SW */
> +			linux,code =3D <1>; /* SW_TABLET_MODE */

Same here.

I've made all the above changes when applying, so no need to resend.

Thierry

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJW2UeHAAoJEN0jrNd/PrOhpP4QALRDkQTuDabhduLap6hf/Id/
iQ0QOoHep1ZwjrJL/hSYJutpWcdkP9QfQ++fKKcfnc3uybXtQB5TcKgZW3W2G3+v
0zpr5FFCYIPo+cEDS3+5Rwm0/scPexbpbh0D1bswXjGQYjwlW++vh2OYp62fKggD
qJ+yxehDpat+ndWzBxZhrBslG0Avro6JUKBILAzbNhvVKKex9Xgax6ZvDh5hof5+
+C4yHMkGkD/v7IWyNT+gmRYHGR2KWAlzWbB1Yss31dbse6xt4dX8fjqPGc9eMrNI
q/1jephs+mghPiZKzrNdDKGiW/vIxk9izvUl1iLQRiFJYCfWH51AgnKs+yEfc665
z1mNodKz+y/ilH2IuFWKy8QnBfaNlIVPniXvHBOcoQK/fzs76Hhvnisk61vp8zUZ
6fv04tBGAhafSAT6+UjbbOets7i6PbPFdfG9mXq21HW7bmEqpPTY42p/jcqOCbSQ
1q/0RBp7MdGqB8JsYEw1vim4Ycet4C8b/lDDnW6Z+lqYTEhgp1K/tF1OqPzsi9py
ukapFtZDWoL0RbW2UD5a+V5RDBaPcSkrUJfBi2Zov00jG2svkotMN/4yHD6pEBMv
i2kVHD0tEyDzGx0bnXseLLAmppXdgx6VosYfZV5W/9zw+12SeLrog0HRjxjoWbfV
n7kUMb8xMu2JEyIhxQt7
=MEpM
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
