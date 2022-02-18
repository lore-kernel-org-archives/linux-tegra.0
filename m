Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19FD7C433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Feb 2022 14:16:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235977AbiBRORD (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 18 Feb 2022 09:17:03 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:47112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232114AbiBRORC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Feb 2022 09:17:02 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A80BC18C5A9
        for <linux-tegra@vger.kernel.org>; Fri, 18 Feb 2022 06:16:44 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id e2so1110640ljq.12
        for <linux-tegra@vger.kernel.org>; Fri, 18 Feb 2022 06:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=uF68xvWcLx76IR6CWRwh/pPzuX0RgzE30BHq223TBtE=;
        b=FzdIE5ExskgQXsPsUcc/+PrxvJEenKLjZkIpwhU1v6DSIt8OcIxW6RlcnaZQ3OxZxU
         ARjBptI9pkzMDE6zcLGAqZi3FdhGGFiyEZsc/V+H5+rDDNhYXwdmalEDcAgJFoO+40M/
         auFXBjLNRX7NZa3FyVMIxmfxkVPhvYS4Vyu+vd2jlXzMLskgcrHUG/aWAQYgO45SWeAR
         RoySGtc+51y/m7blHTGBdkmYDrVwURA4kDBBTIG0vncukAAW/oyc3dlEPI7sVOgJJg30
         Z+urn37MUd5lmpcSvjsEjYmmRIYeeb0a+539nXscyVOcrV3Sj8hQUu27cZRd5ppEm4tw
         984w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=uF68xvWcLx76IR6CWRwh/pPzuX0RgzE30BHq223TBtE=;
        b=5g6qgYSMxN5LvulV8fuHqOXt2/uExevmhkycIEDUvxW9xyj74qfL/IsqW4yxvRudHZ
         DyQGDZ+i3eHg4oBJd8lSAxrJ3JpBcnbFMAxq63ywodNc/dksbr/CPNY4+18nZTofMxgv
         pdaZc2xc6tXUPdaGqwYZxwq52qRd4gkuAhnvgKdYLqFYfKkIeoOtDwlMq5d8vwFJxq5h
         s4h/kUyk3A++R2zvAEnRABVHxFc6W9ggU4aQf5h9fef24HPPIPKpVgQ/xwtkbHO6Nx47
         slnaBnvg9i9traryiQaYE/zZxme8yRc79Iz74SkWf9W6z3Njff/QHe0vJa9lSf81SQMP
         wHHg==
X-Gm-Message-State: AOAM531vgxirPRU/dpBAbUAiiqYXTKcFlXp7gGXhpychBCvqQ5VttwPt
        1uGruASD5eU9oUMm8Wd4tUk=
X-Google-Smtp-Source: ABdhPJy4TANF3ZWP7o81wk90zI7oXc9TbkAP3k0Y6qF9Amiv/qj+iJGq7IKqH4PJbO4d6Qn5OHR1Fw==
X-Received: by 2002:a05:651c:901:b0:245:f621:55ff with SMTP id e1-20020a05651c090100b00245f62155ffmr5781816ljq.247.1645193802865;
        Fri, 18 Feb 2022 06:16:42 -0800 (PST)
Received: from [192.168.2.145] (109-252-138-165.dynamic.spd-mgts.ru. [109.252.138.165])
        by smtp.googlemail.com with ESMTPSA id e30sm321572ljb.89.2022.02.18.06.16.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Feb 2022 06:16:42 -0800 (PST)
Message-ID: <0e936e9a-57a2-3881-1a55-50682b859acc@gmail.com>
Date:   Fri, 18 Feb 2022 17:16:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH libdrm v2 00/25] Update Tegra support
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20220217191625.2534521-1-thierry.reding@gmail.com>
 <fb059f6f-013a-4a7e-55a7-81acbdda80fc@gmail.com> <Yg7ANdIhSiEsZf8E@orome>
From:   Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <Yg7ANdIhSiEsZf8E@orome>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

18.02.2022 00:37, Thierry Reding пишет:
> On Thu, Feb 17, 2022 at 11:02:53PM +0300, Dmitry Osipenko wrote:
>> 17.02.2022 22:16, Thierry Reding пишет:
>>> From: Thierry Reding <treding@nvidia.com>
>>>
>>> Hi all,
>>>
>>> this is the userspace part of the kernel patches that were recently
>>> merged into drm-next:
>>>
>>>   https://patchwork.freedesktop.org/series/92378/
>>>
>>> The goal is to provide a userspace implementation of the UAPI exposed by
>>> the kernel and show its usage in some test programs that can also be
>>> used for basic sanity testing. More complete userspace implementations
>>> are available here:
>>>
>>>   * https://github.com/cyndis/vaapi-tegra-driver
>>>   * https://github.com/grate-driver/xf86-video-opentegra
>>>   * https://github.com/grate-driver/grate
>>>
>>> Changes in v2:
>>> - implement vic_clear() as a helper using ->fill() (Michał Mirosław)
>>> - rebase and fix a couple of Meson errors/warnings
>>>
>>> Thierry
>>>
>>> Thierry Reding (25):
>>>   tegra: Indent according to .editorconfig
>>>   tegra: Remove unused IOCTL implementations
>>>   tegra: Extract common buffer object allocation code
>>>   tegra: Fix mmap() of GEM buffer objects
>>>   tegra: Add flink helpers
>>>   tegra: Add PRIME support helpers
>>>   tegra: Make API more consistent
>>>   tegra: Install tegra-openclose test
>>>   tegra: Update for new UABI
>>>   tegra: Include private.h in list of source files
>>>   tegra: Add channel APIs
>>>   tegra: Add job and push buffer APIs
>>>   tegra: Add syncpoint APIs
>>>   tests: tegra: Add helper library for tests
>>>   tests: tegra: Add gr2d-fill test
>>>   tests: tegra: Add syncpt-wait test
>>>   tests: tegra: Add syncpoint timeout test
>>>   tests: tegra: Add VIC support
>>>   tests: tegra: Add VIC 3.0 support
>>>   tests: tegra: Add VIC 4.0 support
>>>   tests: tegra: Add VIC 4.1 support
>>>   tests: tegra: Add VIC 4.2 support
>>>   tests: tegra: Add VIC clear test
>>>   tests: tegra: Add VIC blit test
>>>   tests: tegra: Add VIC flip test
>>>
>>>  include/drm/tegra_drm.h      | 429 +++++++++++++++++++++++--
>>>  tegra/channel.c              | 195 ++++++++++++
>>>  tegra/job.c                  | 187 +++++++++++
>>>  tegra/meson.build            |   7 +-
>>>  tegra/private.h              |  85 ++++-
>>>  tegra/pushbuf.c              | 184 +++++++++++
>>>  tegra/syncpt.c               | 101 ++++++
>>>  tegra/tegra-symbols.txt      |  27 +-
>>>  tegra/tegra.c                | 386 +++++++++++-----------
>>>  tegra/tegra.h                |  95 +++++-
>>>  tests/tegra/.gitignore       |   3 +-
>>>  tests/tegra/drm-test-tegra.c | 147 +++++++++
>>>  tests/tegra/drm-test-tegra.h |  55 ++++
>>>  tests/tegra/drm-test.c       | 248 +++++++++++++++
>>>  tests/tegra/drm-test.h       |  72 +++++
>>>  tests/tegra/gr2d-fill.c      | 146 +++++++++
>>>  tests/tegra/host1x.h         |  34 ++
>>>  tests/tegra/meson.build      |  88 +++++-
>>>  tests/tegra/openclose.c      |  52 +--
>>>  tests/tegra/syncpt-timeout.c | 163 ++++++++++
>>>  tests/tegra/syncpt-wait.c    | 151 +++++++++
>>>  tests/tegra/vic-blit.c       | 333 +++++++++++++++++++
>>>  tests/tegra/vic-clear.c      | 173 ++++++++++
>>>  tests/tegra/vic-flip.c       | 333 +++++++++++++++++++
>>>  tests/tegra/vic.c            | 184 +++++++++++
>>>  tests/tegra/vic.h            | 181 +++++++++++
>>>  tests/tegra/vic30.c          | 458 +++++++++++++++++++++++++++
>>>  tests/tegra/vic30.h          | 439 ++++++++++++++++++++++++++
>>>  tests/tegra/vic40.c          | 370 ++++++++++++++++++++++
>>>  tests/tegra/vic40.h          | 285 +++++++++++++++++
>>>  tests/tegra/vic41.c          | 374 ++++++++++++++++++++++
>>>  tests/tegra/vic41.h          | 372 ++++++++++++++++++++++
>>>  tests/tegra/vic42.c          | 374 ++++++++++++++++++++++
>>>  tests/tegra/vic42.h          | 597 +++++++++++++++++++++++++++++++++++
>>>  34 files changed, 7068 insertions(+), 260 deletions(-)
>>
>>
>> Why do we need these tests in libdrm? Why not IGT?
> 
> Oops, sorry. I had meant to reply to your question in the previous
> version. The idea was to have this minimal set of tests in libdrm as a
> way to demonstrate how to use the various APIs. At the same time, this
> is meant to serve as an easy way to validate that everything works from
> the comparatively simple libdrm package.

Who will be validating libdrm on Tegra?

> But yes, adding more tests on top of this to IGT is something that I've
> been pondering and I certainly wouldn't object if anyone else was going
> to attempt to do so. I don't think IGT and libdrm need to be mutually
> exclusive, though.

I know that IGT tests are regularly run by the KernelCI at least on TK1.
