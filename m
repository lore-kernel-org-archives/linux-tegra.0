Return-Path: <SRS0=wB+u=CT=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90F1AC2D0E1
	for <linux-tegra@archiver.kernel.org>; Thu, 10 Sep 2020 21:59:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 56525208E4
	for <linux-tegra@archiver.kernel.org>; Thu, 10 Sep 2020 21:59:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N+EdAMcE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725869AbgIJV7k (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 10 Sep 2020 17:59:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725867AbgIJV7S (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 10 Sep 2020 17:59:18 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3558FC061573
        for <linux-tegra@vger.kernel.org>; Thu, 10 Sep 2020 14:59:17 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id k25so10195979ljk.0
        for <linux-tegra@vger.kernel.org>; Thu, 10 Sep 2020 14:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=P0Za68nuyfi22NrUP0ghwmTHXjnpe+uzTnxMmdI4ak8=;
        b=N+EdAMcEjkQ4+TOlFDUb1m5uXnHnMmR+Ft57lSMvtCUzDQFjt9e/KPpcDUeVpr1gkZ
         CgVhPeuKxFc2q5cUKAsASkfUHoDjxH00M9uo1GUcWEAAAOHpJIzR4aLZiWa7tUXMaogO
         sxLYJiJCe1JK1qL9+VkM6o8LO6gxziOxFC6Mx1lgOjIubo7HDzZ5Ux5p0soPYzoaxD9r
         ZmbhadGURZ02J1rl3Rgu8/aW8sVDWJbgGF9YLO9mAO7QwcfH+akzSRiClk19+TjXGbgr
         DnTXHG3H88jNrUckYzU0toPmLwd6Befx1apqk1uVOn7qccp2TtJD57kJMxbTqY/c7nJ7
         d2hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=P0Za68nuyfi22NrUP0ghwmTHXjnpe+uzTnxMmdI4ak8=;
        b=n2qplyhr+H4NmEovIiqf0BBcKxEn3dArAYbXBXMi/UhKi/SXcJbmv+p33d500Ock0H
         sQTmUcr/fZ0taxyQqnZSfYrkNR94wWsFVy1lSVvXTwYrl2daknsJ7/6/fNuFk42gT4ua
         PfM4lUCRrz239MMbPRCvPfEd4HvEvXLVuiUiCdZ94WRE6oAZtSfqm2YbWiz8pKJMdIZ+
         0gHE62z1RR9tx0+PL/FHmSXXCr/Lubg1y2cLeq/LSZglW7B1Q0QAjTWdEHK538MiutOq
         B/vcCu5CXenR7mi2KZQsbzz/dakE+aCd9eoOKqeZC7HVzkXAtha7XSu3X0G9JARbOKEo
         +oBA==
X-Gm-Message-State: AOAM531RJRRHHDAkPe81POtvYc5U/QantOugZMBMiOttG4jSWXYNvNkE
        uu4iMMz8X9qLHE+46m4815E=
X-Google-Smtp-Source: ABdhPJzDUM/L8dQLJ/z3JpaVqgpJ3/CigX4aAMEfraLDM5pMbv9KNzqIbcFb5aMAgrsBKGASVurDOw==
X-Received: by 2002:a05:651c:1248:: with SMTP id h8mr5973891ljh.225.1599775155681;
        Thu, 10 Sep 2020 14:59:15 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id g15sm58791ljj.39.2020.09.10.14.59.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2020 14:59:15 -0700 (PDT)
Subject: Re: [RFC PATCH v2 17/17] WIP: drm/tegra: Implement new UAPI
To:     Mikko Perttunen <cyndis@kapsi.fi>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-18-mperttunen@nvidia.com>
 <a238707e-942b-2996-5644-71811d4cee72@gmail.com>
 <80bfc415-a7b1-829f-3ce0-c81111ed1f19@kapsi.fi>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <105833f7-b63b-89a9-04b5-4421a087b21a@gmail.com>
Date:   Fri, 11 Sep 2020 00:59:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <80bfc415-a7b1-829f-3ce0-c81111ed1f19@kapsi.fi>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

09.09.2020 11:19, Mikko Perttunen пишет:
...
>>> +    if (!job_data->used_mappings)
>>> +        return -ENOMEM;
>>> +
>>> +    for (i = 0; i < args->num_bufs; i++) {
>>> +        copy_err = copy_from_user(&buf, user_bufs_ptr+i, sizeof(buf));
>>
>> Whole array always should be copied at once. Please keep in mind that
>> each copy_from_user() has a cpu-time cost, there should maximum up to 2
>> copyings per job.
>>
> 
> OK. BTW, do you have some reference/numbers for this or is it based on
> grate-driver experience?

I had numbers about 2 years ago while was profiling job submission
latency using host1x-tests and for a simple jobs there was a visible
difference caused by each copy_from_user(), kmalloc() and having
firewall functions uninlined.

Of course it wasn't critical, but it's also not difficult to optimize
such things.
