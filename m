Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8198C433DB
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Mar 2021 18:22:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 78C2F61981
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Mar 2021 18:22:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230327AbhCSSVs (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 19 Mar 2021 14:21:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230063AbhCSSV2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 19 Mar 2021 14:21:28 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA1D8C06174A;
        Fri, 19 Mar 2021 11:21:27 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id ga23-20020a17090b0397b02900c0b81bbcd4so7154524pjb.0;
        Fri, 19 Mar 2021 11:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=79uKpKqH8yE9ALQi9JEApAMx1JELp/Qz4rJBRLestg4=;
        b=Z5GSLVHRbgWOht2H1kUZASS6SP7XLmmP6NuxjMuW4qXbGRfWfPsIoY7i6DbauIRt3c
         E4wZQXLU779XR0oFRrf+AsYi1nDnmunNpnZLomSwWjE4YVNc3n0CoBjoLjE6sKONoy5k
         5qRc+XhskLKkawGHgHqqsl8NaUPxwmu+BZMHUAvimDFE8vwPI1sHhojlf1BXmQwgY90H
         Nv6FUgzcxe5nyJTEY0PfnI+UNbTFALUv8AHEvOhUJqegkvbpsyUbyEEgeHzvqlY3G3KR
         5n0xiUehiowiSn3W8cMDr963yjq/S4M+5+iIwcF+1EbNHtE753nzIJHgXAG4WA1rvtHd
         +aHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=79uKpKqH8yE9ALQi9JEApAMx1JELp/Qz4rJBRLestg4=;
        b=sjKNQlS5nkYT67WmssqwGrIURnk3xVZ/GPu6KZ3AQoB/q/3jros94SDs7CM1esjo/r
         MDKtFOU7urvxPD+W8ERR9pNUkOC/TmdH3hJO2zwAaBWo1+06UHbeJbdLeqjE02xZjPBy
         ye2Yj4OihTcODRFEY18zjEL7sVlguwlrQE6I7Ws4neb6pOdK/45+kbCWGC89nvIu1bUj
         03rvXswzONFiBdM5crG3VsV2TH7N/eRfBhfw30koUG+KBVNdmXFKHhv3RIGLqnvn6O4v
         AgmCRUD1CaY0aaK2hzL+X4y8eH48LbXO6XzZ5uIICC0Fk1jb+RfW9GiT2t/HXbceis4/
         sfSw==
X-Gm-Message-State: AOAM532fOjFqeIdranMB9pKSSavPzWblg5sEsiAa3Z5+ZgUDespopw5m
        lbr2nKMbei4og2dUoboIq/g=
X-Google-Smtp-Source: ABdhPJxbvucmu60oiEjVBF6kDGI6OoDlPVVu7FPQ7l1x3SCE6vAt7t/FUIzYxxn6Q1J/iofwLTdWlA==
X-Received: by 2002:a17:902:d201:b029:e6:bba:52b3 with SMTP id t1-20020a170902d201b02900e60bba52b3mr15882020ply.51.1616178087504;
        Fri, 19 Mar 2021 11:21:27 -0700 (PDT)
Received: from google.com ([2620:15c:211:201:2033:9813:e1ed:7060])
        by smtp.gmail.com with ESMTPSA id q34sm5564426pgl.92.2021.03.19.11.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 11:21:26 -0700 (PDT)
Sender: Minchan Kim <minchan.kim@gmail.com>
Date:   Fri, 19 Mar 2021 11:21:24 -0700
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
Message-ID: <YFTrpN8Qkv6ZY0Ci@google.com>
References: <b3cfe38f-bfd0-043a-6063-f5178d4a9b09@gmail.com>
 <YFSrgfAyp+dYWi7k@kroah.com>
 <33ec18ef-8652-643a-1a53-ff7c3caf4399@gmail.com>
 <c61e58ca-6495-fd47-0138-5bbfe0b3dd20@gmail.com>
 <YFS06OLp70nWWLFi@kroah.com>
 <78883205-e6da-5bc4-dcec-b6eb921567b1@gmail.com>
 <YFTITw73Wga0/F0V@kroah.com>
 <72db59eb-75dc-d1ed-7a83-17052e8f22a8@gmail.com>
 <YFTRkBEr5T37NFpV@google.com>
 <071c6681-f492-2c94-5686-30c30778f39d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <071c6681-f492-2c94-5686-30c30778f39d@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Mar 19, 2021 at 08:56:06PM +0300, Dmitry Osipenko wrote:
> 19.03.2021 19:30, Minchan Kim пишет:
> > +static void cma_kobj_release(struct kobject *kobj)
> > +{
> > +	struct cma_kobject *cma_kobj = container_of(kobj, struct cma_kobject, kobj);
> > +
> > +	kfree(cma_kobj);
> > +}
> 
> Oh, wait.. I think this kfree wrong since cma_kobj belongs to the array.

Oh, good spot. Let me use kzalloc.
