Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793791287;
	b=zChuG3Jsc/eRxeRXr8d1tC9txBqmpVxz8Jj3tFN2OVLfQ/a5qviQ57m/cTTprhHCxFMX
	 hm+X+X23uPiTAK8kNP4flFiH48czptjTJZbxhy9y1P0qPaw7uPRdy7DJNly2KjGVGRbgY
	 15jqp3ma8yjlkWlKHNk42tbARNpKXmPLRmPfL7RM0uJuU7oQgxBHRmllj7VLwThijnYkP
	 fPE5SY7SKzZ233REpa/5Dt98vXd/Ep85derM0pQgNuDBX9JTQ6uoaXoxu8aYeL/UmB02X
	 fdwc7+/IaTyuQC2UF71elgHEBuMCrKkAH8J0X7ShBkvfHDfBDeOcGQYhJkPO5a57k3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793791287;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-NV-OnPremToCloud:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Q0odZPIeD62Zoceg4JSS4/oJK0alNHJrQnic/jujHRc=;
	b=EQ4t1q80iuqWuhDnpaoh4DP2v07Xht/XA2KxYBgMWqvePTbIp/6Hesq2VGrBL03sU+bq
	 hXAURfWX4mauX3HcqHgZ60iD6QRi0AApEqP+n3f5k6Y8BaR28beVPNTY5ysvFdDslixy+
	 d5UKI5zGw2xkeIF5cln2gMRsYHgTNfgkoW6roediVkAPfUS7ebH6LNSDjCRk9bTOLy3p1
	 7vteBEYitBEJTq+15LzbkS6+4azMurrvP269HRijqmlVN9rOjP5OqgQv5APRQ9yBVbgsX
	 Snu7i46BJBES15Cu3eHhGXIYVBSQD381LOObDjfHAg0byIg2auMAIrNeWzzUj2Ig1JA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=fI5OaAuo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.16
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010016.outbound.protection.outlook.com [52.101.46.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67622606A31B;
	Wed,  4 Nov 2026 11:21:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67622606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=fI5OaAuo
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EJ9IXvMLn7IzZAjbRpawgpfmJRAWEogJFsi1k/cxN0iSLQsv87Ug/aJA7v/Cy5L2l6cFdOsyi9Tsta3haLw4iCySPka0oUsqp502m4COfIvQwtsrxvnYvYeF0LBN5cZdoV4tgEGjt8VoLqJntWIWNmu2yiveh7YOLsBKG+Vg326OEDxI7nwX1IwUvn6SuveTjcqu8lvwt3oXzstyR3D6zejW9L+zbPv27g8p13Hp1x8LyaqbuPnXjpXb6nSKoLYr3agoiEDMJpCoPsIxZApBg/m473lYztL8Ws2eLv4UG4xzJsbOk4EN0qT9/CohTu4wSJ9Va9jmQlZXQ7fkGIJkvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q0odZPIeD62Zoceg4JSS4/oJK0alNHJrQnic/jujHRc=;
 b=pK40UHEKYcS/mA2rP7MY9uh2xLRcm8Ha1zBTUBmwee5W0VWaQdhXItVwSlx8ig8pyaSgLPApoqn3rhgnxgmIsSgT0+7yGb3jo/IBGzBozz3JGqL+Np794NrLlCzWLTYcDSeo1Eq2uTp9VTWDQr+yI1tKy/tpv6LxI8xYW+5Vmy/EwDJJAfoPwrDWuqCRlSqkqCzyTsExdf7e50P7zL/i0I8wIVfNQk0wTr8VH1R0n1qsfl3gQXuEtifrnj8GWczSbDv+u7JuxBSbWHJFH3N20RVpULyh+H2YaXYZWSyUc7ZXsmo7YJA+BaMAmb3yQnAD03tRXRYkLCIBiSXTm7VDLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q0odZPIeD62Zoceg4JSS4/oJK0alNHJrQnic/jujHRc=;
 b=fI5OaAuoSH/5rKOPD6R5eJDSZAb6D1T+5ITWf0tYGA5hqFooaLN9ce5A70WwivbZ/rbjbn+09qNm0rPPqcC5c0hBQIKGlNENoPIUSP23LQEiOD4kRtb30m+T4WRUhs9Zd6VuVzvUMALc8Q1knGAAvAgk3MGBXHbdgwpIyAyjP+Y41kbaWmWERuGazRefM2TO1nFuStYbZSJsRujjMII/k7/PDJD/ZOMSU/6xRWNQ3v9vYsMXpUEF6RRkvw0BiSObsazhNBrJ0gGVXFT642fO7GbVJuccBHFSVYfIB4WTgcBgjeORUdARbLMLHzT1XaB0/2Z4bgZ9YRIecPXY0GVsrw==
Received: from SJ0PR13CA0167.namprd13.prod.outlook.com (2603:10b6:a03:2c7::22)
 by EAYPR12MB999155.namprd12.prod.outlook.com (2603:10b6:303:2be::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 11:21:21 +0000
Received: from BY1PEPF000264B5.namprd02.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::4c) by SJ0PR13CA0167.outlook.office365.com
 (2603:10b6:a03:2c7::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.8 via Frontend Transport; Wed, 4
 Nov 2026 11:21:21 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BY1PEPF000264B5.mail.protection.outlook.com (10.167.242.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 11:21:21 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 4 Nov
 2026 03:21:06 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 4 Nov
 2026 03:21:05 -0800
Received: from build-sheetal-noble-20261014.internal (10.127.8.14) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.56 via
 Frontend Transport; Wed, 4 Nov 2026 03:21:05 -0800
From: Sheetal <sheetal@nvidia.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Thierry
 Reding" <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
	Mohan Kumar <mkumard@nvidia.com>, Sameer Pujar <spujar@nvidia.com>,
	<linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Anupama
 Kunkulagunta" <akunkulagunt@nvidia.com>, Sheetal <sheetal@nvidia.com>
Subject: [PATCH 2/2] ASoC: tegra: AHUB: Add Tegra268 support
Date: Wed, 4 Nov 2026 11:20:55 +0000
Message-ID: <20261104112055.1101243-3-sheetal@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104112055.1101243-1-sheetal@nvidia.com>
References: <20261104112055.1101243-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF000264B5:EE_|EAYPR12MB999155:EE_
X-MS-Office365-Filtering-Correlation-Id: bf81af41-2c4a-40f1-b603-08df3a65c112
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|1800799024|82310400026|376014|7416014|261022105027099003|261022075727099003|261021121427099003|261026140227099003|261009223027099003|261028144727099003|261102123227099003|11063799006|10067099003|22082099003|56012099006|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	N1LBgsAn6VUSQ9XuqedC9NSa0kiNUJVx1JkgmbPxsCwOdMTGWUDlaTuTnZGbCHBNJ0Dkowk8jnMCA7ZWPbVJRL0pjad72nbfaFqhWBUvciwSsqY+/d9vaknO+aM6lFjfVUaeVARXblnNmtoDazEwxpQnIyceDzsdC5zkQkWSHIwfhAIn1nWmpp7+pMEfzrtwiiL0wuDIw1jguspGG0oKQAOyzn0dpcT4U9ns3xrdGo7WVOezT96IvOkGk7nenrLYuvdZhV0+aDq3+A2+6kWCt6yufKZbM2HO95emjiqKV9Dv2fyyfDEI5SZHSWZbRtfF4Ecvxz92VSs4wrkH1mNgdp0WiRGfwo2Gwycc/DKrcwR9yEmA+zoACXwYMTqmBOhfadVg01oEKM5gUpffJhADqwnzaHTvu0/67fgwG5EfRyhmC6fQbMjwVlvthwZ6JFXKENloIkpDSF3zSCyxGyuAfsArtXjdeJI8ajwych3BIin7qhh0twlkrtomf0PH1F87QmknFfDrFPXww60oiJ7PVMeraXgxLgE3cV7pu9XJ/pY7IqvviNtZJGeDS04B4JZSWES9l+GXS+KJx1Os2roAaNsrAj70jrWGqAR6MILlVt9Xx+1IOTeeLEXVISJ+wk99TBzb4oqh1mDpUqDbY3Hgz386O7/k3XLDUIiWUNq+of/aSu8+FjRQYIqo0nzv0san3akzFPO0MPcnCzEm+tF2tQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(82310400026)(376014)(7416014)(261022105027099003)(261022075727099003)(261021121427099003)(261026140227099003)(261009223027099003)(261028144727099003)(261102123227099003)(11063799006)(10067099003)(22082099003)(56012099006)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nSx/8R2UMOkZXe00DRu3KPVrKulp80GWa9B6ntysldLCpuJom4CqxuTo1UbFfI2ReSqMydGw3oltNs7Fe3zkP4nB7HdhquY2l9SXHY09sZW9L+jbAE5p9rv9ZiDwasDwSCsx4FsZUrych5F7AQ6+MamUWPQ7XaS5ESJxauYoV1jT6aPMh90yolKjdTuGkEo40V5vZI5tl9oLWe40yf4gVoHwFRg3oPGATezciMNIM/CKlAgxg+5E6aIMfXRsacoZIreAPdjnekpihNbljiP6+BqlnG3Fr04HX1JEsS38aYUY57Qfi7T8/GGMk85/e2vdW2fHdlPlEHD1rUALLbKuGulOV66I36Kbb/yg9Lyzfy8iAFBA95RHNS+88byUS8H6zu9p3T0WVw9p2EeME2CBtY1EngpPolgocSuyATj6dl5GC2mNSo5KqUZk7q1R/jnx
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 11:21:21.4916
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf81af41-2c4a-40f1-b603-08df3a65c112
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF000264B5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR12MB999155

From: Anupama Kunkulagunta <akunkulagunt@nvidia.com>

Tegra268 AHUB has five RX and five TX ADMAIF interfaces, five I2S
instances, two MVC instances, and one instance each of AMX, ADX,
MIXER and ASRC.

Add Tegra268 support with:
- DAI, DAPM widget and route tables for these audio interfaces.
- Mux controls and register masks covering only supported sources.
- Register access ranges, regmap configuration and SoC match data.

Signed-off-by: Anupama Kunkulagunta <akunkulagunt@nvidia.com>
Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 sound/soc/tegra/tegra210_ahub.c | 347 ++++++++++++++++++++++++++++++++
 sound/soc/tegra/tegra210_ahub.h |  27 +++
 2 files changed, 374 insertions(+)

diff --git a/sound/soc/tegra/tegra210_ahub.c b/sound/soc/tegra/tegra210_ahub.c
index efc8f3388668..d53fda3d85cd 100644
--- a/sound/soc/tegra/tegra210_ahub.c
+++ b/sound/soc/tegra/tegra210_ahub.c
@@ -466,6 +466,67 @@ static struct snd_soc_dai_driver tegra264_ahub_dais[] = {
 	DAI(OPE1 TX),
 };
 
+static struct snd_soc_dai_driver tegra268_ahub_dais[] = {
+	DAI(ADMAIF1),
+	DAI(ADMAIF2),
+	DAI(ADMAIF3),
+	DAI(ADMAIF4),
+	DAI(ADMAIF5),
+	/* XBAR <-> I2S <-> Codec */
+	DAI(I2S1),
+	DAI(I2S2),
+	DAI(I2S3),
+	DAI(I2S4),
+	DAI(I2S5),
+	/* MVC */
+	DAI(MVC1 RX),
+	DAI(MVC1 TX),
+	DAI(MVC2 RX),
+	DAI(MVC2 TX),
+	/* XBAR -> AMX(4:1) -> XBAR */
+	DAI(AMX1 RX1),
+	DAI(AMX1 RX2),
+	DAI(AMX1 RX3),
+	DAI(AMX1 RX4),
+	DAI(AMX1),
+	/* XBAR -> ADX(1:4) -> XBAR */
+	DAI(ADX1),
+	DAI(ADX1 TX1),
+	DAI(ADX1 TX2),
+	DAI(ADX1 TX3),
+	DAI(ADX1 TX4),
+	/* XBAR -> MIXER1(10:5) -> XBAR */
+	DAI(MIXER1 RX1),
+	DAI(MIXER1 RX2),
+	DAI(MIXER1 RX3),
+	DAI(MIXER1 RX4),
+	DAI(MIXER1 RX5),
+	DAI(MIXER1 RX6),
+	DAI(MIXER1 RX7),
+	DAI(MIXER1 RX8),
+	DAI(MIXER1 RX9),
+	DAI(MIXER1 RX10),
+	DAI(MIXER1 TX1),
+	DAI(MIXER1 TX2),
+	DAI(MIXER1 TX3),
+	DAI(MIXER1 TX4),
+	DAI(MIXER1 TX5),
+	/* XBAR -> ASRC -> XBAR */
+	DAI(ASRC1 RX1),
+	DAI(ASRC1 TX1),
+	DAI(ASRC1 RX2),
+	DAI(ASRC1 TX2),
+	DAI(ASRC1 RX3),
+	DAI(ASRC1 TX3),
+	DAI(ASRC1 RX4),
+	DAI(ASRC1 TX4),
+	DAI(ASRC1 RX5),
+	DAI(ASRC1 TX5),
+	DAI(ASRC1 RX6),
+	DAI(ASRC1 TX6),
+	DAI(ASRC1 RX7),
+};
+
 static const char * const tegra210_ahub_mux_texts[] = {
 	"None",
 	"ADMAIF1",
@@ -919,6 +980,77 @@ static const unsigned int tegra264_ahub_mux_values[] = {
 	MUX_VALUE(4, 22),
 };
 
+static const char * const tegra268_ahub_mux_texts[] = {
+	"None",
+	"ADMAIF1",
+	"ADMAIF2",
+	"ADMAIF3",
+	"ADMAIF4",
+	"ADMAIF5",
+	"I2S1",
+	"I2S2",
+	"I2S3",
+	"I2S4",
+	"I2S5",
+	"MIXER1 TX1",
+	"MIXER1 TX2",
+	"MIXER1 TX3",
+	"MIXER1 TX4",
+	"MIXER1 TX5",
+	"MVC1",
+	"MVC2",
+	"AMX1",
+	"ADX1 TX1",
+	"ADX1 TX2",
+	"ADX1 TX3",
+	"ADX1 TX4",
+	"ASRC1 TX1",
+	"ASRC1 TX2",
+	"ASRC1 TX3",
+	"ASRC1 TX4",
+	"ASRC1 TX5",
+	"ASRC1 TX6",
+};
+
+static const unsigned int tegra268_ahub_mux_values[] = {
+	0,
+	/* ADMAIF */
+	MUX_VALUE(0, 0),
+	MUX_VALUE(0, 1),
+	MUX_VALUE(0, 2),
+	MUX_VALUE(0, 3),
+	MUX_VALUE(0, 4),
+	/* I2S */
+	MUX_VALUE(0, 16),
+	MUX_VALUE(0, 17),
+	MUX_VALUE(0, 18),
+	MUX_VALUE(0, 19),
+	MUX_VALUE(0, 20),
+	/* MIXER */
+	MUX_VALUE(1, 0),
+	MUX_VALUE(1, 1),
+	MUX_VALUE(1, 2),
+	MUX_VALUE(1, 3),
+	MUX_VALUE(1, 4),
+	/* MVC */
+	MUX_VALUE(2, 8),
+	MUX_VALUE(2, 9),
+	/* AMX */
+	MUX_VALUE(1, 8),
+	/* ADX */
+	MUX_VALUE(2, 24),
+	MUX_VALUE(2, 25),
+	MUX_VALUE(2, 26),
+	MUX_VALUE(2, 27),
+	/* ASRC */
+	MUX_VALUE(3, 24),
+	MUX_VALUE(3, 25),
+	MUX_VALUE(3, 26),
+	MUX_VALUE(3, 27),
+	MUX_VALUE(3, 28),
+	MUX_VALUE(3, 29),
+};
+
 /* Controls for t210 */
 MUX_ENUM_CTRL_DECL(t210_admaif1_tx, 0x00);
 MUX_ENUM_CTRL_DECL(t210_admaif2_tx, 0x01);
@@ -1170,6 +1302,42 @@ MUX_ENUM_CTRL_DECL_264(t264_amx64_tx, 0x87);
 MUX_ENUM_CTRL_DECL_264(t264_adx5_tx, 0x88);
 MUX_ENUM_CTRL_DECL_264(t264_adx6_tx, 0x89);
 
+/* Controls for t268 */
+MUX_ENUM_CTRL_DECL_268(t268_admaif1_tx, 0x00);
+MUX_ENUM_CTRL_DECL_268(t268_admaif2_tx, 0x01);
+MUX_ENUM_CTRL_DECL_268(t268_admaif3_tx, 0x02);
+MUX_ENUM_CTRL_DECL_268(t268_admaif4_tx, 0x03);
+MUX_ENUM_CTRL_DECL_268(t268_admaif5_tx, 0x04);
+MUX_ENUM_CTRL_DECL_268(t268_i2s1_tx, 0x10);
+MUX_ENUM_CTRL_DECL_268(t268_i2s2_tx, 0x11);
+MUX_ENUM_CTRL_DECL_268(t268_i2s3_tx, 0x12);
+MUX_ENUM_CTRL_DECL_268(t268_i2s4_tx, 0x13);
+MUX_ENUM_CTRL_DECL_268(t268_i2s5_tx, 0x14);
+MUX_ENUM_CTRL_DECL_268(t268_mixer11_tx, 0x20);
+MUX_ENUM_CTRL_DECL_268(t268_mixer12_tx, 0x21);
+MUX_ENUM_CTRL_DECL_268(t268_mixer13_tx, 0x22);
+MUX_ENUM_CTRL_DECL_268(t268_mixer14_tx, 0x23);
+MUX_ENUM_CTRL_DECL_268(t268_mixer15_tx, 0x24);
+MUX_ENUM_CTRL_DECL_268(t268_mixer16_tx, 0x25);
+MUX_ENUM_CTRL_DECL_268(t268_mixer17_tx, 0x26);
+MUX_ENUM_CTRL_DECL_268(t268_mixer18_tx, 0x27);
+MUX_ENUM_CTRL_DECL_268(t268_mixer19_tx, 0x28);
+MUX_ENUM_CTRL_DECL_268(t268_mixer110_tx, 0x29);
+MUX_ENUM_CTRL_DECL_268(t268_mvc1_tx, 0x44);
+MUX_ENUM_CTRL_DECL_268(t268_mvc2_tx, 0x45);
+MUX_ENUM_CTRL_DECL_268(t268_amx11_tx, 0x48);
+MUX_ENUM_CTRL_DECL_268(t268_amx12_tx, 0x49);
+MUX_ENUM_CTRL_DECL_268(t268_amx13_tx, 0x4a);
+MUX_ENUM_CTRL_DECL_268(t268_amx14_tx, 0x4b);
+MUX_ENUM_CTRL_DECL_268(t268_adx1_tx, 0x58);
+MUX_ENUM_CTRL_DECL_268(t268_asrc11_tx, 0x64);
+MUX_ENUM_CTRL_DECL_268(t268_asrc12_tx, 0x65);
+MUX_ENUM_CTRL_DECL_268(t268_asrc13_tx, 0x66);
+MUX_ENUM_CTRL_DECL_268(t268_asrc14_tx, 0x67);
+MUX_ENUM_CTRL_DECL_268(t268_asrc15_tx, 0x68);
+MUX_ENUM_CTRL_DECL_268(t268_asrc16_tx, 0x69);
+MUX_ENUM_CTRL_DECL_268(t268_asrc17_tx, 0x6a);
+
 static const struct snd_soc_dapm_widget tegra210_ahub_widgets[] = {
 	WIDGETS("ADMAIF1", t210_admaif1_tx),
 	WIDGETS("ADMAIF2", t210_admaif2_tx),
@@ -1595,6 +1763,59 @@ static const struct snd_soc_dapm_widget tegra264_ahub_widgets[] = {
 	WIDGETS("OPE1", t264_ope1_tx),
 };
 
+static const struct snd_soc_dapm_widget tegra268_ahub_widgets[] = {
+	WIDGETS("ADMAIF1", t268_admaif1_tx),
+	WIDGETS("ADMAIF2", t268_admaif2_tx),
+	WIDGETS("ADMAIF3", t268_admaif3_tx),
+	WIDGETS("ADMAIF4", t268_admaif4_tx),
+	WIDGETS("ADMAIF5", t268_admaif5_tx),
+	WIDGETS("I2S1", t268_i2s1_tx),
+	WIDGETS("I2S2", t268_i2s2_tx),
+	WIDGETS("I2S3", t268_i2s3_tx),
+	WIDGETS("I2S4", t268_i2s4_tx),
+	WIDGETS("I2S5", t268_i2s5_tx),
+	WIDGETS("MVC1", t268_mvc1_tx),
+	WIDGETS("MVC2", t268_mvc2_tx),
+	WIDGETS("AMX1 RX1", t268_amx11_tx),
+	WIDGETS("AMX1 RX2", t268_amx12_tx),
+	WIDGETS("AMX1 RX3", t268_amx13_tx),
+	WIDGETS("AMX1 RX4", t268_amx14_tx),
+	TX_WIDGETS("AMX1"),
+	WIDGETS("ADX1", t268_adx1_tx),
+	TX_WIDGETS("ADX1 TX1"),
+	TX_WIDGETS("ADX1 TX2"),
+	TX_WIDGETS("ADX1 TX3"),
+	TX_WIDGETS("ADX1 TX4"),
+	WIDGETS("MIXER1 RX1", t268_mixer11_tx),
+	WIDGETS("MIXER1 RX2", t268_mixer12_tx),
+	WIDGETS("MIXER1 RX3", t268_mixer13_tx),
+	WIDGETS("MIXER1 RX4", t268_mixer14_tx),
+	WIDGETS("MIXER1 RX5", t268_mixer15_tx),
+	WIDGETS("MIXER1 RX6", t268_mixer16_tx),
+	WIDGETS("MIXER1 RX7", t268_mixer17_tx),
+	WIDGETS("MIXER1 RX8", t268_mixer18_tx),
+	WIDGETS("MIXER1 RX9", t268_mixer19_tx),
+	WIDGETS("MIXER1 RX10", t268_mixer110_tx),
+	TX_WIDGETS("MIXER1 TX1"),
+	TX_WIDGETS("MIXER1 TX2"),
+	TX_WIDGETS("MIXER1 TX3"),
+	TX_WIDGETS("MIXER1 TX4"),
+	TX_WIDGETS("MIXER1 TX5"),
+	WIDGETS("ASRC1 RX1", t268_asrc11_tx),
+	WIDGETS("ASRC1 RX2", t268_asrc12_tx),
+	WIDGETS("ASRC1 RX3", t268_asrc13_tx),
+	WIDGETS("ASRC1 RX4", t268_asrc14_tx),
+	WIDGETS("ASRC1 RX5", t268_asrc15_tx),
+	WIDGETS("ASRC1 RX6", t268_asrc16_tx),
+	WIDGETS("ASRC1 RX7", t268_asrc17_tx),
+	TX_WIDGETS("ASRC1 TX1"),
+	TX_WIDGETS("ASRC1 TX2"),
+	TX_WIDGETS("ASRC1 TX3"),
+	TX_WIDGETS("ASRC1 TX4"),
+	TX_WIDGETS("ASRC1 TX5"),
+	TX_WIDGETS("ASRC1 TX6"),
+};
+
 #define TEGRA_COMMON_MUX_ROUTES(name)					\
 	{ name " XBAR-TX",	 NULL,		name " Mux" },		\
 	{ name " Mux",		"ADMAIF1",	"ADMAIF1 XBAR-RX" },	\
@@ -1725,6 +1946,37 @@ static const struct snd_soc_dapm_widget tegra264_ahub_widgets[] = {
 	{ name " Mux",		"ASRC1 TX5",	"ASRC1 TX5 XBAR-RX" },	\
 	{ name " Mux",		"ASRC1 TX6",	"ASRC1 TX6 XBAR-RX" },
 
+#define TEGRA268_MUX_ROUTES(name)					\
+	{ name " XBAR-TX",	 NULL,		name " Mux" },		\
+	{ name " Mux",		"ADMAIF1",	"ADMAIF1 XBAR-RX" },	\
+	{ name " Mux",		"ADMAIF2",	"ADMAIF2 XBAR-RX" },	\
+	{ name " Mux",		"ADMAIF3",	"ADMAIF3 XBAR-RX" },	\
+	{ name " Mux",		"ADMAIF4",	"ADMAIF4 XBAR-RX" },	\
+	{ name " Mux",		"ADMAIF5",	"ADMAIF5 XBAR-RX" },	\
+	{ name " Mux",		"I2S1",		"I2S1 XBAR-RX" },	\
+	{ name " Mux",		"I2S2",		"I2S2 XBAR-RX" },	\
+	{ name " Mux",		"I2S3",		"I2S3 XBAR-RX" },	\
+	{ name " Mux",		"I2S4",		"I2S4 XBAR-RX" },	\
+	{ name " Mux",		"I2S5",		"I2S5 XBAR-RX" },	\
+	{ name " Mux",		"MVC1",		"MVC1 XBAR-RX" },	\
+	{ name " Mux",		"MVC2",		"MVC2 XBAR-RX" },	\
+	{ name " Mux",		"AMX1",		"AMX1 XBAR-RX" },	\
+	{ name " Mux",		"ADX1 TX1",	"ADX1 TX1 XBAR-RX" },	\
+	{ name " Mux",		"ADX1 TX2",	"ADX1 TX2 XBAR-RX" },	\
+	{ name " Mux",		"ADX1 TX3",	"ADX1 TX3 XBAR-RX" },	\
+	{ name " Mux",		"ADX1 TX4",	"ADX1 TX4 XBAR-RX" },	\
+	{ name " Mux",		"MIXER1 TX1",	"MIXER1 TX1 XBAR-RX" },	\
+	{ name " Mux",		"MIXER1 TX2",	"MIXER1 TX2 XBAR-RX" },	\
+	{ name " Mux",		"MIXER1 TX3",	"MIXER1 TX3 XBAR-RX" },	\
+	{ name " Mux",		"MIXER1 TX4",	"MIXER1 TX4 XBAR-RX" },	\
+	{ name " Mux",		"MIXER1 TX5",	"MIXER1 TX5 XBAR-RX" },	\
+	{ name " Mux",		"ASRC1 TX1",	"ASRC1 TX1 XBAR-RX" },	\
+	{ name " Mux",		"ASRC1 TX2",	"ASRC1 TX2 XBAR-RX" },	\
+	{ name " Mux",		"ASRC1 TX3",	"ASRC1 TX3 XBAR-RX" },	\
+	{ name " Mux",		"ASRC1 TX4",	"ASRC1 TX4 XBAR-RX" },	\
+	{ name " Mux",		"ASRC1 TX5",	"ASRC1 TX5 XBAR-RX" },	\
+	{ name " Mux",		"ASRC1 TX6",	"ASRC1 TX6 XBAR-RX" },
+
 #define TEGRA210_MUX_ROUTES(name)					\
 	TEGRA_COMMON_MUX_ROUTES(name)					\
 	TEGRA210_ONLY_MUX_ROUTES(name)
@@ -2025,6 +2277,48 @@ static const struct snd_soc_dapm_route tegra264_ahub_routes[] = {
 	TEGRA264_MUX_ROUTES("OPE1")
 };
 
+static const struct snd_soc_dapm_route tegra268_ahub_routes[] = {
+	TEGRA_FE_ROUTES("ADMAIF1")
+	TEGRA_FE_ROUTES("ADMAIF2")
+	TEGRA_FE_ROUTES("ADMAIF3")
+	TEGRA_FE_ROUTES("ADMAIF4")
+	TEGRA_FE_ROUTES("ADMAIF5")
+	TEGRA268_MUX_ROUTES("ADMAIF1")
+	TEGRA268_MUX_ROUTES("ADMAIF2")
+	TEGRA268_MUX_ROUTES("ADMAIF3")
+	TEGRA268_MUX_ROUTES("ADMAIF4")
+	TEGRA268_MUX_ROUTES("ADMAIF5")
+	TEGRA268_MUX_ROUTES("I2S1")
+	TEGRA268_MUX_ROUTES("I2S2")
+	TEGRA268_MUX_ROUTES("I2S3")
+	TEGRA268_MUX_ROUTES("I2S4")
+	TEGRA268_MUX_ROUTES("I2S5")
+	TEGRA268_MUX_ROUTES("MVC1")
+	TEGRA268_MUX_ROUTES("MVC2")
+	TEGRA268_MUX_ROUTES("AMX1 RX1")
+	TEGRA268_MUX_ROUTES("AMX1 RX2")
+	TEGRA268_MUX_ROUTES("AMX1 RX3")
+	TEGRA268_MUX_ROUTES("AMX1 RX4")
+	TEGRA268_MUX_ROUTES("ADX1")
+	TEGRA268_MUX_ROUTES("MIXER1 RX1")
+	TEGRA268_MUX_ROUTES("MIXER1 RX2")
+	TEGRA268_MUX_ROUTES("MIXER1 RX3")
+	TEGRA268_MUX_ROUTES("MIXER1 RX4")
+	TEGRA268_MUX_ROUTES("MIXER1 RX5")
+	TEGRA268_MUX_ROUTES("MIXER1 RX6")
+	TEGRA268_MUX_ROUTES("MIXER1 RX7")
+	TEGRA268_MUX_ROUTES("MIXER1 RX8")
+	TEGRA268_MUX_ROUTES("MIXER1 RX9")
+	TEGRA268_MUX_ROUTES("MIXER1 RX10")
+	TEGRA268_MUX_ROUTES("ASRC1 RX1")
+	TEGRA268_MUX_ROUTES("ASRC1 RX2")
+	TEGRA268_MUX_ROUTES("ASRC1 RX3")
+	TEGRA268_MUX_ROUTES("ASRC1 RX4")
+	TEGRA268_MUX_ROUTES("ASRC1 RX5")
+	TEGRA268_MUX_ROUTES("ASRC1 RX6")
+	TEGRA268_MUX_ROUTES("ASRC1 RX7")
+};
+
 static const struct snd_soc_component_driver tegra210_ahub_component = {
 	.dapm_widgets		= tegra210_ahub_widgets,
 	.num_dapm_widgets	= ARRAY_SIZE(tegra210_ahub_widgets),
@@ -2053,6 +2347,13 @@ static const struct snd_soc_component_driver tegra264_ahub_component = {
 	.num_dapm_routes	= ARRAY_SIZE(tegra264_ahub_routes),
 };
 
+static const struct snd_soc_component_driver tegra268_ahub_component = {
+	.dapm_widgets		= tegra268_ahub_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(tegra268_ahub_widgets),
+	.dapm_routes		= tegra268_ahub_routes,
+	.num_dapm_routes	= ARRAY_SIZE(tegra268_ahub_routes),
+};
+
 static bool tegra210_ahub_wr_reg(struct device *dev, unsigned int reg)
 {
 	int part;
@@ -2131,6 +2432,28 @@ static bool tegra264_ahub_wr_reg(struct device *dev, unsigned int reg)
 	return false;
 }
 
+static bool tegra268_ahub_wr_reg(struct device *dev, unsigned int reg)
+{
+	int part;
+
+	for (part = 0; part < TEGRA268_XBAR_UPDATE_MAX_REG; part++) {
+		switch (reg & ~(part << 12)) {
+		case TEGRA264_AXBAR_ADMAIF_RX1 ... TEGRA268_AXBAR_ADMAIF_RX5:
+		case TEGRA268_AXBAR_I2S1_RX1 ... TEGRA268_AXBAR_I2S5_RX1:
+		case TEGRA264_AXBAR_MIXER1_RX1 ... TEGRA264_AXBAR_MIXER1_RX10:
+		case TEGRA264_AXBAR_MVC1_RX1 ... TEGRA264_AXBAR_MVC2_RX1:
+		case TEGRA264_AXBAR_AMX1_RX1 ... TEGRA268_AXBAR_AMX1_RX4:
+		case TEGRA264_AXBAR_ADX1_RX1:
+		case TEGRA268_AXBAR_ASRC1_RX1 ... TEGRA264_AXBAR_ASRC1_RX7:
+			return true;
+		default:
+			break;
+		};
+	}
+
+	return false;
+}
+
 static const struct regmap_config tegra210_ahub_regmap_config = {
 	.reg_bits		= 32,
 	.val_bits		= 32,
@@ -2161,6 +2484,16 @@ static const struct regmap_config tegra264_ahub_regmap_config = {
 	.cache_type		= REGCACHE_FLAT,
 };
 
+static const struct regmap_config tegra268_ahub_regmap_config = {
+	.reg_bits		= 32,
+	.val_bits		= 32,
+	.reg_stride		= 4,
+	.writeable_reg		= tegra268_ahub_wr_reg,
+	.max_register		= TEGRA268_MAX_REGISTER_ADDR,
+	.reg_default_cb		= regmap_default_zero_cb,
+	.cache_type		= REGCACHE_FLAT,
+};
+
 static const struct tegra_ahub_soc_data soc_data_tegra210 = {
 	.cmpnt_drv	= &tegra210_ahub_component,
 	.dai_drv	= tegra210_ahub_dais,
@@ -2214,11 +2547,25 @@ static const struct tegra_ahub_soc_data soc_data_tegra264 = {
 	.xbar_part_size	= TEGRA264_XBAR_PART1_RX,
 };
 
+static const struct tegra_ahub_soc_data soc_data_tegra268 = {
+	.cmpnt_drv	= &tegra268_ahub_component,
+	.dai_drv	= tegra268_ahub_dais,
+	.num_dais	= ARRAY_SIZE(tegra268_ahub_dais),
+	.regmap_config	= &tegra268_ahub_regmap_config,
+	.mask[0]	= TEGRA268_XBAR_REG_MASK_0,
+	.mask[1]	= TEGRA268_XBAR_REG_MASK_1,
+	.mask[2]	= TEGRA268_XBAR_REG_MASK_2,
+	.mask[3]	= TEGRA268_XBAR_REG_MASK_3,
+	.reg_count	= TEGRA268_XBAR_UPDATE_MAX_REG,
+	.xbar_part_size	= TEGRA264_XBAR_PART1_RX,
+};
+
 static const struct of_device_id tegra_ahub_of_match[] = {
 	{ .compatible = "nvidia,tegra210-ahub", .data = &soc_data_tegra210 },
 	{ .compatible = "nvidia,tegra186-ahub", .data = &soc_data_tegra186 },
 	{ .compatible = "nvidia,tegra234-ahub", .data = &soc_data_tegra234 },
 	{ .compatible = "nvidia,tegra264-ahub", .data = &soc_data_tegra264 },
+	{ .compatible = "nvidia,tegra268-ahub", .data = &soc_data_tegra268 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, tegra_ahub_of_match);
diff --git a/sound/soc/tegra/tegra210_ahub.h b/sound/soc/tegra/tegra210_ahub.h
index acbe640dd3b5..b69d494e463e 100644
--- a/sound/soc/tegra/tegra210_ahub.h
+++ b/sound/soc/tegra/tegra210_ahub.h
@@ -57,8 +57,26 @@
 #define TEGRA264_AXBAR_ADMAIF_RX21			0x1d0
 #define TEGRA264_AXBAR_ADX6_RX1				0x224
 
+/* Tegra268 specific */
+#define TEGRA268_XBAR_REG_MASK_0			0x1f001f
+#define TEGRA268_XBAR_REG_MASK_1			0x11f
+#define TEGRA268_XBAR_REG_MASK_2			0xf000300
+#define TEGRA268_XBAR_REG_MASK_3			0x3f000000
+#define TEGRA268_XBAR_UPDATE_MAX_REG			4
+
+#define TEGRA268_AXBAR_ADMAIF_RX5			0x10
+#define TEGRA268_AXBAR_I2S1_RX1				0x40
+#define TEGRA268_AXBAR_I2S5_RX1				0x50
+#define TEGRA268_AXBAR_AMX1_RX4				0x12c
+#define TEGRA268_AXBAR_ASRC1_RX1			0x190
+#define TEGRA268_AXBAR_ASRC1_RX7			0x1a8
+#define TEGRA268_XBAR_AUDIO_RX_COUNT			((TEGRA268_AXBAR_ASRC1_RX7 / 4) + 1)
+
 #define TEGRA_XBAR_UPDATE_MAX_REG (TEGRA264_XBAR_UPDATE_MAX_REG)
 
+#define TEGRA268_MAX_REGISTER_ADDR (TEGRA264_XBAR_PART3_RX +		\
+	(TEGRA210_XBAR_RX_STRIDE * (TEGRA268_XBAR_AUDIO_RX_COUNT - 1)))
+
 #define TEGRA264_MAX_REGISTER_ADDR (TEGRA264_XBAR_PART4_RX +		\
 	(TEGRA210_XBAR_RX_STRIDE * (TEGRA264_XBAR_AUDIO_RX_COUNT - 1)))
 
@@ -147,6 +165,15 @@
 				  tegra_ahub_get_value_enum,		\
 				  tegra_ahub_put_value_enum)
 
+#define MUX_ENUM_CTRL_DECL_268(ename, id)				\
+	SOC_VALUE_ENUM_WIDE_DECL(ename##_enum, MUX_REG(id), 0,		\
+				 tegra268_ahub_mux_texts,		\
+				 tegra268_ahub_mux_values);		\
+	static const struct snd_kcontrol_new ename##_control =		\
+		SOC_DAPM_ENUM_EXT("Route", ename##_enum,		\
+				  tegra_ahub_get_value_enum,		\
+				  tegra_ahub_put_value_enum)
+
 #define WIDGETS(sname, ename)						     \
 	SND_SOC_DAPM_AIF_IN(sname " XBAR-RX", NULL, 0, SND_SOC_NOPM, 0, 0),  \
 	SND_SOC_DAPM_AIF_OUT(sname " XBAR-TX", NULL, 0, SND_SOC_NOPM, 0, 0), \
-- 
2.43.0

