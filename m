Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4E86C433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 13:48:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C7E4E60F93
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 13:48:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235096AbhKLNvi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Nov 2021 08:51:38 -0500
Received: from mail-ot1-f41.google.com ([209.85.210.41]:37689 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235090AbhKLNve (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Nov 2021 08:51:34 -0500
Received: by mail-ot1-f41.google.com with SMTP id h19-20020a9d3e53000000b0056547b797b2so13051991otg.4;
        Fri, 12 Nov 2021 05:48:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=3cZuvoICaeE/9iFk5pqpv0JHNWT+JNnUw/yYONM5mkU=;
        b=4alRKhZsrXkAvW4ZUmzGH5GS3mdcuhfnSrxcbTRw+alATuQ5QCDas4c1wUwAUQGACS
         MAlLGHLW1jAvZCRguqT/iMCm0MUxdRPl/o9LvyGoe1ttV1LPivSjdKwbieIZMOdQXOhF
         Sv2QtNmyffWzX7VEzm6Hdx8Umo9/+jgSFFdNOHhGfZSuioQpGur0KXMDKeTmSjyvouIl
         Am2iMss4TYjqcVLc/Y4UZDfO1m5voEac83QJa9pqPtwrKg0hgMkE6HNeDj+gcYMPw8Ch
         D+wg6ABXc+v5pIFtYcDAoNaGc49prP65ExZ6QJv4Dfq9z3B5izkDIE0bu2fEf5exB+a4
         mDwg==
X-Gm-Message-State: AOAM532iEMcbTt2TqBu8IYg7nR6YsZmRo8ZG/ItRimfssejs33Us3+0j
        1ifCy9+RDc8+R8RRUn+fUw==
X-Google-Smtp-Source: ABdhPJzqRYPvyQX523O2yZES64vi8GvkQZW8Q/m3SS6pNMGB0StXY0TKAEKerANLaAud+vxtp8a32A==
X-Received: by 2002:a9d:f45:: with SMTP id 63mr8919604ott.350.1636724923663;
        Fri, 12 Nov 2021 05:48:43 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id q9sm1197151oti.32.2021.11.12.05.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 05:48:43 -0800 (PST)
Received: (nullmailer pid 2463379 invoked by uid 1000);
        Fri, 12 Nov 2021 13:48:37 -0000
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
In-Reply-To: <20211112120518.3679793-3-thierry.reding@gmail.com>
References: <20211112120518.3679793-1-thierry.reding@gmail.com> <20211112120518.3679793-3-thierry.reding@gmail.com>
Subject: Re: [PATCH 02/15] dt-bindings: mmc: tegra: Convert to json-schema
Date:   Fri, 12 Nov 2021 07:48:37 -0600
Message-Id: <1636724917.184348.2463378.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 12 Nov 2021 13:05:05 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the NVIDIA Tegra SDHCI bindings from the free-form text format
> to json-schema.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v2:
> - drop redundant $ref properties, add missing maxItems
> 
>  .../bindings/mmc/nvidia,tegra20-sdhci.txt     | 143 ---------
>  .../bindings/mmc/nvidia,tegra20-sdhci.yaml    | 294 ++++++++++++++++++
>  2 files changed, 294 insertions(+), 143 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.txt
>  create mode 100644 Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.yaml
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1554296


mmc@3460000: clock-names: ['sdhci'] is too short
	arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dt.yaml

mmc@3460000: clocks: [[2, 123]] is too short
	arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dt.yaml

mmc@3460000: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dt.yaml

