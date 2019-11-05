From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/2] arm64: tegra: Set dma-ranges for memory subsystem
Date: Tue, 5 Nov 2019 16:46:51 -0600
Message-ID: <20191105224651.GA342@bogus>
References: <20191103115415.6532-1-thierry.reding@gmail.com>
 <20191103115415.6532-2-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20191103115415.6532-2-thierry.reding@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org, Mikko Perttunen <cyndis@kapsi.fi>, Arnd Bergmann <arnd@arndb.de>, Maxime Ripard <mripard@kernel.org>, Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>, Georgi Djakov <georgi.djakov@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On Sun, Nov 03, 2019 at 12:54:15PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> On Tegra194, all clients of the memory subsystem can generally address
> 40 bits of system memory. However, bit 39 has special meaning and will
> cause the memory controller to reorder sectors for block-linear buffer
> formats. This is primarily useful for graphics-related devices.
> 
> Use of bit 39 must be controlled on a case-by-case basis. Buffers that
> are used with bit 39 set by one device may be used with bit 39 cleared
> by other devices.
> 
> Care must be taken to allocate buffers at addresses that do not require
> bit 39 to be set. This is normally not an issue for system memory since
> there are no Tegra-based systems with enough RAM to exhaust the 39-bit
> physical address space. However, when a device is behind an IOMMU, such
> as the ARM SMMU on Tegra194, the IOMMUs input address space can cause
> IOVA allocations to happen in this region. This is for example the case
> when an operating system implements a top-down allocation policy for IO
> virtual addresses.
> 
> To account for this, describe the path that memory accesses take through
> the system. Memory clients will send requests to the memory controller,
> which forwards bits [38:0] of the address either to the external memory
> controller or the SMMU, depending on the stream ID of the access. A good
> way to describe this is using the interconnects bindings, see:
> 
> 	Documentation/devicetree/bindings/interconnect/interconnect.txt
> 
> The standard "dma-mem" path is used to describe the path towards system
> memory via the memory controller. A dma-ranges property in the memory
> controller's device tree node limits the range of DMA addresses that the
> memory clients can use to bits [38:0], ensuring that bit 39 is not used.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v2:
> - use memory client IDs instead of stream IDs (Mikko Perttunen)
> 
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 55 +++++++++++++++++++++++-
>  1 file changed, 54 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> index 084abe2e3267..64800ad52e19 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> @@ -53,6 +53,9 @@
>  			clock-names = "master_bus", "slave_bus", "rx", "tx", "ptp_ref";
>  			resets = <&bpmp TEGRA194_RESET_EQOS>;
>  			reset-names = "eqos";
> +			interconnects = <&mc TEGRA194_MEMORY_CLIENT_EQOSR>,
> +					<&mc TEGRA194_MEMORY_CLIENT_EQOSW>;
> +			interconnect-names = "dma-mem";
>  			iommus = <&smmu TEGRA194_SID_EQOS>;
>  			status = "disabled";
>  
> @@ -166,10 +169,16 @@
>  			};
>  		};
>  
> -		memory-controller@2c00000 {
> +		mc: memory-controller@2c00000 {
>  			compatible = "nvidia,tegra194-mc";
>  			reg = <0x02c00000 0xb0000>;
> +			#interconnect-cells = <1>;

Needs to be documented?

>  			status = "disabled";
> +
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +
> +			dma-ranges = <0x0 0x0 0x0 0x80 0x0>;
>  		};
>  
>  		uarta: serial@3100000 {
> @@ -416,6 +425,9 @@
>  			clock-names = "sdhci";
>  			resets = <&bpmp TEGRA194_RESET_SDMMC1>;
>  			reset-names = "sdhci";
> +			interconnects = <&mc TEGRA194_MEMORY_CLIENT_SDMMCRA>,
> +					<&mc TEGRA194_MEMORY_CLIENT_SDMMCWA>;
> +			interconnect-names = "dma-mem";

And this?

>  			iommus = <&smmu TEGRA194_SID_SDMMC1>;
>  			nvidia,pad-autocal-pull-up-offset-3v3-timeout =
>  									<0x07>;
> @@ -439,6 +451,9 @@
>  			clock-names = "sdhci";
>  			resets = <&bpmp TEGRA194_RESET_SDMMC3>;
>  			reset-names = "sdhci";
> +			interconnects = <&mc TEGRA194_MEMORY_CLIENT_SDMMCR>,
> +					<&mc TEGRA194_MEMORY_CLIENT_SDMMCW>;
> +			interconnect-names = "dma-mem";

And ...

>  			iommus = <&smmu TEGRA194_SID_SDMMC3>;
>  			nvidia,pad-autocal-pull-up-offset-1v8 = <0x00>;
>  			nvidia,pad-autocal-pull-down-offset-1v8 = <0x7a>;
> @@ -467,6 +482,9 @@
>  					  <&bpmp TEGRA194_CLK_PLLC4>;
>  			resets = <&bpmp TEGRA194_RESET_SDMMC4>;
>  			reset-names = "sdhci";
> +			interconnects = <&mc TEGRA194_MEMORY_CLIENT_SDMMCRAB>,
> +					<&mc TEGRA194_MEMORY_CLIENT_SDMMCWAB>;
> +			interconnect-names = "dma-mem";
>  			iommus = <&smmu TEGRA194_SID_SDMMC4>;
>  			nvidia,pad-autocal-pull-up-offset-hs400 = <0x00>;
>  			nvidia,pad-autocal-pull-down-offset-hs400 = <0x00>;
> @@ -496,6 +514,9 @@
>  				 <&bpmp TEGRA194_RESET_HDA2HDMICODEC>;
>  			reset-names = "hda", "hda2codec_2x", "hda2hdmi";
>  			power-domains = <&bpmp TEGRA194_POWER_DOMAIN_DISP>;
> +			interconnects = <&mc TEGRA194_MEMORY_CLIENT_HDAR>,
> +					<&mc TEGRA194_MEMORY_CLIENT_HDAW>;
> +			interconnect-names = "dma-mem";
>  			iommus = <&smmu TEGRA194_SID_HDA>;
>  			status = "disabled";
>  		};
> @@ -831,6 +852,8 @@
>  			#size-cells = <1>;
>  
>  			ranges = <0x15000000 0x15000000 0x01000000>;
> +			interconnects = <&mc TEGRA194_MEMORY_CLIENT_HOST1XDMAR>;
> +			interconnect-names = "dma-mem";
>  			iommus = <&smmu TEGRA194_SID_HOST1X>;
>  
>  			display-hub@15200000 {
> @@ -867,6 +890,9 @@
>  					reset-names = "dc";
>  
>  					power-domains = <&bpmp TEGRA194_POWER_DOMAIN_DISP>;
> +					interconnects = <&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR>,
> +							<&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR1>;
> +					interconnect-names = "dma-mem";
>  					iommus = <&smmu TEGRA194_SID_NVDISPLAY>;
>  
>  					nvidia,outputs = <&sor0 &sor1 &sor2 &sor3>;
> @@ -883,6 +909,9 @@
>  					reset-names = "dc";
>  
>  					power-domains = <&bpmp TEGRA194_POWER_DOMAIN_DISPB>;
> +					interconnects = <&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR>,
> +							<&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR1>;
> +					interconnect-names = "dma-mem";
>  					iommus = <&smmu TEGRA194_SID_NVDISPLAY>;
>  
>  					nvidia,outputs = <&sor0 &sor1 &sor2 &sor3>;
> @@ -899,6 +928,9 @@
>  					reset-names = "dc";
>  
>  					power-domains = <&bpmp TEGRA194_POWER_DOMAIN_DISPC>;
> +					interconnects = <&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR>,
> +							<&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR1>;
> +					interconnect-names = "dma-mem";
>  					iommus = <&smmu TEGRA194_SID_NVDISPLAY>;
>  
>  					nvidia,outputs = <&sor0 &sor1 &sor2 &sor3>;
> @@ -915,6 +947,9 @@
>  					reset-names = "dc";
>  
>  					power-domains = <&bpmp TEGRA194_POWER_DOMAIN_DISPC>;
> +					interconnects = <&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR>,
> +							<&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR1>;
> +					interconnect-names = "dma-mem";
>  					iommus = <&smmu TEGRA194_SID_NVDISPLAY>;
>  
>  					nvidia,outputs = <&sor0 &sor1 &sor2 &sor3>;
> @@ -1182,6 +1217,19 @@
>  			status = "disabled";
>  
>  			power-domains = <&bpmp TEGRA194_POWER_DOMAIN_GPU>;
> +			interconnects = <&mc TEGRA194_MEMORY_CLIENT_NVL1R>,
> +					<&mc TEGRA194_MEMORY_CLIENT_NVL1RHP>,
> +					<&mc TEGRA194_MEMORY_CLIENT_NVL1W>,
> +					<&mc TEGRA194_MEMORY_CLIENT_NVL2R>,
> +					<&mc TEGRA194_MEMORY_CLIENT_NVL2RHP>,
> +					<&mc TEGRA194_MEMORY_CLIENT_NVL2W>,
> +					<&mc TEGRA194_MEMORY_CLIENT_NVL3R>,
> +					<&mc TEGRA194_MEMORY_CLIENT_NVL3RHP>,
> +					<&mc TEGRA194_MEMORY_CLIENT_NVL3W>,
> +					<&mc TEGRA194_MEMORY_CLIENT_NVL4R>,
> +					<&mc TEGRA194_MEMORY_CLIENT_NVL4RHP>,
> +					<&mc TEGRA194_MEMORY_CLIENT_NVL4W>;
> +			interconnect-names = "dma-mem";
>  			iommus = <&smmu TEGRA194_SID_GPU>;
>  		};
>  	};
> @@ -1567,6 +1615,11 @@
>  		#clock-cells = <1>;
>  		#reset-cells = <1>;
>  		#power-domain-cells = <1>;
> +		interconnects = <&mc TEGRA194_MEMORY_CLIENT_BPMPR>,
> +				<&mc TEGRA194_MEMORY_CLIENT_BPMPW>,
> +				<&mc TEGRA194_MEMORY_CLIENT_BPMPDMAR>,
> +				<&mc TEGRA194_MEMORY_CLIENT_BPMPDMAW>;
> +		interconnect-names = "dma-mem";
>  		iommus = <&smmu TEGRA194_SID_BPMP>;
>  
>  		bpmp_i2c: i2c {
> -- 
> 2.23.0
> 
