Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013018.outbound.protection.outlook.com [40.107.201.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EC1369204;
	Tue,  3 Mar 2026 10:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772532229; cv=fail; b=gz56YAjgDGO87Qj7CCb22GE6zfwBf//HLPiHHYCT30Eu4nwEAcgWXgFWXAcmFrpQW6awVcbKMIrWO0Ga4ivf84sCxhnrBKDicBr0DbQ4eWxdQrXPi3p65OMhVQ/E3cQC9KTPScT0x9jQDV5MihoxahY7aUHOAQdjbewCjI3g1KE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772532229; c=relaxed/simple;
	bh=9FzDE5g+wsnJUC5ouOwcC3JAvP2M+A2a7x+RzI/AuxI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eAhIzpGRQhmzx7fMqDRzAfNQsHC6ejVt3IW86wLoj6pHCFJzmk7zYi8N1sIDEuJsRN0/tHNokoFmmUwE4phkjob7BivHDcXDjER09Qdz/dn9dXywFgXWPwmKIGAcxDn6JC4KpBnUh9EIAWcy927jYWkq5BlncfPEeFr3ht3eqZ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CmEqIr9f; arc=fail smtp.client-ip=40.107.201.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CmEqIr9f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qeQyjWeBgfr3nCOSDUVrpnVvkIfF3pinPdPn/HeJaxKBMoDmNS7a0WLsjGl/X1WMX9xIgVHJHwoBLXqmbvwHxiZU3VVzGmPEld9lx9s4JCao6huWBN2hx1cecwREeLz7QgJde90GSxrDArsKeF3G6+UF10QN0MR7U1w38w446IIsD4fwBLsXgsMvCrcHnE5eyO+akzchtIt2v1iCwdapBWWLUaEdT9bXPO6UOWwvU9HbHrTgXo2cwfneyJmA/Xb2GCfXybDGwxbuEA3qgUtRy9SCm/S378XBfxc+8gaYQqGquVUQm7/z83NU1Me2xScUN/KCC3l8NUeNtM8YNf3Y/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SYxnkEaBQ7sM+FD5xVhlbxtpuxYW93nPp5BR9ao1A3E=;
 b=Kd0Z5wsqR0g0AOFH5MhtAzF/dYkBdAoV61CUzuPlVK7BknPyX3I/tHFbzk2VtY1pPJA1n0CgFXEU//6LYuLY1+uIQZEO1e1tH0J8ihm9gv+MTFZaTB5HL3HU4iRp774Ln+VHdymj64VrF0QnkhlLaJOs7j6urtAFB5MTFlNSfW7gEMKjijYm8eXivpGGj064ul6u3EqWmzc5dvxrgjgvVvNVIovaPYSnjzkHilxjCcko+gdiguJI6P3IuVXVPewmjs+hmja6gnamOCcaoKCY4ng2CIJv9OJSjpJqIBfhOtlU0mZYj1Tv2+l+CdOghNcYIc8cu8Wy4uR7C5vW9HC1fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SYxnkEaBQ7sM+FD5xVhlbxtpuxYW93nPp5BR9ao1A3E=;
 b=CmEqIr9fANgCiWNfepj4VpSZ4dT7sxJaLJ2LcsdDLFGbKVkilKc9nlofrHtVdmW76Bn3Zsd9X4hYRm8Yd+q4IZaqEYoPAh/YJMfDFb81ZFCHnjj1XiVBrSz8EKBxc7X4ZrBt/6bPDlBNb/JLlI75DUL2svLAQaeOjcc4wyuBRRusE5BxJHVsS3+OKjSdot2gYBads4oylUqjYcjEbUTPh0JVWLdUOvTrRqKXit2qt3WI9VZNwdhGISwusXMUgPsGvtkdbePdgyTCv6/8SSaNv2lYsEBkn4aQUqPbHnSSk23Lu8CNRZbmPNfPWl9HFrpfuFY8jOsP64OaOP0xIDwiEw==
Received: from SJ0PR03CA0337.namprd03.prod.outlook.com (2603:10b6:a03:39c::12)
 by DS0PR12MB8197.namprd12.prod.outlook.com (2603:10b6:8:f1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 10:03:43 +0000
Received: from SJ1PEPF0000231C.namprd03.prod.outlook.com
 (2603:10b6:a03:39c:cafe::24) by SJ0PR03CA0337.outlook.office365.com
 (2603:10b6:a03:39c::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.20 via Frontend Transport; Tue,
 3 Mar 2026 10:03:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF0000231C.mail.protection.outlook.com (10.167.242.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 10:03:43 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 02:03:23 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 02:03:23 -0800
Received: from sheetal.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Mar 2026 02:03:18 -0800
From: "Sheetal ." <sheetal@nvidia.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>
CC: Jonathan Hunter <jonathanh@nvidia.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Sameer Pujar <spujar@nvidia.com>, Mohan kumar
	<mkumard@nvidia.com>, <linux-sound@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Sheetal <sheetal@nvidia.com>
Subject: [PATCH v2 1/2] ASoC: dt-bindings: tegra: Add compatible for Tegra238 sound card
Date: Tue, 3 Mar 2026 15:32:48 +0530
Message-ID: <20260303100249.3214529-2-sheetal@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260303100249.3214529-1-sheetal@nvidia.com>
References: <20260303100249.3214529-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231C:EE_|DS0PR12MB8197:EE_
X-MS-Office365-Filtering-Correlation-Id: 9df189d7-d9ea-4b1d-3714-08de790c2714
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	CZuIlcaw1n5OsY5mKgxlyKd0/LMTnxQN5pJFCvLP7gi6dzPEs2r4Mzncu5laq3BBbG420cIKLIuSec5LFNQ5t8fcUwnCa+36GhzzR7WZbR6pOBvcb0Q29LKfnAWThelmsi4XfgocxQg+E3E9rzloyA992YTnaE60vDnF5X+wkJsWk9OCoeuTcULVoL0HrfOj37TZZWarjey96Rdmc5jDkO9Yubs7o7Ke4eekjxxoNMxA58gOA4fvgl2FdLXn5r74wjrcnWr5PQ8fMyVgcdVY9RdnOYoFrc3L/qpg724ez/dqfecKii/ICxKr3ceEToxtz66oS9aqho1hopJap+223o2PaoG/+RF/WDoPVgio3gDbmHDZlHUt60BihvvtRjbJMT/s3sH8nUKiju5zz9VmWs0X6owLEYxGg1XArIZQ6M1+0w02/kNjJ5utJEyCfT9pJFSzrGHu/bBXH2oo1X7yS83ecIHQftDRWDODqZpLIP4AP6XDC/aEF2lexRHitUc/z7NoLmSGSWqppT76LrtSBkKOSqrMyJSU35vwSInFHkctprYStxK2qICtAkZDpTnNOg1ni4ozCUx49cyJNaAp0Ne/ru6mDJ7UMp4G6duGgjfRzTeHQWmGKr7xzQ/YlZ+1jKGiD2cOtbVMF00YZXbltgrOEVlDqA6T+oETelBHuKSaErb6C3gH57kb5k+zS8+kQ88qbgZQnx4jfWbPmV2T7syMy8B1DcusZboheoA0STH/Ucnc7FOkHyhcfIvQFqqcCUEdv4PeegCQnlc75puX4GhxHMVif/BET6sS3PiRacbweAzonlUpZZ6vMIJKIpz6QEWC1dDjCpnQFWDvvxEZ/Q==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5qM+qPHHMrvgTrXBQsq0IkYBVbZ1Cc53BvuyGe2O4/2fAksPQiTp8wh669pXp/xKbNXeXwBYm35f9vAY3zQBNHuKJRAc9VNjAznU/5WwCxEtBIVOufYeWgDEOca819OgbihEQxVmJARQHOy8NOuwD5kKhnM/YGdH/BvZUDR9sW+N7yzcvrdkITOH89WYawA9qJ5Jt0o6J0F+8G2YULeJUYfzJmoSEn4c3UQKa1XxFDiCwzQzDYqowDtmthtHziwNVbEpyvRQa9zEj4f4mmITix8YAC+1OY3Bw3on5Am578NojOYM/4e8tV9f8mbIbQQznlAJWyrpld260O2jMHqibBSyEEqF9suKlAlNaTACH34vhbEVK8JAQNlmFPmqDsyetE2WhBf08TtWs+t9X6F6GoYJRDed1h2hDeRWCnupOv9XXhAoYf7TgmIdNdi5AHgO
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 10:03:43.3912
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9df189d7-d9ea-4b1d-3714-08de790c2714
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8197

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

