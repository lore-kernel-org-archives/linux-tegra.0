From: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH 02/15] ARM: tegra: apalis-tk1: reorder pcie properties
Date: Thu, 26 Jul 2018 09:19:27 +0200
Message-ID: <0de82cabf0585608a5b7f8316f59c054@agner.ch>
References: <20180724104309.21741-1-marcel@ziswiler.com>
 <20180724104309.21741-3-marcel@ziswiler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180724104309.21741-3-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel@ziswiler.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mark Rutland <mark.rutland@arm.com>, linux-tegra-owner@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 24.07.2018 12:42, Marcel Ziswiler wrote:
> From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> 
> Reorder PCIe properties.

Hm, first vs. last property, as far as I can tell there is no official
recommendation. Maybe Rob can comment on that?

Most device trees put status last, also the base device trees
tegra30.dtsi/tegra124.dtsi. So I think in this case we should go with
last property (before subnodes).

--
Stefan

> 
> Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> 
> ---
> 
>  arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi | 2 +-
>  arch/arm/boot/dts/tegra124-apalis.dtsi      | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
> b/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
> index 09e3641258ae..cb7e53c86408 100644
> --- a/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
> +++ b/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
> @@ -39,9 +39,9 @@
>  
>  		/* I210 Gigabit Ethernet Controller (On-module) */
>  		pci@2,0 {
> +			status = "okay";
>  			phys = <&{/padctl@7009f000/pads/pcie/lanes/pcie-2}>;
>  			phy-names = "pcie-0";
> -			status = "okay";
>  
>  			pcie@0 {
>  				reg = <0 0 0 0 0>;
> diff --git a/arch/arm/boot/dts/tegra124-apalis.dtsi
> b/arch/arm/boot/dts/tegra124-apalis.dtsi
> index 5e7ae5e92fb8..d73ee974648a 100644
> --- a/arch/arm/boot/dts/tegra124-apalis.dtsi
> +++ b/arch/arm/boot/dts/tegra124-apalis.dtsi
> @@ -74,9 +74,9 @@
>  
>  		/* I210 Gigabit Ethernet Controller (On-module) */
>  		pci@2,0 {
> +			status = "okay";
>  			phys = <&{/padctl@7009f000/pads/pcie/lanes/pcie-2}>;
>  			phy-names = "pcie-0";
> -			status = "okay";
>  
>  			pcie@0 {
>  				reg = <0 0 0 0 0>;
