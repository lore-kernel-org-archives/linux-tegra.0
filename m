Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2F5CC433B4
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Apr 2021 18:31:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A543C601FC
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Apr 2021 18:31:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235545AbhDAS3H (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 1 Apr 2021 14:29:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237543AbhDASTc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 1 Apr 2021 14:19:32 -0400
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B54E3C0319C4;
        Thu,  1 Apr 2021 10:17:48 -0700 (PDT)
Received: by mail-oo1-xc2d.google.com with SMTP id 125-20020a4a1a830000b02901b6a144a417so713141oof.13;
        Thu, 01 Apr 2021 10:17:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rTYpQxnYeisun6vuUDJAUFTYg5NuDKCDGsq0N/u9+TQ=;
        b=RWcnkAuE/4lS55uJ9WqNlDsvP0mUpga3lNK034a+UvICNh2X8k2bw8IqGay1YQOQGs
         HI5jqmWctPALEXXjxkiIhIxxLFShwddjID79gVrFr3xg63oN/TjFYPvpuIDwML6gEgMk
         9o//h+0Z/6Dh4sLYhqlweeGqS7jE85Af+8X+p6u63+Gt0lE8SWPtWy4zlkyzgoC6dqPi
         gJqk2ZzbxFhzbwpUeMKfFWZQhl8V9yOVLyoqx2Iia8HySGahu3DWSeEEn6LzOVB1w/VE
         Rsn5l18sgHxkLSSqh4oj45UPQqZ3kxG1j52fltgPBIFSmYeQ3lk13mdqCsrlmha7H1z3
         Qekg==
X-Gm-Message-State: AOAM5327rdUggi8z4QoykYpbjcugb9gfKg+FOzal3RmthNezewbCuad4
        VGIP0y04JT5gvdALdhX0A1Espyxj0Q==
X-Google-Smtp-Source: ABdhPJzWzVT5IQc4aLRQt2NzaPCyhgFdVeHL9nOVBmHSD87cvob9pcfyrMrymy98s/V5kxzd6Smfbw==
X-Received: by 2002:a4a:b102:: with SMTP id a2mr7975195ooo.30.1617297465008;
        Thu, 01 Apr 2021 10:17:45 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id d1sm1246305oth.13.2021.04.01.10.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 10:17:44 -0700 (PDT)
Received: (nullmailer pid 636777 invoked by uid 1000);
        Thu, 01 Apr 2021 17:17:43 -0000
Date:   Thu, 1 Apr 2021 12:17:43 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/6] dt-bindings: memory: tegra124: emc: Replace core
 regulator with power domain
Message-ID: <20210401171743.GA636437@robh.at.kernel.org>
References: <20210330230445.26619-1-digetx@gmail.com>
 <20210330230445.26619-4-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210330230445.26619-4-digetx@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, 31 Mar 2021 02:04:42 +0300, Dmitry Osipenko wrote:
> Power domain fits much better than a voltage regulator in regards to
> a proper hardware description and from a software perspective as well.
> Hence replace the core regulator with the power domain. Note that this
> doesn't affect any existing DTBs because we haven't started to use the
> regulator yet, and thus, it's okay to change it.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/memory-controllers/nvidia,tegra124-emc.yaml   | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
