Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2047.outbound.protection.outlook.com [40.107.94.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD592512C8;
	Wed, 16 Apr 2025 12:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744805234; cv=fail; b=f/d4MKQ+Gq2PYtXEBow02lEt6KQLeBajnnE/QTN5yT+pOquMEk+53U9oXMn7afCBLBhL8PPF42VvVwuJcQuGIhOAIvRWU18HqDT9aD8rCFdPtTOxQutpfYg8gu1wRKuy8FSh36o8H/OW4xavlweRqej5CPvqkVCMAWX/E8Jem6U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744805234; c=relaxed/simple;
	bh=mVN3xFy2wr2HIlZqT90jY89bqoYhkfGiTXp00ND/rI0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M4NgMRzzjP+k72VTdyk8Iqh44Nibwqk8FAFmgRM20BKkR0dLnQoTrhCPqP5GC48M1Bj7XH/RhilYCswb5w4KowHZtnhEduv7mrH96Q3COsGl0uTRO7HleYJ5UCjcvPNWP5/UxZWjfnUGFwKBoXvUEOXYSvUc4AG/ls7yMbFs4bA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sWwaNgtu; arc=fail smtp.client-ip=40.107.94.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sWwaNgtu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f7/d2LO2SJrWPgEX+bsN5dgiOUyFBsadmrkwYtYFd3jwMJ1HRyRloe9Ca1dj9i4X31e1XFYGzZZr+vvfzbHB72K8qpUcwhRU16jXRsHA+BNzGnovq/42uHcMLIWn1RAPp/SSG5PCavcdvHu10V17mEcwPeIuDifOfvd/I2faWsd9E304HpQkenexyiVMrMlb7aIq9+NqvMh3ejWZq0rCkli/pe1paFZXVakYYW3BuTLE1GSh4BR0SjYOA5ppkN8eZ5EAo2gns5Filn0A4Frag7//ozT/gVo4j/SyZ42zuY16CDu5vu0AKA+lqhgJQpK+e7bhqnskYY4kHtLTnJKGRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TRyzz4izruCdOxFCd5vMAAOErX9KNvu7n+9KSAYkOdk=;
 b=ULXYfI1JF70VrIPRxtch1V+w6A7V4wRqJXBusT5BpdQp/3+Sk2igI7hTHMiZyky1NxHvhdkcIvG1rILZQi8hlbWwq8wkmA8GVndciNOHM8bwTzg7opskDmWzyMtB7mhLcrTDuM6QxJIpuOvsqaP1H9x7lbMKKOkMlJQoyL5Sqxx3MfqZxOa6gUUs0W5QWMmbFm43h4CJyLh7OwQGMTFc8vW8BzZPEJuWXB8Avvke1km/ZpPDIQXwV5L+BxcD4WVo2xDbwzdZ6ACTB0lRrp9bFLlUNwKXANbTuh8wqgWf/q+IPSv7bxkVK8ImjFZ/8F5Ow2Oxc8lwY62pL3Ia1BjR1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TRyzz4izruCdOxFCd5vMAAOErX9KNvu7n+9KSAYkOdk=;
 b=sWwaNgtu1BkogvL94Yzs3UswTA5fgdoOQaClHfxWHKp7L1p0ZiaMaZsnRhtWR5Ii5pFmcyc5CWfjGCIS3Cwte4Zb6V3+9mgibjpFWwBbRnU2+/33MeoUpikVEaZOf062vMmyLXYfUJ+BdqqPxwH753D5biZuvMTOiVl85RkOUSJ92wl/oihV4gwYNuUnjAK1CnQ1Zr0D/88RypN4VKhzTe2kWa3kCkDbtEJ1vT7MgTi7iJOXxUpTfWUS/fAsxxnyzPfIeDzTnb/e2xx2giASMjcHtoutg9bNffhD5oE6jyj4qdCOyNRFLpp0+TtPwrA5tK+0tQKNh7dkvGheUdM1UQ==
Received: from BN9PR03CA0240.namprd03.prod.outlook.com (2603:10b6:408:f8::35)
 by SJ0PR12MB6880.namprd12.prod.outlook.com (2603:10b6:a03:485::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Wed, 16 Apr
 2025 12:07:04 +0000
Received: from BN2PEPF000044A4.namprd02.prod.outlook.com
 (2603:10b6:408:f8:cafe::4a) by BN9PR03CA0240.outlook.office365.com
 (2603:10b6:408:f8::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.18 via Frontend Transport; Wed,
 16 Apr 2025 12:07:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000044A4.mail.protection.outlook.com (10.167.243.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Wed, 16 Apr 2025 12:07:03 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 16 Apr
 2025 05:06:41 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 16 Apr
 2025 05:06:40 -0700
Received: from build-shgarg-focal-20241118.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Wed, 16 Apr 2025 05:06:39 -0700
From: Shubhi Garg <shgarg@nvidia.com>
To: <lee@kernel.org>, <alexandre.belloni@bootlin.com>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>
CC: <shgarg@nvidia.com>
Subject: [PATCH 5/5] arm64: defconfig: enable NVIDIA VRS PSEQ
Date: Wed, 16 Apr 2025 12:06:19 +0000
Message-ID: <20250416120619.483793-6-shgarg@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250416120619.483793-1-shgarg@nvidia.com>
References: <20250416120619.483793-1-shgarg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A4:EE_|SJ0PR12MB6880:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e726afd-42b1-4ae1-1244-08dd7cdf339a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DTCS3qAnkRXy7+VxNHiOxhhIifk4Kg3nc+ZeZ3aL8db2n8AC/qLE8Gb1tbMR?=
 =?us-ascii?Q?Qc+/pKE2sZe+YhQPHqtqJRa1Dyt5+FaGvHvsvUebv7Qnw0DW3kd0JnzWsNpu?=
 =?us-ascii?Q?3m3JgBerbmc3HtUDtVWxvYdulGuE7GYEfyNkGcZN02ijuUHs8mDcsHLkV60U?=
 =?us-ascii?Q?e5IptgjWekJL5+GRKRrzV41ZhPMxhs4wCcjwit537EbvtpMIbYrKMVO9qnU0?=
 =?us-ascii?Q?1eJjiXdZCb6l4nyPTrDKGv0jHDpy18u+QFevcftoEcxY9tqIE1rMfuAKnoAx?=
 =?us-ascii?Q?GDoZilrmFUo3j7Zt5VO+rXqs+aKD6eG3MjNjBnKVHR4IKgEcKOoapAmXyPHN?=
 =?us-ascii?Q?BmiodGu+FMz5jknPVh/nCuEDpii06B0TlyA8gv3Y8dHsSbuElTH1LaKBOD9e?=
 =?us-ascii?Q?4w+dKhKu6LymjQLuf6TxDQDXQ5wi7d5qtI32x6YQRTzaxBMiqN4AsCDajdyc?=
 =?us-ascii?Q?Wd6PRj/tIxUeydsq7eFplsFnjeOHj0Vr1lp9R/D5CEHXWmrGs/LoZ/DjUsIB?=
 =?us-ascii?Q?I0ESAoup8ueaD3/QZ6ZDLzBLpZjKk0JTRezmlpynz2MtFG+2Ylcyr4ILg7Yb?=
 =?us-ascii?Q?J0u1MOpvvrdBlmj38GKlrxVwPCz8u+2lSI6mdMDhptkJ7k8PDpwsThfgqvQN?=
 =?us-ascii?Q?urJkLA2V98GtrBnA8io2b71YS+zUv+mX+kQVmtm9C08mIayaM3P7VvVf7iZ7?=
 =?us-ascii?Q?YqrsI/+Bx4E+dthWq4Dy6DfNKpdb6m4IpPsJWtkdCoY58eXIKRbLix646s7X?=
 =?us-ascii?Q?aAXYvBlDCGpZi8Nr8wU/G5YU7wc5cyRXd5NrxG5n+viFcWZDWtMI1X645bZX?=
 =?us-ascii?Q?8zWVJ4g6kqdh+Ga/TX35b0Kitu/+P7fxfXlhWp/MEG/+5XfzvBN1X9z6FYLI?=
 =?us-ascii?Q?ncDC2/gp51Y2oPgXcqH3AP9WAlhylqkYPH5/4z3ShgUik+UIagdirxgIJ5J+?=
 =?us-ascii?Q?ovpN3FTef3DVusRL+mF0JrjmAln0AcSGwKKhHk5TCkb/4oieHonpRwZHVHTr?=
 =?us-ascii?Q?f8LFIAoeABaIY7n9WzyHhwNHMg6vguqF9nwHgUcz7t/kHlQCoqvV3AgnI4Sp?=
 =?us-ascii?Q?VJEXTTcd6qZFTYpvt5rVOoAJDBV+NHLx1oIEgPG3mbPWxqDkBmotFOqsdu0l?=
 =?us-ascii?Q?Lx6uaTKNao+2VuuAbmSnO7ANb87h7qzixd4B2RJdRbFFSnpml4r0uGSpAqb6?=
 =?us-ascii?Q?OO6HklpsiqNvb7iFJlk/e5rne0KJP02buL4akpW7EiUVhuDDd15Z6RvD+b0B?=
 =?us-ascii?Q?LUWa5TepF6yVRhvGap6WyNQuI20p4Kp8pO8g6FTFsvDUetD4/30Ax8vuK8EU?=
 =?us-ascii?Q?IER+23jv7Nrnce7P8Virpg8vnqSlKTvuaFIkYckuoN48Gjd1GmKx0S8Iz33a?=
 =?us-ascii?Q?gDQOzQ+ddlLEtSuP7DJr3rLlTuOuVOYAXuEPtRLoNDAq4SLIE5m5tbQC07k+?=
 =?us-ascii?Q?lbCdhu63q0Nt835jEyE3gmzfy+E378NlZKfbTXKNPbOB43tMw1AJvOahbzJl?=
 =?us-ascii?Q?84P8RJuL36/qF6A+WxTmwJN7KU5P7/rlUIlo?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 12:07:03.9733
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e726afd-42b1-4ae1-1244-08dd7cdf339a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6880

Enable NVIDIA VRS (Voltage Regulator Specification) power sequencer
device modules. NVIDIA VRS PSEQ controls ON/OFF and suspend/resume
power sequencing of system power rails on Tegra234 SoC. This device
also provides 32kHz RTC support with backup battery for system timing.

Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5c85e5da152f..9c6cba664a43 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -780,6 +780,8 @@ CONFIG_MFD_TPS6594_I2C=m
 CONFIG_MFD_ROHM_BD718XX=y
 CONFIG_MFD_WCD934X=m
 CONFIG_MFD_KHADAS_MCU=m
+CONFIG_MFD_NVVRS_PSEQ=m
+CONFIG_RTC_DRV_NVVRS_PSEQ=m
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_REGULATOR_AXP20X=y
 CONFIG_REGULATOR_BD718XX=y
-- 
2.25.1

