Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C637DC433F5
	for <linux-tegra@archiver.kernel.org>; Mon,  3 Oct 2022 18:11:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229972AbiJCSLR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 3 Oct 2022 14:11:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229988AbiJCSLQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 3 Oct 2022 14:11:16 -0400
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 903022983F;
        Mon,  3 Oct 2022 11:11:15 -0700 (PDT)
Received: by mail-oi1-f176.google.com with SMTP id v130so12109331oie.2;
        Mon, 03 Oct 2022 11:11:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=WjpJSrrz4ItmynRB2TM1xpUm+i5VinINQl9WbadQBXU=;
        b=qt+moN/ysZWqVVXRVsHKfd4Hu6+odJutLMWbL8LCgMZC7Nk08uuRw/LDBPEO3mzakp
         QTxr+aeDitttK4mrBrk55qHQJLteWwIeOAGjG8aBOiNf+JGVcKcZr9ymfePogxIyWJvw
         YEX6cd8V+VKVcPM23pNK2E8xewHhXuVq5im8/X5EHoEUDupJC8bMH/y/lclzVPXVBz3w
         2g20r9jJRJCO1mJaN0uKe8p+PjTfbZdsiFEQMqaXJmz6j3rRiHJGkl8xcIwaiMcMVHtd
         sfTWfw3vwtqv4wj4AIa6uX4yIFna7EQM8O6DtDpb8DKzs09j+vYCerWnOzIva9GTMdbO
         htPA==
X-Gm-Message-State: ACrzQf3D3HRwxeQ2qjzHs0yADnqYFxc0AIboKTTxoNRCt2RVO+Rb8aUQ
        pK1KAI0q8YjMHAfobxv5zQ==
X-Google-Smtp-Source: AMsMyM6pNf9zHN7JqU8QkZvS4QWQ6Kz64td7M8/BpYnZbLiHSvbrU26S8+2eQBvO4QVM9OSY4FPDNA==
X-Received: by 2002:a05:6808:1c2:b0:350:2b01:f324 with SMTP id x2-20020a05680801c200b003502b01f324mr4604402oic.56.1664820674788;
        Mon, 03 Oct 2022 11:11:14 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id t21-20020a9d7495000000b006391bdbb361sm2530950otk.31.2022.10.03.11.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 11:11:14 -0700 (PDT)
Received: (nullmailer pid 2535168 invoked by uid 1000);
        Mon, 03 Oct 2022 18:11:13 -0000
Date:   Mon, 3 Oct 2022 13:11:13 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: tegra: Update headers for Tegra234
Message-ID: <166482067321.2535109.3977497901999170478.robh@kernel.org>
References: <20221003125141.123759-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221003125141.123759-1-jonathanh@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, 03 Oct 2022 13:51:41 +0100, Jon Hunter wrote:
> Update the device-tree clock, memory, power and reset headers for
> Tegra234 by adding the definitions for all the various devices.
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  include/dt-bindings/clock/tegra234-clock.h    | 639 +++++++++++++++++-
>  include/dt-bindings/memory/tegra234-mc.h      | 440 +++++++++++-
>  .../dt-bindings/power/tegra234-powergate.h    |  15 +
>  include/dt-bindings/reset/tegra234-reset.h    | 111 ++-
>  4 files changed, 1175 insertions(+), 30 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
