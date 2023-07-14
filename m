Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9E8EEB64DA
	for <linux-tegra@archiver.kernel.org>; Fri, 14 Jul 2023 10:19:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236072AbjGNKTz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 14 Jul 2023 06:19:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236033AbjGNKTy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 14 Jul 2023 06:19:54 -0400
X-Greylist: delayed 561 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 14 Jul 2023 03:19:51 PDT
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73C5D1989;
        Fri, 14 Jul 2023 03:19:51 -0700 (PDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 41E616004417;
        Fri, 14 Jul 2023 11:10:28 +0100 (WEST)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
        tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
        by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
        with LMTP id iTqTmiD7lHwo; Fri, 14 Jul 2023 11:10:24 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 7D9D96004406;
        Fri, 14 Jul 2023 11:10:24 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
        s=mail; t=1689329424;
        bh=Mw8Plq9k34bfiFGiQHESJ+979ycFvISgn+d8JFanY/E=;
        h=From:To:Subject:Date;
        b=a0536hIiTQFaDx9qaS3wW5Ovn1hhiBEk8j0ChxDJyrRkX2vonh0+LGtr297Kzo3P4
         uP4gvYeHLCRtKP16xtMWCJm/d0V3nvvG3fFa289xwCkyGLbwPI020SWWbaYLuszK+Z
         Vh6sC7tAMJWWDWCv5cyxkeilNkb1+YMKW3WQzwqQ=
Received: from localhost.localdomain (unknown [176.95.43.196])
        (Authenticated sender: ist187313)
        by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id ABDC136008C;
        Fri, 14 Jul 2023 11:10:23 +0100 (WEST)
From:   Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com, diogo.ivo@tecnico.ulisboa.pt,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH] arm64: tegra: Fix HSUART for Smaug
Date:   Fri, 14 Jul 2023 11:10:17 +0100
Message-ID: <20230714101018.10617-1-diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

After commit 71de0a054d0e ("arm64: tegra: Drop serial clock-names and
reset-names") was applied, the HSUART failed to probe and the following
error is seen:

 serial-tegra 70006300.serial: Couldn't get the reset
 serial-tegra: probe of 70006300.serial failed with error -2

Commit 71de0a054d0e ("arm64: tegra: Drop serial clock-names and
reset-names") is correct because the "reset-names" property is not
needed for 8250 UARTs. However, the "reset-names" is required for the
HSUART and should have been populated as part of commit a63c0cd83720c
("arm64: dts: tegra: smaug: Add Bluetooth node") that enabled the HSUART
for the Pixel C. Fix this by populating the "reset-names" property for
the HSUART on the Pixel C.

Fixes: a63c0cd83720 ("arm64: dts: tegra: smaug: Add Bluetooth node")
Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index 2c608d645642..bcb533cc002c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -1364,6 +1364,7 @@ serial@70006000 {
 
 	uartd: serial@70006300 {
 		compatible = "nvidia,tegra30-hsuart";
+		reset-names = "serial";
 		status = "okay";
 
 		bluetooth {
-- 
2.41.0

