Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4EC4C433EF
	for <linux-tegra@archiver.kernel.org>; Tue, 14 Sep 2021 16:01:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8776361163
	for <linux-tegra@archiver.kernel.org>; Tue, 14 Sep 2021 16:01:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232916AbhINQCi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 14 Sep 2021 12:02:38 -0400
Received: from mail-oo1-f52.google.com ([209.85.161.52]:34697 "EHLO
        mail-oo1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233857AbhINQCg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 14 Sep 2021 12:02:36 -0400
Received: by mail-oo1-f52.google.com with SMTP id g4-20020a4ab044000000b002900bf3b03fso4827327oon.1;
        Tue, 14 Sep 2021 09:01:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cn+CaUamIV5ffSEiSxIWSxmoRy7kzAqNfsOsKH/+GQE=;
        b=xptYCKqGbG3GIzbZp1zWEw9MxpGC5ECcz2S8bnlHcMjYmXASi8wuNWglYZHRQknsQC
         lKqC3FV/mN4AuZbM+a2EdJpHIdNELGrplEB48Vk5Y9Vwd3MQPJxBkPLE2Vy4kjZEX2Fb
         fpdWRIoDAZFc7iCFJj5RTddadhReC02Ao3wvHCjM2i/9bj+nj+T1cPh/ckCOzW/vPuoS
         3peMdt3wTNdC32x8MRQdxc17aGv+ctzuEok3UXWBZdEiXQouiEHumw+b6nO019hrgCc0
         IAGT4WxgZp56sQIZCuEzFZYCsGWeYDS0NvlvMSlLqXcGIpFIPCMJTsIcNzU+WahwFcr0
         VtlQ==
X-Gm-Message-State: AOAM530T5Fcni06SehQc/kAZz2Drr8VBpmyhFeGDJaSvrVRTsxjIb1n7
        ycwtfJAR5EUF4PdPQmO+qw==
X-Google-Smtp-Source: ABdhPJydrZcnWbcyYKEf8iOzboFIcQrfjb0myBlumYE/rSjF7jHXY0LUIuBgPpEAXCxHWNbxHZjqcw==
X-Received: by 2002:a4a:a58e:: with SMTP id d14mr14800526oom.28.1631635278934;
        Tue, 14 Sep 2021 09:01:18 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id x4sm2757875ood.2.2021.09.14.09.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 09:01:17 -0700 (PDT)
Received: (nullmailer pid 3475829 invoked by uid 1000);
        Tue, 14 Sep 2021 16:01:16 -0000
Date:   Tue, 14 Sep 2021 11:01:16 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sameer Pujar <spujar@nvidia.com>
Cc:     catalin.marinas@arm.com, devicetree@vger.kernel.org,
        perex@perex.cz, kuninori.morimoto.gx@renesas.com, tiwai@suse.com,
        lgirdwood@gmail.com, will@kernel.org, alsa-devel@alsa-project.org,
        robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-tegra@vger.kernel.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com, broonie@kernel.org, sharadg@nvidia.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/13] ASoC: dt-bindings: tegra: Few more Tegra210
 AHUB modules
Message-ID: <YUDHTHU3GBaISmHw@robh.at.kernel.org>
References: <1631551342-25469-1-git-send-email-spujar@nvidia.com>
 <1631551342-25469-5-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1631551342-25469-5-git-send-email-spujar@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, 13 Sep 2021 22:12:12 +0530, Sameer Pujar wrote:
> This patch adds YAML schema for DT bindings of few AHUB modules.
> These devices will be registered as ASoC components and bindings
> will be used on Tegra210 and later chips. The bindings for below
> mentioned modules are added:
> 
>  * SFC (Sampling Frequency Converter)
>  * MVC (Master Volume Control)
>  * AMX (Audio Multiplexer)
>  * ADX (Audio Demultiplexer)
>  * Mixer
> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> ---
>  .../bindings/sound/nvidia,tegra210-adx.yaml        | 76 ++++++++++++++++++++++
>  .../bindings/sound/nvidia,tegra210-ahub.yaml       | 20 ++++++
>  .../bindings/sound/nvidia,tegra210-amx.yaml        | 76 ++++++++++++++++++++++
>  .../bindings/sound/nvidia,tegra210-mixer.yaml      | 74 +++++++++++++++++++++
>  .../bindings/sound/nvidia,tegra210-mvc.yaml        | 76 ++++++++++++++++++++++
>  .../bindings/sound/nvidia,tegra210-sfc.yaml        | 73 +++++++++++++++++++++
>  6 files changed, 395 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-adx.yaml
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-amx.yaml
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-mixer.yaml
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-mvc.yaml
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-sfc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
