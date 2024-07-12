Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2071.outbound.protection.outlook.com [40.107.96.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB7616F0E3;
	Fri, 12 Jul 2024 12:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720788509; cv=fail; b=umeyeFwGhKot5Ic1CR1UlaOOuUSORoZD6jU8rUgEho5vqMJuNKoAYee5TKzEVEXPomZ+4l+YwxNdFLK3wXzLZ2XCjVD44G72+YSEt/T6mK09Npe9Gqqo5bDyqtks+vr1MpCzxORkTBQ/Jou+tuQHzakkQR8GZn/8PymxT9MwCv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720788509; c=relaxed/simple;
	bh=ZtmfCZnIgkakKWLsl5f/KkB1KHaX6uEgnK7P5Zli1Mc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QRErLufksntgAyIJAY/keKsAtzV4fvWphhUSVra9KbQ3fHf/JUHdyfPaelSGnCt4vS/Kp6j4MvaLx7VwcP03sRPCD9tzOOqhTJQfEErYSdU3FJp2aVW0hUq9Snj954FnKLuy1PNjqDfM0WbDua5RB9cjwRCvpb8zmyU9RZJo7wQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Y40Pyayo; arc=fail smtp.client-ip=40.107.96.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Y40Pyayo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RC6D5tkeA3/n7M4aPQbuQarBFaFHMt0ehmtlbKaxlgX8xEliin0eM6rM6z2MzPmjPJ+eIeODxzP+J06IuD9JHJRPMcerovFYGOKWpCbcS/IvOzVkzuyW4rRShPA7H/b/kpINiuhHV4M7pXLYIRFPVf2La1prp0bEIns2qPqKhjJ4JvEigmIzGq512WVdfQ2pX3RkwGhlbipaNzyYMD5SSRdP//wMd6pULe9OFcdr4K5i8Pl6Fa0U9+q6vidm6g3pXTdiQK2a03GkmOPPGj+heHKwDHuCrhG87eznMWW1azUZDcFpTvOdLCqK1hjK9WwB1Vo8E2I6oANrQOu9dMnFRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RzQvi3gCOWj4tbHn96+R3d/VBAJGvMoYS/dPEJtxW6I=;
 b=eoy56v9Z8R/OW/FjQDD9fZQCGBAWTT8ZM+NGhkU+tF1i8RmiVyPKc6Z5oxfNL52rvQSDC87+BM3LkqjeNuESeEfh8AfnlgEyvjkK5dfJ2CxqkcrO7w2YBblwmuohdjH169LAXy+xhG6L20BSg5ZJlcHxfWcxtrWfdGdfCiSB2+e56nUj4zQCK+7CIIuWqZFZ44UOLurt/xh16q29Q/LXTfA1hvYVHVWeSJDBncfKHZoftoA4iQMDK48XbK/g1OUmdtKWn3hq+2Y4n0CNWboemEzJpP1csm2jq4PzcW81IE94hf7SnKsWj1vPVyQ46flZq9IdAycOgxXnZJbdTTtKuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RzQvi3gCOWj4tbHn96+R3d/VBAJGvMoYS/dPEJtxW6I=;
 b=Y40PyayoWwkFU/UqjgLP6UdbazqSZB0GcKeETRfgCmSshCdm984rZQiRcDYSzohgdkGoylH8AL5sqvhsVnfwgm3qgYW8qQfe1mce7Y6HyBF+SbHWznPPH9da87U1MpFhcHQ/4Cjqh9hMvm7lG4inTJ/W6vLUPpvCzUOw1A/qAQKBEi/SkZ6721MOtHN5uDwWvgPprV4LZN4N1Kt6jMsPfnnTLfEKVrLYoPtbOV+ZfwTHIcG4TkdehnicFXzeRepAPWyNpLQI0bliURcBQ3aeXJd0mxe7M5h0H5vSXxxDl/AlFvwn/ZcExUGMnLKng/FXq6hcfHfDM9aSuvo31rwWqw==
Received: from MW4PR04CA0267.namprd04.prod.outlook.com (2603:10b6:303:88::32)
 by IA0PR12MB8840.namprd12.prod.outlook.com (2603:10b6:208:490::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Fri, 12 Jul
 2024 12:48:25 +0000
Received: from SJ1PEPF00001CE4.namprd03.prod.outlook.com
 (2603:10b6:303:88:cafe::8f) by MW4PR04CA0267.outlook.office365.com
 (2603:10b6:303:88::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.24 via Frontend
 Transport; Fri, 12 Jul 2024 12:48:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF00001CE4.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.17 via Frontend Transport; Fri, 12 Jul 2024 12:48:24 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 12 Jul
 2024 05:48:16 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 12 Jul
 2024 05:48:15 -0700
Received: from moonraker.home (10.127.8.9) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport; Fri, 12 Jul
 2024 05:48:13 -0700
From: Jon Hunter <jonathanh@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
CC: Vedant Deshpande <vedantd@nvidia.com>, Brad Griffis <bgriffis@nvidia.com>,
	<yiweiw@nvidia.com>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] arm64: tegra: Correct location of INA219 for IGX Orin
Date: Fri, 12 Jul 2024 13:48:09 +0100
Message-ID: <20240712124809.222395-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE4:EE_|IA0PR12MB8840:EE_
X-MS-Office365-Filtering-Correlation-Id: 8170bd5a-e8b8-4b36-1015-08dca270eb66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?l7xxN96OSEj5WJ9eSJhoDqNyu0Q+JKPmPMOvG2qmrjfmw5Ya3/wPWJyO68Cz?=
 =?us-ascii?Q?0lhPbratPb9zPpEYLni7JPdZyQxOCZVXEWwRwFwN3iBSpiCBfoUjbEQDC1ig?=
 =?us-ascii?Q?tF1oyaf9tS3qD0xSRh4foQOSYj+2DB5ndbP+KkvSmBvQEPEfdzhe8zx/PHDW?=
 =?us-ascii?Q?2LO+FqULZFdHUc7k7EZODsyKEgb3hCkvR2MRUu1gifwXk9mPWH2X3Cz5LNTp?=
 =?us-ascii?Q?MPwEYAq+9crcT00VVgFKQBO2T3bIXXoP1w/uN1uCagbnU9qmfHKhieYrOAqv?=
 =?us-ascii?Q?s/IGt9tCuv8u9MGDcWYmf4K/d6IRvLSpS9LO+wnjD5/jdtx7UgJj3EoCwYaI?=
 =?us-ascii?Q?iENm8u+BzNiI11bvACZVm7rk5DlsctJ5r/F8rvkqI/24UEKZ0GOzqjA220Bu?=
 =?us-ascii?Q?nUH5W6O6ldPr7uYdO5imz59svG00xLmLvZToR5CAqFS04h8Hi9GDW+y4567m?=
 =?us-ascii?Q?aZtqwzlYRjJ6XL5hHm48SyIjKyonTOVw7ywFwFaDSzGSW9UqtI0+EXfIPd/A?=
 =?us-ascii?Q?2WeMHJCQJnPPHH3bz3x+8xe+U/cMye6yj0BTqty5Z1J0GcP/Qac8H5U6xl+b?=
 =?us-ascii?Q?j6A7LxWAgZgYuptdcJ11TkAHzHpOnHObd/QyMzG6OK5hn/wqLW/bnok9aALv?=
 =?us-ascii?Q?ToNbkX5lte9JyvEIno2xXzLa+8MGMQNPFD26xSux3YEOdm36yPwEGxTAf3Oo?=
 =?us-ascii?Q?x1aZFKkiSpGz22G/DV/hWaCdDqAoMpfhdXHeR9bY2/5mb4tYzKNlJyUN5Oht?=
 =?us-ascii?Q?toI5EszwV5OAuuujtY9/GA+74L8GyWIz3PwbDanTydvkrbQUXSTKkAnhoysi?=
 =?us-ascii?Q?lZ2MCUIVBvrxsNOJNwFztL6Y3e9GquP6qQ8hxZUg24c8e9aTRx5qLapBMcvL?=
 =?us-ascii?Q?6udLBG0j3ra8UtU1gPxNmK8ZD3yVaeLWCjJkHBrKpyTRT81f8ZVP+ezbub/q?=
 =?us-ascii?Q?i+cYxz/70Ls+uaLpxUK7w24+8Rp3mN3ajFmDkI04SzbbU/Gcclt0w1S9QhL+?=
 =?us-ascii?Q?TuGfBtkJvzYlasD5azCeugLXMGmJWqOmDdacI2D9HeJDqQCdEMOLaHmpix5J?=
 =?us-ascii?Q?+WvoNkFlt0H0r3g9nGlkQwaW0g4EZ9MPkXGKjwk6o+wKGs0bNGMLDmFekrZF?=
 =?us-ascii?Q?iM6r9F7AvbkHDFhYHvKocjDXerbtmwPoBwR9ANku7H9h6xLUuZMvVeTsAq/O?=
 =?us-ascii?Q?prRgGvqAhsCMMRiFXciouB1QB2JpkR+xpLm1bbCIFGuUi/eNBmOaT7KFUYjy?=
 =?us-ascii?Q?vpwfK7r8cid9DwIy4QJhAcgekc7aJbioVtiL16VkgnSYJMFJPL4WjTx9+Wv8?=
 =?us-ascii?Q?X521UC6t0sni0FWY6aG257B+KitCUbPol62tQHxtseSwPMpDtl8o/O2KFuR7?=
 =?us-ascii?Q?0ZFUn+d/+Yn4uHA7VHu+Zo411/6nEVmFIb51CkJipZAAD+myn6gOKgYs5SjN?=
 =?us-ascii?Q?FtM7pZiBSvbPkrvZ0VgomyQ97/5ZtyyM?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 12:48:24.8201
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8170bd5a-e8b8-4b36-1015-08dca270eb66
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8840

The INA219 power-sensor is located on the carrier board and not the
module board and so update the IGX Orin device-tree files to fix this.

Fixes: 9152ed09309d ("arm64: tegra: Add power-sensors for Tegra234 boards")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234-p3701-0008.dtsi | 6 ------
 arch/arm64/boot/dts/nvidia/tegra234-p3740-0002.dtsi | 8 ++++++++
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3701-0008.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3701-0008.dtsi
index 553fa4ba1cd4..b58b9c496988 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3701-0008.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3701-0008.dtsi
@@ -69,12 +69,6 @@ input@2 {
 					shunt-resistor-micro-ohms = <2000>;
 				};
 			};
-
-			power-sensor@44 {
-				compatible = "ti,ina219";
-				reg = <0x44>;
-				shunt-resistor = <2000>;
-			};
 		};
 
 		rtc@c2a0000 {
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002.dtsi
index 527f2f3aee3a..03bdb71ae0cf 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002.dtsi
@@ -183,6 +183,14 @@ usb@3610000 {
 			phy-names = "usb2-0", "usb2-1", "usb2-2", "usb2-3",
 				"usb3-0", "usb3-1", "usb3-2";
 		};
+
+		i2c@c250000 {
+			power-sensor@44 {
+				compatible = "ti,ina219";
+				reg = <0x44>;
+				shunt-resistor = <2000>;
+			};
+		};
 	};
 
 	vdd_3v3_dp: regulator-vdd-3v3-dp {
-- 
2.34.1

