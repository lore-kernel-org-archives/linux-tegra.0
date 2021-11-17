Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52D78C433FE
	for <linux-tegra@archiver.kernel.org>; Wed, 17 Nov 2021 02:27:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 317A261BFB
	for <linux-tegra@archiver.kernel.org>; Wed, 17 Nov 2021 02:27:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229944AbhKQCaO (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 16 Nov 2021 21:30:14 -0500
Received: from mail-ot1-f48.google.com ([209.85.210.48]:39906 "EHLO
        mail-ot1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229984AbhKQCaM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Nov 2021 21:30:12 -0500
Received: by mail-ot1-f48.google.com with SMTP id r10-20020a056830080a00b0055c8fd2cebdso1927322ots.6;
        Tue, 16 Nov 2021 18:27:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=GiBxOtk/fw1zoy+M3sDTAnUOqTDqO1s7zdGfWtlfDXA=;
        b=NpIiegWmXS3paBcpitxIF6nhMINprMs+75gXVU2SD7uQlfIeJjqnlAv1N9rhtA3u5W
         WXZjVUc5rvdSCzJQQYmHCUlfnWwO3AHFJp5vVUohIjFzQe/o7S0/Snv9Lt+YCKrHE+Cn
         OhHfkIQ6IccAhla0L0cc031iaBGWPcKR+N+eohD7dqcnuKvUWC0kV5ajiFWscMfIPrea
         jkRGkelFOT/oo4/fpTwqh/C/YgoXoyO9lFEmuGOqkOYaIlUco4zRM9UUAmJDg0Ja64+Z
         bBPwYroSUMf1zQ3S0uRbTCYTJ8orqGFzogtHfE+h6Jkp3Jw2YATGu6SXninVsUsQVWAV
         mfsw==
X-Gm-Message-State: AOAM531Kp52etETacnGOGESd5UrdKUpt8gsLRkRq1pXEafQb2kx13MMp
        eHihuz8IVB8r8eS77n30Dw==
X-Google-Smtp-Source: ABdhPJxXsvLSjYWoB892y4XGG05NWc805nrkX5neFLH0Yh5DguvAoddR4LohY0Q3CkwFpiD01RYcIg==
X-Received: by 2002:a9d:4e93:: with SMTP id v19mr10480309otk.146.1637116034592;
        Tue, 16 Nov 2021 18:27:14 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id w4sm1188076oiv.37.2021.11.16.18.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 18:27:14 -0800 (PST)
Received: (nullmailer pid 1207280 invoked by uid 1000);
        Wed, 17 Nov 2021 02:27:10 -0000
From:   Rob Herring <robh@kernel.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        devicetree@vger.kernel.org,
        Mikko Perttunen <mperttunen@nvidia.com>,
        linux-kernel@vger.kernel.org
In-Reply-To: <20211116155413.164242-1-jonathanh@nvidia.com>
References: <20211116155413.164242-1-jonathanh@nvidia.com>
Subject: Re: [PATCH V2 1/2] dt-bindings: Add YAML bindings for NVENC and NVJPG
Date:   Tue, 16 Nov 2021 20:27:10 -0600
Message-Id: <1637116030.331789.1207279.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, 16 Nov 2021 15:54:12 +0000, Jon Hunter wrote:
> Add YAML device tree bindings for the Tegra NVENC and NVJPG Host1x
> engines.
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
> Changes since V1:
> - Fixed errors reported by Rob's bot
> 
>  .../gpu/host1x/nvidia,tegra210-nvenc.yaml     | 135 ++++++++++++++++++
>  .../gpu/host1x/nvidia,tegra210-nvjpg.yaml     |  94 ++++++++++++
>  2 files changed, 229 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvenc.yaml
>  create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvjpg.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvenc.yaml:103:10: [warning] wrong indentation: expected 10 but found 9 (indentation)
./Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvenc.yaml:104:13: [warning] wrong indentation: expected 11 but found 12 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1555900

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

