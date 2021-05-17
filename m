Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 391EBC433ED
	for <linux-tegra@archiver.kernel.org>; Mon, 17 May 2021 13:47:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1C99361029
	for <linux-tegra@archiver.kernel.org>; Mon, 17 May 2021 13:47:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237512AbhEQNs5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 17 May 2021 09:48:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237511AbhEQNs5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 17 May 2021 09:48:57 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D012EC061573;
        Mon, 17 May 2021 06:47:39 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id f12so7349792ljp.2;
        Mon, 17 May 2021 06:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9e7zfBcBd7A/Xvu3PkPKu0pjzUxa1GWfBXHzfl9E570=;
        b=PrZdyOJqKOUek2FqnlPjbdD1anGIxKZ1HM6fk8hWPAX2d6ZqJ4n3KH8ZZl9+WlP31q
         jSu6wZ3/tOehlUE2tl+w9gEYhKIEoDsQ8dDoT0EGeWGwh9+cwfDLzNYLbJiFKdQ/Sf//
         1Sp1h9z6RhF993Gsl3eKjIrh38JceX0p9CMhoe1CjJMuqsdC0TuIn3FQvME5sr5684yA
         0VQikEPAfD0/of8svrmBTdtnr5HX8XCkBn8M1aMLLtCIywQAQoJNHJ/TXeUb5IB3UZkh
         OyWXj6REjPn898hmT/ncGBAnI+JxIiXq/ABeL6odiccbtVM/c57+FORXFePyNpSJw0Vw
         NsLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9e7zfBcBd7A/Xvu3PkPKu0pjzUxa1GWfBXHzfl9E570=;
        b=SSyI9q+KIDQlRo2IGs8J62mXx9Foqo9SjufX9tTJo1q42LRefSXLYHFbf9JXoCKPqV
         fEePDOZnJlzY6q2KwqBRot/GT0qxCYuT3YrPcN7YfB42YVEtqbBNJPaklPXHTkxohepv
         tIBtgRhFipV5JNM9OXBXj4pqOqxUrSYpTjJJa0PUrCia97kMfsm82C6DzMyPklUSqGDa
         /ULfYrk4bZtvoiX1xa5UaXqUHZ25wht8mL/+baoT/Jyyo197JbwLEm0fB6XWSj8mAUSo
         eLsx4ixD+JXzPSuCI4vcxELDjfp4IJGMPds8kn/oXZoAwRlvc9tXRXNNrZFFC7v/AWqY
         Z69w==
X-Gm-Message-State: AOAM531CofyhBm5yq5Yc4dZX/2+P0zeI75YwO1a6N2rwwpO8EO0tEd+z
        uF8QbVykx3Jzgvs8mg+JdVtKLxxxXJM=
X-Google-Smtp-Source: ABdhPJxq3aqCts1cBMnRl6Ni2/bjF59U5Ibji2h43oSZvIXB9q/82V9fZ3JtbZ+bOZYSSGWMFIsUCA==
X-Received: by 2002:a2e:b5d6:: with SMTP id g22mr49686115ljn.423.1621259258139;
        Mon, 17 May 2021 06:47:38 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.googlemail.com with ESMTPSA id l2sm1962641lfc.121.2021.05.17.06.47.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 May 2021 06:47:37 -0700 (PDT)
Subject: Re: [PATCH v2 3/4] memory: tegra124-emc: Fix compilation warnings on
 64bit platforms
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20210516161214.4693-1-digetx@gmail.com>
 <20210516161214.4693-4-digetx@gmail.com>
 <936cfc7d-737e-a582-ea60-ad2ba5b4ca72@canonical.com>
 <1d80ee0f-de4c-24d0-154f-20841874bf20@gmail.com>
 <4ea1bf29-c353-6fcf-5248-bfee67d5c361@canonical.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c120ecf5-7202-9f1d-6e70-a99db2f5335f@gmail.com>
Date:   Mon, 17 May 2021 16:47:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <4ea1bf29-c353-6fcf-5248-bfee67d5c361@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

17.05.2021 16:39, Krzysztof Kozlowski пишет:
> On 17/05/2021 09:35, Dmitry Osipenko wrote:
>> 17.05.2021 14:28, Krzysztof Kozlowski пишет:
>>> On 16/05/2021 12:12, Dmitry Osipenko wrote:
>>>> Fix compilation warning on 64bit platforms caused by implicit promotion
>>>> of 32bit signed integer to a 64bit unsigned value which happens after
>>>> enabling compile-testing of the driver.
>>>>
>>>> Suggested-by: Nathan Chancellor <nathan@kernel.org>
>>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>>> ---
>>>>  drivers/memory/tegra/tegra124-emc.c | 4 ++--
>>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/memory/tegra/tegra124-emc.c b/drivers/memory/tegra/tegra124-emc.c
>>>> index 5699d909abc2..c9eb948cf4df 100644
>>>> --- a/drivers/memory/tegra/tegra124-emc.c
>>>> +++ b/drivers/memory/tegra/tegra124-emc.c
>>>> @@ -272,8 +272,8 @@
>>>>  #define EMC_PUTERM_ADJ				0x574
>>>>  
>>>>  #define DRAM_DEV_SEL_ALL			0
>>>> -#define DRAM_DEV_SEL_0				(2 << 30)
>>>> -#define DRAM_DEV_SEL_1				(1 << 30)
>>>> +#define DRAM_DEV_SEL_0				(2u << 30)
>>>> +#define DRAM_DEV_SEL_1				(1u << 30)
>>>
>>> Why not using BIT()? This would make even this 2<<30 less awkard...
>>
>> The bitfield 31:30 is a enum, 3 is a wrong value. Formally it's
>> incorrect to use the BIT() macro here.
> 
> Why "3"? BIT(31) is the same as 2<<30.

By 3 I meant BIT(31)|BIT(30). This bitfield is explicitly designated as
a enum in the hardware documentation.

> It's common to use BIT for
> register fields which do not accept all possible values. Now you
> basically reimplement BIT() which is error-prone.

Could you please show couple examples? The common practice today is to
use FIELD_PREP helpers, but this driver was written before these helpers
existed.
