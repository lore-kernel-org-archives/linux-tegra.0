From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1 00/29] Introduce memory interconnect for NVIDIA Tegra
 SoCs
Date: Tue, 19 Nov 2019 07:19:31 +0100
Message-ID: <20191119061931.GA2462695@ulmo>
References: <20191118200247.3567-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2121164855=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20191118200247.3567-1-digetx@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>, Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, Georgi Djakov <georgi.djakov@linaro.org>
List-Id: linux-tegra@vger.kernel.org


--===============2121164855==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="opJtzjQTFsWo+cga"
Content-Disposition: inline


--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2019 at 11:02:18PM +0300, Dmitry Osipenko wrote:
> Hello,
>=20

I like this, thanks for looking into this.

> This series brings initial support for memory interconnect to Tegra20,
> Terga30 and Tegra124 SoCs. The interconnect provides are quite generic
> and should be suitable for all Tegra SoCs, but currently upstream kernel
> has EMC/MC drivers only for those three generations of Tegra SoCs.

Tegra186 and Tegra194 should support this out of the box because the EMC
frequency can be scaled via the BPMP. Tegra210 support for EMC scaling
is in the works, so hopefully we'll be able to extend this in the near
future.

> For the start only display controllers are getting interconnect API
> support, others could be supported later on. The display controllers
> have the biggest demand for interconnect API right now because dynamic
> memory frequency scaling can't be done safely without taking into account
> bandwidth requirement from the displays.

Agreed, display controllers are where we most immediately notice when
there's not enough bandwidth. I think it's fair to start small and
extend interconnect consumers as we progress.

I've got a couple of comments regarding individual patches, but on the
whole this looks pretty nice.

Thierry

> Dmitry Osipenko (29):
>   dt-bindings: memory: tegra20: mc: Document new interconnect property
>   dt-bindings: memory: tegra20: emc: Document new interconnect property
>   dt-bindings: memory: tegra30: mc: Document new interconnect property
>   dt-bindings: memory: tegra30: emc: Document new interconnect property
>   dt-bindings: memory: tegra124: mc: Document new interconnect property
>   dt-bindings: memory: tegra124: emc: Document new interconnect property
>   dt-bindings: host1x: Document new interconnect properties
>   dt-bindings: interconnect: tegra: Add initial IDs
>   ARM: tegra: Add interconnect properties to Tegra20 device-tree
>   ARM: tegra: Add interconnect properties to Tegra30 device-tree
>   ARM: tegra: Add interconnect properties to Tegra124 device-tree
>   interconnect: Add memory interconnection providers for NVIDIA Tegra
>     SoCs
>   memory: tegra: Register as interconnect provider
>   memory: tegra: Add interconnect nodes for Terga20 display controllers
>   memory: tegra: Add interconnect nodes for Terga30 display controllers
>   memory: tegra: Add interconnect nodes for Terga124 display controllers
>   memory: tegra20-emc: Use devm_platform_ioremap_resource
>   memory: tegra20-emc: Continue probing if timings/IRQ are missing in
>     device-tree
>   memory: tegra20-emc: Register as interconnect provider
>   memory: tegra30-emc: Continue probing if timings are missing in
>     device-tree
>   memory: tegra30-emc: Register as interconnect provider
>   memory: tegra124-emc: Use devm_platform_ioremap_resource
>   memory: tegra124-emc: Register as interconnect provider
>   drm/tegra: dc: Use devm_platform_ioremap_resource
>   drm/tegra: dc: Release PM and RGB output when client's registration
>     fails
>   drm/tegra: dc: Support memory bandwidth management
>   ARM: tegra: Enable interconnect API in tegra_defconfig
>   ARM: multi_v7_defconfig: Enable NVIDIA Tegra interconnect providers
>   MAINTAINERS: Add maintainers for NVIDIA Tegra interconnect drivers
>=20
>  .../display/tegra/nvidia,tegra20-host1x.txt   |  67 +++++
>  .../nvidia,tegra124-emc.txt                   |   3 +
>  .../nvidia,tegra124-mc.yaml                   |   5 +
>  .../memory-controllers/nvidia,tegra20-emc.txt |   4 +
>  .../memory-controllers/nvidia,tegra20-mc.txt  |   4 +
>  .../nvidia,tegra30-emc.yaml                   |   6 +
>  .../memory-controllers/nvidia,tegra30-mc.yaml |   5 +
>  MAINTAINERS                                   |   9 +
>  arch/arm/boot/dts/tegra124.dtsi               |  10 +
>  arch/arm/boot/dts/tegra20.dtsi                |  11 +-
>  arch/arm/boot/dts/tegra30.dtsi                |  12 +-
>  arch/arm/configs/multi_v7_defconfig           |   2 +
>  arch/arm/configs/tegra_defconfig              |   2 +
>  drivers/gpu/drm/tegra/dc.c                    | 252 +++++++++++++++++-
>  drivers/gpu/drm/tegra/dc.h                    |   8 +
>  drivers/gpu/drm/tegra/drm.c                   |  18 ++
>  drivers/gpu/drm/tegra/plane.c                 |   1 +
>  drivers/gpu/drm/tegra/plane.h                 |   4 +-
>  drivers/interconnect/Kconfig                  |   1 +
>  drivers/interconnect/Makefile                 |   1 +
>  drivers/interconnect/tegra/Kconfig            |   6 +
>  drivers/interconnect/tegra/Makefile           |   4 +
>  drivers/interconnect/tegra/tegra-icc-emc.c    | 138 ++++++++++
>  drivers/interconnect/tegra/tegra-icc-mc.c     | 130 +++++++++
>  drivers/memory/tegra/mc.c                     |   4 +
>  drivers/memory/tegra/tegra124-emc.c           |  28 +-
>  drivers/memory/tegra/tegra124.c               |  16 ++
>  drivers/memory/tegra/tegra20-emc.c            |  91 ++++---
>  drivers/memory/tegra/tegra20.c                |  14 +
>  drivers/memory/tegra/tegra30-emc.c            |  34 ++-
>  drivers/memory/tegra/tegra30.c                |  14 +
>  include/dt-bindings/interconnect/tegra-icc.h  |  11 +
>  include/soc/tegra/mc.h                        |  26 ++
>  33 files changed, 883 insertions(+), 58 deletions(-)
>  create mode 100644 drivers/interconnect/tegra/Kconfig
>  create mode 100644 drivers/interconnect/tegra/Makefile
>  create mode 100644 drivers/interconnect/tegra/tegra-icc-emc.c
>  create mode 100644 drivers/interconnect/tegra/tegra-icc-mc.c
>  create mode 100644 include/dt-bindings/interconnect/tegra-icc.h
>=20
> --=20
> 2.23.0
>=20

--opJtzjQTFsWo+cga
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3TiXAACgkQ3SOs138+
s6EuaQ/+MUUOndULQxHywop4nsOWK9DRosUwostChC/0Wes+FgxTVYg8Ej8ljQuJ
PXJOT0fNi4TC2LulaK31tbg5Rip1UjXXuNg83sDnapdhPxQ2hSKBjEz/QhrnFU+C
CEQbmyDPcUnG9LiuF4wAyrBQ8z/WRw7WG5kG5VaglDpxKuBfjMJ+jJT3awYZe0kv
Q+2iSWq/vU/T+lDyTvzNrYEAwYG497wCHWt06sREMxZ/udIMg7JNefwm1SxNL0sP
ew9mcbx6fdgOt+tRD5CkKAf6gsEQ9imNIp1AsawQVeWWMPvhf5+8xNwho6YD932l
7abgKgITlnuW5PU2GrktfygeYMP+agUlQ3ZoE/324vycZcrxEei5wDCHZuzMEACb
1LlrLZAFBY0SsHQv/qO/i30IKnEbVGL5+taF0JVGBpx8nnWC46hVqYVQOOd+tFI6
rAHYk5Bs45S/kS3UmJA06JUOfFUCODLW0AwcRHPuMJ19SP9esgTlkztAPNHRNbtc
6h/uKv6RwYG29flTEx3hAnfZ/8xH4LMbQApfy/dlEhjkYfN9Sjwl7PhQsV0KYXFt
1CJTvmhsnm8CexjGlyCZFVY+sD8hiOLeQyyhNucIhcEj4tGRk4Q9A7N0BqTY4MZv
Dvjrn1VxJH/7K6XgtFmEUH4jAyypcGWgWKjVWgHuPhd+EiFMgEg=
=XE+S
-----END PGP SIGNATURE-----

--opJtzjQTFsWo+cga--

--===============2121164855==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2121164855==--
