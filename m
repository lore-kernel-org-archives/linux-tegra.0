Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013030.outbound.protection.outlook.com [40.107.201.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9645416CFA;
	Thu,  3 Sep 2026 07:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788420007; cv=fail; b=d3HHPkHcEKFHsMtIL2D1F7SDbt+5m2ddG2U9TYu/DcxvBBNxlqKWg3snzNFkvnH4RhXqBgfKmbb/sxY0aoTdtp1PO6DFhNPGK1UvL1K9Lc+Gfh6P0J7mkDTF9Ebkenp3YVFuVdbU/78aKpWZ5lnOxPueR6DU3xicFp+5+fnmGFY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788420007; c=relaxed/simple;
	bh=B0CdY6y5wfrZXg+l2EQikZWiFHFMtytZhGuNsQTxTl8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ltbqhu0CS4JVXwqBOam65cJGVrWyu+03FA71+P5w/eCJ8Zb3Ub+zBVXp3s0zMfcmSmBgOGVkI5kcxaASU96KXdHc13ezIG6SkwXvqdpSyhKhbUjOUGulYsmyKZDbiVHIHxwH3aP6PcoyyVVQ7YJwWkFEFkAC1Uj13tin+g2g8dc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UqVkZk4e; arc=fail smtp.client-ip=40.107.201.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UqVkZk4e"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HNBI4LFVCQA6es57OvMpuqOsZyVell0kG/GxcvNib7EECo10YM3jFq30azwLv9YINdLFWkuJ8x3BxQRovy/rFBe9AFoBpN5KgQjZSrPH9Rx0iTOk7gPDdd6DNRf7+pXDL8QfFj85zIBGYn9BU0b4z8GfRjBl+ZO0vNwtpKvJDGTdo86IHnuxr0sSSCIcGWex/bDDrjfru082NeUe2/VA2xaWsDjRCkyi9El5EwEVVIScp/VDuAJ1bHxxXgYtjEflGLTcqhddZYtZbxtIl6UJIhZN9ZJKoLHZYbbVDtctsSxTOTgT3kWas++DuK0hjo911ouYyGqws7oEF4J1UsBfmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f9DBKA1pjbQXpXyuFUmj752f19aaqrMjQKQEEJSGS5Q=;
 b=qSpPIWw4VYyAsrCoD3pmUc8xZ+ZkOOusp/pQ9djZZcyileOtfXuJy6VMHfRjlSMe+r6qF/p2yPSL9cM978xvXM76BvzgCdzGhMy6TDlKdjcl78iVeCv32eiZTII/Ibp/fROcqTRKgMNM9zbGec6s9TA8rgWtsFCJ+E/nxtH9A8a7BrTk1lZWmSML2+WvyIL84vIAZY92XVOH5V1KYLdX1Hs6xbV9UV7dZkUngWi8tnsOu0P8fgiZPiDvG8dl9HMiWx3Lg9cI3vnfreha2JCH5EFqMZSZBsm1UuxusAbmSRygYuRPqmjYJ/mT8npZcLbgxpZZx+m92sIc4SVtgIxMMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f9DBKA1pjbQXpXyuFUmj752f19aaqrMjQKQEEJSGS5Q=;
 b=UqVkZk4ergVHxwdXY83sUkMtL8YCX9Zflizti63aiGqppQN8VzM8Fya/gVV7BHG8bLaT9Tuthwy0sYtyVI91XuzWGYdJf25W7Q3d389McoPNBmrSyAFi2fznSn+t3SeILLv3rPx21bpRZNI/THqOINBdmJHM0U1D0g4kfR/zci8vUC/POhgZ/KAdj2l6uMnUPiKuFnM+frjh7P7WX9JwjgQDK6vacxAKnyYhE9m2TUIkt7LG01bxd853IB5AOo/oR4iIGDpK6hS3VCTXX5UI/BSUxjfZEz2DwetoCSwCpt3ks9nirBcouGKzZgiAMpq1TPem9jJm8h8Rj7jBGwrWGQ==
Received: from CH0PR04CA0072.namprd04.prod.outlook.com (2603:10b6:610:74::17)
 by MN0PR12MB6150.namprd12.prod.outlook.com (2603:10b6:208:3c6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 07:19:57 +0000
Received: from CH2PEPF00000141.namprd02.prod.outlook.com
 (2603:10b6:610:74:cafe::9) by CH0PR04CA0072.outlook.office365.com
 (2603:10b6:610:74::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Thu, 3
 Sep 2026 07:19:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CH2PEPF00000141.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 3 Sep 2026 07:19:57 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 3 Sep
 2026 00:19:45 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 00:19:45 -0700
Received: from waynec-Precision-5760.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.46
 via Frontend Transport; Thu, 3 Sep 2026 00:19:42 -0700
From: Wayne Chang <waynec@nvidia.com>
To: Vinod Koul <vkoul@kernel.org>, JC Kuo <jckuo@nvidia.com>, Thierry Reding
	<thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, Manivannan Sadhasivam
	<mani@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Wayne Chang
	<waynec@nvidia.com>
Subject: [PATCH V3 1/4] dt-bindings: phy: tegra-xusb: Add support for Tegra264
Date: Thu, 3 Sep 2026 15:19:34 +0800
Message-ID: <20260903071937.533646-2-waynec@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260903071937.533646-1-waynec@nvidia.com>
References: <20260903071937.533646-1-waynec@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000141:EE_|MN0PR12MB6150:EE_
X-MS-Office365-Filtering-Correlation-Id: cf6526b9-8f71-4f67-c4ee-08df098bc286
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|36860700016|23010399003|82310400026|3023799007|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	jIheqVyJTQO6LTuqySi/NuAE8Llb1wjqAyap9i+UhwgMeCwgWFErxIu7t98SIowhi5t9vLWLxKl3gOz9aj6IxLlgi+5upByK7a3AzIfYhdWcRU7FMbdde41IGRnFdLWCBGiMaecT6E7Bc9uC3c2nZExIGnYwARq9QGUj6m/Q6wdJHAuIeAsapcRYP3KELNX63BIuRuuugL5yRA9vfrzoZWzWQ5zBxXwLK0EYoYZb6GyU6ypTMGY7szJmX5j1nTJrTKEaRxfmi+RS5k7lMxW0ypbL7sQp3uDqzUCY7GGwhqv9JEFiNkegjeo954c6VlgbHjpdwd0SRGQu2HItv1qwsucfpxZwWzIaiF+DWGJd+Y3shjT5lIC2jQCJR1jO2oaKQ367czqWanZPl11z11jvi6iCOV3UKhbGFFAGikq9sVuUN80ZR8gMfGdf4jvmFOAgsK+WW1E4VnAwjXqb/R4uNQFUnPjiDHrRHsFmPtxsCZYPMR6mLPzHqUpoV3K/1RkSzwJbdKzxyu4Li0+L6EO/8r5bmWtYFcqv8Fk9a2zgk6DhHwkCIPFy7nX4NjJLeYPbCZ5m6DUQYWJ79PQivd/cDYtOd+LC+KxRh+guF4Q0uf7QkhDLGbYLkiHMQ+pG2j1vaGHFpIv7dC8hiLKq+hhrBrJFEJfyZBjPpUbU6jjFWplM/knDd51My6tKB7+tw5BDkqYdp5ISangf3lBMo79OAQ==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700016)(23010399003)(82310400026)(3023799007)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MmTZEplofnC0/bj2xAAcsW4Wbq7Rz57VLtB9Vn3bp6X6GS2zivU2jVT66QIpAJ94j5XvxKvs8njekBBU4ptDmlkOXRdvqKptqBOVZH0GT16zbiLMJJkkKH+TdWXpHQsFW60stR2rN+nwGpVC9XZQ/PZlQk697/IeB2qG4OOsa2GGiaiJILKSRo3i8rpTM2QCGS/Br/NJwQjZnEvna4qbc8DCyRKDJKt8w5Vft9NwDOYqfLpBV6zVADhhKZZ1kX74FVosxfpWDtInq5jHRl7q2fu74wk4ExE9rHSSUpIx0AQ9Ndm0Ojh2Quz2hhjM0CrPPv5xPnrlw85ehrCqeTf+chTIEGnMsCJ+iz6n8pqR6vr95mfbp9KvdNnMcOautqNoll/EuS/dbnsVoR1f7v/RFgKUKaNMhs20Vso8r6XRfFGO4reut7hJe/RHq2Beq5jj
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 07:19:57.7138
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf6526b9-8f71-4f67-c4ee-08df098bc286
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000141.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6150

Add the compatible string for the Tegra264 XUSB PHY.

A dedicated compatible string is used instead of falling back to
nvidia,tegra234-xusb-padctl, because Tegra264 is not
programming-compatible with Tegra234, even though they share the same
DT property set. The driver selects per-SoC data from the compatible
string, and Tegra264 differs from Tegra234 in at least:

- Tegra264 uses hardware tracking mode (trk_hw_mode), while Tegra234
  disables it.
- On Tegra234, CYA_TRK_CODE_UPDATE_ON_IDLE needs to be cleared so that
  the calibration values can be captured while the controller is
  still in reset. Tegra264 does not require this, and the
  corresponding handling is not even present for it.

A fallback of nvidia,tegra234-xusb-padctl would let an OS that only
knows about Tegra234 probe Tegra264 with the wrong programming
sequence. This is also why Tegra234 did not fall back to
nvidia,tegra194-xusb-padctl in this same binding: the DT schema is
shared, but each generation needs its own compatible.

Signed-off-by: Wayne Chang <waynec@nvidia.com>
---
V2 -> V3: Add rationale to the commit message for why Tegra264 does
not use a fallback compatible, per Krzysztof's and Conor's review.
V1 -> V2: No change
 .../devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml b/Documentation/devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml
index d8de900a4fce..f6fe3c90b5b0 100644
--- a/Documentation/devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml
+++ b/Documentation/devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml
@@ -45,6 +45,7 @@ properties:
     enum:
       - nvidia,tegra194-xusb-padctl
       - nvidia,tegra234-xusb-padctl
+      - nvidia,tegra264-xusb-padctl
 
   reg:
     items:
-- 
2.25.1

