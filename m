Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD0CDC4320A
	for <linux-tegra@archiver.kernel.org>; Fri, 13 Aug 2021 16:22:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C97AB610FD
	for <linux-tegra@archiver.kernel.org>; Fri, 13 Aug 2021 16:22:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233517AbhHMQWi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 13 Aug 2021 12:22:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234368AbhHMQWh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 13 Aug 2021 12:22:37 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA680C0617AD
        for <linux-tegra@vger.kernel.org>; Fri, 13 Aug 2021 09:22:10 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id q10so14062501wro.2
        for <linux-tegra@vger.kernel.org>; Fri, 13 Aug 2021 09:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EwFtsY9WKlIQaf6vBR9fws+JXXBLzo++aqaXVjpQVqs=;
        b=DNiMu6irbvG49ZtZ4LNvF4KVh8zmgPuzwVytqLq20G775Pc2kP8ZC/0z5yp4TRNXil
         jBm7rdh6craWwVmCSwK7vp2QwX/lQjFUY2ZGhuvQrXH/DAlE2qiIb1aRTDDpLCdRQ64k
         4UWkZPn+acvCzFokq1ySG+AayMA7sXstb5+rIaauMvUHc6XN52+UZiR3y+NowfS7IKDY
         ljiknFIM6f50+qHK3sbrKDBQTB3zfKAVUEgXAyRT7CpOy9s8HAMbmiyfrEx+MzP+0u/y
         hWtp9m3AJ+W7odsgokhfeCTKLemHlr/41hAsNn3hpTnsg1jv8IRX+9u1Tt0P4ajPFB/t
         9z3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EwFtsY9WKlIQaf6vBR9fws+JXXBLzo++aqaXVjpQVqs=;
        b=qxdX5CH2rFPb0V7MCTpxPnG34tiYWil5MQg3Q71aLiqv/+r1r/Qi3YjyH/W2I3TEV3
         XM9pGuLQNtqCdB5KRhcteA2aPToNqlS+iLyodsAumfodC265bac7m7rqCMZLYl4J/Mu/
         K+0ER5fWzVbWLdwJqogNYbMvbpCKq6Dq9ARD131oxWQHb3Om42x8dj/mv2fZEkxevva+
         ReFwiwNwMDy+kwaPKzF3xfR293n+T8zHREPyBKWDSImr3B/6EiL9uvSzhrYwYC4l5IxT
         BZAtUN5NxJz8qvKyZ/6u/OgZiTuyMCTvPNR/N7yZ4CiXhlZOnB3bXHilzuaATwwlEgcz
         qJMA==
X-Gm-Message-State: AOAM530WtUZmo2+piN+qjPGKw1hUZmy+/XbNyvYlHjtMVaxVGGX20acM
        iqcQrMEXWKRfaSo74QI5XpU=
X-Google-Smtp-Source: ABdhPJwnOWfP+I35usYEUsx2VvRIg5MxLc+LvcRDXBfbgRrG4h5gDq9y0E9A+/gFBy3D1W0qwaVQTA==
X-Received: by 2002:adf:e48d:: with SMTP id i13mr4253214wrm.288.1628871729461;
        Fri, 13 Aug 2021 09:22:09 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id y19sm1993919wmq.5.2021.08.13.09.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 09:22:08 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 6/6] arm64: tegra: Device tree changes for v5.15-rc1
Date:   Fri, 13 Aug 2021 18:21:57 +0200
Message-Id: <20210813162157.2820913-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210813162157.2820913-1-thierry.reding@gmail.com>
References: <20210813162157.2820913-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.15-arm64-dt

for you to fetch changes up to f865d0292ff3c0ca09414436510eb4c815815509:

  arm64: tegra: Fix compatible string for Tegra132 CPUs (2021-08-13 18:01:01 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v5.15-rc1

Contains a couple of fixes across the board and adds support for the
recently released NVIDIA Jetson TX2 NX Developer Kit.

----------------------------------------------------------------
Dmitry Osipenko (1):
      arm64: tegra194: p2888: Correct interrupt trigger type of temperature sensor

Thierry Reding (4):
      arm64: tegra: Add PWM nodes on Tegra186
      arm64: tegra: Add NVIDIA Jetson TX2 NX Developer Kit support
      arm64: tegra: Add missing interconnects property for USB on Tegra186
      arm64: tegra: Fix compatible string for Tegra132 CPUs

Vidya Sagar (1):
      arm64: tegra: Fix Tegra194 PCIe EP compatible string

 arch/arm64/boot/dts/nvidia/Makefile                |   1 +
 arch/arm64/boot/dts/nvidia/tegra132.dtsi           |   4 +-
 .../dts/nvidia/tegra186-p3509-0000+p3636-0001.dts  | 718 +++++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |  91 +++
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi     |   2 +-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           |   6 +-
 6 files changed, 816 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts
