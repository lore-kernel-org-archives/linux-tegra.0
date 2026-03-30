Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012029.outbound.protection.outlook.com [40.107.209.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB3321B192;
	Mon, 30 Mar 2026 05:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774848435; cv=fail; b=ZAJedfodvKIetTuUEnXZGOYkIRD51VqIQgXhzWxUIt5aBALQfNspj1uGjwxrTFeH8bw9V3Ktw1++6V3jrfXisHULZkO0eUqhDhQxT1H7yZvUkC4UTIxPC/kFV1+Yvgq2PYzt0u+EndcyITXvcWHro/lSkSLBleYPcETxpSUWZ8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774848435; c=relaxed/simple;
	bh=U16FbXtpoQjWIhREAszw3cYVlRYkje68m2wrI0UGQ2s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rNqcxYJhL4V0u4oCRuoyiygdX66UadfoIkuHYm/C7UqzChx8chvzk1crBV3D4UnDFen/2h7bbyzzNxlFPLEolQzrkK+POKPToU6PE9qldqu4lBEVIg/0ASWBUamRfJLu+eFTQqenVstL/7KocYtm08ErNbDQEvkMmcRot3tLhq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Em/T5LiU; arc=fail smtp.client-ip=40.107.209.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Em/T5LiU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U1+zF3o0NDB+ZsauXzu/VKAwmlUH/23igk0Bb4xVXIAYif7DkWtK/Vu6kjOS5Rmr/vm7EhlAWDKk9KFNe7VT/hISdDLVZh1THtBPrxw2BysnSQ/gnSXAWcBln5NjjtYnFtLrMTpnsCX9ZuG0NpVfooqwfw4QnL/cpLsEcDVKowY+qwX6EQF/vfmCfcs+LTtW87mLII7nMjJGSyCxNjp+O/8RaZO0kusAaB5gcrvFoG+aHKa4Z6Q4TMt9/kYxUJTRGjrKfC09tbRIgz7Rlr/p1tPPATLCT7Dt906nR8XAGf4bKCy53ZUil/udB93krL2Fuuu3Cmcf+eazItCDKuLcLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T5SAysfwpQelhuj+aCnXbL3FXUDdEA7jD+yOjuzV00A=;
 b=gK7MWOnYBWA4N1jc1gplbeBN9YHNhikceUPUyHt76WU6fP6ToO7PGZ+XTC3N4jGPfo0//Qgw1S7JCcu2g8fM+1WARmbUDHoF2aRV96vNZzg9YzKvIkinggOur8kv60+Kuox3PJE93c71EGoNUQugyoUBlW778pEfTG6hnwkq8k5GVGUP+3Hp/JKlMATufZJkssrqK5ummhYyF3lVZCvYOrJwZkD93uYkX3lWasCLj2HimtbRvE4cC6rNt+RKxHwvt2njW0GHbvlIUYLqT23c+WhBOLIljLt2tC4qKJx4KxMl/SoZzy69G6nr9bz6pDntiiDZNURN8T1bKjS0s2Wdpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T5SAysfwpQelhuj+aCnXbL3FXUDdEA7jD+yOjuzV00A=;
 b=Em/T5LiU2f6Z3I3BS9ANfM/XA5Ag8z4hCR9GANOuSaustxUdlXjLZ4s/CbtXzwBbGmrvn5XfeBK0d5Ns6/f7bVJVyP8ClZw47oeVTHSSg0d+q0yzLDWvrav3OMe6Ml80ZKDIrNZa6yvwuiTs/TMo2sazAus6XB4t1ajiw5kanyheXZERB9Fhdeil+70cdUyMHKVCQo0sgClP2iDPM2VapkvlTn0BJb5hejarYFWS3qeqyeGobVIRoOBm3lHCCHypkJxVnebnoq6Ji0/cZcPTfib2MtGvjyVNv6r8IDPpnFSvQMGMdPLG9oiAt6oX0OqEEQs3Tg2+rFFt9OwbxC4rVw==
Received: from BLAPR03CA0126.namprd03.prod.outlook.com (2603:10b6:208:32e::11)
 by DM4PR12MB7693.namprd12.prod.outlook.com (2603:10b6:8:103::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.12; Mon, 30 Mar
 2026 05:27:05 +0000
Received: from BL6PEPF0001AB75.namprd02.prod.outlook.com
 (2603:10b6:208:32e:cafe::37) by BLAPR03CA0126.outlook.office365.com
 (2603:10b6:208:32e::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.28 via Frontend Transport; Mon,
 30 Mar 2026 05:27:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BL6PEPF0001AB75.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Mon, 30 Mar 2026 05:27:04 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 29 Mar
 2026 22:26:53 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Sun, 29 Mar 2026 22:26:53 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Sun, 29 Mar 2026 22:26:47 -0700
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
Date: Mon, 30 Mar 2026 10:56:46 +0530
Message-ID: <20260330052646.29412-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <2026032717064247cc495e@mail.local>
References: <2026032717064247cc495e@mail.local>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB75:EE_|DM4PR12MB7693:EE_
X-MS-Office365-Filtering-Correlation-Id: e74e59fc-55ec-47fc-57b1-08de8e1cfa56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|36860700016|376014|13003099007|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	11C8DZU8OkiOp3sjFlWinkhkP6jF0GUo//z3lqzHINpPjJv2b19VEsYt1Y9+HrVAYeqfBoMahAL2A3YquY/ouoKYk1L3+1WCFtI1YOG9zUtCnD7dq2Y+LYnLMhjumZDyIijaEeorQph0R3vyROwZJn2RG+wt2hdVEEi7plZ4zyI/qydxiR8U5TgZ3HK8eDghxbDbDpBQp4xVsqK73IQF91A9U0HaIQRs2JvCFAowaHU3w+y1y4bjEzsU7WFg9+ZUG6/ik02kV3es0SYdtH7lX7UV7gTqGgNyeDxvRUV1ub7aQc3DKeAfIHuVLDzLnedOb+Td6nCtrLKtZ7MqKdcB53GJoSu0+PD4+bKGk9xzN/JviMxqQRbTquwBiLTjAtC1WkJKzeoKrGvnGyoIBSGNo5Ur4Pm9d4wpWSeLtD/3XEo43LZbbfGkb+7ge/MwflPY6Tga5fW0XUCtyjsLMYoV0GGfb1ErXlZphpqx4ZyOP1dkDsPkPevQgiefIrxp6vjhHx9auneJufimuCFJq2lGeuKYyvlGvqjAt27Te8QHP2vDvE41HcCb3LFSBmyl8wXgfyzG3u9MCp1rlzMUtCiFr7GSGb9odBKA+YhWjoAF2fUoKMi2h9JUw9gkvRebLBoPRpLQusz4f/mCYIbg3kWVhX7O5797Cpnn8Q9XURmoVfYtK/cNBrJlbyn20mVtd0Z0TcY8AEQ+t955J7rtwgDbu507Rj/QWHL4hFA6Z/KN5D7fBgLWy7LSS8LjMpFVn6eTQk6t/1eMXh/qCxG3AB027g==
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(36860700016)(376014)(13003099007)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OuB51rYhEYCgADxWMePgiWvCz+6flTalGpf6cecJGtpji9eRYZMQukIoh/oMZsiKtfDIQU160Wwn4hmGINYDqQ+bbou5S0ENexytO2eS1MAgOWCGe6dufOoU23jN6kO5g5AU/FLlB/ECqH8KJiL4c6hI/VAlyVugLEh5ie+1GgsQyIpAIQh49FdyKtb/CFxwZBvmzQ4elaPOPbKGxPmoXrqRozFyDK3hKOk0ZUWSAjvdoNDmU9jt1Si7cmqioebjOAMOpRFN6lrtK7wL6+UvI6U1Lf8g3dSHC6xot1rPhAAZ5OQCkx69FI4yLCo45X9mvIyB1nkifvU9WmqYnkX9ios6tFEYTM4u6swWg/8cPIKHOyBtb6t4UVBqdkH9rc6f4JmHYz3QdZ2jqYj+oxDGfo6vGj06uWXyDGpc8VYDRsnpnkUGmkznr/1zzb5cvto8
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 05:27:04.1457
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e74e59fc-55ec-47fc-57b1-08de8e1cfa56
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB75.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7693

On Fri, 27 Mar 2026 18:06:42 +0100, Alexandre Belloni wrote:
> On 27/03/2026 17:12:04+0530, Akhil R wrote:
>> On Fri, 27 Mar 2026 09:27:21 +0100, Alexandre Belloni wrote:
>> > On 27/03/2026 13:48:58+0530, Akhil R wrote:
>> >> On Thu, 26 Mar 2026 16:44:31 +0100, Alexandre Belloni wrote:
>> >> > On 26/03/2026 10:05:03-0500, Rob Herring wrote:
>> >> >> On Wed, Mar 18, 2026 at 05:31:50PM +0000, Conor Dooley wrote:
>> >> >> > On Wed, Mar 18, 2026 at 10:57:14PM +0530, Akhil R wrote:
>> >> >> > > Add the 'mipi-i3c-static-method' property mentioned in the MIPI I3C
>> >> >> > > Discovery and Configuration Specification [1] to specify which discovery
>> >> >> > > method an I3C device supports during bus initialization. The property is
>> >> >> > > a bitmap, where a bit value of 1 indicates support for that method, and 0
>> >> >> > > indicates lack of support.
>> >> >> > > Bit 0: SETDASA CCC (Direct)
>> >> >> > > Bit 1: SETAASA CCC (Broadcast)
>> >> >> > > Bit 2: Other CCC (vendor / standards extension)
>> >> >> > > All other bits are reserved.
>> >> >> > > 
>> >> >> > > It is specifically needed when an I3C device requires SETAASA for the
>> >> >> > > address assignment. SETDASA will be supported by default if this property
>> >> >> > > is absent - which means for now the property just serves as a flag to
>> >> >> > > enable SETAASA, but keep the property as a bitmap to align with the
>> >> >> > > specifications.
>> >> >> > > 
>> >> >> > > [1] https://www.mipi.org/specifications/disco
>> >> >> > > 
>> >> >> > > Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
>> >> >> > > ---
>> >> >> > >  .../devicetree/bindings/i3c/i3c.yaml          | 30 ++++++++++++++++---
>> >> >> > >  1 file changed, 26 insertions(+), 4 deletions(-)
>> >> >> > > 
>> >> >> > > diff --git a/Documentation/devicetree/bindings/i3c/i3c.yaml b/Documentation/devicetree/bindings/i3c/i3c.yaml
>> >> >> > > index e25fa72fd785..1705d90d4d79 100644
>> >> >> > > --- a/Documentation/devicetree/bindings/i3c/i3c.yaml
>> >> >> > > +++ b/Documentation/devicetree/bindings/i3c/i3c.yaml
>> >> >> > > @@ -31,10 +31,12 @@ properties:
>> >> >> > >        described in the device tree, which in turn means we have to describe
>> >> >> > >        I3C devices.
>> >> >> > >  
>> >> >> > > -      Another use case for describing an I3C device in the device tree is when
>> >> >> > > -      this I3C device has a static I2C address and we want to assign it a
>> >> >> > > -      specific I3C dynamic address before the DAA takes place (so that other
>> >> >> > > -      devices on the bus can't take this dynamic address).
>> >> >> > > +      Other use-cases for describing an I3C device in the device tree are:
>> >> >> > > +      - When the I3C device has a static I2C address and we want to assign
>> >> >> > > +        it a specific I3C dynamic address before the DAA takes place (so
>> >> >> > > +        that other devices on the bus can't take this dynamic address).
>> >> >> > > +      - When the I3C device requires SETAASA for its discovery and uses a
>> >> >> > > +        pre-defined static address.
>> >> >> > >  
>> >> >> > >    "#size-cells":
>> >> >> > >      const: 0
>> >> >> > > @@ -147,6 +149,26 @@ patternProperties:
>> >> >> > >            through SETDASA. If static address is not present, this address is assigned
>> >> >> > >            through SETNEWDA after assigning a temporary address via ENTDAA.
>> >> >> > >  
>> >> >> > > +      mipi-i3c-static-method:
>> >> >> > > +        $ref: /schemas/types.yaml#/definitions/uint32
>> >> >> > > +        minimum: 0x1
>> >> >> > > +        maximum: 0xff
>> >> >> > > +        default: 1
>> >> >> > > +        description: |
>> >> >> > > +          Bitmap describing which methods of Dynamic Address Assignment from a
>> >> >> > > +          static address are supported by this I3C Target. A bit value of 1
>> >> >> > > +          indicates support for that method, and 0 indicates lack of support.
>> >> >> > 
>> >> >> > I really am not keen on properties that are bitmaps, why can't we just
>> >> >> > use the strings "setdasa", "setaasa" etc?
>> >> >> 
>> >> >> If this comes from a specification, then I'd tend to just copy it rather 
>> >> >> than invent our own thing. Obviously if is something structured 
>> >> >> fundamentally different from how DT is designed, then we wouldn't. But 
>> >> >> this is just a simple property.
>> >> >> 
>> >> > 
>> >> > The issue being that the specification is not public so it is difficult
>> >> > to take any decision.
>> >> 
>> >> There is a public version available in the same link, but you would still
>> >> have to provide them a name and an email ID. The document will be sent to
>> >> the mail ID.
>> >> 
>> > 
>> > The public version only contains one property:
>> > mipi-disco-interface-revision
>> 
>> Could you check once if the below link works?
>> https://www.mipi.org/mipi-disco-for-i3c-download
> 
> It works, thanks. The bitfield is fine then.

Thanks for checking. I will update the link in the commit description and
keep the rest of the patch as is. Hope that sounds good.

Best Regards,
Akhil
