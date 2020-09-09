Return-Path: <SRS0=dOwp=CS=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77AF7C43461
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Sep 2020 08:44:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B100215A4
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Sep 2020 08:44:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b="HcLdHIUw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbgIIIog (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 9 Sep 2020 04:44:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725864AbgIIIoe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 9 Sep 2020 04:44:34 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 043DBC061573
        for <linux-tegra@vger.kernel.org>; Wed,  9 Sep 2020 01:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ZVtGQHyrKlJmsSnNJwKFYsAAKRKi8Qv3hhTuIN2JcW8=; b=HcLdHIUwPEaPPfradkGM0M8FN+
        eHM1LM+o3zfrf7SojeHYg7NH5SlCSI06mzcPpUvFfkg8bgSFvI9ZIWyYP744aCv2g9mjJMgubDkw1
        3tOdBr+KeVvbfqqVcvAU3D+ykjTkv6Qc8uXzU9ZkvfxT897Fqd/eg7PyKMLYfycbRK6pqJtgE/kbm
        YTmevJICb+rFQoYjzkDGDMkKstPQPnyrhIcF7pkTwHxHMBT6yRugXq0tMhJRaaTJReP2Z4quYYrER
        Uq4hKTvdmAySfWx+IC44HBjgvXTC07AMPHiHZlfxgt5BuYuJII6GmwG0mvPUE13eV/txNy4LYkVVR
        uCSLFmhA==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1kFviO-0001i4-IS; Wed, 09 Sep 2020 11:44:28 +0300
Subject: Re: [RFC PATCH v2 00/17] Host1x/TegraDRM UAPI
To:     Dmitry Osipenko <digetx@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <963bb17d-9501-0118-b5c2-a06d68c3eb9f@gmail.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <8fb335d3-5af9-5922-579c-e3575772732a@kapsi.fi>
Date:   Wed, 9 Sep 2020 11:44:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <963bb17d-9501-0118-b5c2-a06d68c3eb9f@gmail.com>
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

On 9/9/20 5:20 AM, Dmitry Osipenko wrote:
> 05.09.2020 13:34, Mikko Perttunen пишет:
>> Hi all,
>>
>> here's a second revision of the Host1x/TegraDRM UAPI proposal,
>> hopefully with most issues from v1 resolved, and also with
>> an implementation. There are still open issues with the
>> implementation:
>>
>> * Relocs are now handled on TegraDRM side instead of Host1x,
>>    so the firewall is not aware of them, causing submission
>>    failure where the firewall is enabled. Proposed solution
>>    is to move the firewall to TegraDRM side, but this hasn't
>>    been done yet.
>> * For the new UAPI, syncpoint recovery on job timeout is
>>    disabled. What this means is that upon job timeout,
>>    all further jobs using that syncpoint are cancelled,
>>    and the syncpoint is marked unusable until it is freed.
>>    However, there is currently a race between the timeout
>>    handler and job submission, where submission can observe
>>    the syncpoint in non-locked state and yet the job
>>    cancellations won't cancel the new job.
>> * Waiting for DMA reservation fences is not implemented yet.
>> * I have only tested on Tegra186.
>>
>> The series consists of three parts:
>>
>> * The first part contains some fixes and improvements to
>>    the Host1x driver of more general nature,
>> * The second part adds the Host1x side UAPI, as well as
>>    Host1x-side changes needed for the new TegraDRM UAPI,
>> * The third part adds the new TegraDRM UAPI.
>>
>> I have written some tests to test the new interface,
>> see https://github.com/cyndis/uapi-test. Porting of proper
>> userspace (e.g. opentegra, vdpau-tegra) will come once
>> there is some degree of conclusion on the UAPI definition.
> 
> Could you please enumerate all the currently opened questions?
> 

Which open questions do you refer to? The open items of v1 should be 
closed now; for fences we setup an SW timeout to prevent them from 
sticking around forever, and regarding GEM the GEM IOCTLs are again 
being used.

