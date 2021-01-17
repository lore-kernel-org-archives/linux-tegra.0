Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B005FC433DB
	for <linux-tegra@archiver.kernel.org>; Sun, 17 Jan 2021 23:32:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 67FAD2251F
	for <linux-tegra@archiver.kernel.org>; Sun, 17 Jan 2021 23:32:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730400AbhAQXcU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 17 Jan 2021 18:32:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729349AbhAQXcT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 17 Jan 2021 18:32:19 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8934FC061573;
        Sun, 17 Jan 2021 15:31:38 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id v67so21468545lfa.0;
        Sun, 17 Jan 2021 15:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=H8Z9/ZSAEmrFlwkMVk+Nep1g2PRuUGd/OosI/Tv5lXU=;
        b=JQu0gkJL/B6HWq2ogRHgtMZLnQLXsJOVvt+rI116ay6gI/1lMjFX5HG8utTEIS9PX0
         kJ3pNAyXpW3CZ8YUIFC+fB51sG2e4Jsq7Hp/GhYW8l8TPc8bWNDAHm99fvrkDP/yyHOy
         fqkdHhnqTFsm48UEhxJ6ceTMnwWQRBxUiQBPlsMytcWhwoOMvHWTfyxHi+nFWoWcBmAP
         1PsilHTJFi8+Zd2JHYkZvEzfEExitcnf/3J7J/7AtJF/7q9X4x6+OCZOfeCglFl0RcXm
         XQ1S/+IcGXCaYVjv4kK3tTYwi6bcuL07fPHHGcndj+1WFjW2woYXyeSoUE6eAQgJuVeK
         a8Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=H8Z9/ZSAEmrFlwkMVk+Nep1g2PRuUGd/OosI/Tv5lXU=;
        b=MX47LJzkBLKnxwkgPL3hAjh3dV+I5JptIeIkXfpTa4fNed4XWKabCQ3hd0CIffe2eP
         unZiuooz7vu3oua0iqe8l9JRnm70mnHe+409hQy9BRTpyG6fz1w31o5jdJeiOH4B2kIm
         YWe31k6jRFfmSxPDd880xpOk8Hs2GWhMuIdcAll3J7HIZgTWIXUeTLgwqSeMjlYC8sTl
         hkrAs1vvWWxzaGWyNsma4JjUqeoRZOR5oenDAyLfP1mmv6FRcxE3pgQ74/Q1e1BfJz1a
         5TlU1+PXbzyTGYn6CMS40WxWbLfoc5zPL86UmPSlxcXG1+R5AKzNr2FgBmeDvcWXuZOd
         eXuA==
X-Gm-Message-State: AOAM531pRJeWOJtih2V00aX9RtnRC2Je8dyjFFS3m1gL85Ck9/P7u2fR
        bR4YF/YpL6SL7i2K8jRWHeEJtsblYq0=
X-Google-Smtp-Source: ABdhPJy/vM8U2unQrywODC5Emgj5gvRF91iUTa4Q5N7Bh8b9f0OsJb2+9RRhl4ybkEkyC7BdEJCYUg==
X-Received: by 2002:a19:48e:: with SMTP id 136mr10074687lfe.357.1610926296882;
        Sun, 17 Jan 2021 15:31:36 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id e9sm1700913lft.104.2021.01.17.15.31.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Jan 2021 15:31:36 -0800 (PST)
Subject: Re: [PATCH v1 1/5] ALSA: hda/tegra: Use clk_bulk helpers
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210112125834.21545-1-digetx@gmail.com>
 <20210112125834.21545-2-digetx@gmail.com> <YAGzJM7BJqLV0xxY@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b84c6d9f-e113-e249-cd76-248e2cd646ff@gmail.com>
Date:   Mon, 18 Jan 2021 02:31:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <YAGzJM7BJqLV0xxY@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

15.01.2021 18:22, Thierry Reding пишет:
...
>>  static int hda_tegra_first_init(struct azx *chip, struct platform_device *pdev)
>>  {
>>  	struct hda_tegra *hda = container_of(chip, struct hda_tegra, chip);
>> @@ -495,7 +441,11 @@ static int hda_tegra_probe(struct platform_device *pdev)
>>  		return err;
>>  	}
>>  
>> -	err = hda_tegra_init_clk(hda);
>> +	hda->clocks[hda->nclocks++].id = "hda";
>> +	hda->clocks[hda->nclocks++].id = "hda2hdmi";
>> +	hda->clocks[hda->nclocks++].id = "hda2codec_2x";
> 
> Originally the code did this in this order: "hda", "hda2codec_2x" and
> "hda2hdmi". I don't expect the exact order to be very relevant, but was
> there any particular reason to change it?

The reason was "to make code look nicer". This was a conscious decision
since indeed the clocks order shouldn't matter for this driver.
