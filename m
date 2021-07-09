Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6BA2C07E99
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Jul 2021 12:08:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BBFFF613CA
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Jul 2021 12:08:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230404AbhGIMLi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 9 Jul 2021 08:11:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230209AbhGIMLi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Jul 2021 08:11:38 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3BC1C0613DD
        for <linux-tegra@vger.kernel.org>; Fri,  9 Jul 2021 05:08:54 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id t14-20020a05600c198eb029020c8aac53d4so25097084wmq.1
        for <linux-tegra@vger.kernel.org>; Fri, 09 Jul 2021 05:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LTDEG9hvZInxM37EKZrzZicUKHO/JiAFLKZv8qufjKU=;
        b=BKCFJClkP2JlUFSSfZ+rrc6jNPseKNQAMRYBZ4nWhBIg9GFmxj9En7VYWlZ/iWq57t
         DrexhzL2IwJ4Zdz8S+GVXnC/8DGTDAj2K4lFLu5kZ04he3oLKpTBwG7VrAWISVZoeevR
         12R+Cog4KKncQ1Lu64YcwyMNF440AjdCwV2kvYQ1TID77XjMRie+cm1UpGTuVAJRilod
         RiBfdF/cN/U+vEr4SZo8lPe3GG5oKesOANApyCwLxcko1lyj2fdbb1ltRbOfmWIDuhvu
         VfedZz83D/yeXyvzlIuVczxqgpqWp+LfoSKjuC+/OhFsKeouDsyVbJ3siZoYhpePkAoT
         wPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LTDEG9hvZInxM37EKZrzZicUKHO/JiAFLKZv8qufjKU=;
        b=CRXIBy/p3hLOa+BUI/KCT2I10mFOnNURAurNAorOV503XaM9k5/k8Asz2frBKz6Il+
         4kwiN3VGvys6uIVydJwUNAYfS4hpz0qGv1b1Te9admeECPnHZ3+s/wLq94qYtTuyTik+
         Lm9L8xY/oFHWL9kuW3O7j/Qowq4phi+j2wHhirzDpO5QbSmcU31l5qt/SLa/G52Wl3Dg
         LgHU2ZBqiXW4y/o5BAHVwR2PJehpFScIF+0agLh3gbaS3JdODbrp3bKooHjwsaPFsHvX
         fuHEKo5qWI2Q+H7kpTLbxWl8LldcWPHhCYYkflIqyhU6WyqILXRUybBOjJ8xt/Buovpt
         nFhA==
X-Gm-Message-State: AOAM532fK0SWf4be9bpnm3+Wv2u34WS+lyfTTX+4qTKmHhjS+Cevsx0P
        n8seG0yjzR2W0NkVXdZ+aCU=
X-Google-Smtp-Source: ABdhPJyLp1fIPcAF97n0rDx0phQwLJUE0DP9Vnmz5G4uyVPJXUL3wpt/0beDkY7UMC2A2sz+WkB1FA==
X-Received: by 2002:a1c:59c3:: with SMTP id n186mr11569999wmb.48.1625832533485;
        Fri, 09 Jul 2021 05:08:53 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id d3sm5001926wrx.77.2021.07.09.05.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 05:08:52 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: tegra: Enable audio IOMMU support on Tegra194
Date:   Fri,  9 Jul 2021 14:11:27 +0200
Message-Id: <20210709121127.2529364-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Add iommus and interconnects properties to the sound device tree node on
Tegra194. This ensures that the correct SID is used for translation of
physical to I/O virtual addresses and that the path to system memory is
properly described, which in turn can impact the range of memory that
the device can address.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index a6e61d899a27..076d5efc4c3d 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -2477,6 +2477,11 @@ sound {
 		 * for 8x and 11.025x sample rate streams.
 		 */
 		assigned-clock-rates = <258000000>;
+
+		interconnects = <&mc TEGRA194_MEMORY_CLIENT_APEDMAR &emc>,
+				<&mc TEGRA194_MEMORY_CLIENT_APEDMAW &emc>;
+		interconnect-names = "dma-mem", "write";
+		iommus = <&smmu TEGRA194_SID_APE>;
 	};
 
 	tcu: tcu {
-- 
2.32.0

