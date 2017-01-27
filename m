From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: Add Tegra186 BPMP I2C binding
Date: Fri, 27 Jan 2017 23:19:00 +0100
Message-ID: <20170127221857.GA15715@mithrandir.ba.sec>
References: <20170127083939.20393-1-thierry.reding@gmail.com>
 <20170127083939.20393-2-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="KsGdsel6WgEHnImy"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170127083939.20393-2-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 27, 2017 at 09:39:38AM +0100, Thierry Reding wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> In Tegra186, the BPMP (Boot and Power Management Processor) owns certain
> HW devices, such as the I2C controller for the power management I2C bus.
> Software running on other CPUs must perform IPC to the BPMP in order to
> execute transactions on that I2C bus. This binding describes an I2C bus
> that is accessed in such a fashion.
>=20
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Reviewed-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Signed-off-by: Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Acked-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  .../bindings/i2c/nvidia,tegra186-bpmp-i2c.txt      | 42 ++++++++++++++++=
++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/nvidia,tegra186=
-bpmp-i2c.txt

Rob, sorry for not Cc'ing you earlier on this, but I had thought this
binding had already been reviewed and acked since it is merged in
U-Boot.

Wolfram was concerned in particular about the nvidia,bpmp-bus-id
property below.

Can you give this a quick look, please?

Thanks,
Thierry

> diff --git a/Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i=
2c.txt b/Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.txt
> new file mode 100644
> index 000000000000..ab240e10debc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.txt
> @@ -0,0 +1,42 @@
> +NVIDIA Tegra186 BPMP I2C controller
> +
> +In Tegra186, the BPMP (Boot and Power Management Processor) owns certain=
 HW
> +devices, such as the I2C controller for the power management I2C bus. So=
ftware
> +running on other CPUs must perform IPC to the BPMP in order to execute
> +transactions on that I2C bus. This binding describes an I2C bus that is
> +accessed in such a fashion.
> +
> +The BPMP I2C node must be located directly inside the main BPMP node. See
> +../firmware/nvidia,tegra186-bpmp.txt for details of the BPMP binding.
> +
> +This node represents an I2C controller. See ../i2c/i2c.txt for details o=
f the
> +core I2C binding.
> +
> +Required properties:
> +- compatible:
> +    Array of strings.
> +    One of:
> +    - "nvidia,tegra186-bpmp-i2c".
> +- #address-cells: Address cells for I2C device address.
> +    Single-cell integer.
> +    Must be <1>.
> +- #size-cells:
> +    Single-cell integer.
> +    Must be <0>.
> +- nvidia,bpmp-bus-id:
> +    Single-cell integer.
> +    Indicates the I2C bus number this DT node represent, as defined by t=
he
> +    BPMP firmware.
> +
> +Example:
> +
> +bpmp {
> +	...
> +
> +	i2c {
> +		compatible =3D "nvidia,tegra186-bpmp-i2c";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		nvidia,bpmp-bus-id =3D <5>;
> +	};
> +};
> --=20
> 2.11.0
>=20

--KsGdsel6WgEHnImy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliLx0wACgkQ3SOs138+
s6G0Bw/9E8GqIREjVZfgq+iDCkPht5blmvAhpzDPc9p9A7FAUwxH+hqvGhlOIGEp
tq05wd5G0ZejvN2RUaSmA2wNVR43E6qHKCLd+Joyj06ujCJ6bf48xbgmyduF4JjQ
GqX78VLxlrza+m1pGcNL/dNYWjf8JqLersuC9eqeVvPqFyEaCDMbEpzrmBoZ8+Wm
7LDSl4wJF7f0WJ+GQyyT7C8kI3vZ4FILCQ7eL/acIrl6KX/J1kAplxnUCkC5IcZJ
FDq+wx28EI6EKKZvyk6zxEOZ5REW+k+tpjMFk3wlkqzRP3zNRzrxxAZVpkdfb5Y8
RkC9ZALNTwdG0HBP85N3XrgbA5SrlDG91qec8sAwmCU9i1JGcyf/wSS20J73X/Rm
qyTVZGwUvwYREtJB9pVOz5IUE11hp6/Qn3PtAUOjpQZJLDGk7zpiP5HtzPRMUhJA
Nvwr42Tt83N3AEbuWd4oklBPqe8gTgl+1z8bLI6g+tEKnIGo+ABSy7J7kCqnqGEc
1JbiXkFCnMDy/q+MAVx/m3vYT3UX+HngxpF/fN3FoD0u65B3XwHqu23lLxquf/go
WYYuEiw/N+mpSDGFB0S3dn/tbHdAZBlUq7h16I7Jja43n5VLFytNoWX9WuQZyJpg
zYK5p/+atmbIQHU12NMc/ORrvLC0KkG328urKvmQ+K+k2gSx8R8=
=Emx/
-----END PGP SIGNATURE-----

--KsGdsel6WgEHnImy--
