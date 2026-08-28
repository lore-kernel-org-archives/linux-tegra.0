Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012001.outbound.protection.outlook.com [40.93.195.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23E8471429;
	Fri, 28 Aug 2026 14:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787928062; cv=fail; b=mPuEffqk0mAPdMKZoa4DdsNkljhV/ekXSFw1MAoJZJioyVif51rzKVPOrMcNLk8TTnz3LbOK6iUfCNxuEV1LFzbxMdCClh2t70EuUhVGw38QKXZKixUyPoM7O1imwWBIbT9M+4hGgf3E4YtsXWUIHHuqhMz4PAXsJl3ApzxE5Mc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787928062; c=relaxed/simple;
	bh=kcWT2Xzfx06mIl2z7gETrZojI9rpcanacW+eTLlZOBM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=VvDyqtKTCPVCO1YD+LEZPq9SHHCjomSEr7zyOM+QsaCQIqKxKfyRKR09f5u406mZTWzOxZjBkCwGCKQ1PdEyNQ9GjHpmpPAFHSFd2TM7sMVwfN09Txe9B4QO1srAyUWMeDNuHI6wr9hHqdYpzpA9CRKVaSXZBpUT7ElP46YanXo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Qvm5cdt/; arc=fail smtp.client-ip=40.93.195.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Qvm5cdt/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UFDpGN1fX67w+dUeN4tqHDVVyErBpjMXyXRXIJxQNezxFdRfGPfOca0LENCFnCHmeAfGp0aWFyUvyjXeyiUAZZGqqRS48yBbRk3ASt8/kxT0jYk08SpU6/dEzcV98AXGzYFdTqRoNxATYc3vCzeHAZRWr5M7kdrd6WUmUfFb4cvnZZoOZ+BMMAUjl7JK98H1VNE8bnq5NukP++TGUa1bI50mr9J/87zOQUwo9R+HuofzgUgqFSQUwiGobQPEvBejMqYsRrnom/lh5dPosaZ8MG7K0RIc/MBcs1QGd4tQlc6SDrH56XYGAc6VCVt8WZvZbJ0+CawAVMw86w3a5nEv+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8AKGH+5TY45K0cxiLeCR0Iz72uf3WU0b914zEHnfMwM=;
 b=Q3LqPX9w5+TX5J1iisphq+bC3PRURk6sXe34Wpi8bDSNUfTqPiTkXsi+ltKynEDSyb0apTstsZG4TZFD3ZKEVA0v8yY3d78YFD319pcM86U86wi5iApVPMmaUcJfPZedDf2hRjFp96P2Ge3jOs1QVkdyWyRh1/mYfNEcb2odWausokp8OP2KYS9kPUEpD8q8IOGVrb12eQSHybiE10g+cGEVoUScGpWWi8c6uJa6bfmJ4uWlrqWw5YX9fWALGJn80Rxpa+3eFx/INVlzDtIYsgrFT71yfHZcmmFvkJ/bO/lh8USNS9BRluQKdAGU0OuHzjPqY73DaYK+HsQH+KEwTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8AKGH+5TY45K0cxiLeCR0Iz72uf3WU0b914zEHnfMwM=;
 b=Qvm5cdt/JI7fAVgTJ8S9NaolKqCZagKy7sm1JBF+eUuGP9eJgEsqBi0kWt3/9Xu4xKMivqn4Nw8894q3vY87HFZiOmBvrjWZ+ncmaXvpu9UaL94cAHULBENETdbHQqQ2omQp3KcEeDjgJtoOhR1SPuxctFaaGmE5qzRUbzOsG4BOkAotgRGz6fRUMlh/YEfeeEPSVopZ0UVBo+qvJFwzXpw7tCM3hYb6iNOva2MMYbuDkaVL/895gpD5bDKUP+F0gp7rfl9lKKep8l01PMvXLORZ45pBE6lw6hvPqtvG/HmtpVh9BGk/FQG7RQQx64FcV9yVok4HkbT2gjMR/jdKCA==
Received: from BN0PR08CA0020.namprd08.prod.outlook.com (2603:10b6:408:142::8)
 by LV3PR12MB9410.namprd12.prod.outlook.com (2603:10b6:408:212::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Fri, 28 Aug
 2026 14:40:52 +0000
Received: from BN2PEPF00004FBA.namprd04.prod.outlook.com
 (2603:10b6:408:142:cafe::4) by BN0PR08CA0020.outlook.office365.com
 (2603:10b6:408:142::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.11 via Frontend Transport; Fri,
 28 Aug 2026 14:40:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF00004FBA.mail.protection.outlook.com (10.167.243.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 28 Aug 2026 14:40:51 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 28 Aug
 2026 07:40:23 -0700
Received: from [127.0.1.1] (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 28 Aug
 2026 07:40:20 -0700
From: Jon Hunter <jonathanh@nvidia.com>
Date: Fri, 28 Aug 2026 15:39:51 +0100
Subject: [PATCH 1/2] dt-bindings: gpio: Add compatible string for Tegra268
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260828-tegra-tegra268-gpio-v1-1-317bd91295e2@nvidia.com>
References: <20260828-tegra-tegra268-gpio-v1-0-317bd91295e2@nvidia.com>
In-Reply-To: <20260828-tegra-tegra268-gpio-v1-0-317bd91295e2@nvidia.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding
	<thierry.reding@kernel.org>
CC: Thierry Reding <treding@nvidia.com>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Thierry Reding
	<thierry.reding@gmail.com>, <linux-kernel@vger.kernel.org>, Jon Hunter
	<jonathanh@nvidia.com>
X-Mailer: b4 0.16.1-dev
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBA:EE_|LV3PR12MB9410:EE_
X-MS-Office365-Filtering-Correlation-Id: ed3a4226-fb59-4bfc-a7dc-08df05125c00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|1800799024|23010399003|82310400026|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	4tGkqdAN8y2OBQoe1cdBjWZICTtM/zny9R2PxhxIi/2iDcGc83aGqLcIQ4H1RxHgRjKVpRdtYG50fzjn5HC5wLSyl1sfR66Ax/nDMT2B8w8MDoGE6Ik9jCbFr5KhceI3OBdFhlYDuuOQlAqlkQKNj3xfiXwKNXzgRjcdWWljzuhIQOGek4HxySoL55ZK9NsoTwk9fTO2jierkmDHvLxBnim80XZakfMk0P362Qmp60g1bqms+BpffwxLvjEAUUJvRi1K1KsLPU+2RpqH4p1JiAvnDmHPBXssrYXcyACXQuGgQMfRjnCe9sbahODN2Vxv3PjsIFql39LNSxph8oxgi3Wcew75G3NsqYCweK0RoYjptJsZMvrAbVPwMFU+GnrTAga13+LhSoQCCILztK/WIUdrW7ejXMDuyb8Qe2xvCEDRgAB33CoV2mVMSyMi4aHZM9j6hS+1ACVsItymQzS0/adXkT6lhsVOHXOeLfjr6/Vysaz+5AwsFP2NYJeEKJI6F2k2uniH49ga79lL84iJNwqUTjdzaRfx6JLvJZ9rhSzsKZl4JH+huWmdfri08QCfL/Ta+2qoqKNVw6hEvCjZVSVFji5BsW/3TOhffiPxF06JlCd5w7WL2YkELrzAUbqR6YglmdzQGme/m6LDoXqtv863P3sSMk4r0hMRHsAkHO/uL/rKkueT9M+sl/IXFQ/iUO+98yaWoKC9glcLvAy7Hg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(1800799024)(23010399003)(82310400026)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	D6mD+NlcAfvBs5+Qci7iDszu+qPLcV14fD49hzy+8fcEx5KmwBYxEn6SmgkSj+PMuSOtU6WdItM9UFcVKKlG6n9MSkXn0r098gpd40OkdRPWot39fYesiih1pJ/CgoH83WoNMuBbWqhOdKkcTn2KWnItZMEFyeqDnUrw+3CBKWjBBKFhy0BTBebPRPuSmYFAMbk8k/mrzh+PP6qelFqdPLmZPI0INuIQ5IFp8FnNJUCZWF8CPUmCtNGiwcfLg4pRAV9i0LJBGhZEmBjHcGKl5klGhaGUtiRuFJ/ckZ4ZGdO5VlMgYV776dCyG7o+m2I6TA3Qsu7FVKCcoXHkJQURF8yloeUy8BaBGm/65h6xR2eACgBm+y/S5i96BjVj2SQrBKZ+VvKh8UBRPhltOV3fMQ/rjI5O6hx1KBYYTKo99bNp9rBc1Vykdg/D6TJ87MMs
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 14:40:51.8480
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed3a4226-fb59-4bfc-a7dc-08df05125c00
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9410

Add compatible strings for the GPIO controllers on the Tegra268 device.
The Tegra268 device has the same GPIO controllers as Tegra264, but only
has a subset of the pins and hence, GPIOs.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml b/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml
index adeb3b3a2902..fac53e65909b 100644
--- a/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml
@@ -91,6 +91,9 @@ properties:
       - nvidia,tegra264-gpio
       - nvidia,tegra264-gpio-uphy
       - nvidia,tegra264-gpio-aon
+      - nvidia,tegra268-gpio
+      - nvidia,tegra268-gpio-uphy
+      - nvidia,tegra268-gpio-aon
 
   reg-names:
     items:
@@ -169,6 +172,8 @@ allOf:
               - nvidia,tegra256-gpio
               - nvidia,tegra264-gpio
               - nvidia,tegra264-gpio-uphy
+              - nvidia,tegra268-gpio
+              - nvidia,tegra268-gpio-uphy
     then:
       properties:
         interrupts:
@@ -185,6 +190,7 @@ allOf:
               - nvidia,tegra234-gpio-aon
               - nvidia,tegra238-gpio-aon
               - nvidia,tegra264-gpio-aon
+              - nvidia,tegra268-gpio-aon
     then:
       properties:
         interrupts:
@@ -201,6 +207,9 @@ allOf:
               - nvidia,tegra264-gpio
               - nvidia,tegra264-gpio-uphy
               - nvidia,tegra264-gpio-aon
+              - nvidia,tegra268-gpio
+              - nvidia,tegra268-gpio-uphy
+              - nvidia,tegra268-gpio-aon
     then:
       required:
         - wakeup-parent

-- 
2.43.0

