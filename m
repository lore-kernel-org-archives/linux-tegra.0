Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07869C432BE
	for <linux-tegra@archiver.kernel.org>; Fri, 30 Jul 2021 15:26:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E3D9F60F46
	for <linux-tegra@archiver.kernel.org>; Fri, 30 Jul 2021 15:26:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239440AbhG3P0Z (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 30 Jul 2021 11:26:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239508AbhG3P0Y (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 30 Jul 2021 11:26:24 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7B13C06175F
        for <linux-tegra@vger.kernel.org>; Fri, 30 Jul 2021 08:26:18 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id z2so18671960lft.1
        for <linux-tegra@vger.kernel.org>; Fri, 30 Jul 2021 08:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KyNOSadZXpeeCUtPUrTIpAwGD2QS1HxcoESQ3nPfDVM=;
        b=KnztAJNEc5NjaCQmoJ2jeXG4oXimsw7zgPOnjdTUQG3f8jwqjQSPUnSN1555wo3Jtd
         7Nu00C5G40Ix1pxPUN0JUc6qHOvb3IblCLyKO9jMK3fvuhTyVfmjSQLLsp4f7AXfiZWy
         amnLYBD0zFw3AVU9Ddm6Mst2yE41VDBOMbTkuu+KMzB0UcT2HWT27aBRLAWMMDuEC0df
         /PIgkZfGIlU9X5e3D+u9Va33LcNm5tKRTdiQhfDNAzSj3tXojlt3LVTtnXeNkfEJsKGM
         t+XyD4He22JGBc/OpUs2yiehQ3AI4Ofg2aPRt0PtP1j7Ff/h+KeOG4IceH1rt+M9sk9P
         b7SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KyNOSadZXpeeCUtPUrTIpAwGD2QS1HxcoESQ3nPfDVM=;
        b=pglSca0LkzYhkBRqw+U7ayHuZjkTUvjK9nVCJbOpTESXosWHxrnzSNNh7spG8aegZr
         pV9IUJkJrL2sEyBLxNEq6j8rT2SBH4g5vE09iFw+ejXL+Md0J7UnndcLHqezUW5QnFLx
         PlBUSyZpoBTISDg5HEeOm2W8Ywcygf83iOgCSXiUiEvZXAQFY7nKSxxV7jW2NlvIf6OT
         7yWEvYPvgOfg4y2opepcwM4IKF67znabqEXXXGfMwSRidgndvtjdW/yTXL2/i4YFV/wc
         NyV6TO1YHV8bC5Ss6V4U374i76bjNLbJsaR2amNE78HPcaKSGgqupN4oUF4L6ixBY1Uh
         AUFg==
X-Gm-Message-State: AOAM531wkPLu9kYf9xCLYa8sOUYSZtbpwDvbQ8Hl20ggJt7E7Derfi7/
        g1fXhIhSet/dwqrJjpmlrOBRkWDaTdY=
X-Google-Smtp-Source: ABdhPJzN+TpIWK9oZo57R0NjN0fI50J4iQyQaKIPTvfwQiXDnQUQrdnxKeQK7Ba3Jp843RA+Rfbs1A==
X-Received: by 2002:ac2:5109:: with SMTP id q9mr2348199lfb.98.1627658777011;
        Fri, 30 Jul 2021 08:26:17 -0700 (PDT)
Received: from [192.168.2.145] (94-29-39-114.dynamic.spd-mgts.ru. [94.29.39.114])
        by smtp.googlemail.com with ESMTPSA id f25sm173900lfs.288.2021.07.30.08.26.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jul 2021 08:26:16 -0700 (PDT)
Subject: Re: [PATCH v8 00/14] drm/tegra: Introduce a modern UABI
To:     Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20210709193146.2859516-1-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <9e3247bb-a981-5c61-5b5f-a2e159b9a147@gmail.com>
Date:   Fri, 30 Jul 2021 18:26:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709193146.2859516-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

09.07.2021 22:31, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> Hi all,
> 
> Mikko has been away for a few weeks, so I've been testing and revising
> the new UABI patches in the meantime. There are very minor changes to
> the naming of some of the UABI fields, but other than that it's mostly
> unchanged from v7.
> 
> One notable change is that mappings can now be read-only, write-only,
> read-write or none of them (rather than just read-only or read-write),
> since those combinations are all supported by the IOMMUs and it might
> be useful to make some mappings write-only.
> 
> For a full list of changes in v8, see the changelog in patch 6.
> 
> I've also updated the libdrm_tegra library to work against this version
> of the UABI. A branch can be found here:
> 
>   https://gitlab.freedesktop.org/tagr/drm/-/commits/drm-tegra-uabi-v8
> 
> That contains helper APIs for the concepts introduced in this series and
> shows how they can be used in various tests that can be run for sanity
> checking.
> 
> In addition, Mikko has made updates to the following projects, though
> they may need to be updated for the minor changes in v8:
> 
> * vaapi-tegra-driver - https://github.com/cyndis/vaapi-tegra-driver
>   Experimental support for MPEG2 and H264 decoding on T210, T186
>   and T194.
> 
> * xf86-video-opentegra - https://github.com/grate-driver/xf86-video-opentegra
>   X11 userspace acceleration driver for Tegra20, Tegra30, and Tegra114.
> 
> * grate - https://github.com/grate-driver/grate
>   3D rendering testbed for Tegra20, Tegra30, and Tegra114
> 
> I plan on putting this into linux-next soon after v5.14-rc1 so that this
> can get some soak time.
> 
> Thierry
> 
> Mikko Perttunen (14):
>   gpu: host1x: Add DMA fence implementation
>   gpu: host1x: Add no-recovery mode
>   gpu: host1x: Add job release callback
>   gpu: host1x: Add support for syncpoint waits in CDMA pushbuffer
>   drm/tegra: Extract tegra_gem_lookup
>   drm/tegra: Add new UAPI to header
>   drm/tegra: Boot VIC during runtime PM resume
>   drm/tegra: Allocate per-engine channel in core code
>   drm/tegra: Implement new UAPI
>   drm/tegra: Implement syncpoint management UAPI
>   drm/tegra: Implement syncpoint wait UAPI
>   drm/tegra: Implement job submission part of new UAPI
>   drm/tegra: Add job firewall
>   drm/tegra: Bump driver version

The "gpu: host1x: Add option to skip firewall for a job" of v7 is not here.

The tegra_drm_ioctl_channel_map() uses wrong BO size again, which breaks
firewall, it was fixed in v7.

The DRM_TEGRA_CHANNEL_MAP_WRITE and DRM_TEGRA_CHANNEL_MAP_READ values
should be swapped to preserve compatibility with the current userspace.

Please fix all the coding style problems reported by
"./scripts/checkpatch.pl --strict" and other things reported previously.
Re-submit v9.
