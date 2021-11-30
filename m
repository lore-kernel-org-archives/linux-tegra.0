Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5267CC433F5
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Nov 2021 01:29:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236182AbhK3BcX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 29 Nov 2021 20:32:23 -0500
Received: from mail-ot1-f50.google.com ([209.85.210.50]:33630 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbhK3BcW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Nov 2021 20:32:22 -0500
Received: by mail-ot1-f50.google.com with SMTP id 35-20020a9d08a6000000b00579cd5e605eso28179020otf.0;
        Mon, 29 Nov 2021 17:29:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YIVCC2AuT9fW74wWn6WPnb/tEa/jMUCd2A/efeYY8os=;
        b=ZlxKygGa5uxI7WhgaSD9tFRhQefzl1075eq7rL3rgc5Aah0hyNCEk2hBMEZspvcpwY
         Ku1hO9jXjSMUl4N3bMxj26Ya7i4EZdW/FlVE1CsaEYtFBcT6zjaH0thHrzF/EhjFYBak
         5EBbDZEkiIcXZf0SUpp+qed23jcsL9W2yC0XTjS1eW8zZkaeccGLBDHgIB5pj6Ol50Mq
         6LvQUZU9PbEeH5sU+VjPaMYkoK2nbqIObxipqTCZeY+eEc943IKB8+qbkkKfTejSfqcK
         ZXlo3aYZLSZ8Zb1vUiLM3EvhCWYR1mrZC/BR/d3e+D8lg+XWd7px9fKaEsO125pGUePT
         SzVA==
X-Gm-Message-State: AOAM530L3TdWHQgITw0wUtcwy/IXXnCyYyEKosXZ5cUpOCFDWk9NuJBJ
        LpNo6D8Dp4evczl6rkEKSw==
X-Google-Smtp-Source: ABdhPJzeeHSkvHc2wC/ryJwNiVhXAHLKmgS+bri3WDaDqp/VnQdrVCaDwSrXS7mrxgZ1gQeZt3+X8A==
X-Received: by 2002:a05:6830:270c:: with SMTP id j12mr48087345otu.231.1638235743501;
        Mon, 29 Nov 2021 17:29:03 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id a12sm2959855otk.35.2021.11.29.17.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 17:29:02 -0800 (PST)
Received: (nullmailer pid 975148 invoked by uid 1000);
        Tue, 30 Nov 2021 01:29:02 -0000
Date:   Mon, 29 Nov 2021 19:29:02 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 01/16] dt-bindings: misc: Convert Tegra MISC to
 json-schema
Message-ID: <YaV+XhEueXJVHMC1@robh.at.kernel.org>
References: <20211119143839.1950739-1-thierry.reding@gmail.com>
 <20211119143839.1950739-2-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211119143839.1950739-2-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 19 Nov 2021 15:38:24 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the device tree bindings for the MISC register block found on
> NVIDIA Tegra SoCs from plain text to json-schema format.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../bindings/misc/nvidia,tegra186-misc.txt    | 14 -----
>  .../bindings/misc/nvidia,tegra186-misc.yaml   | 43 ++++++++++++++++
>  .../bindings/misc/nvidia,tegra20-apbmisc.txt  | 17 -------
>  .../bindings/misc/nvidia,tegra20-apbmisc.yaml | 51 +++++++++++++++++++
>  4 files changed, 94 insertions(+), 31 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/misc/nvidia,tegra186-misc.txt
>  create mode 100644 Documentation/devicetree/bindings/misc/nvidia,tegra186-misc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/misc/nvidia,tegra20-apbmisc.txt
>  create mode 100644 Documentation/devicetree/bindings/misc/nvidia,tegra20-apbmisc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
