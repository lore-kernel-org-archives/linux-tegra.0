Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2045.outbound.protection.outlook.com [40.107.243.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF1367C6A;
	Tue, 20 Feb 2024 12:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708431483; cv=fail; b=mhDl7vEeorzDEeUsDVnuc2r+v626tcJEFW0W5Qs8SNOq5iMA6kGf/HSTql5hAX5dSO6BpKmSADBoAQJXfc2KlWYOpgIU0AiUZ/9dY7/CNa2ab3EyhCfVXglsukUCh4Xp046jhTkjFl8u5lMZneB1KXoibglR7ij66TzfHO53ZBc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708431483; c=relaxed/simple;
	bh=SV/4gckev+COimu3hZTD6X2kuUigAVkBUbi8Pd960Co=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=riNH2vVvlacqjmBDxJvqMKvF9Eq3feCAil0+e3oMJiWZSBtgKzFwO6hzsJbKUuEpBgOrDcATouP6PCYgl0czLoPi/RrHfQm1jdzUe1mClY/oH1X2p+yi1l21BOhAseGw4icTTM2KGBggREsgc/k+pJKfl36KjrU0OqweJ/CWIWs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jgV8DADc; arc=fail smtp.client-ip=40.107.243.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jgV8DADc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DauXkAltWdMAuI+0Dsw/fD1NkjXUPcu0A67eKxFVlDNgQZAduXBVBQoLaj27dxbnfxi+TJHDCYsFX7CPEbMOAFSA1SgseoX5uQObPGen/sK8etZyunN7hKcSO/fBmcTBAZkb2HDhFKswBheXnbE6EW2NSwxB0HOWf7P+UZQGO7x6+U3u14jJ+AlwnE5YberhBSmC08XTe+BYj5R4hKKGzsGDhsHgYMEs3tCFFBxEtIp1qVB9bk4RQ2hqJZkqKyd7VEJiRcnH4w1rnqQALJ40KSmM0qzbFUX1UumOkfV7XQp0AikDMmKXYL+3zXg3Z8fBfzuv6dyYc+jcrCoJnDM3iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G8njTMgGFnggQiD47IoVDGp3yvSZYGAifUgu9OUDIQA=;
 b=LZT3wqABdyLeRZMok0su3hX4iJbWFz0i1yUa4J46sZL3XTmkl21CBw/SLFR/WgQhfc0wibyzD5hxo1bLqcPQqbVVuufwjeTecdxrLv3dOyKXENAe2JSWzTk8w1wC/UPXh9OOUe5Ylruv7O0GQuDo4MK1J2T22V7/HoNVZs3RcOVJjRAbZ7RUZ3LPx2lLvh1Yu+zfKZ1NQ4y4t6mknwp9WxVIzWOL/Fgy6J+Tg7MUcOoXfz1MBP7ygRB0eOxylcqi03AnNZCYI+vzWpmKHVufDuh8OUFpjH5mDUx/wX51FfxzXw7A3KxytC17eDIl9gO9zTw2Mu2bdLY0Xaf7zgzgrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8njTMgGFnggQiD47IoVDGp3yvSZYGAifUgu9OUDIQA=;
 b=jgV8DADcnUrB60iOiXaAi9cEgj0bLImSQ11S2lMLkZ2mnyqNdTHvkWeTMDsfqqCNgZTBu4m3vekWAWYkIHt55jM9SswtbmxZs9ks3koPi9/r5FeMwTAlGWP2wknpaRounZLVlRlWGBX4rpjybHZrSH1A4NDgZzQX+MohwCRXFG/CczaR2+gREPVDfbmQWFSDYaNiux92JKoI2EX+HIFlRmk9w9ToQUvcYbFkcUydKxrVm40cOOst0EnW7QTeaxQaWziovBmgBV+sy1SGrylMIEklCTyx7E08S8gzlvu5tiQZ4ZYGTCs4DGG30Q0VXlV56kqjNICfoEz0DvvUoB7Azw==
Received: from BN0PR08CA0016.namprd08.prod.outlook.com (2603:10b6:408:142::35)
 by CY5PR12MB6345.namprd12.prod.outlook.com (2603:10b6:930:22::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.12; Tue, 20 Feb
 2024 12:17:57 +0000
Received: from BN3PEPF0000B076.namprd04.prod.outlook.com
 (2603:10b6:408:142:cafe::a2) by BN0PR08CA0016.outlook.office365.com
 (2603:10b6:408:142::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39 via Frontend
 Transport; Tue, 20 Feb 2024 12:17:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN3PEPF0000B076.mail.protection.outlook.com (10.167.243.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.25 via Frontend Transport; Tue, 20 Feb 2024 12:17:56 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 20 Feb
 2024 04:17:37 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 20 Feb
 2024 04:17:37 -0800
Received: from moonraker.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 20 Feb 2024 04:17:35 -0800
From: Jon Hunter <jonathanh@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Jon Hunter
	<jonathanh@nvidia.com>
Subject: [PATCH V2 0/3] arm64: tegra: Tegra194 device-tree updates
Date: Tue, 20 Feb 2024 12:17:11 +0000
Message-ID: <20240220121714.16543-1-jonathanh@nvidia.com>
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
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B076:EE_|CY5PR12MB6345:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a150da0-0129-433d-e7a4-08dc320df8ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1WZIdzX4+isl4JrFUUctWsxaC1NJlc+SBBrdOkJeXy4A4fWX3EdE89L13Jm8cizLs8rCJoS2oeOm2b1S/GSHstk4jftbZ6Fm3xpr1iJ3MkNgX3Hwz31kptXSI+r+oe1h92JrvoIShn7o66R8dxiGtt+51iM6o3+4UKuL8rlHo725Qa4e4D2AAW+eZ56HPLuiAJPKGDsbuDzB4jHsabOVNXcF7qhknI1YagLDlREGiY64aPoET2+CjvKOJosHxMQEUsi6jrL1hI/Qz/D21ihaS6xqkgZLjCVynUwZwTFp+wixzRPoYQGaSzTYGvbaJE3hDG4GzwtxtlKjD9ajrTnKwY0fKHX+5vkqO1bGSCKzI9C4bUczG+KPBpiQJMcG46ATpORxsoFBeCJSGbL8L6L81EXXJog+NNWd7Ju6BRHHu6WFUMRYYO1sL4Anw6sd7Y57KqE7oT3tANaWM782zJm9yk6XTRbTtGoEW2dZHt8lvv0jfsm1uXEUAomBG/g3jdD97jycgpP5nenDogzLxhi+UWYdhjyktOpznyA3YOF8CeR32cVVJ/Asx2tXLT8uuUrzspb4klJ7ygiNXGd71chrosm8YhJpIoaz2pyRdEE4VG30QGjmVi3pTSXUamVTZHJIgJIq0Z+30bNREFZAlG8Otfgif4f5i24TWwfEBgE1qrw=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(36860700004)(40470700004)(46966006);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 12:17:56.8634
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a150da0-0129-433d-e7a4-08dc320df8ed
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B076.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6345

Add the current monitors for Jetson Xavier based devices and enable USB
device support for Jetson AGX Xavier.

Changes since V1:
- Used generic name 'power-sensor' for current monitors

Jon Hunter (3):
  arm64: tegra: Add current monitors for Jetson Xavier
  arm64: tegra: Add USB device support for Jetson AGX Xavier
  arm64: tegra: Add USB Type-C controller for Jetson AGX Xavier

 .../arm64/boot/dts/nvidia/tegra194-p2888.dtsi | 50 ++++++++++++++++++
 .../boot/dts/nvidia/tegra194-p2972-0000.dts   | 51 ++++++++++++++++++-
 .../arm64/boot/dts/nvidia/tegra194-p3668.dtsi | 27 ++++++++++
 3 files changed, 127 insertions(+), 1 deletion(-)

-- 
2.34.1

