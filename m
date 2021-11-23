Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63354C43217
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Nov 2021 16:35:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238346AbhKWQiS (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 23 Nov 2021 11:38:18 -0500
Received: from mail-il1-f180.google.com ([209.85.166.180]:40809 "EHLO
        mail-il1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238887AbhKWQiK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 23 Nov 2021 11:38:10 -0500
Received: by mail-il1-f180.google.com with SMTP id k1so22297008ilo.7;
        Tue, 23 Nov 2021 08:35:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=JZcxB8mmmGsFGuKk1w8MDXxLIit5ODkfErCLhSso5Hk=;
        b=06QgEPewhQFLSeos49Y2AtrEKOzx2CyWavD1Tqu/h91WQBi8UnZiYVCNAJAPKaGKjm
         6EFyXhjdWLtWZ6dMzLJTbKgMazNwgBYin9tF7Fg1pJBBKKRigtj4s3UBgi9g8Nm/+V9w
         8y5F5niYCxSvxyZiZ8UKd1xLPnesZdmKJkfs63iNzx+a98W7TOltkm/ijKDtIzwT862w
         MAJskKXmvH5QGJhU6TdmO0hxFtYwqNjHHKfSBntVxN8U42Ta6nEiqAXldDQpD6McGA9k
         lhZWxfEB6BUNUckvdcUG6T9gMixORJxv/9S76p7mdkC7IT0LKd9kw5pnMOc/I1brCnWz
         rq+A==
X-Gm-Message-State: AOAM530ptOhXZsSFrSyiqt4P4n1UEbmOdRyZ5CD7WrQIBVvV4v6KESho
        /IjI15iCroCvsHN3GV+9jQ==
X-Google-Smtp-Source: ABdhPJzwOEWQtOZ7KvrEsBPUbRENq21BW90ds/WX+ZFBPhBHKk7lsLpqUGJ9hht4F1nQO5hlMtx5Ag==
X-Received: by 2002:a05:6e02:1a2d:: with SMTP id g13mr7371630ile.134.1637685302290;
        Tue, 23 Nov 2021 08:35:02 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id v11sm8556708ilu.18.2021.11.23.08.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 08:35:01 -0800 (PST)
Received: (nullmailer pid 3442920 invoked by uid 1000);
        Tue, 23 Nov 2021 16:34:29 -0000
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20211119143839.1950739-16-thierry.reding@gmail.com>
References: <20211119143839.1950739-1-thierry.reding@gmail.com> <20211119143839.1950739-16-thierry.reding@gmail.com>
Subject: Re: [PATCH v2 15/16] dt-bindings: serial: tegra-tcu: Convert to json-schema
Date:   Tue, 23 Nov 2021 09:34:29 -0700
Message-Id: <1637685269.695836.3442919.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 19 Nov 2021 15:38:38 +0100, Thierry Reding wrote:
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

Full log is available here: https://patchwork.ozlabs.org/patch/1557181


tcu: $nodename:0: 'tcu' does not match '^serial(@.*)?$'
	arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dt.yaml
	arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dt.yaml
	arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0001.dt.yaml

