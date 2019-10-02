From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] arm64: tegra: Set dma-ranges for memory subsystem
Date: Wed, 2 Oct 2019 17:49:46 +0200
Message-ID: <20191002154946.GA225802@ulmo>
References: <20191002154654.225690-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4733415289580164125=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191002154654.225690-1-thierry.reding@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Georgi Djakov <georgi.djakov@linaro.org>, Maxime Ripard <mripard@kernel.org>
List-Id: linux-tegra@vger.kernel.org


--===============4733415289580164125==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KsGdsel6WgEHnImy"
Content-Disposition: inline


--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 02, 2019 at 05:46:54PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> On Tegra194, all clients of the memory subsystem can generally address
> 40 bits of system memory. However, bit 39 has special meaning and will
> cause the memory controller to reorder sectors for block-linear buffer
> formats. This is primarily useful for graphics-related devices.
>=20
> Use of bit 39 must be controlled on a case-by-case basis. Buffers that
> are used with bit 39 set by one device may be used with bit 39 cleared
> by other devices.
>=20
> Care must be taken to allocate buffers at addresses that do not require
> bit 39 to be set. This is normally not an issue for system memory since
> there are no Tegra-based systems with enough RAM to exhaust the 39-bit
> physical address space. However, when a device is behind an IOMMU, such
> as the ARM SMMU on Tegra194, the IOMMUs input address space can cause
> IOVA allocations to happen in this region. This is for example the case
> when an operating system implements a top-down allocation policy for IO
> virtual addresses.
>=20
> To account for this, describe the path that memory accesses take through
> the system. Memory clients will send requests to the memory controller,
> which forwards bits [38:0] of the address either to the external memory
> controller or the SMMU, depending on the stream ID of the access. A good
> way to describe this is using the interconnects bindings, see:
>=20
> 	Documentation/devicetree/bindings/interconnect/interconnect.txt
>=20
> The standard "dma-mem" path is used to describe the path towards system
> memory via the memory controller. A dma-ranges property in the memory
> controller's device tree node limits the range of DMA addresses that the
> memory clients can use to bits [38:0], ensuring that bit 39 is not used.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Arnd, Rob, Robin,
>=20
> This is what I came up with after our discussion on this thread:
>=20
> 	[PATCH 00/11] of: dma-ranges fixes and improvements
>=20
> Please take a look and see if that sounds reasonable. I'm slightly
> unsure about the interconnects bindings as I used them here. According
> to the bindings there's always supposed to be a pair of interconnect
> paths, so this patch is not exactly compliant. It does work fine with
> the __of_get_dma_parent() code that Maxime introduced a couple of months
> ago and really very neatly describes the hardware. Interestingly this
> will come in handy very soon now since we're starting work on a proper
> interconnect provider (the memory controller driver is the natural fit
> for this because it has additional knobs to configure latency and
> priorities, etc.) to implement external memory frequency scaling based
> on bandwidth requests from memory clients. So this all fits together
> very nicely. But as I said, I'm not exactly sure what to add as a second
> entry in "interconnects" to make this compliant with the bindings.
>=20
> Adding Georgi and Maxime, perhaps they can help clarify.
>=20
> Thierry

Updating Maxime's email address.

Thierry

>  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 32 +++++++++++++++++++++++-
>  1 file changed, 31 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/d=
ts/nvidia/tegra194.dtsi
> index 6900e8bdf24d..f50150217806 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> @@ -53,6 +53,8 @@
>  			clock-names =3D "master_bus", "slave_bus", "rx", "tx", "ptp_ref";
>  			resets =3D <&bpmp TEGRA194_RESET_EQOS>;
>  			reset-names =3D "eqos";
> +			interconnects =3D <&mc TEGRA194_SID_EQOS>;
> +			interconnect-names =3D "dma-mem";
>  			iommus =3D <&smmu TEGRA194_SID_EQOS>;
>  			status =3D "disabled";
> =20
> @@ -166,10 +168,16 @@
>  			};
>  		};
> =20
> -		memory-controller@2c00000 {
> +		mc: memory-controller@2c00000 {
>  			compatible =3D "nvidia,tegra194-mc";
>  			reg =3D <0x02c00000 0xb0000>;
> +			#interconnect-cells =3D <1>;
>  			status =3D "disabled";
> +
> +			#address-cells =3D <2>;
> +			#size-cells =3D <2>;
> +
> +			dma-ranges =3D <0x0 0x0 0x0 0x80 0x0>;
>  		};
> =20
>  		uarta: serial@3100000 {
> @@ -416,6 +424,8 @@
>  			clock-names =3D "sdhci";
>  			resets =3D <&bpmp TEGRA194_RESET_SDMMC1>;
>  			reset-names =3D "sdhci";
> +			interconnects =3D <&mc TEGRA194_SID_SDMMC1>;
> +			interconnect-names =3D "dma-mem";
>  			iommus =3D <&smmu TEGRA194_SID_SDMMC1>;
>  			nvidia,pad-autocal-pull-up-offset-3v3-timeout =3D
>  									<0x07>;
> @@ -439,6 +449,8 @@
>  			clock-names =3D "sdhci";
>  			resets =3D <&bpmp TEGRA194_RESET_SDMMC3>;
>  			reset-names =3D "sdhci";
> +			interconnects =3D <&mc TEGRA194_SID_SDMMC3>;
> +			interconnect-names =3D "dma-mem";
>  			iommus =3D <&smmu TEGRA194_SID_SDMMC3>;
>  			nvidia,pad-autocal-pull-up-offset-1v8 =3D <0x00>;
>  			nvidia,pad-autocal-pull-down-offset-1v8 =3D <0x7a>;
> @@ -467,6 +479,8 @@
>  					  <&bpmp TEGRA194_CLK_PLLC4>;
>  			resets =3D <&bpmp TEGRA194_RESET_SDMMC4>;
>  			reset-names =3D "sdhci";
> +			interconnects =3D <&mc TEGRA194_SID_SDMMC4>;
> +			interconnect-names =3D "dma-mem";
>  			iommus =3D <&smmu TEGRA194_SID_SDMMC4>;
>  			nvidia,pad-autocal-pull-up-offset-hs400 =3D <0x00>;
>  			nvidia,pad-autocal-pull-down-offset-hs400 =3D <0x00>;
> @@ -496,6 +510,8 @@
>  				 <&bpmp TEGRA194_RESET_HDA2HDMICODEC>;
>  			reset-names =3D "hda", "hda2codec_2x", "hda2hdmi";
>  			power-domains =3D <&bpmp TEGRA194_POWER_DOMAIN_DISP>;
> +			interconnects =3D <&mc TEGRA194_SID_HDA>;
> +			interconnect-names =3D "dma-mem";
>  			iommus =3D <&smmu TEGRA194_SID_HDA>;
>  			status =3D "disabled";
>  		};
> @@ -831,6 +847,8 @@
>  			#size-cells =3D <1>;
> =20
>  			ranges =3D <0x15000000 0x15000000 0x01000000>;
> +			interconnects =3D <&mc TEGRA194_SID_HOST1X>;
> +			interconnect-names =3D "dma-mem";
>  			iommus =3D <&smmu TEGRA194_SID_HOST1X>;
> =20
>  			display-hub@15200000 {
> @@ -867,6 +885,8 @@
>  					reset-names =3D "dc";
> =20
>  					power-domains =3D <&bpmp TEGRA194_POWER_DOMAIN_DISP>;
> +					interconnects =3D <&mc TEGRA194_SID_NVDISPLAY>;
> +					interconnect-names =3D "dma-mem";
>  					iommus =3D <&smmu TEGRA194_SID_NVDISPLAY>;
> =20
>  					nvidia,outputs =3D <&sor0 &sor1 &sor2 &sor3>;
> @@ -883,6 +903,8 @@
>  					reset-names =3D "dc";
> =20
>  					power-domains =3D <&bpmp TEGRA194_POWER_DOMAIN_DISPB>;
> +					interconnects =3D <&mc TEGRA194_SID_NVDISPLAY>;
> +					interconnect-names =3D "dma-mem";
>  					iommus =3D <&smmu TEGRA194_SID_NVDISPLAY>;
> =20
>  					nvidia,outputs =3D <&sor0 &sor1 &sor2 &sor3>;
> @@ -899,6 +921,8 @@
>  					reset-names =3D "dc";
> =20
>  					power-domains =3D <&bpmp TEGRA194_POWER_DOMAIN_DISPC>;
> +					interconnects =3D <&mc TEGRA194_SID_NVDISPLAY>;
> +					interconnect-names =3D "dma-mem";
>  					iommus =3D <&smmu TEGRA194_SID_NVDISPLAY>;
> =20
>  					nvidia,outputs =3D <&sor0 &sor1 &sor2 &sor3>;
> @@ -915,6 +939,8 @@
>  					reset-names =3D "dc";
> =20
>  					power-domains =3D <&bpmp TEGRA194_POWER_DOMAIN_DISPC>;
> +					interconnects =3D <&mc TEGRA194_SID_NVDISPLAY>;
> +					interconnect-names =3D "dma-mem";
>  					iommus =3D <&smmu TEGRA194_SID_NVDISPLAY>;
> =20
>  					nvidia,outputs =3D <&sor0 &sor1 &sor2 &sor3>;
> @@ -1182,6 +1208,8 @@
>  			status =3D "disabled";
> =20
>  			power-domains =3D <&bpmp TEGRA194_POWER_DOMAIN_GPU>;
> +			interconnects =3D <&mc TEGRA194_SID_GPU>;
> +			interconnect-names =3D "dma-mem";
>  			iommus =3D <&smmu TEGRA194_SID_GPU>;
>  		};
>  	};
> @@ -1573,6 +1601,8 @@
>  		#clock-cells =3D <1>;
>  		#reset-cells =3D <1>;
>  		#power-domain-cells =3D <1>;
> +		interconnects =3D <&mc TEGRA194_SID_BPMP>;
> +		interconnect-names =3D "dma-mem";
>  		iommus =3D <&smmu TEGRA194_SID_BPMP>;
> =20
>  		bpmp_i2c: i2c {
> --=20
> 2.23.0
>=20

--KsGdsel6WgEHnImy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2UxxYACgkQ3SOs138+
s6H90w//bZEKY7WZ5haT6EvgHThVEHnnfK0i1nsB4u9LW8vGO9lUmyPsxXhVsWGM
gJuBwRJvN1qaGO442VhXgNesJJqXoshEekoziVoNTUtfKjhMoBDwKN0BIgfCI1Nc
TSnFI0k9ZtMeCNucJ2fqOBG1NnEoveror45JCLGXbRsCR/sAtUztYnR7paWv390v
4VdbVIn30T1VR+frlt+hPW/GOjMAIoOXtddqs1G7wGFlIYxrrK3N+NScE3UlWlle
YAhO+ZIo0aVKFh9/ZG66suVVibLzwrHrQNeKOvPqvNNKlhUr9GkOdZVih2ITuhtP
Rgk/GWDqFNnsMRf1KoYMQonn+3HCuxNnnmHw2LL4T1LwdQNGrFXKiy5Fe8C0OM5l
EwLqK75cJjzc5JrNfzDQtCO5B4slpq+sRgIcyHdq09pskOIrbO9ZKKY5qSBgMo7C
fxMKFF594YF9Gf+WZV6FS8+Iirw8FLmuWDuelMzIZOt5TzsNGnW9ZwYg1Cocpsw4
pkxZMF38oBbxD796QvyRk4x5T3JIvoif2qtNJlnO50UEq0zH4PhbShmX3BkELoug
NNuP3zHSmcb13HfcO0TEPtrZaukEF47nEbhE2IC7CaFEAcpPtgoX+qFhr4idt76u
6NYgBmEuPvOYIGzjb8DPR2QJnsXDNTXykEikJeC9fgPGz3m1OU0=
=+8/o
-----END PGP SIGNATURE-----

--KsGdsel6WgEHnImy--


--===============4733415289580164125==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4733415289580164125==--
