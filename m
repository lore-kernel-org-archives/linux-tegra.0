Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1268C48BE6
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Jun 2021 19:19:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8C73061245
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Jun 2021 19:19:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232589AbhFPTVK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 16 Jun 2021 15:21:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232191AbhFPTVJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Jun 2021 15:21:09 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0411FC06175F
        for <linux-tegra@vger.kernel.org>; Wed, 16 Jun 2021 12:19:02 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id l7-20020a05600c1d07b02901b0e2ebd6deso2292678wms.1
        for <linux-tegra@vger.kernel.org>; Wed, 16 Jun 2021 12:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yjQYXquPSfp4MKH74/A3wiITHQsuloD60C8047bzcco=;
        b=hdrV2N4BWsFHvM8vnAmuajEAtGWPWDTU8Qf+Q8IswzH612u9iV+sn9Q4aJ+0gjrhgy
         ifCS7l0Jw/FoXdzvFCo/3rftJbRy8OAyk9zjJ+4ZbE5aI8IHCok5/TWSlDjhSqNn13B2
         wX2Ih0/3dN/1YK+lz84zTYY73ktW/C53ITF1SX9UB/cjgs/neQyv+ua2CotMsgAGcxiw
         0Nh/7m4s+lfT/bbDUJ8SrMJnJPgsFGysALidZ+DuSIQBG+ZIHKjs66qhqYpLYS7+WYEd
         MmqweEV7TNO57DpS99oby5ApZqHRPqXwSl76fXI7ZD3qHCFJa+P+u+IaVWB0xT4DG2ib
         Y3wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yjQYXquPSfp4MKH74/A3wiITHQsuloD60C8047bzcco=;
        b=Jd2P7zAIN3ZTOxNLMbj2oFhfpvPH0zmvvd/2wOIpN5ko1fp2Trczgbp+4SPEqMVmwn
         //cgofvZe9pG7rOozgAG6QYTYx9sgFrdZeCxETQWs6ZHKkao0GGSq3Ku+gI/COVAoBMb
         MpoOp/Sq71m7Lc64ZtU+jjoEfDmA48Pgd3H+EdvEGBPH0JaZ8cLoB0YCxLQro03rN1Qt
         boE/AshcumTnv8cc3/aSnTvLytvb5daGRyw7aycNVG1zh3R9M/5q3fADFTU/O/OAJPA9
         OqyM/4uWfUhFI9THUJ51t0Loh+OIQj6KAFdvb8dF3I8rDLmATtJFRsExGwayxqqenLoQ
         gwoA==
X-Gm-Message-State: AOAM532Bch/VQlW1nEgg8FnBUK1+7tG4SduboiJl9vrHrymogWwCnaW5
        flp4jZM9flXNu/G1sVfV/pbPO6LOXJpv0fd3
X-Google-Smtp-Source: ABdhPJxFgtVQdI5n9iwORw/50KziHniAznGliziCiHqWivbmq8GDfYByP0J94o0BJOOmjFfPk0GT/g==
X-Received: by 2002:a05:600c:204:: with SMTP id 4mr585639wmi.95.1623871140462;
        Wed, 16 Jun 2021 12:19:00 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:60a0:f51c:af6:2dab? ([2a01:e34:ed2f:f020:60a0:f51c:af6:2dab])
        by smtp.googlemail.com with ESMTPSA id p15sm2451112wmq.43.2021.06.16.12.18.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jun 2021 12:18:59 -0700 (PDT)
Subject: Re: [PATCH v1 2/5] soc/tegra: irq: Add stubs needed for compile
 testing
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20210606222817.12388-1-digetx@gmail.com>
 <20210606222817.12388-3-digetx@gmail.com>
 <92b521c6-f3fd-4f2c-de4f-3363e0384f55@linaro.org>
 <cb9d8a40-a64f-e37f-1487-272b2c4ac9ea@gmail.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <e1484aa5-392b-4ad5-4716-5937dd0e2be5@linaro.org>
Date:   Wed, 16 Jun 2021 21:18:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <cb9d8a40-a64f-e37f-1487-272b2c4ac9ea@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 16/06/2021 21:17, Dmitry Osipenko wrote:
> 16.06.2021 22:06, Daniel Lezcano пишет:
>> On 07/06/2021 00:28, Dmitry Osipenko wrote:
>>> Add stubs needed for compile-testing of tegra-cpuidle driver.
>>>
>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>> ---
>>>  include/soc/tegra/irq.h | 9 ++++++++-
>>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/include/soc/tegra/irq.h b/include/soc/tegra/irq.h
>>> index 8eb11a7109e4..94539551c8c1 100644
>>> --- a/include/soc/tegra/irq.h
>>> +++ b/include/soc/tegra/irq.h
>>> @@ -6,8 +6,15 @@
>>>  #ifndef __SOC_TEGRA_IRQ_H
>>>  #define __SOC_TEGRA_IRQ_H
>>>  
>>> -#if defined(CONFIG_ARM)
>>> +#include <linux/types.h>
>>> +
>>> +#if defined(CONFIG_ARM) && defined(CONFIG_ARCH_TEGRA)
>>
>> Does not CONFIG_ARCH_TEGRA depends on CONFIG_ARM ?
>>
>>>  bool tegra_pending_sgi(void);
> 
> ARM and ARM64, only ARM32 variant builds tegra_pending_sgi().

Ah, I see, thanks!


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
