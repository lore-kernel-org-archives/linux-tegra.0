Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20F63C433FE
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Nov 2022 02:25:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229514AbiKXCZk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 23 Nov 2022 21:25:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbiKXCZj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 23 Nov 2022 21:25:39 -0500
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C240CE1232
        for <linux-tegra@vger.kernel.org>; Wed, 23 Nov 2022 18:25:38 -0800 (PST)
Received: by mail-qk1-x72b.google.com with SMTP id v8so236748qkg.12
        for <linux-tegra@vger.kernel.org>; Wed, 23 Nov 2022 18:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9JRDJG3kkMfcl/gD5TRWtpYPwOoW5DCLW4ntAO7cRrE=;
        b=Szx0/BlKCR0tMcAbbHx2qqQsg+8v3Gi8WdQ7rsnN5ZDwP1MLfYeSqZaOXYy+Mvz9L6
         VYoRMqSw+P+dChRFn6TcMzE52jg4xuDB/TahoWufVQtp1YmQTvxSSUss4ur1VZ9QO9R9
         8WFIarMXo5KmGQ7f73ol+7gVe9d1nN3YIEMp0fu8ZUMpV4+YrzzrEznprWtA9+Gkeqak
         Uw9qswseR1h9MHf8HlaH2Bkf9D0FxUkonaziN1E+l/4uqXoAngBW+UwXywFOlHsGTxy+
         nZ9KWDqJdEF924EhNXHtPOa/QD6z3dRJ2hBIYLLlffHsyyLpYEOvVAoFg2aey3GAQR5u
         H2VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9JRDJG3kkMfcl/gD5TRWtpYPwOoW5DCLW4ntAO7cRrE=;
        b=l9WR7RgG2zj46ReT+OrelD4nC+TIrNfVw/ljRQrfcO6kzzJRbasiP1X4gza8b4hdjU
         BIcz82bQQ88J4CzNMdn8CZ4v0E+AiB/81zHAytU7RLUqUXQwMLi8pyqCcNB6M7WVztyG
         eCHQTmN8shVFokmYlVje0xvD5vaxu4iVKhuhiOAk2yAF1RY4duPuHfT1rXVSAltlSAI1
         XgJbblB7gepDKBrGzGOYGWisv1wBpGdzrrp9azf/mf7a8/gpregleVHHShiAXMznGEdp
         Kg3oM3BdIKR0QsT1ayOa4IAG0WIx6Qwf11R7jpJQVQtiAkP7tt3u2AEKB+1Ez8PqHpiV
         pX2Q==
X-Gm-Message-State: ANoB5pkcDlgnXaklOOoCvUX6/+4EhnZLrremPHAqUin4C4Nv+Q2HZ5Ug
        luupTjIXteYipcj1+i+V+7Njix6a+FlDMEQ4EiY=
X-Google-Smtp-Source: AA0mqf6lOiZ95JJBSFNkRQSwsHQEUARBguX3xVeCCrxNiUA/CZ5lO1Qh7wcmEzCROvoRuO+xEh2yqzH9A/R7C2VuA6U=
X-Received: by 2002:a05:620a:219c:b0:6fa:cbd7:6103 with SMTP id
 g28-20020a05620a219c00b006facbd76103mr19129902qka.235.1669256737795; Wed, 23
 Nov 2022 18:25:37 -0800 (PST)
MIME-Version: 1.0
References: <20221118173325.742647-1-thierry.reding@gmail.com>
In-Reply-To: <20221118173325.742647-1-thierry.reding@gmail.com>
From:   Dave Airlie <airlied@gmail.com>
Date:   Thu, 24 Nov 2022 12:25:26 +1000
Message-ID: <CAPM=9twJj_7BmZznj9NKTFS_Ka+eHDJqhHHLiOAy38x68Xj47Q@mail.gmail.com>
Subject: Re: [GIT PULL] drm/tegra: Changes for v6.2-rc1
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Thierry,

looks like a rebase bug

dim: aad2a7d9d375 ("gpu: host1x: Update host1x_memory_context_alloc()
!IOMMU_API stub"): SHA1 in fixes line not found:
dim:     1508aa73ea38 ("gpu: host1x: Select context device based on
attached IOMMU")
dim: ERROR: issues in commits detected, aborting

Please fix the commit msg and resend.

Dave.

On Sat, 19 Nov 2022 at 03:33, Thierry Reding <thierry.reding@gmail.com> wrote:
>
> Hi Dave, Daniel,
>
> The following changes since commit c2418f911a31a266af4fbaca998dc73d3676475a:
>
>   gpu: host1x: Avoid trying to use GART on Tegra20 (2022-11-18 09:33:20 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.freedesktop.org/drm/tegra.git tags/drm/tegra/for-6.2-rc1
>
> for you to fetch changes up to 1eb336ed12cda68cb207dbdb6918dc60b151ef6a:
>
>   gpu: host1x: Staticize host1x_syncpt_fence_ops (2022-11-18 09:33:31 +0100)
>
> Thanks,
> Thierry
>
> ----------------------------------------------------------------
> drm/tegra: Changes for v6.2-rc1
>
> This contains a bunch of cleanups across the board as well as support
> for the NVDEC hardware found on the Tegra234 SoC.
>
> ----------------------------------------------------------------
> Dmitry Torokhov (1):
>       drm/tegra: Switch to using devm_fwnode_gpiod_get()
>
> Jani Nikula (1):
>       drm/tegra: Convert to using is_hdmi from display info
>
> Liu Shixin (1):
>       gpu: host1x: Use DEFINE_SHOW_ATTRIBUTE to simplify debugfs code
>
> Mikko Perttunen (6):
>       gpu: host1x: Select context device based on attached IOMMU
>       memory: tegra: Add API for retrieving carveout bounds
>       gpu: host1x: Add stream ID register data for NVDEC on Tegra234
>       drm/tegra: nvdec: Support multiple clocks
>       drm/tegra: Add code for booting RISC-V based engines
>       drm/tegra: Add Tegra234 support to NVDEC driver
>
> Qing Wang (1):
>       drm/tegra: Switch over to vmemdup_user()
>
> Thierry Reding (2):
>       gpu: host1x: Update host1x_memory_context_alloc() !IOMMU_API stub
>       gpu: host1x: Staticize host1x_syncpt_fence_ops
>
> Zhang Zekun (1):
>       drm/tegra: Add missing clk_disable_unprepare() in tegra_dc_probe()
>
> ruanjinjie (1):
>       drm/tegra: Make gather_bo_ops static
>
>  drivers/gpu/drm/tegra/Makefile  |   3 +-
>  drivers/gpu/drm/tegra/dc.c      |   4 +-
>  drivers/gpu/drm/tegra/drm.c     |   1 +
>  drivers/gpu/drm/tegra/hdmi.c    |   9 +--
>  drivers/gpu/drm/tegra/nvdec.c   | 171 ++++++++++++++++++++++++++++++++++------
>  drivers/gpu/drm/tegra/output.c  |  10 +--
>  drivers/gpu/drm/tegra/riscv.c   | 106 +++++++++++++++++++++++++
>  drivers/gpu/drm/tegra/riscv.h   |  30 +++++++
>  drivers/gpu/drm/tegra/submit.c  |  13 +--
>  drivers/gpu/drm/tegra/uapi.c    |   2 +-
>  drivers/gpu/host1x/context.c    |   4 +
>  drivers/gpu/host1x/debug.c      |  28 +------
>  drivers/gpu/host1x/dev.c        |  12 +++
>  drivers/gpu/host1x/fence.c      |   2 +-
>  drivers/memory/tegra/mc.c       |  25 ++++++
>  drivers/memory/tegra/tegra234.c |   5 ++
>  include/linux/host1x.h          |   2 +
>  include/soc/tegra/mc.h          |  11 +++
>  18 files changed, 362 insertions(+), 76 deletions(-)
>  create mode 100644 drivers/gpu/drm/tegra/riscv.c
>  create mode 100644 drivers/gpu/drm/tegra/riscv.h
