From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: mfd: max77620: Convert to json-schema
Date: Tue, 7 Jul 2020 13:28:44 +0200
Message-ID: <CACRpkdY=rVH03i+JsLuiDKa_BSU57ZNdBNHGv6avuC-AkPZkMQ@mail.gmail.com>
References: <20200609162621.1769610-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200609162621.1769610-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Zhang Rui <rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:GPIO SUBSYSTEM" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux PM list <linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Thierry,

thanks for doing this!

On Tue, Jun 9, 2020 at 6:26 PM Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

>  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-max77620.txt
>  delete mode 100644 Documentation/devicetree/bindings/mfd/max77620.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/max77620.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-max77620.txt
>  delete mode 100644 Documentation/devicetree/bindings/regulator/regulator-max77620.txt
>  delete mode 100644 Documentation/devicetree/bindings/thermal/max77620_thermal.txt

So everything goes in under the MFD node now I suppose (why not).

> diff --git a/Documentation/devicetree/bindings/mfd/max77620.yaml b/Documentation/devicetree/bindings/mfd/max77620.yaml
(...)
> +patternProperties:
> +  "^gpio(@[0-9]+)?$":
> +    type: object
> +    properties:
> +      gpio-hog:
> +        $ref: "/schemas/types.yaml#/definitions/flag"
> +
> +      output-high:
> +        $ref: "/schemas/types.yaml#/definitions/flag"
> +
> +      gpios:
> +        $ref: "/schemas/types.yaml#/definitions/uint32-matrix"

This looks strange. ^gpio(@[0-9]+)?$ seems like the node for
the gpio-controller per se, and that should have a subnode for
the hog, but this makes it look like that hog is directly in the
gpio controller node.

The current gpio.txt lists this example:

        qe_pio_a: gpio-controller@1400 {
                compatible = "fsl,qe-pario-bank-a", "fsl,qe-pario-bank";
                reg = <0x1400 0x18>;
                gpio-controller;
                #gpio-cells = <2>;

                line_b {
                        gpio-hog;
                        gpios = <6 0>;
                        output-low;
                        line-name = "foo-bar-gpio";
                };
        };

I know I should make a generic gpio.yaml include you can just
use for all of this but you know ... time. (Volunteers welcome!)

> +  "^pinmux(@[0-9]+)?$":
> +    type: object
> +    patternProperties:
> +      "^gpio[0-7_]+$":
> +        type: object
> +        properties:
> +          pins:
> +            items:
> +              pattern: "^gpio[0-7]$"
> +            minItems: 1
> +            maxItems: 8
> +
> +          function:
> +            $ref: "/schemas/types.yaml#/definitions/string"
> +            enum:
> +              - gpio
> +              - lpm-control-in
> +              - fps-out
> +              - 32k-out1
> +              - sd0-dvs-in
> +              - sd1-dvs-in
> +              - reference-out
> +
> +          drive-push-pull:
> +            $ref: "/schemas/types.yaml#/definitions/uint32"
> +            enum: [ 0, 1 ]
> +
> +          drive-open-drain:
> +            $ref: "/schemas/types.yaml#/definitions/uint32"
> +            enum: [ 0, 1 ]
> +
> +          bias-pull-up:
> +            $ref: "/schemas/types.yaml#/definitions/uint32"
> +            enum: [ 0, 1 ]
> +
> +          bias-pull-down:
> +            $ref: "/schemas/types.yaml#/definitions/uint32"
> +            enum: [ 0, 1 ]

This seems to reinvent large parts of Rob's already provided:
Documentation/devicetree/bindings/pinctrl/pinmux-node.yaml
Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml

So just $ref-include these instead. See other bindings for examples.
Since this is placed in mfd you might need some ../pinctrl... path.

Yours,
Linus Walleij
