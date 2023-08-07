Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55C6FC04FE1
	for <linux-tegra@archiver.kernel.org>; Mon,  7 Aug 2023 13:34:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232550AbjHGNeS (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 7 Aug 2023 09:34:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234167AbjHGNeK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 7 Aug 2023 09:34:10 -0400
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE8B519B1;
        Mon,  7 Aug 2023 06:33:54 -0700 (PDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id DBCC6600242E;
        Mon,  7 Aug 2023 14:33:25 +0100 (WEST)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
        tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
        by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
        with LMTP id jwQtDMDht4KN; Mon,  7 Aug 2023 14:33:23 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 42B4A600143B;
        Mon,  7 Aug 2023 14:33:23 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
        s=mail; t=1691415203;
        bh=H5hhN2nUvrYrpsj/r9S4Esws1c0S6hScQpltOI+aAC4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=cN+yTGa2zZR0sQK1pYkEgWgVJmVg1G3SPtaldiK85BGL2YwQqd7G+G2DomZqHpzUY
         fjP3rD5n6YB6lrq00qiKCXicAuX/p/P1MRUYRl4wCz6ZMsWEdsRW7Wxpjq00sB1zTp
         y2WDN0YClV39tdWLMam17M1SmiCp4QR2kCxqA01A=
Received: from diogo-gram.Home (unknown [IPv6:2001:8a0:fbe7:6700:e50a:b22:79be:5827])
        (Authenticated sender: ist187313)
        by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id F0053360077;
        Mon,  7 Aug 2023 14:33:22 +0100 (WEST)
From:   Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Cc:     Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Subject: [PATCH v3 3/5] arm64: dts: smaug: Add DSI/CSI regulator
Date:   Mon,  7 Aug 2023 14:33:03 +0100
Message-ID: <20230807133307.27456-4-diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230807133307.27456-1-diogo.ivo@tecnico.ulisboa.pt>
References: <20230807133307.27456-1-diogo.ivo@tecnico.ulisboa.pt>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add the node for the DSI/CSI regulator in the Pixel C.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index 7de4da9a0191..bfdb0f8531f6 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -1929,4 +1929,12 @@ usbc_vbus: regulator-usbc-vbus {
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 	};
+
+	vdd_dsi_csi: regulator-vdd-dsi-csi {
+		compatible = "regulator-fixed";
+		regulator-name = "AVDD_DSI_CSI_1V2";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		vin-supply = <&pp1200_avdd>;
+	};
 };
-- 
2.41.0

