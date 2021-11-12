Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D55B5C433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 15:02:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C26C56023F
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 15:02:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235269AbhKLPFA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Nov 2021 10:05:00 -0500
Received: from mail-ot1-f48.google.com ([209.85.210.48]:35820 "EHLO
        mail-ot1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235271AbhKLPFA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Nov 2021 10:05:00 -0500
Received: by mail-ot1-f48.google.com with SMTP id x43-20020a056830246b00b00570d09d34ebso703495otr.2;
        Fri, 12 Nov 2021 07:02:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=3nliJboRSY/Ib7eaSWdzvClu5G8yV0m/C85bbA9OboM=;
        b=mvZnm3oDW2goeU5l3RAhBFlP89s3DejE/Yn7Wl0/qB4FS8YN/K5M5Jm1pEB2hysxjj
         hyXIjOhl6Bdb8L1XfFYKEuN1jIRtT9h2OB1ROXJfjhXY+mEY1FzBstjCk1qYro25FoiH
         dzDQd7khY11ExlrSz32/qIGzkI3In0e+/lTt8jul5yjGkdo0RHpsulJaGhFWsCRT+3lW
         nRvw/5+ggKA1X+XMsBZ6CRrNOtdYzNAPxdVzeWq01wRo8dpE6yboARXsfAR7XI6Xqurg
         JQ9IfwSHCmpUNhp+5XvQ35Oil2UGWwSEElND77ymEkGEMR1oDpe8KU51OwpNgLJF0M9T
         ybxg==
X-Gm-Message-State: AOAM530PMJi+Itd9EWJqyjQTHksHLQKULMXEy9orSdcjm+Q7i6E4slia
        4hnV7K+fqIFeyjI7e6WkLA==
X-Google-Smtp-Source: ABdhPJxdK74koZnCfGw7bQ5nenSZ+2q9H9P9x9Ki2wA5YlYavLyxuJ/eHRwwcjgHXKdYaW4Zb0+q4Q==
X-Received: by 2002:a05:6830:195:: with SMTP id q21mr12914725ota.355.1636729327797;
        Fri, 12 Nov 2021 07:02:07 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id j20sm1401162oig.52.2021.11.12.07.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 07:02:07 -0800 (PST)
Received: (nullmailer pid 2842417 invoked by uid 1000);
        Fri, 12 Nov 2021 15:01:59 -0000
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
In-Reply-To: <20211112120518.3679793-15-thierry.reding@gmail.com>
References: <20211112120518.3679793-1-thierry.reding@gmail.com> <20211112120518.3679793-15-thierry.reding@gmail.com>
Subject: Re: [PATCH 14/15] dt-bindings: serial: tegra-tcu: Convert to json-schema
Date:   Fri, 12 Nov 2021 09:01:59 -0600
Message-Id: <1636729319.985203.2842416.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 12 Nov 2021 13:05:17 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the Tegra TCU device tree bindings to json-schema.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../bindings/serial/nvidia,tegra194-tcu.txt   | 35 ------------
>  .../bindings/serial/nvidia,tegra194-tcu.yaml  | 56 +++++++++++++++++++
>  2 files changed, 56 insertions(+), 35 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/serial/nvidia,tegra194-tcu.txt
>  create mode 100644 Documentation/devicetree/bindings/serial/nvidia,tegra194-tcu.yaml
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1554320


tcu: $nodename:0: 'tcu' does not match '^serial(@.*)?$'
	arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dt.yaml
	arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dt.yaml
	arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0001.dt.yaml

