Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F015C433F5
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Nov 2021 01:44:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236886AbhK3BsQ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 29 Nov 2021 20:48:16 -0500
Received: from mail-oi1-f181.google.com ([209.85.167.181]:40660 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229827AbhK3BsP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Nov 2021 20:48:15 -0500
Received: by mail-oi1-f181.google.com with SMTP id bk14so38212962oib.7;
        Mon, 29 Nov 2021 17:44:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xYZf7z3v7ltZ7HAwEPReRSj9/7N5VPNzgifFvZZ4jYA=;
        b=eHnRgUuXtk8X0scA7RnsaKujcrydqHF4CQcF37q2h5hLaTUVQziGAu8KaBC7QJZov2
         MizLxSJltqKS6nlV/NcCmRynmdgvMt1TOekr3n/inEarBygVBgBgeJaUxA97Vjmh5jV/
         ZA8LARfJXBF56BB48VIDrl6k7DGEQOzi2Yfp/PV9+xx8C8jcNXxxera5afKKv+MltGiH
         pdeYuySOajK6QTvlED43SOg94HYLjBIZOQBrOw9SyDKbHulQ+JwMRJGPCxinxez877uO
         6p4N0PWAlwzWSK1XrP441UVlhOGUPaXAORpEt4U4OpG37JhBea0g7UvASPFp+vKaF6q3
         cRHg==
X-Gm-Message-State: AOAM533qcUScHMkxhiqnjAplRSI3wN8Ur03da8bgfoLpGHofLzXX0P2O
        Ys5jqoK+SVDZGaEKeqsh/4XpGRSFlA==
X-Google-Smtp-Source: ABdhPJz/Pf31kZR4+q7tVaPAbJ421ylmZ3AbLyJ2jXU1n6l07XilRT93s1c+O0E6tGBMlKLaRGpcCA==
X-Received: by 2002:aca:b382:: with SMTP id c124mr1502743oif.169.1638236697036;
        Mon, 29 Nov 2021 17:44:57 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id x16sm3045566otq.47.2021.11.29.17.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 17:44:56 -0800 (PST)
Received: (nullmailer pid 997904 invoked by uid 1000);
        Tue, 30 Nov 2021 01:44:55 -0000
Date:   Mon, 29 Nov 2021 19:44:55 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     devicetree@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 14/16] dt-bindings: thermal: tegra186-bpmp: Convert to
 json-schema
Message-ID: <YaWCF45nUbCeDF4C@robh.at.kernel.org>
References: <20211119143839.1950739-1-thierry.reding@gmail.com>
 <20211119143839.1950739-15-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211119143839.1950739-15-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 19 Nov 2021 15:38:37 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the Tegra186 (and later) BPMP thermal device tree bindings from
> the free-form text format to json-schema.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../thermal/nvidia,tegra186-bpmp-thermal.txt  | 33 ---------------
>  .../thermal/nvidia,tegra186-bpmp-thermal.yaml | 42 +++++++++++++++++++
>  2 files changed, 42 insertions(+), 33 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/thermal/nvidia,tegra186-bpmp-thermal.txt
>  create mode 100644 Documentation/devicetree/bindings/thermal/nvidia,tegra186-bpmp-thermal.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
