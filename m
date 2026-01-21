Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011032.outbound.protection.outlook.com [40.93.194.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E4F481222;
	Wed, 21 Jan 2026 10:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768990455; cv=fail; b=V2qo25G+LGDwCtveCY/0iPcL8m8M9hcY6o3ywy+zH6LvTr+hPs1ars+bL0duzJUP68vI6p0WAOAVnXkke7BXPdLEVeOK2JyepMbg+UfVkp9inDWgKwHchGHMMBEL4o5fUsAgwdTl8KQGxV4QrfsGaBlnZrd6z5d+JIPI0TwSxNI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768990455; c=relaxed/simple;
	bh=UsaI5D2dB5UiuI0JkF/6AAOsMi9fw4bITjjMdPC72XM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kZpkTmgdQ6OJ0KW09VJQeZy2QQsFFuJCcedaV6GIfr+KsnHGUyUpNORNRNxNDWvsyqzxGoC5qvkDgPp5ayQdaLcE0xpNJYgCoP4ZPL//dfllrWvSxd8D+3XZUR36ocNanLYNqEIEamNk0aBsv8mNRQOtkfP6pVsBmda8ok2Zl9g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pIaVq70q; arc=fail smtp.client-ip=40.93.194.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pIaVq70q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wUx4h2mA5alQUpmRj40o0uOUUeEruD/qw+evOAfgAXjJkpQcWMxEzYWE+XUo748liDfV/tZQeUiy1//uzh3LAGXebbNZjc4RIJYH00vagnQN8PnWGD5RT3OCGQObm8A4b/egnUf9Wtz49pZMw8B5oB/b1Ml7hgYpnugXJrRtKMHIhV3XxR59kKxMEiJnTctogofxxLa9jc0KAOr7VaGOV/5mRzqCpWtCHDNjclOwbo1oFkNBMHwXKw3nBIYmq/dvHx8UY4KJyOl6oYM3SCIc2B5005Sr0+zrwgPWIcA0KRj5CD1diVoLhzsibSXimlHAh6BCjPLmBKyi01FJ51jH8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DGpTQvVBlUNx1gJZepgNIbsySVOBWkynVwtupyvpv/E=;
 b=vmfdsn/8Exwv8E6TbZCVwyTsKYJEaAZ5d1NJ4iLPfgKSV8o1rp4OiEfeJwTiJyDr0LV5mwL7WYpyoA0l//cWGS+TdcYT4kfHDm8TjoC/pfT0BvVZi8kQZ8L3PptF5hrn21upyS+1odb208TemWCMofo/MIJXQic+b2OxnWNc4iwcRZL24nr7nPpfZ0rIP2ocUDD4RXNg3yZrVaBDJXp0AfMi/+8dTVT7nFWQJLwn5qn/Fz64nXrL9vDt/qf4HCfahXsvpZbpDbLtXDQWBo4tgn0o0d2cd5RP9O8HNYXV/2dMlHLAlRAspf6lYWiFsrpZSGkf+Vy+aWoJwpWH6W1Yww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DGpTQvVBlUNx1gJZepgNIbsySVOBWkynVwtupyvpv/E=;
 b=pIaVq70qHVt8mh9DAtgxCLiPTjjHoEZUcLt1fqKrXn+XaKdPeKOkIFwglm8oQq9NBGPmss02PfVzhOAIgq5f5Ecjhb2Zi0xHRnfvj1s6O+iTT+lDvSS2of2SXp1/DjWduJpKtX9dy8FWqQkWasj/hyHbC+BtIBNQrkmPiQnjUhjQmc5djuYLfGROn+vj7JfKsmOP4vV38h4LaXryx4aqmbZJ+lRPm/uBWbC02+0RJSOLKJywMnlCKv20s1dlTsuV6tPvSF89gZ3Q/yytITFKPNymEdg7vskWQPlCVwAETCuPWMjgoZIPvk65Q1PTZd0zWlQZhV+R72AJ+zaWSaUqnw==
Received: from SA1P222CA0163.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c3::22)
 by DS7PR12MB6008.namprd12.prod.outlook.com (2603:10b6:8:7f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 10:14:08 +0000
Received: from SA2PEPF00001507.namprd04.prod.outlook.com
 (2603:10b6:806:3c3:cafe::1f) by SA1P222CA0163.outlook.office365.com
 (2603:10b6:806:3c3::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Wed,
 21 Jan 2026 10:14:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SA2PEPF00001507.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 10:14:08 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 02:14:01 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 21 Jan 2026 02:14:00 -0800
Received: from sumitg-l4t.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 21 Jan 2026 02:13:59 -0800
From: Sumit Gupta <sumitg@nvidia.com>
To: <treding@nvidia.com>, <jonathanh@nvidia.com>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <bbasu@nvidia.com>, <sumitg@nvidia.com>
Subject: [PATCH 3/3] soc/tegra: cbb: fix cross-fabric target timeout lookup
Date: Wed, 21 Jan 2026 15:42:05 +0530
Message-ID: <20260121101205.3186310-4-sumitg@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260121101205.3186310-1-sumitg@nvidia.com>
References: <20260121101205.3186310-1-sumitg@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00001507:EE_|DS7PR12MB6008:EE_
X-MS-Office365-Filtering-Correlation-Id: cfb89c6d-fcbb-486e-a10b-08de58d5d077
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?a/reyAFYIBafWeRzPhBaIW0FAeZJHeOgY0Bij227xaU2h2fWC3E2WdqWWZTe?=
 =?us-ascii?Q?M0Y8Sn6vn85ZyZYRy8agCZycbPuXP8bDgofvDbk+1Glpm1iPwRh8oMtFJ2qz?=
 =?us-ascii?Q?rDe4mfB5+6+BiC4tCpIUlUUAX3DHYRwxUTVrETm3uUMGrcmTj3aF+hERyu/8?=
 =?us-ascii?Q?PRfDLRjZCl1WVPU2IAfjskle4AvJop/awoK1De9Ko/d29N+Tz/gI7ay3ysyb?=
 =?us-ascii?Q?0lcJoCtZYvjUOS9DVt0DKyBTtF7cG4EBswQ48Wt/59xH9yHhzMCjOF7o0WER?=
 =?us-ascii?Q?70QS3y47ruZ2oIXUEEb/7yQK+c0CDwTb97/Yw2bKALflkx1iixAtktiNBiF1?=
 =?us-ascii?Q?48/jVxh6YXFsEGm28ptiFqAVq6FFhsFP0+8qBMirY244GX7Qv2NznOl8oX9L?=
 =?us-ascii?Q?7NiAhSbVm9cIaD5aG5Sejh01jzBCkWGx97j7rlg/x5W/y0m789AtpSrOejM2?=
 =?us-ascii?Q?wxpGhirDjIz8Ig4yufxCEZaH1TdZ9GFnEfT2gILGPDgsMPqbTPwEZWG63ndo?=
 =?us-ascii?Q?saQxPioW3YgH/OGz2me1D/I6jKEF1bmg5nKTuqxxhPAyergDLIKLwkYDHZaj?=
 =?us-ascii?Q?kiNJ66v79Fc4t7OSyM1CIL2FneDZx9vxR4WH4C5wRIeYf8U/q7P4ZGe4vOSl?=
 =?us-ascii?Q?CbjlYOa6ObfO90WIt8hehRA9ZL5iukxu4qJ6EhPCUOcRqCBNygMZtO+sSE2i?=
 =?us-ascii?Q?fSJcsELENDCsKgOVzE6jhRkWhYFds7AC6xr8ouJDhDcffFH3LaWF1uL5ppSP?=
 =?us-ascii?Q?DwIAnIecNjWJPSxbs0SnHd9l2578Xryg15j/XwACZnJy2wJsTntgiNo+Tcil?=
 =?us-ascii?Q?HwcvXsfKWs0ciaiDj1ipP4dnfNaS2hvOC4J8pTs9wN8Ap9cF0pLXqF7JZRty?=
 =?us-ascii?Q?rJ0jU3Q7z1R+nCry67K8NdKuYHLpjAqoqkYRTj8H15yshz38TemSZCqvfx6B?=
 =?us-ascii?Q?rjeq+JTJKACqZqNycEJDFEm3Lwa0U6WldWDJn+4RcgwEK3qtFEztLiSgdQKu?=
 =?us-ascii?Q?z9mY1fz31N5Tq/ncIaRWOrrrWv2m3UNK328xAa9brLupae/NXNr7aruXcOBx?=
 =?us-ascii?Q?sHuFPaFEzyGaTj3EiN05AuEMMjO0qGEIoHm8trmGVpHlvx0GRGt+Vmeokclw?=
 =?us-ascii?Q?YuRE7mpK2b+3f2/7u4uelfRpLgAhUUTyParhnFzqnx/WSqLU7UKuLbtwWqQE?=
 =?us-ascii?Q?UiKpXCEc4aIFUdzYQj5GhopcECfl8DRtJ/n9e9cLsXy6uptRJBPXB/rUV8j7?=
 =?us-ascii?Q?BlGKlEht1ftZ5U6eMqjvl5zqC95JFErMuvPQ9T6U19M/G/5Pc8nyDoyIzl/G?=
 =?us-ascii?Q?LArul5Zhh7M01HA2Rjvc6NH2g46GwpwU97Y/UHpL9n80/XVyArdGfGg8cVBJ?=
 =?us-ascii?Q?CIJyjd/RMWxYlM7w0ThnwpiF6atf0kz6jGqS6oIaHxiN85IsJ+9T/iAFGkQz?=
 =?us-ascii?Q?iQg5PiWwJ4ViuK4FarFRYF9SKpgHFFD1hiMWtjtT+78dGAAVo85kfXDcvETA?=
 =?us-ascii?Q?YMO/RQKzRaKwYU6Kju4N9Fmu5phJXsLj7XDpIp4La8yHdXNMETl0O6Fps9cd?=
 =?us-ascii?Q?bRAQ87JYg53TDKj/nZrKPqHwFqXYbFcgcSgNT1R7PKJNaQdl+F66DkZYH0lX?=
 =?us-ascii?Q?4MNIFuF8aBzJjmlVv6bV8jKoFf0+iKxRrbrUnz3VKUEYQ6f7VocuHI6xXZmT?=
 =?us-ascii?Q?VFfL4A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 10:14:08.0694
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfb89c6d-fcbb-486e-a10b-08de58d5d077
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001507.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6008

When a fabric receives an error interrupt, the error may have
occurred on a different fabric. The target timeout lookup was using
the wrong base address (cbb->regs) with offsets from a different
fabric's target map, causing a kernel page fault.

  Unable to handle kernel paging request at virtual address ffff80000954cc00
  pc : tegra234_cbb_get_tmo_slv+0xc/0x28
  Call trace:
   tegra234_cbb_get_tmo_slv+0xc/0x28
   print_err_notifier+0x6c0/0x7d0
   tegra234_cbb_isr+0xe4/0x1b4

Add tegra234_cbb_get_fabric() to look up the correct fabric device
using fab_id, and use its base address for accessing target timeout
registers.

Fixes: 25de5c8fe0801 ("soc/tegra: cbb: Improve handling for per SoC fabric data")
Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
---
 drivers/soc/tegra/cbb/tegra234-cbb.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/cbb/tegra234-cbb.c b/drivers/soc/tegra/cbb/tegra234-cbb.c
index 626e0e820329..7e387fc54c6b 100644
--- a/drivers/soc/tegra/cbb/tegra234-cbb.c
+++ b/drivers/soc/tegra/cbb/tegra234-cbb.c
@@ -313,12 +313,37 @@ static void tegra234_cbb_lookup_apbslv(struct seq_file *file, const char *target
 	}
 }
 
+static struct tegra234_cbb *tegra234_cbb_get_fabric(u8 fab_id)
+{
+	struct tegra_cbb *entry;
+
+	list_for_each_entry(entry, &cbb_list, node) {
+		struct tegra234_cbb *priv = to_tegra234_cbb(entry);
+
+		if (priv->fabric->fab_id == fab_id)
+			return priv;
+	}
+
+	return NULL;
+}
+
 static void tegra234_sw_lookup_target_timeout(struct seq_file *file, struct tegra234_cbb *cbb,
 					      u8 target_id, u8 fab_id)
 {
 	const struct tegra234_target_lookup *map = cbb->fabric->fab_list[fab_id].target_map;
+	struct tegra234_cbb *target_cbb = NULL;
 	void __iomem *addr;
 
+	if (fab_id == cbb->fabric->fab_id)
+		target_cbb = cbb;
+	else
+		target_cbb = tegra234_cbb_get_fabric(fab_id);
+
+	if (!target_cbb) {
+		dev_err(cbb->base.dev, "could not find fabric for fab_id:%d\n", fab_id);
+		return;
+	}
+
 	if (target_id >= cbb->fabric->fab_list[fab_id].max_targets) {
 		tegra_cbb_print_err(file, "\t  Invalid target_id:%d\n", target_id);
 		return;
@@ -341,7 +366,7 @@ static void tegra234_sw_lookup_target_timeout(struct seq_file *file, struct tegr
 	 *	e) Goto step-a till all bits are set.
 	 */
 
-	addr = cbb->regs + map[target_id].offset;
+	addr = target_cbb->regs + map[target_id].offset;
 
 	if (strstr(map[target_id].name, "AXI2APB")) {
 		addr += APB_BLOCK_TMO_STATUS_0;
-- 
2.34.1

