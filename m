Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 745F1C2B9F4
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Jun 2021 12:47:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5A1496120A
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Jun 2021 12:47:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231689AbhFQMtJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Jun 2021 08:49:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230473AbhFQMtI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Jun 2021 08:49:08 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03325C061574;
        Thu, 17 Jun 2021 05:47:00 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id p7so10262569lfg.4;
        Thu, 17 Jun 2021 05:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=r/Phzu7bjrEKdlhTrW87VC5bOCa9s6yypu708VamqUg=;
        b=V+/6qPueqNv2eJf47RZRXdqdDWmhAT08TDW/JYPs3WbJUN3ProYHLkncBwwYYvVgQk
         ncY12AUH2y595XbeaUoSWEGzYEDRrNOpRFSG7TwtgsQf2Pi3fpkX9WVo6nf0v3BsL7g3
         YGsAUS60HJeqGjljrduvog3/kAZMxfPxh8n+lszzDVJKwgddGlZzYDmPrgewCAAQTmMl
         KuXr9W/egmqV61kGkuGcAHJv1e7PXbRcZ83Wmag1khtx//vfgWwCCXnWehtf1vD8ukTP
         09XVvNo5/XVKZrG8+J1GFV5hpV1unHSiGPxpFXnsh1YiEyjyqosAJa0DDFu1aKDQQpDc
         db1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=r/Phzu7bjrEKdlhTrW87VC5bOCa9s6yypu708VamqUg=;
        b=OUudUxbdHVeQLe0WzY5zhjAFXVJspq5T0+09jhIvhHmZXajHJhuj8HNObjHD+/bGEg
         eYUTN/bfQIKcb4mkiECYxQ+QHDOiBvZT6Cj0B5GJiWuxij7a4Gx0HjgzvvBL3tRRxJpd
         eRecf3PeXR97zbggi8bCEiHWMq7BGgwBafzmzR0SZqrALl26cmgbH6L7ehTIcua4Nf9i
         u+YClzMydCgXxAJLvAwkpVZ73fmS4v6eNQEwt+n09+BM7YqDp8CadQaqNlCKGcNMNXTE
         FCorxzB3szdbJJE+arcHtbw2ozGUyAan0Q7XyzZGhCJDswbvgqGjfqBCTfi8QImEXAvy
         Qo2Q==
X-Gm-Message-State: AOAM532uuu0KxgbpbXwLymyR2Lzu6ROPuFyaVCjwKIwXfmUzuC3/XL0x
        Vq9Ogp6gzmjw9KhWIVPX1wYYqhkmQYw=
X-Google-Smtp-Source: ABdhPJyZvxJ8DZDSNo4DKoKVvrsEkV3RZqEGYzVwIuFF49Cen5ncP6NQG4mkD8dK4Jxjpe0knZXRig==
X-Received: by 2002:a19:a407:: with SMTP id q7mr3870181lfc.68.1623934018213;
        Thu, 17 Jun 2021 05:46:58 -0700 (PDT)
Received: from [192.168.2.145] (94-29-29-31.dynamic.spd-mgts.ru. [94.29.29.31])
        by smtp.googlemail.com with ESMTPSA id m22sm719848ljj.45.2021.06.17.05.46.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jun 2021 05:46:57 -0700 (PDT)
Subject: Re: [PATCH -next] ASoC: tegra: Fix missing clk_disable_unprepare() on
 error path
To:     Zou Wei <zou_wei@huawei.com>, lgirdwood@gmail.com,
        broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
        thierry.reding@gmail.com, jonathanh@nvidia.com
Cc:     linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org
References: <1623929439-4289-1-git-send-email-zou_wei@huawei.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <fedff22c-2a25-0def-4980-8ba8ae75757b@gmail.com>
Date:   Thu, 17 Jun 2021 15:46:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1623929439-4289-1-git-send-email-zou_wei@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

17.06.2021 14:30, Zou Wei пишет:
> Fix the missing clk_disable_unprepare() before return
> from tegra_machine_hw_params() in the error handling case.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zou Wei <zou_wei@huawei.com>
> ---
>  sound/soc/tegra/tegra_asoc_machine.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
> index a53aec3..397f326 100644
> --- a/sound/soc/tegra/tegra_asoc_machine.c
> +++ b/sound/soc/tegra/tegra_asoc_machine.c
> @@ -306,6 +306,7 @@ static int tegra_machine_hw_params(struct snd_pcm_substream *substream,
>  
>  	err = snd_soc_dai_set_sysclk(codec_dai, clk_id, mclk, SND_SOC_CLOCK_IN);
>  	if (err < 0) {
> +		clk_disable_unprepare(machine->clk_cdev1);

It should be the opposite, the clock must be enabled here and it could
be re-enabled in the other error cases. In practice the chance of those
errors is close to zero, so we don't care about them since we will have
much bigger problems in that case.

>  		dev_err(card->dev, "codec_dai clock not set: %d\n", err);
>  		return err;
>  	}
> @@ -523,8 +524,10 @@ int tegra_asoc_machine_probe(struct platform_device *pdev)
>  	}
>  
>  	err = devm_snd_soc_register_card(dev, card);
> -	if (err)
> +	if (err) {
> +		clk_disable_unprepare(machine->clk_cdev1);

We also don't disable clock after removing driver module. This is
intentional because that clock is enabled to workaround obscure bug on
one of devboards that I can't reproduce. Ideally we should should fix
the bug and remove the clk-enable hack. So I'm not sure whether this is
a worthwhile "fix".
