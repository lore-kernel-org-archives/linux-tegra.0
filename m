Return-Path: <SRS0=Tnts=C2=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EBDFC43461
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 07:26:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C42972083B
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 07:26:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b="ILiIQABH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726153AbgIQH0m (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Sep 2020 03:26:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726142AbgIQH0U (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Sep 2020 03:26:20 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB7E1C06174A
        for <linux-tegra@vger.kernel.org>; Thu, 17 Sep 2020 00:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=GGGsLVujs/uHJ07NhvsVtGBnxX9a+r2uLCeXPx2mgvc=; b=ILiIQABHWh6z0TH/lsqyKjIXiH
        WAG2OJjXIfYuiNHFwpYZbehPJlQtYs2ITFs50ImmzWB5gxVDACtbEWqWbu+MEtgAEon/RYQR/ribf
        Weg0ipJpjJZTJJ48AOTV1BrI4dU0EI4d2AScqb5uQ/rLrS3gl5JhHhpmQ7HMB04wfm0kyNc0lQ64/
        6+shy4IIhQceJY1eMJOnPJNiQTen2ZkTKvD/muFvmx1DluBnXz8DHxZi8fn5vV+ELzA5gaBt4lQv9
        d+E+O3UZ9vzSDSiREWxz5F0qfIEjf/rXaQQqq0AIU5KOw1R9nXfa4pHzb/AUfeErPBrrPGjBH7MQ0
        FZpP895g==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1kIoIy-0002cj-Lf; Thu, 17 Sep 2020 10:26:08 +0300
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
 <0d12991e-3599-c5bf-11e5-78031f0f8088@kapsi.fi>
 <343e4518-e132-6ea8-6169-0685f000b89c@gmail.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <04e2ddf9-c1d9-0a43-fbf2-85bfcd3a5a6a@kapsi.fi>
Date:   Thu, 17 Sep 2020 10:25:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <343e4518-e132-6ea8-6169-0685f000b89c@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 9/17/20 12:37 AM, Dmitry Osipenko wrote:
> 16.09.2020 23:43, Mikko Perttunen пишет:
> ...
>>> Please note that the sync point state actually needs to be completely
>>> reset at the sync point request-time because both downstream fastboot
>>> and upstream u-boot [1] are needlessly enabling display VBLANK interrupt
>>> that continuously increments sync point #26 during of kernel boot until
>>> display controller is reset.
>>>
>>> [1]
>>> https://github.com/u-boot/u-boot/blob/master/drivers/video/tegra.c#L155
>>>
>>> Hence once sync point #26 is requested, it will have a dirty state. So
>>> far this doesn't have any visible effect because sync points aren't used
>>> much.
>>>
>>
>> Maybe we can instead reserve syncpoints that might be used by the boot
>> chain, and only allow allocating them once the display driver has acked
>> that the syncpoint will no longer be incremented? That way if the
>> display driver is disabled for some reason we'll still be fine.
> 
> sounds good
> 
>> Looking at the downstream driver, it (still, on new chips..) reserves
>> the following syncpoints:
>>
>> - 10 (AVP)
>> - 22 (3D)
>> - 26 (VBLANK0)
>> - 27 (VBLANK1)
>>
>> and says that this applies to T20, T30, T114 and T148.
>>
>> I suppose if you haven't observed this happening to other syncpoints
>> than 26, then reserving 26 would probably be enough.
> 
> I only saw SP 26 being used by the DC, but perhaps that may vary from
> device to device and SP 27 could actually be used in a wild as well.
> 
> I think the AVP SP should only relate to the AVP-firmware that upstream
> doesn't support, so we can ignore its reservation.
> 
> I've no idea what may use the 3D SP.
> 

My guess is that some very old code used fixed syncpoint numbers so 
these were added to the reservation list. Let's reserve 26 and 27, that 
should be simple enough since both would be "released" by the display 
driver.

Mikko
