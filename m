Return-Path: <SRS0=kmJj=D5=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD174C388F2
	for <linux-tegra@archiver.kernel.org>; Thu, 22 Oct 2020 04:20:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6F69722267
	for <linux-tegra@archiver.kernel.org>; Thu, 22 Oct 2020 04:20:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JcGsnzpG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726190AbgJVEUv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 22 Oct 2020 00:20:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726188AbgJVEUv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 22 Oct 2020 00:20:51 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D59AC0613CE
        for <linux-tegra@vger.kernel.org>; Wed, 21 Oct 2020 21:20:51 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id c141so496915lfg.5
        for <linux-tegra@vger.kernel.org>; Wed, 21 Oct 2020 21:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bHoZT/Fr9uAigMoBzLNCfLcCJhHkAk9QlkwBKzVc6sU=;
        b=JcGsnzpG4cmLKqGoh+N5JKm4CoANnz8x2hANg5VK15vgE2wyhYhmCX5p34ujEWGo6L
         lDJsZgl8whwW72iGwUUf9uH7C7lcT+QpEf3Dw95PGkovSjbYMpM8MHDUDwR8Yrson+/U
         jUTgvn+xmj9GuAs8q6kmxA2WyejrM5XYLGcmxEIbyCIBTjRPGzuuQdXus4RxIZf6OpDU
         1DYFDXwPiB9YFP4/Te503421p9Vfhc0ZDE2dCQgFUR4TG+n82N7GuAGZh3cYcnNAcAcN
         869MmrFBHLRTQOe8J1Fov4OUjdkRIMQXahKOwbiRlrx6imqpJr9EVg0riVsJPG0/Y6e+
         7fmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bHoZT/Fr9uAigMoBzLNCfLcCJhHkAk9QlkwBKzVc6sU=;
        b=scfTVzyAWlNq59i2d0vSEqzw66u7zxtdx2Hn246v7Pdr7McPlCnENBqSriTRb1DVdl
         hF8RRYfTzjPB6PaGw1rrD3igC6xheBGVyT3V1VZgQ/0gGAjoOWVOK9vtzJvZ1sBEzpid
         mulYbkIvyloFOpMpkLJViuHTDqe0IxLuCFXnMI7mhexwbtT5cFE3Kb/tX1HaIMB135A+
         1mLg8cJ10LQhrdI18uj4QRwr55N3YNxhpnYUIgIGz2Kpr3FKD3wmuk7e/9neqltE5iyH
         yYStY/gs1/iQhv7R2/rSISY+Anw/8MeWXFSS/VHB2BMd6c1VpmHMNqdz1p9TIYpCGhvr
         MOew==
X-Gm-Message-State: AOAM532uu0f2WBsTHlMFaW2C4rgOoTjfwzil1YR1fLFq+Vs0ScatR1b9
        bYfODu+zgCC6ilcL6la1hQk=
X-Google-Smtp-Source: ABdhPJxcRk3r72EvW5bHItYyzrdcIYOyYwLLZoWJW2nYBOTOUUajal7hm4xXuJnEcof9Pvja15gWXw==
X-Received: by 2002:a19:7009:: with SMTP id h9mr200749lfc.201.1603340449722;
        Wed, 21 Oct 2020 21:20:49 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-186.dynamic.spd-mgts.ru. [109.252.193.186])
        by smtp.googlemail.com with ESMTPSA id t80sm60273lff.72.2020.10.21.21.20.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2020 21:20:48 -0700 (PDT)
Subject: Re: [PATCH v3 19/20] drm/tegra: Implement new UAPI
To:     Mikko Perttunen <cyndis@kapsi.fi>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20201007171238.1795964-1-mperttunen@nvidia.com>
 <20201007171238.1795964-20-mperttunen@nvidia.com>
 <dd13ec2c-1e01-ca61-656c-b23b156b100f@gmail.com>
 <b33a5084-7dc3-a865-2f36-274ecebf2ee7@kapsi.fi>
 <1f3267a9-37b4-2cff-08a2-2ca7c905ce01@gmail.com>
 <6a7b4d4e-8d4a-416e-9789-45282b44bce5@kapsi.fi>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <48f5bbac-3955-c227-dbe1-d987b4ec5bd0@gmail.com>
Date:   Thu, 22 Oct 2020 07:20:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6a7b4d4e-8d4a-416e-9789-45282b44bce5@kapsi.fi>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

20.10.2020 12:18, Mikko Perttunen пишет:
>> I'm asking this question because right now there is only one potential
>> client for this IOCTL, the VIC. If other clients aren't supposed to be a
>> part of the DRM driver, like for example NVDEC which probably should be
>> a V4L driver, then DRM driver will have only a single VIC and in this
>> case we shouldn't need this IOCTL because DRM and V4L should use generic
>> dmabuf API for importing and exporting buffers.
> 
> This IOCTL is required for GR2D/GR3D too, as they need to access memory
> as well. This is a different step from import/export -- first you import
> or allocate your memory so you have a GEM handle, then you map it to the
> channel, which does the IOMMU mapping (if there is an IOMMU).
> 

This doesn't answer my question. I don't have a full picture and for now
will remain dubious about this IOCTL, but it should be fine to have it
in a form of WIP patches (maybe staging feature) until userspace code
and hardware specs will become available.

Some more comments:

1. Older Tegra SoCs do not have restrictions which do not allow to group
IOMMU as wished by kernel driver. It's fine to have one static mapping
per-GEM that can be accessed by all DRM devices, that's why CHANNEL_MAP
is questionable.

2. IIUC, the mappings need to be done per-device group/stream and not
per-channel_ctx. It looks like nothing stops channel contexts to guess
mapping addresses of the other context, isn't it?

I'm suggesting that each GEM should have a per-device mapping and the
new IOCTL should create these GEM-mappings, instead of the channel_ctx
mappings.

3. We shouldn't need channel contexts at all, a single "DRM file"
context should be enough to have.

4. The new UAPI need to be separated into several parts in the next
revision, one patch for each new feature.

The first patches should be the ones that are relevant to the existing
userspace code, like support for the waits.

Partial mappings should be a separate feature because it's a
questionable feature that needs to be proved by a real userspace first.
Maybe it would be even better to drop it for the starter, to ease reviewing.

Waiting for fences on host1x should be a separate feature.

The syncfile support needs to be a separate feature as well because I
don't see a use-case for it right now.

I'd like to see the DRM_SCHED and syncobj support. I can help you with
it if it's out of yours scope for now.
