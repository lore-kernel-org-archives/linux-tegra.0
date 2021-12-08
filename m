Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC007C433F5
	for <linux-tegra@archiver.kernel.org>; Wed,  8 Dec 2021 18:51:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239398AbhLHSzE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 8 Dec 2021 13:55:04 -0500
Received: from mail-oi1-f180.google.com ([209.85.167.180]:38900 "EHLO
        mail-oi1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233006AbhLHSzE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 8 Dec 2021 13:55:04 -0500
Received: by mail-oi1-f180.google.com with SMTP id r26so5345669oiw.5;
        Wed, 08 Dec 2021 10:51:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DA206Skj/zOS4Jfg8GLV2jzG+Ni8Fuw90HwODp0h61E=;
        b=NdXIKeyqcMt4qMJrOBJc1z8DXaWKATPD63EK0yqrJKIGajv6DlU5iJTpFoOocD24eI
         MlxFrCEQjEKd6/JIIS6KlivUQWCGG9ie7tWuuhiUdePhotmdhAyp2ftIH1eWsQQfETvO
         jjWGjbc/77w+1h9NIAJA5vUM1RMulPruKAXxh54boNxuZkvaXEt+sXhc0X/Ki8cpss4t
         fe8ycmDv6/NJZCbV84IsTXlNUbESgW1cJFUJhbzUp4H2dZlD1Zm40c8CycYOYMAEeGsj
         5TkYusvDNb6qIy8pAd9fKSHAQhMq6PYqm44sSooNzT7rRM6QHCT7EjPgngJTld4VTrBV
         Ajjg==
X-Gm-Message-State: AOAM5308zAJqk5ad7l67nUzICq8tHigmRutJv2NnNsu+dHeaXpkOVLvr
        oGxrY4FTql8F5F9BoRL2RaVSQV3C+g==
X-Google-Smtp-Source: ABdhPJyloECLmJdVsA+9Pm32hGNPi6Qteyx6HkJDDB2ngniyWXNjz9UXihx+YUz5y4IBeg3ycKRUWQ==
X-Received: by 2002:a54:4494:: with SMTP id v20mr1320403oiv.95.1638989492068;
        Wed, 08 Dec 2021 10:51:32 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id q44sm632245otv.80.2021.12.08.10.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 10:51:31 -0800 (PST)
Received: (nullmailer pid 137568 invoked by uid 1000);
        Wed, 08 Dec 2021 18:51:30 -0000
Date:   Wed, 8 Dec 2021 12:51:30 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        Jon Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: arm: pmu: Document Denver and Carmel
 PMUs
Message-ID: <YbD+suEe7J+Nft0H@robh.at.kernel.org>
References: <20211207150746.444478-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211207150746.444478-1-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, 07 Dec 2021 16:07:44 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Add compatible strings for the NVIDIA Denver and Carmel PMUs.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  Documentation/devicetree/bindings/arm/pmu.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Given the other compatible string additions I picked up, I applied this 
one too.

Rob
