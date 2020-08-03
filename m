Return-Path: <SRS0=O4JP=BN=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A13FC433E0
	for <linux-tegra@archiver.kernel.org>; Mon,  3 Aug 2020 15:44:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D7C162072A
	for <linux-tegra@archiver.kernel.org>; Mon,  3 Aug 2020 15:44:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZV/WCD78"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726807AbgHCPoj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 3 Aug 2020 11:44:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726805AbgHCPoj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 3 Aug 2020 11:44:39 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8831C06174A
        for <linux-tegra@vger.kernel.org>; Mon,  3 Aug 2020 08:44:38 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id kq25so26161847ejb.3
        for <linux-tegra@vger.kernel.org>; Mon, 03 Aug 2020 08:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uOUmxzFjtudAhNpjbzREY4sDxgmwHJI1wxIvlAzjnhE=;
        b=ZV/WCD78BXhPA79TFfrl2aT9W9XQ98LCuKFrw0ZgVgVnIQCY0WM0PkLhO6X0prx1EW
         xPC6xjzJ/93Cy/z4IoAXasnGyCR7ZRIKa8ou8lyWjZTt8vdv++KUtAVhTfPeJ5o5j7tU
         JfJdliWrRgjfZqhVSVjDF9GHp3Y+NRT4/aPUXhjWCq+Hpd98Ye2oZ0UxAcjZroZ2ggOj
         jkou3e5CH8myDy/33Jmk0U7khwcQdFgj2ZWaujaZiIpGrg06dBYbV5OQLvDuRQHoqY32
         JwkzDv4Lbk05kWlcsK88UDSt2mVLJ6+U6ZU8euhSyTHs4dmUOl3aNseIK/FSl5Ks5xKG
         r03A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uOUmxzFjtudAhNpjbzREY4sDxgmwHJI1wxIvlAzjnhE=;
        b=LxMM9uRXvrMXhBEOo5pSzKE9Yb8kFg3EDd6skrLQrhWPq+v8tKRt3MhE87p2/jd9CU
         dkG5d7ynHIV/ZjmHy9YBy1RO/4Ij73YFg8RaYgqlTwaRiPRE2rZcJIRmt0OynKi7Vyiw
         fYMvMU+ngt7rGHnS1DQ1vXd7apS5YsV7Dl03XJsl9c1rUOM6UwS2RAHvXf5sY/XXW5uY
         kHOETtMdAAkGxJorrSzo7VOUJWyQpOxPDaCz/6vkEMfSTarxTi9uQQtgUGhgJ6opjpUA
         Adrzu3pQsrRgIRjx5xlpe7fwIyeQcOjB1Pu7S8bGLlK21yAiZ8gHOia1FfQXA8laIOS2
         7ylA==
X-Gm-Message-State: AOAM533kQRueyzl7Of1bSwtGuFQBNDjpQy/N0gqufOEQx+PXwxlxjHw7
        obbHI4oLNf9qaRjCvxEJPGw=
X-Google-Smtp-Source: ABdhPJw720CisbrHV4ftJDwg335w42GLrr4ME/UasIo+a6/RmkNmiXyT2x7sJA8aJNaFVrgQyyMtvw==
X-Received: by 2002:a17:907:398:: with SMTP id ss24mr1150949ejb.311.1596469477697;
        Mon, 03 Aug 2020 08:44:37 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id q19sm16445860ejo.93.2020.08.03.08.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2020 08:44:36 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Ashish Singhal <ashishsingha@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: tegra: Add ID EEPROMs on Jetson AGX Xavier
Date:   Mon,  3 Aug 2020 17:44:30 +0200
Message-Id: <20200803154430.734683-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The P2888 processor module contains an EEPROM that provides means of
identifying the module. The P2822 carrier board contains the same EEPROM
with information identifying the carrier board. Both of them ar accessed
via the GEN_I2C1 bus.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi    | 15 +++++++++++++++
 .../arm64/boot/dts/nvidia/tegra194-p2972-0000.dts | 13 +++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
index 4c005b811233..0ea0bd83cb8e 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
@@ -57,6 +57,21 @@ serial@3110000 {
 			status = "okay";
 		};
 
+		i2c@3160000 {
+			status = "okay";
+
+			eeprom@50 {
+				compatible = "atmel,24c02";
+				reg = <0x50>;
+
+				vcc-supply = <&vdd_1v8ls>;
+				address-width = <8>;
+				pagesize = <8>;
+				size = <256>;
+				read-only;
+			};
+		};
+
 		/* SDMMC1 (SD/MMC) */
 		mmc@3400000 {
 			cd-gpios = <&gpio TEGRA194_MAIN_GPIO(A, 0) GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
index 90b6ea5467fa..4d8a0e10250f 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
@@ -23,6 +23,19 @@ interrupt-controller@2a40000 {
 			};
 		};
 
+		i2c@3160000 {
+			eeprom@56 {
+				compatible = "atmel,24c02";
+				reg = <0x56>;
+
+				vcc-supply = <&vdd_1v8ls>;
+				address-width = <8>;
+				pagesize = <8>;
+				size = <256>;
+				read-only;
+			};
+		};
+
 		ddc: i2c@31c0000 {
 			status = "okay";
 		};
-- 
2.27.0

