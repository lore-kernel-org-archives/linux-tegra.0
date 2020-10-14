Return-Path: <SRS0=m5en=DV=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69027C433DF
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Oct 2020 18:06:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1C4962223F
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Oct 2020 18:06:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728178AbgJNSGA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 14 Oct 2020 14:06:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727498AbgJNSGA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 14 Oct 2020 14:06:00 -0400
X-Greylist: delayed 542 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 14 Oct 2020 11:06:00 PDT
Received: from hera.iit.uni-miskolc.hu (hera.iit.uni-miskolc.hu [IPv6:2001:738:6001:500::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C6CAC061755;
        Wed, 14 Oct 2020 11:06:00 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by hera.iit.uni-miskolc.hu (Postfix) with ESMTP id 126C026C3;
        Wed, 14 Oct 2020 19:56:44 +0200 (CEST)
X-Virus-Scanned: Kamavis at iit.uni-miskolc.hu
Received: from hera.iit.uni-miskolc.hu ([127.0.0.1])
        by localhost (hera.iit.uni-miskolc.hu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id y9r6n9ypbQcq; Wed, 14 Oct 2020 19:56:37 +0200 (CEST)
Received: from titan.hitronhub.home (unknown [IPv6:2a02:8109:a180:908:226:9eff:fe30:2af8])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: szucst@iit.uni-miskolc.hu)
        by hera.iit.uni-miskolc.hu (Postfix) with ESMTPSA id 0774613D;
        Wed, 14 Oct 2020 19:56:36 +0200 (CEST)
From:   =?UTF-8?q?Tam=C3=A1s=20Sz=C5=B1cs?= <tszucs@protonmail.ch>
To:     Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        JC Kuo <jckuo@nvidia.com>, Vidya Sagar <vidyas@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?Tam=C3=A1s=20Sz=C5=B1cs?= <tszucs@protonmail.ch>
Subject: [PATCH v3 0/5] arm64: tegra: Xavier SDMMC changes
Date:   Wed, 14 Oct 2020 19:56:22 +0200
Message-Id: <20201014175627.5585-1-tszucs@protonmail.ch>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Upstream Xavier SDMMC needs some love. I've been able to test with a Jetson AGX Xavier.
Changes here work for me with 1.8 V and 3.3 V SD and SDIO devices.

Changes in v3:
- I started seeing ocasional eMMC init timeouts on cold starts when HS400 is enabled, so drop this until fix is found
- add missing vmmc-supply regulator for SDMMC1
- specify bus width and disable WP for SDMMC1
- specify primary clock source for SDMMC1 and SDMMC3

Changes in v2:
- fix board name in commit messages
- rebase on for-next

Kind regards,
Tamas


Tamás Szűcs (5):
  arm64: tegra: Enable signal voltage switching on Tegra194 SDMMC1 and
    SDMMC3
  arm64: tegra: Specify sdhci clock parent for Tegra194 SDMMC1 and
    SDMMC3
  arm64: tegra: Fix CD on Jetson AGX Xavier SDMMC1
  arm64: tegra: Add vmmc-supply regulator for Jetson AGX Xavier SDMMC1
  arm64: tegra: Configure SDIO cards on Jetson AGX Xavier SDMMC1

 .../arm64/boot/dts/nvidia/tegra194-p2888.dtsi | 18 ++++++-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi      | 51 +++++++++++++++++++
 2 files changed, 68 insertions(+), 1 deletion(-)

-- 
2.20.1

