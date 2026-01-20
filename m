Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010064.outbound.protection.outlook.com [52.101.56.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05D13F076C;
	Tue, 20 Jan 2026 11:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768907516; cv=fail; b=LbxXl/9RcPydjnlsQNm57L12xHDijnZC8h5804xUbv9rtVRVswNEvq6U1k/FwNMpS+Yg9gO/jxTZHV1EHacwsHv/GwBGY4/CbXyG8JcMtHVy/oGf0vkIicK+scvvjcTPa5MA3P6f9D0PE5BIlCdmb+vOt2C7NX6XE2PifecswtA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768907516; c=relaxed/simple;
	bh=/McHEUb7rRlPpd56pORoJAPpM/D/iac/L4mqfKteTjM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XN834XvgeDg04DXk3AG6luwI+XfNzdFW2Q6pIbaBq7Eh/fVbgOBlbf231MV3GOSw7OC9DJjNO7XfBHjiAuxDZMl0CBVPs+ocJ5Glx4W2GyK9DjY3+CP0+5JPW6vSudxvUhDUPMN7SK64SW65xkDzDeMEHZYrcn3oT0Fxibl9Zvo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Dz58Oi8Y; arc=fail smtp.client-ip=52.101.56.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Dz58Oi8Y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=veGm4ojkl8pWLW+xrLoD2INCnckSRuU3JcWKtlcqZUmKju1PHNzapzJJy52MpXAvP6xgV4olUiQlzMCVdh0oFV7IRWWXsnVl89RnpcZTee975KPKWaC9TAsmKw1VmVHOs6CJB0VsJZ6vqNIlFuODGbu4tTQlzUSIanZ4uZZQ4SNq8/6T9J6YSU6+qtgQQAPoWTJj2xuLPq5K+s58dz3mEz+LLjIOciVRZA2+5oCjQoigwu/d9//8Ou+vO0odUaGF8kiry69VzHBgKJdDCfc4q+wmIMvWpYFdCsn3xg+zxl5p24TXgJCR0mnPNqKvQdEeGwsqMcS9TqqTeEbnAYDjsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+9uCZ2v4X38I1rUt7PxzmfFxvJRzaZh9v8sD8r2eDcI=;
 b=JQ59QmDKNe+hBow5Rw2HfDKvOAvz0X1PeFkagW9yqaELjJklRan+4kxatQYlgSYC+Xo4NoToNM1xfJ+qZq/VYERDBr5d6fAbdfNMn/RGRBSl5/TKcxB4S4+eN2iRCvbJsPqCPuIOevaiValA2rIBIMPS5y/HnJlhbH7W1meXF5qQYdILPbjX/9CwS1iil5Ohf1q+vEJQ87JEfqbWLRtjxxbcpR/JbP0Cyor/c2Y7TtjMVlX0ZVbCRwpzghE3oNH5+0h9RLVaEEgno8oJTq3BbWsmrYwwW+I0XF1P6b5+kKe2COKzvHRHtS4T5+B9wrkXkU0DKDQqeGAyRcRxY7lsHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+9uCZ2v4X38I1rUt7PxzmfFxvJRzaZh9v8sD8r2eDcI=;
 b=Dz58Oi8Yg3h1gtBvnH4oV6VGrKQk1MbXmekzaZyzqu9/d4xl0OOdhgtFN0Dei7u5+hF6xgNFtvg2mHhAATncrv0pcUy1UB93Lc8bjWsRK04Yc3aSLGfwVZZY+Lch0DxvtudSaUkQrxc5NwAtam5mJahj3KLRam5LsqJ8Q47K+ev6u1eYn+RdKh4wOJJrUzzUHjumhM2DYx+jPnrfAzDNLf0DZrG0S+3KIR2yFJ2/mjFOqItJseLCrGT1Tna3kATcd0ax7Azpa6zkku17h/OQMFXjv0Vk4favEmAgAcjg/66+q7vloh/6sopJLuEZL/AH+3qn6IQkyxyMwDX4a0gQ7A==
Received: from BN9PR03CA0396.namprd03.prod.outlook.com (2603:10b6:408:111::11)
 by CH1PR12MB9600.namprd12.prod.outlook.com (2603:10b6:610:2ae::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Tue, 20 Jan
 2026 11:11:48 +0000
Received: from BN1PEPF00004688.namprd05.prod.outlook.com
 (2603:10b6:408:111:cafe::69) by BN9PR03CA0396.outlook.office365.com
 (2603:10b6:408:111::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.8 via Frontend Transport; Tue,
 20 Jan 2026 11:11:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN1PEPF00004688.mail.protection.outlook.com (10.167.243.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Tue, 20 Jan 2026 11:11:48 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 20 Jan
 2026 03:11:32 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 20 Jan
 2026 03:11:31 -0800
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 20 Jan 2026 03:11:29 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH] soc/tegra: Use Arm SMCCC to get chip ID, revision, and platform info
Date: Tue, 20 Jan 2026 16:41:27 +0530
Message-ID: <20260120111127.83898-1-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004688:EE_|CH1PR12MB9600:EE_
X-MS-Office365-Filtering-Correlation-Id: c95730bf-0351-408e-de4f-08de5814b489
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?a4citHwYz15EmTj2fPy6etvILSC4euTyxpVshMEKWzf3S0SHYePrSoELf8fy?=
 =?us-ascii?Q?5xkbpnzyQyF3v/RBUK30ECZVP19LrsDFfMzU8UkvSWAMDcbKmBWlaM/8gsPY?=
 =?us-ascii?Q?417JVE7Zu0OYUWwEG2w0KYZm+wjC6Mg9oUgFLAm0l0Qx6OCy5eCLIEyl07Vu?=
 =?us-ascii?Q?CtlGwTTTKWL7ewEEnv0W/fRb9T0W5FlOwTTy8ecx+SRP85go1aHmVRtIEGMB?=
 =?us-ascii?Q?P0IDdaEPQH9Y7KYxQ5x4XDOb53+y5SE/YUe1fu7iKNv2ziomcP4b4ZSMxsXK?=
 =?us-ascii?Q?9GjGHSuOo5Z5sJ9GQpkvJZCUFxDguM6aCExerHN1iYSnuTaWqIOqUNgelGIl?=
 =?us-ascii?Q?6KSGkc9FqFbBQn48honEdIB0N/iWQWw0eUrXSxFm9E+4czGsJ/yQdYxhFQZo?=
 =?us-ascii?Q?wKvUonU4D+Uel3iz5OyAfnf1Eb5blI7ltiBf1+pSmzAvTqOEC3OuhmpfD5Zu?=
 =?us-ascii?Q?u2KFCIZprxsRLdagHFCvEFUlxha8bQ1rKPFpSMO1RvX/fccyR20cpGNXxtdc?=
 =?us-ascii?Q?2V4Vdx9vvi88R6tEUU7BgDyMWWiIKFcGQfx6lQVMCyRVp2stFtDtycl79U95?=
 =?us-ascii?Q?GAmUxiVI2jbyanIgTygSb1uLckL70DYyZiox8lGLPuWaFI2LnaVA1cLG8fzj?=
 =?us-ascii?Q?k/5WA8/dcXNlsByquGoVEp5u6A4u8kqDeGnC/TQvr1gHuGwKlMFPbUzgsN2/?=
 =?us-ascii?Q?Cc8fJqXyDGbL9O0Np092mEoJ5CSKbDZq11ONKgxSZoosxqcLippVXqzV0sGa?=
 =?us-ascii?Q?KtawIEWe6aXvTrH2RllQUFMuPhk75d2/41PmWJ6ITLKrMsU3cCx0alMnam5I?=
 =?us-ascii?Q?V9DDIT+OpI/65T0wHYT+3E0IY/lrj2FIY/3DHziMgEcXcRpPwl0FPBE5uhK3?=
 =?us-ascii?Q?uwpOYNdEcXSyNovaL9989g9rkOM2f3jg6efdgkhMYxxTJBrc/Py9UBnc1dbg?=
 =?us-ascii?Q?zKuc8YYECYoIaIx1UWjYvgN1FxMISkoSqAwWapp+fiH3w9MrVSWYVBD0NjDd?=
 =?us-ascii?Q?R8iYoiNktxIvtqoIXxcufYEBnM+u2y9P2ze9FOKUvcubAVQu+pLM6l2OzqRX?=
 =?us-ascii?Q?t9HHFf+qLd+E0iH/nDTTAL7oiPg9n4keZ9nuMhdYbVsH6PcUPghdOxocQ5/y?=
 =?us-ascii?Q?7LwlZot1YSqt9qzXFAOIgoUoJ2gRIMZkCF1PEQuTO7UXQ9b+h7aUZG9PJVMg?=
 =?us-ascii?Q?DeU43pwN4o6GC3zh0euFjI9J5ZsKebF0xnTwgp4NWcZmgco4NbZ/NBcu9WlG?=
 =?us-ascii?Q?nyhzFW2b2LoW7xXMbgw2OzosVH5TcgJDXDrASazjBoiOxEb4G/3+5JgUnnoW?=
 =?us-ascii?Q?pY4yMmB343ol6Sc/e4kRpQ/GQ8NUVOMYsDVZwfvCdF/ILTM29+OWa1Lj90Bk?=
 =?us-ascii?Q?JPjPgIEC1Te352v5c/+ZtRgknnCUWoPnX4xu+btqzXHuX8BndrMzQebtUG7R?=
 =?us-ascii?Q?MX9x9afg5Il8F7l9toQTrSQCKGz9Y29bwH6UiSCm5muZPQvrQ6krorJpqk7W?=
 =?us-ascii?Q?tOjIC70Xyp8C0tuAfAg2Lh4eEkSb481o+mPWMzvbCcclCfdFete0cgvEU0aD?=
 =?us-ascii?Q?vrzk87av1agcpyWHvH7ozsMiJ3qNae6I1gFf66ZgCFBJBw44Je8K8R9n3STB?=
 =?us-ascii?Q?NKZ+fWrgt9+397ykJ1JwYEzcseHoJwH4tRqN44020CmDOUzu/2X22y74TYcR?=
 =?us-ascii?Q?0wHz9Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 11:11:48.2749
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c95730bf-0351-408e-de4f-08de5814b489
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004688.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9600

Tegra410 and Tegra241 deprecate the HIDREV register. The recommended
method is to use Arm SMCCC to retrieve the chip ID, major and minor
revisions, and platform information.

Prefer Arm SMCCC when the platform supports it; fall back to HIDREV
otherwise. Behavior on older Tegra SoCs that do not support Arm SMCCC
remains unchanged.

Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
 drivers/soc/tegra/fuse/tegra-apbmisc.c | 31 ++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/soc/tegra/fuse/tegra-apbmisc.c b/drivers/soc/tegra/fuse/tegra-apbmisc.c
index 0ce94fdc536f..732a0a830bdf 100644
--- a/drivers/soc/tegra/fuse/tegra-apbmisc.c
+++ b/drivers/soc/tegra/fuse/tegra-apbmisc.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/arm-smccc.h>
 #include <linux/export.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
@@ -27,6 +28,11 @@
 #define PMC_STRAPPING_OPT_A_RAM_CODE_MASK_SHORT	\
 	(0x3 << PMC_STRAPPING_OPT_A_RAM_CODE_SHIFT)
 
+#define TEGRA_SMCCC_PLATFORM(x)		(((x) >> 8) & 0xff)
+#define TEGRA_SMCCC_CHIP_ID(x)		(((x) >> 4) & 0xff)
+#define TEGRA_SMCCC_MAJOR_REV(x)	((x) & 0xf)
+#define TEGRA_SMCCC_MINOR_REV(x)	((x) & 0xf)
+
 static void __iomem *apbmisc_base;
 static bool long_ram_code;
 static u32 strapping;
@@ -41,21 +47,46 @@ u32 tegra_read_chipid(void)
 
 u8 tegra_get_chip_id(void)
 {
+#if IS_ENABLED(CONFIG_HAVE_ARM_SMCCC_DISCOVERY)
+	s32 soc_id = arm_smccc_get_soc_id_version();
+
+	if (soc_id >= 0)
+		return TEGRA_SMCCC_CHIP_ID(soc_id);
+#endif
 	return (tegra_read_chipid() >> 8) & 0xff;
 }
 
 u8 tegra_get_major_rev(void)
 {
+#if IS_ENABLED(CONFIG_HAVE_ARM_SMCCC_DISCOVERY)
+	s32 soc_id = arm_smccc_get_soc_id_version();
+
+	if (soc_id >= 0)
+		return TEGRA_SMCCC_MAJOR_REV(soc_id);
+#endif
 	return (tegra_read_chipid() >> 4) & 0xf;
 }
 
 u8 tegra_get_minor_rev(void)
 {
+#if IS_ENABLED(CONFIG_HAVE_ARM_SMCCC_DISCOVERY)
+	s32 revision = arm_smccc_get_soc_id_revision();
+
+	if (revision >= 0)
+		return TEGRA_SMCCC_MINOR_REV(revision);
+#endif
 	return (tegra_read_chipid() >> 16) & 0xf;
+
 }
 
 u8 tegra_get_platform(void)
 {
+#if IS_ENABLED(CONFIG_HAVE_ARM_SMCCC_DISCOVERY)
+	s32 revision = arm_smccc_get_soc_id_revision();
+
+	if (revision >= 0)
+		return TEGRA_SMCCC_PLATFORM(revision);
+#endif
 	return (tegra_read_chipid() >> 20) & 0xf;
 }
 
-- 
2.43.0

