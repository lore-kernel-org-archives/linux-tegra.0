From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 0/5] arm64: tegra: fix DT definitions for GM20B GPU
Date: Tue, 26 Apr 2016 18:58:55 +0200
Message-ID: <20160426165855.GA2388@ulmo.ba.sec>
References: <1459156984-32644-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Dxnq1zWXvFF0Q93v"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1459156984-32644-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 28, 2016 at 06:22:59PM +0900, Alexandre Courbot wrote:
> Small series that fixes/completes DT bindings for Tegra GPUs and add two
> missing entries required for the Tegra210 GPU to operate properly.
>=20
> Without these fixes, GM20B will crash during probe on 4.6 because a
> required clock is not activated.
>=20
> Changes since v2:
> - Fixed device address in DT examples
> - Carried Acked-bys
>=20
> Changes since v1:
> - Renamed "pllg_ref" clock to "ref" in DT bindings
>=20
> Alexandre Courbot (5):
>   dt-bindings: gk20a: Fix typo in compatible name
>   dt-bindings: gk20a: Document iommus property
>   dt-bindings: Add documentation for GM20B GPU
>   arm64: tegra210: Add reference clock to GM20B
>   arm64: tegra210: Add IOMMU node to GM20B
>=20
>  .../devicetree/bindings/gpu/nvidia,gk20a.txt       | 37 ++++++++++++++++=
+++---
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi           |  8 +++--
>  2 files changed, 38 insertions(+), 7 deletions(-)

Applied, thanks.

Thierry

--Dxnq1zWXvFF0Q93v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXH55PAAoJEN0jrNd/PrOhmlwP/ReNvShAryeIt5rm4ZKQTFxH
v2xT3FexDr7tFmK9PwF0BXWQ8H6bTrCrlkBcl7giuLODwSXiIIz7hvjawcrZ6VnW
d5tT/QfDm7RXg/3YaLBx+Um3VXr+H4dkDqvmoJ+UA5DCJdh7IA6epB0pzqKHSxLr
9YCvyfYfORdsM+d11j/QafFmcQlcasrrqFhoHIw2dpmeJKy+9qbQbyXUmhAsAv9j
uEu9HLP+A6Hci8UdCfgHwzKbPsFWB5n3cz4mm4cdZvbabdDGqB/g/q8fYS5MDOo1
P2vhoZeexwz5/iH2rxOi+7oZtcW8zW30nDVjr9GwXp9+LUxY/L7W+Tafv4xw0SGS
x9HJB8t8F6FY5GX8LjWfUfVsilRPGQzHN92QwA/mwDxGkdglObYUvdOZw4Oh+crr
0a87zFCgpIlKvjSm6BMRvDDEUT8ekvw1mbQ0M1IyXCvU56vWEGu0jpQ+6aPw4lgs
QZZ0kT3c60hEL1YZkJToEM1oBf66+QiIaxfKJxOjwPayK4zIe6ZQxeo4BcSEUpOX
syPny+plNaXZrmx68cJJDIELk02ZbgJK8x6i2UqoRVVyRwGVuq5ZIJL6xUYIRmgc
Y7MpCba15ocfdC84BGoq2FpC3JjWKdtjhMTHrFAxW6CLNzB1pY05K2fvZE2f/XOs
IN8rQkzJtOTdkvGD5OFP
=Er54
-----END PGP SIGNATURE-----

--Dxnq1zWXvFF0Q93v--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
