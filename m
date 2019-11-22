From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 5/6] arm64: tegra: Enable GPIO controllers nodes for
 P2972-0000 platform
Date: Fri, 22 Nov 2019 14:20:07 +0100
Message-ID: <20191122132007.GC1315704@ulmo>
References: <20191122104505.8986-1-vidyas@nvidia.com>
 <20191122104505.8986-6-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="nmemrqcdn5VTmUEE"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191122104505.8986-6-vidyas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vidya Sagar <vidyas@nvidia.com>
Cc: lorenzo.pieralisi@arm.com, bhelgaas@google.com, robh+dt@kernel.org, jonathanh@nvidia.com, andrew.murray@arm.com, kishon@ti.com, gustavo.pimentel@synopsys.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org


--nmemrqcdn5VTmUEE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 22, 2019 at 04:15:04PM +0530, Vidya Sagar wrote:
> Enable GPIO controllers nodes for P2972-0000 platform which are required
> by other controllers in the SoC for example when PCIe C5 controller
> operates in endpoint mode.
>=20
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)

The GPIO controllers are enabled by default, so there's no need to
explicitly enable them.

Thierry

>=20
> diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts b/arch/ar=
m64/boot/dts/nvidia/tegra194-p2972-0000.dts
> index 353a6a22196d..7eb64b816e08 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
> @@ -37,6 +37,14 @@
>  			status =3D "okay";
>  		};
> =20
> +		gpio@2200000 {
> +			status =3D "okay";
> +		};
> +
> +		gpio@c2f0000 {
> +			status =3D "okay";
> +		};
> +
>  		pwm@c340000 {
>  			status =3D "okay";
>  		};
> --=20
> 2.17.1
>=20

--nmemrqcdn5VTmUEE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3X4IcACgkQ3SOs138+
s6FpAQ/+JotZz8/2JN3IdtE0k+8HWLGaEx1OOv0qlI9Im7TRT6KIdSgkmlOjyWc8
3JJ8fSte/65M3AqAJl+321hN4dhmnh4VDxHXfKsmx3q5PaZr02AByCD8sCNqkpt2
/mDeVZ8rwWhtGOA3L20pPbRLeEKNlhzWPX02saLkTSH2eL34fHu/eg1YZAeW9Cu8
oNg3i/2aqHKoyMoUvXE9MlrbibcGQAB3ZL9samNeotzBYF0r/jUTPVe/8Hb/M8+l
9VFAHuw8Rv5VQCiHkiwtBZccd40PXeNISeGsrIuDPYY2MY8qmJncvYYqJLtsILyg
R2bztDz4+5F77NLP92ktl6AXfO6pR0bG+PYMMauh95yxtJ9it5I51LKXTOXSxXCy
fBmzIyR4rWYMtZE8TH8bahyR0nScsIFUlYT74w4CRchW5j4OEd/AhV/CECdPVOU0
j9ANfV1g+OCPx/J3NOSxmIJDrDIjOwKqNCofb1ijc11kVketJ1ubmObS8bgu3oLV
uE32RVxblix0IT0geVDMDP4r4z7nDNE6PmCptvhtyiVmtdSWKoMLod1nxZ7qGbT2
BrEEozE/f/kNpQvLDp1uhCdtkgOi+hxqPze6p5FJhrJJ1ftzB+mdinqgOU9Jm8yQ
En+CE7rFd5SFf2RRD/5r+bb93b8DBwNYbh1B0AGjT5EpTqi2Qbg=
=kby4
-----END PGP SIGNATURE-----

--nmemrqcdn5VTmUEE--
