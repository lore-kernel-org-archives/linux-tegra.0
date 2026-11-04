Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793791290;
	b=1iqXvJCNxdD/HA5eTCBsLQFui5WxtXB1VmarQZWVIva8MtMFd+EYM8uCZ59tXHdTiQCT
	 WxSCMc0wb8f32aYsN3sehLu0ao8mwwVORXEfJI7LgAuBnzj2DlHyBLAmSr9E5lbwJ4tG/
	 o+E1ARqfCdstAfPAHLbivBNDq1C/0ke8SqE+J2C4hWvnPOts+CXj2D9nrmouqoLFWW4G0
	 zFyKQqs6+pY534G4S5mYb3W59a3KaD0gM2AA4qIbkVNOOHHjXzVp8Ax/X7e0yCik33GI6
	 GsdxTPlMAvKfjbajk3EQseZavzjfzphBfSAlSlt2WZ5vD3Y4CfjThGIKgjHDIQ4cIAg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793791290;
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
	bh=9YCPAdmyB3LlZHEuzWS+4ekSJBZAD4uNs5PD2oJ8+r4=;
	b=qK1L3o1qtqaHvJKFcuPZaETAk8AUSgJuLUAOec50MTFFXeL6Zz3JGGKRabrfQOVwXVSf
	 0MkPk4P5kH+4HDRTQzvnKwsLTsnoTr8ae2s2yRYmryHZqTE7oOYG9Rhw6ZzIWej6UUwgi
	 vKd8BRKizIyLDlfCvuoaDicb5QBGJGr4gUskpLf/D/WYq02P9z+vUS+yRqgJRwqjAfcQB
	 Li4MA8aCozbzngNtTY8m3lvuMYho3SzEV+eKPgV5PamjRVXglQVRkDUhKWkKWBp5jReo2
	 4uWqD4V+DXCRioKHqqPsX3LDlO2lR8tIKcvenX+0+fYLglsZu6UKMMaIKwZs0LRXydQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=SGiBWqTs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.14
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012014.outbound.protection.outlook.com [40.93.195.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F9D606A326;
	Wed,  4 Nov 2026 11:21:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25F9D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=SGiBWqTs
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o2PnCbD+7u5JZMREIq3xHpq00Kjd1kbQEKXtwFIxAt08IDux2XzGHGgYzj6w2uL/HtnrBNnWUzZ5Hr4AziVYF66YVT48Dv+i9KBuN67sooXazLR+MEcb8yen77WbEUR/dwdC+D0ym11fs0YkaTw+bmA08vSEnHl4/KSdMhSoPVoDnIhTD8kfgHwPuxBXXP4E59+GRV8utmvskE38GCkXNm4JiiSp9+tlgWNtTmJ0uf9EoswvmHmvVlCd34OMwnhvmoaRVbY1Lm0xijVX0jfGQSHZ12o9KyR3W0fbBw27yj0SrpeIolT/sVBGr+3wDI41okEJso4BEWgqb5mICMh7Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9YCPAdmyB3LlZHEuzWS+4ekSJBZAD4uNs5PD2oJ8+r4=;
 b=U2CwUxHdcGlLapAypMz2iGieBMajNcQi+Q1VrIkxH+GeKkLeSJYMjuj0oyHGRUlRj+Jd3tbi8j6eJ8zJTi+2iCz9PJ6p1ByCUGvbfRSfpNJXVmTOz3el7BWIOaH5yjhVIrU+YO4uhO55mtOk5M1FkmUdx8XUCTuP6SOK0Xo37EHT+4hnVeu+SEGzR9VIXrMH/4jtPCtgNpqFa1yu0Z1eDlNfvO48rn3hQeKnjcjsaAa2RKemgJyRrSmPf/x2vvyVY0XVWJY6l6RBt7KFpusn89NIM7s6cJ6LXJsRjsMzgzVKM49acKzaYV+1l2aRTp9BT3DPsStHEba0yaoOZ1qgvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9YCPAdmyB3LlZHEuzWS+4ekSJBZAD4uNs5PD2oJ8+r4=;
 b=SGiBWqTsQdi4A9WvV4Ss1NOxdOxuL3zavecve3pP+JnzulCtqyNoEMSs8xAfwMhSDU8UrAFznqIYyUicfHZ1YP4HcOABMhlW9qgBZkD6WFb3ceu1GqE7Td2+LQmj3Vw9Zk+saT0QOUEFBMN0dQz74jS4IYkt8niU9uPfC1ccUBDtGFbzDNvE+U0V7q+GMdBkuCkxqigRm7n61qww8O2w512/zMVqfJ/NthHqNr69T1J3I4Pfthg/ygRyegap3ISrwwTpbC85CTbK1hZ0/N6cE84qHMMPZbBn+BYnD7vgXUyx9IuKuS7AUgwJ5nJ7epxmADs8k3Aai+Qh3ACoO3Hkxg==
Received: from CH2PR12CA0012.namprd12.prod.outlook.com (2603:10b6:610:57::22)
 by FT1PR12MB917062.namprd12.prod.outlook.com (2603:10b6:170:2b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Wed, 4 Nov
 2026 11:21:24 +0000
Received: from DS2PEPF00006E26.namprd05.prod.outlook.com
 (2603:10b6:610:57:cafe::9) by CH2PR12CA0012.outlook.office365.com
 (2603:10b6:610:57::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Wed, 4
 Nov 2026 11:21:23 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00006E26.mail.protection.outlook.com (10.167.23.219) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 11:21:23 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 4 Nov
 2026 03:21:05 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 4 Nov
 2026 03:21:04 -0800
Received: from build-sheetal-noble-20261014.internal (10.127.8.14) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.56 via
 Frontend Transport; Wed, 4 Nov 2026 03:21:03 -0800
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
Subject: [PATCH 1/2] dt-bindings: sound: Add Tegra268 AHUB support
Date: Wed, 4 Nov 2026 11:20:54 +0000
Message-ID: <20261104112055.1101243-2-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00006E26:EE_|FT1PR12MB917062:EE_
X-MS-Office365-Filtering-Correlation-Id: 80c4cddf-8871-462f-d004-08df3a65c26a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|82310400026|36860700016|11063799006|56012099006|261021121427099003|261009223027099003|261102123227099003|261022105027099003|261026121527099003|261028144727099003|261026140227099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	7NLr30WOgIJxzVBMB5HL/UcQwz+mLgP5Ugq/POQyNpZn4FstQQDOGPAkAWyiHfB9Omn6zrlItwOcPsIUJBBBx4AREBHZLye0IeMs5RDIx2dfFr7wjGasVNI29llUq2ODhoCUwnz/3D8xVdIw4RiwW28HBET+yp3EkhrS6HQVLM5BXwqWPfXvfj14r1OiUfYTt5pVCj//E/ntA0qhCFDofU8poMLZUoDGSX2hEX+0q/u8xci1Wkb5PUIh2Ebr0h+W8M/J5MAoxs+u6DPChjhRGYn5p/RZxkdqvJqmFi46piC/w/nB40pABdQmz4AmeHDTYum6RfBl78miFbyfd7IovySZ98l+z+rqty65xRqrI3EqjuSC//nihyjeN7kZ0EKmvTvC5Db381e5d3FqG67TWDeObNFk8C4XSpwWvyWqn0yBLUUmvY9Wvv4chyETx3ZXNpWE2OE5NtfwyCcc1DCc6ACZ1KAeL1zjOBQEfYmx6MT31eQWZJpVl20iiToXh5IjXpEVbnlVIp9TE+YdH4jWcXbonW5C1eER8Ax+fU64Xlw0MA9JgTK9ahpCm5g77fw1gWbM2ptI0Hbi5+0jj5gKE5a8bcLiYRbt9ed7HsxisOkkISfDksF4iXtljT86P9T1L6JYd8viO3l7VWLjmugaZhxXwL19SDvtIETdWt2SZCNQqHeOmOs48ap2fy7qlZHC/CIRZla6XdjzD9XfAX+vxA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(82310400026)(36860700016)(11063799006)(56012099006)(261021121427099003)(261009223027099003)(261102123227099003)(261022105027099003)(261026121527099003)(261028144727099003)(261026140227099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3MFybTVLpksvFG4+DjPEC0S41NuzAlOVCrti1mARMInLYuIh/6AmzIJyPUDOSc6iHZ09iFnDxBC0xcll0WcV8fKfhKsdesygfvWy0+fo3VBwEr4Zk1ahRFykc6U2NRQoVUSVx3Pyk6pOOpDc3cLCylivg7ZSwFLYsYkw3t61tDf1e1n3nMhLyrfz5Oy+sCZbDU5SLWtwXJLZvfFTDMdPejhbaK+Oto3nFVsDtMTN2/+nurfdnkeDSiRDL63L587mCDvK7HT0dQx58b0/TCRwugVyos0JGHAZ3Nhtkm4Zc8F0zzo80/rvP0EuUmSWi1geA+7Noizstyqv4SkQc1GihNjmmYxwe7Tw6YyIoL+VW3RyKMf/VAgjuzEfhx2PllUGa1nlENhTcmhbMMgUZOTeAD7K+H1rvEf/lPKQS51ENNIdY6EUmermJXvvm5zhWWQ2
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 11:21:23.6490
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80c4cddf-8871-462f-d004-08df3a65c26a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00006E26.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FT1PR12MB917062

From: Anupama Kunkulagunta <akunkulagunt@nvidia.com>

Tegra268 AHUB supports five RX and five TX ADMAIF interfaces, five
I2S instances, two MVC instances, and one instance each of AMX, ADX,
MIXER and ASRC.

Add the Tegra268 AHUB compatible string to the binding.

Signed-off-by: Anupama Kunkulagunta <akunkulagunt@nvidia.com>
Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 .../devicetree/bindings/sound/nvidia,tegra210-ahub.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
index 1c9f24d26819..20e637d2a027 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
@@ -28,6 +28,7 @@ properties:
           - nvidia,tegra186-ahub
           - nvidia,tegra234-ahub
           - nvidia,tegra264-ahub
+          - nvidia,tegra268-ahub
       - items:
           - const: nvidia,tegra194-ahub
           - const: nvidia,tegra186-ahub
-- 
2.43.0

