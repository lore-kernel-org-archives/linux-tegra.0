Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61BA29D288;
	Fri,  6 Mar 2026 00:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772756379; cv=none; b=BL7+VINjeZtqy4wQgtRxTrEaDJEwDqGya+ysMmrvi+hee/7kq9fZOtzeCK3O5R2ifa6xn38WiS+BOLCaZmZmHTaTn1s32MuufnLBJUn1/lpHFxawWnpzafMM5lbzGQt7cF3Hwcf40EOPNSoSRLLoG+W46zOgaFLDrdGRuZ3u0wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772756379; c=relaxed/simple;
	bh=6T5IVMWW4oGU1kEs72kHW+WBaHdO1Xmpb15aUvBuApQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EfvieMs2BglT/+QOSAiqNC8in9xOH9SclligGKw4+9nFFG2Gde1xVhm2XUAG2ZePqivgdU8AeC9IEItLyJ6Gma0WhSHOJTkMMs02UGJoEKy+lWs+/tXxs3TSfUy1srxpoI7QlXalq9eY3YPuCGKwJOTiHnFKr/DQhyuLmwHQ2kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B5/4YzUl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B5/4YzUl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37501C116C6;
	Fri,  6 Mar 2026 00:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772756379;
	bh=6T5IVMWW4oGU1kEs72kHW+WBaHdO1Xmpb15aUvBuApQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B5/4YzUl6quNlgtmbPsbj08Yyl3QFEeZ9MeX/y+m9DE3ietvKi+Pai9L+9rs/Bs5s
	 9I3+SgMgC/cd4O3uMKNdS3w7TDwYhY6J82idSVD2fmn6JvhZlxK0jGekHUAu4gfMjI
	 HMUfk3r/QgKeiyT/fynZAp+ILPB1a5HKtXd9mphQ4PZjsIZEfzEGcqlLu7IQkrUnpT
	 P9kWzKuNBc0tgWY2XSyWWwwZcJujXO2qctzNbGOLDLMuzv72Ql2XDFKu+2EO8RPDFv
	 VlnSF2m0dHKHkkvjqf9X37Q9CN61D5s/otsQcPhEIcqqNQd/Y344Ipfb9ObSl7RYwU
	 tXL3s/T+e6+Ng==
Date: Thu, 5 Mar 2026 18:19:38 -0600
From: Rob Herring <robh@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH 02/10] dt-bindings: pci: tegra: Convert to json-schema
Message-ID: <20260306001938.GA818541-robh@kernel.org>
References: <20260223143305.3771383-1-thierry.reding@kernel.org>
 <20260223143305.3771383-3-thierry.reding@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223143305.3771383-3-thierry.reding@kernel.org>

On Mon, Feb 23, 2026 at 03:32:57PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the Tegra PCIe controller bindings from the free-form text
> format to json-schema.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v5:
> - drop unneeded quotes
> 
> Changes in v4:
> - remove path references
> - use dual licensing
> 
> Changes in v3:
> - fixup reference in MAINTAINERS
> 
> Changes in v2:
> - drop description properties where they don't add information
> - drop redundant $ref properties
> 
>  .../bindings/pci/nvidia,tegra20-pcie.txt      | 670 --------------
>  .../bindings/pci/nvidia,tegra20-pcie.yaml     | 851 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +-
>  3 files changed, 852 insertions(+), 671 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
>  create mode 100644 Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.yaml


> diff --git a/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.yaml b/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.yaml
> new file mode 100644
> index 000000000000..cfa8c27f6e9d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.yaml
> @@ -0,0 +1,851 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pci/nvidia,tegra20-pcie.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra PCIe controller
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Jon Hunter <jonathanh@nvidia.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - nvidia,tegra20-pcie
> +          - nvidia,tegra30-pcie
> +          - nvidia,tegra124-pcie
> +          - nvidia,tegra210-pcie
> +          - nvidia,tegra186-pcie
> +
> +      - items:
> +          - const: nvidia,tegra132-pcie
> +          - const: nvidia,tegra124-pcie
> +
> +  reg:
> +    items:
> +      - description: PADS registers
> +      - description: AFI registers
> +      - description: configuration space region
> +
> +  reg-names:
> +    items:
> +      - const: pads
> +      - const: afi
> +      - const: cs
> +
> +  interrupts:
> +    items:
> +      - description: PCIe controller interrupt
> +      - description: MSI controller interrupt
> +
> +  interrupt-names:
> +    items:
> +      - const: intr
> +      - const: msi
> +
> +  "#address-cells":
> +    description: |
> +      Address representation for root ports. Cell 0 specifies the bus and
> +      device numbers of the root port:
> +
> +        [23:16]: bus number
> +        [15:11]: device number
> +
> +      Cell 1 denotes the upper 32 address bits and should be 0, while cell 2
> +      contains the lower 32 address bits and is used to translate to the CPU
> +      address space.
> +    const: 3
> +
> +  "#size-cells":
> +    const: 2

pci-host-bridge.yaml has both of these properties. Drop.

> +
> +  clocks:
> +    items:
> +      - description: AFI interface clock
> +      - description: PCI controller clock
> +      - description: reference PLL clock
> +      - description: CML clock
> +    minItems: 3
> +
> +  clock-names:
> +    items:
> +      - const: pex
> +      - const: afi
> +      - const: pll_e
> +      - const: cml
> +    minItems: 3
> +
> +  resets:
> +    items:
> +      - description: AFI interface reset
> +      - description: PCI controller reset
> +      - description: PCI bus reset
> +
> +  reset-names:
> +    items:
> +      - const: pex
> +      - const: afi
> +      - const: pcie_x
> +
> +  interconnects:
> +    items:
> +      - description: AFI memory read client
> +      - description: AFI memory write client
> +
> +  interconnect-names:
> +    items:
> +      - const: dma-mem # read
> +      - const: write
> +
> +  iommus:
> +    maxItems: 1
> +
> +  operating-points-v2:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +
> +  power-domains:
> +    items:
> +      - description: phandle to the core power domain
> +
> +  pinctrl-names:
> +    items:
> +        # active state, puts PCIe I/O out of deep power down state
> +      - const: default
> +        # puts PCIe I/O into deep power down state
> +      - const: idle
> +
> +patternProperties:
> +  "^pci@1?[0-9a-f](,[0-7])?$":
> +    description: Root ports are defined as subnodes of the PCIe controller
> +      node.
> +
> +      Note that devices on the PCI bus are dynamically discovered using PCI's
> +      bus enumeration and therefore don't need corresponding device nodes in
> +      DT. However if a device on the PCI bus provides a non-probeable bus such
> +      as I2C or SPI, device nodes need to be added in order to allow the bus'
> +      children to be instantiated at the proper location in the operating
> +      system's device tree (as illustrated by the optional nodes in the
> +      examples below).
> +
> +    type: object

       $ref: /schemas/pci-pci-bridge.yaml#
       unevaluatedProperties: false

> +    properties:
> +      device_type:
> +        const: pci
> +
> +      assigned-addresses:
> +        description: Address and size of the port configuration registers

I think this should be 'reg' as the config registers aren't assignable.

> +
> +      "#address-cells":
> +        const: 3
> +
> +      "#size-cells":
> +        const: 2
> +
> +      ranges:
> +        description: Sub-ranges distributed from the PCIe controller node. An
> +          empty property is sufficient.

Drop all the above.

> +
> +      nvidia,num-lanes:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: |
> +          Number of lanes to use for this port. Valid combinations
> +          are:
> +
> +          - Root port 0 uses 4 lanes, root port 1 is unused.
> +          - Both root ports use 2 lanes.

enum: [ 1, 2, 4 ]

> +
> +required:
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - interrupt-names
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +
> +unevaluatedProperties: false
> +
> +allOf:
> +  - $ref: /schemas/pinctrl/pinctrl-consumer.yaml
> +  - $ref: /schemas/pci/pci-bus.yaml

Deprecated. Use pci-host-bridge.yaml instead.

> +  - $ref: pci-iommu.yaml
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: nvidia,tegra20-pcie
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 3
> +
> +        clock-names:
> +          maxItems: 3
> +
> +        avdd-pex-supply:
> +          description: Power supply for analog PCIe logic. Must supply 1.05 V.
> +
> +        vdd-pex-supply:
> +          description: Power supply for digital PCIe I/O. Must supply 1.05 V.
> +
> +        avdd-pex-pll-supply:
> +          description: Power supply for dedicated (internal) PCIe PLL. Must
> +            supply 1.05 V.
> +
> +        avdd-plle-supply:
> +          description: Power supply for PLLE, which is shared with SATA. Must
> +            supply 1.05 V.
> +
> +        vddio-pex-clk-supply:
> +          description: Power supply for PCIe clock. Must supply 3.3 V.
> +
> +      required:
> +        - avdd-pex-supply
> +        - vdd-pex-supply
> +        - avdd-pex-pll-supply
> +        - avdd-plle-supply
> +        - vddio-pex-clk-supply
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: nvidia,tegra30-pcie
> +    then:
> +      properties:
> +        avdd-pex-pll-supply:
> +          description: Power supply for dedicated (internal) PCIe PLL. Must
> +            supply 1.05 V.
> +
> +        avdd-plle-supply:
> +          description: Power supply for PLLE, which is shared with SATA. Must
> +            supply 1.05 V.
> +
> +        vddio-pex-ctl-supply:
> +          description: Power supply for PCIe control I/O partition. Must
> +            supply 1.8 V.
> +
> +        hvdd-pex-supply:
> +          description: High-voltage supply for PCIe I/O and PCIe output
> +            clocks. Must supply 3.3 V.
> +
> +        avdd-pexa-supply:
> +          description: Power supply for analog PCIe logic. Must supply 1.05 V.
> +            Required if lanes 0 through 3 are used.
> +
> +        vdd-pexa-supply:
> +          description: Power supply for digital PCIe I/O. Must supply 1.05 V.
> +            Required if lanes 0 through 3 are used.
> +
> +        avdd-pexb-supply:
> +          description: Power supply for analog PCIe logic. Must supply 1.05 V.
> +            Required if lanes 4 and 5 are used.
> +
> +        vdd-pexb-supply:
> +          description: Power supply for digital PCIe I/O. Must supply 1.05 V.
> +            Required if lanes 4 and 5 are used.
> +
> +      required:
> +        - avdd-pex-pll-supply
> +        - avdd-plle-supply
> +        - vddio-pex-ctl-supply
> +        - hvdd-pex-supply
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: nvidia,tegra124-pcie
> +    then:
> +      properties:
> +        phys:
> +          $ref: /schemas/types.yaml#/definitions/phandle-array

phys already has a type. How many entries?

> +          deprecated: true
> +
> +        phy-names:
> +          items:
> +            - const: pcie
> +          deprecated: true
> +
> +        avddio-pex-supply:
> +          description: Power supply for analog PCIe logic. Must supply 1.05 V.
> +
> +        dvddio-pex-supply:
> +          description: Power supply for digital PCIe I/O. Must supply 1.05 V.
> +
> +        hvdd-pex-supply:
> +          description: High-voltage supply for PCIe I/O and PCIe output
> +            clocks. Must supply 3.3 V.
> +
> +        vddio-pex-ctl-supply:
> +          description: Power supply for PCIe control I/O partition. Must
> +            supply 2.8-3.3 V.
> +
> +        avdd-pex-pll-supply:
> +          deprecated: true
> +
> +        hvdd-pex-pll-e-supply:
> +          deprecated: true
> +
> +        avdd-pll-erefe-supply:
> +          deprecated: true
> +
> +      required:
> +        - avddio-pex-supply
> +        - dvddio-pex-supply
> +        - hvdd-pex-supply
> +        - vddio-pex-ctl-supply
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: nvidia,tegra210-pcie
> +    then:
> +      properties:
> +        hvddio-pex-supply:
> +          description: High-voltage supply for PCIe I/O and PCIe output
> +            clocks. Must supply 1.8 V.
> +
> +        dvddio-pex-supply:
> +          description: Power supply for digital PCIe I/O. Must supply 1.05 V.
> +
> +        vddio-pex-ctl-supply:
> +          description: Power supply for PCIe control I/O partition. Must
> +            supply 1.8 V.
> +
> +        avdd-pll-uerefe-supply:
> +          deprecated: true
> +
> +        dvdd-pex-pll-supply:
> +          deprecated: true
> +
> +        hvdd-pex-pll-e-supply:
> +          deprecated: true
> +
> +      required:
> +        - hvddio-pex-supply
> +        - dvddio-pex-supply
> +        - vddio-pex-ctl-supply
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: nvidia,tegra186-pcie
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 3
> +
> +        clock-names:
> +          maxItems: 3
> +
> +        power-domains:
> +          description: To ungate power partition by BPMP powergate driver.
> +            Must contain BPMP phandle and PCIe power partition ID.
> +
> +        dvdd-pex-supply:
> +          description: Power supply for digital PCIe I/O. Must supply 1.05 V.
> +
> +        hvdd-pex-pll-supply:
> +          description: High-voltage supply for PLLE (shared with USB3). Must
> +            supply 1.8 V.
> +
> +        hvdd-pex-supply:
> +          description: High-voltage supply for PCIe I/O and PCIe output
> +            clocks. Must supply 1.8 V.
> +
> +        vddio-pexctl-aud-supply:
> +          description: Power supply for PCIe side band signals. Must supply
> +            1.8 V.
> +
> +      required:
> +        - dvdd-pex-supply
> +        - hvdd-pex-pll-supply
> +        - hvdd-pex-supply
> +        - vddio-pexctl-aud-supply
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - nvidia,tegra124-pcie
> +              - nvidia,tegra210-pcie
> +              - nvidia,tegra186-pcie
> +    then:
> +      patternProperties:
> +        "^pci@1?[0-9a-f](,[0-7])?$":

             $ref: /schemas/pci/pci-pci-bridge.yaml
             unevaluatedProperties: false

But really, this should all be moved to the main schema above, and then 
just use if/then schema to disallow these properties where they don't 
apply.

> +          properties:
> +            phys:
> +              $ref: /schemas/types.yaml#/definitions/phandle-array

Already has a type.

How many entries?

> +              description: Must contain an phandle to a PHY for each entry in
> +                phy-names.
> +
> +            phy-names:
> +              $ref: /schemas/types.yaml#/definitions/string-array

Already has a type.

> +              description: Must include an entry for each active lane. Note
> +                that the number of entries does not have to (though usually
> +                will) be equal to the specified number of lanes in the
> +                nvidia,num-lanes property. Entries are of the form "pcie-N",
> +                where N ranges from 0 to the value specified in
> +                nvidia,num-lanes.

Sounds like constraints.

> +
> +examples:
> +  # Tegra20
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    pcie@80003000 {
> +        compatible = "nvidia,tegra20-pcie";
> +        device_type = "pci";
> +        reg = <0x80003000 0x00000800>, /* PADS registers */
> +              <0x80003800 0x00000200>, /* AFI registers */
> +              <0x90000000 0x10000000>; /* configuration space */
> +        reg-names = "pads", "afi", "cs";
> +        interrupts = <0 98 0x04>, /* controller interrupt */
> +                     <0 99 0x04>; /* MSI interrupt */
> +        interrupt-names = "intr", "msi";
> +
> +        #interrupt-cells = <1>;
> +        interrupt-map-mask = <0 0 0 0>;
> +        interrupt-map = <0 0 0 0 &intc GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
> +
> +        bus-range = <0x00 0xff>;
> +        #address-cells = <3>;
> +        #size-cells = <2>;
> +
> +        ranges = <0x02000000 0 0x80000000 0x80000000 0 0x00001000>, /* port 0 registers */
> +                 <0x02000000 0 0x80001000 0x80001000 0 0x00001000>, /* port 1 registers */
> +                 <0x01000000 0 0          0x82000000 0 0x00010000>, /* downstream I/O */
> +                 <0x02000000 0 0xa0000000 0xa0000000 0 0x10000000>, /* non-prefetchable memory */
> +                 <0x42000000 0 0xb0000000 0xb0000000 0 0x10000000>; /* prefetchable memory */
> +
> +        clocks = <&tegra_car 70>, <&tegra_car 72>, <&tegra_car 118>;
> +        clock-names = "pex", "afi", "pll_e";
> +        resets = <&tegra_car 70>, <&tegra_car 72>, <&tegra_car 74>;
> +        reset-names = "pex", "afi", "pcie_x";
> +        status = "okay";
> +
> +        avdd-pex-supply = <&pci_vdd_reg>;
> +        vdd-pex-supply = <&pci_vdd_reg>;
> +        avdd-pex-pll-supply = <&pci_vdd_reg>;
> +        avdd-plle-supply = <&pci_vdd_reg>;
> +        vddio-pex-clk-supply = <&pci_clk_reg>;
> +
> +        /* root port 00:01.0 */
> +        pci@1,0 {
> +            device_type = "pci";
> +            assigned-addresses = <0x82000800 0 0x80000000 0 0x1000>;
> +            reg = <0x000800 0 0 0 0>;
> +            bus-range = <0x00 0xff>;
> +            status = "okay";

Drop 'status'

> +
> +            #address-cells = <3>;
> +            #size-cells = <2>;
> +
> +            ranges;
> +
> +            nvidia,num-lanes = <2>;
> +
> +            /* bridge 01:00.0 (optional) */
> +            pci@0,0 {
> +                reg = <0x010000 0 0 0 0>;
> +                bus-range = <0x00 0xff>;
> +
> +                #address-cells = <3>;
> +                #size-cells = <2>;
> +                ranges;
> +
> +                device_type = "pci";
> +
> +                /* endpoint 02:00.0 */
> +                ethernet@0,0 {
> +                    reg = <0x020000 0 0 0 0>;
> +                };
> +            };
> +        };
> +
> +        pci@2,0 {
> +            device_type = "pci";
> +            assigned-addresses = <0x82001000 0 0x80001000 0 0x1000>;
> +            reg = <0x001000 0 0 0 0>;
> +            bus-range = <0x00 0xff>;
> +            status = "disabled";

Examples should be enabled. Drop.

> +
> +            #address-cells = <3>;
> +            #size-cells = <2>;
> +
> +            ranges;
> +
> +            nvidia,num-lanes = <2>;
> +        };
> +    };
> +
> +  # Tegra30
> +  - |

Can we have just 1 or 2 examples that are substantually different. We 
don't really need copies of what we have in real .dts files.

Rob
