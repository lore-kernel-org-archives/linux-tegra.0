Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50553C433E1
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Mar 2021 15:51:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C6C6361958
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Mar 2021 15:51:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230002AbhCSPvD (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 19 Mar 2021 11:51:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:56050 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229893AbhCSPum (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 19 Mar 2021 11:50:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4A92C61958;
        Fri, 19 Mar 2021 15:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1616169041;
        bh=ubgyaS52WDrIeXP4WAzmN7Ns+7FkMbsDSRneZqCrO5s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qBKpkhyXn7CE4/KIyveBBfszOXoMe+0PCvq55IQQUA1lpCCRVKS5mC9RTJj2BtFOL
         aZPbWpI7ZW+klAKLIqiU05jkHbPFbEsG0e24r7TsEPVfdVtxYMUZvedvcSc8b2yg+o
         H/UfuJ0c3sd1GCXqzoog+WtB9MwkX4QixWzDUzrg=
Date:   Fri, 19 Mar 2021 16:50:39 +0100
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
Message-ID: <YFTITw73Wga0/F0V@kroah.com>
References: <20210309062333.3216138-1-minchan@kernel.org>
 <fead70a2-4330-79ff-e79a-d8511eab1256@gmail.com>
 <e8ae901d-9521-8de4-ee45-18cb55b8f29c@gmail.com>
 <YFSqYUfaxMajR/aq@kroah.com>
 <b3cfe38f-bfd0-043a-6063-f5178d4a9b09@gmail.com>
 <YFSrgfAyp+dYWi7k@kroah.com>
 <33ec18ef-8652-643a-1a53-ff7c3caf4399@gmail.com>
 <c61e58ca-6495-fd47-0138-5bbfe0b3dd20@gmail.com>
 <YFS06OLp70nWWLFi@kroah.com>
 <78883205-e6da-5bc4-dcec-b6eb921567b1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <78883205-e6da-5bc4-dcec-b6eb921567b1@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Mar 19, 2021 at 06:38:00PM +0300, Dmitry Osipenko wrote:
> 19.03.2021 17:27, Greg Kroah-Hartman пишет:
> > On Fri, Mar 19, 2021 at 05:19:47PM +0300, Dmitry Osipenko wrote:
> >> 19.03.2021 16:51, Dmitry Osipenko пишет:
> >>> 19.03.2021 16:47, Greg Kroah-Hartman пишет:
> >>>> On Fri, Mar 19, 2021 at 04:45:21PM +0300, Dmitry Osipenko wrote:
> >>>>> 19.03.2021 16:42, Greg Kroah-Hartman пишет:
> >>>>>> On Fri, Mar 19, 2021 at 04:39:41PM +0300, Dmitry Osipenko wrote:
> >>>>>>> 19.03.2021 15:44, Dmitry Osipenko пишет:
> >>>>>>> ...
> >>>>>>>>>  #include <linux/debugfs.h>
> >>>>>>>>> +#include <linux/kobject.h>
> >>>>>>>>> +
> >>>>>>>>> +struct cma_stat {
> >>>>>>>>> +	spinlock_t lock;
> >>>>>>>>> +	/* the number of CMA page successful allocations */
> >>>>>>>>> +	unsigned long nr_pages_succeeded;
> >>>>>>>>> +	/* the number of CMA page allocation failures */
> >>>>>>>>> +	unsigned long nr_pages_failed;
> >>>>>>>>> +	struct kobject kobj;
> >>>>>>>>> +};
> >>>>>>>>>  
> >>>>>>>>>  struct cma {
> >>>>>>>>>  	unsigned long   base_pfn;
> >>>>>>>>> @@ -16,6 +26,9 @@ struct cma {
> >>>>>>>>>  	struct debugfs_u32_array dfs_bitmap;
> >>>>>>>>>  #endif
> >>>>>>>>>  	char name[CMA_MAX_NAME];
> >>>>>>>>> +#ifdef CONFIG_CMA_SYSFS
> >>>>>>>>> +	struct cma_stat	*stat;
> >>>>>>>>> +#endif
> >>>>>>>
> >>>>>>> What is the point of allocating stat dynamically?
> >>>>>>
> >>>>>> Because static kobjects make me cry.
> >>>>>>
> >>>>>
> >>>>> I meant that it's already a part of struct cma, it looks like the stat
> >>>>> could be embedded into struct cma and then kobj could be initialized
> >>>>> separately.
> >>>>
> >>>> But that structure is statically allocated, so it can not be.  This has
> >>>> been discussed in the past threads for when this was reviewed if you are
> >>>> curious :)
> >>>
> >>> Indeed, I missed that cma_areas[] is static, thank you.
> >>>
> >>
> >> And in this case should be better to make only the kobj allocated
> >> dynamically instead of the whole cma_stat.
> > 
> > Why does it matter?
> > 
> 
> Then initialization order won't be a problem.

I don't understand the problem here, what is wrong with the patch as-is?

Also, watch out, if you only make the kobject dynamic, how are you going
to get backwards from the kobject to the values you want to send to
userspace in the show functions?

thanks,

greg k-h
