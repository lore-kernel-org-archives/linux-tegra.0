Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F5C7C433DB
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Mar 2021 15:38:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 512436194D
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Mar 2021 15:38:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229952AbhCSPiU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 19 Mar 2021 11:38:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230002AbhCSPiD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 19 Mar 2021 11:38:03 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4184DC06174A;
        Fri, 19 Mar 2021 08:38:03 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id s17so12519225ljc.5;
        Fri, 19 Mar 2021 08:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Jf57TUyTvZSa9yhzASEEIFzKPdOCKjXIr1XoPSFG8S4=;
        b=QRAIefYIOEXTF4OXlTA0vcyHwbml1t5N2cCxy7cInDOWHksDc5nCuyl9EO/CPG9BvV
         iwlvhSxYy6znZBNlSID/YT0AGej5231j3erF2uZHDfDTMkZCT8m3OaV/Z/caoaKIJ2Fs
         0blij0eTp3zxv1sN5e+bJavnO6P35HOf07XFC9fx6xTjNGQisIX1vQT/6PvlPcB3k8lB
         waSCCJTyTOVVMQFNkIKTtu44Gqr4XSy6sYow5tjL4hfzV4Owu0ZDqWwUU5JzSzmWiWGJ
         r5/l/OKtz9Xb5ctLArl7ay+tWcUsOlPNNynK+RZmpOktiSyBoH6N6dHmNQY/edXZshSp
         fuLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Jf57TUyTvZSa9yhzASEEIFzKPdOCKjXIr1XoPSFG8S4=;
        b=salDvCPiWh7vEty5AecsYO3lcWC8ga9c4sMl+C1HGLnQX5jJ281sVtMnxgQ8DqgXPh
         II3A36A+/Qt7v1rokoj1Ihr3vUiHzBv9xZSgGb5NpG25+xUf3z3jO1GyplrDyjGjeSLZ
         rFlCUp1k/4hAZ+98hPpis9IqfsT820q8M+M3mzFOu5qMEOQgzBo87d8B1SvQhLd4Fa9t
         faaWsyWi3GafLJG+oNBtrNJJo81aGFzBQRHUtUJATqAxr/ejK5yuI0tKRxiTP1nedcjL
         S3kVcmpde9nH8DVH4dcIuTKj7pC1TmQJsIwdPRKoBaCq0cSw60sRuLva5ysgfKPi9fsV
         6yqA==
X-Gm-Message-State: AOAM530y7bt+M8oZbMev7mf2HhJ6qyY+tSs+ym1+f8PA9LFXPaz62CBb
        zrkqf4lIbvf2QOoDa3mKXve126kV21o=
X-Google-Smtp-Source: ABdhPJyNJ2UxFhvxE8ssbsXslj4aTjQFYgwl1mEm71ES6dz0joECt+K7wKPCgEz6BbxPr9msG64/ZQ==
X-Received: by 2002:a2e:b60d:: with SMTP id r13mr1310809ljn.30.1616168281607;
        Fri, 19 Mar 2021 08:38:01 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.googlemail.com with ESMTPSA id f25sm662396lfh.226.2021.03.19.08.38.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Mar 2021 08:38:00 -0700 (PDT)
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
 <b3cfe38f-bfd0-043a-6063-f5178d4a9b09@gmail.com> <YFSrgfAyp+dYWi7k@kroah.com>
 <33ec18ef-8652-643a-1a53-ff7c3caf4399@gmail.com>
 <c61e58ca-6495-fd47-0138-5bbfe0b3dd20@gmail.com> <YFS06OLp70nWWLFi@kroah.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <78883205-e6da-5bc4-dcec-b6eb921567b1@gmail.com>
Date:   Fri, 19 Mar 2021 18:38:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YFS06OLp70nWWLFi@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

19.03.2021 17:27, Greg Kroah-Hartman пишет:
> On Fri, Mar 19, 2021 at 05:19:47PM +0300, Dmitry Osipenko wrote:
>> 19.03.2021 16:51, Dmitry Osipenko пишет:
>>> 19.03.2021 16:47, Greg Kroah-Hartman пишет:
>>>> On Fri, Mar 19, 2021 at 04:45:21PM +0300, Dmitry Osipenko wrote:
>>>>> 19.03.2021 16:42, Greg Kroah-Hartman пишет:
>>>>>> On Fri, Mar 19, 2021 at 04:39:41PM +0300, Dmitry Osipenko wrote:
>>>>>>> 19.03.2021 15:44, Dmitry Osipenko пишет:
>>>>>>> ...
>>>>>>>>>  #include <linux/debugfs.h>
>>>>>>>>> +#include <linux/kobject.h>
>>>>>>>>> +
>>>>>>>>> +struct cma_stat {
>>>>>>>>> +	spinlock_t lock;
>>>>>>>>> +	/* the number of CMA page successful allocations */
>>>>>>>>> +	unsigned long nr_pages_succeeded;
>>>>>>>>> +	/* the number of CMA page allocation failures */
>>>>>>>>> +	unsigned long nr_pages_failed;
>>>>>>>>> +	struct kobject kobj;
>>>>>>>>> +};
>>>>>>>>>  
>>>>>>>>>  struct cma {
>>>>>>>>>  	unsigned long   base_pfn;
>>>>>>>>> @@ -16,6 +26,9 @@ struct cma {
>>>>>>>>>  	struct debugfs_u32_array dfs_bitmap;
>>>>>>>>>  #endif
>>>>>>>>>  	char name[CMA_MAX_NAME];
>>>>>>>>> +#ifdef CONFIG_CMA_SYSFS
>>>>>>>>> +	struct cma_stat	*stat;
>>>>>>>>> +#endif
>>>>>>>
>>>>>>> What is the point of allocating stat dynamically?
>>>>>>
>>>>>> Because static kobjects make me cry.
>>>>>>
>>>>>
>>>>> I meant that it's already a part of struct cma, it looks like the stat
>>>>> could be embedded into struct cma and then kobj could be initialized
>>>>> separately.
>>>>
>>>> But that structure is statically allocated, so it can not be.  This has
>>>> been discussed in the past threads for when this was reviewed if you are
>>>> curious :)
>>>
>>> Indeed, I missed that cma_areas[] is static, thank you.
>>>
>>
>> And in this case should be better to make only the kobj allocated
>> dynamically instead of the whole cma_stat.
> 
> Why does it matter?
> 

Then initialization order won't be a problem.
