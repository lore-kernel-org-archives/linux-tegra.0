Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BF71C433DB
	for <linux-tegra@archiver.kernel.org>; Wed, 27 Jan 2021 22:55:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 33ECD64DDF
	for <linux-tegra@archiver.kernel.org>; Wed, 27 Jan 2021 22:55:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231883AbhA0Wzc (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 27 Jan 2021 17:55:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231764AbhA0WzK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 27 Jan 2021 17:55:10 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CF9FC0613D6
        for <linux-tegra@vger.kernel.org>; Wed, 27 Jan 2021 14:26:19 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id s18so3997554ljg.7
        for <linux-tegra@vger.kernel.org>; Wed, 27 Jan 2021 14:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=32GBvzqULqr1PLS7WMQvWkvIMQOSOY8uDAPn1dKTtws=;
        b=Ka1wao9S4YmQcYU0JmZdG14bdsrzn9+86yE2kFtQzDxNj6I64RHsGItNuA0V7WsxPc
         mzLdsv/WSW/KIvGgLROXfKtTRVvtzsF87Rd/oXlNvozEnxs8SjJsIOex8chw8b/Epg+e
         QEw9Ux0CxJ/kdk9qXInTsPoKjC5DJ7+T3/pyFy4iVsNXmcY7x4NDqad1VWxwpeu0hOnM
         XoovlnnPqF3vpw7ufVQ6IuAlaT7RAS8unHMr6pqLtd+AqWLhiig3CIqia+E1w7fqX93Q
         l0zjt09saX6JHt3Q93mDtCjAHA9aRue9lTt5u264IWrHCykwYGJOIJ8h0Qkr9pij51AH
         YDeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=32GBvzqULqr1PLS7WMQvWkvIMQOSOY8uDAPn1dKTtws=;
        b=Uq0EfW615P/iOKpBwO39f/Q1c6dmcF5FiIWZlvIUzLhpswpYPbcJX4dJ50Kiibo8om
         Z8E4rS/CICtxdhtqmEyrqCcEg+6nHcxGUx3qQu9yiQVMh/hu8IPryvLjN8DU91ZAkIr5
         eL4X7/U/2jbl6ekFfv2stBoUNoZE7SQgtZcaqO8f8vhlfezny9Jsz6hCVuAyKEXo+TPL
         zIcXetPhj65UaIprL0ugAMbp7CsU856jOSm/JAkT08zRQ7nHKrr/y1LhnK3oPa3p+KM0
         Q/1i/YcYTOwaB5f/ziVWCFZ0b6csV/HJXsrClO7/eLXEborGOIpjYuMvt90T/eJfI1Oo
         MP2A==
X-Gm-Message-State: AOAM531Esd7Fq5nY8NwicuD2dPKCC/kb635Qo3F+EybpBaOkh7v8TJF+
        FmH/xFA7yT0gIWvR2EhaW8jQC10SRfc=
X-Google-Smtp-Source: ABdhPJxXB7p+r/x4WzIRpDAHBgtF8yd6jgQYBzcVb6rcerdzP7sbiU6Ml51Ct6frVnYlvJUanEd/aQ==
X-Received: by 2002:a2e:81c5:: with SMTP id s5mr6962770ljg.197.1611786378069;
        Wed, 27 Jan 2021 14:26:18 -0800 (PST)
Received: from ?IPv6:2a00:1370:814d:ea25:a10:76ff:fe69:21b6? ([2a00:1370:814d:ea25:a10:76ff:fe69:21b6])
        by smtp.googlemail.com with ESMTPSA id c16sm878016lfh.82.2021.01.27.14.26.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jan 2021 14:26:17 -0800 (PST)
Subject: Re: [PATCH v5 00/21] sync_file API is not very suitable for DRM
To:     Mikko Perttunen <cyndis@kapsi.fi>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <da085c38-4ac1-19dd-7706-caf323c969d2@gmail.com>
 <2f999b6d-d781-503a-78f4-d444bce72c58@kapsi.fi>
 <c690b17d-7278-5d25-8316-671afd111e01@gmail.com>
 <53b7c991-7aa7-2407-eb54-d9db997f00e7@kapsi.fi>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <6fe05443-de81-ecf6-faf8-a62d73c0de9c@gmail.com>
Date:   Thu, 28 Jan 2021 01:26:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <53b7c991-7aa7-2407-eb54-d9db997f00e7@kapsi.fi>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

28.01.2021 00:53, Mikko Perttunen пишет:
> On 1/27/21 11:35 PM, Dmitry Osipenko wrote:
>> 26.01.2021 05:45, Mikko Perttunen пишет:
>>>> 4. Sync file shouldn't be needed for the part of DRM API which doesn't
>>>> interact with external non-DRM devices.  We should use DRM syncobj for
>>>> everything related to DRM, it's a superior API over sync file, it's
>>>> suitable for DRM scheduler.
>>>
>>> Considering the issues with fileno limits, I suppose there is no other
>>> choice. Considering the recent NTSYNC proposal by Wine developers, maybe
>>> we should also have NTHANDLEs to get rid of restrictions of file
>>> descriptors.
>>
>> It's odd to me that you trying to avoid the existing DRM API. This all
>> was solved in DRM long time ago and grate drivers have no problems with
>> using the DRM APIs. Even if something is really missing, then you should
>> add the missing features instead of re-inventing everything from scratch.
>>
> 
> DRM is only one of many subsystems that will have to deal with
> syncpoints, so I have wanted to have a central solution instead of
> reimplementing the same stuff everywhere. sync_files seem like the
> "missing feature", but they are difficult to use it with the fileno
> limits. But as has been said many times, they are intended only to
> transfer fences between the implementations in individual drivers, so I
> guess I will have to abandon this dream.

Let's focus on finishing the basics first, using what we already have.
Sync file + syncobj should be good enough for what we need right now.

>>> DRM syncobjs may have some advantages over sync files, but
>>> also disadvantages. They cannot be poll()ed, so they cannot be combined
>>> with waits for other resources.
>>
>> I'm not sure do you mean by "poll". Sync object supports polling very
>> well.
>>
> 
> I mean the poll/select etc. series of functions, which wait for file
> descriptors to become ready. If there's some trick that allows syncobjs
> to be used for that, then please tell.

Please explain in details what problem you need to solve, give an example.
