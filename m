Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010043.outbound.protection.outlook.com [52.101.56.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5F43B0ADC;
	Mon, 15 Jun 2026 06:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781504765; cv=fail; b=rrdf8l8Pv0FDkVvOzIZM54V15Aup1Hi5terCjHDnKA9Hqos8MpndJhxZ4cftucdLQOd7x48o2hK1B0/vb8oI2ex3vKfrunLxz2KegcK2JuLQ5sqpPpIzA/C26Sd+HQbwoqSYVBIvFvWOp92VIEo2DJoOPSJcavizmY+/Zsw4T3U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781504765; c=relaxed/simple;
	bh=4Yd3KSbpcFvHjpG4AvkimUV1Cur1Qzfd0XqUePuTxIk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pe5bWdPhghVZvtoGdfVxOqArdNw9WmbzSjcnbrdiJ91d8dypUgDp+fJV66Gt3+201nHQJhe56rIDcnlo1QHkUErF+EQVDpeQb9va20wm41DC9Ce9vMdygFMQlqWqCHqTp7M+BvAdr0dC650RlevlrkqJTTr/bnHQweyLW68fK14=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=P25cl6zJ; arc=fail smtp.client-ip=52.101.56.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="P25cl6zJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q/akVQZ1r5zcDfB+c1hVxI5rbUaw2iZtA5ta1MHLhRVz0ew4H4edHLy9uFzv+sOFJCpmBi94bOwF75/HWhv80us9YX7z5zFXqK6K5fFZ0Nzm2bvmr3mzRjZFtG+AgOsOwCxQb0fXIFdnctkzyBX3XkC81gZ/QgVjEeGqwvJUVuS51FYopUbP4tReoeiL17JBulCgpbgKvtkQZLqQ6WGwtOnNAKxnXN/x0SwiJ9xQwBB4g+BEfziREG6acPLi3zfSPDPvnvnCPpb9NyM4bbUob8FQ8BHC6yAX0GzVTyTpcyQX6LWUyLV+IsmSkwwK8y2kfChcmNqR3CHhb/EzBBnpkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fYupdNe3nQtdmMiyaFghCII9D+Vtcv+moO5pfmsKQhY=;
 b=mqa+U0pTkwvAeKGRPEAIXBgt4vuRkm96PiljgsF39XFwBcOkeLRsnpKBnPtTDh/1h/C23y3gbZN99DPvSOlBqEgdV6pzq9jywapoUsnXxAtNlvFZTipKZfo3T4SSz4GyO51HX3r6zECDXxvvIFH5iuRk/eYIpU9fmrxrNQ6+dXAWHpKEU+tsCcwD9wGEpJQkNUfgMXs4IXclUgbWIJ2cL5TPN3yXp8Y3xcRuGeZ/PfofcWKfyacE5W8+HC0F0G5Ck7uD05+0FNZ6/ct1B+vi8btcGDzkSfuEF4crUNQ5KKjNp34DsNmbPDQ6mM/b2kPY2b8rZ6ko2hFCii75bAQyEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fYupdNe3nQtdmMiyaFghCII9D+Vtcv+moO5pfmsKQhY=;
 b=P25cl6zJCldmgTl8Iw3pyCQj8cas+xpInFk+Waqj/odlGnladLPctXIfxM829tZ+Nq2E/IhCOA1KRI2lgxiJT7T/wJNZo2GFdJWT30KDqzpgRvPjupGkDo4FJp1Ia0KnjmjARD9uiX+a/b3l2S2J4yreVzwnfUF4ycNV0qyeZaL1KXcmKzNwdh4j9ioCt+ETgZON8ZBvueCZ/canWm+umaY00S1wgbSgGHZu1J8uIU+1AYH0f8QTsofZgf21z114BwPrsOWam4EdTNHOC7lHRU4eHJFKDOJbwKhSLm88M9CMezmFq9S/2xO5NHrGODivvufzKiTusSwb8X33Qa2g9w==
Received: from DM6PR06CA0091.namprd06.prod.outlook.com (2603:10b6:5:336::24)
 by SJ5PPF2CD49510F.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::98f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 06:25:56 +0000
Received: from DM2PEPF00003FC5.namprd04.prod.outlook.com
 (2603:10b6:5:336:cafe::34) by DM6PR06CA0091.outlook.office365.com
 (2603:10b6:5:336::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Mon,
 15 Jun 2026 06:25:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 DM2PEPF00003FC5.mail.protection.outlook.com (10.167.23.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Mon, 15 Jun 2026 06:25:54 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 14 Jun
 2026 23:25:47 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Sun, 14 Jun 2026 23:25:47 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Sun, 14 Jun 2026 23:25:40 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <alexandre.belloni@bootlin.com>
CC: <Frank.Li@nxp.com>, <acpica-devel@lists.linux.dev>,
	<akhilrajeev@nvidia.com>, <arnd@arndb.de>,
	<bjorn.andersson@oss.qualcomm.com>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <dmitry.baryshkov@oss.qualcomm.com>,
	<ebiggers@kernel.org>, <geert@linux-m68k.org>, <jonathanh@nvidia.com>,
	<krzk+dt@kernel.org>, <lenb@kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux@roeck-us.net>, <miquel.raynal@bootlin.com>, <p.zabel@pengutronix.de>,
	<rafael@kernel.org>, <robh@kernel.org>, <saket.dumbre@intel.com>,
	<treding@nvidia.com>, <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v3 00/13] Support ACPI and SETAASA device discovery
Date: Mon, 15 Jun 2026 06:25:39 +0000
Message-ID: <20260615062539.3225240-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026061420560674ab6fb9@mail.local>
References: <2026061420560674ab6fb9@mail.local>
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
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC5:EE_|SJ5PPF2CD49510F:EE_
X-MS-Office365-Filtering-Correlation-Id: f9c2c01e-af50-4370-ca80-08decaa6f49e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|23010399003|7416014|376014|22082099003|18002099003|6133799003|3023799007|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	ELaeA9CD2usk5fqhLjnP3egjL45Nrobn1uWTjZnR5/th98C87Tfg3nRgeQvkmC+0DIug8fAfJtD5Ii3tu4aHar3+kXqem4Tu2XLLIGvkFEYEY4eUuKkle1tdm382E49wO5xI7xM6nJUE9/SyW2uI2e/l/1ciLpgYusuyeFiOOKDf3Ja0MSQJ0cDyONEz1K+6OjzSqcV9/pGRcZWSnsXBLyVkPJIwpbmqo9V2mV8pIJQNRnyil8B+fYnEvSxvLQjbIZWg3yjZFVf7/7oZi+F0P2R6lLs3SGJ00lCJOBmzBKZt3cuE/hK3vjzsw/jZToTNi196C7gMtC4ymNhjykUaDKVS8cn4Xc3zvI2S2aartObt2d6M5XSzQwkzHfSFtFlyMxP7bM37lYp1xSddo5y0tKrm6d4p2+ZsHdQLvhw91yQUlaKsdsYZq7a1c9RKp62D9xMeMypAbSbrQ87+q9Nvy28AaLPrNmuNuPc/MiFFkFtarjpJZ9xpMc0Cg+oUjuSSnYzqS+dVKOA4ziiMb6+YhnOvy494D6/dOvjgpZqFU4PQyyfrJBax+jfeLYefQGFmeMwYi4ihjTDlFDmhZRsh2zHshE1dAeDXRYkQ9qrgpb+I+IMI0PJbkaYL7q9gI4TuarUI4okKNDn0GtM512uEp/00Y/3kBxbG/YB6lu7J6u/anpBn73t0d6ynb4QFWOVvJx7ynq+BKHKsyWHPOPsKq10vwCDB6WmOeXvGFg4s5Hc=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(23010399003)(7416014)(376014)(22082099003)(18002099003)(6133799003)(3023799007)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	q5eSdfSxXRdzvMA+DVmPpSPQuspCae6xLucRk86lYdXTLEoXynBlqbtqPFjgFQ6xbeGTzP/Lw9rETq4sl1zWbrU9ExZFi2AvnidoKF2sfhoCcapzQTUwgmIeS8BytC1S0+XEEZLzpmGDs9cWeNDCJfoRNmrHgrG2bwqiuly7KM8fHIj3fzBfoRbGCXfLzbiOUTy2bsbhzKgYPuyySitIH5nEb+E3E3rZ1aMjIIX91QyI8gTjMwQHxkFJctPPf4VjHbsTwjfcx/CxlOb/Iq/DaAA6eNtMT78KxAmWqDmJJlxnSok9FTZXJlWXxYZwxAGb0+PCsWpuHS0C5k2VMo+t2h/zvPAlrK3s3gDJJdrqGjWqwKHGn9X84cgfeEKqcVxWi05JRtv7ujx8nYNbiLvetZnhGopc60LlqdEFDrzAJOjVC+DV1Atc4/iwCAqmg9pS
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 06:25:54.9037
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9c2c01e-af50-4370-ca80-08decaa6f49e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM2PEPF00003FC5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF2CD49510F

On Sun, 14 Jun 2026 22:56:06 +0200, Alexandre Belloni wrote:
> On 23/04/2026 14:26:59+0530, Akhil R wrote:
>> This patch series adds SETAASA device discovery to the I3C subsystem,
>> enabling support for SPD5118 temperature sensors found on DDR5 memory
>> modules. The changes also add ACPI support for all existing DAA
>> methods like SETDASA, SETNEWDA as well as I2C devices on I3C bus.
>> 
>> SPD5118 and similar devices on DDR5 memory modules differ from typical
>> I3C devices in their initialization. They use SETAASA broadcast CCC
>> instead of ENTDAA for address assignment, and per JEDEC specification,
>> are not required to have a Provisioned ID or implement standard device
>> information CCC commands (GETPID, GETDCR, GETBCR).
>> 
>> The series enables to describe all I3C and I2C devices on both Device
>> Tree and the ACPI table, using unified device property APIs throughout
>> the I3C core and the Synopsys DesignWare I3C master driver.
>> 
>> Please note that the series modifies drivers across multiple subsystems,
>> like Device Tree bindings, ACPI, I3C and HWMON.
>> 
>> v2->v3:
>>   * Fix maximum value and indent bit list for mipi-i3c-static-method.
>>   * Move I3C_ADDR_METHOD_* macros to dt-bindings header.
>>   * Drop ACPICA commit IDs, keep only the Link: tags.
>>   * Revert the change which proceeds to register other devices if SETAASA
>>     is not supported so that it aligns with the rest of the driver and to
>>     avoid the issues pointed by Sashiko.
>>   * Rework multiple commit messages.
>> 
>> v1->v2:
>>   * Added patch to remove 16-bit addressing support for SPD5118
>>   * Guard ACPI calls with #ifdef CONFIG_ACPI
>>   * Remove CONFIG_OF guard for of_alias_get_highest_id()
>>   * Mask mipi-i3c-static-method in the driver to select only valid values.
>>   * Proceed to register other devices if SETAASA is not supported.
>>   * Update commit message and links in the description of multiple commits.
>> 
>> 
>> Akhil R (13):
>>   dt-bindings: i3c: Add mipi-i3c-static-method to support SETAASA
>>   ACPICA: Read LVR from the I2C resource descriptor
>>   i3c: master: Use unified device property interface
>>   i3c: master: Support ACPI enumeration of child devices
>>   i3c: master: Add support for devices using SETAASA
>>   i3c: master: Add support for devices without PID
>>   i3c: master: match I3C device through DT and ACPI
>>   i3c: dw-i3c-master: Add SETAASA as supported CCC
>>   i3c: dw-i3c-master: Add a quirk to skip clock and reset
>>   i3c: dw-i3c-master: Add ACPI ID for Tegra410
>>   hwmon: spd5118: Remove 16-bit addressing
>>   hwmon: spd5118: Add I3C support
>>   arm64: defconfig: Enable I3C and SPD5118 hwmon
>> 
> 
> I'd really like to apply this but I would have preferred having an
> actual ack from Rob on patch 1. Also, you are going to have to rebase on
> the current i3c-next. Can you do this?

Definitely. I had been addressing the comments from Rob and Saashiko, but
got hooked up into somethings else in the last few weeks. I will send v4
soon. Thanks for reaching out.

Best Regards,
Akhil
