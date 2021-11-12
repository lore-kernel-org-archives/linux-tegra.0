Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3906C433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 12:36:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BA59561029
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 12:36:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235000AbhKLMjL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Nov 2021 07:39:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234881AbhKLMjJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Nov 2021 07:39:09 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC7E8C061766;
        Fri, 12 Nov 2021 04:36:18 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id 67-20020a1c1946000000b0030d4c90fa87so6659137wmz.2;
        Fri, 12 Nov 2021 04:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6WK1y/cxjTkvXk38aQNwyWf+jeR1VRFj1WgDKlQLAvQ=;
        b=nS+elp46LHRsibPWGGXBBAwdxb0qF+TPz9BlDbL0KVl5f2PGuJ9D3PexckYwXMmWnZ
         ySW8jvoAJLRAAhNOXQAvRknWD3KGvMCibcaSmb/7prXIteB83vFOWjn+48UEUiMHY0F8
         mgqRycsx0qVoIOzrnA06j9E/onTxej7/pgzae7pTpJeJc9BO83xiPMZnm32+dT9wjOoE
         hSieZwh24F0Iy6t0UpJmQQmUrMuceMWwAkeTIbsISuC8iZgkAmFZRu5ys2lbI9h4cQ4u
         MqMwR2z2KbboP7pdCIV0JxJ9vWGjZGQLR3q+zpyqRyJ8FCNeDaTY6j8b6Hm1vOJq6L/o
         a2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6WK1y/cxjTkvXk38aQNwyWf+jeR1VRFj1WgDKlQLAvQ=;
        b=1KUlGzr+BUzuQTf5YT94ZcvSeIoyS3+pK17EDCX+zNHQvRgr0sySZJhHWT9wivqWl+
         LC6yWjJaM+cUtZX2ElTm6dPf/MJ3409sEIZ+qur3KBoA4SJHCE1FEtKBQ+jxONd2W6/T
         PLG7niet9/ggC3fDZVVraWhKU7k4hdFgicQ9qS3Hr020gQDe50xzZ18FwbummoOK2JSS
         2AwVU0Knnpd6IQL//3zAB3WL6opJGxlkFcfr3nxk+YleYHA75QUQr8gv1wfjjs3rhot2
         tGE0yYLShCIpQ1nf4+71mY310nkBlGN4aFh9RSDWpw9LMuwQCLf4wD7PDzu2mkwqIhbF
         OB3A==
X-Gm-Message-State: AOAM532sjA17S11S3Y7pXkz2ZgPjipgg7aZ5VesQeHrVD+hP1x3Rrqyy
        uTJp+Ns+YRUdYvcvo+mpCBVmDKF/6zP1ag==
X-Google-Smtp-Source: ABdhPJzcVCHOzXmzo+krv4wTO0E0onlIcz4cXe5VlWaa+4SYfJalp251SNYjjmU9slJnSMQfklVWWg==
X-Received: by 2002:a7b:c2f7:: with SMTP id e23mr34486844wmk.92.1636720577537;
        Fri, 12 Nov 2021 04:36:17 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id p27sm5333500wmi.28.2021.11.12.04.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 04:36:16 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 10/11] arm64: tegra: Add Tegra234 TCU device
Date:   Fri, 12 Nov 2021 13:35:41 +0100
Message-Id: <20211112123542.3680629-11-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112123542.3680629-1-thierry.reding@gmail.com>
References: <20211112123542.3680629-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Mikko Perttunen <mperttunen@nvidia.com>

Add a device for TCU (Tegra Combined UART) used for serial console.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index ffe300356e85..63274181d544 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -192,6 +192,14 @@ psci {
 		method = "smc";
 	};
 
+	tcu: serial {
+		compatible = "nvidia,tegra234-tcu", "nvidia,tegra194-tcu";
+		mboxes = <&hsp_top0 TEGRA_HSP_MBOX_TYPE_SM TEGRA_HSP_SM_RX(0)>,
+		         <&hsp_aon TEGRA_HSP_MBOX_TYPE_SM TEGRA_HSP_SM_TX(1)>;
+		mbox-names = "rx", "tx";
+		status = "disabled";
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
-- 
2.33.1

