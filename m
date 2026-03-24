Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012036.outbound.protection.outlook.com [40.107.200.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A1E396D28;
	Tue, 24 Mar 2026 05:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774331944; cv=fail; b=DFNgvFb/BHqSBKCY+mZ1R6JJBiff9lrjto0puMHABw4ZV26a35UBHv0i8Djt5j0iLXO8Mh8OH8KQWKupeqvxaF50+8Ops5ey8u8doJtUdzdpAjiB9CdHMW4Rn1EwFap7a0cIxUYsZuJplNi6EDN9r+bMsBWixDlfIppRPqiFpuk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774331944; c=relaxed/simple;
	bh=qTC5Ih9iRZnUSr7dbir9ZRrfeaW+luZp/oLgzlV6pfw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eTt7r+yN8j/i/MfEi0qOt2V7oa3PmMiHgSZaCb4xGc2c6l5Q6YERSOUD5DFV2COOLwVyZboeMp/d/QeCHaViHJ9BolGpZz+W5KyewV4Wb5L6MmUdcAGunsSrvbNEC/Dni9nNm++YL2K7JhboeNvMCjy9zS6xgMlUvLpjEQvivEo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Im+Kuxqf; arc=fail smtp.client-ip=40.107.200.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Im+Kuxqf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EJWTMdEpkO3/SEGeWs9Opg3sYN9onLI9UqObBP9Be8anEyxq4M+4COUKBqnQiuGbgEa4G465nwECbY1AT94p61NwXqyDnBay/QfiPE02qfyEAKUQKftcT6p1hx6/536IOQ1UIaPF4qSdj3QlcjZeSZTU4DpCRQrt0lQZPJeVTaiwUIXDq4rw38IRughekS0OFpMVvjy7hjrNyJj3hgZDm5uV6a7yij18BGzQF4YPcRCxResdRXDXfqNpLHem/Ao375EsWaciWaQbAg1godvQgcqgjMNHS1v0oOPS0/ji6KJan9eG57Uf/ILjwjO3naa25XuExyY1+VIqfu4Lg5en6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ZZo/hr/hMaPEfpHwkYDuYANtZlWIDfWMax0cmGmmIU=;
 b=bUIMiSnOYQpO2BmYbPzykcq41LpIV+TAFLobJ5N42ixm3zydw0L2Jlpu7gtCoCzDp3+b8bCVUQ9LgIrW2bF/72kdCDt7vRJLFohQigpU9NnAvRPW/fjB+3FjNHUft2/ZVm/MUvqEiS5hPDfTAr57j/VEaHIJSYysFKlYGPCb9NHkWhQWu6IWW1nuI3VH/C9TJn8wsJL046yglm2kqeni1oXWjRILIVjhJ+2gXTX0XcXHP+Mdc9xj5UlCtzbod5DrSbqxjuVicNJci4alwRGW4dTWDaQ2QlvyHpLndmOWn2ZB+ExfUg82ocpkhFiU4P2Xt2CLEasnT1erPLg6MC2RxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ZZo/hr/hMaPEfpHwkYDuYANtZlWIDfWMax0cmGmmIU=;
 b=Im+KuxqfRqTcwUdTljdxsoKvi+FrZYOuMov9sN2qShgtcd6TOM1Sv7KV/m8IYa/sZezqYgGgmxR3CRu1wTqpXs9kO4jxxfG9UYQaFdJ/Sp8FmAvnXq4IvGEdHEieVKX1kTdAsjv6wDFQEkvbH6zysdxmAqcPbYayFd99gDMjxbWNrieT7Z5XsUvdg2VQIFd4dcrhUWRDtfln6Sq3qK2NvnDGfGa8ZLO4LvUrehJvaGGpfJLT5HzjRmfdClGwc+FdX+e5svnJfjX3GPjRHGGjWby7EPXZPabrtF2pJ50i8ITSYSVz1whwbptdhiifK46zudRIrH5wXpBo+Z+czsZBwg==
Received: from BYAPR06CA0028.namprd06.prod.outlook.com (2603:10b6:a03:d4::41)
 by IA1PR12MB9531.namprd12.prod.outlook.com (2603:10b6:208:596::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Tue, 24 Mar
 2026 05:59:00 +0000
Received: from SJ1PEPF000026C5.namprd04.prod.outlook.com
 (2603:10b6:a03:d4:cafe::a6) by BYAPR06CA0028.outlook.office365.com
 (2603:10b6:a03:d4::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Tue,
 24 Mar 2026 05:58:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF000026C5.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Tue, 24 Mar 2026 05:58:59 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Mar
 2026 22:58:51 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Mar
 2026 22:58:50 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Mar 2026 22:58:47 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <ldewangan@nvidia.com>, <digetx@gmail.com>, <andi.shyti@kernel.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <akhilrajeev@nvidia.com>,
	<smangipudi@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH v10 RESEND 0/3] Add I2C support for Tegra410
Date: Tue, 24 Mar 2026 11:28:40 +0530
Message-ID: <20260324055843.549808-1-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C5:EE_|IA1PR12MB9531:EE_
X-MS-Office365-Filtering-Correlation-Id: b51da653-5e78-4cea-70f1-08de896a7194
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|921020|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	4sswYvEAX8EDhBfwfaPXpobs4mcC1Be3WFulN8GS1OJTl5P2DJf++yKvwzW5aB13M+oQPCsKbNYRQnXYYk6T//gCZXsFrzii4VN/WCCvsWUW5/4JI58CZdehOo1SNXE1jaOMJk/5mJgfeoPlIoQK7OXG+LJ3SYlflei4uAhEfdxuca+ek2UYpT1IyIoMe1S/Qqua5PJ2cryu60PllqBjiMM6L07OGS5zcnG4mlYsvMdv7475jJeP/lrj3o3aPORRq64W2iF5PRov+cKjOIAlNYA2u26MFH2o+TjgJzHDviwdTiOqhnRdmq1CuHeZcOeOYH7qq/s4rsnwN3wb7n2l+g/+MDA+64PUmk5cxn40j9JhGi9EZMmdrAPu2rN9oizsptmOwa5Y4+gvfpMvaSAdVn8+1PjQ2socRtLoncCRMv5AOkujWGAuHGf+xtzN6NSBy9i/okNYpt12wdALMyCx4m1B45vd2N5T1leI+0hHRHWSJJogTTVtTBOLIut3f7UcBxTJEp+hTmJ/FI74GCEDWMRwN3jEKUmbXOfLLvUEUKMzsa2ztuA3kDWUdEkjj1ZJofxzd3BX0/RYjo/wgiT3fOz/O3tClZQG2WRLCnvX/40m9Jny7Jvd9ztSvDito/ZuAvjCkApSvvlmKAfkHnWyi4/TOLcthFhilNT57tjR2+QqW4XPMPVVCW3Hp9Na/YVmz7CV3WupMslg0glIx51ScX1aJCvHCST5zYkbZTG3NZAjtguXMY6ibISG3he7dIog8iRfNwHM6nW52lJnR8/SdsKetJucb9N6OcK5yKndteFtPzkQgAig3DxpUMVNUSAo
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(921020)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gjD7iQ8WWRCF394fBzOUc/URN6loJQbVqP4gD7LQlkL32lyFFKj1zMO5n0G/t1u1YWIeshB4x8/cHZQM6RDZTaApIcDupwNIoxBLCmTNeU62O8mYX+puJKmBM6Nt5TX/tglW+vhVN31tW6E3ege0l5WuDhX5wSafwmiIWwxyqJuTxDKOetnE5oV7gbEgTUa78SAY65DdTpiCO8ac14woph4oSmvfhFtl10ySRVXrV/GJvRypGUtTdHU2fBHqrRhH4q6b6F0KyCCm5bJX6goi73BCIgSkqYA4GkcZ6bgdobR7QvZp8O6LMCdYzDogf80qgjCLAak0YXL/YJ7o4G/vOqzxOlAYORvJHLzsIyQKBl+6V8gZT7NvjGyW+S6X98SfjdoVQ4O265T/WaEa9WtlR616E/0/TDZ7qAcG1myHySqcUbugo1PHtoAmlSnU+DLM
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 05:58:59.7987
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b51da653-5e78-4cea-70f1-08de896a7194
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9531

Add support for the Tegra410 SoC, which has 4 I2C controllers. The
controllers are feature-equivalent to Tegra264; only the register
offsets differ.

Kartik Rajput (3):
  i2c: tegra: Introduce tegra_i2c_variant to identify DVC and VI
  i2c: tegra: Add logic to support different register offsets
  i2c: tegra: Add support for Tegra410

 drivers/i2c/busses/i2c-tegra.c | 534 ++++++++++++++++++++++++---------
 1 file changed, 395 insertions(+), 139 deletions(-)

-- 
2.43.0

