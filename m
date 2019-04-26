From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V5 07/16] dt-bindings: PCI: designware: Add binding for
 CDM register check
Date: Fri, 26 Apr 2019 09:32:47 -0500
Message-ID: <20190426143247.GA25107@bogus>
References: <20190424052004.6270-1-vidyas@nvidia.com>
 <20190424052004.6270-8-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190424052004.6270-8-vidyas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vidya Sagar <vidyas@nvidia.com>
Cc: lorenzo.pieralisi@arm.com, bhelgaas@google.com, mark.rutland@arm.com, thierry.reding@gmail.com, jonathanh@nvidia.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, mperttunen@nvidia.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org

On Wed, Apr 24, 2019 at 10:49:55AM +0530, Vidya Sagar wrote:
> Add support to enable CDM (Configuration Dependent Module) registers check
> for any data corruption. CDM registers include standard PCIe configuration
> space registers, Port Logic registers and iATU and DMA registers.
> Refer Section S.4 of Synopsys DesignWare Cores PCI Express Controller Databook
> Version 4.90a
> 
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> ---
> Changes since [v4]:
> * None
> 
> Changes since [v3]:
> * None
> 
> Changes since [v2]:
> * Changed flag name from 'cdm-check' to 'enable-cdm-check'
> * Added info about Port Logic and DMA registers being part of CDM
> 
> Changes since [v1]:
> * This is a new patch in v2 series
> 
>  Documentation/devicetree/bindings/pci/designware-pcie.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/designware-pcie.txt b/Documentation/devicetree/bindings/pci/designware-pcie.txt
> index 5561a1c060d0..85b872c42a9f 100644
> --- a/Documentation/devicetree/bindings/pci/designware-pcie.txt
> +++ b/Documentation/devicetree/bindings/pci/designware-pcie.txt
> @@ -34,6 +34,11 @@ Optional properties:
>  - clock-names: Must include the following entries:
>  	- "pcie"
>  	- "pcie_bus"
> +- enable-cdm-check: This is a boolean property and if present enables

This needs a vendor prefix.

> +   automatic checking of CDM (Configuration Dependent Module) registers
> +   for data corruption. CDM registers include standard PCIe configuration
> +   space registers, Port Logic registers, DMA and iATU (internal Address
> +   Translation Unit) registers.
>  RC mode:
>  - num-viewport: number of view ports configured in hardware. If a platform
>    does not specify it, the driver assumes 2.
> -- 
> 2.17.1
> 
