Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96EB5C433C1
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Mar 2021 17:30:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 64E0C6197C
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Mar 2021 17:30:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230194AbhCSR3t (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 19 Mar 2021 13:29:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230041AbhCSR3d (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 19 Mar 2021 13:29:33 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0903C06174A;
        Fri, 19 Mar 2021 10:29:32 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id a198so11182027lfd.7;
        Fri, 19 Mar 2021 10:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cy2Irpbz4qk+WltFDzDSfC5epYt0eCHfQLX7UE6kz04=;
        b=NNulOJuXVv210l+pFrGFDWhcN41WBxbks8BJDH58Xh89LnvQaRW48zLynfeFW/rm95
         kpPQIyGpjGhm8YSzqXoLyrae5WTLDYIeiHpMgPbCr2UGoJdkoC6v/AsCgfbrzzr9Q9Mg
         0XFOFwhE3DGErrBvKEYTEpZbJkJoSUhaCllP70yBFL84Xy0kmPKwrgXKUFGtYY4Rp7vh
         wbt8brJamxN1cwJgjon5GIzWPfErMv6OYIF+3LiIhcMfLKpVEGcA9DC7no+UdQv0tOg1
         wPTxSSUcCNttLCIwijHEAomQGcnM1JI1xsf6OBgWkMz68QPIXatlM3WGI9XEdFNO4I7b
         JQgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cy2Irpbz4qk+WltFDzDSfC5epYt0eCHfQLX7UE6kz04=;
        b=kx0wyZhzWJVFIGiwPnd+hKk47pWa+jfuFCXEzZYE+BYOfZ+KXSwUfgeOjtWYSlqXdI
         WxjQFMuqxAxsEHBeEnCx0diMPp9ivY6D/OROKZUzkdivYIQmCLsSoCFMlMgpayMBs2s5
         VHjAzbgNEaYaBM9po3uSeszo+DpG/QQBzfYuw9t+tmwT2s7X0oF6Aa8J3WuZnAzO7UlN
         WsqzL6fmEmPzvEkKS4GnvLjpxwRHXLJYJ4/CwpfgHjnqnqb2IM5fgn/Pkd6nqNxRMuK3
         kEaZMollZCWEgnHa4UMEv75jXdjTSELQlDWGb9UKG4k6v2vtf0yAuXziEi8xvBnwuhWc
         UX4w==
X-Gm-Message-State: AOAM531xd82AM8cBWZ4LEcNvR88OQvcXdF2rPb7BgfijB91JQlFY1hMg
        4Lstee0ZmfLlZneY/X9paX8PBQGyjU0=
X-Google-Smtp-Source: ABdhPJyn82nlYbE1dCxMlMJEb9/pNiTR+ifm5N2kQlD6iABRfrbYEFLhg4uw5YH9+qKSwHZagtkX1g==
X-Received: by 2002:a05:6512:6c3:: with SMTP id u3mr1346362lff.443.1616174971051;
        Fri, 19 Mar 2021 10:29:31 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.googlemail.com with ESMTPSA id s29sm849380ljo.136.2021.03.19.10.29.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Mar 2021 10:29:30 -0700 (PDT)
Subject: Re: [PATCH v4] mm: cma: support sysfs
To:     Minchan Kim <minchan@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-mm <linux-mm@kvack.org>,
        LKML <linux-kernel@vger.kernel.org>, joaodias@google.com,
        willy@infradead.org, david@redhat.com, surenb@google.com,
        John Hubbard <jhubbard@nvidia.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <e8ae901d-9521-8de4-ee45-18cb55b8f29c@gmail.com>
 <YFSqYUfaxMajR/aq@kroah.com> <b3cfe38f-bfd0-043a-6063-f5178d4a9b09@gmail.com>
 <YFSrgfAyp+dYWi7k@kroah.com> <33ec18ef-8652-643a-1a53-ff7c3caf4399@gmail.com>
 <c61e58ca-6495-fd47-0138-5bbfe0b3dd20@gmail.com> <YFS06OLp70nWWLFi@kroah.com>
 <78883205-e6da-5bc4-dcec-b6eb921567b1@gmail.com> <YFTITw73Wga0/F0V@kroah.com>
 <72db59eb-75dc-d1ed-7a83-17052e8f22a8@gmail.com>
 <YFTRkBEr5T37NFpV@google.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <82bde114-60c0-3fde-43f4-844522b80673@gmail.com>
Date:   Fri, 19 Mar 2021 20:29:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YFTRkBEr5T37NFpV@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

19.03.2021 19:30, Minchan Kim пишет:
> On Fri, Mar 19, 2021 at 07:24:05PM +0300, Dmitry Osipenko wrote:
>> 19.03.2021 18:50, Greg Kroah-Hartman пишет:
>>>> Then initialization order won't be a problem.
>>> I don't understand the problem here, what is wrong with the patch as-is?
>>
>> The cma->stat is NULL at the time when CMA is used on ARM because
>> cma->stat is initialized at the subsys level. This is the problem,
>> apparently.
> 
> That's true.
> 
>>
>>> Also, watch out, if you only make the kobject dynamic, how are you going
>>> to get backwards from the kobject to the values you want to send to
>>> userspace in the show functions?
>>
>> Still there should be a wrapper around the kobj with a back reference to
>> the cma entry. If you're suggesting that I should write a patch, then I
>> may take a look at it later on. Although, I assume that Minchan could
>> just correct this patch and re-push it to -next.
> 
> This is ateempt to address it. Unless any objection, let me send it to
> akpm.
> 
> From 29a9fb4f300b754ebf55e6182ba84127658ef504 Mon Sep 17 00:00:00 2001
> From: Minchan Kim <minchan@kernel.org>
> Date: Fri, 22 Jan 2021 12:31:56 -0800
> Subject: [PATCH] mm: cma: support sysfs
> 
> Since CMA is getting used more widely, it's more important to
> keep monitoring CMA statistics for system health since it's
> directly related to user experience.
> 
> This patch introduces sysfs statistics for CMA, in order to provide
> some basic monitoring of the CMA allocator.
> 
>  * the number of CMA page successful allocations
>  * the number of CMA page allocation failures
> 
> These two values allow the user to calcuate the allocation
> failure rate for each CMA area.
> 
> e.g.)
>   /sys/kernel/mm/cma/WIFI/alloc_pages_[success|fail]
>   /sys/kernel/mm/cma/SENSOR/alloc_pages_[success|fail]
>   /sys/kernel/mm/cma/BLUETOOTH/alloc_pages_[success|fail]
> 
> The cma_stat was intentionally allocated by dynamic allocation
> to harmonize with kobject lifetime management.
> https://lore.kernel.org/linux-mm/YCOAmXqt6dZkCQYs@kroah.com/
> 
> Signed-off-by: Minchan Kim <minchan@kernel.org>
> ---
>  Documentation/ABI/testing/sysfs-kernel-mm-cma |  25 ++++
>  mm/Kconfig                                    |   7 ++
>  mm/Makefile                                   |   1 +
>  mm/cma.c                                      |   7 +-
>  mm/cma.h                                      |  20 ++++
>  mm/cma_sysfs.c                                | 107 ++++++++++++++++++
>  6 files changed, 165 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-kernel-mm-cma
>  create mode 100644 mm/cma_sysfs.c
> 
> diff --git a/Documentation/ABI/testing/sysfs-kernel-mm-cma b/Documentation/ABI/testing/sysfs-kernel-mm-cma
> new file mode 100644
> index 000000000000..02b2bb60c296
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-kernel-mm-cma
> @@ -0,0 +1,25 @@
> +What:		/sys/kernel/mm/cma/
> +Date:		Feb 2021
> +Contact:	Minchan Kim <minchan@kernel.org>
> +Description:
> +		/sys/kernel/mm/cma/ contains a subdirectory for each CMA
> +		heap name (also sometimes called CMA areas).
> +
> +		Each CMA heap subdirectory (that is, each
> +		/sys/kernel/mm/cma/<cma-heap-name> directory) contains the
> +		following items:
> +
> +			alloc_pages_success
> +			alloc_pages_fail
> +
> +What:		/sys/kernel/mm/cma/<cma-heap-name>/alloc_pages_success
> +Date:		Feb 2021
> +Contact:	Minchan Kim <minchan@kernel.org>
> +Description:
> +		the number of pages CMA API succeeded to allocate
> +
> +What:		/sys/kernel/mm/cma/<cma-heap-name>/alloc_pages_fail
> +Date:		Feb 2021
> +Contact:	Minchan Kim <minchan@kernel.org>
> +Description:
> +		the number of pages CMA API failed to allocate
> diff --git a/mm/Kconfig b/mm/Kconfig
> index 24c045b24b95..febb7e8e24de 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -513,6 +513,13 @@ config CMA_DEBUGFS
>  	help
>  	  Turns on the DebugFS interface for CMA.
>  
> +config CMA_SYSFS
> +	bool "CMA information through sysfs interface"
> +	depends on CMA && SYSFS
> +	help
> +	  This option exposes some sysfs attributes to get information
> +	  from CMA.
> +
>  config CMA_AREAS
>  	int "Maximum count of the CMA areas"
>  	depends on CMA
> diff --git a/mm/Makefile b/mm/Makefile
> index 72227b24a616..56968b23ed7a 100644
> --- a/mm/Makefile
> +++ b/mm/Makefile
> @@ -109,6 +109,7 @@ obj-$(CONFIG_CMA)	+= cma.o
>  obj-$(CONFIG_MEMORY_BALLOON) += balloon_compaction.o
>  obj-$(CONFIG_PAGE_EXTENSION) += page_ext.o
>  obj-$(CONFIG_CMA_DEBUGFS) += cma_debug.o
> +obj-$(CONFIG_CMA_SYSFS) += cma_sysfs.o
>  obj-$(CONFIG_USERFAULTFD) += userfaultfd.o
>  obj-$(CONFIG_IDLE_PAGE_TRACKING) += page_idle.o
>  obj-$(CONFIG_DEBUG_PAGE_REF) += debug_page_ref.o
> diff --git a/mm/cma.c b/mm/cma.c
> index 908f04775686..ac050359faae 100644
> --- a/mm/cma.c
> +++ b/mm/cma.c
> @@ -507,10 +507,13 @@ struct page *cma_alloc(struct cma *cma, size_t count, unsigned int align,
>  
>  	pr_debug("%s(): returned %p\n", __func__, page);
>  out:
> -	if (page)
> +	if (page) {
>  		count_vm_event(CMA_ALLOC_SUCCESS);
> -	else
> +		cma_sysfs_alloc_pages_count(cma, count);
> +	} else {
>  		count_vm_event(CMA_ALLOC_FAIL);
> +		cma_sysfs_fail_pages_count(cma, count);
> +	}
>  
>  	return page;
>  }
> diff --git a/mm/cma.h b/mm/cma.h
> index 42ae082cb067..70fd7633fe01 100644
> --- a/mm/cma.h
> +++ b/mm/cma.h
> @@ -3,6 +3,12 @@
>  #define __MM_CMA_H__
>  
>  #include <linux/debugfs.h>
> +#include <linux/kobject.h>
> +
> +struct cma_kobject {
> +	struct cma *cma;
> +	struct kobject kobj;
> +};
>  
>  struct cma {
>  	unsigned long   base_pfn;
> @@ -16,6 +22,13 @@ struct cma {
>  	struct debugfs_u32_array dfs_bitmap;
>  #endif
>  	char name[CMA_MAX_NAME];
> +#ifdef CONFIG_CMA_SYSFS
> +	/* the number of CMA page successful allocations */
> +	atomic64_t nr_pages_succeeded;
> +	/* the number of CMA page allocation failures */
> +	atomic64_t nr_pages_failed;
> +	struct cma_kobject *kobj;
> +#endif
>  };
>  
>  extern struct cma cma_areas[MAX_CMA_AREAS];
> @@ -26,4 +39,11 @@ static inline unsigned long cma_bitmap_maxno(struct cma *cma)
>  	return cma->count >> cma->order_per_bit;
>  }
>  
> +#ifdef CONFIG_CMA_SYSFS
> +void cma_sysfs_alloc_pages_count(struct cma *cma, size_t count);
> +void cma_sysfs_fail_pages_count(struct cma *cma, size_t count);
> +#else
> +static inline void cma_sysfs_alloc_pages_count(struct cma *cma, size_t count) {};
> +static inline void cma_sysfs_fail_pages_count(struct cma *cma, size_t count) {};
> +#endif
>  #endif
> diff --git a/mm/cma_sysfs.c b/mm/cma_sysfs.c
> new file mode 100644
> index 000000000000..ca093e9e9f64
> --- /dev/null
> +++ b/mm/cma_sysfs.c
> @@ -0,0 +1,107 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * CMA SysFS Interface
> + *
> + * Copyright (c) 2021 Minchan Kim <minchan@kernel.org>
> + */
> +
> +#include <linux/cma.h>
> +#include <linux/kernel.h>
> +#include <linux/slab.h>
> +
> +#include "cma.h"
> +
> +void cma_sysfs_alloc_pages_count(struct cma *cma, size_t count)
> +{
> +	atomic64_add(count, &cma->nr_pages_succeeded);
> +}
> +
> +void cma_sysfs_fail_pages_count(struct cma *cma, size_t count)
> +{
> +	atomic64_add(count, &cma->nr_pages_failed);
> +}
> +
> +#define CMA_ATTR_RO(_name) \
> +	static struct kobj_attribute _name##_attr = __ATTR_RO(_name)
> +
> +static ssize_t alloc_pages_success_show(struct kobject *kobj,
> +			struct kobj_attribute *attr, char *buf)

The indentations are still wrong.

CHECK: Alignment should match open parenthesis
#321: FILE: mm/cma_sysfs.c:28:
+static ssize_t alloc_pages_success_show(struct kobject *kobj,
+                       struct kobj_attribute *attr, char *buf)

> +{
> +	struct cma_kobject *cma_kobj = container_of(kobj, struct cma_kobject, kobj);
> +	struct cma *cma = cma_kobj->cma;
> +
> +	return sysfs_emit(buf, "%llu\n", atomic64_read(&cma->nr_pages_succeeded));
> +}
> +CMA_ATTR_RO(alloc_pages_success);
> +
> +static ssize_t alloc_pages_fail_show(struct kobject *kobj,
> +			struct kobj_attribute *attr, char *buf)

CHECK: Alignment should match open parenthesis
#331: FILE: mm/cma_sysfs.c:38:
+static ssize_t alloc_pages_fail_show(struct kobject *kobj,
+                       struct kobj_attribute *attr, char *buf)

> +{
> +	struct cma_kobject *cma_kobj = container_of(kobj, struct cma_kobject, kobj);
> +	struct cma *cma = cma_kobj->cma;
> +
> +	return sysfs_emit(buf, "%llu\n", atomic64_read(&cma->nr_pages_failed));
> +}
> +CMA_ATTR_RO(alloc_pages_fail);
> +
> +static void cma_kobj_release(struct kobject *kobj)
> +{
> +	struct cma_kobject *cma_kobj = container_of(kobj, struct cma_kobject, kobj);
> +
> +	kfree(cma_kobj);
> +}
> +
> +static struct attribute *cma_attrs[] = {
> +	&alloc_pages_success_attr.attr,
> +	&alloc_pages_fail_attr.attr,
> +	NULL,
> +};
> +ATTRIBUTE_GROUPS(cma);
> +
> +static struct cma_kobject *cma_kobjs;
> +static struct kobject *cma_kobj_root;
> +
> +static struct kobj_type cma_ktype = {
> +	.release = cma_kobj_release,
> +	.sysfs_ops = &kobj_sysfs_ops,
> +	.default_groups = cma_groups
> +};
> +
> +static int __init cma_sysfs_init(void)
> +{
> +	int i = 0;
> +	struct cma *cma;
> +
> +	cma_kobj_root = kobject_create_and_add("cma", mm_kobj);
> +	if (!cma_kobj_root)
> +		return -ENOMEM;
> +
> +	cma_kobjs = kcalloc(cma_area_count, sizeof(struct cma_kobject),
> +				GFP_KERNEL);

CHECK: Alignment should match open parenthesis
#373: FILE: mm/cma_sysfs.c:80:
+       cma_kobjs = kcalloc(cma_area_count, sizeof(struct cma_kobject),
+                               GFP_KERNEL);


> +	if (ZERO_OR_NULL_PTR(cma_kobjs))
> +		goto out;
> +
> +	do {
> +		cma = &cma_areas[i];
> +		cma->kobj = &cma_kobjs[i];

Does cma really need are pointer to cma_kobj?

> +		cma->kobj->cma = cma;
> +		if (kobject_init_and_add(&cma->kobj->kobj, &cma_ktype,
> +					cma_kobj_root, "%s", cma->name)) {

CHECK: Alignment should match open parenthesis
#382: FILE: mm/cma_sysfs.c:89:
+               if (kobject_init_and_add(&cma->kobj->kobj, &cma_ktype,
+                                       cma_kobj_root, "%s", cma->name)) {

> +			kobject_put(&cma->kobj->kobj);
> +			goto out;
> +		}
> +	} while (++i < cma_area_count);
> +
> +	return 0;
> +out:
> +	while (--i >= 0) {
> +		cma = &cma_areas[i];
> +		kobject_put(&cma->kobj->kobj);

Should the cma->kobj be set to NULL by cma_kobj_release() if cma->kobj is really needed?

> +	}
> +
> +	kfree(cma_kobjs);
> +	kobject_put(cma_kobj_root);
> +
> +	return -ENOMEM;
> +}
> +subsys_initcall(cma_sysfs_init);
> 

Tested-by: Dmitry Osipenko <digetx@gmail.com>
