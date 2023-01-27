Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3B8CC38142
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Jan 2023 16:37:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234958AbjA0QhX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 27 Jan 2023 11:37:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233726AbjA0QhX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 27 Jan 2023 11:37:23 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EDA76A53
        for <linux-tegra@vger.kernel.org>; Fri, 27 Jan 2023 08:37:22 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id p26so3988449ejx.13
        for <linux-tegra@vger.kernel.org>; Fri, 27 Jan 2023 08:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tnj0zpczhmcTzZWovcf4QbYmqlrEFwZcGfqBRwRNeFw=;
        b=MsnWXElr9sfADHXguuJLqPy9I6bjt/Kr4bqk86PguwNi4DxyXKT7C7gDREJzKHbpAu
         g1yOTQTdWPM2L6xsNlBz1zO5/YYSIU3/pzl/O1KOOvYzbQE8w/LiXydrua4F1tZV16iF
         fYISvdYQ6Z0dP7m9mzXf7hCEPfYbFSfLuKyyiOQIh3ADJiysN+t7k4EAQgsrDLvC6c/6
         mQtpTr7Y9mbWGrYllwG2QhqUwVGfMGeNNyNxw2Fgc/efXuRydjrs5CnyYOCeAEmqB1QU
         cBIaY1Xk2BK1847ZLPUlzleQ9Y7sCIiciOpLLOLo4qE7YYWY5nufOJouT19+jxqImxLE
         AvbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tnj0zpczhmcTzZWovcf4QbYmqlrEFwZcGfqBRwRNeFw=;
        b=zDBBE5goXpok8s/bEzYUPBQx7onFV6Sxa1Nsjw+yKD0nywktFr5KP5FV305MomYyR5
         3Q0JM2+mUvrESsNPAD7scC5Li5Ieuwmjd7PWzUxwrx2rahvzV2onG92CxzfYQL5tiYMQ
         9+PIoM8EG+o7E+jsunppeVbHKkAL3FZO5jYYHIl8ClR8h2aRYWnnNweLM5w2iVyqHhJG
         YbP8dOFOpO16YTu5Dx9am7MVuoetrsLfVsNtXB7EHNqmSVkYw+mn+ibjsD4B+xll4jQu
         t2UOM9GDRJayBrjThb4O7xpnz9j8/7RRBu0gBs4ADPoRLAmAMCNL2H7lxUlo8yrG1/vp
         oaSQ==
X-Gm-Message-State: AO0yUKXhmI78rKmcEW9fdYIxDXa19CcGSFsbZ2X0+kafoVQHmesOIOQN
        vqvRNHPS4gwXCrfjB69M1+2Q5w6/s4c=
X-Google-Smtp-Source: AK7set9d6Sm1TaXTwdPVtDvQZkK7R7uhAqkPUcAYV15CuCFkVluZakTYNf9onU9UJTQ4F2qHSKDe7A==
X-Received: by 2002:a17:907:3e90:b0:87b:dac5:eb86 with SMTP id hs16-20020a1709073e9000b0087bdac5eb86mr3012143ejc.22.1674837440614;
        Fri, 27 Jan 2023 08:37:20 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id gv28-20020a1709072bdc00b0078d22b0bcf2sm2512937ejc.168.2023.01.27.08.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 08:37:20 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/3] dt-bindings: Changes for v6.3-rc1
Date:   Fri, 27 Jan 2023 17:37:17 +0100
Message-Id: <20230127163719.460954-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.39.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.3-dt-bindings

for you to fetch changes up to 6427569ff14766aea855afca782424918668536b:

  dt-bindings: tegra: Allow #{address,size}-cells = <2> (2023-01-27 17:21:25 +0100)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v6.3-rc1

Device tree files for 64-bit ARM Tegra SoCs have recently had to bump
the #address-cells and #size-cells to 2 in order to support bus address
translations across the entire device tree hierarchy. Explicitly allow
this in DT schemas to prevent validation errors.

----------------------------------------------------------------
Thierry Reding (1):
      dt-bindings: tegra: Allow #{address,size}-cells = <2>

 Documentation/devicetree/bindings/bus/nvidia,tegra210-aconnect.yaml   | 4 ++--
 .../devicetree/bindings/display/tegra/nvidia,tegra186-display.yaml    | 4 ++--
 Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml     | 4 ++--
 Documentation/devicetree/bindings/sound/nvidia,tegra210-ope.yaml      | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)
