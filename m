Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013007.outbound.protection.outlook.com [40.93.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FB03ED13A;
	Thu,  8 Jan 2026 14:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767882758; cv=fail; b=C7/NIoXO1KdxUIgFifkTkgU7spjIuadeq/AdcKfdovQfUewUlf9flPwu0+j9wtERlgNrLGDB58qdqcFjc/S8ThOzMgaOeEwVKeWueZdpejkmxtJzhHonVFUK2D85OpbTAL5y4k3YjeicXgu1NoOWXSta6KWtSkXcTfx5Zb471Ks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767882758; c=relaxed/simple;
	bh=PAyY03+0jBXQiS80ZFhpaACwvg+m+b/vyrqO5PNzTV0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UxSlIHzwRbaaPcdBwKU0TtQv3PsGdefB6k5yWJLnkW+rwistLMYwfW7tMzDJWJciG0b8t93lTsiUuWDo9MnVYaXKz6C4pu0c0BKxyqCe5yTpJixuRs6mLcxwyMnqvb6bd9bqUwHyoGTrKH8woDahzbOXRwcEZDQvfiBKK70zM6s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Zu2NT8QF; arc=fail smtp.client-ip=40.93.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Zu2NT8QF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tZyL2MzQv7qAnFCs1O0diAic78TEBuLRexmt8Fkl1ylqcCVbKTPD9Wccsu25LJWIf5dKZflHiZVyptgITIiuNfeKudmO9hzDoO33uRI97FR/tLAkq15acsubn4aqvJuD3bZ9llhogaY10mIl8myuXRNSHMK1W8TinZsnWOidXkYYaq4rB2m6pTtOx8FuzI9CoNQn9DEjzpBTb8hzG5X3Ne1fPDDgvT29pwJzp01KFaUj2Vn9+rYWb2RCTNeU7/d9UfzrMV1sk2WKj7XfK7o2tfJMcLf3jIGXjM5S/Kxvv6RTyt0GJa6/0GHqSlz5On3kUQun/K53YpUh2KEyMKH1fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tLUwJR0u3+MWRB+Rko8rkvErm3By0WFWIEFmXhYkC5U=;
 b=qU/syTdfRDo3KGa7+v+zTAAYSoPeT4C7/oouyOOf9p10GvRLR4UgkwB6X3vu8iHL65Ynp91S0yfI0nWz4l/LX+t3GcD7fbCOVbXzIddCGR7skMrsnNUwh5ZUVwG0M1Jj47KimauM+f0XqJb6N4YCeU4EyV7Tq9+95aUtjogYfWAXbleD8YlGnOUDMSl3HP2ipVJnXMoyXQX3PwX9nAn+yl2xqKZVOSg7DVoqu7kXzM+u5Z6dIonZcm/+VrwRPqlsP45ImxkHmvBt+1MEE9MwxubjFhOlwgb+LgcHVvzJuSC6y9IjEx913h4s0h6DjaFJnYfutUmtCOO2ClnlSsu7Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tLUwJR0u3+MWRB+Rko8rkvErm3By0WFWIEFmXhYkC5U=;
 b=Zu2NT8QFnSAaEnpcK1z7B/rZiQBOs2plgfQAxqhFBp8ZmbYkdHwRKhjLHkmKpXds2EzDEOwFaRvN8LiiyyR/7Qs9naxa+T7vvxKb4QASUhdl/gntgGzl+HmaEuDFyqTwMBCE3NTMTqradNEsKGYXwstne4KrQ15G2ZdIIKRAHH5cd03SuoiEmT2EnPvJa6bcyg8sf1w49OMUYuR2Gk1QOoSb+rM1WJLE1wEJmlQlCua+65LKttl/ALCd4YX/TqrmRsnLYy+tRQfwfCG5Q1oP1U1q2FH51St0BbIxNjfQnQGvJtqguZ5gSWZ30zcmSFR1kFSWMXnVvxZX+F4HNcy5Fg==
Received: from BYAPR21CA0007.namprd21.prod.outlook.com (2603:10b6:a03:114::17)
 by SJ0PR12MB6760.namprd12.prod.outlook.com (2603:10b6:a03:44c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 14:32:32 +0000
Received: from SJ1PEPF0000231C.namprd03.prod.outlook.com
 (2603:10b6:a03:114:cafe::43) by BYAPR21CA0007.outlook.office365.com
 (2603:10b6:a03:114::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.0 via Frontend Transport; Thu, 8
 Jan 2026 14:32:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF0000231C.mail.protection.outlook.com (10.167.242.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 8 Jan 2026 14:32:32 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 8 Jan
 2026 06:32:14 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 8 Jan
 2026 06:32:13 -0800
Received: from moonraker.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 8 Jan 2026 06:32:11 -0800
From: Jon Hunter <jonathanh@nvidia.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>
CC: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 3/3] ASoC: dt-bindings: realtek,rt5640: Document port node
Date: Thu, 8 Jan 2026 14:31:58 +0000
Message-ID: <20260108143158.351223-4-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260108143158.351223-1-jonathanh@nvidia.com>
References: <20260108143158.351223-1-jonathanh@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231C:EE_|SJ0PR12MB6760:EE_
X-MS-Office365-Filtering-Correlation-Id: 39edaada-a4b3-470b-dc52-08de4ec2c282
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UAibyP0I/l1cWKlnBEq4sRKOJlY5hx91+yoBOylrOkWVtE1dVwMgqb1wYtoH?=
 =?us-ascii?Q?/m9bo3u8dmi2M5cJYu5WPaU6TqXA6Jyynwd/rpNlq02OhH2ZrFQ85FuTeV9t?=
 =?us-ascii?Q?9cf+4VnvUQZT2oUyp7Xd8t72n86A3LCYAfHNrtoTSrarFLBvJuqxaW15ml1x?=
 =?us-ascii?Q?/5ArrF6o2wnsWHcc2+TpMx0LNvsyCyzB+Gsanze9p/umHqJIcI6iPzcNqV3W?=
 =?us-ascii?Q?JA38uh4sXWEO9E/D0c4l8V4233cvoaDVwtnJmf458UMn+2PK0MHghFOc/bX9?=
 =?us-ascii?Q?qEr12pq839c+OAxlpIBR/Q/0soKIw+Z0tXMMTDSj9IJ0V8o/cH+aKLpDEvNO?=
 =?us-ascii?Q?J+XHStxRhu9tLtOgP9NeBJF5b5xCVQK9ibSErAsmf4y4WFygRMHGP5lDMvb+?=
 =?us-ascii?Q?VLr8cBcB5JOsW5f5xItlPj7Ww7rgvoffwmTAUIYSC9DnKmUOEpTpF20s/0CK?=
 =?us-ascii?Q?aUhiuWWMKj/ncvSGE+yeNUi54AyW9kIM66HxVHv0nnpDbs0vYHzuPcw63I7H?=
 =?us-ascii?Q?wbmHJ/O5OfWSkj0Ur2V49mnxc0A9QGwVqQfm6TSIxoMu51mJx7UYaTDdiEPE?=
 =?us-ascii?Q?ybdnSF6MaDC9iCAB6XJTbtwdByG8saLHBYpLGJCxzZzi54fP7DCivTXesFr+?=
 =?us-ascii?Q?vJpDQmJICLlJcVljqpx8ruTMCrH6xyPkDPGF/EDv8FCQFuWil79/tNY85/Gs?=
 =?us-ascii?Q?CD7Y9BfwRfrWq15JNY4e3GfQHXW4OY+f0FocHEMHB30WPdHhfRa8zxE1GnRe?=
 =?us-ascii?Q?guGB3EKLy2BGkOTx4f2+OmxL6EiCIrvtviX4pIYBiV+xh+ArMq3IRYitLy7n?=
 =?us-ascii?Q?7NACUvJQ0qQabugd9PO7B7CIHZinEJsPPxl4MoyRUgcG7WJrinCdp3M9Yk+X?=
 =?us-ascii?Q?q43T2bnO37EH5gMhBUjO0bHZy4u4rIK6BL1usMeqdBzdrg+abioBx7nrjs46?=
 =?us-ascii?Q?VoDJ+Q4fFkIslX92JpR2prlg0O1REZHKV3cpyjFLq8N9LjDhVZGuhCZfPhrY?=
 =?us-ascii?Q?u8h12PKHxelgZdB0WK9hbpw/lGJoB4K83jQwsnkNKljXoU1X2EGgGmmsWiu2?=
 =?us-ascii?Q?CY3wtzEhqZK3j0szVCs+2D1eZcKupUOrqh0hwU+Z3AFlkwCpznS5mD/hmccq?=
 =?us-ascii?Q?CqYehOrGZqDZqmsi5OjjiwVjVSZMAqG+nFpfpYV1DryfXRVI2fwbf7zge+1Q?=
 =?us-ascii?Q?eOLHUF88LDcngAzGmvYFvn5r+TgUahno7Z6lyUasI0PU5FXdyzy59HPiN9ql?=
 =?us-ascii?Q?3dLJBeKcNGT8ujoluKjLb9hP2amRNdILSezkSxulWsFzH8rZ3rFAwbCRVGPH?=
 =?us-ascii?Q?At8t1K6GXiYPnpqsJ37tZYBpXGH9BEOT8shlTuL23gHD+7Nwz6mPtXUaLAz/?=
 =?us-ascii?Q?siD/say4PP/GzUDvjsL9XXxx8u4NwyodNaufxcfNnAvqeO7i69u6T6MOaooh?=
 =?us-ascii?Q?saXjMJ190+9G9nJqCK9hWAEzYUfqennUl6AThbt4nXXRFesaNgKNDy1VIkMN?=
 =?us-ascii?Q?iX+Ey6A8/C8kjeb+83D1SxN7sC1Pxp2x2+IZYAD7y77afKonqJbd4QBPW+/R?=
 =?us-ascii?Q?AgBpQ+Avtu0G4ANwi3g=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 14:32:32.5867
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39edaada-a4b3-470b-dc52-08de4ec2c282
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6760

Various boards that use the rt5640 audio codec define a 'port' child
node under the codec node to describe the interface between it and the
SoC that it is connected to. The binding document for the rt5640 codec
does not define the 'port' child node and so this is generating warnings
when running the DTB checks for these boards. Add the 'port' node to the
binding document for the rt5640 codec to fix this.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 Documentation/devicetree/bindings/sound/realtek,rt5640.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5640.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5640.yaml
index e7d4ec29b0ec..2f6a4a6cc0e6 100644
--- a/Documentation/devicetree/bindings/sound/realtek,rt5640.yaml
+++ b/Documentation/devicetree/bindings/sound/realtek,rt5640.yaml
@@ -130,6 +130,10 @@ properties:
       - 2 # Scale current by 1.0
       - 3 # Scale current by 1.5
 
+  port:
+    $ref: audio-graph-port.yaml#
+    unevaluatedProperties: false
+
 required:
   - compatible
   - reg
-- 
2.43.0

