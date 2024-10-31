Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2069.outbound.protection.outlook.com [40.107.100.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12ADB1A08B2;
	Thu, 31 Oct 2024 14:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730384524; cv=fail; b=RDDQMs+ScIMkWqyOK0NrqQl7jE9Xeh1LykWFQQpz937zgcB2aj5kDl+KCao7cdk8E9TpQpqf25QSGvZsk/4sqkn/7gLiT3i3LtiW95G1MDbcQIQ2agt6kUm103sIIurQIrg/VUPROKzHB3DU3JnAoZKPmrKUbEYkmrSrlk+KE7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730384524; c=relaxed/simple;
	bh=lG1iozlCMjw6ihZ9Lci8dnA1Hhw2lWr6hJL4/h6U9vs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GgErbFvPqM5zAy0JCmLqoJBuegUixcJzr2Bbz5wwcXUlj5BJeYwVNZUT7Vj7v8L1ON/nizUly6xm7DAaAtzjjUFUzN/vkNkd1yqJnDfrpwlLljKER0n/9mtfGzCoH9O8pY9ihuzGnMnp9dXVo2Ex+CeJfE6VIYbWaDPv8T+QCt4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LpRCCPo0; arc=fail smtp.client-ip=40.107.100.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LpRCCPo0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SrIzlRVjX3keaQ/zSs8c4lKagcDhNqd0hH+NhLPkpiWJ5uzNumRdCvKKeApITotJO1MeXeBRCdxtH2c3cel99ZCLV4LwsJr/MIyTwv4zFNZap7DeQsgPGcMJstJ+kd4V2XDDKnj4FzGRnQedYJJrV52cgd0j+Vapug/u8GQSrvIe2514iPqU08509RRyrkl9Ia46+70effz5LCbJanj1b7pXW3vHXEfsvWwlOd3hRvQEWIUzMTzYh1dhPuEXfmSfk9sEr3fthdD56y+CzZ0vp0hACLC0aBhxBdO21imjolAYzXiVf7GPuPJaOVo4LvJ6N8ufHjmQfYeVfk1YfL3Gkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aZLGvHB4l24ViWSJz016Sysgpd1lLATV6dUroaywx2g=;
 b=m5fJ0LS20efKuGswGYf52HzYaPbEQsUtsiqJUUTOqCh6lcWTQJ3tVj1spu5xJnzwaJQMDL5lb6M7np09gQmZtGUVz3iI3MnMiNfOGnCs3dR6E7y5E4ztvcbdndEsfco57iMhDAemu4L0JcQ/7ur/MPeuYPzhEdSNZ3cutwzO5N88FPuC7vvSh6rLJwbownkhYyTdsgskRUhc8mYTsbyT9SdK9S0YAXk99CpZIzBVhjFPQq0Uz4X3OgAH/gxFoi/eNOuKsCfLrcRQZ7asauO+ZNyneFYhLV45Bn3YJj/joSFNhCjsiuanYAjV9xYCHSdKSzyArxmXYRXWS0LIIjefjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aZLGvHB4l24ViWSJz016Sysgpd1lLATV6dUroaywx2g=;
 b=LpRCCPo035RFCGhjdrWa6/CECZQwlu+wiXqG1oYCOKEu/HJ3yrGDIVYyfP4gQ03bujf7lRaCAhZFfypqku81ypk8r8AC5XQ2TzUWMYxP/9odhkMIwnCG0S1n8uci3WstDRDif1bcexuhTgb7IuapotJwNpLCA0qosMMPg2d7IMgVvzyyG7nz4+842lawwKbxngrfWfpw7Q2QsXbdB0MWXNHAalNwlzoACF1Vat5LK0pLu+dWdsTs/NocQOutAMGKiYWeblm+a377xVLKIXmU8f+Hs1ue5NIJR/qK4rPCkh8Y4FHM07hRVsfWe2VR9GUep5TB2bkBZ2mGWNBJyCT61Q==
Received: from MW4PR04CA0375.namprd04.prod.outlook.com (2603:10b6:303:81::20)
 by CY5PR12MB6276.namprd12.prod.outlook.com (2603:10b6:930:f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Thu, 31 Oct
 2024 14:21:58 +0000
Received: from CH2PEPF0000013F.namprd02.prod.outlook.com
 (2603:10b6:303:81:cafe::28) by MW4PR04CA0375.outlook.office365.com
 (2603:10b6:303:81::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.23 via Frontend
 Transport; Thu, 31 Oct 2024 14:21:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF0000013F.mail.protection.outlook.com (10.167.244.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8114.16 via Frontend Transport; Thu, 31 Oct 2024 14:21:58 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 31 Oct
 2024 07:21:35 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 31 Oct
 2024 07:21:35 -0700
Received: from build-bwicaksono-20240327T112120892.internal (10.127.8.12) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.1544.4 via
 Frontend Transport; Thu, 31 Oct 2024 07:21:34 -0700
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <suzuki.poulose@arm.com>, <robin.murphy@arm.com>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <treding@nvidia.com>, <jonathanh@nvidia.com>,
	<vsethi@nvidia.com>, <rwiley@nvidia.com>, <rknight@nvidia.com>,
	<ywan@nvidia.com>, Besar Wicaksono <bwicaksono@nvidia.com>
Subject: [PATCH v2 2/4] perf: arm_cspmu: nvidia: fix sysfs path in the kernel doc
Date: Thu, 31 Oct 2024 14:21:16 +0000
Message-ID: <20241031142118.1865965-3-bwicaksono@nvidia.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241031142118.1865965-1-bwicaksono@nvidia.com>
References: <20241031142118.1865965-1-bwicaksono@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013F:EE_|CY5PR12MB6276:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fc40070-4bec-4459-1902-08dcf9b76109
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KG3qXw0CXYvb4H+Fb3y1fU19ua/F3CnsX7eVcZwH1YB6BkIK0eVmF2CnzRoG?=
 =?us-ascii?Q?YDMuYGeOM8vrYZJ0gJoQtUcuul7D62JSfQmbGSqRFwtD6SunZIQhEzdG1tsx?=
 =?us-ascii?Q?8ARH+YwqTzUMhHMzp06Mv77D40gkF2yV/FfR1VUIdpJ6o1rNZPv5tYzAl5oG?=
 =?us-ascii?Q?9SVhqU0ZtFCHLeEwpLdOH/bqrSXCR9Xk7zlTSli9sS1Hjw8whq3Z6p1JgxHM?=
 =?us-ascii?Q?vyq/h+F/aTUb6X2zpIEDpaQfBYeKF5My4y8uQkA6vWCEdj7e2OefrhkabIA7?=
 =?us-ascii?Q?N2ewl+rGc4qZj9PwiOMxAgqo6sm/7LKKAUEiLNmBtBH1E88maVrWy+5/QUwJ?=
 =?us-ascii?Q?CaVFE+rHD6xPuZGxFxW5/BY7XRq8nWBsJEMrw+Zk4Eayuagb0XmJ90NfA1Ma?=
 =?us-ascii?Q?hDR0jpTDmIje0VjO/snntdDk+ke8+4fGrkZb3k4yWOO5XFAUl8Fsma4dryNt?=
 =?us-ascii?Q?toWZPJYF/kPEnIc3PVt5p4I4xkm1LabX+7OWjsWLz7NSNY5wtpuKvmabIVtT?=
 =?us-ascii?Q?VqpQiwp8JQ1V/mIR3TmtmZYd7mXtlvPWt0xRJeUjggHT1FKtIu63EFvOe5PB?=
 =?us-ascii?Q?dL6BsdFqo4L/mbltdMVvqrX3z3RJMiX23m8ekjxcDJFJoRdwb0j9clPPfkpA?=
 =?us-ascii?Q?SUdFSCqEFuJzxmw/R5doHfJdTz8iJtFzDqnLx6/4sjZxi2Oo02g3GoSXOqqy?=
 =?us-ascii?Q?HqReZX+DenJ63HHz0oFTBz6fhAeGh23ecgUnvIz49o/5QzqneQPDcnUJQzbV?=
 =?us-ascii?Q?c+DR5VMaoAPSVHMABRaO65SttlAlaRxwI5eiIOG58f14pJvkf++KatdeVOLq?=
 =?us-ascii?Q?aR7czKfDkxmsMzGCaC9aOd3VRgO76mDkKvOqgEOa0BXWoc6LgeccH/OPx7Va?=
 =?us-ascii?Q?0dcT+N1XYlVv1dIveSx6CGHqhFq1oTxBQzr+c3D/LSGpvWu0eRChx7CiKbvE?=
 =?us-ascii?Q?WZ5fasDFUy94WQPMV0SgF0wiAJXn04I8DIKnWYFEU+g0BcfN+nJWRrIW3hHQ?=
 =?us-ascii?Q?Q6Bmj7+bftfgfd7kCjCuVmR/jcxLs9wKdog253d3DEJwbe+R8b7PzJn3t64r?=
 =?us-ascii?Q?5+aLY8F1ZdwgYw7R4i3xWuiOkRPpDK6H9zbqsXw4ziJIttkbLyAe8S4MfrrC?=
 =?us-ascii?Q?YrxBK+pLDVaIqIzrNL3S7dIj4LLDurSbcA4SKhNdDCAAw7IRQyPyrAl0zH+8?=
 =?us-ascii?Q?J/pmczmUUTbwtQc5pm7wuHya0KXe9y76bTbltCgArHVaXfsJq3SAmYPyeG4V?=
 =?us-ascii?Q?cSu7K7Ot3YbJSknYXpHBt6rOfdncxqPyDzS4HKDW79XzzYk0eqMd0kZXh8E9?=
 =?us-ascii?Q?XSR+xEBWXA/R6Wz+9DdstPG8Nb5xdGZz8354nKJON0RYrM3nq0fEyPMwTyJw?=
 =?us-ascii?Q?AshYMMCoR2nCvSgrY3UKlOFAKk1kaRyJE9fRi/dGDtJ4g3j1SQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 14:21:58.0210
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fc40070-4bec-4459-1902-08dcf9b76109
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6276

Fix typos to the sysfs path referenced by NVIDIA
uncore pmu kernel doc.

Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
---
 Documentation/admin-guide/perf/nvidia-pmu.rst | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/admin-guide/perf/nvidia-pmu.rst b/Documentation/admin-guide/perf/nvidia-pmu.rst
index 2e0d47cfe7ea..6e8ee0fcf471 100644
--- a/Documentation/admin-guide/perf/nvidia-pmu.rst
+++ b/Documentation/admin-guide/perf/nvidia-pmu.rst
@@ -34,7 +34,7 @@ strongly-ordered (SO) PCIE write traffic to local/remote memory. Please see
 traffic coverage.
 
 The events and configuration options of this PMU device are described in sysfs,
-see /sys/bus/event_sources/devices/nvidia_scf_pmu_<socket-id>.
+see /sys/bus/event_source/devices/nvidia_scf_pmu_<socket-id>.
 
 Example usage:
 
@@ -66,7 +66,7 @@ Please see :ref:`NVIDIA_Uncore_PMU_Traffic_Coverage_Section` for more info about
 the PMU traffic coverage.
 
 The events and configuration options of this PMU device are described in sysfs,
-see /sys/bus/event_sources/devices/nvidia_nvlink_c2c0_pmu_<socket-id>.
+see /sys/bus/event_source/devices/nvidia_nvlink_c2c0_pmu_<socket-id>.
 
 Example usage:
 
@@ -96,7 +96,7 @@ Please see :ref:`NVIDIA_Uncore_PMU_Traffic_Coverage_Section` for more info about
 the PMU traffic coverage.
 
 The events and configuration options of this PMU device are described in sysfs,
-see /sys/bus/event_sources/devices/nvidia_nvlink_c2c1_pmu_<socket-id>.
+see /sys/bus/event_source/devices/nvidia_nvlink_c2c1_pmu_<socket-id>.
 
 Example usage:
 
@@ -125,13 +125,13 @@ to local memory. For PCIE traffic, this PMU captures read and relaxed ordered
 for more info about the PMU traffic coverage.
 
 The events and configuration options of this PMU device are described in sysfs,
-see /sys/bus/event_sources/devices/nvidia_cnvlink_pmu_<socket-id>.
+see /sys/bus/event_source/devices/nvidia_cnvlink_pmu_<socket-id>.
 
 Each SoC socket can be connected to one or more sockets via CNVLink. The user can
 use "rem_socket" bitmap parameter to select the remote socket(s) to monitor.
 Each bit represents the socket number, e.g. "rem_socket=0xE" corresponds to
 socket 1 to 3.
-/sys/bus/event_sources/devices/nvidia_cnvlink_pmu_<socket-id>/format/rem_socket
+/sys/bus/event_source/devices/nvidia_cnvlink_pmu_<socket-id>/format/rem_socket
 shows the valid bits that can be set in the "rem_socket" parameter.
 
 The PMU can not distinguish the remote traffic initiator, therefore it does not
@@ -165,12 +165,12 @@ local/remote memory. Please see :ref:`NVIDIA_Uncore_PMU_Traffic_Coverage_Section
 for more info about the PMU traffic coverage.
 
 The events and configuration options of this PMU device are described in sysfs,
-see /sys/bus/event_sources/devices/nvidia_pcie_pmu_<socket-id>.
+see /sys/bus/event_source/devices/nvidia_pcie_pmu_<socket-id>.
 
 Each SoC socket can support multiple root ports. The user can use
 "root_port" bitmap parameter to select the port(s) to monitor, i.e.
 "root_port=0xF" corresponds to root port 0 to 3.
-/sys/bus/event_sources/devices/nvidia_pcie_pmu_<socket-id>/format/root_port
+/sys/bus/event_source/devices/nvidia_pcie_pmu_<socket-id>/format/root_port
 shows the valid bits that can be set in the "root_port" parameter.
 
 Example usage:
-- 
2.34.1

