Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3392C433C1
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Mar 2021 18:59:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7DE1161979
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Mar 2021 18:59:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229996AbhCSS70 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 19 Mar 2021 14:59:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230186AbhCSS7L (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 19 Mar 2021 14:59:11 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7E26C06174A;
        Fri, 19 Mar 2021 11:59:10 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id m12so11571447lfq.10;
        Fri, 19 Mar 2021 11:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8ELWO0rVxFoEW/cBhQY2SU43VC88bV8HiGiltIwNbNU=;
        b=WSoSWgPZfb6wMXT11SchmcKZBcjgH73N/Lbq4btmZ0Shz9AF5WurjtECp2zeUeXV/U
         khxjCywE5IlWSlzB+Z+W1UGdhapRnGBi10RNB74adftfCDJH9WmB5hWAUi+ViH9igQPa
         oKgxRfeJcsMknIqpd6kAPSHBYrAfMGkQUggG7x5gb/hLdC51f9F0WDCAIOCzDEwr6c8s
         qMEHkbpN3mulJZALdlMb1gCgzdBmS8K0XQqrUD+vteA5cato+QOfmd4E4S7ZmLFbAHSw
         TXGgfa+W8F5mqI/V/mGxgg68Kkf73FtdcLI317F2ZT4JLuGfDVLHGhba0c5CyBvmaw9R
         dEDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8ELWO0rVxFoEW/cBhQY2SU43VC88bV8HiGiltIwNbNU=;
        b=bNXKEdbxKRFOzJ2lDvCPz/T1ucNqEzf5IDQVpxinb14tHMB93viRbUZ8E4oZVwEEUQ
         C0Fi/NQ7xyewonXF3h59VY85nnROYkYd/hGdHR5Dkk87u15pDHKM3KHZBuMy0KWxx525
         SHCFBp4++h8n3LvsT1UDmmNrd9MZ4XXpJLr9wOA4gnJIBHraawHwO8SAlO28jW/FbjCq
         i8RxXlGniOoZilUI6HJq9D3HQZ3gy9nOyRcit8/JXye+o0yK348rufu0Kn6IcBF4EBmX
         GoxZzs5Agk/zZM1/cQd/zACPgdlYxmA9GE0eAvaUrsHfLsSmoYlSWdVu0vSxZcJ6CaEm
         Fzkw==
X-Gm-Message-State: AOAM5324MNeGUD2ZFRifUPgmqJ4O96coEWkcEYDWSYvc3k9Dmg76YFGD
        uBqYZuuICowt9MkNKKJJt45F41nI6W0=
X-Google-Smtp-Source: ABdhPJw8v0oEhuDJ520G3SV0TRU+uI+6hLIpfSKS9xMSBcDku1/MTCCrwStY9n0G+orUdsEfAsedmQ==
X-Received: by 2002:a19:ee16:: with SMTP id g22mr1571911lfb.513.1616180349313;
        Fri, 19 Mar 2021 11:59:09 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.googlemail.com with ESMTPSA id x4sm876461ljj.91.2021.03.19.11.59.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Mar 2021 11:59:09 -0700 (PDT)
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
References: <b3cfe38f-bfd0-043a-6063-f5178d4a9b09@gmail.com>
 <YFSrgfAyp+dYWi7k@kroah.com> <33ec18ef-8652-643a-1a53-ff7c3caf4399@gmail.com>
 <c61e58ca-6495-fd47-0138-5bbfe0b3dd20@gmail.com> <YFS06OLp70nWWLFi@kroah.com>
 <78883205-e6da-5bc4-dcec-b6eb921567b1@gmail.com> <YFTITw73Wga0/F0V@kroah.com>
 <72db59eb-75dc-d1ed-7a83-17052e8f22a8@gmail.com>
 <YFTRkBEr5T37NFpV@google.com>
 <82bde114-60c0-3fde-43f4-844522b80673@gmail.com>
 <YFTq/nhQaeNSWPWs@google.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <6bc141d2-ca07-7f03-c306-683f0f630605@gmail.com>
Date:   Fri, 19 Mar 2021 21:59:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YFTq/nhQaeNSWPWs@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

19.03.2021 21:18, Minchan Kim пишет:
>>> +	if (ZERO_OR_NULL_PTR(cma_kobjs))
>>> +		goto out;
>>> +
>>> +	do {
>>> +		cma = &cma_areas[i];
>>> +		cma->kobj = &cma_kobjs[i];
>> Does cma really need are pointer to cma_kobj?
> Do you mean something like this?
> 
> struct cma {
> 	..
> 	..
> 	struct kobject *kobj;
> };
> 
> Then, how could we we make kobject dynamic model?
> 
> We need to get struct cma from kboj like below.
> 
> static ssize_t alloc_pages_success_show(struct kobject *kobj,
>                                         struct kobj_attribute *attr, char *buf)
> {
>         struct cma_kobject *cma_kobj = container_of(kobj,
>                                                     struct cma_kobject, kobj);
>         struct cma *cma = cma_kobj->cma;
> 
>         return sysfs_emit(buf, "%llu\n",
>                           atomic64_read(&cma->nr_pages_succeeded));
> }
> 
> So kobj should be not a pointer in the container struct.
> Am I missing your point? Otherwise, it would be great if you suggest
> better idea.

I meant that cma_kobj->cma is okay, but cma->kobj wasn't really used
anywhere since struct cma can't be released. I.e. we could write
kobject_put(&cma->kobj->kobj) as kobject_put(&cma_kobjs[i].kobj);

But since we won't use the array anymore and maybe will get back to use
the cma_stat, then it will be fine to add the pointer.
