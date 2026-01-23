Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012049.outbound.protection.outlook.com [40.107.200.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD6737E308;
	Fri, 23 Jan 2026 09:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769162093; cv=fail; b=D+2ezUgojHj6w73Sc+mUsJCbdIc32X4oExnT1L/16u9q4VeozIqA9LT6rUo8gdr3cxfxJVL6XNLmLhW0royDHinw3+m1Bc2INV+ylYqEoNMfVOS7YzzHyXIOYVu+qEubWOUlvhKxL42UDvB5ED2qydnIPSUJ1FTPkvouo2qyD+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769162093; c=relaxed/simple;
	bh=+CT/lmkR6dhQ3ifCKmhkVZSvC37wgqzoYrVTukcATZQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ihWtZ5D3oLguud/KnR2XkC4tXHQ8rea05tfAxiShGO2ucNm7hJUfEkP+SVfe2SM/ABnLu0Wr1kqs2LNQv/ST8UAhc+r8HQ1aNzRTMOblQucXNu8sWR+F7yZynapnXdj9XfHhfeWn+7XhPsZj7B0Y+rB1qHpAsd4n+m0lYlao+7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mBWK27TS; arc=fail smtp.client-ip=40.107.200.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mBWK27TS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JlpmVyPhpnpukVTX59vWV4dITidhBqmzseoIO/wFYyo0/ZztKMz9l/qw0GX0p/WyWOj0XSQM7B5SJ2FBpVGo+a2oIbP+wUEhQ9w9ktrBgcfFQH8PE8V+eXtOf+G6KyD4bPGg5XgqMFtxjnOvkqYruAzsFRPhzL9w4VnwAipCoFTRnwxsZq7756cRPL9MQt8lIQXHhpCawJ1WgeNJ/Z44stAabCwYz/EWOBGCugXTV3lS8yY3x6MwEWsT7UC6+onCVmF/8cNffZ7ssBzaB63nX32wE8SxclgXbT304HQWlIxTM7OVhuxB6lZz6pPRcZlNDO3aedUIfqFydvI1+eoFXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tRJDhCxeA/gIHIQIssjXNwraCYXbHV/4aZZPcadTzt8=;
 b=osSJjIBV8PrjlnAdOgjUPxSjfMhhIrpObtwHH3jI0qX+xXhoOUtKpK5bPjwf8joa4MBB1wRSK56EFssxbLzYCuJWH3O4lasUFjEPqW0ma558CsL85VurAhe+PMV+URKVje6EFYtyxdli7fDiCLXJVhKAq8mFhEfLKCcEHicR+aE+uDQ9MK4jo0BQC/PzxFhdjP5mziJWkkPwvrw/jLTGucsaU2CWj94hTQkKj1Vn2h1Zf8XR3mErUJNspuP7qiLLmizYt+XQl59U9SsWZ4+CgZlXB9d7vI8eC3M99FFjYf2fu0YFa7Rcx9Q3Xeq5W8JyLKRLY9xlc5yw+QCmt/eGWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tRJDhCxeA/gIHIQIssjXNwraCYXbHV/4aZZPcadTzt8=;
 b=mBWK27TSF70EYBK7L2aKiIW9z9mVNCW+osjylAkUBIT2paReVKQajhbHRPQm1jlx9KWlT5ttz+mM8RGzRd7b7vV48UNr+14rtGiBecvqi1LdR1G/63wikVWw5XQdczfi74gP3FU7PBOEnc5Xjsxk362tg580WvLRWEZIgxwHyenmyXAC+eeiZjT1fvr5Moid8dIiLkZHwsbu21hBcP9ENLnh/H/Q8hqI/JS1hQrVgFYU+27FtJZIyrsGMR609t3KXgp3rzXxfNfpzR7liXOFmo7vKaEhlkXGRW2WwEUa8oKgsPdpLPiyljXTy5TAkPqYrsZo1nP/xwsFl91qI8xxoQ==
Received: from DM6PR03CA0099.namprd03.prod.outlook.com (2603:10b6:5:333::32)
 by CH3PR12MB7689.namprd12.prod.outlook.com (2603:10b6:610:14d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Fri, 23 Jan
 2026 09:54:37 +0000
Received: from CY4PEPF0000EDD7.namprd03.prod.outlook.com
 (2603:10b6:5:333:cafe::9d) by DM6PR03CA0099.outlook.office365.com
 (2603:10b6:5:333::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Fri,
 23 Jan 2026 09:54:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000EDD7.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 09:54:37 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 01:54:22 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 01:54:21 -0800
Received: from sheetal.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Fri, 23 Jan 2026 01:54:17 -0800
From: "Sheetal ." <sheetal@nvidia.com>
To: Mark Brown <broonie@kernel.org>
CC: Sander Vanheule <sander@svanheule.net>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Thierry
 Reding" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
	Mohan kumar <mkumard@nvidia.com>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Sheetal
	<sheetal@nvidia.com>
Subject: [RFC PATCH v3 2/4] regmap: Add reg_default_cb callback for flat cache defaults
Date: Fri, 23 Jan 2026 15:23:44 +0530
Message-ID: <20260123095346.1258556-3-sheetal@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260123095346.1258556-1-sheetal@nvidia.com>
References: <20260123095346.1258556-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD7:EE_|CH3PR12MB7689:EE_
X-MS-Office365-Filtering-Correlation-Id: e1d925ae-709e-4ece-0080-08de5a656b77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JreJGHu6i8uPjYWlxfurwW5V8YkmQyewaRuY7Hs+V2kfdmXD2jTDCedKnw0T?=
 =?us-ascii?Q?7Qn1npZpCgu0L5YfnNo8GCoy4AMiSURPcaiz2C76wztamyqhqsRvQizIUe3v?=
 =?us-ascii?Q?HnNIpXxuNAocvEnct7RccpWXJX0uxb4CCOW5zH5G/4dYRVDVnzH4od6LSU1p?=
 =?us-ascii?Q?7tTmcrnvrHPykyEIzCDsOfkZHaMLT4TdAHpVcnLTEC6ZI97kVVS+dXQ8h2RS?=
 =?us-ascii?Q?PvBzFpUuMqkyKaoK/wl+VH1TipSkl2FTBxM79b5hCacxLlMDbs3lR9rIyb0a?=
 =?us-ascii?Q?On0rKdh0k4h3d6UpCNShNTQCBu3jgvu1HovqPoSoYDrGZW8oWpq+f8/i4Gzz?=
 =?us-ascii?Q?HXfrc0fdhqo7s+cqI6BtELI++hy8TpX66y75HE1U8mWYtXqV9nH9yKOD0TRS?=
 =?us-ascii?Q?k4N5w40nJpVgTwSut7UEEOJjfBb53Wj+MskljlHx09K0/Je1wOss3hr/K5gK?=
 =?us-ascii?Q?tWkDrVaTd4R1h2168zyk2NdMkRtVsiUrbpidejBzxaXouNGR4qPdUfnDdVb8?=
 =?us-ascii?Q?cXYcmih7RQK3/fQ6F878YzYs4hAVZzjVwAkatbBK1Gckzh7Tqi5uTossq6SN?=
 =?us-ascii?Q?48n4BwoxXMwxbt/Jc+4dDRCzCDLtttvZGQpEjFwAZL+tjbhu/2MYAs4rpL66?=
 =?us-ascii?Q?9e7BQBh+BFXCwmdZgTD/tQLFxwOqPsZNJYHnWrxECT+QlKEfpqHierV2922J?=
 =?us-ascii?Q?ERVnEQJDTkopCRiIvQ7qHB9/BpP5PVQzdRfhMUxXc6kRS4fXFEe7/XePeyvv?=
 =?us-ascii?Q?e6c1ByTsh8veSUw0mcyodTKXi//FbuZk9oITsdIOOXwgW4IsooSrjvNiDVH0?=
 =?us-ascii?Q?7+1CqBwCsM2AzJHDBmdaW67B+WhQlkAFS7zfE3J8N6oI2a9EddOJjGsryqfL?=
 =?us-ascii?Q?yfYYmyoRjUiVB3xvWHaU52wzRkwJMCmzKUfl6MCM01AaG/NdZRxskPxUnp3m?=
 =?us-ascii?Q?LrOi7S4uEr+qtBNuBzc2dn8YIIY4cVpiwwISvpKnnEImGEd9hjEeeYj2yBNq?=
 =?us-ascii?Q?vDiHSoQuAyK/iUtjfwaHP34P8tRCD7rTbJd8YrHYoLyLBRa0ZWFkuCFe8CKE?=
 =?us-ascii?Q?fFTtrc9eGTopTyKD/RagduOB6h1imWFE0+kce1q1D69FdPoVo+EiQfxkudGA?=
 =?us-ascii?Q?ZrFv8/CU/QySLPBhwAH4REixTs1ZxNWD0OsTuciov4/K6ntD6Q3+6l6UujW4?=
 =?us-ascii?Q?NXpv6a0yBGlife8Iyshn8AyGOiKTLhnE8Ring/6CmIl2zsQXGRDE0j++S0Rn?=
 =?us-ascii?Q?qcChxmSsJbaZ/f3a1zajlIBiIwgoS390vSfBOhcqSzZn7QlIaeSYgCecjaeO?=
 =?us-ascii?Q?schwquSHarPPuwgc00t2/ZCXoMOjVIOiA85Qd6Gv8x+W7jVmB6q8zUUAdN8Y?=
 =?us-ascii?Q?haGpr6rVSGvxLuKq7Va5E5LwR508sZkoTXsJKi/CsAbC+PN4BqanecRc83qW?=
 =?us-ascii?Q?W78pE2IjzvsA9yMzGiqMds65nhE91xYIJeCqtTbECEargbLR5lA3rpAdVWff?=
 =?us-ascii?Q?9edRiDRYH3ahv1bSmbaatP+kAxBm1zW/VoM2XUAAcZn/NgbMT2ZnWoDs51NO?=
 =?us-ascii?Q?V2IdJIw0PufluY9EHXzrpa1VdMlW6jgFeGy2oM/vygc30uYrVfl4L+0monx+?=
 =?us-ascii?Q?9NgVi+tWdmAWvc/d24j8Sp1PJZweZQZeg0OcK2lc2OTuqWPX2X5DC1Ncx5qT?=
 =?us-ascii?Q?GcHoPg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(7416014)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 09:54:37.3039
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1d925ae-709e-4ece-0080-08de5a656b77
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7689

From: Sheetal <sheetal@nvidia.com>

Commit e062bdfdd6ad ("regmap: warn users about uninitialized flat cache")
warns when REGCACHE_FLAT is used without full defaults. This causes
false positives on hardware where many registers reset to zero but are
not listed in reg_defaults, forcing drivers to maintain large tables
just to silence the warning.

Add a reg_default_cb() hook so drivers can supply defaults for registers
not present in reg_defaults when populating REGCACHE_FLAT. This keeps
the warning quiet for known zero-reset registers without bloating
tables. Provide a generic regmap_default_zero_cb() helper for drivers
that need zero defaults.

The hook is only used for REGCACHE_FLAT; the core does not
check readable/writeable access, so drivers must provide readable_reg/
writeable_reg callbacks and handle holes in the register map.

Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 drivers/base/regmap/internal.h      |  3 +++
 drivers/base/regmap/regcache-flat.c | 19 +++++++++++++++++++
 drivers/base/regmap/regcache.c      |  3 ++-
 drivers/base/regmap/regmap.c        |  2 ++
 include/linux/regmap.h              | 14 ++++++++++++++
 5 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/base/regmap/internal.h b/drivers/base/regmap/internal.h
index 1477329410ec..5bf993165438 100644
--- a/drivers/base/regmap/internal.h
+++ b/drivers/base/regmap/internal.h
@@ -117,6 +117,9 @@ struct regmap {
 		    void *val_buf, size_t val_size);
 	int (*write)(void *context, const void *data, size_t count);
 
+	int (*reg_default_cb)(struct device *dev, unsigned int reg,
+			      unsigned int *val);
+
 	unsigned long read_flag_mask;
 	unsigned long write_flag_mask;
 
diff --git a/drivers/base/regmap/regcache-flat.c b/drivers/base/regmap/regcache-flat.c
index 53cc59c84e2f..c924817e19b1 100644
--- a/drivers/base/regmap/regcache-flat.c
+++ b/drivers/base/regmap/regcache-flat.c
@@ -79,6 +79,25 @@ static int regcache_flat_populate(struct regmap *map)
 		__set_bit(index, cache->valid);
 	}
 
+	if (map->reg_default_cb) {
+		dev_dbg(map->dev,
+			"Populating regcache_flat using reg_default_cb callback\n");
+
+		for (i = 0; i <= map->max_register; i += map->reg_stride) {
+			unsigned int index = regcache_flat_get_index(map, i);
+			unsigned int value;
+
+			if (test_bit(index, cache->valid))
+				continue;
+
+			if (map->reg_default_cb(map->dev, i, &value))
+				continue;
+
+			cache->data[index] = value;
+			__set_bit(index, cache->valid);
+		}
+	}
+
 	return 0;
 }
 
diff --git a/drivers/base/regmap/regcache.c b/drivers/base/regmap/regcache.c
index 319c342bf5a0..31bdbf37dbed 100644
--- a/drivers/base/regmap/regcache.c
+++ b/drivers/base/regmap/regcache.c
@@ -223,7 +223,8 @@ int regcache_init(struct regmap *map, const struct regmap_config *config)
 			goto err_free;
 	}
 
-	if (map->num_reg_defaults && map->cache_ops->populate) {
+	if (map->cache_ops->populate &&
+	    (map->num_reg_defaults || map->reg_default_cb)) {
 		dev_dbg(map->dev, "Populating %s cache\n", map->cache_ops->name);
 		map->lock(map->lock_arg);
 		ret = map->cache_ops->populate(map);
diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index ce9be3989a21..57c5551044ed 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -811,6 +811,7 @@ struct regmap *__regmap_init(struct device *dev,
 	map->precious_reg = config->precious_reg;
 	map->writeable_noinc_reg = config->writeable_noinc_reg;
 	map->readable_noinc_reg = config->readable_noinc_reg;
+	map->reg_default_cb = config->reg_default_cb;
 	map->cache_type = config->cache_type;
 
 	spin_lock_init(&map->async_lock);
@@ -1433,6 +1434,7 @@ int regmap_reinit_cache(struct regmap *map, const struct regmap_config *config)
 	map->precious_reg = config->precious_reg;
 	map->writeable_noinc_reg = config->writeable_noinc_reg;
 	map->readable_noinc_reg = config->readable_noinc_reg;
+	map->reg_default_cb = config->reg_default_cb;
 	map->cache_type = config->cache_type;
 
 	ret = regmap_set_name(map, config);
diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index b0b9be750d93..51940eeff872 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -359,6 +359,10 @@ typedef void (*regmap_unlock)(void *);
  * @reg_defaults: Power on reset values for registers (for use with
  *                register cache support).
  * @num_reg_defaults: Number of elements in reg_defaults.
+ * @reg_default_cb: Optional callback to return default values for registers
+ *                  not listed in reg_defaults. This is only used for
+ *                  REGCACHE_FLAT population; drivers must ensure the readable_reg/
+ *                  writeable_reg callbacks are defined to handle holes.
  *
  * @read_flag_mask: Mask to be set in the top bytes of the register when doing
  *                  a read.
@@ -449,6 +453,8 @@ struct regmap_config {
 	const struct regmap_access_table *rd_noinc_table;
 	const struct reg_default *reg_defaults;
 	unsigned int num_reg_defaults;
+	int (*reg_default_cb)(struct device *dev, unsigned int reg,
+			      unsigned int *def);
 	enum regcache_type cache_type;
 	const void *reg_defaults_raw;
 	unsigned int num_reg_defaults_raw;
@@ -1349,6 +1355,14 @@ static inline int regmap_write_bits(struct regmap *map, unsigned int reg,
 	return regmap_update_bits_base(map, reg, mask, val, NULL, false, true);
 }
 
+static inline int regmap_default_zero_cb(struct device *dev,
+					 unsigned int reg,
+					 unsigned int *def)
+{
+	*def = 0;
+	return 0;
+}
+
 int regmap_get_val_bytes(struct regmap *map);
 int regmap_get_max_register(struct regmap *map);
 int regmap_get_reg_stride(struct regmap *map);
-- 
2.34.1

