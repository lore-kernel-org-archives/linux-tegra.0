Return-Path: <SRS0=dOwp=CS=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26048C43461
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Sep 2020 08:05:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 67D9E20758
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Sep 2020 08:05:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b="su4oUu3k"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726535AbgIIIFO (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 9 Sep 2020 04:05:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727820AbgIIIDv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 9 Sep 2020 04:03:51 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5C3DC061573
        for <linux-tegra@vger.kernel.org>; Wed,  9 Sep 2020 01:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=XjASIbBeIVCNLT3Zk1bmoMu9tjCwPWXDJh9QgrZMSlQ=; b=su4oUu3kUyoKA1fjUAZHsOSqam
        jp8gV2HiekuE/1PkiPK+QsRVN2RfeWPDsZaV385Uq2FZLbiErPvNRWStJQcqjfciB8LCmyuZxj2B6
        l1GrpxJmeYcd/YsdzDJyXytB+1fdM02HBwmd6887dvfjhfYhJGGhrnkgqZkWUUonABTsTZtXBi4KO
        rR2ZEGcYSAwv35er/CtQLI2g4HcGv5OEwAEx9/dwz6hchGeCWHxFrW8qJeJzPsKvhREi23J+fv5dB
        uNin4aLMK25q5Zwt6hyAjnR2wYYKBpUwMdOQWa4uV+BPIj3DGBPhEHMWmW/T8H8Q4kqo+WL1k619U
        o4pgD/RA==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1kFv4c-0007Nr-2u; Wed, 09 Sep 2020 11:03:22 +0300
Subject: Re: [RFC PATCH v2 06/17] gpu: host1x: Cleanup and refcounting for
 syncpoints
To:     Dmitry Osipenko <digetx@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-7-mperttunen@nvidia.com>
 <913a625c-9630-92af-aba0-fdddf6bbdb29@gmail.com>
 <e9cce9d5-1a63-077e-1ca6-ac5d5112d5fe@kapsi.fi>
 <a7213cd6-3bba-95a2-1f88-b8a64a5c2e87@gmail.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <50d2e0b3-e23d-d2d1-0523-a8f83a7eecba@kapsi.fi>
Date:   Wed, 9 Sep 2020 11:03:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <a7213cd6-3bba-95a2-1f88-b8a64a5c2e87@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.250.171.65
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 9/9/20 3:07 AM, Dmitry Osipenko wrote:
> 05.09.2020 17:53, Mikko Perttunen пишет:
> ...
>>> Hello, Mikko!
>>>
>>> What do you think about to open-code all the host1x structs by moving
>>> them all out into the public linux/host1x.h? Then we could inline all
>>> these trivial single-line functions by having them defined in the public
>>> header. This will avoid all the unnecessary overhead by allowing
>>> compiler to optimize the code nicely.
>>>
>>> Of course this could be a separate change and it could be done sometime
>>> later, I just wanted to share this quick thought for the start of the
>>> review.
>>>
>>
>> Hi :)
>>
>> I think for such micro-optimizations we should have a benchmark to
>> evaluate against. I'm not sure we have all that many function calls into
>> here overall that it would make a noticeable difference. In any case, as
>> you said, I'd prefer to keep further refactoring to a separate series to
>> avoid growing this series too much.
> 
> The performance difference doesn't bother me, it should be insignificant
> in this particular case. The amount of the exported functions is what
> makes me feel uncomfortable, and especially that most of those functions
> are trivial.

I don't see a particular problem with this -- I think it's better to 
keep the data structures in the driver-internal headers to to improve 
modularization. I think we can get rid of the syncpt_get_by_id* 
functions once we remove the staging code, so that would clean up things 
as well.

> 
> My concern is that doing cleanups of the upstream drivers usually not
> easy. Hence it could be a good thing to put effort into restructuring
> the current code before new code is added. But at first we need to have
> a full-featured draft implementation that will show what parts of the
> driver require refactoring.
> 

My feeling is that once we have the new UAPI implemented, refactoring 
will be easier because we have a better idea of what we need of the 
code, and we will be able to remove the staging code, allowing removal 
or easier refactoring of many old paths.

While doing that, some of the new code will have to be changed again as 
well, sure, but at least the entire time we will have a functional 
implementation.

Mikko
