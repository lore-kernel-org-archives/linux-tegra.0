Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38C7CC433E0
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Mar 2021 13:52:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E84D764EE1
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Mar 2021 13:52:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbhCSNvm (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 19 Mar 2021 09:51:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230025AbhCSNvc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 19 Mar 2021 09:51:32 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5A12C06174A;
        Fri, 19 Mar 2021 06:51:31 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 184so12046733ljf.9;
        Fri, 19 Mar 2021 06:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=oLPdjYIPAAH3VAO0voDj/31NSP3unxZEaytASrJzvmI=;
        b=GUxde1HFjIYz/CKP1DpIs5j+5n1EHGFyYGW/pM6B8wVy3gtttUB9zitCNrFp0fn4x8
         QV7jJqXrzTsPqtuaujCoypPE2PP2rBG2lJICB8kM2bwggPnFec2NZKOW8uIY3IGAIHeN
         Y1YkI09MItoPc5ieQ88QOIEINTuz0SN7SdrcZpbl2IXvyMQqHACthCprNHHJm8N8oYzD
         mwuU+Wr2XDXjgwfS/t2+w/IAGqZ71bbA4/bgXbukBP4Ep7vTRXgzi6dCB5ntpBZTuH/T
         17riSZgw+CwFRF18uwEJXBqOYHwnvtB+UqRM+zMQa+p3BNvtrye5PSV1sUEe+6Kyc/LC
         sL6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oLPdjYIPAAH3VAO0voDj/31NSP3unxZEaytASrJzvmI=;
        b=IiChN+XonsoDIQRVROEfvtqbkD0fEYdbyxuNcvRVWMWDCG89N9c7ZWaf9gRfpKRD49
         L37SwjLoVRIWbRwl/6RULCJlZqrcMzjYQZfnkoCY7wDpAkpBsA1GC1qWPs3ZvUQI0XIk
         6SJ/Tf6stjQt2yj3uuf2vgMdT0RtKtg6ZV5dkY/vKV2f96xWDij/FIpgT8VOFD9CF7yS
         vmzgvh8wvXGSYCnxgQy4LF2ykLmGudjSU5s/Jp28kjk7YIjT+iRX5ybgOiLeGYL23hJX
         R7xVe0QGACLfl8HiaxgFBd1YZ81iigVhV1Fub40ZUKQi35/5wq/iO6dcjV7ynE6ksKCe
         46tw==
X-Gm-Message-State: AOAM532vJEzwIKoFqeHHyYNPZnGqAMj5skYQo8M2MqhHITdF29ulPevh
        hqvACmJtu+I2Pi10iWgUhYqWHWmmea4=
X-Google-Smtp-Source: ABdhPJzKM4AnZRZRCL0dQF7IX3NYzdhDVFTcfSJCiIekkzRhxQWUUihQ5OSYLd8vj8AXVScP7mFvsw==
X-Received: by 2002:a2e:b4a5:: with SMTP id q5mr1023485ljm.7.1616161890344;
        Fri, 19 Mar 2021 06:51:30 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.googlemail.com with ESMTPSA id x29sm642880lfn.60.2021.03.19.06.51.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Mar 2021 06:51:30 -0700 (PDT)
Subject: Re: [PATCH v4] mm: cma: support sysfs
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Minchan Kim <minchan@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-mm <linux-mm@kvack.org>,
        LKML <linux-kernel@vger.kernel.org>, joaodias@google.com,
        willy@infradead.org, david@redhat.com, surenb@google.com,
        John Hubbard <jhubbard@nvidia.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20210309062333.3216138-1-minchan@kernel.org>
 <fead70a2-4330-79ff-e79a-d8511eab1256@gmail.com>
 <e8ae901d-9521-8de4-ee45-18cb55b8f29c@gmail.com> <YFSqYUfaxMajR/aq@kroah.com>
 <b3cfe38f-bfd0-043a-6063-f5178d4a9b09@gmail.com> <YFSrgfAyp+dYWi7k@kroah.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <33ec18ef-8652-643a-1a53-ff7c3caf4399@gmail.com>
Date:   Fri, 19 Mar 2021 16:51:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YFSrgfAyp+dYWi7k@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

19.03.2021 16:47, Greg Kroah-Hartman пишет:
> On Fri, Mar 19, 2021 at 04:45:21PM +0300, Dmitry Osipenko wrote:
>> 19.03.2021 16:42, Greg Kroah-Hartman пишет:
>>> On Fri, Mar 19, 2021 at 04:39:41PM +0300, Dmitry Osipenko wrote:
>>>> 19.03.2021 15:44, Dmitry Osipenko пишет:
>>>> ...
>>>>>>  #include <linux/debugfs.h>
>>>>>> +#include <linux/kobject.h>
>>>>>> +
>>>>>> +struct cma_stat {
>>>>>> +	spinlock_t lock;
>>>>>> +	/* the number of CMA page successful allocations */
>>>>>> +	unsigned long nr_pages_succeeded;
>>>>>> +	/* the number of CMA page allocation failures */
>>>>>> +	unsigned long nr_pages_failed;
>>>>>> +	struct kobject kobj;
>>>>>> +};
>>>>>>  
>>>>>>  struct cma {
>>>>>>  	unsigned long   base_pfn;
>>>>>> @@ -16,6 +26,9 @@ struct cma {
>>>>>>  	struct debugfs_u32_array dfs_bitmap;
>>>>>>  #endif
>>>>>>  	char name[CMA_MAX_NAME];
>>>>>> +#ifdef CONFIG_CMA_SYSFS
>>>>>> +	struct cma_stat	*stat;
>>>>>> +#endif
>>>>
>>>> What is the point of allocating stat dynamically?
>>>
>>> Because static kobjects make me cry.
>>>
>>
>> I meant that it's already a part of struct cma, it looks like the stat
>> could be embedded into struct cma and then kobj could be initialized
>> separately.
> 
> But that structure is statically allocated, so it can not be.  This has
> been discussed in the past threads for when this was reviewed if you are
> curious :)

Indeed, I missed that cma_areas[] is static, thank you.
