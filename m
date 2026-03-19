Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010071.outbound.protection.outlook.com [52.101.193.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341DF35837B;
	Thu, 19 Mar 2026 08:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773910039; cv=fail; b=KHlhDE9m8iG5/4uIpZVgxd5okkU49zRYMYrW8kIMjto/qeGsa1SYloenodV49Tgd5tOoabWU4pcA2xX/a43BIwqfDe1W2Ume98/x0ctW/vkPtjrpPNLUyhI3YaXDdvhwgUQxEaut5naBkCzfh2eXIdkqU4hlbegoxXjXjflfSlU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773910039; c=relaxed/simple;
	bh=b3PZ3nszum98d4XZv3RZracFjYaqsUaPDmxgLw/U/i0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TVbxR7mqkB0P0RWBRfNHBIeBKr8ncpmdtDMt3SyB1cLPmAgbj5tQmNzh72UTBa4YkDjgCeFsQ9eNz+y1tRlA0Pmf41zfya0Lsa/58773mcMkvv8cttaf1cuc6GKCT9lI6jdeng4Q7bDB/Xm4izUwgwaeUmTk2iCbDO7gg2F6BzA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=owUEmC+m; arc=fail smtp.client-ip=52.101.193.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="owUEmC+m"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BbI5mi1P8XyvvcaHkLOvIjjzopJ0dQa5FfSu31FyegXqglWgpZ22Koz2+55a6x2G4yDIKYJ9XqAOP0fG7ZwSotmEA3SuCvQXjd9Y1rMKrI/KBDFct3tQjdALOIWMeD3BBDSx6m8PssAxaKuslENQmY9XR90gPc+O4neSRApCumrCp5WbLAeH0JMmoGIFXqcECs5ekdyrsWjv45wk99nuUWtsmDmwhSgdvod8SFLI4wn51YokhisR8V1uh4KNeMzwavGs5V78Ay6ZFhV3fChUd219Nx51hHOEqCwNwINhIrV1QmtVxVcv98P5o9tIQEgVfrebhUiMVrDvIILLc2H51g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hyX1PGEh5Fmb3+9LJsAql7p93k6+7CRPemknitksSsM=;
 b=NRyU4i5a0w7Pt065QzZ4D1zD4FrVpxbgxBnvMiAI/L8hXjMguNq0X6hR/BIUQYGBpTG0wao7dB84lv9tjWuWq+0D1AWVb13b2OteNBWF18vJyktlXfkAeRsNQC55P6rCtKRNBofg0mFi1iHlJRzsBJGaurD5u7dgr0qTfPbPdWGe026oBsKa5bBpg6+JAzSUB32H/HrsCA5eAQWOuhThfq3v2eSKfNqv4lbTg61usZnGCd8jHVsObxc7IzrsnHXBuLzzqpMxdUNxKo7a8T71Waws4BSwXHKjXdH6wCgSlYdG1jbzoU77/NJGRU8vbzvFp/BJFPEz/fB7LpkuPk++QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hyX1PGEh5Fmb3+9LJsAql7p93k6+7CRPemknitksSsM=;
 b=owUEmC+m9cwtdq8hkRP3SpCd31R/flGUZl71y9jqlK3cEfgD2dlBczad0Sab8vbq4VRZFGmbmh17M6Ijt+0QXor3AWQy/fAjfHtvOi52CIwNdXuAsJdQ6mdW+FCff7sNRa/SyN2x4wDl/si39+YtWWgC3F8S5ymRrffNUnosf+bRfVNErb2b5u9TXm/i6q1qwnUUg8DU8kRef3rp6l2Ktfxheq+/Q9LFzE87Cksv6PKNXigKeXB50LomTxt+TlkovcWu4CQxrPYC+/NRtjGIKT0g0Xnd5fI0KKknvJYKNqOU27mb8SOMJNR2m3PFmjOKQgzIh92gpmTfx7ZpRQZ3dA==
Received: from DS7PR03CA0182.namprd03.prod.outlook.com (2603:10b6:5:3b6::7) by
 IA1PR12MB6556.namprd12.prod.outlook.com (2603:10b6:208:3a0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Thu, 19 Mar
 2026 08:47:06 +0000
Received: from CH3PEPF00000012.namprd21.prod.outlook.com
 (2603:10b6:5:3b6:cafe::ed) by DS7PR03CA0182.outlook.office365.com
 (2603:10b6:5:3b6::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Thu,
 19 Mar 2026 08:47:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH3PEPF00000012.mail.protection.outlook.com (10.167.244.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.0 via Frontend Transport; Thu, 19 Mar 2026 08:47:05 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 01:46:49 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 01:46:49 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 19 Mar 2026 01:46:42 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <conor@kernel.org>
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
Subject: Re: [PATCH 01/12] dt-bindings: i3c: Add mipi-i3c-static-method to support SETAASA
Date: Thu, 19 Mar 2026 14:16:41 +0530
Message-ID: <20260319084641.57672-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260318-tweed-herbicide-eb924ef056b8@spud>
References: <20260318-tweed-herbicide-eb924ef056b8@spud>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000012:EE_|IA1PR12MB6556:EE_
X-MS-Office365-Filtering-Correlation-Id: 60fce4d6-bff6-4ee8-82af-08de8594192e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|36860700016|82310400026|13003099007|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	2DDDrwlVz+GzI9iq3LtH1kRgfVkRhGL9uHQOqnY7Z1mhzRspHtjryZpVov9VJiBHyi63s8mgKX0yE524MHnY5/zQim7m4dkcdgl/s1XIGmNAMXE6mMi9WrisdYg/n/y+rgQhklCSfAVhDfGnJsDjcNrlt9wKMRhA0IGmRwUcxHxUCYjVyIm0y80sPBy19hvudnQQ6JmiVLAdISwCVMgIXQsNJ25lDXndoR/2XbN/i3Bk2+wA3vDtAm6hKVm5oXadXMSOztdMkg0nA3yZ5sii2HTrlDKApORI2FEMhI656Ofcebhzr9lxkSoMWDOVkMpkYEIFKhr6q+YGBdV7ca+Ry5aGfagMW5Td0bNoJYWvOUPr96yWAneFJfQpDjm9VzCUzEGhHWn0fbjhKkFCMYmNDxLflKsq3gnjTDG4QM0yt/o1Wv9WZiUzY+8VF24/psVeraYXuX1J4f3VdNfYK8C04XJXmkHw91tHiSJuOQwHP6P7OQAQLc+9UsVZC9MdBWy///NJEumpC5VEDj6NoS1lRIQ1w+iPHAvLa6SAe1bXmDQdlUVuja/SYMTtZGkjX5mKHSZngo2ZTWUfqsSrv8KhfghqvNy4Iw8xB8EKEwu6mwhPUCGNe5zbqCdUqq/zylrDzLV0K0EGk5YXJ4P01gv5tERr2rk6B4fUj8khKvyt9bW6186qmvmiGlgFZmzUohEe7WfO0DtqUI3zsBwFxcD1p566ZHU+iKLa6h600C1318wLNKy54RtKUWBoLqUxYb8Cw3XC3Y4DU6Ykd+NGQfch9g==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(36860700016)(82310400026)(13003099007)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fhEVPWLuM/Uj1hXThH3kIJG3xvYqoyZOqKWkv4oUHfSyt33T/77KnNhZ7/g52nchZ6m4+1fI3GZniaKcB0y/S8HxxSQ+ANz2c75V1WOP0ZLMAP2zjBhxHvX47MBNjj8kRXBK9LXV+Z5WfoC2F04O3KyUV+JSSmwDQHhRsrfOBCdQmEyGeUaTwbKPFC7CuPHABAju01Cnr5J3vQyZclA3NgK+5SSiHdOFO3MwKcSKcPv4pJ7N1oRn4OM8TqwT/u+ZsY5zTQEEP0vBnyvTY7EATQVNjPZLWkGz27FUD2Rz3WmxFWuqsjUa65iqRjvHvQlCWr9wj6BdnRKnIechdGK71uh0tqRklzgRmlYfxiL3xJHD9pd6kH/MPEIA53SO5P8RhLBuDXRNZun0eOFTfJ3JZbaTNd4gmwsfChLedMVuVlAvBXyRy0E8OoKs0sy4xY4L
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 08:47:05.5733
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60fce4d6-bff6-4ee8-82af-08de8594192e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000012.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6556

On Wed, 18 Mar 2026 17:31:50 +0000, Conor Dooley wrote:
> On Wed, Mar 18, 2026 at 10:57:14PM +0530, Akhil R wrote:
>> Add the 'mipi-i3c-static-method' property mentioned in the MIPI I3C
>> Discovery and Configuration Specification [1] to specify which discovery
>> method an I3C device supports during bus initialization. The property is
>> a bitmap, where a bit value of 1 indicates support for that method, and 0
>> indicates lack of support.
>> Bit 0: SETDASA CCC (Direct)
>> Bit 1: SETAASA CCC (Broadcast)
>> Bit 2: Other CCC (vendor / standards extension)
>> All other bits are reserved.
>> 
>> It is specifically needed when an I3C device requires SETAASA for the
>> address assignment. SETDASA will be supported by default if this property
>> is absent - which means for now the property just serves as a flag to
>> enable SETAASA, but keep the property as a bitmap to align with the
>> specifications.
>> 
>> [1] https://www.mipi.org/specifications/disco
>> 
>> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
>> ---
>>  .../devicetree/bindings/i3c/i3c.yaml          | 30 ++++++++++++++++---
>>  1 file changed, 26 insertions(+), 4 deletions(-)
>> 
>> diff --git a/Documentation/devicetree/bindings/i3c/i3c.yaml b/Documentation/devicetree/bindings/i3c/i3c.yaml
>> index e25fa72fd785..1705d90d4d79 100644
>> --- a/Documentation/devicetree/bindings/i3c/i3c.yaml
>> +++ b/Documentation/devicetree/bindings/i3c/i3c.yaml
>> @@ -31,10 +31,12 @@ properties:
>>        described in the device tree, which in turn means we have to describe
>>        I3C devices.
>>  
>> -      Another use case for describing an I3C device in the device tree is when
>> -      this I3C device has a static I2C address and we want to assign it a
>> -      specific I3C dynamic address before the DAA takes place (so that other
>> -      devices on the bus can't take this dynamic address).
>> +      Other use-cases for describing an I3C device in the device tree are:
>> +      - When the I3C device has a static I2C address and we want to assign
>> +        it a specific I3C dynamic address before the DAA takes place (so
>> +        that other devices on the bus can't take this dynamic address).
>> +      - When the I3C device requires SETAASA for its discovery and uses a
>> +        pre-defined static address.
>>  
>>    "#size-cells":
>>      const: 0
>> @@ -147,6 +149,26 @@ patternProperties:
>>            through SETDASA. If static address is not present, this address is assigned
>>            through SETNEWDA after assigning a temporary address via ENTDAA.
>>  
>> +      mipi-i3c-static-method:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        minimum: 0x1
>> +        maximum: 0xff
>> +        default: 1
>> +        description: |
>> +          Bitmap describing which methods of Dynamic Address Assignment from a
>> +          static address are supported by this I3C Target. A bit value of 1
>> +          indicates support for that method, and 0 indicates lack of support.
> 
> I really am not keen on properties that are bitmaps, why can't we just
> use the strings "setdasa", "setaasa" etc?

The intention was to mirror the property described in the specification. Using
strings would not allow to use a combination of methods when a device supports
more than one method. It also cannot represent the vendor extensions (Bit 2)
cleanly. Would this be better if we use macros instead of raw numbers?
Please let me know your thoughts.

> 
>> +          Bit 0: SETDASA CCC (Direct)
>> +          Bit 1: SETAASA CCC (Broadcast)
>> +          Bit 2: Other CCC (vendor / standards extension)
>> +          All other bits are reserved.
>> +
>> +          This property follows the MIPI I3C specification. The primary use
>> +          of this property is to indicate support for SETAASA, i.e Bit 1, but
>> +          will allow all values so that it is aligned with the specifications.
>> +          SETDASA will remain as the default method even if this property is
>> +          not present.
>> +
>>      required:
>>        - reg

Best Regards,
Akhil
