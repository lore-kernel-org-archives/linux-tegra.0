Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BA77C433DB
	for <linux-tegra@archiver.kernel.org>; Thu, 28 Jan 2021 11:10:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2EA7264DD8
	for <linux-tegra@archiver.kernel.org>; Thu, 28 Jan 2021 11:10:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229596AbhA1LJs (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 28 Jan 2021 06:09:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229594AbhA1LJk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 28 Jan 2021 06:09:40 -0500
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05D03C061573
        for <linux-tegra@vger.kernel.org>; Thu, 28 Jan 2021 03:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=mo3AkTen3Mb/LYk4vT7lQBVruefateYvv99Xrm8ZlH8=; b=N1I8QgICraeMPrpnfntTQWX/DP
        wAxs0DTYegvqUneH0E9xarqx8YjRg53s+T2dSIEptKe8aoI94kepSpqDEf3BXkDZ1LiEcNN8Z76OS
        NrvzD+/ZJAk7SmmJ1pdMu8R1ANwvP701y+sQ8aPkl1AlmUxsluA/hdEs5vYAZqWdpzFIOkGlGzk+9
        T8lrja9qKPTULNaayG18AGtCd7+c9bV4y37a2bSTaBIwmcjZltiu5cSvSFFdLb3TjKP0skCTiG2LG
        vJx+4Dw0ZzfwuKBtX1Y0eHbwaocGkQTjggnMroUza6AF8o49ZCckJIVuh0rsaYWHJ+v+0csZ6P1AP
        y4caXXNA==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1l55AU-0005Hp-Ni; Thu, 28 Jan 2021 13:08:54 +0200
Subject: Re: [PATCH v5 00/21] Host1x sync point UAPI should not be used for
 tracking DRM jobs
To:     Dmitry Osipenko <digetx@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <da085c38-4ac1-19dd-7706-caf323c969d2@gmail.com>
 <2f999b6d-d781-503a-78f4-d444bce72c58@kapsi.fi>
 <2ee12338-bd5a-4b99-f86d-13da0d2a899b@gmail.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <8504c239-d5df-3033-934c-7b3fab52e387@kapsi.fi>
Date:   Thu, 28 Jan 2021 13:08:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <2ee12338-bd5a-4b99-f86d-13da0d2a899b@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 1/27/21 11:20 PM, Dmitry Osipenko wrote:
> 26.01.2021 05:45, Mikko Perttunen пишет:
>>> 2. We will probably need a dedicated drm_tegra_submit_cmd for sync point
>>> increments.  The job's sync point will be allocated dynamically when job
>>> is submitted.  We will need a fag for the sync_incr and wait_syncpt
>>> commands, saying "it's a job's sync point increment/wait"
>>
>> Negative. Like I have explained in previous discussions, with the
>> current way the usage of hardware resources is much more deterministic
>> and obvious. I disagree on the point that this is much more complicated
>> for the userspace. Separating syncpoint and channel allocation is one of
>> the primary motivations of this series for me.
> 
> Sync points are a limited resource. The most sensible way to work around
> it is to keep sync points within kernel as much as possible. This is not
> only much simpler for user space, but also allows to utilize DRM API
> properly without re-inventing what already exists and it's easier to
> maintain hardware in a good state.

I've spent the last few years designing for automotive and industrial 
products, where we don't want to at runtime notice that the system is 
out of free syncpoints and because of that we can only process the next 
camera frame in a second or two instead of 16 milliseconds. We need to 
know that once we have allocated the resource, it is there. The newer 
chips are also designed to support this.

Considering Linux is increasingly being used for such applications, and 
they are important target markets for NVIDIA, these need to be supported.

Because of the above design constraint the userspace software that runs 
in these environments also expects resources to be allocated up front. 
This isn't a matter of having to design that software according to what 
kind of allocation API we decide do at Linux level -- it's no use 
designing for dynamic allocation if it leads to you not meeting the 
safety requirement of needing to ensure you have all resources allocated 
up front.

This isn't a good design feature just in a car, but in anything that 
needs to be reliable. However, it does pose some tradeoffs, and if you 
think that running out of syncpoints on T20-T114 because of upfront 
allocation is an actual problem, I'm not opposed to having both options 
available.

> 
> If you need to use a dedicated sync point for VMs, then just allocate
> that special sync point and use it. But this sync point won't be used
> for jobs tracking by kernel driver. Is there any problem with this?

In addition to above, it would increase the number of syncpoints 
required. The number of syncpoints supported by hardware has been 
calculated for specific use cases, and increasing the number of required 
syncpoints risks not being able to support those use cases.

> 
> The primary motivation for me is to get a practically usable kernel
> driver for userspace.
> 

Me too. For the traditional "tablet chips" the task is quite well 
defined and supported. But my goal is to also get rid of the jank in 
downstream and allow fully-featured use of Tegra devices on upstream 
kernels and for that, the driver needs to be usable for the whole range 
of use cases.

Mikko
