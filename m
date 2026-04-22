Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013068.outbound.protection.outlook.com [40.107.201.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D185D346AE1;
	Wed, 22 Apr 2026 10:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776853858; cv=fail; b=SGr1NvKZBcvmI49GR4VQaR5A4SKXzP8u0bweV/NfyHenvJyV0x+SVaMtPq2njAGh+PU1zR3bnh0zldRsrskDGEAPkJqlMFUsSikL+t0RSDGm/urRxgxVWiQNbVM1ynHLyqaHxOSynUIriaj0F+A57Ure+nS31X3skAN9hnnRxxo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776853858; c=relaxed/simple;
	bh=GWypXlrha0NrygQ55N7VJUxCIxoy6+GTgc7HCUYZ9wU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=B0HC6yf68nlkY7W3wcozLWLOtHqSGMsQ6aQbLl4CsQZbiuWwDjtWEwyZ4J2Na5X9SCSMiR/tdZNbFNB5GY2C9Wmd5qt4tV/DpuEwl/nnXlQJ/kZFKYLZX0qLgJsi457JMAaVL2P4juZ/yMQ8X37/5XN3fSovoZS5t63S7fxVGgc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DdvEIZiH; arc=fail smtp.client-ip=40.107.201.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DdvEIZiH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G+GpLhoVYrMP5VXD+FPYRy2uTc5qzCUlzBtjfqHOXwHTvYGxOTaSufTK38oRcOSS6e2AcLbc0SSAi71Zego/Ez2OqFv5c3/oezBrvmBpp2IHGiRS/zM5EG/xFUfrpFgN/fLkRVObYyGiltV2plO1PJIF8oSa9EiNeYMRsnPlWk+QmRH3WXi9DHz3zoP7H83ZYL0l3VYrlQImjnsCNdwVKK/+oR1RrcYgnHurE3dO5EdiX++YgNMYGtjxCWHBwSe6QTXE0IiXUyQ5ouryd6jwgUtfips2obJkR7Tu0bILdq38sPXMxvyTdMfclCieLgFvCg68deTtEJ+rm4dLiAYRdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TmCXoknx5fww0UdKJZJ8ZANX8806AMOi9uOXKe1SII0=;
 b=ggD+FvbL7Nsn/EfbCdoJ3yfSvKTZw2s6pFqVdkt7/3QYsWYiGDcoStsvGWAHSKlaKoIws6ElFQgd0UQ5hfDfWpxixMaAjAbIV8MtGLP/vUQDtzVLteUC/gvbzobxwMOv9mcbMP0PTrydKaPnhCgGHiu8c4qmg38hXdFAeXwjoIFbIn8g5JYt4VUOyncFP8SrHn0BtlwlU4VWw/hD+blPi1x8DbYN74ssPI50ud7rtTJVMwU2YqI2encmITfJwyPZe6bMuR2jzFyLfXfF4hPyDpc4jQOSFhT7nZEi/Po/D4LVJld4wbPRMLJn6N1P7flrdTLPu/OzmCU87NqxDnsrZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TmCXoknx5fww0UdKJZJ8ZANX8806AMOi9uOXKe1SII0=;
 b=DdvEIZiHXCUzR+GlWaeak2ppC1rhYpbT5ZMliUSNp/Hz6AhUCfNSFCqaC6Zza9jOEM2Vq80Q2ix4dEEeC55MrINoPu+GyG9tRA8QFa2Csz4nsaHSPa/YklKIRHegGEFCdAp4knfE3TLj1C2br/4Zav1hCRgotRVZG0SYgzwpKNSLJLL+6/iF0dkbTA1vWxQcScwp/dX2htVc/GlqPsqd9wBY3gduLaMhxnw6+vKa7rQg1MR/LrIrqwYBkkqX6KNECjYufahOnpVICw9TGoHHKFK8Ryv1NRfXWYHMwCvPeQyCuX+XRoYtagWPhXQ3DHiXKewIEI4BFSwalgWiUSwhfQ==
Received: from CYZPR20CA0018.namprd20.prod.outlook.com (2603:10b6:930:a2::6)
 by DM6PR12MB4106.namprd12.prod.outlook.com (2603:10b6:5:221::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.20; Wed, 22 Apr
 2026 10:30:50 +0000
Received: from CY4PEPF0000EE3F.namprd03.prod.outlook.com
 (2603:10b6:930:a2:cafe::cc) by CYZPR20CA0018.outlook.office365.com
 (2603:10b6:930:a2::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Wed,
 22 Apr 2026 10:30:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000EE3F.mail.protection.outlook.com (10.167.242.17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 22 Apr 2026 10:30:49 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 22 Apr
 2026 03:30:33 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 22 Apr
 2026 03:30:33 -0700
Received: from build-sheetal-bionic-20251202.nvidia.com (10.127.8.14) by
 mail.nvidia.com (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Wed, 22 Apr 2026 03:30:32 -0700
From: Sheetal <sheetal@nvidia.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Thierry
 Reding" <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
	Sameer Pujar <spujar@nvidia.com>, Mohan Kumar <mkumard@nvidia.com>, "Kuninori
 Morimoto" <kuninori.morimoto.gx@renesas.com>, <linux-sound@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Sheetal
	<sheetal@nvidia.com>
Subject: [PATCH] ASoC: tegra: Add Mixer Fade controls
Date: Wed, 22 Apr 2026 10:29:57 +0000
Message-ID: <20260422102957.2706861-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3F:EE_|DM6PR12MB4106:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e3d1f3f-93be-494e-579e-08dea05a3934
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|30052699003|36860700016|82310400026|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	m2b/cFcvlAsuiXNxx2LOQjC7aJQUhO6TsbdhAM5T/gRY27ESEVnhMckxkjqXO+3tViOVxWKR5qPqVuN963fwGXurvXIte7yH7R+r9+G3RD41hAea/RVuvHtzv83M+IYx0q/F5vEizz3cipkDfW8q197l7AocNXzOKWoX5Z+6cbUTV1Rs7INZ3SGwG5QgvDuHfx7HlbarAa/oDhF6L2a/xcxkm+YoIMug3b3MPHfFeJ2MTf0Aw6JTxidLkS1g7fAbaXCX6p7NUoACbb4tkBO11cdw8Sbxx542IZx9Mb3aKHbb+dOEg1TpIT+anM2WqYdox45ELSIdpaNeKqGqSDO8DdDTHBi3K2CtkKGizMoFm8owhkEVUgd7cybOjg1KVJ/dKMBH/upNr5gKYviyxw3LMrEi+d6r9/SstGts4IBxJ362VqwGyeXdpynswG+990ZCiux249E00q+UBpAq4pavnE4yOXU2gfHdkJ0mHJW5PyLVK2lRB5n1uMni9ukbbA42CWMZZzc4adSgTOZp5cu+9+94ap9kcUKPOiLJ2RCtNPXSir/q37OWuKkdNw11QdRmEFvWtIEaKOqqErt2zWr3Y+d3gzVQQwzZyU/ea2kT4gOyV04BKvIk7szx1b5h7wwrD+conBvwu14gL9U3/3xYT32smSYZ9ONspo3BLqdz3w3QcWvbLHR80AJHDvYX6uc2SLQS8kFcOhHyUpNrtXZ1ED0k88ncQojWR7OWDd2kD2ryCiob58f9OQD4zL9upX8QQDTqGUvJqISsDffzeLdL1w==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(30052699003)(36860700016)(82310400026)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zMivIJdY1EviICC5mjeqFVJ+ytOJ5qniyYURJVBJGbV6jVoJ2GDzEnvtfZjmMgHMDmEo15rf5bjlSvpNVnTqzjMs6JhqgrPkTD2vQpyHjYxegQZQtrRfRXlWaga2MswtifNipVIr+euU6bxcsxd1Wzfbc9s+H/kLYfsCjQqoP3PcEPl7xO9VvXJqRJ28125huNFaxLiLd1VMwOjY40rbX2NasjUVDECSb6sb0ZptG50GhMrYEFujTlghIq9o0WAyRr8WT3EHQwLB81F/JsEE9mUGRryasa2vYwANlOK/wiaLkJE/06Fy3OzgFon7DramqngtfgWU1rpx4GJenDb+AVki/SPsxGs2FjOIxKfZT04PyEGTqKI/d3Tqqte6y6EBudhnoHYqNlp5u+8wwXHm4HWvlmXyAg4kmYF/YpuqCT3XeC9tQaegOVSHdRirgehT
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 10:30:49.9510
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e3d1f3f-93be-494e-579e-08dea05a3934
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4106

Add fade controls for the Tegra mixer to allow the user to configure
the gain and duration for each mixer stream. The mixer supports up to
10 input streams (RX1 through RX10), each with independently
configurable target gain and fade duration. The duration is specified
in terms of the total the number of samples and this is configured via
the N3 parameter in the mixer. The total duration (N3 parameter) used
in gain curve calculations of the form n/N3 or (N3-n)/N3, where n is
the current sample position.

The fade control accepts a comma-separated list of triplets:
  amixer -c <card> cset name="MIXER1 Fade" \
    "<id1>,<gain1>,<duration1>[,<id2>,<gain2>,<duration2>,...]"
  id       - mixer input RX stream index (1 to 10)
  gain     - target gain level
  duration - fade duration in samples (N3 parameter)

 Example: fade 2 streams simultaneously:
   amixer -c <card> cset name="MIXER1 Fade" "1,12000,1024,2,15000,2048"
   Stream 1: fade to gain 12000 over 1024 samples
   Stream 2: fade to gain 15000 over 2048 samples

The fade status reports per-stream state for all 10 RX inputs:
  amixer -c <card> cget name="MIXER1 Fade Status"
  Output: "0,1,-1,-1,-1,-1,-1,-1,-1,-1"

  -1 - inactive (no fade configured)
   0 - active (fade in progress)
   1 - complete (target gain reached)

 Once fading completes, the status resets to inactive for that stream.

Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 sound/soc/tegra/tegra210_mixer.c | 179 ++++++++++++++++++++++++++++++-
 sound/soc/tegra/tegra210_mixer.h |  16 ++-
 2 files changed, 190 insertions(+), 5 deletions(-)

diff --git a/sound/soc/tegra/tegra210_mixer.c b/sound/soc/tegra/tegra210_mixer.c
index ce44117a0b9c..7990038f005f 100644
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
+				val = (BIT(31) * BIT(TEGRA210_MIXER_PRESCALAR)) /
+					mixer->duration[id];
+			else
+				val = gain_params.duration[i];
+		}
 
 		err = tegra210_mixer_write_ram(mixer,
 					       REG_DURATION_PARAM(reg, i),
@@ -173,6 +180,124 @@ static int tegra210_mixer_configure_gain(struct snd_soc_component *cmpnt,
 	return err;
 }
 
+static int tegra210_mixer_put_fade(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
+	struct tegra210_mixer *mixer = snd_soc_component_get_drvdata(cmpnt);
+	u32 rx_id, rx_gain, rx_duration;
+	int id, base, err = 0;
+
+	/* Process array of RX stream parameters (id, gain, duration) */
+	for (id = 0; id < TEGRA210_MIXER_RX_MAX; id++) {
+		base = 3 * id;
+		rx_id = ucontrol->value.integer.value[base];
+		rx_gain = ucontrol->value.integer.value[base + 1];
+		rx_duration = ucontrol->value.integer.value[base + 2];
+
+		if (rx_id > TEGRA210_MIXER_RX_MAX) {
+			dev_err(cmpnt->dev, "Invalid mixer rx index %d\n", rx_id);
+			return -EINVAL;
+		}
+
+		/* Array ends here, user isn't required to pass all RX configurations */
+		if (rx_id == 0 && rx_gain == 0 && rx_duration == 0)
+			break;
+
+		/* Convert 1-based rx_id to 0-based array index */
+		rx_id = rx_id - 1;
+
+		/* Only update if values are different */
+		if (mixer->duration[rx_id] != rx_duration ||
+		    mixer->gain_value[rx_id] != rx_gain) {
+			err = tegra210_mixer_configure_gain(cmpnt, rx_id, false);
+			if (err) {
+				dev_err(cmpnt->dev,
+					"Failed to configure fade for channel %d\n",
+					rx_id);
+				return err;
+			}
+			err = 1;
+			mixer->duration[rx_id] = rx_duration;
+			mixer->gain_value[rx_id] = rx_gain;
+		}
+
+		if (!mixer->in_fade[rx_id]) {
+			pm_runtime_get_sync(cmpnt->dev);
+			err = regmap_update_bits(mixer->regmap,
+						 MIXER_REG(TEGRA210_MIXER_RX1_CTRL, rx_id),
+						 TEGRA210_MIXER_SAMPLE_COUNT_ENABLE,
+						 TEGRA210_MIXER_SAMPLE_COUNT_ENABLE);
+			pm_runtime_put(cmpnt->dev);
+			if (err) {
+				dev_err(cmpnt->dev,
+					"Failed to enable sample count for channel %d\n", rx_id);
+				return err;
+			}
+			err = 1;
+			mixer->in_fade[rx_id] = true;
+		}
+	}
+
+	return err;
+}
+
+static int tegra210_mixer_get_fade(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
+	struct tegra210_mixer *mixer = snd_soc_component_get_drvdata(cmpnt);
+	u32 id, base, index = 0;
+
+	for (id = 0; id < TEGRA210_MIXER_RX_MAX; id++) {
+		if (mixer->in_fade[id]) {
+			base = 3 * index;
+			ucontrol->value.integer.value[base] = id + 1;
+			ucontrol->value.integer.value[base + 1] = mixer->gain_value[id];
+			ucontrol->value.integer.value[base + 2] = mixer->duration[id];
+			index++;
+		}
+	}
+
+	return 0;
+}
+
+static int tegra210_mixer_get_fade_status(struct snd_kcontrol *kcontrol,
+					  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
+	struct tegra210_mixer *mixer = snd_soc_component_get_drvdata(cmpnt);
+	u32 count;
+	int id;
+
+	pm_runtime_get_sync(cmpnt->dev);
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
+			ucontrol->value.integer.value[id] = TEGRA210_MIXER_FADE_COMPLETE;
+			regmap_update_bits(mixer->regmap,
+					   MIXER_REG(TEGRA210_MIXER_RX1_CTRL, id),
+					   TEGRA210_MIXER_SAMPLE_COUNT_ENABLE, 0);
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
@@ -396,6 +521,44 @@ ADDER_CTRL_DECL(adder3, TEGRA210_MIXER_TX3_ADDER_CONFIG);
 ADDER_CTRL_DECL(adder4, TEGRA210_MIXER_TX4_ADDER_CONFIG);
 ADDER_CTRL_DECL(adder5, TEGRA210_MIXER_TX5_ADDER_CONFIG);
 
+static int tegra210_mixer_param_info(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_info *uinfo)
+{
+	struct soc_bytes *params = (void *)kcontrol->private_value;
+
+	if (strstr(kcontrol->id.name, "Status")) {
+		params->num_regs = 10;
+		uinfo->value.integer.min = TEGRA210_MIXER_FADE_IDLE;
+		uinfo->value.integer.max = TEGRA210_MIXER_FADE_COMPLETE;
+	} else {
+		params->num_regs = 30;
+		uinfo->value.integer.min = 0;
+		uinfo->value.integer.max = U32_MAX;
+	}
+
+	/* Set control info */
+	uinfo->type = params->mask;
+	uinfo->count = params->num_regs;
+
+	return 0;
+}
+
+#define MIXER_FADE_CTRL(xname, xbase, xnum_regs, xget, xput, xaccess, xmask) \
+{ \
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, \
+	.info =  tegra210_mixer_param_info, \
+	.name = xname, \
+	.access = xaccess, \
+	.get = xget, \
+	.put = xput, \
+	.private_value = (unsigned long)&(struct soc_bytes)	\
+	{ \
+		.base = xbase, \
+		.num_regs = xnum_regs, \
+		.mask = xmask \
+	} \
+},
+
 #define GAIN_CTRL(id)	\
 	SOC_SINGLE_EXT("RX" #id " Gain Volume",			\
 		       MIXER_GAIN_CFG_RAM_ADDR((id) - 1), 0,	\
@@ -418,6 +581,11 @@ static const struct snd_kcontrol_new tegra210_mixer_gain_ctls[] = {
 	GAIN_CTRL(8)
 	GAIN_CTRL(9)
 	GAIN_CTRL(10)
+
+MIXER_FADE_CTRL("Fade", 0x0, 30, tegra210_mixer_get_fade, tegra210_mixer_put_fade,
+		SNDRV_CTL_ELEM_ACCESS_READWRITE, SNDRV_CTL_ELEM_TYPE_INTEGER)
+MIXER_FADE_CTRL("Fade Status", 0x0, 10, tegra210_mixer_get_fade_status, NULL,
+		SNDRV_CTL_ELEM_ACCESS_READ, SNDRV_CTL_ELEM_TYPE_INTEGER)
 };
 
 static const struct snd_soc_dapm_widget tegra210_mixer_widgets[] = {
@@ -579,6 +747,7 @@ static bool tegra210_mixer_volatile_reg(struct device *dev,
 	case TEGRA210_MIXER_GAIN_CFG_RAM_DATA:
 	case TEGRA210_MIXER_PEAKM_RAM_CTRL:
 	case TEGRA210_MIXER_PEAKM_RAM_DATA:
+	case TEGRA210_MIXER_RX1_SAMPLE_COUNT:
 		return true;
 	default:
 		return false;
@@ -632,8 +801,10 @@ static int tegra210_mixer_platform_probe(struct platform_device *pdev)
 	dev_set_drvdata(dev, mixer);
 
 	/* Use default gain value for all MIXER inputs */
-	for (i = 0; i < TEGRA210_MIXER_RX_MAX; i++)
+	for (i = 0; i < TEGRA210_MIXER_RX_MAX; i++) {
 		mixer->gain_value[i] = gain_params.gain_value;
+		mixer->duration[i] = gain_params.duration[DURATION_N3_ID];
+	}
 
 	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs))
diff --git a/sound/soc/tegra/tegra210_mixer.h b/sound/soc/tegra/tegra210_mixer.h
index a330530fbc61..da16f0002bfd 100644
--- a/sound/soc/tegra/tegra210_mixer.h
+++ b/sound/soc/tegra/tegra210_mixer.h
@@ -79,12 +79,24 @@
 #define TEGRA210_MIXER_RX_LIMIT		(TEGRA210_MIXER_RX_MAX * TEGRA210_MIXER_REG_STRIDE)
 #define TEGRA210_MIXER_TX_MAX		5
 #define TEGRA210_MIXER_TX_LIMIT		(TEGRA210_MIXER_RX_LIMIT + (TEGRA210_MIXER_TX_MAX * TEGRA210_MIXER_REG_STRIDE))
+#define TEGRA210_MIXER_SAMPLE_COUNT_SHIFT	24
+#define TEGRA210_MIXER_SAMPLE_COUNT_ENABLE	BIT(TEGRA210_MIXER_SAMPLE_COUNT_SHIFT)
 
 #define REG_CFG_DONE_TRIGGER	0xf
 #define VAL_CFG_DONE_TRIGGER	0x1
 
 #define NUM_GAIN_POLY_COEFFS 9
-#define NUM_DURATION_PARMS 4
+
+#define TEGRA210_MIXER_PRESCALAR	    6
+#define TEGRA210_MIXER_FADE_IDLE	    (-1)
+#define TEGRA210_MIXER_FADE_ACTIVE	  0
+#define TEGRA210_MIXER_FADE_COMPLETE	1
+
+enum {
+	DURATION_N3_ID = 2,
+	DURATION_INV_N3_ID,
+	NUM_DURATION_PARMS,
+};
 
 struct tegra210_mixer_gain_params {
 	int poly_coeff[NUM_GAIN_POLY_COEFFS];
@@ -94,6 +106,8 @@ struct tegra210_mixer_gain_params {
 
 struct tegra210_mixer {
 	int gain_value[TEGRA210_MIXER_RX_MAX];
+	u32 duration[TEGRA210_MIXER_RX_MAX];
+	bool in_fade[TEGRA210_MIXER_RX_MAX];
 	struct regmap *regmap;
 };
 
-- 
2.17.1

