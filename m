Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 560A0C4332F
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 17:25:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242848AbhLIR32 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:29:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242855AbhLIR3T (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 12:29:19 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C52D1C061D5F
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 09:25:45 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id v11so10903046wrw.10
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 09:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9dBk4A4FMc50NWYfa3dsHQucQqrnFqo52HH78dud0bw=;
        b=e/FCDQSq0q8eLZi/2vG1I+77gSYa2Mo2RYTFUrl1oAaSxSqGrRBgXPG7/sqW8Um7EB
         WOYyy9e015iO2dmp5WMFOuSD6mYxCHEDoPFd95pdH8pjqHu4/3mzABBZX+DvwsVriTzP
         NyWLsDAwspqOw020kmxh+Gu9Emt1T/trP4nkr5/QlwUiY3HKQHEXXo4VFSQhDxsCynpB
         SyuiLKmFtSUaXWdC6oQ372ji3oztZwFwWSunUYNce+aPCJsGoWbo6lJ7GItZLE8Ff1Cj
         jBMEQWgpPR98DJ9oa3Ir8zRW5vxcpYYPrIc5/GcQlN96HbWUdPIS/rW+R24n7Ot3ssn2
         ylPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9dBk4A4FMc50NWYfa3dsHQucQqrnFqo52HH78dud0bw=;
        b=6xbExOkd9/Jp8GlyIQG8zPssdA31odrQk/qFDrZEbNVPt/KRQgsr7ax4aWp7r3NFjN
         N4C8w/kzzSisvfk/NSBIjdPEqzaMiwNjVMhQf76W6hYitloZw3iXBtc2XKBFW+nAbQ+t
         HgEr1llaCl/DR8lcXv/mlZwTenKsjU3jvA20CJLCfUOm75odnQ+n6IbEg5zuY4lg4z8i
         aobOJ8sosSyZpKi/Wp8xtXLoHhU6wtRllgJPrCP5yJlKlj8Z9HC70RE3Xdflf8Ulqh7A
         epfL0n2F0TdjwTX12LPdiQkRC130I+cFXfjtvL3mW9Rzikmkz2I9enI/wCZyxosmnpzW
         XF2w==
X-Gm-Message-State: AOAM532PHqjt1BTSbEjI1HwCdXB944jAqdipX8lh0Zusf/hhc1bLhx4t
        mJXFTUTi/+x/2WacU+NUTJV2dBVLosXWRg==
X-Google-Smtp-Source: ABdhPJwJK/2eISWuMLhMgXvi4JhTRP/8iFM7tYYCkc5rnJmrp+EafraAsY3ZCise72zyc4h/DQx8Ew==
X-Received: by 2002:adf:f489:: with SMTP id l9mr8186066wro.268.1639070744344;
        Thu, 09 Dec 2021 09:25:44 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id s63sm406316wme.22.2021.12.09.09.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:25:43 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 15/30] arm64: tegra: Drop unit-address for audio card graph endpoints
Date:   Thu,  9 Dec 2021 18:24:48 +0100
Message-Id: <20211209172503.617716-16-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211209172503.617716-1-thierry.reding@gmail.com>
References: <20211209172503.617716-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Audio graph endpoints don't have a "reg" property, so they shouldn't
have a unit-address either.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts  |  2 +-
 arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi |  2 +-
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts  | 10 +++++-----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
index b79d7d89cf62..2478ece9e67c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
@@ -1031,7 +1031,7 @@ i2s6_cif_ep: endpoint {
 						i2s6_port: port@1 {
 							reg = <1>;
 
-							i2s6_dap_ep: endpoint@0 {
+							i2s6_dap_ep: endpoint {
 								dai-format = "i2s";
 								/* Place holder for external Codec */
 							};
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi
index 76d94ecd1cfe..6d4ed67ffeda 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi
@@ -989,7 +989,7 @@ i2s5_cif_ep: endpoint {
 						i2s5_port: port@1 {
 							reg = <1>;
 
-							i2s5_dap_ep: endpoint@0 {
+							i2s5_dap_ep: endpoint {
 								dai-format = "i2s";
 								/* Place holder for external Codec */
 							};
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index 9e60ebf2f5c0..260de1122aa3 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -688,7 +688,7 @@ i2s4_cif_ep: endpoint {
 					i2s4_port: port@1 {
 						reg = <1>;
 
-						i2s4_dap_ep: endpoint@0 {
+						i2s4_dap_ep: endpoint {
 							dai-format = "i2s";
 							/* Placeholder for external Codec */
 						};
@@ -706,7 +706,7 @@ ports {
 					port@0 {
 						reg = <0>;
 
-						dmic1_cif_ep: endpoint@0 {
+						dmic1_cif_ep: endpoint {
 							remote-endpoint = <&xbar_dmic1_ep>;
 						};
 					};
@@ -714,7 +714,7 @@ dmic1_cif_ep: endpoint@0 {
 					dmic1_port: port@1 {
 						reg = <1>;
 
-						dmic1_dap_ep: endpoint@0 {
+						dmic1_dap_ep: endpoint {
 							/* Placeholder for external Codec */
 						};
 					};
@@ -731,7 +731,7 @@ ports {
 					port@0 {
 						reg = <0>;
 
-						dmic2_cif_ep: endpoint@0 {
+						dmic2_cif_ep: endpoint {
 							remote-endpoint = <&xbar_dmic2_ep>;
 						};
 					};
@@ -739,7 +739,7 @@ dmic2_cif_ep: endpoint@0 {
 					dmic2_port: port@1 {
 						reg = <1>;
 
-						dmic2_dap_ep: endpoint@0 {
+						dmic2_dap_ep: endpoint {
 							/* Placeholder for external Codec */
 						};
 					};
-- 
2.34.1

