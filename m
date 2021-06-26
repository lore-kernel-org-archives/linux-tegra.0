Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18539C2B9F4
	for <linux-tegra@archiver.kernel.org>; Sat, 26 Jun 2021 01:32:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DE73161973
	for <linux-tegra@archiver.kernel.org>; Sat, 26 Jun 2021 01:32:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229956AbhFZBfL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 25 Jun 2021 21:35:11 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:5081 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229889AbhFZBfL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 25 Jun 2021 21:35:11 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.57])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GBbpG09ggzXlCG;
        Sat, 26 Jun 2021 09:27:34 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sat, 26 Jun 2021 09:32:47 +0800
Received: from [127.0.0.1] (10.174.179.0) by dggpemm500006.china.huawei.com
 (7.185.36.236) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Sat, 26 Jun
 2021 09:32:47 +0800
Subject: Re: [PATCH 1/1] clk: tegra: tegra124-emc: Fix possible memory leak
To:     Stephen Boyd <sboyd@kernel.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>
References: <20210617082759.1008-1-thunder.leizhen@huawei.com>
 <162466387362.3259633.2364843071785127818@swboyd.mtv.corp.google.com>
From:   "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <a6f88419-2cb9-0717-7737-e4666cdcc211@huawei.com>
Date:   Sat, 26 Jun 2021 09:32:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <162466387362.3259633.2364843071785127818@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.0]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500006.china.huawei.com (7.185.36.236)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 2021/6/26 7:31, Stephen Boyd wrote:
> Quoting Zhen Lei (2021-06-17 01:27:59)
>> When krealloc() fails to expand the memory and returns NULL, the original
>> memory is not released. In this case, the original "timings" scale should
>> be maintained.
>>
>> Fixes: 888ca40e2843 ("clk: tegra: emc: Support multiple RAM codes")
>> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
>> ---
> 
> Looks correct, but when does krealloc() return NULL? My read of the
> kerneldoc is that it would return the original memory if the new
> allocation "failed".

That must be the wrong description in the document. For example, the original
100-byte memory needs to be expanded to 200 bytes. If the memory allocation fails,
a non-null pointer is returned. People must think they've applied for it and
continue to use it, the end result is memory crashed.

I don't think the kernel needs to be different from libc's realloc().

The implementation of __do_krealloc() illustrates this as well:
        /* If the object still fits, repoison it precisely. */
        if (ks >= new_size) {
                p = kasan_krealloc((void *)p, new_size, flags);
                return (void *)p;
        }

        ret = kmalloc_track_caller(new_size, flags);			//enlarge, allocate new memory
	if (ret && p) {
                memcpy(ret, kasan_reset_tag(p), ks);			//copy the old content from 'p' to new memory 'ret'
        }

	return ret;							//ret may be NULL, if kmalloc_track_caller() failed



> 
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> 
> .
> 

