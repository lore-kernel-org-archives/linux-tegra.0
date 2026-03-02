Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011036.outbound.protection.outlook.com [40.93.194.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D0430AD15;
	Mon,  2 Mar 2026 08:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772440977; cv=fail; b=SrXtQL7Ttu/eOO/IJ9pJOOVtnPnH9Fq8aVq0XbX2k+gm3e9CxRpXZKub5CT2t2yMWHg8noI/E6XyrlupE8Nh1/QlenVkCb8WdUpUOkR8RLyWe9c80hMWoO9xI/tlu5nqyMUIdSXDjzaMHwm846IwxeefVbLHcy6kdAlmhnpeCsc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772440977; c=relaxed/simple;
	bh=mZcWKWlEJ2vmyC4Q+y02pjdV7+Eu8bCAgeYDoQkL4os=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=G1S/0VmGhN9mDohr+cm9O5ocW33g+HojRkkhVD7fGreteVlY3ONAbmzETSyOVe68HIKVHkhqbuMIdJgWGnfF5oH3MAu/udP894xrBQ2Ux5Zr/2aqNfltMcHpPsfIO0H3FPB7IUI/ksRBKm6nIpSC8EetYzYmDtCkj9zLmkkeykA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=s5kAXSyp; arc=fail smtp.client-ip=40.93.194.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="s5kAXSyp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uzveuLuf1I7sXQFiihheblpC7RAke9IQE5yBJDU7EbPmWxYPVL/Q8jkW5Z2h0blrf47mUU0zrt8ODazLi9uPTAsb5uUNF5XntQQFnC3GwUTQcTnicDbEoJqrFi2y28lq4dzRKpETaH0VF3zrWuR22wyBpEKas6a+CM/hKmorlvIJ3p/p8zFy75jja1wjbQ5x5z9bJlECtNnX8Ub6t3Vn/KIPADlPigb13AYbNylkTapA10aL5GUdbV943Z34EE6/wMvEjpwjtbEXo1AYsa98CYsvcguZaDPw/VAmjuY3s39ARLQMOexGx9zbKPSS9AREktx8EfWFeTpqkAbja+Z1ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C2UTBnFSuO/y9bYMzzKyMdNl/ubS6jIzkOdhr7SlJXk=;
 b=cc6AFkI/T4KTfbkv6FYcHhV6gX8aPo0kJHDqGwRpZmqnW99Uo4ouVeMfjJNP+PHRsMVexStV3yvxBkBbZwentuqb7gpIaS8ZbpBbUUGsIyGqCRCEB8b4e3p2wnzgXbbI2Q7OMyzTn1LAWBi495qomSyQyAZOJnBYE8fAB5RTh2m+OYHSP2MPcvFLonzWyFCuyMDN63EzlFY6ZDgWhNE7k5lVm2usnKyXRCQvaowzyz8bxvG5c/WIOfc5vHrH1i4b3qmuZ7SnjOcb4ROWITyLQySoevj6pFf1GfID1+BDHVlsaVE+Ilb+q5YFjk9iPf71EuVCKmc138H/vJ3OGSj34g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=perex.cz smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C2UTBnFSuO/y9bYMzzKyMdNl/ubS6jIzkOdhr7SlJXk=;
 b=s5kAXSyp9V19CclUBWuXYCtnOKQ3Jyse1I01yYCyzvNKpnZHExlYpjLKTJcALWfaByt0tVcho66NV6z9NN1LZXOsQvoNs76JYJZMS2U7SD5BqR+gfNfBovH6lrgoO4CMJb1F8qFyXMUY/nLP1VKa0CcI0invsGjLniWrKV0bD7UjsHM3Wk8b58OsEpaxft4QnBkHa/zuBUKbTzZbYSCvW8k6h8wyo2GpDOF06su5ItuCl4vzZIfB3BTx1cz6WEvlOgEAfZyuO72JmbjwM702nYY7Th92IuyUPy41cjPiqKYmcf+UVoJqVR/m/CAVHbcfch06uCaNJY2UE+Haf/gpOw==
Received: from CH5P222CA0024.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::9)
 by SA1PR12MB8698.namprd12.prod.outlook.com (2603:10b6:806:38b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Mon, 2 Mar
 2026 08:42:52 +0000
Received: from CH1PEPF0000AD78.namprd04.prod.outlook.com
 (2603:10b6:610:1ee:cafe::ad) by CH5P222CA0024.outlook.office365.com
 (2603:10b6:610:1ee::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Mon,
 2 Mar 2026 08:42:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH1PEPF0000AD78.mail.protection.outlook.com (10.167.244.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 08:42:51 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 00:42:35 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 00:42:28 -0800
Received: from sheetal.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Mar 2026 00:42:25 -0800
From: "Sheetal ." <sheetal@nvidia.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Thierry
 Reding" <thierry.reding@kernel.org>
CC: Jonathan Hunter <jonathanh@nvidia.com>, <mkumard@nvidia.com>,
	<linux-sound@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Sheetal <sheetal@nvidia.com>
Subject: [PATCH v2] ALSA: hda/hdmi: Add Tegra238 HDA codec device ID
Date: Mon, 2 Mar 2026 14:12:17 +0530
Message-ID: <20260302084217.3135982-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD78:EE_|SA1PR12MB8698:EE_
X-MS-Office365-Filtering-Correlation-Id: 812af5a3-db3f-4664-52f5-08de7837b0c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	XvD1/Uz72oYSssa3yjGyKR6j+gBRgClwfoPhqXqOB5XXwP77vyTydYyT7LwKb6J4QGyZI3g8JwE9jRUSAvxRCjTFH2GmVD3hL/gpXRGwOsGHJSURh0f2biyYAXJE0L6fXTKA7lIpqi8BFRCyNM94eD0l6PgBjOimezZJ+PJU7GIXil7lW8KZkvs+1Ru8YRP4aOQlkEWkO5WwOL7I9Dx7I1oY7dZ08VZJwjblyaVt/gJ/04sY+RzP2NPf58zwpgYPxhoxaJrPmjZCzd7kl9zPXNdTTe/8+xj27vyeofheLOQjRHqT9rzt4DmL6dE+sOZiYyZAtrgo0tbVo8TJBtmD15shSI/+0fJbnJfivxGM0h48hQ2h0agwaPe8WmYlQFUPNe0MrhRpbJXudqbXPkENfy6mUZZAjbJ2Uc0EiK4s02Tbu39abgkjKp5Q4L6OTsFcyOY8UVISub5nJLV8VmvuvQjsWIQ6kOT5DO+7oRWgOunaR9gmWe4tiDdWXlB1wJYZhoJZtpuX/KBCt439fPfcgAv4M3rCeM8pJioQQ1Qxkt3GQn7BBhsl4gQ4Z+FOeiPQJsc2PA5lDuO5g7odW6AV2s8j6W3L64QKfI6e70jJxFt/4YMmCJchB0kD844bMpPuQ/3GkfXNeFHC5mkKGEDONWIRlt9VfwmUsxLLI6i0MpvP80JE9yXOxFr0O9ZlV4/ydPFc6AmeU6qIcR+L2RlSPsZvV40JRNb0FupaS31tbXREWZvcJb3L4uxy27pq4bHT94AHIBedUMryEllI3giFM+hpYtpPRh1zLMr/dfUOog6lWLRSzSNdmTUHr8rcuve9qhbsNDiAOKm1Ov7V+jaIAQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NEONVsjjMVgurV9Mw9QKwgVwFBlKz+znEzGVRebcht2dQCuTV8qVmzhnSMl+7SBlzThMYUjBQNXqWbyyRrf5RrAWx1iqu8VskFNCSMp6ugoNuVgZl96LBEXfNNl2VXApPOpsGEnkLGZWoeQ/7qrX+lR53/YUo0sWNn5yGLREwmdBRYoY/63lhS9UcnpkvyWOTqtHfLq1dHo+Yf5eijbv3DvneqRO+su/eG9bkB7Wf1JPJi5+Dyqn1wAP+nHMTJdebwb7wU9ivAlT9e522Hh17nyW63j8ilS6UvedEH23sNsRsAk6JVLc4tTob3XLASjXSsz/q0+NS9FY+sdsGHw7SVRAC5rUL+vjtj2ukFiRrca4l0CwUcJ6c33Vg4YVcuScLSR6Zxu6CMzVEfrh0M0JT8+jxpiI5sReMVqkklKMK4Bca77NzUpoUJaLfOJDXk6O
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 08:42:51.5403
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 812af5a3-db3f-4664-52f5-08de7837b0c0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD78.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8698

From: Sheetal <sheetal@nvidia.com>

Add Tegra238 HDA codec device in hda_device_id list.

Signed-off-by: Sheetal <sheetal@nvidia.com>
---
Changes in v2:
- Resend as standalone patch; v1 was incorrectly sent with
  Change-Id and wrong series numbering (1/3)

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
2.34.1

