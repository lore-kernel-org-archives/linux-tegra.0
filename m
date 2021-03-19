Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A940DC433DB
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Mar 2021 16:25:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8247561986
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Mar 2021 16:25:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230009AbhCSQYe (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 19 Mar 2021 12:24:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230136AbhCSQYJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 19 Mar 2021 12:24:09 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC4F3C06174A;
        Fri, 19 Mar 2021 09:24:08 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id x28so10886183lfu.6;
        Fri, 19 Mar 2021 09:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=aiocf0WxxanLqyRsSiGwW/7Cm4F3BhhRyAtMPi0R2vI=;
        b=TzaZNCAAXCckxX0tMM0aaFF37YOMh9ipM3hGGzyTS6/K8X/SSQXu+Bk/VebuEH93n1
         Tnjx5y69x4EQ0UqkqqUleADJcmpGcCsHW47Q+AXgQ6MGO6zn5REYobBHlYJ55bYZJNus
         g+siIdV9udUhO6akT178HZUdnyJIZoazUYR+4bT5oINQfn4t+0i+VLjvg9UH/N/4Rbch
         eSTTuo2x9t/tkuuiOUbXSijKAfkcEN4Hzk9ckkeQiFhj+FhBJ9mlOmbScDX70l9liNOh
         G1H3W8IFG0AeY2C/JsUvUwlH49YWsNBkeyiuDMGoQwe0k6TOgLGIepEYikU0+sVI7t8E
         YqGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aiocf0WxxanLqyRsSiGwW/7Cm4F3BhhRyAtMPi0R2vI=;
        b=CT8Im1yftsPLOocunJkAIxzv/saD/WyZI0YMzLsYT6S+E9LbSve8AnlGEmEs2TPYKw
         WusJda7HRBMqE56IaKMrOK7GqUmwMvkkv7im+eAB8054NBBHIJsZYCfJvCayDBo6uEQ/
         bzeT2PApeyw1SQKDgLFk9oMXpdTWzKMqNdPLvbw6dYDUVnI6d3UqjPV1DtMBth9xO6gp
         fMKZD8MR/cXyaGv6Gk+phmrGuIKg5gfHU+V5PEIiH0Hvk4iGsLAiQeCJCRfwJx5/gnei
         JqBBjgxPIEytzAxld/JxXZhQrb/PkinIqNlZKQy/fJ4l/1kmVs9uVrpWC66g/Krsasxc
         dheg==
X-Gm-Message-State: AOAM532H7Ms3iV/I6+qo+FfoAIdmjXcc1axx80TSHxuohLtRRE+tazXh
        WmbhrJTWKT+EwP5aiPhUCuasHwh891Y=
X-Google-Smtp-Source: ABdhPJyg/QM5zj5H1K/MnoEQ2/ZteQPsrgY5N44yLteTttmCFU6BVWLteS2RGoE4OXc0kiOFYakySw==
X-Received: by 2002:ac2:4472:: with SMTP id y18mr1246047lfl.332.1616171047070;
        Fri, 19 Mar 2021 09:24:07 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.googlemail.com with ESMTPSA id i3sm828675ljj.82.2021.03.19.09.24.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Mar 2021 09:24:06 -0700 (PDT)
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
 <78883205-e6da-5bc4-dcec-b6eb921567b1@gmail.com> <YFTITw73Wga0/F0V@kroah.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <72db59eb-75dc-d1ed-7a83-17052e8f22a8@gmail.com>
Date:   Fri, 19 Mar 2021 19:24:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YFTITw73Wga0/F0V@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

19.03.2021 18:50, Greg Kroah-Hartman пишет:
>> Then initialization order won't be a problem.
> I don't understand the problem here, what is wrong with the patch as-is?

The cma->stat is NULL at the time when CMA is used on ARM because
cma->stat is initialized at the subsys level. This is the problem,
apparently.

> Also, watch out, if you only make the kobject dynamic, how are you going
> to get backwards from the kobject to the values you want to send to
> userspace in the show functions?

Still there should be a wrapper around the kobj with a back reference to
the cma entry. If you're suggesting that I should write a patch, then I
may take a look at it later on. Although, I assume that Minchan could
just correct this patch and re-push it to -next.
