Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010066.outbound.protection.outlook.com [40.93.198.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890AA305692;
	Mon,  5 Oct 2026 08:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791190503; cv=fail; b=aqQgymtNYjlvN6V90k5Qxsf+DS+zU3qdUnGbSwI/GY0EUhBe0eGnx3SQGm9hc0RkI6drIBjYSrQRvuju0/UeunOw2ftPVC+lOfOvZQtXUla98WtKpv042YWXoznV7AJQ83/5OEYHhP8fSPDw3SuBR6PSSpxkgmkx/6M5Hbo9+jc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791190503; c=relaxed/simple;
	bh=52b7TsMCTkA9olkXXQC+p51HlXpc+eHPUrRhg8ETKSU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gmAiBVvN7Ur9naswiaJuQw6ZNqbVVqqkYrx9kbUUsaO57PCBqIGDCX1tOkmClK+IcCXamNjnSkeLk5JxJXzm+CJHtVWylJA7eedMEDZgnf7SLPZmAIVDA4mJQPnyYwTT9C8RwZhNzcUnV7ojZ1F3QGjfKQGe7HhpIHJHlGqtrxs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RjxwxK1o; arc=fail smtp.client-ip=40.93.198.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RjxwxK1o"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ikkiviEmcr3YGt0u4UCHPGtj/BKtr6CSfN98Bt6lGhll5GiA54qKOH5M8AaxHpNuadHnOXi4pRYae1OyJoXxtrHndxZJ7n8ohAoErkibjYDD1Z8BL38alOeU3jW8vJeHMjEDCyZS1ALhQ5mwVr5OYB5b3Py9cFBVO5Y65hT8h9Czq8JzDv9JpYFbYHWi0RvZpd/zhkNtcMK4mY8tHJixQLIALNUBm0WvlwpJkF/9c7Cjbdm+f/HnvARPSU2Bj7AlOiKZc7f9szIh6eSrAIilqVIoX3u2iR/d+OrLeBDmfT6Q5w8wKj2KG2MKqRAX2SnfYB2Mr7f4cnArhjOlceu51w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=06197pvMFwVfW8kXeGXWeM/Zy8GFi1GGbpXbbtY4n1I=;
 b=OPc4WlqcSWLCrs13nky47NhM7v0coqZk9BfgBr9qI4F5JwoZxUVwYSoIaSwfzTLSsfVp8ZZtncpST5FXMU5/c1loqVNxTXUFJaSm7dDl90DV+MJDAXDdW7r8BboCMCUxJVn90yWsI3Yydc6dFKUwxkh6LZ+sfbMyQZm61YnjkkG4dqY10aoMg4FI4L0af4+Klhvi0LW0rrLVZ3zYlAtsrX0nmAOhDPxDmk4KgmM8ZuSY9CZqnwqllT8a1F8CNiDKWDICXA+X/k76GqN2rADfsufeqEEZ1+raJNJLWV8h0vYc5cE+KlW9ovfH9TfCajl6eDIqm0+WH79nwgFf60+syQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=06197pvMFwVfW8kXeGXWeM/Zy8GFi1GGbpXbbtY4n1I=;
 b=RjxwxK1oHo/MRSzmXzWEgYZkLykezy5qJttlt1lpSREsL++bgoTkCigNVsyDtc3OomzvNDM12qu1Rlt+uLlfxWqWj5AMYRNfbXpdO2uh9TcfLdpLolYAdfnMuWPDdFQ2algsjVo2GQfDtH2mLDL4s3uo7YL0TXVy2Ov/b3VuaHNKU3klfFO3dcfQG00eemJkoLqYge2G0F05WUm9+X6tNz6KSK9U1ybA/DH9roGINsuwVenhKEgZDTxXiod437hcLcSG4C5G/PB37OILvKCosx7Cjx9+tsEtSZrFS0UnvZURVwqvcC+c/qayYCd2Vp1qiH6VYbwGV8wtYqvF+0gTjA==
Received: from BL1PR13CA0072.namprd13.prod.outlook.com (2603:10b6:208:2b8::17)
 by LV3PR12MB9236.namprd12.prod.outlook.com (2603:10b6:408:1a5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 08:54:57 +0000
Received: from MN1PEPF000793FC.namprd05.prod.outlook.com
 (2603:10b6:208:2b8:cafe::6b) by BL1PR13CA0072.outlook.office365.com
 (2603:10b6:208:2b8::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Mon, 5
 Oct 2026 08:54:57 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MN1PEPF000793FC.mail.protection.outlook.com (10.167.249.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 5 Oct 2026 08:54:57 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 5 Oct
 2026 01:54:37 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 5 Oct
 2026 01:54:36 -0700
Received: from build-sheetal-noble-20260902.internal (10.127.8.14) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.49 via
 Frontend Transport; Mon, 5 Oct 2026 01:54:36 -0700
From: Sheetal <sheetal@nvidia.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Thierry
 Reding" <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
	Sameer Pujar <spujar@nvidia.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, Mohan Kumar <mkumard@nvidia.com>,
	<linux-sound@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Sheetal <sheetal@nvidia.com>
Subject: [RFC PATCH v2 2/2] ASoC: tegra: Cache ASRC ratios until streams are active
Date: Mon, 5 Oct 2026 08:52:27 +0000
Message-ID: <20261005085227.2133834-3-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF000793FC:EE_|LV3PR12MB9236:EE_
X-MS-Office365-Filtering-Correlation-Id: 99d86a02-0bde-4a6b-34d2-08df22be54e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|36860700016|82310400026|11063799006|56012099006|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	NTqGPyYQpQ6GeAneHdvd6fAeBBOvWxdFIOLBi0euMwD+dQLQnq0IwEFCjPOHE+Oe44aC9/8k+5XCSo6R0Trt2LQMinzSvPatigMzLmojiRq2Uf79akTH9XuzAJPcx8FIQw8fl5srs86U5mqn8ROmtxOUjCb10Dfj55SUVQdV7oQpl7h4g62avkAiDe4kcf0srebBx2uqMkeDP81Owk0Vz6CSQbZJ7ix6LIMaLnpg4lbCC26qtB2n/F9CrpUz2e5hItAXq0Vh3YlaIM+bO+Dma3O19p/ygdOdqs6ZjH08whFHzLi6AnR11fKPjzCE1CiDTDmOwCukLcqVOgky7cVjRM4fDhUj5LqHVJ2S3GutaRJ0DDO1FmR7chJJtahdu7uZ0LFNmVU0D1ZAoYlmw/GPC6PmYwYOJzVKyozXW86IF+fybiLMM0stp3Mih/5d4bXCpIioJB6UPrEUL8g6xjqck4PdGOJ7jQ59B8qU846RzqIkUs+53D0HJ+NIqhJLtFNa0osEzL2S0GkK0zsu8CNaAgrw6ypt/iII4zJc0e4o9mr/sxSmx3ood8AlGD4OuHfUTh7Ky5iTQ7ODSIe05N0xTQGhJVFSzLAmQuFFkRvtLlZLc/+quJzQG80HjKJ27Ok8S4vFVu030iCoYieGIZN6zCU+BTnb0iQSvOj4vjEkpwFcXCPWN9ZxlBpJPOKda7OAHeUyqAowFJ3pMaVbHsmFAQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(36860700016)(82310400026)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mCyk7hmsmwVOoctIg3z195JZc7gUEvTk1zybndmyHIpeTjIXZ1KUvLtlxVmArFLEI7Fvh9x417HDM6CYgt7XYj1A/PC3NLlnI8qrVd21FXX4wQSwYDlGw9f+VnLqa/1AuVj4pnrh0STWsy55liJ8Ke1XnbrUet4ER1skF//2dUEc3ICmSnmM4bfcLmiwQhnwEHouf0DBDDKvHq5FLhz9mFQbL4r7HclI//YlBlLzTcja3zhjEZ0kMFzwkL4uLQ0mGQQz5teJgoA5tAQjLTpZUGPEr+gpEhLvWpUIUbrbyoaevFOnlUICs9xE4sc99r2DuBsvPyae9NLab8H7kCNbBDrpN5DYk4V0Sawe9/ii1Wgr4nucOxtPTNpTSyf02FNbyJ+kkeD/kVPLLTh4WAiOoUVdSO5PJTi0hTzkF5FNjmXb2Ho4qVbdadVwVNl3C37x
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 08:54:57.1747
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99d86a02-0bde-4a6b-34d2-08df22be54e2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF000793FC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9236

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

