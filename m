Return-Path: <SRS0=iMCN=CY=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1892EC433E2
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Sep 2020 11:09:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C903621D7B
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Sep 2020 11:09:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b="Iic6iRCj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726149AbgIOLJW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 15 Sep 2020 07:09:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726095AbgIOLJH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 15 Sep 2020 07:09:07 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D4DCC06174A
        for <linux-tegra@vger.kernel.org>; Tue, 15 Sep 2020 04:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=GWe1kxX/X61YaBd3+sgGR1kBcW44l/c7WKlet3NJe+8=; b=Iic6iRCjVNoed4pmyzensccdmf
        T/fJ949WCVy3Po9+oeF/UVXUptIPJTgNBCeUqaMOtMVv2sJbC3wYB0KUs7zivF5PCozLGnzaiNR1S
        gXhL/jl8DnpM/h18L5A2Wm6NtidWl8pFcGjEUWbD+EW0/NrZK4vLmqaMGv0cX/AOsowLW7s5VPb+g
        8ksZWd6s2wZfZY3WPHhv/aEqPbih6XrhI0edRn9sSdWT5kqELt8P2CEkoJHLRiQYeLmnWPj8jKqAr
        sj3D4u02Tfct3gm0/jVionbLA+mT7aXScrxOs6SAws5e7XkQ1MxZA0c+B9DORR3FGgPF5jxG5Wmab
        A7kukDug==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1kI8pW-0007ex-Si; Tue, 15 Sep 2020 14:08:58 +0300
Subject: Re: [RFC PATCH v2 17/17] WIP: drm/tegra: Implement new UAPI
To:     Dmitry Osipenko <digetx@gmail.com>,
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
 <7244cec7-a1e5-e3ad-f4f5-31f8034fb270@gmail.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <7923986d-c884-c6e6-3ea5-4e45ff4d1d13@kapsi.fi>
Date:   Tue, 15 Sep 2020 14:08:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <7244cec7-a1e5-e3ad-f4f5-31f8034fb270@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 9/11/20 7:30 PM, Dmitry Osipenko wrote:
> 11.09.2020 12:59, Mikko Perttunen пишет:
>> On 9/11/20 12:57 AM, Dmitry Osipenko wrote:
>>> 09.09.2020 11:36, Mikko Perttunen пишет:
>>> ...
>>>>>
>>>>> Does it make sense to have timeout in microseconds?
>>>>>
>>>>
>>>> Not sure, but better have it a bit more fine-grained rather than
>>>> coarse-grained. This still gives a maximum timeout of 71 minutes so I
>>>> don't think it has any negatives compared to milliseconds.
>>>
>>> If there is no good reason to use microseconds right now, then should be
>>> better to default to milliseconds, IMO. It shouldn't be a problem to
>>> extend the IOCLT with a microseconds entry, if ever be needed.
>>>
>>> {
>>>      __u32 timeout_ms;
>>> ...
>>>      __u32 timeout_us;
>>> }
>>>
>>> timeout = timeout_ms + 1000 * timeout_us;
>>>
>>> There shouldn't be a need for a long timeouts, since a job that takes
>>> over 100ms is probably too unpractical. It also should be possible to
>>> detect a progressing job and then defer timeout in the driver. At least
>>> this is what other drivers do, like etnaviv driver for example:
>>>
>>> https://elixir.bootlin.com/linux/v5.9-rc4/source/drivers/gpu/drm/etnaviv/etnaviv_sched.c#L107
>>>
>>>
>>
>> I still don't quite understand why it's better to default to
>> milliseconds? As you say, there is no need to have a long timeout, and
>> if we go microseconds now, then there wouldn't be a need to extend in
>> the future.
> 
> It will nicer to avoid unnecessary unit-conversions in the code in order
> to keep it cleaner.

We can change all the internals to use microseconds as well. We 
eventually have to convert it to jiffies anyway, so the unit before that 
shouldn't matter much.

> 
> I'm now also a bit dubious about that the timeout field of the submit
> IOCTL will be in the final UAPI version because it should become
> obsolete once drm-scheduler will be hooked up, since the hung-check
> timeout will be specified per-hardware engine within the kernel driver
> and there won't be much use for the user-defined timeout.
> 

Perhaps we can omit this field for now. Looking at it, it's primarily 
used for tests, and for that we could add a debugfs knob to adjust the 
timeout if needed.

Mikko
