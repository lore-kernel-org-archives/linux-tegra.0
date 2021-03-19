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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5519FC433DB
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Mar 2021 14:20:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2227164F4D
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Mar 2021 14:20:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229951AbhCSOTy (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 19 Mar 2021 10:19:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229925AbhCSOTu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 19 Mar 2021 10:19:50 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4008FC06174A;
        Fri, 19 Mar 2021 07:19:50 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id f26so12170540ljp.8;
        Fri, 19 Mar 2021 07:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EskRbslmKbHjaKU+UDZLjwhTtBvfQ+OmXt0bCDAxa3M=;
        b=p+eaF2s28WuIMRbDYf8y4MluzVjXZR3aBo2mauhDZosyMR7QLnkjG/KK+uZNBV6CR+
         CUL2QHPrcm8bERUL53i3zHvUUiW/5DtVoKBPTN++mX1rGaAovgGGcEXDsLKGb2JFDNkA
         U4iypo2QPz94N3txG3DUAsNqBqAgnz1PUyHMJjKrS+8GFmGJJ1GoxbI1dzGOK/igwH0Y
         QGuBdYtvii2L/T4XAXvSgVqYiojO4on/2T5GbzHJ9ClEqPfVicj1mg+bAH37isM7/Y3o
         dc91sk305Y5RwRcg2xjxOvToyLs+1of0uJAGyNyR+0rWER/mIkFtdPTS5NzHS8UVLF87
         xpSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EskRbslmKbHjaKU+UDZLjwhTtBvfQ+OmXt0bCDAxa3M=;
        b=bEestexkZuIAQeEkLQGK8iL6Wifz49bXjivIQr/qy5mnPMUwqk2wWzmBtmsBzekyCX
         1eo4NdKggbTVe235UbNaX17MaY/qqfhuQ7le+7+OOzlRhFtaPloyQRd+BlG2S/9a2in5
         /OfKU+I9g8A1B8onaYNpq58vMfNz6rtX155aMP/WbWkiNN9BivbXf6kzfBhFtpx3IBTz
         Is8SI6TrW34+Q8fuOaKTC5+9BJ1LZ+Jq9Ymbhm3KCgmL/sEy509U5eclymlmh26yTzfG
         6hlaI7lWIKW3epSt16miMgNxfUy8l/Hys7jdG5dsfvhqKY/R51RmYpjF7HRSQDlwRWRc
         5xiw==
X-Gm-Message-State: AOAM530bDLR9AnQ+XtEx5cKlA/QQ7q65KI4l9ChrLMn2+G0m8N49DoV9
        ClIVArujfpfYGTSr97iyjOnzQ3KT7BA=
X-Google-Smtp-Source: ABdhPJwqTDDxWCe02fqFjJYUYMviMZVqHnWf7RSMGz5pKcYWxbA5oMNSEnvi9c/Om1TycF1eDjebvQ==
X-Received: by 2002:a2e:974d:: with SMTP id f13mr1088059ljj.210.1616163588670;
        Fri, 19 Mar 2021 07:19:48 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.googlemail.com with ESMTPSA id i22sm782341ljn.56.2021.03.19.07.19.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Mar 2021 07:19:48 -0700 (PDT)
Subject: Re: [PATCH v4] mm: cma: support sysfs
From:   Dmitry Osipenko <digetx@gmail.com>
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
Message-ID: <c61e58ca-6495-fd47-0138-5bbfe0b3dd20@gmail.com>
Date:   Fri, 19 Mar 2021 17:19:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <33ec18ef-8652-643a-1a53-ff7c3caf4399@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

19.03.2021 16:51, Dmitry Osipenko пишет:
> 19.03.2021 16:47, Greg Kroah-Hartman пишет:
>> On Fri, Mar 19, 2021 at 04:45:21PM +0300, Dmitry Osipenko wrote:
>>> 19.03.2021 16:42, Greg Kroah-Hartman пишет:
>>>> On Fri, Mar 19, 2021 at 04:39:41PM +0300, Dmitry Osipenko wrote:
>>>>> 19.03.2021 15:44, Dmitry Osipenko пишет:
>>>>> ...
>>>>>>>  #include <linux/debugfs.h>
>>>>>>> +#include <linux/kobject.h>
>>>>>>> +
>>>>>>> +struct cma_stat {
>>>>>>> +	spinlock_t lock;
>>>>>>> +	/* the number of CMA page successful allocations */
>>>>>>> +	unsigned long nr_pages_succeeded;
>>>>>>> +	/* the number of CMA page allocation failures */
>>>>>>> +	unsigned long nr_pages_failed;
>>>>>>> +	struct kobject kobj;
>>>>>>> +};
>>>>>>>  
>>>>>>>  struct cma {
>>>>>>>  	unsigned long   base_pfn;
>>>>>>> @@ -16,6 +26,9 @@ struct cma {
>>>>>>>  	struct debugfs_u32_array dfs_bitmap;
>>>>>>>  #endif
>>>>>>>  	char name[CMA_MAX_NAME];
>>>>>>> +#ifdef CONFIG_CMA_SYSFS
>>>>>>> +	struct cma_stat	*stat;
>>>>>>> +#endif
>>>>>
>>>>> What is the point of allocating stat dynamically?
>>>>
>>>> Because static kobjects make me cry.
>>>>
>>>
>>> I meant that it's already a part of struct cma, it looks like the stat
>>> could be embedded into struct cma and then kobj could be initialized
>>> separately.
>>
>> But that structure is statically allocated, so it can not be.  This has
>> been discussed in the past threads for when this was reviewed if you are
>> curious :)
> 
> Indeed, I missed that cma_areas[] is static, thank you.
> 

And in this case should be better to make only the kobj allocated
dynamically instead of the whole cma_stat.
