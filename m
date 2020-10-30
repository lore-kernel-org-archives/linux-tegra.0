Return-Path: <SRS0=MwlS=EF=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D181FC388F9
	for <linux-tegra@archiver.kernel.org>; Fri, 30 Oct 2020 23:13:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 618D4221EB
	for <linux-tegra@archiver.kernel.org>; Fri, 30 Oct 2020 23:13:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ayHzA9bx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725816AbgJ3XNt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 30 Oct 2020 19:13:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725780AbgJ3XNt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 30 Oct 2020 19:13:49 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C109C0613D5
        for <linux-tegra@vger.kernel.org>; Fri, 30 Oct 2020 16:13:49 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id o13so290558ljj.11
        for <linux-tegra@vger.kernel.org>; Fri, 30 Oct 2020 16:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vaA+T5tHs3ugLEg4WgA+ZnP+FdPWA5G8q51SBunf3P8=;
        b=ayHzA9bxYYxnsSZ7EhltVKQ2JbLqL+7bZqQH9Bxbrbv/70NQua4yYPV8lY5cTpbS2I
         7g6YDGHgUnwC14iHjv/8X/UFmK2lR9a5QAGym10WG42DkhQ9Q0UBGw9Xs7D54oAWFn2w
         rpmfY+FCq4OD2RElXatQkwhyrOHTDqrc9GU2EMfMi4tCFFUS4wTP3a6MIemnzcO2jg9x
         6gQ5pvlL/cwSMaQSVpTsrX/L8u7LhbCy5NKX8zrDgG+n18Z0x+VgKw2HqEq8JYpOFlrG
         QQY7tDVzBPcTd2yYljfyccP55sJNnZ/pZEOXkE7urwvPQyyvrHNnzWixCtiCwamGJ7+B
         Pe5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vaA+T5tHs3ugLEg4WgA+ZnP+FdPWA5G8q51SBunf3P8=;
        b=E8G8+1GYNxumPBI63SMzUD8fOBpHSnQQ4BhdVt3Lkz3g/cxjJCYMJjBVFnX6XWm92u
         nBHDoHlres63tyHHTy0lRlemBb9EGBIhJyEBLSTTqMZs6Hs/9O1/swIT5RH65Z+4BBA6
         szKQTYWPN+ve/cd5Csk6RBj7pdYj+zbr4oavW3zYVE4VohNI6N4Buy5AlfaHHy/fwtJ3
         R615O3jqD1Q6g+VcAJ1mUBr2bdjK0j7+gcUajqtiBdVeeMw/ZRmF4oMBL0Ojz4UXKlWN
         3fDENlSqhKoab3dVntignMcCc1/jyDjNz62ArWgG2zgOT2r5V6C56HlVM7049eoxFuDs
         tolw==
X-Gm-Message-State: AOAM531c4AuSwj+WVoyJ63knLweERDdOHF3zGesSlqPsiRVw2uXolwT6
        /9PXfmV2J9Fjsb9wtpduPFw=
X-Google-Smtp-Source: ABdhPJzY5Ndi78+o6ubMxaCqgE1ZdYjt/EwFHanf+HIdcKgOHE7AXb+ZaRltRhXm/XFl68fy74qLow==
X-Received: by 2002:a2e:94d0:: with SMTP id r16mr1940414ljh.292.1604099627781;
        Fri, 30 Oct 2020 16:13:47 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-177.dynamic.spd-mgts.ru. [109.252.193.177])
        by smtp.googlemail.com with ESMTPSA id a9sm772943lfl.70.2020.10.30.16.13.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2020 16:13:46 -0700 (PDT)
Subject: Re: [PATCH v3 19/20] drm/tegra: Implement new UAPI
To:     Mikko Perttunen <cyndis@kapsi.fi>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20201007171238.1795964-1-mperttunen@nvidia.com>
 <20201007171238.1795964-20-mperttunen@nvidia.com>
 <dd13ec2c-1e01-ca61-656c-b23b156b100f@gmail.com>
 <b33a5084-7dc3-a865-2f36-274ecebf2ee7@kapsi.fi>
 <1f3267a9-37b4-2cff-08a2-2ca7c905ce01@gmail.com>
 <6a7b4d4e-8d4a-416e-9789-45282b44bce5@kapsi.fi>
 <48f5bbac-3955-c227-dbe1-d987b4ec5bd0@gmail.com>
 <414b4943-265d-3735-c115-d54469018d8c@kapsi.fi>
 <e8afd710-de37-f1c5-f61c-ed97c07370bf@gmail.com>
 <6ef6337d-3bb5-bbba-f39c-6de1722ddc44@kapsi.fi>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <0f1c8226-4960-aa35-9436-2361fc8fb6ae@gmail.com>
Date:   Sat, 31 Oct 2020 02:13:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6ef6337d-3bb5-bbba-f39c-6de1722ddc44@kapsi.fi>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

28.10.2020 12:54, Mikko Perttunen пишет:
> On 10/27/20 9:06 PM, Dmitry Osipenko wrote:
>> 26.10.2020 12:11, Mikko Perttunen пишет:
>>>>
>>>> The first patches should be the ones that are relevant to the existing
>>>> userspace code, like support for the waits.
>>>
>>> Can you elaborate what you mean by this?
>>
>> All features that don't have an immediate real use-case should be placed
>> later in the series because we may defer merging of those patches until
>> we will see userspace that uses those features since we can't really
>> decide whether these are decisions that we won't regret later on, only
>> practical application can confirm the correctness.
> 
> I was more referring to the "support for waits" part, should have
> clarified that.

The "support for waits" is support for the WAIT_SYNCPT command exposed
to userspace, which we could utilize right now.

>>>> Partial mappings should be a separate feature because it's a
>>>> questionable feature that needs to be proved by a real userspace first.
>>>> Maybe it would be even better to drop it for the starter, to ease
>>>> reviewing.
>>>
>>> Considering that the "no-op" support for it (map the whole buffer but
>>> just keep track of the starting offset) is only a couple of lines, I'd
>>> like to keep it in.
>>
>> There is no tracking in the current code which prevents the duplicated
>> mappings, will we need to care about it? This a bit too questionable
>> feature for now, IMO. I'd like to see it as a separate patch.
> 
> I don't think there is any need to special case duplicated mappings. I
> think this is a pretty obvious feature to have, but I can rename them to
> reserved0 and reserved1 and require that reserved0 is zero and reserved1
> is the size of the passed GEM object.

I'm now concerned about the reserved fields after seeing this reply from
Daniel Vetter:

https://www.mail-archive.com/nouveau@lists.freedesktop.org/msg36324.html

If DRM IOCTL structs are zero-extended, then perhaps we won't need to
reserve anything?

>> ...
>>>> I'd like to see the DRM_SCHED and syncobj support. I can help you with
>>>> it if it's out of yours scope for now.
>>>>
>>>
>>> I already wrote some code for syncobj I can probably pull in. Regarding
>>> DRM_SCHED, help is accepted. However, we should keep using the hardware
>>> scheduler, and considering it's a bigger piece of work, let's not block
>>> this series on it.
>>
>> I'd like to see all the custom IOCTLs to be deprecated and replaced with
>> the generic DRM API wherever possible. Hence, I think it should be a
>> mandatory features that we need to focus on. The current WIP userspace
>> already uses and relies on DRM_SCHED.
>>
> 
> From my point of view, the ABI needs to be designed such that it can
> replace what we have downstream, i.e. it needs to support the usecases
> the downstream nvhost ABI supports currently. Otherwise there is no
> migration path to upstream and it's not worth it for me to work on this.

The downstream needs should be irrelevant for the upstream, please read
this:

https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-userspace-requirements

It may happen that some of the downstream features could become useful
for upstream, but we don't know until we will see the full userspace code.

We don't have a comprehensive userspace which could utilize all the new
features and that's why upstream driver has been stagnated for many
years now. The grate-drivers would greatly benefit from the updated ABI,
but I think that we need at least a usable mesa driver first, that's why
I haven't bothered to upstream anything from the WIP UAPI v2.

In order to upstream new UAPI features we will need:

  1. Hardware specs (from vendor or reverse-engineered).
  2. Regression tests.
  3. A non-toy opensource userspace.

> Although, I don't see what this ABI is missing that your userspace would
> rely on. Does it submit jobs in reverse order that would deadlock if
> drm_sched didn't reorder them based on prefences, or something?

It's the opposite, we don't have userspace which needs majority of the
proposed ABI. This needs to be fixed before we could seriously consider
merging the new features.

I'm pretty sure that you was already aware about all the upstreaming
requirements and we will see the usable opensource userspace at some
point, correct?

For now it will be good to have this series in a form of a
work-in-progress patches, continuing to discuss and update it. Meanwhile
we will need to work on the userspace part as well, which is a much
bigger blocker.

> Software-based scheduling might make sense in situations where the
> channel is shared by all processes, but at least for modern chips that
> are designed to use hardware scheduling, I want to use that capability.

The software-based scheduling is indeed needed for the older SoCs in
order not to block hardware channels and job-submission code paths.
Maybe it could become useful for a newer SoCs as well once we will get
closer to a usable userspace :)

It will be great to have the hardware-based scheduling supported, but I
assume that it needs to be done on top of DRM_SCHED. This should allow
us to remove all the buggy host1x's pushbuffer locking code (which is
known to deadlock) and support a non-host1x fences for free.
