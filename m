Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B213BC433E0
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Mar 2021 19:04:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 86FD261979
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Mar 2021 19:04:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230422AbhCSTDx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 19 Mar 2021 15:03:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230391AbhCSTDu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 19 Mar 2021 15:03:50 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 569D8C06174A;
        Fri, 19 Mar 2021 12:03:50 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id l123so6558321pfl.8;
        Fri, 19 Mar 2021 12:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=RY4pLK9k4mNEtiGyVCqmRISme5ShUYMejZygdlUQWa0=;
        b=ZxCHUCqmUqEddVD9ZpJmJ3k+Y48geenVlK3+gyb3VWDF05fast3iI4YNuhnPV6x3Kx
         P0n1g+Y7C7pXaq/ORU3uNsFdFXmI46MMkjUC8FiGe7AOf8vvthxVbQyOjBJYA2yfC45T
         dmxYg9+isipKlAfadltnEc6iCPntiENMSrEDYSi5bHYhD+1iISBZu36Cf7wsmqy/uowj
         M8rTinQiqU/1gHmGoCBrvtZBSrGN7zConGbJl98wCTVZuSSIMew8O7/rR4lUEaz5h03Z
         2Yj+O2Ucv4xEdTsYWC4PqNRtPz/BwaKAEWlUW521jQ0h/7nZqnEjP/by9CVmlz5WAzMD
         Vx+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=RY4pLK9k4mNEtiGyVCqmRISme5ShUYMejZygdlUQWa0=;
        b=sTlt5kytEqHrOChhHVuo3jmr158ErWz58YLiB0TldSvealRPx/lqNmj8OmIdl+eXM8
         9lEyuvIobFoV503BrAgM8gHjwTBC150VuwHkb+3iN6w/+Burl8iGs3O5Cqu6FeiMOHfW
         DJI21hzGUb/CEwaFslPoinhA3sA9skDLlFnBiV3VpQLhkuXXmFpX+luMK/IQRlbioxji
         R4p2E2uT97BHXacaI+tpxIMINd9vdzST2AfcHl4t3rAKBFAZdlD2iCnxEK3uBJGSZcqy
         GsJhadn6H57MDvFZa6T8/KTCQrYxsWB31B2WX4A14LWJtlIQjNgTfcbiDY/04g+Q9Pj4
         BBJA==
X-Gm-Message-State: AOAM532s5hRsrq/SSv0bzlunKgCXvnLOKDJFR4biBa77ei0+J8nn43x9
        WYPT2z9LVOXm0DEWtGXWtAo=
X-Google-Smtp-Source: ABdhPJzaExzsCk+tw5IbjmUjqP+Z2royJZuLdH5tCHDU31/INu+Y8kzNUB+6UXtptyhu+UNfdzJ74g==
X-Received: by 2002:aa7:9246:0:b029:1ed:cfa4:f1a8 with SMTP id 6-20020aa792460000b02901edcfa4f1a8mr10458327pfp.73.1616180629766;
        Fri, 19 Mar 2021 12:03:49 -0700 (PDT)
Received: from google.com ([2620:15c:211:201:2033:9813:e1ed:7060])
        by smtp.gmail.com with ESMTPSA id p11sm5965392pjo.48.2021.03.19.12.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 12:03:48 -0700 (PDT)
Sender: Minchan Kim <minchan.kim@gmail.com>
Date:   Fri, 19 Mar 2021 12:03:46 -0700
From:   Minchan Kim <minchan@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-mm <linux-mm@kvack.org>,
        LKML <linux-kernel@vger.kernel.org>, joaodias@google.com,
        willy@infradead.org, david@redhat.com, surenb@google.com,
        John Hubbard <jhubbard@nvidia.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v4] mm: cma: support sysfs
Message-ID: <YFT1klxSFMlIXLHb@google.com>
References: <33ec18ef-8652-643a-1a53-ff7c3caf4399@gmail.com>
 <c61e58ca-6495-fd47-0138-5bbfe0b3dd20@gmail.com>
 <YFS06OLp70nWWLFi@kroah.com>
 <78883205-e6da-5bc4-dcec-b6eb921567b1@gmail.com>
 <YFTITw73Wga0/F0V@kroah.com>
 <72db59eb-75dc-d1ed-7a83-17052e8f22a8@gmail.com>
 <YFTRkBEr5T37NFpV@google.com>
 <071c6681-f492-2c94-5686-30c30778f39d@gmail.com>
 <YFTrpN8Qkv6ZY0Ci@google.com>
 <007c0317-8819-a6b8-fdff-c0b5899c4f51@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <007c0317-8819-a6b8-fdff-c0b5899c4f51@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Mar 19, 2021 at 09:48:11PM +0300, Dmitry Osipenko wrote:
> 19.03.2021 21:21, Minchan Kim пишет:
> > On Fri, Mar 19, 2021 at 08:56:06PM +0300, Dmitry Osipenko wrote:
> >> 19.03.2021 19:30, Minchan Kim пишет:
> >>> +static void cma_kobj_release(struct kobject *kobj)
> >>> +{
> >>> +	struct cma_kobject *cma_kobj = container_of(kobj, struct cma_kobject, kobj);
> >>> +
> >>> +	kfree(cma_kobj);
> >>> +}
> >>
> >> Oh, wait.. I think this kfree wrong since cma_kobj belongs to the array.
> > 
> > Oh, good spot. Let me use kzalloc.
> > 
> 
> Thinking a bit more about this.. it looks like actually it should be
> better to get back to the older variant of cma_stat, but allocate at the
> time of CMA initialization, rather than at the time of sysfs
> initialization. Then the cma_stat will be decoupled from the cma struct

IIRC, the problem was slab was not initiaized at CMA init point.
That's why I liked your suggestion.

> and cma_stat will be a self-contained object.

Yeah, self-contained is better but it's already weird to
have differnt lifetime for one object since CMA object
never die, technically.
