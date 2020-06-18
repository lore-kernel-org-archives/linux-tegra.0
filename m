From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 35/38] dt-bindings: memory: Update Tegra210 EMC bindings
Date: Thu, 18 Jun 2020 09:36:56 -0600
Message-ID: <20200618153656.GA389512@bogus>
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
 <20200612141903.2391044-36-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200612141903.2391044-36-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Jun 12, 2020 at 04:19:00PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> The Tegra210 EMC is a cooling device because it can throttle the EMC
> frequency if the chip gets too hot. The device tree node therefore needs
> to contain the "#cooling-cells" property. Furthermore, multiple reserved
> memory regions can now be attached to the EMC device tree node, and the
> new memory-region-names property can be used to differentiate between
> them.
> 
> While at it, update the example to make it more fully-featured.
> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  .../nvidia,tegra210-emc.yaml                  | 34 ++++++++++++++-----
>  1 file changed, 26 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.yaml
> index 49ab09252e52..4e8f659f1a7c 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.yaml
> @@ -34,16 +34,25 @@ properties:
>        - description: EMC general interrupt
>  
>    memory-region:
> -    $ref: /schemas/types.yaml#/definitions/phandle
> -    description:
> -      phandle to a reserved memory region describing the table of EMC
> -      frequencies trained by the firmware
> +    description: List of phandles to reserved memory regions describing the
> +      nominal and derated tables of EMC frequencies trained by the firmware.
> +    $ref: "/schemas/types.yaml#/definitions/phandle-array"
> +
> +  memory-region-names:
> +    $ref: "/schemas/types.yaml#/definitions/string-array"

*-names has a type, so can be dropped.

> +    items:
> +      - const: nominal
> +      - const: derated
>  
>    nvidia,memory-controller:
> -    $ref: /schemas/types.yaml#/definitions/phandle
> +    $ref: "/schemas/types.yaml#/definitions/phandle"

Quotes aren't needed here. (We haven't been consistent on this).

>      description:
>        phandle of the memory controller node
>  
> +  "#cooling-cells":
> +    $ref: "/schemas/types.yaml#/definitions/uint32"
> +    const: 2
> +
>  required:
>    - compatible
>    - reg
> @@ -51,7 +60,10 @@ required:
>    - clock-names
>    - nvidia,memory-controller
>  
> -additionalProperties: false
> +dependencies:
> +  memory-region-names: [ memory-region ]

The core schema should handle this (probably needs to be added).

> +
> +unevaluatedProperties: false
>  
>  examples:
>    - |
> @@ -63,10 +75,15 @@ examples:
>          #size-cells = <1>;
>          ranges;
>  
> -        emc_table: emc-table@83400000 {
> +        nominal: emc-table@83400000 {
>              compatible = "nvidia,tegra210-emc-table";
>              reg = <0x83400000 0x10000>;
>          };
> +
> +        derated: emc-table@83410000 {
> +            compatible = "nvidia,tegar210-emc-table";
> +            reg = <0x83410000 0x10000>;
> +        };
>      };
>  
>      external-memory-controller@7001b000 {
> @@ -77,6 +94,7 @@ examples:
>          clocks = <&tegra_car TEGRA210_CLK_EMC>;
>          clock-names = "emc";
>          interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
> -        memory-region = <&emc_table>;
> +        memory-region-names = "nominal", "derated";
> +        memory-region = <&nominal>, <&derated>;
>          nvidia,memory-controller = <&mc>;
>      };
> -- 
> 2.24.1
> 
