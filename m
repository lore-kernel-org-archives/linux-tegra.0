Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010000.outbound.protection.outlook.com [52.101.193.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A143FFAB0;
	Mon,  5 Oct 2026 08:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791190502; cv=fail; b=vCcuAos0G6HvBBEDeTOVy64+z9jWmrcmfG65MfvHVk6pApA41bomk3yaHYsGT2i1tT7dHvnKubT9BBinJ0GDOMlAox1NMM+vy+APYXBXJwM6e6K6gwNQFyYqVgqol7BMaerLrm372k3+7Ya+7aT+D1+ymcVA+Z4j4XC2bg8QmlA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791190502; c=relaxed/simple;
	bh=C702EKC/0Y3L5vJHt8dnn7MM85xvQJN+Gib1zcUUKew=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i6zQYGZTpxvJx15YYTo35tK6wq8WmJUj8/F/esPbpItESBad+dbymZK3Ws5Bzl4YQUDsJ5Yd/9Qazyz1IUZTG6/4t0Ght85htIc3IZGgFbT0RvA/7gXnmG0Vp3dpIfwCmtSyP25iLJ5TWA05z2qIbGWzB1bCPZqk0vQmwG3OVuw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rDzzD0S0; arc=fail smtp.client-ip=52.101.193.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rDzzD0S0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uPy1NRITilE8C3cq8hJX0ZPrVkojEQz2rHbYYxkCD7p+nusy/QOJGduHI0S0KxN1WpSUMgfrblPgsNcJ87eCMIqj5fdeB9ZU7xOVPRkm4CII7OWd8/rh/Vo/yqvzwO4Hlpezf2UYsK6vN9TLoaZE9wlwGQWV1XGVCxj1/JzKsSz6ccreU8bP7Gg8OlFt7qQ3JMwraDqrwZdNmpKlUa1fcZa/HNKlUVyoa04VJo+o+L460QMcqqIjrtTloTdTiGUdss5gcOouQb8NuV5rfgUNjzIE8uECg/tUucOSW6oSfp1gtoHBiuYaZYFhYI/tiN8IpD/i39qFLpqXHS2+plYyQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6axLeawBHhdPizyA331fFUlROh7lx9L9xaoxcDGxDwo=;
 b=DXsxcU/mWJ4jbMc6X65B6K+kSTStmnXrRMp7wS4AkWNw1dzVjpBFoIDFn2H3EuW6BYnT9nCyZvYm02BFMGm7IwrkObUziwCS3fvP+1NpF01/DSJZIVzRzYfozwJGVklkt7pJDw2Xt9S+XnfAm324Jhp9hRuFqIE8KO0r4i256T1UY07NkjZQknQpayKN8GrQV0ywDJBchSBkVYRGuccv356b2jDlgWnazJfxJkXzybMZbbYQ9kWrLWD7gZCVBtLtZGhDJeLdlMCoklchF6nGJsAHM4IXgW0tuM1wdczckFcXc7sWjMX9L0HneZvoEbz+9NhGxH7EWLmAfcY9S2kL9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6axLeawBHhdPizyA331fFUlROh7lx9L9xaoxcDGxDwo=;
 b=rDzzD0S0mwvRhLQ8ls7BVJSfmNPoR2ri5FkzThtnBAWs6knAd87CWooQcGVyWKH/fMS/PSHspz9V3CmjCiWflcmzR3MArsnMPYtV7lG4VjwSCFvFL6z20KjCgipYOPkQVuYIfGSDPU1b71U6EePjNw2wGlvg99d6ABtYXigH9mY2NRdMC5q6ogXHcNTKR3vaFeq5kZscnrH3TPRGsEnL2Xyo2OJMVpbKM7Qjp18fI23u+Nf9sxPCyEAss64UIWXkTkd6g5uDZEtDW1avlNg5NxMpAtjdvIttCQM5j2w0OL+CgtBCUQr5CKeMyFe8tV8Z4lYN66cOyEExbLg/s26hZA==
Received: from CH2PR10CA0015.namprd10.prod.outlook.com (2603:10b6:610:4c::25)
 by DS0PR12MB8787.namprd12.prod.outlook.com (2603:10b6:8:14e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 5 Oct
 2026 08:54:53 +0000
Received: from CH1PEPF0000AD7C.namprd04.prod.outlook.com
 (2603:10b6:610:4c:cafe::60) by CH2PR10CA0015.outlook.office365.com
 (2603:10b6:610:4c::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Mon, 5
 Oct 2026 08:54:53 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000AD7C.mail.protection.outlook.com (10.167.244.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 5 Oct 2026 08:54:52 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 5 Oct
 2026 01:54:36 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 5 Oct
 2026 01:54:35 -0700
Received: from build-sheetal-noble-20260902.internal (10.127.8.14) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.49 via
 Frontend Transport; Mon, 5 Oct 2026 01:54:35 -0700
From: Sheetal <sheetal@nvidia.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Thierry
 Reding" <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
	Sameer Pujar <spujar@nvidia.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, Mohan Kumar <mkumard@nvidia.com>,
	<linux-sound@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Sheetal <sheetal@nvidia.com>
Subject: [RFC PATCH v2 1/2] ASoC: tegra: Update ASRC ratio controls
Date: Mon, 5 Oct 2026 08:52:26 +0000
Message-ID: <20261005085227.2133834-2-sheetal@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005085227.2133834-1-sheetal@nvidia.com>
References: <20261005085227.2133834-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7C:EE_|DS0PR12MB8787:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f03cb77-43bc-48fb-f2a1-08df22be5257
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|376014|1800799024|36860700016|22082099003|18002099003|56012099006|3023799007|6133799003|10067099003|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info:
	xtqpFs7FYUPrWcEuLl+rHI8QE5bne18QLudcaUjr890d6i93pxun7NsF5Le6qP4Gv08xgfGVuXHGt5M8eP/sQ/iNJ+KCB/enpv/B3LFdJLiRH5H2IX7RKKGgz9NN/vqXx+GEqAFB6YMHGtd24AIWXXEQIO1WlFbhbW8IY9Ku3mYAHs/pO3UoNgN1HlQ77Mq23wsyRagm8MLIKmYxyDrPmCyu5fj2v1mUlJTm39wXC4StYzveS8rF14rYrSFB6rY2reYzewPCtPWdR3yd0AdaRbe50uW7kyHNvrfbIvMkR90di7wvsf1hHQuaxV8+gGOGnqU80/tSlj+veVF+jQmse/Du5MrICOlBmowej+PlDbXZqYmUCa7aRgwJX2HV4vs6YXSWb5plNpVK+Gi8KNsDQuRTHrMHnpbGEXRiuaoacSmygGW7NJZXDAzcUeX5tFibqwRidZ5ebckCQ5REbxciFZxak2XzlLeqDm/p22QQtLUnFWuS/eKSRnbOne+rJK4tmYStyuGEj1Fnq4gcCHGNlBxRRMjvXAnqkWbQiK3MlGxY/cw0jhhRoruYkw9JMbyvWEz0gT9VTrqHb96aQDe+MLeMTGPfSNBE5e+d5ND7CSu1DLqOqWdLgVnrV2qdL4/CLfHnPFqWZrD+hiu5y2aGObCuw0Wu2GpqXcvfiEXcaIePu3+CE5fBqY9L4HSuiGrW8vTNyAhBZbDQxupHh+f60Q==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(376014)(1800799024)(36860700016)(22082099003)(18002099003)(56012099006)(3023799007)(6133799003)(10067099003)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	efNe3+qhEpPDqtmqhtfjLdsdcMG1+kEeEnH19sLTo1yunWhaTGfENxC8JdtZY47VtNCXNkUrYkON0OuP+Igaxgs2nIPVjbt6f4nc1W2jbilzxx3sTWXEa7IphdEXpU9i9nwuI96asdpijbecTbEKPxRFaetI+986KFEuSCEgh1pi8AkdF5BaD5D3xGd/jR3qJxDNtCqoxIwtCV5lsK5OT8rrbn0JGJAJclFku91jPPrH86cXbmeoWKYnnsZJxoaL4mlDwsVbfTd9OvfxNK2kBj0W4z2/Ge0BCOZ/6CHDmouITBXHRyj2g6uDIZywb90XsftfB8J/NhxPp72gh3DshsKT5Q8wcAXaQXyCQ2pPkB7IbcKPNO3OBN1RKxE3mDghzaM/HoRlE0Jgos0ZGyjWpJVScpjKFloj4X1+9yxeti5LX6QASymsDP3vIZrAfvCi
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 08:54:52.8957
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f03cb77-43bc-48fb-f2a1-08df22be5257
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8787

Replace the separate integer and fractional ASRC ratio controls with a
single two-value control for each stream.

This is a userspace-visible ALSA mixer control ABI change. Existing
userspace that programs the ratio with separate controls must switch from
the legacy commands:

  amixer -c APE cset name="ASRC1 Ratio<N> Integer Part" \
    <integer part>
  amixer -c APE cset name="ASRC1 Ratio<N> Fractional Part" \
    <fractional part>

to the paired control:

  amixer -c APE cset name="ASRC1 Ratio<N>" \
    "<integer part>,<fractional part>"

For example, userspace should set "ASRC1 Ratio1" to "0,715827882"
instead of programming separate integer and fractional controls.

The ABI change is needed because the old controls update the integer and
fractional parts independently. That can expose hardware to a transient
mixed ratio when one part has been updated but the other still contains
the previous value. A paired control lets userspace send the complete
ratio in one ALSA control update, so the driver can validate and program
both fields together.

Keeping writable compatibility controls would preserve the non-atomic
update path, so the old controls are replaced instead of aliased.

Validate both values before programming hardware. The fractional field
keeps the existing 32-bit maximum, while the integer field is rejected
when it exceeds the hardware field width. ALSA exposes one min and max
range for all values in an integer-array control, so the paired ratio
controls advertise the fractional field's full 32-bit range and validate
the integer part in the put callback.

Serialize ratio-source changes, stream setup, and ratio updates with a
driver mutex so cached ratio state and paired hardware programming remain
consistent.

For active streams, unlock and re-lock the ASRC stream before programming
a software ratio only when the new ratio differs from the cached ratio by
more than 20%. Hardware allows direct updates for smaller ratio changes,
while larger jumps require the stream lock to be refreshed around the
paired integer/fractional update.

Roll back the previous hardware pair and lock state if a paired ratio
update fails after partially programming the hardware.

Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 sound/soc/tegra/tegra186_asrc.c | 443 ++++++++++++++++++++------------
 sound/soc/tegra/tegra186_asrc.h |   4 +
 2 files changed, 276 insertions(+), 171 deletions(-)

diff --git a/sound/soc/tegra/tegra186_asrc.c b/sound/soc/tegra/tegra186_asrc.c
index d8ae5d997615..2b67d23f5fa7 100644
--- a/sound/soc/tegra/tegra186_asrc.c
+++ b/sound/soc/tegra/tegra186_asrc.c
@@ -19,6 +19,9 @@
 #include "tegra186_asrc.h"
 #include "tegra_cif.h"
 
+#define TEGRA186_ASRC_RATIO_PERCENT_SCALE		100
+#define TEGRA186_ASRC_RATIO_UNLOCK_THRESHOLD_PERCENT	20
+
 #define ASRC_STREAM_SOURCE_SELECT(id)					       \
 	(TEGRA186_ASRC_CFG + ((id) * TEGRA186_ASRC_STREAM_STRIDE))
 
@@ -65,13 +68,125 @@ static const struct reg_default tegra186_asrc_reg_defaults[] = {
 	{ TEGRA186_ASRC_CYA, 0x0},
 };
 
-static void tegra186_asrc_lock_stream(struct tegra186_asrc *asrc,
-				      unsigned int id)
+static int tegra186_asrc_set_stream_lock(struct tegra186_asrc *asrc,
+					 unsigned int id, bool lock)
 {
-	regmap_write(asrc->regmap,
-		     ASRC_STREAM_REG(TEGRA186_ASRC_RATIO_LOCK_STATUS,
-				     id),
-		     1);
+	return regmap_write(asrc->regmap,
+			    ASRC_STREAM_REG(TEGRA186_ASRC_RATIO_LOCK_STATUS,
+					    id),
+			    lock);
+}
+
+static int tegra186_asrc_write_ratio_pair(struct tegra186_asrc *asrc,
+					  unsigned int id,
+					  unsigned int int_part,
+					  unsigned int frac_part)
+{
+	int ret;
+
+	ret = regmap_write(asrc->regmap,
+			   ASRC_STREAM_REG(TEGRA186_ASRC_RATIO_INT_PART, id),
+			   int_part);
+	if (ret)
+		return ret;
+
+	return regmap_write(asrc->regmap,
+			    ASRC_STREAM_REG(TEGRA186_ASRC_RATIO_FRAC_PART, id),
+			    frac_part);
+}
+
+static int tegra186_asrc_read_ratio_pair(struct tegra186_asrc *asrc,
+					 unsigned int id, unsigned int *int_part,
+					 unsigned int *frac_part)
+{
+	int ret;
+
+	ret = regmap_read(asrc->regmap,
+			  ASRC_STREAM_REG(TEGRA186_ASRC_RATIO_INT_PART, id),
+			  int_part);
+	if (ret)
+		return ret;
+
+	return regmap_read(asrc->regmap,
+			   ASRC_STREAM_REG(TEGRA186_ASRC_RATIO_FRAC_PART, id),
+			   frac_part);
+}
+
+static void tegra186_asrc_cache_ratio(struct tegra186_asrc *asrc,
+				      unsigned int id, unsigned int int_part,
+				      unsigned int frac_part)
+{
+	asrc->lane[id].int_part = int_part;
+	asrc->lane[id].frac_part = frac_part;
+}
+
+static int tegra186_asrc_apply_ratio(struct tegra186_asrc *asrc,
+				     unsigned int id, unsigned int int_part,
+				     unsigned int frac_part, bool unlock)
+{
+	unsigned int old_int_part, old_frac_part, old_lock;
+	int ret, restore_ret;
+
+	ret = tegra186_asrc_read_ratio_pair(asrc, id, &old_int_part,
+					    &old_frac_part);
+	if (ret)
+		return ret;
+
+	ret = regmap_read(asrc->regmap,
+			  ASRC_STREAM_REG(TEGRA186_ASRC_RATIO_LOCK_STATUS, id),
+			  &old_lock);
+	if (ret)
+		return ret;
+
+	if (unlock) {
+		ret = tegra186_asrc_set_stream_lock(asrc, id, false);
+		if (ret)
+			return ret;
+	}
+
+	ret = tegra186_asrc_write_ratio_pair(asrc, id, int_part, frac_part);
+	if (ret)
+		goto restore_ratio;
+
+	ret = tegra186_asrc_set_stream_lock(asrc, id, true);
+	if (!ret)
+		return 0;
+
+restore_ratio:
+	restore_ret = tegra186_asrc_write_ratio_pair(asrc, id,
+						     old_int_part,
+						     old_frac_part);
+	if (!restore_ret) {
+		if (old_lock)
+			restore_ret = tegra186_asrc_set_stream_lock(asrc, id,
+								    true);
+		else
+			restore_ret = tegra186_asrc_set_stream_lock(asrc, id,
+								    false);
+	}
+
+	return ret ?: restore_ret;
+}
+
+static int tegra186_asrc_apply_cached_ratio(struct tegra186_asrc *asrc,
+					    unsigned int id)
+{
+	return tegra186_asrc_apply_ratio(asrc, id, asrc->lane[id].int_part,
+					asrc->lane[id].frac_part, false);
+}
+
+static bool tegra186_asrc_need_unlock(u64 old_ratio, u64 new_ratio)
+{
+	u64 ratio_diff;
+
+	if (!old_ratio || !new_ratio)
+		return false;
+
+	ratio_diff = (old_ratio > new_ratio) ?
+		     (old_ratio - new_ratio) : (new_ratio - old_ratio);
+
+	return ((ratio_diff * TEGRA186_ASRC_RATIO_PERCENT_SCALE) >
+		(old_ratio * TEGRA186_ASRC_RATIO_UNLOCK_THRESHOLD_PERCENT));
 }
 
 static int tegra186_asrc_runtime_suspend(struct device *dev)
@@ -87,7 +202,7 @@ static int tegra186_asrc_runtime_suspend(struct device *dev)
 static int tegra186_asrc_runtime_resume(struct device *dev)
 {
 	struct tegra186_asrc *asrc = dev_get_drvdata(dev);
-	int id;
+	int id, ret, first_err = 0;
 
 	regcache_cache_only(asrc->regmap, false);
 
@@ -103,25 +218,23 @@ static int tegra186_asrc_runtime_resume(struct device *dev)
 
 	regcache_sync(asrc->regmap);
 
+	mutex_lock(&asrc->ratio_lock);
 	for (id = 0; id < TEGRA186_ASRC_STREAM_MAX; id++) {
 		if (asrc->lane[id].ratio_source !=
 		    TEGRA186_ASRC_RATIO_SOURCE_SW)
 			continue;
 
-		regmap_write(asrc->regmap,
-			ASRC_STREAM_REG(TEGRA186_ASRC_RATIO_INT_PART,
-					id),
-			asrc->lane[id].int_part);
-
-		regmap_write(asrc->regmap,
-			ASRC_STREAM_REG(TEGRA186_ASRC_RATIO_FRAC_PART,
-					id),
-			asrc->lane[id].frac_part);
-
-		tegra186_asrc_lock_stream(asrc, id);
+		ret = tegra186_asrc_apply_cached_ratio(asrc, id);
+		if (ret) {
+			dev_err(dev, "Failed to restore ratio for lane %d: %d\n",
+				id, ret);
+			if (!first_err)
+				first_err = ret;
+		}
 	}
+	mutex_unlock(&asrc->ratio_lock);
 
-	return 0;
+	return first_err;
 }
 
 static int tegra186_asrc_set_audio_cif(struct tegra186_asrc *asrc,
@@ -186,7 +299,7 @@ static int tegra186_asrc_out_hw_params(struct snd_pcm_substream *substream,
 {
 	struct device *dev = dai->dev;
 	struct tegra186_asrc *asrc = snd_soc_dai_get_drvdata(dai);
-	int ret, id = dai->id - 7;
+	int ret = 0, id = dai->id - 7;
 
 	 /* Set output threshold */
 	regmap_write(asrc->regmap,
@@ -217,20 +330,22 @@ static int tegra186_asrc_out_hw_params(struct snd_pcm_substream *substream,
 			TEGRA186_ASRC_STREAM_DEFAULT_HW_COMP_BIAS_VALUE);
 	}
 
+	mutex_lock(&asrc->ratio_lock);
+
 	/* Set lock */
 	regmap_update_bits(asrc->regmap,
 			   ASRC_STREAM_REG(TEGRA186_ASRC_CFG, id),
 			   1, asrc->lane[id].ratio_source);
 
 	if (asrc->lane[id].ratio_source == TEGRA186_ASRC_RATIO_SOURCE_SW) {
-		regmap_write(asrc->regmap,
-			ASRC_STREAM_REG(TEGRA186_ASRC_RATIO_INT_PART, id),
-			asrc->lane[id].int_part);
-		regmap_write(asrc->regmap,
-			ASRC_STREAM_REG(TEGRA186_ASRC_RATIO_FRAC_PART, id),
-			asrc->lane[id].frac_part);
-		tegra186_asrc_lock_stream(asrc, id);
+		ret = tegra186_asrc_apply_cached_ratio(asrc, id);
+		if (ret)
+			dev_err(dev, "Can't apply cached ratio for ASRC stream %d: %d\n",
+				id, ret);
 	}
+	mutex_unlock(&asrc->ratio_lock);
+	if (ret)
+		return ret;
 
 	return ret;
 }
@@ -257,112 +372,132 @@ static int tegra186_asrc_put_ratio_source(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra186_asrc *asrc = snd_soc_component_get_drvdata(cmpnt);
 	unsigned int id = asrc_private->reg / TEGRA186_ASRC_STREAM_STRIDE;
+	unsigned int new_source = ucontrol->value.enumerated.item[0];
+	unsigned int old_source, int_part = 0, frac_part = 0;
 	bool change = false;
+	int ret;
 
-	asrc->lane[id].ratio_source = ucontrol->value.enumerated.item[0];
+	mutex_lock(&asrc->ratio_lock);
 
-	regmap_update_bits_check(asrc->regmap, asrc_private->reg,
-				 TEGRA186_ASRC_STREAM_RATIO_TYPE_MASK,
-				 asrc->lane[id].ratio_source,
-				 &change);
+	old_source = asrc->lane[id].ratio_source;
 
-	return change ? 1 : 0;
-}
+	if (old_source == TEGRA186_ASRC_RATIO_SOURCE_ARAD &&
+	    new_source == TEGRA186_ASRC_RATIO_SOURCE_SW) {
+		ret = tegra186_asrc_read_ratio_pair(asrc, id, &int_part,
+						    &frac_part);
+		if (ret) {
+			mutex_unlock(&asrc->ratio_lock);
+			return ret;
+		}
+	}
 
-static int tegra186_asrc_get_ratio_int(struct snd_kcontrol *kcontrol,
-				       struct snd_ctl_elem_value *ucontrol)
-{
-	struct soc_mixer_control *asrc_private =
-		(struct soc_mixer_control *)kcontrol->private_value;
-	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
-	struct tegra186_asrc *asrc = snd_soc_component_get_drvdata(cmpnt);
-	unsigned int id = asrc_private->reg / TEGRA186_ASRC_STREAM_STRIDE;
+	ret = regmap_update_bits_check(asrc->regmap, asrc_private->reg,
+				       TEGRA186_ASRC_STREAM_RATIO_TYPE_MASK,
+				       new_source, &change);
+	if (ret) {
+		mutex_unlock(&asrc->ratio_lock);
+		return ret;
+	}
 
-	regmap_read(asrc->regmap,
-		    ASRC_STREAM_REG(TEGRA186_ASRC_RATIO_INT_PART, id),
-		    &asrc->lane[id].int_part);
+	asrc->lane[id].ratio_source = new_source;
+	if (old_source == TEGRA186_ASRC_RATIO_SOURCE_ARAD &&
+	    new_source == TEGRA186_ASRC_RATIO_SOURCE_SW)
+		tegra186_asrc_cache_ratio(asrc, id, int_part, frac_part);
 
-	ucontrol->value.integer.value[0] = asrc->lane[id].int_part;
+	mutex_unlock(&asrc->ratio_lock);
 
-	return 0;
+	return change ? 1 : 0;
 }
 
-static int tegra186_asrc_put_ratio_int(struct snd_kcontrol *kcontrol,
-				       struct snd_ctl_elem_value *ucontrol)
+static int tegra186_asrc_get_ratio(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
 {
-	struct soc_mixer_control *asrc_private =
-		(struct soc_mixer_control *)kcontrol->private_value;
+	struct soc_mreg_control *asrc_private =
+		(struct soc_mreg_control *)kcontrol->private_value;
 	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra186_asrc *asrc = snd_soc_component_get_drvdata(cmpnt);
-	unsigned int id = asrc_private->reg / TEGRA186_ASRC_STREAM_STRIDE;
-	bool change = false;
+	unsigned int id = asrc_private->regbase;
+	unsigned int int_part, frac_part;
+	int ret;
+
+	mutex_lock(&asrc->ratio_lock);
 
 	if (asrc->lane[id].ratio_source == TEGRA186_ASRC_RATIO_SOURCE_ARAD) {
-		dev_err(cmpnt->dev,
-			"Lane %d ratio source is ARAD, invalid SW update\n",
-			id);
-		return -EINVAL;
+		ret = tegra186_asrc_read_ratio_pair(asrc, id, &int_part,
+						    &frac_part);
+	} else {
+		int_part = asrc->lane[id].int_part;
+		frac_part = asrc->lane[id].frac_part;
+		ret = 0;
 	}
 
-	asrc->lane[id].int_part = ucontrol->value.integer.value[0];
-
-	regmap_update_bits_check(asrc->regmap,
-				 ASRC_STREAM_REG(TEGRA186_ASRC_RATIO_INT_PART,
-						 id),
-				 TEGRA186_ASRC_STREAM_RATIO_INT_PART_MASK,
-				 asrc->lane[id].int_part, &change);
+	mutex_unlock(&asrc->ratio_lock);
+	if (ret)
+		return ret;
 
-	tegra186_asrc_lock_stream(asrc, id);
+	ucontrol->value.integer.value[0] = int_part;
+	ucontrol->value.integer.value[1] = frac_part;
 
-	return change ? 1 : 0;
+	return 0;
 }
 
-static int tegra186_asrc_get_ratio_frac(struct snd_kcontrol *kcontrol,
-					struct snd_ctl_elem_value *ucontrol)
+static int tegra186_asrc_put_ratio(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
 {
 	struct soc_mreg_control *asrc_private =
 		(struct soc_mreg_control *)kcontrol->private_value;
 	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra186_asrc *asrc = snd_soc_component_get_drvdata(cmpnt);
-	unsigned int id = asrc_private->regbase / TEGRA186_ASRC_STREAM_STRIDE;
-
-	regmap_read(asrc->regmap,
-		    ASRC_STREAM_REG(TEGRA186_ASRC_RATIO_FRAC_PART, id),
-		    &asrc->lane[id].frac_part);
+	unsigned int id = asrc_private->regbase;
+	unsigned int int_part, frac_part;
+	u64 old_ratio, new_ratio;
+	long int_val = ucontrol->value.integer.value[0];
+	long frac_val = ucontrol->value.integer.value[1];
+	bool change = false, unlock = false;
+	int ret = 0;
+
+	if (int_val < 0 || int_val > TEGRA186_ASRC_STREAM_RATIO_INT_PART_MASK)
+		return -EINVAL;
 
-	ucontrol->value.integer.value[0] = asrc->lane[id].frac_part;
+	if (frac_val < 0 || frac_val > TEGRA186_ASRC_STREAM_RATIO_FRAC_PART_MASK)
+		return -EINVAL;
 
-	return 0;
-}
+	int_part = int_val;
+	frac_part = frac_val;
 
-static int tegra186_asrc_put_ratio_frac(struct snd_kcontrol *kcontrol,
-					struct snd_ctl_elem_value *ucontrol)
-{
-	struct soc_mreg_control *asrc_private =
-		(struct soc_mreg_control *)kcontrol->private_value;
-	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
-	struct tegra186_asrc *asrc = snd_soc_component_get_drvdata(cmpnt);
-	unsigned int id = asrc_private->regbase / TEGRA186_ASRC_STREAM_STRIDE;
-	bool change = false;
+	mutex_lock(&asrc->ratio_lock);
 
 	if (asrc->lane[id].ratio_source == TEGRA186_ASRC_RATIO_SOURCE_ARAD) {
 		dev_err(cmpnt->dev,
 			"Lane %d ratio source is ARAD, invalid SW update\n",
 			id);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto out_unlock;
 	}
 
-	asrc->lane[id].frac_part = ucontrol->value.integer.value[0];
+	old_ratio = ((u64)asrc->lane[id].int_part << 32) |
+		    asrc->lane[id].frac_part;
+	new_ratio = ((u64)int_part << 32) | frac_part;
+
+	if (!new_ratio) {
+		ret = -EINVAL;
+		goto out_unlock;
+	}
 
-	regmap_update_bits_check(asrc->regmap,
-				 ASRC_STREAM_REG(TEGRA186_ASRC_RATIO_FRAC_PART,
-						 id),
-				 TEGRA186_ASRC_STREAM_RATIO_FRAC_PART_MASK,
-				 asrc->lane[id].frac_part, &change);
+	change = old_ratio != new_ratio;
+	if (!change)
+		goto out_unlock;
 
-	tegra186_asrc_lock_stream(asrc, id);
+	unlock = tegra186_asrc_need_unlock(old_ratio, new_ratio);
 
-	return change ? 1 : 0;
+	ret = tegra186_asrc_apply_ratio(asrc, id, int_part, frac_part, unlock);
+	if (!ret)
+		tegra186_asrc_cache_ratio(asrc, id, int_part, frac_part);
+
+out_unlock:
+	mutex_unlock(&asrc->ratio_lock);
+
+	return ret ?: change;
 }
 
 static int tegra186_asrc_get_hwcomp_disable(struct snd_kcontrol *kcontrol,
@@ -651,99 +786,63 @@ ASRC_SOURCE_DECL(src_select4, 3);
 ASRC_SOURCE_DECL(src_select5, 4);
 ASRC_SOURCE_DECL(src_select6, 5);
 
-#define SOC_SINGLE_EXT_FRAC(xname, xregbase, xmax, xget, xput)		\
+static int tegra186_asrc_ratio_param_info(struct snd_kcontrol *kcontrol,
+					  struct snd_ctl_elem_info *uinfo)
+{
+	struct soc_mreg_control *mc =
+		(struct soc_mreg_control *)kcontrol->private_value;
+
+	/*
+	 * ALSA exposes one range for all values in an integer array. The
+	 * fractional part needs the full 32-bit range; the integer part is
+	 * validated against the hardware field width in the put callback.
+	 */
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 2;
+	uinfo->value.integer.min = mc->min;
+	uinfo->value.integer.max = mc->max;
+
+	return 0;
+}
+
+#define SOC_SINGLE_EXT_ARRAY(xname, xregbase, xmax, xget, xput)		\
 {									\
 	.iface	= SNDRV_CTL_ELEM_IFACE_MIXER,				\
 	.name	= (xname),						\
-	.info	= snd_soc_info_xr_sx,					\
+	.info	= tegra186_asrc_ratio_param_info,			\
 	.get	= xget,							\
 	.put	= xput,							\
 									\
 	.private_value = (unsigned long)&(struct soc_mreg_control)	\
 	{								\
 		.regbase	= xregbase,				\
-		.regcount	= 1,					\
+		.regcount	= 2,					\
 		.nbits		= 32,					\
 		.invert		= 0,					\
 		.min		= 0,					\
-		.max		= xmax					\
+		.max		= (xmax)				\
 	}								\
 }
 
 static const struct snd_kcontrol_new tegra186_asrc_controls[] = {
-	/* Controls for integer part of ratio */
-	SOC_SINGLE_EXT("Ratio1 Integer Part",
-		       ASRC_STREAM_REG(TEGRA186_ASRC_RATIO_INT_PART, 0),
-		       0, TEGRA186_ASRC_STREAM_RATIO_INT_PART_MASK, 0,
-		       tegra186_asrc_get_ratio_int,
-		       tegra186_asrc_put_ratio_int),
-
-	SOC_SINGLE_EXT("Ratio2 Integer Part",
-		       ASRC_STREAM_REG(TEGRA186_ASRC_RATIO_INT_PART, 1),
-		       0, TEGRA186_ASRC_STREAM_RATIO_INT_PART_MASK, 0,
-		       tegra186_asrc_get_ratio_int,
-		       tegra186_asrc_put_ratio_int),
-
-	SOC_SINGLE_EXT("Ratio3 Integer Part",
-		       ASRC_STREAM_REG(TEGRA186_ASRC_RATIO_INT_PART, 2),
-		       0, TEGRA186_ASRC_STREAM_RATIO_INT_PART_MASK, 0,
-		       tegra186_asrc_get_ratio_int,
-		       tegra186_asrc_put_ratio_int),
-
-	SOC_SINGLE_EXT("Ratio4 Integer Part",
-		       ASRC_STREAM_REG(TEGRA186_ASRC_RATIO_INT_PART, 3),
-		       0, TEGRA186_ASRC_STREAM_RATIO_INT_PART_MASK, 0,
-		       tegra186_asrc_get_ratio_int,
-		       tegra186_asrc_put_ratio_int),
-
-	SOC_SINGLE_EXT("Ratio5 Integer Part",
-		       ASRC_STREAM_REG(TEGRA186_ASRC_RATIO_INT_PART, 4),
-		       0, TEGRA186_ASRC_STREAM_RATIO_INT_PART_MASK, 0,
-		       tegra186_asrc_get_ratio_int,
-		       tegra186_asrc_put_ratio_int),
-
-	SOC_SINGLE_EXT("Ratio6 Integer Part",
-		       ASRC_STREAM_REG(TEGRA186_ASRC_RATIO_INT_PART, 5),
-		       0, TEGRA186_ASRC_STREAM_RATIO_INT_PART_MASK, 0,
-		       tegra186_asrc_get_ratio_int,
-		       tegra186_asrc_put_ratio_int),
-
-	/* Controls for fractional part of ratio */
-	SOC_SINGLE_EXT_FRAC("Ratio1 Fractional Part",
-			    ASRC_STREAM_REG(TEGRA186_ASRC_RATIO_FRAC_PART, 0),
-			    TEGRA186_ASRC_STREAM_RATIO_FRAC_PART_MASK,
-			    tegra186_asrc_get_ratio_frac,
-			    tegra186_asrc_put_ratio_frac),
-
-	SOC_SINGLE_EXT_FRAC("Ratio2 Fractional Part",
-			    ASRC_STREAM_REG(TEGRA186_ASRC_RATIO_FRAC_PART, 1),
-			    TEGRA186_ASRC_STREAM_RATIO_FRAC_PART_MASK,
-			    tegra186_asrc_get_ratio_frac,
-			    tegra186_asrc_put_ratio_frac),
-
-	SOC_SINGLE_EXT_FRAC("Ratio3 Fractional Part",
-			    ASRC_STREAM_REG(TEGRA186_ASRC_RATIO_FRAC_PART, 2),
-			    TEGRA186_ASRC_STREAM_RATIO_FRAC_PART_MASK,
-			    tegra186_asrc_get_ratio_frac,
-			    tegra186_asrc_put_ratio_frac),
-
-	SOC_SINGLE_EXT_FRAC("Ratio4 Fractional Part",
-			    ASRC_STREAM_REG(TEGRA186_ASRC_RATIO_FRAC_PART, 3),
-			    TEGRA186_ASRC_STREAM_RATIO_FRAC_PART_MASK,
-			    tegra186_asrc_get_ratio_frac,
-			    tegra186_asrc_put_ratio_frac),
-
-	SOC_SINGLE_EXT_FRAC("Ratio5 Fractional Part",
-			    ASRC_STREAM_REG(TEGRA186_ASRC_RATIO_FRAC_PART, 4),
-			    TEGRA186_ASRC_STREAM_RATIO_FRAC_PART_MASK,
-			    tegra186_asrc_get_ratio_frac,
-			    tegra186_asrc_put_ratio_frac),
-
-	SOC_SINGLE_EXT_FRAC("Ratio6 Fractional Part",
-			    ASRC_STREAM_REG(TEGRA186_ASRC_RATIO_FRAC_PART, 5),
-			    TEGRA186_ASRC_STREAM_RATIO_FRAC_PART_MASK,
-			    tegra186_asrc_get_ratio_frac,
-			    tegra186_asrc_put_ratio_frac),
+	/* Controls for ASRC */
+	SOC_SINGLE_EXT_ARRAY("Ratio1", 0, TEGRA186_ASRC_STREAM_RATIO_FRAC_PART_MASK,
+			     tegra186_asrc_get_ratio, tegra186_asrc_put_ratio),
+
+	SOC_SINGLE_EXT_ARRAY("Ratio2", 1, TEGRA186_ASRC_STREAM_RATIO_FRAC_PART_MASK,
+			     tegra186_asrc_get_ratio, tegra186_asrc_put_ratio),
+
+	SOC_SINGLE_EXT_ARRAY("Ratio3", 2, TEGRA186_ASRC_STREAM_RATIO_FRAC_PART_MASK,
+			     tegra186_asrc_get_ratio, tegra186_asrc_put_ratio),
+
+	SOC_SINGLE_EXT_ARRAY("Ratio4", 3, TEGRA186_ASRC_STREAM_RATIO_FRAC_PART_MASK,
+			     tegra186_asrc_get_ratio, tegra186_asrc_put_ratio),
+
+	SOC_SINGLE_EXT_ARRAY("Ratio5", 4, TEGRA186_ASRC_STREAM_RATIO_FRAC_PART_MASK,
+			     tegra186_asrc_get_ratio, tegra186_asrc_put_ratio),
+
+	SOC_SINGLE_EXT_ARRAY("Ratio6", 5, TEGRA186_ASRC_STREAM_RATIO_FRAC_PART_MASK,
+			     tegra186_asrc_get_ratio, tegra186_asrc_put_ratio),
 
 	/* Source of ratio provider */
 	SOC_ENUM_EXT("Ratio1 Source", src_select1,
@@ -1011,6 +1110,8 @@ static int tegra186_asrc_platform_probe(struct platform_device *pdev)
 			TEGRA186_ASRC_STREAM_DEFAULT_OUTPUT_HW_COMP_THRESH_CFG;
 	}
 
+	mutex_init(&asrc->ratio_lock);
+
 	err = devm_snd_soc_register_component(dev, &tegra186_asrc_cmpnt,
 					      tegra186_asrc_dais,
 					      ARRAY_SIZE(tegra186_asrc_dais));
diff --git a/sound/soc/tegra/tegra186_asrc.h b/sound/soc/tegra/tegra186_asrc.h
index 0c98e26d5e72..9cc8cec6c204 100644
--- a/sound/soc/tegra/tegra186_asrc.h
+++ b/sound/soc/tegra/tegra186_asrc.h
@@ -7,6 +7,8 @@
 #ifndef __TEGRA186_ASRC_H__
 #define __TEGRA186_ASRC_H__
 
+#include <linux/mutex.h>
+
 /* ASRC stream related offset */
 #define TEGRA186_ASRC_CFG				0x0
 #define TEGRA186_ASRC_RATIO_INT_PART			0x4
@@ -111,6 +113,8 @@ struct tegra186_asrc {
 	const struct tegra_asrc_soc_data *soc_data;
 	struct tegra186_asrc_lane lane[TEGRA186_ASRC_STREAM_MAX];
 	struct regmap *regmap;
+	/* Serializes ratio source, cache, and paired register updates. */
+	struct mutex ratio_lock;
 };
 
 #endif
-- 
2.43.0

