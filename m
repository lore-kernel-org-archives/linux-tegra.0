Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E9E5C43461
	for <linux-tegra@archiver.kernel.org>; Mon, 17 May 2021 14:56:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 86159610A0
	for <linux-tegra@archiver.kernel.org>; Mon, 17 May 2021 14:56:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237194AbhEQO5h (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 17 May 2021 10:57:37 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:42885 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241845AbhEQOyG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 17 May 2021 10:54:06 -0400
Received: from mail-qt1-f200.google.com ([209.85.160.200])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1liebv-0000UL-3u
        for linux-tegra@vger.kernel.org; Mon, 17 May 2021 14:52:47 +0000
Received: by mail-qt1-f200.google.com with SMTP id w15-20020ac857cf0000b02901e11cd2e82fso5369414qta.12
        for <linux-tegra@vger.kernel.org>; Mon, 17 May 2021 07:52:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5YT3ArZkIAvGWeYJPmgevYctfMIJLv6m5yBthvtx2HM=;
        b=QDO0mu2RcocpVLdn/6OCVDirNACl0Zv2yrzoShyqxMFZ+aJYjHVTl28kGWbGQcNJM8
         LuBfq00WCfY5O0vlNYX36UxMUrby21EAW7wYdfZfX3z+L2SARZbd4YXZN20dU4D97iv7
         tIMAiT8d2ePmgYO5IvgN/xAd48eL26oeLyxEf1qGkJG6F8iNO7H05vBlprPtwMPGNKXD
         mYSPD/ALno5q3pWBt9ilJOQqokSQ+x6wEF0NYphZiDH3YGBRyUFm0s+DfV6nWUpTBgeE
         Kc3Rzi5DlBZsl4V9rLXVd4KpwDODRdREMzicNzALBtysxmbdqR4gcEQUeevJGGe8sg6J
         58bA==
X-Gm-Message-State: AOAM533UWKyr/49FA5D6jUWla1wBxe1i2bVUdDm8C4RMUP10OPqnLVoL
        lIm50zjcTZzJtV89il5GXpZHfiyXfQfTRU2N6b0Pj1OTSoEtJZ6kD9GyqJK94QGlMOOMOas35FI
        4qKbwWN6sSdB4Zg7JDF7G4l5caECqv9gfE3FiZNOY
X-Received: by 2002:ad4:5613:: with SMTP id ca19mr93502qvb.3.1621263166306;
        Mon, 17 May 2021 07:52:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwz1sTR2nEo8tVy3soUcg7dJtwe6XA2FzYNjxD+WxF5X8O633T/gloDETC7dA01uBs4CI398A==
X-Received: by 2002:ad4:5613:: with SMTP id ca19mr93463qvb.3.1621263166122;
        Mon, 17 May 2021 07:52:46 -0700 (PDT)
Received: from [192.168.1.4] ([45.237.48.1])
        by smtp.gmail.com with ESMTPSA id h65sm10642727qkd.112.2021.05.17.07.52.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 May 2021 07:52:45 -0700 (PDT)
Subject: Re: [PATCH v1 1/1] soc/tegra: Add
 devm_tegra_core_dev_init_opp_table()
To:     Dmitry Osipenko <digetx@gmail.com>,
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
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <d56d1e1e-73fe-9708-34ec-e31f10e17b44@canonical.com>
Date:   Mon, 17 May 2021 10:52:41 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <a3b42449-4cd8-f692-c41a-205cbaa987eb@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 17/05/2021 10:47, Dmitry Osipenko wrote:
> 17.05.2021 14:43, Krzysztof Kozlowski пишет:
> ...
>>> +static int tegra_core_dev_init_opp_state(struct device *dev)
>>> +{
>>> +	struct dev_pm_opp *opp;
>>> +	unsigned long rate;
>>> +	struct clk *clk;
>>> +	int err;
>>> +
>>> +	clk = devm_clk_get(dev, NULL);
>>> +	if (IS_ERR(clk)) {
>>> +		dev_err(dev, "failed to get clk: %pe\n", clk);
>>> +		return PTR_ERR(clk);
>>> +	}
>>> +
>>> +	rate = clk_get_rate(clk);
>>> +	if (!rate) {
>>> +		dev_err(dev, "failed to get clk rate\n");
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	opp = dev_pm_opp_find_freq_ceil(dev, &rate);
>>> +
>>> +	if (opp == ERR_PTR(-ERANGE))
>>> +		opp = dev_pm_opp_find_freq_floor(dev, &rate);
>>> +
>>> +	err = PTR_ERR_OR_ZERO(opp);
>>> +	if (err) {
>>> +		dev_err(dev, "failed to get OPP for %ld Hz: %d\n",
>>> +			rate, err);
>>> +		return err;
>>> +	}
>>> +
>>> +	dev_pm_opp_put(opp);
>>> +
>>> +	/* first dummy rate-setting initializes voltage vote */
>>> +	err = dev_pm_opp_set_rate(dev, rate);
>>> +	if (err) {
>>> +		dev_err(dev, "failed to initialize OPP clock: %d\n", err);
>>> +		return err;
>>> +	}
>>
>>
>> The devm_pm_opp_set_clkname will call clk_get(), so here you should drop
>> the clk reference at the end. Why having it twice?
> 
> The devm_pm_opp_set_clkname assigns clock to the OPP table.
> 
> The devm_clk_get() is needed for the clk_get_rate(). OPP core doesn't
> initialize voltage vote and we need this initialization for the Tegra
> memory drivers.

I did not get the answer to my question. Why you need to keep the clk
reference past this point? Why you cannot drop it after getting rate?

> The reference count of the clk will be dropped automatically once device
> driver is released. The resource-managed helper avoids the need to care
> about the error unwinding in the code, making it clean and easy to follow.

I am not saying there is a leak.

> 
> ...
>>> +EXPORT_SYMBOL_GPL(devm_tegra_core_dev_init_opp_table);
>>> diff --git a/include/soc/tegra/common.h b/include/soc/tegra/common.h
>>> index 98027a76ce3d..e8eab13aa199 100644
>>> --- a/include/soc/tegra/common.h
>>> +++ b/include/soc/tegra/common.h
>>> @@ -6,6 +6,36 @@
>>>  #ifndef __SOC_TEGRA_COMMON_H__
>>>  #define __SOC_TEGRA_COMMON_H__
>>>  
>>> +#include <linux/errno.h>
>>> +#include <linux/types.h>
>>> +
>>> +struct device;
>>> +
>>> +/**
>>> + * Tegra SoC core device OPP table configuration
>>> + *
>>> + * @init_state: pre-initialize OPP state of a device
>>> + */
>>> +struct tegra_core_opp_params {
>>> +	bool init_state;
>>> +};
>>> +
>>> +#ifdef CONFIG_ARCH_TEGRA
>>>  bool soc_is_tegra(void);
>>> +int devm_tegra_core_dev_init_opp_table(struct device *dev,
>>> +				       struct tegra_core_opp_params *params);
>>> +#else
>>> +static inline bool soc_is_tegra(void)
>>
>> This looks unrelated. Please make it a separate patch.
> 
> The missing stub for soc_is_tegra() popped up multiple times before.
> Hence it didn't look like a bad idea to me to add stub for it since this
> patch touches code around it.
> 
> I'll factor it out into a separate patch in v2.

Thanks!


Best regards,
Krzysztof
