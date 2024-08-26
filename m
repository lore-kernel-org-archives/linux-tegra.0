Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2068.outbound.protection.outlook.com [40.107.220.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67AD15476B;
	Mon, 26 Aug 2024 16:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724690910; cv=fail; b=fNiX3L6USCGEpRa23iAbjABKH0bQpVgrU1R0tCEaKA2FXiKGI1IfHp5g57HrTA46qJrMg36zeswW+4CrBZ1GYqFVFE+rzI5Yss5EP/B5xHZ5BCEBsSVN069vBR1wP+9sb8Fbr6CQJTnNxlqRw+TdiP862g9ZVjZRTF+euA0zIjM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724690910; c=relaxed/simple;
	bh=g3X+uGGGIalqpHmEAXUPaxKsLYGRnDwFjTbzzUZ2DD8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ap/lTC+iNRNMywzXhq/BcFd3Z/GC8VDeV41NQx/Iaph2rj3FknjOltweDrRxdchioJ24b3kr7yEPOb692EQ896w0AbZear4uetOSq+5m1H/eDKkxNLVTJf3INjm0ztsBcc2lqBn/4WInoEW3VM/oFIPT1YQ6/DCtABkJjGOisng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=my3P5v9W; arc=fail smtp.client-ip=40.107.220.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="my3P5v9W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ey2gul7uV4XyfKF0wVTDzUgfk49uyDJ4KDmbVbYPfT5XMtyYK89YGFsjUg/J+l/2EqeyQbbQAwD/aIZ5S75m7qwHubkN0Wsv8gxyPCfXVFJSDsaYONGJOo4YcRv08Vqf0FngOdyz1eaYobQoHCqLbtTMbyYi4UIO0Md5QQiS8J8lS2q90jVKC6d1xW+A7g6ms94PtWczCEQstAVHBLHoveb/GwkyZVuXohsGFZdJByaUmTrZyHpMTjZnMhzMspr7+eC55RiaiBR/mSQHIrPZJtP4P60AKF5O2VeHf6tbATUxNvz8xcvjTnmqLarFcb8OwrefBr87yQQKhzOJtaAAvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M7e+iFD6hp/wLFqNHZlph0VLUKyN5oJwjVrC4pMszpk=;
 b=hCmkGR8D6XypagopqerxKVz4JxE8AqEoNOXuyCHYfiUls2lYl6gQKytpl7jF13HsM1gbwsY6ey4C3IJtsXcaK6XYdKBgLBRgkIEHzzHnklmYBGGt7nhUZxVLtteZwvA3rHD/RRuKr2WJVoQ9Eou+jsAWBFAfab6LwjmbN2962hn5bDX15rTfbe597PsNTQU1Mtk6ZfwDLzYLlHHhVcjpMAf0w3+Bkpgy6WXVItbmxV08qQkovUs9ymwFcn1eTr2Jn08Y2B+eH6GU/Nn0BkN+ZbOvehrR8J+Kpmm05v3u9ZwqyzPNH3sgURKftPkHTtjJlbReuqGWvD5TMYoMBayL2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M7e+iFD6hp/wLFqNHZlph0VLUKyN5oJwjVrC4pMszpk=;
 b=my3P5v9Wf7VLoKVb/UYhPU76XmS1X4mGjPz0aOiW5iq+v5KlhB3rC8bcw5CuFqYnIlh+PoKfd/33p0i07N8+yAEyiooq1ArojjCijpg9cQbzOv+6S+00hHNSkd9ZiiQ175+GKE/LucQaFy2qv6NjgWVlni/mRLWLUrwnqDRaiHQV1ZaWSwzlu/FQuHQwUzxv4/hR86Hc8DAaXjqdk7Cjm7Vvta1JIYnOFtZL3rZZLYnogiRMcm+Vcl6M9Cq/AaF0bDjCMNSW/AZWne3BuZo//JBV8Am5l5AMGURKL2+a2NtMvBym8CTDhE97npB35ngWaecWT7V/QgiGwQFv/ttUmw==
Received: from DS7PR03CA0071.namprd03.prod.outlook.com (2603:10b6:5:3bb::16)
 by SN7PR12MB6792.namprd12.prod.outlook.com (2603:10b6:806:267::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 16:48:25 +0000
Received: from CY4PEPF0000EE3D.namprd03.prod.outlook.com
 (2603:10b6:5:3bb:cafe::3d) by DS7PR03CA0071.outlook.office365.com
 (2603:10b6:5:3bb::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24 via Frontend
 Transport; Mon, 26 Aug 2024 16:48:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CY4PEPF0000EE3D.mail.protection.outlook.com (10.167.242.15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.13 via Frontend Transport; Mon, 26 Aug 2024 16:48:25 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 26 Aug
 2024 09:48:10 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 26 Aug 2024 09:48:10 -0700
Received: from build-dstotland-20240703T000904114.nvidia.com (10.127.8.10) by
 mail.nvidia.com (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.4
 via Frontend Transport; Mon, 26 Aug 2024 09:48:09 -0700
From: Dara Stotland <dstotland@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter
	<jonathanh@nvidia.com>, Brad Griffis <bgriffis@nvidia.com>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>
CC: Dara Stotland <dstotland@nvidia.com>
Subject: [PATCH v2 5/7] arm64: tegra: Move padctl supply nodes to AGX Orin module
Date: Mon, 26 Aug 2024 16:47:23 +0000
Message-ID: <20240826164725.775199-6-dstotland@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240826164725.775199-1-dstotland@nvidia.com>
References: <20240826164725.775199-1-dstotland@nvidia.com>
X-NVConfidentiality: public
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3D:EE_|SN7PR12MB6792:EE_
X-MS-Office365-Filtering-Correlation-Id: 903c0f66-0082-4e94-78d3-08dcc5eee763
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UueYToRr3uqHDyI/KsChiJOcdPxwNOhxj4VJrTWJl3sqCcBqAz+70HkQKeKn?=
 =?us-ascii?Q?v9Jc1ozBnqxSRQ6DWInSHJ+h/+pEZOl8p6ImswZ4HZLLKR4szrvpGZH8pWOB?=
 =?us-ascii?Q?217hQGW/UzlW7i9HrlEQG/Rk/DVfF9nqNyq8lPjCrzfjiyJ00SVS7cbYBQap?=
 =?us-ascii?Q?wVt/tl58z8KHCUyMa0oorBPDA+AZqfJs8y/uNw7pSUNjmuhEtxEXe3YTG3to?=
 =?us-ascii?Q?BjFT1DJAzLYWTaeLX19izBJXJyTpJtMMReaIznm5DQcLPPyAvobXdlhZ8hSG?=
 =?us-ascii?Q?S5ruA4SJe99KIOwAUw0vuQAf/pNsYK9j2fxlEamnHd17uW2UXWnUl4Y14JzK?=
 =?us-ascii?Q?S1qsAsdiHlT3X34UjyVs+uIn/69Ff0PfiwVjVun7VPKhcyAghFX/dH2UWlcI?=
 =?us-ascii?Q?NzMsX0JFDHW4WprFmvxw9a5VtQuysln1Bsr71O2fuEEKnvLY7xbQYtVhHHbT?=
 =?us-ascii?Q?w5gAS5eTgLTpuUSgvK852JnhW1F/BYgOqjFMRA0K8oiMTNhOajXc/O/vvr0r?=
 =?us-ascii?Q?NnnFPLn+nHJnSO8YM7BMMjvvneU0l/8z2IIc7vE/ueFIdYXkLKGQW3P99aBa?=
 =?us-ascii?Q?8ogd8kW+JVmfzM2Jtm2LbIvrioshfuPnQ67bbzu9kg6mTWIT6vnIBGT0/MhQ?=
 =?us-ascii?Q?MFawziQaD6M+qRIs+ZzXFQFF7mQpNBxXZnQQ5qFxSoS5IBTZ7R+R3n7mu3Zf?=
 =?us-ascii?Q?xeAjiHkBERKs4sJ6MLe9hMRXESpbqoa2KgmiRO4OHT1Asw1t7cEHA5Zn7ce+?=
 =?us-ascii?Q?eS+QURsFsmHmp7osDwx/7pYG5xmTgFDV7b4j/RDMHRTYDYAfIivXcva1OtL4?=
 =?us-ascii?Q?xOn5C+4Oy0MCI8ieyhbUvcN+6U/Ue90J5hv2R9Lkg5/SByJJstwkANuiWDIz?=
 =?us-ascii?Q?3Toy8bMAQVmwRm+X2DX24L6/MxkLKTFYa9Uuh7GrhsrxYy4ujVrds6S1l2Df?=
 =?us-ascii?Q?uiS4mqNmN/Qds7GznmL22iRRDKGcGrgZsqyFSuoOZNJKRVty/BAa51Gv9YnE?=
 =?us-ascii?Q?mYx70QNK1FEdcZJJ+4WICcFKb7HJT2ThM8EXqNQTGJr7VkZIqpf5sROQcvUy?=
 =?us-ascii?Q?AJ7G3ACcndx/+BpsNrFO2Aoe1u6wYiOEoD8jAeM/RuZaczDtZu+TVfFniYMd?=
 =?us-ascii?Q?Kpbk/Ti1fec/4RCEQs5s+ciOEdcx4VYDyULRfqG+NbYbVXghwKXoz3jwtaVR?=
 =?us-ascii?Q?kX/K54BZ2VMWz/+WyjGAzGjlzQlAycIQm2J18UUsBYg6qSlrHBt6mHpEcqij?=
 =?us-ascii?Q?wNeVYirAVjvYRbTdhea+kdgDiqnKuV8ite6eanXOPImGi4cFwwwUcbMNtmYM?=
 =?us-ascii?Q?2954U4CWxOUlwgiEmhVi1xYaUbjsCcjMKKhiUF4YLHkcaX/zAxoV4rHgKVzY?=
 =?us-ascii?Q?5e8pVzv7FeFFdNaWFFcMw59vnjxtM+eyRWI++WumM7/sWPs1lfJgEjINBR9E?=
 =?us-ascii?Q?BfMkXqag4z+KiC3+ZiXCaS48P42/8Q12?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 16:48:25.3618
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 903c0f66-0082-4e94-78d3-08dcc5eee763
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6792

Some padctl supply nodes currently reside in board file, when they
should reside on module level. The nodes are part of module,
not board. Move these nodes to the correct AGX Orin
module file.

Signed-off-by: Dara Stotland <dstotland@nvidia.com>
---
 .../boot/dts/nvidia/tegra234-p3701-0000.dtsi  | 27 -------------------
 .../arm64/boot/dts/nvidia/tegra234-p3701.dtsi | 23 ++++++++++++++++
 .../nvidia/tegra234-p3740-0002+p3701-0008.dts |  6 -----
 3 files changed, 23 insertions(+), 33 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi
index 2830eab1b2eb..d977f4901c09 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi
@@ -6,33 +6,6 @@
 	model = "NVIDIA Jetson AGX Orin";
 	compatible = "nvidia,p3701-0000", "nvidia,tegra234";
 
-	bus@0 {
-
-		padctl@3520000 {
-			vclamp-usb-supply = <&vdd_1v8_ao>;
-			avdd-usb-supply = <&vdd_3v3_ao>;
-
-			ports {
-				usb2-0 {
-					vbus-supply = <&vdd_5v0_sys>;
-				};
-
-				usb2-1 {
-					vbus-supply = <&vdd_5v0_sys>;
-				};
-
-				usb2-2 {
-					vbus-supply = <&vdd_5v0_sys>;
-				};
-
-				usb2-3 {
-					vbus-supply = <&vdd_5v0_sys>;
-				};
-			};
-		};
-
-	};
-
 	thermal-zones {
 		tj-thermal {
 			polling-delay = <1000>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi
index 18bd4ccb6b77..0471cea31b73 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi
@@ -81,6 +81,29 @@
 			non-removable;
 		};
 
+		padctl@3520000 {
+			vclamp-usb-supply = <&vdd_1v8_ao>;
+			avdd-usb-supply = <&vdd_3v3_ao>;
+
+			ports {
+				usb2-0 {
+					vbus-supply = <&vdd_5v0_sys>;
+				};
+
+				usb2-1 {
+					vbus-supply = <&vdd_5v0_sys>;
+				};
+
+				usb2-2 {
+					vbus-supply = <&vdd_5v0_sys>;
+				};
+
+				usb2-3 {
+					vbus-supply = <&vdd_5v0_sys>;
+				};
+			};
+		};
+
 		i2c@c240000 {
 			status = "okay";
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts
index 9581b31b459f..36e888053746 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts
@@ -121,8 +121,6 @@
 		};
 
 		padctl@3520000 {
-			vclamp-usb-supply = <&vdd_1v8_ao>;
-			avdd-usb-supply = <&vdd_3v3_ao>;
 			status = "okay";
 
 			pads {
@@ -175,25 +173,21 @@
 					mode = "otg";
 					usb-role-switch;
 					status = "okay";
-					vbus-supply = <&vdd_5v0_sys>;
 				};
 
 				usb2-1 {
 					mode = "host";
 					status = "okay";
-					vbus-supply = <&vdd_5v0_sys>;
 				};
 
 				usb2-2 {
 					mode = "host";
 					status = "okay";
-					vbus-supply = <&vdd_5v0_sys>;
 				};
 
 				usb2-3 {
 					mode = "host";
 					status = "okay";
-					vbus-supply = <&vdd_5v0_sys>;
 				};
 
 				usb3-0 {
-- 
2.17.1

