Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4DB8EE4993
	for <linux-tegra@archiver.kernel.org>; Wed, 23 Aug 2023 07:50:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233599AbjHWHu4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 23 Aug 2023 03:50:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233598AbjHWHuz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 23 Aug 2023 03:50:55 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9618ECE6
        for <linux-tegra@vger.kernel.org>; Wed, 23 Aug 2023 00:50:53 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3fee17aebc8so38278775e9.0
        for <linux-tegra@vger.kernel.org>; Wed, 23 Aug 2023 00:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692777052; x=1693381852;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P+2FN7G3eyYYkhDUmvsMFL/gLA2nmLv/bVLmgPvX5x8=;
        b=WCF47nydVfAWb+ufLmnZ8/s5gIespS2nG1nk8bJRxgB1/wlf+lHUeg5vcGZMVedVYS
         2fR0xUagE+ECrVqpxjHIwyYzgIskHwhvqBW39A+OXfkOHB/+9K+r0/GHkNyppJxOjGPV
         qDGm5FXj8zO+kIBIhznp4cSjN5WQPpN0ynXRHWJW6I+6v3ecoA6W0T4PryfKwAu+6baV
         JKU0l8OKHm+M8fTwk2wb1m0+v+q6bl4aDtXajdOC8XJ99UUVIyS+IertDwcoNjSuaf1Y
         PLixayZC6aXPpMsE1d00Fs32rOGhTnUtSL2Ngl0KM4UXUq0o6Jlr1Y5BPVgPctwlr/Jx
         AwpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692777052; x=1693381852;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P+2FN7G3eyYYkhDUmvsMFL/gLA2nmLv/bVLmgPvX5x8=;
        b=AtYAV2lV0YsR2oXJmNxta0oxjYUghALV6DtKHQkDN9n//QK/lDMpMGmTUS6+gtwOc3
         Px9SAesD9MQ8TvAwRRO79Q8EohaTJrZpxSatydaoFlewq6sC+BsMsQFxKhZr8KqGCGhw
         oXQSodXb1/hlk7UdX6bbXkS302tzf/7rKs7xHRLo5A8TOTcXWm4xTR/Vu/dgp18nuj03
         Myg2PGYLKXDgtK0HOgKK6u84iwGxBZvrP8j8JK+dP42sNl0EOAIc0jAACHcWtvVjzQaJ
         v2ewWmdIus4ylTzCvUOuJZWQWOj0AeVh1RrWUtYzOCEmhwjYUlDCpdB6ptqOBFZVF0QY
         vhcQ==
X-Gm-Message-State: AOJu0YwywX3k2BINJvWz1GAiBJiJL+EM0ylS0yFQiYtWENBpE9zTySSJ
        6yil37By2yrkAoAK23vh0bYv8g==
X-Google-Smtp-Source: AGHT+IHliTw/1uQuYtcsGVJC8NunfbGQTeq0qoFKdTLFBz2buL2gFvFX+Kn9wTjsUTs5zvK0H2IG5w==
X-Received: by 2002:a7b:cb89:0:b0:3fe:fe71:14df with SMTP id m9-20020a7bcb89000000b003fefe7114dfmr2022507wmi.35.1692777051936;
        Wed, 23 Aug 2023 00:50:51 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 1-20020a05600c020100b003ffca80edb8sm648850wmi.15.2023.08.23.00.50.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Aug 2023 00:50:51 -0700 (PDT)
Message-ID: <e299d921-1609-70fa-33f6-97e51fe0b646@linaro.org>
Date:   Wed, 23 Aug 2023 09:50:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] thermal: tegra-bpmp: Check if BPMP supports trip points
Content-Language: en-US
To:     Mikko Perttunen <cyndis@kapsi.fi>,
        Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20221129153914.2699041-1-cyndis@kapsi.fi>
 <Y9KTrO+WqJJwuEDf@orome> <a08355e1-c393-2b2e-4a44-360e08607bb9@linaro.org>
 <Y9KfcSwYt7utbcg5@orome> <e716eda4-edfc-5946-4e6f-42aab5f73b0f@linaro.org>
 <d7435a96-3480-280e-d996-73fea690c373@nvidia.com>
 <2c37a786-0ae5-273e-f82b-4f9c82663053@linaro.org>
 <7c342b0c-9657-ffd1-6fad-ef6433ddc793@kapsi.fi>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <7c342b0c-9657-ffd1-6fad-ef6433ddc793@kapsi.fi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 21/08/2023 12:08, Mikko Perttunen wrote:
> On 4/3/23 13:26, Daniel Lezcano wrote:
>> On 03/04/2023 12:22, Jon Hunter wrote:
>>> Hi Daniel,
>>>
>>> On 26/01/2023 16:07, Daniel Lezcano wrote:
>>>> On 26/01/2023 16:42, Thierry Reding wrote:
>>>>> On Thu, Jan 26, 2023 at 04:08:03PM +0100, Daniel Lezcano wrote:
>>>>>>
>>>>>> Hi Thierry,
>>>>>>
>>>>>> On 26/01/2023 15:52, Thierry Reding wrote:
>>>>>>> On Tue, Nov 29, 2022 at 05:39:14PM +0200, Mikko Perttunen wrote:
>>>>>>>> From: Mikko Perttunen <mperttunen@nvidia.com>
>>>>>>>>
>>>>>>>> Check if BPMP supports thermal trip points, and if not,
>>>>>>>> do not expose the .set_trips callback to the thermal core
>>>>>>>> framework. This can happen in virtualized environments
>>>>>>>> where asynchronous communication with VM BPMP drivers is not
>>>>>>>> available.
>>>>>>>>
>>>>>>>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>>>>>>>> ---

Thanks for the head up, that should be fixed now.



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

