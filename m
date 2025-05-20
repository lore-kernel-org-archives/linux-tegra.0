Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2072.outbound.protection.outlook.com [40.107.236.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D231266EF8;
	Tue, 20 May 2025 09:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747732137; cv=fail; b=UixYKNl3do7gih8TMiMlLuP1LRk3tGt2BpCo33CxcdIVVLh5fDATU72reNzwHr0KzJrXAV3H+DjFEVPXRiX2bB+mTOTB8d5JJX0nvFP0hcbRtavACmMeHXMH4vUglXYGG/8T4a3w8PawzgMbZ+N3Rv1XWMc8OF9/Co2iW+QuhDk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747732137; c=relaxed/simple;
	bh=MnrPnsM16GSYi+4O1qvfabdk7furPRNaSHscoTYwR7U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ftVVQpfVRsg8gdlX80QN56aL/Z+6HOitHvCOQU6IQCAfy2lZztUlCU5oO7XoiQpaBSDrvC3OD8E0+QWh6YyJjMUdh2Wx8kpYyGgEMUcChjk6GJq7ZEAXyAqNNstXVslwcL3vx92n5C0mWqs9rVvv3QGnJ0GXv2opba65UmkB21Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Vs4Yuadr; arc=fail smtp.client-ip=40.107.236.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Vs4Yuadr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A6hFlNm1B/IWdPtNsp6QZnfcwrO1g4oR9WwQgtCl/xbEGZy5nuEdvZRD93IDl5An2Iq8KaOnN/3R5K/5LjJHlJEoIkodC5sHcUXZv7hRAu1JCco8BMBVMGzi7/zSaq/c16iDnII9gu6KnKdBLZd4OdcgRzQCwByYAyxwPCrjhZxhb44BWK0kBiONGvLG6ZaLhtFqTpCymP+HPs1mQFvT6i4ULBtX12/zBNyu91gkWfUHebmRHmqYgwhm4cdt2mRCQJ+HzzHkJB+mitKdh25cNnJ57GCu3LcempH7I4UFWxFlBWnJthK+4FKG54SsOeNr+ijqh63Zlxl5TF/mPwaShg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HTsa+fMQyDRPwe8qb/g2XBmT5Fw48yomr44gQl1ZRTU=;
 b=vw+YbUKnEEEpZ6eFfIH7RkVkLOIMEy3TS6b8Zue/FWoJXAK8o15aDmPWH3kcgSjRPbj778bRDBGoxh+TFbzID6lq16/en56a9oGG14Cc2KZaB1EKVgMXhP0Nh2/sgPVCppFA2W+lkoLupbnWzS37L1T3TLZc3Mbzz/0v/N2BeJM2kebC1OfAgKxPUyyqh/j1L7IqXQzSE7lKQp1+uHGeNaopxH46+8qFcLSSzHixFrOMADgbtr1eUqLnjdynoGC7/bcxxZoTb6abTJQ5RqWjodo9kAVICy2/wZUnrx1vW+Bf6mUQYMyCrp2kRQe8zCAU5SbvXgdJMc7ZCKVlxoLFYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HTsa+fMQyDRPwe8qb/g2XBmT5Fw48yomr44gQl1ZRTU=;
 b=Vs4YuadrwDgn/gRcuoZeZvtixG7MN+wWaHm44eNDGfqS2Jhi/xYezns1xIM/R+rsgwZdUs2liPPxliZBMTRALpYmfW0/qSquBN++Kk1ar436Lp6aIOrWx+v2GMKBoTT5uPuIbKXuuzQ5bnpy7ZZZX1ILL8JvZLaf9fhr1yHKtE8cIBTmU45H7GkV1uhE1UanGhc/l24qL3qpHDGEW7hxA9E1lwPaDS5L7Un1tnSOMbD3fAcurB754oGpH3DjoQvwrtuVKN/Bg4OZrC4uvoEYzoRFus7x2Cqmrce3VOAL+H7m7ELrsOMq8AKV1+uO51m+XfuAeIz4gDjFIZSEDaYB/Q==
Received: from BYAPR11CA0103.namprd11.prod.outlook.com (2603:10b6:a03:f4::44)
 by MN2PR12MB4374.namprd12.prod.outlook.com (2603:10b6:208:266::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Tue, 20 May
 2025 09:08:50 +0000
Received: from SN1PEPF000252A4.namprd05.prod.outlook.com
 (2603:10b6:a03:f4:cafe::ce) by BYAPR11CA0103.outlook.office365.com
 (2603:10b6:a03:f4::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.30 via Frontend Transport; Tue,
 20 May 2025 09:08:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF000252A4.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.18 via Frontend Transport; Tue, 20 May 2025 09:08:49 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 20 May
 2025 02:08:37 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 20 May
 2025 02:08:37 -0700
Received: from build-shgarg-noble-20250422.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Tue, 20 May 2025 02:08:37 -0700
From: Shubhi Garg <shgarg@nvidia.com>
To: <jonathanh@nvidia.com>, <lee@kernel.org>, <robh@kernel.org>,
	<krzk@kernel.org>, <alexandre.belloni@bootlin.com>,
	<thierry.reding@gmail.com>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Shubhi Garg <shgarg@nvidia.com>
Subject: [PATCH V2 2/6] arm64: tegra: Add device-tree node for NVVRS PSEQ
Date: Tue, 20 May 2025 09:08:28 +0000
Message-ID: <20250520090832.3564104-3-shgarg@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250520090832.3564104-1-shgarg@nvidia.com>
References: <20250520090832.3564104-1-shgarg@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A4:EE_|MN2PR12MB4374:EE_
X-MS-Office365-Filtering-Correlation-Id: 20a4afd8-3df6-4693-d8f5-08dd977def0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9FNFAtm3QJkDwONzZ74n9W1BI/rEMSJIjgM1PdD03+/aHHrdhZc9EGY1m1x8?=
 =?us-ascii?Q?Lxw/2FAnL5DV/8dflo1/yyCXCeTwl90b1vPhjDFTfBu9dbEIWIEaWC3um4OH?=
 =?us-ascii?Q?wTq+Pd+ZXVdPuGvhMvFth80wDkUVJ4fUCOjTSCwE3xHPFGmejzxUlh+oWAWG?=
 =?us-ascii?Q?ImKj0gFGdPkIhVYCaBI+Ol0AwnzxUvxRpXVv/eH4Zzlci01U1Xz9iaMArqnO?=
 =?us-ascii?Q?KMK1di254dXIpmNGvb0X5nJAi5PmtyxkkDVdp10pipJgmUI0mMsDtEvci1LS?=
 =?us-ascii?Q?RP3kaVfJTnSbnHN5uBYZJ4GrrR9QTTIsMDZNhY6QhDtMDjHhvEHDUps/Cfwk?=
 =?us-ascii?Q?uOuho/mTJZtDi1mvizouqaJvKmEsApQE1D4/AC+rXnh56Kq6DKGjRYzPyhI9?=
 =?us-ascii?Q?DZlxPxkisu3Uj73/Do72eNu0efLvMwsAK5F6t0km1qPL1sy6iJ9zPn5C8iTV?=
 =?us-ascii?Q?in0DLIyPlix52DEfge/9AOVYtY94/EXiazslvXho/IR6bLpHGd+6LMIVHTsP?=
 =?us-ascii?Q?WREwdaKvtmrS/kcVU99gCPHjdiUmlzI50dnW/dFsC43aVKNVXN/icz6UZkYq?=
 =?us-ascii?Q?IuDhBiL5UgUr1WKQPCDWqRvDD4db1sDeWbnnLSIIVTA1w29MrXjwfCc7rpmq?=
 =?us-ascii?Q?AlSjEV7ZidCzfTJbarP/W6wxFvoeslYuyldupDu+7sFgLQ9fADJ4ApSyJ3Qa?=
 =?us-ascii?Q?woasx82GaoUv8g6inWmEIexRkxyBxsZFqvHnDC9vPCoEWExh8i2uHzPY8sbY?=
 =?us-ascii?Q?Ng4Y1ILyxU39kkJSOxQsMQSwhoyCbS2oGVsnH9Y7M+Zm+VwhrVdU905jJmKH?=
 =?us-ascii?Q?YtQy0tKjI76rvav1L9C+blf8/ElvU8N/mNHhZI/mlrDIz9URm3Lg715qVgXT?=
 =?us-ascii?Q?1vzSP9K/lMNwvHAROB3GeN0zlzJ49MEe8YTWkFl/WrhGqQ8lYrhvA65YIJVL?=
 =?us-ascii?Q?iy2bBm1QiJRmtV5xcqViMuHq46JSNFgaq1GdYRkZv0yCSvU2574EKuhtTTvy?=
 =?us-ascii?Q?I57ocxHdcWTnZaNCTGR2Cl8zm7sAzgaNU09mMETO797/BR3KYEYuCzLfl255?=
 =?us-ascii?Q?SwRQfYGL/sq28muUW7UsI/nYwY+TXQdZtqOfwOjOUJjJcuI2ugTQxE/pVa7G?=
 =?us-ascii?Q?fvDLJ8fYdLdzBK5NZojCMdnuKuxTJa2EWGfwm9MGr0Sd3eFeAcv/tPQVddKC?=
 =?us-ascii?Q?h6gqeFr51V9y0nEiduwqXs8OTbNloKZ56TZZRu4/be+r0yOr5I257kcqqJMK?=
 =?us-ascii?Q?IRQjfqAZQJzxFu85DVzYqeNPX00etXoVOHrMYIa5PjA9n23Gut94ox8TE2T6?=
 =?us-ascii?Q?bwTk70QqAQZ5KCkZoLIbnZUmtLLhX4u39MNbd0cBiCT+vw4f4vBDtqdTfXAd?=
 =?us-ascii?Q?TfPpnP8zq6uUPEw4pCesttecL38yTrGohpVaP/WEcwiLxWTf+kbKdwXsvcH+?=
 =?us-ascii?Q?2gibrghTITAIu6iyfxCA90wiIEv/CZL5EEsvtEFEeUfU7qiJomYS+dVIrdfD?=
 =?us-ascii?Q?QsJmmTl1YgDFi1m7dmVCn4zbBgaoJhOdqqKg?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 09:08:49.2817
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20a4afd8-3df6-4693-d8f5-08dd977def0c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4374

Add NVIDIA VRS Power Sequencer device tree node for Tegra234 P3701 and
P3767 platforms. Assign VRS RTC as primary RTC (rtc0).

Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
---

v2:
- added alias to assign VRS RTC to rtc0
- removed status node from VRS DTB node

 arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi | 11 +++++++++++
 arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi | 15 +++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi
index 9086a0d010e5..b36df0c0c498 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi
@@ -8,6 +8,7 @@ / {
 	aliases {
 		mmc0 = "/bus@0/mmc@3460000";
 		mmc1 = "/bus@0/mmc@3400000";
+		rtc0 = "/bpmp/i2c/vrs@3c";
 	};
 
 	bus@0 {
@@ -170,6 +171,16 @@ bpmp {
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
+			};
+
 			thermal-sensor@4c {
 				compatible = "ti,tmp451";
 				status = "okay";
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi
index 84db7132e8fc..feae098033fc 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi
@@ -7,6 +7,7 @@ / {
 
 	aliases {
 		mmc0 = "/bus@0/mmc@3400000";
+		rtc0 = "/bpmp/i2c/vrs@3c";
 	};
 
 	bus@0 {
@@ -121,6 +122,20 @@ pmc@c360000 {
 		};
 	};
 
+	bpmp {
+		i2c {
+			vrs@3c {
+				compatible = "nvidia,vrs-pseq";
+				reg = <0x3c>;
+				interrupt-parent = <&pmc>;
+				/* VRS Wake ID is 24 */
+				interrupts = <24 IRQ_TYPE_LEVEL_LOW>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
+		};
+	};
+
 	vdd_5v0_sys: regulator-vdd-5v0-sys {
 		compatible = "regulator-fixed";
 		regulator-name = "VDD_5V0_SYS";
-- 
2.43.0

