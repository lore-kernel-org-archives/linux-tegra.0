Return-Path: <SRS0=19fU=CZ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B14D5C43461
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Sep 2020 20:44:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5956421D24
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Sep 2020 20:44:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b="v06gt/0I"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726831AbgIPUor (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 16 Sep 2020 16:44:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728570AbgIPUoF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Sep 2020 16:44:05 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 831C9C06174A
        for <linux-tegra@vger.kernel.org>; Wed, 16 Sep 2020 13:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=sIMG4wWgY9okM8dfYXX6a9fUcsqWrWVJbPz4x4HHJm8=; b=v06gt/0ITtgVyOORAA8OCjcobZ
        U6DZ/nHwBSr3nK6SB1EFgrdnKbYQermRBF1XgsK11dR9Rmf51lF+9VWYH7mW7a//Ms1sHIh9s3RRW
        cmnwCvO4kBUzUQ6/eBBgG4PgnTliG7PHmi0Nymqmz0e3quHU5acqrxXKURh/HVoxhp/hmscmueGtQ
        7ETry/C2W2cfFTT93fu2cnY5YxCcJSCPpRB/Xn1yiz+S9SjZGzUr10JkxEmBIU6WmaIq5CmWclWtz
        oNtzY/569M809ClABtxn1l/pe2qoCp9lWzHFAFKZtA5z8nJL9wO2Rm2mg7m9ozMB26GXALBsEt3bt
        kNsZ7oPw==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1kIeHX-00047O-FZ; Wed, 16 Sep 2020 23:43:59 +0300
Subject: Re: [RFC PATCH v2 13/17] gpu: host1x: Reset max value when freeing a
 syncpoint
To:     Dmitry Osipenko <digetx@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-14-mperttunen@nvidia.com>
 <b4b3ae98-4ccb-152a-deda-2da81d1c46ef@gmail.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <0d12991e-3599-c5bf-11e5-78031f0f8088@kapsi.fi>
Date:   Wed, 16 Sep 2020 23:43:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <b4b3ae98-4ccb-152a-deda-2da81d1c46ef@gmail.com>
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

On 9/16/20 10:44 PM, Dmitry Osipenko wrote:
> 05.09.2020 13:34, Mikko Perttunen пишет:
>> With job recovery becoming optional, syncpoints may have a mismatch
>> between their value and max value when freed. As such, when freeing,
>> set the max value to the current value of the syncpoint so that it
>> is in a sane state for the next user.
>>
>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>> ---
>>   drivers/gpu/host1x/syncpt.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/host1x/syncpt.c b/drivers/gpu/host1x/syncpt.c
>> index 2fad8b2a55cc..82ecb4ac387e 100644
>> --- a/drivers/gpu/host1x/syncpt.c
>> +++ b/drivers/gpu/host1x/syncpt.c
>> @@ -385,6 +385,7 @@ static void syncpt_release(struct kref *ref)
>>   {
>>   	struct host1x_syncpt *sp = container_of(ref, struct host1x_syncpt, ref);
>>   
>> +	atomic_set(&sp->max_val, host1x_syncpt_read_min(sp));
>>   	sp->locked = false;
>>   
>>   	mutex_lock(&sp->host->syncpt_mutex);
>>
> 
> Please note that the sync point state actually needs to be completely
> reset at the sync point request-time because both downstream fastboot
> and upstream u-boot [1] are needlessly enabling display VBLANK interrupt
> that continuously increments sync point #26 during of kernel boot until
> display controller is reset.
> 
> [1] https://github.com/u-boot/u-boot/blob/master/drivers/video/tegra.c#L155
> 
> Hence once sync point #26 is requested, it will have a dirty state. So
> far this doesn't have any visible effect because sync points aren't used
> much.
> 

Maybe we can instead reserve syncpoints that might be used by the boot 
chain, and only allow allocating them once the display driver has acked 
that the syncpoint will no longer be incremented? That way if the 
display driver is disabled for some reason we'll still be fine.

Looking at the downstream driver, it (still, on new chips..) reserves 
the following syncpoints:

- 10 (AVP)
- 22 (3D)
- 26 (VBLANK0)
- 27 (VBLANK1)

and says that this applies to T20, T30, T114 and T148.

I suppose if you haven't observed this happening to other syncpoints 
than 26, then reserving 26 would probably be enough.

Mikko
