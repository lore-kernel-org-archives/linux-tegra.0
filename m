Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D485EC433EF
	for <linux-tegra@archiver.kernel.org>; Mon, 29 Nov 2021 21:05:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231370AbhK2VJH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 29 Nov 2021 16:09:07 -0500
Received: from mail-oi1-f177.google.com ([209.85.167.177]:35457 "EHLO
        mail-oi1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbhK2VHH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Nov 2021 16:07:07 -0500
Received: by mail-oi1-f177.google.com with SMTP id m6so37066870oim.2;
        Mon, 29 Nov 2021 13:03:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/C6cXQ6I+DvazsHvLzn5HCwkUIY2LS9zWKJ6486tyI4=;
        b=DV5zsEGHxeOaelzFCby5f+Zv5U82D78zni8GdGHQvcwlnFyW9+EqxMzNSI6SnhCHuN
         VUDxukzKsjzUt2RZScgUa2f8ukV76va1l4yPeWNBCx2N1xlS0hyU7WgLL5s4LsHHf/HX
         ymJVNT+OAvZHR9B95DOcyx8BthrP3gZkSA8uHzEC2VEJMU8oFXkg4VerJj1otRCHf2py
         xlqN/SkEXZ58tcnkNaJ41owaO+/Qm90YVmdZAc4n4cc5YCgxGcQKQImLDmJc4xL2CMUD
         JK770tO0yEWY9wM1KTXe8HlBOAyHl8EdMNL8N/RVbu8DNYKtHW4y5KvM4/0FX8OhoyiM
         KuJA==
X-Gm-Message-State: AOAM532s1XCiRgBqAGY0KPqKnuWacNP/laQqyOab+g5e6xJgS/y9sLcW
        V0NsrMCLiEeEBl3w8+eFyg==
X-Google-Smtp-Source: ABdhPJxW4VjLyk3MQTRUim1PMjrobF39u9tydkFlN1RwWqwCmVAO2R23KjnNVaBi2zD3XKJaTZj55g==
X-Received: by 2002:a05:6808:170e:: with SMTP id bc14mr467373oib.86.1638219828812;
        Mon, 29 Nov 2021 13:03:48 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id o26sm2829465otj.14.2021.11.29.13.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 13:03:47 -0800 (PST)
Received: (nullmailer pid 605655 invoked by uid 1000);
        Mon, 29 Nov 2021 21:03:46 -0000
Date:   Mon, 29 Nov 2021 15:03:46 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Jon Hunter <jonathanh@nvidia.com>,
        Joerg Roedel <joro@8bytes.org>, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org
Subject: Re: [PATCH 2/4] dt-bindings: arm-smmu: Add compatible for Tegra234
 SOC
Message-ID: <YaVAMiWvGotJSjn2@robh.at.kernel.org>
References: <20211112131231.3683098-1-thierry.reding@gmail.com>
 <20211112131231.3683098-3-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211112131231.3683098-3-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 12 Nov 2021 14:12:29 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The NVIDIA Tegra234 SoC comes with one single-instance ARM SMMU used by
> isochronous memory clients and two dual-instance ARM SMMUs used by non-
> isochronous memory clients.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
