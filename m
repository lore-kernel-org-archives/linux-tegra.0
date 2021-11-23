Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCEB3C433EF
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Nov 2021 16:34:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235043AbhKWQhx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 23 Nov 2021 11:37:53 -0500
Received: from mail-il1-f175.google.com ([209.85.166.175]:37478 "EHLO
        mail-il1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235073AbhKWQhu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 23 Nov 2021 11:37:50 -0500
Received: by mail-il1-f175.google.com with SMTP id h23so22292778ila.4;
        Tue, 23 Nov 2021 08:34:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=AWjMOxc8q3iW1/Ub8/J/EIlBAvUJ1dzaqbI3PDdbRv0=;
        b=dZDpU8P1GvtHKkyB6WS5sKbImyiBraxvJHpgHBGhB70rUXQnqJ5CzCmPA8tmHSQNE/
         PGzNaJ/LotHgJc5MEtxETJiy5ZNS3ZdE2vIhT4pFChsDNQdbZOPsRIiukJBInBSMsyDd
         /wXpDwQbP9wDgM7uXCQ7GB+vtnakU7HjTt+br6/sNqMGiePagIWlpSvCoUP7oxYnfpFc
         JFjXe4zVz5qZdtUEwkhk5ffzicfEnB78tWVsD47fHslnFvd3McyJJG+gY6vPm1FhAgNh
         D0Q7PeBFB57qt8LeacuDFJsXQm8TTQRf+HIljOa4VTOUZHvotY7xVIO5t9lm1lS7HuAr
         bQNQ==
X-Gm-Message-State: AOAM533O6S52X5fsubjQYZzRWj0W4qUP9aTykTXs2MmlT43+sYrh2bcm
        a1Myd4nhkm5gadf3RK+iQw==
X-Google-Smtp-Source: ABdhPJyCphXenj+7xiKtHWo+Q0EqWB7jemQC1cBrwkeCUDg6QgPbIf58Qee0V/4xDAgkboNwRsvHiw==
X-Received: by 2002:a92:2001:: with SMTP id j1mr6458934ile.116.1637685281907;
        Tue, 23 Nov 2021 08:34:41 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id n39sm8598084ioz.7.2021.11.23.08.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 08:34:41 -0800 (PST)
Received: (nullmailer pid 3442918 invoked by uid 1000);
        Tue, 23 Nov 2021 16:34:29 -0000
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     devicetree@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org
In-Reply-To: <20211119143839.1950739-14-thierry.reding@gmail.com>
References: <20211119143839.1950739-1-thierry.reding@gmail.com> <20211119143839.1950739-14-thierry.reding@gmail.com>
Subject: Re: [PATCH v2 13/16] dt-bindings: i2c: tegra-bpmp: Convert to json-schema
Date:   Tue, 23 Nov 2021 09:34:29 -0700
Message-Id: <1637685269.686613.3442917.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 19 Nov 2021 15:38:36 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the NVIDIA Tegra186 (and later) BPMP I2C bindings from the
> free-form text format to json-schema.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v2:
> - add missing additionalProperties: false
> 
>  .../bindings/i2c/nvidia,tegra186-bpmp-i2c.txt | 42 -------------------
>  .../i2c/nvidia,tegra186-bpmp-i2c.yaml         | 42 +++++++++++++++++++
>  2 files changed, 42 insertions(+), 42 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.yaml
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1557177


i2c: 'pmic@3c' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dt.yaml
	arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dt.yaml
	arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dt.yaml
	arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0001.dt.yaml

i2c: 'pmic@3c', 'temperature-sensor@4c' do not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dt.yaml

