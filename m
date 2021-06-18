Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15D3DC48BDF
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Jun 2021 22:00:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EC74D61279
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Jun 2021 22:00:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232783AbhFRWCO (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 18 Jun 2021 18:02:14 -0400
Received: from mail-oi1-f182.google.com ([209.85.167.182]:46798 "EHLO
        mail-oi1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231239AbhFRWCN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Jun 2021 18:02:13 -0400
Received: by mail-oi1-f182.google.com with SMTP id c13so12107000oib.13;
        Fri, 18 Jun 2021 15:00:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JX5xFo35vfOyUW2ElJelqTh+jVWTS20L7aZI3USi8Jc=;
        b=Aqrn+k+fyIqd91x30/IPJ8xilYozNVyT1wqT0lUnTarnA/EX1V7jJDWzLaOWwXtt+E
         KfvLzToPWbyJANmBG6uDRCRrgENkOS9Eflb7zBr769YedeiqMV7SrOJ26nFAk43EObLy
         ikA9wAyCpxRrQE54c25R3pRVJeFdu/TO5z7i9oZBp2z+WiEw7stXw/7ag2PJIc6OC4cS
         UNLUEWWPr1KFU+YohiO9ru4Z8jx7tNUhQSl94iW6K/h3Yl02rMbIbzpHc9Pgxmt3bz6/
         iNFaZZNPOxhBfyBfiIs8D77e9VgUwcRrvoiNhDbPhP/7npwmGRbYcxpEO62pco5J69tf
         xwTA==
X-Gm-Message-State: AOAM531l0aevW//y/DmxGMyZSHnhz79Uih7qgAYZj6llbjs/wrV1iYWx
        rmqZ1pQWt83T+2ga6v8yXA==
X-Google-Smtp-Source: ABdhPJzIk8L7ekvc2jOTkBA+91oZsAvhShqW0QNj/pXH2R5jNQx6u5bLaRPUklxkORvWwAVF3O2Nmg==
X-Received: by 2002:aca:c60c:: with SMTP id w12mr16267469oif.46.1624053603812;
        Fri, 18 Jun 2021 15:00:03 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id x35sm2352773otr.7.2021.06.18.15.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 15:00:03 -0700 (PDT)
Received: (nullmailer pid 3064253 invoked by uid 1000);
        Fri, 18 Jun 2021 22:00:00 -0000
Date:   Fri, 18 Jun 2021 16:00:00 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Frank Rowand <frowand.list@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-kernel@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-tegra@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v1] of: reserved-memory: Add stub for
 RESERVEDMEM_OF_DECLARE()
Message-ID: <20210618220000.GA3064199@robh.at.kernel.org>
References: <20210610162313.20942-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210610162313.20942-1-digetx@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, 10 Jun 2021 19:23:13 +0300, Dmitry Osipenko wrote:
> The reserved-memory Kconfig could be disabled when drivers are
> compile-tested. In this case RESERVEDMEM_OF_DECLARE() produces a
> noisy warning about the orphaned __reservedmem_of_table section.
> Add the missing stub that fixes the warning. In particular this is
> needed for compile-testing of NVIDIA Tegra210 memory driver which
> uses reserved-memory.
> 
> Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  include/linux/of.h              | 11 +++++++----
>  include/linux/of_reserved_mem.h |  8 ++++++--
>  2 files changed, 13 insertions(+), 6 deletions(-)
> 

Applied, thanks!
