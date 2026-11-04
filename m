Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793788244;
	b=BJf5k16Wfm8cUXW7hq0cVgtQlLKMIBwAvx/KcyyGqLwnDjVLzO8XHR1t1McT3UZLrLJL
	 I85GsZjqNB/3N1UBhPOF4xkaHhXFkev8GDbfJ1Dil7b8QoALo7EoMqLZ8xhcSf2+m/6i+
	 gmHmJ5pN5ra/46dSBLKSuxA3Mrl7i40oA0zmKzh4CMLyOnDdr2Q54oEJ0Wx6YdaXJ9z0f
	 EqdgKdbwqZQA6s8JdGHEobbFELFwteq8OeOxyV/qAw+JMola9dgzVP9mHyUxmH297Fm/j
	 J/qXR+76zuSWJFxxfTo1VVrbAwvra0k0krYVmz7CniHRvPvddvZz0bcIYlnjx0DBu2A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793788244;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-NV-OnPremToCloud:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Av1xQTGdchiV8cnAwMZBJLGD3c2X8M3+RjpfgAPIHHU=;
	b=Totn/tHsYSKRPqXtYuTo+l3uW5wRe7bYdYO1TQ7lY5iYJKRx5F6SkQZYa7YLZo0CPloB
	 lf9fACVBGJW6edIDCCDU2rpak13+qrnTZl3z9zAoQs1b4gXsEe1UbF9/OPlBQoehETp/M
	 nP0KzLX8KJhMDuNPk7ClpSun7SQsdVqmWSfmfqq1aHia1qt9X4ibftFUn9AD+hdi3JL/5
	 THw2gCIFAqCOcQt6pfAZaPhJlFRo7dCJnmfeKDxjLRGAdAJt7LnN97o2kpS16b1/ErzJC
	 BhmnUmO8td9YR1No2usr8hqunWJP2/AE3AP4Zp00qvIcnjbmMOqkZn6dK3qlhssG3iA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=XVI2HT1R;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.48
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010048.outbound.protection.outlook.com [40.93.198.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2398606A326;
	Wed,  4 Nov 2026 10:30:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2398606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=XVI2HT1R
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NuEBasfTf8O49hdR4O9OSJ02BKOWDTedcQATAqMH+K3KB/HbgTdQ/qoUEHf5dQaIWQGjHxImp8JiaESGRPUVDW5Yen6ZFd+OVCe0SlD6v4pdAx3nHxLlM7xj/pPuk91fHeDNjDLzm+lg8AEhu9aQddwM2ivbFsmHrKXqOkew1D/j5EtBO5OrW+lUt4Ea3scDLVs2k7PHTgEDLD8jlwgn2Xmv9wjC5IqolSPolFWoSPRdYAypPTp1OPdBzc5XX0BqX9E/OqmjE1AQiFRnwnLlF9R7usnJ4lnAGjiINszZOZ1ATCuAvQl32Pd6pfCtd1gsjPzPQ+uLNri2zKOUAl1lHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Av1xQTGdchiV8cnAwMZBJLGD3c2X8M3+RjpfgAPIHHU=;
 b=lFnRfFaMmvX7PLbS2BMUOMCX9ktQrZSwafMG2BNLAd0Vrc4IaeadAefnJRvYlN6otP0YHvsL5DHyD7k0ZuUzCCNcUXXRR+b+5to8MeRpnvaWxLFRXSjRL8GZjFNFU3H9/NRLPZzOthNp7rgTIxmUEq4U5E9WUpRiiZe/oXDkLhlki8z8o7qJFrLAaMRdX0UCoMwU+PZE4dTixKWuFikvVUqht4SOWpZnrTKS02+uOqVSkUOH+0bhly50FinURpF6o7yBZLNqiiORUcJaHbcjbYLDH+Nip5N6BIrbSzQyN7xPiOBTeNgmnCqW98rS2rHh4azUWQxvgQ9vMl86ubd0dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=perex.cz smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Av1xQTGdchiV8cnAwMZBJLGD3c2X8M3+RjpfgAPIHHU=;
 b=XVI2HT1RBKc+thNAGOJrSC516yEfuWt4l4W4FfDcGCb/u+FsKuBBFrn+J3uohyfPpHz0JrkRhGvjSVgXtofNOPt2iUfg3pp+w+CG4s8XM3ioRtRTvgxF0xZQmRpU0fLDNKOaGU/gxGHRN35cgkjUFfkf1lfx0bxn8PvdQOaMl/tbseMcIN/cz+hGv8kMAWTn5Zg8SkepJqr9QMtc3oaPeEXPIJ1/7cOkq/LplKCShyCMPkxtbQVzMxdXFJ3zCbtvgstpDRIFJiD4qMKMpmPs+z2JoQYTt9sYjzWl7OzLHqqLda1KfR+YcZyLzc8I2xhN0qcycx54t/cXqR7LFW3qTg==
Received: from SJ0PR05CA0134.namprd05.prod.outlook.com (2603:10b6:a03:33d::19)
 by IA1PR12MB6163.namprd12.prod.outlook.com (2603:10b6:208:3e9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Wed, 4 Nov
 2026 10:30:39 +0000
Received: from SJ1PEPF0000231D.namprd03.prod.outlook.com
 (2603:10b6:a03:33d:cafe::5c) by SJ0PR05CA0134.outlook.office365.com
 (2603:10b6:a03:33d::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.8 via Frontend Transport; Wed, 4
 Nov 2026 10:30:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF0000231D.mail.protection.outlook.com (10.167.242.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 10:30:38 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 4 Nov
 2026 02:30:23 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 4 Nov
 2026 02:30:22 -0800
Received: from build-sheetal-noble-20261014.internal (10.127.8.14) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.56 via
 Frontend Transport; Wed, 4 Nov 2026 02:30:22 -0800
From: Sheetal <sheetal@nvidia.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter
	<jonathanh@nvidia.com>, Mohan Kumar <mkumard@nvidia.com>, Sameer Pujar
	<spujar@nvidia.com>, <linux-sound@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Anupama
 Kunkulagunta" <akunkulagunt@nvidia.com>, Sheetal <sheetal@nvidia.com>
Subject: [PATCH] ALSA: hda/tegra: Add Tegra268 HDMI/DP codec ID
Date: Wed, 4 Nov 2026 10:29:55 +0000
Message-ID: <20261104102955.1089991-1-sheetal@nvidia.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231D:EE_|IA1PR12MB6163:EE_
X-MS-Office365-Filtering-Correlation-Id: 55f7273d-7a77-4c64-03b1-08df3a5eab6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|23010399003|1800799024|3023799007|6133799003|10067099003|18002099003|261102123227099003|11063799006|56012099006|261021123027099003|261009223027099003|261021121427099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	xtWer9+MaiO+ngtoDrsNWYKXCxIRheTmCzAMWfMHIVsAz106RwMZQgsc+++s6I1B5KD3k4niWiCFVV5+Qd1ZpQEROa5acMc1OClgNKh9jaQB4KAPekcl6AuuWFF8Z7COUGRc4l/3QATIB3AZvYqJx5I4F4xQlfpSuOHVt5V4XG112U7Q8BKLtjl/6sO6YXL/EMVkT2Uyknh/1Q5FGZdfvU8URGGXU581RImoU2JsaRmXfZP7xXWIYBxIDuicTgBeYCQ8Sd1NOEmdeQTyv5ii3XG9zdnaWHVIBuUw1pLVukpai+ODzmcbgYRPKtqsrhEVSu0uQX3qFciwa8kJwMGZxiesg8gcyMAUCPObQcNekGuY39XH9IQhKLKob8pcMknduzzJcsLDmQbMnjDcb0mZcdFlV/Fyhoyvz89vkwRp6e5lwnK3q2SnwZ9m8ynru6UOZiYdSEqVgx2mtt8psfPn7CAJSCoEgppPeOVQJ+umCQ/cYKbsbIiznviNse27TPmUIALXrjP/nleNAl0o8+izk3ZHgwt1H3fKQ9cdMByePN1rY5Y/KxCaHHNveEezBd9IZm4kYzXosU6bO8eXaUEqE7IHcgw+kR5z5zREhONoQ/8ke1j39jNc390AeWSq4oScrAe7DjFukXLhHwhgQg2mpWTqMMNwyOJrJ7iJeCWbe8BANCPsjkvlwu2S24/6T7xs5vD4zwHAsDWsp88Jq+GTLg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(1800799024)(3023799007)(6133799003)(10067099003)(18002099003)(261102123227099003)(11063799006)(56012099006)(261021123027099003)(261009223027099003)(261021121427099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	itS0ugBfHKMT5cVvEDlnMCJUpgaCg9bAYsEjvuivmmmmSr2GcGt+VuP5cIGkofI1En158wrJ3gNGvD5HADAcWO0J5tpimVjcXx1kwPZNosdrTR21rQtti+IgRUYawTCbhHUS81hPPjeZOMbhyXtT1ibxSPVvYvFTgUTUvdY88TCPfpgt3orZI3ix8zjInH1g7J2Aqp7Cxgh5c0jPJd0S4UTEHHLmx42rM3nx33NVRzJ/DgV9iZM3Ylbjn+ttCB5QVjYnyz25JMK0Z+gxG1lfo3GlTpQUPLbAizAtzHGjWFH61+B5T0RIlZ7nAKD8tsrpFbwLJC6WkzSjFwc6DPWsuZNgvmvYmG5sTsxeCamcy39ojyv4g6y23IBuIV1zLNQ0fZQYs0lqv76ztci1Nv25Ph41EepDs79Gi5ZvPXO27ScmNMP9/XijuGidjZ9yr/6m
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 10:30:38.7047
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55f7273d-7a77-4c64-03b1-08df3a5eab6d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6163

From: Anupama Kunkulagunta <akunkulagunt@nvidia.com>

The Tegra268 HDMI/DP HDA codec reports codec ID 0x10de0037, which is
not present in the Tegra HDMI codec driver's device table. Add this
ID so the driver can bind to the Tegra268 codec.

Tegra268 uses the same HDMI/DP codec programming model as Tegra234.
Reuse MODEL_TEGRA234 to enable DP MST, dynamic pin output assignment
and HDMI interrupt trigger control for Tegra268.

Signed-off-by: Anupama Kunkulagunta <akunkulagunt@nvidia.com>
Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 sound/hda/codecs/hdmi/tegrahdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/hdmi/tegrahdmi.c b/sound/hda/codecs/hdmi/tegrahdmi.c
index 171d1ee154d9..6baa98a3c627 100644
--- a/sound/hda/codecs/hdmi/tegrahdmi.c
+++ b/sound/hda/codecs/hdmi/tegrahdmi.c
@@ -338,6 +338,7 @@ static const struct hda_device_id snd_hda_id_tegrahdmi[] = {
 	HDA_CODEC_ID_MODEL(0x10de0033, "SoC 33 HDMI/DP",	MODEL_TEGRA234),
 	HDA_CODEC_ID_MODEL(0x10de0034, "Tegra264 HDMI/DP",	MODEL_TEGRA234),
 	HDA_CODEC_ID_MODEL(0x10de0035, "SoC 35 HDMI/DP",	MODEL_TEGRA234),
+	HDA_CODEC_ID_MODEL(0x10de0037, "Tegra268 HDMI/DP",	MODEL_TEGRA234),
 	{} /* terminator */
 };
 MODULE_DEVICE_TABLE(hdaudio, snd_hda_id_tegrahdmi);

base-commit: d6bcfc94eb4da6e089c5473970cd96727292fd97
-- 
2.43.0

