Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010015.outbound.protection.outlook.com [52.101.61.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4FA2D249B;
	Mon, 27 Jul 2026 14:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785161516; cv=fail; b=Dhjl7DnpkrjbBm2jUr2XG8lKwP4gVvK+407XO0Kz1l0yTU2DzzLhb0gr9u4azo7yzO29Jws0imLC2cURbhScPVPB1/4u6QoDkDnrHXRVKFgQdR0hMa5/6OL271ggEyMIRpRbeo6mBXVdmrTUrZPeJgdqnTB3h0eHIG4Jf5tuJ/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785161516; c=relaxed/simple;
	bh=U3Vc7M4EMHbD7g5+tFRRONmJ3t5RRYCAfTkLNlz5DGM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rGKS0D7x0e/ynM12PkCQdxrjhMLWEovMdxV1Ul+lMCSg28WvtMWeOyuDdN9loVKu5e2/yGen3nuMSVjyFNgwjKeQzq74kudqSfhWWbuCHrXRItF1+2BiA74ZWvbYqlmvMu0bHE5Rxt9G2Seef71ExOD0sKSU6ftcgAZpXDoTcWg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OH24cNCP; arc=fail smtp.client-ip=52.101.61.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OH24cNCP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gKJZC6HxaZrxPvnQ13byQyE5rlRl9aVr2q93fGdU6xVN8JFKEnIw3MvcsKO82P/9P4qRL6VMkuFc8gSVGK/ohj1nkBOTGzt9DMNhFjzoRKNJ81qKmPmNtwm5rzvsn18C7S3ia1f7KrXv4/oEHqJz3yJ6AN0P3EcIEbVZMV2y2oQ4W2+NVipWE2s17J47bEKfpbZrH7kAIJxgfZhzM5EuiyWG3uJe/LnF8G+5psP8siFdRyWNc+NZxCsylv9/n2ucDA8nI5NBGP0XinSbKWYi/CD2rmbnhAMgA8CFuy61fAQVzvJdAW0gyrYPaTRnbkDvNCIGKWUBJiHfpdj9LB2guw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3wqJip5X8I8oV5A769+DsLNRt1vcPF/lIsWAfULpFu0=;
 b=AyO0NpUbwCjYS28URnbw2dL1rJlH0G5G18M4mtSiz4k/DfvDb+1mkMjfVAGX03rfvnfAL/eQbJN8YWMbPPeQZNc1fW9/kcbrRgJCRVmEpci22+z6TQs2dBaL5SyflnLw4lSgd9IHkuEWTWFHKWhAu5WsuVTrx2vm2NArJLd7QP0EYEZZqSY7r+B3ulM5Y2MRMC2+S2DZ2kX1uVMPBivnPVV0Gn2eFLAtUrLVIKOSMnQZXA/ID/z0BMxkQQACyOLwvl1UOEV4NBO+qdO++kMVoju7T9fDEMZsdwryssXY/XZTkQOmwnLZgD3d/G5OvJe4fRTxlkU5t5j3hC9AuJ+buQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3wqJip5X8I8oV5A769+DsLNRt1vcPF/lIsWAfULpFu0=;
 b=OH24cNCPlEkXcqD0EJC77y21i4UoAkyNDwC7hClFKlRfWKX+CNpPH2/8FhBo2jmEq3YRqOiQVtoqma0Sv+LSJFVS2Fc1p/QZAJwHIR0j1I02rFrIQOeQoDaQgMtv2kkybqKLX0/RuyZ7FZfDsU91xPImVbxoZb3l9OqqQ1KvexAT+YJCYEBB4Yg0O6xRIvjlmXjeqXyt1XEg1xFN7cqzjDm8hSfA3QBThYmkoMHoDcFqAjxpLM7tOONngCDgesxmSQqeix3AC47p86f53XeEDu3nmftURT6kyEb72NIA/n8aJBmgM2OTbu5M5wxJrZoC+M5OGtoMQL8LQv9vz6LlZw==
Received: from BN9PR03CA0848.namprd03.prod.outlook.com (2603:10b6:408:13d::13)
 by BY5PR12MB4306.namprd12.prod.outlook.com (2603:10b6:a03:206::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 14:11:47 +0000
Received: from BL6PEPF0001AB56.namprd02.prod.outlook.com
 (2603:10b6:408:13d:cafe::83) by BN9PR03CA0848.outlook.office365.com
 (2603:10b6:408:13d::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Mon,
 27 Jul 2026 14:11:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL6PEPF0001AB56.mail.protection.outlook.com (10.167.241.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Mon, 27 Jul 2026 14:11:45 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 27 Jul
 2026 07:11:25 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 27 Jul
 2026 07:11:24 -0700
Received: from build-pshete-bionic-20260122.nvidia.com (10.127.8.11) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 27 Jul 2026 07:11:24 -0700
From: Prathamesh Shete <pshete@nvidia.com>
To: <linusw@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <thierry.reding@kernel.org>, <jonathanh@nvidia.com>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<pshete@nvidia.com>
Subject: [RESEND V2 1/2] dt-bindings: pinctrl: tegra264: fix DAP2 DIN/DOUT pin names
Date: Mon, 27 Jul 2026 14:11:20 +0000
Message-ID: <20260727141121.772110-1-pshete@nvidia.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB56:EE_|BY5PR12MB4306:EE_
X-MS-Office365-Filtering-Correlation-Id: 60d99af1-c30d-4333-6a0c-08deebe8fe05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|82310400026|1800799024|36860700016|56012099006|10067099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	sIvaFKtFxJbvcJ9MqER5swNMWgk5YW1nrPmTqfNcGtfSjHBwIU6c21NV9RA7TCw124VojuSpz+joXa2jxqbpp5USiyidMANe7p9XBTBrLWEKpY0YfyiiFON7yNbooIBmWSKlvLLEYjPkML2GaGBqCP31jeUn/yBDwvbKlcpR5Zy4eNkglc3ls5sy7IK/GEnMaVDG+yB3D4RC1TL/20eATZaDX6RTCmzYQHaaM1LXyA0UCTRDxAR9LFBt3MAOqSvy2H0XDgKXKJ/zR7tsixKuejKwc6+j1v9SUNynu9qklSRBKZnvraTZz6VytxMPs1L8HraAlDkUp14lG5MajzfbD1gTAd0yV3+c4Lsof4ATSAMBAGdJEtb36dejn9S7UvvRewr2KraI/dV8XFN+hb450Mi69b/KsGeBvjh7GipoyqVfTkBl3B6CKbcVMq2XoTH68tGDpB5PdtYYzSvdZwsw1OgyDx4A9bh7A6ZWnlnsdWw8T8Br/IvgLiW4i0UtTuCRwgNFdxXojCgIQQ4mHlWfwLzaCCc0i+iZHzfRgZqYqiaIw5/I6liz1iCVP/l9vmMAcyHBwd20Sgc1wQakMUDhPBlURScafk3NnsQu8nIg1rvipjNwuJ/kXNBO+gOQXxPwjb+s1QlcE40deqXxMGnCN926mhf9xGkjhlubmcu7V7vvCLj9QP/imykiGDUhvCjINlEvlePzP7JRLvancxSV/g==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(1800799024)(36860700016)(56012099006)(10067099003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uX7RgPmMnu/MRq6I3EZt3L0sdeg4xm+MqKc3uVGoIkVS1gqSniKQ9FcvdZ5rPbB804E0F54YaEPLdyRjHHmuUBwFrRkenF3eWYUxwowdYWprLwQmU6P0QfoG02jAAl/xL7sZGj/643Pz0nJb2j6tYwBxiyyjV3Pw2NuWJhSlLzUDWHIoq5/6h066YeTZFrmkW7OusJ9qDfdZrWzVvN3akScF1DEOTnMHZDyp8xUAr8jyuD/ShmGlkQGxP/Pdi2K/NVwtyCYZ6Wzrfg3nxuIO1lg/sHNDwwQ3EINLl6mk/6AOwFmyf1g4n2/a58vGdv2jRFzxYE1fI3D7A4Tu5mi7cpABobtw6+79h437h0b0SLFNt07i693EYuUA+/z5TG9QvKeI0wWllfLSvBlZTq80cj09Pa3IBg5pB1dMuwxZMFQNvIdf5XD6nqFrd2aC+oSU
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 14:11:45.7947
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60d99af1-c30d-4333-6a0c-08deebe8fe05
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB56.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4306

The DAP2_DIN and DAP2_DOUT pins were listed with swapped ball suffixes:
DAP2_DIN as PV7 and DAP2_DOUT as PW0. On silicon DAP2_DIN is on ball PW0
and DAP2_DOUT is on ball PV7. Correct the pin and drive group names to
dap2_din_pw0 and dap2_dout_pv7.

Fixes: 30a9d5162f25 ("dt-bindings: pinctrl: Document Tegra264 pin controllers")
Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
---
 .../bindings/pinctrl/nvidia,tegra264-pinmux-main.yaml       | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra264-pinmux-main.yaml b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra264-pinmux-main.yaml
index c40409d3263c..01db762e82bc 100644
--- a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra264-pinmux-main.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra264-pinmux-main.yaml
@@ -44,7 +44,7 @@ patternProperties:
                     soc_gpio173_pu3, soc_gpio174_pu4, soc_gpio175_pu5,
                     soc_gpio176_pu6, soc_gpio177_pu7, soc_gpio178_pv0,
                     pwm10_pv1, uart4_tx_pv2, uart4_rx_pv3, uart4_rts_n_pv4,
-                    uart4_cts_n_pv5, dap2_clk_pv6, dap2_din_pv7, dap2_dout_pw0,
+                    uart4_cts_n_pv5, dap2_clk_pv6, dap2_din_pw0, dap2_dout_pv7,
                     dap2_fs_pw1, gen1_i2c_scl_pw2, gen1_i2c_sda_pw3,
                     gen0_i2c_scl_pw4, gen0_i2c_sda_pw5, pwr_i2c_scl_pw6,
                     pwr_i2c_sda_pw7, soc_gpio138_pp0, soc_gpio139_pp1,
@@ -111,8 +111,8 @@ patternProperties:
                     drive_soc_gpio351_ps1, drive_gen0_i2c_scl_pw4,
                     drive_gen0_i2c_sda_pw5, drive_gen1_i2c_scl_pw2,
                     drive_gen1_i2c_sda_pw3, drive_dap2_fs_pw1,
-                    drive_dap2_clk_pv6, drive_dap2_din_pv7,
-                    drive_dap2_dout_pw0, drive_pwm10_pv1,
+                    drive_dap2_clk_pv6, drive_dap2_din_pw0,
+                    drive_dap2_dout_pv7, drive_pwm10_pv1,
                     drive_soc_gpio170_pu0, drive_soc_gpio171_pu1,
                     drive_soc_gpio172_pu2, drive_soc_gpio173_pu3,
                     drive_soc_gpio174_pu4, drive_soc_gpio175_pu5,
-- 
2.17.1

