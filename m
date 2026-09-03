Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011057.outbound.protection.outlook.com [52.101.57.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A977E4A3843;
	Thu,  3 Sep 2026 18:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788459993; cv=fail; b=Ih+nl/EK0TKYZVlmxOEySMOmgFweklpfPlm/po+GKieDDrB2sXxjhkoq/R82RNOWz53lV6hnZfZLaNNAWUKXfqQyYRpPiVEGfyUkmziFbR6oF3JEA1vlVvA3mA1VTn1dzq8MVto8QNF0feG1MMvUDpZ75q+z+NWK+96ad25K3i0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788459993; c=relaxed/simple;
	bh=QTsu8+iGgTlagSrNOtBJWQ64kUXRoIzzcHuf/PfjfFk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y+/aD8RV2OUqdMRzGI4Id2X0vzw7zXxuYRpVU78O11KChJ4fdwULsmuAoPuAQlHjunmEzmP5SZMpZDu/xloui+KIiNyBJfqWNsp1rSbdrAw/vALR6nxzYvBP+Ii64J2k08eUAZOD6z18LdWEOXUls2Nv4Tg3tESkGDM0NdNzkkY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=D0uz5vLk; arc=fail smtp.client-ip=52.101.57.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="D0uz5vLk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sKJc9SaamDv6V4y0AEEiUENDyjiDsJT7+l5D4AkPiG7f0mL+M/l4YyBxrJ1UCVAeVZkGx0PBhldjYCH8W7o9Or4DX5RyW1CtoXrHzA/9zQzYCTEeoYlSh3CGraC3p7DIUmQ80V8Crtd51+xMLoIPTSgwMfsin9WJAPB21CXfQobjlEbH/pImpMHfQY4RyP3rW9dZFseaaeO2tHlFT4sCLqqUmH6zaEyp/YaJ9uN1B0Eu2xGJSRmky8dNCnlhDSFS9TTwdIfWGEQRF4WWsCNhG2qcikDJq4DwEuN9mJGGkURrTAi4g9095+7DMtUWA+C1GAQnme5uhS5GD3xjYbo1rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ijudhZ6ROxKKS41NnvMlHw7x7RmZab4WPWNY0Drnq4=;
 b=GfDezRKj3/Ycxy9VZs9Dnn++2Oqp0lGhvpKi7XZgiWsNR3FTOr0wkuscYve9GJkIar7XSLEkJHHlnu5lr1l2+SVpXtohm3JwRm77OmV1E8H2yfc9xhm2EO9+IVEtGJk60NIf1Vxietc6teMFuuG0bao82aZmMMdsH/JIBUjnjuQcLueMzC1DF596qdlTr///OfciLFy1UoEISV3ovKMUqMk3lj1bzmwDfAqhR1X+Vxc+H7CUJ1oTX4pbCsOLOK8cRyh/veIOykckcI7sEMLLCKUDqUS5oO2YXEbDHooiIrRhVD25s3bnKEVKqWk4hCBQK5v3uFt2NiED630Mg6nfdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ijudhZ6ROxKKS41NnvMlHw7x7RmZab4WPWNY0Drnq4=;
 b=D0uz5vLkOFL8lwQqrD6MBu6++pyMKRn5hcH+Jbi2jc6pms+sWfPv9obOXR0bmtp3wfA3wUqRGAHruUPlrrFP9DwNsrHtyAY0Zy3Dt7FGMMsEE1P8Uz66XQ/elN1Q3IhR0yfSl6U8r6sWdmYQKC0N1sC0c3PwHEDMOcNt9MRaUwumxOk3HOTBvT/+XAmZ49rgaLQkZlNMCnoM8WnNGrKHGowwWZ2quObvdfXDii2PKOXUDAvxucQYO5DWe7IXXQOoJwQXM7BG08tE75BqmhNuhHBYI4uMYIvcWV9KilQXguWvJYvZRY0trR5TVAoSxAMVmG4Equpe41vv+/abmQiKTw==
Received: from PH7P220CA0162.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:33b::31)
 by CH3PR12MB7715.namprd12.prod.outlook.com (2603:10b6:610:151::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 18:26:20 +0000
Received: from SA2PEPF00003AEA.namprd02.prod.outlook.com
 (2603:10b6:510:33b:cafe::82) by PH7P220CA0162.outlook.office365.com
 (2603:10b6:510:33b::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Thu, 3
 Sep 2026 18:26:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF00003AEA.mail.protection.outlook.com (10.167.248.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 3 Sep 2026 18:26:18 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 3 Sep
 2026 11:25:54 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 3 Sep
 2026 11:25:53 -0700
Received: from build-ketanp-noble-20260630.internal (10.127.8.10) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.46 via
 Frontend Transport; Thu, 3 Sep 2026 11:25:53 -0700
From: Ketan Patil <ketanp@nvidia.com>
To: <krzk@kernel.org>, <thierry.reding@kernel.org>, <jonathanh@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Ketan Patil
	<ketanp@nvidia.com>
Subject: [PATCH 1/3] memory: tegra: Use named defines for Tegra264 MC apertures
Date: Thu, 3 Sep 2026 18:25:18 +0000
Message-ID: <20260903182520.950555-2-ketanp@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903182520.950555-1-ketanp@nvidia.com>
References: <20260903182520.950555-1-ketanp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEA:EE_|CH3PR12MB7715:EE_
X-MS-Office365-Filtering-Correlation-Id: 3717b80f-9b20-47b9-4568-08df09e8d90f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|23010399003|36860700016|10067099003|56012099006|18002099003|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info:
	XXg5fFfGCWorTvRdLVpGlTfovkn8CM1Gl5qGdJZbvaVMZYK/zBJ0tdfbMm1GUdtgKJo1DsHNIPG8Yw9U0vpLceetkvY2zfq36F6sEX4YQ2fd92CLQRLZIc50s2PIjSSXpjjLVZMtPFwqKIETxNqrf8VCvqaVXE4L4sngQi7sf1J8vaZ1IIxiViB0J3HiCynTCA4r1IMtEi5CTum+5oEFAXOExGrMiso9fP3Z/FJPjLQRb72l/jEhuAnKOp3qYaqegPtp6r6wyXXKj/BIe0sq1JaqLArpNV9osdu6gzEUqwLri7CAC/Q01YCjNYfGNHGnv+0Fo/+3aCvKJFcyPhqQo//w2LDd1uNfdGbIrW/p1INHYghiyK/v4a5gG1AplfFcTyrPFdpduhJIdwDWTqk9uOH8s+GIhIlfJbiG/GF03ZU89dtx1nR3gVO0dVhySZ5AZ+BB7yPE/KszBHYVFgpTi3zvQa0qkPM47wOvvCnUVeOdIZbc7PJxchiKU0UlYtGncTOg3LlbMqEjeoYPMZLrOR4clO4RtI+zlysPdVsxf9Feczp22ES8KI+l1v56Am29djZFogZOKbMr85gkGo3vd3ooaEXclZdO/lAShgOolInUiiD+UPAuS0I3CbmRanylrk8Ukl1HpWwdjUyHjQi7QE3gUaD3nMhhq6xhoJSWNxOIlzTXtWNjAsimau0/EMWP+XO4hhyymJ9ZGKilAKXXfA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(23010399003)(36860700016)(10067099003)(56012099006)(18002099003)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HJUjgic+7BXPZaJGvNnu9r5B/mQcLFPRcBeqKjvZaHHL7YBABhMo7sZxb+ygfpysYXP8jQdxVShlWkLS9HMDr5+NE3fFWadMzTzmq19LmWqV6L/9GeiZfp5IHrtWKd5r3yph1FNEQ5i4QANWNd5+6gtYvlCotRU5vwi4i92HvIIM9FVCJpg8xzC3eF62hrsUO6gXmxKbv2qyY9W+pXJ2NK9PCLIIST9FvhHprr9wSB6TzODnnQIhrF9TsFPR2zbsOzWNTLYid1YC8VZAetef1ekT9VZCB0mflItRnAdIam6M4isvkUvX1kjqhc4tuiLeFxQcxwinqLjoZRLrtHOAjjSxbAOR5NbQmORF1RCcrexQLAX1QIjqRUU2tt8Wpn1pkak3Pfp6nJBmVg46JLOy1rJw8h9lCCTJxd0nhuz/7SmEeaM39BI6oCAlfdVYwGrA
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 18:26:18.7248
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3717b80f-9b20-47b9-4568-08df09e8d90f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AEA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7715

The Tegra264 memory controller error interrupts are distributed across
several HUB/HUBC apertures, each accessed like a broadcast channel using
a fixed index. These indices were kept in a bare mc_hubc_aperture_number[]
array, and handle_hub_irq() took a parameter of the same name that
shadowed it.

This driver is only applicable to Tegra264 devices and so this
abstraction is not needed. Replace the array with named
TEGRA264_MC_APERTURE_* defines to simplify the code.

No functional change intended.

Signed-off-by: Ketan Patil <ketanp@nvidia.com>
---
 drivers/memory/tegra/tegra264.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/memory/tegra/tegra264.c b/drivers/memory/tegra/tegra264.c
index 790349295dcc..56e55269eed7 100644
--- a/drivers/memory/tegra/tegra264.c
+++ b/drivers/memory/tegra/tegra264.c
@@ -717,11 +717,15 @@ static const char *const tegra264_rt_error_names[16] = {
 };
 
 /*
- * MC instance aperture mapping for hubc registers
+ * On Tegra264 the memory controller error interrupts are distributed across
+ * several HUB/HUBC apertures. Each aperture is accessed like a broadcast
+ * channel through mc_ch_readl()/mc_ch_writel() using its fixed index.
  */
-static const int mc_hubc_aperture_number[5] = {
-	7, 8, 9, 10, 11
-};
+#define TEGRA264_MC_APERTURE_DISP	7
+#define TEGRA264_MC_APERTURE_SYSTEM	8
+#define TEGRA264_MC_APERTURE_VISION	9
+#define TEGRA264_MC_APERTURE_UPHY	10
+#define TEGRA264_MC_APERTURE_TOP	11
 
 /*
  * tegra264_mc_icc_set() - Pass MC client info to the BPMP-FW
@@ -1057,27 +1061,27 @@ static irqreturn_t handle_hub_irq(int irq, void *data, int mc_hubc_aperture_numb
 
 static irqreturn_t handle_disp_hub_irq(int irq, void *data)
 {
-	return handle_hub_irq(irq, data, mc_hubc_aperture_number[0]);
+	return handle_hub_irq(irq, data, TEGRA264_MC_APERTURE_DISP);
 }
 
 static irqreturn_t handle_system_hub_irq(int irq, void *data)
 {
-	return handle_hub_irq(irq, data, mc_hubc_aperture_number[1]);
+	return handle_hub_irq(irq, data, TEGRA264_MC_APERTURE_SYSTEM);
 }
 
 static irqreturn_t handle_vision_hub_irq(int irq, void *data)
 {
-	return handle_hub_irq(irq, data, mc_hubc_aperture_number[2]);
+	return handle_hub_irq(irq, data, TEGRA264_MC_APERTURE_VISION);
 }
 
 static irqreturn_t handle_uphy_hub_irq(int irq, void *data)
 {
-	return handle_hub_irq(irq, data, mc_hubc_aperture_number[3]);
+	return handle_hub_irq(irq, data, TEGRA264_MC_APERTURE_UPHY);
 }
 
 static irqreturn_t handle_top_hub_irq(int irq, void *data)
 {
-	return handle_hub_irq(irq, data, mc_hubc_aperture_number[4]);
+	return handle_hub_irq(irq, data, TEGRA264_MC_APERTURE_TOP);
 }
 
 static irqreturn_t handle_generic_irq(struct tegra_mc *mc, unsigned long intstat_reg)
-- 
2.43.0

