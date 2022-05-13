Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53F68C43217
	for <linux-tegra@archiver.kernel.org>; Fri, 13 May 2022 12:33:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380332AbiEMMdk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 13 May 2022 08:33:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380294AbiEMMdj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 13 May 2022 08:33:39 -0400
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 863F966FB0;
        Fri, 13 May 2022 05:33:31 -0700 (PDT)
Received: by mail-oi1-f173.google.com with SMTP id v66so9958831oib.3;
        Fri, 13 May 2022 05:33:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=8irf5Ey/s1vfqMTNJiccE2tp/UL53Viu3Nkg7CaCBmU=;
        b=MVvcrtg+Mno+oPOMOEaFqqGess1fxqwNDjG7lq8h6pktXRZAE8RGiZt+uAutorKi+E
         64P7Rxt9ADpplaYxoawSdanhAkpZJVIcr5HbYw41JStqSIkLEHH9HkmnZqEbZV7fjBw5
         k3NexJbr8UZkFLQrK77aqNr3ioydiN5GKOQyYAevsxAz8LY6AABwCJTvvn6Y95riuV1m
         bdUMwRhniImSdqY3SPCjKSPzxjrxsqw6oDvMd6csrrX782glLyUOQC1rgZraBOvCfkwd
         CcP+ksiIxPFgqn0f9/toxPUnY84i+P+0a+THgYi02Q9VeqNJJtMeH2gz8LM2hMW7sUFW
         UIUw==
X-Gm-Message-State: AOAM531uIG5hlmkPhm0Fsfezv12Ce3VJOw/uDDp6kQv1072sr1NLh0Gr
        rNbs0C0l5ZFrEnD+KUCwsw==
X-Google-Smtp-Source: ABdhPJz86NoAE2890pKDohjR65NoBVLwhYgaL8afKM6fy1SRZ0xcYZPaPRo+tFZJya5DCVQmOWVX0Q==
X-Received: by 2002:a05:6808:1905:b0:328:acd1:fc2f with SMTP id bf5-20020a056808190500b00328acd1fc2fmr7590319oib.178.1652445209444;
        Fri, 13 May 2022 05:33:29 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id f7-20020a9d7b47000000b0060681f4b6cesm888882oto.53.2022.05.13.05.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 05:33:29 -0700 (PDT)
Received: (nullmailer pid 85845 invoked by uid 1000);
        Fri, 13 May 2022 12:33:21 -0000
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Will Deacon <will@kernel.org>,
        Krishna Reddy <vdumpa@nvidia.com>, devicetree@vger.kernel.org,
        Robin Murphy <robin.murphy@arm.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        linux-tegra@vger.kernel.org, Janne Grunau <j@jannau.net>,
        Rob Herring <robh+dt@kernel.org>,
        iommu@lists.linux-foundation.org, Joerg Roedel <joro@8bytes.org>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Sameer Pujar <spujar@nvidia.com>
In-Reply-To: <20220512190052.1152377-2-thierry.reding@gmail.com>
References: <20220512190052.1152377-1-thierry.reding@gmail.com> <20220512190052.1152377-2-thierry.reding@gmail.com>
Subject: Re: [PATCH v5 1/5] dt-bindings: reserved-memory: Document iommu-addresses
Date:   Fri, 13 May 2022 07:33:21 -0500
Message-Id: <1652445201.091179.85841.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, 12 May 2022 21:00:48 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> This adds the "iommu-addresses" property to reserved-memory nodes, which
> allow describing the interaction of memory regions with IOMMUs. Two use-
> cases are supported:
> 
>   1. Static mappings can be described by pairing the "iommu-addresses"
>      property with a "reg" property. This is mostly useful for adopting
>      firmware-allocated buffers via identity mappings. One common use-
>      case where this is required is if early firmware or bootloaders
>      have set up a bootsplash framebuffer that a display controller is
>      actively scanning out from during the operating system boot
>      process.
> 
>   2. If an "iommu-addresses" property exists without a "reg" property,
>      the reserved-memory node describes an IOVA reservation. Such memory
>      regions are excluded from the IOVA space available to operating
>      system drivers and can be used for regions that must not be used to
>      map arbitrary buffers.
> 
> Each mapping or reservation is tied to a specific device via a phandle
> to the device's device tree node. This allows a reserved-memory region
> to be reused across multiple devices.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../reserved-memory/reserved-memory.txt       |  1 -
>  .../reserved-memory/reserved-memory.yaml      | 62 +++++++++++++++++++
>  include/dt-bindings/reserved-memory.h         |  8 +++
>  3 files changed, 70 insertions(+), 1 deletion(-)
>  delete mode 100644 Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
>  create mode 100644 include/dt-bindings/reserved-memory.h
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/reserved-memory/reserved-memory.example.dts:21.11-18: Warning (ranges_format): /example-0/reserved-memory:ranges: empty "ranges" property but its #address-cells (2) differs from /example-0 (1)
Documentation/devicetree/bindings/reserved-memory/reserved-memory.example.dts:21.11-18: Warning (ranges_format): /example-0/reserved-memory:ranges: empty "ranges" property but its #size-cells (2) differs from /example-0 (1)
Documentation/devicetree/bindings/reserved-memory/reserved-memory.example.dts:39.15-52.11: Warning (unit_address_vs_reg): /example-0/bus@0: node has a unit name, but no reg or ranges property

doc reference errors (make refcheckdocs):
Documentation/devicetree/bindings/display/arm,hdlcd.txt: Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
Documentation/devicetree/bindings/display/arm,komeda.txt: Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
Documentation/devicetree/bindings/display/arm,malidp.txt: Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
Documentation/devicetree/bindings/display/arm,pl11x.txt: Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
Documentation/devicetree/bindings/firmware/intel,stratix10-svc.txt: Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
Documentation/devicetree/bindings/gpu/aspeed-gfx.txt: Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
Documentation/devicetree/bindings/media/amphion,vpu.yaml: Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
Documentation/devicetree/bindings/media/aspeed-video.txt: Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
Documentation/devicetree/bindings/media/mediatek-vpu.txt: Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
Documentation/devicetree/bindings/remoteproc/ti,davinci-rproc.txt: Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml: Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml: Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt: Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
Documentation/devicetree/bindings/remoteproc/ti,omap-remoteproc.yaml: Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
kernel/dma/Kconfig: Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

