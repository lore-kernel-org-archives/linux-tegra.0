Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013012.outbound.protection.outlook.com [40.93.196.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC0A2F360A;
	Fri, 19 Dec 2025 11:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766144670; cv=fail; b=mtZB7LAuv/+azmrYo1Zs+b4OqayndQ1SZteSb05XsOsZlm8lMAQW4TCPU19z+3pfGu/atNRRe5Rn5dbnnmDfxDRZxPTPK3TvSJij7XuNZ00LaW9hGDbjos/LNeFdNqiG2ikx/1zkarjNqt4/pyJl2mw97MWI9RISNmlnWbkr05o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766144670; c=relaxed/simple;
	bh=kD1RYNyUYjsDVSn2AYKL6Rt38m3OeVbPkDugg6BY8H8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jx9uYyUKxtreNhr7FZ1rA6omXb4O9ifj/pkln4fGeoWeWhK44tyLfHa644WtHlNtamO6FIfHtv8i2O85sb2k2eIaNA/zdepnmELNDAAWT8jUeNFE7raI5Lf2A9Yve+ZVsev79kWq+JmkNigF1c+CeCOj+M7oOQgkXDd3BjNilx8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=fail (0-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SzDHg2XI reason="key not found in DNS"; arc=fail smtp.client-ip=40.93.196.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SzDHg2XI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DF1fAlOE7LGBJaqSUpG0DVkVipzhvEGtnmcN6Vhw9P/op2BFy/yUnoQ0tZm8Vu0zA8/AEpOQe3GL3ENndcIuMFfL5wOMW/ViTZyxDpvw7RCmNOa/BWZpcnqFkkfnBhhp00YNsC39s6Q9aoDKGGK04YXtSDkDiDGk8gL4VNO+M9LcCrJp6e5cPmltKCdcP3mPwcPQiIx5osSm0ACOgNobEI1tJ0Zet7dpF25S00QUm2lY6IYAFczbhGeL7ixAG8Bg7Ph4g/hWcIefCS7MV/KjXtyDvqG1+hIGHefVoYozNQRgKzyXwANbXq1efqNhrOefvHPa3IR5ObMdp2fWK2oHgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Agg2Y4vswOgKwd1OJ8w933UWHNTByavTXl0w3fZ+97Y=;
 b=AhDDjIZ349dG9cG5LDYnqtT32ndygmigQTTAJh3tfpquQ4aolrSYUmShyML29R+jnT5WK+wBmiCbKwH5i9/6YVYZdlgKgJu0zJb4ogWyzLQ0r8EI6nagEtAwb7TvyQO/peT7ty0fEjixLe+Ub6JWXr7VLJbNbkM3rBOqPZBHbpBK1w/870mo3cT7xKueW5/ubFb1G68zf+EqdAULSzO5zMA8UlSPD8TtQ8tKWeUfO6LtM+dfV6jQG9FqqFGuA/1e9GCRe7cUsapRlqeEmQcrPxd9GBI7UvHovoW1811hSTQlZLSAkrA6n4WawLnAAnGrSdYqpWn9Zx4wkZJ2J9OxeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Agg2Y4vswOgKwd1OJ8w933UWHNTByavTXl0w3fZ+97Y=;
 b=SzDHg2XIYtjiBR3DUoW+i/AAfZVldI9xvPx+NexhsG6A34D6uVz4AfzyAk9OK0X7Zz7kjuRTeezS/wRuS/RrQJV9lDxIswKdA3jcafBa0LEWpyITCRQ68X0n1U82K87vaxfty0CzfFwQResL2jAHbEiXiZ9hejwety6LV/9zq0Xlb5X85LhX47vu4RmAvxKnYm0m+SjDUuliKkB8oE80RWEs4+EImgHASZMJJHxP+ELs/rvcnsAQ79JsbVMFOtBDov5uK1AqOxOhYGgb3Zh0oVIY1c+kqXtTVfZcqdEHKEkjee72kFmscAiMMXiu5wNqEF+YHlLqLr3kIup6dyCagw==
Received: from BYAPR03CA0019.namprd03.prod.outlook.com (2603:10b6:a02:a8::32)
 by CH2PR12MB9460.namprd12.prod.outlook.com (2603:10b6:610:27f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 11:44:19 +0000
Received: from SJ1PEPF00001CDD.namprd05.prod.outlook.com
 (2603:10b6:a02:a8:cafe::7e) by BYAPR03CA0019.outlook.office365.com
 (2603:10b6:a02:a8::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.8 via Frontend Transport; Fri,
 19 Dec 2025 11:44:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF00001CDD.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Fri, 19 Dec 2025 11:44:18 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 03:44:08 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 03:44:07 -0800
Received: from build-ketanp-bionic-20250813.nvidia.com (10.127.8.10) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Fri, 19 Dec 2025 03:44:07 -0800
From: Ketan Patil <ketanp@nvidia.com>
To: <krzk@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Ketan Patil
	<ketanp@nvidia.com>
Subject: [PATCH v5 1/4] memory: tegra: Group mc-err related registers
Date: Fri, 19 Dec 2025 11:43:51 +0000
Message-ID: <20251219114354.2727906-2-ketanp@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251219114354.2727906-1-ketanp@nvidia.com>
References: <20251219114354.2727906-1-ketanp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDD:EE_|CH2PR12MB9460:EE_
X-MS-Office365-Filtering-Correlation-Id: acf41382-c9cd-4ea0-0c44-08de3ef3f1df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+twTb/dXJwMFLqwKVs1GKCILUCBmiPQVlqYay7/9IyxUDdvTakD5/RDMFEuS?=
 =?us-ascii?Q?2OrtP2vRq1JjVmLmGIWbrnUdzDzaa91czN5ibI/SKLeaUE1sKws9a7WJpKvI?=
 =?us-ascii?Q?i8GjaVvr5oL4jNI4JwPt4skLjS7l7lOChH8Sji5RWKiNIXdEVWHaoHAs9dmH?=
 =?us-ascii?Q?FcXi5s/4GMMe/P7Q+6ortxSXB2tanhjbzxOuOhTYea+fj0LnVBypeftPjjqk?=
 =?us-ascii?Q?UhaXH7Si7+ET7/b82jz9vjFdQovIfz9jgrCO1SrrscqmQw+Qeh9xgtM+ZPNm?=
 =?us-ascii?Q?ae5MNcWIA4TouMJsMz/5goBYC6ee/Eg/uGbki54xVx1ZsBX9UxnrR7C/Bneb?=
 =?us-ascii?Q?Z3DsZhxwi+kr/G5IL9JkEJ2FxfLXIdq6aX6bs9uiV7wKyrPy2EcLAb6HUvd/?=
 =?us-ascii?Q?RV7xn7WBhDsCzzXyoGz30g9GrDUbXhB5ZpPqfn/W06Id/iDf3smAaenpJyrj?=
 =?us-ascii?Q?0wR7CquTlmIPL9GKQx1pVOzEy7JAN0Ne0YYjJsGzfkclBU0PmNYpAYvCuHB0?=
 =?us-ascii?Q?QYGytKhblsmOKGxZT8AzoqkNWKAo7usl6xZf/4ODI4nV1C5yFDgrhU0m0hVK?=
 =?us-ascii?Q?QhVVHP1hQhdULsiN/xz/m8YzF2X2AXiNrIpkvrU6qzu/7K5KYUg2odagzIuW?=
 =?us-ascii?Q?/kq9eg2UaekWz8h83jxGoW3NYRQI/xyKhoEYfLoP1qUcQpSshnLafC4RqfnD?=
 =?us-ascii?Q?L264qvZ0Ue/mA2EdXc61BxxsvBTA7vSPNdqQR3UtmrU1oR6ceVOs45h28VKB?=
 =?us-ascii?Q?qIzYsJUE7aboxHgqrXQyBDOkx28VkIdVRSLqPIn0Do6qvFNYFSzPqy/yJXfB?=
 =?us-ascii?Q?fqGzt9TJj4SiyXm0qcbQ109nReW8OJIIYyZYtDnT7GdiR1tcgoEqO5aVt2/s?=
 =?us-ascii?Q?RLlb1mGYUOVv+/5mk+tDwXbfSgWABQwrTU6E3zOJMXI7gy+T6JZWVtE9ulBc?=
 =?us-ascii?Q?kqcmbLfnQSWdGu6wQTbu+97LO8lDjQOQIk5QPFGSfvGm6A4VIyimsuc6UN7o?=
 =?us-ascii?Q?BNeLCFN4ucFsGzKfmEqOJiIzyBEMpTCb5QTBCZg1NvMj2La9Jkl6sYEdCZd8?=
 =?us-ascii?Q?L4n4t62yi0INGvrR9Sy0w+bDLukECRem7TlkaBmvOdqkyGqOeU4QZYgD/aAE?=
 =?us-ascii?Q?bqzH0++NKhN4RJUVLMAObe6r7mnRbXc79CdZp3Po5FNP77ldl/l+hn+Myvax?=
 =?us-ascii?Q?U1FXeizqBlfgott3AAm022lKf6uvsAr3Ovp0+TKT73ARg7sNR2sNgqlrnBX3?=
 =?us-ascii?Q?3uHaKNW7BYCw88oUejJq3j9TEhFU7QFYtfej1jS839XNStOCHihU8ms7iifc?=
 =?us-ascii?Q?bIZe49qXZ4vAc54gyQOH7HeZYF0DM/oOnA8Q/yywvRP4pNILjIPaLgOSL2Wk?=
 =?us-ascii?Q?RPecy8q6wHQRT/BpeXmqsJdUXkqIO3+xd1+pmL0p8Vc+XkCVW4Rvob85ZMLt?=
 =?us-ascii?Q?FIhI8xkSUJ/2nlxn2kR8uHa5PwZUEhVOCNXRVGZghEWVPnSKzjLodnIoPe58?=
 =?us-ascii?Q?Nsp4OGmNChBZ95vChB3R3hICxSuEg8s66Lan7FLdXSiSe0I3FBo7aAOMeMYt?=
 =?us-ascii?Q?eYKbkRD+kqn7u5qN4XM=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 11:44:18.8832
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: acf41382-c9cd-4ea0-0c44-08de3ef3f1df
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9460

Group MC error related registers into a struct as they could have soc
specific values. Tegra264 has different register offsets than the
existing devices and so in order to add support for Tegra264 we need to
first make this change.

Signed-off-by: Ketan Patil <ketanp@nvidia.com>
---
 drivers/memory/tegra/mc.c       | 45 +++++++++++++++++++++++----------
 drivers/memory/tegra/mc.h       | 14 ----------
 drivers/memory/tegra/tegra114.c |  3 ++-
 drivers/memory/tegra/tegra124.c |  4 ++-
 drivers/memory/tegra/tegra186.c |  1 +
 drivers/memory/tegra/tegra194.c |  3 ++-
 drivers/memory/tegra/tegra20.c  |  3 ++-
 drivers/memory/tegra/tegra210.c |  3 ++-
 drivers/memory/tegra/tegra234.c |  3 ++-
 drivers/memory/tegra/tegra30.c  |  3 ++-
 include/soc/tegra/mc.h          | 21 ++++++++++++++-
 11 files changed, 67 insertions(+), 36 deletions(-)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index 6edb210287dc..6c1578b25a61 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -56,6 +56,23 @@ static const struct of_device_id tegra_mc_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, tegra_mc_of_match);
 
+const struct tegra_mc_regs tegra20_mc_regs = {
+	.mc_cfg_channel_enable = 0xdf8,
+	.mc_err_status = 0x08,
+	.mc_err_add = 0x0c,
+	.mc_err_add_hi = 0x11fc,
+	.mc_err_vpr_status = 0x654,
+	.mc_err_vpr_add = 0x658,
+	.mc_err_sec_status = 0x67c,
+	.mc_err_sec_add = 0x680,
+	.mc_err_mts_status = 0x9b0,
+	.mc_err_mts_add = 0x9b4,
+	.mc_err_gen_co_status = 0xc00,
+	.mc_err_gen_co_add = 0xc04,
+	.mc_err_route_status = 0x9c0,
+	.mc_err_route_add = 0x9c4,
+};
+
 static void tegra_mc_devm_action_put_device(void *data)
 {
 	struct tegra_mc *mc = data;
@@ -600,37 +617,37 @@ irqreturn_t tegra30_mc_handle_irq(int irq, void *data)
 
 		switch (intmask) {
 		case MC_INT_DECERR_VPR:
-			status_reg = MC_ERR_VPR_STATUS;
-			addr_reg = MC_ERR_VPR_ADR;
+			status_reg = mc->soc->mc_regs->mc_err_vpr_status;
+			addr_reg = mc->soc->mc_regs->mc_err_vpr_add;
 			break;
 
 		case MC_INT_SECERR_SEC:
-			status_reg = MC_ERR_SEC_STATUS;
-			addr_reg = MC_ERR_SEC_ADR;
+			status_reg = mc->soc->mc_regs->mc_err_sec_status;
+			addr_reg = mc->soc->mc_regs->mc_err_sec_add;
 			break;
 
 		case MC_INT_DECERR_MTS:
-			status_reg = MC_ERR_MTS_STATUS;
-			addr_reg = MC_ERR_MTS_ADR;
+			status_reg = mc->soc->mc_regs->mc_err_mts_status;
+			addr_reg = mc->soc->mc_regs->mc_err_mts_add;
 			break;
 
 		case MC_INT_DECERR_GENERALIZED_CARVEOUT:
-			status_reg = MC_ERR_GENERALIZED_CARVEOUT_STATUS;
-			addr_reg = MC_ERR_GENERALIZED_CARVEOUT_ADR;
+			status_reg = mc->soc->mc_regs->mc_err_gen_co_status;
+			addr_reg = mc->soc->mc_regs->mc_err_gen_co_add;
 			break;
 
 		case MC_INT_DECERR_ROUTE_SANITY:
-			status_reg = MC_ERR_ROUTE_SANITY_STATUS;
-			addr_reg = MC_ERR_ROUTE_SANITY_ADR;
+			status_reg = mc->soc->mc_regs->mc_err_route_status;
+			addr_reg = mc->soc->mc_regs->mc_err_route_add;
 			break;
 
 		default:
-			status_reg = MC_ERR_STATUS;
-			addr_reg = MC_ERR_ADR;
+			status_reg = mc->soc->mc_regs->mc_err_status;
+			addr_reg = mc->soc->mc_regs->mc_err_add;
 
 #ifdef CONFIG_PHYS_ADDR_T_64BIT
 			if (mc->soc->has_addr_hi_reg)
-				addr_hi_reg = MC_ERR_ADR_HI;
+				addr_hi_reg = mc->soc->mc_regs->mc_err_add_hi;
 #endif
 			break;
 		}
@@ -883,7 +900,7 @@ static void tegra_mc_num_channel_enabled(struct tegra_mc *mc)
 	unsigned int i;
 	u32 value;
 
-	value = mc_ch_readl(mc, 0, MC_EMEM_ADR_CFG_CHANNEL_ENABLE);
+	value = mc_ch_readl(mc, 0, mc->soc->mc_regs->mc_cfg_channel_enable);
 	if (value <= 0) {
 		mc->num_channels = mc->soc->num_channels;
 		return;
diff --git a/drivers/memory/tegra/mc.h b/drivers/memory/tegra/mc.h
index 1d97cf4d3a94..a7f20850741f 100644
--- a/drivers/memory/tegra/mc.h
+++ b/drivers/memory/tegra/mc.h
@@ -14,8 +14,6 @@
 
 #define MC_INTSTATUS					0x00
 #define MC_INTMASK					0x04
-#define MC_ERR_STATUS					0x08
-#define MC_ERR_ADR					0x0c
 #define MC_GART_ERROR_REQ				0x30
 #define MC_EMEM_ADR_CFG					0x54
 #define MC_DECERR_EMEM_OTHERS_STATUS			0x58
@@ -43,19 +41,7 @@
 #define MC_EMEM_ARB_OVERRIDE				0xe8
 #define MC_TIMING_CONTROL_DBG				0xf8
 #define MC_TIMING_CONTROL				0xfc
-#define MC_ERR_VPR_STATUS				0x654
-#define MC_ERR_VPR_ADR					0x658
-#define MC_ERR_SEC_STATUS				0x67c
-#define MC_ERR_SEC_ADR					0x680
-#define MC_ERR_MTS_STATUS				0x9b0
-#define MC_ERR_MTS_ADR					0x9b4
-#define MC_ERR_ROUTE_SANITY_STATUS			0x9c0
-#define MC_ERR_ROUTE_SANITY_ADR				0x9c4
-#define MC_ERR_GENERALIZED_CARVEOUT_STATUS		0xc00
-#define MC_ERR_GENERALIZED_CARVEOUT_ADR			0xc04
-#define MC_EMEM_ADR_CFG_CHANNEL_ENABLE			0xdf8
 #define MC_GLOBAL_INTSTATUS				0xf24
-#define MC_ERR_ADR_HI					0x11fc
 
 #define MC_INT_DECERR_ROUTE_SANITY			BIT(20)
 #define MC_INT_DECERR_GENERALIZED_CARVEOUT		BIT(17)
diff --git a/drivers/memory/tegra/tegra114.c b/drivers/memory/tegra/tegra114.c
index 41350570c815..cc66620da60b 100644
--- a/drivers/memory/tegra/tegra114.c
+++ b/drivers/memory/tegra/tegra114.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2014 NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (C) 2014-2025 NVIDIA CORPORATION.  All rights reserved.
  */
 
 #include <linux/of.h>
@@ -1114,4 +1114,5 @@ const struct tegra_mc_soc tegra114_mc_soc = {
 	.resets = tegra114_mc_resets,
 	.num_resets = ARRAY_SIZE(tegra114_mc_resets),
 	.ops = &tegra30_mc_ops,
+	.mc_regs = &tegra20_mc_regs,
 };
diff --git a/drivers/memory/tegra/tegra124.c b/drivers/memory/tegra/tegra124.c
index 9d7393e19f12..886dc68fea65 100644
--- a/drivers/memory/tegra/tegra124.c
+++ b/drivers/memory/tegra/tegra124.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2014 NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (C) 2014-2025 NVIDIA CORPORATION.  All rights reserved.
  */
 
 #include <linux/of.h>
@@ -1275,6 +1275,7 @@ const struct tegra_mc_soc tegra124_mc_soc = {
 	.num_resets = ARRAY_SIZE(tegra124_mc_resets),
 	.icc_ops = &tegra124_mc_icc_ops,
 	.ops = &tegra30_mc_ops,
+	.mc_regs = &tegra20_mc_regs,
 };
 #endif /* CONFIG_ARCH_TEGRA_124_SOC */
 
@@ -1307,5 +1308,6 @@ const struct tegra_mc_soc tegra132_mc_soc = {
 	.num_resets = ARRAY_SIZE(tegra124_mc_resets),
 	.icc_ops = &tegra124_mc_icc_ops,
 	.ops = &tegra30_mc_ops,
+	.mc_regs = &tegra20_mc_regs,
 };
 #endif /* CONFIG_ARCH_TEGRA_132_SOC */
diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/tegra186.c
index aee11457bf8e..a30158d92412 100644
--- a/drivers/memory/tegra/tegra186.c
+++ b/drivers/memory/tegra/tegra186.c
@@ -914,5 +914,6 @@ const struct tegra_mc_soc tegra186_mc_soc = {
 	.ops = &tegra186_mc_ops,
 	.ch_intmask = 0x0000000f,
 	.global_intstatus_channel_shift = 0,
+	.mc_regs = &tegra20_mc_regs,
 };
 #endif
diff --git a/drivers/memory/tegra/tegra194.c b/drivers/memory/tegra/tegra194.c
index 26035ac3a1eb..fade258c0ea7 100644
--- a/drivers/memory/tegra/tegra194.c
+++ b/drivers/memory/tegra/tegra194.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2017-2021 NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (C) 2017-2025 NVIDIA CORPORATION.  All rights reserved.
  */
 
 #include <soc/tegra/mc.h>
@@ -1358,4 +1358,5 @@ const struct tegra_mc_soc tegra194_mc_soc = {
 	.icc_ops = &tegra_mc_icc_ops,
 	.ch_intmask = 0x00000f00,
 	.global_intstatus_channel_shift = 8,
+	.mc_regs = &tegra20_mc_regs,
 };
diff --git a/drivers/memory/tegra/tegra20.c b/drivers/memory/tegra/tegra20.c
index a3022e715dee..46e97bb10163 100644
--- a/drivers/memory/tegra/tegra20.c
+++ b/drivers/memory/tegra/tegra20.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2012 NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (C) 2012-2025 NVIDIA CORPORATION.  All rights reserved.
  */
 
 #include <linux/bitfield.h>
@@ -778,4 +778,5 @@ const struct tegra_mc_soc tegra20_mc_soc = {
 	.num_resets = ARRAY_SIZE(tegra20_mc_resets),
 	.icc_ops = &tegra20_mc_icc_ops,
 	.ops = &tegra20_mc_ops,
+	.mc_regs = &tegra20_mc_regs,
 };
diff --git a/drivers/memory/tegra/tegra210.c b/drivers/memory/tegra/tegra210.c
index 3c2949c16fde..a32b38cb374b 100644
--- a/drivers/memory/tegra/tegra210.c
+++ b/drivers/memory/tegra/tegra210.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2015 NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (C) 2015-2025 NVIDIA CORPORATION.  All rights reserved.
  */
 
 #include <dt-bindings/memory/tegra210-mc.h>
@@ -1287,4 +1287,5 @@ const struct tegra_mc_soc tegra210_mc_soc = {
 	.resets = tegra210_mc_resets,
 	.num_resets = ARRAY_SIZE(tegra210_mc_resets),
 	.ops = &tegra30_mc_ops,
+	.mc_regs = &tegra20_mc_regs,
 };
diff --git a/drivers/memory/tegra/tegra234.c b/drivers/memory/tegra/tegra234.c
index 5f57cea48b62..23276f622aab 100644
--- a/drivers/memory/tegra/tegra234.c
+++ b/drivers/memory/tegra/tegra234.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2022-2023, NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (C) 2022-2025, NVIDIA CORPORATION.  All rights reserved.
  */
 
 #include <soc/tegra/mc.h>
@@ -1152,4 +1152,5 @@ const struct tegra_mc_soc tegra234_mc_soc = {
 	 * supported.
 	 */
 	.num_carveouts = 32,
+	.mc_regs = &tegra20_mc_regs,
 };
diff --git a/drivers/memory/tegra/tegra30.c b/drivers/memory/tegra/tegra30.c
index d3e685c8431f..f22febcbee59 100644
--- a/drivers/memory/tegra/tegra30.c
+++ b/drivers/memory/tegra/tegra30.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2014 NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (C) 2014-2025 NVIDIA CORPORATION.  All rights reserved.
  */
 
 #include <linux/device.h>
@@ -1400,4 +1400,5 @@ const struct tegra_mc_soc tegra30_mc_soc = {
 	.num_resets = ARRAY_SIZE(tegra30_mc_resets),
 	.icc_ops = &tegra30_mc_icc_ops,
 	.ops = &tegra30_mc_ops,
+	.mc_regs = &tegra20_mc_regs,
 };
diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
index 6ee4c59db620..d11dfefbe551 100644
--- a/include/soc/tegra/mc.h
+++ b/include/soc/tegra/mc.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (C) 2014 NVIDIA Corporation
+ * Copyright (C) 2014-2025 NVIDIA Corporation
  */
 
 #ifndef __SOC_TEGRA_MC_H__
@@ -168,6 +168,23 @@ struct tegra_mc_ops {
 	int (*probe_device)(struct tegra_mc *mc, struct device *dev);
 };
 
+struct tegra_mc_regs {
+	unsigned int mc_cfg_channel_enable;
+	unsigned int mc_err_status;
+	unsigned int mc_err_add;
+	unsigned int mc_err_add_hi;
+	unsigned int mc_err_vpr_status;
+	unsigned int mc_err_vpr_add;
+	unsigned int mc_err_sec_status;
+	unsigned int mc_err_sec_add;
+	unsigned int mc_err_mts_status;
+	unsigned int mc_err_mts_add;
+	unsigned int mc_err_gen_co_status;
+	unsigned int mc_err_gen_co_add;
+	unsigned int mc_err_route_status;
+	unsigned int mc_err_route_add;
+};
+
 struct tegra_mc_soc {
 	const struct tegra_mc_client *clients;
 	unsigned int num_clients;
@@ -196,6 +213,7 @@ struct tegra_mc_soc {
 
 	const struct tegra_mc_icc_ops *icc_ops;
 	const struct tegra_mc_ops *ops;
+	const struct tegra_mc_regs *mc_regs;
 };
 
 struct tegra_mc {
@@ -256,4 +274,5 @@ tegra_mc_get_carveout_info(struct tegra_mc *mc, unsigned int id,
 }
 #endif
 
+extern const struct tegra_mc_regs tegra20_mc_regs;
 #endif /* __SOC_TEGRA_MC_H__ */
-- 
2.17.1

