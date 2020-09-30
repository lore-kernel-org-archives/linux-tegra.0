Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CD87C4741F
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 16:26:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E6BF20759
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 16:26:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ho4YvFna"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725860AbgI3Q0D (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 12:26:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbgI3Q0D (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 12:26:03 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CB2EC061755;
        Wed, 30 Sep 2020 09:26:03 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id b22so2862475lfs.13;
        Wed, 30 Sep 2020 09:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SuXQIv4rAYyKxF7mNw/hB2x+1vIgmAIMqQQxl7zvhHc=;
        b=ho4YvFnap5VEc/95+eLZBD59p6xrw0ujaSjV8tg/BgqlbbXNyIJNKQgpij17cPF/sL
         d2tFi6aHNWl7oAq6ZvsN5jNKcgpCab8rAR9V9iiZxH0BcyNDM9y9oxfHK24QGA6/6UsU
         onB0cS4BGdTODgOTZ43eGRPTjenzqnrLk9BiIYZHxYW0C9h9rlrtbzY/bFbEW516D+bL
         fWS1qrLTvobEysmaGcWiW/157FX+f9ov9tCZJavPhj4ULZOAebzLI9kGQWQtPKlK/GMs
         Da7O9szadEypjAKX/9FgWiS/edUjMv0ndCyNmkMOa9zZVa8uJbpiObrqREXesrKz4gK8
         rVQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SuXQIv4rAYyKxF7mNw/hB2x+1vIgmAIMqQQxl7zvhHc=;
        b=Y3HJy3v4XEHhDPhfU8x/vCvVR/OeBeowA+9lnTj2TEhalOWDT192EirvNipf/Dt6qa
         oFVuW721UsrFWh4eUjsMtHeoVFvakk31vWy8wbEZLr+jdjuthwEBpTsRSXq171d45r/I
         r2EDWkHsAOthB3XNi5Aww+7Z/tl4OonIh9z93LZtlO+H/2xQ3Rue8l0d8qoJh+msXVgz
         Y5mjdZy2O0nIA536Op6MiWvEmqa0zIlKKmDFVUcQ8ax9VYZYxFlHORNMZbvqLUAaT7Q0
         21Hs+AO0zxqWE8qiYzEEv24x8MEuvuTvqDD+7e8QG66zrM9BX7Q42UDekZmJeTj+sPdC
         rBbQ==
X-Gm-Message-State: AOAM533Uqm82CQXuq5o5glQ9Gwd/2/oB72h7t+3SgeWNVR3v/zAqFtvS
        2oEh0M8b59I3kTuuGshdebCyQLwBlnM=
X-Google-Smtp-Source: ABdhPJzlO0UvoTuAN0AyWrnYLP8ntndzxgjv2bnb5g4LJVicV2FFyv8u9bqwl1yhPYET31YGkSDDBA==
X-Received: by 2002:a19:8703:: with SMTP id j3mr1054717lfd.560.1601483161229;
        Wed, 30 Sep 2020 09:26:01 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id m13sm244795lfb.172.2020.09.30.09.26.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2020 09:26:00 -0700 (PDT)
Subject: Re: [PATCH v3 1/3] memory: tegra: Add
 devm_tegra_get_memory_controller()
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Nicolin Chen <nicoleotsuka@gmail.com>, joro@8bytes.org,
        krzk@kernel.org, vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
References: <20200930084258.25493-1-nicoleotsuka@gmail.com>
 <20200930084258.25493-2-nicoleotsuka@gmail.com>
 <20200930152320.GA3833404@ulmo>
 <ed7b4375-d06e-2750-e6fa-603ef2b60d36@gmail.com>
 <20200930160355.GC3833404@ulmo>
 <839df5d6-513f-3d77-ba5f-a1afe5d0883a@gmail.com>
 <20200930161503.GF3833404@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <29a989b3-a8cc-5c1f-ba12-47ed0d667e8e@gmail.com>
Date:   Wed, 30 Sep 2020 19:26:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200930161503.GF3833404@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

30.09.2020 19:15, Thierry Reding пишет:
> On Wed, Sep 30, 2020 at 07:06:27PM +0300, Dmitry Osipenko wrote:
>> 30.09.2020 19:03, Thierry Reding пишет:
>>> On Wed, Sep 30, 2020 at 06:53:06PM +0300, Dmitry Osipenko wrote:
>>>> 30.09.2020 18:23, Thierry Reding пишет:
>>>>> On Wed, Sep 30, 2020 at 01:42:56AM -0700, Nicolin Chen wrote:
>>>>>> From: Dmitry Osipenko <digetx@gmail.com>
>>>>>>
>>>>>> Multiple Tegra drivers need to retrieve Memory Controller and hence there
>>>>>> is quite some duplication of the retrieval code among the drivers. Let's
>>>>>> add a new common helper for the retrieval of the MC.
>>>>>>
>>>>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>>>>> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
>>>>>> ---
>>>>>>
>>>>>> Changelog
>>>>>> v2->v3:
>>>>>>  * Replaced with Dimtry's devm_tegra_get_memory_controller()
>>>>>> v1->v2:
>>>>>>  * N/A
>>>>>>
>>>>>>  drivers/memory/tegra/mc.c | 39 +++++++++++++++++++++++++++++++++++++++
>>>>>>  include/soc/tegra/mc.h    | 17 +++++++++++++++++
>>>>>>  2 files changed, 56 insertions(+)
>>>>>
>>>>> Let's not add this helper, please. If a device needs a reference to the
>>>>> memory controller, it should have a phandle to the memory controller in
>>>>> device tree so that it can be looked up explicitly.
>>>>>
>>>>> Adding this helper is officially sanctioning that it's okay not to have
>>>>> that reference and that's a bad idea.
>>>>
>>>> And please explain why it's a bad idea, I don't see anything bad here at
>>>> all.
>>>
>>> Well, you said yourself in a recent comment that we should avoid global
>>> variables. devm_tegra_get_memory_controller() is nothing but a glorified
>>> global variable.
>>
>> This is not a variable, but a common helper function which will remove
>> the duplicated code and will help to avoid common mistakes like a missed
>> put_device().
> 
> Yeah, you're right: this is actually much worse than a global variable.
> It's a helper function that needs 50+ lines in order to effectively
> access a global variable.
> 
> You could write this much simpler by doing something like this:
> 
> 	static struct tegra_mc *global_mc;
> 
> 	int tegra_mc_probe(...)
> 	{
> 		...
> 
> 		global_mc = mc;
> 
> 		...
> 	}
> 
> 	struct tegra_mc *tegra_get_memory_controller(void)
> 	{
> 		return global_mc;
> 	}
> 
> The result is *exactly* the same, except that this is actually more
> honest. Nicolin's patch *pretends* that it isn't using a global variable
> by wrapping a lot of complicated code around it.
> 
> But that doesn't change the fact that this accesses a singleton object
> without actually being able to tie it to the device in the first place.

I don't think that the MC driver will stay built-in forever, although
its modularization is complicated right now. Hence something shall keep
the reference to the MC device resources while they are in use and this
patch takes care of doing that.

Secondly, the Nicolin's patch doesn't pretend on anything, but rather
brings the already existing duplicated code to a single common place.
