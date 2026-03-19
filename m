Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010015.outbound.protection.outlook.com [52.101.193.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04CC30E0F2;
	Thu, 19 Mar 2026 17:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773939729; cv=fail; b=rVPrEMfKbh8OuG6KVDSXW/t3vDG2E4gknTTyUxcX8vZKYRxVu1/tUgIMJvAA2BrdFWOXgpTovlDgbhMHB/1WJnO3aL8wkZakbEkCB/aCy18U/p3HGbZTRcx3dTUxwY6D6nrCpi9Mgt8RHVxEkQPQt0v5zrHzPEF8Cyk1oK3ja18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773939729; c=relaxed/simple;
	bh=f/Y+j50PoYS3WAfW378rU+2biVQYEODIMXmipgbmXpw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jZDUIiRPSy5CDysqdGXFPoGAoOnnqk5E3vInd2wIeMM0jIWCy/EIGpny0u4DZFfi5t35PzaNiliTYKiwcqGe3dWdqxr8isK746nl6PHVi8sgsjiZ9CzOQXdDGqifMkuH/nIS9BYnCyWf11MQhX5g1blBpQmOTe9kQqeB2OepHVI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RFcoEv91; arc=fail smtp.client-ip=52.101.193.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RFcoEv91"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AHOdjySerL1nfl+R4lITEtQYc6OFlBs39KLJ6aRvxxogdlehKcRFhdouuxERNP70e2xb1NaIdfo0tP7LWifNOuZ0tJ/HSBmA5qMFymHQFDovjpKwOgyz1hLm5jc/OWDdrdl1i9jCB3tuCtr3UzcKBgKT8QKxnx5fZNpb3NT3Fiockt/oUbK5ZmcwJnxZ8ZyUAsUlSL6iek/mwjNs4WyjM/C/SFSoAbq0UzivGhd9fVD3rwr9yMKbe6UJjiAayHBOwSP1c5DVOZmMromtO82muawO2o6CtiHCFNsQ15wIigTpPpOM8ZsfY7P9pcc0ypiQe+IkJMsXiOrNAvyF1XlyvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/nuzwQ+YV2ly2TZVIhAsL1QhcGF7HbODxHykEIZX1M8=;
 b=fjPYwcvZecWEjKZNfQxsQ7A1c3JS12Kg7ZFW5upx6xkNA43aFkvqF+vKNkHHpCtOzV30IMg8SE3fvXUnnJgapwX2KUAw4IRnfQVloWBs5N1cD2vS37tJ8igBL+r1gN5ohlRCodbiLTiOBbPm707JZA78d6X6D7K67yy+Gi++lshpsmT4Fl4EI1RO1iM2FyziAA7qHHeuVgQfvNZvzJPTGGP6HESgJTiFJPXX/kDRj0Qa3clGQnBrfb86HsLA1p63GVKC9/FWqhu+q3ZYixl+Hf5IqBMFUr6J7CkJYOOh7fC3XZH7RbgiyzW49yMWUe/nbEKpFpCqnZlnNxvZcFZb1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/nuzwQ+YV2ly2TZVIhAsL1QhcGF7HbODxHykEIZX1M8=;
 b=RFcoEv91mqVea5LzGnHHd//Z6N0/bnvbKArA0iSsy4ghEK/+pPfZb2PxsORtcVHngsz7G9HbpdRs+G1ZaT5FvNwuC+yJs3YmWM8Si5NcSi/OPogkC6GL2Q1/dK/rpvkRxf0S7CDh9aN+vaNmeBze0dtZnAofOhJs6zP7262TE8vcysEBUBCW7AEZHALBKghyB8yvKAQ9vyNaMmdUrSCPDlwZqI88aZNDmJEHx7U+ZOMyj66SQmVUKZUv1IiLAeaXfCeZlZ3WDAhNePyQjAczlhdLJTuV039eGgFC/XrzWGVR+MF0fGUjlBJAC9f4Cp74kviesspzbqvCU5UmiGqh5Q==
Received: from CH0PR08CA0023.namprd08.prod.outlook.com (2603:10b6:610:33::28)
 by SA1PR12MB999228.namprd12.prod.outlook.com (2603:10b6:806:4db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Thu, 19 Mar
 2026 17:02:02 +0000
Received: from DM2PEPF00003FC2.namprd04.prod.outlook.com
 (2603:10b6:610:33:cafe::dc) by CH0PR08CA0023.outlook.office365.com
 (2603:10b6:610:33::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.20 via Frontend Transport; Thu,
 19 Mar 2026 17:02:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DM2PEPF00003FC2.mail.protection.outlook.com (10.167.23.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 17:02:02 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 10:01:38 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 10:01:37 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 19 Mar 2026 10:01:30 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <krzk@kernel.org>
CC: <Frank.Li@nxp.com>, <acpica-devel@lists.linux.dev>,
	<akhilrajeev@nvidia.com>, <alexandre.belloni@bootlin.com>,
	<conor+dt@kernel.org>, <conor@kernel.org>, <devicetree@vger.kernel.org>,
	<ebiggers@kernel.org>, <fredrik.markstrom@est.tech>, <jonathanh@nvidia.com>,
	<krzk+dt@kernel.org>, <lenb@kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux@roeck-us.net>, <miquel.raynal@bootlin.com>, <p.zabel@pengutronix.de>,
	<rafael@kernel.org>, <robert.moore@intel.com>, <robh@kernel.org>,
	<smangipudi@nvidia.com>, <thierry.reding@kernel.org>,
	<andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 01/12] dt-bindings: i3c: Add mipi-i3c-static-method to support SETAASA
Date: Thu, 19 Mar 2026 22:31:29 +0530
Message-ID: <20260319170129.13441-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260319-spiritual-defiant-galago-9bed7e@quoll>
References: <20260319-spiritual-defiant-galago-9bed7e@quoll>
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
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC2:EE_|SA1PR12MB999228:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e467f60-6797-4aa7-bba8-08de85d93dc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|1800799024|82310400026|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	FqbVXH/xR8zvdZfYz6ID58DjuORdo93IxHzdAh4JS7jvGdYEXIlLV8v8wsq2GhfmVJpfnbBYak6Hq+eon2QbHLuB4MQmZl2UNqv6+GSA4ljUh3t2TXrnrW7SavQoqJvWy7U9Mo3uURALpGsVrdw0rj96NKdSymr1OSUNkgJsvTeKQxdC0vRnKnqLTw/HyIfU+jTbBUZM9wPUm0hTJnOCcNwZGzj+LXxe8ff6UCqtg7AuGUGo9gMVtOAO+GS3hP4A0uNjONgIX53gkKhdRi7XpCSA5cFwPlmiBldUL5W1MDfEzRoNDbiK/RUoYld6rIKMcQ2Bk1dvp4rjFH4G+0ax7HPLzyaXiBUjXbysrJTqXy61rvs/7xDMgsHAkzSb9r71vxj9j+EmKstc8c6p5jiQ+IHdruwHi2vIm4uiaqu51ay9fVr7XW9GH+v3VLzznh1MqeTQmmU/gffIsMj17zZl9Dk2RA1qWUs6mKuMYcTwzcqiGkySsVJznUvTu6/andyjiAvWz5CGjqhPbWWpDR6zzdIzfUgdHBm4/7Ta+DVthDGl+fTM68OgYzjLRHbXAujqIYc2pB0VXU+AzhbrOeLYDKp6YcyhPMxmOmp0hcwaiaeJ1kylIo5ZVR/0QHd7Td2uWaEHAoWyJf0bV3l1OXPsuPhKr46LQFhyH1hTayykaUN95bX5ETNLnHgYNxis7+usMQCJv9kvH3TyxoG8vZy7xnY/gUyhMS3dzcmdG8ePmCIQTwqmdjUcA4pOz8D9IHDJr8WdaSYzXXPkQUtdCEnnOw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(1800799024)(82310400026)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dMZGcip0q1FqVHXKlC3emN8Yrwy0m5eTTUfx2UnOH+mZ0ZsNhFEqADbJP2aKgIbEDSWVLZ4LRl1We2eeuntjT+gQIzqcADYOo2v0bYSuvOB6elSUNNtMeVNj3nhoQNrfP/hbpGmcG/uHLNyyTehQ85PAdBriDmMo//VE4/jKCKic2CGBodDjnq8nKMtHcADWhL30IPiIUUlFOr0LPm4yONID8IqymlZayVBnAUFWtyuRvbg/OIzjOAR9yyAK8Ndrzlt8ZLISpUp1BN92zIeGSwmu+nPKTwgp2rsRxZ0esKhscve+OW1u6CEIPB+aKjJrvN7c04T5sQ5yoDYKKEMFz4DyL7ZA0j7bz4/OoD4xg0GiNeZ9Mr50I0mz3b5orXXDhBsG4ZbY7YsQgzItdIILptPGf176QQ0QdSl/gXIlvYNBIVKNSQv5XM8ICP32VL2w
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 17:02:02.2105
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e467f60-6797-4aa7-bba8-08de85d93dc0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM2PEPF00003FC2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB999228

On Thu, 19 Mar 2026 10:39:32 +0100, Krzysztof Kozlowski wrote:
> On Thu, Mar 19, 2026 at 02:16:41PM +0530, Akhil R wrote:
>> On Wed, 18 Mar 2026 17:31:50 +0000, Conor Dooley wrote:
>> > On Wed, Mar 18, 2026 at 10:57:14PM +0530, Akhil R wrote:
>> >> Add the 'mipi-i3c-static-method' property mentioned in the MIPI I3C
>> >> Discovery and Configuration Specification [1] to specify which discovery
>> >> method an I3C device supports during bus initialization. The property is
>> >> a bitmap, where a bit value of 1 indicates support for that method, and 0
>> >> indicates lack of support.
>> >> Bit 0: SETDASA CCC (Direct)
>> >> Bit 1: SETAASA CCC (Broadcast)
>> >> Bit 2: Other CCC (vendor / standards extension)
>> >> All other bits are reserved.
>> >> 
>> >> It is specifically needed when an I3C device requires SETAASA for the
>> >> address assignment. SETDASA will be supported by default if this property
>> >> is absent - which means for now the property just serves as a flag to
>> >> enable SETAASA, but keep the property as a bitmap to align with the
>> >> specifications.
>> >> 
>> >> [1] https://www.mipi.org/specifications/disco
>> >> 
>> >> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
>> >> ---
>> >>  .../devicetree/bindings/i3c/i3c.yaml          | 30 ++++++++++++++++---
>> >>  1 file changed, 26 insertions(+), 4 deletions(-)
>> >> 
>> >> diff --git a/Documentation/devicetree/bindings/i3c/i3c.yaml b/Documentation/devicetree/bindings/i3c/i3c.yaml
>> >> index e25fa72fd785..1705d90d4d79 100644
>> >> --- a/Documentation/devicetree/bindings/i3c/i3c.yaml
>> >> +++ b/Documentation/devicetree/bindings/i3c/i3c.yaml
>> >> @@ -31,10 +31,12 @@ properties:
>> >>        described in the device tree, which in turn means we have to describe
>> >>        I3C devices.
>> >>  
>> >> -      Another use case for describing an I3C device in the device tree is when
>> >> -      this I3C device has a static I2C address and we want to assign it a
>> >> -      specific I3C dynamic address before the DAA takes place (so that other
>> >> -      devices on the bus can't take this dynamic address).
>> >> +      Other use-cases for describing an I3C device in the device tree are:
>> >> +      - When the I3C device has a static I2C address and we want to assign
>> >> +        it a specific I3C dynamic address before the DAA takes place (so
>> >> +        that other devices on the bus can't take this dynamic address).
>> >> +      - When the I3C device requires SETAASA for its discovery and uses a
>> >> +        pre-defined static address.
>> >>  
>> >>    "#size-cells":
>> >>      const: 0
>> >> @@ -147,6 +149,26 @@ patternProperties:
>> >>            through SETDASA. If static address is not present, this address is assigned
>> >>            through SETNEWDA after assigning a temporary address via ENTDAA.
>> >>  
>> >> +      mipi-i3c-static-method:
>> >> +        $ref: /schemas/types.yaml#/definitions/uint32
>> >> +        minimum: 0x1
>> >> +        maximum: 0xff
>> >> +        default: 1
>> >> +        description: |
>> >> +          Bitmap describing which methods of Dynamic Address Assignment from a
>> >> +          static address are supported by this I3C Target. A bit value of 1
>> >> +          indicates support for that method, and 0 indicates lack of support.
>> > 
>> > I really am not keen on properties that are bitmaps, why can't we just
>> > use the strings "setdasa", "setaasa" etc?
>> 
>> The intention was to mirror the property described in the specification. Using
>> strings would not allow to use a combination of methods when a device supports
> 
> Why combination would not be allowed? Look:
> mipi-i3c-static-methods = "setdasa", "setaasa";
> Both are allowed.
> 
>> more than one method. It also cannot represent the vendor extensions (Bit 2)
>> cleanly. Would this be better if we use macros instead of raw numbers?
> 
> Hoes does setting bit 2 differ from a string "vendor"?

Okay, a string array would handle those cases.

I am concerned if this can be a string array for the ACPI because the MIPI
specification defines the property differently. Would it be fine to deviate
from that specification in the ACPI? Or do you suggest to keep it as bitmap
for the ACPI and use strings in DT?

Best Regards,
Akhil
