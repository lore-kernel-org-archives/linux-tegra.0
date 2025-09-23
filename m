Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012013.outbound.protection.outlook.com [40.107.209.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB703BB44;
	Tue, 23 Sep 2025 00:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758586861; cv=fail; b=Xh8z+87Ylz5fBMhMRU3pSDof+cyLiz691Br65AWYl8ESDUIMVi5nL9kJjK0Dbz7gck2nV4LmijAb1nPoElgJnTgFBg2Va5/Phq4LAJj1wk2rbnSkjgIh+bhXjBQcr+EKj9pd5dRwegqNqpFmJwXOEHjG5hZm855sCbPu/uHkgqY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758586861; c=relaxed/simple;
	bh=sx06/ODSZ3cAZ2C8WH3GPZtzsjHMXVCuoviZJs/risM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O/1Pb9eM0bPK2jSm5qjpoOVRPBxXn2rUhzKjwiVWaGEFVFba9SOSzkRxqSTExAGqORqui09y0vLIr716N7L/wZSDSgJulPUFjrIt+fusW73Yxw42kiSIPJDZzttwBV4nff3w/+fDSGUlA/WBc3m2uDHIFtJ+aB9TC2ThwE+YGZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HAejpxJ0; arc=fail smtp.client-ip=40.107.209.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HAejpxJ0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TOuTxAQS7dB3vVXu05qd0IxW77QFAbpwfRgJ51zU0r3ecy/EEY0SD1rcNIvflk2B0UtVtTvC3bVFTpCwOyzVVj9xIEw1EnCnGSELTXSLgTp03e5OLcXOklCi++fKHgFhwvPRkVKXfW2vdz1D5dJm0KLNzNuapn1Epw3wwOMednxjIUu2li3dme+PNT0bivdMc0Tp6nDYZaVFQqDMyKFm6uomNGffFCOU2MuaNOMdNmmF52rfZ95tjAtk3J1XDWi9Ag9KzqvhcF6PBCFEuuetntJWJ3BHd0vlQbiiu7uLbkYHcC8HiDUV9Sn2KjQT/yMagF+JEm+pxggFcjNe0NsIdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xzG+9xt5xVNGNhk4GrRNcR5iSOg5ropczvFsjCNPxKo=;
 b=bvP0+J1WRFQDvLxuwm0AAIs668Frs94PontoliaLwjGCjF7l0vPIFoxayCxJaW3Xs8E9pA5iYnvaV6QfwjmNOcOYlW2S/SKhy8MIHL+g8Gl3cSxSKvjx7vEJtAPBDPoMBxBvh1LnJgkCzmPTLvFnAUrCMTVGUYamqlH5T6SU0vYwyK57cl1A8o35VBjQJsnxEg03RvDBmPOPISi5D7SSMOh3tt+Wyr67pQIuXBj6IgCBYj2jEfqnj5D+kNhW90ReSRtmZ1hNI/kmTBDMEBiwH4l45CLo/0li6z3yp6NHK4VU+jHJEtP3mO7ztpVwnjNUTPbedf+sWp48ap1DgqdU/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xzG+9xt5xVNGNhk4GrRNcR5iSOg5ropczvFsjCNPxKo=;
 b=HAejpxJ05dvBNLwyxHG09usl9wwlidPBZuWwHQ9mHuEPkTj2IZMIEHrRmTFyo4BP0XbzeANxR85VJXNjIUykfw9qZGJ9Ba0BHlB52Ij5n0OYmw5DoZ6KUa1MAHCNeEjFcM3j5u7urtrckQvMOpDu2LuVtIpCL5v2h+hlTE6yHZyZzi/H+oTlqaBghQO8arGtGg1atgJtGGQZKye7kzwAEA3b1mwUstlf6I2weJabp/WT8OyqOXXAENcmuKGm/bTHbOXe2RERvup5l6l4WKmRPA0H46GEveRj9s+tzvQbmWcRgPC6zc2ygqUn9h+m/8cV55BMb9SV/72LZ6jLFC0r/w==
Received: from BN9PR03CA0612.namprd03.prod.outlook.com (2603:10b6:408:106::17)
 by SA1PR12MB9248.namprd12.prod.outlook.com (2603:10b6:806:3a3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 00:20:57 +0000
Received: from BL02EPF00021F6B.namprd02.prod.outlook.com
 (2603:10b6:408:106:cafe::20) by BN9PR03CA0612.outlook.office365.com
 (2603:10b6:408:106::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.20 via Frontend Transport; Tue,
 23 Sep 2025 00:20:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF00021F6B.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Tue, 23 Sep 2025 00:20:56 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 22 Sep
 2025 17:20:40 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 22 Sep
 2025 17:20:39 -0700
Received: from build-bwicaksono-focal-20250829.internal (10.127.8.12) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Mon, 22 Sep 2025 17:20:39 -0700
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <ilkka@os.amperecomputing.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <suzuki.poulose@arm.com>,
	<mark.rutland@arm.com>, <treding@nvidia.com>, <jonathanh@nvidia.com>,
	<vsethi@nvidia.com>, <rwiley@nvidia.com>, <sdonthineni@nvidia.com>, "Besar
 Wicaksono" <bwicaksono@nvidia.com>
Subject: [PATCH v2 1/5] perf/arm_cspmu: Add arm_cspmu_acpi_dev_get
Date: Tue, 23 Sep 2025 00:18:36 +0000
Message-ID: <20250923001840.1586078-2-bwicaksono@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6B:EE_|SA1PR12MB9248:EE_
X-MS-Office365-Filtering-Correlation-Id: 0be270a7-0f62-4513-b5d1-08ddfa3710dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?92NF/MA0BxF20B+tSKieN6TgvbL2FPp4fCyYmGtwTEthJjAZIG58TSx8eIjX?=
 =?us-ascii?Q?jf6y2nvS3+6/UvKme0WwsNC+rfwj0eL2t8TFfDHyXbN3pNmK3pdTY+byykrM?=
 =?us-ascii?Q?Rr3kN+7t8Wo/vokmtHTyiBo45PaG0yxsYQLve2gBOETDLaAnw6bH5vYf1cvu?=
 =?us-ascii?Q?A2Zw/rmq2Cucf7qnKoRrLLkH4FAKHX6iOW8eEQY8TIrEcXAfBKqHBY7hGKWM?=
 =?us-ascii?Q?2uewOGe8yG1OqaEiKT/WrgDhq7ODDRh9V1auW/hSJvSh5esYKEgDTJYtmBCe?=
 =?us-ascii?Q?ndurb1ulqmnnBXDnCjqXFNPj+U2hJsNgb+HgYvdC2ZJ3yhJTZCMopadSMUG1?=
 =?us-ascii?Q?IUFlh8WqwDU6McMS5JHYa0T8IEvKsmTqkgNzMciRbg81XZxp4qEChnDmEmuW?=
 =?us-ascii?Q?cIulSTscAIJoZ37yY4Bfu5I36E/xVvvYNq9Ns7SMjT+RV9XN9MyQDgQ4Waoo?=
 =?us-ascii?Q?T8Wp+g5GESlU3FnixtJWz7OxrFz7f64CnagttdjXcRt1IC1PdVDc83r3fMCe?=
 =?us-ascii?Q?OZjxHsuk5nL8IxRrtuN1+20fjKp35T6YjgVgpI5UBz1ZN6UmeYqpL6yaGeHd?=
 =?us-ascii?Q?SNTmNfzfUCeYlIeu0y09v+7f+Utc0d7icHdBfMxBkzyjYOWbI1H/j/E0g0dO?=
 =?us-ascii?Q?96+7dt9xyINa2HYz9jN9G7C9E5Fw09dFCNfv8Jm1NWmegkRWpbWhe24K4LWI?=
 =?us-ascii?Q?XzVec6LXaJHMpEFa7vCM8TN2/w/nBKEtwf3QJDFd5pCTCACg5DtGUegYa5Uc?=
 =?us-ascii?Q?ghVvaME9tu+dNgTotI69PgmFR+DhXFqRF7Db2rUSp7A+ojs+0v1XqVka1E9k?=
 =?us-ascii?Q?znU50NpyOwA499BAL3oHvrzaMzbu1WWDqrcdBPOSBxPbDtDxZhjJ9ZHUlDO/?=
 =?us-ascii?Q?0TNpfjXns4O5WCmlyQeDBxh6fsnWdWT032QvTrYVmCjR7rYEBXBbFe27gxhq?=
 =?us-ascii?Q?BlHMb1aG47Sw3MO3QkSoDvPdwJDWEG9eT7Lxn1IQBgtWlpMfPXJql13fLrFK?=
 =?us-ascii?Q?IFmGfUW7uPAeydXN+SL+ngu/e3jqNCBjzjR8O050pXKmiy6JTxoBsB8PzEhC?=
 =?us-ascii?Q?HMdiakUt9p5Ni93s081IDyHN01dvZIs0ZAhoioMTTt5JH1ryP2rdPaMPe2qc?=
 =?us-ascii?Q?0ngNxdbS6TYZtavYUOPEiel3ESWf/TSnlPDlW4/IhFLjiH5mPeRpbs12++1+?=
 =?us-ascii?Q?V4TEr/3yO9e8gZW99t2utJTASjKalLS3mSCyekocvjbokvyw+0Hf7J78djeW?=
 =?us-ascii?Q?ASTJzg1EZ6FsFRMGc3LzeKtWjkYcaber8epMdmx2UbSGLJoHPAHWMZ6v1y8r?=
 =?us-ascii?Q?ugNt9UsyXTFUKrrmcUa64VFO7kpUXSUCNlnSCp6Ot5318jLazgDAZ67fGixt?=
 =?us-ascii?Q?T1dhVJYhSKNqGLo50krso611GRotnNWnAGR4L2xyvlftPGrWKswe04/u13Nr?=
 =?us-ascii?Q?7v5B/N04vZimjtGqGGMNAL90wdVOFYJIcYyxFs2OcPrrAu//siu3+mFOrel5?=
 =?us-ascii?Q?gBTWcmjQc0o0V91OLSyNKR+Nl5ifC3Nl6Ion?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 00:20:56.7770
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0be270a7-0f62-4513-b5d1-08ddfa3710dd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9248

Add interface to get ACPI device associated with the
PMU. This ACPI device may contain additional properties
not covered by the standard properties.

Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
---
 drivers/perf/arm_cspmu/arm_cspmu.c | 22 ++++++++++++++++++++++
 drivers/perf/arm_cspmu/arm_cspmu.h |  9 +++++++++
 2 files changed, 31 insertions(+)

diff --git a/drivers/perf/arm_cspmu/arm_cspmu.c b/drivers/perf/arm_cspmu/arm_cspmu.c
index efa9b229e701..75b2d80f783e 100644
--- a/drivers/perf/arm_cspmu/arm_cspmu.c
+++ b/drivers/perf/arm_cspmu/arm_cspmu.c
@@ -1090,6 +1090,28 @@ static int arm_cspmu_acpi_get_cpus(struct arm_cspmu *cspmu)
 
 	return 0;
 }
+
+struct acpi_device *arm_cspmu_acpi_dev_get(const struct arm_cspmu *cspmu)
+{
+	char hid[16];
+	char uid[16];
+	struct acpi_device *adev;
+	const struct acpi_apmt_node *apmt_node;
+
+	apmt_node = arm_cspmu_apmt_node(cspmu->dev);
+	if (!apmt_node || apmt_node->type != ACPI_APMT_NODE_TYPE_ACPI)
+		return NULL;
+
+	memset(hid, 0, sizeof(hid));
+	memset(uid, 0, sizeof(uid));
+
+	memcpy(hid, &apmt_node->inst_primary, sizeof(apmt_node->inst_primary));
+	sprintf(uid, "%u", apmt_node->inst_secondary);
+
+	adev = acpi_dev_get_first_match_dev(hid, uid, -1);
+	return adev;
+}
+EXPORT_SYMBOL_GPL(arm_cspmu_acpi_dev_get);
 #else
 static int arm_cspmu_acpi_get_cpus(struct arm_cspmu *cspmu)
 {
diff --git a/drivers/perf/arm_cspmu/arm_cspmu.h b/drivers/perf/arm_cspmu/arm_cspmu.h
index 19684b76bd96..9c5f11f98acd 100644
--- a/drivers/perf/arm_cspmu/arm_cspmu.h
+++ b/drivers/perf/arm_cspmu/arm_cspmu.h
@@ -8,6 +8,7 @@
 #ifndef __ARM_CSPMU_H__
 #define __ARM_CSPMU_H__
 
+#include <linux/acpi.h>
 #include <linux/bitfield.h>
 #include <linux/cpumask.h>
 #include <linux/device.h>
@@ -222,4 +223,12 @@ int arm_cspmu_impl_register(const struct arm_cspmu_impl_match *impl_match);
 /* Unregister vendor backend. */
 void arm_cspmu_impl_unregister(const struct arm_cspmu_impl_match *impl_match);
 
+#if defined(CONFIG_ACPI)
+/**
+ * Get ACPI device associated with the PMU.
+ * The caller is responsible for calling acpi_dev_put() on the returned device.
+ */
+struct acpi_device *arm_cspmu_acpi_dev_get(const struct arm_cspmu *cspmu);
+#endif
+
 #endif /* __ARM_CSPMU_H__ */
-- 
2.50.1

