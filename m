Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2080.outbound.protection.outlook.com [40.107.223.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175F02CCB4;
	Fri, 16 Feb 2024 12:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708086505; cv=fail; b=S3JOAh8QH3EnFUr8B+Ao3HnEVGZ5Fb/3DeyOICtinDI6gt2lievKh/Cg23wIOoEwOA0sQmscZD5AhEpEK7tPvjn/KSsJo52pnN1U3STB5K395wd0+bj1C3A2ydfqmlCbbkrXhDXhzdB9m8xC4MbbyWld6ny4Ekb/pYlbYufLAhQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708086505; c=relaxed/simple;
	bh=e2kjbGUxxP02EQgP9hVK6zRkU/GDvFX7W8zmA3uNcfw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XCyz4nCOP3oR8XXOZ/oXfMLNosSrIXfqHoxSAEmNxk37Ngwg4k6ayocHBVaKscChAX9oSUbeu+4gA1UnO7SlyBfMD736SkJ5djxmH2bflrcFTaANK9TbiYigt95TrLMwCGhLyChDtPYbxXA9/BogzmlYbmdJ/I1QKIEAkJZIWXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=efjyJOKJ; arc=fail smtp.client-ip=40.107.223.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="efjyJOKJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EzkUbfi8+ROUv+ofc0wXKuqQPiFLWY+NT57uiMmEai8kAPDpvpRhby9eCXCqQoCeVs3trfQalcGMjl9nt5VyGZYVljutno/LPVnMRwMKU//XpB8VSA8qZ8NuNwJL/9Fl4/K+22Lu5EsKkOXgOsWSk09gviH8KF0pGdo3lin+kShpqiymLs5oStEO4IW/TmTOyBzmlUpVjWkNA0k0QkRuzHhJ+atpv9oLZ4olhqnpD/Z9X6Awnv2rS5uR+YbXoetsslINp7t74mk3Tls0fdH5TAXK0luS/vXt5VlIw4aGpO+JYpf3UG8qjZSrJH6KARe+J4+pVibU91x02HHOzksoEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nhp7+FzhpmIZf0BXCGqos+Wslm72+yZl9JZcFdRDaok=;
 b=lj1/VvmNct+8t4X7pfTd5bbmmOJZ/xUY85iBqIcCIaUtMEilJfA2NgbGxrk4K0vHp4UoL32PfvYecCyfw3mVfyOXUl6wuMtP/Iok5ApkV/SM6fCuzJRVzHMrMNoHJNLCRWmChdAvaelvrTHplrkRJcZRMGMWYyV7832KEqDXXmyqS0dJAnXOip5hAwi1zusr9pxRpXpUPWhz5bEPDg1l2IyZBNiSp6HRqghrr7DAaqH4MYAryKYS3g1cVK1XIBXlF3hUIrRcQ1Wvazs8AhXz1j0pHIvqRxh+kLkZVG7f1Bacgn2tdpv8uFb9UAIPB+Aste1W3zcd754dov1YTmBjlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nhp7+FzhpmIZf0BXCGqos+Wslm72+yZl9JZcFdRDaok=;
 b=efjyJOKJbqHSfORMkr/cqZdxcQsPhw8VHOoqITDqTm740xO1Awkh+byFTrhrRjsIdYh6tldxegZNY7MQ/f0hY/fJ4QicWwr/9tKiqZuGanjFc0mRAbGBzhJlRvbQMLq1gwjnL/TswmuHE2o0FgAx+rWwtj3Ycv8pZ1vqhFLdIf8Azuzyuc7G0lvLmE6Do+78wz/IZlgG2Mnu9gPjaqVpCTbN6aX+0vqJkQX1QS2wTuIVxHlaV3oF9io2zHndL9wDcxLunMl8RQQmsHDVltWRR5pnETbSsjJ+kHYD9gWs53rAI8sMSJoMxOXvf6HlCXs8+G12l2YmK3Vsw4sR67MQmw==
Received: from CH5PR03CA0022.namprd03.prod.outlook.com (2603:10b6:610:1f1::8)
 by IA1PR12MB8518.namprd12.prod.outlook.com (2603:10b6:208:447::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.32; Fri, 16 Feb
 2024 12:28:21 +0000
Received: from CH1PEPF0000A34A.namprd04.prod.outlook.com
 (2603:10b6:610:1f1:cafe::f1) by CH5PR03CA0022.outlook.office365.com
 (2603:10b6:610:1f1::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.29 via Frontend
 Transport; Fri, 16 Feb 2024 12:28:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH1PEPF0000A34A.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.25 via Frontend Transport; Fri, 16 Feb 2024 12:28:20 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Fri, 16 Feb
 2024 04:28:12 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 16 Feb
 2024 04:28:11 -0800
Received: from moonraker.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 16 Feb 2024 04:28:10 -0800
From: Jon Hunter <jonathanh@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Jon Hunter
	<jonathanh@nvidia.com>
Subject: [PATCH 0/3] arm64: tegra: Tegra194 device-tree updates
Date: Fri, 16 Feb 2024 12:28:02 +0000
Message-ID: <20240216122805.32529-1-jonathanh@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34A:EE_|IA1PR12MB8518:EE_
X-MS-Office365-Filtering-Correlation-Id: 72d4ee63-5116-4d8c-929b-08dc2eeac2d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KTriiXSvq5VYzkgQNQ8dVyUXMqhTSXmVLsib3jJ41rdR0w4PzK74amHTbh0agnYGGKARlOuxSlyJO7ee9vSAd/UkZskqQvDNaFiGeRsErrObxRlnrEO1rVBiR4qkZoFcC8wH0dBh32UnbKD8Zwmsw/EiF5lj95XJszHw6+vqLv4d/NsxdkU17p+W3U1JooOoMlx3jj3RRza607HgER7KPkVKbi3VXGREBUBw/IBjifMSzcUMeuV4vzFMLLfGnyCEnPya/vLF7Zz8eJx0oxRUyJ6osbKSQvE3ITDFFxVQCr+GXpYaD2rSLorjQl8YWj0A26vnD/PGQTBNrP27tEfjGVP6nou45AqmGMXCn+xXZ1M/duzQuZkMP4LQ/tHoumzix+B/TRdKJHJ7dodqJzUNpSMnLJ3iiN64GdGbM9AjWjseGR6JhVIDLMJnkpYLyAwBv/cv1KUKYNfYCRQJlez2/ITd0+0z8b5aJvbGOmOUoNy2tAI3khTSJLmb1r5HVqzQIYB4EhNDdP9rlNPpUw8sPNlWKsiKdfVdQkp8M53DxywSVPFDDbci2xY6JVb4Jbtkp7+amiBXvumOYF4mXMoRzBK2WuxQfavclgJpDaL6fqDbzwYE8JD9+tsNntzhHET9isMYNvsW5y00agTsHr1m0qUstX7uDi2/sTw1BQp1iHg=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(346002)(376002)(39860400002)(230922051799003)(82310400011)(64100799003)(186009)(36860700004)(451199024)(1800799012)(40470700004)(46966006)(4326008)(4744005)(5660300002)(2906002)(41300700001)(8936002)(8676002)(54906003)(70206006)(70586007)(36756003)(86362001)(336012)(426003)(1076003)(107886003)(316002)(110136005)(478600001)(2616005)(7636003)(356005)(26005)(82740400003)(83380400001)(6666004)(7696005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 12:28:20.4141
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72d4ee63-5116-4d8c-929b-08dc2eeac2d4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8518

Add the current monitors for Jetson Xavier based devices and enable USB
device support for Jetson AGX Xavier.

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

