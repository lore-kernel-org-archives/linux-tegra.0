Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0BF6C433DB
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Mar 2021 19:25:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 883D56197A
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Mar 2021 19:25:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230063AbhCSTYd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 19 Mar 2021 15:24:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230142AbhCSTYG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 19 Mar 2021 15:24:06 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BCA2C06174A;
        Fri, 19 Mar 2021 12:24:06 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id x28so11669383lfu.6;
        Fri, 19 Mar 2021 12:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vi3OhCV5xHRkQ6K9sU0vs2DTIjIbNhVBKwX3Itgewtw=;
        b=Y3anoUmzvmht5ZeuS0K6pBMLsHIyBTiT+FQokPOsvcNHziSdnJEQ8yslfdisJ5QOsa
         vXMDxQliBqYnos7M/g2MR9lXqjifBxNXgBdDr/irEv/ELG9pGPn0QuMbCATBToqI2iSj
         5R0GdQfAr6f/2/47cD+v2zcedeKJA3tdhD+OyZQSCeq+Li6RyP/aljJGff2T0H9a1kNP
         y9f9BbBxCyR4JTz1ikuQ0zzOpICj6Q2vMRMmPdOUdVa31yjL7ybMAMkmP3O8+eAyNo/E
         BWAKNQcJqiI3n6Bhu8um3h/HiqARF9SKKJvlaf+44jk7ZT7BG115og8ZOrjkhRp5Y5Y0
         0pmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vi3OhCV5xHRkQ6K9sU0vs2DTIjIbNhVBKwX3Itgewtw=;
        b=Rw/pla4G6vhYaSYFgRxz2Q75uJfjQ5pUItUjkTye1ETgbzZviuOuf7DkdJ0bypDBjT
         938sJsobO16wTO1XzPvdZEavsHOXlcn3AlIv6DnmlJRakuBWVpWxvJ0sm1RWspmiBKIM
         DP24ewF8w8UhQhLhGFu+9nVmzg7cCsUIyQMEA5LxWG5ekMJZC2ekKlAtopbJyVydl9Ct
         F/yhZ61czxPmdfMjU0rF/Bwv5Zk615B8jy0VWtCkaODO26ofbykYc9hBWqGEWU3w83Do
         Vo3k6TudY6zS04CgdbHq6zU21oMh1QXFxGhEWubPiSB06HMUrmc4EwsQo18/a5M73Aok
         WKTw==
X-Gm-Message-State: AOAM53248En4fZy0KigeX9Zz3St2uCp4lp4vrePj+juI9vOcdfUF0Mjy
        IT/j2sORi3/3cyofHVoiSBLBwNxL18Y=
X-Google-Smtp-Source: ABdhPJwoyZSYjPu1c0Oe6ptKGdXXh2aNrlgJjHcwn6gXUsZP2xz3qT6czKotdtD5qUipYg6HbRl99w==
X-Received: by 2002:a19:40c7:: with SMTP id n190mr1689219lfa.378.1616181844579;
        Fri, 19 Mar 2021 12:24:04 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.googlemail.com with ESMTPSA id m24sm717293lfq.184.2021.03.19.12.24.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Mar 2021 12:24:04 -0700 (PDT)
Subject: Re: [PATCH v4] mm: cma: support sysfs
To:     Minchan Kim <minchan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-mm <linux-mm@kvack.org>,
        LKML <linux-kernel@vger.kernel.org>, joaodias@google.com,
        willy@infradead.org, david@redhat.com, surenb@google.com,
        John Hubbard <jhubbard@nvidia.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <33ec18ef-8652-643a-1a53-ff7c3caf4399@gmail.com>
 <c61e58ca-6495-fd47-0138-5bbfe0b3dd20@gmail.com> <YFS06OLp70nWWLFi@kroah.com>
 <78883205-e6da-5bc4-dcec-b6eb921567b1@gmail.com> <YFTITw73Wga0/F0V@kroah.com>
 <72db59eb-75dc-d1ed-7a83-17052e8f22a8@gmail.com>
 <YFTRkBEr5T37NFpV@google.com>
 <071c6681-f492-2c94-5686-30c30778f39d@gmail.com>
 <YFTrpN8Qkv6ZY0Ci@google.com>
 <007c0317-8819-a6b8-fdff-c0b5899c4f51@gmail.com>
 <YFT1klxSFMlIXLHb@google.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d2e24e65-9c9d-6b18-81bf-bc1c46c6e0f3@gmail.com>
Date:   Fri, 19 Mar 2021 22:24:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YFT1klxSFMlIXLHb@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

19.03.2021 22:03, Minchan Kim пишет:
> On Fri, Mar 19, 2021 at 09:48:11PM +0300, Dmitry Osipenko wrote:
>> 19.03.2021 21:21, Minchan Kim пишет:
>>> On Fri, Mar 19, 2021 at 08:56:06PM +0300, Dmitry Osipenko wrote:
>>>> 19.03.2021 19:30, Minchan Kim пишет:
>>>>> +static void cma_kobj_release(struct kobject *kobj)
>>>>> +{
>>>>> +	struct cma_kobject *cma_kobj = container_of(kobj, struct cma_kobject, kobj);
>>>>> +
>>>>> +	kfree(cma_kobj);
>>>>> +}
>>>>
>>>> Oh, wait.. I think this kfree wrong since cma_kobj belongs to the array.
>>>
>>> Oh, good spot. Let me use kzalloc.
>>>
>>
>> Thinking a bit more about this.. it looks like actually it should be
>> better to get back to the older variant of cma_stat, but allocate at the
>> time of CMA initialization, rather than at the time of sysfs
>> initialization. Then the cma_stat will be decoupled from the cma struct
> 
> IIRC, the problem was slab was not initiaized at CMA init point.
> That's why I liked your suggestion.

Alright, if CMA init time is a problem, then the recent variant should
be okay.

>> and cma_stat will be a self-contained object.
> 
> Yeah, self-contained is better but it's already weird to
> have differnt lifetime for one object since CMA object
> never die, technically.
> 

Indeed.

I found the Greg's original argument and not sure that it's really
worthwhile to worry about the copycats since this is not a driver's code..

Maybe we could just add a clarifying comment for the kobj, telling why
it's okay for CMA. Greg, doesn't it sound like a good compromise to you?
