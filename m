Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012049.outbound.protection.outlook.com [40.107.209.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501A3385505;
	Mon,  2 Mar 2026 08:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772441682; cv=fail; b=Ry7jK0Y3M9awRethUVW5MmmR0dNGi95yXeHn8LQiEFk0qQORrmjwkEM2A1pyj4F9i2JddqXLgut7l5ttUfKFVPxdQ5/EFIHOTslGJXy6E+OngRC9wlpmttQRFrh3jtZxcKpQfTarWYcLU+6vZAiPBucoUSHNLLfBOvq4z8Wnyps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772441682; c=relaxed/simple;
	bh=9FzDE5g+wsnJUC5ouOwcC3JAvP2M+A2a7x+RzI/AuxI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Twab3/g3rJurWVk2RJs06F1vjqqRB3lCav91tuUcDKMPoXjQrbLIwwQH8A7WyRyDsdV0AsG+YBuC249qEtnpcRHvJq7b1VqjSj3JGGwov/qFJibavwoJcNA6SBoDmk4+TZIiLEpkP+gOkAixtv0MWvG3nU8P6LLSXJRCDI24Uy0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=spnVadMb; arc=fail smtp.client-ip=40.107.209.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="spnVadMb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V/7UPRBQd0l+sT1sifp7U2vFr5UvZVcW+ADMk24ZFnX7LdGnwOk4N3OIRi1B/z/8VBb/2p1un3IWs1aX9BN9tifTavvRr508H4IQgqO9OosV464F2FboOONiGNv6hFp+7Qm/mWv0YrA54piH+3rvscmCuzMMvjQ47oZ0DTeHKsR8I/w2CulODfAH00K1cM/Eu64R6NPa93v+WfUOHq6StbaKFgl28L/RYFDPJKgAvdMlXMCJZpE4v8UEkSU2ciCSCyI39Jzf8ywdRE4A3dtfEmdTb3VGA3nj54jEMEZx7XPSJMMIFS2MBZVMAP7vs3Ji7z+W5o5BVkQiWVFfdRXcVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SYxnkEaBQ7sM+FD5xVhlbxtpuxYW93nPp5BR9ao1A3E=;
 b=C+FYtFaAmZnqSicj60D4U3dtat7EqBzwguxfBRh6qHsIR/l/FO2ZVnqPAukFQLeTlWwEaHaqsguMrNIhs97V/MZyC+F87BO1aIySF4O06wdGn5R89tQgD0bMd5vlEGSlumxLjQJaatrTf5O9wOLMK+e1gl1V0MFhVcUJ4y9mUEnpFKnIMlB95rFxfNbY+4/DcXRBgtft4tmA5iZ6BbFBwa3e0084j0OejVfiMb0U0pM5cEkw9tp2Xr2KhdveuHirkZSVaU8s/gH8moIk65LPYgEUPandaGJTLlqk72a9gLMlZe9pKrVvFvQlQ385hbUkpn4IvvETYw+lxxBC3y/opg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SYxnkEaBQ7sM+FD5xVhlbxtpuxYW93nPp5BR9ao1A3E=;
 b=spnVadMbTtRNE/P+OLmDuMcbUvMSfACwrJ9poXRUDDUZEPFoM51YhceYvVAShowIBYp3WkHZ08kkijTaAaWjeXW5+N41q4O7lWJvPIkY59Ola9q5jQ2YIqaIgPdTiY12tpTj/Gx1EhPmFkXFSJZZFkSZ2C3JeEcEZx0By64YaT7IdL5KOI5JNtP+Df17x7cmPDBGJbKcgnwN6h2HN7s6BIoC4AeFmCWGTmaasvaXrXmtfFUkAN0Vh9KwRWpLCBJs9q0Urx3VT6rXOF+mnJLIIqmkc+z2UnhkefL1cNA7/TZ/7ztdvhEWYScg5VjEo+bU6lR+bn+h1tNmsChTIrK+GA==
Received: from CH2PR02CA0020.namprd02.prod.outlook.com (2603:10b6:610:4e::30)
 by MW4PR12MB7437.namprd12.prod.outlook.com (2603:10b6:303:21a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Mon, 2 Mar
 2026 08:54:37 +0000
Received: from CH2PEPF0000009A.namprd02.prod.outlook.com
 (2603:10b6:610:4e:cafe::18) by CH2PR02CA0020.outlook.office365.com
 (2603:10b6:610:4e::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.19 via Frontend Transport; Mon,
 2 Mar 2026 08:54:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH2PEPF0000009A.mail.protection.outlook.com (10.167.244.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 08:54:37 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 00:54:16 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 00:54:15 -0800
Received: from sheetal.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Mar 2026 00:54:11 -0800
From: "Sheetal ." <sheetal@nvidia.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>
CC: Jonathan Hunter <jonathanh@nvidia.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Sameer Pujar <spujar@nvidia.com>, Mohan kumar
	<mkumard@nvidia.com>, <linux-sound@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Sheetal <sheetal@nvidia.com>
Subject: [PATCH 1/2] ASoC: dt-bindings: tegra: Add compatible for Tegra238 sound card
Date: Mon, 2 Mar 2026 14:23:22 +0530
Message-ID: <20260302085323.3139571-2-sheetal@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260302085323.3139571-1-sheetal@nvidia.com>
References: <20260302085323.3139571-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009A:EE_|MW4PR12MB7437:EE_
X-MS-Office365-Filtering-Correlation-Id: fe869255-6b3d-4d0a-267c-08de7839554d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	IeXJQ5u3yDx0X4NYTMhUQ+XjWS5REBYeMrUze9pIqqGTW7ARRtg6KJdECGjX7rqii/jTKlEax4/2KdBffbaXhCSBv3Rz0lg1Kjrphkj9yvOdRW2YfLqIquBwe+7QsVPg89kn9Cm5mJsqUn+z3yAk9VXRGXPH0qVsZt3QDWW4+oRQD31fZnu5sCEmEQe9W6+kB2RYg5RqQWyDumWzu685TscoFhE7LL9Rs6TBe34ngrzTQ14IijcVftWj+tCu8o9FGtXsOKKX/ijqbImvtP23fKjO4mREN6ybl31Wpf9eUOqBnmVAAg2rea0zVqjsv2xE/msfs1U3OKBELTWl0hBxU98YtWNpN4xWa9NeeU6hPIB19sq6v6NKmIPe0KMyaVRG0n6NeIE37aCvKqfVltVui8WNl1RqRljrVMCRjTV0tCCp32oO3Fjxih1Iao9X1PWXMpICSC6xSF+EksReLBuY5rBRlzMqE1N4NYqz/TFDGPMateHqqFujl1SQ9ZMt2lH0+/rXrVQsqMUkBzwr/RLaCUU5TyDTihZs5LkreLzfuQlbK42LKQgMh4brP9p+Q+TVaPJnLr4DBLKTtZwjLIel2xOeuqe6tx8OGt6PuVZ381SywGMbUozFZRSDqQzagY0Emy16+R1xV4avTwPKOa8GGZXwBt3Y3y7avSLzFZ3FkAEp01xf8/ri3QHsev+9nxqnu0/ZqKhTW53+bV3xtFTs2CNQTGdbRQU7a65VpiLP+KWl7RB6gsZj8LUkNOBL1fo8A9fe0aTAToaZqjEaxvW90I2BqTUD3sb8AegCmuUs0VHPOyBCpFEDCKJ0WTx0YFWFit3b1MW/JGsVvH4zWTQySA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DkzAJR0zqEeNdb7hrOoegmGA0lAi8p+MWub+eU6FMvgZNiVapW6qgnTASJg7grEErlBZ4EZr/mp0c9/98y5jhpIE+4gwfXkMWu0abHOw3oLS732MmqIX/3ANVHsL3L4peEKD5/76rkb9hS/eHxU0ZOXVn/q7fvVyMrYQt6x0HrnS0gVaa+d3Da2PxzXi2GeEeEx1CJ/zp8tRRViQWdITg69BTRT3bhPkoYW+X3C0DtkzOZ5Yg1FP3Wwil5lGr57z5sIVKifrcvPTeAUaCE08/ApSSwpQnZOqR9i8JUKRpTluTkvF3r4Pg4GbzbPPAl9QsWSFBr7I1nCVv3uPgTZ/fwprhHX90IcKpp68R9Mcm3xKc+2PQjHsRuRnLDVpxRzRC7KSQHgW+SYuvBGJjWHpTKRaUbyqptKUcfy0U0ZrhkC1x/tPxkE/3jH1PBtb0mjc
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 08:54:37.1198
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe869255-6b3d-4d0a-267c-08de7839554d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7437

From: Sheetal <sheetal@nvidia.com>

Tegra238 requires different PLLA and PLLA_OUT0 clock rates compared to
other Tegra platforms. Add Tegra238 compatible string to the APE
tegra-audio-graph-card bindings.

Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 .../devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml
index da89523ccf5f..92bc3ef56f2c 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml
@@ -23,6 +23,7 @@ properties:
     enum:
       - nvidia,tegra210-audio-graph-card
       - nvidia,tegra186-audio-graph-card
+      - nvidia,tegra238-audio-graph-card
       - nvidia,tegra264-audio-graph-card
 
   clocks:
-- 
2.34.1

