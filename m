Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC80BC433ED
	for <linux-tegra@archiver.kernel.org>; Mon, 17 May 2021 16:33:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C87B5611C2
	for <linux-tegra@archiver.kernel.org>; Mon, 17 May 2021 16:33:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238356AbhEQQen (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 17 May 2021 12:34:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244391AbhEQQeG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 17 May 2021 12:34:06 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37B39C059CB3;
        Mon, 17 May 2021 08:23:30 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id v9so8038279lfa.4;
        Mon, 17 May 2021 08:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2OqPCWblZqQUHbVbXGLguvvYFLYM5hl9NYVI5IJeouQ=;
        b=RqAK24xE5a+KAYZ0qaHplXQMkqJIw1N75QY8lR00aGJXkps0nhL0ugQGfnvL808F6r
         gj/nuFRULXt+HO29bNE7eNnkouyaZdoCIxg0Ug5ROMPOoqP6dma0YPTp/pmAnoWxlw03
         fNcLUlNx3BzQoC5ht043qZvlinMqoa0DbpNU/AMlJAKITMmTZrHSOUUHxtl/cQy6v1Hc
         a/Jwt4H6f5qA4o26hCIB6j7CdmPFFQ7MtkyMtxXT/5o1hGdApl4LpRTs7dTlWRwO7LXb
         aRFWA07qz4XOx6bDacw7+ewxUDvWl1rWwuDLKWQhossNn8RiX1YXcAnb8EJZRieiSqnp
         T92w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2OqPCWblZqQUHbVbXGLguvvYFLYM5hl9NYVI5IJeouQ=;
        b=nXqIu/35uUZXL1DprkmnYpFv8Od7eLyEx6av3AJEJPUuvPwUtqZfql5Wr/xV8UnqaE
         SaqgJmsESO91miGIIanqEF+qVdKG24+EEoLGriKNM1TTit/kKPJIsFLQuEXgNYFHXtRt
         4U3A94ItDQ76Nk7mVAuZUuqsd9gD4i6fKXvsu3KjV15++Fbtvpj9P/cXYWnWwd7yt/Fw
         yGi7hO6ny1lJBxv+KXIHBQT4a03bvYZ9j6KtdPgjzRAJybLWsmrjhXTIM3SHOcKgPq76
         zzY06gvZ0yCHqZnoRMQ8ppRABXIChp5iTfyqla6KI8UQxZ1txWKAP+HP0qA+rV2XaKFl
         nUGg==
X-Gm-Message-State: AOAM531pNI2+nzJuEnjvNlOkBUEwt4K3+bMjexi2LvPhP11BFEW27KJQ
        9Q2/uFsm3902w1iY3RXx4BhBCl7TPvM=
X-Google-Smtp-Source: ABdhPJxHcSgi3Z6+dri4Znutzp1ikREyb8zwg9DjuRYhjhJP76La3Tdo3WJGmIZ9jIdpjogKBmiS0g==
X-Received: by 2002:a05:6512:3251:: with SMTP id c17mr287867lfr.431.1621265008637;
        Mon, 17 May 2021 08:23:28 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.googlemail.com with ESMTPSA id a15sm1089438lfo.244.2021.05.17.08.23.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 May 2021 08:23:28 -0700 (PDT)
Subject: Re: [PATCH v1 1/1] soc/tegra: Add
 devm_tegra_core_dev_init_opp_table()
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Paul Fertser <fercerpav@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210516205138.22501-1-digetx@gmail.com>
 <20210516205138.22501-2-digetx@gmail.com>
 <3ea6b48f-af3f-51db-8d7b-1292a68ae74e@canonical.com>
 <a3b42449-4cd8-f692-c41a-205cbaa987eb@gmail.com>
 <d56d1e1e-73fe-9708-34ec-e31f10e17b44@canonical.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <203ffe4d-2b8e-7550-2fab-f5e3c7b5f4fe@gmail.com>
Date:   Mon, 17 May 2021 18:23:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <d56d1e1e-73fe-9708-34ec-e31f10e17b44@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

17.05.2021 17:52, Krzysztof Kozlowski пишет:
>>>> +static int tegra_core_dev_init_opp_state(struct device *dev)
>>>> +{
>>>> +	struct dev_pm_opp *opp;
>>>> +	unsigned long rate;
>>>> +	struct clk *clk;
>>>> +	int err;
>>>> +
>>>> +	clk = devm_clk_get(dev, NULL);
>>>> +	if (IS_ERR(clk)) {
>>>> +		dev_err(dev, "failed to get clk: %pe\n", clk);
>>>> +		return PTR_ERR(clk);
>>>> +	}
>>>> +
>>>> +	rate = clk_get_rate(clk);
>>>> +	if (!rate) {
>>>> +		dev_err(dev, "failed to get clk rate\n");
>>>> +		return -EINVAL;
>>>> +	}
>>>> +
>>>> +	opp = dev_pm_opp_find_freq_ceil(dev, &rate);
>>>> +
>>>> +	if (opp == ERR_PTR(-ERANGE))
>>>> +		opp = dev_pm_opp_find_freq_floor(dev, &rate);
>>>> +
>>>> +	err = PTR_ERR_OR_ZERO(opp);
>>>> +	if (err) {
>>>> +		dev_err(dev, "failed to get OPP for %ld Hz: %d\n",
>>>> +			rate, err);
>>>> +		return err;
>>>> +	}
>>>> +
>>>> +	dev_pm_opp_put(opp);
>>>> +
>>>> +	/* first dummy rate-setting initializes voltage vote */
>>>> +	err = dev_pm_opp_set_rate(dev, rate);
>>>> +	if (err) {
>>>> +		dev_err(dev, "failed to initialize OPP clock: %d\n", err);
>>>> +		return err;
>>>> +	}
>>>
>>> The devm_pm_opp_set_clkname will call clk_get(), so here you should drop
>>> the clk reference at the end. Why having it twice?
>> The devm_pm_opp_set_clkname assigns clock to the OPP table.
>>
>> The devm_clk_get() is needed for the clk_get_rate(). OPP core doesn't
>> initialize voltage vote and we need this initialization for the Tegra
>> memory drivers.
> I did not get the answer to my question. Why you need to keep the clk
> reference past this point? Why you cannot drop it after getting rate?
> 
>> The reference count of the clk will be dropped automatically once device
>> driver is released. The resource-managed helper avoids the need to care
>> about the error unwinding in the code, making it clean and easy to follow.
> I am not saying there is a leak.
> 

The clk reference is not needed past this point. It doesn't hurt to have
additional reference since this allows to make code cleaner.
