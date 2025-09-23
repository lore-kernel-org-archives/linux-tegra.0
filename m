Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010041.outbound.protection.outlook.com [52.101.193.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF221B043F;
	Tue, 23 Sep 2025 00:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758586869; cv=fail; b=A9lFbl4GCRpED+XTcAJDXHYvW/FAdLaMj2g3cf4ZjpkTfKOlXE+4zrUtu9tLMfKJEYMGv15KAP7v5qnsGIrVV4jjqF3QsUWLRkKAQUo5Z4FwvnuFyrpDJac17cUaaf+T2qO4Q1qn71Gj6GM28wyUP4k1cRlPMyhJNJSUsJ3MMBI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758586869; c=relaxed/simple;
	bh=olW64GnHK4PiOfirs8Vqkkenz4oQLe2D68Zj0HYE+oA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dnDBoq0QdAunONKAGvfTZydAzjEjhIZO4gavNicxA9aEueqsu/f9q7y/5XjFw1+R5dVCbVqWNiwxhur8ZY3SOeCXGPuQw8uE7ez5hD4BddazY16PXFAdSaaQTj2zt71U9v2x2moO6UFAEC/0k8Eq821Uxnopu194UFPSSKqf7AU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Q51yckDt; arc=fail smtp.client-ip=52.101.193.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Q51yckDt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qgp2uxmoQGayshev1e6IbKiSdo0kkZhMAFvvgnLDKkj+gFTEGh8TlQWkHvcnvo29tuuT2yL5P/ykcOZbFBLtKBHWCOnXAu+gkxjrGNE4GSyO3L8f4GtSfhtgZXCqoeqN1DM+QgEOIldtw2e2E8IlPnco1o/gHqlDS6bTAMZtP8d9VnGyv+ZohDr+jPKBg9BdSzFOdZfWrGwLASvmk3JuutWvH6ZECbyhSZi6U3Rj7+ztwv/QhZ+INMCDbr2+bJoDVuVxOfv5rCr3MI50WLLegwbhfEoc5JDV45IqAZkiSGmXiq0vW8To4zxsYa1xTYt3isZAAdcFKvHP6AR71iyg5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YVimihoCxRxN/GwZo219mpra1mQZFjsANtWU5eUjW74=;
 b=komzUlCSGOSPx5JuHfC4UeH32vIMpvTQMhD9mLLzXVAkES+2h+6Hu+gFwOUQPUqfFpukZJd2Gb91cC7r3xjeECllAdOwTz++djW+v7LmIg19hSlpi7/NSQyz6JC4xZMu378CqUQQbwPIUbZknJk7qKV52E97NYThyZUS6KboHo/Sr4UOPXDiT/cqMHUP699X5X3WxsxdvXeO+DXNwFBf4xIg5LUBHpUnVBkf/r8CdzUdkeWQGgeEhaGcRJdb9RueDmdDk+QacJC/vFwubvpiWMzmlGGubwUXZL+1+46qdu3PxdRNQjD7mZyG21sKHJ66u8V3rAPgxjkr2DPoxAWW7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YVimihoCxRxN/GwZo219mpra1mQZFjsANtWU5eUjW74=;
 b=Q51yckDtDdTzaUC9QM56kzY0eAW81KQpx7PYwXP/Vd4nyxS8j9QVxHfHVSnD7Cte1lvutnKbk2E46HpZBioCI9lYqe6zW/yrqw8Grq0BtGntY2DIpUgvRdvRjB+9zBK+hzGLSIysgCP7/i1g0ffWtTSVrgKYx1V0f/SyfYM+2Zh4t+lZE9vO3TWGaYLaiTRgR/2OA/0FvwAwYihDNGHdNxC8FpoPaibrOUU8de1cVQ33rOwhYNVlGqP9Z+bJLIZ4LhlUnRuvd9xYMq3RgrjEaK2VW1IczbIvF9YRZ0mcz2VvXcfDRdB7Z0SRmtnBkTAGPB3oqhORoTh6Hhv5sVXMmA==
Received: from BLAPR03CA0002.namprd03.prod.outlook.com (2603:10b6:208:32b::7)
 by SA5PPF7F0CA3746.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8d1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 00:21:03 +0000
Received: from BL02EPF00021F6A.namprd02.prod.outlook.com
 (2603:10b6:208:32b:cafe::a1) by BLAPR03CA0002.outlook.office365.com
 (2603:10b6:208:32b::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.20 via Frontend Transport; Tue,
 23 Sep 2025 00:21:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF00021F6A.mail.protection.outlook.com (10.167.249.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Tue, 23 Sep 2025 00:21:02 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 22 Sep
 2025 17:20:44 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 22 Sep
 2025 17:20:44 -0700
Received: from build-bwicaksono-focal-20250829.internal (10.127.8.12) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Mon, 22 Sep 2025 17:20:44 -0700
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <ilkka@os.amperecomputing.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <suzuki.poulose@arm.com>,
	<mark.rutland@arm.com>, <treding@nvidia.com>, <jonathanh@nvidia.com>,
	<vsethi@nvidia.com>, <rwiley@nvidia.com>, <sdonthineni@nvidia.com>, "Besar
 Wicaksono" <bwicaksono@nvidia.com>
Subject: [PATCH v2 2/5] perf/arm_cspmu: Add callback to reset filter config
Date: Tue, 23 Sep 2025 00:18:37 +0000
Message-ID: <20250923001840.1586078-3-bwicaksono@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250923001840.1586078-1-bwicaksono@nvidia.com>
References: <20250923001840.1586078-1-bwicaksono@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6A:EE_|SA5PPF7F0CA3746:EE_
X-MS-Office365-Filtering-Correlation-Id: 16ebe464-9f06-4704-e24b-08ddfa37145a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Hm6nBofA47R4k4uT6UbmFzdzYsjs5corT6DuWrBgbeVIOhmA7upNyLV7djXp?=
 =?us-ascii?Q?oaQf2GUMaI7i/CAgq18lMzEb/v6Qk9pccTwgazCO4finaXLVo2/mYL5c8lAe?=
 =?us-ascii?Q?156qpIYjepZuUeTzeb0nW4PsU/Ne0sNd5/re/cPPtw5y3aUSGI/3WbLMIOBj?=
 =?us-ascii?Q?OhgUV6mNJA8aeo8oGzwWWc6n6sd28O051mEjVA8IuRivuxqrAniu/ou2g7+t?=
 =?us-ascii?Q?QrCZOTfwPyOgxkf3qdLKPHR6XkhbDRfSMBY/rWyQGcNqmB1j0x4DVvvr+DJA?=
 =?us-ascii?Q?Pv3ouwTul4XM8SAsYHpdRtJjr1vPXH7t1ZVhphoiZ5/tkz9BLD62JK//1TA5?=
 =?us-ascii?Q?4fwyrwjjFa4l85AIoj2s2no9vXlZ3tcWH3tsU57azF0lqSK5JMjMhxY0W4QW?=
 =?us-ascii?Q?eMKKMN+BtJ5E8NWozUI506AwcWOpnBoQsDTbXViXR51RYXBEma7PPWhE00mO?=
 =?us-ascii?Q?yWfZSdldej7yi2WhjBcja8RCodvuc/I79QExi3opcM3Rl2cgYvn5LRRMJJ61?=
 =?us-ascii?Q?OOlR2yJ3Mi+0vFl/2siWnCNY2NB2sp6mcDrJPPNLsjaxr3FAhZbipPORoKTw?=
 =?us-ascii?Q?VBqwrOn70nSFAb7R2y4UmxjnoB6VxT7TiPjV7nvJqmOUZMEJEogupFol+ZFV?=
 =?us-ascii?Q?6cmm4dPB+ZDEASvuFDk2qdciY1MRXo93wUiWO53EDHNDertwLSvNN1NBffQ1?=
 =?us-ascii?Q?qPqdF8KEIiYKYWOjtrScfCL/ovesLMupHLOuDo41EH6BqaBiOn0P2IY04rSo?=
 =?us-ascii?Q?Gbd8NusSD3nje+tulTvzz7eid1b/tIIU8TYXfslPVfQRL2WNRGdqd5/NxkDK?=
 =?us-ascii?Q?YBNidN0GaIj681QVGZf6wWgMDujCD1ghu3BHx7aiPeBAGOqN7B+lE3lPWJmr?=
 =?us-ascii?Q?r81PrepCcz5mgSppnLqfDw8//bmwILN0+dNPZ+6rGAQtkekrfyG5x/VEegzv?=
 =?us-ascii?Q?ELAgDYXvxJpQS4NGdMUftfn1S0cmliPcvBdtpatAJnyH0B7v8ZBHL+SVCXJ1?=
 =?us-ascii?Q?+yV38I+pU5T4T2nbfPLL1+3M47bm3wIOv30qxlnwEBk+vhqtyTIeU/lxPtdN?=
 =?us-ascii?Q?VqpwMwHZf/FjCAwZRKqA9PLqpz4zocgtTVyak0mneYA+aSw7TNjqjC0qaFrw?=
 =?us-ascii?Q?zYrnIvqsT9+0z0s7rUkJa03zxEoOUnLWyYA50IFXSXSfpnadfBVuEP2nv9tq?=
 =?us-ascii?Q?uaSl2ZnfRFFhjSEavg0jdMU4JBRyY0cRdtLA1w8FaDVMI8acyD8wdS13ZRhy?=
 =?us-ascii?Q?NPrkgsdsX0m1Rx7bbZkXjvbmdZjExa1ynEg1cS//tt4lOA0g30eltFiMTzzW?=
 =?us-ascii?Q?1hDmGnSL1CO1+hAR2f4RrXNWaS0I8Crq6MJS1uEe8xRhqDmdNwc8pBhTxoFR?=
 =?us-ascii?Q?MG0cnEKPlVzU+AaI3Cmvde2/0urr3GhwaDtS8dB2j+4G0aTWRjEPZXHAHzx/?=
 =?us-ascii?Q?YgkgbZ1N9Io8bBj1Xiq7ogFJbQFWrP3vI1obo8NKqYE3Iba95px4qF+vjMta?=
 =?us-ascii?Q?l/v0pXcRbamSJaRRTro1wL6jPpoSWOD02sO3?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 00:21:02.6270
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16ebe464-9f06-4704-e24b-08ddfa37145a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF7F0CA3746

Implementer may need to reset a filter config when
stopping a counter, thus adding a callback for this.

Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
---
 drivers/perf/arm_cspmu/arm_cspmu.c | 4 ++++
 drivers/perf/arm_cspmu/arm_cspmu.h | 4 +++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/arm_cspmu/arm_cspmu.c b/drivers/perf/arm_cspmu/arm_cspmu.c
index 75b2d80f783e..43770c8ecd14 100644
--- a/drivers/perf/arm_cspmu/arm_cspmu.c
+++ b/drivers/perf/arm_cspmu/arm_cspmu.c
@@ -815,6 +815,10 @@ static void arm_cspmu_stop(struct perf_event *event, int pmu_flags)
 		return;
 
 	arm_cspmu_disable_counter(cspmu, hwc->idx);
+
+	if (cspmu->impl.ops.reset_ev_filter)
+		cspmu->impl.ops.reset_ev_filter(cspmu, event);
+
 	arm_cspmu_event_update(event);
 
 	hwc->state |= PERF_HES_STOPPED | PERF_HES_UPTODATE;
diff --git a/drivers/perf/arm_cspmu/arm_cspmu.h b/drivers/perf/arm_cspmu/arm_cspmu.h
index 9c5f11f98acd..21d7e6e2f2da 100644
--- a/drivers/perf/arm_cspmu/arm_cspmu.h
+++ b/drivers/perf/arm_cspmu/arm_cspmu.h
@@ -153,11 +153,13 @@ struct arm_cspmu_impl_ops {
 	bool (*is_cycle_counter_event)(const struct perf_event *event);
 	/* Decode event type/id from configs */
 	u32 (*event_type)(const struct perf_event *event);
-	/* Set event filters */
+	/* Set/reset event filters */
 	void (*set_cc_filter)(struct arm_cspmu *cspmu,
 			      const struct perf_event *event);
 	void (*set_ev_filter)(struct arm_cspmu *cspmu,
 			      const struct perf_event *event);
+	void (*reset_ev_filter)(struct arm_cspmu *cspmu,
+				const struct perf_event *event);
 	/* Implementation specific event validation */
 	int (*validate_event)(struct arm_cspmu *cspmu,
 			      struct perf_event *event);
-- 
2.50.1

