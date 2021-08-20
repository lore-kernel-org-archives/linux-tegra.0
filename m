Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14856C4338F
	for <linux-tegra@archiver.kernel.org>; Fri, 20 Aug 2021 18:00:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F16D461053
	for <linux-tegra@archiver.kernel.org>; Fri, 20 Aug 2021 18:00:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235432AbhHTSBD (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 20 Aug 2021 14:01:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:41400 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235172AbhHTSBD (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 20 Aug 2021 14:01:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0181A61166;
        Fri, 20 Aug 2021 18:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629482425;
        bh=7Gz9SPlKF29yEU4rLc/GG+EOsYXfql5Aal+QHu7Igeg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=h6QYuOzRbrjQY68moCms30kSkYrHpJcu2Vt+BLBhMibhEgZfWlciRG0aNnWJgF4vV
         AKTqgaZWraWcxYGLHAFFomyw5u7LSVig6fLnhcSBUQX14/Z0mWRY2flYiUX+XqHyue
         T4E8wlSyHQ9whkwI2Vr5DqulWV76uvrksZ5GNpl17z1h+tJeqlNeLtsgyEAXLE27V6
         heXiYtDpdAe5FGIQ1dLgAJ+BwoYwhRulLJsa9lHN6RFxVT8Fl5k04XfeQkX47tConw
         HDJnuKb3OQ6esT1Mq2DMHaICjBECU1T1wDxREGc4TB191pbpOx11GFE5f0DbPmvGxz
         TJ49aBMqODprA==
Received: by mail-ej1-f47.google.com with SMTP id u3so21842462ejz.1;
        Fri, 20 Aug 2021 11:00:24 -0700 (PDT)
X-Gm-Message-State: AOAM531KJ8WT/GS9YkSlxz5g9J6G9dBpKLDkiJv7J3DS292H+Mhb1WPZ
        Bgp4jjlSkQof4FlmwTRFSq0oHi/pqshIR+3YuQ==
X-Google-Smtp-Source: ABdhPJzCg01o0GVcbKggUJdrRxr7LQdQj/GR9SqTyTz2LtrjjgVYqF5ahged+VRhyA3Apm+R6NJsgM1nWobV9pBgjG4=
X-Received: by 2002:a17:906:558d:: with SMTP id y13mr21682439ejp.130.1629482423396;
 Fri, 20 Aug 2021 11:00:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210811105030.3458521-1-mperttunen@nvidia.com>
 <20210811105030.3458521-2-mperttunen@nvidia.com> <YRwoKW4nOc52MAQV@robh.at.kernel.org>
 <1dfd5173-5654-9df8-1e8e-d0e365ed914d@kapsi.fi> <YR0InKtLCO1ohcHW@orome.fritz.box>
In-Reply-To: <YR0InKtLCO1ohcHW@orome.fritz.box>
From:   Rob Herring <robh@kernel.org>
Date:   Fri, 20 Aug 2021 13:00:08 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ6i4T7cZCDpo3r6JQ_dBBHNHGiXFHm_EBwudtAD7qSsg@mail.gmail.com>
Message-ID: <CAL_JsqJ6i4T7cZCDpo3r6JQ_dBBHNHGiXFHm_EBwudtAD7qSsg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: Add YAML bindings for NVDEC
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Mikko Perttunen <cyndis@kapsi.fi>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Aug 18, 2021 at 8:18 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> On Wed, Aug 18, 2021 at 11:24:28AM +0300, Mikko Perttunen wrote:
> > On 8/18/21 12:20 AM, Rob Herring wrote:
> > > On Wed, Aug 11, 2021 at 01:50:28PM +0300, Mikko Perttunen wrote:
> > > > Add YAML device tree bindings for NVDEC, now in a more appropriate
> > > > place compared to the old textual Host1x bindings.
> > > >
> > > > Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> > > > ---
> > > > v3:
> > > > * Drop host1x bindings
> > > > * Change read2 to read-1 in interconnect names
> > > > v2:
> > > > * Fix issues pointed out in v1
> > > > * Add T194 nvidia,instance property
> > > > ---
> > > >   .../gpu/host1x/nvidia,tegra210-nvdec.yaml     | 109 ++++++++++++++++++
> > > >   MAINTAINERS                                   |   1 +
> > > >   2 files changed, 110 insertions(+)
> > > >   create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
> > > > new file mode 100644
> > > > index 000000000000..571849625da8
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
> > > > @@ -0,0 +1,109 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: "http://devicetree.org/schemas/gpu/host1x/nvidia,tegra210-nvdec.yaml#"
> > > > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > > > +
> > > > +title: Device tree binding for NVIDIA Tegra NVDEC
> > > > +
> > > > +description: |
> > > > +  NVDEC is the hardware video decoder present on NVIDIA Tegra210
> > > > +  and newer chips. It is located on the Host1x bus and typically
> > > > +  programmed through Host1x channels.
> > > > +
> > > > +maintainers:
> > > > +  - Thierry Reding <treding@gmail.com>
> > > > +  - Mikko Perttunen <mperttunen@nvidia.com>
> > > > +
> > > > +properties:
> > > > +  $nodename:
> > > > +    pattern: "^nvdec@[0-9a-f]*$"
> > > > +
> > > > +  compatible:
> > > > +    enum:
> > > > +      - nvidia,tegra210-nvdec
> > > > +      - nvidia,tegra186-nvdec
> > > > +      - nvidia,tegra194-nvdec
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  clocks:
> > > > +    maxItems: 1
> > > > +
> > > > +  clock-names:
> > > > +    items:
> > > > +      - const: nvdec
> > > > +
> > > > +  resets:
> > > > +    maxItems: 1
> > > > +
> > > > +  reset-names:
> > > > +    items:
> > > > +      - const: nvdec
> > > > +
> > > > +  power-domains:
> > > > +    maxItems: 1
> > > > +
> > > > +  iommus:
> > > > +    maxItems: 1
> > > > +
> > > > +  interconnects:
> > > > +    items:
> > > > +      - description: DMA read memory client
> > > > +      - description: DMA read 2 memory client
> > > > +      - description: DMA write memory client
> > > > +
> > > > +  interconnect-names:
> > > > +    items:
> > > > +      - const: dma-mem
> > > > +      - const: read-1
> > > > +      - const: write
> > > > +
> > > > +required:
> > > > +  - compatible
> > > > +  - reg
> > > > +  - clocks
> > > > +  - clock-names
> > > > +  - resets
> > > > +  - reset-names
> > > > +  - power-domains
> > > > +
> > > > +if:
> > > > +  properties:
> > > > +    compatible:
> > > > +      contains:
> > > > +        const: nvidia,tegra194-host1x
> > >
> > > host1x? This will never be true as the schema is only applied to nodes
> > > with the nvdec compatible.
> >
> > Argh, it's a typo indeed. Should be nvidia,tegra194-nvdec.
> >
> > >
> > > > +then:
> > > > +  properties:
> > > > +    nvidia,instance:
> > > > +      items:
> > > > +        - description: 0 for NVDEC0, or 1 for NVDEC1
> > >
> > > What's this for? We generally don't do indices in DT.
> >
> > When programming the hardware through Host1x, we need to know the "class ID"
> > of the hardware, specific to each instance. So we need to know which
> > instance it is. Technically of course we could derive this from the MMIO
> > address but that seems more confusing.
> >
> > >
> > > > +
> > > > +additionalProperties: true
> > >
> > > This should be false or 'unevaluatedProperties: false'
> >
> > I tried that but it resulted in validation failures; please see the
> > discussion in v2.
>
> Rob mentioned that there is now support for unevaluatedProperties in
> dt-schema. I was able to test this, though with only limited success. I
> made the following changes on top of this patch:

Here's a branch that works with current jsonschema master:

https://github.com/robherring/dt-schema/tree/draft2020-12

> --- >8 ---
> diff --git a/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
> index d2681c98db7e..0bdf05fc8fc7 100644
> --- a/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
> +++ b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
> @@ -73,14 +73,18 @@ if:
>    properties:
>      compatible:
>        contains:
> -        const: nvidia,tegra194-host1x
> +        const: nvidia,tegra194-nvdec
>  then:
>    properties:
>      nvidia,instance:
> +      $ref: /schemas/types.yaml#/definitions/uint32
>        items:
>          - description: 0 for NVDEC0, or 1 for NVDEC1
>
> -additionalProperties: true
> +  required:
> +    - nvidia,instance
> +
> +unevaluatedProperties: false
>
>  examples:
>    - |
> @@ -105,3 +109,28 @@ examples:
>              interconnect-names = "dma-mem", "read-1", "write";
>              iommus = <&smmu TEGRA186_SID_NVDEC>;
>      };
> +
> +  - |
> +    #include <dt-bindings/clock/tegra194-clock.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/memory/tegra194-mc.h>
> +    #include <dt-bindings/power/tegra194-powergate.h>
> +    #include <dt-bindings/reset/tegra194-reset.h>
> +
> +    nvdec@15480000 {
> +            compatible = "nvidia,tegra194-nvdec";
> +            reg = <0x15480000 0x40000>;
> +            clocks = <&bpmp TEGRA194_CLK_NVDEC>;
> +            clock-names = "nvdec";
> +            resets = <&bpmp TEGRA194_RESET_NVDEC>;
> +            reset-names = "nvdec";
> +
> +            nvidia,instance = <0>;
> +
> +            power-domains = <&bpmp TEGRA194_POWER_DOMAIN_NVDECA>;
> +            interconnects = <&mc TEGRA194_MEMORY_CLIENT_NVDECSRD &emc>,
> +                            <&mc TEGRA194_MEMORY_CLIENT_NVDECSRD1 &emc>,
> +                            <&mc TEGRA194_MEMORY_CLIENT_NVDECSWR &emc>;
> +            interconnect-names = "dma-mem", "read-1", "write";
> +            iommus = <&smmu TEGRA194_SID_NVDEC>;
> +    };
> --- >8 ---
>
> As I said, this only works partially. One thing I have to do is comment
> out the whole "if:" block in meta-schemas/base.yaml in order to get rid
> of this error:
>
>         Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml: 'additionalProperties' is a required property
>         hint: A schema without a "$ref" to another schema must define all properties and use "additionalProperties"
>         from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>
> which basically makes the whole file invalid. The reason seems to be
> that dt-schema will only allow unevaluatedProperties if there are any
> $ref references in the schema. Although I'm not sure I understand how
> exactly that works because I tried to inject a dummy $ref but that
> didn't fix the above error.

I think we'll end up relaxing this with 'unevaluatedProperties'
supported. Primarily for just this case with a conditionally defined
property.

> Once that's worked around, though, I do get the examples to validate
> with just a small caveat: nvidia,instance is recognized as being
> required in the Tegra194 case (if I remove it from the example, I do get
> an error, as expected), but if I add nvidia,instance to the Tegra186
> example, it doesn't actually produce an error and will just accept it as
> valid, even though the compatible is not nvidia,tegra194-nvdec.
>
> I don't have time at the moment to investigate why that is, but just
> thought I'd report this here in the meantime. Perhaps it's already a
> known issue?
>
> We could potentially side-step this by getting rid of the custom
> nvidia,instance property altogether. Unfortunately of_device_id table
> matching only supports matching by name, but not by unit-address, which
> would've been nice in this case. Matching by base address manually is a
> bit suboptimal, but it's not that bad.
>
> In any case, there are other examples I know of which need this type of
> functionality (a bunch of devices where the number and names of power
> supplies change from one generation to another), so this problem isn't
> going entirely away anyway.

That's pretty common (though I think we get more variation than we
should), but why would you need the instance or base address for this?

Rob
