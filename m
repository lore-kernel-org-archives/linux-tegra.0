Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6407C54E94
	for <linux-tegra@archiver.kernel.org>; Thu, 26 Jan 2023 16:07:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232566AbjAZQHL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 26 Jan 2023 11:07:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230328AbjAZQHJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 26 Jan 2023 11:07:09 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6303C1E1C7
        for <linux-tegra@vger.kernel.org>; Thu, 26 Jan 2023 08:07:07 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id c10-20020a05600c0a4a00b003db0636ff84so1470497wmq.0
        for <linux-tegra@vger.kernel.org>; Thu, 26 Jan 2023 08:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xuNSzJtmpNsY7bVQ5+k2qAox3kBv/qeRlb42lxnZEE0=;
        b=dyVE5P0xpqEy9/ySS9hzcdskGDW4H7vI1B/vMwlm4ME+vReu5RKWSYXchoTHvvI2Ep
         kHw7OVSOt9vlr6gcLJtRCD4WkVNc+RhoaqURbsBvLwk6HNushOvf6HPk6i8VaUHchzbr
         1YlrPpkodjvwpZ0b3aRx06y8O4SwN/4LR3ihhJ+ifY7CU9YBwuvvVeGZRYprdUIzjTT5
         Xzn5VMgqGmMt9SETGW0YgeUeHgP8DJ1oZKI3voXu77pBhvLwUKV4b8IAiWy4KSSFI9zR
         wUJtTDR0gcfLUv5nw+aGlyZKbzpblSIwOg7r05TYRV3fn75tvwRgmiBNfppkUxhwWkc/
         WAvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xuNSzJtmpNsY7bVQ5+k2qAox3kBv/qeRlb42lxnZEE0=;
        b=oRpPsGkgJNnH5tZFA+RqwZQn6T7bfbK2AJQPLTknUHErgQV8q04heB7KowXV6NVNk7
         Aw60MjxwrWBSXBqVXYvZ0Ua/WerJXyn5eivSmPLvS/kbkGUAxK6mNgG4w0mJip6qlv7G
         QU7st02O/wG1ylrZlAObDmtVjIa0Z932TUY2nQFtGC3Q17CsnGXV1UzGA5Ii+rAeDiPx
         s4yW3WNR2vU8YTnlmhWlO3fdjn5gX3ESpxL1KEaZNIVGgn/06w/YMGmWCbjOADlNfc25
         nXfOC81tw47WvB0hQfML6sGWSWasQOfoj4Pp00a3peHv3aU6rU7b4q1jvA1xWA3sGutv
         J0tA==
X-Gm-Message-State: AFqh2krdwDA78FdJdOy5fxRBUY1um17EvcButyzn8vSfN6ZWI3uo8xBf
        EtMaXRr+yFF5Y5zWi3AztGhjcQ==
X-Google-Smtp-Source: AMrXdXsh8bwR247dixXSDi95M6c+w18jjNkqcOsvdu0ypYDTZLSo61S6PgzKwemSZph29yFcRWvhSA==
X-Received: by 2002:a05:600c:4f42:b0:3db:2e62:1d69 with SMTP id m2-20020a05600c4f4200b003db2e621d69mr25732257wmq.31.1674749225851;
        Thu, 26 Jan 2023 08:07:05 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id p22-20020a1c5456000000b003da286f8332sm1808472wmi.18.2023.01.26.08.07.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 08:07:05 -0800 (PST)
Message-ID: <e716eda4-edfc-5946-4e6f-42aab5f73b0f@linaro.org>
Date:   Thu, 26 Jan 2023 17:07:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] thermal: tegra-bpmp: Check if BPMP supports trip points
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Mikko Perttunen <cyndis@kapsi.fi>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20221129153914.2699041-1-cyndis@kapsi.fi>
 <Y9KTrO+WqJJwuEDf@orome> <a08355e1-c393-2b2e-4a44-360e08607bb9@linaro.org>
 <Y9KfcSwYt7utbcg5@orome>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <Y9KfcSwYt7utbcg5@orome>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 26/01/2023 16:42, Thierry Reding wrote:
> On Thu, Jan 26, 2023 at 04:08:03PM +0100, Daniel Lezcano wrote:
>>
>> Hi Thierry,
>>
>> On 26/01/2023 15:52, Thierry Reding wrote:
>>> On Tue, Nov 29, 2022 at 05:39:14PM +0200, Mikko Perttunen wrote:
>>>> From: Mikko Perttunen <mperttunen@nvidia.com>
>>>>
>>>> Check if BPMP supports thermal trip points, and if not,
>>>> do not expose the .set_trips callback to the thermal core
>>>> framework. This can happen in virtualized environments
>>>> where asynchronous communication with VM BPMP drivers is not
>>>> available.
>>>>
>>>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>>>> ---
>>>>    drivers/thermal/tegra/tegra-bpmp-thermal.c | 52 +++++++++++++++++++++-
>>>>    1 file changed, 51 insertions(+), 1 deletion(-)
>>>
>>> Applied, thanks.
>>
>> I prefer you provide an Acked-by and I take the thermal related patches.
>> Especially in this period where we are reworking the framework with the
>> thermal trip points ;)
> 
> Sorry, my bad. I misread this as belonging to drivers/firmware/tegra
> which goes in via ARM SoC.

No worries ;)

> I'll drop this from the Tegra tree. Feel free
> to pick this up:

Ok, thanks

> Acked-by: Thierry Reding <treding@nvidia.com>



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

