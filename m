Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5671BC433F5
	for <linux-tegra@archiver.kernel.org>; Mon, 29 Nov 2021 00:22:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359871AbhK2AZT (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 28 Nov 2021 19:25:19 -0500
Received: from mail-ot1-f47.google.com ([209.85.210.47]:46625 "EHLO
        mail-ot1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344104AbhK2AXT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 28 Nov 2021 19:23:19 -0500
Received: by mail-ot1-f47.google.com with SMTP id b5-20020a9d60c5000000b0055c6349ff22so23037383otk.13;
        Sun, 28 Nov 2021 16:20:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Tmn8UPuYCbbaAu9yuKqOIAL/Z3VCsmY2MYHurrVcL6I=;
        b=0zZlOCwGmp9UpDRhMGTp+YnoAzqY4t6S4UbMzJjHW3HHLERgP1wYQ3Peq6T2HifZuc
         wCdPYlTo5tovwvTLzNJ0vQ3niWr2wxQRfeQK/MeSpdvnsL4nm3NUSPaUf1/LX48RxpQN
         96kKwf4kJHhSFcp43KyTK0shKPDncDfVtwNr8QFqpHSI13shX00y4ulqvdC7Jr5INRTy
         Wsm4G7kbObSpnY8gX5i6pFkexCkj6+zahCx3fXRQqQ9wfsbOyFyuF0MPKi3Jmvg0qB3g
         MVgjAflMDd7TqIHbmr+cuZlL+lpo4pN2Nd7IiuRkGgYDECCO0urqbmTEjlhYGAideWf2
         ddpA==
X-Gm-Message-State: AOAM530vvdRXT+yean+yeWo1a40t9C5oZ0RNmbI/Z/4sRpZzNfyz6Eyu
        kAyQ1g1J8PsaaUhfSJsf/w==
X-Google-Smtp-Source: ABdhPJxgP+4Ec1L+bfIw9v66vTNZr0gLUBgMY59qf0MCtqMYqS9ZuJ839D9e1DwN0GzbL/OnlM16aA==
X-Received: by 2002:a9d:749a:: with SMTP id t26mr43471407otk.96.1638145202357;
        Sun, 28 Nov 2021 16:20:02 -0800 (PST)
Received: from robh.at.kernel.org ([172.58.99.242])
        by smtp.gmail.com with ESMTPSA id w18sm2376042otm.1.2021.11.28.16.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 16:20:01 -0800 (PST)
Received: (nullmailer pid 2876190 invoked by uid 1000);
        Mon, 29 Nov 2021 00:19:59 -0000
Date:   Sun, 28 Nov 2021 18:19:59 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        linux-tegra@vger.kernel.org,
        Mikko Perttunen <mperttunen@nvidia.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH V3 1/2] dt-bindings: Add YAML bindings for NVENC and NVJPG
Message-ID: <YaQcr5ntuVmsQMgy@robh.at.kernel.org>
References: <20211117095608.60415-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211117095608.60415-1-jonathanh@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, 17 Nov 2021 09:56:07 +0000, Jon Hunter wrote:
> Add YAML device tree bindings for the Tegra NVENC and NVJPG Host1x
> engines.
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
> Changes since V2:
> - Fixed indentation
> Changes since V1:
> - Fixed errors reported by Rob's bot
> 
>  .../gpu/host1x/nvidia,tegra210-nvenc.yaml     | 135 ++++++++++++++++++
>  .../gpu/host1x/nvidia,tegra210-nvjpg.yaml     |  94 ++++++++++++
>  2 files changed, 229 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvenc.yaml
>  create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvjpg.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
