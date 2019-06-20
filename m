From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH V10 10/15] dt-bindings: PHY: P2U: Add Tegra194 P2U block
Date: Thu, 20 Jun 2019 12:52:16 +0530
Message-ID: <1ecf61d7-5535-4f07-5e1e-5d492f4194da@ti.com>
References: <20190612095339.20118-1-vidyas@nvidia.com>
 <20190612095339.20118-11-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190612095339.20118-11-vidyas@nvidia.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vidya Sagar <vidyas@nvidia.com>, lorenzo.pieralisi@arm.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, jonathanh@nvidia.com, catalin.marinas@arm.com, will.deacon@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com
Cc: devicetree@vger.kernel.org, mmaddireddy@nvidia.com, kthota@nvidia.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, linux-tegra@vger.kernel.org, digetx@gmail.com, linux-arm-kernel@lists.infradead.org, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org



On 12/06/19 3:23 PM, Vidya Sagar wrote:
> Add support for Tegra194 P2U (PIPE to UPHY) module block which is a glue
> module instantiated one for each PCIe lane between Synopsys DesignWare core
> based PCIe IP and Universal PHY block.
> 
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Acked-by: Thierry Reding <treding@nvidia.com>

Acked-by: Kishon Vijay Abraham I <kishon@ti.com>
> ---
> Changes since [v9]:
> * None
> 
> Changes since [v8]:
> * None
> 
> Changes since [v7]:
> * None
> 
> Changes since [v6]:
> * None
> 
> Changes since [v5]:
> * Added Sob
> * Changed node name from "p2u@xxxxxxxx" to "phy@xxxxxxxx"
> 
> Changes since [v4]:
> * None
> 
> Changes since [v3]:
> * None
> 
> Changes since [v2]:
> * Changed node label to reflect new format that includes either 'hsio' or
>   'nvhs' in its name to reflect which UPHY brick they belong to
> 
> Changes since [v1]:
> * This is a new patch in v2 series
> 
>  .../bindings/phy/phy-tegra194-p2u.txt         | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/phy-tegra194-p2u.txt
> 
> diff --git a/Documentation/devicetree/bindings/phy/phy-tegra194-p2u.txt b/Documentation/devicetree/bindings/phy/phy-tegra194-p2u.txt
> new file mode 100644
> index 000000000000..d23ff90baad5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/phy-tegra194-p2u.txt
> @@ -0,0 +1,28 @@
> +NVIDIA Tegra194 P2U binding
> +
> +Tegra194 has two PHY bricks namely HSIO (High Speed IO) and NVHS (NVIDIA High
> +Speed) each interfacing with 12 and 8 P2U instances respectively.
> +A P2U instance is a glue logic between Synopsys DesignWare Core PCIe IP's PIPE
> +interface and PHY of HSIO/NVHS bricks. Each P2U instance represents one PCIe
> +lane.
> +
> +Required properties:
> +- compatible: For Tegra19x, must contain "nvidia,tegra194-p2u".
> +- reg: Should be the physical address space and length of respective each P2U
> +       instance.
> +- reg-names: Must include the entry "ctl".
> +
> +Required properties for PHY port node:
> +- #phy-cells: Defined by generic PHY bindings.  Must be 0.
> +
> +Refer to phy/phy-bindings.txt for the generic PHY binding properties.
> +
> +Example:
> +
> +p2u_hsio_0: phy@3e10000 {
> +	compatible = "nvidia,tegra194-p2u";
> +	reg = <0x03e10000 0x10000>;
> +	reg-names = "ctl";
> +
> +	#phy-cells = <0>;
> +};
> 
