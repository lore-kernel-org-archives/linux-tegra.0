Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 558DAC433E2
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 13:17:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0FDE4619C7
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 13:17:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231512AbhCWNQi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 23 Mar 2021 09:16:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231833AbhCWNPW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 23 Mar 2021 09:15:22 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B88AC061765
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 06:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=P1AR0aEJMOTymU3uKlNfOdMjKfFgjMC+LXDM8DY8BM4=; b=EnFMMKGhuS45AEfJ/VtkvIjlqW
        FrckcOAYKvsoct7HmSJ/TXg6AbVpF1WVfTZe4pg8blMiVy0h9fbGhfhDOhF1ccr50E70m5rVOymOc
        OqWPA9sBRhGi7VV+2DGb+Gb2dAU3iq7vUY+1aXS8W+ap4I03U67NKq2gLNB/B98rXxSP6ojiBgaE9
        cjxHEzbQsZcSVAPVxfrTkYwexLWlGJCBSl24WyYzpw/3lGv7u95UIer7fycE6OABTa0AjEkRTZywU
        Cfaf1vvR2lT0/0Ei1EUqLrQbmWzos0uok87q3wrccduCho22eRdNXubap0n0WbCVQoay0P5A18dpC
        aELSnwjA==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1lOgsP-0006th-FN; Tue, 23 Mar 2021 15:15:17 +0200
Subject: Re: [PATCH v5 18/21] drm/tegra: Allocate per-engine channel in core
 code
To:     Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>
Cc:     jonathanh@nvidia.com, digetx@gmail.com, airlied@linux.ie,
        daniel@ffwll.ch, linux-tegra@vger.kernel.org, talho@nvidia.com,
        bhuntsman@nvidia.com, dri-devel@lists.freedesktop.org
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-19-mperttunen@nvidia.com>
 <YFngka4Z5pbH/HNd@orome.fritz.box>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <e21a075f-4f09-122f-df4e-73b086f52446@kapsi.fi>
Date:   Tue, 23 Mar 2021 15:15:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YFngka4Z5pbH/HNd@orome.fritz.box>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 3/23/21 2:35 PM, Thierry Reding wrote:
> On Mon, Jan 11, 2021 at 03:00:16PM +0200, Mikko Perttunen wrote:
>> To avoid duplication, allocate the per-engine shared channel in the
>> core code instead. Once MLOCKs are implemented on Host1x side, we
>> can also update this to avoid allocating a shared channel when
>> MLOCKs are enabled.
>>
>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>> ---
>>   drivers/gpu/drm/tegra/drm.c | 11 +++++++++++
>>   drivers/gpu/drm/tegra/drm.h |  4 ++++
>>   2 files changed, 15 insertions(+)
> 
> It'd be helpful if the commit message explained what these per-engine
> shared channels are used for.

The per-engine shared channel is just the normal HW channel we are 
currently using across each userspace logical channel (per engine). In 
the future the plan is to use one HW channel for each logical channel 
opened by the userspace on Tegra186+, so this will be extended then.

I will rephrase to make it clearer.

> 
>>
>> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
>> index cd81b52a9e06..afd3f143c5e0 100644
>> --- a/drivers/gpu/drm/tegra/drm.c
>> +++ b/drivers/gpu/drm/tegra/drm.c
>> @@ -880,6 +880,14 @@ static const struct drm_driver tegra_drm_driver = {
>>   int tegra_drm_register_client(struct tegra_drm *tegra,
>>   			      struct tegra_drm_client *client)
>>   {
>> +	/*
>> +	 * When MLOCKs are implemented, change to allocate a shared channel
>> +	 * only when MLOCKs are disabled.
>> +	 */
>> +	client->shared_channel = host1x_channel_request(&client->base);
>> +	if (!client->shared_channel)
>> +		return -EBUSY;
>> +
>>   	mutex_lock(&tegra->clients_lock);
>>   	list_add_tail(&client->list, &tegra->clients);
>>   	client->drm = tegra;
>> @@ -896,6 +904,9 @@ int tegra_drm_unregister_client(struct tegra_drm *tegra,
>>   	client->drm = NULL;
>>   	mutex_unlock(&tegra->clients_lock);
>>   
>> +	if (client->shared_channel)
>> +		host1x_channel_put(client->shared_channel);
>> +
>>   	return 0;
>>   }
>>   
>> diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
>> index f38de08e0c95..0f38f159aa8e 100644
>> --- a/drivers/gpu/drm/tegra/drm.h
>> +++ b/drivers/gpu/drm/tegra/drm.h
>> @@ -87,8 +87,12 @@ struct tegra_drm_client {
>>   	struct list_head list;
>>   	struct tegra_drm *drm;
>>   
>> +	/* Set by driver */
>>   	unsigned int version;
>>   	const struct tegra_drm_client_ops *ops;
>> +
>> +	/* Set by TegraDRM core */
>> +	struct host1x_channel *shared_channel;
> 
> Perhaps reorder this so that the core-initialized fields are closer to
> the top and the client-initialized fields are closer to the bottom? That
> seems like a more natural order.

Will do.

> 
> Thierry
> 

Mikko
