Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23466C433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 13:06:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 01B1A610A0
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 13:06:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234942AbhKLNJY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Nov 2021 08:09:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231652AbhKLNJW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Nov 2021 08:09:22 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98B5AC061766;
        Fri, 12 Nov 2021 05:06:31 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id s13so15445553wrb.3;
        Fri, 12 Nov 2021 05:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8Yrfd/ijTqnwsVY0AsIgyAz4+oo/Nt1kqDk4QVJjw1A=;
        b=Jvhp3tqpaMCssceziTTb044FnhBOR+aHEZh+gECgv1H6MZqm3k3hDR8kBzYnmCR142
         85hR/qVOvWuehXjL14CZyRsvBMR0/PXLX/CEcCY+zOC9dhgRma7U19cbEeeA356Tt8Sz
         m1dUlwsbKzTun+Q8WpsTqyU4YW85g35OIYfmqpS5fFdIWmLcpF4yvLtPr8Aig+XEMHjw
         XmkYeeTrqH58D3x0dRLb77Yvj0wldCD36n5aDXJIw0JfpGXa6WbOs+mcs7s+S2Z86gjw
         F32J1rrEgTn1OQ28aJMrevDvve4lLySk582dL24RnB3Twyh4drwgrwgobz6AZ9PfmqLC
         uAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8Yrfd/ijTqnwsVY0AsIgyAz4+oo/Nt1kqDk4QVJjw1A=;
        b=HlrfHth3FPW5qa175bonFgON/EkcwW3is3Cg42hkQW144sL5spK1Dnj0pg3rQ7KtC1
         PGduNLS0QulQMZbwEwW/vAbrfHVHTqY1Ab0AFKQ5lkephO7AgmqjbG0SncWO4bLA1nps
         FlExoJQpcraRU/gR+Eqvt2Hbu/Q0sveZCSzZGat6ik2gui0sK4ELIOkuPHuDfmSgvjCe
         ryHpLOT8A7hcShDxYCESChy9zd98XxKtnFfrs2ihdIaL2C2QoHtji9qypRFxqw5+aixh
         /yAG+bZNHm2bD+CwkX3kYtYupttCJn5PsLvqBwL4ZVGzpv+v1CA8SI9Y74vIQpsbXolC
         w4cw==
X-Gm-Message-State: AOAM533FSJu7/8ANxCMox+sYyUoZF0WatERPlj8YsrrKcsEhfp0TSyCi
        3roku+u1fLlZUgfwjldAVqQl9B1982Sanw==
X-Google-Smtp-Source: ABdhPJwLcB4mQF84pkJgqXGTyb3auYnMOC1x6fc19EOw78pFtAg4mHlrY/+DFBNdYFeKmMDuRuXX1A==
X-Received: by 2002:a5d:69c5:: with SMTP id s5mr17837746wrw.283.1636722390119;
        Fri, 12 Nov 2021 05:06:30 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id g13sm5354445wmk.37.2021.11.12.05.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 05:06:29 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] memory: tegra: Add Tegra234 support
Date:   Fri, 12 Nov 2021 14:06:22 +0100
Message-Id: <20211112130627.3682795-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Hi,

this series adds support to the Tegra memory controller driver for the
version found on the new Tegra234 SoC. It is mostly similar to that on
earlier chips, except that the memory clients differ.

This also updates the device tree binding with a missing property and
ensures that all versions of the memory controller device tree nodes can
be properly validated.

Finally, the device trees for Tegra234 are updated and memory client
nodes are hooked up to the memory controller via interconnect
properties.

Thierry

Thierry Reding (5):
  dt-bindings: memory: tegra: Document #interconnect-cells property
  dt-bindings: memory: tegra: Add Tegra234 support
  memory: tegra: Add Tegra234 support
  arm64: tegra: Add memory controller on Tegra234
  arm64: tegra: Hook up MMC and BPMP to memory controller

 .../nvidia,tegra186-mc.yaml                   | 14 +++-
 arch/arm64/boot/dts/nvidia/tegra234.dtsi      | 57 +++++++++++++
 drivers/memory/tegra/Makefile                 |  1 +
 drivers/memory/tegra/mc.c                     |  3 +
 drivers/memory/tegra/mc.h                     |  7 +-
 drivers/memory/tegra/tegra186-emc.c           |  3 +
 drivers/memory/tegra/tegra234.c               | 81 +++++++++++++++++++
 include/dt-bindings/clock/tegra234-clock.h    |  9 +++
 include/dt-bindings/memory/tegra234-mc.h      | 32 ++++++++
 9 files changed, 203 insertions(+), 4 deletions(-)
 create mode 100644 drivers/memory/tegra/tegra234.c
 create mode 100644 include/dt-bindings/memory/tegra234-mc.h

-- 
2.33.1

