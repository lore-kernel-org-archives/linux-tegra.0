Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82C27C433F5
	for <linux-tegra@archiver.kernel.org>; Fri,  1 Oct 2021 18:37:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6A09661A54
	for <linux-tegra@archiver.kernel.org>; Fri,  1 Oct 2021 18:37:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354574AbhJASis (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 1 Oct 2021 14:38:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354468AbhJASir (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 1 Oct 2021 14:38:47 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BF1AC061775
        for <linux-tegra@vger.kernel.org>; Fri,  1 Oct 2021 11:37:02 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id p4so10084600qki.3
        for <linux-tegra@vger.kernel.org>; Fri, 01 Oct 2021 11:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=JgfrJwCNWFHH92jY3FPdA9RZ/LFPeXIIQjB7fHIn7dg=;
        b=V8txkH5WI9HVciSyj1K7GFWAguDGZ/uXpIIG9EZ8p1BWDzPEjYQLZX8hkzqhAtGLq3
         0zaBWthaBgGK9P7iiaKk9B0pHHR1AdI21rhVaoWSc8hi9Z+gpoWuop68GB8eYw9c0Edo
         0PZowRL4+MdB5eM48MtFd1F9JNKsN4VAjm/nbCwKPlOON2/csYHi5DgXvGQirVfR1Ym0
         n7hGaR89pQw7VgrXXh8Sp9pDzgoRNsEBiiCvqTnZmxgA4ZNi0/qNiyNSZvT9oxJp0DPI
         WDMxP4cYbRd4iqwJx1MBtRACoEH8Jv6KqJM/xkc4y2BrTvRuySUmcx4KVmNqnuSpRWii
         cWRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JgfrJwCNWFHH92jY3FPdA9RZ/LFPeXIIQjB7fHIn7dg=;
        b=SRWl0E54i4tzoRkYZYN8DbRSEwQS31C0gxEDk8jrTEI0AHvbV9zyubDQQDidlfJBgU
         HF8Nrb/plskVk2N6yxXmmNPEPjN8vOY6i+KQ3918sGr6bgZ8iX4fNAYLV0Sejh5U0DwB
         1LSWpCVz7tN3MWHkategfGhjvJWFvajc6A2B3YsIiKBM2YK2EbF2yVc/NDOEG4txM7oz
         GZeqVnWvKjLvUdzdecmAlLzWwTcTz8nsaCJ6Q3WCOJIZB7bwEklhqRHW9kcWUfaJljRH
         E7CJVmT5w9ZSygE2ghgcCmX2S8YcjakF9OZy7Sfri/7AXljHFL64INPibltk39wK1FV0
         XZuw==
X-Gm-Message-State: AOAM531leMuEobzx9jbtNOxygIc59Wy7q6rXiY+Bu0dkE0vf3JRu/ioS
        TMQUmik3YAoizGIfZbRE/5GhLw==
X-Google-Smtp-Source: ABdhPJzWLClrfa9cLP4JuqHXPKnm/GKbHbnm/Gpfe4qg6W378uFn/9WMBNa1f4gXolzUfArP3s/wvw==
X-Received: by 2002:ae9:dc84:: with SMTP id q126mr11328203qkf.128.1633113421775;
        Fri, 01 Oct 2021 11:37:01 -0700 (PDT)
Received: from localhost ([167.100.64.199])
        by smtp.gmail.com with ESMTPSA id c26sm3392066qka.33.2021.10.01.11.37.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Oct 2021 11:37:01 -0700 (PDT)
Date:   Fri, 1 Oct 2021 14:36:55 -0400
From:   Sean Paul <sean@poorly.run>
To:     Fernando Ramos <greenfoo@u92.eu>
Cc:     dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        sean@poorly.run, linux-doc@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 00/17] drm: cleanup: Use DRM_MODESET_LOCK_ALL_*
 helpers where possible
Message-ID: <20211001183655.GW2515@art_vandelay>
References: <20210924064324.229457-1-greenfoo@u92.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210924064324.229457-1-greenfoo@u92.eu>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Sep 24, 2021 at 08:43:07AM +0200, Fernando Ramos wrote:
> Hi all,
> 
> One of the things in the DRM TODO list ("Documentation/gpu/todo.rst") was to
> "use DRM_MODESET_LOCAL_ALL_* helpers instead of boilerplate". That's what this
> patch series is about.
> 
> You will find two types of changes here:
> 
>   - Replacing "drm_modeset_lock_all_ctx()" (and surrounding boilerplate) with
>     "DRM_MODESET_LOCK_ALL_BEGIN()/END()" in the remaining places (as it has
>     already been done in previous commits such as b7ea04d2)
> 
>   - Replacing "drm_modeset_lock_all()" with "DRM_MODESET_LOCK_ALL_BEGIN()/END()"
>     in the remaining places (as it has already been done in previous commits
>     such as 57037094)
>     
> Most of the changes are straight forward, except for a few cases in the "amd"
> and "i915" drivers where some extra dancing was needed to overcome the
> limitation that the DRM_MODESET_LOCK_ALL_BEGIN()/END() macros can only be used
> once inside the same function (the reason being that the macro expansion
> includes *labels*, and you can not have two labels named the same inside one
> function)
> 
> Notice that, even after this patch series, some places remain where
> "drm_modeset_lock_all()" and "drm_modeset_lock_all_ctx()" are still present,
> all inside drm core (which makes sense), except for two (in "amd" and "i915")
> which cannot be replaced due to the way they are being used.
> 
> Changes in v2:
> 
>   - Fix commit message typo
>   - Use the value returned by DRM_MODESET_LOCK_ALL_END when possible
>   - Split drm/i915 patch into two simpler ones
>   - Remove drm_modeset_(un)lock_all()
>   - Fix build problems in non-x86 platforms
> 
> Fernando Ramos (17):
>   drm: cleanup: drm_modeset_lock_all_ctx() --> DRM_MODESET_LOCK_ALL_BEGIN()
>   drm/i915: cleanup: drm_modeset_lock_all_ctx() --> DRM_MODESET_LOCK_ALL_BEGIN()
>   drm/msm: cleanup: drm_modeset_lock_all_ctx() --> DRM_MODESET_LOCK_ALL_BEGIN()
>   drm: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN() drm/vmwgfx: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
>   drm/tegra: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
>   drm/shmobile: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
>   drm/radeon: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
>   drm/omapdrm: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
>   drm/nouveau: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
>   drm/msm: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
>   drm/i915: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
>   drm/i915: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN() part 2
>   drm/gma500: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
>   drm/amd: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
>   drm: cleanup: remove drm_modeset_(un)lock_all()
>   doc: drm: remove TODO entry regarding DRM_MODSET_LOCK_ALL cleanup
> 

Thank you for revising, Fernando! I've pushed the set to drm-misc-next (along
with the necessary drm-tip conflict resolutions).

Sean

>  Documentation/gpu/todo.rst                    | 17 ----
>  Documentation/locking/ww-mutex-design.rst     |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   | 21 +++--
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 50 +++++-----
>  .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 25 ++---
>  drivers/gpu/drm/drm_client_modeset.c          | 14 ++-
>  drivers/gpu/drm/drm_crtc_helper.c             | 18 ++--
>  drivers/gpu/drm/drm_fb_helper.c               | 10 +-
>  drivers/gpu/drm/drm_framebuffer.c             |  6 +-
>  drivers/gpu/drm/drm_modeset_lock.c            | 94 +------------------
>  drivers/gpu/drm/gma500/psb_device.c           | 18 ++--
>  drivers/gpu/drm/i915/display/intel_audio.c    | 16 ++--
>  drivers/gpu/drm/i915/display/intel_display.c  | 23 ++---
>  .../drm/i915/display/intel_display_debugfs.c  | 46 +++++----
>  drivers/gpu/drm/i915/display/intel_overlay.c  | 46 ++++-----
>  drivers/gpu/drm/i915/display/intel_pipe_crc.c |  7 +-
>  drivers/gpu/drm/i915/i915_drv.c               | 13 ++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 10 +-
>  .../gpu/drm/msm/disp/msm_disp_snapshot_util.c | 12 +--
>  drivers/gpu/drm/nouveau/dispnv50/disp.c       | 15 ++-
>  drivers/gpu/drm/omapdrm/omap_fb.c             |  9 +-
>  drivers/gpu/drm/radeon/radeon_device.c        | 21 +++--
>  drivers/gpu/drm/radeon/radeon_dp_mst.c        | 10 +-
>  drivers/gpu/drm/shmobile/shmob_drm_drv.c      |  6 +-
>  drivers/gpu/drm/tegra/dsi.c                   |  6 +-
>  drivers/gpu/drm/tegra/hdmi.c                  |  6 +-
>  drivers/gpu/drm/tegra/sor.c                   | 11 ++-
>  drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c         | 11 ++-
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c           | 12 ++-
>  include/drm/drm_modeset_lock.h                |  2 -
>  30 files changed, 265 insertions(+), 292 deletions(-)
> 
> 
> base-commit: 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f
> -- 
> 2.33.0
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
