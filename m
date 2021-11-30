Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ACE3C433F5
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Nov 2021 01:35:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236636AbhK3BjB (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 29 Nov 2021 20:39:01 -0500
Received: from mail-oi1-f172.google.com ([209.85.167.172]:36358 "EHLO
        mail-oi1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236601AbhK3BjA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Nov 2021 20:39:00 -0500
Received: by mail-oi1-f172.google.com with SMTP id t23so38173779oiw.3;
        Mon, 29 Nov 2021 17:35:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/MTVSZwTyImj/IPpyIJMWXk436nQgvAt2flj0rrtxsk=;
        b=5x5OZ2x7VWWTtaJ+Z6pghHV8OG2YABwZF+BOfcW4s2GwmkdvwCQ7WsrYm6vM/AOVrB
         YGGTyixKA8iMLQy3E5+Y99gFmFYH5fbq7kkGAXAqPNwdHF4cKGN6DrQIA9g21CjQ+PEP
         3bmVV6I/TBQLXTAfpZBvAmyRIx+6so2azHRiU53o2EQWdzLtZce7OIuPIena6AW2P59I
         Ir4ZPOjYQfDyzGEF5nFkA9Lx9ATzUB848NczSxThB4nlHy1Cq7nY2tTp+CTCPKsxos9S
         jnDvjeH9BnV1Z3ckYmXIKEjXG5OE0uDZy9vb9uMjfLlP+cM5oXCNiYuKoEa7iRQKC+P2
         MnOQ==
X-Gm-Message-State: AOAM530yzl6vqd+/NxTYfRQXQ4mbfxum6rVFFnTRLjC8plx2aWVN291t
        EI9TnoIPkyHJCwIWzLO/fxClAsgSzA==
X-Google-Smtp-Source: ABdhPJypGnhBW4NQX3a/gYA9+OZ/lb+66AYFm9CpPxRIr50fid3Gzz24qJ59aGUm4f4Uzrd/7labbQ==
X-Received: by 2002:a05:6808:1589:: with SMTP id t9mr1551441oiw.108.1638236142143;
        Mon, 29 Nov 2021 17:35:42 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id r5sm3385330oiw.20.2021.11.29.17.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 17:35:41 -0800 (PST)
Received: (nullmailer pid 985174 invoked by uid 1000);
        Tue, 30 Nov 2021 01:35:40 -0000
Date:   Mon, 29 Nov 2021 19:35:40 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 09/16] dt-bindings: mmc: tegra: Document Tegra234 SDHCI
Message-ID: <YaV/7LZCXbJu5XRK@robh.at.kernel.org>
References: <20211119143839.1950739-1-thierry.reding@gmail.com>
 <20211119143839.1950739-10-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211119143839.1950739-10-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 19 Nov 2021 15:38:32 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Add the compatible string for the SDHCI block found on the Tegra234 SoC.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../devicetree/bindings/mmc/nvidia,tegra20-sdhci.yaml       | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
