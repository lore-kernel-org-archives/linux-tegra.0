Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013050.outbound.protection.outlook.com [40.107.201.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98413EFD09;
	Tue, 19 May 2026 08:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779180474; cv=fail; b=WjCFxHQsC9Pad5kOdWdi7dTTT4hQ9efMiEUXvpBPTKeLmp8G1vf6t9sl9AU7P1CtywjAD+YjitfyUMMTay5lnM/KalW8i3cuRQJW6O7xH3Ryc3I8bklzx+kboj5C2RCKwnIk6IsOp3RFagrEuCmPAwYClQb7VpFVzo2mJA6gOek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779180474; c=relaxed/simple;
	bh=AAfG9c2sx+SjGqLGMuphCaTHiwGB7CbuEyCsoDna3YI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hbEkEOew9fL9EfOb7DM7z4FtDmsVEGFaOxdiAKtqOnxYByn5FnEXhZoLCTKSulPF40TMzNAi2HPgK6Lbwl89fMZ9606Q6HiFGoo6jqxzlL7FYbas0aQgk/At+k8sdZyOPjwJ4K/6+vpBQ/2KJjOmwoBqm5SAk2//P1Gk9uTh2Pg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nsPr2a2p; arc=fail smtp.client-ip=40.107.201.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nsPr2a2p"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l9u5WYBdp9CNZS2trnDZAvkecriARfJXX/kRfYm6R/OoPJ/fr/whoj7m9dPKpb/VdUWc3LvKqMs153QQQyd9U7Uomqc18/AyNj/Uxwk/pLsE9kFoeHVvMEJoXbvzMhwQEEW4XfpZQH1M7vBncNEvED1I7XxPZmoJgl6Sl/2GEzcBtCxvklDk6q/bTBvWBCY4E/ZZ6pKQIOcwAppOUXCkwsGIFPS/cLoeHATkaVqm6KSuUWYmCwe9JK6ub3chybM41GNCViWLA0ywoyLB1ER0NKzRE7hp8zDH6t/iC89ii1AyehE1gwwT3VzcEyBszAGr735uZhhLqS1FZjR/8ImoHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=akCtrfIU1xZUuiyyUVAi7Dugl77RwMrVFTuACX87psk=;
 b=ERrGSR682SNE8b7KE9VaDV6TlqeipjQAM9nRE7OGX3KCDVzuGyCEjMYBPYBRuMYLQeiWrEDu4/428ARdSJiMf7d9kStJqIDHofbDjUpkpuivNjA0wiAfeeswXoRp8MH44X84K5TIi97zGcOUTdBsVwYN44rg+IML5t0Y+PmZ3CXBYzWURwvhikjwW8rp4RfK7ZFRD4g4cCnOEvGB9tXhMbmLUM5Jok1Nf1ulY4K4BKZ2VHFgJI6bhm8wWd9MJrZPbVD4CFxXTCEYon1bh1Jb5BXqI6ATIb8CkQiqKqaixOL5mcN/7xhoFCgepJptjS0CG4Eir/DhAAHlxU2JGnrJAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=akCtrfIU1xZUuiyyUVAi7Dugl77RwMrVFTuACX87psk=;
 b=nsPr2a2p21P2F/9wdpDIh9Hd+Y/65rYfSWvXnzEPEBE0uYl3vXk3HCeOXt+JQVI6yztG70uxtO7BMwnLjMX1OeAqTVkYfknMy4oZ+yDwZJ4XTK43RfT3YAJndsmb59Mx2qh4Jq8h4QacavRaO+kyCRyhyQ9gk3bgWmYpT+eEgopwlrVMcnkYYe2zqNMYsXCMHLjJNDIbA7glVkVeCAbrW88HaVK9c4VR04y4Pt5Wop2ioiatR14foqCk9vL+hsBGrMTPSWDrdjATTztcFfs2f9r+pnJJrJcQ+OPywjUPLKYdxgIMYJMHShWGCNldHgZzl+4Cd0ibgUpPq3X2YEtVRQ==
Received: from BN9PR03CA0254.namprd03.prod.outlook.com (2603:10b6:408:ff::19)
 by CY8PR12MB8338.namprd12.prod.outlook.com (2603:10b6:930:7b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.22; Tue, 19 May
 2026 08:47:46 +0000
Received: from BN3PEPF0000B371.namprd21.prod.outlook.com
 (2603:10b6:408:ff:cafe::df) by BN9PR03CA0254.outlook.office365.com
 (2603:10b6:408:ff::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.14 via Frontend Transport; Tue, 19
 May 2026 08:47:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B371.mail.protection.outlook.com (10.167.243.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.0 via Frontend Transport; Tue, 19 May 2026 08:47:46 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 19 May
 2026 01:47:29 -0700
Received: from moonraker.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 19 May
 2026 01:47:27 -0700
From: Jon Hunter <jonathanh@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding
	<thierry.reding@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Jon Hunter
	<jonathanh@nvidia.com>
Subject: [PATCH 2/2] arm64: tegra: Enable PCIe for Jetson AGX Thor
Date: Tue, 19 May 2026 09:47:07 +0100
Message-ID: <20260519084707.773214-2-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260519084707.773214-1-jonathanh@nvidia.com>
References: <20260519084707.773214-1-jonathanh@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B371:EE_|CY8PR12MB8338:EE_
X-MS-Office365-Filtering-Correlation-Id: 11d5222e-71f4-46ac-c709-08deb5834cd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|18002099003|56012099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	oTe8cdhTspuoZlPVwB1yXqVPdlsIALGjrv17xby6v7/h2j75CYyy3tpDG11ejdyj8+AEWoeIoB3Rb+LjVrMNTm95bBOdaRymn3IKoazw2vGr/hnToMWIT18/1Y331iAK2E45/O46dn+clSKw5cXlkOt8NJRLGc+3BoeGjuE3eqSjiuJ7J6hfwTcsaTlsiv6s1xsgZNQ0LNhiseWW+ZiaQ0VungwpywJLVMVqR1SW4flSDtqAFwoQtlGV74XkThd/PnTF+eqzK/CuIqN5lfXgPrfATBGS64hbFRTE1DcaHmDo+7Ixg9s+hhk9NP8DQ/Tmi+9zm9S1ZY7djr+U12LpIWZZbpP5sQunBW55eEB5rWl7gkArHivMJsgzGEl0e4yGSf6G84OJ7MYkKhQtrl/nkrux2eSkGqnKAKO2/cSR3bhI3jCoU8enB47HETrlen6RB6/5+mDSRjRqIdjzZS0wo4YtFgu2ULKt485OX/oWTze6HClb/Ix8vqLRcX7NApuDdSR8NaSunseysMRAqY4Hn1a71+aNpi9EcRovXTshK/T7q2N/fUTNEOjA/ViuI0FoiSbj2inF6HvdUa1W+8y6vbQAUjHYuSSn4t+UNaBjYqPI0p8T5HM+xIvEam8CE5xuLzlXUnZSWqhUyUy4YNL17Gr8hwulfcyw+xlYX4M/TxJqrDtCnwX5tsM8Tv2rjVCuxerVAfbditxsv4Vd2T2oqOCBsW0nrNrfgZSKB8gLOi8=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(56012099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	w/UmnTxD2SaGPN33b4H7F6urXScnx4zgajQWh64gzdsUG6/SkTBimLi8RKFsJRQwrs8Ab/j3G5g4SsyIQL3OO8YKJYQ2ptfKgG12Zr8zR6fPVQ5oa24Xygfpf9OYHQaaN4S7U+IAhu42AYSbkT154lRQ+kVUolZ9LRGT45hHzFQj8ZwrP6rN9HeRGio0VAkLw8jG5QFOcdUAeb5o/e86jpXq1gtgSyQ7AhGkmvG6i1Ju54IVxPHcCz2oydJcAl4x2hRYoXI0eSV4ExdmYCQ98q1mYBp0wu0Tw/U8LtwjwpQRimzevcT2fSFjEqGfA1FmibWn6js4QPk7DG7x1Tw9FLrsOui+XpQwLius+Fjqrq/4s9P3gPnyCMengHcHXqZCtz0cJgf3oydOSpo/ZLRbs0c248gyDA8ON3IKAaUgXP93HBqlxZHRObzhobefobTZ
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 08:47:46.5584
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11d5222e-71f4-46ac-c709-08deb5834cd2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B371.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8338

Enable the PCIe controllers on the Jetson AGX Thor Developer Kit that
are used for ethernet and NVMe.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 .../dts/nvidia/tegra264-p4071-0000+p3834-0008.dts    | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834-0008.dts b/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834-0008.dts
index df6555b6d0e0..3bd4c4cf2871 100644
--- a/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834-0008.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834-0008.dts
@@ -8,4 +8,16 @@
 / {
 	model = "NVIDIA Jetson AGX Thor Developer Kit";
 	compatible = "nvidia,p4071-0000+p3834-0008", "nvidia,p3834-0008", "nvidia,tegra264";
+
+	bus@a800000000 {
+		/* PCIe C2 to enable Ethernet */
+		pci@8420000 {
+			status = "okay";
+		};
+
+		/* PCIe C5 to enable NVME */
+		pci@8480000 {
+			status = "okay";
+		};
+	};
 };
-- 
2.43.0

