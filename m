Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2089.outbound.protection.outlook.com [40.107.237.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECA713FD72;
	Thu, 12 Dec 2024 21:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734037913; cv=fail; b=unQGbSKCzhiHGGMuBVxUVV4GWC4jlhS9d14mh/9/7+GI62bgOOu6u1JjGTpMqmMSMolLBxxFXHT92g46Qgeey5DDnKSzMEgK/QmL0Ob7QhJMtzwsgMo67zPQwIziUIej6p3qHc05U19waCyjPN8yfS4XeLPZj0asULh7RTDmM7c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734037913; c=relaxed/simple;
	bh=BSMEhhU3c/PuBuJQA5D0/QzYA8jQIxg0Z6B+ZnlaVrc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CFXAdVg3NmL/kP01jK67FIB1mcA9n/ebslJ9ywzjNPPxC/TbK6cIFQnSb4QLFlO0MCk0q2rnGFrYEklSx7qI4Al+8qTFss6grIEkwEJoETE0+aIuiVggfWeCvXNBoKwYQPpRBP7DvAeujhDYscDnZRzXMuooPU9f2eZI2FVDwv4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cSOZMyUl; arc=fail smtp.client-ip=40.107.237.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cSOZMyUl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OlrA5M1X34ytEtXY7OMekF+dPf27ruY3h9VyNJHiFqlV0lxBpXFERaDbUqVfZMnH6x9W0pwWXe5OyrbBkQz1AjVhyHS+AlanK2p8UbYEF7jOwGL7+syqJD4PGGirxekR2DaAWLE2MUcNSobUBGwIprcB6gszXuII4mhjNumv0E4hK4IochmGXlKT3fDl5eT/R8X2r74a6nAWEE6lNaH+HtcKdKEGUefSPYPc4ea3QSLqtfGwgTAtPyvWIh06zHitdrBhfjPFbVb4p+R/ezNzg1smikGF8e2PZ5kJEQL7Q0vh/81LUPuLU69uZtYYFqXzZvp3VIGyK9ujvjpvDEEY8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FOofEBGpWmtICU7gZrIskkeLsOAh2WNfz8tOGIorTRY=;
 b=C44bgmDuKlyHddDYKsveVFzCfRWF0W55QAZVphxSkhiruizvVElqFyfls/8vi1XGLyDTn65pxasEZeDXCL7THKefPJiPneYRL3IMgElxBIDkG2hOg0mmiHttYBzxk9f7ZR7mb74z5ljYMA3reAIpIYNNNwhP9mGyol3thml+OLwriUnpUWB4h5jmu4aZwirhDx1rXUMLYDrSrYh36W8kUrHYlRK3ozOHQPOKLBSWV2vhc3oZSH4zjRxFpYuIiMs8qT/sFyYIMgoJsb/kdotXOfDja0+j7eISok3ARfSQhLhqmzAOFGoveoj1JHuDTWOxajLQJDNR9SJLoit3ShFzIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FOofEBGpWmtICU7gZrIskkeLsOAh2WNfz8tOGIorTRY=;
 b=cSOZMyUlzPCnuxAPwrnKzkewc6s7MVazYZ4tH9aERhISJCHZpDtZiMllVjlcNiBprop1fd0qCwK25j5Fj0CA0+mFYUiONshqo31cMZU+MlWzTrYpwduPbybZyD1gDfUxQ6PLo4djREoBAgp/fGME5GYQJwMW1F3dRiL8xphVmNj6L37kzwPKXpfNLqRWhEbUCbnk0lAS8HaOZayfPIWf/AtpZXwiy6pZtiC2IqBKXAAdJQpV34UkALAQoMdU8c+O2YMTLsZRoctvbqyDOi1eqHqUAl6rH3Kv0w2TpjWbBKdkZtkbxWbrNGLDoGbe1OGhxmf7HeUugzJk81qvISDTHg==
Received: from CH2PR19CA0010.namprd19.prod.outlook.com (2603:10b6:610:4d::20)
 by DS7PR12MB8348.namprd12.prod.outlook.com (2603:10b6:8:e5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Thu, 12 Dec
 2024 21:11:47 +0000
Received: from CH3PEPF00000012.namprd21.prod.outlook.com (2603:10b6:610:4d::4)
 by CH2PR19CA0010.outlook.office365.com (2603:10b6:610:4d::20) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15
 via Frontend Transport; Thu, 12 Dec 2024 21:11:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH3PEPF00000012.mail.protection.outlook.com (10.167.244.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8272.0 via Frontend Transport; Thu, 12 Dec 2024 21:11:47 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 12 Dec
 2024 13:11:35 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 12 Dec
 2024 13:11:34 -0800
Received: from build-bgriffis-jammy-20241204.internal (10.127.8.9) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.4 via
 Frontend Transport; Thu, 12 Dec 2024 13:11:34 -0800
From: Brad Griffis <bgriffis@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter
	<jonathanh@nvidia.com>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>
CC: Brad Griffis <bgriffis@nvidia.com>
Subject: [PATCH] arm64: tegra: Fix Tegra234 PCIe interrupt-map
Date: Thu, 12 Dec 2024 21:11:14 +0000
Message-ID: <20241212211114.330245-1-bgriffis@nvidia.com>
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
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000012:EE_|DS7PR12MB8348:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e505801-7da0-43e7-5a0b-08dd1af196e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LHu+CzAkXScODEm4YRGMkHkUvPlZUcg3hmwIq6x5/tgZRkYqZKiysG3Ke/43?=
 =?us-ascii?Q?FSx6nFWWRO0XLTUMEEPlLMuMFnL+Xbi/msh9Oc6zPoSCfh6d0PM+3IPHWCDX?=
 =?us-ascii?Q?o2nICB1wXWkZKjjbNY41dR6jtRWngdfDJ7t4q9DLi549XaV+BEpFQsD3Lid6?=
 =?us-ascii?Q?0alPw/THZh520KwSN1AZuu6cfMQa+RvbKaUPSIzn7eCu/v17xclM1syd64hM?=
 =?us-ascii?Q?5090AFBIDpsbNbCZX/7T54jBLgmeoYLdyliySgG++JtR4WompRqqT/u1oxTa?=
 =?us-ascii?Q?KpUEL7yyBpw6h9+JVi5V2HrcIGRo9WbLYpL1TUUg7P2FytZYDfPp5KmuzrTb?=
 =?us-ascii?Q?BV2vGvZzPRhMdee8SL5ZD/ARJcI8a+8uXB6ZtAukBBFWs6BUvN6Rn1V4iY5W?=
 =?us-ascii?Q?H8lZtiR8I8jF/9537cStYS2Vaz5Yto1AgpT7oJjenZ47uP/Lt1iaalpeUEbh?=
 =?us-ascii?Q?0HU5EhehSqXBydLWrgYwVJZ4i0ZAVi+tH/9tDHPiVRmKmfFKHgCU1DFwAGSS?=
 =?us-ascii?Q?xXoa5fhXiRDTu6wxEUaHyVpHWGPyUu7CxOLxgLLPiPhAV4MdF+kFvKp6BFpU?=
 =?us-ascii?Q?X8hfpH96cRDJSSoh9D/HAiM3v21kmmybN6elDX/bLX529xblV4epVD/jmpxf?=
 =?us-ascii?Q?nfvyYwmGZPaNFksD95TYeJ7+SBopht6axDNl9Q9gDaKcDw4vNqcDZdkJ58QD?=
 =?us-ascii?Q?+8wTP5VdJcOgydm8iyM/g7nL5JCLs2hUi8iNrhylgi8IHTkh7HNjILPk1LMS?=
 =?us-ascii?Q?nMyNqcF3KQI16NI2d18/3Z1iuLB6Ad1xGN625BSAreXRipgU4+4x8Q2FLDBK?=
 =?us-ascii?Q?v3VJS6pcH9t+Y/ofEBolrZLspkj+EXUMqgMcHu2eB5bsPyCDOnvhx9czPMcU?=
 =?us-ascii?Q?wIOYMOiaCOqx6RwETY+ZasfZXSV8ebVLupveJxblkvdxKcWnkcgs1POuXX/I?=
 =?us-ascii?Q?uczMEq+3/4i/0bVP+sJ6aFWQWYpBPBwnwM/n/xrHaE1fAHT0TNhBbKxyLVv3?=
 =?us-ascii?Q?kcloKwzmTrLhOEXoBVb3kBjsgBf8TqRXqpYlGVfFBxcrxVLcV8IzGo44hGAS?=
 =?us-ascii?Q?56lUnGfO11aO96Wa5yXJvml8lEvxJSm7kFBLH/gBacNhKEl0XYN7H60BZqOI?=
 =?us-ascii?Q?4Ps80sK7LEvVu6baLJYtHGPSKBJuxk+9cTO8uICYWYLzLoaEaBOY7hdrRSiH?=
 =?us-ascii?Q?2MK5txotmux20r15RaGq0xu4PGZBHnPdNjjKHdPkhHWEDZ8fOU8gq6uyesZ0?=
 =?us-ascii?Q?IM0St9nbiIRc+PaV15zQlG7jnhpAhtyFVQGzAQiCraInFMtW5Q2tRB5SCt+u?=
 =?us-ascii?Q?vZAk91MFrHiYE7cfi55A41uh+zUwGUSk13QyUpp9Bm7nH7B/EMgqS0yIgIsL?=
 =?us-ascii?Q?JXF2qnbYdA/jgWwBj8AFjTEX1y+X3Qxzs74kUzUQN5Hlyl6HBrLfaTaQCKQF?=
 =?us-ascii?Q?i/Aj2N4AEz4Fh7Ws/+rt0wzGbnWauVrN?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 21:11:47.5747
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e505801-7da0-43e7-5a0b-08dd1af196e4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000012.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8348

For interrupt-map entries, the DTS specification requires
that #address-cells is defined for both the child node and the
interrupt parent.  For the PCIe interrupt-map entries, the parent
node ("gic") has not specified #address-cells. The existing layout
of the PCIe interrupt-map entries indicates that it assumes
that #address-cells is zero for this node.

Explicitly set #address-cells to zero for "gic" so that it complies
with the device tree specification.

Signed-off-by: Brad Griffis <bgriffis@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index 984c85eab41a..e1c07c99e9bd 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -4010,6 +4010,7 @@ ccplex@e000000 {
 
 		gic: interrupt-controller@f400000 {
 			compatible = "arm,gic-v3";
+			#address-cells = <0>;
 			reg = <0x0 0x0f400000 0x0 0x010000>, /* GICD */
 			      <0x0 0x0f440000 0x0 0x200000>; /* GICR */
 			interrupt-parent = <&gic>;
-- 
2.34.1

