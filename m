Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011012.outbound.protection.outlook.com [52.101.52.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188053E1D12;
	Thu, 19 Mar 2026 17:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773942379; cv=fail; b=bFtf/icXm/MQks81GRmRbsLKPMfTooyTcECuD+jmGFiEDyoRPxsn+rHwClfApfNvJJAQph86P1/n6twRPAqEK27vIuaZu8eWgmhowID2T9ZflmZM1fEM8JXGmBT4fcKznqAoDtf5NN/W1dl2v5URwjKc6bHly4ZNa9zQUXgv9LE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773942379; c=relaxed/simple;
	bh=9UfSM7JwRxfD0VmYUcVxCJeYyovzW7HgtT7czmheHMI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mGTQfu+oMnVuu2+KTmxzUAP1Ry7g0p2BsAEgzVtr7AsKrG7vP3NPJwI5/oArukMqCgfAC5ZAsqJh46hGaDBJ2wlVEE3N9CtI+UTgnNwsfs5CWlddQ9uhUor9Q3AGplk1dc0THDGxMYCIiPRo1aCH8m6Hs97TUCmEFgAkqylYPN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=k2nFkS3C; arc=fail smtp.client-ip=52.101.52.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="k2nFkS3C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GdnKL197F33qOGZBQNbuemgz4SEw/GhPPdaK3Jexq9bZm8u6s+9haqyRC2siQsBnha5MVGsugRTJfuNoYgbRowh3dyLlbAilyTn2s+pPKnKUb5Utaop/D5zisnRgTMS3QqMOmG78r0Z+kGwvD1piNbe0YENV3BL2YFXqOHPDbp+jlgSGG6M4EZqehqgT6zmBMrtpxTTjNzPmjFsOzdmELlXGHnTtjcdwFTvDmkaCKQ4p8QN00RkR+7Cog9+X5aMm9rHFVlWHbbHErYJ+YgA45zEFkds6vxL130mhBrK/SbNjXom8AB8qbTj/zREIErCZQgmA2qnbIdLOF0PVZXVqwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ep14gkdCOaBf8X4yx6FJqtjw6IeGTdaSDwtg4ALrv4A=;
 b=c1xIwFNJHXHuSrnGyfXgPYQ4YVoKGqeg9xQ1HOYpEgcG7SbeV70xLR6pBKQMlhy42ugox+GJ9DpZBQpTCSjjH0b7swmmyYsv5FQqON4eh9wprtvdrZCnBzL6KZ4WGKCah1wpEa1tL250oIsktT88R7Y0DG+VJb7yd//fj2ODRTLgFnhZlWCigLhvNVNmXAjRVWOqWV2/QiIncZw/O+5S6eid6iXL0/LA62ARlmSnb/+78N5XzpphOlKrTWdUQRl1XEww7HfrDN37/6jPKQRz8a0mXWKduZg5M11K19noAbVV2NJcsEludpKNIiyC7b2NsP7LanNkF1E8+KoXjUppNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=nxp.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ep14gkdCOaBf8X4yx6FJqtjw6IeGTdaSDwtg4ALrv4A=;
 b=k2nFkS3C3oOsQUSfS+7qjvqGckJl95hi1eSWpf+CiSnyT/Dqor9fIzhh65VYBKjs7/CYBO77jUgGUeMZ8C0fQVxU2YuBQEgj8dYiigF9kOwHRNSex0cVe2dzT7rawQ3f7Ao7EXPei/9nZAKM+RydpmqblKCpnnq2IvlGQ9rvIeDxr3it2+rH1Opeo7pYOfOmiJUe1oaZPZEhu8B7QhO/Zfia5S9DBy3pqmLxwA+7RtXhUVWgdpGitOB9CzyYKDF5WXYk3R5xpwiYpYNf2S1nfRqxHlvuWTqVCANwVitw/ziSK1f0CThHT0F5iCQ6AQq7RSGtGKKPjSZlWJwCCEwjWA==
Received: from SJ0PR13CA0233.namprd13.prod.outlook.com (2603:10b6:a03:2c1::28)
 by BL1PR12MB5876.namprd12.prod.outlook.com (2603:10b6:208:398::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.13; Thu, 19 Mar
 2026 17:46:03 +0000
Received: from SJ1PEPF00002310.namprd03.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::88) by SJ0PR13CA0233.outlook.office365.com
 (2603:10b6:a03:2c1::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend Transport; Thu,
 19 Mar 2026 17:46:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ1PEPF00002310.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 17:46:02 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 10:45:53 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Thu, 19 Mar 2026 10:45:53 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 19 Mar 2026 10:45:47 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <frank.li@nxp.com>
CC: <acpica-devel@lists.linux.dev>, <akhilrajeev@nvidia.com>,
	<alexandre.belloni@bootlin.com>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <ebiggers@kernel.org>,
	<fredrik.markstrom@est.tech>, <jonathanh@nvidia.com>, <krzk+dt@kernel.org>,
	<lenb@kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux@roeck-us.net>, <miquel.raynal@bootlin.com>, <p.zabel@pengutronix.de>,
	<rafael@kernel.org>, <robert.moore@intel.com>, <robh@kernel.org>,
	<smangipudi@nvidia.com>, <thierry.reding@kernel.org>
Subject: Re: [PATCH 04/12] i3c: master: Support ACPI enumeration
Date: Thu, 19 Mar 2026 23:15:46 +0530
Message-ID: <20260319174546.18329-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <abwIUmXfapfi1k3D@lizhi-Precision-Tower-5810>
References: <abwIUmXfapfi1k3D@lizhi-Precision-Tower-5810>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002310:EE_|BL1PR12MB5876:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b411289-d40a-48ab-b0ac-08de85df635f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	3tA3VluoEOjjYvpkzuNOuYqUD7udRa+EISr0nVZQ0S3rOiHNEI9sgXMQpa/b2kHSPMaSSBRy5K41au5RjZjzlLFuWBU/KSfi7RKT9QTzHuYi4hMMOkyMjxTozBQ0BF8xiaBOdmgm7FrPvRlyRT4nbxF6WfkdywQZY8VD0U/8gttcQGiAKpmdhAy/gESSQTFCN9v8AxXd/XwQiCyum7KfjNcRQkmlLEM5H8h2IbA581ndSu/teC+ximbSCpOA/0OEB+eAsgSy3RuZcRzgy77MXcfh1qzR1II8DS0W4emzonQIzrR3HF6q5ScZEBE0h3yEuHGT10qTLmxqBacqYmECGNKmgcsHTV1S+03mH8nW0mJp+s4npfZ5N1i03EV0ULoqcu+QXr2Ri0tdEI76L/Vvjw7hCJ/4jKETmtf3fIfFLRKtiHctdHyCIv5rUp/Pgq4EQLwZV67CpH2ytlbltJV9Rrt+9oENSPqAa9C+6s8FQWlmCTpgkJzU05mHdfNneJqutdTb30QiJhVZnO43WAbgYashgZsZIxNdixO05gUBHT9Qhux1fABdiFe90kOgcPyvhrM/xaIEHxkUqcb+kXOu0xdROYjOi7VldcAO9UNMKhzGpbL5/mgwk1TFsyWhzw+OmSu6cqKj94zJ7OL/V33I1bInqVs+8DfSS+40sMMRqiBvXU35U3UshlgJxYYSnV/fneRl0iUM2B+WIdg9E7RyQs00a8Al8ZsJD7lOFgzJCqx6SxT6GWpIAT4M9djQBa/3HY2RABGXLdYXeCvKyU8PeQ==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VKFzw6thxBZjESDrEYNHBhHwQDWBiIjdXhV02FH84i1bxHOH7KZES2Co2FnSSRjJwGGEKMzq0TmRgPak0zv9+FHGVdhT5EbKUH1hxjSMyej/JnH/QuB3k0HPPG4zzdc3okdkPCGV1a1pHsQ3LoiuaepymjCXbeLHGZ2TJkY3W/husmEvbmYduZoe7r137qrvVFmLKHnm3ZbpFznDzoWic7PdL1Hv5KMPtr2lTfGvplJ9gD3+jbuxACaxJ6UrcLNGKZjD9fVw2rWLws2Uv4qMiGBTdM8Ho+Adqpdf5qD1WZhAGJIj95Dl+TgZcV5WTC+T0wvQH717IPFVkY/iGgsBRjB7f4/KHN6kW5ZxeIs6ExgcIX6cFSq4A61xmFZLnIkMK7zKaRpkC5KNikNLIcNk3NjRnucIV8LX3U4Uus6rcYLx7LzrdGzHKydaYmpHqlex
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 17:46:02.4334
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b411289-d40a-48ab-b0ac-08de85df635f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002310.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5876

On Thu, 19 Mar 2026 10:29:38 -0400, Frank Li wrote:
> On Wed, Mar 18, 2026 at 10:57:17PM +0530, Akhil R wrote:
>> Support ACPI enumeration for I2C and I3C devices on an I3C bus.
>> Read _ADR and LVR from the ACPI resources and extract the data
> 
> ADR have _, but not _ before LVR, I am not familary with ACPI.

'_ADR' is a static ACPI object (or method), but LVR is not.
LVR (Legacy Virtual Register) has to be read by parsing the
ACPI I2C serial resource.

> 
>> as per the ACPI specification for an I3C bus. Also read
>> mipi-i3c-static-address as per the MIPI DISCO specifications [1]
>> to get the static address to be used.
>>
>> Although the existing subsystem allows host controllers to register
>> through the ACPI table, it was not possible to describe I3C or I2C
>> devices there.
> 
> why?

The existing code relied on the 'reg' property to get PID, static address etc.
ACPI table entries do not use reg property, instead use _ADR or other resource
objects. Also for ACPI, MIPI recommends a different format which encodes the
details in the _ADR object. The specification also includes a few additional
properties like mipi-i3c-static-address, mipi-i3c-static-method etc. which
the new code follows.

> 
>> This change enables describing the I3C or I2C devices
> 
> Don't use "This commit/change/" just Enable ...

Ack. Will update.

Best Regards,
Akhil
