Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 167ADC6FA83
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Sep 2022 22:32:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbiIHWcv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 8 Sep 2022 18:32:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbiIHWcu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 8 Sep 2022 18:32:50 -0400
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2FA2FDBB5;
        Thu,  8 Sep 2022 15:32:49 -0700 (PDT)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1274ec87ad5so33380137fac.0;
        Thu, 08 Sep 2022 15:32:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=CxueroWKOCf1VlWz/nI3gMCK0OJff9cC2ODwmgYrqaM=;
        b=AmvBZoVh/ONGKX4dodQ335UqTw+SlljNq3su5q/93xvuZ1SMuM/2MouQanUH2fL2TZ
         0iwFjttlerjHBfXalUFoVvYJd21jlV1cpTDLiQyvrIxk10VbxSg1sd7QiemxKFDMLfJz
         1HxD80Uu7XsfLU1xsj6nSJw2sw4u+uCPQoO6A5otI+zlMhIqTYY5NoTmbhYMzlB4hJAX
         msbBX5SudfUHx8e/0wtmLvEqGpll+tBewu0bCFyzZ1hcbYeDztYhgVnHDyd9QxXxY2vl
         f7eZ7d1HK9ZzxZT3nrUNI3SZNsbQZWNgZmzLIhwH51a9L+SRNWXlzh5RtQXcxsA4VLL6
         Helg==
X-Gm-Message-State: ACgBeo07gFA28KgW1i2dkoa0o/YojW5WAB79G/zK+DGqIXClk0c98Fs/
        kjF7l9edQAhIACZfQiZQXw==
X-Google-Smtp-Source: AA6agR5MC+RLWyuYmH/6MzXRA1Lyj+OMmMzdoCAZCKC3Rql+zmp3AUsEWYhhK37k+JRJFRvkiePTpw==
X-Received: by 2002:a05:6870:6317:b0:10e:631c:5e63 with SMTP id s23-20020a056870631700b0010e631c5e63mr3459441oao.262.1662676369003;
        Thu, 08 Sep 2022 15:32:49 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 3-20020a4a1b03000000b00441c26f8fadsm723780oop.12.2022.09.08.15.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 15:32:48 -0700 (PDT)
Received: (nullmailer pid 3461521 invoked by uid 1000);
        Thu, 08 Sep 2022 22:32:47 -0000
Date:   Thu, 8 Sep 2022 17:32:47 -0500
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Janne Grunau <j@jannau.net>, Sameer Pujar <spujar@nvidia.com>,
        devicetree@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-tegra@vger.kernel.org, asahi@lists.linux.dev
Subject: Re: [PATCH v8 1/5] dt-bindings: reserved-memory: Document
 iommu-addresses
Message-ID: <20220908223247.GA3448766-robh@kernel.org>
References: <20220905170833.396892-1-thierry.reding@gmail.com>
 <20220905170833.396892-2-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220905170833.396892-2-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Sep 05, 2022 at 07:08:29PM +0200, Thierry Reding wrote:
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
> Changes in v8:
> - include validation warning fixes that had crept into an unrelated patch
> 
> Changes in v7:
> - keep reserved-memory.txt to avoid broken references
> 
> Changes in v6:
> - add device phandle to iommu-addresses property in examples
> - remove now unused dt-bindings/reserved-memory.h header
> 
>  .../reserved-memory/reserved-memory.yaml      | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)

Thanks for being persistent with this. It looks good to me.

Reviewed-by: Rob Herring <robh@kernel.org>

I really don't like new common bindings with only 1 user, so I hope the 
Asahi folks chime in here. Or really anyone else look at it.

Rob
