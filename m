Return-Path: <SRS0=KKuN=C6=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E40EC43463
	for <linux-tegra@archiver.kernel.org>; Mon, 21 Sep 2020 12:12:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DB30920EDD
	for <linux-tegra@archiver.kernel.org>; Mon, 21 Sep 2020 12:12:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RC8OoVrp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726355AbgIUMMu (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 21 Sep 2020 08:12:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726326AbgIUMMu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 21 Sep 2020 08:12:50 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2F73C061755
        for <linux-tegra@vger.kernel.org>; Mon, 21 Sep 2020 05:12:49 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id z9so12396174wmk.1
        for <linux-tegra@vger.kernel.org>; Mon, 21 Sep 2020 05:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZukQy9tOjRzKywMf/Ule7Bh+CxzP/d82LscaFBE4NEg=;
        b=RC8OoVrpyF1z87Z/ktGmqzl/Cm48OoIpqbsoHlSEKacl2Hayl2yMf/dzlMOK5BcpHw
         LFhGalvFUrNiuckwVaQMdgdX0s/nOgmkdVCj2LLenDl9Zc7zYT9V4I9IEI6qAgabJnkL
         UEZS2MNjhXJjWNf5qZ5TQS0yy2z0jbgo8mA8o4C2efIytlZ8BKEezh3ydNKrTgKVVd1I
         xkhZKm5OAW2X7vh3vkwxdscAMsd00/1wFM9QCYRKSC8b9IxiDFzmfpC2/vbg2HrbbPnH
         xneq8knwsDXl0rwOwB43eqbkcxudNqLHd/pq7UkaPOEifm7HcT3cpQVIhZ5F0GEHLmzg
         2ruA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZukQy9tOjRzKywMf/Ule7Bh+CxzP/d82LscaFBE4NEg=;
        b=tSsBmlRXMh/bg6iApTmsupw8KSHshUNnq3j7sM/V3cLJFiNSFUXzCTZeFa9xXogJHm
         TpRW/Ox+CCCKiQ25jv7zB3QLrlgojKGIW8dm9e1uq7tX+kBKmZk9i2wt5ndQ4sJmZF0h
         hJWkocsjpS4OZXngrrUM5VwQ48Wz4ZRufZnqGOEU2hLuiWBNyyOzeE7Sb/d+rwv027A8
         CGvxTTLkpYCcUdjsrfAxVx8xqr5WEup0GcPGCpvrQeGhuogTBwfdSJMZrHyYV+yWsCpj
         0Vc1zzLSF2IhnaRdpRkVrwmbB2VYxm0wNkhKxz4cMZewRzmRYuT66WgecN68vSvU5aj/
         gu8Q==
X-Gm-Message-State: AOAM533LaDwPwCDtsn6bOZn9RIjOwitAKZDDsDP0iIv1Gu35h90ClUyq
        KIXOEpjAM3q8d40xdvOZ8OKKcwiiQ0Y=
X-Google-Smtp-Source: ABdhPJyFPlYLlSQ7O0Xf78qHQtPuSfbfRKOtZ0PZyW76/joJ6MWeBAdrS/PdKHu+pZoV8bN3aZ81Sw==
X-Received: by 2002:a7b:c359:: with SMTP id l25mr17334153wmj.125.1600690368406;
        Mon, 21 Sep 2020 05:12:48 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id t124sm20040035wmg.31.2020.09.21.05.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 05:12:47 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dave Airlie <airlied@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [GIT PULL] drm/tegra: Changes for v5.10-rc1
Date:   Mon, 21 Sep 2020 14:12:45 +0200
Message-Id: <20200921121245.3953659-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Dave,

The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  ssh://git.freedesktop.org/git/tegra/linux.git tags/drm/tegra/for-5.10-rc1

for you to fetch changes up to d9f980ebcd01d90a2a76ea2383c925abf9223cab:

  drm/tegra: output: rgb: Wrap directly-connected panel into DRM bridge (2020-09-17 12:31:18 +0200)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Changes for v5.10-rc1

This is a handful of patches that add bridge support for Tegra devices
and fix a couple of minor issues.

----------------------------------------------------------------
Dmitry Osipenko (4):
      drm/tegra: output: Don't leak OF node on error
      drm/tegra: output: Support DRM bridges
      drm/tegra: output: rgb: Support LVDS encoder bridge
      drm/tegra: output: rgb: Wrap directly-connected panel into DRM bridge

Thierry Reding (1):
      drm/tegra: Properly reference count the DDC I2C adapter

 drivers/gpu/drm/tegra/drm.h    |   2 +
 drivers/gpu/drm/tegra/output.c |  24 +++++++---
 drivers/gpu/drm/tegra/rgb.c    | 102 ++++++++++++++++++++++-------------------
 drivers/gpu/drm/tegra/sor.c    |   7 ++-
 4 files changed, 80 insertions(+), 55 deletions(-)
