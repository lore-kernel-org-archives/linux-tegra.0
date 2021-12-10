Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AFD5C433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 10 Dec 2021 22:39:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243657AbhLJWnP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 10 Dec 2021 17:43:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243624AbhLJWnP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 10 Dec 2021 17:43:15 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56B47C061746
        for <linux-tegra@vger.kernel.org>; Fri, 10 Dec 2021 14:39:39 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id k37so20637723lfv.3
        for <linux-tegra@vger.kernel.org>; Fri, 10 Dec 2021 14:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=em6mAXPyeFxfXHNuuH/SVT6kCjEb+u6oEpqXTEmLjg4=;
        b=mgXGYTJ3y9S75PNzAN0Lpz/3h0Ckb1vdq4ybprq7k0eBJLEVrbhdlvi6YeYfgd8sGv
         ucCYq+F4FsCb5osDeCxZka6mBlTzgBwFUzRbcto2ahfMVa/i5g44YgHadWXDQCmFvjOD
         bAQ9OVfHmijSrir/HbG+PTA4sJDFAup6uiPmMC8czL9nwuFChVamnlDPgp+qzba4xYWL
         kP0sRtMoXcPQlglsYkY6LEs0kQesSqy7CULl0ZyQ+9RpYeYzljF4pKM/Ao+LASEioGSe
         STZo4zgTLhwZP3RlVluwnR3+60MuAwufcYrwKz1/s+6TTj6nMu+t5hQP7fMMHKyD1380
         o2Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=em6mAXPyeFxfXHNuuH/SVT6kCjEb+u6oEpqXTEmLjg4=;
        b=Gpg61j3elx/pusJxkPbwJ2I1Nlv8TseACUr3L2Z8+48y3SzsDALaYv2zVQgDaoIihY
         15ialPvHzT6ctILyprJfcrW/DqmAOTAg+WraTSbkrvUPe9PjhCgk/DR46FzUqjZi7ug9
         gzCsAn7iboorQK0Jsi6+QQHCgdBjvBsq8xtB074Ta3xDHZqjjOYZXUhlfCee1tc5xIlI
         UdzXQNAsAV7RrYewN8Tai6u4HscrGdS4mMDOE1SZG/PIuHZjrPbHWb+UETHOb6KCdfN9
         g4wjcArVlmr9Y3KHR+I8DNnx43WE4xCAcdr4mzMYSTvfutcLRo1+zqPrdnP1MEyQuiie
         m9Zw==
X-Gm-Message-State: AOAM530jxqPF4Kxj9aQV5n890g/kHJ1BRgo07/ZbTVTKzE2LlObeDyA8
        r/kimUzfdE6elXTt+UN5EkIJGIGmGcI=
X-Google-Smtp-Source: ABdhPJxGJTePfcYw1dEoKmwKZ0b7pJB3KwVGaMBv59PWN58EwgFq/374tFC1xAeyabJB/7IgmqZpMw==
X-Received: by 2002:a05:6512:c17:: with SMTP id z23mr14706208lfu.175.1639175977218;
        Fri, 10 Dec 2021 14:39:37 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru. [94.29.46.111])
        by smtp.googlemail.com with ESMTPSA id 3sm430874lfr.77.2021.12.10.14.39.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Dec 2021 14:39:36 -0800 (PST)
Subject: Re: [PATCH 12/25] ARM: tegra: Do not use unit-address for OPP nodes
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
References: <20211209173356.618460-1-thierry.reding@gmail.com>
 <20211209173356.618460-13-thierry.reding@gmail.com>
 <b133948b-1705-b27e-d0fb-b71481148bad@gmail.com> <YbNj0ifkaDIDEJdn@orome>
 <ec0b9923-c45a-f23a-4059-6c9281edb666@gmail.com>
Message-ID: <7693e905-3602-c5cf-cd59-c9ba7108fcb7@gmail.com>
Date:   Sat, 11 Dec 2021 01:39:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <ec0b9923-c45a-f23a-4059-6c9281edb666@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

10.12.2021 18:33, Dmitry Osipenko пишет:
> 10.12.2021 17:27, Thierry Reding пишет:
>> On Thu, Dec 09, 2021 at 09:38:06PM +0300, Dmitry Osipenko wrote:
>>> 09.12.2021 20:33, Thierry Reding пишет:
>>>> From: Thierry Reding <treding@nvidia.com>
>>>>
>>>> OPP nodes do not have a "reg" property and therefore shouldn't have a
>>>> unit-address. Instead, use a dash instead of the '@' and ',' characters
>>>> to allow validation of the nodes against the DT schema.
>>>>
>>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>>> ---
>>>>  .../boot/dts/tegra124-peripherals-opp.dtsi    | 142 ++++++++---------
>>>>  .../boot/dts/tegra20-cpu-opp-microvolt.dtsi   |  82 +++++-----
>>>>  arch/arm/boot/dts/tegra20-cpu-opp.dtsi        |  82 +++++-----
>>>>  .../arm/boot/dts/tegra20-peripherals-opp.dtsi |  36 ++---
>>>>  .../boot/dts/tegra30-cpu-opp-microvolt.dtsi   | 144 +++++++++---------
>>>>  arch/arm/boot/dts/tegra30-cpu-opp.dtsi        | 144 +++++++++---------
>>>>  .../arm/boot/dts/tegra30-peripherals-opp.dtsi | 130 ++++++++--------
>>>>  7 files changed, 382 insertions(+), 378 deletions(-)
>>>
>>> This patch is wrong, you haven't renamed the delete-node properties [1].
>>
>> Yeah, I noticed that too as I was reworking the EMC timing nodes as you
>> requested.
> 
> Please use my version of the patch that was well tested.
> 
>>> Please stop rewriting patches and use what already has been sent out and
>>> tested, thanks.
>>>
>>> [1]
>>> https://patchwork.ozlabs.org/project/linux-tegra/patch/20211130232347.950-35-digetx@gmail.com/
>>
>> I've had versions of this in my tree for literally years now, so I
>> haven't exactly been rewriting these. Rather this is an iteration of
>> work that I had started over 18 months ago:
>>
>> 	http://patchwork.ozlabs.org/project/linux-tegra/patch/20200616135238.3001888-26-thierry.reding@gmail.com/
> 
> I was commenting on that old patchset and was aware about that old
> patch, it's unrelated here.
> 
>> After that obviously things had to be changed again. The earliest
>> version that you sent that I can find is from late October which is when
>> I was already in the midst of this latest effort to get Tegra DTBs to
>> validate.
> 
> What you're saying here, is that you don't look at the patches on the
> ML. This is exactly what happened more than one time in the past when
> patches missed merge window and a large part of work was held back by
> another two months.  This happened not only to me, but also to other
> people, it's bad to see when you're about to do it again.
> 
>> What's really been happening here is that we haven't been communicating
>> and ended up duplicating work.
>>
>> Stop making this into something it isn't.
> 
> It's impossible to communicate when you're not looking at the messages
> or not replying.  I don't know where the problem is.  If you're too busy
> and don't have enough time for maintaining upstream, then solution could
> be to share the duties with more people.
> 

BTW, you probably missed that it were me and David who made the new OPP
naming scheme work for Tegra ;)

https://git.kernel.org/linus/7ca81b690e

Let's not continue discussing it. Please apply all the patches that I
asked you to take care about in the private email, rebase yours changes
on top of it and push it all into -next. This will solve all the
troubles and I will be very happy.
