Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09522C433DB
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Mar 2021 19:01:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C351261974
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Mar 2021 19:01:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230259AbhCSTAd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 19 Mar 2021 15:00:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230391AbhCSTAY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 19 Mar 2021 15:00:24 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43440C06174A;
        Fri, 19 Mar 2021 12:00:23 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id u20so13204729lja.13;
        Fri, 19 Mar 2021 12:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=upYBQNguiL04oAnOuIZVoxunH/QGosMTk93Yec7+Rbg=;
        b=T6mohFpQrPvDkTsnbhIZZTClnjt+wgrlDkN7EPqfVoRBeExZ0bweCm5hAVH1lmC5oH
         HfdbvZ3Am39pEy0irud+ZBabpuZ2Rbm0yi70vvi0OllOexkgQljG5ia3UF/M+GK/DhHO
         mgl1gmHh6LVtOVYvxLJ4Bsaj7AI3DygblXtJ6qG6qLuDrNGPvHLIYKPRUlTpT/X4JLRx
         t8GiNDJ0B0kz/Gogayji2Upnhq6uDsrubBhF4FzD84lglW13yusbMcPkk5CVyuBaK+xm
         xXArMEXdb4IcHLWKpjWLBkhsMIrVFd7rup8DGI1Zc+wRYYYwuSgGWMg00h0d88uNAQXp
         PQzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=upYBQNguiL04oAnOuIZVoxunH/QGosMTk93Yec7+Rbg=;
        b=dGiG69PKaD1GO34aachLG74LuxHNNBGBDDjmJyOF6BGn5+nsQPvZP6h1uwyqm42Ynr
         PlRCuEXqrbu7hV6GkeG0jGYgk0lRO9w6ZRI2cB6Ca4/nCeQAb4wgd8o5XdqoXtS7UayV
         Q0r/XSe6q/RxBQrFhrEbzG1pkJSdbK/6sPjZF8w5+suhlaGdhhXs68TwYwD+c7kOnuc2
         xVmj2zKL1/juy6XtlpgD7mCi+1bX5ndrtln3KuaoIr8c4nKU01ezgZwNk9pZqAaqE0fE
         Eq/S1AXgIz08W5YrWq7g9ME4AMkLFXBdrltP3VLO38d7ci6a77JsNiKksaZ0M4yG7H6T
         UFrg==
X-Gm-Message-State: AOAM531XBPvcbMN/la1OJ4c0axGgYDBoEesrMBs3k+T0/vb2G4Qs8fN2
        8jdrrItkeIe8V9+Q+z2WHShUVZOhixk=
X-Google-Smtp-Source: ABdhPJwEHL4qNsfPRyoywMlkjZ69cy0QzZ+Nmm2U/SqQusVLnQuVWolvt/bER/1HMjW/b+LXWHB8/g==
X-Received: by 2002:a2e:98c5:: with SMTP id s5mr1735067ljj.218.1616180421079;
        Fri, 19 Mar 2021 12:00:21 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.googlemail.com with ESMTPSA id f8sm715617lfs.143.2021.03.19.12.00.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Mar 2021 12:00:20 -0700 (PDT)
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
Message-ID: <c255e5d8-d5b3-875b-f162-82d1fa988de2@gmail.com>
Date:   Fri, 19 Mar 2021 22:00:20 +0300
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
>>> +#define CMA_ATTR_RO(_name) \
>>> +	static struct kobj_attribute _name##_attr = __ATTR_RO(_name)
>>> +
>>> +static ssize_t alloc_pages_success_show(struct kobject *kobj,
>>> +			struct kobj_attribute *attr, char *buf)
>> The indentations are still wrong.
>>
>> CHECK: Alignment should match open parenthesis
> Hmm, I didn't know that we have that kinds of rule.
> Maybe, my broken checkpatch couldn't catch it up.
> Thanks.
> 
> $ ./scripts/checkpatch.pl 0001-mm-cma-support-sysfs.patch
> Traceback (most recent call last):
>   File "scripts/spdxcheck.py", line 6, in <module>
>     from ply import lex, yacc
> 
> 
> < snip >
> 

That's probably because I use the --strict option of checkpatch by default.
