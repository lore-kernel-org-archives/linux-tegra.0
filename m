Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7750FC433F5
	for <linux-tegra@archiver.kernel.org>; Mon, 29 Nov 2021 20:57:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbhK2VAe (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 29 Nov 2021 16:00:34 -0500
Received: from mail-ot1-f48.google.com ([209.85.210.48]:38781 "EHLO
        mail-ot1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232865AbhK2U63 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Nov 2021 15:58:29 -0500
Received: by mail-ot1-f48.google.com with SMTP id n104-20020a9d2071000000b005799790cf0bso27306716ota.5;
        Mon, 29 Nov 2021 12:55:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dU9yu2CuwwRXlofPJm6F2L0G64Pgh7Sd7tg4dUWJFIA=;
        b=jOHIEaGC52UNiFYNH8mWEq5agfQ/rHNNVIYsV1TVy2s7PW90EdvyS2OSYDQuUp0w90
         vhN7CXcm2mUmd6PgBAmZpdoX/7YntwolBl+05P8EqosOTCzdupzdnkKkQXcZnJiCjEqk
         5D+441+v7wBNgGejFNgp1+24sZek6M0XcuhDU48uRq6UmKLsDjiCSTYf9YfMOuHgNIln
         moRG1iTpNyAAIztAFG98y4U1Y7tyNjjdDrPJqaCH4nYG5Y0d8cMRpj4wchXofxWvw8Vo
         PWeh+ysdVeWYLf0UqUYj2kIq358QKKWSnPdiA1oL1MiPo1FdwrMMOolB+BJ0VVS+qN3w
         Kp4Q==
X-Gm-Message-State: AOAM530ppgh+BKu5l2tMkgR1yyoSIMpxnPm1plvwGVMGPSch3TQ9IZiI
        gnr/02Z7pB0jP4cvc98qUw==
X-Google-Smtp-Source: ABdhPJyiBrgKRO++txMkrgtTb/QmFg6gghHqqVbuc5Tr8LJ9XnBU0elfqmGD+sX6R6G3c3rbDV0fGw==
X-Received: by 2002:a05:6830:244c:: with SMTP id x12mr46090927otr.213.1638219310967;
        Mon, 29 Nov 2021 12:55:10 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id bl33sm3344925oib.47.2021.11.29.12.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 12:55:10 -0800 (PST)
Received: (nullmailer pid 592897 invoked by uid 1000);
        Mon, 29 Nov 2021 20:55:09 -0000
Date:   Mon, 29 Nov 2021 14:55:09 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 02/11] dt-bindings: tegra: Document Jetson AGX Orin (and
 devkit)
Message-ID: <YaU+LUlJhX8+meKz@robh.at.kernel.org>
References: <20211112123542.3680629-1-thierry.reding@gmail.com>
 <20211112123542.3680629-3-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211112123542.3680629-3-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 12 Nov 2021 13:35:33 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Add the compatible strings for the Jetson AGX Orin and the
> corresponding developer kit.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  Documentation/devicetree/bindings/arm/tegra.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
