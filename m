Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89D1BC433FE
	for <linux-tegra@archiver.kernel.org>; Tue,  7 Sep 2021 13:20:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 67F656056B
	for <linux-tegra@archiver.kernel.org>; Tue,  7 Sep 2021 13:20:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344768AbhIGNWC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 7 Sep 2021 09:22:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:40066 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1344699AbhIGNWB (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 7 Sep 2021 09:22:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5229461101;
        Tue,  7 Sep 2021 13:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631020855;
        bh=+kfMAoxVAZyRPrHKv2yHhbJmusVWLTHq4De3jDzPJGk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ZcF+obAQErGfrroCIm6+Xckd8Xl5YJZwxTQN6L+gVsqQtid/RKHQ97XSuUU4gDYEk
         ang1+/3tmk2uCm7Gte016M/C4e4qTT8djn8igpVPDIHqdtXy2FUd6wJ2zhIgHH3xMS
         oRYrt9L98ujxF+4Q6MhVGLqRNPnchI077e1TbUd43ZJKWonME/NKzUDh54brFbWghF
         f0nHoBWKo5UpG5xUY5LigLbrXtysm7Bd15HCB/ck388ZREOPs0RG0cnMGPWo+yY8e/
         jRa7YerK+Mt+JCiKOfERBW60dxCm9dSCYEOMzL5Ipq4Pyis0qxyyncFAO5LzUEpqrE
         a9rbr6hhoNQzw==
Received: by mail-ed1-f54.google.com with SMTP id u19so13924300edb.3;
        Tue, 07 Sep 2021 06:20:55 -0700 (PDT)
X-Gm-Message-State: AOAM530O48NNcE8Qp7j+hPCkoCSSG2x1erMNFMCBX3uvoB5PjnnlCTOU
        agIs0efrhtzUgRyLWV9/F8RKNXthfRYv1vrIsQ==
X-Google-Smtp-Source: ABdhPJzXj11k+OPkRYSEaYLytlTGM0nIP0+GQxBiLlmsKYNMuL4l0/Tse6O6PdsaTThAFTUF6dAzjIOCN6JLotTMfqk=
X-Received: by 2002:a50:ed09:: with SMTP id j9mr18694795eds.164.1631020853893;
 Tue, 07 Sep 2021 06:20:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210903083155.690022-1-mperttunen@nvidia.com>
 <20210903083155.690022-2-mperttunen@nvidia.com> <YTJOg1oHJq848ZlE@robh.at.kernel.org>
 <36d5b388-0d7f-c500-89b1-c4526849fb56@kapsi.fi>
In-Reply-To: <36d5b388-0d7f-c500-89b1-c4526849fb56@kapsi.fi>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 7 Sep 2021 08:20:41 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJwUupfAUL_DTr=_TPfRJ88MvBex-B2ynpkDAZJFZ4+AA@mail.gmail.com>
Message-ID: <CAL_JsqJwUupfAUL_DTr=_TPfRJ88MvBex-B2ynpkDAZJFZ4+AA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: Add YAML bindings for NVDEC
To:     Mikko Perttunen <cyndis@kapsi.fi>
Cc:     Mikko Perttunen <mperttunen@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
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

On Fri, Sep 3, 2021 at 12:29 PM Mikko Perttunen <cyndis@kapsi.fi> wrote:
>
> On 9/3/21 7:34 PM, Rob Herring wrote:
> > On Fri, Sep 03, 2021 at 11:31:53AM +0300, Mikko Perttunen wrote:
> >> Add YAML device tree bindings for NVDEC, now in a more appropriate
> >> place compared to the old textual Host1x bindings.
> >>
> >> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> >> ---
> >> v4:
> >> * Fix incorrect compatibility string in 'if' condition
> >> v3:
> >> * Drop host1x bindings
> >> * Change read2 to read-1 in interconnect names
> >> v2:
> >> * Fix issues pointed out in v1
> >> * Add T194 nvidia,instance property
> >> ---
> >>   .../gpu/host1x/nvidia,tegra210-nvdec.yaml     | 109 ++++++++++++++++++
> >>   MAINTAINERS                                   |   1 +
> >>   2 files changed, 110 insertions(+)
> >>   create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
> >> new file mode 100644
> >> index 000000000000..33d01c7dc759
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
> >> @@ -0,0 +1,109 @@
> >> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: "http://devicetree.org/schemas/gpu/host1x/nvidia,tegra210-nvdec.yaml#"
> >> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> >> +
> >> +title: Device tree binding for NVIDIA Tegra NVDEC
> >> +
> >> +description: |
> >> +  NVDEC is the hardware video decoder present on NVIDIA Tegra210
> >> +  and newer chips. It is located on the Host1x bus and typically
> >> +  programmed through Host1x channels.
> >> +
> >> +maintainers:
> >> +  - Thierry Reding <treding@gmail.com>
> >> +  - Mikko Perttunen <mperttunen@nvidia.com>
> >> +
> >> +properties:
> >> +  $nodename:
> >> +    pattern: "^nvdec@[0-9a-f]*$"
> >> +
> >> +  compatible:
> >> +    enum:
> >> +      - nvidia,tegra210-nvdec
> >> +      - nvidia,tegra186-nvdec
> >> +      - nvidia,tegra194-nvdec
> >> +
> >> +  reg:
> >> +    maxItems: 1
> >> +
> >> +  clocks:
> >> +    maxItems: 1
> >> +
> >> +  clock-names:
> >> +    items:
> >> +      - const: nvdec
> >> +
> >> +  resets:
> >> +    maxItems: 1
> >> +
> >> +  reset-names:
> >> +    items:
> >> +      - const: nvdec
> >> +
> >> +  power-domains:
> >> +    maxItems: 1
> >> +
> >> +  iommus:
> >> +    maxItems: 1
> >> +
> >> +  interconnects:
> >> +    items:
> >> +      - description: DMA read memory client
> >> +      - description: DMA read 2 memory client
> >> +      - description: DMA write memory client
> >> +
> >> +  interconnect-names:
> >> +    items:
> >> +      - const: dma-mem
> >> +      - const: read-1
> >> +      - const: write
> >> +
> >> +required:
> >> +  - compatible
> >> +  - reg
> >> +  - clocks
> >> +  - clock-names
> >> +  - resets
> >> +  - reset-names
> >> +  - power-domains
> >> +
> >> +if:
> >> +  properties:
> >> +    compatible:
> >> +      contains:
> >> +        const: nvidia,tegra194-nvdec
> >> +then:
> >> +  properties:
> >> +    nvidia,instance:
> >> +      items:
> >> +        - description: 0 for NVDEC0, or 1 for NVDEC1
> >
> > I still don't understand what this is needed for. What is the difference
> > between the instances? There must be some reason you care. We should
> > describe that difference, not some made up index.
> >
> > I'm not suggesting using the base address either. That's fragile too.
>
> This device is on the Host1x bus. On that bus, each device has an
> identifier baked into hardware called 'class' that is used when
> accessing devices through some mechanisms (host1x channels). As such,
> when probing the device we need to specify the class of the device to
> the host1x driver so it knows how to talk to it. Those class numbers are
> fixed so we have hardcoded them in the driver, but now that we have two
> NVDECs, we need to distinguish between them so that we can specify the
> correct class for each instance to the host1x driver.

Then why don't you have a property like 'nvidia,host1x-class'
containing the class number?


> >> +additionalProperties: true
> >
> > 'true' here is not allowed unless the schema is not complete and
> > intended to be included in a complete schema or unconditionally applied
> > (i.e. 'select: true'). This case is neither. As pointed out previously,
> > 'unevaluatedProperties' is what you'd want here.
> >
> > However, I looked into supporting defining properties in if/then/else
> > schemas as you have done and I don't think we will support that soon.
> > It's problematic because we can't validate the schema under the if/then
> > completely. The reason is properties under if/then schemas don't have to
> > be complete as we expect a top level definition that is complete (e.g.
> > vendor properties must have 'description'). To solve this, we'd have to
> > only apply meta-schema checks if the property doesn't appear at the top
> > level. That's more complicated than I care to implement ATM.
>
> I see two paths here: either keep 'additionalProperties: true' or remove
> it and have this binding trigger validation failures. Which one do you
> suggest or is there some third option?

Define the property at the top level, then restrict it in the if/then schema:

if:
  properties:
    compatible:
      not:
        contains:
          const: nvidia,tegra194-nvdec
then:
  properties:
    nvidia,instance: false

(Or 'not: {required: [ nvidia,instance ]}' would work here, too)

With that, 'additionalProperties: false' will work.

Rob
