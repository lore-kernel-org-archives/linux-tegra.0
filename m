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
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC18AC433E0
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Mar 2021 13:40:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B4E9764F04
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Mar 2021 13:40:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbhCSNjt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 19 Mar 2021 09:39:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229736AbhCSNjo (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 19 Mar 2021 09:39:44 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EB52C06174A;
        Fri, 19 Mar 2021 06:39:44 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id q29so9968518lfb.4;
        Fri, 19 Mar 2021 06:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fyvAl1ud31RwhXT5skBunJKZtf9rGtmbohQtkuhaBSk=;
        b=FNzLDRJF5VVqujMp6CjY9HXNBHu0oM96hG2vqMHk4LjXWYoy9gq2VMV60K0S/u24dQ
         oOMN0u/GgBP3DjIT/Gxe6A1f3VcfmYkTcEE31YjwCzy/7uZV197fqAlwMY8sB473bkki
         0iMkfzI6kArfHIJk3JckcSG5cG3sYRPSAJw2M+r6FU5McBNCdvWmeDsdfrPZYIyRjawD
         fIKjiSRUGxUlrxkVoGfoq2afnC5bnIkSRlNf0oD2qWoAT9n89gPa4vR4TdZNVsYWIejJ
         XZVDDCu0HBTMSB6tPEFCojFMppPix/9RR1seUQQTfL9LoBuH3QH5royapmSAAWhcppxa
         EwOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fyvAl1ud31RwhXT5skBunJKZtf9rGtmbohQtkuhaBSk=;
        b=fezhaCVB9pm1/JlIeIm7xcFZm4h/uk1WXhlrkCV2rhAFDPI/OhmejPWP0a1nF/hkwI
         lgi6AGq+mG+GUzW5pEFae8gvJTeTqsJ8rOFFI2lERx5eM8ObhBV7j88Ck03mDTrtk/6f
         QOWabbp80IKauXiaFxmIoB3isIG5cwezM+eA0kkVCIHY5eg+zrtsug5euh3SlDxjpKVc
         aKmye6wZUeq+Muq3pGH+9GsBq+dQTFOCttugpIdsx2caG5Ww+iCS3yl6BigT+AL3Vkob
         HH845bFryK3APbQfgk32RWG9Hggvfo7mCLmFcTKPq3MEkB8eK7Y+tazklolBFZjn2HHt
         aR8A==
X-Gm-Message-State: AOAM531jyWnW07TCF9yy76dsTXcyFijCzlEQVdGBLLnPG7QbCPZXo4N+
        f/L45pCCoKX+z0j7RX3O19qfml/EPTo=
X-Google-Smtp-Source: ABdhPJw5r8e8Ba4MBNEaR25BIUuum9HlCO5bvR7piOmAQCu+7ZIgvB+NuZZ8beSknWBvUVmPxfqthw==
X-Received: by 2002:a19:7504:: with SMTP id y4mr858841lfe.616.1616161182717;
        Fri, 19 Mar 2021 06:39:42 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.googlemail.com with ESMTPSA id d4sm638197lfq.270.2021.03.19.06.39.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Mar 2021 06:39:42 -0700 (PDT)
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
Message-ID: <e8ae901d-9521-8de4-ee45-18cb55b8f29c@gmail.com>
Date:   Fri, 19 Mar 2021 16:39:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <fead70a2-4330-79ff-e79a-d8511eab1256@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

19.03.2021 15:44, Dmitry Osipenko пишет:
...
>>  #include <linux/debugfs.h>
>> +#include <linux/kobject.h>
>> +
>> +struct cma_stat {
>> +	spinlock_t lock;
>> +	/* the number of CMA page successful allocations */
>> +	unsigned long nr_pages_succeeded;
>> +	/* the number of CMA page allocation failures */
>> +	unsigned long nr_pages_failed;
>> +	struct kobject kobj;
>> +};
>>  
>>  struct cma {
>>  	unsigned long   base_pfn;
>> @@ -16,6 +26,9 @@ struct cma {
>>  	struct debugfs_u32_array dfs_bitmap;
>>  #endif
>>  	char name[CMA_MAX_NAME];
>> +#ifdef CONFIG_CMA_SYSFS
>> +	struct cma_stat	*stat;
>> +#endif

What is the point of allocating stat dynamically?

...
>> +void cma_sysfs_alloc_pages_count(struct cma *cma, size_t count)
>> +{
>> +	spin_lock(&cma->stat->lock);
>> +	cma->stat->nr_pages_succeeded += count;
>> +	spin_unlock(&cma->stat->lock);
>> +}
>> +
>> +void cma_sysfs_fail_pages_count(struct cma *cma, size_t count)
>> +{
>> +	spin_lock(&cma->stat->lock);
>> +	cma->stat->nr_pages_failed += count;
>> +	spin_unlock(&cma->stat->lock);
>> +}

You could use atomic increment and then locking isn't needed.
