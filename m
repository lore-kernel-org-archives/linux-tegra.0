Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011046.outbound.protection.outlook.com [40.107.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BF5330662
	for <linux-tegra@vger.kernel.org>; Tue, 31 Mar 2026 20:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774987534; cv=fail; b=J4cnmR3m8/fAvUVe+X/uXYpVOSOV7HEVGxv5Ll9CLDat61Uk8tcsIA3nrvp+jjMLHNlSaKCdSiX94baj4HYp/p8S4qpVDqZ1Yrx0aAEb2iEeIEQ4lnN8rdc3Hm7QQKbzduxXz1NFTSQxzbqDT17tHrEEKQHfyX++6FwIIM5IniU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774987534; c=relaxed/simple;
	bh=SJjOuMGWhLtrKgmfn1QwSQ0HGLzuM3Xb48ELf8y7w9c=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jEasIP2JkIxWdotttzy+ceFr5mLSGHk6zz+44MNgqOiicv+mNOuwrpmu62AInT2tpFEMt716g7abDU2i+Ko5pirI3Jgn/AVTrbLht/jHlN+pKt4yQqrMJPo8DemI4vJS03+5f4a3ByCdlVnGYAYgzTd5wneO7pgQA9WyYgjNMI4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=iEPuTrZ8; arc=fail smtp.client-ip=40.107.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="iEPuTrZ8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bbRZbk9omyU2oTjrnxWkbkt76cM/GYZWHDiCQQc0b+wYmOEfLncGEB12ZN0bVXNt5/WhBdKSnx3bSnc/GocJ8ImiBwZoE/w8epEuStmMN0lHn+iXY7Z91bzA11Xy+TtZiTpQcfQQJvCPD99DH3qEzk8irybEXzEghZCJ62EEVwndsriZB7joeW/nwlHrj6F8BallOlLFjz7AEnxq5kKnQPngM+UG/SRn7/uqqlBg1Hik7GZiID7y9RbzOwpQMhJRfxdpTVdMgiSLGs8Z86UpTE3RMKUofbT3OyVahORc6JOHi+bjnq3g/oYUIKSACixSbwz0KW3bVz/zgFDKiFKr4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M8xJBKeAoYVF1cOfPe8LnDf0qRUemI4tCTu8vwVMgZM=;
 b=QNY0mIpT5qZVKJqdLReu9xvQA2dinXz/2VLTG79XxSv8JSuiskBLxSanYC6Sb8tY1KLnUVlFk9IW9vKAiekA2Smc5JZJ2uMmXFq7r//SuIvDg9sQQGSUIVfpKLCnKqRjUKQe9Il6uPW7g0QhoOl0I1w4Mcfmvi3meF0xMHB+seO5sOwM08+b0cK2Qz/FQvfSjvKmdf1w7GBeJJB5x/kgpgfpjgp8yAH+bxnkfKp5Fch3ZKQrnPYSgL+Pya2yuipdVqbHhJFvTZO/lHjk16wDZuO6G1dZeDKboPKYmooWnB4lcxcoOdfpsW5Ta0ik8niXWIW25eSDwKNMMR9eqpG8CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M8xJBKeAoYVF1cOfPe8LnDf0qRUemI4tCTu8vwVMgZM=;
 b=iEPuTrZ8fMaay2ANkIxVLuKEhFr1JxSwP+lDqIxy3Njm/goN3xKDIPP7tYaWnzq/NcUol96FgtAVaA6tg/OPNcVVrbNI3e9jGQRr/s2oybeIE2fQ5L96WeoxWhZndYaczCrIz2FezJWjVQT0fkX11LUGUtp6cLBXDJ9DBnqEy94tquKsMsKKZohkhnkhkdlVpXwjswigMlcn2JAg2zyy7UAzs8vdv6mm/w3nPBntZtb+vPw5NSBLBc6s09aFt2T3sQb1exczp6H3aOkxcQ7GVHFBQ83zXxjwtlpJZZ9x5Osvp0P2eSEYP3NWzg6SLTmQIhTUZlp9rIzSi1AgcnDYTA==
Received: from CH2PR07CA0055.namprd07.prod.outlook.com (2603:10b6:610:5b::29)
 by CH3PR12MB9123.namprd12.prod.outlook.com (2603:10b6:610:1a4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 20:05:26 +0000
Received: from CH1PEPF0000A349.namprd04.prod.outlook.com
 (2603:10b6:610:5b:cafe::9) by CH2PR07CA0055.outlook.office365.com
 (2603:10b6:610:5b::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.28 via Frontend Transport; Tue,
 31 Mar 2026 20:05:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000A349.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Tue, 31 Mar 2026 20:05:25 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 31 Mar
 2026 13:05:08 -0700
Received: from build-suneelg-jammy-20260204.internal (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 31 Mar 2026 13:05:08 -0700
From: Suneel Garapati <suneelg@nvidia.com>
To: <linux-tegra@vger.kernel.org>
CC: Suneel Garapati <suneelg@nvidia.com>
Subject: [PATCH 1/3] dt-bindings: timestamp: Add Tegra264 support
Date: Tue, 31 Mar 2026 20:04:54 +0000
Message-ID: <20260331200454.186649-1-suneelg@nvidia.com>
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
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A349:EE_|CH3PR12MB9123:EE_
X-MS-Office365-Filtering-Correlation-Id: 2faf599b-faff-4e1a-f820-08de8f60d967
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	RmDAIeFP+1vBb0Eet9T1Eu2h09GGEaRS5wFFD5XFwfxO5NmDpiHUiC3i0sKjYUsxEwotQVanBqQ0Dmu0IXNnZKvJZqAoW6eKeaumgL7+5A1/xy0IYKJoylKylq/fgU6JbNBymDG1K93VFMUpAdHfoOqdQzy6dOTtgoJsT92x0argoawYfxiuGzSo+EFP0D5rH7IiPuglcxJrhwmnAPF9pxrFnntBk1m/uhY4JtQNrJgHt8PSGOpup45XEAg2hmqlNZVq60L+v2RAnSe4nE9IUuVD1aUKo5LUGVIPNkOcl0BU6lFG95EgxQUKgpn4Pir7mMhhyzB3Nc6u1HY1SFCRGMgLM2XLrYvjznobnPkn9DV8yFTcocvhjlrAqGypCvfw0ZGN3p173YSZXNYdfxa135gDqYTzm8UmRbQUDhb0C8DK1Jpb00V0TQsSWV56pXyxzrJidZZeOHmAHJTMImZbWVfl3EM2S1gQRhSULlmJB+k04I1Bs8vJrrH4DHOKEY5WlwBVzYFYUmPyt44aN9q3eoAac4gfq+8fnXvZkzYPMOIZez7Tvs6DSswHMsMjI3Sj5tdwOFANpYY9E3oHyB197xhmhziSCw7gqj6e2GdhvMlnif9bvTtGJxsS7pwiDxdwxWwF1sfVaIJouun/x7BPRgU07yG7sfirpYP1h+7EYCUDyEthWijcKaYZernJJFmEHhWhkvvwnvGt2KjoYyw1rej5/UM91VWGCsQQnNfMq1zAVammMB45xZkN2sZY1REI9hnyi6hO/C4AYEWME57caQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dBTjIjHwQOnXg4JVVyqbDitwbPwgN3YJ4dXzf5uF85CE3yL0pJKW1BrtYye6aioWzS3PlJrisX/N62C+IJtq7h2E+KbaY5KkvAVp7rmRL2Rsw5mQue0AeWub9zkez4tD8nPjjPIyi9pZk7ihqbcVnoSucHSmSkCKeV8N90HqA9htSex4kwFat0Kucd0JgjgyBBN5aidTx5iUkskFhP1gbc8WHJqZ7/ha4YO+NfYfwPYaWfeSQWMuuaUPrmSjyOQMTIIwRPlNORDhKrYgMlXXMLoEkjTxU9EQ9L79jTubhYlsw7U08Fk/3+2TViIRV5/M7rva3Cm5qa4FBr5N+EiJLEbHYn2K4TkaZMu9pKmI8fkAInSYezNuh9H3u+6lQu2rZ9SIJUPa8TJ+I4vHp6R7/xufe+ZQ+YWCS3m+kyXS4V+lfaG2wX8ZPdJmYe20ApSD
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 20:05:25.8627
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2faf599b-faff-4e1a-f820-08de8f60d967
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A349.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9123

Add timestamp provider support for the Tegra264 in devicetree
bindings. Tegra264 has two generic timestamping engines (GTE)
which are the always-on GTE (AON) and legacy interrupt
controller (LIC) GTE.

Signed-off-by: Suneel Garapati <suneelg@nvidia.com>
---
 .../devicetree/bindings/timestamp/nvidia,tegra194-hte.yaml     | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/timestamp/nvidia,tegra194-hte.yaml b/Documentation/devicetree/bindings/timestamp/nvidia,tegra194-hte.yaml
index 456797967adc..210200421a38 100644
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
@@ -112,6 +114,7 @@ allOf:
           contains:
             enum:
               - nvidia,tegra234-gte-aon
+              - nvidia,tegra264-gte-aon
     then:
       required:
         - nvidia,gpio-controller
-- 
2.34.1

