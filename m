Return-Path: <SRS0=EsoP=CU=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD2DEC2D0E0
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Sep 2020 10:00:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 990F0221ED
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Sep 2020 10:00:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b="yh5ekNT/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725837AbgIKKAf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 11 Sep 2020 06:00:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725818AbgIKJ75 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 11 Sep 2020 05:59:57 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ECB7C061573
        for <linux-tegra@vger.kernel.org>; Fri, 11 Sep 2020 02:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=hgg6FoHK15WmMAYAEZFH4drMXVQgN/IydltaEjCXX9Q=; b=yh5ekNT/CnmyWDBz6fZFL5dyjr
        JS9Ob1Puccx+SzGO/pYsqJMh77fkopJjRsSsu+q7sD4UFFYgTemKiOhhI5kHU0aMkTT23gVBTaYuW
        HzI7dzCv7sMIQNEWCqNZHMxzLrofLZcKmG74ofPELKP+GWLUsdjb57rmlPqbsK2ELg5Nniu2Hn1Xe
        4RItI/PfpkFuQTpHtunat8I+DoRUk56RQB+WBk4AF0f3Xn1pd2OvuR1CDBI2nIrZfHTXTSL1Ww8HJ
        hFhbzHXcdbytDHmgNgWSsOqmIxLkZkOgbrnxQJTKw+qbyIt+hmGIHH1dYsKMBud1JbGiMq2tGiadX
        cTKM+M1g==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1kGfqQ-0004Gx-UP; Fri, 11 Sep 2020 12:59:51 +0300
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
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <27ee1096-d7fa-da63-f60e-93dbdd679893@kapsi.fi>
Date:   Fri, 11 Sep 2020 12:59:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <dba5e023-23d5-7e8a-f45e-bf41abf66ef6@gmail.com>
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

On 9/11/20 12:57 AM, Dmitry Osipenko wrote:
> 09.09.2020 11:36, Mikko Perttunen пишет:
> ...
>>>
>>> Does it make sense to have timeout in microseconds?
>>>
>>
>> Not sure, but better have it a bit more fine-grained rather than
>> coarse-grained. This still gives a maximum timeout of 71 minutes so I
>> don't think it has any negatives compared to milliseconds.
> 
> If there is no good reason to use microseconds right now, then should be
> better to default to milliseconds, IMO. It shouldn't be a problem to
> extend the IOCLT with a microseconds entry, if ever be needed.
> 
> {
> 	__u32 timeout_ms;
> ...
> 	__u32 timeout_us;
> }
> 
> timeout = timeout_ms + 1000 * timeout_us;
> 
> There shouldn't be a need for a long timeouts, since a job that takes
> over 100ms is probably too unpractical. It also should be possible to
> detect a progressing job and then defer timeout in the driver. At least
> this is what other drivers do, like etnaviv driver for example:
> 
> https://elixir.bootlin.com/linux/v5.9-rc4/source/drivers/gpu/drm/etnaviv/etnaviv_sched.c#L107
> 

I still don't quite understand why it's better to default to 
milliseconds? As you say, there is no need to have a long timeout, and 
if we go microseconds now, then there wouldn't be a need to extend in 
the future.

Mikko
