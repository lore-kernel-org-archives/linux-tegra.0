Return-Path: <SRS0=MwlS=EF=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F423FC00A89
	for <linux-tegra@archiver.kernel.org>; Fri, 30 Oct 2020 18:32:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9302720791
	for <linux-tegra@archiver.kernel.org>; Fri, 30 Oct 2020 18:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604082779;
	bh=418ZTXMPeQHnL0BZS9vcwOS5LJdprcwiT62MqDCdnXE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=cdg2cCfDRQE9Ey1rTV9br6A3dTgR5++XVpAyxvsoLsMjLuL5CSJSiL53KQEsGBgUi
	 ayk/84eihlZvpaOkecUzYRZijoaEMk+PKpKRlU4JWJ+IqSTGhVDbXQaNrJAolPxcVy
	 SBESMVFWuaDtaR2tSWJ/HNtUHBWVO5hjvQBd2hok=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726077AbgJ3Sc7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 30 Oct 2020 14:32:59 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:39274 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727159AbgJ3Sc6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 30 Oct 2020 14:32:58 -0400
Received: by mail-ot1-f66.google.com with SMTP id z16so1243124otq.6;
        Fri, 30 Oct 2020 11:32:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=U11U1RUcXJQMVTzn4DAQFEhylkdQvUKwt78eo7W7jVI=;
        b=CChnYa7ay8Edl5BXAL6DeaFawt2YwH85MshKc2TTcZhdZdZYg9VYxtFY+PnCJRbY2A
         oufEzXsPm8o/MFQONrWpO/BhFC3BnlkLHhW/XSELJSzkdI/13ZvQCwjKVODRvaQoJhg0
         +88we/St3XurhwdejHwwKKHk7m7oVoS6C4UfgUnGyVa7GRQiC3dkb88LjMUqPKam9U3g
         uSQhrcBo7/RrdKz1iaOIIkwzWLzcDKTAGtxbFg39muL6zJHChbeL09Ko3MRfu/3K92He
         eSeHsmz2Dv+Y9EiK8ZaKrtQa9RbGbZqqa31b0+oGh8AePMmL18IQTHtJWB92BN8T563K
         MBbg==
X-Gm-Message-State: AOAM533Plz2cSIlXT8JPuAuC1Fdn8U/2fzBOGoED6c6JeiPM3tGyC7+g
        /KCCVnk+AS5cRwJspFCOBg==
X-Google-Smtp-Source: ABdhPJydLUAT3cGVwlYDKmLSTYmAxhTmAahEfuKb37pqdf9FFUjUpuAye1WCcA8uXXxsDHaC/qDyow==
X-Received: by 2002:a05:6830:1089:: with SMTP id y9mr248688oto.191.1604082778089;
        Fri, 30 Oct 2020 11:32:58 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id u22sm1485907oor.13.2020.10.30.11.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 11:32:57 -0700 (PDT)
Received: (nullmailer pid 4112164 invoked by uid 1000);
        Fri, 30 Oct 2020 18:32:56 -0000
Date:   Fri, 30 Oct 2020 13:32:56 -0500
From:   Rob Herring <robh@kernel.org>
To:     Vidya Sagar <vidyas@nvidia.com>
Cc:     kyarlagadda@nvidia.com, kthota@nvidia.com,
        lorenzo.pieralisi@arm.com, linux-kernel@vger.kernel.org,
        mmaddireddy@nvidia.com, linux-tegra@vger.kernel.org,
        robh+dt@kernel.org, sagar.tv@gmail.com,
        amurray@thegoodpenguin.co.uk, thierry.reding@gmail.com,
        jonathanh@nvidia.com, jckuo@nvidia.com, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: Fix entry name for I/O High Voltage
 property
Message-ID: <20201030183256.GA4112134@bogus>
References: <20201026063902.14744-1-vidyas@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201026063902.14744-1-vidyas@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, 26 Oct 2020 12:09:01 +0530, Vidya Sagar wrote:
> Correct the name of the I/O High Voltage Property from
> 'nvidia,io-high-voltage' to 'nvidia,io-hv'.
> 
> Fixes: 2585a584f844 ("pinctrl: Add Tegra194 pinctrl DT bindings")
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> ---
>  .../devicetree/bindings/pinctrl/nvidia,tegra194-pinmux.txt      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
