Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45018C433F5
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Nov 2021 16:34:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234534AbhKWQhq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 23 Nov 2021 11:37:46 -0500
Received: from mail-io1-f48.google.com ([209.85.166.48]:39845 "EHLO
        mail-io1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236667AbhKWQho (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 23 Nov 2021 11:37:44 -0500
Received: by mail-io1-f48.google.com with SMTP id c3so28779244iob.6;
        Tue, 23 Nov 2021 08:34:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=PB+xT0TMFF7Vgq2hOtXEqa1orCQHRnKwixtptPam+5g=;
        b=6VUaWAMjk+Z8NAH7yuo8afw41Fx+eWkdj2iohyxq/d3XgdQlKHELAF5VQ++AZPAeKN
         f2zoagoKdKEnfQwwTKZT72Kh27gnT89oF/xrl4p1Wdgda5U2pJM+TK6mPVPoaAdbE1wG
         UJDSgAtjKk6GVLl8z/2sEkmRbwtNNvVAB+c8vb6rCn+GqON5b/7xmCzJGQi8sqK8Vm1M
         cIqtdi0jmDCDwJJoIBXm69737MbZzjl648WaeXXCLcrNawtipNciRhM6cruow1J5MzxP
         hGeatIv16peP0oQr9VoAYxLjvQBDEQmo+Omliz2KdC7o+JPGLrJUbqs2pTVibNZj94Mr
         pWRQ==
X-Gm-Message-State: AOAM532E2s9VX8a6/ody6zasnB8KBUq+40bwMt4+fYZ9tNILNdULhaKY
        kYyalPaDUu8WLPD49XsfQNhihgmtBA==
X-Google-Smtp-Source: ABdhPJzDjVVFHi2OQZyyVfUWw1AlgL0K6Xxs22c6U1HgjifWhwUYgDmo9TFylFJqdQ1+kp3bASnM/g==
X-Received: by 2002:a05:6602:1654:: with SMTP id y20mr7301813iow.108.1637685275406;
        Tue, 23 Nov 2021 08:34:35 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id v23sm7250265ioj.4.2021.11.23.08.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 08:34:34 -0800 (PST)
Received: (nullmailer pid 3442922 invoked by uid 1000);
        Tue, 23 Nov 2021 16:34:29 -0000
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org
In-Reply-To: <20211119143839.1950739-17-thierry.reding@gmail.com>
References: <20211119143839.1950739-1-thierry.reding@gmail.com> <20211119143839.1950739-17-thierry.reding@gmail.com>
Subject: Re: [PATCH v2 16/16] dt-bindings: serial: Document Tegra234 TCU
Date:   Tue, 23 Nov 2021 09:34:29 -0700
Message-Id: <1637685269.704293.3442921.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 19 Nov 2021 15:38:39 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Add the compatible string for the TCU found on the Tegra234 SoC.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../devicetree/bindings/serial/nvidia,tegra194-tcu.yaml    | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1557183


tcu: $nodename:0: 'tcu' does not match '^serial(@.*)?$'
	arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dt.yaml
	arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dt.yaml
	arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0001.dt.yaml

