Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 863FAC433FE
	for <linux-tegra@archiver.kernel.org>; Fri,  7 Oct 2022 14:02:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229892AbiJGOCD (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 7 Oct 2022 10:02:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230028AbiJGOCB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 7 Oct 2022 10:02:01 -0400
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06F17CF198;
        Fri,  7 Oct 2022 07:01:57 -0700 (PDT)
Received: by mail-il1-f182.google.com with SMTP id y17so2540631ilq.8;
        Fri, 07 Oct 2022 07:01:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lCEqDjTqDHXCkXuuNG9mr4r8E8D6Nx9MxlUrNn9MgDM=;
        b=7q8IGBJzIN3txHxAhBYHYwF55hpvo/nQ+Feo52GgTvAeWqZF3rwN0bKDRNi2MPLCrg
         c7hr5Gbl8cWBilUisLllwkXZ/TL2sdiHaG1XrhUoEp3zV1J+6UFGh74jsRnAftvVe4Hx
         aDYF2GYrErVgu0OQP0DXREx5EsAgyv93ZS43eDMFu+RT0fYX+Mvr/isnjzPBkqIMU/n6
         RtrIY5dvNGnjaTzH9CJaQ/nFh1Im+HSZba8vyXBEzUhX0vbKJHxSKV0toBOVW0ejIy7V
         u8EbG+gotfGEh5rcr1p5SpNidhezdw8fjeeo3e1K2EAmVhlDcBa9S86blSNDK+DzYH7N
         1b3g==
X-Gm-Message-State: ACrzQf0Pgrz7uHIO/zSKlb2d8Fx2hiYDO60+P29AFR+6ZP9KI2/rmGcl
        fntk5bk9iP6aSSFjv/fgTg==
X-Google-Smtp-Source: AMsMyM5HdV6fWhkDutBBJHS69tyeSpDRy8qVNZU6pcM0qE7BeR/x8Kah7W/SLoE69+r0ieimtfxMbw==
X-Received: by 2002:a05:6e02:1bc9:b0:2f1:9ee8:246d with SMTP id x9-20020a056e021bc900b002f19ee8246dmr2411994ilv.246.1665151316125;
        Fri, 07 Oct 2022 07:01:56 -0700 (PDT)
Received: from robh_at_kernel.org ([2607:fb90:17de:d2e8:8e7a:471f:1892:c117])
        by smtp.gmail.com with ESMTPSA id r17-20020a92d991000000b002e8ea827aafsm934006iln.74.2022.10.07.07.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 07:01:55 -0700 (PDT)
Received: (nullmailer pid 286220 invoked by uid 1000);
        Fri, 07 Oct 2022 14:01:53 -0000
Date:   Fri, 7 Oct 2022 09:01:53 -0500
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>, devicetree@vger.kernel.org,
        David Airlie <airlied@linux.ie>, linux-tegra@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 3/7] dt-bindings: reserved-memory: Support framebuffer
 reserved memory
Message-ID: <166515131260.286166.8226735356907205186.robh@kernel.org>
References: <20221007124946.406808-1-thierry.reding@gmail.com>
 <20221007124946.406808-4-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221007124946.406808-4-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 07 Oct 2022 14:49:42 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Document the "framebuffer" compatible string for reserved memory nodes
> to annotate reserved memory regions used for framebuffer carveouts.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v2:
> - use four spaces for indentation in example (as recommended elsewhere)
> - add explicit root node
> - drop unneeded quotes
> 
>  .../bindings/reserved-memory/framebuffer.yaml | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reserved-memory/framebuffer.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
