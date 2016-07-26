From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] dt-bindings: allow child nodes inside the Tegra BPMP
Date: Tue, 26 Jul 2016 12:03:02 +0200
Message-ID: <20160726100302.GE2433@ulmo.ba.sec>
References: <20160719191442.15439-1-swarren@wwwdotorg.org>
 <20160719191442.15439-2-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7LkOrbQMr4cezO2T"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160719191442.15439-2-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, MLongnecker-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, sivaramn-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--7LkOrbQMr4cezO2T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 19, 2016 at 01:14:41PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> The BPMP implements some services which must be represented by separate
> nodes. For example, it can provide access to certain I2C controllers, and
> the I2C bindings represent each I2C controller as a device tree node.
> Update the binding to describe how the BPMP supports this.
>=20
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  .../bindings/firmware/nvidia,tegra186-bpmp.txt     | 23 ++++++++++++++++=
++++++
>  1 file changed, 23 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/firmware/nvidia,tegra186-b=
pmp.txt b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.t=
xt
> index 9a3864f56955..142d363406f6 100644
> --- a/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.txt
> +++ b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.txt
> @@ -38,6 +38,24 @@ implemented by this node:
>  - .../reset/reset.txt
>  - <dt-bindings/reset/tegra186-reset.h>
> =20
> +The BPMP implements some services which must be represented by separate =
nodes.
> +For example, it can provide access to certain I2C controllers, and the I=
2C
> +bindings represent each I2C controller as a device tree node. Such nodes=
 should
> +be nested directly inside the main BPMP node.
> +
> +Software can determine whether a child node of the BPMP node represents =
a device
> +by checking for a compatible property. Any node with a compatible proper=
ty
> +represents a device that can be instantiated. Nodes without a compatible
> +property may be used to provide configuration information regarding the =
BPMP
> +itself, although no such configuration nodes are currently defined by th=
is
> +binding.
> +
> +The BPMP firmware defines no single global name-/numbering-space for such
> +services. Put another way, the numbering scheme for I2C buses is distinc=
t from
> +the numbering scheme for any other service the BPMP may provide (e.g. a =
future
> +hypothetical SPI bus service). As such, child device nodes will have no =
reg
> +property, and the BPMP node will have no #address-cells or #size-cells p=
roperty.

My understanding is that the I2C bus number is passed as part of the
request to the BPMP firmware. Does that not count as addressing? Could
we not represent that generically using a device tree hierarchy? I'm
thinking something along these lines:

	bpmp {
		...

		services {
			i2c {
				i2c@0 {
					reg =3D <0>;
					...
				};

				i2c@1 {
					reg =3D <1>;
					...
				};

				...
			};

			spi {
				...
			};

			...
		};

		...
	};

Note that we could probably do without the "services" node, but this is
explicit in categorizing these as services exposed by the BPMP. We might
need the extra node to work around the issue that some child nodes of
the BPMP node don't have a reg property (configuration nodes), whereas
any of the services would have those. Although you could make the top-
level "i2c" and "spi" nodes take #address-cells and #size-cells
properties.

Thierry

--7LkOrbQMr4cezO2T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXlzVWAAoJEN0jrNd/PrOhPuIQALWJGROfOxGCmOOiwe6CjLEh
ZanJwOCtJWHHiKd5FL2MUofjqYGgMfzxGCg94uqAo1T6vXbPAufQQbRv+ZDJJdgF
L0zo9kcKPSvGBG+e5qk3cb93K8BTOH9kvlNQ0FDcmjx1rWo065YUHuUqjiVQfXGd
PcOuwOd2MNKRemcpeAZqKp7/H+DS3idehS5rEW3pSXbNlf09T5c1gGu8lN2Q7VUd
7zqLeRtMnEtN3koIpI23lucl570Ib+hNNlrMcgkpg6uvpW4/2lY9uLVWupxJch2j
nCsLjJcUcrYzYbhISzIp4BFQuwtMkuyb4Mtr+mFR97Bj2Yzf79KRPzCswPix4/3L
vPEaxAQpijdoGfeRkEhgowP73tvCmJGqVF5/F6j5CB0iggKqeXuxwHex9p6eHwpT
NWRShhtDAI+xlFLIhirAThUfJkpBWbXXdXK0i8RdNRy1k3emWHbaq+TQKQASZN2G
HyI4H/WYfcR6hkuY3aKaP+2TrdhzQMs+BHs6iGu8+eeWcgsLGAAfWnZo/P4uVzlF
BbQhyYldTbIcrT7yeQrUJ4vPC3USaAMJlQETJwnySa/UDrx2R4tphceEca78uLMG
eS6aGwny9CLECObhpOZwBTh+eLfn3Lmh5+LvwTKDEq8SUyuVierk9b191fn2K1jL
XS3ZFnJWK017snI1igs5
=FuL5
-----END PGP SIGNATURE-----

--7LkOrbQMr4cezO2T--
