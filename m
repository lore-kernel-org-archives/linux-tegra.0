Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2CD6C433E3
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 10:33:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5EB9E619B7
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 10:33:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230299AbhCWKch (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 23 Mar 2021 06:32:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230229AbhCWKcb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 23 Mar 2021 06:32:31 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56A40C061574
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 03:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=WYaw3Sv9n7TN7qyiKmWfwPGpOrT/VvHjJe5yaBu+c3M=; b=fqsfd40PIthz2CYotnKxBsfe69
        6uKbzbl/+LleFsBxkLFxcaGB31mOsEWqOvRtK4ii6XC0GiR8OdJfugWdYz/h+o51FV11GJMg1nhAC
        blqYxDVyZZmCpmWNswtF1bHesc/EtGZaGhXNDCHXg8HyfIzYv84IKvVp5lUTNJmHWSOnO5bx0S5n/
        o84QYLqjrfVOqXgfyu63JkvGLdEspu/Nx7K2nq3jOaYqfedQwsnfMcY9TlteGOJyQWUCUQMefHNoR
        XJDoj6YKXP9Rfh8mA9PnuWhlCUiFMpDWUCFANwzkxwWCLlVmPIcD5fKCYid6tXMIfh3QPsQCWudBt
        45pt5Jug==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1lOeKp-00043m-25; Tue, 23 Mar 2021 12:32:27 +0200
Subject: Re: [PATCH v5 02/21] gpu: host1x: Allow syncpoints without associated
 client
To:     Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>
Cc:     jonathanh@nvidia.com, digetx@gmail.com, airlied@linux.ie,
        daniel@ffwll.ch, linux-tegra@vger.kernel.org,
        dri-devel@lists.freedesktop.org, talho@nvidia.com,
        bhuntsman@nvidia.com
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-3-mperttunen@nvidia.com>
 <YFm+sn7iIRuw0kli@orome.fritz.box>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <729edbe1-e05e-1233-731f-424eea25a842@kapsi.fi>
Date:   Tue, 23 Mar 2021 12:32:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YFm+sn7iIRuw0kli@orome.fritz.box>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 3/23/21 12:10 PM, Thierry Reding wrote:
> On Mon, Jan 11, 2021 at 03:00:00PM +0200, Mikko Perttunen wrote:
>> Syncpoints don't need to be associated with any client,
>> so remove the property, and expose host1x_syncpt_alloc.
>> This will allow allocating syncpoints without prior knowledge
>> of the engine that it will be used with.
>>
>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>> ---
>> v3:
>> * Clean up host1x_syncpt_alloc signature to allow specifying
>>    a name for the syncpoint.
>> * Export the function.
>> ---
>>   drivers/gpu/host1x/syncpt.c | 22 ++++++++++------------
>>   drivers/gpu/host1x/syncpt.h |  1 -
>>   include/linux/host1x.h      |  3 +++
>>   3 files changed, 13 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/host1x/syncpt.c b/drivers/gpu/host1x/syncpt.c
>> index fce7892d5137..5982fdf64e1c 100644
>> --- a/drivers/gpu/host1x/syncpt.c
>> +++ b/drivers/gpu/host1x/syncpt.c
>> @@ -42,13 +42,13 @@ static void host1x_syncpt_base_free(struct host1x_syncpt_base *base)
>>   		base->requested = false;
>>   }
>>   
>> -static struct host1x_syncpt *host1x_syncpt_alloc(struct host1x *host,
>> -						 struct host1x_client *client,
>> -						 unsigned long flags)
>> +struct host1x_syncpt *host1x_syncpt_alloc(struct host1x *host,
>> +					  unsigned long flags,
>> +					  const char *name)
> 
> If we expose it publicly, it's a good idea to add kerneldoc.

Will fix.

> 
>>   {
>>   	struct host1x_syncpt *sp = host->syncpt;
>> +	char *full_name;
>>   	unsigned int i;
>> -	char *name;
>>   
>>   	mutex_lock(&host->syncpt_mutex);
>>   
>> @@ -64,13 +64,11 @@ static struct host1x_syncpt *host1x_syncpt_alloc(struct host1x *host,
>>   			goto unlock;
>>   	}
>>   
>> -	name = kasprintf(GFP_KERNEL, "%02u-%s", sp->id,
>> -			 client ? dev_name(client->dev) : NULL);
>> -	if (!name)
>> +	full_name = kasprintf(GFP_KERNEL, "%u-%s", sp->id, name);
>> +	if (!full_name)
> 
> I know this just keeps with the status quo, but I wonder if we should
> change this to be just "%u" if name == NULL to avoid a weird-looking
> name. Or perhaps we want to enforce name != NULL by failing if that's
> not the case?

I'll see about making the name mandatory.

> 
> Thierry
> 

Mikko
