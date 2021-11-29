Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96F9EC433F5
	for <linux-tegra@archiver.kernel.org>; Mon, 29 Nov 2021 21:01:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231391AbhK2VEw (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 29 Nov 2021 16:04:52 -0500
Received: from mail-oi1-f174.google.com ([209.85.167.174]:40902 "EHLO
        mail-oi1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231453AbhK2VCw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Nov 2021 16:02:52 -0500
Received: by mail-oi1-f174.google.com with SMTP id bk14so37033697oib.7;
        Mon, 29 Nov 2021 12:59:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=I1liDOBlk0WR8WX6PGc+acdLvsVRGQ2JvLOzSluTByg=;
        b=dAa9unxt7YgnaAYDt/GfC1HVgTleEleH80X7mkw2ZZ3fHq3rxgI6roP3rouA4cKlBs
         h3eLSpWJIN6CbEnjoaH8N9+O4I3tzUmroGWYglZ33+8cWUsJF4PpGIXxtdwSAoZEb88W
         xIEBGLVYM8QQDXMM+SU0fogWo02x7PQXCWkPJwGZJ7qNB3wXtq8X0+2w9fzmxyx/OLJA
         E3vpWNvRQQcm4xLuXm4a0n62biSM7fgZaaPONl6IXIQgybTidlblpYK5gDwfPRyFZU6s
         fHKqfateLQVEil/575JJazGnlYhCVca1vk1xd3NLeLvHZaWeGRlivYiWTsIA+IDbr++z
         ZgrQ==
X-Gm-Message-State: AOAM532V0tcMPLEfMq1O2kQeiSbx2d2HY4OkB8FolSVXEYjiXwIVichY
        rbskYVk7OqVOGi+7srjiszwK5iLVfw==
X-Google-Smtp-Source: ABdhPJwERijACevxFONGPVAWMjtIstsqBYohlTTzzs+NXuf/IycKME+ZEiGdXDdnw/iEhNJg5d6GMw==
X-Received: by 2002:a05:6808:14c2:: with SMTP id f2mr416399oiw.154.1638219574340;
        Mon, 29 Nov 2021 12:59:34 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id g17sm3286564oiy.14.2021.11.29.12.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 12:59:33 -0800 (PST)
Received: (nullmailer pid 599177 invoked by uid 1000);
        Mon, 29 Nov 2021 20:59:33 -0000
Date:   Mon, 29 Nov 2021 14:59:33 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 03/11] dt-bindings: Update headers for Tegra234
Message-ID: <YaU/NR+e6CPp9ePL@robh.at.kernel.org>
References: <20211112123542.3680629-1-thierry.reding@gmail.com>
 <20211112123542.3680629-4-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211112123542.3680629-4-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 12 Nov 2021 13:35:34 +0100, Thierry Reding wrote:
> From: Mikko Perttunen <mperttunen@nvidia.com>
> 
> Add a few more clocks that will be used in follow-up patches to enable
> more functionality on Tegra234.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  include/dt-bindings/clock/tegra234-clock.h | 17 ++++++++++++++---
>  include/dt-bindings/reset/tegra234-reset.h | 12 ++++++++++--
>  2 files changed, 24 insertions(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
