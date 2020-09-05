Return-Path: <SRS0=vF+y=CO=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EA25C43461
	for <linux-tegra@archiver.kernel.org>; Sat,  5 Sep 2020 14:53:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2FA3F208B3
	for <linux-tegra@archiver.kernel.org>; Sat,  5 Sep 2020 14:53:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b="wh9/IPOv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727875AbgIEOxi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 5 Sep 2020 10:53:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726302AbgIEOxg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 5 Sep 2020 10:53:36 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AAAFC061244
        for <linux-tegra@vger.kernel.org>; Sat,  5 Sep 2020 07:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ENrwMfE6hjkJ/TvU+7K3kw0oNF7tj75Cqe1y+1wG0tU=; b=wh9/IPOvFILcCg/8lAAA1FDxHn
        IVpdCbPBlePn0U9xmliDkWwKgpV4aBhCSPjV+cwmNqDaOPnf1Kfo0SHVAW+dDsPcKuoWV+Cm2o3kS
        ou2x54IonOyDlX16twutL8yBG3CJePIYNYv6qYeaG1RbBNf8a5GY4yBj1Noz0PemqpttAyUqy+3t6
        xGOaVD4ASSMDJvGc866jw0m4zekVwqx27eH73F+fpM7OGfQpFdUglGmTt8wdIDQ1u0AA00HSPt8+3
        R3LAUEmDLigi4eAIy0Y7fES9Mfe8hROykaWHJe+gkoaKNcO3WijiaWQOjfAVnfs+298PBtGusRJXb
        IwTSf6LQ==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1kEZZF-0007XQ-Qq; Sat, 05 Sep 2020 17:53:25 +0300
Subject: Re: [RFC PATCH v2 06/17] gpu: host1x: Cleanup and refcounting for
 syncpoints
To:     Dmitry Osipenko <digetx@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-7-mperttunen@nvidia.com>
 <913a625c-9630-92af-aba0-fdddf6bbdb29@gmail.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <e9cce9d5-1a63-077e-1ca6-ac5d5112d5fe@kapsi.fi>
Date:   Sat, 5 Sep 2020 17:53:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <913a625c-9630-92af-aba0-fdddf6bbdb29@gmail.com>
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

On 9/5/20 5:30 PM, Dmitry Osipenko wrote:
> 05.09.2020 13:34, Mikko Perttunen пишет:
> ...
>> +
>> +/**
>> + * host1x_syncpt_put() - free a requested syncpoint
>> + * @sp: host1x syncpoint
>> + *
>> + * Release a syncpoint previously allocated using host1x_syncpt_request(). A
>> + * host1x client driver should call this when the syncpoint is no longer in
>> + * use.
>> + */
>> +void host1x_syncpt_put(struct host1x_syncpt *sp)
>> +{
>> +	if (!sp)
>> +		return;
>> +
>> +	kref_put(&sp->ref, syncpt_release);
>> +}
>> +EXPORT_SYMBOL(host1x_syncpt_put);
>>   
>>   void host1x_syncpt_deinit(struct host1x *host)
>>   {
>> @@ -471,16 +478,48 @@ unsigned int host1x_syncpt_nb_mlocks(struct host1x *host)
>>   }
>>   
>>   /**
>> - * host1x_syncpt_get() - obtain a syncpoint by ID
>> + * host1x_syncpt_get_by_id() - obtain a syncpoint by ID
>> + * @host: host1x controller
>> + * @id: syncpoint ID
>> + */
>> +struct host1x_syncpt *host1x_syncpt_get_by_id(struct host1x *host,
>> +					      unsigned int id)
>> +{
>> +	if (id >= host->info->nb_pts)
>> +		return NULL;
>> +
>> +	if (kref_get_unless_zero(&host->syncpt[id].ref))
>> +		return &host->syncpt[id];
>> +	else
>> +		return NULL;
>> +}
>> +EXPORT_SYMBOL(host1x_syncpt_get_by_id);
>> +
>> +/**
>> + * host1x_syncpt_get_by_id_noref() - obtain a syncpoint by ID but don't
>> + * 	increase the refcount.
>>    * @host: host1x controller
>>    * @id: syncpoint ID
>>    */
>> -struct host1x_syncpt *host1x_syncpt_get(struct host1x *host, unsigned int id)
>> +struct host1x_syncpt *host1x_syncpt_get_by_id_noref(struct host1x *host,
>> +						    unsigned int id)
>>   {
>>   	if (id >= host->info->nb_pts)
>>   		return NULL;
>>   
>> -	return host->syncpt + id;
>> +	return &host->syncpt[id];
>> +}
>> +EXPORT_SYMBOL(host1x_syncpt_get_by_id_noref);
>> +
>> +/**
>> + * host1x_syncpt_get() - increment syncpoint refcount
>> + * @sp: syncpoint
>> + */
>> +struct host1x_syncpt *host1x_syncpt_get(struct host1x_syncpt *sp)
>> +{
>> +	kref_get(&sp->ref);
>> +
>> +	return sp;
>>   }
>>   EXPORT_SYMBOL(host1x_syncpt_get);
> 
> Hello, Mikko!
> 
> What do you think about to open-code all the host1x structs by moving
> them all out into the public linux/host1x.h? Then we could inline all
> these trivial single-line functions by having them defined in the public
> header. This will avoid all the unnecessary overhead by allowing
> compiler to optimize the code nicely.
> 
> Of course this could be a separate change and it could be done sometime
> later, I just wanted to share this quick thought for the start of the
> review.
> 

Hi :)

I think for such micro-optimizations we should have a benchmark to 
evaluate against. I'm not sure we have all that many function calls into 
here overall that it would make a noticeable difference. In any case, as 
you said, I'd prefer to keep further refactoring to a separate series to 
avoid growing this series too much.

Mikko
