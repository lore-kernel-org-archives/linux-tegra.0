Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71F6AC43219
	for <linux-tegra@archiver.kernel.org>; Fri, 10 Sep 2021 10:43:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5F45B611AD
	for <linux-tegra@archiver.kernel.org>; Fri, 10 Sep 2021 10:43:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232430AbhIJKoP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 10 Sep 2021 06:44:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232488AbhIJKoN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 10 Sep 2021 06:44:13 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6DD0C061756;
        Fri, 10 Sep 2021 03:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
        :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=Yogfv2Yi339SegP6Z35FOnJjy3FmfNyA9OjilfPTuVc=; b=JWmON8IfmlGzcQxv3GOO9/RbTt
        TBQoHpAQ324oQ5Aj+OMG9ioLMojB3jb+cP4a1uu12Ffbusvx9GDoCieuAPh5HDvVSfF618Ybz72tu
        4RqmJJ4jOfKVFVEeKFJ4qqKls2+D9lmSeks8SXM+onaHgZxpU52vVsytobBGikx+i+7FZNVPiEGW7
        lOsfLWKZw6VCYhvEDM+xtOtSS4MsQbLW9zuqZwrOPOEPn8NtrlJGu7TIKAMDa+TNxSCkIv/OjQG0Z
        FPqCC3U08xfE5vaOpIZlvsbVTDm0ntAw3ZNI/FhqYLeLq5lpWyWN7Bc30bEmgSadzn/D9/UuEjPAx
        BLVTX9Cg==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1mOdzg-00056E-9A; Fri, 10 Sep 2021 13:42:52 +0300
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
        daniel@ffwll.ch, robh+dt@kernel.org
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v5 0/3] NVIDIA Tegra NVDEC support
Date:   Fri, 10 Sep 2021 13:42:44 +0300
Message-Id: <20210910104247.1206716-1-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Here's the v5 of the NVDEC support series, containing the
following changes:

* Changed from nvidia,instance property to nvidia,host1x-class
  property.
* Set additionalProperties to false in DT bindings.
* Added dma-coherent property to DT bindings.

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

 .../gpu/host1x/nvidia,tegra210-nvdec.yaml     | 104 ++++
 MAINTAINERS                                   |   1 +
 arch/arm64/boot/dts/nvidia/tegra186.dtsi      |  16 +
 arch/arm64/boot/dts/nvidia/tegra194.dtsi      |  38 ++
 drivers/gpu/drm/tegra/Makefile                |   3 +-
 drivers/gpu/drm/tegra/drm.c                   |   4 +
 drivers/gpu/drm/tegra/drm.h                   |   1 +
 drivers/gpu/drm/tegra/nvdec.c                 | 464 ++++++++++++++++++
 drivers/gpu/host1x/dev.c                      |  18 +
 include/linux/host1x.h                        |   2 +
 10 files changed, 650 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
 create mode 100644 drivers/gpu/drm/tegra/nvdec.c

-- 
2.32.0

