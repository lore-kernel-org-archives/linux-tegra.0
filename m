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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75C1DC433E6
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Mar 2021 12:44:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 49AE564EED
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Mar 2021 12:44:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230185AbhCSMoV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 19 Mar 2021 08:44:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230163AbhCSMoG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 19 Mar 2021 08:44:06 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76A53C06174A;
        Fri, 19 Mar 2021 05:44:05 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id u4so11795155ljo.6;
        Fri, 19 Mar 2021 05:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pE9UTROWsh3/pPLe+cr073qMj1X+IQp0oFmUiWqch/8=;
        b=MFHThy89oJc+dHthFkFMr+lYlYyUobH7v3iQwNWw2XFxe2ml3Q3AjBzhH3eVp3eQvf
         THEkRTSt/vkypRQNw1Ua4udKIMHBFCx1tNePa3vHyx+dYt9PGhYcwJfZ9qh/EKzDrnuu
         IyvnhHPcjWt2NCflmyl9rOuIg5G9etAIx2AdVNeXxLrBpH+6c5fnX4QkHAmkm00QufN5
         aumN8Zj12BJgq3/AmS7Rz+VOZzq1vfz+fKS8ef4jok1QUhbxSYiHW6c5K2OGEsOyFJUk
         CaMEJipR8UgnvdjkAoJa8kw22WH6v4GHIX7AEuANIw37eQHBHeHT0PDxkKlsCqf2VYVD
         pwOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pE9UTROWsh3/pPLe+cr073qMj1X+IQp0oFmUiWqch/8=;
        b=Go5IVz/CG00py+D/2QKwBFPvBGIDbEFEO8UeMm7m6IIX5lpWsqT+vzipq7Kh7ITir+
         1t0CZC9yOKqF11COJPE9R2PK623rxDe74bdx9JktbbPTbrOAwXTgx3EmCPBM8uJ+UUkI
         Kc8TEnSxuCBkye8Ev+FPpD3k74vCq8CZvxXXjZPBbkTT8yWjtV+GwafqS7TpQo1uppqa
         nP3A6YFcOhJDYUhSbMeQkhFP0O176mht0VHvCn04RAMSoR75aiXyeK8ymX6lgGVAD/Pw
         yLUxBN7arJIR5TGV0nLHGSa76TQ79M+6bxUg32uUWMp6rX2ZaYOKdmjHUEKfhq7cONgg
         1Jjg==
X-Gm-Message-State: AOAM530eRz5JydcimDoTEnQ5xUdjJfPQiSnXrD/34l5fK3NWtptsskcj
        F9W/H+m4o/Y5AXVDVwoZHpC6pYqE8Gk=
X-Google-Smtp-Source: ABdhPJwoCPtn9KGPuEZhQakE51bBvBf2VLF4yHt3RcvpYXwuXr6z/HqAyaNEZohhsA0CCkQGFPceUA==
X-Received: by 2002:a05:651c:387:: with SMTP id e7mr798035ljp.425.1616157843736;
        Fri, 19 Mar 2021 05:44:03 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.googlemail.com with ESMTPSA id k5sm752189ljb.78.2021.03.19.05.44.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Mar 2021 05:44:03 -0700 (PDT)
Subject: Re: [PATCH v4] mm: cma: support sysfs
To:     Minchan Kim <minchan@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-mm <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>,
        joaodias@google.com, willy@infradead.org, david@redhat.com,
        surenb@google.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20210309062333.3216138-1-minchan@kernel.org>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <fead70a2-4330-79ff-e79a-d8511eab1256@gmail.com>
Date:   Fri, 19 Mar 2021 15:44:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210309062333.3216138-1-minchan@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

09.03.2021 09:23, Minchan Kim пишет:
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
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: John Hubbard <jhubbard@nvidia.com>
> Signed-off-by: Minchan Kim <minchan@kernel.org>
> ---
> From v3 - https://lore.kernel.org/linux-mm/20210303205053.2906924-1-minchan@kernel.org/
>  * fix ZERO_OR_NULL_PTR - kernel test robot
>  * remove prefix cma - david@
>  * resolve conflict with vmstat cma in mmotm - akpm@
>  * rename stat name with success|fail
> 
> From v2 - https://lore.kernel.org/linux-mm/20210208180142.2765456-1-minchan@kernel.org/
>  * sysfs doc and description modification - jhubbard
> 
> From v1 - https://lore.kernel.org/linux-mm/20210203155001.4121868-1-minchan@kernel.org/
>  * fix sysfs build and refactoring - willy
>  * rename and drop some attributes - jhubbard
> 
>  Documentation/ABI/testing/sysfs-kernel-mm-cma |  25 ++++
>  mm/Kconfig                                    |   7 ++
>  mm/Makefile                                   |   1 +
>  mm/cma.c                                      |   7 +-
>  mm/cma.h                                      |  20 ++++
>  mm/cma_sysfs.c                                | 110 ++++++++++++++++++
>  6 files changed, 168 insertions(+), 2 deletions(-)
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
> index 42ae082cb067..95d1aa2d808a 100644
> --- a/mm/cma.h
> +++ b/mm/cma.h
> @@ -3,6 +3,16 @@
>  #define __MM_CMA_H__
>  
>  #include <linux/debugfs.h>
> +#include <linux/kobject.h>
> +
> +struct cma_stat {
> +	spinlock_t lock;
> +	/* the number of CMA page successful allocations */
> +	unsigned long nr_pages_succeeded;
> +	/* the number of CMA page allocation failures */
> +	unsigned long nr_pages_failed;
> +	struct kobject kobj;
> +};
>  
>  struct cma {
>  	unsigned long   base_pfn;
> @@ -16,6 +26,9 @@ struct cma {
>  	struct debugfs_u32_array dfs_bitmap;
>  #endif
>  	char name[CMA_MAX_NAME];
> +#ifdef CONFIG_CMA_SYSFS
> +	struct cma_stat	*stat;
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
> index 000000000000..3134b2b3a96d
> --- /dev/null
> +++ b/mm/cma_sysfs.c
> @@ -0,0 +1,110 @@
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
> +static struct cma_stat *cma_stats;
> +
> +void cma_sysfs_alloc_pages_count(struct cma *cma, size_t count)
> +{
> +	spin_lock(&cma->stat->lock);
> +	cma->stat->nr_pages_succeeded += count;
> +	spin_unlock(&cma->stat->lock);
> +}
> +
> +void cma_sysfs_fail_pages_count(struct cma *cma, size_t count)
> +{
> +	spin_lock(&cma->stat->lock);
> +	cma->stat->nr_pages_failed += count;
> +	spin_unlock(&cma->stat->lock);
> +}
> +
> +#define CMA_ATTR_RO(_name) \
> +	static struct kobj_attribute _name##_attr = __ATTR_RO(_name)
> +
> +static struct kobject *cma_kobj;
> +
> +static ssize_t alloc_pages_success_show(struct kobject *kobj,
> +			struct kobj_attribute *attr, char *buf)
> +{
> +	struct cma_stat *stat = container_of(kobj, struct cma_stat, kobj);
> +
> +	return sysfs_emit(buf, "%lu\n", stat->nr_pages_succeeded);
> +}
> +CMA_ATTR_RO(alloc_pages_success);
> +
> +static ssize_t alloc_pages_fail_show(struct kobject *kobj,
> +			struct kobj_attribute *attr, char *buf)
> +{
> +	struct cma_stat *stat = container_of(kobj, struct cma_stat, kobj);
> +
> +	return sysfs_emit(buf, "%lu\n", stat->nr_pages_failed);
> +}
> +CMA_ATTR_RO(alloc_pages_fail);
> +
> +static void cma_kobj_release(struct kobject *kobj)
> +{
> +	struct cma_stat *stat = container_of(kobj, struct cma_stat, kobj);
> +
> +	kfree(stat);
> +}
> +
> +static struct attribute *cma_attrs[] = {
> +	&alloc_pages_success_attr.attr,
> +	&alloc_pages_fail_attr.attr,
> +	NULL,
> +};
> +ATTRIBUTE_GROUPS(cma);
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
> +	cma_kobj = kobject_create_and_add("cma", mm_kobj);
> +	if (!cma_kobj)
> +		return -ENOMEM;
> +
> +	cma_stats = kmalloc_array(cma_area_count, sizeof(struct cma_stat),
> +				GFP_KERNEL|__GFP_ZERO);

Use kcalloc().

Code identation is wrong, please use checkpatch.

> +	if (ZERO_OR_NULL_PTR(cma_stats))
> +		goto out;
> +
> +	do {
> +		cma = &cma_areas[i];
> +		cma->stat = &cma_stats[i];
> +		spin_lock_init(&cma->stat->lock);
> +		if (kobject_init_and_add(&cma->stat->kobj, &cma_ktype,
> +					cma_kobj, "%s", cma->name)) {
> +			kobject_put(&cma->stat->kobj);
> +			goto out;
> +		}
> +	} while (++i < cma_area_count);
> +
> +	return 0;
> +out:
> +	while (--i >= 0) {
> +		cma = &cma_areas[i];
> +		kobject_put(&cma->stat->kobj);
> +	}
> +
> +	kfree(cma_stats);
> +	kobject_put(cma_kobj);
> +
> +	return -ENOMEM;
> +}
> +subsys_initcall(cma_sysfs_init);
> 

Hi,

There is a NULL derence on ARM32 NVIDIA Tegra SoCs with CONFIG_CMA_SYSFS=y using today's next-20210319, please take a look.

[    1.185423] 8<--- cut here ---
[    1.186081] Unable to handle kernel NULL pointer dereference at virtual address 00000000
[    1.186705] pgd = (ptrval)
[    1.188130] [00000000] *pgd=00000000
[    1.190554] Internal error: Oops: 5 [#1] PREEMPT SMP THUMB2
[    1.191545] Modules linked in:
[    1.192629] CPU: 1 PID: 1 Comm: swapper/0 Tainted: G        W         5.12.0-rc3-next-20210319-00174-g89b3b421dd2b #7142
[    1.193540] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
[    1.194613] PC is at _raw_spin_lock+0x1a/0x48
[    1.200352] LR is at cma_sysfs_alloc_pages_count+0x13/0x24
[    1.200821] pc : [<c0a2d832>]    lr : [<c027762f>]    psr: 00000033
[    1.201269] sp : c1547e48  ip : f0000080  fp : 0000c800
[    1.201580] r10: c13bd178  r9 : 00000040  r8 : 00000040
[    1.201972] r7 : 00000000  r6 : c13bd168  r5 : 00000040  r4 : c13bd168
[    1.202418] r3 : c1546000  r2 : 00000001  r1 : 00000040  r0 : 00000000
[    1.203014] Flags: nzcv  IRQs on  FIQs on  Mode SVC_32  ISA Thumb  Segment none
[    1.203488] Control: 50c5387d  Table: 0000406a  DAC: 00000051
[    1.203988] Register r0 information: NULL pointer
[    1.204868] Register r1 information: non-paged memory
[    1.205233] Register r2 information: non-paged memory
[    1.205563] Register r3 information: non-slab/vmalloc memory
[    1.206213] Register r4 information: non-slab/vmalloc memory
[    1.206578] Register r5 information: non-paged memory
[    1.206929] Register r6 information: non-slab/vmalloc memory
[    1.207278] Register r7 information: NULL pointer
[    1.207594] Register r8 information: non-paged memory
[    1.207968] Register r9 information: non-paged memory
[    1.208291] Register r10 information: non-slab/vmalloc memory
[    1.208648] Register r11 information: non-paged memory
[    1.209002] Register r12 information: non-paged memory
[    1.209407] Process swapper/0 (pid: 1, stack limit = 0x(ptrval))
[    1.209956] Stack: (0xc1547e48 to 0xc1548000)
[    1.211102] 7e40:                   c1199e24 00033800 efe35000 c027706f 0000003f 00000000
[    1.211999] 7e60: 00000040 0000003f 00000000 00000040 00000cc0 00000000 00000006 00000000
[    1.212855] 7e80: c1547ed8 00040000 c1141780 00000001 00000000 c1547ed8 00000647 00000040
[    1.213768] 7ea0: c138c000 c01112ab c0fed0d8 c1141780 c1546000 00000001 c1140d24 00000000
[    1.214648] 7ec0: c1140d44 c1104af9 c1104a7f 00000001 00000000 00000cc0 00000000 e29968ad
[    1.215578] 7ee0: c161a077 c1546000 c136d940 c1104a7f ffffe000 c0101d69 c161a077 c161a098
[    1.216564] 7f00: c1058490 c0138345 c10566cc c0ef58b8 c11003d1 c1546000 00000000 00000002
[    1.217357] 7f20: 00000002 c0f10280 c0efe3e4 c0efe398 c11003d1 c161a074 c161a077 e29968ad
[    1.218212] 7f40: c1140d40 e29968ad c161a000 c118d304 00000003 c11003d1 c161a000 c1140d24
[    1.219164] 7f60: 0000017e c1101141 00000002 00000002 00000000 c11003d1 c0a27fc5 c10566cc
[    1.220015] 7f80: c1547f98 00000000 c0a27fc5 00000000 00000000 00000000 00000000 00000000
[    1.220863] 7fa0: 00000000 c0a27fd1 00000000 c0100155 00000000 00000000 00000000 00000000
[    1.221713] 7fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    1.222584] 7fe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 00000000
[    1.225038] [<c0a2d832>] (_raw_spin_lock) from [<c027762f>] (cma_sysfs_alloc_pages_count+0x13/0x24)
[    1.226190] [<c027762f>] (cma_sysfs_alloc_pages_count) from [<c027706f>] (cma_alloc+0x153/0x274)
[    1.226720] [<c027706f>] (cma_alloc) from [<c01112ab>] (__alloc_from_contiguous+0x37/0x8c)
[    1.227272] [<c01112ab>] (__alloc_from_contiguous) from [<c1104af9>] (atomic_pool_init+0x7b/0x126)
[    1.233596] [<c1104af9>] (atomic_pool_init) from [<c0101d69>] (do_one_initcall+0x45/0x1e4)
[    1.234188] [<c0101d69>] (do_one_initcall) from [<c1101141>] (kernel_init_freeable+0x157/0x1a6)
[    1.234741] [<c1101141>] (kernel_init_freeable) from [<c0a27fd1>] (kernel_init+0xd/0xe0)
[    1.235289] [<c0a27fd1>] (kernel_init) from [<c0100155>] (ret_from_fork+0x11/0x1c)
