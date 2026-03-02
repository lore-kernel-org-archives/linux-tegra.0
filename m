Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010065.outbound.protection.outlook.com [52.101.201.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F972E414;
	Mon,  2 Mar 2026 08:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772440724; cv=fail; b=UT+hLL9H3QrnFsWuK5dlMSMIEyI9tTcnkRtxfzLmQvm/PMvZLDr4+LOfAdKIth1+X/AqMLi2LML5Eu/GSVMqdDeKxrmMZRdPp2vxX36VcMrEykx0ZTr6Tl86EGhX5ft/BUaRazYSTEbgvErjfkvTPYwK2bG2DsYdlmQoIS5LGw4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772440724; c=relaxed/simple;
	bh=uQFsBb04dPhpCfi8mLFS4U0iKFmFR0exD7/swPeHTCw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=omayff7fEXv86KkmPWEv7FmEotCj3yu1nArn+ypEB2mWgKHiGbcgsvT0xVxdd3z8vhnKcGuwwr6IAv8vdQG3mE2oKHvoMCWdeT2i/FXl3JgVoMokdh7hUwe16bnA3TPpHgwKf1yaRMLTj3kAOIZs6tx52b7C6x2H0045oxq8wRE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GLfP2anQ; arc=fail smtp.client-ip=52.101.201.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GLfP2anQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LiwR5nwiYp1eXoUijVLotZcQvOmx0eg9VhDjK/B+eSNkvywPh0CLEBnttnlyKwOHFfCySZvewCWz/STMkWv7Yt9bAXhFupkpUH4KvOXZ5VzkvMD1jR9JYNdQ0dqY8hchL5QH9zFmGSqoqqX15bpnD7Dod+frLhA0bCGrsMrGfMIaYnz36om2zYJdUWR8/wV44RRoMpZMqEHOyJOnxDqde6+q66NLRFl1ABnzpAw86y8kVq0uJrA8imP0fT3SCeNuOodxN+DoNFAHrxGvh1m2fwU6jnw+CyWeaKKcVu8S8ahcPx1FJwDs6H6oOUtM03oZMX0s3JnJ+mpVHWZoNtOLww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XcAHj4o8MLmhUNnFQV/wlcOnnq/Gb3TWbjduz4iwO8k=;
 b=OXC4SEwb5DA+r7tIy99+QNSQr57wf8IeIFmsa9GLd6GLXFKQWYjPijg2ZeSGyhbkht2+Wh/kfel9coG8cEPJNcNum13g9a34T1rD7BSJ+PI/ESXC3J550BaWjzuqkHqfTm4+FUtq00m1esYXd1FNXkjeSuSBUjdBCPxTxNooH9/hbx7gyaGNqtlOsr+TnHozhBo/apEd5IUAs/Xmc2AIkT6dmVfifiRet5bvMrh8DadxgD530NHRHRzRAI26vPQqQTS1U5SIS0rQVbyt5xbzDB2trV1yjH1HEOVUz5gs4Q5p2un7JMxH8dwjHR6BkXlrDrlHVZndq4mZyjya138D7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=perex.cz smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XcAHj4o8MLmhUNnFQV/wlcOnnq/Gb3TWbjduz4iwO8k=;
 b=GLfP2anQM0Ps/RM274IX3MoPwdfquLNQLMWSHeuRl1DmS8uS/QeLd5YnJ0OkhNaeEB2QvyO2yG8sbA5GOeMxoV2JSH/y9sisl4y/CZrqTPH7O0kdiKUycWEOwWahH9ECL2BvIOC2ZE/FQP/hd9ltgRQin9igeV6jek70GBlQBsO42FhzN8yu5vO56RTnHAIDnuNuqVtIRYvUswlx90g/JLPuxu0/CyLEbQ5tT7ia5tbaEocSwFn2uw3vmgvCPmm3xXsu9a2YNzSSyI0bfhxVE5AkQDc/SRGqC6IBrPbpdel3EQtDFQhpMRLW/DdpaDuQi9QSAnapSft5L1uIUmzBRg==
Received: from BL0PR1501CA0025.namprd15.prod.outlook.com
 (2603:10b6:207:17::38) by MW4PR12MB7285.namprd12.prod.outlook.com
 (2603:10b6:303:22e::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Mon, 2 Mar
 2026 08:38:39 +0000
Received: from MN1PEPF0000ECD4.namprd02.prod.outlook.com
 (2603:10b6:207:17:cafe::e0) by BL0PR1501CA0025.outlook.office365.com
 (2603:10b6:207:17::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.20 via Frontend Transport; Mon,
 2 Mar 2026 08:38:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MN1PEPF0000ECD4.mail.protection.outlook.com (10.167.242.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 08:38:38 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 00:38:21 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 00:38:21 -0800
Received: from sheetal.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Mar 2026 00:38:18 -0800
From: "Sheetal ." <sheetal@nvidia.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Thierry
 Reding" <thierry.reding@kernel.org>
CC: Jonathan Hunter <jonathanh@nvidia.com>, <mkumard@nvidia.com>,
	<linux-sound@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Sheetal <sheetal@nvidia.com>
Subject: [PATCH 1/3] ALSA: hda/hdmi: Add Tegra238 HDA codec device ID
Date: Mon, 2 Mar 2026 14:07:55 +0530
Message-ID: <20260302083755.3134536-1-sheetal@nvidia.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD4:EE_|MW4PR12MB7285:EE_
X-MS-Office365-Filtering-Correlation-Id: bb4c99ea-e080-44d0-e883-08de783719be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	vTiakd2pe3Gg8mvSuEGygvyS8hQmW8PuLc/AvE3fJNvDgvVMU2Au8mrGUwDm1obNZzmCyc4v6tgEE20PV9Nt0WixgUDR61pOfq0BhtBW+pO7mT9EAp8lfuYysFaYn1585LQPJzq9g3BOZtoNjTEJJcHiXaWiSUt1cFb8owdJ14+Y4osOyxtJeZVO1PqAfbQgkw5AaAmb9SHC20jcX8lKrg+/IfhLo2JSZXxIuUwLo+3iujyC89kVWdK/P9vKt/kPHJttsBJ2XM3GTRldJYCYvlz7LYtFxsDYjUlXtxHqnuw5L95K0j2tJpzBjRYvP0n0EMfOgpDLp342tfKGyNrQwN+5Pma8J0aONqyc5aN+euE7qyg18e/jewjcM3Ifhk/qPF+yF3fnTm5ARBxBtWCpNnC4vH3XL4oGNl6PpkSJ1x14eFm8o39BG9cZAYDrHH09FAkKO+wFAOG8KvE8IY6d7fIq50GVEC6IMhtvEpAi823EGFHrVwhylQ1E+afE+QZvrPti1vfHGHuaYjexnK2lJbii5BljkitDQw5rRO1r3qaL+NpbjHdPhAwHblm0OjuvD8qAZQLBIT2B6azLb0e8pKRi3ReReoevdLfnwxfrnbune6ujKk1EH09Gszhyu66bsLVzTV4jEB9T83vIF1aoBW9UNcs+kghXAAa/CivwRBjcxEO1ciFGZPNZ2fc46eZ0ACPk7VgjkWPkhUxUQYj38rBIbziwexnKgFsR+ouaTEjJEk86kUVJdtFg7chH2Nf+RorVy3FK6e81h6EttCAWXC9LrljoGyLjBRWi+qfvct7K2UL8fL3N3jGhiPOO4yW4mBgWNh75uuvePuKYWN8snQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	eZxQvyyR5NCCiESccXZByPaviHd1boLyl0vhKXQmM05tP28FOP89q/k1Aqy4daTbL7JpMEv9bf7L1wddQeFSW08t4FBhHe+qvtoYePAiFuFY6juzm8bUHe5+8pJYHpe9TGRT8J34XSh0NY4FUprubaGqLKAN5kjBno42PgYPpkv9gLn9EghcCFq600ANQ+lJFDLo40q4uRBIjHj5gmtWCJY/9oOm+YagBZ6o+RcLHWwnnUVvc1LbDnVFOqi6jotyuNu7tgyuMKtX/nIpe68vQirvhWvSCfLge1r7zppEAhjs6h+R8/wv9DC0KEvsDRu3AlK1RI6qEhVLMYGghFDmgQDaYViE4/UVds4yvfX3Zgal/rg+6/EdMboWIs3SP92KqPRS2O0T+leI7Qh2Gvt2ykRDVizZWj2ymhA5+jj/duw2oIXLU6ggciTO75tGeRJm
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 08:38:38.1820
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb4c99ea-e080-44d0-e883-08de783719be
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7285

From: Sheetal <sheetal@nvidia.com>

Add Tegra238 HDA codec device in hda_device_id list.

Change-Id: Id47614425ac49037cd074a3fdff403b6630598eb
Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 sound/hda/codecs/hdmi/tegrahdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/hdmi/tegrahdmi.c b/sound/hda/codecs/hdmi/tegrahdmi.c
index 5f6fe31aa202..ebb6410a4831 100644
--- a/sound/hda/codecs/hdmi/tegrahdmi.c
+++ b/sound/hda/codecs/hdmi/tegrahdmi.c
@@ -299,6 +299,7 @@ static const struct hda_device_id snd_hda_id_tegrahdmi[] = {
 	HDA_CODEC_ID_MODEL(0x10de002f, "Tegra194 HDMI/DP2",	MODEL_TEGRA),
 	HDA_CODEC_ID_MODEL(0x10de0030, "Tegra194 HDMI/DP3",	MODEL_TEGRA),
 	HDA_CODEC_ID_MODEL(0x10de0031, "Tegra234 HDMI/DP",	MODEL_TEGRA234),
+	HDA_CODEC_ID_MODEL(0x10de0032, "Tegra238 HDMI/DP",	MODEL_TEGRA234),
 	HDA_CODEC_ID_MODEL(0x10de0033, "SoC 33 HDMI/DP",	MODEL_TEGRA234),
 	HDA_CODEC_ID_MODEL(0x10de0034, "Tegra264 HDMI/DP",	MODEL_TEGRA234),
 	HDA_CODEC_ID_MODEL(0x10de0035, "SoC 35 HDMI/DP",	MODEL_TEGRA234),
-- 
2.17.1

