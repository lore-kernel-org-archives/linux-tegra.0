Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1869C433B4
	for <linux-tegra@archiver.kernel.org>; Tue, 18 May 2021 18:14:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D18476135C
	for <linux-tegra@archiver.kernel.org>; Tue, 18 May 2021 18:14:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232858AbhERSP5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 18 May 2021 14:15:57 -0400
Received: from mail-ot1-f43.google.com ([209.85.210.43]:34654 "EHLO
        mail-ot1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbhERSP5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 18 May 2021 14:15:57 -0400
Received: by mail-ot1-f43.google.com with SMTP id u25-20020a0568302319b02902ac3d54c25eso9489810ote.1;
        Tue, 18 May 2021 11:14:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MqzmUfFQvWACmELeeJIeSI5XVhxUZgmOCwYifMZTRQk=;
        b=jSYmrixJ77OY/BT0LF7IRv9wbVYhFx/SlNZbGPkrkyt2Go6YIlvTfhKv9XQYC6a8Sl
         GyBMuwi5yTlKm73gF2ugmjW9ZkEn1/X/7rzmVxXi9+yKg5wzrb+CWTClD9nYx7BMTiFS
         Gbmth/WnCy+trMSX26KO34jsWIfTY9gPfVBE41a8ybw6/XqEyYgfvfOV9tvWKZF5StEq
         SoHkbUUKyNet7tMdtQhVErHqhPIa9Dr0NetCkGchZKsvgvEVLiTw5TtY5cDSzPYGIQqX
         Xy05bfkBD1Apgki/Wp/b22RV06D3E/DUHzWjE/ZP+y8B1/HWiFhMWZZbg3ysUvg8gYuW
         0qsg==
X-Gm-Message-State: AOAM533+PM1qXFl1hPDzCgfPT9BYXicsM2IUCr52WU/ZzCx73snMzWLn
        +WEX3YAdatJg/wfSyeq7CQ==
X-Google-Smtp-Source: ABdhPJz0l2e+YzveBfbUDExvUUb4ozSZ0fEA9Sg7/956oxQts1fxdYml8imxKkVA8bXCFfL8lQBASA==
X-Received: by 2002:a9d:7410:: with SMTP id n16mr5276878otk.262.1621361678442;
        Tue, 18 May 2021 11:14:38 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id o80sm3844961ooo.41.2021.05.18.11.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 11:14:37 -0700 (PDT)
Received: (nullmailer pid 968440 invoked by uid 1000);
        Tue, 18 May 2021 18:14:35 -0000
Date:   Tue, 18 May 2021 13:14:35 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Ion Agorria <ion@agorria.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] of: base: Export of_device_compatible_match()
Message-ID: <20210518181435.GB949047@robh.at.kernel.org>
References: <20210518001356.19227-1-digetx@gmail.com>
 <20210518001356.19227-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210518001356.19227-2-digetx@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, May 18, 2021 at 03:13:55AM +0300, Dmitry Osipenko wrote:
> The of_device_compatible_match() will be used by the updated NVIDIA Tegra
> ASoC WM8903 driver which could be build as a loadable module, export the
> OF function.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/of/base.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 48e941f99558..eeca92467531 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -556,6 +556,7 @@ int of_device_compatible_match(struct device_node *device,
>  
>  	return score;
>  }
> +EXPORT_SYMBOL(of_device_compatible_match);

I should document this, but there's a number of of_* functions that have 
only a few users and I want to get rid of. This is one of them. Grep 
this function and you'll notice most should be using 
of_machine_is_compatible instead and we're left with sunxi_mbus...

Rob
