Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011049.outbound.protection.outlook.com [40.93.194.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BD33F65EB;
	Wed,  6 May 2026 10:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778062867; cv=fail; b=WW/R/GpkZ1bAIztw6HAE9ULfrcK2jDB5KSD7ZjvMa3AN8gppUD8LFkINp64JKcTCq6pdiopApae42+aZA+q1NcJo1TxN/9m5kAN+0f/4Fk4tI41ENEHtp26v0g0Hv30g9EXqeGcjd/iLLWwVGXOBinIpEcLsEpV17kzvgKryZuc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778062867; c=relaxed/simple;
	bh=goqy1OHne3CPie28bpAjYk/sz4XA2FTj9dZHY6eXnBU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=O4UvttsSQwxmxkJ3uY2Cpj9QnnKHUxvqNhtZ7cepvJNngQL/wpoU7r6tNtg2SOhTXHD20f20UFMrbUt0/KHjiS/4oQcLdvnPlascXYCuql57sGPqWEed+I+ypgt1hgCYr97vKpI+LKMh7pcLc9vPa/2X5TwQROJn84xhS9ZIQ/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HAobXIDA; arc=fail smtp.client-ip=40.93.194.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HAobXIDA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WZJaKDlQEpD6DvSDZu3Pw/coU3NzSXXs1i1AeEmkn/CD7DbO5O3HHo5tsNqA3yyVf8rF0JKTMe0Nv3VRHoSiju0xnSf0YP3PF3/rLZBuzaOEGGHHEKW0BVyw344jCDnRHidurV+WoQqAQRSj9rkY1aWpGsrLKyw+Q1x1iNpH10w4TzgEzWGCXGZO+LbhWW/fCy2e4FNi6BVsCZ5sW/NSVzcJI1/c3zMJFL/Au8Mg+m1ZvyAB74U8/tGjZti356U47QIvyv2gyI+boE3+FPQ8ZDX3EhvO8uzJTvm7UarVYmmIioMP8kIkAbS7sdXHKqJ3gm/T73H4Dsf1Tkp07bc4BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B/3pVVlHr+MQaYlSJGsZPL91Bqc8gTzjC7ndD7k0kCw=;
 b=oH2wbjR9/cQqLDO58msglb4RlZ3RUqNIJD7O/Y3MbAEewduhe9nirMwbF1lKE4WlTDIE2WRoL/QrZ5dJr9W+0cgUPL/ihh/kEfRlltvsLZ+CP4EHLylRZIzDLYyqqx39ITUMsA3wr9o1kQ5OyHaDEWkyH0Gd0zt5Y9D3lHqkq6clIEsV4Kh+Z0mvEz7wPkErrsN5OW0rrjqZwXMu1VHskjFDbygJGnfdqJqDa6tX+4IdpFCYVgAqPJKWcW8gB3mAKbGFoN+xBRs8nTtV4qU/Emm77kI/6CWup7huLeqHPn8je92CTK37MP4shfGMuK2Dx8MCTjELXnGVKmnGjrxiSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B/3pVVlHr+MQaYlSJGsZPL91Bqc8gTzjC7ndD7k0kCw=;
 b=HAobXIDAS42yzcDO5QQVydx6Y4AkIPPqZS1LP76mFgrE63D/D5LL2TQm5A3oXlnpZHwKrErwq2kOFSbft84jmTx0ADM0Ch5PjAEX9X6aYAqquTjiyxEqY0fWDzIwxa6cjjkpF6aupFoCoiEjwlCR0A3K8ekT7EEd+t8A51KxdmE8x4WitWw++xIpSwG5TNH6exgFFzLiZjJNhoqrUNaPWRiDaM4ju8rsnrGLTDuhxUBmbIjLPkmPztU+064/JXb+N1CNEZnhHMRUUuAD0nuk28X1MTEUsUCHuTvdQzJVM1IBJIg9VJN2HzX8Zmzs/SlUTQPucWtoFgjeaVwsHGkqxQ==
Received: from BYAPR06CA0064.namprd06.prod.outlook.com (2603:10b6:a03:14b::41)
 by SA1PR12MB8920.namprd12.prod.outlook.com (2603:10b6:806:38e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 10:20:55 +0000
Received: from MWH0EPF000A6734.namprd04.prod.outlook.com
 (2603:10b6:a03:14b:cafe::2e) by BYAPR06CA0064.outlook.office365.com
 (2603:10b6:a03:14b::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.27 via Frontend Transport; Wed,
 6 May 2026 10:20:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 MWH0EPF000A6734.mail.protection.outlook.com (10.167.249.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Wed, 6 May 2026 10:20:54 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 6 May
 2026 03:20:35 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 6 May 2026 03:20:35 -0700
Received: from build-sheetal-bionic-20251202.nvidia.com (10.127.8.14) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Wed, 6 May 2026 03:20:34 -0700
From: Sheetal <sheetal@nvidia.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Thierry
 Reding" <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
	Sameer Pujar <spujar@nvidia.com>, Mohan Kumar <mkumard@nvidia.com>, "Kuninori
 Morimoto" <kuninori.morimoto.gx@renesas.com>, <linux-sound@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Sheetal
	<sheetal@nvidia.com>
Subject: [PATCH v4] ASoC: tegra: Add per-stream Mixer Fade controls
Date: Wed, 6 May 2026 10:20:32 +0000
Message-ID: <20260506102032.1644851-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6734:EE_|SA1PR12MB8920:EE_
X-MS-Office365-Filtering-Correlation-Id: b661ccf9-c391-49b9-6385-08deab592854
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|30052699003|1800799024|82310400026|376014|36860700016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	EtCwyFrBwUdTyPBBpkMehOqWnEJ9wmFgmSN75EBcpQefqfPDCaTd7Er6q7UsRXqOuQP13IRsukqQ8wlyMyIJR61d+lTTvNZOZxBKQfw+/C2Ho8gOvVFvW1ptnMTE3g4eakK+wHTJACr/DheEj46aFn5gCt5JWL0cDUNXdFOqLtgfqs7wBAG2WJq4OFXlemxX6KVmio5HiREzhL6tagGXZwSmz00on5oSvORkdcaMO5J+GS74Eb8L5pHV8ClEVKxZXxU1OTAICr/TVpHS/3zCJ6MULFnlw6VyTP0n7NRYmGO8pLF9oVPgF61StcTvO6imNhwk2X6F1xg9ASoPf+8wfir0//FG9ZhUJ1qyVRZYzjtDPRlVt9QGZVrgHpuqHHxdpv1FK3ObFT42PnQWLhnzz+Mh/iacnzijscKFHg3E6Ghd4iTrKUZ5ixjHJEqz/VlweCSriHBgDFrNlLR1ePEFWC9chqjKUBES1Ju5Jzqhpu6ZlQxoxVauXuCV61lGPMSxGmYIqs1Cwz5Wtjrt1fyVB+wfkY1r+XYF94WPF2vQGnD7nwbPoe3RghdyaciAUfA9a7qlUdqsA7GTwRqY8m43HDzA+XV4PYi827hz/J/+L6yB20vv8Td80leMohEUSuixT5gzONKs1o8AF7aveetk3jkJxC4dRoFNopuy6p2M7UNARuvc4xmHIBaJ1KowH+KQs8a9d/dsbIq0Lh+HirsoD7l79nX58sQJ77nVeGrmMLU=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(30052699003)(1800799024)(82310400026)(376014)(36860700016)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	M/RSxEDx5qs1hzPW4mMVApCAtt/hNc91wJ2MFs6n7029hvzvG3XAS63ROrJEDgHPhBaBfjhIdtvW9rkppjtxVbdVZzUbiYGTgAJkL72SIJ4xSyAAJDL9P5oC/os5H7QKwvckdwZ7icyCeuWL+JFnHuEM0puOu/INFIZr+JR3rqk9B1UmPRFK1z3GEv56j83Q/n1vhYz7x/ta+2tP1o5A5W33+sWV/PJryjpagaWbcXOwqQqztE1x4F9bCdsKq2zvubmtac/K3L7A8gNvOm+Wgp0NpmQCzuoktnXfix+Zy6/mUx/AukbhGD2IPKiAGMHwm4/0Z4izJ0sxLOJAYWlLeTMMmbtvUTxFUUwBDXFCiN0QpuCwLLeZrsVs7b2YxDIaBEv/eAG5ITP+5bh45Q+SegUYmev/d/lE5YyA9FK98kpZnMwWaW47W6F2VOuAa5nf
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 10:20:54.9365
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b661ccf9-c391-49b9-6385-08deab592854
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6734.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8920

Add per-stream fade controls for the Tegra mixer to allow
independently configuring target gain and fade duration for each of
the 10 input streams (RX1 through RX10).

The following controls are added per stream:
  "RXn Fade Duration" - fade duration in samples (N3 parameter)
  "RXn Fade Gain"     - target gain level for fade

A strobe control commits all pending fade configurations:
  "Fade Switch"       - 1 = apply staged gain/duration and start fades
                        0 = disable sample count for all fading streams

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
Changes in v4:
  - Make get_fade_status purely read-only (no hardware writes or
    in_fade modifications); in_fade managed exclusively by
    put_fade_switch
  - Add explicit validation for gain and duration in put callbacks

 sound/soc/tegra/tegra210_mixer.c | 266 ++++++++++++++++++++++++++++++-
 sound/soc/tegra/tegra210_mixer.h |  19 ++-
 2 files changed, 278 insertions(+), 7 deletions(-)

diff --git a/sound/soc/tegra/tegra210_mixer.c b/sound/soc/tegra/tegra210_mixer.c
index ce44117a0b9c..f05617b5f433 100644
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
@@ -173,6 +180,204 @@ static int tegra210_mixer_configure_gain(struct snd_soc_component *cmpnt,
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
+	if (duration == 0 || duration > TEGRA210_MIXER_FADE_DURATION_MAX)
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
+	if (ucontrol->value.integer.value[0] < 0 ||
+	    ucontrol->value.integer.value[0] > TEGRA210_MIXER_GAIN_MAX)
+		return -EINVAL;
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
+					   MIXER_REG(TEGRA210_MIXER_RX1_CTRL,
+						     id),
+					   TEGRA210_MIXER_SAMPLE_COUNT_ENABLE,
+					   0);
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
+		if (count >= mixer->duration[id])
+			ucontrol->value.integer.value[id] = TEGRA210_MIXER_FADE_IDLE;
+		else
+			ucontrol->value.integer.value[id] = TEGRA210_MIXER_FADE_ACTIVE;
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
@@ -396,14 +601,37 @@ ADDER_CTRL_DECL(adder3, TEGRA210_MIXER_TX3_ADDER_CONFIG);
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
@@ -418,6 +646,28 @@ static const struct snd_kcontrol_new tegra210_mixer_gain_ctls[] = {
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
@@ -579,6 +829,7 @@ static bool tegra210_mixer_volatile_reg(struct device *dev,
 	case TEGRA210_MIXER_GAIN_CFG_RAM_DATA:
 	case TEGRA210_MIXER_PEAKM_RAM_CTRL:
 	case TEGRA210_MIXER_PEAKM_RAM_DATA:
+	case TEGRA210_MIXER_RX1_SAMPLE_COUNT:
 		return true;
 	default:
 		return false;
@@ -632,8 +883,11 @@ static int tegra210_mixer_platform_probe(struct platform_device *pdev)
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

