Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012038.outbound.protection.outlook.com [52.101.48.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B84A45A294;
	Mon, 21 Sep 2026 08:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789981060; cv=fail; b=i2l0mp7VCpvS0yN7ZeIgZLA1ADK1bhuGpvyYlVgIPlQUdT1MFGW1fLkDE8pvTIf65qvl17eDMx42kUpSNp6kAq1ImMvB6yp1G3raaU90k1s5iVy4obf4vuZ+AH0OgJVdgz0xX8xA620u17d3fLxL4+S7ZV8qI56qYJvcIJtA/yg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789981060; c=relaxed/simple;
	bh=52b7TsMCTkA9olkXXQC+p51HlXpc+eHPUrRhg8ETKSU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CGOZsmCTkNzOaftd7fPxIEzq9rGrd0Utkl28mIxpAdk7ht1lI4BcHqT63+URMoBHdzptSsLNt4aMRxPWOF5QzV4czWkHjDOCgxofYVXqvuRk1F923VWnsqY8vi2nDcL46XHZN0jDBkSbvjZIFZW3pEHa7gbg980HRHln9BZeYhU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MyMziSqQ; arc=fail smtp.client-ip=52.101.48.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MyMziSqQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WYyu8+FjTt1VRIXgkvNcQwZSyIehS5lbMTiRgyXabVcFoqikbu3I9SdLwdlh8uJyLRJN+KLMC2EkUQ8Id5FK82E9oj6UvzHq7M4TNR95JnIsu0prZxtPhd+D5jnJpRi3yKstZjCkianjZKtcGfaY214peYMyWd9Y0ytqdUR/ZG/oyxCb2M1mHzERxl+YOXoA8YYcEh0AHbiufqhtCIyVl3xoifFf6dArvvGMMszscsn/dKMsBTCb/tOVLJKI2ZPlT8qf+EmG91dVK8xktMABaoO269PhLAAlSC6YXdHqcs6GSN1UQot7Fgh9fJpxlBrsCC8gHNyLL/GDiB2+pyy0Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=06197pvMFwVfW8kXeGXWeM/Zy8GFi1GGbpXbbtY4n1I=;
 b=EawseSdZkw5eBiRod3xyMleW+5ihjh7L9TM1ZJhi32qYd3mKIT9P7XhIs5dk/OD3jM5lsLCtlru7BG66/JcA1XkNLpw1sbFJ9eOR4MSCh/TqYRuam1NNiCByRop4DjYmUZht5sN+YavoCSNgoZ6Sew9pKrQIkMI4+D0Q7kTQBCGOq1GKqSPZydN/qdPpF0fIXrY3RWGIRivI+CuU0es9IPLpbgL0RrPMPKvmHfYXCUFI3B4qpm61A8g/HBzOLULXnT+DelJ4QB1uKzwnz1LBA4YvvGfhG5O/WJsGOFPIv/C6/CNANeIoDwivekeYxePz+PXbN2heHH3qPGa7Ihwmig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=06197pvMFwVfW8kXeGXWeM/Zy8GFi1GGbpXbbtY4n1I=;
 b=MyMziSqQWr8x2WfjUv8Tkirv+tSv9DZHwnKjDOIrOGJ+PRb49OsyjNdWS1NKUgTJp0ToUJnKE2vMyH9hQEWkVsHxtOv6AMI+97x+Zh9mqTQ5uSD81xklYio2CkylB5CnbcjFEqAYpDi3qqFNqd1pIC5QoeBuVvxQEogmumfxhh+T+CkLPhDxpUN7vq/SEi36tSdkWrMowV55zETpToFcCLefMWJKdUsldTFP7zgK7tYwO079soIYYZVJWHsvw7W1+0tQg2wG3oFlOSbMctV9zF8LRPm8k4vl2eAaidTGeOL8PvTSgqXGIFJFd8Xa1Qq/wQULeCrL/v1TLd1wLBraRQ==
Received: from CH2PR07CA0050.namprd07.prod.outlook.com (2603:10b6:610:5b::24)
 by PH7PR12MB5655.namprd12.prod.outlook.com (2603:10b6:510:138::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 08:57:31 +0000
Received: from DS2PEPF000061C5.namprd02.prod.outlook.com
 (2603:10b6:610:5b:cafe::28) by CH2PR07CA0050.outlook.office365.com
 (2603:10b6:610:5b::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Mon,
 21 Sep 2026 08:57:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF000061C5.mail.protection.outlook.com (10.167.23.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Mon, 21 Sep 2026 08:57:30 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 21 Sep
 2026 01:57:15 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 21 Sep
 2026 01:57:15 -0700
Received: from build-sheetal-noble-20260902.internal (10.127.8.14) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.49 via
 Frontend Transport; Mon, 21 Sep 2026 01:57:14 -0700
From: Sheetal <sheetal@nvidia.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Thierry
 Reding" <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
	Sameer Pujar <spujar@nvidia.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, Mohan Kumar <mkumard@nvidia.com>,
	<linux-sound@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Sheetal <sheetal@nvidia.com>
Subject: [RFC PATCH 3/3] ASoC: tegra: Cache ASRC ratios until streams are active
Date: Mon, 21 Sep 2026 08:57:04 +0000
Message-ID: <20260921085704.1248920-4-sheetal@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921085704.1248920-1-sheetal@nvidia.com>
References: <20260921085704.1248920-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C5:EE_|PH7PR12MB5655:EE_
X-MS-Office365-Filtering-Correlation-Id: 35dfaea9-1fb1-4f75-500c-08df17be5eaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|23010399003|1800799024|36860700016|22082099003|18002099003|56012099006|11063799006|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	zocMsnCb+ybO02EGEyasL2ah7foqbJcu09mBsm8C7Cwxbocwhrb6q3ReL7NX3zg+sY8IVnK/NmM1+vHPx/cj4+HoFUO6cfS4nd1AnJ+V4nas+O/KJ81ZoGvRccm9YDhm4siHlh2E2VWbPN6/oglXXcLyHHZBY0LRAUv5iPBhwMWRGkBWrxibPJPswysPw4wAew/daclKcFQw2H97lhBNiL6yDkSAgnXGC1cc5AuUwJsxaWC8KPoBM+1QNiTwy/1e/iMlXomXwvMEwhddiZ4ZTfFMg3biORPtITsVQ9ccNaqIK0sYPdu/kxf/Qxet7W1XPJkl5gHX2R+4X5fm8SPzOnFGU3zakJHKi7ka0h2R9pHDkZttH7tL3PHE8kVKVNXyONjm2UMkL1cMu8JnrCT5Bg8w5L4Mn9eqdxYxbSU5X47JDivqK0IoEjVYlZtT6mQhz/49woJHZoGYflWaCeivapyuqSQFIaxtInVyVJkIHwSJzMNX7zhKz44cZ/crLf66Yb/0ZU2DL/XiZwuvuPRGBQcmnYaoOMmFxN3YhPrFLCHuRfLT9sG7OH/M2rBphwdvLPvKQWh0zwQnXUuioANhZf/1EZJ5vgSDYYnbULLFW8vYPwpNb4ZReIgsm5I/9GWjaIK/aM1zXn+3Usy1pjVnaMrSnyc2RPrCwKhjy8G67VtC6eDor5hDXMZODFaeghDe5ZNNc6rWZp9u3SGkIl6ckw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(23010399003)(1800799024)(36860700016)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TgS7U5+v1Rnxk1dD7T1GqkggQcdqafXde+6ZcG8kORT8OEEr110Mes7cTiNtlvKR1LuxNm7h6zdwHzElcRWbXtMHtR3DYXyTZqjJrbO4UT94e5agZPZ4VCU8eytSLEFPvFPo0MzN55rvtWQaVAJzNEMbQN4YwbW0PRk5zCFX3VA5Ye0YuN3nS1EL06Q2hdolhQ1d1Qheh2xdAZWWQ9GPlZEk/CrFiaz2ZDi2/0ZrLuWeXfyDjYmSShvASXf385Agts7M89L5kC9ZPelJlFb7P+9kH3JI4e5uyGL47aLtDTBeCOY+JxRLBoq/2W84wMQrZvUNdfrUmb0iIctMbi1GS6Ut3nVmir9yPaoEEjmPPolcldBs29ub5UGiGbuFUCmRYcFQ31hakX0H62HIIW+COyVVLG/xVS+umIWry2b/1tdfEfKruPhvF46LHl+OnDNQ
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 08:57:30.8213
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35dfaea9-1fb1-4f75-500c-08df17be5eaf
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5655

Cache software ratio control updates when the ASRC device is runtime
suspended or when the target stream is not active. Program the cached
ratio when the stream is configured, and restore it after runtime resume.

Take a runtime PM reference for ratio-source changes when the ASRC device
is runtime-active, even if the target stream is not active, so a
hardware-to-software source transition can safely capture the live ratio
pair and update the source-select register. If the ASRC device is
suspended, avoid waking it from a control update, update the cached
source state, and mark the cached ratio invalid so the
first software apply refreshes the ratio lock state.

This also avoids unsafe volatile-register access during suspended control
updates. For hardware-sourced ratios, return the cached pair when the
device is not runtime active instead of waking it only for a mixer read.

Return an error from runtime resume if restoring a cached ratio fails.
This lets the PM core see that resume did not fully restore the stream
state instead of leaving the hardware running with stale ratio registers.

Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 sound/soc/tegra/tegra186_asrc.c | 106 ++++++++++++++++++++++++++------
 sound/soc/tegra/tegra186_asrc.h |   1 +
 2 files changed, 89 insertions(+), 18 deletions(-)

diff --git a/sound/soc/tegra/tegra186_asrc.c b/sound/soc/tegra/tegra186_asrc.c
index 2b67d23f5fa7..389bc1a294e1 100644
--- a/sound/soc/tegra/tegra186_asrc.c
+++ b/sound/soc/tegra/tegra186_asrc.c
@@ -118,6 +118,7 @@ static void tegra186_asrc_cache_ratio(struct tegra186_asrc *asrc,
 {
 	asrc->lane[id].int_part = int_part;
 	asrc->lane[id].frac_part = frac_part;
+	asrc->lane[id].ratio_valid = true;
 }
 
 static int tegra186_asrc_apply_ratio(struct tegra186_asrc *asrc,
@@ -171,8 +172,15 @@ static int tegra186_asrc_apply_ratio(struct tegra186_asrc *asrc,
 static int tegra186_asrc_apply_cached_ratio(struct tegra186_asrc *asrc,
 					    unsigned int id)
 {
-	return tegra186_asrc_apply_ratio(asrc, id, asrc->lane[id].int_part,
-					asrc->lane[id].frac_part, false);
+	int ret;
+
+	ret = tegra186_asrc_apply_ratio(asrc, id, asrc->lane[id].int_part,
+					asrc->lane[id].frac_part,
+					!asrc->lane[id].ratio_valid);
+	if (!ret)
+		asrc->lane[id].ratio_valid = true;
+
+	return ret;
 }
 
 static bool tegra186_asrc_need_unlock(u64 old_ratio, u64 new_ratio)
@@ -375,19 +383,32 @@ static int tegra186_asrc_put_ratio_source(struct snd_kcontrol *kcontrol,
 	unsigned int new_source = ucontrol->value.enumerated.item[0];
 	unsigned int old_source, int_part = 0, frac_part = 0;
 	bool change = false;
-	int ret;
+	int pm_ret, ret;
 
 	mutex_lock(&asrc->ratio_lock);
 
 	old_source = asrc->lane[id].ratio_source;
 
+	pm_ret = pm_runtime_get_if_active(cmpnt->dev);
+	if (pm_ret < 0) {
+		mutex_unlock(&asrc->ratio_lock);
+		return pm_ret;
+	}
+
 	if (old_source == TEGRA186_ASRC_RATIO_SOURCE_ARAD &&
 	    new_source == TEGRA186_ASRC_RATIO_SOURCE_SW) {
-		ret = tegra186_asrc_read_ratio_pair(asrc, id, &int_part,
-						    &frac_part);
-		if (ret) {
-			mutex_unlock(&asrc->ratio_lock);
-			return ret;
+		if (pm_ret > 0) {
+			ret = tegra186_asrc_read_ratio_pair(asrc, id,
+							    &int_part,
+							    &frac_part);
+			if (ret) {
+				pm_runtime_put(cmpnt->dev);
+				asrc->lane[id].ratio_valid = false;
+				mutex_unlock(&asrc->ratio_lock);
+				return ret;
+			}
+		} else {
+			asrc->lane[id].ratio_valid = false;
 		}
 	}
 
@@ -395,15 +416,20 @@ static int tegra186_asrc_put_ratio_source(struct snd_kcontrol *kcontrol,
 				       TEGRA186_ASRC_STREAM_RATIO_TYPE_MASK,
 				       new_source, &change);
 	if (ret) {
+		if (pm_ret > 0)
+			pm_runtime_put(cmpnt->dev);
 		mutex_unlock(&asrc->ratio_lock);
 		return ret;
 	}
 
 	asrc->lane[id].ratio_source = new_source;
 	if (old_source == TEGRA186_ASRC_RATIO_SOURCE_ARAD &&
-	    new_source == TEGRA186_ASRC_RATIO_SOURCE_SW)
+	    new_source == TEGRA186_ASRC_RATIO_SOURCE_SW && pm_ret > 0)
 		tegra186_asrc_cache_ratio(asrc, id, int_part, frac_part);
 
+	if (pm_ret > 0)
+		pm_runtime_put(cmpnt->dev);
+
 	mutex_unlock(&asrc->ratio_lock);
 
 	return change ? 1 : 0;
@@ -422,18 +448,33 @@ static int tegra186_asrc_get_ratio(struct snd_kcontrol *kcontrol,
 
 	mutex_lock(&asrc->ratio_lock);
 
-	if (asrc->lane[id].ratio_source == TEGRA186_ASRC_RATIO_SOURCE_ARAD) {
+	int_part = asrc->lane[id].int_part;
+	frac_part = asrc->lane[id].frac_part;
+
+	if (asrc->lane[id].ratio_source != TEGRA186_ASRC_RATIO_SOURCE_ARAD)
+		goto done;
+
+	ret = pm_runtime_get_if_active(cmpnt->dev);
+	if (ret < 0) {
+		mutex_unlock(&asrc->ratio_lock);
+		return ret;
+	}
+
+	if (ret > 0) {
 		ret = tegra186_asrc_read_ratio_pair(asrc, id, &int_part,
 						    &frac_part);
-	} else {
-		int_part = asrc->lane[id].int_part;
-		frac_part = asrc->lane[id].frac_part;
-		ret = 0;
+		if (ret) {
+			pm_runtime_put(cmpnt->dev);
+			mutex_unlock(&asrc->ratio_lock);
+			return ret;
+		}
+		pm_runtime_put(cmpnt->dev);
+		asrc->lane[id].int_part = int_part;
+		asrc->lane[id].frac_part = frac_part;
 	}
 
+done:
 	mutex_unlock(&asrc->ratio_lock);
-	if (ret)
-		return ret;
 
 	ucontrol->value.integer.value[0] = int_part;
 	ucontrol->value.integer.value[1] = frac_part;
@@ -454,7 +495,7 @@ static int tegra186_asrc_put_ratio(struct snd_kcontrol *kcontrol,
 	long int_val = ucontrol->value.integer.value[0];
 	long frac_val = ucontrol->value.integer.value[1];
 	bool change = false, unlock = false;
-	int ret = 0;
+	int ret = 0, pm_ret;
 
 	if (int_val < 0 || int_val > TEGRA186_ASRC_STREAM_RATIO_INT_PART_MASK)
 		return -EINVAL;
@@ -488,12 +529,40 @@ static int tegra186_asrc_put_ratio(struct snd_kcontrol *kcontrol,
 	if (!change)
 		goto out_unlock;
 
-	unlock = tegra186_asrc_need_unlock(old_ratio, new_ratio);
+	unlock = !asrc->lane[id].ratio_valid ||
+		 tegra186_asrc_need_unlock(old_ratio, new_ratio);
+
+	pm_ret = pm_runtime_get_if_active(cmpnt->dev);
+	if (pm_ret < 0) {
+		ret = pm_ret;
+		goto out_unlock;
+	}
+
+	if (!pm_ret) {
+		asrc->lane[id].int_part = int_part;
+		asrc->lane[id].frac_part = frac_part;
+		ret = 1;
+		goto out_unlock;
+	}
+
+	ret = regmap_read(asrc->regmap, ASRC_STREAM_REG(TEGRA186_ASRC_STATUS, id),
+			  &pm_ret);
+	if (ret)
+		goto out_pm_put;
+
+	if (!(pm_ret & TEGRA186_ASRC_STREAM_EN)) {
+		asrc->lane[id].int_part = int_part;
+		asrc->lane[id].frac_part = frac_part;
+		ret = 1;
+		goto out_pm_put;
+	}
 
 	ret = tegra186_asrc_apply_ratio(asrc, id, int_part, frac_part, unlock);
 	if (!ret)
 		tegra186_asrc_cache_ratio(asrc, id, int_part, frac_part);
 
+out_pm_put:
+	pm_runtime_put(cmpnt->dev);
 out_unlock:
 	mutex_unlock(&asrc->ratio_lock);
 
@@ -1103,6 +1172,7 @@ static int tegra186_asrc_platform_probe(struct platform_device *pdev)
 		asrc->lane[i].ratio_source = TEGRA186_ASRC_RATIO_SOURCE_SW;
 		asrc->lane[i].int_part = 1;
 		asrc->lane[i].frac_part = 0;
+		asrc->lane[i].ratio_valid = true;
 		asrc->lane[i].hwcomp_disable = 0;
 		asrc->lane[i].input_thresh =
 			TEGRA186_ASRC_STREAM_DEFAULT_INPUT_HW_COMP_THRESH_CFG;
diff --git a/sound/soc/tegra/tegra186_asrc.h b/sound/soc/tegra/tegra186_asrc.h
index 9cc8cec6c204..dabfd2e2c904 100644
--- a/sound/soc/tegra/tegra186_asrc.h
+++ b/sound/soc/tegra/tegra186_asrc.h
@@ -99,6 +99,7 @@
 struct tegra186_asrc_lane {
 	unsigned int int_part;
 	unsigned int frac_part;
+	bool ratio_valid;
 	unsigned int ratio_source;
 	unsigned int hwcomp_disable;
 	unsigned int input_thresh;
-- 
2.43.0

