Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013056.outbound.protection.outlook.com [40.93.201.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B8836A025;
	Thu, 15 Jan 2026 10:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768473414; cv=fail; b=I/GNFNbEAFOTpAepyln5A0A4W8UnJQFYo+LtswOpmDnQzhj+LGa+1wMUpovS801maP8iCETrk8BTaW7Zwigbk/8Yfr6xOaxgmaHZg1u917o2OsLTfWHlKsRNpnFE2XQxaVXzaTh9L9g8xqNQXdQE28jTYaOzrW6vEfjJHrxrgZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768473414; c=relaxed/simple;
	bh=F3nt5JrWMC3z2WHvsjJN1XhKXfOBS5dyLWdUSor8r0I=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hI9zP+r7IF9ZBEUN2rb3W0wC6ItzEHHo8XUPvMcNsYoDrjNDvFCD0vAZFMyeJAkBVUG6Pl/PZ6O4Uw3JVKJfCxs8NK22WcRglsRqigg8XqA1Tc/11ciq1IZsOpRtqlklwiTKAlS4hZnECl3tpYo9kndlQlBeTf5POgq5AiRTiBs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=noC1F+l9; arc=fail smtp.client-ip=40.93.201.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="noC1F+l9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OTIFdjBbjswzbbxc0n2BZz8d0ApRHTZBaMkrhhFgMkxaf4mEsnZKp1v5iSJhC00A06F6nYdxBaNWgRvhhew/ZfXCQrY0xrG3h7XMLT1pMm4sHWxaQpzzu8nZUrqxKw5sFtEA4GPO67cZf86ok0PHQH40al/9TuE6jk40JxAaBfPKDlQ8s2bWoW0QBILSKx9hPkDGMFmMm46SRq/FfS7jzBWIVV2APANOzc3GZWIupMVGS9lGlBFaLq1rFl6Ds08IvH1LG0v20YY7AMxmN3Z6/kkddMqKE2DAZCxPYR965Hq2I3N3KAax4dOiJLocNYKLPQD7S5RnootE8ctElfSA2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=69FQeL4q8bH6X25kRvd6yDVrtFTH1/iDAOzwL9ISKkE=;
 b=TJA8nEIIojfKInzJ5oiZAvdt/IhTMm7zcqVM6AF5tNlciYXxAKxw9tmt002HAiycHJ51f+hEmnOzVrtjNOm5mn9GjhFkZ3g8dUSJcIKbZgy8zQNWjOsHxNXrlK0KhmXh7UbPVHsKCO4NAC7aVsYvTK6d+99zaKDGLwudUOTBQHjG+PQ5QQ/zlcqYU9/kqpUAT9l4dxJmIGVdfKaf5x8l8mQTWCdKyZPmbfbKgMUx4O7XmG6S7EbVh8U5zjmpnrWioaiOsQqVJSb/yyAhZwpdUU+TCIN8EZmTBXSH978c20SF7m8SrObHPtlc3EIQvao44OGyzk17qRq3TTzWac/n5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=69FQeL4q8bH6X25kRvd6yDVrtFTH1/iDAOzwL9ISKkE=;
 b=noC1F+l94cKi+qbSEHxJEloQgSphPn9b2Mnvce26SAvWCBEKIiSiyq9dDSberRYl5JdVMBpkzr8/pMnJUeLhXuTuXEzYSy531VT1kObqHIkNnXyr/rsEtyS47YbTEIOL+Pqrx+tqpF8P2Ffs3F+9qi1S8jJfZ9GF4K+4pYYmiP4x4S9gTFGVJB4H5iAOOfPnLLWUwHmEr9QEZ5ONeVcJ5tzzxfySlOyKZBUuBp/USB66gUEL0aLaeXTEbnQwrVfALK1wx+HKrgAZQCPCSyS5E/eOXwJ1aPfo/YTCXiHHDeivcnYir4LX9a/gUooJI/4harqvdEnan2c9IAjMixRY1Q==
Received: from PH7PR10CA0003.namprd10.prod.outlook.com (2603:10b6:510:23d::24)
 by SN7PR12MB6929.namprd12.prod.outlook.com (2603:10b6:806:263::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Thu, 15 Jan
 2026 10:36:45 +0000
Received: from CY4PEPF0000EDD6.namprd03.prod.outlook.com
 (2603:10b6:510:23d:cafe::7c) by PH7PR10CA0003.outlook.office365.com
 (2603:10b6:510:23d::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.4 via Frontend Transport; Thu,
 15 Jan 2026 10:36:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000EDD6.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 15 Jan 2026 10:36:44 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 15 Jan
 2026 02:36:25 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 15 Jan
 2026 02:36:25 -0800
Received: from 5b171f0-lcelt.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 15 Jan 2026 02:36:22 -0800
From: Wei-Cheng Chen <weichengc@nvidia.com>
To: <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC: <waynec@nvidia.com>, <linux-usb@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Wei-Cheng Chen
	<weichengc@nvidia.com>
Subject: [PATCH] usb: host: tegra: Remove manual wake IRQ disposal
Date: Thu, 15 Jan 2026 18:36:21 +0800
Message-ID: <20260115103621.587366-1-weichengc@nvidia.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD6:EE_|SN7PR12MB6929:EE_
X-MS-Office365-Filtering-Correlation-Id: 39719bfd-f086-4a35-9b91-08de5421faa6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Wrf17UxuXIbDDcU9NSi+0qC2impAbfaQ6T3TkKUthcBhypBaYucOOe9Hs7d5?=
 =?us-ascii?Q?fS9ZjeHZ+o6c9xZ7QNlV0PF7YH1/fpvMvkRdfAT5VRgeWePt/dlyazRJFSEr?=
 =?us-ascii?Q?vgBUaVpu2DnCvGl3ly2HvoZ852SC7GLUy6Uq3+mKmJT6txl7vi3aEAcHPT8i?=
 =?us-ascii?Q?wVu9ZiRJ237Kbg346FCEJJNz57pEOsCs7bRuz5gqK/RQIwxbu+qbsxispz5A?=
 =?us-ascii?Q?tGYKERpQMGFAF6zbRdq3kopLbxVJwTFqP5uLARrj67NSvf7TsJPnkWbtu9Gx?=
 =?us-ascii?Q?72Fh1v6lkvf+lWrpyDKGA3GheRG618/t0r6OTu3v28X3hweLjuUUv2sz2/i4?=
 =?us-ascii?Q?Hv2GFEha7dFg+KZ/ueBya+k49BYwnXUiQHJ6eeHPIsZ1kcXWPGgJ3KnUzwhX?=
 =?us-ascii?Q?T0vzehHE1CKlblNyiWVqIPnioWNH7D+pLs+JNT7T8G2UK5+ldkz2JSqWXfZ7?=
 =?us-ascii?Q?FU6q+Gjjc0y3AIXSzzG27gR2vwngCZECyE/CzbMiSNz6jsMRgEGEh2wD+h0e?=
 =?us-ascii?Q?L9xSK45ens0z2rty9RiarUhHq3rqys+pOp3elaC6tHvvwZhd6fdN89ZAFCaM?=
 =?us-ascii?Q?CRL+Za5reMN1z35w1ByL8ALE/AROej+Ed88TU/MOinXI/Fs7iGXjRLvI66ke?=
 =?us-ascii?Q?jk4nByYmnOEfGIE7MXdqbsTUe+SpzesMSYMP8BYkdhSHht2azh6KO+NLdGTL?=
 =?us-ascii?Q?yPiYtHhkqhKFMUN4z2U/339s687vFL2E/N8hG7mW9U9iNs3e+ZlHcU6gCu1/?=
 =?us-ascii?Q?Z5LwhVAbe8/4reoomcdpiOxAZAV6A7LzsXVqkvih/i9FJaIvMyf/C9dYuJNT?=
 =?us-ascii?Q?Ag7OFFmq3+27fogz5GBQa5n+Kr+0AXxGVX8LWUUq2W2iEbmGGN9Pu7xjc9dV?=
 =?us-ascii?Q?vGze/nyTpab9/ajLzc7D8UL3SchltUn8/gJsvFwNswZ5ai4wvJ23iY+iFFga?=
 =?us-ascii?Q?5MctkErBLJarrW965Zmt4wELZiWSgEC/Vm/JLxeRSrhcX0KdBK1li/AESBa1?=
 =?us-ascii?Q?Wbda9L3WVQzG9DjHcJTs5he1ienjo7DaIAUpFBw+v5RrUSReT5W0JzjSvx/o?=
 =?us-ascii?Q?hcnwOR0/LD5Cvy322zbJiaYbZVVurvjuU6ayxFBumCNfKy2J5JE/ZdCp4HwH?=
 =?us-ascii?Q?F+C03Jgx8T1rCs7XP89/kv4OJbvofO7t2ppdTNbOiBwApRKnDBL41nTUvP0c?=
 =?us-ascii?Q?LGT8aQ25CJmwCNEhsDzIp6j8WIvH9iKr3FYhpCNAkBn+uw32lt8/2lnen/2T?=
 =?us-ascii?Q?GdO/P1/eaYPQUSV4mtlS2oguSuH6DxTkv0KO5fkFKebpPwU0743DOs9/6Go1?=
 =?us-ascii?Q?IFDzi1eI2S8zMyl7krDCbRRPEpNL4xs4AlnOove4X/19RToHb45LppQAzsV3?=
 =?us-ascii?Q?WQNIlA/W/pGnR8LZCS4WIeXdh5cCaGpoOwtvfdoYgXB5nvAhQsgUTRRz5hN/?=
 =?us-ascii?Q?62jz2X2PO2LTDO0bb/OKiuDctDO8Zwt0EXtfXSj270X+drqfgbrPtqG4NyQ5?=
 =?us-ascii?Q?Q1L0oqEyiqUuuDZASikAM+PtfkCoNrbn1C+591fvmJCN1Up8Nz/e9ZePpk/q?=
 =?us-ascii?Q?CGkXtH0eZiXoARfpE4hkIjtjnjrZUF+PzvLx2P5KV3MrhEm+It5dPHcwQvss?=
 =?us-ascii?Q?Y4PLAm8O3VDy+FlxGxcjvAeKR5BYttM3aIFhVvfov1wh/4zjSJOAdrKz28rB?=
 =?us-ascii?Q?kCez9w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 10:36:44.7939
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39719bfd-f086-4a35-9b91-08de5421faa6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6929

From: Wayne Chang <waynec@nvidia.com>

We found that calling irq_dispose_mapping() caused a kernel warning
when removing the driver. The IRQs are obtained using
platform_get_irq(), which returns a Linux virtual IRQ number directly
managed by the device core, not by the OF subsystem. Therefore, the
driver should not call irq_dispose_mapping() for these IRQs.

Fixes: 5df186e2ef11 ("usb: xhci: tegra: Support USB wakeup function for Tegra234")
Cc: stable@vger.kernel.org
Signed-off-by: Wayne Chang <waynec@nvidia.com>
Signed-off-by: Wei-Cheng Chen <weichengc@nvidia.com>
---
 drivers/usb/host/xhci-tegra.c | 21 ++-------------------
 1 file changed, 2 insertions(+), 19 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 31ccced5125..2fab3c49e52 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -1570,7 +1570,6 @@ static int tegra_xusb_setup_wakeup(struct platform_device *pdev, struct tegra_xu
 		data = irq_get_irq_data(tegra->wake_irqs[i]);
 		if (!data) {
 			dev_warn(tegra->dev, "get wake event %d irq data fail\n", i);
-			irq_dispose_mapping(tegra->wake_irqs[i]);
 			break;
 		}
 
@@ -1583,16 +1582,6 @@ static int tegra_xusb_setup_wakeup(struct platform_device *pdev, struct tegra_xu
 	return 0;
 }
 
-static void tegra_xusb_dispose_wake(struct tegra_xusb *tegra)
-{
-	unsigned int i;
-
-	for (i = 0; i < tegra->num_wakes; i++)
-		irq_dispose_mapping(tegra->wake_irqs[i]);
-
-	tegra->num_wakes = 0;
-}
-
 static int tegra_xusb_probe(struct platform_device *pdev)
 {
 	struct tegra_xusb *tegra;
@@ -1648,10 +1637,8 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 		return err;
 
 	tegra->padctl = tegra_xusb_padctl_get(&pdev->dev);
-	if (IS_ERR(tegra->padctl)) {
-		err = PTR_ERR(tegra->padctl);
-		goto dispose_wake;
-	}
+	if (IS_ERR(tegra->padctl))
+		return PTR_ERR(tegra->padctl);
 
 	np = of_parse_phandle(pdev->dev.of_node, "nvidia,xusb-padctl", 0);
 	if (!np) {
@@ -1975,8 +1962,6 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 put_padctl:
 	of_node_put(np);
 	tegra_xusb_padctl_put(tegra->padctl);
-dispose_wake:
-	tegra_xusb_dispose_wake(tegra);
 	return err;
 }
 
@@ -2009,8 +1994,6 @@ static void tegra_xusb_remove(struct platform_device *pdev)
 	if (tegra->padctl_irq)
 		pm_runtime_disable(&pdev->dev);
 
-	tegra_xusb_dispose_wake(tegra);
-
 	pm_runtime_put(&pdev->dev);
 
 	tegra_xusb_disable(tegra);
-- 
2.43.0

