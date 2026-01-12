Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011024.outbound.protection.outlook.com [40.107.208.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B8F30EF66;
	Mon, 12 Jan 2026 04:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768192276; cv=fail; b=Sgz5GpjeaW2j9LIqW6+WocVX4MCOI6156/JRLO4cbHLY3pIbgr4Qz3Yl+qjCD6pbcabYlGyLesXP/d2F8JxM1QWztKD+ZBOA5C5Y/lW42k/SvOWpglElCmzwz/zTQLfiZNhow5tmtWK0jwELSmk5Od7x0Bx7sGAb0y8sJqcVaQg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768192276; c=relaxed/simple;
	bh=NPXxlIDiNnLPrF7zvb8NfTwNU40a/+vELL7lulrDgkw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Yt9EQhGRwggBRwLFP7dijNkkAcOsa9pGXYA87QkWbkxC5QDmgMjhSurrvUzdpaNApeKwwx5ttVh7D1PY2b/XGsLNP7pRMScYd+0WwxCUez8/NAyuBCOI386N5vCDtRjZJ9B4EJ/JKRu9CfeLp+kTPtHpt3d2niGK6Ems7qW72IQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GT4hDQID; arc=fail smtp.client-ip=40.107.208.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GT4hDQID"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oYhbyhKEn4N+/buSuOo8CnkAkrDFHYcOXk8vMhfPI2HCcq3b9xGDeByVGjOC4PMNzxcq0Z34bG1l2ZD8vmVCb4LXm6O6uA09niSn/DqHkFqUU1ti83qk157uVPAIKlW7jU0QRTiTAPvBoL+/X3v2VkUaM7SC2YFgXffA5TCXaFmwx1UydG//GcM6wTkJglPesxG9CBokL5LYKU/zc+cDcLQBV97Kfv3Td7P8AN2hr0RIyXmNTc8/5ZmGk/OkPEfVswF0QGmbfLKb8keLFQ7MWBbcBGNbuOqMnrnl/j3PbuNOm8igD2Ow2dysW06G1CBY7VvTx1uTwAQlgB/vGLpAng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mLN05YuOErO20dd3+mhEBofp/tdf/yEPe+MC1wXbJ/E=;
 b=o6eDJk81HUZaz64q6v/zIa+lPLcXlebRhUxdLwavDqWSkugVrB9qkEvmOzKH+HARXL/yKx9iEWvbTADtTiRSiYFn/f5aZiwUTS8ZixH9WVZApU1UQH8kWPCvhOBNoWp1eds5KOeHmbmFW6utfTGpPlpi3QV2xXkWhUZjfewu3ci9LlixYEOVOTvIjR91geSFMpTXbfkvG880wsqgl2Dl2tKR61uoxQMt3JQvfItN+P8thSyUI+/5iEWwzZlLO0feROfBg264+yjQ1ZLoJBNRWsHcpz/HS7hOTMvsRQ6mDvxsxvM6DkcRJoyxhKx3nn1maCMU4AsSOkEJvndiRG5Qvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mLN05YuOErO20dd3+mhEBofp/tdf/yEPe+MC1wXbJ/E=;
 b=GT4hDQIDEBoLVGXXVU8btS3SExce8+VKCvZ1tUSyR8D5J7Fns4r/5EjCDsUvykdP000OW7nvwMkgNYadJML/XPo1F6M0e/Aq/RLnrx6YMvSA8HTw/mmEXIxySLTACvOoK1Fr+X+5fCAh49NN+gxr96rhPjc2/y2I+xKzsJbVj4nnTk+zebirsa6x6ljaxLfJmaLKKiYLmqhLUHuMdA74fjmRYKaca7dpiUk86kxHVopJS2COpGL9R5n1TkWRpj4OjUrrGUzyFAt89c05t9BZr+m0ARps43lk4OEAwbfHPGsQ8c8clS72S9oN1Fpey1JzDvZH4OYJmU//haDErIkZbg==
Received: from PH0PR07CA0024.namprd07.prod.outlook.com (2603:10b6:510:5::29)
 by SA0PR12MB4416.namprd12.prod.outlook.com (2603:10b6:806:99::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 04:30:58 +0000
Received: from CY4PEPF0000E9D3.namprd03.prod.outlook.com
 (2603:10b6:510:5:cafe::7f) by PH0PR07CA0024.outlook.office365.com
 (2603:10b6:510:5::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Mon,
 12 Jan 2026 04:30:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000E9D3.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Mon, 12 Jan 2026 04:30:58 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 11 Jan
 2026 20:30:39 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 11 Jan
 2026 20:30:39 -0800
Received: from sheetal.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Sun, 11 Jan 2026 20:30:34 -0800
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
Subject: [RFC PATCH v2 2/3] regmap: Add KUnit test for flat_cache_default_is_zero
Date: Mon, 12 Jan 2026 09:58:40 +0530
Message-ID: <20260112042841.51799-3-sheetal@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260112042841.51799-1-sheetal@nvidia.com>
References: <20260112042841.51799-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D3:EE_|SA0PR12MB4416:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d873298-6d9b-452e-03dd-08de51936253
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qUEtFjZpIcqB4EmASZivWTrYgoba7w89NbsAgkfis1G0/qBT1AU4V2waPy7C?=
 =?us-ascii?Q?tdXlmZh/F9IweS8O50Lr4IXYl6qhvxDx+WkKaNchPnhm5coOikg2lNsQt0oJ?=
 =?us-ascii?Q?cR4XbujwUPBTRIevWx53VFKQqSYMFFZ1tEk/lHTmfUDE5Come/EfDTcrUeJ0?=
 =?us-ascii?Q?5uhVG2KSGLovoMC58FIzHeuWauKMkIhsv15thWpg6Pn/23iIT245jPMhYWL4?=
 =?us-ascii?Q?+5MAiUI9h4mcZnR+scMMUQeinuSIUEN1zFevcAvGlI4dzoK7rpcpCXS1JMPS?=
 =?us-ascii?Q?WbBkfYIDIKgiyraHWG/T9ORVUJN9uBGTAe2fyizFpCt6szuDwK30KeXsUkJN?=
 =?us-ascii?Q?BXJIBaWVqIZXfd2J2APMXKZs0Z2Hi1nPEBhmgu1dSbgJrntdXiXWvQarPf6z?=
 =?us-ascii?Q?R5bvqHszT65Yl9+hFEllb7to9XWBlrOld5JD83BLxLQ8dvrJfjWjjt/B3jvw?=
 =?us-ascii?Q?EoD0XgDUe8b4UlwR51mHbyXyWf6NbbV/zqt0lqhQNr0b5cJN9WC+xBb3xeX4?=
 =?us-ascii?Q?7PTzYP0evRdsn2FhmxsTn7D59onEnLbkqap2Sf1fhLinHsaDOxNxfc0xgor4?=
 =?us-ascii?Q?Y51ocSz4yWvHCluUS6krIcJET3oZX0FZBsnhdcRBpFF2CSYvOc5ZEF9QBJ7c?=
 =?us-ascii?Q?yUjK3D+aUANvIqrg8vPGNTOphaz4tkb+ItQcu8BCZqTD6GK+p3TV0hLEplJo?=
 =?us-ascii?Q?rM65tUx9ZD4btX9qI9thps5loOTtVHmjTXOt2ZVGsvqJSVTXvwh2XwoV8XRj?=
 =?us-ascii?Q?GFsOZfnxhbTSlTei6AZg4r3k96u2TnKavGV2/9wiS+6RA5ArIR2y7+yXDelo?=
 =?us-ascii?Q?xO1BsI0q8IuK14bZ5Gw+C5PB316LwsnP52uOiWXqudy6wJUgsfe9OqtfZble?=
 =?us-ascii?Q?n5mbXV5fk2gkjZu5k+pfHDvqXYu647f8GYQCl4sESU7ZwODnP3uWPegP2tKh?=
 =?us-ascii?Q?SlVZo1bm6BaeH1quibjM2QEqgJQMEDaiwUvpe/Y4Ns2WvnR58P/sGoH75yKd?=
 =?us-ascii?Q?Toco8sYEzWkTM240K7zwLx3mp42IEqjk8FNpSxrS6jTtmiH7yqh0F8RFHFwn?=
 =?us-ascii?Q?n5/WJoQdZfrrExzmFfBO7BgVC0a6aASnryfj5Yk8kk1zx9HRf/o7JNa7BY8j?=
 =?us-ascii?Q?si+kQdDTekCdhdPzF8gJqhnpg0UHFenqr79EPkDfTorE0f+TvgbC3kgyTIpK?=
 =?us-ascii?Q?RSsm/YRSXCHK5exaUIa0cmO4lqlS3UncdwrOmWv/eat8LZVSziUQaWHFKXjn?=
 =?us-ascii?Q?/QmikHEYzpBIYcBwUXZW8FssqM+CuFsgreJt0tK1/F4cZkvpr/wzPndEEj/C?=
 =?us-ascii?Q?4ptxq5KzwwvhlXTH8c+piRLff35rG3Ll2v38tckOd5hQ3SX01fjoNaFIqHVD?=
 =?us-ascii?Q?dflNA+089BQmAGk7NWmYXrUZcLqCnXYcoR/iuv3xm9aqvB4k3Y9oFSnmKcsB?=
 =?us-ascii?Q?siiNWWhzvlukg5V+a4wb8RMcqxnji8xpssK5BU4TaWuxU4ZwR1stYqNGjBhn?=
 =?us-ascii?Q?SpRPiwcn1n8tKX0/twKxLnatwknlwxXdkUj/F/kUsE5DuvO7r9RPJ6NeyRly?=
 =?us-ascii?Q?2NcxLl74sqkYU0bbUFg=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 04:30:58.3363
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d873298-6d9b-452e-03dd-08de51936253
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4416

From: Sheetal <sheetal@nvidia.com>

Add KUnit test coverage for the flat_cache_default_is_zero flag. The
test verifies that when the flag is set:
- Writes in cache_only mode work before registers are marked valid
- Writes in cache_only mode work after registers are marked valid
- After regcache_mark_dirty() and regcache_sync(), cached values
  are correctly written to hardware
- Reads return the cached values

Test command:
  ./tools/testing/kunit/kunit.py run regmap

Test results:
  ============= flat_cache_default_is_zero_flag  =============
  [PASSED] flat-default @0x0
  [PASSED] flat-default fast I/O @0x0
  [PASSED] flat-default @0x2001
  [PASSED] flat-default @0x2002
  ========= [PASSED] flat_cache_default_is_zero_flag =========

Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 drivers/base/regmap/regmap-kunit.c | 87 +++++++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/drivers/base/regmap/regmap-kunit.c b/drivers/base/regmap/regmap-kunit.c
index f6fc5ed016da..7eec555c449c 100644
--- a/drivers/base/regmap/regmap-kunit.c
+++ b/drivers/base/regmap/regmap-kunit.c
@@ -118,6 +118,15 @@ static const struct regmap_test_param real_cache_types_only_list[] = {
 
 KUNIT_ARRAY_PARAM(real_cache_types_only, real_cache_types_only_list, param_to_desc);
 
+static const struct regmap_test_param flat_cache_types_list[] = {
+	{ .cache = REGCACHE_FLAT, .from_reg = 0 },
+	{ .cache = REGCACHE_FLAT, .from_reg = 0, .fast_io = true },
+	{ .cache = REGCACHE_FLAT, .from_reg = 0x2001 },
+	{ .cache = REGCACHE_FLAT, .from_reg = 0x2002 },
+};
+
+KUNIT_ARRAY_PARAM(flat_cache_types, flat_cache_types_list, param_to_desc);
+
 static const struct regmap_test_param real_cache_types_list[] = {
 	{ .cache = REGCACHE_FLAT,   .from_reg = 0 },
 	{ .cache = REGCACHE_FLAT,   .from_reg = 0, .fast_io = true },
@@ -1517,6 +1526,83 @@ static void cache_present(struct kunit *test)
 		KUNIT_ASSERT_TRUE(test, regcache_reg_cached(map, param->from_reg + i));
 }
 
+/*
+ * Test flat_cache_default_is_zero flag behavior.
+ *
+ * When this flag is set on REGCACHE_FLAT, registers not in reg_defaults
+ * are treated as having a default value of zero. This allows drivers to
+ * avoid maintaining large reg_defaults arrays for hardware with zero
+ * power-on-reset values.
+ */
+static void flat_cache_default_is_zero_flag(struct kunit *test)
+{
+	const struct regmap_test_param *param = test->param_value;
+	struct regmap *map;
+	struct regmap_config config;
+	struct regmap_ram_data *data;
+	unsigned int val;
+	int i;
+
+	config = test_regmap_config;
+	config.flat_cache_default_is_zero = true;
+
+	map = gen_regmap(test, &config, &data);
+	KUNIT_ASSERT_FALSE(test, IS_ERR(map));
+	if (IS_ERR(map))
+		return;
+
+	for (i = 0; i < BLOCK_TEST_SIZE; i++) {
+		data->read[param->from_reg + i] = false;
+		data->written[param->from_reg + i] = false;
+	}
+
+	/* Write in cache_only mode before registers are marked valid */
+	regcache_cache_only(map, true);
+	for (i = 0; i < BLOCK_TEST_SIZE; i++)
+		KUNIT_EXPECT_EQ(test, 0, regmap_write(map, param->from_reg + i, i + 0x100));
+
+	for (i = 0; i < BLOCK_TEST_SIZE; i++)
+		KUNIT_ASSERT_FALSE(test, data->written[param->from_reg + i]);
+
+	regcache_cache_only(map, false);
+	regcache_mark_dirty(map);
+	KUNIT_EXPECT_EQ(test, 0, regcache_sync(map));
+
+	for (i = 0; i < BLOCK_TEST_SIZE; i++)
+		KUNIT_ASSERT_TRUE(test, data->written[param->from_reg + i]);
+
+	for (i = 0; i < BLOCK_TEST_SIZE; i++)
+		KUNIT_EXPECT_EQ(test, i + 0x100, data->vals[param->from_reg + i]);
+
+	/* Verify reads return cached values */
+	for (i = 0; i < BLOCK_TEST_SIZE; i++) {
+		KUNIT_EXPECT_EQ(test, 0, regmap_read(map, param->from_reg + i, &val));
+		KUNIT_EXPECT_EQ(test, i + 0x100, val);
+	}
+
+	for (i = 0; i < BLOCK_TEST_SIZE; i++)
+		data->written[param->from_reg + i] = false;
+
+	/* Write in cache_only mode after registers are already valid */
+	regcache_cache_only(map, true);
+
+	for (i = 0; i < BLOCK_TEST_SIZE; i++)
+		KUNIT_EXPECT_EQ(test, 0, regmap_write(map, param->from_reg + i, i + 0x200));
+
+	for (i = 0; i < BLOCK_TEST_SIZE; i++)
+		KUNIT_ASSERT_FALSE(test, data->written[param->from_reg + i]);
+
+	regcache_cache_only(map, false);
+	regcache_mark_dirty(map);
+	KUNIT_EXPECT_EQ(test, 0, regcache_sync(map));
+
+	for (i = 0; i < BLOCK_TEST_SIZE; i++)
+		KUNIT_ASSERT_TRUE(test, data->written[param->from_reg + i]);
+
+	for (i = 0; i < BLOCK_TEST_SIZE; i++)
+		KUNIT_EXPECT_EQ(test, i + 0x200, data->vals[param->from_reg + i]);
+}
+
 static void cache_write_zero(struct kunit *test)
 {
 	const struct regmap_test_param *param = test->param_value;
@@ -2078,6 +2164,7 @@ static struct kunit_case regmap_test_cases[] = {
 	KUNIT_CASE_PARAM(cache_present, sparse_cache_types_gen_params),
 	KUNIT_CASE_PARAM(cache_write_zero, sparse_cache_types_gen_params),
 	KUNIT_CASE_PARAM(cache_range_window_reg, real_cache_types_only_gen_params),
+	KUNIT_CASE_PARAM(flat_cache_default_is_zero_flag, flat_cache_types_gen_params),
 
 	KUNIT_CASE_PARAM(raw_read_defaults_single, raw_test_types_gen_params),
 	KUNIT_CASE_PARAM(raw_read_defaults, raw_test_types_gen_params),
-- 
2.17.1

