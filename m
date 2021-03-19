Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36623C433E0
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Mar 2021 17:45:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 042816197E
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Mar 2021 17:45:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229991AbhCSRoi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 19 Mar 2021 13:44:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229974AbhCSRoM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 19 Mar 2021 13:44:12 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCA7DC06174A;
        Fri, 19 Mar 2021 10:44:11 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id f3so2899542lfu.5;
        Fri, 19 Mar 2021 10:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gq4UIk+ByEdA/Jn9oEYE7L3pIna4OdrooJuJgf5IZnk=;
        b=uMS9Ttr4YOy2CbXHUE4FhhR3hZMFun1WDEUYtrYbtMLHcT++dD6nYgKvBT2ZR/PByh
         cudf3+Zx7IO6Z/V2yjkIBkBasjdD/zcGulHderIjLybhn1jWEEvotzkxN9jDEw5NMyc9
         s0CwM5LXfynfaj7Ij8eoqJLRt2dO7x/z4K915KJr6Qfz0eqBj0qcELhCVR13BMx5yUvq
         yyFvqUwAQ+EaxFWPjnM5u1Pz4s5pln+2AhrKTVfsxmvK2SaY1fTWZ8mhAD2OjPU0kwVM
         vNdvmMOVXhTxPZNx/Dc0JiyaUx50MzUOnYU/nCt/V6C/QpinpgReJ9LFVnmlVIRdjZOx
         PRvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gq4UIk+ByEdA/Jn9oEYE7L3pIna4OdrooJuJgf5IZnk=;
        b=WvY8vU9XA995aHQP7ReOuoQjfK4C+A6r01G0HEkLUd4Z2tMGRc/btprdH6zrsLwmOM
         KopIeBJnOz7/5i/QYExPrG3CUqPof7ll0xDnCbw5CVMeQPnpuQnpsC2Mbc8rx4FC3Tvh
         2XEyHxf3Hlyvsn45SgpVrWR1ILGiTX9RpspIWclg/RjZ1A1Jkp0Uw79P2a20qMlAqIru
         HYIUehVkdx6hxDqBe42cFOcce+8yapZLYrpxQg8bEt7Kmji9dNYm3Qj8VYvdr/RmkqXZ
         hJ7j4JrstWin1TU8gK+PuVieLzI/Cdaax13a1OUpHgjxaSg8YgZbtKSkaPyyc6X/HE67
         8QPg==
X-Gm-Message-State: AOAM5310mbq6sfnVPPJaLlmkJ1Y0BlB+LNNsIl0CE7ISZVpO5GRYSX5b
        1V/FELO+iiEugs4u8o51jwlWJzRP5Yk=
X-Google-Smtp-Source: ABdhPJw2DmuYYVAqrwygwCq3lofBMOROw4yRj8tSgDsg18peqRXYn+0/Jyf1Y/OhtXfh6VB/SOWB0A==
X-Received: by 2002:ac2:53a1:: with SMTP id j1mr1472374lfh.298.1616175850302;
        Fri, 19 Mar 2021 10:44:10 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.googlemail.com with ESMTPSA id a1sm698495lfh.142.2021.03.19.10.44.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Mar 2021 10:44:10 -0700 (PDT)
Subject: Re: [PATCH v4] mm: cma: support sysfs
From:   Dmitry Osipenko <digetx@gmail.com>
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
 <82bde114-60c0-3fde-43f4-844522b80673@gmail.com>
 <f451e60c-750f-a6d8-e035-e665391f9261@gmail.com>
Message-ID: <f2187cd5-505b-5274-c2a8-706a9c26aa2d@gmail.com>
Date:   Fri, 19 Mar 2021 20:44:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <f451e60c-750f-a6d8-e035-e665391f9261@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

19.03.2021 20:41, Dmitry Osipenko пишет:
> 19.03.2021 20:29, Dmitry Osipenko пишет:
>> +void cma_sysfs_alloc_pages_count(struct cma *cma, size_t count)
>> +{
>> +	atomic64_add(count, &cma->nr_pages_succeeded);
>> +}
>> +
>> +void cma_sysfs_fail_pages_count(struct cma *cma, size_t count)
>> +{
>> +	atomic64_add(count, &cma->nr_pages_failed);
>> +}
> 
> The atomic looks good, but aren't CMA allocations already protected by
> the CMA core? Do we really need to worry about racing here?
> 

Although, please scratch that. I see now that these functions are called
outside of the lock.
