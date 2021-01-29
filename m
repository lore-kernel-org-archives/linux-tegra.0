Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AFB8C433DB
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Jan 2021 17:34:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F21364E07
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Jan 2021 17:34:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231246AbhA2Rd5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 29 Jan 2021 12:33:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231533AbhA2RbD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 29 Jan 2021 12:31:03 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADEBEC061574
        for <linux-tegra@vger.kernel.org>; Fri, 29 Jan 2021 09:30:10 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id b20so3520912ljo.1
        for <linux-tegra@vger.kernel.org>; Fri, 29 Jan 2021 09:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZDj5Zd17VeIJsrPXYNhev0hV+6mgMniB3E2FshOdbyc=;
        b=Wemd7WC7dfiHsTC195al2zRYGaaYcj0e6irZj7qVUVoCa9pn/kidMabOQ5pSwu8s1/
         1wfvVbVyqmkCXd0butDfPvZ5DTsm0Vt2XPRn5wap6AFHThgjQOYspDdORej5h0SDCq0Y
         Z4m2rH6TIXLnIkDSjU99Qzc7P/54FKLDqzIZ+T6SsnrZmKHmWoziQAQWcqtq8qTVsY+A
         YJvgzO+Zit9qWd3ybLTJ5WL6WrSgUp+91FHrep2lOyJno+0qVHPs8QpR7q9BFl+CCfm9
         Io+zuPmhnhkkEa1loNdRsiGqEwmJ5ms8rUwAc06DHFV9iuovxFyEX060UAi0+a7RnBXp
         gTIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZDj5Zd17VeIJsrPXYNhev0hV+6mgMniB3E2FshOdbyc=;
        b=XGxtfbU8JmAhM5Wdu2Ez1gnzSb+auvdNDJYefqEg5i/pT/0/C0GmFV/ijJcj0fPpDc
         IGbbexBHXkTPOSUtaPEnwvnh2jIBzTrQWzdvXQX9voAIcXALXKhqkaLHfXd/ZKfY6JMj
         0OGp9CNNj7p6eKcCJZP8r9W0vH1Zop6rwVMRwwhH2Javk0cA2i6fVUS2HUIEtBXfwmqw
         TJbB+bizTPl+MQzXXG3NCynVFJQzltZQ5Px99hFgUGnIpyZt4jIaRybUTEriiiyNpt+Z
         xj8FICZ72kRHXxsXlGQ8pVGyeA8u54rsgFyRuJSPx38Bqc5+mFsvG6vR7t5M92Ghm8nx
         wKTg==
X-Gm-Message-State: AOAM533OaI2do0G2Xihb9Qi1sGmW86A9W+272Qle++x1phKAt1cJoDeN
        fuHzlgeETdBuDPsmV4q4ZDc=
X-Google-Smtp-Source: ABdhPJxx8aN8jAZEEFTgcJWKXPnTAMlks4CbTke3y3rQny5gMMUsrvv3Nur2CZYZ0Di8v/KNpCABcQ==
X-Received: by 2002:a2e:9b42:: with SMTP id o2mr2849606ljj.99.1611941409221;
        Fri, 29 Jan 2021 09:30:09 -0800 (PST)
Received: from ?IPv6:2a00:1370:814d:ea25:a10:76ff:fe69:21b6? ([2a00:1370:814d:ea25:a10:76ff:fe69:21b6])
        by smtp.googlemail.com with ESMTPSA id 71sm2077043lfd.202.2021.01.29.09.30.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Jan 2021 09:30:08 -0800 (PST)
Subject: Re: [PATCH v5 00/21] Host1x sync point UAPI should not be used for
 tracking DRM jobs
To:     Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <cyndis@kapsi.fi>
Cc:     Mikko Perttunen <mperttunen@nvidia.com>, jonathanh@nvidia.com,
        airlied@linux.ie, daniel@ffwll.ch, linux-tegra@vger.kernel.org,
        dri-devel@lists.freedesktop.org, talho@nvidia.com,
        bhuntsman@nvidia.com
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <da085c38-4ac1-19dd-7706-caf323c969d2@gmail.com>
 <2f999b6d-d781-503a-78f4-d444bce72c58@kapsi.fi>
 <2ee12338-bd5a-4b99-f86d-13da0d2a899b@gmail.com>
 <8504c239-d5df-3033-934c-7b3fab52e387@kapsi.fi> <YBLtPv/1mGXwtibX@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <1ff922b2-161d-c8b9-7b08-4454ff7329f8@gmail.com>
Date:   Fri, 29 Jan 2021 20:30:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <YBLtPv/1mGXwtibX@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

28.01.2021 19:58, Thierry Reding пишет:
> On Thu, Jan 28, 2021 at 01:08:54PM +0200, Mikko Perttunen wrote:
>> On 1/27/21 11:20 PM, Dmitry Osipenko wrote:
>>> 26.01.2021 05:45, Mikko Perttunen пишет:
>>>>> 2. We will probably need a dedicated drm_tegra_submit_cmd for sync point
>>>>> increments.  The job's sync point will be allocated dynamically when job
>>>>> is submitted.  We will need a fag for the sync_incr and wait_syncpt
>>>>> commands, saying "it's a job's sync point increment/wait"
>>>>
>>>> Negative. Like I have explained in previous discussions, with the
>>>> current way the usage of hardware resources is much more deterministic
>>>> and obvious. I disagree on the point that this is much more complicated
>>>> for the userspace. Separating syncpoint and channel allocation is one of
>>>> the primary motivations of this series for me.
>>>
>>> Sync points are a limited resource. The most sensible way to work around
>>> it is to keep sync points within kernel as much as possible. This is not
>>> only much simpler for user space, but also allows to utilize DRM API
>>> properly without re-inventing what already exists and it's easier to
>>> maintain hardware in a good state.
>>
>> I've spent the last few years designing for automotive and industrial
>> products, where we don't want to at runtime notice that the system is out of
>> free syncpoints and because of that we can only process the next camera
>> frame in a second or two instead of 16 milliseconds. We need to know that
>> once we have allocated the resource, it is there. The newer chips are also
>> designed to support this.
>>
>> Considering Linux is increasingly being used for such applications, and they
>> are important target markets for NVIDIA, these need to be supported.
>>
>> Because of the above design constraint the userspace software that runs in
>> these environments also expects resources to be allocated up front. This
>> isn't a matter of having to design that software according to what kind of
>> allocation API we decide do at Linux level -- it's no use designing for
>> dynamic allocation if it leads to you not meeting the safety requirement of
>> needing to ensure you have all resources allocated up front.
>>
>> This isn't a good design feature just in a car, but in anything that needs
>> to be reliable. However, it does pose some tradeoffs, and if you think that
>> running out of syncpoints on T20-T114 because of upfront allocation is an
>> actual problem, I'm not opposed to having both options available.

The word "reliable" contradicts to the error-prone approach. On the
other hand, it should be very difficult to change the stubborn
downstream firmware and we want driver to be usable as much as possible,
so in reality not much can be done about it.

> I think that's a fair point. I don't see why we can't support both
> implicit and explicit syncpoint requests. If most of the use-cases can
> work with implicit syncpoints and let the kernel handle all aspects of
> it, that's great. But there's no reason we can't provide more explicit
> controls for cases where it's really important that all the resources
> are allocated upfront.
> 
> Ultimately this is very specific to each use-case, so I think having
> both options will provide us with the most flexibility.
It should be fine to support both. This will add complexity to the
driver, thus it needs to be done wisely.

I'll need more time to think about it.

