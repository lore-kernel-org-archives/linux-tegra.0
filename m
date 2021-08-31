Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44229C4320E
	for <linux-tegra@archiver.kernel.org>; Tue, 31 Aug 2021 20:21:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1E8F560F23
	for <linux-tegra@archiver.kernel.org>; Tue, 31 Aug 2021 20:21:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240094AbhHaUWe (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 31 Aug 2021 16:22:34 -0400
Received: from mail-ot1-f47.google.com ([209.85.210.47]:46856 "EHLO
        mail-ot1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230011AbhHaUWb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 31 Aug 2021 16:22:31 -0400
Received: by mail-ot1-f47.google.com with SMTP id v33-20020a0568300921b0290517cd06302dso634079ott.13;
        Tue, 31 Aug 2021 13:21:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bU7TZOWBzRdHnk5u7KA0MFnjQQvgfnHsYudfpjDdkdg=;
        b=d1adeLv5n8KlCimMOYypTBkFYf75iodMTNCKrJP5C7lfJ+O1vVqsS6fUVe1DnE45dv
         3KSLWpr4bD7XWNaa5R18D18T24mzPmZiDeEE+0EsMEq5DG/WOy3wGuB7bVQd3a7fBDFZ
         ke6D2L5u9EIgC/EkqR+B5bLgsgFvJevwPhe3FGlVFk5C+3PvpLddEwSUzegkkqwiaHhJ
         rmB6Gkl6ZVlr6g5mHVSjIA8ZTckavdA3GpHlJgNgH40OwKrnCsvXIwW4/wTT+1FmHdiz
         frRgugX9/PfZsYEnd+vxTPlhYY+dKewQl7bV6UX6+t4K3dApxN1JQiKmp08V4nd8e7+7
         ouVw==
X-Gm-Message-State: AOAM531dvbwDdGrBMh5t0uZMjxXx5bAkF3Nme7zb6RUuHYM+hPm5bhBz
        bjuC6q63TkSlK2aYnno4IA==
X-Google-Smtp-Source: ABdhPJwpoOM3fs+y4Ud1Zp79FJet9tP6f4HQm/EXSCPIYe1ZMQSRol2az2XulvfPxUOZMrz2Whg0pw==
X-Received: by 2002:a9d:894:: with SMTP id 20mr25702438otf.262.1630441295709;
        Tue, 31 Aug 2021 13:21:35 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id c10sm4259279ots.48.2021.08.31.13.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 13:21:34 -0700 (PDT)
Received: (nullmailer pid 588777 invoked by uid 1000);
        Tue, 31 Aug 2021 20:21:33 -0000
Date:   Tue, 31 Aug 2021 15:21:33 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sameer Pujar <spujar@nvidia.com>
Cc:     broonie@kernel.org, lgirdwood@gmail.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, catalin.marinas@arm.com, will@kernel.org,
        perex@perex.cz, tiwai@suse.com, kuninori.morimoto.gx@renesas.com,
        sharadg@nvidia.com, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 04/13] ASoC: dt-bindings: tegra: Few more Tegra210 AHUB
 modules
Message-ID: <YS6PTYwwu9tU8TWX@robh.at.kernel.org>
References: <1630056839-6562-1-git-send-email-spujar@nvidia.com>
 <1630056839-6562-5-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1630056839-6562-5-git-send-email-spujar@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Aug 27, 2021 at 03:03:50PM +0530, Sameer Pujar wrote:
> This patch adds YAML schema for DT bindings of few AHUB modules.
> These devices will be registered as ASoC components and bindings
> will be used on Tegra210 and later chips. The bindings for below
> mentioned modules are added:
> 
>  * SFC (Sampling Frequency Converter)
>  * MVC (Master Volume Control)
>  * AMX (Audio Multiplexer)
>  * ADX (Audio Demultiplexer)
>  * Mixer
> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> Cc: Rob Herring <robh+dt@kernel.org> 
> ---
>  .../bindings/sound/nvidia,tegra210-adx.yaml        | 74 ++++++++++++++++++++
>  .../bindings/sound/nvidia,tegra210-ahub.yaml       | 20 ++++++
>  .../bindings/sound/nvidia,tegra210-amx.yaml        | 72 ++++++++++++++++++++
>  .../bindings/sound/nvidia,tegra210-mixer.yaml      | 67 ++++++++++++++++++
>  .../bindings/sound/nvidia,tegra210-mvc.yaml        | 79 ++++++++++++++++++++++
>  .../bindings/sound/nvidia,tegra210-sfc.yaml        | 76 +++++++++++++++++++++
>  6 files changed, 388 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-adx.yaml
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-amx.yaml
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-mixer.yaml
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-mvc.yaml
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-sfc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-adx.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-adx.yaml
> new file mode 100644
> index 0000000..9950585
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-adx.yaml
> @@ -0,0 +1,74 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/nvidia,tegra210-adx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Tegra210 ADX Device Tree Bindings
> +
> +description: |
> +  The Audio Demultiplexer (ADX) block takes an input stream with   up to

extra spaces.

> +  16 channels and demultiplexes it into four output streams of up to 16
> +  channels each. A byte RAM helps to form output frames by any combination
> +  of bytes from the input frame. Its design is identical to that of byte
> +  RAM in the AMX except that the data flow direction is reversed.
> +
> +maintainers:
> +  - Jon Hunter <jonathanh@nvidia.com>
> +  - Mohan Kumar <mkumard@nvidia.com>
> +  - Sameer Pujar <spujar@nvidia.com>
> +
> +properties:
> +  $nodename:
> +    pattern: "^adx@[0-9a-f]*$"
> +
> +  compatible:
> +    oneOf:
> +      - const: nvidia,tegra210-adx
> +      - items:
> +          - enum:
> +              - nvidia,tegra194-adx
> +              - nvidia,tegra186-adx
> +          - const: nvidia,tegra210-adx
> +
> +  reg:
> +    maxItems: 1
> +
> +  sound-name-prefix:

nvidia,sound-name-prefix

> +    pattern: "^ADX[1-9]$"
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description:
> +      used as prefix for sink/source names of the component. Must be a
> +      unique string among multiple instances of the same component.
> +      The name can be "ADX1" or "ADX2" ... "ADXx", where x depends on
> +      the maximum available instances on a Tegra SoC.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    description: |
> +      ADX has one input and four output. Accordingly ACIF (Audio Client

You need to define the port numbers for the input and each output.

> +      Interface) RX and TX port nodes are defined to represent ADX inputs
> +      and output respectively. These are connected to corresponding ports
> +      on AHUB.
> +
> +    patternProperties:
> +      '^port@[0-9]':

Per above, this will need to be split at least into input and output 
ports.

Same issues in the other schemas.

> +        $ref: audio-graph-port.yaml#
> +        unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +
> +    adx@702d3800 {
> +        compatible = "nvidia,tegra210-adx";
> +        reg = <0x702d3800 0x100>;
> +        sound-name-prefix = "ADX1";
> +    };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
> index 1118a94..4087eeb 100644
> --- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
> @@ -85,6 +85,26 @@ patternProperties:
>      type: object
>      $ref: nvidia,tegra186-dspk.yaml#
>  
> +  '^mvc@[0-9a-f]+$':
> +    type: object
> +    $ref: nvidia,tegra210-mvc.yaml#
> +
> +  '^sfc@[0-9a-f]+$':
> +    type: object
> +    $ref: nvidia,tegra210-sfc.yaml#
> +
> +  '^amx@[0-9a-f]+$':
> +    type: object
> +    $ref: nvidia,tegra210-amx.yaml#
> +
> +  '^adx@[0-9a-f]+$':
> +    type: object
> +    $ref: nvidia,tegra210-adx.yaml#
> +
> +  '^mixer@[0-9a-f]+$':
> +    type: object
> +    $ref: nvidia,tegra210-mixer.yaml#
> +
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-amx.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-amx.yaml
> new file mode 100644
> index 0000000..e6b365b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-amx.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/nvidia,tegra210-amx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Tegra210 AMX Device Tree Bindings
> +
> +description: |
> +  The Audio Multiplexer (AMX) block can multiplex up to four input streams
> +  each of which can have maximum 16 channels and generate an output stream
> +  with maximum 16 channels. A byte RAM helps to form an output frame by
> +  any combination of bytes from the input frames.
> +
> +maintainers:
> +  - Jon Hunter <jonathanh@nvidia.com>
> +  - Mohan Kumar <mkumard@nvidia.com>
> +  - Sameer Pujar <spujar@nvidia.com>
> +
> +properties:
> +  $nodename:
> +    pattern: "^amx@[0-9a-f]*$"
> +
> +  compatible:
> +    oneOf:
> +      - const: nvidia,tegra210-amx
> +      - items:
> +          - const: nvidia,tegra186-amx
> +          - const: nvidia,tegra210-amx
> +      - const: nvidia,tegra194-amx
> +
> +  reg:
> +    maxItems: 1
> +
> +  sound-name-prefix:
> +    pattern: "^AMX[1-9]$"
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description:
> +      used as prefix for sink/source names of the component. Must be a
> +      unique string among multiple instances of the same component.
> +      The name can be "AMX1" or "AMX2" ... "AMXx", where x depends on
> +      the maximum available instances on a Tegra SoC.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    description: |
> +      AMX has four inputs and one output. Accordingly ACIF (Audio Client
> +      Interfaces) RX and TX port nodes are defined to represent AMX inputs
> +      and output respectively. These are connected to corresponding ports
> +      on AHUB.
> +
> +    patternProperties:
> +      '^port@[0-9]':
> +        $ref: audio-graph-port.yaml#
> +        unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +
> +    amx@702d3000 {
> +        compatible = "nvidia,tegra210-amx";
> +        reg = <0x702d3000 0x100>;
> +        sound-name-prefix = "AMX1";
> +    };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-mixer.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-mixer.yaml
> new file mode 100644
> index 0000000..0808355
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-mixer.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/nvidia,tegra210-mixer.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Tegra210 Mixer Device Tree Bindings
> +
> +description: |
> +  The Mixer supports mixing of up to ten 7.1 audio input streams and
> +  generate five outputs (each of which can be any combination of the
> +  ten input streams).
> +
> +maintainers:
> +  - Jon Hunter <jonathanh@nvidia.com>
> +  - Mohan Kumar <mkumard@nvidia.com>
> +  - Sameer Pujar <spujar@nvidia.com>
> +
> +properties:
> +  $nodename:
> +    pattern: "^mixer@[0-9a-f]*$"
> +
> +  compatible:
> +    oneOf:
> +      - const: nvidia,tegra210-amixer
> +      - items:
> +          - enum:
> +              - nvidia,tegra194-amixer
> +              - nvidia,tegra186-amixer
> +          - const: nvidia,tegra210-amixer
> +
> +  reg:
> +    maxItems: 1
> +
> +  sound-name-prefix:
> +    const: "MIXER"

Don't need quotes. A fixed string seems a bit pointless to put into DT.

> +    $ref: /schemas/types.yaml#/definitions/string
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    description: |
> +      Mixer has ten inputs and five outputs. Accordingly ACIF (Audio Client
> +      Interfaces) RX and TX port nodes are defined to represent MIXER inputs
> +      and outputs respectively. These are connected to corresponding ports
> +      on AHUB.
> +
> +    patternProperties:
> +      '^port@[0-9]':
> +        $ref: audio-graph-port.yaml#
> +        unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +
> +    mixer@702dbb00 {
> +        compatible = "nvidia,tegra210-amixer";
> +        reg = <0x702dbb00 0x800>;
> +        sound-name-prefix = "MIXER";
> +    };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-mvc.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-mvc.yaml
> new file mode 100644
> index 0000000..7d81b11
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-mvc.yaml
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/nvidia,tegra210-mvc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Tegra210 MVC Device Tree Bindings
> +
> +description: |
> +  The Master Volume Control (MVC) provides gain or attenuation to a digital
> +  signal path. It can be used in input or output signal path for per-stream
> +  volume control or it can be used as master volume control. The MVC block
> +  has one input and one output. The input digital stream can be mono or
> +  multi-channel (up to 7.1 channels) stream. An independent mute control is
> +  also included in the MVC block.
> +
> +maintainers:
> +  - Jon Hunter <jonathanh@nvidia.com>
> +  - Mohan Kumar <mkumard@nvidia.com>
> +  - Sameer Pujar <spujar@nvidia.com>
> +
> +properties:
> +  $nodename:
> +    pattern: "^mvc@[0-9a-f]*$"
> +
> +  compatible:
> +    oneOf:
> +      - const: nvidia,tegra210-mvc
> +      - items:
> +          - enum:
> +              - nvidia,tegra194-mvc
> +              - nvidia,tegra186-mvc
> +          - const: nvidia,tegra210-mvc
> +
> +  reg:
> +    maxItems: 1
> +
> +  sound-name-prefix:
> +    pattern: "^MVC[1-9]$"
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description:
> +      used as prefix for sink/source names of the component. Must be a
> +      unique string among multiple instances of the same component.
> +      The name can be "MVC1" or "MVC2" ... "MVCx", where x depends on
> +      the maximum available instances on a Tegra SoC.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    properties:
> +      port@0:
> +        $ref: audio-graph-port.yaml#
> +        unevaluatedProperties: false
> +        description: |
> +          ACIF (Audio Client Interface) acting as MVC input (RX) port.
> +          This is connected to corresponding ACIF port on AHUB.
> +
> +      port@1:
> +        $ref: audio-graph-port.yaml#
> +        unevaluatedProperties: false
> +        description: |
> +          ACIF (Audio Client Interface) acting as MVC output (TX) port.
> +          This is connected to corresponding ACIF port on AHUB.
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +
> +    mvc@702da000 {
> +        compatible = "nvidia,tegra210-mvc";
> +        reg = <0x702da000 0x200>;
> +        sound-name-prefix = "MVC1";
> +    };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-sfc.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-sfc.yaml
> new file mode 100644
> index 0000000..5f05e2a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-sfc.yaml
> @@ -0,0 +1,76 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/nvidia,tegra210-sfc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Tegra210 SFC Device Tree Bindings
> +
> +description: |
> +  The Sampling Frequency Converter (SFC) converts the sampling frequency
> +  of the input signal from one frequency to another. It supports sampling
> +  frequency conversions of streams of up to two channels (stereo).
> +
> +maintainers:
> +  - Jon Hunter <jonathanh@nvidia.com>
> +  - Mohan Kumar <mkumard@nvidia.com>
> +  - Sameer Pujar <spujar@nvidia.com>
> +
> +properties:
> +  $nodename:
> +    pattern: "^sfc@[0-9a-f]*$"
> +
> +  compatible:
> +    oneOf:
> +      - const: nvidia,tegra210-sfc
> +      - items:
> +          - enum:
> +              - nvidia,tegra194-sfc
> +              - nvidia,tegra186-sfc
> +          - const: nvidia,tegra210-sfc
> +
> +  reg:
> +    maxItems: 1
> +
> +  sound-name-prefix:
> +    pattern: "^SFC[1-9]$"
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description:
> +      used as prefix for sink/source names of the component. Must be a
> +      unique string among multiple instances of the same component.
> +      The name can be "SFC1" or "SFC2" ... "SFCx", where x depends on
> +      the maximum available instances on a Tegra SoC.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    properties:
> +      port@0:
> +        $ref: audio-graph-port.yaml#
> +        unevaluatedProperties: false
> +        description: |
> +          ACIF (Audio Client Interface) acting as SFC input (RX) port.
> +          This is connected to corresponding ACIF port on AHUB.
> +
> +      port@1:
> +        $ref: audio-graph-port.yaml#
> +        unevaluatedProperties: false
> +        description: |
> +          ACIF (Audio Client Interface) acting as SFC output (TX) port.
> +          This is connected to corresponding ACIF port on AHUB.
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +
> +    sfc@702d2000 {
> +        compatible = "nvidia,tegra210-sfc";
> +        reg = <0x702d2000 0x200>;
> +        sound-name-prefix = "SFC1";
> +    };
> +
> +...
> -- 
> 2.7.4
> 
> 
