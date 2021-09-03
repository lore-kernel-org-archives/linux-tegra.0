Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0755C4332F
	for <linux-tegra@archiver.kernel.org>; Fri,  3 Sep 2021 08:32:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B9D6660FDA
	for <linux-tegra@archiver.kernel.org>; Fri,  3 Sep 2021 08:32:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348353AbhICIdg (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 3 Sep 2021 04:33:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348365AbhICIdc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 3 Sep 2021 04:33:32 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2BBFC061760;
        Fri,  3 Sep 2021 01:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
        :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=yIBwTHrxp84ixqgSkq1V60EPaiT6pI6qDFH70zKMtvs=; b=sFZLss2fkyD6vRr5zCodgasiKU
        HH0TPNjsKtWFFd1Ref+X1eTl/ZJY6AGLSxVuFNTDurnMUeMqZhzAR1kEFaF1ZblTppxjiCdoAq6jl
        uhyXwa+b/LQwHp73Axdv6DFA0AxzCbWPEz6f5Chqrzjh3dXV3Vbke73SVonNvl7xAe9vnyi3YJZqC
        uN5jtvvrMZs9VaNTpKA5HVGNOQG/9lNzHsHvHGLk1BoAJ8VZoJL/hLf7q8A98tY/+YzE2JtSXkqT0
        WwXLCSG7aLdmQdzwMREWO8glhvKnljuninLqRiqR7i1WgGxCciLOeTNRjIIy6xFYfu6q/pQdwAIbn
        W/Phly2w==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1mM4cI-0004xK-P4; Fri, 03 Sep 2021 11:32:06 +0300
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
        daniel@ffwll.ch, robh+dt@kernel.org
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v4 0/3] NVIDIA Tegra NVDEC support
Date:   Fri,  3 Sep 2021 11:31:52 +0300
Message-Id: <20210903083155.690022-1-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Here's the v4 of the NVDEC support series, containing two fixes
compared to v3:

* Fixed incorrect compatibility string in bindings YAML
* Added dma-coherent markers to Tegra194 device trees.

NVDEC hardware documentation can be found at
https://github.com/NVIDIA/open-gpu-doc/tree/master/classes/video

and example userspace can be found at
https://github.com/cyndis/vaapi-tegra-driver

Thanks,
Mikko

Mikko Perttunen (3):
  dt-bindings: Add YAML bindings for NVDEC
  arm64: tegra: Add NVDEC to Tegra186/194 device trees
  drm/tegra: Add NVDEC driver

 .../gpu/host1x/nvidia,tegra210-nvdec.yaml     | 109 ++++
 MAINTAINERS                                   |   1 +
 arch/arm64/boot/dts/nvidia/tegra186.dtsi      |  16 +
 arch/arm64/boot/dts/nvidia/tegra194.dtsi      |  38 ++
 drivers/gpu/drm/tegra/Makefile                |   3 +-
 drivers/gpu/drm/tegra/drm.c                   |   4 +
 drivers/gpu/drm/tegra/drm.h                   |   1 +
 drivers/gpu/drm/tegra/nvdec.c                 | 474 ++++++++++++++++++
 drivers/gpu/host1x/dev.c                      |  18 +
 include/linux/host1x.h                        |   2 +
 10 files changed, 665 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
 create mode 100644 drivers/gpu/drm/tegra/nvdec.c

-- 
2.32.0

