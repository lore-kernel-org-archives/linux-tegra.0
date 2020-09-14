Return-Path: <SRS0=22zn=CX=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5146EC433E2
	for <linux-tegra@archiver.kernel.org>; Mon, 14 Sep 2020 13:43:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EAA2920EDD
	for <linux-tegra@archiver.kernel.org>; Mon, 14 Sep 2020 13:43:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YgxrxBng"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726389AbgINNno (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 14 Sep 2020 09:43:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726743AbgINNhn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 14 Sep 2020 09:37:43 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E73FC06174A
        for <linux-tegra@vger.kernel.org>; Mon, 14 Sep 2020 06:37:43 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id w5so18759156wrp.8
        for <linux-tegra@vger.kernel.org>; Mon, 14 Sep 2020 06:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DIBNnH98Bo9BzltngW/I09W1HaSjXZnHjp0co8BC4UQ=;
        b=YgxrxBng/yOdc5ZyP119xtJkLJyGQ/bYarc0uypMb3DWpshIEULRTqu4eYTJaHIpKX
         9VBKeoH/d+t8Sq9yVsXRlkg1WRTARO9zDl586EM47gEkgamZSy4XmVa378d/uLobHP9u
         7/0yzbDiFCiP2h5Fw+5Co4Ksr864rKqP3uCr+Fu88jk4beir9dacCBGoSDnpOw0tRlIX
         796ftHlZCDLpsmlFXANLBUTzzA2J+jh1HPjPlFdbhjlCNQz6R2vzBFLO5enPzfMXY69j
         27uJngYdVvKxNZPqKwnzRP8IUuq4w4CmgysdEJUCa9Vtk/qSuQC38ok2fgGkNrXQVQ6v
         AKgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DIBNnH98Bo9BzltngW/I09W1HaSjXZnHjp0co8BC4UQ=;
        b=MrT/eOhfd4emrNkLpNrgmW9tcxigDqkfYPAUvWB1qe1AmZsMPHtkY4f9H1ZopUyaPd
         nePLucEJRDpLIRE/G+6XoVWLamQXcsv5bR8zoYNiQf+UsGT6jE6blMeR023uFacnYYCe
         ZABq8OwwOWaSJo803xj+DHtpOnO6nypwKRa8LQksphyptQP8opUV3o41r09AV+CH91vX
         JOqKhdtaPpIs7XSzmeUnNSnBnHIDkdMfbGwRYrpXM9O3zipv/Hrkc8xXQNkq14hG7Usg
         SZkKGsNtGLnq1hHooiLxEIp+E9RYbwfO1L+npTCziDLTHgpAQESis+Lgb9bqOKJUK0k7
         2JKw==
X-Gm-Message-State: AOAM530OIDvJKdDOEIV2jazJxvrEc4Dge/DjYnmMTyOiJk7GiUXyvdDR
        DqrmW5gsGyIMpvNh0Y5ufl8=
X-Google-Smtp-Source: ABdhPJwWLsoqVSihQ2HEtVgy6jxblOLdk1GQEVGxeZ9y8leBpNHOo8iOBV+e0zUlFLVbwwLGOtBR/g==
X-Received: by 2002:adf:db52:: with SMTP id f18mr15860914wrj.397.1600090661824;
        Mon, 14 Sep 2020 06:37:41 -0700 (PDT)
Received: from arrakis.kwizart.net (lfbn-nic-1-212-171.w2-15.abo.wanadoo.fr. [2.15.59.171])
        by smtp.gmail.com with ESMTPSA id a11sm18532488wmm.18.2020.09.14.06.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 06:37:41 -0700 (PDT)
From:   Nicolas Chauvet <kwizart@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org, Nicolas Chauvet <kwizart@gmail.com>
Subject: [PATCH 0/4] ARM: tegra: soctherm bugfixes
Date:   Mon, 14 Sep 2020 15:37:35 +0200
Message-Id: <20200914133739.60020-1-kwizart@gmail.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

When using tegra_soctherm driver on jetson-tk1, the following messages
can be seen:
from kernel: tegra_soctherm 700e2000.thermal-sensor: 
 throttle-cfg: heavy: no throt prop or invalid prop
 soctherm: trip temperature -2147483647 forced to -127000
 thermtrip: will shut down when cpu reaches 101000 mC
 soctherm: trip temperature -2147483647 forced to -127000
 thermtrip: will shut down when gpu reaches 101000 mC
 soctherm: trip temperature -2147483647 forced to -127000
 thermtrip: will shut down when pll reaches 103000 mC
 throttrip: pll: missing hot temperature
 soctherm: trip temperature -2147483647 forced to -127000
 thermtrip: will shut down when mem reaches 101000 mC
 throttrip: mem: missing hot temperature
 IRQ index 1 not found

This serie fixes two errors and two warnings that are reported in dmesg
It was compiled and tested at runtime on jetson-tk1 only.

Nicolas Chauvet (4):
  ARM: tegra: Add missing gpu-throt-level to tegra124 soctherm
  ARM: tegra: Add missing hot temperatures to tegra124 thermal-zones
  arm64: tegra: Add missing hot temperatures to tegra132 thermal-zones
  ARM: tegra: Avoid setting edp_irq when not relevant

 arch/arm/boot/dts/tegra124.dtsi          | 11 +++++++++++
 arch/arm64/boot/dts/nvidia/tegra132.dtsi | 10 ++++++++++
 drivers/thermal/tegra/soctherm.c         | 17 +++++++++++------
 3 files changed, 32 insertions(+), 6 deletions(-)

-- 
2.25.4

