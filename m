Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012034.outbound.protection.outlook.com [52.101.53.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3BE423A89;
	Mon, 18 May 2026 12:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779108242; cv=fail; b=rWftqJZojSYyQl8qjBnA0xURo7dKPCsHnNK6c6FGF7I0fC+uLDUVPHhu9UruhICqGCnBJNLPwZHEwdYePnMdyEM+SFCSKSPsut8t0SQ2qX9dHqkzdloSn3DcHF12/ZtG3FDUlhSfpORlViK46038cSlFGuh3yn9Li6UHNmvociE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779108242; c=relaxed/simple;
	bh=NTURi2CJ0ZbFrq6HFY9GmCMfTMf9t3U8c6hYfHsS644=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IL/51cgW6Wr/ydxTTBkUt3+owZ4IcvNyygF3Y2/7EXw914Mh2LtoJwTRmZsKYLlOQnoU7i+Z6Cg+CcxrkIFNx7AiFhJAa9GkaMIi493icpqAuKhWXEEhgCewtKvDgFfcaVknUZ49Y68Uszv2YPlXQKJJjEzhJbWgmS1XLasNVlA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XX/GffKX; arc=fail smtp.client-ip=52.101.53.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XX/GffKX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UgmSnFEF1klS1hZU+y8IC0ihc3dhi5eqXg08XT2LWxrOgXRAeeYEsDeerFS8lsHopITrZVir7VSVvhS2hUruVzLtX2G9AKZwgIS06WUM9GVg7RBhPdpueOEsAH7b2yKWB6tZ+SCQnK2fNmG71VY4+eXyA7dClVUj8V1TmyRm8AogtJqTCToduPQp4tE0pxJh29G5VYKhjegpe7IpT3eO9XCficyEzrdWqB2EokzZXaREytGoHc0XNu+N++pdYu4exakU1CTC/+m9cre7dKQlXGD0dzSNTCGMI8VQiVsDGFrKmib6ltD0fJaeB+jCGN3Dmwi5y49YoLWmqlsod19HGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CdFD7KAH9IPokCXSOwiLu8wLC7Q+N3XNZzXc2iSxqRU=;
 b=UcxgVc7ZPzsp44F9mF/rq5xatRAgt0iASuseZmFmNs+qMu4PuAosR8fZYacOIzmG5dhEGUF+ilBJckQDOB4Yh0yR0yHJPrpRWrQBmtuG+/JIDlbOznS/RJ7GX0INk5Qropk/x+WL23bO7IMziv3r5IFWxtRbGVILqZFTEl8PnAv8P2BOdA5Ni5nNwbIfibYfTCP+dyFfuF93xIGhrFXutxm5hhBfBwctGwzfDkbYS3VXzPjXbe1riRSrvfroQRSvmm2WnktBEO/iERdowhpE2JEKlIxaR6tdWXTP3IsK5zIXWDqjNNor//JxRH34XshipqcAwh8O8wdaU8dNdsqM5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CdFD7KAH9IPokCXSOwiLu8wLC7Q+N3XNZzXc2iSxqRU=;
 b=XX/GffKXyYR42Z8c0rwcFEamBc2rIMrlbov/QUnFzP3DjwmFTAQOzKOLylBgfHynGOmrrTiW3ygqnwWdaejduqRTDtKKhPdL3zJ/KiNIj/FlGNOpDMNxnqrk/iumGF5sicXv0XmT9KVboRSC98+yos182e+/YOgKtjB63vd2eRTWrjCI2MvUM9t4hRgtOCn/Lh8cbG+ps0E9AJaQb90s+X5IGF1o+ESWIXl99K17IjqLH6h5VCVHUsRs9rsSZufF3RhbS/+4CQfz3Ewh9mjYR8x9EJSnrpsRA6CVYJ/RSsCLS84/+7Z63U3ho/3Xrv7FOfNTNW/TRMcNEiq9vsObrQ==
Received: from SJ0PR03CA0083.namprd03.prod.outlook.com (2603:10b6:a03:331::28)
 by SN7PR12MB7108.namprd12.prod.outlook.com (2603:10b6:806:2a3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 12:43:52 +0000
Received: from MW1PEPF0001615B.namprd21.prod.outlook.com
 (2603:10b6:a03:331:cafe::31) by SJ0PR03CA0083.outlook.office365.com
 (2603:10b6:a03:331::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.24 via Frontend Transport; Mon, 18
 May 2026 12:43:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 MW1PEPF0001615B.mail.protection.outlook.com (10.167.249.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.0 via Frontend Transport; Mon, 18 May 2026 12:43:52 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 18 May
 2026 05:43:22 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 18 May 2026 05:43:22 -0700
Received: from sumitg-l4t.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Mon, 18 May 2026 05:43:19 -0700
From: Sumit Gupta <sumitg@nvidia.com>
To: <krzk@kernel.org>, <treding@nvidia.com>, <jonathanh@nvidia.com>,
	<robh@kernel.org>, <conor+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <bbasu@nvidia.com>, <sumitg@nvidia.com>
Subject: [PATCH v2 2/3] dt-bindings: memory: tegra264: Add full set of MC client IDs
Date: Mon, 18 May 2026 18:13:05 +0530
Message-ID: <20260518124306.2071481-3-sumitg@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260518124306.2071481-1-sumitg@nvidia.com>
References: <20260518124306.2071481-1-sumitg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615B:EE_|SN7PR12MB7108:EE_
X-MS-Office365-Filtering-Correlation-Id: 63610872-931d-442e-6164-08deb4db1db2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|56012099003|22082099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	S80WD5VzEhcbElD5AmJngs6wBKIrebI3lohXcEH+/e9bf4tQxcxdVoh/lPOH21ZLjYzQkR8CxPq/aJ/utPGQvO2Rfik0g5KMJ8sJpxCs6t748cs18dT2h4AK6QeZ+t0K0X+Qb5YiVl3Vc58Sr6zGT34MYra7R1UC4gQhEb0d+W0PVsYCuaC4flYs/tx/vV5M1kpkP+3AyNtdH03TKESD+XgOuHkAssCyf3FT8PdpMwd7c3yB75dpO7u/rl6tEQ1A756IYM6PB8KsNtnjbHlVkKFqtjpzjW9GYjryhx2uHVXxWzyXo0bbW1A94+otPKpFlXZKv8+/io1B7s9afAvp2w/eWYAS5xSwVtZ3eZkI7DqfztlXwUKK+FlMWycNyUGaSAguAWXBl9w0EzsSe8g80XL9W2dFT6S6KiGLbjW03PySPbhwB9nA/jVYtDYsX6PH33yCvAcZb4/jKQcsoHS74oX0V73btV5bopN3Y1ZqQYtcETORJ8ONQ0Z3Jh4AYYV8QJPxL422H0sZ44AnR1fcSrOz8sH/xOJ5x9I3HjtU6FExVD9yXSNQ71FeBA61zYGkaoNBzpYDDPk7HLrRR/vNU42d1JWgxiEOGlUl0IP+dpn4XZiUNRcnRmd+d131dzruH7rGkwwHTyBuPdhrRgLP11VHbchU5HjgiQ3+drYDy/I8JN+aGfhDEkQkglduDrtTgv8eCrp9oP9BMpTDG4b+ncZbUbCFnxnA9ZXhMozeksE=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(56012099003)(22082099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LQq+VgXW2AEngZs0FziTjAp/AaNMSxUvvShVf4bc4NVtlra5wlSdme3yiFiaJlT0M3FF/CAkrPzvYqNb8XJzk+Dob7U8SsVj86zKMiJ9Kxllxcx2392P9YVne6kotQAx8GslQEh7SU0XiwGz0uwka7hE7r225eT5Yw5dF8E2YjySBrI3zqgiYon1XHx25A8Z6zmNN3vZKQdbe90499BGhZIYf/wFe4WofLpNL99NOD8KqTSKaFSq1dpOMASTh64atTrM78maWIJ3iLKYiJHdc9VndjIXAHLrzeRScfp/J0VnOCpcjTQ/it8OGXaqIfhrnFfTxW4OSqNxVCDUQptmyxh1AF67I2qG4dWxukaS93gIodJ6bvA/nbj4gWKNLwx/4j2mWptdz8/C6YDDmxEwbYGdMfBKalZhmKVtHcozyXKRc4gdkSVI8l22g3KkKQ44
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 12:43:52.1329
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63610872-931d-442e-6164-08deb4db1db2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF0001615B.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7108

Add the complete set of TEGRA264_MEMORY_CLIENT_* IDs exposed by the
Tegra264 MC.

Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
---
 include/dt-bindings/memory/nvidia,tegra264.h | 287 +++++++++++++++++++
 1 file changed, 287 insertions(+)

diff --git a/include/dt-bindings/memory/nvidia,tegra264.h b/include/dt-bindings/memory/nvidia,tegra264.h
index 521405c01f84..c65403a76413 100644
--- a/include/dt-bindings/memory/nvidia,tegra264.h
+++ b/include/dt-bindings/memory/nvidia,tegra264.h
@@ -58,24 +58,108 @@
  * memory client IDs
  */
 
+/* PTW read client mapped to SOC SMMU0 */
+#define TEGRA264_MEMORY_CLIENT_PTCR		0x00
 /* HOST1X read client */
 #define TEGRA264_MEMORY_CLIENT_HOST1XR		0x16
+#define TEGRA264_MEMORY_CLIENT_MPCORER		0x27
+/* Platform security (PSC) Read clients */
+#define TEGRA264_MEMORY_CLIENT_PSCR		0x33
+/* PSC Write clients */
+#define TEGRA264_MEMORY_CLIENT_PSCW		0x34
+/* ISP0 Read client */
+#define TEGRA264_MEMORY_CLIENT_ISP0R		0x37
+#define TEGRA264_MEMORY_CLIENT_MPCOREW		0x39
+/* ISP0 Write client */
+#define TEGRA264_MEMORY_CLIENT_ISP0W		0x44
+/* ISP1 Write client */
+#define TEGRA264_MEMORY_CLIENT_ISP1W		0x45
+/* ISP FALCON Read client */
+#define TEGRA264_MEMORY_CLIENT_ISPFALCONR	0x47
+/* ISP FALCON Write client */
+#define TEGRA264_MEMORY_CLIENT_ISPFALCONW	0x4f
+/* MGBE2 Read mccif */
+#define TEGRA264_MEMORY_CLIENT_MGBE2R		0x5c
+#define TEGRA264_MEMORY_CLIENT_OFAR2MC		0x5d
+#define TEGRA264_MEMORY_CLIENT_OFAW2MC		0x5e
+/* MGBE2 Write mccif */
+#define TEGRA264_MEMORY_CLIENT_MGBE2W		0x5f
+/* MGBE3 Read mccif */
+#define TEGRA264_MEMORY_CLIENT_MGBE3R		0x61
+/* MGBE3 Write mccif */
+#define TEGRA264_MEMORY_CLIENT_MGBE3W		0x65
+/* SEU1 Memory Read Client */
+#define TEGRA264_MEMORY_CLIENT_SEU1RD		0x68
+/* SEU1 Memory Write Client */
+#define TEGRA264_MEMORY_CLIENT_SEU1WR		0x69
 /* VIC read client */
 #define TEGRA264_MEMORY_CLIENT_VICR		0x6c
 /* VIC Write client */
 #define TEGRA264_MEMORY_CLIENT_VICW		0x6d
 /* VI R5 Write client */
 #define TEGRA264_MEMORY_CLIENT_VIW		0x72
+/* QSPI Read Client */
+#define TEGRA264_MEMORY_CLIENT_XSPI0R		0x75
+/* QSPI Write Client */
+#define TEGRA264_MEMORY_CLIENT_XSPI0W		0x76
 #define TEGRA264_MEMORY_CLIENT_NVDECSRD2MC	0x78
 #define TEGRA264_MEMORY_CLIENT_NVDECSWR2MC	0x79
 /* Audio processor(APE) Read client */
 #define TEGRA264_MEMORY_CLIENT_APER		0x7a
 /* Audio processor(APE) Write client */
 #define TEGRA264_MEMORY_CLIENT_APEW		0x7b
+/* SEU0 read client */
+#define TEGRA264_MEMORY_CLIENT_SER		0x80
+/* SEU0 write client */
+#define TEGRA264_MEMORY_CLIENT_SEW		0x81
+/* AXI AP and DFD/Coresight1-AUX0/1 Read clients both share the same interface on MSS */
+#define TEGRA264_MEMORY_CLIENT_AXIAPR		0x82
+/* AXI AP and DFD/Coresight1-AUX0/1 Write clients both share the same interface on MSS */
+#define TEGRA264_MEMORY_CLIENT_AXIAPW		0x83
+/* ETR or DFD/Coresight0 Read Client */
+#define TEGRA264_MEMORY_CLIENT_ETRR		0x84
+/* ETR or DFD/Coresight0 Write Client */
+#define TEGRA264_MEMORY_CLIENT_ETRW		0x85
+/* Security(tsec) Read client */
+#define TEGRA264_MEMORY_CLIENT_TSECR		0x86
+/* Security(tsec) Write client */
+#define TEGRA264_MEMORY_CLIENT_TSECW		0x87
+/* BPMP read client */
+#define TEGRA264_MEMORY_CLIENT_BPMPR		0x93
+/* BPMP write client */
+#define TEGRA264_MEMORY_CLIENT_BPMPW		0x94
+/* AON Read Client */
+#define TEGRA264_MEMORY_CLIENT_AONR		0x97
+/* AON write client */
+#define TEGRA264_MEMORY_CLIENT_AONW		0x98
+/* GPCDMA debug Read client */
+#define TEGRA264_MEMORY_CLIENT_GPCDMAR		0x99
+/* GPCDMA debug Write client */
+#define TEGRA264_MEMORY_CLIENT_GPCDMAW		0x9a
 /* Audio DMA Read client */
 #define TEGRA264_MEMORY_CLIENT_APEDMAR		0x9f
 /* Audio DMA Write client */
 #define TEGRA264_MEMORY_CLIENT_APEDMAW		0xa0
+/* mss internal memqual MIU0 reads */
+#define TEGRA264_MEMORY_CLIENT_MIU0R		0xa6
+/* mss internal memqual MIU0 writes */
+#define TEGRA264_MEMORY_CLIENT_MIU0W		0xa7
+/* mss internal memqual MIU1 reads */
+#define TEGRA264_MEMORY_CLIENT_MIU1R		0xa8
+/* mss internal memqual MIU1 writes */
+#define TEGRA264_MEMORY_CLIENT_MIU1W		0xa9
+/* mss internal memqual MIU2 reads */
+#define TEGRA264_MEMORY_CLIENT_MIU2R		0xae
+/* mss internal memqual MIU2 writes */
+#define TEGRA264_MEMORY_CLIENT_MIU2W		0xaf
+/* mss internal memqual MIU3 reads */
+#define TEGRA264_MEMORY_CLIENT_MIU3R		0xb0
+/* mss internal memqual MIU3 writes */
+#define TEGRA264_MEMORY_CLIENT_MIU3W		0xb1
+/* mss internal memqual MIU4 reads */
+#define TEGRA264_MEMORY_CLIENT_MIU4R		0xb2
+/* mss internal memqual MIU4 writes */
+#define TEGRA264_MEMORY_CLIENT_MIU4W		0xb3
 #define TEGRA264_MEMORY_CLIENT_GPUR02MC		0xb6
 #define TEGRA264_MEMORY_CLIENT_GPUW02MC		0xb7
 /* VI Falcon Read client */
@@ -86,6 +170,8 @@
 #define TEGRA264_MEMORY_CLIENT_RCER		0xd2
 /* Write client of RCE */
 #define TEGRA264_MEMORY_CLIENT_RCEW		0xd3
+#define TEGRA264_MEMORY_CLIENT_NVENC1SRD2MC	0xd6
+#define TEGRA264_MEMORY_CLIENT_NVENC1SWR2MC	0xd7
 /* PCIE0/MSI Write clients */
 #define TEGRA264_MEMORY_CLIENT_PCIE0W		0xd9
 /* PCIE1/RPX4 Read clients */
@@ -108,16 +194,140 @@
 #define TEGRA264_MEMORY_CLIENT_PCIE5R		0xe2
 /* PCIE5/DMX4 Write clients */
 #define TEGRA264_MEMORY_CLIENT_PCIE5W		0xe3
+/* mss internal memqual MIU5 reads */
+#define TEGRA264_MEMORY_CLIENT_MIU5R		0xfc
+/* mss internal memqual MIU5 writes */
+#define TEGRA264_MEMORY_CLIENT_MIU5W		0xfd
+/* mss internal memqual MIU6 writes */
+#define TEGRA264_MEMORY_CLIENT_MIU6W		0xff
+#define TEGRA264_MEMORY_CLIENT_RISTR		0x100
+#define TEGRA264_MEMORY_CLIENT_RISTW		0x101
+/* OESP (Pluton) Read client */
+#define TEGRA264_MEMORY_CLIENT_OESPR		0x102
+/* OESP (Pluton) Write client */
+#define TEGRA264_MEMORY_CLIENT_OESPW		0x103
+/* mss internal memqual MIU7 writes */
+#define TEGRA264_MEMORY_CLIENT_MIU7W		0x105
+/* mss internal memqual MIU8 reads */
+#define TEGRA264_MEMORY_CLIENT_MIU8R		0x106
+/* mss internal memqual MIU8 writes */
+#define TEGRA264_MEMORY_CLIENT_MIU8W		0x107
+/* mss internal memqual MIU9 reads */
+#define TEGRA264_MEMORY_CLIENT_MIU9R		0x108
+/* mss internal memqual MIU9 writes */
+#define TEGRA264_MEMORY_CLIENT_MIU9W		0x109
+/* HWPM Write Interface */
+#define TEGRA264_MEMORY_CLIENT_PMA0AWR		0x122
+#define TEGRA264_MEMORY_CLIENT_NVJPG1SRD2MC	0x123
+#define TEGRA264_MEMORY_CLIENT_NVJPG1SWR2MC	0x124
+/* CTW read client mapped to SMMU0 */
+#define TEGRA264_MEMORY_CLIENT_SMMU0CTWR	0x12e
+/* CMDQV read client mapped to SMMU0 */
+#define TEGRA264_MEMORY_CLIENT_SMMU0CMDQVR	0x12f
+/* CMDQV write client mapped to SMMU0 */
+#define TEGRA264_MEMORY_CLIENT_SMMU0CMDQVW	0x130
+/* EVNTQ write client mapped to SMMU0 */
+#define TEGRA264_MEMORY_CLIENT_SMMU0EVNTQW	0x131
+/* PTW read client mapped to SMMU1 */
+#define TEGRA264_MEMORY_CLIENT_SMMU1PTWR	0x132
+/* CTW read client mapped to SMMU1 */
+#define TEGRA264_MEMORY_CLIENT_SMMU1CTWR	0x134
+/* CMDQV read client mapped to SMMU1 */
+#define TEGRA264_MEMORY_CLIENT_SMMU1CMDQVR	0x135
+/* CMDQV write client mapped to SMMU1 */
+#define TEGRA264_MEMORY_CLIENT_SMMU1CMDQVW	0x136
+/* EVNTQ write client mapped to SMMU1 */
+#define TEGRA264_MEMORY_CLIENT_SMMU1EVNTQW	0x137
+/* PTW read client mapped to SMMU2 */
+#define TEGRA264_MEMORY_CLIENT_SMMU2PTWR	0x138
+/* CTW read client mapped to SMMU2 */
+#define TEGRA264_MEMORY_CLIENT_SMMU2CTWR	0x13a
+/* CMDQV read client mapped to SMMU2 */
+#define TEGRA264_MEMORY_CLIENT_SMMU2CMDQVR	0x13b
+/* CMDQV write client mapped to SMMU2 */
+#define TEGRA264_MEMORY_CLIENT_SMMU2CMDQVW	0x13c
+/* EVNTQ write client mapped to SMMU2 */
+#define TEGRA264_MEMORY_CLIENT_SMMU2EVNTQW	0x13d
+/* CMDQ read client mapped to SMMU0 */
+#define TEGRA264_MEMORY_CLIENT_SMMU0CMDQR	0x144
+/* CMDQ read client mapped to SMMU1 */
+#define TEGRA264_MEMORY_CLIENT_SMMU1CMDQR	0x145
+/* CMDQ read client mapped to SMMU2 */
+#define TEGRA264_MEMORY_CLIENT_SMMU2CMDQR	0x146
+/* Audio processor1(APE1) Read client */
+#define TEGRA264_MEMORY_CLIENT_APE1R		0x150
+/* Audio processor1(APE1) Write client */
+#define TEGRA264_MEMORY_CLIENT_APE1W		0x151
 /* UFS Read client */
 #define TEGRA264_MEMORY_CLIENT_UFSR		0x15c
 /* UFS write client */
 #define TEGRA264_MEMORY_CLIENT_UFSW		0x15d
+/* XUSB HOST Read Client */
+#define TEGRA264_MEMORY_CLIENT_XUSB_DEVR	0x166
+/* XUSB HOST Write Client */
+#define TEGRA264_MEMORY_CLIENT_XUSB_DEVW	0x167
+/* XUSB SS0 Read Client */
+#define TEGRA264_MEMORY_CLIENT_XUSB_DEV1R	0x168
+/* XUSB SS1 Write Client */
+#define TEGRA264_MEMORY_CLIENT_XUSB_DEV2W	0x169
+/* XUSB SS2 Read Client */
+#define TEGRA264_MEMORY_CLIENT_XUSB_DEV3R	0x16a
+/* XUSB SS2 Write Client */
+#define TEGRA264_MEMORY_CLIENT_XUSB_DEV3W	0x16b
+/* XUSB SS3 Read Client */
+#define TEGRA264_MEMORY_CLIENT_XUSB_DEV4R	0x16c
+/* XUSB SS3 Write Client */
+#define TEGRA264_MEMORY_CLIENT_XUSB_DEV4W	0x16d
+/* XUSB DEV Read Client */
+#define TEGRA264_MEMORY_CLIENT_XUSB_DEV5R	0x16e
+/* XUSB DEV Write Client */
+#define TEGRA264_MEMORY_CLIENT_XUSB_DEV5W	0x16f
+/* DCE Read client */
+#define TEGRA264_MEMORY_CLIENT_DCER		0x17a
+/* DCE Write client */
+#define TEGRA264_MEMORY_CLIENT_DCEW		0x17b
 /* HDA Read client */
 #define TEGRA264_MEMORY_CLIENT_HDAR		0x17c
 /* HDA Write client */
 #define TEGRA264_MEMORY_CLIENT_HDAW		0x17d
+/* DISPNISO read client */
+#define TEGRA264_MEMORY_CLIENT_DISPNISOR	0x17e
+/* DISPNISO write client */
+#define TEGRA264_MEMORY_CLIENT_DISPNISOW	0x17f
+/* XUSB SS0 Write Client */
+#define TEGRA264_MEMORY_CLIENT_XUSB_DEV1W	0x180
+/* XUSB SS1 Read Client */
+#define TEGRA264_MEMORY_CLIENT_XUSB_DEV2R	0x181
 /* Disp ISO Read Client */
 #define TEGRA264_MEMORY_CLIENT_DISPR		0x182
+/* MSSSEQ Read Client */
+#define TEGRA264_MEMORY_CLIENT_MSSSEQR		0x185
+/* MSSSEQ Write Client */
+#define TEGRA264_MEMORY_CLIENT_MSSSEQW		0x186
+/* PTW read client mapped to SMMU3 */
+#define TEGRA264_MEMORY_CLIENT_SMMU3PTWR	0x18b
+/* CTW read client mapped to SMMU3 */
+#define TEGRA264_MEMORY_CLIENT_SMMU3CTWR	0x18d
+/* CMDQV read client mapped to SMMU3 */
+#define TEGRA264_MEMORY_CLIENT_SMMU3CMDQVR	0x18e
+/* CMDQV write client mapped to SMMU3 */
+#define TEGRA264_MEMORY_CLIENT_SMMU3CMDQVW	0x18f
+/* EVNTQ write client mapped to SMMU3 */
+#define TEGRA264_MEMORY_CLIENT_SMMU3EVNTQW	0x190
+/* CMDQ read client mapped to SMMU3 */
+#define TEGRA264_MEMORY_CLIENT_SMMU3CMDQR	0x191
+/* PTW read client mapped to SMMU4 */
+#define TEGRA264_MEMORY_CLIENT_SMMU4PTWR	0x192
+/* CTW read client mapped to SMMU4 */
+#define TEGRA264_MEMORY_CLIENT_SMMU4CTWR	0x194
+/* CMDQV read client mapped to SMMU4 */
+#define TEGRA264_MEMORY_CLIENT_SMMU4CMDQVR	0x195
+/* CMDQV write client mapped to SMMU4 */
+#define TEGRA264_MEMORY_CLIENT_SMMU4CMDQVW	0x196
+/* EVNTQ write client mapped to SMMU4 */
+#define TEGRA264_MEMORY_CLIENT_SMMU4EVNTQW	0x197
+/* CMDQ read client mapped to SMMU4 */
+#define TEGRA264_MEMORY_CLIENT_SMMU4CMDQR	0x198
 /* MGBE0 Read mccif */
 #define TEGRA264_MEMORY_CLIENT_MGBE0R		0x1a2
 /* MGBE0 Write mccif */
@@ -128,9 +338,86 @@
 #define TEGRA264_MEMORY_CLIENT_MGBE1W		0x1a5
 /* VI1 R5 Write client */
 #define TEGRA264_MEMORY_CLIENT_VI1W		0x1a6
+/* VI Falcon1 Read client */
+#define TEGRA264_MEMORY_CLIENT_VIFALCON1R	0x1a7
+/* VI Falcon1 Write client */
+#define TEGRA264_MEMORY_CLIENT_VIFALCON1W	0x1a8
+/* ISP FALCON1 Read client */
+#define TEGRA264_MEMORY_CLIENT_ISPFALCON1R	0x1a9
+/* ISP FALCON1 Write client */
+#define TEGRA264_MEMORY_CLIENT_ISPFALCON1W	0x1aa
+/* Read Client of RCE1 */
+#define TEGRA264_MEMORY_CLIENT_RCE1R		0x1ab
+/* Write client of RCE1 */
+#define TEGRA264_MEMORY_CLIENT_RCE1W		0x1ac
+/* SEU2 Read client */
+#define TEGRA264_MEMORY_CLIENT_SEU2R		0x1ad
+/* SEU2 Write client */
+#define TEGRA264_MEMORY_CLIENT_SEU2W		0x1ae
+/* SEU3 Read client */
+#define TEGRA264_MEMORY_CLIENT_SEU3R		0x1af
+/* SEU3 Write client */
+#define TEGRA264_MEMORY_CLIENT_SEU3W		0x1b0
+/* PVA0 Falcon Read mccif */
+#define TEGRA264_MEMORY_CLIENT_PVA0R		0x1b1
+/* PVA0 Falcon Write mccif */
+#define TEGRA264_MEMORY_CLIENT_PVA0W		0x1b2
+/* PVA1 Read mccif */
+#define TEGRA264_MEMORY_CLIENT_PVA1R		0x1b3
+/* PVA1 Write mccif */
+#define TEGRA264_MEMORY_CLIENT_PVA1W		0x1b4
+/* PVA2 Read mccif */
+#define TEGRA264_MEMORY_CLIENT_PVA2R		0x1b5
+/* PVA2 Write mccif */
+#define TEGRA264_MEMORY_CLIENT_PVA2W		0x1b6
+/* ISP3 Write client */
+#define TEGRA264_MEMORY_CLIENT_ISP3W		0x1b7
+/* ISP2 Read Client */
+#define TEGRA264_MEMORY_CLIENT_ISP2R		0x1b8
+/* ISP2 Write Client */
+#define TEGRA264_MEMORY_CLIENT_ISP2W		0x1b9
+/* EQOS Read mccif */
+#define TEGRA264_MEMORY_CLIENT_EQOSR		0x1bc
+/* EQOS Write mccif */
+#define TEGRA264_MEMORY_CLIENT_EQOSW		0x1bd
+/* FSI0 Read mccif */
+#define TEGRA264_MEMORY_CLIENT_FSI0R		0x1be
+/* FSI0 Write mccif */
+#define TEGRA264_MEMORY_CLIENT_FSI0W		0x1bf
+/* FSI1 Read mccif */
+#define TEGRA264_MEMORY_CLIENT_FSI1R		0x1c0
+/* FSI1 Write mccif */
+#define TEGRA264_MEMORY_CLIENT_FSI1W		0x1c1
 /* SDMMC0 Read mccif */
 #define TEGRA264_MEMORY_CLIENT_SDMMC0R		0x1c2
 /* SDMMC0 Write mccif */
 #define TEGRA264_MEMORY_CLIENT_SDMMC0W		0x1c3
+/* Strongbox (SB) read client */
+#define TEGRA264_MEMORY_CLIENT_SBR		0x1c6
+/* Strongbox (SB) write client */
+#define TEGRA264_MEMORY_CLIENT_SBW		0x1c7
+#define TEGRA264_MEMORY_CLIENT_HSS_MIU0R	0x1c8
+#define TEGRA264_MEMORY_CLIENT_HSS_MIU0W	0x1c9
+#define TEGRA264_MEMORY_CLIENT_HSS_MIU1R	0x1ca
+#define TEGRA264_MEMORY_CLIENT_HSS_MIU1W	0x1cb
+#define TEGRA264_MEMORY_CLIENT_HSS_MIU2R	0x1cc
+#define TEGRA264_MEMORY_CLIENT_HSS_MIU2W	0x1cd
+#define TEGRA264_MEMORY_CLIENT_HSS_MIU3R	0x1ce
+#define TEGRA264_MEMORY_CLIENT_HSS_MIU3W	0x1cf
+#define TEGRA264_MEMORY_CLIENT_HSS_MIU4R	0x1d0
+#define TEGRA264_MEMORY_CLIENT_HSS_MIU4W	0x1d1
+#define TEGRA264_MEMORY_CLIENT_HSS_MIU5R	0x1d2
+#define TEGRA264_MEMORY_CLIENT_HSS_MIU5W	0x1d3
+#define TEGRA264_MEMORY_CLIENT_HSS_MIU6R	0x1d4
+#define TEGRA264_MEMORY_CLIENT_HSS_MIU6W	0x1d5
+#define TEGRA264_MEMORY_CLIENT_HSS_MIU7R	0x1d6
+#define TEGRA264_MEMORY_CLIENT_HSS_MIU7W	0x1d7
+#define TEGRA264_MEMORY_CLIENT_GMMUR2MC		0x1d8
+#define TEGRA264_MEMORY_CLIENT_UCFELAR		0x1d9
+#define TEGRA264_MEMORY_CLIENT_UCFELAW		0x1da
+#define TEGRA264_MEMORY_CLIENT_SLCR		0x1db
+#define TEGRA264_MEMORY_CLIENT_SLCW		0x1dc
+#define TEGRA264_MEMORY_CLIENT_REMOTER		0x1dd
+#define TEGRA264_MEMORY_CLIENT_REMOTEW		0x1de
 
 #endif /* DT_BINDINGS_MEMORY_NVIDIA_TEGRA264_H */
-- 
2.34.1

