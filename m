Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0CFEC433E0
	for <linux-tegra@archiver.kernel.org>; Sat, 20 Mar 2021 11:44:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A18A661972
	for <linux-tegra@archiver.kernel.org>; Sat, 20 Mar 2021 11:44:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229886AbhCTLno (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 20 Mar 2021 07:43:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:60396 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229570AbhCTLnn (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 20 Mar 2021 07:43:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0D3C361933;
        Sat, 20 Mar 2021 07:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1616226772;
        bh=AascX6NXhN/yFeD+IfuRay7JVAU7QFt1V1bttvBXuas=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ieGzFfy35KxYv+fBOV7DC4aJ9w2UdmKWYh+KQ2qkDWA2ABLbgr9Woxq6QamSzVhL0
         XrO6oudmkZC1cwNJhMul41q+YH5LUYR3oh4Tb/ishEBtiZWveHHdQuoI+x107zdmQJ
         WIslfOgerBAVjrSS6X7AsvMwQOidOdWjn7W19BeI=
Date:   Sat, 20 Mar 2021 08:52:49 +0100
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
Message-ID: <YFWp0ZpO+uKC1ziR@kroah.com>
References: <YFS06OLp70nWWLFi@kroah.com>
 <78883205-e6da-5bc4-dcec-b6eb921567b1@gmail.com>
 <YFTITw73Wga0/F0V@kroah.com>
 <72db59eb-75dc-d1ed-7a83-17052e8f22a8@gmail.com>
 <YFTRkBEr5T37NFpV@google.com>
 <071c6681-f492-2c94-5686-30c30778f39d@gmail.com>
 <YFTrpN8Qkv6ZY0Ci@google.com>
 <007c0317-8819-a6b8-fdff-c0b5899c4f51@gmail.com>
 <YFT1klxSFMlIXLHb@google.com>
 <d2e24e65-9c9d-6b18-81bf-bc1c46c6e0f3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d2e24e65-9c9d-6b18-81bf-bc1c46c6e0f3@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Mar 19, 2021 at 10:24:03PM +0300, Dmitry Osipenko wrote:
> 19.03.2021 22:03, Minchan Kim пишет:
> > On Fri, Mar 19, 2021 at 09:48:11PM +0300, Dmitry Osipenko wrote:
> >> 19.03.2021 21:21, Minchan Kim пишет:
> >>> On Fri, Mar 19, 2021 at 08:56:06PM +0300, Dmitry Osipenko wrote:
> >>>> 19.03.2021 19:30, Minchan Kim пишет:
> >>>>> +static void cma_kobj_release(struct kobject *kobj)
> >>>>> +{
> >>>>> +	struct cma_kobject *cma_kobj = container_of(kobj, struct cma_kobject, kobj);
> >>>>> +
> >>>>> +	kfree(cma_kobj);
> >>>>> +}
> >>>>
> >>>> Oh, wait.. I think this kfree wrong since cma_kobj belongs to the array.
> >>>
> >>> Oh, good spot. Let me use kzalloc.
> >>>
> >>
> >> Thinking a bit more about this.. it looks like actually it should be
> >> better to get back to the older variant of cma_stat, but allocate at the
> >> time of CMA initialization, rather than at the time of sysfs
> >> initialization. Then the cma_stat will be decoupled from the cma struct
> > 
> > IIRC, the problem was slab was not initiaized at CMA init point.
> > That's why I liked your suggestion.
> 
> Alright, if CMA init time is a problem, then the recent variant should
> be okay.
> 
> >> and cma_stat will be a self-contained object.
> > 
> > Yeah, self-contained is better but it's already weird to
> > have differnt lifetime for one object since CMA object
> > never die, technically.
> > 
> 
> Indeed.
> 
> I found the Greg's original argument and not sure that it's really
> worthwhile to worry about the copycats since this is not a driver's code..
> 
> Maybe we could just add a clarifying comment for the kobj, telling why
> it's okay for CMA. Greg, doesn't it sound like a good compromise to you?

Please no.
