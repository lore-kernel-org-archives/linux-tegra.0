Return-Path: <SRS0=wB+u=CT=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD932C43461
	for <linux-tegra@archiver.kernel.org>; Thu, 10 Sep 2020 22:15:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8021B208E4
	for <linux-tegra@archiver.kernel.org>; Thu, 10 Sep 2020 22:15:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nOBdnrrM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725308AbgIJWPI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 10 Sep 2020 18:15:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725294AbgIJWPF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 10 Sep 2020 18:15:05 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C23F8C061573
        for <linux-tegra@vger.kernel.org>; Thu, 10 Sep 2020 15:15:04 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id b19so10174385lji.11
        for <linux-tegra@vger.kernel.org>; Thu, 10 Sep 2020 15:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Raxmaoh7OKaV16dqQJzdv854oFz0jczIivRr3ttN/Wg=;
        b=nOBdnrrM2tDd4cZzxU6CZ+rLBVylo7DjL640mbNV6iqlg0Jvz7hls6ktca77bvJi6t
         GI2VFKYHYjegT6m9Bl/BAWZu+A8StL3zhTOt/ftX6YTKHUOa30rJJ9njlI8APR+yjQ/R
         SHsqM3cjMMPAfkJTFjDb96RVmuFKBvEDY9q/gYfo+QntEHkl6CZqzu6kGUJ1ADSzWz0F
         OAr5VYruqD+kqYQOeBp1DZwI9lxaqQinCX5DDbyYWAkPpoc9nxIId7yiyF0VI8c/pqeY
         4/pGeNF5NkM9xbDobivvxCvsjp/lmyjQREZWrEywS8lo68q76qHbYxekdwUyqoY5JfEZ
         86eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Raxmaoh7OKaV16dqQJzdv854oFz0jczIivRr3ttN/Wg=;
        b=j72Wg2KxHBudOC5HKLvYgaItaO1UcrzftYIAVcobV9gLrhsfhy1sQP5ZBxX9r5HABi
         IcCre+7ajrmasTV8Cd01EkiNan08y5XPvWyV6mC1xqIrAoV9NYaA+B8qbpriRoy20JOm
         Oeltfc58KBzwioRSkyjYjtF/JHslEyivvZT+AGujwx6Un0+sycvrOQSf07x3Cs4hMtEK
         ilHzpTlVh4o0AmoeE+XO+z+jl5pbFCb+OYCoOpbuT6CdGHJ5ehOv264v/jZlrsBlMdtq
         +mym/w8UfcX6kEvddXeqQqvw5UXBaz9wtXXbzAErDZ7DELXpW8FwQabApbv6ydkdYXlE
         wvdQ==
X-Gm-Message-State: AOAM5311ybsOgk+GJ5uN1HPBQ/pBnqbz7eU0Laao4x7cQBHiK6AHKBgo
        D+elsUsx9vg5C/8wjX+L4OQ=
X-Google-Smtp-Source: ABdhPJwN8obc5OJsxAvU8E/JWbo+vImVEZnAmvcDkxEiZzVb3hpDHb1DyoIdeUo1Sn9exmAZQgRB4w==
X-Received: by 2002:a05:651c:102c:: with SMTP id w12mr5705354ljm.8.1599776103305;
        Thu, 10 Sep 2020 15:15:03 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id h17sm69385ljj.4.2020.09.10.15.15.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2020 15:15:02 -0700 (PDT)
Subject: Re: DRM_TEGRA_SUBMIT_BUF_WRITE_RELOC
To:     Mikko Perttunen <cyndis@kapsi.fi>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-15-mperttunen@nvidia.com>
 <54aff7f1-86b2-6bd7-1e47-2078edcf94b3@gmail.com>
 <a734a45f-2366-8a9f-1029-c052bd03bf78@kapsi.fi>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <17e24d23-3b1e-44e3-57ca-35721dbd4af2@gmail.com>
Date:   Fri, 11 Sep 2020 01:15:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a734a45f-2366-8a9f-1029-c052bd03bf78@kapsi.fi>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

09.09.2020 11:10, Mikko Perttunen пишет:
> On 9/9/20 2:45 AM, Dmitry Osipenko wrote:
>> 05.09.2020 13:34, Mikko Perttunen пишет:
>> ...
>>> +/* Submission */
>>> +
>>> +/** Patch address of the specified mapping in the submitted gather. */
>>> +#define DRM_TEGRA_SUBMIT_BUF_WRITE_RELOC        (1<<0)
>>
>> Shouldn't the kernel driver be aware about what relocations need to be
>> patched? Could you please explain the purpose of this flag?
>>
> 
> Sure, the kernel knows if it returned the IOVA to the user or not, so we
> could remove this flag and determine it implicitly. I don't think there
> is much harm in it though; if we have the flag an application can decide
> to ignore the iova field and just pass WRITE_RELOC always, and it's not
> really any extra code on kernel side.

Sounds like there is no real practical use for this flag other than for
testing purposes, correct?
