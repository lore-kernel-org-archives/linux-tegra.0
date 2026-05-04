Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010003.outbound.protection.outlook.com [52.101.85.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E4530C601;
	Mon,  4 May 2026 10:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777888906; cv=fail; b=nZZJf8r2wfbXPrT8y5tkGyqBV/ikmmxZRESIYm62uJZ1RTLVu7tN0M/Cqv4BZDY0iOS4ptBqUJRmUUQ42eQ8mpdjqhbIIMOBJ0SyGUoHn0TkRNcwHvwfPJr7aCbY6iLgjgjXvsQK0g5RgVCiqrN0t7GU27rYSYFZkMgCcEgteFA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777888906; c=relaxed/simple;
	bh=iGgQ60DCZcoiQDs8HBg9ptSgfFnDp7UITbfRPYo7RAs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=e6ZhiL05/o9T/z1gKgbWwlMRfaJQIRoxIdBp+kDMp8uIsmrrRdNnttPKWfC4LG5G0A11Ppaijgl6H4s/MXL6c4OIU4UrwqqPFrqFg/Tdj+H0/O3Zldy9JE+1IZKYPOOCZBbBxXDLQ8rDYoInTgSKWg5g4raVTLrdTJ0NzTx9qZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=koajbdzq; arc=fail smtp.client-ip=52.101.85.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="koajbdzq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oQWcipA1IozuW5D07PzB1RRtn3RjYY5bzB89wlfOaZ5Enk7lY1kBXWxxUwj9r2U4opj6i8IBxpQw70wTRhXFNYgZvloIUK+KmHUyA6TCE14QhhAyDBPIrbw6fBdqR9edlIe+0Zi4ZKOTGXDH5Q+SWLAmAC56Yff/qV4Oamow0Svn8Gs1U+dRSwQfXlFucrsnEkr4N8uHUAWGowzj8ocMc3LOK4zbYp5RiAefC317ue3FrpDKYksdO/BBSGoBgV8FZcbf4eIgdeR0w5tn5/7r2ue5MtzgmuDzHrobbJuUBwrJWM68ZFFH38PntjZni+/k8SR6hEP/AsfyLKN8b/IrSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UYwiVJpwz/MX1NDY4Jx1oTxPzKVBDsEUIf1yTO9SXWs=;
 b=TevYukm3wvbLa7eb3b3VC7pxt6UrhJhWjCoF6RWwAw4gzmbnYyrm4EL9xxhJbb6Ukwbtuv7tizdN5JuHDTPQFtvIjiTuXX8X1KY7Wt33hJoxPPfJqhq7YK/nVjwZS/1c6+J5bYp9navSI4h5jHoA8dLXcPORVU/mon5ArZtJarw54IA6owQKgHeR0SgNYeeoRuCyAkEIBKP+nwPmF5hOWlJsY9Yr9Eu8NljIx9UeArtCGQ+qhqVjB+hfxj8Hxp45Fnrh7vdk5EoORf+5grtqtAMHFlZW79fkljX1elXD/HdwnhV/wKtI0dbGgt1lq3QgvwylkfQpkoN2fuA2P2JwBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UYwiVJpwz/MX1NDY4Jx1oTxPzKVBDsEUIf1yTO9SXWs=;
 b=koajbdzqITUq8WR2NRhVKZ3HCdAN8pq8Lfd6IEAa6h+x6dBwwiBtWhsolF03KNQDuCwYPlKY1Md/PVu9okp6kRk7M0jf8NUA0bUuYhuZ8IW7eM2B57fa/l8b+ZTblpN8EJiTZuTYMXGlLXIHRdAO3SBArkS6OIo0kgQm2waOrpzwkQnH67VImwcS6WxiSvb7GMAf1ZbFCxJDVkZ7JCI9kBHNKUt4zjQ27tOZAHz5EP/XjcAuBZlIk5q1urfi3pi6UhXM3kUf4O7rt9kuOpnxtZ6i5DegleWRai36iRP1mPszThM5ciMqucmgjIJ+d4F0b2I1BRVvT0U2ZMl3/Gz2Mw==
Received: from DM6PR02CA0067.namprd02.prod.outlook.com (2603:10b6:5:177::44)
 by SA5PPFF3CB57EDE.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8eb) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 4 May
 2026 10:01:34 +0000
Received: from DS2PEPF00003448.namprd04.prod.outlook.com
 (2603:10b6:5:177:cafe::13) by DM6PR02CA0067.outlook.office365.com
 (2603:10b6:5:177::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Mon,
 4 May 2026 10:01:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS2PEPF00003448.mail.protection.outlook.com (10.167.17.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Mon, 4 May 2026 10:01:33 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 4 May
 2026 03:01:15 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 4 May
 2026 03:01:14 -0700
Received: from build-sheetal-bionic-20251202.nvidia.com (10.127.8.14) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Mon, 4 May 2026 03:01:13 -0700
From: Sheetal <sheetal@nvidia.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Thierry
 Reding" <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
	Sameer Pujar <spujar@nvidia.com>, Mohan Kumar <mkumard@nvidia.com>, "Kuninori
 Morimoto" <kuninori.morimoto.gx@renesas.com>, <linux-sound@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Sheetal
	<sheetal@nvidia.com>
Subject: [PATCH v3] ASoC: tegra: Add per-stream Mixer Fade controls
Date: Mon, 4 May 2026 10:00:51 +0000
Message-ID: <20260504100051.3820808-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003448:EE_|SA5PPFF3CB57EDE:EE_
X-MS-Office365-Filtering-Correlation-Id: a6e150b5-4b5c-4557-2712-08dea9c41f4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	ISmtJxWGQrl+R4OXDI9GcFLLTlfQkutnErdHxIUidm75LruTJ0cnpTZTAExYuKVhfPD4e4z6gCdJu1PsFXzRoisu1/DmaBtb/eKILbsqEfPh7ytwFGw/ljXVoQlfYVG2Xl2MBBCyCy8xjANL+x+DOXLqHLeVoGyHNNwd0qYz2uSGlhFOdnH+wLgTU3z9kMJFK1rfGZ6ljIR5+m43G2x/3LwcXJfY2FlT3jnCOWPgT1sIZ7IVAFBIDJAAA+yWflJPuK2KpW3D4nqkQVCoKUIh3UU9Dl/6U8JU+CeqiyZLcat+0Fmh3GBrLH4AnlE4vwKST5S7DxTqVGo2n1+qEG1AzDqNXhFIrrDxCxHfojfHvw9ftIuR303daZvzoCtPtnzWgKpe+Mh3W74Lv1tZMAjFykoORVEK0AJjoixPlVtdaZVkn1yg/ez98+fhmVDLoCb29ynTg1JFWyjK0HYL6YJ2ek/0iYHXYPdRfOrpGd1an2Kl7LnzakbScrxfCVLUMrltlT6fyvsYoEr6wFXtIHxJbLUZIFyoo6gsmpmFYUgYT1lxABdgwBVQjVRSgsWdwVgQLmbWss7n4OggxdaJBW5WQVaQhnJNoXyPD0dBv4h5EhlvMnnl+fKfM7tiNwiGjHfRWhHVUoX6Ta4xQr8YcnlU2/DNq50rqmmlTHD0MQzrUYc2wFBoNBzWEndTNAOrX3nHLyXNAQCFry7Elubd9JEguBaIsjKIuaT94zsnCNUVjSs=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aGvOPzOPeEuR5xqnbYnHhZdw3L82oWp/AIGhyKpH8wFbyWGWpN1ZoL3kSF3fHa+ChYhWvaCznItYUvQntQCKqkHJIxlrpd7++nSyEFThMg4dulKjm4ULhSkZu57My+87oTV006YAiRZeDpksdxhyWstmLNVduLqh1TBbeLJx+m8xEiYdhMufS0eIZuHBtjZ9Li0CnMEMSKXOhFsvAKQN6s11VzqMpGZv8uBIPeP2vEZQOZx2cwEAzI08bjg6ob1b07h1aQDTuKYrXUT5gsdCca/L2xPg3TgnO1rLJVy74Lbn32hRBJJj8QVQNGDpsv2GoQM8C/ZiLLRmwU28EojHm396DUZ9ji1lW8ccbmsNB9KisAL6U1OX6XTqUj9R3KXxlM8F1rjNNhtGe9jebcVJP0e3IMPLj8JPNLLrzhq0aLDTi9+EUjGhLuCPoqR5eR23
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 10:01:33.5506
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6e150b5-4b5c-4557-2712-08dea9c41f4d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003448.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFF3CB57EDE

Add per-stream fade controls for the Tegra mixer to allow
independently configuring target gain and fade duration for each of
the 10 input streams (RX1 through RX10).

The following controls are added per stream:
  "RXn Fade Duration" - fade duration in samples (N3 parameter)
  "RXn Fade Gain"     - target gain level for fade

A strobe control commits all pending fade configurations atomically:
  "Fade Switch"       - applies staged gain/duration for all pending
                        streams and starts the fade

A read-only status control reports per-stream fade state:
  "Fade Status"       - per-stream state for all 10 RX inputs
                        0 = idle, 1 = active

Usage example (fade 2 streams simultaneously):
  amixer -c <card> cset name="RX1 Fade Duration" 1024
  amixer -c <card> cset name="RX1 Fade Gain" 12000
  amixer -c <card> cset name="RX2 Fade Duration" 2048
  amixer -c <card> cset name="RX2 Fade Gain" 15000
  amixer -c <card> cset name="Fade Switch" 1

Signed-off-by: Sheetal <sheetal@nvidia.com>
---
Changes in v3:
- Rename "Fade Enable" to "Fade Switch" (standard ALSA naming for
  boolean controls) and rename associated function names accordingly
- Add separate fade_gain[] field so "RXn Fade Gain" and "RXn Gain
  Volume" controls are independent; put_fade_switch copies fade_gain
  to gain_value before configuring hardware
- Make get_fade_status read-only: removed regmap writes; only
  software-side in_fade flag is cleared on completion to prevent
  misreads after 32-bit sample counter rollover
- Disable sample count before re-enabling in put callback to restart
  the counter from zero, allowing new fades to replace active ones
- Add switch off support: writing 0 disables sample count for all
  fading streams, writing 1 starts pending fades
- Remove FADE_COMPLETE state; simplify to binary IDLE(0)/ACTIVE(1)

 sound/soc/tegra/tegra210_mixer.c | 262 ++++++++++++++++++++++++++++++-
 sound/soc/tegra/tegra210_mixer.h |  19 ++-
 2 files changed, 274 insertions(+), 7 deletions(-)

diff --git a/sound/soc/tegra/tegra210_mixer.c b/sound/soc/tegra/tegra210_mixer.c
index ce44117a0b9c..91eb7c4c077f 100644
--- a/sound/soc/tegra/tegra210_mixer.c
+++ b/sound/soc/tegra/tegra210_mixer.c
@@ -151,10 +151,17 @@ static int tegra210_mixer_configure_gain(struct snd_soc_component *cmpnt,
 	for (i = 0; i < NUM_DURATION_PARMS; i++) {
 		int val;
 
-		if (instant_gain)
+		if (instant_gain) {
 			val = 1;
-		else
-			val = gain_params.duration[i];
+		} else {
+			if (i == DURATION_N3_ID)
+				val = mixer->duration[id];
+			else if (i == DURATION_INV_N3_ID)
+				val = (u32)(BIT_ULL(31 + TEGRA210_MIXER_PRESCALAR) /
+					    mixer->duration[id]);
+			else
+				val = gain_params.duration[i];
+		}
 
 		err = tegra210_mixer_write_ram(mixer,
 					       REG_DURATION_PARAM(reg, i),
@@ -173,6 +180,200 @@ static int tegra210_mixer_configure_gain(struct snd_soc_component *cmpnt,
 	return err;
 }
 
+static int tegra210_mixer_get_fade_duration(struct snd_kcontrol *kcontrol,
+					    struct snd_ctl_elem_value *ucontrol)
+{
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
+	struct tegra210_mixer *mixer = snd_soc_component_get_drvdata(cmpnt);
+
+	ucontrol->value.integer.value[0] = mixer->duration[mc->reg];
+
+	return 0;
+}
+
+static int tegra210_mixer_put_fade_duration(struct snd_kcontrol *kcontrol,
+					    struct snd_ctl_elem_value *ucontrol)
+{
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
+	struct tegra210_mixer *mixer = snd_soc_component_get_drvdata(cmpnt);
+	unsigned int id = mc->reg;
+	u32 duration = ucontrol->value.integer.value[0];
+
+	if (duration == 0)
+		return -EINVAL;
+
+	if (mixer->duration[id] == duration)
+		return 0;
+
+	mixer->duration[id] = duration;
+	mixer->fade_pending[id] = true;
+
+	return 1;
+}
+
+static int tegra210_mixer_get_fade_gain(struct snd_kcontrol *kcontrol,
+					struct snd_ctl_elem_value *ucontrol)
+{
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
+	struct tegra210_mixer *mixer = snd_soc_component_get_drvdata(cmpnt);
+
+	ucontrol->value.integer.value[0] = mixer->fade_gain[mc->reg];
+
+	return 0;
+}
+
+static int tegra210_mixer_put_fade_gain(struct snd_kcontrol *kcontrol,
+					struct snd_ctl_elem_value *ucontrol)
+{
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
+	struct tegra210_mixer *mixer = snd_soc_component_get_drvdata(cmpnt);
+	unsigned int id = mc->reg;
+
+	if (mixer->fade_gain[id] == ucontrol->value.integer.value[0])
+		return 0;
+
+	mixer->fade_gain[id] = ucontrol->value.integer.value[0];
+	mixer->fade_pending[id] = true;
+
+	return 1;
+}
+
+static int tegra210_mixer_get_fade_switch(struct snd_kcontrol *kcontrol,
+					  struct snd_ctl_elem_value *ucontrol)
+{
+	ucontrol->value.integer.value[0] = 0;
+
+	return 0;
+}
+
+static int tegra210_mixer_put_fade_switch(struct snd_kcontrol *kcontrol,
+					  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
+	struct tegra210_mixer *mixer = snd_soc_component_get_drvdata(cmpnt);
+	int id, err, changed = 0;
+
+	err = pm_runtime_resume_and_get(cmpnt->dev);
+	if (err < 0)
+		return err;
+
+	/* Switch off: disable sample count for all active fades */
+	if (!ucontrol->value.integer.value[0]) {
+		for (id = 0; id < TEGRA210_MIXER_RX_MAX; id++) {
+			if (!mixer->in_fade[id])
+				continue;
+
+			regmap_update_bits(mixer->regmap,
+					   MIXER_REG(TEGRA210_MIXER_RX1_CTRL,
+						     id),
+					   TEGRA210_MIXER_SAMPLE_COUNT_ENABLE,
+					   0);
+			mixer->in_fade[id] = false;
+			changed = 1;
+		}
+
+		pm_runtime_put(cmpnt->dev);
+		return changed;
+	}
+
+	/* Stop active fades on pending streams before reconfiguring */
+	for (id = 0; id < TEGRA210_MIXER_RX_MAX; id++) {
+		if (!mixer->fade_pending[id])
+			continue;
+
+		if (mixer->in_fade[id]) {
+			regmap_update_bits(mixer->regmap,
+					   MIXER_REG(TEGRA210_MIXER_RX1_CTRL, id),
+					   TEGRA210_MIXER_SAMPLE_COUNT_ENABLE, 0);
+			mixer->in_fade[id] = false;
+		}
+
+		mixer->gain_value[id] = mixer->fade_gain[id];
+		err = tegra210_mixer_configure_gain(cmpnt, id, false);
+		if (err) {
+			dev_err(cmpnt->dev,
+				"Failed to configure fade for RX%d\n", id + 1);
+			pm_runtime_put(cmpnt->dev);
+			return err;
+		}
+
+		changed = 1;
+	}
+
+	if (!changed) {
+		pm_runtime_put(cmpnt->dev);
+		return 0;
+	}
+
+	/* Enable sample count for all pending streams */
+	for (id = 0; id < TEGRA210_MIXER_RX_MAX; id++) {
+		if (!mixer->fade_pending[id])
+			continue;
+
+		err = regmap_update_bits(mixer->regmap,
+					 MIXER_REG(TEGRA210_MIXER_RX1_CTRL, id),
+					 TEGRA210_MIXER_SAMPLE_COUNT_ENABLE,
+					 TEGRA210_MIXER_SAMPLE_COUNT_ENABLE);
+		if (err) {
+			dev_err(cmpnt->dev,
+				"Failed to enable sample count for RX%d\n",
+				id + 1);
+			pm_runtime_put(cmpnt->dev);
+			return err;
+		}
+
+		mixer->in_fade[id] = true;
+		mixer->fade_pending[id] = false;
+	}
+
+	pm_runtime_put(cmpnt->dev);
+
+	return 1;
+}
+
+static int tegra210_mixer_get_fade_status(struct snd_kcontrol *kcontrol,
+					  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
+	struct tegra210_mixer *mixer = snd_soc_component_get_drvdata(cmpnt);
+	u32 count;
+	int id, err;
+
+	err = pm_runtime_resume_and_get(cmpnt->dev);
+	if (err < 0)
+		return err;
+
+	for (id = 0; id < TEGRA210_MIXER_RX_MAX; id++) {
+		if (!mixer->in_fade[id]) {
+			ucontrol->value.integer.value[id] = TEGRA210_MIXER_FADE_IDLE;
+			continue;
+		}
+
+		regmap_read(mixer->regmap,
+			    MIXER_REG(TEGRA210_MIXER_RX1_SAMPLE_COUNT, id),
+			    &count);
+
+		if (count >= mixer->duration[id]) {
+			ucontrol->value.integer.value[id] = TEGRA210_MIXER_FADE_IDLE;
+			mixer->in_fade[id] = false;
+		} else {
+			ucontrol->value.integer.value[id] = TEGRA210_MIXER_FADE_ACTIVE;
+		}
+	}
+
+	pm_runtime_put(cmpnt->dev);
+
+	return 0;
+}
+
 static int tegra210_mixer_get_gain(struct snd_kcontrol *kcontrol,
 				   struct snd_ctl_elem_value *ucontrol)
 {
@@ -396,14 +597,37 @@ ADDER_CTRL_DECL(adder3, TEGRA210_MIXER_TX3_ADDER_CONFIG);
 ADDER_CTRL_DECL(adder4, TEGRA210_MIXER_TX4_ADDER_CONFIG);
 ADDER_CTRL_DECL(adder5, TEGRA210_MIXER_TX5_ADDER_CONFIG);
 
+static int tegra210_mixer_fade_status_info(struct snd_kcontrol *kcontrol,
+					   struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = TEGRA210_MIXER_RX_MAX;
+	uinfo->value.integer.min = TEGRA210_MIXER_FADE_IDLE;
+	uinfo->value.integer.max = TEGRA210_MIXER_FADE_ACTIVE;
+
+	return 0;
+}
+
+#define FADE_CTRL(id)							\
+	SOC_SINGLE_EXT("RX" #id " Fade Duration", (id) - 1, 0,		\
+		       TEGRA210_MIXER_FADE_DURATION_MAX, 0,		\
+		       tegra210_mixer_get_fade_duration,			\
+		       tegra210_mixer_put_fade_duration),		\
+	SOC_SINGLE_EXT("RX" #id " Fade Gain", (id) - 1, 0,		\
+		       TEGRA210_MIXER_GAIN_MAX, 0,			\
+		       tegra210_mixer_get_fade_gain,			\
+		       tegra210_mixer_put_fade_gain),
+
 #define GAIN_CTRL(id)	\
 	SOC_SINGLE_EXT("RX" #id " Gain Volume",			\
 		       MIXER_GAIN_CFG_RAM_ADDR((id) - 1), 0,	\
-		       0x20000, 0, tegra210_mixer_get_gain,	\
+		       TEGRA210_MIXER_GAIN_MAX, 0,		\
+		       tegra210_mixer_get_gain,			\
 		       tegra210_mixer_put_gain),		\
 	SOC_SINGLE_EXT("RX" #id " Instant Gain Volume",		\
 		       MIXER_GAIN_CFG_RAM_ADDR((id) - 1), 0,	\
-		       0x20000, 0, tegra210_mixer_get_gain,	\
+		       TEGRA210_MIXER_GAIN_MAX, 0,		\
+		       tegra210_mixer_get_gain,			\
 		       tegra210_mixer_put_instant_gain),
 
 /* Volume controls for all MIXER inputs */
@@ -418,6 +642,28 @@ static const struct snd_kcontrol_new tegra210_mixer_gain_ctls[] = {
 	GAIN_CTRL(8)
 	GAIN_CTRL(9)
 	GAIN_CTRL(10)
+
+	FADE_CTRL(1)
+	FADE_CTRL(2)
+	FADE_CTRL(3)
+	FADE_CTRL(4)
+	FADE_CTRL(5)
+	FADE_CTRL(6)
+	FADE_CTRL(7)
+	FADE_CTRL(8)
+	FADE_CTRL(9)
+	FADE_CTRL(10)
+	SOC_SINGLE_EXT("Fade Switch", SND_SOC_NOPM, 0, 1, 0,
+		       tegra210_mixer_get_fade_switch,
+		       tegra210_mixer_put_fade_switch),
+	{
+		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+		.name = "Fade Status",
+		.info = tegra210_mixer_fade_status_info,
+		.access = SNDRV_CTL_ELEM_ACCESS_READ |
+			  SNDRV_CTL_ELEM_ACCESS_VOLATILE,
+		.get = tegra210_mixer_get_fade_status,
+	},
 };
 
 static const struct snd_soc_dapm_widget tegra210_mixer_widgets[] = {
@@ -579,6 +825,7 @@ static bool tegra210_mixer_volatile_reg(struct device *dev,
 	case TEGRA210_MIXER_GAIN_CFG_RAM_DATA:
 	case TEGRA210_MIXER_PEAKM_RAM_CTRL:
 	case TEGRA210_MIXER_PEAKM_RAM_DATA:
+	case TEGRA210_MIXER_RX1_SAMPLE_COUNT:
 		return true;
 	default:
 		return false;
@@ -632,8 +879,11 @@ static int tegra210_mixer_platform_probe(struct platform_device *pdev)
 	dev_set_drvdata(dev, mixer);
 
 	/* Use default gain value for all MIXER inputs */
-	for (i = 0; i < TEGRA210_MIXER_RX_MAX; i++)
+	for (i = 0; i < TEGRA210_MIXER_RX_MAX; i++) {
 		mixer->gain_value[i] = gain_params.gain_value;
+		mixer->fade_gain[i] = gain_params.gain_value;
+		mixer->duration[i] = gain_params.duration[DURATION_N3_ID];
+	}
 
 	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs))
diff --git a/sound/soc/tegra/tegra210_mixer.h b/sound/soc/tegra/tegra210_mixer.h
index a330530fbc61..bcbad08cbb9d 100644
--- a/sound/soc/tegra/tegra210_mixer.h
+++ b/sound/soc/tegra/tegra210_mixer.h
@@ -79,12 +79,25 @@
 #define TEGRA210_MIXER_RX_LIMIT		(TEGRA210_MIXER_RX_MAX * TEGRA210_MIXER_REG_STRIDE)
 #define TEGRA210_MIXER_TX_MAX		5
 #define TEGRA210_MIXER_TX_LIMIT		(TEGRA210_MIXER_RX_LIMIT + (TEGRA210_MIXER_TX_MAX * TEGRA210_MIXER_REG_STRIDE))
+#define TEGRA210_MIXER_SAMPLE_COUNT_SHIFT	24
+#define TEGRA210_MIXER_SAMPLE_COUNT_ENABLE	BIT(TEGRA210_MIXER_SAMPLE_COUNT_SHIFT)
 
 #define REG_CFG_DONE_TRIGGER	0xf
 #define VAL_CFG_DONE_TRIGGER	0x1
 
 #define NUM_GAIN_POLY_COEFFS 9
-#define NUM_DURATION_PARMS 4
+#define TEGRA210_MIXER_GAIN_MAX			0x20000
+#define TEGRA210_MIXER_FADE_DURATION_MAX	0x7fffffff
+
+#define TEGRA210_MIXER_PRESCALAR	    6
+#define TEGRA210_MIXER_FADE_IDLE	    0
+#define TEGRA210_MIXER_FADE_ACTIVE	  1
+
+enum {
+	DURATION_N3_ID = 2,
+	DURATION_INV_N3_ID,
+	NUM_DURATION_PARMS,
+};
 
 struct tegra210_mixer_gain_params {
 	int poly_coeff[NUM_GAIN_POLY_COEFFS];
@@ -94,6 +107,10 @@ struct tegra210_mixer_gain_params {
 
 struct tegra210_mixer {
 	int gain_value[TEGRA210_MIXER_RX_MAX];
+	int fade_gain[TEGRA210_MIXER_RX_MAX];
+	u32 duration[TEGRA210_MIXER_RX_MAX];
+	bool in_fade[TEGRA210_MIXER_RX_MAX];
+	bool fade_pending[TEGRA210_MIXER_RX_MAX];
 	struct regmap *regmap;
 };
 
-- 
2.17.1

