Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B482BC04FCE
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Apr 2021 17:43:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 90B3D613C8
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Apr 2021 17:43:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235623AbhDARnC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 1 Apr 2021 13:43:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234938AbhDARlW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 1 Apr 2021 13:41:22 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE4ABC0319C3;
        Thu,  1 Apr 2021 10:17:23 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id w21-20020a9d63950000b02901ce7b8c45b4so2767793otk.5;
        Thu, 01 Apr 2021 10:17:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+2kq+1w5gAVuUAkpXfDABRglxdrwk5CN20K9T6CLATY=;
        b=nKVcDCx1OfYCZwyLoKu3xiU54k1uo5zys6Uoi7en8nj68zDtTNNchhkbJgIPjzk5g/
         Ud3pBU5Wlq2qb6Hc9U1H2pxE743t6VCDe7bPnfbIfbXBfslGSdR36ZTJTJs3biTcs/i5
         pvVz1FG/6XCXhENxexfFdvhM/SVwMI9iUbBVNPi8DIJoLF/2aulC5r4ViTDZTWFTs2Sr
         LgJ5VU/prA8czXSb2pGqtSuJhlTJgmOoR99hhAw/TJK2lJPV9J96zv2jcNKwVmb5dO9F
         bfT9b7AbezMMp6+bDmfd+yOIMs2ZzD9pE5B/Yea/Gj0bHPg3whh0Jjl3TGiOqpm3KNn1
         QyBQ==
X-Gm-Message-State: AOAM5339LymCnJQQInhn0iVrbFESMpBZtDJF3dhRR4lPe5CzoMjGsWr4
        0db3LfZuGrruSTwdjV+AprEhSfa/mw==
X-Google-Smtp-Source: ABdhPJwpqhvCdW/nRYpc8uU8W48cA+3c+3B8vYbgvlcWnRhbLPoudwBKy1Y4w0BmEdI7/o2BTvfbug==
X-Received: by 2002:a9d:2d8a:: with SMTP id g10mr7693548otb.212.1617297439804;
        Thu, 01 Apr 2021 10:17:19 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v136sm1155436oie.15.2021.04.01.10.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 10:17:18 -0700 (PDT)
Received: (nullmailer pid 635999 invoked by uid 1000);
        Thu, 01 Apr 2021 17:17:17 -0000
Date:   Thu, 1 Apr 2021 12:17:17 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v2 2/6] dt-bindings: memory: tegra30: emc: Replace core
 regulator with power domain
Message-ID: <20210401171717.GA635946@robh.at.kernel.org>
References: <20210330230445.26619-1-digetx@gmail.com>
 <20210330230445.26619-3-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210330230445.26619-3-digetx@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, 31 Mar 2021 02:04:41 +0300, Dmitry Osipenko wrote:
> Power domain fits much better than a voltage regulator in regards to
> a proper hardware description and from a software perspective as well.
> Hence replace the core regulator with the power domain. Note that this
> doesn't affect any existing DTBs because we haven't started to use the
> regulator yet, and thus, it's okay to change it.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/memory-controllers/nvidia,tegra30-emc.yaml    | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
