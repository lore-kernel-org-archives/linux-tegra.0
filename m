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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AA39C07E99
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Jul 2021 12:05:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D7E94613CC
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Jul 2021 12:05:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231152AbhGIMI1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 9 Jul 2021 08:08:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230404AbhGIMI1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Jul 2021 08:08:27 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18346C0613DD
        for <linux-tegra@vger.kernel.org>; Fri,  9 Jul 2021 05:05:43 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id t14-20020a05600c198eb029020c8aac53d4so25077986wmq.1
        for <linux-tegra@vger.kernel.org>; Fri, 09 Jul 2021 05:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LTDEG9hvZInxM37EKZrzZicUKHO/JiAFLKZv8qufjKU=;
        b=jNhXOnRyWet7pdO2shipHZ9vU8Wsf4crnYNrygsILNxSahTLJ8YuN3KeiBxefgNzwk
         qAjBL1Ns/61zEMQY17u0Z40k8bZlhCeMXcOM7NDfGDNoUfZOBgc6sB861URFMxKoJJTw
         CdYdpVX0R1M/S7sk0OS8IZzKjreMx4s0y2x6hTlaj/+CbZ3absfX8HqKcT1c9nMWX+/e
         naxWRytFVn5XCo8xWmCoSOhLJxZYP8t6cl/2/7N+Gc87LsHYCBkowRWmluG+Vw/hyhai
         f00KTAmdy/hN1d5+KgSBK05loC0bvDoXjaEPkpQrsjHmyp2I/tYOH7aGagClWWjexou+
         rAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LTDEG9hvZInxM37EKZrzZicUKHO/JiAFLKZv8qufjKU=;
        b=KAZIJpsia5wS6vXGis9jXvQXwSdTcr1govWNAjD8ou3VGR8Xia0lQqf8oOl5nYQmNJ
         y6NMDVJPhqrPpY+0X2dd37c2dGSI7KkUANPHfvnU5NfuKZkTRTBgzfuuaUajRvnzhXSu
         GOyMtneQwdBwGlV5ciuKtI7zmoz68wnxB2S8vHW9HjiWN2ng8f2uK6kAviSicdw5vtQZ
         2KM0NqOqHQL8tfCOC3ytH8PXdAznuxzWg8/4DJWHg42A62mbbeQzvZtxzvMDx00Ki9EH
         xGofnKJyMfIHVzALgPpEjN75x2WxAq5glUyDmZKt5eLxBDiZ+dWv+Hc6edF3cPnuTsLB
         fQJg==
X-Gm-Message-State: AOAM532Tf1nvgEFPqhbUWUQMvsMQbUOiPGvo/cIbC40qUr0iG8QD9JFz
        tabAKt8lOh81UYlOO9bZqS8=
X-Google-Smtp-Source: ABdhPJyrD2PALCtAQWdI+3LCYqDTZ7ve0J0SKzSbA89keGTe0RvKFv8kMOHdA9C2iXzNyz8fmANv0w==
X-Received: by 2002:a05:600c:2281:: with SMTP id 1mr16567968wmf.10.1625832341685;
        Fri, 09 Jul 2021 05:05:41 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id s1sm11875597wmj.8.2021.07.09.05.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 05:05:40 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: tegra: Enable audio IOMMU support on Tegra194
Date:   Fri,  9 Jul 2021 14:08:12 +0200
Message-Id: <20210709120812.2529034-1-thierry.reding@gmail.com>
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

