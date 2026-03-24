Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011028.outbound.protection.outlook.com [52.101.52.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF25939E166;
	Tue, 24 Mar 2026 17:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774372969; cv=fail; b=MpdBxurOyNnpgVWnwmLHxrhuyQJHtjW4SLrp0DaZcxlZRg77jdNRsyaPNHkUMuaW+W0sK8KFphUDorWNUCX3hFu/XMECceqQAE2XEiFsCv5YB6Y36QgptWl+vLj0nKMsrGpf71ij6JTSB80ue9hdGK2SsjPjCnnYf83H2kntMdw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774372969; c=relaxed/simple;
	bh=ijT+PgY21oZUROO4eaO3LpGQqk3ssFlnhBPB460XK0E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uyuEW1z/AVotoarxznCkoxWqLGhrj2GGTz6eC8y9qYSVmu9o9xW6MmqnzQZJJnzY5Ux8YNysOcVRa8f257bkWC7PwpF9pEXMnYZzHOvduQKDtObV/uSdSysppC6F9DmX8kSDbFF1K34LXDzHRf72Ebt44dW7CzZyLJS+ML+W3T8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hmZl7Egm; arc=fail smtp.client-ip=52.101.52.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hmZl7Egm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w1vgjd+P/Xpy4aCva3RBYCh5ZlOIUJkm1IEEcGBi5GWORW1RDPNLRITiJqvgkaf22+Cdc3ETfHDWjQoLlD0nTJn/lLVnmfagE2R0NqQV9e2kyHQSkRPLf35jsQrsfdUGDZxJXXIZIQ2CaSa1rTUNGaWLcL3fruY+2SpyNd/w7oukberZtIaOe6SEwVK1ExhGe55ci5tCgrihDL+ADUQTGg0RW1aAUXqyR1MSqkQ5LOiDqTQ3CK8kKFgKFOQRMt4txQ5DuokCZKcHoi0N3Gz6pKFV3VjZpKqtCCLwxIUVmNz58PHemPYPbM7kt9xNc6yzf/bN2QKG9wgZxlJ+8zoiTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e44Bi+hnTC9Z/DjGZmffh7y/+KG5uB3gr/HdEQjzUVM=;
 b=D9Uxy9TfeWOQTrMwym83ic3wLWw41WgLd57L7BeruzU+T/o1HZ9kKva3dtIDFm6rpRpD4e8ZIaB1UVJhZ4yS5DDwEyECcm+nhNgJibtcfjnB4bhPrSSX+D4G2GBIQjC/CAEqaNHOq/PCrDD7uStQpW9NSx63pDPZCD46hvuZxwFbj7ztH2Pg4iPY5J6+PVJ0jH6MUQgodBSX+/+8W+AqaaNpP9fUw8lDqpECjMDgWdqu0q8YDIWuG+j4mLkO/7G3oaygL1F5o5tVEfBnK6r5VLpwzkjd7+OdL7DYHFGfHTqUWwWPPQw+T7rwo7quuaZhtHmXVUakwgjdCDJjzCGa3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e44Bi+hnTC9Z/DjGZmffh7y/+KG5uB3gr/HdEQjzUVM=;
 b=hmZl7Egm0rWwcgSrUpMxLz0FKCLv+/kaAbu3HW+qZlksA/q/Bg21DUzfj/OQYlECQOITY5ydBjo9EP8pEzAuZ4i66zucqmJDwJuCfuV84Ir7JgtbXADmBIn2XjTIpUGdZz48pjQKb0SrET6qlFvX0WDwlNNkua1sWOOo8FSaINRQe4tCGWmEgQyCJI+JdpqmP6O1aSqbif3A+XQzjzntjRbWj8Np0p+dY/lxqbDVC8k5RsEkwB9I0jMVcibCIw9PytZ9Hqvi73btHc0HAcgiboXLNCs+B1zRgJgKh7jg6b5dgK8Nu457w4zUsjqWMK0/5rpk4G0BaoLZvytIfmafDw==
Received: from DM6PR08CA0035.namprd08.prod.outlook.com (2603:10b6:5:80::48) by
 CY3PR12MB9655.namprd12.prod.outlook.com (2603:10b6:930:100::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 17:22:42 +0000
Received: from CY4PEPF0000E9D2.namprd03.prod.outlook.com
 (2603:10b6:5:80:cafe::5e) by DM6PR08CA0035.outlook.office365.com
 (2603:10b6:5:80::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend
 Transport; Tue, 24 Mar 2026 17:22:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000E9D2.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Tue, 24 Mar 2026 17:22:41 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Mar
 2026 10:22:23 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Mar
 2026 10:22:23 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Mar 2026 10:22:16 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <alexandre.belloni@bootlin.com>
CC: <Frank.Li@nxp.com>, <acpica-devel@lists.linux.dev>,
	<akhilrajeev@nvidia.com>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <ebiggers@kernel.org>,
	<fredrik.markstrom@est.tech>, <jonathanh@nvidia.com>, <krzk@kernel.org>,
	<lenb@kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux@roeck-us.net>, <lkp@intel.com>, <llvm@lists.linux.dev>,
	<miquel.raynal@bootlin.com>, <oe-kbuild-all@lists.linux.dev>,
	<p.zabel@pengutronix.de>, <rafael@kernel.org>, <robert.moore@intel.com>,
	<robh@kernel.org>, <smangipudi@nvidia.com>, <thierry.reding@kernel.org>
Subject: Re: [PATCH 04/12] i3c: master: Support ACPI enumeration
Date: Tue, 24 Mar 2026 22:52:15 +0530
Message-ID: <20260324172215.31540-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <202603240843279c9e8b90@mail.local>
References: <202603240843279c9e8b90@mail.local>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D2:EE_|CY3PR12MB9655:EE_
X-MS-Office365-Filtering-Correlation-Id: ed63bd4f-0c22-4b0c-4bb1-08de89c9f461
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|7416014|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	YtYgX4QqLVx6KszpDLHCk/yIFztDUw8MMaGaL15XlEi0776586u9MIWwdgTWlF3YmBre1Hou/fne7E7YFBTJtTHKRJp29WfEfzhsmymO3sbcOhBmF2P58uxCyfr2c8/bmDqCovSdxrP4h3HNDHjslD2Buy+lOA51O180ECABVbWGPztos7IE/Bs3JuLh3Pn3z6eYSNiAfkcOrpBqFwjQoV2YeT2fl1MJK90n9qX1VqlSa4Biff6yNrxY/Ii4j8hLb4fTGgkk7ujSseRy9j1AFDcI1iqZx9W0iF2WGuoZ3xkdEOGN5xa2TnOaXt7dvtfyytWx0kNloJ9vVN9JeV/OI3QQYZo7bGrZ23CrRuzI4pcTOK0bbiAEy7w46BFmcdGYgU0rKKlfSA3oXr4Yek5SSY+2nv3FNu/JnXR4vs/NryMIJCE/obXKanJ4Vylan13g2eo8fFfmXEkyvvZA4v/s+eGuaIDJb7qpVPjnchFz2Kaz8zZWTWk9RIfzGYanP3ELRIScJhqdqml1TZVGLdNFVgCT+BbR9LGRpLyO60stH2dkXuaXAvB0Kdo0xeHTwFVxh3eMWXpaC6IpqGaWcYHvMtrs6+pvrB849ODg5XU1XlIeXpBlfurhyrxQUjVP+zXZRYSGE/V2YEx5QavKv0CInTrZBtP1TjZ0bH/ZnNbNrLOOckBTLCAml0wedEIEhdK/USZGH9050PfANixUCN4YGEU2r3CqjCytIDtzaFIIwhh8i2l1wetkpCwKCXWwcQsXZ9nyx7uqtn/N7+Kghn5Bfw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(7416014)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Or6ssy8Ks6m3CBwDmXq/tL6nh0qKA65g+oC7q4IVbz1yqGPtt/s7JDhEpbwUA2OeYbENZm/HiZVXtJfkrk1gW3ea3MiwPsWor85jRJt1xedSzb2n+J9eyZ4JTLznax1LH3nbfYW5RJMEVGrUh4wJub7POGI2JdrkFedpIQozyMJ79SaezvurwCdusfLokju6v/syfIepdFr1mV86FN8Nra3rN6Nk+2bCSU1ObyhpRJYzE21m9MKxaHyd9BFhEo4Kc2OIMvEF6jIIsCPugprYtqoXRldWSNTGWo+JnSyV7ZAJiiO3riX5QJCuxSugELzvE0nvKrRkCOr8i7QY76NhjwqJOWAt9lPcPBeGVtNQdhn6ytxSnWc0YCa4biyvYMt1sSwy80DtQAYMcMzHKQv9Eiw/zE9KTAskQOxMiYRjrLnfG0BBJH8erDOOnKufzVZJ
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 17:22:41.3517
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed63bd4f-0c22-4b0c-4bb1-08de89c9f461
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9655

On Tue, 24 Mar 2026 09:43:27 +0100, Alexandre Belloni wrote:

...

>> #include <linux/acpi.h> is added in PATCH 03/12. The functions' prototypes
>> are present in acpi.h. I think the bot checked this patch individually,
>> or did I miss something?
>> 
> 
> #include <acpi/acpi_bus.h> is behind an #ifdef in acpi.h and your code
> is not.

Thanks for pointing Alexandre and Guenter. I also noticed that we do not
have stub functions for a few of the acpi_* functions in #else.

Looks like I will have to guard calls to these functions under
#ifdef CONFIG_ACPI.

Best Regards,
Akhil
