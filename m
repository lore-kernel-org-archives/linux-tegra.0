From: Andrew Murray <andrew.murray@arm.com>
Subject: Re: [PATCH V3 1/6] dt-bindings: PCI: tegra: Add sideband pins
 configuration entries
Date: Mon, 2 Sep 2019 11:40:10 +0100
Message-ID: <20190902104009.GB9720@e119886-lin.cambridge.arm.com>
References: <20190828172850.19871-1-vidyas@nvidia.com>
 <20190828172850.19871-2-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190828172850.19871-2-vidyas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vidya Sagar <vidyas@nvidia.com>
Cc: lorenzo.pieralisi@arm.com, bhelgaas@google.com, robh+dt@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com, kishon@ti.com, gustavo.pimentel@synopsys.com, digetx@gmail.com, mperttunen@nvidia.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org

On Wed, Aug 28, 2019 at 10:58:45PM +0530, Vidya Sagar wrote:
> Add optional bindings "pinctrl-names" and "pinctrl-0" to describe pin
> configuration information of a particular PCIe controller.
> 
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>

Reviewed-by: Andrew Murray <andrew.murray@arm.com>

> ---
> V3:
> * None
> 
> V2:
> * None
> 
>  .../devicetree/bindings/pci/nvidia,tegra194-pcie.txt      | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/nvidia,tegra194-pcie.txt b/Documentation/devicetree/bindings/pci/nvidia,tegra194-pcie.txt
> index 674e5adb2895..0ac1b867ac24 100644
> --- a/Documentation/devicetree/bindings/pci/nvidia,tegra194-pcie.txt
> +++ b/Documentation/devicetree/bindings/pci/nvidia,tegra194-pcie.txt
> @@ -83,6 +83,11 @@ Required properties:
>  - vddio-pex-ctl-supply: Regulator supply for PCIe side band signals
>  
>  Optional properties:
> +- pinctrl-names: A list of pinctrl state names.
> +  It is mandatory for C5 controller and optional for other controllers.
> +  - "default": Configures PCIe I/O for proper operation.
> +- pinctrl-0: phandle for the 'default' state of pin configuration.
> +  It is mandatory for C5 controller and optional for other controllers.
>  - supports-clkreq: Refer to Documentation/devicetree/bindings/pci/pci.txt
>  - nvidia,update-fc-fixup: This is a boolean property and needs to be present to
>      improve performance when a platform is designed in such a way that it
> @@ -120,6 +125,9 @@ Tegra194:
>  		num-lanes = <8>;
>  		linux,pci-domain = <0>;
>  
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pex_rst_c5_out_state>, <&clkreq_c5_bi_dir_state>;
> +
>  		clocks = <&bpmp TEGRA194_CLK_PEX0_CORE_0>;
>  		clock-names = "core";
>  
> -- 
> 2.17.1
> 
