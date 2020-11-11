Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59962C388F9
	for <linux-tegra@archiver.kernel.org>; Wed, 11 Nov 2020 10:42:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E6D742063A
	for <linux-tegra@archiver.kernel.org>; Wed, 11 Nov 2020 10:42:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="Tpi31tAi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725959AbgKKKmW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 11 Nov 2020 05:42:22 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:3844 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725860AbgKKKmV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 11 Nov 2020 05:42:21 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fabc0080000>; Wed, 11 Nov 2020 02:42:16 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 11 Nov
 2020 10:42:21 +0000
Received: from moonraker.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Wed, 11 Nov 2020 10:42:19 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
        <stable@vger.kernel.org>
Subject: [PATCH] ARM64: tegra: Correct the UART for Jetson Xavier NX
Date:   Wed, 11 Nov 2020 10:41:17 +0000
Message-ID: <20201111104117.153020-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1605091336; bh=r4fMM7xgP6lLcIwOOTHqiwhWzQEK5LAvY225pbt0k64=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
         X-NVConfidentiality:Content-Transfer-Encoding:Content-Type;
        b=Tpi31tAieoFTOX5KYcUukdtvJxIh5HVaV65segZ4VhUt7uqyIBHY1kw3UvR35Ga5o
         QVfzyjJeYXyS2kKdraTTvqWviN0jD7IMK4Ad5KdiPZMJgRTBDSjL0YCKmEctnP1k+4
         b/6ez6bXNeKCUPr2qDjC5++q8ZakSSY6kLbsudQ9T1odVzG6/e5awI8ZTxnx8V/u0j
         OdMDIspRq1xMXmFr5V+1vEdsYdJ0rKpHXWzeq5VqGXj6CqCakhzjjrU9ePSAziT5q+
         tEaLym9e2dqPRRzQSy6pKfSWTwuUbONlLWKQc/DQoGaMIky4tenuJrpc4f+fvavRes
         yTi7ETedLwo4w==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The Jetson Xavier NX board routes UARTA to the 40-pin header and UARTC
to a 12-pin debug header. The UARTs can be used by either the Tegra
Combined UART (TCU) driver or the Tegra 8250 driver. By default, the
TCU will use UARTC on Jetson Xavier NX. Currently, device-tree for
Xavier NX enables the TCU and the Tegra 8250 node for UARTC. Fix this
by disabling the Tegra 8250 node for UARTC and enabling the Tegra 8250
node for UARTA.

Fixes: 3f9efbbe57bc ("arm64: tegra: Add support for Jetson Xavier NX")
Cc: stable@vger.kernel.org

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194-p3668-0000.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p3668-0000.dtsi b/arch/arm=
64/boot/dts/nvidia/tegra194-p3668-0000.dtsi
index a2893be80507..0dc8304a2edd 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p3668-0000.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p3668-0000.dtsi
@@ -54,7 +54,7 @@ memory-controller@2c00000 {
 			status =3D "okay";
 		};
=20
-		serial@c280000 {
+		serial@3100000 {
 			status =3D "okay";
 		};
=20
--=20
2.25.1

