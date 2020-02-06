From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/9] dt-bindings: sound: tegra: add DT binding for AHUB
Date: Thu, 6 Feb 2020 18:10:45 +0000
Message-ID: <20200206181045.GA31521@bogus>
References: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
 <1580380422-3431-2-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1580380422-3431-2-git-send-email-spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Jan 30, 2020 at 04:03:34PM +0530, Sameer Pujar wrote:
> Audio Hub (AHUB) comprises a collection of hardware accelerators for audio
> pre-processing and post-processing and a programmable full crossbar for
> audio routing across these accelerators. This patch adds YAML schema for DT
> binding of AHUB and few of its following components. These devices will be
> registered as ASoC components.
>  * ADMAIF
>  * I2S
>  * DMIC
>  * DSPK
> 
> Signed-off-by: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  .../bindings/sound/nvidia,tegra186-dspk.yaml       | 105 +++++++++++++
>  .../bindings/sound/nvidia,tegra210-admaif.yaml     | 165 +++++++++++++++++++++
>  .../bindings/sound/nvidia,tegra210-ahub.yaml       | 130 ++++++++++++++++
>  .../bindings/sound/nvidia,tegra210-dmic.yaml       | 105 +++++++++++++
>  .../bindings/sound/nvidia,tegra210-i2s.yaml        | 112 ++++++++++++++
>  5 files changed, 617 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
> new file mode 100644
> index 0000000..dc9fef3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
> @@ -0,0 +1,105 @@
> +# SPDX-License-Identifier: (GPL-2.0)

Dual license new bindings:

(GPL-2.0-only OR BSD-2-Clause)

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/nvidia,tegra186-dspk.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Tegra186 DSPK Controller Device Tree Bindings
> +
> +description: |
> +  The Digital Speaker Controller (DSPK) can be viewed as a Pulse
> +  Density Modulation (PDM) transmitter that up-samples the input to
> +  the desired sampling rate by interpolation and then converts the
> +  over sampled Pulse Code Modulation (PCM) input to the desired 1-bit
> +  output via Delta Sigma Modulation (DSM).
> +
> +maintainers:
> +  - Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> +  - Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:

Drop 'items' for a single entry.

> +          const: nvidia,tegra186-dspk
> +      - items:
> +          - enum:
> +              - nvidia,tegra194-dspk
> +          - enum:
> +              - nvidia,tegra186-dspk

This can be a 'const'

> +
> +  reg:
> +    description: offset and length of the register set for the device.

That's every 'reg'. Drop.

> +    maxItems: 1
> +
> +  clocks:
> +    description: must contain an entry for each entry in clock-names.
> +      See ../clocks/clocks-bindings.txt for details.
> +    minItems: 1

Drop description and minItems. minItems is implied by the length of 
'items'.

> +    items:
> +      - description: Module clock
> +
> +  clock-names:
> +    description: must contain clock names for each corresponding entry in clocks.
> +      See ../clocks/clocks-bindings.txt for details.
> +    minItems: 1

ditto

> +    items:
> +      - const: dspk
> +
> +  assigned-clocks:
> +    description: list of input clocks and dividers for the audio system.
> +      See ../clocks/clock-bindings.txt for details.
> +    minItems: 1

ditto

> +    items:
> +      - description: Module clock
> +
> +  assigned-clock-parents:
> +    description: parent clock for each entry in assigned-clocks
> +      See ../clocks/clock-bindings.txt for details.
> +    minItems: 1

ditto

> +    items:
> +      - description: Parent for module clock
> +
> +  assigned-clock-rates:
> +    description: clock rate for each entry in assigned-clocks
> +      See ../clocks/clock-bindings.txt for details.

ditto

> +    items:
> +      - description: initial module clock rate
> +
> +  "#sound-dai-cells":
> +    const: 1
> +
> +  sound-name-prefix:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description:
> +      Used as prefix for sink/source names of the component. Must be a
> +      unique string among multiple instances of the same component.
> +      The name can be "DSPK1" or "DSPKx", where x depends on the maximum

Sounds like a constraint.

> +      available instances on a Tegra SoC.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - assigned-clocks
> +  - assigned-clock-parents
> +  - "#sound-dai-cells"
> +
> +examples:
> +  - |
> +    #include<dt-bindings/clock/tegra186-clock.h>
> +
> +    tegra_dspk1: dspk@2905000 {
> +        compatible = "nvidia,tegra186-dspk";
> +        reg = <0x2905000 0x100>;
> +        clocks = <&bpmp TEGRA186_CLK_DSPK1>;
> +        clock-names = "dspk";
> +        assigned-clocks = <&bpmp TEGRA186_CLK_DSPK1>;
> +        assigned-clock-parents = <&bpmp TEGRA186_CLK_PLL_A_OUT0>;
> +        assigned-clock-rates = <12288000>;
> +        #sound-dai-cells = <1>;
> +        sound-name-prefix = "DSPK1";
> +    };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
> new file mode 100644
> index 0000000..a8a41ba
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
> @@ -0,0 +1,165 @@
> +# SPAT-License-Identifier: (GPL-2.0)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/nvidia,tegra210-admaif.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Tegra210 ADMAIF Device Tree Bindings
> +
> +description: |
> +  ADMAIF is the interface between ADMA and AHUB. Each ADMA channel
> +  that sends/receives data to/from AHUB must interface through an
> +  ADMAIF channel. ADMA channel sending data to AHUB pairs with ADMAIF
> +  Tx channel and ADMA channel receiving data from AHUB pairs with
> +  ADMAIF Rx channel.
> +
> +maintainers:
> +  - Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> +  - Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          const: nvidia,tegra210-admaif
> +      - items:
> +          const: nvidia,tegra186-admaif

These 2 can be a single enum.

> +      - items:
> +          - enum:
> +             - nvidia,tegra194-admaif
> +          - enum:
> +             - nvidia,tegra186-admaif
> +
> +  reg:
> +    maxItems: 1
> +
> +  dmas: true
> +
> +  dma-names: true
> +
> +  "#sound-dai-cells":
> +    const: 1
> +
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: nvidia,tegra210-admaif
> +
> +then:
> +  properties:
> +    dmas:
> +      $ref: /schemas/types.yaml#/definitions/phandle-array

Drop. Common properties already have a type.

Plus this is wrong. A '$ref' means all other keywords are ignored (until 
we move to draft8).

> +      description:
> +        Two or more DMA channel specifiers, equally divided for Tx and Rx.
> +      minItems: 2
> +      maxItems: 20
> +    dma-names:
> +      $ref: /schemas/types.yaml#/definitions/string-array

drop

> +      description:
> +        There must be at least one channel named "tx1" for transmit and "rx1"
> +        for receive. If more channels need to be specified then "tx1",
> +        "tx2" ... "tx10" can be used. Similarly for Rx channels as well.

Sounds like constraints.


Stopping there. Similar issues on the rest...
