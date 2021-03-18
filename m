Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98B12C433E0
	for <linux-tegra@archiver.kernel.org>; Thu, 18 Mar 2021 08:31:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6822A64F38
	for <linux-tegra@archiver.kernel.org>; Thu, 18 Mar 2021 08:31:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229600AbhCRIbS (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 18 Mar 2021 04:31:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229708AbhCRIav (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 18 Mar 2021 04:30:51 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A881C06174A
        for <linux-tegra@vger.kernel.org>; Thu, 18 Mar 2021 01:30:51 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id j7so4551826wrd.1
        for <linux-tegra@vger.kernel.org>; Thu, 18 Mar 2021 01:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Lm/yRBjh/eNInqq2EHpiR8EFPLECvJQVaRsKMiB7X84=;
        b=i+mzvG8rJkbD557gxesWqlHedeqcgDIbTZUKRUSpbVU3tUk7e9pgtb11e48DbB5ivg
         iwp7swBjwBqer5KshUZ3yAspKuYX5Dil5p99Gqh/1nul+L54FYdEr0cm0exzNh/8Qnf8
         ZrB8rZ9OykOpFi94rqyuuXYaL4KiT7pGMTqTslIuHLRk4CPBI0HzoPTivccquDYQOBKG
         Lkr2KIFSV8h2VmHS+Cq5jGcx4j7xArcEcP+JaBHPFxmlTTvzGTQJc6MSKOAP7XWAGA+O
         PuCqCV1VtZV126/P4P/fP6aVQdprYTcaAPTTGMbJlC8JDPdZrAq9CLNDzr7yFlgT6rAy
         i4Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Lm/yRBjh/eNInqq2EHpiR8EFPLECvJQVaRsKMiB7X84=;
        b=LYyt31xVoxHiQYEOwIo5FdpHK6tLxgyIwBrL0bc7fIvJt5c3aiTv4HBn4MYtX5ssvx
         BeSzUystqLIThDv/nQCmB6rCK8PciLspQPj8LUUSaDswCKssfYB1twDiqnD4f/r3CZNE
         IwjfpYZx90GMoPNh7OlCUKV3xq1MWA6wxVLtWdupW6jlg9++e06Gp4sjVN/L9+xdMS+2
         JCMPiJNoyHYQNsvaqFgllMdWr48CFOvfT6rmcYXA+yxBfmHZs+8gFsQdpRIjjSqen8n1
         XTtR2krs6Z95VA2NlGON49EBrhg4H78UjR5afqLWDaOMKDoBpoxgb1iWRIlGZKHOuFN0
         GemQ==
X-Gm-Message-State: AOAM533UGMx4IWJLsGzy7Z3o5oqTrIhTSgeZ12TbxOmpvYKeX1H7k1F4
        3im8XaYp2zdVcXAu4M5r1G0=
X-Google-Smtp-Source: ABdhPJyYas83Aq0K1U1Q/qmawO+qDx+ibsJx07KXvUSh5+wiWM8KcIwS0ykymjSf9yz9a7bz7J2+SA==
X-Received: by 2002:adf:f587:: with SMTP id f7mr8374487wro.147.1616056250340;
        Thu, 18 Mar 2021 01:30:50 -0700 (PDT)
Received: from arrakis.kwizart.net (amarseille-656-1-780-9.w90-8.abo.wanadoo.fr. [90.8.153.9])
        by smtp.gmail.com with ESMTPSA id c11sm1955882wrm.67.2021.03.18.01.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Mar 2021 01:30:49 -0700 (PDT)
From:   Nicolas Chauvet <kwizart@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org, Nicolas Chauvet <kwizart@gmail.com>
Subject: [PATCH] ARM: tegra: paz00: Add emc-tables for ram-code 1
Date:   Thu, 18 Mar 2021 09:30:47 +0100
Message-Id: <20210318083047.11206-1-kwizart@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This is the same tables as ram-code 0

Signed-off-by: Nicolas Chauvet <kwizart@gmail.com>
---
 arch/arm/boot/dts/tegra20-paz00.dts | 42 +++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/tegra20-paz00.dts
index 9efb5f4f486a..da76ce070109 100644
--- a/arch/arm/boot/dts/tegra20-paz00.dts
+++ b/arch/arm/boot/dts/tegra20-paz00.dts
@@ -355,6 +355,48 @@ emc-table@333000 {
 					0x00000000 0x00000000 0x00000000 0x00000000>;
 			};
 		};
+
+		emc-tables@1 {
+			nvidia,ram-code = <0x1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			emc-table@166500 {
+				reg = <166500>;
+				compatible = "nvidia,tegra20-emc-table";
+				clock-frequency = <166500>;
+				nvidia,emc-registers = <0x0000000a 0x00000016
+					0x00000008 0x00000003 0x00000004 0x00000004
+					0x00000002 0x0000000c 0x00000003 0x00000003
+					0x00000002 0x00000001 0x00000004 0x00000005
+					0x00000004 0x00000009 0x0000000d 0x000004df
+					0x00000000 0x00000003 0x00000003 0x00000003
+					0x00000003 0x00000001 0x0000000a 0x000000c8
+					0x00000003 0x00000006 0x00000004 0x00000008
+					0x00000002 0x00000000 0x00000000 0x00000002
+					0x00000000 0x00000000 0x00000083 0xe03b0323
+					0x007fe010 0x00001414 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000>;
+			};
+
+			emc-table@333000 {
+				reg = <333000>;
+				compatible = "nvidia,tegra20-emc-table";
+				clock-frequency = <333000>;
+				nvidia,emc-registers = <0x00000018 0x00000033
+					0x00000012 0x00000004 0x00000004 0x00000005
+					0x00000003 0x0000000c 0x00000006 0x00000006
+					0x00000003 0x00000001 0x00000004 0x00000005
+					0x00000004 0x00000009 0x0000000d 0x00000bff
+					0x00000000 0x00000003 0x00000003 0x00000006
+					0x00000006 0x00000001 0x00000011 0x000000c8
+					0x00000003 0x0000000e 0x00000007 0x00000008
+					0x00000002 0x00000000 0x00000000 0x00000002
+					0x00000000 0x00000000 0x00000083 0xf0440303
+					0x007fe010 0x00001414 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000>;
+			};
+		};
 	};
 
 	i2c@7000d000 {
-- 
2.30.2

