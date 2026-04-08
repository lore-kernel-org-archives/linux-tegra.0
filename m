Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012013.outbound.protection.outlook.com [52.101.53.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C40239098A;
	Wed,  8 Apr 2026 21:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775683520; cv=fail; b=Tu22/ELh/ey0qg0Xmapdq1X4J1RkfSDfOKqX6FBjVPIW+E9C4wmGF/R8ChM+B1b9NvfJFoZIvxpQaYagw/guAmzFkFmn/qVJo7zlYsdlYEBZfn8HcODBLQ9cRCMNH9Wsah/bh9YUd/3aqJQIPwhAy0Q0pXc86I5tsLuUDro6DKM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775683520; c=relaxed/simple;
	bh=oMR/JD5OEDyU+UoOlpjrZrp/7bC3QCSapIFLDTI3u/k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r2BloPukgWlFYTPveMvu6wnfrf9WXkDemYATivuVo+whqi9SvvKPo1vcCoRwDkuzlwEwe52EBQj4Xmg37GVoZRfHg0rg+lQAZjmOFZmh6h5G9hwXK/2UF799Tm+i+CCMvRQTqvzRqHze0tMXXkLf2OKCbMysB6xPaSPH2wWaQ40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XuPInegn; arc=fail smtp.client-ip=52.101.53.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XuPInegn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yjPs8tjm+UW5nuY1/kx3RX97W4/QPmRAslUmqHnhYLOkZ25DZ7MI2k6xQ+J93gUr50X8ui5g0HER9OlLnGQ1WZfgc+pASKK2y4timMbQl5guqu7oNI3f4P9CSwpVuQ0Axg0HLMlhLo/Gxn9Clbr7hP3Z+TELN0Po5vAXl+4+OCeaNkt45AYAuFXbpZR3363qpBgrQ0TglPyOL8W1Z+0V6FDhokJQ6etxRPNGeO9JvJMiI+Hqqhucd1s2Hg5lmG6RelczutdkswejVHmxe3Cy3ulpmmvAoQs/+HgTFV6Cs+N6AuNadvOhmABXTehQ0GPwXzNpKBDJY7Y4/6t5I/1Rvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2+C4ahxGNOb8QKFg9YseYISN8WrsxaOAkUMyyG9MmeI=;
 b=MMI9hpF4eBfZ5KrlVjxuc2h9DsG6B8ZFDcGDYUvI63jTsZRKKS9rYQWrQrXy5bK49ccsiK2dlKvSOlHFiYpHYFQzm0DLUYGJFoIuNkEkmZ3rukUzIkXwXwvc/kTUefDvMSW8LVnCFVk/bsMDInhxmU1iBHGAPnPwWQZipl2PhfcJHyWmSy4HtCBWNtNV7PUTY+XRZwrQdT1Jn8cFO+Z3PG7TokGZTeGipJkU8Z1bAt2O6u6capnoqWgdosOR5OryXk1aoeHXZ+Af0Im1LXF0fhofrHvPVhLcyj93J+TmSfsBW1fdpVDWxsNwN8R6zVsNUSPHZlZSOc+5xEeqqBT3Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2+C4ahxGNOb8QKFg9YseYISN8WrsxaOAkUMyyG9MmeI=;
 b=XuPInegncVISnQS91m+cMjd3dSQrZYVYM9laliRK+b9V85FCm0FxjxTZkDR1TisiOUwkuwhrHaFP1J3XxPhi4VDzgpoV5WPDIIXh8NoHSWaFfZDWiCq3HAHlsbJ5k71QjYbqcmkIs9aRttZWY6yqf4L69kWJbRmdTwXpRDk/W/QvECniq4Fi/wkGUutU0M2mCAVu7jmC6jduWplbfmWtAANCgsYXRgHTnw5kXYdauiEcdlviG+2voSSALAKbQEbXczugcXDzSuYoBeB5jlXS8sk+CbZdd4dyDV+40XTrXxQTzmtx70xqO+/u1AWROiEhnV+J3YsyWj7IXjOm1BX/gA==
Received: from SJ0PR13CA0090.namprd13.prod.outlook.com (2603:10b6:a03:2c4::35)
 by CH3PR12MB9220.namprd12.prod.outlook.com (2603:10b6:610:198::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Wed, 8 Apr
 2026 21:25:12 +0000
Received: from SJ1PEPF00001CDD.namprd05.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::e6) by SJ0PR13CA0090.outlook.office365.com
 (2603:10b6:a03:2c4::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.37 via Frontend Transport; Wed,
 8 Apr 2026 21:25:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF00001CDD.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 8 Apr 2026 21:25:11 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 8 Apr
 2026 14:24:53 -0700
Received: from build-suneelg-jammy-20260204.internal (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 8 Apr 2026 14:24:52 -0700
From: Suneel Garapati <suneelg@nvidia.com>
To: <dipenp@nvidia.com>, <jonathanh@nvidia.com>, <thierry.reding@gmail.com>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <amhetre@nvidia.com>,
	<sheetal@nvidia.com>, <kkartik@nvidia.com>, <robh@kernel.org>,
	<pshete@nvidia.com>, <timestamp@lists.linux.dev>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Suneel Garapati <suneelg@nvidia.com>
Subject: [PATCH v2 1/3] dt-bindings: timestamp: Add Tegra264 support
Date: Wed, 8 Apr 2026 21:24:11 +0000
Message-ID: <20260408212413.217692-2-suneelg@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260408212413.217692-1-suneelg@nvidia.com>
References: <20260408212413.217692-1-suneelg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDD:EE_|CH3PR12MB9220:EE_
X-MS-Office365-Filtering-Correlation-Id: 08439b65-8052-4029-12a0-08de95b5513c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|18002099003|22082099003|56012099003|921020;
X-Microsoft-Antispam-Message-Info:
	/fLiIWCciIPjZSH5a1WO4iXoHm8NA6Iy8Pp/uufZHKNbi3kD2duG8UITOKSH/2XrSxFVqyLo3WnUQWaoI5rbBr+9deGx/xPGCY2obSc4sZO1oIqvo80kMQsZuSycMLkmPwlrLmbHXkJZepwZFEoUNA8YIf1BXWWaGvmtOiGrAeuHBDpDpHQIE8lIa9/EdxyjrXRuJF5cm2Sl9JDXeNeU3nGZPM2sCvWR4iHMCNcvJKtesRG3XmLCtRC9i7hEvRZjLsHPI3oO7hXwhdR79/pu5SZ505TsMhvvi2k49J8lDocgWrYTf5cYXfqpfT8FG0qd5EhMsud1j+GwyTfU1riuV57X32g+GwLG1PSKZdYt0xhT3aXRwlKHcD9nkPJ5JpblVT23lmYArIeDMQZqXpwirfyt1I1t/e3XB8Zxnx0Q7bs9TwFd69GAeJ//Wrnyf2qeO8VSE4Abuga+zj/pMlo8WV97WdWONb5E1y35cj7dUp49tl3rDSxa9UuUe+BF72zaiyJKFIO8AsnrvpHHaHQb84hc2CEEUR1QSSoV9RD42s1rrNpGn/X8PiZsgEeC4i7Zl0ym9pPKxDPTUkPte69u4RBt/LX5qFJIE0Vc0vA9CBb3vCLNq3m/5xEpknTz+S4AnyyZ8o78Fz/5pOkkr6pQ7NzJ2FcAIO7Ogq76r0JDIRG5k/AHB4jK4Ekb7z/JeoN6m0mD/75n1//XV1qpt960GIAPXaeXN+Kpb+GKO2vVT1EEbgoGg6M5JwXmQl2XTswPLlfnK1Oi7XiMFfPcFauJAVhajFwzychGOI42wlviLBMbZQ2FzPYK+ZIAvT6U5WJ/
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(18002099003)(22082099003)(56012099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IQfyzXFN7eFtKdb4Z91pynuvFfwy9dS239sJxmq/yDrJVz8bpbDq9dRceIkXZ2FgXwoIbqRTvy/gRJHzlxkfBEeW93uyB89ToJVwTBBj1bYOYN15muhzb0k9fv0v/ydZT112o78qlQx9AbTDLMpG85Tf7Miyy/OCdmV6LQUs2V6nJ65L/izNlU2yIYHwweNFSQ9v1ciATUpBck5UN+Y24EA6U1OpeK8NNJtzT5IRsmYPSl8mm2/HIWytebbHy/DEtY2qvTkQRLFvdVg3O7K+Cf/0vvn4MnUi5UPL03aCAdZy+aafLkRAP4YaxQiNsQnMS7Zca4NjZGJe189D0cwip+Kh8hcfiVVMVDkM/hJGG4Y9gPhnBHzrg8dLPI+EIyZaktXKMTbsK5vp1Nv24/g3qT2rrh1Ve3qg5BjiGq9JgYhS7J6rvpp+ZWpOJA0SnNcf
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 21:25:11.6385
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08439b65-8052-4029-12a0-08de95b5513c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9220

Add timestamp provider support for the Tegra264 in devicetree
bindings. Tegra264 has two generic timestamping engines (GTE)
which are the always-on GTE (AON) and legacy interrupt
controller (LIC) GTE.
'nvidia,slices' property is deprecated and hence not allowed for
Tegra264.

Signed-off-by: Suneel Garapati <suneelg@nvidia.com>
---
v1:
  - nvidia,slices property is deprecated and hence false for Tegra264

---
 .../bindings/timestamp/nvidia,tegra194-hte.yaml    | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/timestamp/nvidia,tegra194-hte.yaml b/Documentation/devicetree/bindings/timestamp/nvidia,tegra194-hte.yaml
index 456797967adc..a96d6cd23895 100644
--- a/Documentation/devicetree/bindings/timestamp/nvidia,tegra194-hte.yaml
+++ b/Documentation/devicetree/bindings/timestamp/nvidia,tegra194-hte.yaml
@@ -25,6 +25,8 @@ properties:
       - nvidia,tegra194-gte-lic
       - nvidia,tegra234-gte-aon
       - nvidia,tegra234-gte-lic
+      - nvidia,tegra264-gte-aon
+      - nvidia,tegra264-gte-lic
 
   reg:
     maxItems: 1
@@ -112,10 +114,22 @@ allOf:
           contains:
             enum:
               - nvidia,tegra234-gte-aon
+              - nvidia,tegra264-gte-aon
     then:
       required:
         - nvidia,gpio-controller
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra264-gte-aon
+              - nvidia,tegra264-gte-lic
+    then:
+      properties:
+        nvidia,slices: false
+
 additionalProperties: false
 
 examples:
-- 
2.34.1

