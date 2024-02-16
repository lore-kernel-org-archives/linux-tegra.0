Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2055.outbound.protection.outlook.com [40.107.93.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B27378B64;
	Fri, 16 Feb 2024 12:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708086512; cv=fail; b=Kj6RmJw+Jqr72mhFmrZ4QHx1R3G6vj7ZedkIK6K+ZI0u+tpupjsDJV0Nzg23ZDKfbDlAMn+rym2SAI44xmM+XuiXdnF365EW1Inf++sOyQ0a70O3SUQg+4ww7lQvhtELUDgPLvcVCVYP81jc8lp484QTYjV+x64KRv9AoCJwSNQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708086512; c=relaxed/simple;
	bh=vVlhhmVauCpp0m6wyRl20ROjbkL2zfQWKyIwwpSnQhw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bdBbLTQd/xpGaNDPiuspBuDZc+60hrqcXZt1wTRmb1LuJ7/8qlw6jFpisjvviGxgl6/2Ax4ZA/v/z99uA7FZ/iWEwuIuTrusosuH2LExBs0lvuwLBtLpIeAtWuVWiAymVvRfk3nAdMt1bgEMq1XSLdFPSy0NrBgByxvC2cX3YU0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qI+zqrOp; arc=fail smtp.client-ip=40.107.93.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qI+zqrOp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NOymAMnrd1aIjKW8CvhIVHD4OAeueMVj0MkRjF6YFYg7CBcA9NZK81ZNXMLFwR9+DzezqTBQQJ9ag3pVqYu1aDlWJj8VYfZ0Pp3tTJ9a22sjcWI+fhNk0UU85bm42n0hoean7VpapyHj4rVidyGB5oeVILPxA0RwWFYRj9vErLkHnxID8r5c5rGBIT3jTkWNzYKeMlB9+0bUv/bp01CCdGatpQqv5eQrX2l4eSUQI+WEHIJ/fTiaatGVTX7J8V/gVxQiDTyd6r+IZ1E6e1h8h641z+6Dp4jBBh0pHED3eg9LIM5RNDBq0ETWjsad23XWiB73iZHtMPSZXbNMwdbY0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OvtazFFSvOwo4siB8eTESBTrtIG6UEvrpkw9ZzOaGNo=;
 b=CzWcJ9yTvRCt8QK9qWbHQM9+kzYm/rzH89pu3TCsYjHV4D3uRKFkkWgjdGwvFNPKQ+2JB8W9MdSCZTXJ1VqXUGZ9SxD8BaFRkEIRe8a+WK7BJvzC/gXuffcV47ftR8zXfsL1cTkB0kLZpAqJIXZHW4u1ASSOapO0AT5eTtP/nxky3CN67z8dXuSANQI1vSrAVAmt9XtM5skbLM3L6wRjU0+n8Gwpwiuvp59R6VrO2w2fUYPW41MR0i0cQjGi0rpHPaPx5C8SOLBbaooeGYMfb/T/Vk+kDgxZnSBGr+gIEJVmcdcP6mWDwGch19nDIjXrd/ypuvKmU7TIVMpqsQMAjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OvtazFFSvOwo4siB8eTESBTrtIG6UEvrpkw9ZzOaGNo=;
 b=qI+zqrOpTGwGfUE5glK7QN7TuozzFZESevM7hsLK7ftBmdj5MOt9ygxMUlkeLmj/wm5ddrkqFBspC/0HfWnHZKHSwzD0mUGSrVVI2umKTIguCEa/0WuAzUMpuTe5Ys+yfxKMbmmOxymK4/gaMI/tms1pmPsuyKdZCWX2AZL5AJ3vfJSSH4Aq39utBIJauCHtrsNyRlo0AdFW+o7Tg1gDYr7f5v6juGdqOcR4i4lYF3MpxcTTVa5b0mx9aYYtprC4JlnQGpKHvwAdR2hOK8868mKr0KlHGi9O8IhTYR9y+bsFlFLd+AcS1bdZhjtYSy7B6DYU7ltj/Bp1+UNcyAeKvA==
Received: from CH5PR03CA0015.namprd03.prod.outlook.com (2603:10b6:610:1f1::13)
 by LV3PR12MB9094.namprd12.prod.outlook.com (2603:10b6:408:19e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26; Fri, 16 Feb
 2024 12:28:27 +0000
Received: from CH1PEPF0000A34A.namprd04.prod.outlook.com
 (2603:10b6:610:1f1:cafe::b8) by CH5PR03CA0015.outlook.office365.com
 (2603:10b6:610:1f1::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26 via Frontend
 Transport; Fri, 16 Feb 2024 12:28:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH1PEPF0000A34A.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.25 via Frontend Transport; Fri, 16 Feb 2024 12:28:27 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Fri, 16 Feb
 2024 04:28:17 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 16 Feb
 2024 04:28:17 -0800
Received: from moonraker.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 16 Feb 2024 04:28:15 -0800
From: Jon Hunter <jonathanh@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Jon Hunter
	<jonathanh@nvidia.com>
Subject: [PATCH 3/3] arm64: tegra: Add USB Type-C controller for Jetson AGX Xavier
Date: Fri, 16 Feb 2024 12:28:05 +0000
Message-ID: <20240216122805.32529-4-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240216122805.32529-1-jonathanh@nvidia.com>
References: <20240216122805.32529-1-jonathanh@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34A:EE_|LV3PR12MB9094:EE_
X-MS-Office365-Filtering-Correlation-Id: 98274d15-7a04-4896-e7a7-08dc2eeac71a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lOXfI0WTOMT0f75EZJ/Qp6qAWv2Yi83lz10QsHAGhZWdmuHwQvWIivg6DII3lpMT5hUWiXFNwc8yIt2SPCvlDlrhUuIKM+53oBH+CPZ9QnzwV7Fz1zcvBQoRAQC2IHyaYKpygr/o4g8PE3xKx0UcUFAZ+aBvVd8mW+k53r/NsCddsiUmAghvCjLjSYGYGlyPfFKnI67istn4Pt/E0iUSoTA825Zoiu3vwsl+ZxdagWA3L64bNPMRLf8/o8DJYpYwR+wRCTtYxuXV6sSX4e3DaW8GstU/1q0K/JhiHXghOyOhQh3oxnNnXg2XaznSwoybJ/Ua++iGMfl2AZCCTZkQnkM2HPJxjgT4wLvW1Agr/0+esPJQu8/qS02/+BI/1l44Et18uNT1uGrfmbGzoI52wzZfQlVo4WD0/Nu274ldLMUJVatihIN2SPN6EQCyxbHMPJh8BzlE1SXdJxzlUT5YU6qoGfTnrFGvJopHf6bt7ad0VcSlKDA8rK8Sx0mOdMKKI3Qgy8J8RukYeADhMz2iHbM4YOXq3pSNSQye8PgXzE99JVYwCl7FeRICLwXEYR9fDph9hzeSQbFQsvryobkLyzHttAG1calctkcYxet89btSESdWvidXtS48CU/kkHvsEK6T11m1nzZEs+fmla22/911u7LxernSEHxRI75bDY0=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(376002)(396003)(136003)(230922051799003)(36860700004)(1800799012)(64100799003)(82310400011)(186009)(451199024)(40470700004)(46966006)(8676002)(8936002)(2906002)(5660300002)(4326008)(336012)(426003)(83380400001)(356005)(26005)(36756003)(86362001)(82740400003)(1076003)(7636003)(2616005)(7696005)(70206006)(107886003)(110136005)(70586007)(54906003)(316002)(478600001)(6666004)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 12:28:27.5859
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98274d15-7a04-4896-e7a7-08dc2eeac71a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9094

Populate the Cypress USB Type-C controller for Tegra194 Jetson AGX
Xavier board.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 .../boot/dts/nvidia/tegra194-p2972-0000.dts   | 43 ++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
index 63d6cca542f7..c32876699a43 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
@@ -2062,8 +2062,15 @@ usb3-3 {
 
 			ports {
 				usb2-0 {
-					mode = "host";
+					mode = "otg";
+					usb-role-switch;
 					status = "okay";
+
+					port {
+						hs_typec_p0: endpoint {
+							remote-endpoint = <&hs_ucsi_ccg_p0>;
+						};
+					};
 				};
 
 				usb2-1 {
@@ -2114,6 +2121,40 @@ usb@3610000 {
 			phy-names = "usb2-0", "usb2-1", "usb2-3", "usb3-0", "usb3-2", "usb3-3";
 		};
 
+		i2c@c240000 {
+			typec@8 {
+				compatible = "cypress,cypd4226";
+				reg = <0x08>;
+				interrupt-parent = <&gpio_aon>;
+				interrupts = <TEGRA194_AON_GPIO(BB, 2) IRQ_TYPE_LEVEL_LOW>;
+				firmware-name = "nvidia,jetson-agx-xavier";
+				status = "okay";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				ccg_typec_con0: connector@0 {
+					compatible = "usb-c-connector";
+					reg = <0>;
+					label = "USB-C";
+					data-role = "dual";
+
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						port@0 {
+							reg = <0>;
+
+							hs_ucsi_ccg_p0: endpoint {
+								remote-endpoint = <&hs_typec_p0>;
+							};
+						};
+					};
+				};
+			};
+		};
+
 		i2c@c250000 {
 			status = "okay";
 
-- 
2.34.1

