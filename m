From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 09/38] dt-bindings: gpu: tegra: Convert to json-schema
Date: Wed, 17 Jun 2020 20:29:38 -0600
Message-ID: <20200618022938.GA3333151@bogus>
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
 <20200612141903.2391044-10-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200612141903.2391044-10-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Jun 12, 2020 at 04:18:34PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Convert the NVIDIA Tegra GPU bindings from the previous free-form text
> format to json-schema.
> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  .../devicetree/bindings/gpu/nvidia,gk20a.txt  |  90 ---------
>  .../devicetree/bindings/gpu/nvidia,gk20a.yaml | 189 ++++++++++++++++++
>  2 files changed, 189 insertions(+), 90 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt
>  create mode 100644 Documentation/devicetree/bindings/gpu/nvidia,gk20a.yaml


> diff --git a/Documentation/devicetree/bindings/gpu/nvidia,gk20a.yaml b/Documentation/devicetree/bindings/gpu/nvidia,gk20a.yaml
> new file mode 100644
> index 000000000000..726ef39b2221
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/nvidia,gk20a.yaml
> @@ -0,0 +1,189 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpu/nvidia,gk20a.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra Graphics Processing Units
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> +  - Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - nvidia,gk20a
> +          - nvidia,gm20b
> +          - nvidia,gp10b
> +
> +  reg:
> +    items:
> +      - description: base address and size for BAR0
> +      - description: base address and size for BAR1
> +
> +  interrupts:
> +    items:
> +      - description: stalling interrupt
> +      - description: non-stalling interrupt
> +
> +  interrupt-names:
> +    items:
> +      - const: stall
> +      - const: nonstall
> +
> +  clocks:
> +    minItems: 2
> +    maxItems: 3
> +    items:
> +      - description: GPU clock
> +      - description: PWR clock
> +      - description: REF clock
> +
> +  clock-names:
> +    minItems: 2
> +    maxItems: 3
> +    items:
> +      - const: gpu
> +      - const: pwr
> +      - const: ref
> +
> +  resets:
> +    items:
> +      - description: GPU reset
> +
> +  reset-names:
> +    minItems: 1
> +    maxItems: 1

You can drop minItems/maxItems. The tooling will add them based on 
'items' length if not specified.

> +    items:
> +      - const: gpu
> +
> +  power-domains:
> +    description: GPUs that make use of power domains can define this property
> +      instead of vdd-supply. Currently "nvidia,gp10b" makes use of this.

How many?

> +
> +  vdd-supply:
> +    description: GPU power supply.
> +
> +  iommus:
> +    description: The phandle of the IOMMU and the IOMMU specifier. See
> +      ../iommu/iommu.txt for details.
> +    $ref: "/schemas/types.yaml#/definitions/phandle-array"

Again, just need to define how many.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: nvidia,gm20b
> +    then:
> +      required:
> +        - vdd-supply
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: nvidia,gm20b
> +    then:
> +      properties:
> +        clock-names:
> +          minItems: 3
> +
> +      required:
> +        - vdd-supply
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: nvidia,gp10b
> +    then:
> +      required:
> +        - power-domains
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/tegra124-car.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/memory/tegra124-mc.h>
> +
> +    gpu@57000000 {
> +        compatible = "nvidia,gk20a";
> +        reg = <0x0 0x57000000 0x0 0x01000000>,
> +              <0x0 0x58000000 0x0 0x01000000>;

The default size is 1 cell each for examples. So either use that or add 
a parent node defining 2 cells.

> +        interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names = "stall", "nonstall";
> +        vdd-supply = <&vdd_gpu>;
> +        clocks = <&tegra_car TEGRA124_CLK_GPU>,
> +                 <&tegra_car TEGRA124_CLK_PLL_P_OUT5>;
> +        clock-names = "gpu", "pwr";
> +        resets = <&tegra_car 184>;
> +        reset-names = "gpu";
> +        iommus = <&mc TEGRA_SWGROUP_GPU>;
> +    };
> +
> +  - |
> +    #include <dt-bindings/clock/tegra210-car.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    /*
> +     * XXX can't include this because it conflicts with the tegra124-mc.h
> +     * include from the Tegra124 example above.
> +     */
> +    /*
> +    #include <dt-bindings/memory/tegra210-mc.h>
> +    */
> +
> +    gpu@57000000 {
> +        compatible = "nvidia,gm20b";
> +        reg = <0x0 0x57000000 0x0 0x01000000>,
> +              <0x0 0x58000000 0x0 0x01000000>;
> +        interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names = "stall", "nonstall";
> +        vdd-supply = <&vdd_gpu>;
> +        clocks = <&tegra_car TEGRA210_CLK_GPU>,
> +                 <&tegra_car TEGRA210_CLK_PLL_P_OUT5>,
> +                 <&tegra_car TEGRA210_CLK_PLL_G_REF>;
> +        clock-names = "gpu", "pwr", "ref";
> +        resets = <&tegra_car 184>;
> +        reset-names = "gpu";
> +        iommus = <&mc TEGRA_SWGROUP_GPU>;
> +    };
> +
> +  - |
> +    #include <dt-bindings/clock/tegra186-clock.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/memory/tegra186-mc.h>
> +    #include <dt-bindings/power/tegra186-powergate.h>
> +    #include <dt-bindings/reset/tegra186-reset.h>
> +
> +    gpu@17000000 {
> +        compatible = "nvidia,gp10b";
> +        reg = <0x0 0x17000000 0x0 0x1000000>,
> +              <0x0 0x18000000 0x0 0x1000000>;
> +        interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names = "stall", "nonstall";
> +        clocks = <&bpmp TEGRA186_CLK_GPCCLK>,
> +                 <&bpmp TEGRA186_CLK_GPU>;
> +        clock-names = "gpu", "pwr";
> +        resets = <&bpmp TEGRA186_RESET_GPU>;
> +        reset-names = "gpu";
> +        power-domains = <&bpmp TEGRA186_POWER_DOMAIN_GPU>;
> +        iommus = <&smmu TEGRA186_SID_GPU>;
> +    };
> -- 
> 2.24.1
> 
