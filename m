Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92C3FC433B4
	for <linux-tegra@archiver.kernel.org>; Mon, 17 May 2021 21:35:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 64E0A6128E
	for <linux-tegra@archiver.kernel.org>; Mon, 17 May 2021 21:35:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245201AbhEQVhP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 17 May 2021 17:37:15 -0400
Received: from mail-ot1-f52.google.com ([209.85.210.52]:44575 "EHLO
        mail-ot1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232924AbhEQVhP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 17 May 2021 17:37:15 -0400
Received: by mail-ot1-f52.google.com with SMTP id r26-20020a056830121ab02902a5ff1c9b81so6835448otp.11;
        Mon, 17 May 2021 14:35:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XPdlbaqLwEbxelncGzNkxhlDf0GmnJJ0Y3ECBpVsnQc=;
        b=NvBn1DYwmckUv/3a3TwNfL5LmJuBPR1Z5XMxMtp+13MCb6GIcelyGmnO0A4ubpfV7Z
         6TIqXI3xnyuA93Py6Yz2aKB+H433WcfCmEEEzutEwrbEsJSyM143yTfMVudtJFPo2Rwh
         jpP6uFlu0u0fkCJdAc8Swe3gJxQ+l/AHe7SJyAOtIL86vmLwdZ+tZ1LAMyvRTpLU0veI
         Int493Ozt4yE9nlY3Eokidd3TJxtoz07NID44Rb9jq+thyslbkpXH2ms44l/hXYHZs6K
         tHZj08hX4dc8mxhK7Lr3G8sOMkTtwswXDeegfevfp4shzGEAu2x7nHC1tre4XSnvQPxK
         DASg==
X-Gm-Message-State: AOAM532K3pht84+28NrWUUK9KhH8hRj8AtjXXTFQ+jizIKGtVXlbb9RD
        llSisYe/exdS0r2dM/mTgw==
X-Google-Smtp-Source: ABdhPJy5R0OV5QZ4VZ4nYQRLK3iULnhu/xdvLPZ60UxcSHkTEXdEyHyKte/+dsU9ACBHlr6Pdl2I5g==
X-Received: by 2002:a9d:58c1:: with SMTP id s1mr1254300oth.361.1621287357107;
        Mon, 17 May 2021 14:35:57 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 34sm3343602otf.38.2021.05.17.14.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 14:35:55 -0700 (PDT)
Received: (nullmailer pid 3242373 invoked by uid 1000);
        Mon, 17 May 2021 21:35:54 -0000
Date:   Mon, 17 May 2021 16:35:54 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Matt Merhar <mattmerhar@protonmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Ihor Didenko <tailormoon@rambler.ru>,
        Ion Agorria <ion@agorria.com>, linux-kernel@vger.kernel.org,
        Zhang Rui <rui.zhang@intel.com>,
        Maxim Schwalm <maxim.schwalm@gmail.com>,
        devicetree@vger.kernel.org, Peter Geis <pgwipeout@gmail.com>,
        Andreas Westman Dorcsak <hedmoo@yahoo.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, Amit Kucheria <amitk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v1 1/7] dt-bindings: thermal: Add binding for Tegra30
 thermal sensor
Message-ID: <20210517213554.GA3242321@robh.at.kernel.org>
References: <20210510223816.18565-1-digetx@gmail.com>
 <20210510223816.18565-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210510223816.18565-2-digetx@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, 11 May 2021 01:38:10 +0300, Dmitry Osipenko wrote:
> All NVIDIA Tegra30 SoCs have on-chip sensors which monitor temperature
> and voltage of the SoC. Sensors also controls CPU x2 freq throttle and
> emits emergency shutdown signal. TSENSOR has has two separate channels
> for each sensor placed in a different parts of the SoC. Add binding for
> the sensor hardware.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../thermal/nvidia,tegra30-tsensor.yaml       | 78 +++++++++++++++++++
>  1 file changed, 78 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/thermal/nvidia,tegra30-tsensor.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
