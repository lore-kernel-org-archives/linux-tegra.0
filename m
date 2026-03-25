Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010065.outbound.protection.outlook.com [52.101.85.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CA7350A33
	for <linux-tegra@vger.kernel.org>; Wed, 25 Mar 2026 19:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774466824; cv=fail; b=MRM+axT4RK5yem3BO62YcDHwHMVesNPMxJ5LHmymN/6NNAS2SqQoloxBtYWPbmvqvNIuo/ISEKPJwk+csBkB51xXFtxXMQR8bvZi9p+ZgCXaOlYcXO8LOl+InYeUalKbV+174e22z+H1msWl+xhcz9SFoCZeHrzfJyWUJLpept4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774466824; c=relaxed/simple;
	bh=a7tCQZvr73Y7RgzzOQZIVwe9jmehIzc5VDz8vZJxrwA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hlz4H+jtM8KSxyfsLzp55MBjVmo3CzqJ8jYOXzdxZOIY4YQt+LbCSMF82jy4HEAEHSfPTVM7oCM9QG1UsYkiSnd8l0bUv2N1q5Sw4/tJ4yLP3FDG0yJPWSiubFsS6wbkqPr2RyVc0p0a4eKR1y3MxAvqWWFq4hQItvBzppf4QI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AusamGwR; arc=fail smtp.client-ip=52.101.85.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AusamGwR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KRLSKRyHNpJFn87ZlkfGQ0SA4B48jrAuBY5hPl9fkcOwhYXCRZgEdAE5vdsuK+hIoa7mUuYh4+NLYyfzCUviy+Y9fcHd5zwh197U6uvB4fvgZ4+3dr1TbWHvkDRwYUz9qW6HjsSkvZNNU8kbLsSwR5NWqeYJNd/CQX1citgT6JNSup+RtsCALvbIGFw+OnCuZg6ORSEvv3N/xu5IS7boM2aEw65+PFVADYge6NqNTf7eKF9HJlPJI0Rxj3+OUxJ6N268v+NHg1dJY/5u4VHO7jJK6a2kAwBUC/lS0CZCvuuvf+JRy45cpfXKGCwOFpjcrKtbzhj4bA8tv1drQssBXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vKVHcD6Ivj/qVbzfkvNUletMeCP2SefH7XCjEpNAliM=;
 b=b/ZaO51CkTGUZqvfguxK4w40eflSqQRBmQmE9Z0SfgcZNVDsdrhl+k4fIQnihGx2Hgm2AI1yOa7JPooiAEpWH4Ui7Ep8xqI+3TeKQp9t339pPSXbxB8r1FpEP4Vmht+E0GQU1R5iRU4iHHwfVuMXPG/hNewIsn7R1eqTwas1keDYtsFefJoSbBD18DxnMlRJZxJpNk61f2CvlSMfduMw/5J9vA2TJEZw2cUhlLXO0yZihadP9iZSFYIGikqjE1O1dV4wpBOifGt+mjTItyzMNYX27Ml7zFr5XTwDkbSR1wkiapFUfaCFYqqA4rul+ivKqoPJTkqEAJVXQZKKTfSURg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vKVHcD6Ivj/qVbzfkvNUletMeCP2SefH7XCjEpNAliM=;
 b=AusamGwRdzV/Pr52Im+9rSv9Em1ZYO1ovLQffX1Y2ES3yMm2F6uW8wqieXa1yOJPhvCS/AAcDSgsynh4g5PtxwewmjMsd7UvMRVgzOOtY8waN62+M4HBRpnEAQJwpcWBeKrmYSdCV6qU6xCF7l9LRmdpEkC4HwnSXi3HueobCy21WK1zgb7krsDfjKPDRZs6xQ/FteFSb0O6BtqIkvJYqDW//f8gpLYo0ouP8EwztDmkQvIC586H+Qg9u4UHCq3+Fsm5ONTqdEsbdWRKDWoEy9TUYT32NuiKaC0cEUQ3605Gxnw7CMHrpZf0uYohMM5bT/v0zfqj/FvaaWgU/lAxPQ==
Received: from MN2PR03CA0006.namprd03.prod.outlook.com (2603:10b6:208:23a::11)
 by DM4PR12MB5937.namprd12.prod.outlook.com (2603:10b6:8:68::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 19:26:51 +0000
Received: from BL6PEPF0001AB50.namprd04.prod.outlook.com
 (2603:10b6:208:23a:cafe::db) by MN2PR03CA0006.outlook.office365.com
 (2603:10b6:208:23a::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Wed,
 25 Mar 2026 19:26:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BL6PEPF0001AB50.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Wed, 25 Mar 2026 19:26:50 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 12:26:34 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 25 Mar 2026 12:26:33 -0700
Received: from moonraker.home (10.127.8.14) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 25 Mar 2026 12:26:32 -0700
From: Jon Hunter <jonathanh@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>
CC: <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 08/10] soc/tegra: pmc: Refactor IO pad voltage control
Date: Wed, 25 Mar 2026 19:25:58 +0000
Message-ID: <20260325192601.239554-9-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325192601.239554-1-jonathanh@nvidia.com>
References: <20260325192601.239554-1-jonathanh@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB50:EE_|DM4PR12MB5937:EE_
X-MS-Office365-Filtering-Correlation-Id: 219e6112-e8e4-47f4-b4a5-08de8aa476ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	vVhhVvMxYD1FqUirw9WszJcfhueT/LAqdoGQFLrqq/xhz5qEqYPANNHEUbtToqAKI8iu32igk5JJWgnWuijI/gU/N4+dZkZ3ueCbvCS255CGQRqCUzSs65k0Rxl7Tdf7vacZnbSmiy2l1lilK7Irl+lG95qivyAmYu5P+fjSXv6srNrP0FwekvGz6yH7+mH4/LUzaFnVXWtBAdTX2hgLKUYJRYhu86cL6rGkJ/cNZbo7KvEwojO1AS8Hq/5+ddh59/T+ZYLpEKFVVZ+Dw0CJc/e78rUxjkuufCMBttWv8W6dNIFMWwG1WbPZc+X9RrP7RHJ7JuvepXjdymR+Y4vjGt0CgDeYVzCOhDaPEBfF8CsGe/UMSRoKNFgIh6/JiotaXhigOF8nZsGENhzmBgC4+aR3UnUbqyBGp3U8PRtlsapXQ4C6/0J3CwtbMtdYiJekrbgCOTGpZnJjhJ4HraOYY68vszjpAifNGE+sk7NXsu2aU26eq4ks5+OyDOczn1r96d2ilpZIi1q7OmO+Wk22+za74eBu/BAGbGTlnP27Mgrz/jWyXNnLBoekMw46PLfMp1e/ZDWXW4B11Ek6Xm/qDoUibOq/9zk6qGCngMbeapS8Ydd2y0Lta6Aq7H5cl4d2W383TOv0pArZVyUPFnaXmT8SVR3zD7gMCQuM3PWT9F3xXZq3ONITDabyZJ8mXikh1lV/S24nWghSgnfa3fEPkwiT9z9NLYwYI6Uk/06jsvX0zX/dw0nAQMLR3ELMayVPbXzbn64GEhvWIzBWGXbZtg==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5QRLekgP5dT2hjkVkoCa+gtmtvSRcTM0NPdkm4Pv2Af6V1VltmhKir2shw6pWN/yt0uqNZeX1DyibGv07Mpj7J1kwIgQPINnUTjTXDR6HvgtAkwHK51+tfZYwBSQJO1zWMgcmjb30phsdvGafIvCI/sNSTfgzmTkGDCoEzfmTFQighjhvsLTU+QO/X0hYuZ9eKctdMS7xXCkO0SfOBCmmNlAA7i+H1/jckpdCQhhIyo00+ryjILUEuvP6QhIo5ay3FKcY9MgJsVMpHNxTJrWRBbM2bKeIeqWZWDBIJGQaIe2VKY/cj1S0Aat1K4lMQ6vSRylrlmtmoycNrfkxJOo+EhyPN4Ixwd+y+P+wZI3ckQd1Kg5IGH5z+b9xIuuMnHKR+O1nQAq9LlsEurlOtxC2xV75n/Bt+YaVR4kLX+UmkkjfliiGPATvc4DLqVMV7U7
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 19:26:50.5922
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 219e6112-e8e4-47f4-b4a5-08de8aa476ef
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB50.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5937

For Tegra devices, only a subset of IO pads can be configured for 1.8V
or 3.3V. Therefore, in the 'tegra_io_pad_soc' structure for Tegra SoCs
either all or most of the 'voltage' entries are set to UINT_MAX to
indicate the IO pad voltage cannot be configured. So for the majority of
IO pads this configuration is not applicable. However, refactoring the
IO pad data to move this parameter into a separate structure does not
make sense because the benefits are marginal.

Support for the Tegra264 IO pads is currently missing and the control
for configuring the voltage for the IO pads for Tegra264 has changed.
Instead of having a single register that is used for setting the IO pad
voltage for all IO pads, there is now a register associated with the
specific IO pad. For Tegra264, there is now only one IO pad that can be
configured for 1.8V or 3.3V which is the sdmmc1-hv. While we could make
this work with by adding a new SoC flag, the implementation will be a
bit cumbersome. Therefore, it now seems reasonable to refactor the IO
pad code. Hence, introduce a new 'tegra_io_pad_vctrl' structure that
contains the register offset and bit for enabling/disabling 3.3V mode
and move the existing voltage control data for supported SoCs to this
structure. This has an added benefit of simplifying the code in the
functions tegra_io_pad_get_voltage and tegra_io_pad_set_voltage.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 467 ++++++++++++++++++++++------------------
 1 file changed, 259 insertions(+), 208 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 3899d8c76569..3dcc679baffa 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -294,10 +294,15 @@ struct tegra_io_pad_soc {
 	unsigned int dpd;
 	unsigned int request;
 	unsigned int status;
-	unsigned int voltage;
 	const char *name;
 };
 
+struct tegra_io_pad_vctrl {
+	enum tegra_io_pad id;
+	unsigned int offset;
+	unsigned int ena_3v3;
+};
+
 struct tegra_pmc_regs {
 	unsigned int scratch0;
 	unsigned int rst_status;
@@ -372,6 +377,8 @@ struct tegra_pmc_soc {
 
 	const struct tegra_io_pad_soc *io_pads;
 	unsigned int num_io_pads;
+	const struct tegra_io_pad_vctrl *io_pad_vctrls;
+	unsigned int num_io_pad_vctrls;
 
 	const struct pinctrl_pin_desc *pin_descs;
 	unsigned int num_pin_descs;
@@ -1699,6 +1706,18 @@ tegra_io_pad_find(struct tegra_pmc *pmc, enum tegra_io_pad id)
 	return NULL;
 }
 
+static const struct tegra_io_pad_vctrl *
+tegra_io_pad_vctrl_find(struct tegra_pmc *pmc, enum tegra_io_pad id)
+{
+	unsigned int i;
+
+	for (i = 0; i < pmc->soc->num_io_pad_vctrls; i++)
+		if (pmc->soc->io_pad_vctrls[i].id == id)
+			return &pmc->soc->io_pad_vctrls[i];
+
+	return NULL;
+}
+
 static int tegra_io_pad_prepare(struct tegra_pmc *pmc,
 				const struct tegra_io_pad_soc *pad,
 				unsigned long *request,
@@ -1894,43 +1913,30 @@ static int tegra_io_pad_is_powered(struct tegra_pmc *pmc, enum tegra_io_pad id)
 static int tegra_io_pad_set_voltage(struct tegra_pmc *pmc, enum tegra_io_pad id,
 				    int voltage)
 {
-	const struct tegra_io_pad_soc *pad;
+	const struct tegra_io_pad_vctrl *pad;
 	u32 value;
 
-	pad = tegra_io_pad_find(pmc, id);
+	pad = tegra_io_pad_vctrl_find(pmc, id);
 	if (!pad)
 		return -ENOENT;
 
-	if (pad->voltage == UINT_MAX)
-		return -ENOTSUPP;
-
 	mutex_lock(&pmc->powergates_lock);
 
-	if (pmc->soc->has_impl_33v_pwr) {
-		value = tegra_pmc_readl(pmc, PMC_IMPL_E_33V_PWR);
-
-		if (voltage == TEGRA_IO_PAD_VOLTAGE_1V8)
-			value &= ~BIT(pad->voltage);
-		else
-			value |= BIT(pad->voltage);
-
-		tegra_pmc_writel(pmc, value, PMC_IMPL_E_33V_PWR);
-	} else {
-		/* write-enable PMC_PWR_DET_VALUE[pad->voltage] */
+	if (!pmc->soc->has_impl_33v_pwr) {
+		/* write-enable PMC_PWR_DET_VALUE[pad->ena_3v3] */
 		value = tegra_pmc_readl(pmc, PMC_PWR_DET);
-		value |= BIT(pad->voltage);
+		value |= BIT(pad->ena_3v3);
 		tegra_pmc_writel(pmc, value, PMC_PWR_DET);
+	}
 
-		/* update I/O voltage */
-		value = tegra_pmc_readl(pmc, PMC_PWR_DET_VALUE);
+	value = tegra_pmc_readl(pmc, pad->offset);
 
-		if (voltage == TEGRA_IO_PAD_VOLTAGE_1V8)
-			value &= ~BIT(pad->voltage);
-		else
-			value |= BIT(pad->voltage);
+	if (voltage == TEGRA_IO_PAD_VOLTAGE_1V8)
+		value &= ~BIT(pad->ena_3v3);
+	else
+		value |= BIT(pad->ena_3v3);
 
-		tegra_pmc_writel(pmc, value, PMC_PWR_DET_VALUE);
-	}
+	tegra_pmc_writel(pmc, value, pad->offset);
 
 	mutex_unlock(&pmc->powergates_lock);
 
@@ -1941,22 +1947,16 @@ static int tegra_io_pad_set_voltage(struct tegra_pmc *pmc, enum tegra_io_pad id,
 
 static int tegra_io_pad_get_voltage(struct tegra_pmc *pmc, enum tegra_io_pad id)
 {
-	const struct tegra_io_pad_soc *pad;
+	const struct tegra_io_pad_vctrl *pad;
 	u32 value;
 
-	pad = tegra_io_pad_find(pmc, id);
+	pad = tegra_io_pad_vctrl_find(pmc, id);
 	if (!pad)
 		return -ENOENT;
 
-	if (pad->voltage == UINT_MAX)
-		return -ENOTSUPP;
+	value = tegra_pmc_readl(pmc, pad->offset);
 
-	if (pmc->soc->has_impl_33v_pwr)
-		value = tegra_pmc_readl(pmc, PMC_IMPL_E_33V_PWR);
-	else
-		value = tegra_pmc_readl(pmc, PMC_PWR_DET_VALUE);
-
-	if ((value & BIT(pad->voltage)) == 0)
+	if ((value & BIT(pad->ena_3v3)) == 0)
 		return TEGRA_IO_PAD_VOLTAGE_1V8;
 
 	return TEGRA_IO_PAD_VOLTAGE_3V3;
@@ -3710,16 +3710,22 @@ static const u8 tegra124_cpu_powergates[] = {
 	TEGRA_POWERGATE_CPU3,
 };
 
-#define TEGRA_IO_PAD(_id, _dpd, _request, _status, _voltage, _name)	\
+#define TEGRA_IO_PAD(_id, _dpd, _request, _status, _name)	\
 	((struct tegra_io_pad_soc) {					\
 		.id		= (_id),				\
 		.dpd		= (_dpd),				\
 		.request	= (_request),				\
 		.status		= (_status),				\
-		.voltage	= (_voltage),				\
 		.name		= (_name),				\
 	})
 
+#define TEGRA_IO_PAD_VCTRL(_id, _offset, _ena_3v3)			\
+	((struct tegra_io_pad_vctrl) {					\
+		.id		= (_id),				\
+		.offset		= (_offset),				\
+		.ena_3v3	= (_ena_3v3),				\
+	})
+
 #define TEGRA_IO_PIN_DESC(_id, _name)	\
 	((struct pinctrl_pin_desc) {	\
 		.number	= (_id),	\
@@ -3727,36 +3733,36 @@ static const u8 tegra124_cpu_powergates[] = {
 	})
 
 static const struct tegra_io_pad_soc tegra124_io_pads[] = {
-	TEGRA_IO_PAD(TEGRA_IO_PAD_AUDIO, 17, 0x1b8, 0x1bc, UINT_MAX, "audio"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_BB, 15, 0x1b8, 0x1bc, UINT_MAX, "bb"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_CAM, 4, 0x1c0, 0x1c4, UINT_MAX, "cam"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_COMP, 22, 0x1b8, 0x1bc, UINT_MAX, "comp"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIA, 0, 0x1b8, 0x1bc, UINT_MAX, "csia"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIB, 1, 0x1b8, 0x1bc, UINT_MAX, "csib"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIE, 12, 0x1c0, 0x1c4, UINT_MAX, "csie"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_DSI, 2, 0x1b8, 0x1bc, UINT_MAX, "dsi"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_DSIB, 7, 0x1c0, 0x1c4, UINT_MAX, "dsib"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_DSIC, 8, 0x1c0, 0x1c4, UINT_MAX, "dsic"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_DSID, 9, 0x1c0, 0x1c4, UINT_MAX, "dsid"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_HDMI, 28, 0x1b8, 0x1bc, UINT_MAX, "hdmi"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_HSIC, 19, 0x1b8, 0x1bc, UINT_MAX, "hsic"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_HV, 6, 0x1c0, 0x1c4, UINT_MAX, "hv"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_LVDS, 25, 0x1c0, 0x1c4, UINT_MAX, "lvds"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_MIPI_BIAS, 3, 0x1b8, 0x1bc, UINT_MAX, "mipi-bias"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_NAND, 13, 0x1b8, 0x1bc, UINT_MAX, "nand"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_PEX_BIAS, 4, 0x1b8, 0x1bc, UINT_MAX, "pex-bias"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_PEX_CLK1, 5, 0x1b8, 0x1bc, UINT_MAX, "pex-clk1"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_PEX_CLK2, 6, 0x1b8, 0x1bc, UINT_MAX, "pex-clk2"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_PEX_CNTRL, 0, 0x1c0, 0x1c4, UINT_MAX, "pex-cntrl"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_SDMMC1, 1, 0x1c0, 0x1c4, UINT_MAX, "sdmmc1"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_SDMMC3, 2, 0x1c0, 0x1c4, UINT_MAX, "sdmmc3"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_SDMMC4, 3, 0x1c0, 0x1c4, UINT_MAX, "sdmmc4"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_SYS_DDC, 26, 0x1c0, 0x1c4, UINT_MAX, "sys_ddc"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_UART, 14, 0x1b8, 0x1bc, UINT_MAX, "uart"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_USB0, 9, 0x1b8, 0x1bc, UINT_MAX, "usb0"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_USB1, 10, 0x1b8, 0x1bc, UINT_MAX, "usb1"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_USB2, 11, 0x1b8, 0x1bc, UINT_MAX, "usb2"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_USB_BIAS, 12, 0x1b8, 0x1bc, UINT_MAX, "usb_bias"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_AUDIO, 17, 0x1b8, 0x1bc, "audio"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_BB, 15, 0x1b8, 0x1bc, "bb"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_CAM, 4, 0x1c0, 0x1c4, "cam"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_COMP, 22, 0x1b8, 0x1bc, "comp"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIA, 0, 0x1b8, 0x1bc, "csia"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIB, 1, 0x1b8, 0x1bc, "csib"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIE, 12, 0x1c0, 0x1c4, "csie"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_DSI, 2, 0x1b8, 0x1bc, "dsi"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_DSIB, 7, 0x1c0, 0x1c4, "dsib"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_DSIC, 8, 0x1c0, 0x1c4, "dsic"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_DSID, 9, 0x1c0, 0x1c4, "dsid"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_HDMI, 28, 0x1b8, 0x1bc, "hdmi"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_HSIC, 19, 0x1b8, 0x1bc, "hsic"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_HV, 6, 0x1c0, 0x1c4, "hv"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_LVDS, 25, 0x1c0, 0x1c4, "lvds"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_MIPI_BIAS, 3, 0x1b8, 0x1bc, "mipi-bias"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_NAND, 13, 0x1b8, 0x1bc, "nand"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_PEX_BIAS, 4, 0x1b8, 0x1bc, "pex-bias"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_PEX_CLK1, 5, 0x1b8, 0x1bc, "pex-clk1"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_PEX_CLK2, 6, 0x1b8, 0x1bc, "pex-clk2"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_PEX_CNTRL, 0, 0x1c0, 0x1c4, "pex-cntrl"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_SDMMC1, 1, 0x1c0, 0x1c4, "sdmmc1"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_SDMMC3, 2, 0x1c0, 0x1c4, "sdmmc3"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_SDMMC4, 3, 0x1c0, 0x1c4, "sdmmc4"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_SYS_DDC, 26, 0x1c0, 0x1c4, "sys_ddc"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_UART, 14, 0x1b8, 0x1bc, "uart"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_USB0, 9, 0x1b8, 0x1bc, "usb0"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_USB1, 10, 0x1b8, 0x1bc, "usb1"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_USB2, 11, 0x1b8, 0x1bc, "usb2"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_USB_BIAS, 12, 0x1b8, 0x1bc, "usb_bias"),
 };
 
 static const struct pinctrl_pin_desc tegra124_pin_descs[] = {
@@ -3857,46 +3863,60 @@ static const u8 tegra210_cpu_powergates[] = {
 };
 
 static const struct tegra_io_pad_soc tegra210_io_pads[] = {
-	TEGRA_IO_PAD(TEGRA_IO_PAD_AUDIO, 17, 0x1b8, 0x1bc, 5, "audio"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_AUDIO_HV, 29, 0x1c0, 0x1c4, 18, "audio-hv"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_CAM, 4, 0x1c0, 0x1c4, 10, "cam"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIA, 0, 0x1b8, 0x1bc, UINT_MAX, "csia"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIB, 1, 0x1b8, 0x1bc, UINT_MAX, "csib"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIC, 10, 0x1c0, 0x1c4, UINT_MAX, "csic"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_CSID, 11, 0x1c0, 0x1c4, UINT_MAX, "csid"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIE, 12, 0x1c0, 0x1c4, UINT_MAX, "csie"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIF, 13, 0x1c0, 0x1c4, UINT_MAX, "csif"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_DBG, 25, 0x1b8, 0x1bc, 19, "dbg"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_DEBUG_NONAO, 26, 0x1b8, 0x1bc, UINT_MAX, "debug-nonao"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_DMIC, 18, 0x1c0, 0x1c4, 20, "dmic"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_DP, 19, 0x1c0, 0x1c4, UINT_MAX, "dp"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_DSI, 2, 0x1b8, 0x1bc, UINT_MAX, "dsi"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_DSIB, 7, 0x1c0, 0x1c4, UINT_MAX, "dsib"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_DSIC, 8, 0x1c0, 0x1c4, UINT_MAX, "dsic"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_DSID, 9, 0x1c0, 0x1c4, UINT_MAX, "dsid"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_EMMC, 3, 0x1c0, 0x1c4, UINT_MAX, "emmc"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_EMMC2, 5, 0x1c0, 0x1c4, UINT_MAX, "emmc2"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_GPIO, 27, 0x1b8, 0x1bc, 21, "gpio"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_HDMI, 28, 0x1b8, 0x1bc, UINT_MAX, "hdmi"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_HSIC, 19, 0x1b8, 0x1bc, UINT_MAX, "hsic"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_LVDS, 25, 0x1c0, 0x1c4, UINT_MAX, "lvds"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_MIPI_BIAS, 3, 0x1b8, 0x1bc, UINT_MAX, "mipi-bias"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_PEX_BIAS, 4, 0x1b8, 0x1bc, UINT_MAX, "pex-bias"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_PEX_CLK1, 5, 0x1b8, 0x1bc, UINT_MAX, "pex-clk1"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_PEX_CLK2, 6, 0x1b8, 0x1bc, UINT_MAX, "pex-clk2"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_PEX_CNTRL, UINT_MAX, UINT_MAX, UINT_MAX, 11, "pex-cntrl"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_SDMMC1, 1, 0x1c0, 0x1c4, 12, "sdmmc1"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_SDMMC3, 2, 0x1c0, 0x1c4, 13, "sdmmc3"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_SPI, 14, 0x1c0, 0x1c4, 22, "spi"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_SPI_HV, 15, 0x1c0, 0x1c4, 23, "spi-hv"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_UART, 14, 0x1b8, 0x1bc, 2, "uart"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_USB0, 9, 0x1b8, 0x1bc, UINT_MAX, "usb0"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_USB1, 10, 0x1b8, 0x1bc, UINT_MAX, "usb1"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_USB2, 11, 0x1b8, 0x1bc, UINT_MAX, "usb2"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_USB3, 18, 0x1b8, 0x1bc, UINT_MAX, "usb3"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_USB_BIAS, 12, 0x1b8, 0x1bc, UINT_MAX, "usb-bias"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_AUDIO, 17, 0x1b8, 0x1bc, "audio"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_AUDIO_HV, 29, 0x1c0, 0x1c4, "audio-hv"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_CAM, 4, 0x1c0, 0x1c4, "cam"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIA, 0, 0x1b8, 0x1bc, "csia"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIB, 1, 0x1b8, 0x1bc, "csib"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIC, 10, 0x1c0, 0x1c4, "csic"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_CSID, 11, 0x1c0, 0x1c4, "csid"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIE, 12, 0x1c0, 0x1c4, "csie"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIF, 13, 0x1c0, 0x1c4, "csif"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_DBG, 25, 0x1b8, 0x1bc, "dbg"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_DEBUG_NONAO, 26, 0x1b8, 0x1bc, "debug-nonao"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_DMIC, 18, 0x1c0, 0x1c4, "dmic"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_DP, 19, 0x1c0, 0x1c4, "dp"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_DSI, 2, 0x1b8, 0x1bc, "dsi"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_DSIB, 7, 0x1c0, 0x1c4, "dsib"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_DSIC, 8, 0x1c0, 0x1c4, "dsic"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_DSID, 9, 0x1c0, 0x1c4, "dsid"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_EMMC, 3, 0x1c0, 0x1c4, "emmc"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_EMMC2, 5, 0x1c0, 0x1c4, "emmc2"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_GPIO, 27, 0x1b8, 0x1bc, "gpio"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_HDMI, 28, 0x1b8, 0x1bc, "hdmi"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_HSIC, 19, 0x1b8, 0x1bc, "hsic"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_LVDS, 25, 0x1c0, 0x1c4, "lvds"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_MIPI_BIAS, 3, 0x1b8, 0x1bc, "mipi-bias"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_PEX_BIAS, 4, 0x1b8, 0x1bc, "pex-bias"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_PEX_CLK1, 5, 0x1b8, 0x1bc, "pex-clk1"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_PEX_CLK2, 6, 0x1b8, 0x1bc, "pex-clk2"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_PEX_CNTRL, UINT_MAX, UINT_MAX, UINT_MAX, "pex-cntrl"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_SDMMC1, 1, 0x1c0, 0x1c4, "sdmmc1"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_SDMMC3, 2, 0x1c0, 0x1c4, "sdmmc3"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_SPI, 14, 0x1c0, 0x1c4, "spi"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_SPI_HV, 15, 0x1c0, 0x1c4, "spi-hv"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_UART, 14, 0x1b8, 0x1bc, "uart"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_USB0, 9, 0x1b8, 0x1bc, "usb0"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_USB1, 10, 0x1b8, 0x1bc, "usb1"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_USB2, 11, 0x1b8, 0x1bc, "usb2"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_USB3, 18, 0x1b8, 0x1bc, "usb3"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_USB_BIAS, 12, 0x1b8, 0x1bc, "usb-bias"),
 };
 
+static const struct tegra_io_pad_vctrl tegra210_io_pad_vctrls[] = {
+	TEGRA_IO_PAD_VCTRL(TEGRA_IO_PAD_AUDIO, PMC_PWR_DET_VALUE, 5),
+	TEGRA_IO_PAD_VCTRL(TEGRA_IO_PAD_AUDIO_HV, PMC_PWR_DET_VALUE, 18),
+	TEGRA_IO_PAD_VCTRL(TEGRA_IO_PAD_CAM, PMC_PWR_DET_VALUE, 10),
+	TEGRA_IO_PAD_VCTRL(TEGRA_IO_PAD_DBG, PMC_PWR_DET_VALUE, 19),
+	TEGRA_IO_PAD_VCTRL(TEGRA_IO_PAD_DMIC, PMC_PWR_DET_VALUE, 20),
+	TEGRA_IO_PAD_VCTRL(TEGRA_IO_PAD_GPIO, PMC_PWR_DET_VALUE, 21),
+	TEGRA_IO_PAD_VCTRL(TEGRA_IO_PAD_PEX_CNTRL, PMC_PWR_DET_VALUE, 11),
+	TEGRA_IO_PAD_VCTRL(TEGRA_IO_PAD_SDMMC1, PMC_PWR_DET_VALUE, 12),
+	TEGRA_IO_PAD_VCTRL(TEGRA_IO_PAD_SDMMC3, PMC_PWR_DET_VALUE, 13),
+	TEGRA_IO_PAD_VCTRL(TEGRA_IO_PAD_SPI, PMC_PWR_DET_VALUE, 22),
+	TEGRA_IO_PAD_VCTRL(TEGRA_IO_PAD_SPI_HV, PMC_PWR_DET_VALUE, 23),
+	TEGRA_IO_PAD_VCTRL(TEGRA_IO_PAD_UART, PMC_PWR_DET_VALUE, 2),
+};
 static const struct pinctrl_pin_desc tegra210_pin_descs[] = {
 	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_AUDIO, "audio"),
 	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_AUDIO_HV, "audio-hv"),
@@ -3965,6 +3985,8 @@ static const struct tegra_pmc_soc tegra210_pmc_soc = {
 	.maybe_tz_only = true,
 	.num_io_pads = ARRAY_SIZE(tegra210_io_pads),
 	.io_pads = tegra210_io_pads,
+	.num_io_pad_vctrls = ARRAY_SIZE(tegra210_io_pad_vctrls),
+	.io_pad_vctrls = tegra210_io_pad_vctrls,
 	.num_pin_descs = ARRAY_SIZE(tegra210_pin_descs),
 	.pin_descs = tegra210_pin_descs,
 	.regs = &tegra20_pmc_regs,
@@ -3987,44 +4009,53 @@ static const struct tegra_pmc_soc tegra210_pmc_soc = {
 };
 
 static const struct tegra_io_pad_soc tegra186_io_pads[] = {
-	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIA, 0, 0x74, 0x78, UINT_MAX, "csia"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIB, 1, 0x74, 0x78, UINT_MAX, "csib"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_DSI, 2, 0x74, 0x78, UINT_MAX, "dsi"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_MIPI_BIAS, 3, 0x74, 0x78, UINT_MAX, "mipi-bias"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_PEX_CLK_BIAS, 4, 0x74, 0x78, UINT_MAX, "pex-clk-bias"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_PEX_CLK3, 5, 0x74, 0x78, UINT_MAX, "pex-clk3"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_PEX_CLK2, 6, 0x74, 0x78, UINT_MAX, "pex-clk2"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_PEX_CLK1, 7, 0x74, 0x78, UINT_MAX, "pex-clk1"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_USB0, 9, 0x74, 0x78, UINT_MAX, "usb0"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_USB1, 10, 0x74, 0x78, UINT_MAX, "usb1"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_USB2, 11, 0x74, 0x78, UINT_MAX, "usb2"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_USB_BIAS, 12, 0x74, 0x78, UINT_MAX, "usb-bias"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_UART, 14, 0x74, 0x78, UINT_MAX, "uart"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_AUDIO, 17, 0x74, 0x78, UINT_MAX, "audio"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_HSIC, 19, 0x74, 0x78, UINT_MAX, "hsic"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_DBG, 25, 0x74, 0x78, UINT_MAX, "dbg"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_HDMI_DP0, 28, 0x74, 0x78, UINT_MAX, "hdmi-dp0"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_HDMI_DP1, 29, 0x74, 0x78, UINT_MAX, "hdmi-dp1"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_PEX_CNTRL, 0, 0x7c, 0x80, UINT_MAX, "pex-cntrl"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_SDMMC2_HV, 2, 0x7c, 0x80, 5, "sdmmc2-hv"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_SDMMC4, 4, 0x7c, 0x80, UINT_MAX, "sdmmc4"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_CAM, 6, 0x7c, 0x80, UINT_MAX, "cam"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_DSIB, 8, 0x7c, 0x80, UINT_MAX, "dsib"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_DSIC, 9, 0x7c, 0x80, UINT_MAX, "dsic"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_DSID, 10, 0x7c, 0x80, UINT_MAX, "dsid"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIC, 11, 0x7c, 0x80, UINT_MAX, "csic"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_CSID, 12, 0x7c, 0x80, UINT_MAX, "csid"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIE, 13, 0x7c, 0x80, UINT_MAX, "csie"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIF, 14, 0x7c, 0x80, UINT_MAX, "csif"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_SPI, 15, 0x7c, 0x80, UINT_MAX, "spi"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_UFS, 17, 0x7c, 0x80, UINT_MAX, "ufs"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_DMIC_HV, 20, 0x7c, 0x80, 2, "dmic-hv"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_EDP, 21, 0x7c, 0x80, UINT_MAX, "edp"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_SDMMC1_HV, 23, 0x7c, 0x80, 4, "sdmmc1-hv"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_SDMMC3_HV, 24, 0x7c, 0x80, 6, "sdmmc3-hv"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_CONN, 28, 0x7c, 0x80, UINT_MAX, "conn"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_AUDIO_HV, 29, 0x7c, 0x80, 1, "audio-hv"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_AO_HV, UINT_MAX, UINT_MAX, UINT_MAX, 0, "ao-hv"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIA, 0, 0x74, 0x78, "csia"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIB, 1, 0x74, 0x78, "csib"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_DSI, 2, 0x74, 0x78, "dsi"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_MIPI_BIAS, 3, 0x74, 0x78, "mipi-bias"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_PEX_CLK_BIAS, 4, 0x74, 0x78, "pex-clk-bias"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_PEX_CLK3, 5, 0x74, 0x78, "pex-clk3"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_PEX_CLK2, 6, 0x74, 0x78, "pex-clk2"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_PEX_CLK1, 7, 0x74, 0x78, "pex-clk1"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_USB0, 9, 0x74, 0x78, "usb0"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_USB1, 10, 0x74, 0x78, "usb1"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_USB2, 11, 0x74, 0x78, "usb2"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_USB_BIAS, 12, 0x74, 0x78, "usb-bias"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_UART, 14, 0x74, 0x78, "uart"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_AUDIO, 17, 0x74, 0x78, "audio"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_HSIC, 19, 0x74, 0x78, "hsic"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_DBG, 25, 0x74, 0x78, "dbg"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_HDMI_DP0, 28, 0x74, 0x78, "hdmi-dp0"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_HDMI_DP1, 29, 0x74, 0x78, "hdmi-dp1"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_PEX_CNTRL, 0, 0x7c, 0x80, "pex-cntrl"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_SDMMC2_HV, 2, 0x7c, 0x80, "sdmmc2-hv"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_SDMMC4, 4, 0x7c, 0x80, "sdmmc4"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_CAM, 6, 0x7c, 0x80, "cam"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_DSIB, 8, 0x7c, 0x80, "dsib"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_DSIC, 9, 0x7c, 0x80, "dsic"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_DSID, 10, 0x7c, 0x80, "dsid"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIC, 11, 0x7c, 0x80, "csic"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_CSID, 12, 0x7c, 0x80, "csid"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIE, 13, 0x7c, 0x80, "csie"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIF, 14, 0x7c, 0x80, "csif"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_SPI, 15, 0x7c, 0x80, "spi"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_UFS, 17, 0x7c, 0x80, "ufs"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_DMIC_HV, 20, 0x7c, 0x80, "dmic-hv"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_EDP, 21, 0x7c, 0x80, "edp"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_SDMMC1_HV, 23, 0x7c, 0x80, "sdmmc1-hv"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_SDMMC3_HV, 24, 0x7c, 0x80, "sdmmc3-hv"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_CONN, 28, 0x7c, 0x80, "conn"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_AUDIO_HV, 29, 0x7c, 0x80, "audio-hv"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_AO_HV, UINT_MAX, UINT_MAX, UINT_MAX, "ao-hv"),
+};
+
+static const struct tegra_io_pad_vctrl tegra186_io_pad_vctrls[] = {
+	TEGRA_IO_PAD_VCTRL(TEGRA_IO_PAD_SDMMC2_HV, PMC_IMPL_E_33V_PWR, 5),
+	TEGRA_IO_PAD_VCTRL(TEGRA_IO_PAD_DMIC_HV,  PMC_IMPL_E_33V_PWR, 2),
+	TEGRA_IO_PAD_VCTRL(TEGRA_IO_PAD_SDMMC1_HV, PMC_IMPL_E_33V_PWR, 4),
+	TEGRA_IO_PAD_VCTRL(TEGRA_IO_PAD_SDMMC3_HV, PMC_IMPL_E_33V_PWR, 6),
+	TEGRA_IO_PAD_VCTRL(TEGRA_IO_PAD_AUDIO_HV, PMC_IMPL_E_33V_PWR, 1),
+	TEGRA_IO_PAD_VCTRL(TEGRA_IO_PAD_AO_HV, PMC_IMPL_E_33V_PWR, 0),
 };
 
 static const struct pinctrl_pin_desc tegra186_pin_descs[] = {
@@ -4168,6 +4199,8 @@ static const struct tegra_pmc_soc tegra186_pmc_soc = {
 	.maybe_tz_only = false,
 	.num_io_pads = ARRAY_SIZE(tegra186_io_pads),
 	.io_pads = tegra186_io_pads,
+	.num_io_pad_vctrls = ARRAY_SIZE(tegra186_io_pad_vctrls),
+	.io_pad_vctrls = tegra186_io_pad_vctrls,
 	.num_pin_descs = ARRAY_SIZE(tegra186_pin_descs),
 	.pin_descs = tegra186_pin_descs,
 	.regs = &tegra186_pmc_regs,
@@ -4192,55 +4225,62 @@ static const struct tegra_pmc_soc tegra186_pmc_soc = {
 };
 
 static const struct tegra_io_pad_soc tegra194_io_pads[] = {
-	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIA, 0, 0x74, 0x78, UINT_MAX, "csia"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIB, 1, 0x74, 0x78, UINT_MAX, "csib"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_MIPI_BIAS, 3, 0x74, 0x78, UINT_MAX, "mipi-bias"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_PEX_CLK_BIAS, 4, 0x74, 0x78, UINT_MAX, "pex-clk-bias"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_PEX_CLK3, 5, 0x74, 0x78, UINT_MAX, "pex-clk3"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_PEX_CLK2, 6, 0x74, 0x78, UINT_MAX, "pex-clk2"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_PEX_CLK1, 7, 0x74, 0x78, UINT_MAX, "pex-clk1"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_EQOS, 8, 0x74, 0x78, UINT_MAX, "eqos"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_PEX_CLK_2_BIAS, 9, 0x74, 0x78, UINT_MAX, "pex-clk-2-bias"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_PEX_CLK_2, 10, 0x74, 0x78, UINT_MAX, "pex-clk-2"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_DAP3, 11, 0x74, 0x78, UINT_MAX, "dap3"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_DAP5, 12, 0x74, 0x78, UINT_MAX, "dap5"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_UART, 14, 0x74, 0x78, UINT_MAX, "uart"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_PWR_CTL, 15, 0x74, 0x78, UINT_MAX, "pwr-ctl"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_SOC_GPIO53, 16, 0x74, 0x78, UINT_MAX, "soc-gpio53"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_AUDIO, 17, 0x74, 0x78, UINT_MAX, "audio"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_GP_PWM2, 18, 0x74, 0x78, UINT_MAX, "gp-pwm2"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_GP_PWM3, 19, 0x74, 0x78, UINT_MAX, "gp-pwm3"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_SOC_GPIO12, 20, 0x74, 0x78, UINT_MAX, "soc-gpio12"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_SOC_GPIO13, 21, 0x74, 0x78, UINT_MAX, "soc-gpio13"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_SOC_GPIO10, 22, 0x74, 0x78, UINT_MAX, "soc-gpio10"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_UART4, 23, 0x74, 0x78, UINT_MAX, "uart4"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_UART5, 24, 0x74, 0x78, UINT_MAX, "uart5"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_DBG, 25, 0x74, 0x78, UINT_MAX, "dbg"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_HDMI_DP3, 26, 0x74, 0x78, UINT_MAX, "hdmi-dp3"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_HDMI_DP2, 27, 0x74, 0x78, UINT_MAX, "hdmi-dp2"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_HDMI_DP0, 28, 0x74, 0x78, UINT_MAX, "hdmi-dp0"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_HDMI_DP1, 29, 0x74, 0x78, UINT_MAX, "hdmi-dp1"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_PEX_CNTRL, 0, 0x7c, 0x80, UINT_MAX, "pex-cntrl"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_PEX_CTL2, 1, 0x7c, 0x80, UINT_MAX, "pex-ctl2"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_PEX_L0_RST, 2, 0x7c, 0x80, UINT_MAX, "pex-l0-rst"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_PEX_L1_RST, 3, 0x7c, 0x80, UINT_MAX, "pex-l1-rst"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_SDMMC4, 4, 0x7c, 0x80, UINT_MAX, "sdmmc4"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_PEX_L5_RST, 5, 0x7c, 0x80, UINT_MAX, "pex-l5-rst"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_CAM, 6, 0x7c, 0x80, UINT_MAX, "cam"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIC, 11, 0x7c, 0x80, UINT_MAX, "csic"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_CSID, 12, 0x7c, 0x80, UINT_MAX, "csid"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIE, 13, 0x7c, 0x80, UINT_MAX, "csie"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIF, 14, 0x7c, 0x80, UINT_MAX, "csif"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_SPI, 15, 0x7c, 0x80, UINT_MAX, "spi"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_UFS, 17, 0x7c, 0x80, UINT_MAX, "ufs"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIG, 18, 0x7c, 0x80, UINT_MAX, "csig"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIH, 19, 0x7c, 0x80, UINT_MAX, "csih"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_EDP, 21, 0x7c, 0x80, UINT_MAX, "edp"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_SDMMC1_HV, 23, 0x7c, 0x80, 4, "sdmmc1-hv"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_SDMMC3_HV, 24, 0x7c, 0x80, 6, "sdmmc3-hv"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_CONN, 28, 0x7c, 0x80, UINT_MAX, "conn"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_AUDIO_HV, 29, 0x7c, 0x80, 1, "audio-hv"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_AO_HV, UINT_MAX, UINT_MAX, UINT_MAX, 0, "ao-hv"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIA, 0, 0x74, 0x78, "csia"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIB, 1, 0x74, 0x78, "csib"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_MIPI_BIAS, 3, 0x74, 0x78, "mipi-bias"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_PEX_CLK_BIAS, 4, 0x74, 0x78, "pex-clk-bias"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_PEX_CLK3, 5, 0x74, 0x78, "pex-clk3"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_PEX_CLK2, 6, 0x74, 0x78, "pex-clk2"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_PEX_CLK1, 7, 0x74, 0x78, "pex-clk1"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_EQOS, 8, 0x74, 0x78, "eqos"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_PEX_CLK_2_BIAS, 9, 0x74, 0x78, "pex-clk-2-bias"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_PEX_CLK_2, 10, 0x74, 0x78, "pex-clk-2"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_DAP3, 11, 0x74, 0x78, "dap3"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_DAP5, 12, 0x74, 0x78, "dap5"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_UART, 14, 0x74, 0x78, "uart"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_PWR_CTL, 15, 0x74, 0x78, "pwr-ctl"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_SOC_GPIO53, 16, 0x74, 0x78, "soc-gpio53"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_AUDIO, 17, 0x74, 0x78, "audio"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_GP_PWM2, 18, 0x74, 0x78, "gp-pwm2"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_GP_PWM3, 19, 0x74, 0x78, "gp-pwm3"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_SOC_GPIO12, 20, 0x74, 0x78, "soc-gpio12"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_SOC_GPIO13, 21, 0x74, 0x78, "soc-gpio13"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_SOC_GPIO10, 22, 0x74, 0x78, "soc-gpio10"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_UART4, 23, 0x74, 0x78, "uart4"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_UART5, 24, 0x74, 0x78, "uart5"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_DBG, 25, 0x74, 0x78, "dbg"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_HDMI_DP3, 26, 0x74, 0x78, "hdmi-dp3"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_HDMI_DP2, 27, 0x74, 0x78, "hdmi-dp2"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_HDMI_DP0, 28, 0x74, 0x78, "hdmi-dp0"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_HDMI_DP1, 29, 0x74, 0x78, "hdmi-dp1"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_PEX_CNTRL, 0, 0x7c, 0x80, "pex-cntrl"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_PEX_CTL2, 1, 0x7c, 0x80, "pex-ctl2"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_PEX_L0_RST, 2, 0x7c, 0x80, "pex-l0-rst"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_PEX_L1_RST, 3, 0x7c, 0x80, "pex-l1-rst"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_SDMMC4, 4, 0x7c, 0x80, "sdmmc4"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_PEX_L5_RST, 5, 0x7c, 0x80, "pex-l5-rst"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_CAM, 6, 0x7c, 0x80, "cam"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIC, 11, 0x7c, 0x80, "csic"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_CSID, 12, 0x7c, 0x80, "csid"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIE, 13, 0x7c, 0x80, "csie"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIF, 14, 0x7c, 0x80, "csif"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_SPI, 15, 0x7c, 0x80, "spi"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_UFS, 17, 0x7c, 0x80, "ufs"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIG, 18, 0x7c, 0x80, "csig"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIH, 19, 0x7c, 0x80, "csih"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_EDP, 21, 0x7c, 0x80, "edp"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_SDMMC1_HV, 23, 0x7c, 0x80, "sdmmc1-hv"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_SDMMC3_HV, 24, 0x7c, 0x80, "sdmmc3-hv"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_CONN, 28, 0x7c, 0x80, "conn"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_AUDIO_HV, 29, 0x7c, 0x80, "audio-hv"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_AO_HV, UINT_MAX, UINT_MAX, UINT_MAX, "ao-hv"),
+};
+
+static const struct tegra_io_pad_vctrl tegra194_io_pad_vctrls[] = {
+	TEGRA_IO_PAD_VCTRL(TEGRA_IO_PAD_SDMMC1_HV, PMC_IMPL_E_33V_PWR, 4),
+	TEGRA_IO_PAD_VCTRL(TEGRA_IO_PAD_SDMMC3_HV, PMC_IMPL_E_33V_PWR, 6),
+	TEGRA_IO_PAD_VCTRL(TEGRA_IO_PAD_AUDIO_HV, PMC_IMPL_E_33V_PWR, 1),
+	TEGRA_IO_PAD_VCTRL(TEGRA_IO_PAD_AO_HV, PMC_IMPL_E_33V_PWR, 0),
 };
 
 static const struct pinctrl_pin_desc tegra194_pin_descs[] = {
@@ -4363,6 +4403,8 @@ static const struct tegra_pmc_soc tegra194_pmc_soc = {
 	.maybe_tz_only = false,
 	.num_io_pads = ARRAY_SIZE(tegra194_io_pads),
 	.io_pads = tegra194_io_pads,
+	.num_io_pad_vctrls = ARRAY_SIZE(tegra194_io_pad_vctrls),
+	.io_pad_vctrls = tegra194_io_pad_vctrls,
 	.num_pin_descs = ARRAY_SIZE(tegra194_pin_descs),
 	.pin_descs = tegra194_pin_descs,
 	.regs = &tegra194_pmc_regs,
@@ -4387,21 +4429,28 @@ static const struct tegra_pmc_soc tegra194_pmc_soc = {
 };
 
 static const struct tegra_io_pad_soc tegra234_io_pads[] = {
-	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIA, 0, 0xe0c0, 0xe0c4, UINT_MAX, "csia"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIB, 1, 0xe0c0, 0xe0c4, UINT_MAX, "csib"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_HDMI_DP0, 0, 0xe0d0, 0xe0d4, UINT_MAX, "hdmi-dp0"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIC, 2, 0xe0c0, 0xe0c4, UINT_MAX, "csic"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_CSID, 3, 0xe0c0, 0xe0c4, UINT_MAX, "csid"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIE, 4, 0xe0c0, 0xe0c4, UINT_MAX, "csie"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIF, 5, 0xe0c0, 0xe0c4, UINT_MAX, "csif"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_UFS, 0, 0xe064, 0xe068, UINT_MAX, "ufs"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_EDP, 1, 0xe05c, 0xe060, UINT_MAX, "edp"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_SDMMC1_HV, 0, 0xe054, 0xe058, 4, "sdmmc1-hv"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_SDMMC3_HV, UINT_MAX, UINT_MAX, UINT_MAX, 6, "sdmmc3-hv"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_AUDIO_HV, UINT_MAX, UINT_MAX, UINT_MAX, 1, "audio-hv"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_AO_HV, UINT_MAX, UINT_MAX, UINT_MAX, 0, "ao-hv"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIG, 6, 0xe0c0, 0xe0c4, UINT_MAX, "csig"),
-	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIH, 7, 0xe0c0, 0xe0c4, UINT_MAX, "csih"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIA, 0, 0xe0c0, 0xe0c4, "csia"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIB, 1, 0xe0c0, 0xe0c4, "csib"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_HDMI_DP0, 0, 0xe0d0, 0xe0d4, "hdmi-dp0"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIC, 2, 0xe0c0, 0xe0c4, "csic"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_CSID, 3, 0xe0c0, 0xe0c4, "csid"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIE, 4, 0xe0c0, 0xe0c4, "csie"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIF, 5, 0xe0c0, 0xe0c4, "csif"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_UFS, 0, 0xe064, 0xe068, "ufs"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_EDP, 1, 0xe05c, 0xe060, "edp"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_SDMMC1_HV, 0, 0xe054, 0xe058, "sdmmc1-hv"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_SDMMC3_HV, UINT_MAX, UINT_MAX, UINT_MAX, "sdmmc3-hv"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_AUDIO_HV, UINT_MAX, UINT_MAX, UINT_MAX, "audio-hv"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_AO_HV, UINT_MAX, UINT_MAX, UINT_MAX, "ao-hv"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIG, 6, 0xe0c0, 0xe0c4, "csig"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIH, 7, 0xe0c0, 0xe0c4, "csih"),
+};
+
+static const struct tegra_io_pad_vctrl tegra234_io_pad_vctrls[] = {
+	TEGRA_IO_PAD_VCTRL(TEGRA_IO_PAD_SDMMC1_HV, PMC_IMPL_E_33V_PWR, 4),
+	TEGRA_IO_PAD_VCTRL(TEGRA_IO_PAD_SDMMC3_HV, PMC_IMPL_E_33V_PWR, 6),
+	TEGRA_IO_PAD_VCTRL(TEGRA_IO_PAD_AUDIO_HV, PMC_IMPL_E_33V_PWR, 1),
+	TEGRA_IO_PAD_VCTRL(TEGRA_IO_PAD_AO_HV, PMC_IMPL_E_33V_PWR, 0),
 };
 
 static const struct pinctrl_pin_desc tegra234_pin_descs[] = {
@@ -4510,6 +4559,8 @@ static const struct tegra_pmc_soc tegra234_pmc_soc = {
 	.maybe_tz_only = false,
 	.num_io_pads = ARRAY_SIZE(tegra234_io_pads),
 	.io_pads = tegra234_io_pads,
+	.num_io_pad_vctrls = ARRAY_SIZE(tegra234_io_pad_vctrls),
+	.io_pad_vctrls = tegra234_io_pad_vctrls,
 	.num_pin_descs = ARRAY_SIZE(tegra234_pin_descs),
 	.pin_descs = tegra234_pin_descs,
 	.regs = &tegra234_pmc_regs,
-- 
2.43.0

