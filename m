Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39482C48BE5
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Jun 2021 22:06:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0BC606128B
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Jun 2021 22:06:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229760AbhFOWIM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 15 Jun 2021 18:08:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbhFOWIL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 15 Jun 2021 18:08:11 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54AF7C061574
        for <linux-tegra@vger.kernel.org>; Tue, 15 Jun 2021 15:06:05 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id n17so844360ljg.2
        for <linux-tegra@vger.kernel.org>; Tue, 15 Jun 2021 15:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=osmS7oOq+n4QzI+Xe8pcxuF/br8CTQZxLkSR1NlWykI=;
        b=LIFipo7HWjrpjTL5SlngM5Sw4PgSv9EXCZ+r1OAKtSpzKg6eXPh5manUQcLrP5R8h3
         Kim346TmeSjSJBAtiBTy0DRW+J7TUhiOpXuS/WnTJPHlP603Mg6dwXTKle9BupqcFFKR
         RjGAc+lvruOKIrEre4OK5O5ljMY0IBCtVw78fjeeH3lVUa8IIvWZTP/xrkP1B+0Ny+WK
         9gv5HRq30I+9vMVALapjex177kocXuvV8Xn2r82u1T9nRFfQoXvdjqUsuYeF1Wwsv6mX
         eUD+GSttbb+RltInwOKyrOwy8O7mIHEFHtAEiTbxmzKH/5fFb/8gTFHdahKVkUFGQTR2
         1exA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=osmS7oOq+n4QzI+Xe8pcxuF/br8CTQZxLkSR1NlWykI=;
        b=WKpAVVm4kIcbwMCbRAGrftIQaCoeyO40SLsaIK/WbR/9IzhgR0hWkh6jg3rxg5j0gN
         PuLgAvciNg9yNYYWgwcMV4FXJTH26Hf/6TE5aYdaKm6wglgc4djFbF0mlH+9OFtpgxdN
         oupVo50aXUzONNXP8Fyf3jzpgX1K6lJGZa5s5AFycONgFpzOcdW6NWyss5zJ8qi0qqQh
         YWYa5sMeBGcBgLPe7B1N3hESGdQn8GFlQ5iDInoyjqHebnJF89Sh8YZ6LUKCZ0eOsoNI
         /O/v2R6TGoPPc29+zaqIy9k4qJIAbPCuFyt3Xus69D3y64paSGiYGa2/xAdzJpJioCa4
         +joQ==
X-Gm-Message-State: AOAM533Ml2IAHMltS3kYWeZW3zkzkjsScUIDvLw2179ZgULZsdtbc4zX
        z87zxBdn6Dv+0LT55D7aYSzR8IZvUSo=
X-Google-Smtp-Source: ABdhPJxF8WENCWUuGB9/wevnWgpArKnDPVb/KouYIIa0fHFfdI+u/ZrxZeobdR6LM84WeUXvhPHAiQ==
X-Received: by 2002:a05:651c:1193:: with SMTP id w19mr1556473ljo.264.1623794763571;
        Tue, 15 Jun 2021 15:06:03 -0700 (PDT)
Received: from [192.168.2.145] (94-29-31-25.dynamic.spd-mgts.ru. [94.29.31.25])
        by smtp.googlemail.com with ESMTPSA id g15sm32451lfu.55.2021.06.15.15.06.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jun 2021 15:06:03 -0700 (PDT)
Subject: Re: [PATCH v7 02/15] gpu: host1x: Add no-recovery mode
To:     Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20210610110456.3692391-1-mperttunen@nvidia.com>
 <20210610110456.3692391-3-mperttunen@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <7fc989aa-317a-fedf-b223-fe563da72ff6@gmail.com>
Date:   Wed, 16 Jun 2021 01:06:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210610110456.3692391-3-mperttunen@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

10.06.2021 14:04, Mikko Perttunen пишет:
> Add a new property for jobs to enable or disable recovery i.e.
> CPU increments of syncpoints to max value on job timeout. This
> allows for a more solid model for hanged jobs, where userspace
> doesn't need to guess if a syncpoint increment happened because
> the job completed, or because job timeout was triggered.

Userspace should always get proper timeout. Threshold should be wrapped
into fence. Fence's error state should be set to -ETIMEDOUT.

> On job timeout, we stop the channel, NOP all future jobs on the
> channel using the same syncpoint, mark the syncpoint as locked
> and resume the channel from the next job, if any.
> 
> The future jobs are NOPed, since because we don't do the CPU
> increments, the value of the syncpoint is no longer synchronized,
> and any waiters would become confused if a future job incremented
> the syncpoint. The syncpoint is marked locked to ensure that any
> future jobs cannot increment the syncpoint either, until the
> application has recognized the situation and reallocated the
> syncpoint.

It should be much easier to switch to DRM scheduler, removing lot's of
the old code instead of updating it with new quirks that are difficult
to follow.
