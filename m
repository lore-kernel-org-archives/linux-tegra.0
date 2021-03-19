Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 303D0C433C1
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Mar 2021 18:08:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 02B5861953
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Mar 2021 18:08:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230146AbhCSSIY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 19 Mar 2021 14:08:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230142AbhCSSIL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 19 Mar 2021 14:08:11 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90842C06174A;
        Fri, 19 Mar 2021 11:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=vHfHyXotbRzGZh7y4q6pGdO4bWDVhUMZBFQ0KkjrwPU=; b=iozU64Xb4N0CWU4tgHMvEiJzgP
        5aAVKi3e8aOUxW+gAXhE0xiFIthJysSAFGfZ8UISNOroK6nQrdghBfhcSXUnKI2Wd8604LTnlVluK
        5dl/LgSLrAHghhNNRg69cFtchNA1tkl+svPALeAVbq7KNLxl+5gyZByHaj65UpIaL85HgyTLMtpSu
        JpgjyUt7QTUES17BQRwqxdB3Ytyh/8rFwm1Z9Fp7a0SfwojMaqHnDSr8e5WDckwHzZvALFx+7Wwcu
        bMe2lMIl/lPVM5aufgHuGcNY0PZeEz4C2PZbAiOVhSCR3C5bP/BN3PCXqWbelIXDf2tArOFI24oBe
        RlHTiVxw==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1lNJXF-004nzY-9E; Fri, 19 Mar 2021 18:07:51 +0000
Date:   Fri, 19 Mar 2021 18:07:45 +0000
From:   Matthew Wilcox <willy@infradead.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Minchan Kim <minchan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-mm <linux-mm@kvack.org>,
        LKML <linux-kernel@vger.kernel.org>, joaodias@google.com,
        david@redhat.com, surenb@google.com,
        John Hubbard <jhubbard@nvidia.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v4] mm: cma: support sysfs
Message-ID: <20210319180745.GB3420@casper.infradead.org>
References: <b3cfe38f-bfd0-043a-6063-f5178d4a9b09@gmail.com>
 <YFSrgfAyp+dYWi7k@kroah.com>
 <33ec18ef-8652-643a-1a53-ff7c3caf4399@gmail.com>
 <c61e58ca-6495-fd47-0138-5bbfe0b3dd20@gmail.com>
 <YFS06OLp70nWWLFi@kroah.com>
 <78883205-e6da-5bc4-dcec-b6eb921567b1@gmail.com>
 <YFTITw73Wga0/F0V@kroah.com>
 <72db59eb-75dc-d1ed-7a83-17052e8f22a8@gmail.com>
 <YFTRkBEr5T37NFpV@google.com>
 <82bde114-60c0-3fde-43f4-844522b80673@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <82bde114-60c0-3fde-43f4-844522b80673@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Mar 19, 2021 at 08:29:29PM +0300, Dmitry Osipenko wrote:
> > +static ssize_t alloc_pages_success_show(struct kobject *kobj,
> > +			struct kobj_attribute *attr, char *buf)
> 
> The indentations are still wrong.
> 
> CHECK: Alignment should match open parenthesis
> #321: FILE: mm/cma_sysfs.c:28:
> +static ssize_t alloc_pages_success_show(struct kobject *kobj,
> +                       struct kobj_attribute *attr, char *buf)

This is bullshit.  Do not waste people's time with this frivolity.

