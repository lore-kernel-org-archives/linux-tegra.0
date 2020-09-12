Return-Path: <SRS0=YHIj=CV=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AA7CC433E2
	for <linux-tegra@archiver.kernel.org>; Sat, 12 Sep 2020 12:53:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5FB93208E4
	for <linux-tegra@archiver.kernel.org>; Sat, 12 Sep 2020 12:53:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GXCU5k+x"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725876AbgILMxX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 12 Sep 2020 08:53:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725923AbgILMxJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 12 Sep 2020 08:53:09 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 978DCC061573
        for <linux-tegra@vger.kernel.org>; Sat, 12 Sep 2020 05:53:08 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id z17so8605500lfi.12
        for <linux-tegra@vger.kernel.org>; Sat, 12 Sep 2020 05:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6dpGMF5H6mcAiyzNoMmGfadu4ovPBWLZg+ptyqmEQ3c=;
        b=GXCU5k+x3LKia0FF3MZBGHOBUUDHjarSFvGoP9BdpM7H7SlqQg3x+6Rk7G7AJeRhvg
         btpCB1km5qAONevBQ5E2oZPD1keQja9f7Yp9dlmkyVXxuNZ9o9xpFaFdrnyjFsZR+eN7
         Wu+RbP2v/SH/Jg3Zr66xXZtrapAmo/aW6fMf/HmpjftHimoTbexjo/B/dUWuvKIdSQVx
         NjpjrsFfntSgCh75gGnxaKIX3iFHQrdbO1yp93R31Dkj1YGxTam0+2ZL2VC4XiyF1dHX
         KPxMwZa00LXqfaz+ECi4eOWE6mVJ1rHDQIK//TsNN1hYQuldftsEEfCX3C+5Vb1kfRV/
         lSSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6dpGMF5H6mcAiyzNoMmGfadu4ovPBWLZg+ptyqmEQ3c=;
        b=rOnsocgcuD/bLN/lzd+e+LkXhKvqe5VBnVBOkmzZmKj6gjr2CKKDP+Y0uhNnwc6NI2
         lidrdHoVsHwz3wVwvUI50FCugvWw0V7VHv1DJehTkV72YJ/UGB35DtNYbZt3O7QK1zgp
         5E2NoDnHFRnLSkvB0DxDbUhfPxOR2ybkDzk9BMVKMq2zB/90VeZ4+CmrEjZhu3zINufd
         INdEjMe7hCFDKUMt3gPZIvuSdD/WufB3b6WVn2fhtR5cgQK5AezG2jbvPgc2ah7Jb07W
         aXzycUyRl1L/1vYYC/i2EP+wQBON9I9oXgdGkfTEu+lfx/3S6WIimH2y3pWT3RnAJPkf
         M0hA==
X-Gm-Message-State: AOAM532eflF+8lW7C8RSaxUsLeggDwfkfCglaxzS5BB/XAgLiWqDIheR
        eKNLIIy1G2Vq7EosBTG5LQg=
X-Google-Smtp-Source: ABdhPJyYqL5hARpaMerGitztfJMZzriV+mhvbSTZbptctxwEBoif6dD+CQGd1Sisa5Ocf/RbHlLlww==
X-Received: by 2002:a19:4c44:: with SMTP id z65mr1550169lfa.434.1599915186912;
        Sat, 12 Sep 2020 05:53:06 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id k3sm959598lfg.300.2020.09.12.05.53.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Sep 2020 05:53:06 -0700 (PDT)
Subject: Re: [RFC PATCH v2 10/17] WIP: gpu: host1x: Add no-recovery mode
To:     Mikko Perttunen <cyndis@kapsi.fi>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-11-mperttunen@nvidia.com>
 <7d7a29e8-3151-12ea-da66-d8a479edda84@gmail.com>
 <c2498218-e107-4df4-41ce-c60da65ceaf7@kapsi.fi>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <07f933b3-10d9-0318-e2f3-6dfd5b4903ac@gmail.com>
Date:   Sat, 12 Sep 2020 15:53:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c2498218-e107-4df4-41ce-c60da65ceaf7@kapsi.fi>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

12.09.2020 01:11, Mikko Perttunen пишет:
> On 9/11/20 7:40 PM, Dmitry Osipenko wrote:
>> 05.09.2020 13:34, Mikko Perttunen пишет:
>>> +    } else {
>>> +        struct host1x_job *failed_job = job;
>>> +
>>> +        host1x_job_dump(dev, job);
>>> +
>>> +        host1x_syncpt_set_locked(job->syncpt);
>>> +        failed_job->cancelled = true;
>>> +
>>> +        list_for_each_entry_continue(job, &cdma->sync_queue, list) {
>>> +            unsigned int i;
>>> +
>>> +            if (job->syncpt != failed_job->syncpt)
>>> +                continue;
>>> +
>>> +            for (i = 0; i < job->num_slots; i++) {
>>> +                unsigned int slot = (job->first_get/8 + i) %
>>> +                            HOST1X_PUSHBUFFER_SLOTS;
>>> +                u32 *mapped = cdma->push_buffer.mapped;
>>> +
>>> +                mapped[2*slot+0] = 0x1bad0000;
>>> +                mapped[2*slot+1] = 0x1bad0000;
>>
>> The 0x1bad0000 is a valid memory address on Tegra20.
>>
>> The 0x60000000 is invalid phys address for all hardware generations.
>> It's used by grate-kernel [1] and VDE driver [2]. Note that the 0x6 <<
>> 28 is also invalid Host1x opcode, while 0x1 should break CDMA parser
>> during of PB debug-dumping.
>>
>> [1]
>> https://github.com/grate-driver/linux/blob/master/drivers/gpu/drm/tegra/gem.h#L16
>>
>>
>> [2]
>> https://elixir.bootlin.com/linux/v5.9-rc4/source/drivers/staging/media/tegra-vde/iommu.c#L99
>>
>>
>> The VDE driver reserves the trapping IOVA addresses, I assume the Host1x
>> driver should do the same.
>>
> 
> The 0x1bad0000's are not intended to be memory addresses, they are NOOP
> opcodes (INCR of 0 words to offset 0xbad). I'll fix this to use proper
> functions to construct the opcodes and add some comments. These need to
> be NOOP opcodes so the command parser skips over these "cancelled" jobs
> when the channel is resumed.
> 
> BTW, 0x60000000 is valid on Tegra194 and later.

At a quick glance it looked like a memory address :)

I'm now taking a closer look at this patch and it raises some more
questions, like for example by looking at the "On job timeout, we stop
the channel, NOP all future jobs on the channel using the same syncpoint
..." through the prism of grate-kernel experience, I'm not sure how it
could co-exist with the drm-scheduler and why it's needed at all. But I
think we need a feature-complete version (at least a rough version), so
that we could start the testing, and then it should be easier to review
and discuss such things.
