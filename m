Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010023.outbound.protection.outlook.com [52.101.46.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A89379ED2;
	Fri, 27 Mar 2026 11:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774611754; cv=fail; b=lhrVIJTEBKLL4E3NLaE42F5o3wWRHaa9joC+v9gcoHT7CkdkoPvTrLnaMg3EY1lQB4CvZPNu1DxLakcDxEiylFm7yRK1H1akocPk1ajGmggSybpgBvf1a2UfAC3ESjI+uuEJBGo2Ex4ODdaKJJ8CDlrrAhBq7OwQvLYKBFlNMxA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774611754; c=relaxed/simple;
	bh=3Ifbb44lFfRiaLcHR0qQmd7rByDQeVfFJhs0cdMj97o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X6omwRn9tNBD8azyiru5VbnZNPR2w13Z7d/49Y8hpuyOho6WK1czXZqk2XivMtQn9J3VyhdkPCoHczVqOBsRbXFaecDG/RItFRvADOOefx2dYcId+vNLt3NK5DBxjjGx488YRg5lFE5Nlbycbo6+sbHe8ZlxTywGLqXSG3Ap7v0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hvfeRcuX; arc=fail smtp.client-ip=52.101.46.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hvfeRcuX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YeE/orj4kVlvxfbyet0sZHPR6uS6EMtHVlMe/4KYxotUSou6o9ya/ONzpeAdv1EQb23zjS4Aomgj1k6zei4kGnaBJK1fF1O6+m0qZXTk7TTMD61hTo63JgWLQXsNNbaxj8zIpJQxTKwVkYzSnavm37xidCaAHx6bQ+I0p0hhAYAy3arl4X2LvZTY9d4Er2QZbmCKHn6AFV3Xa1IEeg22bsZb5mTXR2wijMl81mjQ+hZmI2MQvo4Rb+4d2ReejBxaa29mccslgvn6B6qBjyh12sRu7kvodbw4NbBQd6lZQe0sC/4RD3Yx4ziylfbyq6KoZQVaBBv4sCU93akCsYj5zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tD8bAf7vSZo26Z8+ty8eD2xQ82JX1Fqvq6fCGUaSkwc=;
 b=HuSq5j3wQjepAIcdYRhodchaWP9W2fn4kci74zrOT/ZtLYaT08GpiB7VV+cOveufAUAE3ajkkVH7TIPR46weI4sj7RQeOVTzYBDRVanVZ3HjQF8xfv98YF3seeCuqLA2I8YKkwikc8A1CkOb/8k4pxpnCQBzH9yNDWiARSwL7lFVzhdnkMjn2LkPNKOqcQbL38dkE2l/hUupPs+CZaXpXKay/QMtZXqRGUVqlOUK6Oi/YvBc7iwkA35N09C0ve676rHuJL0NoDJCGc6pjFrblD43Fm1FSwrK4cTM3/B4Sppn/tUoD1CHPH1L//JsQXicJXb+d342x2TOLbQL64PuZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tD8bAf7vSZo26Z8+ty8eD2xQ82JX1Fqvq6fCGUaSkwc=;
 b=hvfeRcuX+nLW0qFnLU9hLJBhixSztEvETmKg6m4Me5dPIQvP9u5PQdUZx7UsrEcvBBlxYhXCA1wdJFN8m9gbVBFk574L/MVJj0jKWEtCK3lIvTuu651C70n0weWz/QvGodG/JsNkFmoLQ7Mre75fnB5eUuIPLnX334DXTlFQxCoNQ8SHnKGTEA+iRe4lmC+lpEo41ACa+qF6/X1GdyZ1YdthlosnR7ryYqTjsnCZR6K7sA1zOGWNZkC1mQcc7cSGPISetS2yPpefxH72sw/TicJJEZOCpuWPDoTNIUILQCnrgdib6MhV9FYYM2o3tBMsVyv0Gelqu8nfiO55I9LUIg==
Received: from DM6PR08CA0043.namprd08.prod.outlook.com (2603:10b6:5:1e0::17)
 by CH3PR12MB9079.namprd12.prod.outlook.com (2603:10b6:610:1a1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.8; Fri, 27 Mar
 2026 11:42:26 +0000
Received: from CY4PEPF0000E9D7.namprd05.prod.outlook.com
 (2603:10b6:5:1e0:cafe::a) by DM6PR08CA0043.outlook.office365.com
 (2603:10b6:5:1e0::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.23 via Frontend Transport; Fri,
 27 Mar 2026 11:42:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000E9D7.mail.protection.outlook.com (10.167.241.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Fri, 27 Mar 2026 11:42:25 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 27 Mar
 2026 04:42:12 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 27 Mar
 2026 04:42:11 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Fri, 27 Mar 2026 04:42:05 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <alexandre.belloni@bootlin.com>
CC: <Frank.Li@nxp.com>, <acpica-devel@lists.linux.dev>,
	<akhilrajeev@nvidia.com>, <conor+dt@kernel.org>, <conor@kernel.org>,
	<devicetree@vger.kernel.org>, <ebiggers@kernel.org>,
	<fredrik.markstrom@est.tech>, <jonathanh@nvidia.com>, <krzk+dt@kernel.org>,
	<lenb@kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux@roeck-us.net>, <miquel.raynal@bootlin.com>, <p.zabel@pengutronix.de>,
	<rafael@kernel.org>, <robert.moore@intel.com>, <robh@kernel.org>,
	<smangipudi@nvidia.com>, <thierry.reding@kernel.org>
Subject: Re: [PATCH 01/12] dt-bindings: i3c: Add mipi-i3c-static-method to support SETAASA
Date: Fri, 27 Mar 2026 17:12:04 +0530
Message-ID: <20260327114204.46556-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260327082721f7e69e6a@mail.local>
References: <20260327082721f7e69e6a@mail.local>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D7:EE_|CH3PR12MB9079:EE_
X-MS-Office365-Filtering-Correlation-Id: 64464096-a5f5-46ac-adfc-08de8bf5eaba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|36860700016|376014|13003099007|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	kB+llwkeY7GyoM9NIgM+w170Yai/RItxkAYH3q3LRnVawlKfGQXceHAr4/lTwwI+lpsOFbRz3wV9RQsgOSyAqhy3K3uLfIRe1W2sa1FyiwSFvdcZCXyhBDnH7jm4eeWuptjFW08FM5Blc3emwwgemeHVDjhqJ9SFO252VndGD756fTGl33R3DdGUBDXtZTZYvrL4dl4E3IkVuqzBR4hKfQgoljGW7ZmmWzROFtPFa3F73+BU/A/4f8UV8Kjz9r67f5iRmu+h4xNR/fL6dERc6sh8Eovg/6LfnmnWnh5AdtEITehrFodB0xNkU9x54wgyGzYhPEHXxf94axnIn8T2lU7/FdLvrFI11S2u8e+FruwHmd8+XkX2xu4qPEKwnmZVL6L9zCSo0EyP+GJAAIeIjp9WyeJLLuZCVp8Db2pvj5n5iZzn23q8fU8Xo6xuL6PPiZWFaw96REOxSbHbcVKJ6S2kh8D5iOfcnAvE/q1WJDP3bmRRiIzvrqRfT+dPYZObr9y3IaVFX+8SGFHeHnnUohhjwbr5I7f+xoGVCnpxTYuU37BQEiNRv7L/JJ5eXobRMaJ4hU2ydsaZqVsukIYmZYs+NRKoDJg7odPMpnzgtwg3cPb9gcmEwWSO23HQGb3Cv6DS58snAs3JrQ543y2dbCCFWsG6EWj0t9EzyA/WMH8c5NlPx1DuMUS72JTadQ9gozz7ckYDrDZR0DA5fhuU6eC2LEoRdV2tiIQPYSxfpOCBVKkkkGdS3RegyOkdN6H2XbiIfra1Kyr51/19YL43jg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(36860700016)(376014)(13003099007)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	T3MuXZ7ocO2j6jP/Nl+9ve/r+qfWB3gcnHysvJoALs3ERHqhq54REcexq3bPhqYtVW8luJAegH8u22Ie5dB6hwZ58dda+WUGIxJjISL00vUfzcWXYc2IQ/vWDICADBt3JZko2i+uEQA67LL4zofsQFXUHY0ZdQxTqNiWjOcEtOBhdw/JsCUaRmrL+ifYyT8OQaZzA6MwmmnCy3gtEl7IBaCT5pmhPKUdS3sX5CyDCEEjM1IYPWISXkii4nGt8MZA2zNCqtEjru3RGtwc+1aS7zZhXwwR9u7OgK/UwwZXkkVVOanTWI8+IcVOmYi2Q/+i5Zn2117NqqYys8rH6SkqtJv8NcnfgXqBK4+wxN46EJarzzd1771LcCvQEou8xBXYLbfDMrFUstENpMTmtr6DH/yOtGN2ouh0JSNL3Eqwjz4BiAkYhqmfQbxXUuvuCaSb
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 11:42:25.3080
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64464096-a5f5-46ac-adfc-08de8bf5eaba
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9079

On Fri, 27 Mar 2026 09:27:21 +0100, Alexandre Belloni wrote:
> On 27/03/2026 13:48:58+0530, Akhil R wrote:
>> On Thu, 26 Mar 2026 16:44:31 +0100, Alexandre Belloni wrote:
>> > On 26/03/2026 10:05:03-0500, Rob Herring wrote:
>> >> On Wed, Mar 18, 2026 at 05:31:50PM +0000, Conor Dooley wrote:
>> >> > On Wed, Mar 18, 2026 at 10:57:14PM +0530, Akhil R wrote:
>> >> > > Add the 'mipi-i3c-static-method' property mentioned in the MIPI I3C
>> >> > > Discovery and Configuration Specification [1] to specify which discovery
>> >> > > method an I3C device supports during bus initialization. The property is
>> >> > > a bitmap, where a bit value of 1 indicates support for that method, and 0
>> >> > > indicates lack of support.
>> >> > > Bit 0: SETDASA CCC (Direct)
>> >> > > Bit 1: SETAASA CCC (Broadcast)
>> >> > > Bit 2: Other CCC (vendor / standards extension)
>> >> > > All other bits are reserved.
>> >> > > 
>> >> > > It is specifically needed when an I3C device requires SETAASA for the
>> >> > > address assignment. SETDASA will be supported by default if this property
>> >> > > is absent - which means for now the property just serves as a flag to
>> >> > > enable SETAASA, but keep the property as a bitmap to align with the
>> >> > > specifications.
>> >> > > 
>> >> > > [1] https://www.mipi.org/specifications/disco
>> >> > > 
>> >> > > Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
>> >> > > ---
>> >> > >  .../devicetree/bindings/i3c/i3c.yaml          | 30 ++++++++++++++++---
>> >> > >  1 file changed, 26 insertions(+), 4 deletions(-)
>> >> > > 
>> >> > > diff --git a/Documentation/devicetree/bindings/i3c/i3c.yaml b/Documentation/devicetree/bindings/i3c/i3c.yaml
>> >> > > index e25fa72fd785..1705d90d4d79 100644
>> >> > > --- a/Documentation/devicetree/bindings/i3c/i3c.yaml
>> >> > > +++ b/Documentation/devicetree/bindings/i3c/i3c.yaml
>> >> > > @@ -31,10 +31,12 @@ properties:
>> >> > >        described in the device tree, which in turn means we have to describe
>> >> > >        I3C devices.
>> >> > >  
>> >> > > -      Another use case for describing an I3C device in the device tree is when
>> >> > > -      this I3C device has a static I2C address and we want to assign it a
>> >> > > -      specific I3C dynamic address before the DAA takes place (so that other
>> >> > > -      devices on the bus can't take this dynamic address).
>> >> > > +      Other use-cases for describing an I3C device in the device tree are:
>> >> > > +      - When the I3C device has a static I2C address and we want to assign
>> >> > > +        it a specific I3C dynamic address before the DAA takes place (so
>> >> > > +        that other devices on the bus can't take this dynamic address).
>> >> > > +      - When the I3C device requires SETAASA for its discovery and uses a
>> >> > > +        pre-defined static address.
>> >> > >  
>> >> > >    "#size-cells":
>> >> > >      const: 0
>> >> > > @@ -147,6 +149,26 @@ patternProperties:
>> >> > >            through SETDASA. If static address is not present, this address is assigned
>> >> > >            through SETNEWDA after assigning a temporary address via ENTDAA.
>> >> > >  
>> >> > > +      mipi-i3c-static-method:
>> >> > > +        $ref: /schemas/types.yaml#/definitions/uint32
>> >> > > +        minimum: 0x1
>> >> > > +        maximum: 0xff
>> >> > > +        default: 1
>> >> > > +        description: |
>> >> > > +          Bitmap describing which methods of Dynamic Address Assignment from a
>> >> > > +          static address are supported by this I3C Target. A bit value of 1
>> >> > > +          indicates support for that method, and 0 indicates lack of support.
>> >> > 
>> >> > I really am not keen on properties that are bitmaps, why can't we just
>> >> > use the strings "setdasa", "setaasa" etc?
>> >> 
>> >> If this comes from a specification, then I'd tend to just copy it rather 
>> >> than invent our own thing. Obviously if is something structured 
>> >> fundamentally different from how DT is designed, then we wouldn't. But 
>> >> this is just a simple property.
>> >> 
>> > 
>> > The issue being that the specification is not public so it is difficult
>> > to take any decision.
>> 
>> There is a public version available in the same link, but you would still
>> have to provide them a name and an email ID. The document will be sent to
>> the mail ID.
>> 
> 
> The public version only contains one property:
> mipi-disco-interface-revision

Could you check once if the below link works?
https://www.mipi.org/mipi-disco-for-i3c-download

Best Regards,
Akhil
