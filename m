Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BC93C433DB
	for <linux-tegra@archiver.kernel.org>; Sat, 27 Mar 2021 18:50:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6395D619CB
	for <linux-tegra@archiver.kernel.org>; Sat, 27 Mar 2021 18:50:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230126AbhC0Stl (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 27 Mar 2021 14:49:41 -0400
Received: from mail-ot1-f51.google.com ([209.85.210.51]:38520 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230043AbhC0St3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 27 Mar 2021 14:49:29 -0400
Received: by mail-ot1-f51.google.com with SMTP id w21-20020a9d63950000b02901ce7b8c45b4so8410229otk.5;
        Sat, 27 Mar 2021 11:49:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=t9vjwbvSA4d41LnakPvjiWArh3waV0/TTjrDzhlkYGw=;
        b=GrCusGQ4G6GfOsD8Dm25EWJrfAbl0Zia3LUA++nn+JHpc+tSE8f2VhnoiYBC9H8/Uy
         ndUvgcswy29P3PYCs1DjBgQAZ3RoWxTKnZuqxoIXMlVsqnRf7nJoMf5FBVobVjecm6xk
         SO8HtFBQK32xB4ioAtbUMwkQXlBTN9zbYL5rILNJX0H5v+T4iibNI24KNQdcEwtZjQ1A
         ywQcA3fjwjLQIsLLcyvNj2sEPDBM2IEppImuzBMBDmraicIF8QaV7t9+8jh6y1x9Gs1+
         tQjGiSFxY/CdtgQwPI8aFeAXkETss5OARZDFkR/uUgwEcvWqFFrcO1iEfUrCPSZn0RUN
         Fc3w==
X-Gm-Message-State: AOAM531Sls0YNzI4QvdWGUeQ4ZgEKtyYZfOKjlC5yb5EGVCgO9spYDpN
        XiVCqNQmtXPvKY/B9lSdWg==
X-Google-Smtp-Source: ABdhPJzcEQ/l3YzGg0qv1bIIijL8QD6vUoMjgfYQ79J1paaFNbOt8kLJUpdjEWD2HDxAhjgSM4fHyQ==
X-Received: by 2002:a9d:6855:: with SMTP id c21mr13398834oto.146.1616870968778;
        Sat, 27 Mar 2021 11:49:28 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.99.41])
        by smtp.gmail.com with ESMTPSA id x18sm3016496otr.73.2021.03.27.11.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 11:49:28 -0700 (PDT)
Received: (nullmailer pid 376600 invoked by uid 1000);
        Sat, 27 Mar 2021 18:49:25 -0000
Date:   Sat, 27 Mar 2021 12:49:25 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: serial: tegra-tcu: Document "reg"
 property
Message-ID: <20210327184925.GA367052@robh.at.kernel.org>
References: <20210326174641.1612738-1-thierry.reding@gmail.com>
 <20210326174641.1612738-3-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210326174641.1612738-3-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Mar 26, 2021 at 06:46:40PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> In order to support early console support with the Tegra TCU, add an
> optional "reg" property that points to the TX mailbox.

This will mean the same address in in DT twice which we try to avoid, 
right? I guess it's fine, we could drop it if we ever enforce that. I'm 
sure there's worse abuses with duplicates than this.

> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../devicetree/bindings/serial/nvidia,tegra194-tcu.yaml     | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/serial/nvidia,tegra194-tcu.yaml b/Documentation/devicetree/bindings/serial/nvidia,tegra194-tcu.yaml
> index 0a321658ccb5..8c9ed7cfaa52 100644
> --- a/Documentation/devicetree/bindings/serial/nvidia,tegra194-tcu.yaml
> +++ b/Documentation/devicetree/bindings/serial/nvidia,tegra194-tcu.yaml
> @@ -24,6 +24,9 @@ properties:
>    compatible:
>      const: nvidia,tegra194-tcu
>  
> +  reg:
> +    maxItems: 1
> +
>    mbox-names:
>      items:
>        - const: rx
> @@ -48,8 +51,9 @@ examples:
>    - |
>      #include <dt-bindings/mailbox/tegra186-hsp.h>
>  
> -    tcu: tcu {
> +    tcu: tcu@c168000 {

While you're here:

serial@...

>          compatible = "nvidia,tegra194-tcu";
> +        reg = <0x0c168000 0x4>;
>          mboxes = <&hsp_top0 TEGRA_HSP_MBOX_TYPE_SM 0>,
>                   <&hsp_aon TEGRA_HSP_MBOX_TYPE_SM 1>;
>          mbox-names = "rx", "tx";
> -- 
> 2.30.2
> 
