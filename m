Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2465C388F9
	for <linux-tegra@archiver.kernel.org>; Wed, 11 Nov 2020 10:38:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 723BE20729
	for <linux-tegra@archiver.kernel.org>; Wed, 11 Nov 2020 10:38:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="ox6mpa4J"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725903AbgKKKix (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 11 Nov 2020 05:38:53 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:12233 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725830AbgKKKiw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 11 Nov 2020 05:38:52 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fabbf430000>; Wed, 11 Nov 2020 02:38:59 -0800
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 11 Nov
 2020 10:38:51 +0000
Received: from moonraker.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Wed, 11 Nov 2020 10:38:49 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
        <stable@vger.kernel.org>
Subject: [PATCH] ARM: tegra: Populate OPP table for Tegra20 Ventana
Date:   Wed, 11 Nov 2020 10:38:47 +0000
Message-ID: <20201111103847.152721-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1605091139; bh=z98xvmLL/0hiP6aApSyb9EKbw160gG3KyFVYQgIh3PQ=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
         X-NVConfidentiality:Content-Transfer-Encoding:Content-Type;
        b=ox6mpa4JwsmcFN1VqihZVDrHf2QVQkUwe56Sb5o2XhIZsAFzP3HkHU3za8H4NyuDc
         Y5qM4Pij5RVlSKm6fBkGKWwf4iYdNsw995u8guA78+h2ps9mptnWeHPwBNYIRNfNRC
         0UPMKkx1a1YDqfTEXvupgy5tjoi9CTfcQCBTZM7jhEAhKv+/Fueyn7ZflhgNtVfUa8
         khaexbAhQuehOepLmhd1IWdR9h6G6V6R5i8/oGTUnw3yLQmu3EeFfiVldu1mFz+m8T
         P6TxbQlwSlbw9lJWTpd3RO3kzYTen/ViKWOY3rUgTYAxbD2al8CWXa6c494VvOLJyR
         u1iXT94DOwVvg==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Commit 9ce274630495 ("cpufreq: tegra20: Use generic cpufreq-dt driver
(Tegra30 supported now)") update the Tegra20 CPUFREQ driver to use the
generic CPUFREQ device-tree driver. Since this change CPUFREQ support
on the Tegra20 Ventana platform has been broken because the necessary
device-tree nodes with the operating point information are not populated
for this platform. Fix this by updating device-tree for Venata to
include the operating point informration for Tegra20.

Fixes: 9ce274630495 ("cpufreq: tegra20: Use generic cpufreq-dt driver (Tegr=
a30 supported now)")
Cc: stable@vger.kernel.org

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 arch/arm/boot/dts/tegra20-ventana.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20-ventana.dts b/arch/arm/boot/dts/tegr=
a20-ventana.dts
index b158771ac0b7..055334ae3d28 100644
--- a/arch/arm/boot/dts/tegra20-ventana.dts
+++ b/arch/arm/boot/dts/tegra20-ventana.dts
@@ -3,6 +3,7 @@
=20
 #include <dt-bindings/input/input.h>
 #include "tegra20.dtsi"
+#include "tegra20-cpu-opp.dtsi"
=20
 / {
 	model =3D "NVIDIA Tegra20 Ventana evaluation board";
@@ -592,6 +593,16 @@ clk32k_in: clock@0 {
 		#clock-cells =3D <0>;
 	};
=20
+	cpus {
+		cpu0: cpu@0 {
+			operating-points-v2 =3D <&cpu0_opp_table>;
+		};
+
+		cpu@1 {
+			operating-points-v2 =3D <&cpu0_opp_table>;
+		};
+	};
+
 	gpio-keys {
 		compatible =3D "gpio-keys";
=20
--=20
2.25.1

