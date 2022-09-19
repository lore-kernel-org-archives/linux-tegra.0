Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF29EC54EE9
	for <linux-tegra@archiver.kernel.org>; Mon, 19 Sep 2022 10:50:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229948AbiISKus (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 19 Sep 2022 06:50:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229969AbiISKuH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 19 Sep 2022 06:50:07 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B64BE12D18;
        Mon, 19 Sep 2022 03:44:07 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2804:14c:485:4b69:2a6e:b0f9:99bf:c8bc])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: festevam@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id A228B84AE7;
        Mon, 19 Sep 2022 12:44:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1663584245;
        bh=lH/uRbIw05FOmVOPLzcOceui4hGfkEEBVDR3C3l1YQ4=;
        h=From:To:Cc:Subject:Date:From;
        b=xKw7C0mrrqK0nlKs+QjxebGZcfReJZBzlrXNhZaKEv/emNkj3RtxLuZ10sbVQZbtM
         gmPgCxeV8hnUvaNE7W4deXThSSkJx6rVdehomeiQnwQxZrKd+mIH4mdjWw/MLF80Vz
         KyzLW+BPhSfO5g4XbQkHrA42xU9w+iNOdJylJg2OipNCBmp3EIkf4WZHMLXHju/RcJ
         Lfa7wOFWJ5pwQL08ID8mpXg6F8X6VuR6BIiJT7KqO9+MV+Bue62w293GuzAabBkQnI
         wIiQApK3G+9Z/Ixa7JD8DlvEX20q5UazwsEK7kDgqgpAQmT9oeVfIua5qsknmBrCOl
         vihI1AIyD5hUA==
From:   Fabio Estevam <festevam@denx.de>
To:     thierry.reding@gmail.com
Cc:     vidyas@nvidia.com, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>
Subject: [PATCH] arm64: dts: tegra234-p3701-0000: Remove 'enable-active-low'
Date:   Mon, 19 Sep 2022 07:43:50 -0300
Message-Id: <20220919104350.834777-1-festevam@denx.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The 'enable-active-low' property is not a valid one. 

Only 'enable-active-high' is valid, and when this property is absent
the gpio regulator will act as active low by default.

Remove the invalid 'enable-active-low' property.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi
index 9e4d72cfa69f..d472f9d30b3e 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi
@@ -39,7 +39,6 @@ vdd_12v_pcie: regulator-vdd-12v-pcie {
 		regulator-max-microvolt = <12000000>;
 		gpio = <&gpio TEGRA234_MAIN_GPIO(A, 1) GPIO_ACTIVE_LOW>;
 		regulator-boot-on;
-		enable-active-low;
 	};
 
 	bus@0 {
-- 
2.25.1

