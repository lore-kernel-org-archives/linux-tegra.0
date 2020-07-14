From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RESEND PATCH] arm64: tegra: Add support for Jetson Xavier NX
Date: Tue, 14 Jul 2020 11:17:20 +0200
Message-ID: <20200714091720.GC141356@ulmo>
References: <20200712102506.23686-2-jonathanh@nvidia.com>
 <20200713161701.30449-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xesSdrSSBC0PokLI"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200713161701.30449-1-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--xesSdrSSBC0PokLI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 13, 2020 at 05:17:01PM +0100, Jon Hunter wrote:
> Add the device-tree source files for the Tegra194 Jetson Xavier NX
> Developer Kit. The Xavier NX Developer Kit consists of a small form
> factor system-on-module (SOM) board (part number p3668-0000) and a
> carrier board (part number p3509-0000).
>=20
> The Xavier NX Developer Kit SOM features a micro-SD card slot,
> however, there is also a variant of the SOM available that features a
> 16GB eMMC. Given that the carrier board can be used with the different
> SOM variants, that have different part numbers, both the compatible
> string and file name of the device-tree source file for the Developer
> Kit is a concatenation of the SOM and carrier board part numbers.
>=20
> This is based upon some initial work by Thierry Reding
> <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>.
>=20
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>=20
> I have updated the author and given credit to Thierry for doing the
> initial work on the change.
>=20
>  arch/arm64/boot/dts/nvidia/Makefile           |   1 +
>  .../nvidia/tegra194-p3509-0000+p3668-0000.dts | 343 ++++++++++++++++++
>  .../boot/dts/nvidia/tegra194-p3668-0000.dtsi  | 296 +++++++++++++++
>  3 files changed, 640 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-=
0000.dts
>  create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-p3668-0000.dtsi

I need this patch to avoid an error being flagged by checkpatch:

--- >8 ---
diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentati=
on/devicetree/bindings/arm/tegra.yaml
index 60b38eb5c61a..53845db64df1 100644
--- a/Documentation/devicetree/bindings/arm/tegra.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra.yaml
@@ -101,3 +101,11 @@ properties:
           - enum:
               - nvidia,p2972-0000
           - const: nvidia,tegra194
+      - description: Jetson Xavier NX
+        items:
+          - const: nvidia,p3668-0000
+          - const: nvidia,tegra194
+      - description: Jetson Xavier NX Developer Kit
+        items:
+          - const: nvidia,p3509-0000+p3668-0000
+          - const: nvidia,tegra194
--- >8---

I'll submit that separately and have applied this one in the meantime.

Thanks,
Thierry

--xesSdrSSBC0PokLI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl8NeB4ACgkQ3SOs138+
s6FPwhAAgVXj380VKc1EoXEsYut5/hDLgGF8xQqGNQ3VQ2gVmHYL5pvWV8eYsxmU
bVKDpQVr5ogndrH8IX9SbKbF5CJP7ZwieWetPjYk7P/v8LFU4RqN4+vXz/2vN1/O
+VF51NGo1bXAySixylRmrX4Okmme3jDi3+Fn566O5atXqswh+iBFmBh/NvHloMSc
VeosCiM9dc57wGLPKQqj6taAYPRSK24q5tiqQVQKYztshNcVbP4n44FTDQCDQBgj
Q+IFYcr0f2CyKmzIhQp1a9DAotrKlgKoTOTV6otRHSrmvQD4/fwelu+yUriHu5T0
WYL0WflCqMMcdstCE4qV0OdsPXW53pH+wmRFk4FTF5TugkyCDWRbKJrWqoy3LSc+
mV3ipsQ4tdlN2bCV2kOr85HPAXAQ7NOvuiUF5lo3Tfo6Q0hxNOrJ8aXkv2+V75Ei
sBCUCLrzHc1TCoffk2J/SmafkbQVVb6nGR5i4CPsSU5C3jIS3ZyI587VvW1j1GXb
AXtOWRqo5AtCty5IiTZlLvgEXNcnYeaFP7KKweLW72H4qrmUJMpGGd/jP8ay1Eb/
58VbD8Yfla2qiE0qf1cSqimhogwTBJmZS9Hjz4Ma1BPBJGx2hBNznndYUAnmf+2J
LzMZiNwLEOJ2lAg9/AchUDCKZel8uLcEu6Ak1LG11RDgIW0f2zQ=
=Rl5v
-----END PGP SIGNATURE-----

--xesSdrSSBC0PokLI--
