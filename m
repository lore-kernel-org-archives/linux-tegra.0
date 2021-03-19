Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2946FC433E0
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Mar 2021 13:46:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DC40E64F04
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Mar 2021 13:46:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229903AbhCSNqW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 19 Mar 2021 09:46:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230081AbhCSNqA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 19 Mar 2021 09:46:00 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF303C06174A;
        Fri, 19 Mar 2021 06:45:59 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id f3so1736398lfu.5;
        Fri, 19 Mar 2021 06:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zm6BLtowGVk3+ISKouC1h9zvIkxos89pb8oEnL5NIS8=;
        b=d/nHmMhjTTMvsGTzLwH4k3vaY1L3wQH6aDBlMAsoOo40wtx7L3DTiTQ/eY7Y0rybbw
         QsiroprLBqmESHuM1Jv7zB8A6PswfeUGK0dbmGStvfK1HtPFQLv6SM6TCJXgDjXsrAk0
         gQVKBfDiH+oiELc/fF1ROH/D2uG0mPeA5WmrOGttGJJ+hkpDXfsTd2s/nnhl4lidzz4F
         cmPDQ2F8XJK1gZzyJPRGtzcJJYoUUefhN2/b38kiMvoVOvhXjX/yFhqFhipEC4lhVI09
         GN2IYAZVH+6m2pzsuc9RUpQFEU8dW+TGzK/twyqwJWQuWmMANe4u6G4ZV4/Knl2MMw9G
         gOKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zm6BLtowGVk3+ISKouC1h9zvIkxos89pb8oEnL5NIS8=;
        b=jaC9edaB6b1xtVqTkM8pT2/BVp7H5vO8sBDc/B9ma4OrrSJkIPeAcfy8QPm+aqCNRT
         RrMT/guxx5eRsDOfRgrOqHLdrsWxsfSnxzQ4dHbsSI7V/CTtuV9/WfiV43WJJdUX7XoS
         gHOtjOlUKuP/O5cIYQCg7h7bwkQOBrSY6fsLrw6TLgpWzHFyi1VzgTkY/lLT766SEYaZ
         b/4yoiKb5wnBGSzjVYVPgQ0e9J4mFbN0QvrGyAeA0j3gFzn8/eKkoFtRRx/mDuwfQ7Jr
         cwni9Jzqlwl7MmutV5cj6JPJ+YbKsHvlWhuEjvxDqn8L97fmlAR8aMPIFsLyI51ShbJd
         6c1g==
X-Gm-Message-State: AOAM5328vLJ4LK+IE/FpMuRWWw0bMJzwCTVQcv0ozHnsoKYUlS3HTfbG
        6pRW5M2zSsiCogrbMUnN3WrQQYVqGhw=
X-Google-Smtp-Source: ABdhPJz2cKbxJlDbrF6J4FeabfjuKDThfG1N2TnXEXdvR3+u57NbxcOc5w3UrRHNPQEHysr+vjWfNg==
X-Received: by 2002:ac2:5149:: with SMTP id q9mr843384lfd.619.1616161558226;
        Fri, 19 Mar 2021 06:45:58 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.googlemail.com with ESMTPSA id m22sm640702lfa.170.2021.03.19.06.45.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Mar 2021 06:45:57 -0700 (PDT)
Subject: Re: [PATCH v4] mm: cma: support sysfs
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Minchan Kim <minchan@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-mm <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>,
        joaodias@google.com, willy@infradead.org, david@redhat.com,
        surenb@google.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20210309062333.3216138-1-minchan@kernel.org>
 <fead70a2-4330-79ff-e79a-d8511eab1256@gmail.com>
 <e8ae901d-9521-8de4-ee45-18cb55b8f29c@gmail.com>
Message-ID: <8d7ae527-e0ff-6fa9-7ba3-899a75abc3fa@gmail.com>
Date:   Fri, 19 Mar 2021 16:45:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <e8ae901d-9521-8de4-ee45-18cb55b8f29c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

19.03.2021 16:39, Dmitry Osipenko пишет:
> 19.03.2021 15:44, Dmitry Osipenko пишет:
> ...
>>>  #include <linux/debugfs.h>
>>> +#include <linux/kobject.h>
>>> +
>>> +struct cma_stat {
>>> +	spinlock_t lock;
>>> +	/* the number of CMA page successful allocations */
>>> +	unsigned long nr_pages_succeeded;
>>> +	/* the number of CMA page allocation failures */
>>> +	unsigned long nr_pages_failed;
>>> +	struct kobject kobj;
>>> +};
>>>  
>>>  struct cma {
>>>  	unsigned long   base_pfn;
>>> @@ -16,6 +26,9 @@ struct cma {
>>>  	struct debugfs_u32_array dfs_bitmap;
>>>  #endif
>>>  	char name[CMA_MAX_NAME];
>>> +#ifdef CONFIG_CMA_SYSFS
>>> +	struct cma_stat	*stat;
>>> +#endif
> 
> What is the point of allocating stat dynamically?
> 
> ...
>>> +void cma_sysfs_alloc_pages_count(struct cma *cma, size_t count)
>>> +{
>>> +	spin_lock(&cma->stat->lock);
>>> +	cma->stat->nr_pages_succeeded += count;
>>> +	spin_unlock(&cma->stat->lock);
>>> +}
>>> +
>>> +void cma_sysfs_fail_pages_count(struct cma *cma, size_t count)
>>> +{
>>> +	spin_lock(&cma->stat->lock);
>>> +	cma->stat->nr_pages_failed += count;
>>> +	spin_unlock(&cma->stat->lock);
>>> +}
> 
> You could use atomic increment and then locking isn't needed.
> 

Actually, the counter should be u64 in order not to worry about overflow.
