Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2081.outbound.protection.outlook.com [40.107.244.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F82323FC42;
	Wed, 16 Apr 2025 12:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744805216; cv=fail; b=BnyrgVyzTJe5fkML5BbbkSZXtmST9chYJdqoSmM7iSDKUv7LGEae3dih1CHPMmwhPsNaz4GyI6VeztdTdW+zKOVpsaFQ3am5QKaIQXDeWGBIesmd5GJz8cSR+W3oHVICZYkCerWQtuqphjhh72GwR4ITd0/f4s0XQIepC5wHPCA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744805216; c=relaxed/simple;
	bh=9cZ7NO89VJP+IkAaPHV9Y9zV91m7vfUAFshmL/taYiA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N5T1xCP0ntgTpj0bJh7aQmJ+2xaQH6S7/XjWaG+dzcyvc6WcEZSVKlkOiia/YvANZOJGzmi9rBspubuW0TJS97eai0eX61bAU9rjLYM5KeZ5AdrNQNIFyw+HbjQpSpVqHHNUbsTVR7nWeI2hP6mrjlSox1/29I5JuODU8xEgCks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WXHL/fPY; arc=fail smtp.client-ip=40.107.244.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WXHL/fPY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z9hviXzIdnaEHFTBaOr+FXZbRDcDlDCudpiAls7k2yDo06Ryl813AWEViNw6b4hDmvQoa9UX36ThD1yhn/k2gHsK0INdGx1ZOro2bKucShsMVFmy5Qkau5K4My/8VCjklZEAQyCMC5f+Wa2o5UTnRKO7OLdFKLiOrx/xiuiq8go6J2hfMln8ezJQvsooYDqUmuWCnMSO4x1+UYRw+MqVWhEURps0t1jUfBdVDEnC3D91gegKhukMH34sYHIx5W4YenR7vzdPGNvXT5NctOXl0SQpxfR5eFI8gD9jeyxnFEioLgCrmoZF1QVDyKkRbtfXKi0JdTAbYVAlXVXn3zVWTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZKhympuWdG9a4qOnF0zsII2lqYWB69G9zewH71vC5OU=;
 b=Ro2fB5HZXZReKskR1MRJjlqpQisI12FzC7XfnBouCzJ3vxgdRRpQdOER7H+JqHzxXa9IiNlpYHlvV8YMMuX/T03q1p4G76fzgg/8aPEP9YHO8xaRx9wJK6JF86aFE6bV+9et9EzjCX2r8mVYyfPXSlnFBqq0jCly9TNiJecjUnzDK8xxAgKb0a8WPab0UG1B3o9iIRGPzAAekmi4c9dOp52ivHtwFrtmG4wRTU0QboB5lK25pqw09aYoYyGVkd2N0xEqfcsigvAItTtCtxyuSnBYwTRkyRTwBbdTv/j2ITd47+b4i8DSeYnBLkhTr8jHH24nkYZSC8NZsw101+g//A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZKhympuWdG9a4qOnF0zsII2lqYWB69G9zewH71vC5OU=;
 b=WXHL/fPYkav2lTC39xYsM2mnrKoIWN8rdYhdU3OHYNDoWuAzsBF3LORUxx2VJ+byqdGIXWS1DGK/KmEDKfcFrRcbKXORsPwhwlPlfJTIVNRi4oVNacPoYeaLtrDyKSM6H2VKlyOthjupF6xXrP/x5vmvbAG6fXrYvx0QuxJexAOexdEBieLdjC1VgFwyzlwpXdq4dqzjjToq903MYT32Cx38AIoP+P9fO/LsMPi7YE1M5/W63+fljA1lWBbOzwd/3dS8ugbqO3Hfpl3ArrUbq1u8GaGIYvVAzOPVc8cZ1SvIMC9/JkraVlVFB1hn9C18XlGLK2PD388j666sdMQJ5Q==
Received: from IA4P220CA0003.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:558::12)
 by CYXPR12MB9279.namprd12.prod.outlook.com (2603:10b6:930:d5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Wed, 16 Apr
 2025 12:06:52 +0000
Received: from BN2PEPF0000449F.namprd02.prod.outlook.com
 (2603:10b6:208:558:cafe::74) by IA4P220CA0003.outlook.office365.com
 (2603:10b6:208:558::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.22 via Frontend Transport; Wed,
 16 Apr 2025 12:06:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF0000449F.mail.protection.outlook.com (10.167.243.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Wed, 16 Apr 2025 12:06:52 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 16 Apr
 2025 05:06:29 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 16 Apr
 2025 05:06:29 -0700
Received: from build-shgarg-focal-20241118.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Wed, 16 Apr 2025 05:06:28 -0700
From: Shubhi Garg <shgarg@nvidia.com>
To: <lee@kernel.org>, <alexandre.belloni@bootlin.com>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>
CC: <shgarg@nvidia.com>
Subject: [PATCH 2/5] arm64: tegra: Add device-tree node for NVVRS PSEQ
Date: Wed, 16 Apr 2025 12:06:16 +0000
Message-ID: <20250416120619.483793-3-shgarg@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250416120619.483793-1-shgarg@nvidia.com>
References: <20250416120619.483793-1-shgarg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449F:EE_|CYXPR12MB9279:EE_
X-MS-Office365-Filtering-Correlation-Id: fa2f942b-ff52-496e-2103-08dd7cdf2ca2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?f1xQQoxVpZX9nU6A6HIa5dybQlQhT9ReqylzQfjK9OMyMDSjO2aTGX0cnxAP?=
 =?us-ascii?Q?JNX9382GFaD03//AlD66pEIM5UZuS7pQmbVYBwdKXFzZZ86N38fzZS1m12o+?=
 =?us-ascii?Q?eosszn9wvTz5q2h8yvKnqFXH7D7GJchucd8G6gdCXBVyF4K349NyUSW15CeT?=
 =?us-ascii?Q?MD1hypUkqvFdZqLnf9wcM6VH+QocyF05onVrzrUVz92Mi3ZtQjfIMRkPQ0h9?=
 =?us-ascii?Q?VPbF3WQ0nfTQ9e6Ktw7XoRaoP1qcZwumpSxPDlOUbQ1xBGKgpKtOLvulWCtF?=
 =?us-ascii?Q?cpqsfDPDKvJln0JUGDkNDn4cQHRuXzbdgXEy4VUrUVMEyjsHlTfeWWeW0ycT?=
 =?us-ascii?Q?uDkuTxUcnLQY2IlC55J6GVxCj31OGH+fru5KiV5+Zczt91MT4VRDSccAjfmk?=
 =?us-ascii?Q?OldP+OW5J8agMuKmATRRwg2mVX0O6CIZ5GpSy2KAk2lA2BVXwEwghlWG52HZ?=
 =?us-ascii?Q?4vFJiqDBLFFHxi+3f8ULdGS2qdivvQnUGVkng4pyafsqDyxYFDGzti54LGQm?=
 =?us-ascii?Q?Zqg8gOqsk8vykJH6+c6cAz13R/fUJHLE0N5/3kGne6wraR7IlqbnRdMttAq+?=
 =?us-ascii?Q?RabbEgSo/zidHi1OzSy3YBabl2goq14MT9V9w4+LRg/XdlXWlvOkaXOLSwg3?=
 =?us-ascii?Q?NyWMeWLqOsQWRuDgNEYyZjRspiNktBiTjze+hJcHYtWCkbEk2nXorZta2eWt?=
 =?us-ascii?Q?um0rpC82JoKIM4ZOu92O5JgBtJwnQKg9y94BEIWdVzMEFOxx+tKBbMIKe/YW?=
 =?us-ascii?Q?AWW0nFTjMzSW+8XvR/9VG0KsFb87EkcfVb83wjiYaxJnSu5OBDTdalS6K4pf?=
 =?us-ascii?Q?IP+9b8B02qcVPYYhyZKsn6GI9Xor7K6wGw9DT5KgwcyVEEkB0fkcdbjkghvS?=
 =?us-ascii?Q?gQUL7KxUtEQVCZzebBO6Y7496UAinzo4Snr2Gzx9I2qy2Ob1I4ku9Fxirrv/?=
 =?us-ascii?Q?Gwq6siLobVAwpJIJGCHZf8kuqvQwfOgAnBKKIg88rNF/HIgMCfsnJsx4sKql?=
 =?us-ascii?Q?LAkWDng96ri5M67VwGWBSBtflC8YTpxPmYTDTPNX+i9gEIWJBMQC/42Y5Z6p?=
 =?us-ascii?Q?DXs6YlAux0vKFQYLNYqQZKfXL/HuJ9vKQG4czfGMyJypv4z6NLLxhx/KqluF?=
 =?us-ascii?Q?XfdcW6jsEilrZf7IdNadoHQtjxD7NBq0/jz2aUAiMj8yPjZ44VOhrppPZVos?=
 =?us-ascii?Q?dajW5lCzq6HfVhQfRVvNwKmX5yDrREsd2EQnE5/vVGS1PIMwCBSKvIgLf/gR?=
 =?us-ascii?Q?+2YuoWcl2bWabMPKqpXSxjTpPbjfVPf+QGy8BXVSRMoPGmColmuEgmub9JKE?=
 =?us-ascii?Q?PUoXhSpHTKNqq4B8lKIP6sPkdgk8W+20WMoMCvbm3LoJRFzqDDKo/+ZEZpMq?=
 =?us-ascii?Q?48M7i1u7+hMPOEA8iraZub0ESI1ThS1ARRICZHbufldoNSCvAoZ/6FfCNKZI?=
 =?us-ascii?Q?/YwWjca8fwIsH0Qzs9ngQDSd9O4yJ/JUo4hFdJ9toVLI4oV+xud6HC709Mn/?=
 =?us-ascii?Q?JNyKtPhShhKlGs5qaDKput6gDwkpm8tnLDKJ?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 12:06:52.2821
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa2f942b-ff52-496e-2103-08dd7cdf2ca2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9279

Add NVIDIA VRS Power Sequencer device tree node for Tegra234 P3701 and
P3767 platforms.

Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi | 11 +++++++++++
 arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi | 17 +++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi
index 9086a0d010e5..d3c1f13b2b99 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi
@@ -170,6 +170,17 @@ bpmp {
 		i2c {
 			status = "okay";
 
+			vrs@3c {
+				compatible = "nvidia,vrs-pseq";
+				reg = <0x3c>;
+				interrupt-parent = <&pmc>;
+				/* VRS Wake ID is 24 */
+				interrupts = <24 IRQ_TYPE_LEVEL_LOW>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				status = "okay";
+			};
+
 			thermal-sensor@4c {
 				compatible = "ti,tmp451";
 				status = "okay";
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi
index 84db7132e8fc..93a787c57eba 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi
@@ -121,6 +121,23 @@ pmc@c360000 {
 		};
 	};
 
+	bpmp {
+		i2c {
+			status = "okay";
+
+			vrs@3c {
+				compatible = "nvidia,vrs-pseq";
+				reg = <0x3c>;
+				interrupt-parent = <&pmc>;
+				/* VRS Wake ID is 24 */
+				interrupts = <24 IRQ_TYPE_LEVEL_LOW>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				status = "okay";
+			};
+		};
+	};
+
 	vdd_5v0_sys: regulator-vdd-5v0-sys {
 		compatible = "regulator-fixed";
 		regulator-name = "VDD_5V0_SYS";
-- 
2.25.1

