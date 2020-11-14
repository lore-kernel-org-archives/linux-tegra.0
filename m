Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF5DFC5519F
	for <linux-tegra@archiver.kernel.org>; Sat, 14 Nov 2020 05:56:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 913702224F
	for <linux-tegra@archiver.kernel.org>; Sat, 14 Nov 2020 05:56:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U2qxBSZo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726369AbgKNFzp (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 14 Nov 2020 00:55:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726367AbgKNFzp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 14 Nov 2020 00:55:45 -0500
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA65BC0613D1;
        Fri, 13 Nov 2020 21:55:44 -0800 (PST)
Received: by mail-io1-xd43.google.com with SMTP id n12so12047724ioc.2;
        Fri, 13 Nov 2020 21:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=28KMHK7WHb3PmjIuLt9tU5MoKaeMpTfWBvE3Nma3970=;
        b=U2qxBSZo6RJZQY+8KjTEPlrotMSfO10zE4KGuRZv4AG2EYUyWT/0TtlmdE3/uDAoCv
         qb/fG/zsvd6FASPpCIpp3MsGr47Md0yAplJpkePD0f75BLKSh5/LE8AXvtiqTlD2luOc
         4WaAYKjFfdyzmn5S3NcxD4LYYSk531Ec8bbruLxfgKEGQtzpw9wbF9gloJIz3TIpwuC/
         KAwg49CAP0WaGnj4NxRkVxPsBhrDNIMnB2Bv/8j9eass7ZtIvw5XIHEIXc2+A9wAI84G
         nZrXNeyg0+6RLZ/JYbCtx7g/Or70AaA/vpRGMAOz1kmv5PjQ25HWCPGy+g0+o+d2zZKX
         gOYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=28KMHK7WHb3PmjIuLt9tU5MoKaeMpTfWBvE3Nma3970=;
        b=nThP5rGV2gaxT30oxXeE0TUNkb3hQ8ibMhJm1OI5YnHtWquTUn7Si6ZFr06mPWn21Y
         nSyWpU4R/WSK+LzGSx+ATps06Q01vJ1089aRdwD8ZsYjyKI1pFO6LcJ944edTmk9kAWF
         Fdl4WAcvmYllU4EdrjpkIzvyYpkxL5pQA+/mPO6Pneht5ZYfAqTZaY+6JOB/m/UZjFPY
         2adXlVQSA1aSRqOVp5rV9ITCjxc813wv2X9deESwOI3KO7gu3BhQinZkWd1svSzwcwUf
         CayRHWCMM2uTVBIxn/XsDH2Lvae00yB207NLhkVU4bMtiN5tMief+wCsBzVIzzyqOjIe
         P/yg==
X-Gm-Message-State: AOAM5312ceO0CSDAs5eFptY+m6PsXmbJ2AYD47QVUAOhMtfZcBx738OY
        dL4KsFxDmEPA89fpk2vcalM=
X-Google-Smtp-Source: ABdhPJzmPgAY+kxhPB0nCvdwwe6zQ0W1CdMLR8LXk8rV3e9K1FrUHcpnodnNkJCMzxfjmici+XO5MQ==
X-Received: by 2002:a02:cc16:: with SMTP id n22mr4803268jap.52.1605333344178;
        Fri, 13 Nov 2020 21:55:44 -0800 (PST)
Received: from fedora-project ([195.181.168.216])
        by smtp.gmail.com with ESMTPSA id l11sm6038691ilj.16.2020.11.13.21.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 21:55:43 -0800 (PST)
Date:   Sat, 14 Nov 2020 00:55:40 -0500
From:   Nigel Christian <nigel.l.christian@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     krzk@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com,
        kernel-janitors@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] memory: tegra20-emc: remove redundant error message
Message-ID: <20201114055540.GA5516@fedora-project>
References: <20201114051219.GA4746@fedora-project>
 <1ab114f2-b63e-464d-2022-6571fbf02511@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1ab114f2-b63e-464d-2022-6571fbf02511@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sat, Nov 14, 2020 at 08:33:47AM +0300, Dmitry Osipenko wrote:
> 14.11.2020 08:12, Nigel Christian пишет:
> > There is no need for dev_err() since irq already prints an error. 
> > Eliminate unnecessary curly braces for single statement block.
> > 
> > Signed-off-by: Nigel Christian <nigel.l.christian@gmail.com>
> > ---
> >  drivers/memory/tegra/tegra20-emc.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> > 
> > diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
> > index 5e10aa97809f..181a360d7d6b 100644
> > --- a/drivers/memory/tegra/tegra20-emc.c
> > +++ b/drivers/memory/tegra/tegra20-emc.c
> > @@ -959,10 +959,8 @@ static int tegra_emc_probe(struct platform_device *pdev)
> >  	int irq, err;
> >  
> >  	irq = platform_get_irq(pdev, 0);
> > -	if (irq < 0) {
> > -		dev_err(&pdev->dev, "please update your device tree\n");
> > +	if (irq < 0)
> >  		return irq;
> > -	}
> >  
> >  	emc = devm_kzalloc(&pdev->dev, sizeof(*emc), GFP_KERNEL);
> >  	if (!emc)
> > 
> 
> This message has a special purpose, it shouldn't be removed. Please
> always check what auto-generated patches actually do.

Apologies, understood. Thank you for your time.
