Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012013.outbound.protection.outlook.com [52.101.48.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0E040DFDE;
	Tue, 19 May 2026 09:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779184154; cv=fail; b=n640okqzd/V9s5I3JAXBHI/4x43cr5+pc/nch51zzmx148FfPe5wgf4PD2jRo858nyayKg92CKlcJ0ks7hDfzW4Tj8Rq5uSKEy3qvVFL8e3EJb0s1VF4EQCjNjXPrjr2ssA8y9MKk/Dq0MawdV8OLeDfdijxYiXBE1j+0lt9kpk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779184154; c=relaxed/simple;
	bh=kQkYWHU0MVLgI5B/P3Df23D9E0eLdnaiGe33Qr+XaD4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hV2Ijq/1D+dXhvDN5wj6absZgrVqUm3NERDlgwdqNOhwXDDf/m4rYwFKboBKmhFqtKT9D0TNpuu9/HLSK/xNIDf9NwA+nJCYao0J7Jkxh9jiFeVlFDBozscEWqa75BXF8Uh3MdwmAkCq4/Usqfs+ffUuEJ21qt8uBF1YEihxcWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=depnf5Ti; arc=fail smtp.client-ip=52.101.48.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="depnf5Ti"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fDbXWuh4Vp3mhaYRJ2NeBXYQXdoqaF8z68dbDHdU1Up6CCRLK8nWsUsy0nhhdEvN5q4nP1VQfDnlFCEIo6dV98QgbpQUvY7NFibS7gfxzCqzZxro+O71l9i9I3n0EkzDRszcPjKhnS2ivKyUbAVlkpYAB91lQO44Mlcw7SmWNEPK8X4oYiGU8So15HFt4rc308mQiBbNrTlXxMEBtmY7a7e08SvWd3flAZ/bzk2g966WEjWobmHKLb+Sfpvum943g/cQQ9EK1qlgbaNCEUso+Yz8HRzyTxr0yoS9/KAY7nb9RUhiI/aDCaHKCajtRVHGu9qJAcuH/ZaJWl8LhFxWyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dqkdz3rTq61CjNLI87xMneXO0tv7SyuxQf3a5uh6nk8=;
 b=MzkKc45dl5kswU7lgBCWSiezSOsjZr1wotSlMrLYmRu5EXPPTTUnzjNmibEIrszM3sq1H/JZhQ95NiXj+R+zrX1z/rqpXdHdLQ9xmQVh1pb3eolS15xhrKIgbyMfmjEo7yPtwn5cxLcL6AQU1aj/JMki1MTyg11p/2Yo4SZgFvLHXNRpy83qyrEFx/Q7TXs0Ruzk2cha1VZllpMPui0Ee0/oZD/Ab3YJMDExCDTebGl6ejXpp4pmv8rS/UmbxchM70TMMFWG0zshVQbgNQM7CYoz+Rq7ijMjwkkv4GdUcjqW0TNRJKQMCuJT1Lhm2sCjccNuiEBWRAESGBA3P4O7Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dqkdz3rTq61CjNLI87xMneXO0tv7SyuxQf3a5uh6nk8=;
 b=depnf5Tih5/zK7lkHt4IISoIPAeGC6VhsPzSd767JemdnK8MLWc8UjrQG5J6tOjpwx98BEgfAqCDncF86khzo6kalv0WGpDDOMOGKLKgC3h1epRwNVxwkzZaR93Jp7lFkigszuEZF9BUqzw2TSpnxfmA9UIDNAKHqnUaCJkFMhW/+yNlQsqn9eETvNfDqgdlkuounO2Gt7rcFYeiXmK83pIRfC+i3rUxvHbgS/8exR9WXBR/jvXDtNkZ84MEmmIFBWgF6hQFNfpB+BcJDQxiyTUIVRnnVWoPyEmDH2WJbYRpKMTo2K7QiHlGD9PAjfJ3+PfqRyjWGJl5/BQLF4seYw==
Received: from MW4PR03CA0316.namprd03.prod.outlook.com (2603:10b6:303:dd::21)
 by BN3PR12MB9572.namprd12.prod.outlook.com (2603:10b6:408:2ca::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Tue, 19 May
 2026 09:49:09 +0000
Received: from SJ1PEPF000023DA.namprd21.prod.outlook.com
 (2603:10b6:303:dd:cafe::ca) by MW4PR03CA0316.outlook.office365.com
 (2603:10b6:303:dd::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.21 via Frontend Transport; Tue,
 19 May 2026 09:49:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ1PEPF000023DA.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.0 via Frontend Transport; Tue, 19 May 2026 09:49:08 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 19 May
 2026 02:48:59 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 19 May 2026 02:48:58 -0700
Received: from build-sheetal-bionic-20251202.nvidia.com (10.127.8.14) by
 mail.nvidia.com (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Tue, 19 May 2026 02:48:58 -0700
From: Sheetal <sheetal@nvidia.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Thierry
 Reding" <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
	Mohan Kumar <mkumard@nvidia.com>, Sameer Pujar <spujar@nvidia.com>, "Rosen
 Penev" <rosenp@gmail.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, <linux-sound@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] ASoC: tegra: tegra210-mixer: Reject too-short fade durations
Date: Tue, 19 May 2026 09:48:58 +0000
Message-ID: <20260519094858.1426057-1-sheetal@nvidia.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023DA:EE_|BN3PR12MB9572:EE_
X-MS-Office365-Filtering-Correlation-Id: cefc0dd7-9fad-4775-b866-08deb58bdf67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|30052699003|1800799024|36860700016|82310400026|376014|7416014|18002099003|56012099003|11063799006|3023799003;
X-Microsoft-Antispam-Message-Info:
	/5PDGKwRhqVCmcJ1rrMrdEUakg8P7uCniqA9b56BgMNPoBHYNGMvIcQKP34tELCreFMjdDB+t6xeQnwsy5Sw2651Xtfyf0zFBUM7PY2EQP0uWMJ5H7rEGsfi7V2PazLr4FcYuHP5836gxKJb6M7dl3o0CkxRewRIT1+iycZQIRnj6aQ1gxC4Fe/20awuAx8H+NemZ64CAvkZhsayqiYYKlhcXhZoUo27seV+dsINsdKWyJMnVBX8PeAyXcG6EN1xC7CNgm/W69m10TSqP9kMUA70stXYPhQ65woHumLn7/oTSMyOVf3f44RX8h02NobUf3Le0gEZaH+zE9P3WSQowF2yKCrc4lDd9uHqN6ISSUrJL8+Yw04nm8/gZCCKNXhllkqGEQ4i289B47xL7JTLR0m5e+hECC81Pvi374lJHtnm0N32leX745Wnte2MjlsbYGTEhkVvCOz/ulzMuAS60aClSMUW1AIJ7x9YRlbHNscwNYtBC2XTXn59/CKxYaa9+v5wbbh/IrsK8uTmIJeHu/x1U/1UP/dONNV+QH70c6dfSCT6XpDamS06GV7usJOe90cQ38SAUnfb+Q1GQIee2r0LfJ/0c+u8CJyfuNf5e5d/B+HZf54BENL6X7epeXYICtr2tgVO9xdttqKd9XCE6A3+JXjHxEX3sfaCgFdHkJ3Lk4gvGCR5IHaXacjW3PrH6TXI+QpH5I+QUWdgn3FtSar/2QW8x77wrGQ4JbU5Le0=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(30052699003)(1800799024)(36860700016)(82310400026)(376014)(7416014)(18002099003)(56012099003)(11063799006)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YUXcJ4e9XzBIQdO1vpqRKfTfTSbUl3DENFk3es9gw9LEoi+p0Hm8ghDNsnCKy+4K89xZAPrAMtGNO86/5ksKds3+Dpz5iqbOfJ8kdU9sU3y/A9dXxMJYQ0fetYSJlv8H+eZsCOabgUFn1Ca0dOOHNjeZDEXSYQqFtkdRZY7WGrKzazlvU7vdNC654j2w3ZsVBn0k0OozRBPC5KRYhnTAmE9uVrrZVwKfSsSTkRUEI+DM2XNT4v58QtmZaRAtC7WyOpaAzbGOjJCg5XX5jxxkl4Hb9cv3jMV+V0DM1jQHwAy6wOxzBzj/Le1regPm2gGROM+CilfE9TQqILKjIllgB/6e2Yt/chILS6UAEaZ3wrExQDYowyBCOeis6PYXC6mS6+D7hRo7qTT0Py+ZNMDlbIKQ75XY46+MpyMB+sUfK64FjJy5Z2E9vYdrTBB+izZy
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 09:49:08.6202
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cefc0dd7-9fad-4775-b866-08deb58bdf67
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR12MB9572

DURATION_INV_N3 is computed from BIT_ULL(31 + prescalar) divided
by the configured duration, and then written as a 32-bit RAM value.

Durations of 32 samples or less overflow that value, so reject them
and advertise the valid range through the fade duration control.

Validate the ALSA integer control value as a long before storing it in
the driver's u32 duration field. Use a u32 temporary for duration RAM
writes because the largest valid inverse value can still exceed INT_MAX.

Fixes: 36645381b864 ("ASoC: tegra: Add per-stream Mixer Fade controls")
Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 sound/soc/tegra/tegra210_mixer.c | 33 +++++++++++++++++++++++++-------
 sound/soc/tegra/tegra210_mixer.h |  4 +++-
 2 files changed, 29 insertions(+), 8 deletions(-)

diff --git a/sound/soc/tegra/tegra210_mixer.c b/sound/soc/tegra/tegra210_mixer.c
index bfdd457f740c..c237ba7531de 100644
--- a/sound/soc/tegra/tegra210_mixer.c
+++ b/sound/soc/tegra/tegra210_mixer.c
@@ -150,7 +150,7 @@ static int tegra210_mixer_configure_gain(struct snd_soc_component *cmpnt,
 
 	/* Write duration parameters */
 	for (i = 0; i < NUM_DURATION_PARMS; i++) {
-		int val;
+		u32 val;
 
 		if (instant_gain) {
 			val = 1;
@@ -181,6 +181,17 @@ static int tegra210_mixer_configure_gain(struct snd_soc_component *cmpnt,
 	return err;
 }
 
+static int tegra210_mixer_fade_duration_info(struct snd_kcontrol *kcontrol,
+					     struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 1;
+	uinfo->value.integer.min = TEGRA210_MIXER_FADE_DURATION_MIN;
+	uinfo->value.integer.max = TEGRA210_MIXER_FADE_DURATION_MAX;
+
+	return 0;
+}
+
 static int tegra210_mixer_get_fade_duration(struct snd_kcontrol *kcontrol,
 					    struct snd_ctl_elem_value *ucontrol)
 {
@@ -202,9 +213,10 @@ static int tegra210_mixer_put_fade_duration(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_mixer *mixer = snd_soc_component_get_drvdata(cmpnt);
 	unsigned int id = mc->reg;
-	u32 duration = ucontrol->value.integer.value[0];
+	long duration = ucontrol->value.integer.value[0];
 
-	if (duration == 0 || duration > TEGRA210_MIXER_FADE_DURATION_MAX)
+	if (duration < (long)TEGRA210_MIXER_FADE_DURATION_MIN ||
+	    duration > TEGRA210_MIXER_FADE_DURATION_MAX)
 		return -EINVAL;
 
 	if (mixer->duration[id] == duration)
@@ -614,10 +626,17 @@ static int tegra210_mixer_fade_status_info(struct snd_kcontrol *kcontrol,
 }
 
 #define FADE_CTRL(id)							\
-	SOC_SINGLE_EXT("RX" #id " Fade Duration", (id) - 1, 0,		\
-		       TEGRA210_MIXER_FADE_DURATION_MAX, 0,		\
-		       tegra210_mixer_get_fade_duration,			\
-		       tegra210_mixer_put_fade_duration),		\
+	{								\
+		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,			\
+		.name = "RX" #id " Fade Duration",			\
+		.info = tegra210_mixer_fade_duration_info,		\
+		.get = tegra210_mixer_get_fade_duration,			\
+		.put = tegra210_mixer_put_fade_duration,			\
+		.private_value = SOC_SINGLE_VALUE((id) - 1, 0,		\
+				TEGRA210_MIXER_FADE_DURATION_MIN,	\
+				TEGRA210_MIXER_FADE_DURATION_MAX,	\
+				0, 0),					\
+	},								\
 	SOC_SINGLE_EXT("RX" #id " Fade Gain", (id) - 1, 0,		\
 		       TEGRA210_MIXER_GAIN_MAX, 0,			\
 		       tegra210_mixer_get_fade_gain,			\
diff --git a/sound/soc/tegra/tegra210_mixer.h b/sound/soc/tegra/tegra210_mixer.h
index bcbad08cbb9d..d9c8fa6124de 100644
--- a/sound/soc/tegra/tegra210_mixer.h
+++ b/sound/soc/tegra/tegra210_mixer.h
@@ -87,9 +87,11 @@
 
 #define NUM_GAIN_POLY_COEFFS 9
 #define TEGRA210_MIXER_GAIN_MAX			0x20000
-#define TEGRA210_MIXER_FADE_DURATION_MAX	0x7fffffff
 
 #define TEGRA210_MIXER_PRESCALAR	    6
+#define TEGRA210_MIXER_FADE_DURATION_MIN	\
+	(BIT(TEGRA210_MIXER_PRESCALAR - 1) + 1)
+#define TEGRA210_MIXER_FADE_DURATION_MAX	0x7fffffff
 #define TEGRA210_MIXER_FADE_IDLE	    0
 #define TEGRA210_MIXER_FADE_ACTIVE	  1
 
-- 
2.17.1

