Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012025.outbound.protection.outlook.com [40.107.200.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1F33A3E94;
	Wed, 29 Apr 2026 07:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777446522; cv=fail; b=Lwkje4sdJQ24JiBGu4LndmyoetIrXnhtMCL0OlEDYjxYhZx6LrO80pNVEybLrTkpJ/WuLw9QZZqJgP37rLihiZ68hfOJtKAJSGOtkA57EYcmxr9xcNpXcz+C/4Da0VZrXjg/hucly+0YbAkfEGSffqZ7pDKyKoZ7W3ywBJIwaZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777446522; c=relaxed/simple;
	bh=7AiPRadnNRLUnsdZAEPbLImlsMxubns5oejUKwr6s5g=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=frx4DVHOoQzrsZpjvJIuOZtdrLXZrQA9gSj8K4AeqB+w76rdbxDzb9amq/AS5mOyEtgREwkRcM36BTRE3OC5JtTUVQYmuWL8Lun4A3pxAoaPhcc+mIdtYl0FI2e33TM8oSyOIFrkNQqhuR8l+INa/7XLIHXvghQ1D7YA7MDnfDg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kIxAdjUJ; arc=fail smtp.client-ip=40.107.200.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kIxAdjUJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bji4gvdiE2pJ5OHWRogdmjbQ+WQU/ep8LWdSZaUMNYw2dV8GiACouKqu0ACdqmWpA3q4lBdgmIk89IhSec97Q5c+1qgrfNIDidG1nXX9aNk+sDbgRlzGm4iTgIVPxez0UCESAckjXuqiY4sAie1kdxHEximX9/GEONHVC0KQCufgG8C/1NucfflYbi6JMFQO9cxmCU3CZ15JwszZ87yJreD1qB0JfXW9thg1CYP8jfZ5CKvWRLo/HU+9UZwRm/QQODBXTazzjGouVG//Rm2UwNvcnm5SqAIChU1IF2lRUFNrEnzOYY6aS83VLpQX0MZAMtgpvIkYCpDokX+jlq2j2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HHLGhJUjmkk91bt2maFVbnNxKMbmcLuBihe9DX9myTk=;
 b=vb1LOml1Yt6d91xCbLfdK7go3tWJQfGgAb2c73hlWspBkpqBVOQ5BZpej8y8yB1T+abh2ZHSrM7u3HOBvIZhM9dtU4qLYXD51dqgZAu461Nm+q5igEXuXiXCIkf55/BlwD2VHJziA+09qCDbzisZPIx4nKvVVKDvzqPkcZyatw73/Nq92lPwOJXlgJfnLNxtm/0KShrb8cyh1si9YVpBnjIvfiS3IYnlBSFvJLYUjsizd1gJ6kYVc/kWIHGmtpzWZfnpP2Czhx6KFjGkNT/yecw5My9HfJElCbj1qoFQz23xlf6UMFwI87dvcnohurtiuRqBPqjPRsj0Zo4A311E9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HHLGhJUjmkk91bt2maFVbnNxKMbmcLuBihe9DX9myTk=;
 b=kIxAdjUJxfPiRq0k5OjpTpzG3Kj242jDYzp0Hhsy/Oh40NuwkZvrNoR1ccxGPXG9uVywvmEWeZacLulQEf+sWbFOsgH8nF/0ZNs48Q3snVeLKytpNfhsnnXe1cS2Qhp/bXSxfGjFfkgGETHignoAuKtZm8lVFmz6V69gHlzpPTY91VnxKtUB7HZeDq0hptLwbjrrM6PGYEj0fGycJPzO4vn5MVsSrKNZ7KixWjhLwSXOMVbdR1hmrLBkbHcPN+LWiLnxxZyElO7TUDSe/ABDaVMQoTRwW/ibmxCRJtSAqdMfk1MZm+3Z1J7+DwJHD+ObLfWHid8+gKzlm21Ge6ZsqQ==
Received: from BL0PR02CA0008.namprd02.prod.outlook.com (2603:10b6:207:3c::21)
 by MN2PR12MB4206.namprd12.prod.outlook.com (2603:10b6:208:1d5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Wed, 29 Apr
 2026 07:08:28 +0000
Received: from MN1PEPF0000ECD6.namprd02.prod.outlook.com
 (2603:10b6:207:3c:cafe::19) by BL0PR02CA0008.outlook.office365.com
 (2603:10b6:207:3c::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.29 via Frontend Transport; Wed,
 29 Apr 2026 07:08:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MN1PEPF0000ECD6.mail.protection.outlook.com (10.167.242.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 07:08:28 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 00:08:12 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 00:08:11 -0700
Received: from build-sheetal-bionic-20251202.nvidia.com (10.127.8.14) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Wed, 29 Apr 2026 00:08:11 -0700
From: Sheetal <sheetal@nvidia.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Thierry
 Reding" <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
	Sameer Pujar <spujar@nvidia.com>, Mohan Kumar <mkumard@nvidia.com>, "Kuninori
 Morimoto" <kuninori.morimoto.gx@renesas.com>, <linux-sound@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Sheetal
	<sheetal@nvidia.com>
Subject: [PATCH v2] ASoC: tegra: Add per-stream Mixer Fade controls
Date: Wed, 29 Apr 2026 07:06:03 +0000
Message-ID: <20260429070603.2791011-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD6:EE_|MN2PR12MB4206:EE_
X-MS-Office365-Filtering-Correlation-Id: 7523ed52-9f93-4bbb-475b-08dea5be1d14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|30052699003|36860700016|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	dyw+rO9+gkZXf0ynNsONLHRlsiKkG0NcuKl+s2BwQa2pWlxn0bP2QPMcHir2jdC8D4ObDt6fpDxPS4oJU+MpbIrOn4l0sRZBMWm0q2EZ/9Ackz93VylYtYgF4ml4dfZqK/nMYd2B42gZQwVQNG9Zzir+g2IHCoksM6U/U5bENjQhZs/1r0isER48fr4mI322AMza7bUjqTRi+aLKPJtbHytP4BRFU+qzv7tynqrZ72xW3GsDLhwMgGX3bpcLAtR0Ph3sGH+SyDaFYkGGe6m03VAH0vzUgb7N74maAYOGr6voRLl5vqlvyxXva2ddQgT9baY52Tf4ab9PElYXrD9iCbJplC+EXg0QUuLveuF/0gWWX0WC0d0N1rFYOcpmv1eqykut8p4fI+sPEXukbemtPZJGVLefthj+GsATTRt1zj/qhCdNsGqGRXRgTy5L7PrGPY9JibGiKArY12uv3f/5QqUifbCL1JTlla4Z4Cz88fRMQROmbA/j10FUloDYppBJRuqWfLmwDp+6XbsFz3rzThPii9xB+pGvnhQe/79wiY2x7d60spitipB+sAiXuHwZFPz+SIXFn3NJjMdqR8BST6iyMdkDxJfttEwkMSzbaKaFOGzUSxgfp+jn9yclp4R/kUy6iSpAVtBy9+1WcpYEJWgmngO9ugJs/Pt5voxS34Xn7LAmlzyit16Uo6BfbtR0LpmG9zi9Z/vWbqfHVhAW4y4wat1cFjwTRjp/z3pRfy1/JImrSCMUZvQjJYvIgaVwC4m6BNi5c34XlzpMQypRkg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(30052699003)(36860700016)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QIYji629KRlKgL01mXGhgp7zCTuzvEwGYBvr/TQQganc6kxIIDXf9FZk7EoT4GFUEifngPyptuJfyaRH5C09bUtRsJBHMXHzHaMCJ7VD8NBBy4vuj9tZkL2C6kiTLbbnrc7jBL4CHahn91bod3GzBUjuroel2gSjza0XE6Wyki3V+BmRdcTZwLl29oITikYgq5oZdS6nMI9sb3TuWk4h8eKYZHdXI5nfRmKa+RvqWnGrikKAFdNQCeQfo02CPPtjnFfBsXmjRSNa1F7nj1BGlRCF5wKpdM8vM3fXDPaT5PcrgB8gV1ij8VQaPOCsm0pmLlvuqKzDlEdbF1uyenJrv/NKdFQs9bUs8Srq1rzy7OsyRR5QnDwPmu5wsQI6AXNXffd+qpI9H0TtOW3720f0uUaMiAM2ypSxz9smKsgmbAXdqzv24zLcOV2OiF2TZToS
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 07:08:28.1418
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7523ed52-9f93-4bbb-475b-08dea5be1d14
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4206

Add per-stream fade controls for the Tegra mixer to allow
independently configuring target gain and fade duration for each of
the 10 input streams (RX1 through RX10).

The following controls are added per stream:
  "RXn Fade Duration" - fade duration in samples (N3 parameter)
  "RXn Fade Gain"     - target gain level for fade

A strobe control commits all pending fade configurations:
  "Fade Enable"       - applies staged gain/duration for all pending
                        streams and starts the fade

A read-only status control reports per-stream fade state:
  "Fade Status"       - per-stream state for all 10 RX inputs
                        -1 = inactive, 0 = active, 1 = complete

Usage example (fade 2 streams simultaneously):
  amixer -c <card> cset name="RX1 Fade Duration" 1024
  amixer -c <card> cset name="RX1 Fade Gain" 12000
  amixer -c <card> cset name="RX2 Fade Duration" 2048
  amixer -c <card> cset name="RX2 Fade Gain" 15000
  amixer -c <card> cset name="Fade Enable" 1

Signed-off-by: Sheetal <sheetal@nvidia.com>
---
Changes in v2:
- Replaced packed triplet control with per-stream "RXn Fade Duration"
  and "RXn Fade Gain" controls, plus a "Fade Enable" strobe to commit
  all pending fades atomically (Mark)
- Added duration == 0 validation to prevent divide-by-zero (Mark)
- Fixed configure_gain using stale values by separating staging (put)
  from apply (strobe), so values are stored before hardware write (Mark)
- Fixed BIT(31) * BIT(6) integer overflow on 32-bit systems by using
  BIT_ULL
- Added pm_runtime_resume_and_get() error checking in put_fade_enable
  and get_fade_status
- Split fade_enable into two passes: configure gain first, then enable
  sample count for all streams to start fading near-simultaneously
- Added TEGRA210_MIXER_GAIN_MAX and TEGRA210_MIXER_FADE_DURATION_MAX
  macros to replace magic numbers in control definitions

 sound/soc/tegra/tegra210_mixer.c | 236 ++++++++++++++++++++++++++++++-
 sound/soc/tegra/tegra210_mixer.h |  20 ++-
 2 files changed, 249 insertions(+), 7 deletions(-)

diff --git a/sound/soc/tegra/tegra210_mixer.c b/sound/soc/tegra/tegra210_mixer.c
index ce44117a0b9c..f461303fba25 100644
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
@@ -173,6 +180,175 @@ static int tegra210_mixer_configure_gain(struct snd_soc_component *cmpnt,
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
+	ucontrol->value.integer.value[0] = mixer->gain_value[mc->reg];
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
+	if (mixer->gain_value[id] == ucontrol->value.integer.value[0])
+		return 0;
+
+	mixer->gain_value[id] = ucontrol->value.integer.value[0];
+	mixer->fade_pending[id] = true;
+
+	return 1;
+}
+
+static int tegra210_mixer_get_fade_enable(struct snd_kcontrol *kcontrol,
+					  struct snd_ctl_elem_value *ucontrol)
+{
+	ucontrol->value.integer.value[0] = 0;
+
+	return 0;
+}
+
+static int tegra210_mixer_put_fade_enable(struct snd_kcontrol *kcontrol,
+					  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
+	struct tegra210_mixer *mixer = snd_soc_component_get_drvdata(cmpnt);
+	int id, err, changed = 0;
+
+	/* Configure gain for all pending streams */
+	for (id = 0; id < TEGRA210_MIXER_RX_MAX; id++) {
+		if (!mixer->fade_pending[id])
+			continue;
+
+		err = tegra210_mixer_configure_gain(cmpnt, id, false);
+		if (err) {
+			dev_err(cmpnt->dev,
+				"Failed to configure fade for RX%d\n", id + 1);
+			return err;
+		}
+
+		changed = 1;
+	}
+
+	if (!changed)
+		return 0;
+
+	/* Enable sample count for all pending streams */
+	err = pm_runtime_resume_and_get(cmpnt->dev);
+	if (err < 0)
+		return err;
+
+	for (id = 0; id < TEGRA210_MIXER_RX_MAX; id++) {
+		if (!mixer->fade_pending[id])
+			continue;
+
+		if (!mixer->in_fade[id]) {
+			err = regmap_update_bits(mixer->regmap,
+						 MIXER_REG(TEGRA210_MIXER_RX1_CTRL, id),
+						 TEGRA210_MIXER_SAMPLE_COUNT_ENABLE,
+						 TEGRA210_MIXER_SAMPLE_COUNT_ENABLE);
+			if (err) {
+				dev_err(cmpnt->dev,
+					"Failed to enable sample count for RX%d\n",
+					id + 1);
+				pm_runtime_put(cmpnt->dev);
+				return err;
+			}
+			mixer->in_fade[id] = true;
+		}
+
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
@@ -396,14 +572,37 @@ ADDER_CTRL_DECL(adder3, TEGRA210_MIXER_TX3_ADDER_CONFIG);
 ADDER_CTRL_DECL(adder4, TEGRA210_MIXER_TX4_ADDER_CONFIG);
 ADDER_CTRL_DECL(adder5, TEGRA210_MIXER_TX5_ADDER_CONFIG);
 
+static int tegra210_mixer_fade_status_info(struct snd_kcontrol *kcontrol,
+					   struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = TEGRA210_MIXER_RX_MAX;
+	uinfo->value.integer.min = TEGRA210_MIXER_FADE_IDLE;
+	uinfo->value.integer.max = TEGRA210_MIXER_FADE_COMPLETE;
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
@@ -418,6 +617,28 @@ static const struct snd_kcontrol_new tegra210_mixer_gain_ctls[] = {
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
+	SOC_SINGLE_EXT("Fade Enable", SND_SOC_NOPM, 0, 1, 0,
+		       tegra210_mixer_get_fade_enable,
+		       tegra210_mixer_put_fade_enable),
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
@@ -579,6 +800,7 @@ static bool tegra210_mixer_volatile_reg(struct device *dev,
 	case TEGRA210_MIXER_GAIN_CFG_RAM_DATA:
 	case TEGRA210_MIXER_PEAKM_RAM_CTRL:
 	case TEGRA210_MIXER_PEAKM_RAM_DATA:
+	case TEGRA210_MIXER_RX1_SAMPLE_COUNT:
 		return true;
 	default:
 		return false;
@@ -632,8 +854,10 @@ static int tegra210_mixer_platform_probe(struct platform_device *pdev)
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
index a330530fbc61..b7c896dec2e8 100644
--- a/sound/soc/tegra/tegra210_mixer.h
+++ b/sound/soc/tegra/tegra210_mixer.h
@@ -9,6 +9,7 @@
 #ifndef __TEGRA210_MIXER_H__
 #define __TEGRA210_MIXER_H__
 
+
 /* XBAR_RX related MIXER offsets */
 #define TEGRA210_MIXER_RX1_SOFT_RESET	0x04
 #define TEGRA210_MIXER_RX1_STATUS	0x10
@@ -79,12 +80,26 @@
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
@@ -94,6 +109,9 @@ struct tegra210_mixer_gain_params {
 
 struct tegra210_mixer {
 	int gain_value[TEGRA210_MIXER_RX_MAX];
+	u32 duration[TEGRA210_MIXER_RX_MAX];
+	bool in_fade[TEGRA210_MIXER_RX_MAX];
+	bool fade_pending[TEGRA210_MIXER_RX_MAX];
 	struct regmap *regmap;
 };
 
-- 
2.17.1

