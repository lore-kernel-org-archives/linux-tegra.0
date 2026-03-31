Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010028.outbound.protection.outlook.com [40.93.198.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B44F399345;
	Tue, 31 Mar 2026 10:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774951777; cv=fail; b=U4D8KRuBNfnbViK0JT3PkQrDmUYzPfotDRRrFyTruwiRt2aKrpTezNtWZkgAkOXykyasj53xm2ZEAWnBY1EpCyWFJTMAB9PHDsNsajtOAk5DB3lQDGAHHa2cFc/yFtQFcB7XZ+deGXavovk5zskGg7WdsAux+5PPyh21pOttirE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774951777; c=relaxed/simple;
	bh=/Q7VyRE0kz2w0ERqr2gblIsDYOpcA2IW9vANTQE8nLg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J5wmrEb6t/8sI6sKdTHRY1pRlBBzhL7jqKrxDEEqKaPVYhCHwrsz6kDAByeDLjtPOLIgNKPH7Uo8Gq1VoTwVU/4xn8RszR0a4Mwbhd27oEVnZAPmCxQlnCQeSmqSoU9i3jfj4DMO3KZ1bpZ42IIHQzd2WYYXkbjvQSy7UqlEo4w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=i3oxRlQ5; arc=fail smtp.client-ip=40.93.198.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="i3oxRlQ5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qb48zAQFIXMpKf3cbZoXyNcvHYh4ut0s5sEDVbVdpPMBq8euubYbuNl3KBOXyCdBsyY6FAN/+0soK0ZwkVGMfDKQgkgtUBUShNuUjwrvu0dmP53VkeTPZQdQ6xTdG8K0O8ySpTfrosKrIo7FqWsq/8rbqIwkacNNzarCM/pZ9hob3Fog8RxafZVhJOQ9ikIJf5+4c17Z2pRQp5EmUSQKnDgSzCLU5trPokh+wKNpGQuUn9w+OsM8Nd7H4w5SN+nPgoEcy1EbrjlRt0kQwskodV/5WSXJhOOBnqkOeW5xowJ9fazAVlCtGclR+oeLofAaUaSVFSVuhfjTCc2b5hQTFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rkzTy732sh6+Kc/GptaD4U1dc5kPwfd1HhpxUZvmFdo=;
 b=URz4UjvfyeM00mJ4WmE698Cl/zpSXj1B2HlfQGUzJdLw9axw/m35oEo8tnJtC4fN0Zg99TYgFfvs0PzGJH4Ac4uMxf/LK+TMecl1tba9kTdnxQ/gngJIO5GzVi6QQcWUz8eHO2J5ilcH59T9ezGWnvUBsK70sUsLOdBY31LgY/Dc/EhuA1GrHq3WlTA/Qpmbdmvs92rVn2CVkjn3UgcOwj9Sqqm1Guedf6ghlbpaGRdPwZqG83iu4UANoFJlOTJwIRL5NR7cffAZMFyTdLGU/exugbUxJcu3SE8lXevJOs2uYHMe1HMuhWKLVW/D5Wf4AvsspBhQsuz6O1uNMBqVNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rkzTy732sh6+Kc/GptaD4U1dc5kPwfd1HhpxUZvmFdo=;
 b=i3oxRlQ5X45WCdGHStooJwcWzz0HzQq2vf+Wl+rZcjbPkfqX9b7d7x7uo1UPZnxfmOIL8orTd2RynKeDRMFqoYU3umZwW7kuV93m87FetdBwOZ9zGcozWEWSOX9dlb7is7eh/QD1ZQgTEeJiP1BNZ/8z5xZ/jmdElCQjrdZh+4DcoL4CXJO83dN24BFiXHsrXEhlKl8kxUl5fKH03H7QXSKUpdlBQwAiPeFmk8heVNIoTIsyF0p0ZAi7hRi+fP7MmwSNdBOTPNGER9bmI8Jj7MGul2+g02s0kFRBVV7/8xwZAFA37FwILSO1+/BnoGt6GGXstfStAfF55OUIL8utnw==
Received: from MN0PR03CA0009.namprd03.prod.outlook.com (2603:10b6:208:52f::14)
 by IA1PR12MB6138.namprd12.prod.outlook.com (2603:10b6:208:3ea::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 10:09:29 +0000
Received: from BL02EPF0001A104.namprd05.prod.outlook.com
 (2603:10b6:208:52f::4) by MN0PR03CA0009.outlook.office365.com
 (2603:10b6:208:52f::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.29 via Frontend Transport; Tue,
 31 Mar 2026 10:09:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF0001A104.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Tue, 31 Mar 2026 10:09:29 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 31 Mar
 2026 03:09:13 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 31 Mar
 2026 03:09:12 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 31 Mar 2026 03:09:05 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <thierry.reding@kernel.org>
CC: <Frank.Li@nxp.com>, <acpica-devel@lists.linux.dev>,
	<akhilrajeev@nvidia.com>, <alexandre.belloni@bootlin.com>,
	<conor+dt@kernel.org>, <devicetree@vger.kernel.org>, <ebiggers@kernel.org>,
	<fredrik.markstrom@est.tech>, <jonathanh@nvidia.com>, <krzk@kernel.org>,
	<lenb@kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux@roeck-us.net>, <lkp@intel.com>, <llvm@lists.linux.dev>,
	<miquel.raynal@bootlin.com>, <oe-kbuild-all@lists.linux.dev>,
	<p.zabel@pengutronix.de>, <rafael@kernel.org>, <robert.moore@intel.com>,
	<robh@kernel.org>
Subject: Re: [PATCH 04/12] i3c: master: Support ACPI enumeration
Date: Tue, 31 Mar 2026 15:39:04 +0530
Message-ID: <20260331100904.30932-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <acO_PUjS_VG07qcS@orome>
References: <acO_PUjS_VG07qcS@orome>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A104:EE_|IA1PR12MB6138:EE_
X-MS-Office365-Filtering-Correlation-Id: 0178985a-f202-4647-67ff-08de8f0d98e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|376014|1800799024|82310400026|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	o66Hi730BBYN4PsXul8TRyNJNTRWyLlrDJxFC9jpJpF7I2Ob1qgIhUAHDNEGvPsYARzSEHcnZt092aTt+96hjjiLf7mlmwdaByLY7eBVc2s7T2Jb3YML/tXN2VtIOSDuyPFrW5qflpO2njlIXJ4sG3/MgqydVZks9ZO585NZZMj9DLL+QtPf1/bDdPICX6DwSorO2tXq5683ky8JaoTTGG0eLG8vlnJwbWikQJrLgsSWsHJcUTLuA4j0PEUti6fcMlL/LWmgNtkJ9H3ywb6c5GgMTQTBhKDqQgktXTbWHTABJxrZJVFoogO1v5w9wx8xDQr4UUe1G4xcNpx6nSwBFyuSdzLiRQmrIJkyfKcp1Ah6wPiFNkOIVZwFI3N8vGSwe0k3URYhDh/WbNojFneEHdyJLrpy9p5IApDIcGK+w02TA0WGbXEkocqzOvXz+rsbZ90yEWm1u50syx/JPt5qEVsQZPOdCN27mZDscJ0qB+YYXyQ7l8bLpCf1a8avGzLsUCBZxfvwIo7HVxIcmJMwDUsSwj9VGkbdtcgexWh2OwLec0PmLaX44rsh6cbZLPSofntEpyHq7gzi7uIiYrQQDQAXFlm4hrxfjBKIFIhVgpyA5rVkYAtvnBvJyxQrY4H4YTXhSkXxrAa1mMJSP28QnRXH3P95oWM/Z276ZJZEpentn8QoIoZj8Q5v3AODjYSyjtoUVd+P1qsuud8t/wtGG0NJdKciQUiFcek1g+Rzh8JCB9OIqrSdlieNSjWeRG5PDBUGg76+wRlSBnmq8rFYQA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(1800799024)(82310400026)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xTvS9JM/gPYed1yWoTFxG5DSrVMgL4FXA3s4LiLXzwutjkK9D6irMDTUKWs+M2woxZKj63S8KrY57S+e2Nu8vT2iKwhOwFdJskM8NUywTRSU/0EmyJA33ZILjM91aZLsl2dg2/QMZuzRcMARhBB7BfOHTrikfoeCLkyDb3PSkxUN4nMxHB1U42NQLilTBfnH6q6dVfPOTQ67NOwRGHzdDBVPzo8r+vpzQKMH5V/YV4TZLV1NvNpxOEhtPtdTXkegLDziuJszpEiDrMjehM2iyZPE6wxYmOJzfL6NorQZ1RdI3mbzlf/gvhZl7Ot/pGEcIZqzxKtrq1tO/0Pd/8spLM6pvVrRH7cWUWhqm+j2/lsWxR/F041phU0K6m57TagWXlNA/XAYTjl6nQiwGIHtE1kZ9xzo+FYWjxHcG8TgvB8VuLyV8/WbEr3svc+ga+n2
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 10:09:29.3415
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0178985a-f202-4647-67ff-08de8f0d98e0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A104.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6138

On Wed, 25 Mar 2026 11:59:12 +0100, Thierry Reding wrote:
> On Tue, Mar 24, 2026 at 10:52:15PM +0530, Akhil R wrote:
>> On Tue, 24 Mar 2026 09:43:27 +0100, Alexandre Belloni wrote:
>> 
>> ...
>> 
>> >> #include <linux/acpi.h> is added in PATCH 03/12. The functions' prototypes
>> >> are present in acpi.h. I think the bot checked this patch individually,
>> >> or did I miss something?
>> >> 
>> > 
>> > #include <acpi/acpi_bus.h> is behind an #ifdef in acpi.h and your code
>> > is not.
>> 
>> Thanks for pointing Alexandre and Guenter. I also noticed that we do not
>> have stub functions for a few of the acpi_* functions in #else.
>> 
>> Looks like I will have to guard calls to these functions under
>> #ifdef CONFIG_ACPI.
> 
> Alternatively it might make sense to add the stubs in a separate patch.
> I don't know if they were purposefully left out or nobody's ever run
> into the lack of these before.

I looked into this and it turns out to be more involved than expected,
and requires adding stubs at multiple layers. We may end up either
sneaking in only what we require or a non-trivial change which may
involve too many parameters.

If you would agree, I will guard the ACPI calls used in this patchset with
#ifdef CONFIG_ACPI to keep things self-contained. If you think adding the
stubs is worthwhile, we can take them up as a separate series.

Best Regards,
Akhil
