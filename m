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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6DA9C433DB
	for <linux-tegra@archiver.kernel.org>; Mon, 18 Jan 2021 00:03:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C19D4222BB
	for <linux-tegra@archiver.kernel.org>; Mon, 18 Jan 2021 00:03:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729975AbhARAD1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 17 Jan 2021 19:03:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726785AbhARADW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 17 Jan 2021 19:03:22 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 068E8C061574;
        Sun, 17 Jan 2021 16:02:42 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id f17so16387720ljg.12;
        Sun, 17 Jan 2021 16:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pw1+hLYn2JEcquNck3UFBQ0wnTeToO3O8iHRUlofEyY=;
        b=lfho4XP9TDb4OXFlcCHozgchA2+O0wiV/Px4hhbEW1N0+RQbemVCyqJ5ANsgz6YXB9
         qg6jn5Fw6rAagT+q9rsDHFnSkSe3zxzcWfB705i9IfEUpWQguIgLuUte1zWjumCy9NHc
         Zr1R+fPf9C1P6DiGACtVbWd4qWm23YAclswEu1bludi1Tfq3HoZytJPCoMKK0ByDaTEi
         TYMdJ9y0R9LxKqqELnTjTV021lo6bDPpxaqSReFXmWEwN9jkPi6eOxvB+Vu7S6BOxMqr
         zPOEUP+2scgnIfwOM3ruJBnhHVwR/FlU62UGalhGN7kuhFH8as0gwlJfZmiv5s3XF/5f
         yTww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pw1+hLYn2JEcquNck3UFBQ0wnTeToO3O8iHRUlofEyY=;
        b=FEeVqmCPBqby5O0OYBuimDJg9P+/7ZLF6TnYAdmlnZQ9NkhggmzOgrOwYfZHU7m4mc
         lElfbmAAe05hKirkPvSq2vMwCrim+NgUTS4A4DfUYyArSzmrZrQR64ZwMnYl/EzCC3lq
         LlzwkFfYzAp0O6/xpbhMLddNw7535k37epOaLaKe2CwlgLHZQ0GKAgKKjktsUsA2Nc3e
         CmtuG2k15vyyaq3f7UBlZ42XL1Avn+ITh5rH7wSoBqJ1WauRr+ZSxLhC3kYATv2v/yCn
         pkwwyhLEdUrr93k8ks+wow6xGYJS9s8dsJjraRljKlJjaKZsEq3DUMTrjFg4unb7wObt
         tVWg==
X-Gm-Message-State: AOAM532FmFUmahhBKAZ+04ogkpvskAbbZh0zfzCLGHa1k3V/qlN/TGXe
        +YH4jhkNQx2lyKe8I3Wlcq4p0Knq7yk=
X-Google-Smtp-Source: ABdhPJxeybrzkgl0vuGHulMBJf3JOFIvuy1UWfaeFhbL0aScHR/h49K85FH+KomPRSkNaxkYTeoFLA==
X-Received: by 2002:a2e:b0d2:: with SMTP id g18mr9246073ljl.357.1610928160186;
        Sun, 17 Jan 2021 16:02:40 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id 192sm1701965lfa.219.2021.01.17.16.02.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Jan 2021 16:02:39 -0800 (PST)
Subject: Re: [PATCH v1 5/5] ASoC: tegra: ahub: Reset hardware properly
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210112125834.21545-1-digetx@gmail.com>
 <20210112125834.21545-6-digetx@gmail.com> <YAG4aFADwo7dh/oR@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c2f3d149-0781-3d0a-1d68-f6820386e84d@gmail.com>
Date:   Mon, 18 Jan 2021 03:02:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <YAG4aFADwo7dh/oR@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

15.01.2021 18:44, Thierry Reding пишет:
> On Tue, Jan 12, 2021 at 03:58:34PM +0300, Dmitry Osipenko wrote:
>> Assert hardware reset before clocks are enabled and then de-assert it
>> after clocks are enabled. This brings hardware into a predictable state
>> and removes relying on implicit de-assertion of resets which is done by
>> the clk driver.
>>
>> Tested-by: Peter Geis <pgwipeout@gmail.com>
>> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  sound/soc/tegra/tegra30_ahub.c | 33 ++++++++++++++++-----------------
>>  sound/soc/tegra/tegra30_ahub.h |  1 +
>>  2 files changed, 17 insertions(+), 17 deletions(-)
>>
>> diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
>> index 4dbb58f7ea36..246cf6a373a1 100644
>> --- a/sound/soc/tegra/tegra30_ahub.c
>> +++ b/sound/soc/tegra/tegra30_ahub.c
>> @@ -65,10 +65,20 @@ static int tegra30_ahub_runtime_resume(struct device *dev)
>>  {
>>  	int ret;
>>  
>> +	ret = reset_control_assert(ahub->reset);
>> +	if (ret)
>> +		return ret;
>> +
>>  	ret = clk_bulk_prepare_enable(ahub->nclocks, ahub->clocks);
>>  	if (ret)
>>  		return ret;
>>  
>> +	ret = reset_control_reset(ahub->reset);
>> +	if (ret) {
>> +		clk_bulk_disable_unprepare(ahub->nclocks, ahub->clocks);
>> +		return ret;
>> +	}
>> +
>>  	regcache_cache_only(ahub->regmap_apbif, false);
>>  	regcache_cache_only(ahub->regmap_ahub, false);
>>  
>> @@ -462,7 +472,6 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
>>  {
>>  	const struct of_device_id *match;
>>  	const struct tegra30_ahub_soc_data *soc_data;
>> -	struct reset_control *rst;
>>  	struct resource *res0;
>>  	void __iomem *regs_apbif, *regs_ahub;
>>  	int ret = 0;
>> @@ -475,22 +484,6 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
>>  		return -EINVAL;
>>  	soc_data = match->data;
>>  
>> -	/*
>> -	 * The AHUB hosts a register bus: the "configlink". For this to
>> -	 * operate correctly, all devices on this bus must be out of reset.
>> -	 * Ensure that here.
>> -	 */
>> -	rst = of_reset_control_array_get_exclusive(pdev->dev.of_node);
>> -	if (IS_ERR(rst)) {
>> -		dev_err(&pdev->dev, "Can't get reset: %p\n", rst);
>> -		return PTR_ERR(rst);
>> -	}
>> -
>> -	ret = reset_control_deassert(rst);
>> -	reset_control_put(rst);
>> -	if (ret)
>> -		return ret;
>> -
>>  	ahub = devm_kzalloc(&pdev->dev, sizeof(struct tegra30_ahub),
>>  			    GFP_KERNEL);
>>  	if (!ahub)
>> @@ -507,6 +500,12 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
>>  	if (ret)
>>  		return ret;
>>  
>> +	ahub->reset = devm_reset_control_array_get_exclusive(&pdev->dev);
>> +	if (IS_ERR(ahub->reset)) {
>> +		dev_err(&pdev->dev, "Can't get reset: %p\n", ahub->reset);
> 
> I didn't notice that the prior patch already introduced this, but I'd
> prefer for this to either be %pe so that the symbolic error name is
> printed, or %ld with PTR_ERR(ahub->reset) to format this in a more
> standard way that can be more easily grepped for and parsed.

This is already fixed in v2. Good catch anyways, thanks.

> It also seems like the prior patch that converts this to use
> of_reset_control_array_get_exclusive() is a bit pointless now. Why not
> just move to this directly instead?

These are two independent changes. The previous patch fixed the missing
resets, this patch changes the hardware initialization logic.
