From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 07/11] dts: arm64: layerscape: add dma-ranges property to
 qoric-mc node
Date: Mon, 14 Oct 2019 16:28:49 +0800
Message-ID: <20191014082847.GH12262@dragon>
References: <20190924181244.7159-1-nsaenzjulienne@suse.de>
 <20190924181244.7159-8-nsaenzjulienne@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190924181244.7159-8-nsaenzjulienne@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc: robh+dt@kernel.org, devicetree@vger.kernel.org, frowand.list@gmail.com, linux-arm-kernel@lists.infradead.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org, linux-tegra@vger.kernel.org, linux-media@vger.kernel.org, linux-pci@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, mbrugger@suse.com, robin.murphy@arm.com, f.fainelli@gmail.com, james.quinlan@broadcom.com, wahrenst@gmx.net, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

On Tue, Sep 24, 2019 at 08:12:38PM +0200, Nicolas Saenz Julienne wrote:
> qoriq-mc's dpmacs DMA configuration is inherited from their parent node,
> which acts a bus in this regard. So far it maked all devices as
> dma-coherent but no dma-ranges recommendation is made.
> 
> The truth is that the underlying interconnect has DMA constraints, so
> add an empty dma-ranges in qoriq-mc's node in order for DT's DMA
> configuration code to get the DMA constraints from it.
> 
> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

Updated subject prefix as 'arm64: dts: ...', and applied the patch.

Shawn

> ---
> 
>  arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 1 +
>  arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi | 1 +
>  arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 1 +
>  3 files changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> index c676d0771762..f0d0b6145b72 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> @@ -698,6 +698,7 @@
>  			      <0x00000000 0x08340000 0 0x40000>; /* MC control reg */
>  			msi-parent = <&its>;
>  			iommu-map = <0 &smmu 0 0>;	/* This is fixed-up by u-boot */
> +			dma-ranges;
>  			dma-coherent;
>  			#address-cells = <3>;
>  			#size-cells = <1>;
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
> index 7a0be8eaa84a..fd6036b7865c 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
> @@ -340,6 +340,7 @@
>  			      <0x00000000 0x08340000 0 0x40000>; /* MC control reg */
>  			msi-parent = <&its>;
>  			iommu-map = <0 &smmu 0 0>;	/* This is fixed-up by u-boot */
> +			dma-ranges;
>  			dma-coherent;
>  			#address-cells = <3>;
>  			#size-cells = <1>;
> diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> index 408e0ecdce6a..3735bb139cb2 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> @@ -868,6 +868,7 @@
>  			msi-parent = <&its>;
>  			/* iommu-map property is fixed up by u-boot */
>  			iommu-map = <0 &smmu 0 0>;
> +			dma-ranges;
>  			dma-coherent;
>  			#address-cells = <3>;
>  			#size-cells = <1>;
> -- 
> 2.23.0
> 
