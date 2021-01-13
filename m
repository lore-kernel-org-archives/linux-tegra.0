Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE852C433DB
	for <linux-tegra@archiver.kernel.org>; Wed, 13 Jan 2021 16:30:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6564D23435
	for <linux-tegra@archiver.kernel.org>; Wed, 13 Jan 2021 16:30:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726828AbhAMQai (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 13 Jan 2021 11:30:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726812AbhAMQah (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 13 Jan 2021 11:30:37 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 272F7C061575
        for <linux-tegra@vger.kernel.org>; Wed, 13 Jan 2021 08:29:57 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id p13so3258751ljg.2
        for <linux-tegra@vger.kernel.org>; Wed, 13 Jan 2021 08:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2siudaJetlL4FSQZMNVVHzMkL7ELpV6uopIfOVvMWs8=;
        b=l8xop7pH+Setq82fKbZ4EFQTUoHmoBO+t6Pph1Vzjk1CYRrAOcfLtsKkFoL5ddaiW8
         SxVevzBvjl7o4Rha9onDBL5KVYidZ2YAWAk7Z6lQ4fF6s9ZE+x57O1ZW1S2nNhqLXA8v
         6HQAyjn/UVHjp2GqZAJZLnd+7TtaqiG4wQUpHcfc1dXL4cXmsyLUGxW3tw89IlSTAodI
         aFdfjT3Pz26d2/k9mCgIFIhZ/xAyuAKYDgT/wSf4WTkh9DHVGDITFgx2hewOMH2HIT3F
         3sLC41ibMjc4jlPswFQ3YAjSDGSZ0BIUVyBNBCIN/yz6uM7NKZlw1sWB+bi+WbDB4PAG
         fDFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2siudaJetlL4FSQZMNVVHzMkL7ELpV6uopIfOVvMWs8=;
        b=RLAa4TW9RuFzU6bu7ZZ1CUyGvUz7HoTpkF1BiNNP8wUSkSkEUA0UaYwUvHr5spYfAq
         GHQYNkAqrJUToFSzINhGw/X5e2EaY4RRlGvf2Ab0GW2/vCf6cyqXPDGJ7El6sKnD9/Xh
         UlbwSJGh+O23M1QjEhyxxTYuMWZhnf13Qmc/D/I6mPLlq1EMcZWDLejZTkQIFGZ5ug4I
         iMKqdL+uhZQdETm0oZEr1P7vTi0qxo3PXddD1r2eAOnijUJiPfh/Ftkk45gcba9+mjni
         2zd78raE08FlMpeHc0EhBq+d+PRjYPGld8evcUbfsLmV79oEFhEycVdF9ZuUj52TRYUb
         aJVw==
X-Gm-Message-State: AOAM530FSXUIKjI1xPkLHdmSsUbu5OazbpJxfy0bHYodFHtv4vICdl2W
        zl6YDatB9+HWA44qLgYA7RI=
X-Google-Smtp-Source: ABdhPJxo5bxVwGtUe+l+R6oDxiDXlb5UzmCR9sb2VRDgxNSPyvKLX/oyuSi47L0DYwnaxTXsky5Ibw==
X-Received: by 2002:a2e:96c5:: with SMTP id d5mr1275164ljj.321.1610555395703;
        Wed, 13 Jan 2021 08:29:55 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id b141sm254508lfd.148.2021.01.13.08.29.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Jan 2021 08:29:54 -0800 (PST)
Subject: Re: [PATCH v5 04/21] gpu: host1x: Remove cancelled waiters
 immediately
To:     Mikko Perttunen <cyndis@kapsi.fi>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-5-mperttunen@nvidia.com>
 <1c2c4a31-68a2-c938-fe65-6059d9889126@gmail.com>
 <1f98ce42-dc6b-299c-f55e-f6dd87b99cab@kapsi.fi>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b0a983a1-6379-1a27-5c8d-05fee58e696a@gmail.com>
Date:   Wed, 13 Jan 2021 19:29:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <1f98ce42-dc6b-299c-f55e-f6dd87b99cab@kapsi.fi>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

13.01.2021 01:20, Mikko Perttunen пишет:
> On 1/13/21 12:07 AM, Dmitry Osipenko wrote:
>> 11.01.2021 16:00, Mikko Perttunen пишет:
>>> -void host1x_intr_put_ref(struct host1x *host, unsigned int id, void
>>> *ref)
>>> +void host1x_intr_put_ref(struct host1x *host, unsigned int id, void
>>> *ref,
>>> +             bool flush)
>>>   {
>>>       struct host1x_waitlist *waiter = ref;
>>>       struct host1x_syncpt *syncpt;
>>>   -    while (atomic_cmpxchg(&waiter->state, WLS_PENDING,
>>> WLS_CANCELLED) ==
>>> -           WLS_REMOVED)
>>> -        schedule();
>>> +    atomic_cmpxchg(&waiter->state, WLS_PENDING, WLS_CANCELLED);
>>>         syncpt = host->syncpt + id;
>>> -    (void)process_wait_list(host, syncpt,
>>> -                host1x_syncpt_load(host->syncpt + id));
>>> +
>>> +    spin_lock(&syncpt->intr.lock);
>>> +    if (atomic_cmpxchg(&waiter->state, WLS_CANCELLED, WLS_HANDLED) ==
>>> +        WLS_CANCELLED) {
>>> +        list_del(&waiter->list);
>>> +        kref_put(&waiter->refcount, waiter_release);
>>> +    }
>>> +    spin_unlock(&syncpt->intr.lock);
>>> +
>>> +    if (flush) {
>>> +        /* Wait until any concurrently executing handler has
>>> finished. */
>>> +        while (atomic_read(&waiter->state) != WLS_HANDLED)
>>> +            cpu_relax();
>>> +    }
>>
>> A busy-loop shouldn't be used in kernel unless there is a very good
>> reason. The wait_event() should be used instead.
>>
>> But please don't hurry to update this patch, we may need or want to
>> retire the host1x-waiter and then these all waiter-related patches won't
>> be needed.
>>
> 
> Yes, we should improve the intr code to remove all this complexity. But
> let's merge this first to get a functional baseline and do larger design
> changes in follow-up patches.
> 
> It is cumbersome for me to develop further series (of which I have
> several under work and planning) with this baseline series not being
> merged. The uncertainty on the approval of the UAPI design also makes it
> hard to know whether it makes sense for me to work on top of this code
> or not, so I'd like to focus on what's needed to get this merged instead
> of further redesign of the driver at this time.

Is this patch (and some others) necessary for the new UAPI? If not,
could we please narrow down the patches to the minimum that is needed
for trying out the new UAPI?
