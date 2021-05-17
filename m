Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D336C433B4
	for <linux-tegra@archiver.kernel.org>; Mon, 17 May 2021 14:21:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3FA4A6143F
	for <linux-tegra@archiver.kernel.org>; Mon, 17 May 2021 14:21:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239194AbhEQOWR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 17 May 2021 10:22:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239476AbhEQOUS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 17 May 2021 10:20:18 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32A9FC061237;
        Mon, 17 May 2021 07:09:48 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id y9so7430460ljn.6;
        Mon, 17 May 2021 07:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ekVWOzxFNo3Z6IetXdeO7ete5WRacjN7K7wXm46m9JI=;
        b=Y1UNXA1dDnxigz7B4TIqtAe6/gsDAiaVQDaZaYxe3YIZj9YtdtNFYqMQKilfa1BwT4
         3fMXEFpMycesElPd//ByP7+dGzqjPbQbE/9KGQ3Lp/5ncuc8MDoJxe0kE/IabDsi1Z9l
         cpQPbK/EkKyNQbG6/vkl8elZZSkF+yJvAkjn4aTQC8OjPX++nJKDKy13PJIeb+FzaSI1
         ypLKko5E4cBtYG3fK2iN0xfkAD39AXhwaEIibgrbzBkYgMdUjFUwJt0jTjd1Vy35Yl8R
         emv6kGUyKROUomQMO491PuolKzUe3FzpsQm7ek6zviituMjXmkV8/QwX9fnDbsvKp+DG
         RhQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ekVWOzxFNo3Z6IetXdeO7ete5WRacjN7K7wXm46m9JI=;
        b=A3Z/UH7OMF1BoklHJMedCrkyM/LFNW8qrgQOSFxdJ4vH80NpJ/Q5uDuwfR8MbqXmvR
         lvGdy74DStgHL6MsrjXkK3YhBKDWoWv47SdevAr7Sy4H9PgcQsV5JsOSwQXAyApbY5/z
         FdfPZIV5bl23+pm7Y3CB9SPKrwEDS+D4u0dJRmJrn3f3ucYyG/7hpOnuMWsPUudMKJeq
         WBWxWjA8eFPJ/+xIRTL7j7dXAN8bBnxrLY8v1Fdn55KQpx3EQbp6P1PDQdylEF0MoMNT
         9tcTTLAl9LbcVcV7yHT40mqThLxGRs+j/AmqZRujmPOD5PXL4W9TInalcIRqAy9+vWoz
         YthA==
X-Gm-Message-State: AOAM531qHtYIDbukzTq5fzB8DDAjlC5RbdfG3C+bAu6vhE5OMT9zWLY0
        4Hqe7Xy6RJe9d/7s9Pa1PUcUltQ1J3o=
X-Google-Smtp-Source: ABdhPJyPFHPAgpwmjrOkPzJvTF7hXVf40zH4gKfssBN2eC8ZBhL467fig/79fFWajAxgVXf4q059fA==
X-Received: by 2002:a2e:a30c:: with SMTP id l12mr48969447lje.501.1621260586491;
        Mon, 17 May 2021 07:09:46 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.googlemail.com with ESMTPSA id x12sm2928586ljc.70.2021.05.17.07.09.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 May 2021 07:09:46 -0700 (PDT)
Subject: Re: [PATCH v1 1/1] soc/tegra: Add
 devm_tegra_core_dev_init_opp_table()
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Paul Fertser <fercerpav@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210516205138.22501-1-digetx@gmail.com>
 <20210516205138.22501-2-digetx@gmail.com>
 <20210517033705.uw5kfj46k6w6ptcl@vireshk-i7>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d43f5c65-eacc-e953-f2ef-3151d9229729@gmail.com>
Date:   Mon, 17 May 2021 17:09:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517033705.uw5kfj46k6w6ptcl@vireshk-i7>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

17.05.2021 06:37, Viresh Kumar пишет:
> I am not sure why you divided this into three different patchsets,
> while it should really have been one. Like this one just adds the API
> but doesn't use it.

Previously Krzysztof Kozlowski asked to split the large series into smaller sets which could be reviewed and applied separately by maintainers. He suggested that the immutable branch is a better option, I decided to implement this suggestion. So far I only sent out the memory patches which make use of the new helper, there will be more patches. The memory patches are intended to show that this helper can be utilized right now. My plan was to finalize this patch first, then Thierry will apply it and I will be able to sent the rest of the patches telling that they depend on the immutable branch.

I'll merge this helper patch and the memory patches into a single series in v2. 

> On 16-05-21, 23:51, Dmitry Osipenko wrote:
>> Add common helper which initializes OPP table for Tegra SoC core devices.
>>
>> Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
>> Tested-by: Paul Fertser <fercerpav@gmail.com> # PAZ00 T20
>> Tested-by: Nicolas Chauvet <kwizart@gmail.com> # PAZ00 T20 and TK1 T124
>> Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/soc/tegra/common.c | 112 +++++++++++++++++++++++++++++++++++++
>>  include/soc/tegra/common.h |  30 ++++++++++
>>  2 files changed, 142 insertions(+)
>>
>> diff --git a/drivers/soc/tegra/common.c b/drivers/soc/tegra/common.c
>> index 3dc54f59cafe..c3fd2facfc2d 100644
>> --- a/drivers/soc/tegra/common.c
>> +++ b/drivers/soc/tegra/common.c
>> @@ -3,9 +3,16 @@
>>   * Copyright (C) 2014 NVIDIA CORPORATION.  All rights reserved.
>>   */
>>  
>> +#define dev_fmt(fmt)	"tegra-soc: " fmt
>> +
>> +#include <linux/clk.h>
>> +#include <linux/device.h>
>> +#include <linux/export.h>
>>  #include <linux/of.h>
>> +#include <linux/pm_opp.h>
>>  
>>  #include <soc/tegra/common.h>
>> +#include <soc/tegra/fuse.h>
>>  
>>  static const struct of_device_id tegra_machine_match[] = {
>>  	{ .compatible = "nvidia,tegra20", },
>> @@ -31,3 +38,108 @@ bool soc_is_tegra(void)
>>  
>>  	return match != NULL;
>>  }
>> +
>> +static int tegra_core_dev_init_opp_state(struct device *dev)
>> +{
>> +	struct dev_pm_opp *opp;
>> +	unsigned long rate;
>> +	struct clk *clk;
>> +	int err;
>> +
>> +	clk = devm_clk_get(dev, NULL);
>> +	if (IS_ERR(clk)) {
>> +		dev_err(dev, "failed to get clk: %pe\n", clk);
>> +		return PTR_ERR(clk);
>> +	}
>> +
>> +	rate = clk_get_rate(clk);
>> +	if (!rate) {
>> +		dev_err(dev, "failed to get clk rate\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	opp = dev_pm_opp_find_freq_ceil(dev, &rate);
>> +
>> +	if (opp == ERR_PTR(-ERANGE))
>> +		opp = dev_pm_opp_find_freq_floor(dev, &rate);
>> +
>> +	err = PTR_ERR_OR_ZERO(opp);
>> +	if (err) {
>> +		dev_err(dev, "failed to get OPP for %ld Hz: %d\n",
>> +			rate, err);
>> +		return err;
>> +	}
> 
> Why do you need to do this floor/ceil thing? Why can't you simply do
> set-rate ? 

The previous versions of this patch had this comment:

/*
 * dev_pm_opp_set_rate() doesn't search for a floor clock rate and it
 * will error out if default clock rate is too high, i.e. unsupported
 * by a SoC hardware version.  Hence find floor rate by ourselves.
 */

I removed it because it appeared to me that it should be obvious why this is needed. The reason why it was added in the first place is that the tegra-clk driver initializes some clock rates to values that aren't supported by all hardware versions in accordance to the OPP tables, although technically those higher rates work okay in practice, this made dev_pm_opp_set_rate() to fail without fixing up the clock rate.

You might be right that this is not necessary anymore, the code changed since the last time it was needed. I'll re-check it for the v2. Thank you for the review.
