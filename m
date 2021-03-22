Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79B67C433E0
	for <linux-tegra@archiver.kernel.org>; Mon, 22 Mar 2021 14:49:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 314456192B
	for <linux-tegra@archiver.kernel.org>; Mon, 22 Mar 2021 14:49:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230312AbhCVOtT (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 22 Mar 2021 10:49:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229984AbhCVOst (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 22 Mar 2021 10:48:49 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3A87C061574
        for <linux-tegra@vger.kernel.org>; Mon, 22 Mar 2021 07:48:48 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id n138so21710994lfa.3
        for <linux-tegra@vger.kernel.org>; Mon, 22 Mar 2021 07:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/fZAw+4NiDFcgCHrlrGbQDPrYTTv6kbwUEtQSv61zqs=;
        b=uWXu5sM6j9p6UAdXDmXHXNods3NAIXQo6QRBvok8FlIH2o0IlS5LnfqMrHqe7Q2BmI
         fAIBh1+Na57dou/HqlvXReLw19EPtpVqzNPBfSdT8+Gu/dc1FgUMkMlTiQhTH9h3PRCm
         ptbTZ9kf/ocg3YA2aLgmQiu60FBdaeDoIBB+naU/WNrcLxv3c7Y8FOAc17MsYq4yrLmM
         D3fApXpJkI1MaHaosCT9+/1nx6ySJZ6n8l6FWnWjoxC/o96vUP8qk0IhqZ9glMzXlYo6
         OtiRr4DGpUq2wGeVO8r7mEoIBO5JENPaqZ30ujvMd+DqouZV9+iYH6gTbH7DUpFgoP3g
         a9sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/fZAw+4NiDFcgCHrlrGbQDPrYTTv6kbwUEtQSv61zqs=;
        b=teEhAM9eTgZh7XEr+BmXVIdnFdnhuhUDYz5jVq5cDzGSXG/LTgQTDmZonvqTJcEDPj
         V5TQcpZ+NVrFjThTs884sdxd02USv6kBYPm3lZjbgHjDfI0kkKM+Bt2T2Epldw2idvd9
         sGcsVqByGKDl3lO0iu1/sKvUk8rZa03GxeIMdBlZ6SnWYvilXZ0mrhHahSgxJA51O254
         Mu/YSS0fQNTH6xSwrnu58OrXylIZE1I2dzpMrCssAtiHJnyaTp9QPaNd2hYIUtqY3MYd
         j+KOlj69zfeOysVvZU/GSrRiIBbEa2Ulr8TUNt7YKncwqfaHJiXeHHoKcgCj/oWWjTWN
         p1xA==
X-Gm-Message-State: AOAM533yscnfbTwy4KMnjGbGoyABVb59/4Fc/Yt0WtawdBIIdmLcrgt5
        eYCyrsiDNXz4f2nKxVIZFkg=
X-Google-Smtp-Source: ABdhPJysSCaiPo03sO9bykrRBdDLruy+482nEDsgN0vR2QWZdV2ZWoP7ivyB6E2B88FT/fhsUx1Jaw==
X-Received: by 2002:ac2:4e82:: with SMTP id o2mr9206984lfr.489.1616424527005;
        Mon, 22 Mar 2021 07:48:47 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-47.dynamic.spd-mgts.ru. [109.252.193.47])
        by smtp.googlemail.com with ESMTPSA id x7sm1955517ljc.118.2021.03.22.07.48.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Mar 2021 07:48:46 -0700 (PDT)
Subject: Re: [PATCH v5 01/21] gpu: host1x: Use different lock classes for each
 client
To:     Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>
Cc:     jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch,
        linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-2-mperttunen@nvidia.com>
 <YFitsk3I2l7IBnLR@orome.fritz.box>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <6615105f-ccf1-7833-512c-090817c47952@gmail.com>
Date:   Mon, 22 Mar 2021 17:48:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YFitsk3I2l7IBnLR@orome.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

22.03.2021 17:46, Thierry Reding пишет:
> On Mon, Jan 11, 2021 at 02:59:59PM +0200, Mikko Perttunen wrote:
>> To avoid false lockdep warnings, give each client lock a different
>> lock class, passed from the initialization site by macro.
>>
>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>> ---
>>  drivers/gpu/host1x/bus.c | 7 ++++---
>>  include/linux/host1x.h   | 9 ++++++++-
>>  2 files changed, 12 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
>> index 347fb962b6c9..8fc79e9cb652 100644
>> --- a/drivers/gpu/host1x/bus.c
>> +++ b/drivers/gpu/host1x/bus.c
>> @@ -715,13 +715,14 @@ EXPORT_SYMBOL(host1x_driver_unregister);
>>   * device and call host1x_device_init(), which will in turn call each client's
>>   * &host1x_client_ops.init implementation.
>>   */
>> -int host1x_client_register(struct host1x_client *client)
>> +int __host1x_client_register(struct host1x_client *client,
>> +			   struct lock_class_key *key)
> 
> I've seen the kbuild robot warn about this because the kerneldoc is now
> out of date.
> 
>>  {
>>  	struct host1x *host1x;
>>  	int err;
>>  
>>  	INIT_LIST_HEAD(&client->list);
>> -	mutex_init(&client->lock);
>> +	__mutex_init(&client->lock, "host1x client lock", key);
> 
> Should we maybe attempt to make this unique? Could we use something like
> dev_name(client->dev) for this?

I'm curious who the lockdep warning could be triggered at all, I don't
recall ever seeing it. Mikko, could you please clarify how to reproduce
the warning?
