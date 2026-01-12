Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012031.outbound.protection.outlook.com [40.93.195.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26FC2BDC32;
	Mon, 12 Jan 2026 14:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768229849; cv=fail; b=b7vPsS0g8qESdaetVcfIKlWubMhmg4x8F3NH3yXUJ2S8QBl5zaEx7YFWM7VG/ul69ymyYDSDXaSZ9vheMO60uvOJXtipr+QQ1B6EUk+SmpPmew7c5M/xLAOfoJgrdY9Sw52z0Wog4Ivan1vGNWxoOSojXsEHToPIlM7xbj1E9nI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768229849; c=relaxed/simple;
	bh=6oJGzSzCn3ieSR9ziJTNCQGny7YcULDr7BAteYKJIi8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c9DB1KzQBAYzP8CSAE36MQBW8ltyKITsd+ZmKbSHH6FK691bgM+0VIzDVF+H+fs4tHDbdnsmF6b8oIGjoIrxC8BvJ84ZVrzsF8ZR1zbIDaxzTCtmFu/zP3bHXt6+ITWJrZPRxHmCpxuvm1PXEZWRm0Dxy5fsXDs/s+9pW8oeFIU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jA/B745V; arc=fail smtp.client-ip=40.93.195.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jA/B745V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hipmq7NOJz7C7XQ5p1FOsUsZL+PcP1NCVj6z//L47QPckFC2clOVc8nLWE0C7PVIuNCBuXHSjKl2iF1PUvcoMUr6XTl8H44Xhp40G2oBAJf0+EuHXhPJYvkup6nLCZQf7AKgQ8ZuQE6XwflscSbYijKP5U7ZOzjcT2cjHdGTIDEKPjMDaSCccFQ5bxRKsZfyz51UIlc2T9RZTy9vx44wg2O2X3Ki53SBByuw8H7lqFvA5MjDWcfhPYoxXZmFZb+E39B9RA0C89Nu0Wcp+ovEzWfu3Su0bAsqSJ7/wzlk5fLDGFv/44VUnfassCpGrO+KLvz4+9/9vf/Vvkh7s52AlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SrJbEp8wW+KLsjZszWTMnzXqfscn8IcCLWrJmzyHy70=;
 b=PBEvlzST9tDLaEsLw4b7PLL1hZGobi8nfstOf3kJ/TBU5487oejBG77/8bmWT4wnPp4kctMsXqnVK748NMV0DakFGh3KOzrcoS64UOnLNLr6CxuAFtqB5Kx3bqIhTOOypm4yUF1eY+ESDeLSdcMwgFJPeNgiTL7s9AjlKSGvso+FsnkC9ka3Jl88IwTMcti3fIXvTcbeSb+/7ubhAgoKVG82cwMJEih2XKbpllEESCh6CHWTopUaidBy4dQkPDG4mfAZDs9updd7uYFNvVtTotpQMYB9XSP9+8+v0GDDzJyfUkbcg31AiP1pZ0XRQ8Al+JJ+SlZa/B4OH6OObFBsCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SrJbEp8wW+KLsjZszWTMnzXqfscn8IcCLWrJmzyHy70=;
 b=jA/B745Vj/g0SQdhktMDLKpEQ+YSu7AIFa2L5itmPqXB2rUEhN+2rGgXPdVra/ay2B+sdHaJixNnm1PCkAr7uul8321REutDDWDycucbSdV33My3b6L38hjpT0Xq28hAY+k+GvtXW9mn60OQx9e+18LjE4Sy3YT5CuKg+9wyXJ3ljr/eu76uRQjgOQOnvSrIZzkF24IS15p2io4E4OYFjFM87M4H2d2fIoizydETwH+41CXkoMOpdpLf/kyKhk7Kw1CR3PEESo60NI7wlW2mSM6LcfwX5i4tP24zM0mnDqKMpvZXnpGdX+wlgBsZgbZVDrXWRQy9BBgAkmaLzWyh8w==
Received: from SJ0PR13CA0015.namprd13.prod.outlook.com (2603:10b6:a03:2c0::20)
 by DM6PR12MB4282.namprd12.prod.outlook.com (2603:10b6:5:223::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 14:57:22 +0000
Received: from CO1PEPF000042AB.namprd03.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::ef) by SJ0PR13CA0015.outlook.office365.com
 (2603:10b6:a03:2c0::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.4 via Frontend Transport; Mon,
 12 Jan 2026 14:57:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000042AB.mail.protection.outlook.com (10.167.243.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Mon, 12 Jan 2026 14:57:22 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 12 Jan
 2026 06:56:57 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 12 Jan
 2026 06:56:56 -0800
Received: from 5b171f0-lcelt.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Mon, 12 Jan 2026 06:56:54 -0800
From: Wei-Cheng Chen <weichengc@nvidia.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, Haotien Hsu <haotienh@nvidia.com>
CC: <linux-usb@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Wayne Chang <waynec@nvidia.com>, "Wei-Cheng
 Chen" <weichengc@nvidia.com>
Subject: [PATCH v2] usb: host: xhci-tegra: Use platform_get_irq_optional() for wake IRQs
Date: Mon, 12 Jan 2026 22:56:53 +0800
Message-ID: <20260112145653.95691-1-weichengc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260108102152.241073-1-weichengc@nvidia.com>
References: <20260108102152.241073-1-weichengc@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AB:EE_|DM6PR12MB4282:EE_
X-MS-Office365-Filtering-Correlation-Id: 4db78c53-94d6-4c2d-191b-08de51eae3fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PFOIcnCOsa7ZnOMMJmeZrkXdhFvkZn8j1KEgdVRo6gSzKyEC0kMcrwhej8oK?=
 =?us-ascii?Q?niMwjDCiKKWhGktn0CtjGGc/n4py1IcoWNgm3dx0kx5sKD+dKcVCFcOoo526?=
 =?us-ascii?Q?nvy8mrHlDd2oyk3AYVr6O9v6d/aoFAXl5i66/7C5PW5yfdWKV2XBqtAjmlMn?=
 =?us-ascii?Q?0klqcSYen93wLBtOWoXWA5ZgpdxdGpTkKwGF9lEH+X8KjCrhU/5blv7cUksZ?=
 =?us-ascii?Q?KSj5fiPMnAej7WMlOp9F5/UifByuqSXE44uXCi16KxNmFL+9W8IQT2Co9LMu?=
 =?us-ascii?Q?1F4XPhbs+WO6emGqNffNj4F9Lrgcr0IkTFUzYS7Oxvp/uxPUt+2vH4gWRoDj?=
 =?us-ascii?Q?wXq+jIFJFnVdAbbPpHK4aWSgwJUJ57mFiHh/Lt9//X3h/vmtGsZGenwOtYIZ?=
 =?us-ascii?Q?rWHed8Euq6bvuSW4QNct7nyLUpzcobvdJZJ/wIVSvlhpTEyqGPGuqVJOvXAX?=
 =?us-ascii?Q?DViH9zc6wGg5+3zatTqe6psSrPL7yRJeWo/p1b4fy9wc0EmbzYE8I6xwJqe4?=
 =?us-ascii?Q?xtRLr2SN3Lmr+R+p8qVtQ17hzxiGSlDA/gEbRcmWSg8BcqxW2xDCovgHW7NV?=
 =?us-ascii?Q?3Cx5oDiAg/eB/uc/HBOplv7zFtDOQJx6bsEGtUFFmykP9qw7gCGwPVX00XWb?=
 =?us-ascii?Q?tnFtJpHaaJTNSnTCjGTC/9w/0DVOJfKakAJl6cxTEHiAp/JAWyNdblX4qvql?=
 =?us-ascii?Q?Iw4I+Ort2dg6IpOcjeWuKraFsGrX6+9caTe8LEWsQjsuinte9N38MN3VxAKh?=
 =?us-ascii?Q?Gw128J2D3hrZK4SQFyve1YWguvDLGltDOckzhIQr7KmWTGg9jNx13V3f0gkI?=
 =?us-ascii?Q?5DldkzZ9H3xYqrt+7gHDfvXaAlU537bhWFk1joBrs1+IxLo+0dPx0Cewseyh?=
 =?us-ascii?Q?7waoe97ag+6KZIbToNeN0/X0mSYFsrSDCOYr5rhs3/Ho528w7lVuoKUCYJw/?=
 =?us-ascii?Q?i1MnQ2CIIF2V6B1ugLn3clJ3DAu2TZXHL0RVawdeGav8hLufuSQP4s+ubIXC?=
 =?us-ascii?Q?6rx03e07UnZrC0tvLcjRcqqgLvJ2otsB6Ly6QO6+mZy8Rf7RzVGrRwknthJ6?=
 =?us-ascii?Q?bAXo0GyuP2+Jv8LZrdrxSKhLZyLQLUNkaVLpe+pTZ5vdBxqL557rRkh4DsjR?=
 =?us-ascii?Q?60AXpPavIRRFaIef1Yvqm66hyearOIgUezCWw92dpMhZNPaiLcl8i4AU8V6c?=
 =?us-ascii?Q?3/uvpijecXsxQQg7geXYKee+0vMAvB8o4FNTKVncmZ+1LQwdZIjc4XlcajkL?=
 =?us-ascii?Q?Q2HBdWA2pcAimHEURuixQOx1lrXVFGmo3d54d0POU4hpVWFaeIWVora+kXrB?=
 =?us-ascii?Q?MPAA93d7L1TCwffRYKPWLuXQwaH0QtJ+eZb0C1B3d+CJL9GbqhCl8Z4iu4Eq?=
 =?us-ascii?Q?MionIDmxdw1vCdAQIyyymx02qnYmHOEhPDoGnCMGOm/q8eIhf2WUXPj2pqge?=
 =?us-ascii?Q?HXz/EwVV6cjn5XEN6zOBO1equypvNK5kXqDyOsjb0pdFA6iQr/ObMKcveh+h?=
 =?us-ascii?Q?Udl5NxhZMqCHBtsw6ad6aej05rSkMyuToPBpwuOtTgwjZS4DmsvWq613V2VA?=
 =?us-ascii?Q?/lnH/ivrNr4lX9koPCw=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 14:57:22.0943
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4db78c53-94d6-4c2d-191b-08de51eae3fc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4282

From: Wayne Chang <waynec@nvidia.com>

When some wake IRQs are disabled in the device tree, the corresponding
interrupt entries are removed from DT. In such cases, the driver
currently calls platform_get_irq(), which returns -ENXIO and logs
an error like:

  tegra-xusb 3610000.usb: error -ENXIO: IRQ index 2 not found

However, not all wake IRQs are mandatory. The hardware can operate
normally even if some wake sources are not defined in DT. To avoid this
false alarm and allow missing wake IRQs gracefully, use
platform_get_irq_optional() instead of platform_get_irq().

Fixes: 5df186e2ef11 ("usb: xhci: tegra: Support USB wakeup function for Tegra234")
Cc: stable@vger.kernel.org
Signed-off-by: Wayne Chang <waynec@nvidia.com>
Signed-off-by: Wei-Cheng Chen <weichengc@nvidia.com>
Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Jon Hunter <jonathanh@nvidia.com>
---
V1 -> V2:
 - Added Reviewed-by and Tested-by tags from Jon Hunter.
 - Added Cc: stable@vger.kernel.org tag to ensure backporting.
---
 drivers/usb/host/xhci-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 31ccced5125..8b492871d21 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -1563,7 +1563,7 @@ static int tegra_xusb_setup_wakeup(struct platform_device *pdev, struct tegra_xu
 	for (i = 0; i < tegra->soc->max_num_wakes; i++) {
 		struct irq_data *data;
 
-		tegra->wake_irqs[i] = platform_get_irq(pdev, i + WAKE_IRQ_START_INDEX);
+		tegra->wake_irqs[i] = platform_get_irq_optional(pdev, i + WAKE_IRQ_START_INDEX);
 		if (tegra->wake_irqs[i] < 0)
 			break;
 
-- 
2.43.0

