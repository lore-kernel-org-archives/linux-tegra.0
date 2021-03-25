Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA6CEC433C1
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 15:03:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A5B0C61A0F
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 15:03:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230419AbhCYPC7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 25 Mar 2021 11:02:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230337AbhCYPCw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Mar 2021 11:02:52 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5FB8C06174A;
        Thu, 25 Mar 2021 08:02:50 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id y1so3497959ljm.10;
        Thu, 25 Mar 2021 08:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rdZBB0BuoC8yoRtINCYB3pF2jzYjGjzE3V+drn/nGNM=;
        b=AzGG12Nlz55GzyvS//O/RSU/py+WmnMkJQ+F/+5ADWfWwy0o44o4sIVfLmXRploTWV
         Pt0WHw6DVEhzWS6w6dJ4n8ZCRfSGjYgW4BcO9tcZaaPV6+tS6vr5jEi4gMpgqgDGhAgy
         wua5RacpGhp6uAAmRtUOkgnwP4vcWbf5G5UTiYHIASxdX5QK++KkM4XfgZ6OzqJHdERd
         XdHgjUf3V2rcNwXLR3FLv+hIvknZ6tqq8cr5SGBCbh9dR2oJIZtovP3ehDMIjvRUkUli
         QtW4HPu1AdtqVPdeCzFFwMyvd+75/e6oV2tDve43gRQaFgthbtuMSQK3BXxCz4n6iIw6
         Dtgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rdZBB0BuoC8yoRtINCYB3pF2jzYjGjzE3V+drn/nGNM=;
        b=ZETbW1SSmW9mgLyoD8NFAaKcNodID0bQqzqm7waOOf0NIX8HEBxqOe8qwj2BS8vSEd
         OriNR0Y2B2NxambH+gwRkfaPjp8HTQfRfbPtft01kQnb+80ECnHHl8X4mzLsFynpHH6k
         D6XhNh5L6RWiizTN7VKNJH9GxmQbnhVa2iP9qoSuqf++VhoonciVfC8j/iAAU/ndq9yD
         uKi935nMEdVwDRmg7cVYrIj63x97UCn1Vh2UI7mK0IIp01tuBQNlNd1ScLktk8N/KEa4
         iO2VRkVA3FlVyBV0e5CdG6xcL51yTbBDvHOezDEUeQE6RlnLGNbvF9BRHPjTqLL4ICwG
         oRTw==
X-Gm-Message-State: AOAM531OP/IXj2g6gxUpeJW3v+tT94/T0lWU/tdaPjRu479ROgK7D8kg
        WicaDRpBmxQhcvmnqv63aUw2xQcvxqQ=
X-Google-Smtp-Source: ABdhPJwGzmILsgqm+0MIms19GD/Hd+hcJaY3Qw+NVnf2raAkbF3UfPlAFml7c+GmJdigdbrkteHGKg==
X-Received: by 2002:a2e:b52a:: with SMTP id z10mr5769197ljm.320.1616684568415;
        Thu, 25 Mar 2021 08:02:48 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-60.dynamic.spd-mgts.ru. [109.252.193.60])
        by smtp.googlemail.com with ESMTPSA id b25sm791740ljo.80.2021.03.25.08.02.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Mar 2021 08:02:48 -0700 (PDT)
Subject: Re: [PATCH v4 3/5] soc/tegra: pmc: Ensure that clock rates aren't too
 high
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210302122502.20874-1-digetx@gmail.com>
 <20210302122502.20874-4-digetx@gmail.com> <YFygotHKjgPQ/R4G@orome.fritz.box>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a730ef9d-1bf7-32a3-4797-6273ad139d25@gmail.com>
Date:   Thu, 25 Mar 2021 18:02:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YFygotHKjgPQ/R4G@orome.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

25.03.2021 17:39, Thierry Reding пишет:
> On Tue, Mar 02, 2021 at 03:25:00PM +0300, Dmitry Osipenko wrote:
>> Switch all clocks of a power domain to a safe rate which is suitable
>> for all possible voltages in order to ensure that hardware constraints
>> aren't violated when power domain state toggles.
>>
>> Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
>> Tested-by: Nicolas Chauvet <kwizart@gmail.com> # PAZ00 T20 and TK1 T124
>> Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/soc/tegra/pmc.c | 92 ++++++++++++++++++++++++++++++++++++++++-
>>  1 file changed, 90 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
>> index f970b615ee27..a87645fac735 100644
>> --- a/drivers/soc/tegra/pmc.c
>> +++ b/drivers/soc/tegra/pmc.c
>> @@ -237,6 +237,7 @@ struct tegra_powergate {
>>  	unsigned int id;
>>  	struct clk **clks;
>>  	unsigned int num_clks;
>> +	unsigned long *clk_rates;
>>  	struct reset_control *reset;
>>  };
>>  
>> @@ -641,6 +642,57 @@ static int __tegra_powergate_remove_clamping(struct tegra_pmc *pmc,
>>  	return 0;
>>  }
>>  
>> +static int tegra_powergate_prepare_clocks(struct tegra_powergate *pg)
>> +{
>> +	unsigned long safe_rate = 100 * 1000 * 1000;
> 
> This seems a bit arbitrary. Where did you come up with that value?
> 
> I'm going to apply this to see how it fares in our testing.

This value is chosen based on the OPP table voltages and frequencies.

Maybe you could add this clarifying comment to the code(?):

"There is no hardware unit on any of Tegra SoCs which requires higher
voltages for the rates above 100MHz."
