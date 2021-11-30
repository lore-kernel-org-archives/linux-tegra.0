Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35ACBC433F5
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Nov 2021 01:33:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236418AbhK3BhD (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 29 Nov 2021 20:37:03 -0500
Received: from mail-ot1-f45.google.com ([209.85.210.45]:40745 "EHLO
        mail-ot1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236408AbhK3BhA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Nov 2021 20:37:00 -0500
Received: by mail-ot1-f45.google.com with SMTP id v15-20020a9d604f000000b0056cdb373b82so28068510otj.7;
        Mon, 29 Nov 2021 17:33:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cQgruC3ondj144+vF3GMUzRIfRfotiedKLmEwHG4YbU=;
        b=G76I2+iiWNmT80IDaTmqOyAETSfe5mhuIT2yJCuBf+jM995/XobBuOUJjIqiVQgZn2
         g+jo+Og26mWt588p05ta2hzLxT0pu1ORAluX2vUDegYErmrPsib4WTJ7zuKXyVRQ5MvD
         4HPp7aGfTGvAN3L/iZQUCWkHfQ52dJFPxPfP+XEX9+Jp7Zff9hFrSANV3oabbkdCrsFw
         tSAwCvceZtm5thVgw5CeNnKO+lefNj6k6+j0RVH/Nlfqn2wmDKluJkvyhuqXg4Sjxjy1
         GfPAv0me1wi19SKONd2CnUYM6l2eeRiEm07liJkPGCbrs/I91bqu8WidPbcYbDR3FCsx
         rB0g==
X-Gm-Message-State: AOAM533ok3HLRIV9J1F/kvX7z5YZD+Z1fC1SdrTr48/R86JjJCzAzKy5
        7vH2K4d4Dfjmd9O0IhFfIw==
X-Google-Smtp-Source: ABdhPJxvLSUHJXpb2ZtbJyG1qS/eZGT4QZSaTqNtLkKddvBStHOGALdeF/3z6+FSonXnc+2OenztLQ==
X-Received: by 2002:a9d:4e89:: with SMTP id v9mr49179413otk.352.1638236022157;
        Mon, 29 Nov 2021 17:33:42 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id n26sm2538566ooq.36.2021.11.29.17.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 17:33:41 -0800 (PST)
Received: (nullmailer pid 982221 invoked by uid 1000);
        Tue, 30 Nov 2021 01:33:40 -0000
Date:   Mon, 29 Nov 2021 19:33:40 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        Jon Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 06/16] dt-bindings: rtc: tegra: Document Tegra234 RTC
Message-ID: <YaV/dFhzblWnDMLK@robh.at.kernel.org>
References: <20211119143839.1950739-1-thierry.reding@gmail.com>
 <20211119143839.1950739-7-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211119143839.1950739-7-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 19 Nov 2021 15:38:29 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Add the compatible string for the RTC block found on the Tegra234 SoC.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  Documentation/devicetree/bindings/rtc/nvidia,tegra20-rtc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
