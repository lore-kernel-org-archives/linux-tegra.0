Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011044.outbound.protection.outlook.com [52.101.62.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D3442317F;
	Mon, 18 May 2026 12:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779108212; cv=fail; b=fqv9uoiRQgV5f5lUfIkUTla9Q4JcsMUnK0hYLkVnHQb/fSIcgU0CugOeq2LCNBR4T7Nb7rCL/QO69opAf80mutH86rzEjjjUdp1FzxjX8e/xyCK85g0nDhlQv/Rf4aVbxQI1z1KTfaNW0f3DG5vhFe11wf9SR9GCYCZKxgvS0hQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779108212; c=relaxed/simple;
	bh=QBihCemmCSsmcPg2eRUZQj8xjpzR1zfaQpaj9Y7lLt0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cEHzAZolb62fjtmpiFAZUOvB/tBszgC3wm6UZ72oDcPC7/uJ97mbg+IO5FDgHn0hDDvgqWiPB/tcMBVWFiZ5td94KGFAN3D6STD6S2Q9hnrGAOvw2LNeka66DDf3MhFmnA8fupw+bsYQ8hAko5aR4JDEnN4JYzRT3ijg3Spqs/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UdlCSIih; arc=fail smtp.client-ip=52.101.62.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UdlCSIih"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iD1xOwkTz1mrrAswtdWbONQMQjDh3d71CLJ4B3lGyVzcstz7dRfEU9RJNTTeYCIXooKh1C0rV71NHAP3ZU8iE9VUqTV5VH+1GDrjtq4ObizVqe0/1GqA+jax36EJpxpda/q18B0IERVfCcJFuQEMGyKihVANRvZvs5pSdToAq2Eev5i6Q4DjZi59p98ShrNxHQk8tniTCupvm46uyxBcQl/MceRoRtsjqTMJXf3h83pl0hM0fSKZSi+JVeZlak4UvSa7fm8mfbgCiG8drJ33hWqICLNmWCZtqOrFdBhnQ+ZSsP5PSlRbM39q79b+oki13VLif2ZjISTFzgQMNpO2hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hlD1KAml219k2dc6kMzfOpom17f4+6iaJcl1KaLNOVw=;
 b=f9k/3i3f+fs189s3G+3M8mGydJa/gpk074Ker8DwiSVkqLVKzkIzJ4Zw18eWfNac4TQ/YTqBDLe76Sxb0F5TM0ljQIRAkM8bZlTRP2P6RPk7Ip27IWKfnLp1MEsEy6lWz2FAOxzU8EI9DtPhLqwT18l+qStPawPz1N9o4dRRhGviNNjcyta/d29765wznPL3JnX3MWDw1azYQJ6YH4a579flhc0SKAmfK7AFpi536C0vPGkEuvACCsG/GuVwFL4O6Y7xL9zJYF4uCz+2S2FerryIn8exUIb4Bd+QsQnFx2LBesnyHRRHc+JBFa+lXD/RBefbAp8WqN7EGneskT7qKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hlD1KAml219k2dc6kMzfOpom17f4+6iaJcl1KaLNOVw=;
 b=UdlCSIih1iXX/fidzV3MjNqyGxjE20oIieevrDE7rzSug7WfRzUthsK8/XpM50lTZLCo/oZP/k5T3zU7R9Vxku94pIsce/+WVTf0pXxzkU7rI973pJb5XnBc1NZbrkGi6oW97bVGqvBRvI6suK0HKaSI/R59uIJt7TD2uuF6EUE6yNsx2e5ND/P+Zf2/SLdQgjmVefen23V3NZeVc/rAqisqUqzPNTR7KGMGp37Y/yYGMb606iaR1Yqzk5c9E28fTKcSEOr9E1r7Lhsm5mS97DWlg0vJcBmjQ0rfpJBy0VgrC00vOQvLohBf18GZfueDSV6WBFrtBhI6ddy9VvWx+w==
Received: from SJ0PR03CA0283.namprd03.prod.outlook.com (2603:10b6:a03:39e::18)
 by LV5PR12MB9825.namprd12.prod.outlook.com (2603:10b6:408:2ff::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 12:43:26 +0000
Received: from CO1PEPF000066EA.namprd05.prod.outlook.com
 (2603:10b6:a03:39e:cafe::ef) by SJ0PR03CA0283.outlook.office365.com
 (2603:10b6:a03:39e::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.23 via Frontend Transport; Mon, 18
 May 2026 12:43:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CO1PEPF000066EA.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Mon, 18 May 2026 12:43:25 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 18 May
 2026 05:43:12 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 18 May 2026 05:43:12 -0700
Received: from sumitg-l4t.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Mon, 18 May 2026 05:43:09 -0700
From: Sumit Gupta <sumitg@nvidia.com>
To: <krzk@kernel.org>, <treding@nvidia.com>, <jonathanh@nvidia.com>,
	<robh@kernel.org>, <conor+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <bbasu@nvidia.com>, <sumitg@nvidia.com>
Subject: [PATCH v2 0/3] memory: tegra264: Add full set of MC clients
Date: Mon, 18 May 2026 18:13:03 +0530
Message-ID: <20260518124306.2071481-1-sumitg@nvidia.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EA:EE_|LV5PR12MB9825:EE_
X-MS-Office365-Filtering-Correlation-Id: dd1c50c9-b8e1-471b-3801-08deb4db0e1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|3023799003|11063799003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	S64qN2MTgE+QTMljYBpOSlrB7i3VBKLoKYR/S/r4PjmfdAKtHIkiDqkL29nFYk+ViN1P/3j2TQi7VO4/xPuGd8mfNBzdhLkqRW9XCTCLLwNmTC1aDyoCDaii1rjb1LRq/esGlH4jxQQYx71apodkBJwx74keMDlGUFZMRixBY+scejXADGOLKPPF7utjKOb3s3Vi5uJHKgi+8r8jb38WTpiAL+qRl1RVAziXjDcLhE7pYqgKR2NnN+uU8LOgqJuQmGqajm8JJe81UwWWDp9FcVY2uVh81N1SuGSsdW/jweolgrH4D4pRsYZ3/9ysGh4hItnqDP0G3QvOvtZEB0Pwsgzq9GMh+bPAggrCe4nhskSG/G2Ub6s0PxQc2P5HOSfLB5Row5XZ3jzojJFTqtGAAGxbOF1toGzf1ubMJTBWPS82IZm3sbayknE41aDz5Mp96CD++Ed8KfWKqNdxCqMdpYJ2ZmqlttUfFg1uMMH/iPXpC85BlAcQKz+Vdv0IBjLeIO4FKrmi0o/woECzh5abu0CBQXwYl8Wr41LLyXUp8ERCi+Gf76zoKS2GHdm1NsXhrG5UCYArtIbtAw4zJmeaqmWxYv76S70fx0prv85NoaZ4/onDiGLd2ALLfbO3qibTidF/cVI/5+pnqmmWqZoIknqNk5qxPbOOG+9Dkdaoi4g6yKVWrpukeRFmys/GIZXyMUd4Y0ZdEAX/TlfLWfEsGLHBcqAHICr3RpIkB5iu5Z0=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(3023799003)(11063799003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tFbN6hQmRmYbuW99XMoTUeluVpplU7lVbUjGosBVoCLEF1uR1/eM370NIHX1opgQxmC4FFGN2z9iTgN7YAKjJMlEvGhuf3Vpp07GGJvCUAlCLWeI2Tn+tqHK5EZyMbXTeqKffGsBYM53qBiIdRLqIroKC2Kg9FgjzLF0Dy9gcHOVKoQRtrJYLJFE94JhtCF+SXoqQ6Gy8ZgSeSz9TlX2jmd77Lizbc60z99cMjhUPR9lu/FvSLP9NNOOngn/+AWwATkul4kgl3PX3+3LuusaWiPHrZT3Nesi+Jy6q+5jZJLMd6uk4v2llk2NH9temiuoLbLeDIQbw5r/WKEYGPBqoClSYB/49lAdBHFYbdx827vceAl9YqdyJsvsat46gyCsJHHJ8buBJ4nQOR+BLdGOHyJELWvOz/28bbvf/5YyMsCwutnpVjJ84GfCMbzlz8+X
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 12:43:25.9829
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd1c50c9-b8e1-471b-3801-08deb4db0e1d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9825

Extend the Tegra264 MC dt-bindings header and tegra264_mc_clients[]
table to cover the full set of memory clients exposed by the SoC.

---
v1[1] -> v2:
 - patch 1 (new): skip ICC requests if no .bpmp_id or .type.
 - patch 2 (new): split dt-bindings into a separate patch.
 - patch 3: update commit message to reflect entries sorted by SID
   override/security register offsets (same as previous SoCs).

Sumit Gupta (3):
  memory: tegra264: Skip clients without bpmp_id or type
  dt-bindings: memory: tegra264: Add full set of MC client IDs
  memory: tegra264: Add full set of MC clients

 drivers/memory/tegra/tegra264.c              | 568 +++++++++++++++++--
 include/dt-bindings/memory/nvidia,tegra264.h | 287 ++++++++++
 2 files changed, 823 insertions(+), 32 deletions(-)

[1] https://lore.kernel.org/lkml/20260515171911.1929868-1-sumitg@nvidia.com/

-- 
2.34.1

