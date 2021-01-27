Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C922C433E0
	for <linux-tegra@archiver.kernel.org>; Wed, 27 Jan 2021 21:21:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F29864DA1
	for <linux-tegra@archiver.kernel.org>; Wed, 27 Jan 2021 21:21:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233995AbhA0VVG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 27 Jan 2021 16:21:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229817AbhA0VU5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 27 Jan 2021 16:20:57 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C436CC061573
        for <linux-tegra@vger.kernel.org>; Wed, 27 Jan 2021 13:20:16 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id a12so4738176lfb.1
        for <linux-tegra@vger.kernel.org>; Wed, 27 Jan 2021 13:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NpNL5RakE2KXSN5P6KgIPsL9eD0ecDZ1R9kFzhbHFTc=;
        b=BH16q8u5n+5wAzmvY5Tt7y+9w4fAecFWth8ZGXc+xm1sy5BoVTbe3P6EsRIJYETFsd
         alsXF927SsBb16m4gwlONDWQ5LCXkPvzPKG0YUjc2EjenNnV6aJ4sC5PmVTCy6ZEVGSy
         ytsQ8CS8r4mj2ga3r87V63y7McKV+LeBuBSIvkletRxuhpsqrsWOI+3slbnCqRqeHVZp
         tSF/kQbCZiNhUwMdxol6IwNu5u85t4XmuK4rHTX6spFnbAhyP6eiFXqSyrBbO1W9UYwX
         BsZanDvIYv0b9enAOK0UnXh/weHsjXe8eWpkaN0/as/vitX3c9NYH1KICLlrrNx9XxJm
         Tfqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NpNL5RakE2KXSN5P6KgIPsL9eD0ecDZ1R9kFzhbHFTc=;
        b=TpJiJaPPZrErtuHYrl79xlklTYdp0NMKkVlq3FpGXd2kJVLko/z15jQcxdHt/f0eT4
         LKWUA19msaREIUP80Vk/ILy2h5i5OCyfXugMJQ5K+hVHV+dwHNp/E47B6HV7fqvLpIlA
         kpH6ZiZpobYaUdD7suaasZ50uZChcOmaKS1P5Y5PnwE0CAB/0S62LCC/cDGMDreUTROo
         uSynBGh7b17yXj1oKHpiyST90EWmitZUmYQaQADNCzUwCei6vfhz5xm+CuhKXOhKlPwe
         HzbxeOPRbR3J2jbOAL1533xeTIkNz3l0NGtz0OKZX/qOhVrQK14Ld4UO19VaAEs4S96l
         qOJQ==
X-Gm-Message-State: AOAM5332EfPX2jJRgvC9HLKCc4W6ecLo4NCMZp1LuvxHgcnZfwgTZnDm
        t5jH4y7GwlBSf50wWUzltIA=
X-Google-Smtp-Source: ABdhPJwuNE1bisH3/2nrqBreh6P4L49LGnAK80zVgYFYHQ01ync3x0KeZR7SHcqKGDYRN5Dz9dh+uw==
X-Received: by 2002:a19:8147:: with SMTP id c68mr3711356lfd.292.1611782415325;
        Wed, 27 Jan 2021 13:20:15 -0800 (PST)
Received: from ?IPv6:2a00:1370:814d:ea25:a10:76ff:fe69:21b6? ([2a00:1370:814d:ea25:a10:76ff:fe69:21b6])
        by smtp.googlemail.com with ESMTPSA id 19sm1002904ljw.19.2021.01.27.13.20.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jan 2021 13:20:14 -0800 (PST)
Subject: Re: [PATCH v5 00/21] Host1x sync point UAPI should not be used for
 tracking DRM jobs
To:     Mikko Perttunen <cyndis@kapsi.fi>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <da085c38-4ac1-19dd-7706-caf323c969d2@gmail.com>
 <2f999b6d-d781-503a-78f4-d444bce72c58@kapsi.fi>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <2ee12338-bd5a-4b99-f86d-13da0d2a899b@gmail.com>
Date:   Thu, 28 Jan 2021 00:20:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <2f999b6d-d781-503a-78f4-d444bce72c58@kapsi.fi>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

26.01.2021 05:45, Mikko Perttunen пишет:
>> 2. We will probably need a dedicated drm_tegra_submit_cmd for sync point
>> increments.  The job's sync point will be allocated dynamically when job
>> is submitted.  We will need a fag for the sync_incr and wait_syncpt
>> commands, saying "it's a job's sync point increment/wait"
> 
> Negative. Like I have explained in previous discussions, with the
> current way the usage of hardware resources is much more deterministic
> and obvious. I disagree on the point that this is much more complicated
> for the userspace. Separating syncpoint and channel allocation is one of
> the primary motivations of this series for me.

Sync points are a limited resource. The most sensible way to work around
it is to keep sync points within kernel as much as possible. This is not
only much simpler for user space, but also allows to utilize DRM API
properly without re-inventing what already exists and it's easier to
maintain hardware in a good state.

If you need to use a dedicated sync point for VMs, then just allocate
that special sync point and use it. But this sync point won't be used
for jobs tracking by kernel driver. Is there any problem with this?

The primary motivation for me is to get a practically usable kernel
driver for userspace.
