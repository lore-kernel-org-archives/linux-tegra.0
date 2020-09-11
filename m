Return-Path: <SRS0=EsoP=CU=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D387FC433E2
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Sep 2020 16:31:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9AE55221EB
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Sep 2020 16:31:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fZ8PivuL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbgIKQbc (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 11 Sep 2020 12:31:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725770AbgIKQa3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 11 Sep 2020 12:30:29 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CF54C061573
        for <linux-tegra@vger.kernel.org>; Fri, 11 Sep 2020 09:30:29 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id a22so12904688ljp.13
        for <linux-tegra@vger.kernel.org>; Fri, 11 Sep 2020 09:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IcDKPKQjae9Ro3rXGSlRF2IuFhtLWaHivCIWCC2bPic=;
        b=fZ8PivuLW/v30la5mx5KgmHJCdW5pIBEnUESjzd2Vt55sgs5isUqO1VdsPcqLEfQZ2
         H9a7KLla3MrwnrM1c5tmoP5FZCFrvizoGUvG2AnZhoyjzdaxE0n40LFaW/8/SJlLGrh/
         YQIZ2J6hKDgm3Q9IKTiwt5jkJG6v9+On9m1ofTLgctxglAaVf7KUWm35l2y8VUrAVftl
         DP1zjSsLzlEC0oyo29aGRhUOBy3O/+C+xkm2LahZJQYua1OMsE2K4IrDCZWLjeG+5SIx
         Xp+doEYnKLVE4PKDkR5AqkLeXNNfuTkrJ7ob3+0lFOcGW6USlZZ0G322yrTZ3gVQjQGg
         aopA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IcDKPKQjae9Ro3rXGSlRF2IuFhtLWaHivCIWCC2bPic=;
        b=SeUl2hZ03n+5Xt9z0EyBIF1X1KR4FMigH4qk2lS25vMcjF7VpvBCZDQnUZOjqsveuN
         wcLINBea0q8pkTkmTtyryM9pmgyjQhgZ7gepCdq/FEr5qZOKUZm75GtjsgVd3Jazn3+G
         nkLV40kcAjmvm2aeH8RY0ViTYkx++Z+buyeZyGewNzkzuyPANWXyAJzV2FvL64QUBTQC
         5V9sOLjBQ/ObKfpia/pKqfzXLdLnBO8/f65bzWLQR/zZJsCkz9u39G5SY+Vo0GPbMvbn
         szNy87Yb8rqughG649HBlVI5UZmur/IRa6mu3S3grmbVCPzS9XGNdMElqK6gJmxec2zY
         NfjQ==
X-Gm-Message-State: AOAM530cXl8tFIK4tO3K5wfZ2npbsKCl0jSs2NhdN7eFisczb/MJ/ocC
        DOzq9shJBFW8tvs8go0Vox0=
X-Google-Smtp-Source: ABdhPJxXnv6m9Ghb9dVQVkPoQZTcG00J4WYFduoJccKHNT/zUPRVSpA+cLLlYSUg0nEvfznQC55MHQ==
X-Received: by 2002:a2e:b531:: with SMTP id z17mr1213009ljm.30.1599841827894;
        Fri, 11 Sep 2020 09:30:27 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id u17sm139485lfl.283.2020.09.11.09.30.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2020 09:30:27 -0700 (PDT)
Subject: Re: [RFC PATCH v2 17/17] WIP: drm/tegra: Implement new UAPI
To:     Mikko Perttunen <cyndis@kapsi.fi>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-18-mperttunen@nvidia.com>
 <11c05ff2-092b-dc40-73a9-c0ec0fa22826@gmail.com>
 <3b3b7d35-e96c-1b6e-ddd0-24fd8a9dd5bf@gmail.com>
 <6d317f3f-51c8-6ed5-0a27-00e72f204941@kapsi.fi>
 <dba5e023-23d5-7e8a-f45e-bf41abf66ef6@gmail.com>
 <27ee1096-d7fa-da63-f60e-93dbdd679893@kapsi.fi>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <7244cec7-a1e5-e3ad-f4f5-31f8034fb270@gmail.com>
Date:   Fri, 11 Sep 2020 19:30:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <27ee1096-d7fa-da63-f60e-93dbdd679893@kapsi.fi>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

11.09.2020 12:59, Mikko Perttunen пишет:
> On 9/11/20 12:57 AM, Dmitry Osipenko wrote:
>> 09.09.2020 11:36, Mikko Perttunen пишет:
>> ...
>>>>
>>>> Does it make sense to have timeout in microseconds?
>>>>
>>>
>>> Not sure, but better have it a bit more fine-grained rather than
>>> coarse-grained. This still gives a maximum timeout of 71 minutes so I
>>> don't think it has any negatives compared to milliseconds.
>>
>> If there is no good reason to use microseconds right now, then should be
>> better to default to milliseconds, IMO. It shouldn't be a problem to
>> extend the IOCLT with a microseconds entry, if ever be needed.
>>
>> {
>>     __u32 timeout_ms;
>> ...
>>     __u32 timeout_us;
>> }
>>
>> timeout = timeout_ms + 1000 * timeout_us;
>>
>> There shouldn't be a need for a long timeouts, since a job that takes
>> over 100ms is probably too unpractical. It also should be possible to
>> detect a progressing job and then defer timeout in the driver. At least
>> this is what other drivers do, like etnaviv driver for example:
>>
>> https://elixir.bootlin.com/linux/v5.9-rc4/source/drivers/gpu/drm/etnaviv/etnaviv_sched.c#L107
>>
>>
> 
> I still don't quite understand why it's better to default to
> milliseconds? As you say, there is no need to have a long timeout, and
> if we go microseconds now, then there wouldn't be a need to extend in
> the future.

It will nicer to avoid unnecessary unit-conversions in the code in order
to keep it cleaner.

I'm now also a bit dubious about that the timeout field of the submit
IOCTL will be in the final UAPI version because it should become
obsolete once drm-scheduler will be hooked up, since the hung-check
timeout will be specified per-hardware engine within the kernel driver
and there won't be much use for the user-defined timeout.
