Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BEFDC433EF
	for <linux-tegra@archiver.kernel.org>; Thu,  2 Sep 2021 19:28:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6FB3560F42
	for <linux-tegra@archiver.kernel.org>; Thu,  2 Sep 2021 19:28:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347384AbhIBT3G (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 2 Sep 2021 15:29:06 -0400
Received: from mail-ot1-f50.google.com ([209.85.210.50]:37806 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243515AbhIBT3G (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 2 Sep 2021 15:29:06 -0400
Received: by mail-ot1-f50.google.com with SMTP id i3-20020a056830210300b0051af5666070so3936046otc.4;
        Thu, 02 Sep 2021 12:28:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=m/WVOkYf8zMCeB0Htd9Y4czHm4q56hYufFumoOKAa78=;
        b=Qu8kmof0BJwOQrFRbzq72gvxmA5KmOFFhU5dzwKBIC6YIqz4/B7V+Oq2QYZTQ/I2Fa
         B1q92PxPFCUEpetQzFMA1wQIxcos3qGL0Qemt/JJWCnnBUJ0fc3uUC8A8C7Of/rl1DGk
         I9yZDovfwtJgJRipQVEsZvdg2djF0hcokvZ82z1vcUM+PXQE3eE61EBwj/TXjAECSQxK
         iFIbpJYOAgpPIVy30zcOYks7p2Y19Iv96jNOBXuMhSkMrSbrTfZxetdaw3qja0LajLDQ
         3pc4yaECaBqnVTZ3w3uHf4OK2QStXsk+AU3ZLyrzXEFLMUkY/NtfpzL/rJ8+zWr+Xqo5
         nYog==
X-Gm-Message-State: AOAM531FUmXbKGdyH+6PsjU2zOMLtnlrutTHhpuj/YiIvYMswWNcridG
        aLuk6QUXHO6sS2eGHHX1hQ==
X-Google-Smtp-Source: ABdhPJzrIgQcHIrxJDMYkFaoqLDV9CU+oZ0ddQ2nDFfqe3jdbik2bk1LWsjDAFVLoB9iKneiwv/EtQ==
X-Received: by 2002:a05:6830:3115:: with SMTP id b21mr4251122ots.240.1630610887169;
        Thu, 02 Sep 2021 12:28:07 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id l3sm540732ooo.7.2021.09.02.12.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Sep 2021 12:28:06 -0700 (PDT)
Received: (nullmailer pid 1248879 invoked by uid 1000);
        Thu, 02 Sep 2021 19:28:05 -0000
Date:   Thu, 2 Sep 2021 14:28:05 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sameer Pujar <spujar@nvidia.com>
Cc:     jonathanh@nvidia.com, jbrunet@baylibre.com, stephan@gerhold.net,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        thierry.reding@gmail.com, robh+dt@kernel.org, broonie@kernel.org,
        lgirdwood@gmail.com
Subject: Re: [PATCH v2 2/3] ASoC: Use schema reference for sound-name-prefix
Message-ID: <YTElxe4wwe8LPQqE@robh.at.kernel.org>
References: <1630562033-13231-1-git-send-email-spujar@nvidia.com>
 <1630562033-13231-3-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1630562033-13231-3-git-send-email-spujar@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, 02 Sep 2021 11:23:52 +0530, Sameer Pujar wrote:
> Use schema reference for 'sound-name-prefix' property wherever
> necessary.
> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Stephan Gerhold <stephan@gerhold.net>
> Cc: Rob Herring <robh+dt@kernel.org>
> ---
>  .../devicetree/bindings/sound/nvidia,tegra186-dspk.yaml          | 9 +++------
>  .../devicetree/bindings/sound/nvidia,tegra210-dmic.yaml          | 9 +++------
>  Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml | 9 +++------
>  Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml         | 9 +++------
>  Documentation/devicetree/bindings/sound/rt5659.txt               | 2 +-
>  Documentation/devicetree/bindings/sound/simple-audio-mux.yaml    | 9 +++------
>  6 files changed, 16 insertions(+), 31 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
