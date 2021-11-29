Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7A89C433EF
	for <linux-tegra@archiver.kernel.org>; Mon, 29 Nov 2021 21:08:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230522AbhK2VMJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 29 Nov 2021 16:12:09 -0500
Received: from mail-oi1-f174.google.com ([209.85.167.174]:37806 "EHLO
        mail-oi1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231298AbhK2VKI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Nov 2021 16:10:08 -0500
Received: by mail-oi1-f174.google.com with SMTP id bj13so37065446oib.4;
        Mon, 29 Nov 2021 13:06:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TE/9kkq6+kFD9Y1mYlCPmu1tUBg4N60cajNbcPNgtGw=;
        b=eWvfZQba3O7CzAa3mj5k1Y1wHfLUuewIZbho9Zm3kKwNdgAydq0PV3HAyLnFzPJNLX
         5WgRwbPhgxr7cVJ0YEN//zzTas91w4Vxf27zH01GsCUhGSAR49HNLy5mngodvL8RXNAm
         ACG7uOvE6ZQtEAZ4jHP3JsUdsBxY7c/2XOuxHqxj1sUYJnNH2+RcBtWzlc9dTuXVZ1cE
         xDGF5jh4fKcoe5i39PSyKy85O7meKUJsKqIFjrDyxOcPVlzLBRflVOx/KywR5lV+eo6a
         3aNiki6yfUmvNY1Tj2MSgae4ljUpR5j4X4vemVjNHGubLl79M8jAPw9h+7UbW7UI6Kcq
         iohQ==
X-Gm-Message-State: AOAM530W7I78ZquPW1GiSThWU2ovXI+B5NLhk1TIgCTXayUQFnctMXl8
        pRUhzdXmg8kJHol9L6HUAw==
X-Google-Smtp-Source: ABdhPJzb3G45Pq3P1kkV7DYcEGWr6ZBoWHnVHSRNkw+PuJeYNodiAKDCdtsaO0slrgbPMB1HWoGo9Q==
X-Received: by 2002:a05:6808:1589:: with SMTP id t9mr474425oiw.108.1638220010557;
        Mon, 29 Nov 2021 13:06:50 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id w24sm2799678ots.10.2021.11.29.13.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 13:06:49 -0800 (PST)
Received: (nullmailer pid 610046 invoked by uid 1000);
        Mon, 29 Nov 2021 21:06:48 -0000
Date:   Mon, 29 Nov 2021 15:06:48 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Robin Murphy <robin.murphy@arm.com>, linux-tegra@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: cpus: Add ARM Cortex-A78
Message-ID: <YaVA6LXTwYrIRcNA@robh.at.kernel.org>
References: <20211112131904.3683428-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211112131904.3683428-1-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 12 Nov 2021 14:19:03 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The ARM Cortex-A78 CPU can be found in a number of recent SoCs such as
> the NVIDIA Tegra234 (Orin).
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!
