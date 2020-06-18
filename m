From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 21/38] dt-bindings: sound: sgtl5000: Convert to
 json-schema
Date: Wed, 17 Jun 2020 20:41:35 -0600
Message-ID: <20200618024135.GA3363480@bogus>
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
 <20200612141903.2391044-22-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200612141903.2391044-22-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Jun 12, 2020 at 04:18:46PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Convert the Freescale SGTL5000 device tree bindings from free-form text
> format to json-schema.
> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  .../devicetree/bindings/sound/sgtl5000.txt    |  60 ----------
>  .../devicetree/bindings/sound/sgtl5000.yaml   | 103 ++++++++++++++++++
>  .../devicetree/bindings/trivial-devices.yaml  |   2 -
>  3 files changed, 103 insertions(+), 62 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/sgtl5000.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/sgtl5000.yaml


> diff --git a/Documentation/devicetree/bindings/sound/sgtl5000.yaml b/Documentation/devicetree/bindings/sound/sgtl5000.yaml
> new file mode 100644
> index 000000000000..4f29b63c54d3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/sgtl5000.yaml
> @@ -0,0 +1,103 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/sgtl5000.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale SGTL5000 Stereo Codec
> +
> +maintainers:
> +  - Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> +
> +properties:
> +  compatible:
> +    const: fsl,sgtl5000
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +  clocks:
> +    items:
> +      - description: the clock provider of SYS_MCLK
> +
> +  VDDA-supply:
> +    description: the regulator provider of VDDA
> +
> +  VDDIO-supply:
> +    description: the regulator provider of VDDIO
> +
> +  VDDD-supply:
> +    description: the regulator provider of VDDD
> +
> +  micbias-resistor-k-ohms:
> +    description: The bias resistor to be used in kOhms. The resistor can take
> +      values of 2k, 4k or 8k. If set to 0 it will be off. If this node is not
> +      mentioned or if the value is unknown, then micbias resistor is set to
> +      4k.
> +    $ref: "/schemas/types.yaml#/definitions/uint32"

Anything with standard unit suffix already has a type.

> +    enum: [ 0, 2, 4, 8 ]
> +
> +  micbias-voltage-m-volts:
> +    description: The bias voltage to be used in mVolts. The voltage can take
> +      values from 1.25V to 3V by 250mV steps. If this node is not mentioned
> +      or the value is unknown, then the value is set to 1.25V.
> +    $ref: "/schemas/types.yaml#/definitions/uint32"
> +    enum: [ 1250, 1500, 1750, 2000, 2250, 2500, 2750, 3000 ]
> +
> +  lrclk-strength:
> +    description: |
> +      The LRCLK pad strength. Possible values are: 0, 1, 2 and 3 as per the
> +      table below:
> +
> +        VDDIO		1.8V		2.5V		3.3V
> +        0 =		Disable
> +        1 =		1.66 mA		2.87 mA		4.02  mA
> +        2 =		3.33 mA		5.74 mA		8.03  mA
> +        3 =		4.99 mA		8.61 mA		12.05 mA
> +    $ref: "/schemas/types.yaml#/definitions/uint32"
> +    enum: [ 0, 1, 2, 3 ]
> +
> +  sclk-strength:
> +    description: |
> +      The SCLK pad strength. Possible values are: 0, 1, 2 and 3 as per the
> +      table below:
> +
> +        VDDIO		1.8V		2.5V		3.3V
> +        0 =		Disable
> +        1 =		1.66 mA		2.87 mA		4.02  mA
> +        2 =		3.33 mA		5.74 mA		8.03  mA
> +        3 =		4.99 mA		8.61 mA		12.05 mA
> +    $ref: "/schemas/types.yaml#/definitions/uint32"
> +    enum: [ 0, 1, 2, 3 ]
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#sound-dai-cells"
> +  - clocks
> +  - VDDA-supply
> +  - VDDIO-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        codec@a {
> +            compatible = "fsl,sgtl5000";
> +            reg = <0x0a>;
> +            #sound-dai-cells = <0>;
> +            clocks = <&clks 150>;
> +            micbias-resistor-k-ohms = <2>;
> +            micbias-voltage-m-volts = <2250>;
> +            VDDA-supply = <&reg_3p3v>;
> +            VDDIO-supply = <&reg_3p3v>;
> +        };
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> index 4165352a590a..b7e94fe8643f 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -80,8 +80,6 @@ properties:
>            - fsl,mpl3115
>              # MPR121: Proximity Capacitive Touch Sensor Controller
>            - fsl,mpr121
> -            # SGTL5000: Ultra Low-Power Audio Codec
> -          - fsl,sgtl5000
>              # G751: Digital Temperature Sensor and Thermal Watchdog with Two-Wire Interface
>            - gmt,g751
>              # Infineon IR38064 Voltage Regulator
> -- 
> 2.24.1
> 
