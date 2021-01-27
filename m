Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32B6AC433E0
	for <linux-tegra@archiver.kernel.org>; Wed, 27 Jan 2021 21:53:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EC00B6146D
	for <linux-tegra@archiver.kernel.org>; Wed, 27 Jan 2021 21:53:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235913AbhA0Vxt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 27 Jan 2021 16:53:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236211AbhA0Vxl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 27 Jan 2021 16:53:41 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 564AEC061573
        for <linux-tegra@vger.kernel.org>; Wed, 27 Jan 2021 13:53:01 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id f2so3896286ljp.11
        for <linux-tegra@vger.kernel.org>; Wed, 27 Jan 2021 13:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=I2V5qL7ef4qnigee9vLt+3og4OBtjgl/PNhaajxHfkY=;
        b=fp1l0zczuSsluJ5rNV82ImxxiKA1iV7UFIkHHxxlokIwffYPKVYGqGBFu1FBEi8XDA
         dUPXjRdAbfZvt5tMQTSl1zFktsLeu+gJuwmeq241CLUSi6iAvNpFunl8YNzIG5UyS7RI
         Fara4J5IgUT27agOZzW8MN0puhQYLOL8X/TISxefKHmLoSgtFw9gQJZRaiPGRyRpYhL3
         XvOPfKGOGWNx7gPuGHDGiE6jpRZYul9IoMUnFWq0zd9J/c5SDA9mO5AW3crm0AMmqzvI
         WO1coAScJMIPUAUWKpdEVUex+CzOb1XL8h5e3E9OFlFHjluKyJR4PUmjQUCjhQBti3MB
         AV3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=I2V5qL7ef4qnigee9vLt+3og4OBtjgl/PNhaajxHfkY=;
        b=nfoPR58SlxhJQ9j9aDj6WTkPAtjYqzYe0dzIV/w3IhF+kYEiHZl7AAEK9eKcic95Gd
         qhUJF/BJDZuL04jXOYph6A0+SqvaalecxfEfF96AtNNr0BjcQYPzDtRni38pH0ndAvqZ
         BRKepKytzdxaFLE+qqtvfW7hKBe0bXXLVt8uNONEUKBdpVk5srugpZ/IYcxDYZ3O+VKr
         zy9YbIwmsjOqk1TaOYyUD3XWoMdkqFtQ0s5AfFuVnhI4TspEILMl2Z4AVVSnTybj88sw
         1m9xZZw9vg5afDRCFZV4qzyQjqB2xdW8YyyC5Q8qHBh5pl6qrKbbY8oXEWQcENsIOYje
         2HaQ==
X-Gm-Message-State: AOAM530a9KHEH52AEDCJdp5CNFGDAcHJ69xRyeMyCvNZGNIBwsuf0xBz
        2SXKFh6yq2dXguoXhpZriYk=
X-Google-Smtp-Source: ABdhPJykpTqIXPlX22xvTJ7uWlP/yBGwsd3B47unBuHTo1XyPLU+9TV1fmfI8EPxij8D0d2qtyX+kA==
X-Received: by 2002:a2e:b743:: with SMTP id k3mr6465157ljo.337.1611784379887;
        Wed, 27 Jan 2021 13:52:59 -0800 (PST)
Received: from ?IPv6:2a00:1370:814d:ea25:a10:76ff:fe69:21b6? ([2a00:1370:814d:ea25:a10:76ff:fe69:21b6])
        by smtp.googlemail.com with ESMTPSA id g21sm839837lfr.212.2021.01.27.13.52.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jan 2021 13:52:59 -0800 (PST)
Subject: Re: [PATCH v5 00/21] support option where all commands are collected
 into a single,dedicated cmdstream
To:     Mikko Perttunen <cyndis@kapsi.fi>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <da085c38-4ac1-19dd-7706-caf323c969d2@gmail.com>
 <2f999b6d-d781-503a-78f4-d444bce72c58@kapsi.fi>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c0d4c6ed-c942-97cb-379b-09482aa73020@gmail.com>
Date:   Thu, 28 Jan 2021 00:52:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <2f999b6d-d781-503a-78f4-d444bce72c58@kapsi.fi>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

26.01.2021 05:45, Mikko Perttunen пишет:
>> 6. We will need to allocate a host1x BO for a job's cmdstream and add a
>> restart command to the end of the job's stream.  CDMA will jump into the
>> job's stream from push buffer.
>>
>> We could add a flag for that to drm_tegra_submit_cmd_gather, saying that
>> gather should be inlined into job's main cmdstream.
>>
>> This will remove a need to have a large push buffer that will easily
>> overflow, it's a real problem and upstream driver even has a bug where
>> it locks up on overflow.
>>
>> How it will look from CDMA perspective:
>>
>> PUSHBUF |
>> ---------
>> ...     |      | JOB   |
>>          |      ---------       | JOB GATHER |
>> RESTART    ------> CMD    |       --------------
>>          |      |GATHER -------> DATA        |
>> ... <---------- RESTART|       |            |
>>          |      |       |
>>
> 
> Let me check if I understood you correctly:
> - You would like to have the job's cmdbuf have further GATHER opcodes
> that jump into smaller gathers?

I want jobs to be a self-contained. Instead of pushing commands to the
PB of a kernel driver, we'll push them to job's cmdstream. This means
that for each new job we'll need to allocate a host1x buffer.

> I assume this is needed because currently WAITs are placed into the
> pushbuffer, so the job will take a lot of space in the pushbuffer if
> there are a lot of waits (and GATHERs in between these waits)?

Yes, and with drm-sched we will just need to limit the max number of
jobs in the h/w queue (i.e. push buffer) and then push buffer won't ever
overflow. Problem solved.

> If so, perhaps as a simpler alternative we could change the firewall to
> allow SETCLASS into HOST1X for waiting specifically, then userspace
> could just submit one big cmdbuf taking only little space in the
> pushbuffer? Although that would only allow direct ID/threshold waits.

My solution doesn't require changes to firewall, not sure whether it's
easier.

> In any case, it seems that this can be added in a later patch, so we
> should omit it from this series for simplicity. If it is impossible for
> the userspace to deal with it, we could disable the firewall
> temporarily, or implement the above change in the firewall.

I won't be able to test UAPI fully until all features are at least on
par with the experimental driver of grate kernel.
