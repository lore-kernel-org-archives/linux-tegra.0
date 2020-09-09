Return-Path: <SRS0=dOwp=CS=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA4C6C43461
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Sep 2020 00:07:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7103021556
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Sep 2020 00:07:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KFXFjZSA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbgIIAH5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 8 Sep 2020 20:07:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726560AbgIIAHx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 8 Sep 2020 20:07:53 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9C47C061573
        for <linux-tegra@vger.kernel.org>; Tue,  8 Sep 2020 17:07:52 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id k25so1209822ljk.0
        for <linux-tegra@vger.kernel.org>; Tue, 08 Sep 2020 17:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gFlcAAsDYlhs7hF5vV+AU7U0ApBxXIpeXIiSma9GXmk=;
        b=KFXFjZSAwXE0q9Mf2nmdqQWHJH9yT8mLauIcyuKKYvLZdcJY1hun5ldhzItg637iZ7
         habRQQmIX8WufQWFOpy8/y82FWcRofi+dE3zjC4V/It7rpimTsjzTcITNCr1S5qD9pCG
         LCyAuFM0kEc0Hy/hy4ndmx0u7fnThZTQdgkCIwpQkuy9vmLB72EleN+gRA1hyD6VY9UZ
         C/NZnhxwQGVhFbDOYs0eAHSNMR7kaFhJOuX9hzeNHC024T5zlz0mlTrUqSgspTI1d0U+
         JoelaK/TIni03vcq9KSSpeRa4ynx29eGmrcZ5JQrq6xMV2wGk9uhTybrsKGmbAKvwwuE
         K4OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gFlcAAsDYlhs7hF5vV+AU7U0ApBxXIpeXIiSma9GXmk=;
        b=lmx1ISpTxjl2EE2+H1sMde0Iu2NaOA5MCl+depLDuFu+bacQHOwkCg2+/1PwZqDWIA
         JKa548usctAlutpuL22hd4FEjfdGFa6ihmwfLgNF5vgAo+EFYRMzJ6Zo3ePOgdKRtl5r
         8iVKhWkWB+MmRW5QbAbSBOeKXfNxVpaR3SzTHIxrRcrigyb38ArSDP3xKHpH623XZP9D
         tQXJ9rhXXebT5LzqUsXUMG3dt/A6WBm+6fweNEbWZV9a3DwqXjbJxSnT4dgYl2KeOXjD
         +BTVOJjtgHpBAebZCFewZCrtWQ1ny9xNvi8Jp7uchFkLD9/FKlKyhne7Py2qQ87vH5me
         H3GA==
X-Gm-Message-State: AOAM531mDE251IaLAO1iS7ooALaKd7sz8tAGADvkwU0A4hMx1+OkXH6J
        liF67TISKvRZDRFcKHJxE/o=
X-Google-Smtp-Source: ABdhPJz/xD8b9NGav1Lg2Hmb7hJrJfoV9dAA/XK3ByW07jPq1QnTEGtLf8Hlca4oVxUarL2oa/b4AA==
X-Received: by 2002:a2e:b00e:: with SMTP id y14mr441571ljk.427.1599610071177;
        Tue, 08 Sep 2020 17:07:51 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id 78sm212252lfn.20.2020.09.08.17.07.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2020 17:07:50 -0700 (PDT)
Subject: Re: [RFC PATCH v2 06/17] gpu: host1x: Cleanup and refcounting for
 syncpoints
To:     Mikko Perttunen <cyndis@kapsi.fi>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-7-mperttunen@nvidia.com>
 <913a625c-9630-92af-aba0-fdddf6bbdb29@gmail.com>
 <e9cce9d5-1a63-077e-1ca6-ac5d5112d5fe@kapsi.fi>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a7213cd6-3bba-95a2-1f88-b8a64a5c2e87@gmail.com>
Date:   Wed, 9 Sep 2020 03:07:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e9cce9d5-1a63-077e-1ca6-ac5d5112d5fe@kapsi.fi>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

05.09.2020 17:53, Mikko Perttunen пишет:
...
>> Hello, Mikko!
>>
>> What do you think about to open-code all the host1x structs by moving
>> them all out into the public linux/host1x.h? Then we could inline all
>> these trivial single-line functions by having them defined in the public
>> header. This will avoid all the unnecessary overhead by allowing
>> compiler to optimize the code nicely.
>>
>> Of course this could be a separate change and it could be done sometime
>> later, I just wanted to share this quick thought for the start of the
>> review.
>>
> 
> Hi :)
> 
> I think for such micro-optimizations we should have a benchmark to
> evaluate against. I'm not sure we have all that many function calls into
> here overall that it would make a noticeable difference. In any case, as
> you said, I'd prefer to keep further refactoring to a separate series to
> avoid growing this series too much.

The performance difference doesn't bother me, it should be insignificant
in this particular case. The amount of the exported functions is what
makes me feel uncomfortable, and especially that most of those functions
are trivial.

My concern is that doing cleanups of the upstream drivers usually not
easy. Hence it could be a good thing to put effort into restructuring
the current code before new code is added. But at first we need to have
a full-featured draft implementation that will show what parts of the
driver require refactoring.
