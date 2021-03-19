Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1B34C433E0
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Mar 2021 13:46:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 674FA64EEE
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Mar 2021 13:46:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229805AbhCSNpt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 19 Mar 2021 09:45:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230090AbhCSNp1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 19 Mar 2021 09:45:27 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEA7FC06174A;
        Fri, 19 Mar 2021 06:45:23 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id o10so10074357lfb.9;
        Fri, 19 Mar 2021 06:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CrdgYAIit68h21frWi2ZVer6TtigI0fqgyoc16zz0Io=;
        b=tPYUzv/xKUBsLh1NGzoqXhfQNLyRmfQwj+tNEcLeIWzPjq8lyGlFyU2N6kNXfOWeNd
         fsHjXQcSb3ZzbXGLkE33Ss+nH3TbSLhYlzooJ36/3ieWbrdfBH1W5NjW19wXZix4AqUp
         2knS9YwX9CLH0TyETD/A/9OH+/YGC3I/Ii35TIATWMkAlSS0CNfKfK6CUiKiYWrFfTCh
         Dx8PHQjZzq+HdawjImlYY6XXXC1anpHlb2SmhFWnX/uxnuLaTCoDBfWNZ0H2LdUXDFfd
         km94tay1J/6VU08qGbnKILB752/apws1Sf+ZzmbjhKf6sZqGE14bmjyO2uKVjvM0dHi6
         VqwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CrdgYAIit68h21frWi2ZVer6TtigI0fqgyoc16zz0Io=;
        b=ntxYJpjoAvzgKwk91stuP1iRybeNBW6NCZNZcuA59ac2ipjhHFIfd12xEg6NIk9oAN
         RS05OviPB/1iV3EpGykdf3hBmClernlu/My2//G+qhbXU1cURiIn2SYt4vSq/IqYRvDz
         sqaC94b2+hhSIaOVyRusMZXo7TRCjB5nLF5JjPZTt/YbDbuz9J7onJMtNSJnmZjtMXwV
         ft3v2NZvcSqL21ZzGqzpqrBkoIqz4yABvlJtOUZ/HOgF3utuVWUNWFnZoNZ36ut3HdCv
         Ii+4YjdjLKBs6DvrBKuHJeaNg/cfyBYMMRxgMPpffT/Yu4Iii3dKFaIYdcqDYjaps70m
         1hkQ==
X-Gm-Message-State: AOAM531Wx7roO+M9DZFno6/RYk2Kmw/S21T82MDFzz5Lim6SkLPR2CA7
        3s2gMmjgKYpik1+0HEcr9albZ59uidk=
X-Google-Smtp-Source: ABdhPJxfx9OTueeAe3Wr0OSGXEVnA61+I9fHIrcN6kyLmBD7u4yIyDFTFFqfxSUAO6+5AQ5NI81poA==
X-Received: by 2002:ac2:4c8c:: with SMTP id d12mr894834lfl.1.1616161522150;
        Fri, 19 Mar 2021 06:45:22 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.googlemail.com with ESMTPSA id h17sm631164lfc.289.2021.03.19.06.45.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Mar 2021 06:45:21 -0700 (PDT)
Subject: Re: [PATCH v4] mm: cma: support sysfs
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Minchan Kim <minchan@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-mm <linux-mm@kvack.org>,
        LKML <linux-kernel@vger.kernel.org>, joaodias@google.com,
        willy@infradead.org, david@redhat.com, surenb@google.com,
        John Hubbard <jhubbard@nvidia.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20210309062333.3216138-1-minchan@kernel.org>
 <fead70a2-4330-79ff-e79a-d8511eab1256@gmail.com>
 <e8ae901d-9521-8de4-ee45-18cb55b8f29c@gmail.com> <YFSqYUfaxMajR/aq@kroah.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b3cfe38f-bfd0-043a-6063-f5178d4a9b09@gmail.com>
Date:   Fri, 19 Mar 2021 16:45:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YFSqYUfaxMajR/aq@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

19.03.2021 16:42, Greg Kroah-Hartman пишет:
> On Fri, Mar 19, 2021 at 04:39:41PM +0300, Dmitry Osipenko wrote:
>> 19.03.2021 15:44, Dmitry Osipenko пишет:
>> ...
>>>>  #include <linux/debugfs.h>
>>>> +#include <linux/kobject.h>
>>>> +
>>>> +struct cma_stat {
>>>> +	spinlock_t lock;
>>>> +	/* the number of CMA page successful allocations */
>>>> +	unsigned long nr_pages_succeeded;
>>>> +	/* the number of CMA page allocation failures */
>>>> +	unsigned long nr_pages_failed;
>>>> +	struct kobject kobj;
>>>> +};
>>>>  
>>>>  struct cma {
>>>>  	unsigned long   base_pfn;
>>>> @@ -16,6 +26,9 @@ struct cma {
>>>>  	struct debugfs_u32_array dfs_bitmap;
>>>>  #endif
>>>>  	char name[CMA_MAX_NAME];
>>>> +#ifdef CONFIG_CMA_SYSFS
>>>> +	struct cma_stat	*stat;
>>>> +#endif
>>
>> What is the point of allocating stat dynamically?
> 
> Because static kobjects make me cry.
> 

I meant that it's already a part of struct cma, it looks like the stat
could be embedded into struct cma and then kobj could be initialized
separately.
