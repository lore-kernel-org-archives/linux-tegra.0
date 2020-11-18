Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B372C5519F
	for <linux-tegra@archiver.kernel.org>; Wed, 18 Nov 2020 16:05:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 29536247CB
	for <linux-tegra@archiver.kernel.org>; Wed, 18 Nov 2020 16:05:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="hmDa9DPK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726087AbgKRQFd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 18 Nov 2020 11:05:33 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:10968 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbgKRQFd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 18 Nov 2020 11:05:33 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fb546510002>; Wed, 18 Nov 2020 08:05:37 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Nov
 2020 16:05:33 +0000
Received: from moonraker.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Wed, 18 Nov 2020 16:05:31 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
        "Ashish Singhal" <ashishsingha@nvidia.com>
Subject: [PATCH] arm64: tegra: Fix Tegra234 VDK node names
Date:   Wed, 18 Nov 2020 16:04:58 +0000
Message-ID: <20201118160458.659517-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1605715537; bh=shvTMb3QI5LBCVvJ7LNXoR5Fc35VtdvRw2IkC8NBWik=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
         X-NVConfidentiality:Content-Transfer-Encoding:Content-Type;
        b=hmDa9DPKm/sC3qQY9YDBz5gA8S+6QO57/Va0Nn0yZZ+mB091MgOghAinPeRaFz/4L
         8xKwnaDSeLDUAguqIiCNY/8KyGcAbMnwrL2B1JNxXn8zU50Y43PTtd+qHV2mlFEoz1
         1/Q+eD/xW2b8q6oaSpi+ohKQQB+d8mhfVyf0F2ghhBkdZlpIlnk33fH+UsVBeo9xv1
         9GpHVWThy4u/kDkXjXL6YvkJdgVFafF2XYTRqfZp9oiA7wV2MsQl4dCnnmtGw3Wkdy
         +/yerSHgJfV+kqGnNcmTQqDNB7QcsBz7Ng5bvpnK+O2Zg5gg+RO7Ydfjs88KcJV9J3
         YBaT8/oedZfqw==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

When the device-tree board file was added for the Tegra234 VDK simulator
it incorrectly used the names 'cbb' and 'sdhci' instead of 'bus' and
'mmc', respectively. The names 'bus' and 'mmc' are required by the
device-tree json-schema validation tools. Therefore, fix this by
renaming these nodes accordingly.

Fixes: 639448912ba1 ("arm64: tegra: Initial Tegra234 VDK support")

Reported-by: Ashish Singhal <ashishsingha@nvidia.com>
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dts b/arch/arm64/b=
oot/dts/nvidia/tegra234-sim-vdk.dts
index f6e6a24829af..b5d9a5526272 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dts
@@ -8,7 +8,7 @@ / {
 	compatible =3D "nvidia,tegra234-vdk", "nvidia,tegra234";
=20
 	aliases {
-		sdhci3 =3D "/cbb@0/sdhci@3460000";
+		mmc3 =3D "/bus@0/mmc@3460000";
 		serial0 =3D &uarta;
 	};
=20
@@ -17,12 +17,12 @@ chosen {
 		stdout-path =3D "serial0:115200n8";
 	};
=20
-	cbb@0 {
+	bus@0 {
 		serial@3100000 {
 			status =3D "okay";
 		};
=20
-		sdhci@3460000 {
+		mmc@3460000 {
 			status =3D "okay";
 			bus-width =3D <8>;
 			non-removable;
--=20
2.25.1

