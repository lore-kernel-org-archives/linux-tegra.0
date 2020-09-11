Return-Path: <SRS0=EsoP=CU=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 703A0C43461
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Sep 2020 09:07:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 102872075E
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Sep 2020 09:07:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b="HXFC7QNP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725770AbgIKJHj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 11 Sep 2020 05:07:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbgIKJHi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 11 Sep 2020 05:07:38 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7F43C061573
        for <linux-tegra@vger.kernel.org>; Fri, 11 Sep 2020 02:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=14W5Ud7nOZEUj6jje/j81qaDf7zDwsYZWUKd48Ow0A4=; b=HXFC7QNPFIUxw0fkHnEql3q3O8
        YwIQ4XtwSwDSkicGFFYH2Vk3+uD7ZzuZJWAA8uE8Rax9HqkbkkMw8sJ4L0B+jMyQtSZb4zepSyahP
        ZtzSOqLGNvWRZ/Bab1f497zQul1YZnc3NoqPyLjCGtrhIG+lkuLMZIexqzSIMj55HMWvcSBmim/nr
        jEgae7zWDbHIw+ogVZnwjMgCkUap/cuJa+VqqGTU5I3lP6RfowZ2Lv8r/DePaK2HAS233Z5e/5nSC
        dHNXnlCLcWz/RUhx8BaYClnxwZace5A4DKXAYJOpw7eNiofeGkOKQhWGl8J84pgmdWe+KMKhPDBtG
        +Gu+aBmA==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1kGf1j-00049b-Qt; Fri, 11 Sep 2020 12:07:27 +0300
Subject: Re: [RFC PATCH v2 09/17] gpu: host1x: DMA fences and userspace fence
 creation
To:     Dmitry Osipenko <digetx@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-10-mperttunen@nvidia.com>
 <ceaa95f3-51a1-3fc6-2466-053e21506d6d@gmail.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <a820c4dc-c433-559a-bf1f-1cdc0e27949a@kapsi.fi>
Date:   Fri, 11 Sep 2020 12:07:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <ceaa95f3-51a1-3fc6-2466-053e21506d6d@gmail.com>
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

On 9/11/20 1:00 AM, Dmitry Osipenko wrote:
> 05.09.2020 13:34, Mikko Perttunen пишет:
> ...
>>   
>> +static void action_signal_fence(struct host1x_waitlist *waiter)
>> +{
>> +	struct host1x_syncpt_fence *f = waiter->data;
>> +
>> +	host1x_fence_signal(f);
>> +}
>> +
>>   typedef void (*action_handler)(struct host1x_waitlist *waiter);
>>   
>>   static const action_handler action_handlers[HOST1X_INTR_ACTION_COUNT] = {
>>   	action_submit_complete,
>>   	action_wakeup,
>>   	action_wakeup_interruptible,
>> +	action_signal_fence,
>>   };
> 
> My expectation is that we should remove the host1x-waiter entirely. It
> comes from 2011/2012 era of the host1x driver and now duplicates
> functionality provided by the dma-fence and drm-scheduler. Perhaps it
> could be okay to re-use existing code for the starter, but this is
> something to keep in mind that it may be better not to put much effort
> into the older code.
> 

Agreed, it should be cleaned up and probably replaced. I made only 
minimal changes here to get all my tests working, as I didn't want to do 
a full refactoring in this patch series.

Mikko
