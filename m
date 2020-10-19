Return-Path: <SRS0=MPHS=D2=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB698C43457
	for <linux-tegra@archiver.kernel.org>; Mon, 19 Oct 2020 08:13:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 762AF2225A
	for <linux-tegra@archiver.kernel.org>; Mon, 19 Oct 2020 08:13:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b="r4Dm4JXz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728784AbgJSINc (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 19 Oct 2020 04:13:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728726AbgJSINc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 19 Oct 2020 04:13:32 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B718C0613CE
        for <linux-tegra@vger.kernel.org>; Mon, 19 Oct 2020 01:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=t9SVbxJKpdvXfjX26zsjTYebgTJmlCiMsXrlzcLhYKo=; b=r4Dm4JXzNID4/9Gq6iPh2GkQmV
        FWAYQ2IygdSGbEw9lU3V3rPt2B3BVdY4hY6gmD/Jw6ZlPe/AQrSypOqd1bSSh2yrHIORZNS0QHYkK
        +NZQFRsSfYR9wX3HQ3+7JkoO0vnivq8GAOFarD6YE4TZkbxtPip+JenDvVmvuZmmZSWIOjSAAyEWi
        hVvHLcmePuvvAO9sxzP64uwvT4/iklq4+DpTMVR40aBUEXI9109RQWUnpWd/N+EXIPJncW/H0fUbp
        /TIXi1o2mL7pA0RyKSEgl+djjcKGi5AvRxgTMu8BgSp7CBtUKbRaNY5nyWtr6+7Vds84t4qugZ8au
        pWoxY2TA==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1kUQIH-0007jE-3B; Mon, 19 Oct 2020 11:13:25 +0300
Subject: Re: [PATCH v3 19/20] drm/tegra: Implement new UAPI
To:     Dmitry Osipenko <digetx@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20201007171238.1795964-1-mperttunen@nvidia.com>
 <20201007171238.1795964-20-mperttunen@nvidia.com>
 <dd13ec2c-1e01-ca61-656c-b23b156b100f@gmail.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <b33a5084-7dc3-a865-2f36-274ecebf2ee7@kapsi.fi>
Date:   Mon, 19 Oct 2020 11:13:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <dd13ec2c-1e01-ca61-656c-b23b156b100f@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 10/19/20 5:21 AM, Dmitry Osipenko wrote:
> 07.10.2020 20:12, Mikko Perttunen пишет:
>> +int tegra_drm_ioctl_channel_map(struct drm_device *drm, void *data,
>> +				struct drm_file *file)
>> +{
> 
> Hello, Mikko!
> 
> Could you please tell what are the host1x clients that are going to be
> upstreamed and will need this IOCTL?
> 

Hi Dmitry!

It is needed for any engine/job that wants to access memory, as this 
IOCTL must be used to map memory for the engine. So all of them.

Downstream doesn't have an equivalent IOCTL because it (currently) does 
mapping at submit time, but that is suboptimal because

- it requires doing relocations in the kernel which isn't required for T186+
- it's a big performance penalty, due to which the downstream kernel has 
the "deferred dma-buf unmapping" feature, where unmapping a dma_buf may 
not immediately unmap it in case it's used later, so that the "mapping" 
later is faster. A feature which we'd preferably get rid of.
- because of the above feature not being controlled by the user, it can 
cause variance in submit times.

On the other hand, we cannot (at least always) do the mapping at 
allocation/import time, because

- A single FD may have multiple channel_ctx's, and an allocation/import 
may need to be used in any subset of them
- The import IOCTL is fixed and doesn't have the parameters we'd need to 
do this at import time
- Overall it's more orthogonal to have GEM object acquirement in one 
step and mapping in another.

Maybe that's not quite what you asked, but it's some background anyway :)

Cheers,
Mikko
