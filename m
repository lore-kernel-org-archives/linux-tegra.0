Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011063.outbound.protection.outlook.com [52.101.52.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8054908A9;
	Sat, 12 Sep 2026 18:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789237288; cv=fail; b=Go/ZSo0gEu8GN9Vo/rQg/7knFWSo41ZzZ//upLAOojxxOqcKzuicPnpTsoWRCka+KeUbeWpHeSnuM4cPK5elnG3jetjaeQemiIiDi1MAFM5ImmRapjDtMkB2WLnxcFiXz1J5T0+rFSl9HII9o0Mt7oC5cSB91tirJ7gY34Xp8bU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789237288; c=relaxed/simple;
	bh=YkCTIoli139jsMkLcG0xTZkbRirPzTyO5gWPnSbI7ok=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=QBaurDHGeD4Mg0mm4LxRrRC0EtBDshe3meE8+fKxi/BJG+wnik/inJkMuy8oN05OAnL5SJaqdHbfmfLLEt5ubNWqF8+QExu3YRVt2pIoupiyQSF0/UmJrNBhZgU3qqiw6j7svm3MALQ5zknDzzBxS0MTuzysz6e0J82LKP/DldA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Elmv60hA; arc=fail smtp.client-ip=52.101.52.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Elmv60hA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bxZivMWXVu2Qpp1BuzlBSNVDUPUC/mUWSnNRf1pmaAzClUNxcFLFeWoH1XKfRD0lPoKSq9emvbJJSgS9Cz1Gip/icGRmWRxTMqEGlWCbB3lfscSFar5wYgsPZmXJ9jbExOAEkFOl7LpLyX//UFBbcIyBa8lByVZAuIB6Sf5JyOUzrmYEPmnYst8n+u0B4eAn4mFohAZjAmEfzMRVqwRjyKZDBVwu8ys0i3puOQ/+TLr0H+2zqhkC0nZqZ+4SmaIe8q6LWZmKt7fUdmmoDckvHV6oj2LlQy2wShf50Nn3YI2ekAs34UFPGqFLgI9CMoMLmoCW/bGGs/ybKwUtI9pZbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IxNKnjO3rKr3R8Lyur2+oSWdv+0RtRz88PdgktJF6J8=;
 b=ocaokV5cvPYPr7/PdzNj8QYFwG1SkY6phH+/XWhv4Pv299bFUwR57AFby/vexpQcdbiKOFhfsRlna2XVuEvqsd0XkXhosHsFbI0Io8Ct+TjCwrpfS9CfO74D7/LW+ZnMwXIYFvBDLsVhYyfmNdkiFTm+YR7QCIsFcimVIJmfF69fYUJa+2sYypF0gL66mxFbF/nELmtMcrE3z05hTVZj88HRKrhdtLf+NZis4ITdCsbvJKeB4enZ2tvFKwSpgYIQ7atVCVtPP7J4ZoCEWfj50BaJJG3iDxfF5ex3kj5dFP4R72kD6bZa6E7E/Vk8otWHAsIh096D/BShSKp83YlUOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IxNKnjO3rKr3R8Lyur2+oSWdv+0RtRz88PdgktJF6J8=;
 b=Elmv60hAGe+ayPlzfFLrRH/tyLhTR7C/PBMqp5H51ECepNqJ+LngnILb16VPVrsOdeeZd5Lo7kIbTAeukKrr7IIdjG0IUvoykK48mEek78iJh4IEM2nW/rg294bI270evwQ5spYyfiBIckMgHgDu7rfQE8pGSIs9c/f+paf5z3S/xm/rZEW9iDJOVCZiAQ8TH++pXzR8pBb1i1vXXVSi5OsxfdzP77SVTEec0+ENraULvinozJSIU2baGwFQcigTDWjSTdlejjzKPu7REaqAzJzLkNold1BqCJhcyzeQVHvvz61ogC0SLQOWeUvI/2bsYSXFzTNOam+Vp4FdSdhaAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH0PR12MB5089.namprd12.prod.outlook.com (2603:10b6:610:bc::8)
 by IA1PR12MB8495.namprd12.prod.outlook.com (2603:10b6:208:44d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.11; Sat, 12 Sep
 2026 18:21:23 +0000
Received: from CH0PR12MB5089.namprd12.prod.outlook.com
 ([fe80::cb31:7ebf:51e3:d9f6]) by CH0PR12MB5089.namprd12.prod.outlook.com
 ([fe80::cb31:7ebf:51e3:d9f6%4]) with mapi id 15.21.0406.007; Sat, 12 Sep 2026
 18:21:23 +0000
From: David Cemin <dcemin@nvidia.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH] ALSA: hda/acpi: add runtime PM suspend/resume to the ACPI controller
Date: Sat, 12 Sep 2026 11:21:20 -0700
Message-ID: <20260912182120.1156356-1-dcemin@nvidia.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA0PR12CA0011.namprd12.prod.outlook.com
 (2603:10b6:806:6f::16) To CH0PR12MB5089.namprd12.prod.outlook.com
 (2603:10b6:610:bc::8)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR12MB5089:EE_|IA1PR12MB8495:EE_
X-MS-Office365-Filtering-Correlation-Id: 63c79967-68e8-4e02-ea0b-08df10faa6be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|56012099006|11063799006|5023799004|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	qg9odUtwG+aMmNcqFr9KfH/oRa8kfqH9xjrNKAwFWyQo6zTMGzlzuiwEpyiqzzsJ8BOC5XGhkz6BC9SxOUXC8OWCxS3rFFUW41s/lusWO86gTdMQfnQvgN/0uqNuaxdgG+GPaNagSFeNyAmwRz3olkxGZCpHkgmYMPHLoqNkknOVDENCwm1cF4eOI6F4CxOvIbZ26EJADNlbhFR++13x1NsTvMVXLVtvfDmALOvzD0p+1MWZiE2rmewXP+zmOJQHkr85TLBwTzQ5zzUHHqaZFEpxSDbAWiXBM+wmqJSxSMuuPZDdp1ccbMkXRQ380vo7pqPdcWhxQwLHozSDtgH3XPsu9wCkrpvGBz8MwpC2BdatAEYEN5jtl0zyvdL++jgZFsciNMg3fjHWaepfV8C6i0zzQEfjZbDfVHgbz3VHQy1Ej0dW3lI5ITtEW0NUvRxFR+CZoc9Nef+I5l23Br7Nd89u7DnvLSbzSFXyRHve+hw7VOvD+yb2H0AH8QoefSSj212JQ1YMxRkbmU4TyTsxAj1CWC0BpAMMI0+qJ2a9LApcUeBYG5Qb5Nykaq/hvxPJR1pVrtiXd8TVrgRw+1OALyrBLKTRoPqr5JBXQ8koIGBKyhSYR9kurzXXnMEc9Luvz0QyfdoSqiFJ9k7PVH7AloJZ0ln6IxMWtcSeVBcH3Os=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR12MB5089.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(56012099006)(11063799006)(5023799004)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EYTeIdsP+F9J8yxViyJcGz5fNb0ZJ787ltC7K4GbpSYr+vNlHFDIgjSShTxi?=
 =?us-ascii?Q?6cBvCOxJlZjBs3m9Bzu08gYLR5VThVPG1JgfTSusc6oQ/4sMuELI25b3qxux?=
 =?us-ascii?Q?BsPbKwdKcolHVuNvY0TG+cRvZadyjn6TXIICYLWcPvqg8Z9q3lC5c33yhEBi?=
 =?us-ascii?Q?Fmyp+o7uRxVjbAIdcfX6k73XodjCa7jbtqhdlr0OPg2yLlce8AWYKrK3Klx1?=
 =?us-ascii?Q?bkSni522LsJ/6AAlmUn2xF4H/N1Cg/d3BPMk7z44AXWGDDfNj7yPzuFCJaO+?=
 =?us-ascii?Q?wluJ5bXLdiG54TKhhzazuk/mp6JGn/niXZBZbqPyb8SL1TmdMHeE5QzJRlB+?=
 =?us-ascii?Q?cvTKEyosO+axFXVVa1iQUan39oTlRN1lOcKgrT16VbN3VSUUyl7rbF7Xvmw6?=
 =?us-ascii?Q?XaP2f4HZREOaf/p/oOEjTyUETdIHakB/lAKSLPXjJaPK3v40AGRSiKlGTU+t?=
 =?us-ascii?Q?BVHJoMWz/FTfEFI0k45G/cpEAqGCFiDiKvRmOMOLN5PdOe5r06+oXHpAi2Rq?=
 =?us-ascii?Q?cx4yR9FtkCEuEa2aeQuvIQEH2nOI3YMToNTug1kalUnVAkvFiwdeaaJxSFS+?=
 =?us-ascii?Q?6PXt7NaOIkRyqo1LveLSBtS3FAx71aw1VQpRHGq7IVyNzk2xMLi3xXXeYIvm?=
 =?us-ascii?Q?MgCldpNpDW6W2cP7U6GvsceWlKlCDsBqxFaDxDUsny9rtttdPR2v8CXSC4NP?=
 =?us-ascii?Q?vqui3MQwODC5FEXDVal1MQPO+6GDjduc7+viRQ8QpXcO9JS/uM5pCCMkYj3I?=
 =?us-ascii?Q?RMeiuT1Rc/vPjqE2FgugA4R/FSCpYRzhe+IYAIADsJWZVquQJHBTP4VOCKM8?=
 =?us-ascii?Q?W+y4PMgvODhrMV9+BaWXFz+7JPjxaD1udnh1IcVKddbZhQtmbkaVOMtANstx?=
 =?us-ascii?Q?TUIIxLPahyk3lsiJ2fMNEkOWyLzMuOWcQ7/9pcp8XI4hRiPB7z0bRgCA4fJa?=
 =?us-ascii?Q?QjLAB8MQi4dkybsymUu/ysMwG9jP+eaNq88Zz5EtBNyiDCbyay1suJwL1tpz?=
 =?us-ascii?Q?OLRoPKToN1F/bbHlZZ66Vsp/jsXCL+2bk+szau3BKaxJbXbxtGQeXGZe5rzN?=
 =?us-ascii?Q?Wn/Qo2jIdDdSmkcFPgyBktQmSyG+7mF+Mghv+WGdhGf+xJa7yMtrUz6CEMMN?=
 =?us-ascii?Q?47VJ9g61WJvlK0fioZsD08mPLlfpiPdYLae2VnFx0EMyirMN91rYr0UIT8+T?=
 =?us-ascii?Q?kqF6FS7Ev0hqQJEuUlni8VEn1YFL4SkqVvaCoN6SOrBOzIbBhz5WtkfxF5F5?=
 =?us-ascii?Q?hr7q2xzilICJULW0qcx2FLvXlVq1vxnskIpfFyb88e72PaZCy64sL+EvOG5A?=
 =?us-ascii?Q?gQvpI/8+X/KJsx11yPiN/0mfiB1ZRG7EggIP6kdxsmPWdy5xcOi4I/oEjOpr?=
 =?us-ascii?Q?QuK0CW7EB0suKyV1afUhqzuTVAI769pwcxLbmrfZkxeWOomkwf4hEoaRvo2o?=
 =?us-ascii?Q?03FtdND4d5wODyl9aDPO5qfgPfkXQkPBC7Kd7Q0r5VIUjd0bcwhTNckiAgk5?=
 =?us-ascii?Q?dMVm+tPeNcFAoywzoLLO4dZs6S8jmNGRD0I4p8igv4j/tNjF+QVKMIVyY1YO?=
 =?us-ascii?Q?kK+Q/snTBsK5STDL4QhTTfl4mAyZw1njXyN5p2xh83xPwyjonRXA0Id1CrWJ?=
 =?us-ascii?Q?AgR8zkC1dqlPlMF3N7SxC2Hkgmaevwtfyx/F+cq8t0CZ0fhyXD4tVMe9ulaE?=
 =?us-ascii?Q?Sa0OpHhI8c5a66/dIzWVRi2mqSK9KnFxX70pK3L+fxIIFZiU?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63c79967-68e8-4e02-ea0b-08df10faa6be
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5089.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2026 18:21:23.6782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ePNf6CugnCNHgSw+xVHBoc+oKZ7trGDECjrQfk1kFKJ51iizxlmCcusxOLoB27D6MF9yrWIhYMXTmtdkTKg0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8495

The hda-acpi platform driver never enables runtime PM, so
pm_runtime_force_suspend() in hda_acpi_suspend() skips the runtime
callbacks. On resume the controller is therefore never re-initialised:
azx_init_chip() is called only at probe time, so after S3 the codec
verbs time out and audio is dead until the driver is rebound.

Add explicit runtime_suspend/runtime_resume callbacks and invoke them
from the system-sleep paths, mirroring the pattern used by snd-hda-intel.
Tested on an arm64 platform with the NVDA2014 controller: resume latency
drops from 81.5 s to 3.6 s and audio is live immediately after wake.

Signed-off-by: David Cemin <dcemin@nvidia.com>
---
 sound/hda/controllers/acpi.c | 41 ++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/sound/hda/controllers/acpi.c b/sound/hda/controllers/acpi.c
index 505cc97e0ee9..04b261dde22e 100644
--- a/sound/hda/controllers/acpi.c
+++ b/sound/hda/controllers/acpi.c
@@ -266,6 +266,38 @@ static void hda_acpi_shutdown(struct platform_device *pdev)
 		azx_stop_chip(chip);
 }
 
+static int hda_acpi_runtime_suspend(struct device *dev)
+{
+	struct snd_card *card = dev_get_drvdata(dev);
+	struct azx *chip = card->private_data;
+
+	if (chip && chip->running) {
+		/* enable controller wake up event */
+		azx_writew(chip, WAKEEN, azx_readw(chip, WAKEEN) |
+			   STATESTS_INT_MASK);
+
+		azx_stop_chip(chip);
+		azx_enter_link_reset(chip);
+	}
+
+	return 0;
+}
+
+static int hda_acpi_runtime_resume(struct device *dev)
+{
+	struct snd_card *card = dev_get_drvdata(dev);
+	struct azx *chip = card->private_data;
+
+	if (chip && chip->running) {
+		azx_init_chip(chip, 1);
+		/* disable controller wake up event */
+		azx_writew(chip, WAKEEN, azx_readw(chip, WAKEEN) &
+			   ~STATESTS_INT_MASK);
+	}
+
+	return 0;
+}
+
 static int hda_acpi_suspend(struct device *dev)
 {
 	struct snd_card *card = dev_get_drvdata(dev);
@@ -274,6 +306,12 @@ static int hda_acpi_suspend(struct device *dev)
 	rc = pm_runtime_force_suspend(dev);
 	if (rc < 0)
 		return rc;
+	/*
+	 * Runtime PM is never enabled for this device, so the force_suspend
+	 * above does not reach the runtime callback; stop the controller
+	 * explicitly.
+	 */
+	hda_acpi_runtime_suspend(dev);
 	snd_power_change_state(card, SNDRV_CTL_POWER_D3hot);
 
 	return 0;
@@ -287,6 +325,8 @@ static int hda_acpi_resume(struct device *dev)
 	rc = pm_runtime_force_resume(dev);
 	if (rc < 0)
 		return rc;
+	/* See hda_acpi_suspend(): re-init the controller explicitly. */
+	hda_acpi_runtime_resume(dev);
 	snd_power_change_state(card, SNDRV_CTL_POWER_D0);
 
 	return 0;
@@ -294,6 +334,7 @@ static int hda_acpi_resume(struct device *dev)
 
 static const struct dev_pm_ops hda_acpi_pm = {
 	SYSTEM_SLEEP_PM_OPS(hda_acpi_suspend, hda_acpi_resume)
+	RUNTIME_PM_OPS(hda_acpi_runtime_suspend, hda_acpi_runtime_resume, NULL)
 };
 
 static const struct hda_data nvidia_hda_data = {

base-commit: 841e384b841a3d89c50b4b2d6c5bb6abab1a7e39
-- 
2.55.0

