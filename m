Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7D33C64E75
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Nov 2020 14:43:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6FE6620B1F
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Nov 2020 14:43:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kIg1Y7US"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730924AbgK0Ono (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 27 Nov 2020 09:43:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730899AbgK0Onn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 27 Nov 2020 09:43:43 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B0E3C0613D1
        for <linux-tegra@vger.kernel.org>; Fri, 27 Nov 2020 06:43:42 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id l1so5815809wrb.9
        for <linux-tegra@vger.kernel.org>; Fri, 27 Nov 2020 06:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+Kh9Jm7QmiQmxxud+Xmj5HmTaSKRgMJx1GoEcOwNpSA=;
        b=kIg1Y7USHaGtQqdqcIAdKsL/Bt7Egm1i7QJhhYQu5XWbcy4jtVvhKiVJShmaIeZvMc
         tjdqV8zt6WAi16p+XJrhKGx8J9oTcYIDT432nR8JQAtgjUPON6egJsy+utnpN1vyF63W
         Rw+Xeycfauh6cY9QMvBQKi+nGWBfcGy1jwI/BbcIWu4SphOgDP44T3AozXeGAyJtI+he
         RqTdj5n8nsINHRmXBVkFcoHFHupFmeXIMU3t8CrSv68FpyrCzqUR2LUp9zL78fA9myWy
         /L0qApICyRpkoYLaUHMWxvEs9sft9ZKRwp6EyBZYQAMrbKyu+9IunMXfjueq+iyjzC/i
         tPSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+Kh9Jm7QmiQmxxud+Xmj5HmTaSKRgMJx1GoEcOwNpSA=;
        b=m2gnGO3wZ2rIHm5DGPCTQ0RGSZ6nmvjSNmqR528JQRNt30SNnu7j5sqTYsupCcxlJn
         pXhe4nmbfVO1jSa9ZLVvUFeCF/Is9/9ry73bUCbqV9hN15k0IvurpgW+Rla48kvsbyNg
         B0jQXc8iEH64NMoDEmhaZtacieBRg8Xl06XPs9bo9RMiw+bza0BiXGxKlMfq1G6/FMUf
         lHBj/yLXPF3QKuAWrCNYN3NRP97ilKUdEdZoD5M7g3MVgl0m26XER365SMcD+JStMPl6
         48gStHU/d+mvcUcXd0Cm+P49wir5pp1/FxaeL4Q9cZ7ohjLtGcGZkDp6GrCGxBv1Gy0g
         jaqg==
X-Gm-Message-State: AOAM530l6vwbmCh0IAsG1fR/tXjoRKpZjG/6z4GV0J8KjeXHXIp+ptT1
        zf7gbbrCBLvn2R1lM2DWU4s=
X-Google-Smtp-Source: ABdhPJwBbG6Rmkf63OlbL6061dO06RQMCvwkMraAf6Tou26N8eZMn+8B0JaTqq4zxWCgmtaJYJWCSg==
X-Received: by 2002:a5d:56cb:: with SMTP id m11mr11463040wrw.346.1606488218698;
        Fri, 27 Nov 2020 06:43:38 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id 2sm17797811wrq.87.2020.11.27.06.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 06:43:37 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/6] ARM: tegra: Device tree changes for v5.11-rc1
Date:   Fri, 27 Nov 2020 15:43:27 +0100
Message-Id: <20201127144329.124891-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201127144329.124891-1-thierry.reding@gmail.com>
References: <20201127144329.124891-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.11-arm-dt

for you to fetch changes up to d63250d7fd49503bac48099fcef24ba7985009a3:

  ARM: tegra: Add EMC OPP and ICC properties to Tegra124 EMC and ACTMON device-tree nodes (2020-11-26 19:08:39 +0100)

Note that this pull in a subset of the tegra-for-5.11-dt-bindings PR to
satisfy a build dependency on the memory client IDs used in some of the
patches from Dmitry in this set.

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v5.11-rc1

This adds support for the Tegra30-based Ouya game console and enhances a
number of existing device trees. It also fixes a couple of minor issues
that were found during DT validation.

----------------------------------------------------------------
Dmitry Osipenko (19):
      dt-bindings: memory: tegra20: Add memory client IDs
      dt-bindings: memory: tegra30: Add memory client IDs
      dt-bindings: memory: tegra124: Add memory client IDs
      ARM: tegra: acer-a500: Correct thermal zone names
      ARM: tegra: acer-a500: Add power-supply to lvds-encoder node
      ARM: tegra: nexus7: Correct thermal zone names
      ARM: tegra: nexus7: Improve CPU passive-cooling threshold
      ARM: tegra: nexus7: Add power-supply to lvds-encoder node
      ARM: tegra: nexus7: Rename gpio-hog nodes
      ARM: tegra: nexus7: Use panel-lvds as the only panel compatible
      ARM: tegra: Correct EMC registers size in Tegra20 device-tree
      ARM: tegra: acer-a500: Add Embedded Controller
      ARM: tegra: Add interconnect properties to Tegra20 device-tree
      ARM: tegra: Add interconnect properties to Tegra30 device-tree
      ARM: tegra: Add interconnect properties to Tegra124 device-tree
      ARM: tegra: Add nvidia,memory-controller phandle to Tegra20 EMC device-tree
      ARM: tegra: Add EMC OPP properties to Tegra20 device-trees
      ARM: tegra: Add EMC OPP and ICC properties to Tegra30 EMC and ACTMON device-tree nodes
      ARM: tegra: Add EMC OPP and ICC properties to Tegra124 EMC and ACTMON device-tree nodes

Jon Hunter (1):
      ARM: tegra: Populate OPP table for Tegra20 Ventana

Nicolas Chauvet (2):
      ARM: tegra: Add missing gpu-throt-level to Tegra124 soctherm
      ARM: tegra: Add missing hot temperatures to Tegra124 thermal-zones

Peter Geis (1):
      ARM: tegra: Add device-tree for Ouya

Sowjanya Komatineni (1):
      ARM: tegra: Change order of SATA resets for Tegra124

Thierry Reding (3):
      Merge branch 'for-5.11/dt-bindings' into for-5.11/arm/dt
      ARM: tegra: Hook up edp interrupt on Tegra124 SOCTHERM
      ARM: tegra: Properly align clocks for SOCTHERM

 arch/arm/boot/dts/Makefile                         |    3 +-
 arch/arm/boot/dts/tegra124-apalis-emc.dtsi         |    8 +
 arch/arm/boot/dts/tegra124-jetson-tk1-emc.dtsi     |    8 +
 arch/arm/boot/dts/tegra124-nyan-big-emc.dtsi       |   10 +
 arch/arm/boot/dts/tegra124-nyan-blaze-emc.dtsi     |   10 +
 arch/arm/boot/dts/tegra124-peripherals-opp.dtsi    |  419 ++
 arch/arm/boot/dts/tegra124.dtsi                    |   54 +-
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts    |   27 +-
 arch/arm/boot/dts/tegra20-colibri.dtsi             |    4 +
 arch/arm/boot/dts/tegra20-paz00.dts                |    4 +
 arch/arm/boot/dts/tegra20-peripherals-opp.dtsi     |  109 +
 arch/arm/boot/dts/tegra20-ventana.dts              |   11 +
 arch/arm/boot/dts/tegra20.dtsi                     |   33 +-
 .../dts/tegra30-asus-nexus7-grouper-common.dtsi    |   27 +-
 .../tegra30-asus-nexus7-grouper-maxim-pmic.dtsi    |    2 +-
 ...tegra30-asus-nexus7-grouper-memory-timings.dtsi |   12 +
 arch/arm/boot/dts/tegra30-asus-nexus7-tilapia.dtsi |    2 +-
 arch/arm/boot/dts/tegra30-ouya.dts                 | 4519 ++++++++++++++++++++
 arch/arm/boot/dts/tegra30-peripherals-opp.dtsi     |  383 ++
 arch/arm/boot/dts/tegra30.dtsi                     |   33 +-
 include/dt-bindings/memory/tegra124-mc.h           |   68 +
 include/dt-bindings/memory/tegra20-mc.h            |   53 +
 include/dt-bindings/memory/tegra30-mc.h            |   67 +
 23 files changed, 5844 insertions(+), 22 deletions(-)
 create mode 100644 arch/arm/boot/dts/tegra124-peripherals-opp.dtsi
 create mode 100644 arch/arm/boot/dts/tegra20-peripherals-opp.dtsi
 create mode 100644 arch/arm/boot/dts/tegra30-ouya.dts
 create mode 100644 arch/arm/boot/dts/tegra30-peripherals-opp.dtsi
