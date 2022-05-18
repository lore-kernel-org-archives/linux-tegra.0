Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFC9EC433EF
	for <linux-tegra@archiver.kernel.org>; Wed, 18 May 2022 00:35:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232606AbiERAfL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 17 May 2022 20:35:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231217AbiERAfL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 17 May 2022 20:35:11 -0400
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 795C5369E0;
        Tue, 17 May 2022 17:35:10 -0700 (PDT)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-d6e29fb3d7so738722fac.7;
        Tue, 17 May 2022 17:35:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uowtlOt7uh9FjlE0GJw99RnmCNO3qGaYzn17aFrb814=;
        b=nskFFOo9vuldUhyO03CpYxhyoMUpQs/WJrTsiaPcLINUgNvl1pSaoRS4J0p8RVULRn
         v8FWnatJmnYH9yL0vQceKzKSdr4XJ8Xe6Vd0Mf1sNiGmU9wC/63fGDZi63sO+mrCTL9O
         MnsiKNRWHW7/zbvXSCPw011BcSGXAfoOKFxO5quK5yH4GBBXRgrHqgPQPzBPYX63uKRt
         S/BklZSMmD7ZUNzZ2qtqWocdGSADtFO/gJR+osjt8by/s+LNJfpMxpqQg2EJYnBY5Syi
         7CkN+Dpph5CTQv3U+7qAGEW2yETUMAfmyPuDR5DhcKtLxC96yB+sllsLYuYLGL45nJuD
         LY9g==
X-Gm-Message-State: AOAM5320Tqf8WEa16knimKJa6Is752qoMlOpkWTW+ec/UNeB6bza/HIL
        5dySZqBEvf3v2IOG96r4mA==
X-Google-Smtp-Source: ABdhPJw0bg+LuEmesxtufR0n2PZGN/ge2EwiTKPw02GmUyKPuaKB5/4ab5ckf+MNwjKbIxyuuKDniQ==
X-Received: by 2002:a05:6870:e888:b0:f1:a0c6:a5be with SMTP id q8-20020a056870e88800b000f1a0c6a5bemr6993813oan.35.1652834109812;
        Tue, 17 May 2022 17:35:09 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id p206-20020acabfd7000000b0032617532120sm282734oif.48.2022.05.17.17.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 17:35:08 -0700 (PDT)
Received: (nullmailer pid 1948222 invoked by uid 1000);
        Wed, 18 May 2022 00:35:08 -0000
Date:   Tue, 17 May 2022 19:35:08 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
        thierry.reding@gmail.com, robh+dt@kernel.org
Subject: Re: [PATCH] dt-bindings: Renamed hte directory to timestamp
Message-ID: <20220518003508.GA1948162-robh@kernel.org>
References: <20220512175011.28753-1-dipenp@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220512175011.28753-1-dipenp@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, 12 May 2022 10:50:11 -0700, Dipen Patel wrote:
> Renamed hte dt binding directory to timestamp according review comment.
> Addressed minor comment about having HTE acronym first in the common dt
> binding document.
> 
> The change reflects above renaming in MAINTAINERS files too.
> 
> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
> ---
> This patch is on top of old series (Intro to Hardware timestamping
> engine V6) present in linux-next tentatively in preparation for
> merge.
> 
>  .../{hte => timestamp}/hardware-timestamps-common.yaml      | 6 +++---
>  .../bindings/{hte => timestamp}/hte-consumer.yaml           | 0
>  .../bindings/{hte => timestamp}/nvidia,tegra194-hte.yaml    | 0
>  MAINTAINERS                                                 | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>  rename Documentation/devicetree/bindings/{hte => timestamp}/hardware-timestamps-common.yaml (71%)
>  rename Documentation/devicetree/bindings/{hte => timestamp}/hte-consumer.yaml (100%)
>  rename Documentation/devicetree/bindings/{hte => timestamp}/nvidia,tegra194-hte.yaml (100%)
> 

Acked-by: Rob Herring <robh@kernel.org>
