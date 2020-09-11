Return-Path: <SRS0=EsoP=CU=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D489C43461
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Sep 2020 22:11:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D19121D7E
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Sep 2020 22:11:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b="gPdH7Mi+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725864AbgIKWLa (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 11 Sep 2020 18:11:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725849AbgIKWL2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 11 Sep 2020 18:11:28 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD2BEC061573
        for <linux-tegra@vger.kernel.org>; Fri, 11 Sep 2020 15:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ogTQed4AB3YTOxiNumxOSIUQDui4rXqp7ldPSCSbBJ8=; b=gPdH7Mi+qbv0+WK4jFhsY6nd0d
        RdTASNJFBBYgMPRnW5CatCY/463DWXIHv4oUhiME+OqvpTgWNJvH0y58fz1FsmK6W6TTxJSLT9KuO
        QTnEFYY421E1mcEH/2gu6DYBvompjnxYcIpVj6MnI6NJZ90k/wvHoakyQeh1mA4lQKVdVTkCJ95Zs
        ez/Y0BxUpRV/SfyZ+6AfXaWxw8y4x6sc1nJgPyIt5TtdTJGqmtjGZef8sTncgtZxW3d5v+xr8pA1N
        oL7N8A49ZDqLFKlv2zqBegCPWLSS2Xjbwjbmi6X8iBHLjJgAJzOPsBG3TnUCRyFREZnC+APfp0d+W
        citAHyKA==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1kGrGG-0005lL-Gn; Sat, 12 Sep 2020 01:11:16 +0300
Subject: Re: [RFC PATCH v2 10/17] WIP: gpu: host1x: Add no-recovery mode
To:     Dmitry Osipenko <digetx@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-11-mperttunen@nvidia.com>
 <7d7a29e8-3151-12ea-da66-d8a479edda84@gmail.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <c2498218-e107-4df4-41ce-c60da65ceaf7@kapsi.fi>
Date:   Sat, 12 Sep 2020 01:11:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <7d7a29e8-3151-12ea-da66-d8a479edda84@gmail.com>
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

On 9/11/20 7:40 PM, Dmitry Osipenko wrote:
> 05.09.2020 13:34, Mikko Perttunen пишет:
>> +	} else {
>> +		struct host1x_job *failed_job = job;
>> +
>> +		host1x_job_dump(dev, job);
>> +
>> +		host1x_syncpt_set_locked(job->syncpt);
>> +		failed_job->cancelled = true;
>> +
>> +		list_for_each_entry_continue(job, &cdma->sync_queue, list) {
>> +			unsigned int i;
>> +
>> +			if (job->syncpt != failed_job->syncpt)
>> +				continue;
>> +
>> +			for (i = 0; i < job->num_slots; i++) {
>> +				unsigned int slot = (job->first_get/8 + i) %
>> +						    HOST1X_PUSHBUFFER_SLOTS;
>> +				u32 *mapped = cdma->push_buffer.mapped;
>> +
>> +				mapped[2*slot+0] = 0x1bad0000;
>> +				mapped[2*slot+1] = 0x1bad0000;
> 
> The 0x1bad0000 is a valid memory address on Tegra20.
> 
> The 0x60000000 is invalid phys address for all hardware generations.
> It's used by grate-kernel [1] and VDE driver [2]. Note that the 0x6 <<
> 28 is also invalid Host1x opcode, while 0x1 should break CDMA parser
> during of PB debug-dumping.
> 
> [1]
> https://github.com/grate-driver/linux/blob/master/drivers/gpu/drm/tegra/gem.h#L16
> 
> [2]
> https://elixir.bootlin.com/linux/v5.9-rc4/source/drivers/staging/media/tegra-vde/iommu.c#L99
> 
> The VDE driver reserves the trapping IOVA addresses, I assume the Host1x
> driver should do the same.
> 

The 0x1bad0000's are not intended to be memory addresses, they are NOOP 
opcodes (INCR of 0 words to offset 0xbad). I'll fix this to use proper 
functions to construct the opcodes and add some comments. These need to 
be NOOP opcodes so the command parser skips over these "cancelled" jobs 
when the channel is resumed.

BTW, 0x60000000 is valid on Tegra194 and later.

Mikko
