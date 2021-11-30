Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 627DAC433EF
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Nov 2021 01:45:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236902AbhK3BtQ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 29 Nov 2021 20:49:16 -0500
Received: from mail-ot1-f52.google.com ([209.85.210.52]:33454 "EHLO
        mail-ot1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229827AbhK3BtP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Nov 2021 20:49:15 -0500
Received: by mail-ot1-f52.google.com with SMTP id 35-20020a9d08a6000000b00579cd5e605eso28224861otf.0;
        Mon, 29 Nov 2021 17:45:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yN8bskB1/yPWw4DEqDJXoboAw0OZ5yut5wU4Hm1cBls=;
        b=zIlyYlfoOejosT3iTwFAezuBw8okM94EO5IJkGkhA5Le604BE5/h/XTadZQiw7gRiS
         Jjmf94EZpnUGhj75Mn1nvzaJ5iVy0N65tAlAVJoI+RwUujH1lNdNU7Gm/8hBAO3kbj5X
         NCEH0UnoLg3RpoFs29zLGosEMUPTBxOxLZ6gTYKlAqiWM7Bp4dYUEo5GGtZdUgs1BQIt
         ozy/YdEiin3nca5p2sf6BWOxnhOiiDMolgD+Cgu06p0Xa5Jv6vRcBsXYv2xVdoMZ6IoU
         uN0nkc7AmdzQB7A53Y23LHUafpp/daYCeqw3JVTMMuxMhDsTSwBehnJZ/JPdi2f6Dn25
         1HrQ==
X-Gm-Message-State: AOAM530YzATR2vXjKIMXI7T+AdoGeW8O99x8UUmELajAghFO8Rke2W78
        QTg1BtF3nR1ZhGlMkUNHaw==
X-Google-Smtp-Source: ABdhPJwvrOGOafcresqeF/zwP46gYLkL73MwJ2Twh78SfxgJXg+WLK2ZrmftNkeB+htGMC1Lq2oJig==
X-Received: by 2002:a9d:5190:: with SMTP id y16mr48824734otg.364.1638236757165;
        Mon, 29 Nov 2021 17:45:57 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id m12sm2959921ots.59.2021.11.29.17.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 17:45:56 -0800 (PST)
Received: (nullmailer pid 999397 invoked by uid 1000);
        Tue, 30 Nov 2021 01:45:55 -0000
Date:   Mon, 29 Nov 2021 19:45:55 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 16/16] dt-bindings: serial: Document Tegra234 TCU
Message-ID: <YaWCU6n9q5nkd8df@robh.at.kernel.org>
References: <20211119143839.1950739-1-thierry.reding@gmail.com>
 <20211119143839.1950739-17-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211119143839.1950739-17-thierry.reding@gmail.com>
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

Acked-by: Rob Herring <robh@kernel.org>
