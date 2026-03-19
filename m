Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010002.outbound.protection.outlook.com [52.101.193.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741F039903C;
	Thu, 19 Mar 2026 18:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773944290; cv=fail; b=lOgDw3+VY3G1rmiXloWV/PLKJXyPrFjgMiV/XnvpCymczBJKu8NpMHm9QrWNb1WNBHOOcUM+FlKogBxJFNhSxmqJ7YtJFRtkzWCq+1I3jW+WnoKlMdpoG3DDeUKiPPEU8agm/b1tWd3oyaNEJBsgceKOGtTs5sM2TI5Tevn5sxI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773944290; c=relaxed/simple;
	bh=Wvp2QPW2gZUzlNIzsO1sD4HAI6Iz8F2fR9N01ED+zfg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AycnYxRk8lbNgxp8rJkURgErrb459nsaLjShHKi/kow12dJsIPY+vEtRqDwVcaON3RlonuFhtcyYRW8vrb19fwLz0honoh8/hvAf/lQ7qzsL5DXlgwS/LUsl5NgdWRBcmDEuEHONxu4PyxxUa/cHRGEViYTPUYaWVRFOYsp2bmE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XnnIgoFl; arc=fail smtp.client-ip=52.101.193.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XnnIgoFl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=olaHKfdf6YbSpyvXE8Qz6ezX0NwWzGTFACo3bFtMz729RgvY/8LGEJrzVgf7BvY9f2UaNhYABGjXFSvrzcgommDAlnEEwTouGApABcWPP8sxa5JkyuiAPNo8D/iz0u9ks0xmc4FqG1qjZZXfLGa3o/ujygLfvSUUv550Xuo/NY/pr5peq7mVVHtOubefHSdDm+akl0Og4LwnM3+6ctnm95FK0DEh8HwF2OkVpj9qshici387dS4ZowxzHQJijILrfNplg8pUi8arb7osk8kfhEbIptgjn0pE+vdx0ZKpVarEegttvfAPeFRb6GGh7DTIGXa8eKqiyESOhBydQN8HuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pvOvO6+FSQubnw0MKLqhn2UbkwryzQNikH2hJKdpyZs=;
 b=tWRhbnbRsuUabg+BRwXKBYaIyAg7SF4LUawuchE0hG7twbgsD9vB34oIlfj6/fIQUrnuxeDVMs1qn+HmS+YfkKljkf8EgcBtV+y0dTDk9E3W35bhCfqEacSbkjsm7wdBrmaFBNspOO2OCUAaOg+ewpZrDaKRIyGPxs3FeL6e1m7djUoLRkH33bMWGX/RLd1E57oiDbf6+lqda+qZEZQK38cvlvAsCMcgRNksFmpT5KzlX6YHXCsOwRiFBTKBGSyLApW3+SI0x/iypPE0J/zNPt9hmtuvxoGjCA0M73Z4G2+VC2itCp9hQwbmX6b4X1TwEYFMWIjykQvf+k0C6biMaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pvOvO6+FSQubnw0MKLqhn2UbkwryzQNikH2hJKdpyZs=;
 b=XnnIgoFlPEUPklXGCqCoyohsLgSz7KYbWjsVdNqtPfADfQ+6xSJVzMORmsOoBfzlLsCG3i0VQ/Brvwll95298NoHjsUVsWN3nJA9c2PYAP6R/WbRP/LmaDpMe2TXvif2iLsb4o+PtvmU5CtpXgjAEYtn+7BAyTGtl5AmyRK6oQXt/EmjuEiUOIISVsQThovZTXascorVG8tbIO3jkACoaG8pxp8PanzC9pqXUJEgc+GtJS+qvRoo66rHDyTcAa3sBmr3xQAaiAGoNuOndVfiHr/KcqyvRKJBj5UD4X5h/D5PfpzL3nLXcC6cuwfWdsjVwqvktwixl2ryR9Qgr3P+8Q==
Received: from PH7P220CA0146.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:327::32)
 by DS5PPF78FC67EBA.namprd12.prod.outlook.com (2603:10b6:f:fc00::655) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.17; Thu, 19 Mar
 2026 18:17:50 +0000
Received: from CY4PEPF0000EDD6.namprd03.prod.outlook.com
 (2603:10b6:510:327:cafe::2d) by PH7P220CA0146.outlook.office365.com
 (2603:10b6:510:327::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Thu,
 19 Mar 2026 18:17:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CY4PEPF0000EDD6.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 18:17:50 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 11:17:32 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Thu, 19 Mar 2026 11:17:31 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 19 Mar 2026 11:17:25 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <krzk@kernel.org>
CC: <Frank.Li@nxp.com>, <acpica-devel@lists.linux.dev>,
	<akhilrajeev@nvidia.com>, <alexandre.belloni@bootlin.com>,
	<conor+dt@kernel.org>, <devicetree@vger.kernel.org>, <ebiggers@kernel.org>,
	<fredrik.markstrom@est.tech>, <jonathanh@nvidia.com>, <krzk+dt@kernel.org>,
	<lenb@kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux@roeck-us.net>, <miquel.raynal@bootlin.com>, <p.zabel@pengutronix.de>,
	<rafael@kernel.org>, <robert.moore@intel.com>, <robh@kernel.org>,
	<smangipudi@nvidia.com>, <thierry.reding@kernel.org>
Subject: Re: [PATCH 12/12] arm64: defconfig: Enable I3C and SPD5118 hwmon
Date: Thu, 19 Mar 2026 23:47:24 +0530
Message-ID: <20260319181724.22091-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <67165a1f-9fa3-4853-b530-b1f9d6e4c2cf@kernel.org>
References: <67165a1f-9fa3-4853-b530-b1f9d6e4c2cf@kernel.org>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD6:EE_|DS5PPF78FC67EBA:EE_
X-MS-Office365-Filtering-Correlation-Id: d42896b6-1111-4b1e-11b9-08de85e3d474
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|36860700016|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Re0a+2bJ/Z3OIPtX78ZIDiMNfJ/08hRpVmHY0F4DZDisWmVMJiq8BxSvbw9+M8/HO5JynjPF/heLCJUfG+ExaXzvs4qJa4c/A+lHJnRMGrD2KaLbXvb0q2yg84GTa5JaVzOm6xaZK00dGCD9rGCjb4EVk3m9KM81tNMfGC54lyhupto/I4pZfVlLYr+vyKtzhb4TFfN/h87ysMuD+ZtUWbAdyUxCUm/2/6oBYS7plYY2nmSwwN78HO9Q4eLLHL7nMssTy60+WBuecqFuhZ+0o/JRvpa9qCM7kjzCVwO0nHPovCat6KhFLPhf3DMnOSOnJekXZKCFA/e4/m5p4sBAjImPwZpYMjMjN1AtJX2rhkP1JGndnHpbSPy0mwn9c/b2D3Liqo2nk+pghsg3K1GaYvMLQcFLcdKn5F14V6f42c8fGd3yfuv/EWLJTaePJUCANFT9b9W9eKlBTPzQzWXW6SR6Jo2RkUqOVcjBcMWGwU3yJ9OVApvVj7Jds72P64ZnYiPEEChExoBicEwEdFXFkHqjvbAZn5liUGRD12XW3pbWyw2Fa5WgfylP/HKbM6LgJsqda03gyM+0mKqqGf/+NYJ8FIK1QnLMSYTRN7XFioS/Rmfi22Bh4AeAh1rtoQYJ04meKoS3AGhiZK9wA6VFDpxfB21Yd1EAKWzNsM2QEcUAhItPbbZ1cF4xd5Nd5ChozdtYxxLNqTG5GgR+pHJqbVB/BcxB22vJmN4UrXVrHBIZZ0L/9pR32Y8rFO4QLOUuBtouqjQYsPLwtZuYKBMxTQ==
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(36860700016)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+ZF3YgJ1ijEesYfG9TiPJpaHOVmAtPhwNvhDeexw7eFzlQqImqNKDqRzU0dWGC5dbFW15JJzTstFVPiogKTEikWctu9bCVXm3Qwl8CwQtawxXCrxLODgCsyM+FotWo/Mtlq2nG8w3rBAouXI5j5qQ979/iaMr13EzZHP9TKX8VZm46XtYTaOUBTdXhsqOd8g+l3L3/Hd7rbQ79WvRe2YVfe87N4DWwfGsebrcNPa+5sLwG4xXOXx3wbTLmRcHxZfejQqdB20ryg4rc7NH8iHA8WG5yMVVBypOaLiEh20h3R/BONBDmedYWwhHOveSlBskpWpwxpGfUnerUq4BTyMZ2l95MzaB8uf83Yl/Kb89Ch2DZjZ/maN4PjB7y4CLKq8A2ucTLLRsVsFyDX40awANfLzf3ZB8C2AvwkbTguz+wyoSaCQflYFxV/V4yh728kk
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 18:17:50.0320
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d42896b6-1111-4b1e-11b9-08de85e3d474
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF78FC67EBA

On Thu, 19 Mar 2026 18:15:14 +0100 Krzysztof Kozlowski wrote:
> On 19/03/2026 18:09, Akhil R wrote:
>> On Thu, 19 Mar 2026 10:40:34 +0100, Krzysztof Kozlowski wrote:
>>> On Wed, Mar 18, 2026 at 10:57:25PM +0530, Akhil R wrote:
>>>> Add I3C subsystem support, DesignWare I3C master controller, and
>>>> SPD5118 hwmon sensor as modules to the defconfig.
>>>
>>> Why? If there is no user of that, why would we want it? Your commit msg
>>> should explain that.
>> 
>> Ack. This is for Tegra410 which has a DesignWare I3C host controller.
>> I will add this in the commit message.
> 
> Board or products. Not SoCs.

Makes sense. I will have to get that information. Will update.

Regards,
Akhil
