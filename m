Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7A78C433DB
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Mar 2021 13:43:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B54864F04
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Mar 2021 13:43:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229886AbhCSNnG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 19 Mar 2021 09:43:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:51238 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230024AbhCSNnA (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 19 Mar 2021 09:43:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 812E864F04;
        Fri, 19 Mar 2021 13:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1616161380;
        bh=7mQCTG/AIZnXq4/oljSjBp3t2b8XcL14K/DhpsnZ5WY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hSI/v73kwjbmtzZbm0OIzh40eyB+o05loZRX372Uaji6cwRlyjMJLn72rtxgbJBxq
         eUefiXvrpnG1YIBMaXFd8jjR7gM64/lfJwU44yFXTc6ZJzcNMGyvOKMJQVFnCI4HBg
         WURVRSTINeA5Jzt1iOmKl6eB8ZQncs1OW1uxXcMc=
Date:   Fri, 19 Mar 2021 14:42:57 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Minchan Kim <minchan@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-mm <linux-mm@kvack.org>,
        LKML <linux-kernel@vger.kernel.org>, joaodias@google.com,
        willy@infradead.org, david@redhat.com, surenb@google.com,
        John Hubbard <jhubbard@nvidia.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v4] mm: cma: support sysfs
Message-ID: <YFSqYUfaxMajR/aq@kroah.com>
References: <20210309062333.3216138-1-minchan@kernel.org>
 <fead70a2-4330-79ff-e79a-d8511eab1256@gmail.com>
 <e8ae901d-9521-8de4-ee45-18cb55b8f29c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e8ae901d-9521-8de4-ee45-18cb55b8f29c@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Mar 19, 2021 at 04:39:41PM +0300, Dmitry Osipenko wrote:
> 19.03.2021 15:44, Dmitry Osipenko пишет:
> ...
> >>  #include <linux/debugfs.h>
> >> +#include <linux/kobject.h>
> >> +
> >> +struct cma_stat {
> >> +	spinlock_t lock;
> >> +	/* the number of CMA page successful allocations */
> >> +	unsigned long nr_pages_succeeded;
> >> +	/* the number of CMA page allocation failures */
> >> +	unsigned long nr_pages_failed;
> >> +	struct kobject kobj;
> >> +};
> >>  
> >>  struct cma {
> >>  	unsigned long   base_pfn;
> >> @@ -16,6 +26,9 @@ struct cma {
> >>  	struct debugfs_u32_array dfs_bitmap;
> >>  #endif
> >>  	char name[CMA_MAX_NAME];
> >> +#ifdef CONFIG_CMA_SYSFS
> >> +	struct cma_stat	*stat;
> >> +#endif
> 
> What is the point of allocating stat dynamically?

Because static kobjects make me cry.

