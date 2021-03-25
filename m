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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F5FAC433C1
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 15:06:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5005D61A02
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 15:06:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230372AbhCYPGN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 25 Mar 2021 11:06:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230242AbhCYPFw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Mar 2021 11:05:52 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09DB2C06174A;
        Thu, 25 Mar 2021 08:05:52 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id u9so3507462ljd.11;
        Thu, 25 Mar 2021 08:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7RcTgadN1TUXN3W2iKmjC/8qnntHUEdCcz8BIRBIozo=;
        b=M7tBiZGb6F8WVKmoMnXZuzz2pnJ3BZrYvcEaO0/2YjBr1CIEEx4VUZB0EwQsLmsQJE
         SXsIdfsJTkjOXCDUzJtL8Ii0mPp5S3Q2ypCOxsLe7mA5VGu+FZvJCjC+rimXKMsQNbxD
         6WNtcIbi9KFg33a4LLZysKG4PGpVS+VZK3h8w1gXqDl0xLr0TzJjAjvAmuF4YE0bIsjR
         SwKbpLKdbezBcaHGRp4BYRIoRZ7bMb23sxihCVIkYUGPZ+RvSD+HFOWDt6He3dVBN+Qm
         dIiMimX//9X0i13UUBS3aTw/gtL5ehKFyDfr9ZzMeryx8HJ6PKywVFHR4X+CRRjOyxL+
         5nDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7RcTgadN1TUXN3W2iKmjC/8qnntHUEdCcz8BIRBIozo=;
        b=V4evvAHKCnhmhjP3ZU2YkHawd9X/OUkZuADQbqKM0XJLT7NAiOcFH5Kjzq3kHC4sJ6
         5ZPfJ7pogmQupwGj2wG/D+MDPl0VmQ/TFWYlqVT1tDU0e1Grl3WA9frRvR7ruhrXBBzR
         JdSqma04IrzCBw3SRDF5nh7siAW8ps6cdPq1oKldz59oPAyJPoW7hWpKvV/zJknHNNT7
         9giGCmpsF9XZn3YPLMcx2GjtCI5WWECTumlFfrmdIEt0oa4GPM6yoOAkQU+qv4j0sDHf
         CTywcKBIQump3EBD6reYSJMmSe1Rfbd/80KEDP6t5frbVlQz01X8Pu575s5n3yc4+56h
         xxyA==
X-Gm-Message-State: AOAM5330MO5IIt0o7lPswCG8n40SoFEt0oJ8QeVxdGh/SWgEMepUtY3G
        hcvHxMNa6+5sNcMK7YPFH1qFwy5sg/M=
X-Google-Smtp-Source: ABdhPJwLp6WhaXL+Rix/X8SXRoEBaHjU81LRyts5SXg66QT5gSGF/VDrr1wINuuSgLlKTOWzNXKxPw==
X-Received: by 2002:a2e:908a:: with SMTP id l10mr6221981ljg.38.1616684750275;
        Thu, 25 Mar 2021 08:05:50 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-60.dynamic.spd-mgts.ru. [109.252.193.60])
        by smtp.googlemail.com with ESMTPSA id w14sm572497lfl.305.2021.03.25.08.05.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Mar 2021 08:05:49 -0700 (PDT)
Subject: Re: [PATCH v4 3/5] soc/tegra: pmc: Ensure that clock rates aren't too
 high
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210302122502.20874-1-digetx@gmail.com>
 <20210302122502.20874-4-digetx@gmail.com> <YFygotHKjgPQ/R4G@orome.fritz.box>
 <a730ef9d-1bf7-32a3-4797-6273ad139d25@gmail.com>
Message-ID: <ad58e9d7-f867-5dc4-642f-02ffc16109ce@gmail.com>
Date:   Thu, 25 Mar 2021 18:05:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <a730ef9d-1bf7-32a3-4797-6273ad139d25@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

25.03.2021 18:02, Dmitry Osipenko пишет:
> 25.03.2021 17:39, Thierry Reding пишет:
>> On Tue, Mar 02, 2021 at 03:25:00PM +0300, Dmitry Osipenko wrote:
>>> Switch all clocks of a power domain to a safe rate which is suitable
>>> for all possible voltages in order to ensure that hardware constraints
>>> aren't violated when power domain state toggles.
>>>
>>> Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
>>> Tested-by: Nicolas Chauvet <kwizart@gmail.com> # PAZ00 T20 and TK1 T124
>>> Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>> ---
>>>  drivers/soc/tegra/pmc.c | 92 ++++++++++++++++++++++++++++++++++++++++-
>>>  1 file changed, 90 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
>>> index f970b615ee27..a87645fac735 100644
>>> --- a/drivers/soc/tegra/pmc.c
>>> +++ b/drivers/soc/tegra/pmc.c
>>> @@ -237,6 +237,7 @@ struct tegra_powergate {
>>>  	unsigned int id;
>>>  	struct clk **clks;
>>>  	unsigned int num_clks;
>>> +	unsigned long *clk_rates;
>>>  	struct reset_control *reset;
>>>  };
>>>  
>>> @@ -641,6 +642,57 @@ static int __tegra_powergate_remove_clamping(struct tegra_pmc *pmc,
>>>  	return 0;
>>>  }
>>>  
>>> +static int tegra_powergate_prepare_clocks(struct tegra_powergate *pg)
>>> +{
>>> +	unsigned long safe_rate = 100 * 1000 * 1000;
>>
>> This seems a bit arbitrary. Where did you come up with that value?
>>
>> I'm going to apply this to see how it fares in our testing.
> 
> This value is chosen based on the OPP table voltages and frequencies.
> 
> Maybe you could add this clarifying comment to the code(?):
> 
> "There is no hardware unit on any of Tegra SoCs which requires higher
> voltages for the rates above 100MHz."

I meant below, of course :)
