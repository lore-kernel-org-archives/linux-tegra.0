Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011066.outbound.protection.outlook.com [52.101.52.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825DE382F36;
	Wed, 25 Mar 2026 21:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774474038; cv=fail; b=d7EQaPNkQoVwJ2MIIe7QJkH0Zj0QT1rCaS9/PWy1dBmCnAHZWPV8X+zZD5y2gIiF2H72hduB5LtxKXWPfK7f/DYdTmoleGnvy3OH+8NCNHWGhAnaMfby4J7omQ+gYNx/0yePGJJUDx2mFwnS6mRFd4VeSC/0z5aq9gWPlTJreW0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774474038; c=relaxed/simple;
	bh=MAXLGt3cmziQnr3BYBqO7dYSuWNRaj+419kkAw87imw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Li/5IXRqOCcRWkWeZtn9M+JNClFKupCgsvHmrd7VML5bgeHBn5gESb3u+ZbfzgjkddLfFIh8rf6IBSDHPWtHiA3CixwckUDfVrFUI3RPilQ2rbGrWriIB7sRZEvRfHPR73SvARODdz2PV0FSXzTOr9nFw1sos5C8nzqT955XeBw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BmTXbIbb; arc=fail smtp.client-ip=52.101.52.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BmTXbIbb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r39n8en2lyatcyhbZWhNWIksy0CulcR88r0BpkvhXdE0kqp9r9T11g7qchjS8f66c92YZt54389hEzIsfIndjMUWm4Nj7+EECeTM/z1FKVBNfEoC7rpN0S7p1t8aJ4p9qZSDvkWYyG05ix8v8zCTjMncS3I2xj5eJIhnZN3XeHSWkwFptgtyv66pWCDyomSXrxPVp/vCy2H/py4f03tC5AsjoC0/qJMqBpwHTlInT3baiyCdZ8BHAwnVi9Szs6JhTVpl31WUhtxF0bXQxEfA83ppEBlNbwIA53guzc/onFvct7dNvcFzn5e0Hi67XB3x43KHTkhfZn3QcPFEBHpBog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sH61WpkOrZvXht0RLX/pwQZPtLytj49fYycxI68gCOk=;
 b=qRjmrv1VNrmVxunq0mr8lBCQfscSlTPLLC3I2V+DqEqR8v8TbihTx95Q+rDyqcyZA+tpv5kcjVbxh5PbkAXwyIB8iENwTSa522zh894uhsGfK+OEBnxkFB0hJjK1oQH2JqFpwnIiQqxwudUp7YvmMI7deZ4uGjIFigjEm7CtkTZKwvsCEH3mDcFlNoGmR9U4NNNXAEaWLMCXWpd6rU1sbW3E0m/YMQTkaH+1rMV7Exj3F/5FajvGAQII/8reqBwAi84jUBWb34D6s2vyagojMHPLwKTQHMva8zbisoo1SZoLlexvQg2QrNhn6oMNObOAenevIurN2An+ufcsS+wgOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sH61WpkOrZvXht0RLX/pwQZPtLytj49fYycxI68gCOk=;
 b=BmTXbIbbTmccW8aIWoZODoaGoBifqiUt1LzgYyLZUxvysObKUvP9BooBVWvSevxLOdVjM/lCqQaOUTcA9dEB1z+5XMOiBzrhuadxgoNxUjuKzjZVB5QVVcQj8HR2Ns2fAYXLV8Wkmx456vxtirN/t82U67wJxhPWaYXPafnWWwBWYMObQFhyuOQ2JhkYca+IEGjqxVhB0ti5dQJfHgP9Ps7k8V1kmaMUD9A++P755Yjs3Q5TVmEJIZutZGJe8jH5ZtojJmxid1QafkkvJz5PyU4cpWxg1RhAX4z57UmdXur6Ajbr2cAs/4mCLCTA/eXxU5dY4Qxkp/WcvIp1qnsnrg==
Received: from CH5PR02CA0019.namprd02.prod.outlook.com (2603:10b6:610:1ed::12)
 by SN7PR12MB7882.namprd12.prod.outlook.com (2603:10b6:806:348::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.6; Wed, 25 Mar
 2026 21:27:11 +0000
Received: from CH3PEPF00000015.namprd21.prod.outlook.com
 (2603:10b6:610:1ed:cafe::9f) by CH5PR02CA0019.outlook.office365.com
 (2603:10b6:610:1ed::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.33 via Frontend Transport; Wed,
 25 Mar 2026 21:27:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH3PEPF00000015.mail.protection.outlook.com (10.167.244.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.0 via Frontend Transport; Wed, 25 Mar 2026 21:27:10 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 14:26:49 -0700
Received: from build-chunn-noble-20251215.internal (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 25 Mar 2026 14:26:48 -0700
From: Chun Ng <chunn@nvidia.com>
To: <linux-tegra@vger.kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <chunn@nvidia.com>,
	<ankitag@nvidia.com>
Subject: [PATCH 0/4] arm64: tegra: add initial Tegra238 and E2426-1099+E2423-1099 support
Date: Wed, 25 Mar 2026 21:26:24 +0000
Message-ID: <20260325212628.1234082-1-chunn@nvidia.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000015:EE_|SN7PR12MB7882:EE_
X-MS-Office365-Filtering-Correlation-Id: 8269228c-bf3c-402a-eec4-08de8ab5468d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|42112799006|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	8RF0XuT1FYxOocL2apF06M4J+wD42aeyNQr1aWDLxKqrfzn+9CRlEuPWdoINuUdE5kC9WDluMdM4nl5R6wxwpfgeKybdTdzRFS3ooUsxPzQEneG3Gmd3uH2RzYEjQ6OTt9/fC6qXT0OjJR7U8DNG1i4phScjT7piqXTqCpRZxvUSQX3sKG820mUAmGs+mbjupLaFTtJ8IkS73pmezQQ4PGiNkk8A+NbBQw+OqaHHUSzD1YUHy5i0Y/GFTjAP+Mueylg3+00mOTutCQe5k9x4ZMQ//lZzkSreLKbv/t4aTGS6dAZ8jEr9/Y3vToRCWQzanxRuy8rzYwVHJfWQtT1bKg4q4KiMFarDc2e0r7U5y7bwalroUxc/dh4dTW2cnNerYG//kbTaBvvkyU/++JgEU+H12CwSvd/NgGr97AodBbt83gFPW1x+h58hPi0qOfgAFYg0M/z+xvBCPv3cax1SWiImRuz8tNwoD5PR/lWutb0lfWahSQQnjN/FqbwQStmQkcdZUzDcHMVEGpQNDJBtIVmglqIKq/VDk02a9uQ7t2DnFUUHuPgY0qA11k0V02TIbNvEeScJ1yUhxTzAvjXe/aKHUd7eJHibqz2SYtdlojLU7NXwdvg7FVgILiQ/IkkjShTJ7TfB8orE7n4M5vN9O7lU9U9PgPnibN/8P0YOxScJWy7BoP4ez8WLO0fjfjLpf33uljkxXAIOrekhoAIO+/ZVcjCVYQi0b71+cRS68ZHVdqA5pBnqH6O00Uf0V6LttGyNnZrsZLQTpZQqp6Ngpw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(42112799006)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	p3xjmFDBhupKR9xO910Ob79lCUuLzxMpFEM9cvrcNzQeJDMIyVcz8uYmBGP3lYI2t4oZVagwsygrPzxaOwS9F6kTe4V3PKIzBBmX9SoYymRT0l/djbs/CA6t3cwt9ARcvf0uAMcG73EagueicB7FoKNpD7ZUkmkcAhErwS8G6QqQ4I0yQpsZp8iimnC0fGPFVlmZmSMzZagqATUPcu0tnXW62oZW9aJcfOplgW3UxegKgUPNNHu22i7Lsu26ZpPp9ic9OP01qcOjLSDYrV2Zw+HJEF8u+ZDt+a3sg4X75Ad62H1j1afV7tqjf0HebkPEgSDW+ero4GzfkAlEf6aFyL2l1HX+oZUj+meuV5jAexR14Td8cu8o5MJ9dsYG/D3XnTaW1mixvyysCTkJvWiyA3pdwPhgd8e+oWRTjgPcmYHe/4clsd+FXWxHLRaVUdGQ
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 21:27:10.8922
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8269228c-bf3c-402a-eec4-08de8ab5468d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000015.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7882

Hi all,

This series adds initial support for the NVIDIA Tegra238 SoC and the
E2426-1099+E2423-1099 engineering reference platform. The series follows
the pattern used for Tegra234 and other recent Tegra SoCs.

It introduces Tegra238 clock and reset binding headers, documents the
E2426-1099+E2423-1099 platform compatibles, relaxes the tegra186-hsp
binding schema for HSP configurations used on Tegra238, and adds the
initial Tegra238 SoC device tree plus board DTS.

The device tree added here is minimal scaffolding only. It is not yet
bootable, and further enablement will follow in later series.

The patch order puts bindings before implementation: clock/reset IDs
first, then platform documentation, then the HSP schema update required
by tegra238.dtsi, and finally the SoC and board device trees.

This series is based on linux-next commit 785f0eb2f85d
("Add linux-next specific files for 20260320").

Tested with:
- make ARCH=arm64 CHECK_DTBS=yes nvidia/tegra238-e2426-1099+e2423-1099.dtb
- make ARCH=arm64 dt_binding_check

Chun Ng (4):
  dt-bindings: tegra: Add Tegra238 clock and reset definitions
  dt-bindings: tegra: Document E2426-1099+E2423-1099 platform
  dt-bindings: mailbox: tegra186-hsp: allow doorbell+shared or
    shared-only
  arm64: tegra: add e2426-1099+e2423-1099 support

 .../devicetree/bindings/arm/tegra.yaml        |   4 +
 .../bindings/mailbox/nvidia,tegra186-hsp.yaml |   7 +
 arch/arm64/boot/dts/nvidia/Makefile           |   2 +
 .../nvidia/tegra238-e2426-1099+e2423-1099.dts |  16 +
 arch/arm64/boot/dts/nvidia/tegra238.dtsi      | 190 ++++++++++++
 include/dt-bindings/clock/nvidia,tegra238.h   | 279 ++++++++++++++++++
 include/dt-bindings/reset/nvidia,tegra238.h   | 125 ++++++++
 7 files changed, 623 insertions(+)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra238-e2426-1099+e2423-1099.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra238.dtsi
 create mode 100644 include/dt-bindings/clock/nvidia,tegra238.h
 create mode 100644 include/dt-bindings/reset/nvidia,tegra238.h


base-commit: 785f0eb2f85decbe7c1ef9ae922931f0194ffc2e
-- 
2.43.0

