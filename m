Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B0EAC433F5
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Nov 2021 01:36:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236629AbhK3Bjm (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 29 Nov 2021 20:39:42 -0500
Received: from mail-oi1-f169.google.com ([209.85.167.169]:40759 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236601AbhK3Bjm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Nov 2021 20:39:42 -0500
Received: by mail-oi1-f169.google.com with SMTP id bk14so38180479oib.7;
        Mon, 29 Nov 2021 17:36:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3Oqrvj0nH2vfkGJxsWHUmfahiELqVtl1zb8WPq0K8ew=;
        b=AjFPb9iBY8UFpsjvl6S6+YwIzGinBn6d1ymXtOxXIEZJdz7OUnUSvzMoYwE/cDWcuI
         U6k9go21qBANmNhYDh7R/7KD/djgLwjZ5BWDD1kId/cx3c7ODjEbNkazF9LHoYeYyqxV
         Ky0Qs7T3V2ZZkkhw6Cjf5mHeXCUoVt2G1XGytu4K14ajJXCND9+p0PvpYNvnPMxrHMU8
         y0ioF8V5f24P6FZ1lV6jkDeaOEdAW+U+OBpiEwrN8ooQlf5PalhiFMKbh4QomBynU9A9
         Uo0zOFG6VTbakdVen4YTEB3g4MIxAPTa41cF2SIzjdAp1xq0sVMAQnACkoLQARpzJzV8
         kLSA==
X-Gm-Message-State: AOAM530EWEMWF+BmHFF3sTqG0SkdSzTjyPn259nvkzA/45TAeLxj+AkQ
        HbgxtSeXpvP2B9ilFR/z2g==
X-Google-Smtp-Source: ABdhPJwcv/Rt68JQviY8oWlHKrGQ4bLnoMWH0ixkI2DUZnQRan25DOeAX8wBO4mBIOXMxbb8OrM18g==
X-Received: by 2002:a54:4381:: with SMTP id u1mr1574008oiv.70.1638236183386;
        Mon, 29 Nov 2021 17:36:23 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id m12sm2956158ots.59.2021.11.29.17.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 17:36:22 -0800 (PST)
Received: (nullmailer pid 986167 invoked by uid 1000);
        Tue, 30 Nov 2021 01:36:22 -0000
Date:   Mon, 29 Nov 2021 19:36:22 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v2 10/16] dt-bindings: serial: 8250: Document Tegra234
 UART
Message-ID: <YaWAFliX1IfY5YLf@robh.at.kernel.org>
References: <20211119143839.1950739-1-thierry.reding@gmail.com>
 <20211119143839.1950739-11-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211119143839.1950739-11-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 19 Nov 2021 15:38:33 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Add the compatible string for the UART found on the Tegra234 SoC.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  Documentation/devicetree/bindings/serial/8250.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
