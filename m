Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5CC4C433DB
	for <linux-tegra@archiver.kernel.org>; Wed, 27 Jan 2021 21:54:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ABA806146D
	for <linux-tegra@archiver.kernel.org>; Wed, 27 Jan 2021 21:54:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236398AbhA0VyK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 27 Jan 2021 16:54:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234982AbhA0VyD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 27 Jan 2021 16:54:03 -0500
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCEA6C06174A
        for <linux-tegra@vger.kernel.org>; Wed, 27 Jan 2021 13:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=RzYqJl+q1gCm+1GGVn7zeM+eQJYxs7B083hKM09xL6k=; b=oZOh2HvvspN52yo1o/O/dpvVZJ
        QpjKz7xh0L/jQQsoDCEdV3GS6dl3OvHplPiMrhWn97CST69eSmqDSUlwqXbST5mO33z3NSYmjbWJW
        MljqJYmAICz7QaeXicM9kygZBoO/GzFL0Gk5lQXPwxSEQt0x7JqMpoj8BaeJVd/Q6QG0+nKRhQeFj
        d/2BrzMi7u7Y1ybeyJKx4uW5WgzkPGec48/7cVP5U8gToME2g+U5z3cwQBiVaD/uHUlI5P6vY3hfx
        6jsbPqYhsOWXQYcrhcByffF0+zPRiJFfIttzF60TOmlymD1b8UFbYWV2OP9/F8nxS6Mb/6kbJA7rT
        vbkWid8w==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1l4skW-0007Ox-Sg; Wed, 27 Jan 2021 23:53:16 +0200
Subject: Re: [PATCH v5 00/21] sync_file API is not very suitable for DRM
To:     Dmitry Osipenko <digetx@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <da085c38-4ac1-19dd-7706-caf323c969d2@gmail.com>
 <2f999b6d-d781-503a-78f4-d444bce72c58@kapsi.fi>
 <c690b17d-7278-5d25-8316-671afd111e01@gmail.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <53b7c991-7aa7-2407-eb54-d9db997f00e7@kapsi.fi>
Date:   Wed, 27 Jan 2021 23:53:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <c690b17d-7278-5d25-8316-671afd111e01@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 1/27/21 11:35 PM, Dmitry Osipenko wrote:
> 26.01.2021 05:45, Mikko Perttunen пишет:
>>> 4. Sync file shouldn't be needed for the part of DRM API which doesn't
>>> interact with external non-DRM devices.  We should use DRM syncobj for
>>> everything related to DRM, it's a superior API over sync file, it's
>>> suitable for DRM scheduler.
>>
>> Considering the issues with fileno limits, I suppose there is no other
>> choice. Considering the recent NTSYNC proposal by Wine developers, maybe
>> we should also have NTHANDLEs to get rid of restrictions of file
>> descriptors.
> 
> It's odd to me that you trying to avoid the existing DRM API. This all
> was solved in DRM long time ago and grate drivers have no problems with
> using the DRM APIs. Even if something is really missing, then you should
> add the missing features instead of re-inventing everything from scratch.
> 

DRM is only one of many subsystems that will have to deal with 
syncpoints, so I have wanted to have a central solution instead of 
reimplementing the same stuff everywhere. sync_files seem like the 
"missing feature", but they are difficult to use it with the fileno 
limits. But as has been said many times, they are intended only to 
transfer fences between the implementations in individual drivers, so I 
guess I will have to abandon this dream.

>> DRM syncobjs may have some advantages over sync files, but
>> also disadvantages. They cannot be poll()ed, so they cannot be combined
>> with waits for other resources.
> 
> I'm not sure do you mean by "poll". Sync object supports polling very well.
> 

I mean the poll/select etc. series of functions, which wait for file 
descriptors to become ready. If there's some trick that allows syncobjs 
to be used for that, then please tell.

Mikko
