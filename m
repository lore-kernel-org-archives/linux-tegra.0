From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [Patch v1 0/4] Add Nvidia Tegra GPC-DMA driver
Date: Mon, 20 Jul 2020 11:25:56 +0200
Message-ID: <20200720092556.GA2141917@ulmo>
References: <1595226856-19241-1-git-send-email-rgumasta@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xHFwDpU9dbj6ez1V"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1595226856-19241-1-git-send-email-rgumasta@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajesh Gumasta <rgumasta@nvidia.com>
Cc: ldewangan@nvidia.com, jonathanh@nvidia.com, vkoul@kernel.org, dan.j.williams@intel.com, p.zabel@pengutronix.de, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, kyarlagadda@nvidia.com
List-Id: linux-tegra@vger.kernel.org


--xHFwDpU9dbj6ez1V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2020 at 12:04:12PM +0530, Rajesh Gumasta wrote:
> Add support for Nvida Tegra general purpose DMA driver for
> Tegra186 and Tegra194 platform.
>=20
> Patch 1: Add dt-binding document for Tegra GPCDMA driver
> Patch 2: Add Tegra GPCDMA driver
> Patch 3: Enable Tegra GPCDMA as module
> Patch 4: Add GPCDMA DT node for Tegra186 and Tegra194
>=20
> Rajesh Gumasta (4):
>   dt-bindings: dma: Add DT binding document
>   dma: tegra: Adding Tegra GPC DMA controller driver
>   arm64: configs: enable tegra gpc dma
>   arm64: tegra: Add GPCDMA node in dt
>=20
>  .../bindings/dma/nvidia,tegra-gpc-dma.yaml         |   99 ++
>  arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi     |    4 +
>  arch/arm64/boot/dts/nvidia/tegra186.dtsi           |   46 +
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi           |   44 +
>  arch/arm64/configs/defconfig                       |    1 +
>  drivers/dma/Kconfig                                |   12 +
>  drivers/dma/Makefile                               |    1 +
>  drivers/dma/tegra-gpc-dma.c                        | 1512 ++++++++++++++=
++++++
>  8 files changed, 1719 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/nvidia,tegra-gp=
c-dma.yaml
>  create mode 100644 drivers/dma/tegra-gpc-dma.c

Hi Rajesh,

can you provide instructions on how to test that this driver does what
it's supposed to? I could probably figure out how to run this with the
kernel's built-in dmatest module, but if you could provide a set of
parameters that you've used or other instructions on how to validate
this it would greatly help.

Thanks,
Thierry

>=20
> --=20
> 2.7.4
>=20

--xHFwDpU9dbj6ez1V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl8VYxcACgkQ3SOs138+
s6HStBAAl7MTbsKWtMWdKW2SWSsxw6tyr1UuYJ1uhnbPdtFnBsmk41jHmQ28PUCC
qaA5Vqrge9tK4CMvblYQWyZ0hCfa/19A0fq4S9naRX0JlyQuNgZlnBfTWdBdVof+
kVTiTgJFmZ750fGEXR37aA3un0nXPrpai/Xn6ILBXxx0pyb6H1b5NaKbRAVys5lR
9BwP72HAgbs9yAQmc3oo1Id0Uh2FJdUoLk2ZldVIbWcTLBzefGZxNQOaZyMQuE3d
7yyzgQA6278biQhQjwKYfp6zdmEXl61BJKl8Jf5L99vgCLPvIw2+cLtlhGLX6svm
kgICSknw1s+M7/f5Nh+6LqhgOVv/rMrMcSMwMGrLtaSIBLOHwGnmH/7/JFjGBEL6
jZ91eo2XVZbRkNv73fp1xkbI6BKfgaFdZcLcjZPYIss3ZBfXCUiyAHPlE2B819cB
fnDg1n71Vo99WKdt4OA79bE8TEIsAhnl3Kgl2KHzZaETmbKMblbZms7BguvcQbp9
r3XNu0ZjNdRtMNm63wuHpKq8KsWgVGp5AMJnmygSQya6RmxtBbmVc5STVoDawQGu
ffYfHXg8oBULPkqfSnIU4kUgi222MJ9SgtW9Rz5gGdtzafBWuzZyl+ivl/Y+/cYa
QDLODVGYrtGhhmhIYeAfswQ0gx7U7yUrn8OZMqzIb3fkYCELC14=
=sOy/
-----END PGP SIGNATURE-----

--xHFwDpU9dbj6ez1V--
