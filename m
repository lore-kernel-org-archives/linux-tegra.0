Return-Path: <SRS0=19fU=CZ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A2F4C2BB84
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Sep 2020 09:38:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DA76322224
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Sep 2020 09:38:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="T6LbbPjB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726822AbgIPJiF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 16 Sep 2020 05:38:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726696AbgIPJiE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Sep 2020 05:38:04 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71CECC061788
        for <linux-tegra@vger.kernel.org>; Wed, 16 Sep 2020 02:38:01 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id e16so6189310wrm.2
        for <linux-tegra@vger.kernel.org>; Wed, 16 Sep 2020 02:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BAzRRIK8v7JChf1JsBCe57FCd6YM507dSSUg9G+yDXQ=;
        b=T6LbbPjB6GDxDA+6v39RkYYRs/xN0kVLglJ+50Ffd73lPfUO0KgjveykyAoXazlHY8
         BTKyiMtBFl3BCfhTe0N0v4CVqxWhCfLBw7JWtX75c/f6GEHT+gRZlvl3YCGCl3Zr6bpx
         CsWogiwEWIw2ApnI09fpCtv4JUFPP/7YyAXZc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BAzRRIK8v7JChf1JsBCe57FCd6YM507dSSUg9G+yDXQ=;
        b=UvLBJcW9o2ZX1w9yXOWkCkPSDTzfItgrJmdkdrrMoMuW7DEi2CKQ6RZB4j1qxn0stV
         wgIZOD4Wz9bo3hxYwQsPTrOyZMDA79xgal6VTpFx2QLMzst26QTkpiWdh/767ba9K523
         0YhBoaZen2HBtSonKDEbe3Eebb0vFEEq/qUX6bfg7VsBPHjRPLiRvCLSV+/7pBkmjNWO
         16eRWIzylPIPaa0Huug65+WqxnpDRQYhkpDrs3qygRYiFurtXZtOCEAlj6Wh6B0bC1Fh
         CjGS39b8yC399CdF2/JXhcJfuefH95dBudmpFJNZ31Ar6VuXrZVxfOLTsq65Il7ATiSj
         Wu5A==
X-Gm-Message-State: AOAM532j4ulCqWQqEAeKBe/hNa4gpeMSCAYbU3Jyx9VfyoEyL3A7WK/H
        PR9B88XhdobvElIOXj9ss38lPw==
X-Google-Smtp-Source: ABdhPJw3Y7czwYvM941LlyOYnNW/rTDHKpG+JUXszB6P9qd/Lqa6QqYntED9lIWpEw+GbimKaOiZIw==
X-Received: by 2002:a5d:61c7:: with SMTP id q7mr26159918wrv.343.1600249079953;
        Wed, 16 Sep 2020 02:37:59 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id k84sm4227735wmf.6.2020.09.16.02.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 02:37:59 -0700 (PDT)
Date:   Wed, 16 Sep 2020 11:37:56 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     sumit.semwal@linaro.org, christian.koenig@amd.com, daniel@ffwll.ch,
        airlied@linux.ie, sam@ravnborg.org, mark.cave-ayland@ilande.co.uk,
        kraxel@redhat.com, davem@davemloft.net,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk,
        christian.gmeiner@gmail.com, jani.nikula@linux.intel.com,
        joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
        thierry.reding@gmail.com, jonathanh@nvidia.com, pawel@osciak.com,
        m.szyprowski@samsung.com, kyungmin.park@samsung.com,
        tfiga@chromium.org, mchehab@kernel.org, chris@chris-wilson.co.uk,
        matthew.auld@intel.com, thomas.hellstrom@intel.com,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, etnaviv@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        sparclinux@vger.kernel.org
Subject: Re: [PATCH 0/3] dma-buf: Flag vmap'ed memory as system or I/O memory
Message-ID: <20200916093756.GC438822@phenom.ffwll.local>
References: <20200914112521.1327-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200914112521.1327-1-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Sep 14, 2020 at 01:25:18PM +0200, Thomas Zimmermann wrote:
> Dma-buf provides vmap() and vunmap() for retrieving and releasing mappings
> of dma-buf memory in kernel address space. The functions operate with plain
> addresses and the assumption is that the memory can be accessed with load
> and store operations. This is not the case on some architectures (e.g.,
> sparc64) where I/O memory can only be accessed with dedicated instructions.
> 
> This patchset introduces struct dma_buf_map, which contains the address of
> a buffer and a flag that tells whether system- or I/O-memory instructions
> are required.
> 
> Some background: updating the DRM framebuffer console on sparc64 makes the
> kernel panic. This is because the framebuffer memory cannot be accessed with
> system-memory instructions. We currently employ a workaround in DRM to
> address this specific problem. [1]
> 
> To resolve the problem, we'd like to address it at the most common point,
> which is the dma-buf framework. The dma-buf mapping ideally knows if I/O
> instructions are required and exports this information to it's users. The
> new structure struct dma_buf_map stores the buffer address and a flag that
> signals I/O memory. Affected users of the buffer (e.g., drivers, frameworks)
> can then access the memory accordingly.
> 
> This patchset only introduces struct dma_buf_map, and updates struct dma_buf
> and it's interfaces. Further patches can update dma-buf users. For example,
> there's a prototype patchset for DRM that fixes the framebuffer problem. [2]
> 
> Further work: TTM, one of DRM's memory managers, already exports an
> is_iomem flag of its own. It could later be switched over to exporting struct
> dma_buf_map, thus simplifying some code. Several DRM drivers expect their
> fbdev console to operate on I/O memory. These could possibly be switched over
> to the generic fbdev emulation, as soon as the generic code uses struct
> dma_buf_map.
> 
> [1] https://lore.kernel.org/dri-devel/20200725191012.GA434957@ravnborg.org/
> [2] https://lore.kernel.org/dri-devel/20200806085239.4606-1-tzimmermann@suse.de/

lgtm, imo ready to convert the follow-up patches over to this. But I think
would be good to get at least some ack from the ttm side for the overall
plan.

Also, I think we should put all the various helpers (writel/readl, memset,
memcpy, whatever else) into the dma-buf-map.h helper, so that most code
using this can just treat it as an abstract pointer type and never look
underneath it.
-Daniel

> 
> Thomas Zimmermann (3):
>   dma-buf: Add struct dma-buf-map for storing struct dma_buf.vaddr_ptr
>   dma-buf: Use struct dma_buf_map in dma_buf_vmap() interfaces
>   dma-buf: Use struct dma_buf_map in dma_buf_vunmap() interfaces
> 
>  Documentation/driver-api/dma-buf.rst          |   3 +
>  drivers/dma-buf/dma-buf.c                     |  40 +++---
>  drivers/gpu/drm/drm_gem_cma_helper.c          |  16 ++-
>  drivers/gpu/drm/drm_gem_shmem_helper.c        |  17 ++-
>  drivers/gpu/drm/drm_prime.c                   |  14 +-
>  drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c   |  13 +-
>  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  13 +-
>  .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |  18 ++-
>  drivers/gpu/drm/tegra/gem.c                   |  23 ++--
>  .../common/videobuf2/videobuf2-dma-contig.c   |  17 ++-
>  .../media/common/videobuf2/videobuf2-dma-sg.c |  19 ++-
>  .../common/videobuf2/videobuf2-vmalloc.c      |  21 ++-
>  include/drm/drm_prime.h                       |   5 +-
>  include/linux/dma-buf-map.h                   | 126 ++++++++++++++++++
>  include/linux/dma-buf.h                       |  11 +-
>  15 files changed, 274 insertions(+), 82 deletions(-)
>  create mode 100644 include/linux/dma-buf-map.h
> 
> --
> 2.28.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
