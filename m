Return-Path: <SRS0=wB+u=CT=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B124C433E2
	for <linux-tegra@archiver.kernel.org>; Thu, 10 Sep 2020 21:57:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2C52B20719
	for <linux-tegra@archiver.kernel.org>; Thu, 10 Sep 2020 21:57:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G1eGHB4N"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725779AbgIJV5t (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 10 Sep 2020 17:57:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725785AbgIJV5j (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 10 Sep 2020 17:57:39 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56CF8C061573
        for <linux-tegra@vger.kernel.org>; Thu, 10 Sep 2020 14:57:38 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id k25so10118566ljg.9
        for <linux-tegra@vger.kernel.org>; Thu, 10 Sep 2020 14:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jpYDX2OjS7paAMEd9EjcA05DN6iDvcdY5rzCc83mWx4=;
        b=G1eGHB4NEkb59dJz2WYINX4Ex2JzL4QmyUd/4++h7e2gluJ5F/pmxfkLgppuemfPjK
         dSraaDOIs041+gggf4l07sgYex0Zpr442DCmACpv+gb01iul+tXraQ5rePu9yaOLXzv6
         fjbZ1ZfEqF8JJg78C+inRz5PZtYOwHhR4hHwgKRbbScVS6VBNdKbe4SzizufMvrchXJa
         K9DXkzpW4uRj/kdSneing6lxZq0a000nax6SCohlYwdNlGe/z2XajO0e/0+Mk4d2XgV4
         2+XBiNd/niBaV1IGiSKTWQe0UqhktixdCxD7H9QM6X/pvyur5UbEcQFNUOXyeDXIucSw
         mizw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jpYDX2OjS7paAMEd9EjcA05DN6iDvcdY5rzCc83mWx4=;
        b=l5l2PLOsVvNTadAN0bQ2deHWAFwVlzM21i+tsoYOz7wMDlJDGMoVhf/ZQEHBJUAWYW
         OIbZ0kcoHIIjx3SiB/cPETjj5zrOJkCAWTgnn+YusWyFk8JHmoidsjQ/uu3Vn48uut7Y
         dQ09WstPJYpkA3wNPfOv8wXwKZwHAc8Oa2Xii6GS06yN6MtnM5CdJY9FmNNGjyVWMJpI
         3varWR6eFO47uduQD34qcTOa84aeIg3cukTZt1Lxes0WnlbRh2oN1yc3NuZnn8IN1U8e
         /uJ+eKw5Tdl8awbyiignivUk6y2n4kvJ9n9BuDRUdCouAFr9+JsVoGdWAy6KQn++7ryk
         pm1g==
X-Gm-Message-State: AOAM533wZeeEq7NTutRoUR3nMsf5iN1PNWNG6pOPHnfuPsj62nGO5XjK
        tNj02tB7CtOWFhdbtsuYFzM=
X-Google-Smtp-Source: ABdhPJwEZOeIwmXX8f7KVk4QSSgpS1qoF8EPcLgSkPwTXpEeQpN55vuQeq7sNqL63ShVf7UprJwIuQ==
X-Received: by 2002:a2e:7119:: with SMTP id m25mr5894867ljc.365.1599775056494;
        Thu, 10 Sep 2020 14:57:36 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id g6sm23030lfh.18.2020.09.10.14.57.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2020 14:57:35 -0700 (PDT)
Subject: Re: [RFC PATCH v2 17/17] WIP: drm/tegra: Implement new UAPI
To:     Mikko Perttunen <cyndis@kapsi.fi>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-18-mperttunen@nvidia.com>
 <11c05ff2-092b-dc40-73a9-c0ec0fa22826@gmail.com>
 <3b3b7d35-e96c-1b6e-ddd0-24fd8a9dd5bf@gmail.com>
 <6d317f3f-51c8-6ed5-0a27-00e72f204941@kapsi.fi>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <dba5e023-23d5-7e8a-f45e-bf41abf66ef6@gmail.com>
Date:   Fri, 11 Sep 2020 00:57:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6d317f3f-51c8-6ed5-0a27-00e72f204941@kapsi.fi>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

09.09.2020 11:36, Mikko Perttunen пишет:
...
>>
>> Does it make sense to have timeout in microseconds?
>>
> 
> Not sure, but better have it a bit more fine-grained rather than
> coarse-grained. This still gives a maximum timeout of 71 minutes so I
> don't think it has any negatives compared to milliseconds.

If there is no good reason to use microseconds right now, then should be
better to default to milliseconds, IMO. It shouldn't be a problem to
extend the IOCLT with a microseconds entry, if ever be needed.

{
	__u32 timeout_ms;
...
	__u32 timeout_us;
}

timeout = timeout_ms + 1000 * timeout_us;

There shouldn't be a need for a long timeouts, since a job that takes
over 100ms is probably too unpractical. It also should be possible to
detect a progressing job and then defer timeout in the driver. At least
this is what other drivers do, like etnaviv driver for example:

https://elixir.bootlin.com/linux/v5.9-rc4/source/drivers/gpu/drm/etnaviv/etnaviv_sched.c#L107
