Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4172CC4338F
	for <linux-tegra@archiver.kernel.org>; Thu, 12 Aug 2021 14:17:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2095F6023D
	for <linux-tegra@archiver.kernel.org>; Thu, 12 Aug 2021 14:17:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236487AbhHLORq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 12 Aug 2021 10:17:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237290AbhHLORo (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 12 Aug 2021 10:17:44 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E04BC0617AD
        for <linux-tegra@vger.kernel.org>; Thu, 12 Aug 2021 07:17:19 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id l18so8551449wrv.5
        for <linux-tegra@vger.kernel.org>; Thu, 12 Aug 2021 07:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ss/IPfEyG/sp5S2fy/wct6ETV94/967xCU18WTHi7NE=;
        b=WLXHY1LXd0vdOX98TZcJV5pZmkSRMpaniUAnrY8csLGAD08tz8byvFDtWA17jCQ8d5
         l6rheA64erFgHJgHXm81s9WG5FQCdabCrWP0sRsfoPqNp1is3XbkScczepSQh/3hQoVC
         GGenWq0hV71DSazcd4U3j6eMOltdE5YtCWuOR765JADS6SXxzMdoHgABHGuYatbRLLBe
         f1hqPy+MMrW1v/k2ak27UOoxx6zI1iIHhFlHq0VuYbGgLKGvFbqyp9qzHcEbml7pp6nZ
         ++OXJH73mokZDKOjlrm897Tr4uFQeI7IMVcOZAoSOyAGMnFHO0OPbGGC0hi//t6Lj8rs
         Pl8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ss/IPfEyG/sp5S2fy/wct6ETV94/967xCU18WTHi7NE=;
        b=mfDxOgg1xSriS63QrF4txnzuCCf1aGUThGjsRKYq+Amo2yCLTOAAY4tq4WAgYyqQRG
         kL0dcV/zEs6RVnrOpb6TsKyXbmp/Ypzemffv6Sd0O2XcR7MKeJN7a5z0nuqUy84iIkCI
         PvNKHjY/XGPmtlgbPCKQNqyIxD8YgV1i+DrKmShKp2vGTe5RIQI/TnwKpZ/x499MJNxj
         90r/8EFYIZ2uXFwIjQE3sL6a+wLLkKNPrfUcKk5ZsbXfzniAFhNkVllmCZf1J0gW3dZD
         P4Fpqa5mUuPds2HQS5VMgnat1zLijiEhfQvw/QO8u1e9nina0YXBctKp9wAaXRpAKuuR
         LNLg==
X-Gm-Message-State: AOAM532vUXuwJod7qsTNU/eZOJELE8kgp5WpmgM++xmdQeVNRz2dMFBD
        LVAvVRTNXetewW13r+3PSkY=
X-Google-Smtp-Source: ABdhPJzPVbyeiU6ecckxTt8glsOVxxkYMT0artCdZCp76WZ2bbFcw5m4jsHC6avRFcgpuh8O2AqYug==
X-Received: by 2002:adf:f08e:: with SMTP id n14mr4182943wro.427.1628777837634;
        Thu, 12 Aug 2021 07:17:17 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id x18sm3099807wrw.19.2021.08.12.07.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Aug 2021 07:17:16 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: tegra: Add missing interconnects property for USB on Tegra186
Date:   Thu, 12 Aug 2021 16:17:12 +0200
Message-Id: <20210812141712.2394152-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The device tree node for the XUDC (USB device mode controller) is
missing the interconnects property that describes the path to memory for
the controller. Add the property so that the things like the DMA mask
can be set by the operating system.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index d1e20dbc5f4b..5c45fab0c9ab 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -826,6 +826,9 @@ usb@3550000 {
 			 <&bpmp TEGRA186_CLK_XUSB_CORE_SS>,
 			 <&bpmp TEGRA186_CLK_XUSB_FS>;
 		clock-names = "dev", "ss", "ss_src", "fs_src";
+		interconnects = <&mc TEGRA186_MEMORY_CLIENT_XUSB_DEVR &emc>,
+				<&mc TEGRA186_MEMORY_CLIENT_XUSB_DEVW &emc>;
+		interconnect-names = "dma-mem", "write";
 		iommus = <&smmu TEGRA186_SID_XUSB_DEV>;
 		power-domains = <&bpmp TEGRA186_POWER_DOMAIN_XUSBB>,
 				<&bpmp TEGRA186_POWER_DOMAIN_XUSBA>;
-- 
2.32.0

