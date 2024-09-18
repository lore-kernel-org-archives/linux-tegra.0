Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2070.outbound.protection.outlook.com [40.107.243.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB3F6FB6;
	Wed, 18 Sep 2024 21:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726696795; cv=fail; b=djLbf2w1lkrL1otJOgYnpMhUDGpoj6llLHdRRsO+WqHqFFlWCN6X6WIaplZpVU2KIc/AnvrEsEgLrd9BOkVe39e6vrP9u09iUw/gMPkFHntu1W7kNvWLqw42PvjbWlYW4TsVJaG8BJId1ZjLYP3VoI9IcUJAHHSGETj7iXJNCow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726696795; c=relaxed/simple;
	bh=YYGx/qfYBCPy5WxVrk7GPV/8h2BMdy0WiY6Ot2HipQs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=I8Ow+zHgKSt+JwTlyvP78pmFKW/dc4yKgrwRgWGgE5bagHlanaNuM1kuKCYwbMSk3p5c8I70r4XBIMKiLcRa8D7EbP/+I4jiUyE5i+4Y3ioKRvsdsuNOWBk5xX8CcR/mYDRbKYMcD18sfYAD9p9c4ozqXcF5IO3xdOvfYtSmgxU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TiMHCIVK; arc=fail smtp.client-ip=40.107.243.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TiMHCIVK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pxAC69W4IQtlSd4o7za87z5ooPABhvNA9K/OacVAgSKGZlc+mH2ltT+iYBY52EQ6JRGwxWqnqbSe2OqIGhA0ijQsrUK0g5F6o16EvaJ/MnaquNPIzEUw7YMMjJlY3Lub8nO0pcWgvzpF2eOkcjML04aTi7UKR6qp/vDDqWvv8ZNu1YKixOFje4Tmi1R2X4ptp2v4Ut1vjtlqxP63cCLwmx5z6ls7vDcCkyp6u09AqfbJS5a9fa7DcmIl88TPPNmlVRMYewZkA+KsoZoppcz1PyBQJ69DvmPgHXxmRKuUVxv6seSBvdSQJKK2q3mDA3hwt+wUSpuPNsbW3mgT4nmO8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xrKEgEmdszQ4YswZzd4bSgnmKKrlpMlIRIshEDVvg0Y=;
 b=p696ztJ8N+7Ljoskv1DO4EBQqw5Q6oUhSScwE3UlSuqyLE6TaKcNvzPMJnUJQYfRidxutVhaavDLwpV8TNXICK907ss6n4/9OLssBsgZZS6/B+NVkDHB/wamtaiKoSClI2sCjaMJx0q5j4+2m2/1ZMAGhlgrNSJRYv4UtISiQIveXjtgokpkwUefWW+1gubP9kxzKVwTvo0nmlQZTphbuDGs4TlUQbh9nyW5aB0bzNtxVlQOlzYbMkL5uR582fqTWomCNh+c8ai37teU8m3HQ2qmQ98r7RuBBM37w8uBMIjNpPWSZtuMDBZB20K0nj37tjsS/zmCHHuH/vS8+L2Q5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xrKEgEmdszQ4YswZzd4bSgnmKKrlpMlIRIshEDVvg0Y=;
 b=TiMHCIVKGCfb2s+uYuG2jNTRArWaxRW5ycquAl/eDdy8D6DlHYa/Fmg0JoJcAJvbJiZ36OIK4pPhmShWl7GQLZVE1PKpuHAqEI/lJunmh1V6qAOTODJa6WmDPeIIKbD7Kmos35KuAprjb2bf99yMABmsnwErD15Wa1qhmmi1eSRLCccGrUCH60GECxhj7RLsbn09DbZNfjMI5xHCjAJPSublAPiCZOKBpbVwQSg51A1MDRwlkJ0fUEnKOVpjmsm3X1OL9dOnXvy0K9SWl1bkOqhENm/lfyWnhLQvORrMaaAh9+wyUFDLK75UZGzTQ167zspVrGrv2jKVe9ckBaCSnw==
Received: from CH5P222CA0013.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::14)
 by DM6PR12MB4338.namprd12.prod.outlook.com (2603:10b6:5:2a2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.25; Wed, 18 Sep
 2024 21:59:50 +0000
Received: from CH3PEPF0000000A.namprd04.prod.outlook.com
 (2603:10b6:610:1ee:cafe::ee) by CH5P222CA0013.outlook.office365.com
 (2603:10b6:610:1ee::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.30 via Frontend
 Transport; Wed, 18 Sep 2024 21:59:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CH3PEPF0000000A.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.13 via Frontend Transport; Wed, 18 Sep 2024 21:59:50 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 18 Sep
 2024 14:59:44 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Wed, 18 Sep 2024 14:59:43 -0700
Received: from build-bwicaksono-20240327T112120892.internal (10.127.8.12) by
 mail.nvidia.com (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.4
 via Frontend Transport; Wed, 18 Sep 2024 14:59:43 -0700
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <suzuki.poulose@arm.com>, <robin.murphy@arm.com>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <treding@nvidia.com>, <jonathanh@nvidia.com>,
	<vsethi@nvidia.com>, <rwiley@nvidia.com>, <rknight@nvidia.com>, "Besar
 Wicaksono" <bwicaksono@nvidia.com>
Subject: [PATCH 0/3] perf: arm_cspmu: nvidia: update event list and filter
Date: Wed, 18 Sep 2024 21:58:43 +0000
Message-ID: <20240918215846.1424282-1-bwicaksono@nvidia.com>
X-Mailer: git-send-email 2.46.1
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000A:EE_|DM6PR12MB4338:EE_
X-MS-Office365-Filtering-Correlation-Id: d47c47dc-171d-4040-955f-08dcd82d3817
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?060ngikBBaqpOr/bp3xgHIF4IZ/Y+CRzhyQvjSKuCwsX0sc5UtOzgrhdXuN3?=
 =?us-ascii?Q?dNQNZzUI9xTRF2MGi+QkV66QjSU9ATPy6zSbkKYOScEyTO/1vCD2ptNR+S+Y?=
 =?us-ascii?Q?gi6x6WaqvmhoT9VUmZAwCodJb8aip57Fy4WPviSbQ6DE5iJMoSy1o7CTMamr?=
 =?us-ascii?Q?6wrbD4kMA8LcdQeUjKKb9gC6/wxlVMBjrqb0a67sssJXnlTGN6IOVftS0cSO?=
 =?us-ascii?Q?Ti4e8Hsxd1J0FdlF26fSQm/L22KZmmIUT5yp/YhdSgxkudTZZKQk2/CQchzZ?=
 =?us-ascii?Q?KUR9DVPpD19U2Rtqg+G8y/DxxiMZf/LuVXBjSZOEvWDQIDYABAGZ0X0qIOdZ?=
 =?us-ascii?Q?OyVNevR1r5Az5NjL37/DeXkC9oII6pazMrzmasA2hBkCHyCDHSQI0qANaTtk?=
 =?us-ascii?Q?a22VkTe36zcfZGjbIo4ZljQEj4JBYhO4E7An2FjNCTdTNRGMnfYOknEpoZKx?=
 =?us-ascii?Q?XIXHx0dxAlIZ0AoQwtsrm0lfik+I8lLNFTdTAAJrXfkg4Hy85rw5X7h3EOvw?=
 =?us-ascii?Q?CY1etekrDkn4xL87oOI8FYkEEHWur6AC0k98KYDz3rd1Tb8h7AmaYqIvvd3k?=
 =?us-ascii?Q?TbMEgXMxgHgNwPNN2zG0JdF8PUdN5cduXPmGDCHM7dqCmXptKiQSv6uP2P+w?=
 =?us-ascii?Q?kuLGgddBQrJthRjwGFybBw2Et/Tc86kAFb0pGYexieRu0lBnc7K5RJYhIJ4O?=
 =?us-ascii?Q?asg9idQVmSt3PxguV/gAeS1cdFISIYiieLbC6p1J6XWXI0Bqp64lhm/arAO6?=
 =?us-ascii?Q?sYt8s0uXTD0k2bKGz5T5m2cFI/8KOGSWMpiVz+yR4otKv60ARn3xh7FJR6p1?=
 =?us-ascii?Q?gILI/lKeLbZxPAASLoFpQ3fe1LshHBhKqrVwYdOzH2os2h5xVoE5gMJm0Fer?=
 =?us-ascii?Q?UWyvaRR4GyteuKjbEdU2FIbRioqpEkMBcTkKLzYlDo1A40xtV8xu4p4supDu?=
 =?us-ascii?Q?kd6hHd+20lRJJvhv7V6e5kkJoYTdH97fxoZuREUnZxDpsuqq5sN4M4dsV2Xh?=
 =?us-ascii?Q?ge5NvG7l5wGw+MCcfzMRUo1OcvcanBFcQqR4bZDh5qRz7BEc7QftfFnMrH71?=
 =?us-ascii?Q?Mqmx6Ret53jMU5muhKTynYWdyJcMiLB57DarkjYNJrICfMUi6qjnkopU+7e1?=
 =?us-ascii?Q?qO7Pd8eajZl2ARYOemdwz86jkboqX7SjobMBTZCPB4CW9IQ46YuSQzXAcGMR?=
 =?us-ascii?Q?0uOc2ljk/qtR8kxEkhhYooEjWKUWxGqwpXkJmmN8twG1z3cN8kIoqf+yFc4H?=
 =?us-ascii?Q?u5QHnaJFaMhlVMYtvxF22osqH73p+/N2bL69y6EEO5JdsuOsBctjhNA0ypHs?=
 =?us-ascii?Q?r3dLs9HGlyeOy7TF3Ysi/OOD/31WwxMrCLJitB5D1nQjZD18oE6PMqFdI5at?=
 =?us-ascii?Q?q3kBSClHlvanRkjQ6zE13el5V1mO3TUqvHbVbOLEilqAQUBjaG3pBltuzCkG?=
 =?us-ascii?Q?4tKVZ1oQZ+MXvhs4XAt0C/bCg417HlkG?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 21:59:50.4402
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d47c47dc-171d-4040-955f-08dcd82d3817
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4338

This series update the list of supported events and filters in NVIDIA Grace
CoreSight PMUs.

Besar Wicaksono (3):
  perf: arm_cspmu: nvidia: remove unsupported SCF events
  perf: arm_cspmu: nvidia: update CNVLINK PMU events
  perf: arm_cspmu: nvidia: enable NVLINK-C2C port filtering

 Documentation/admin-guide/perf/nvidia-pmu.rst | 32 +++++++
 drivers/perf/arm_cspmu/nvidia_cspmu.c         | 92 +++++--------------
 2 files changed, 56 insertions(+), 68 deletions(-)


base-commit: ad618736883b8970f66af799e34007475fe33a68
-- 
2.34.1

