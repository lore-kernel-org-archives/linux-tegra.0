Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012016.outbound.protection.outlook.com [40.107.200.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6255908B1;
	Tue,  8 Sep 2026 17:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788886915; cv=fail; b=TSq8zWi7H0vfPNFLTHYVG4MO6EnOXxOdRZvSFMDAN4vaCxRzFaFS3amcuaozWS27o2bvIq6ga8IzyT4Dq7k5KIzWbdltVi1PN34us4qJGNIKcvKmiTqDvrJPRfHreonWAlIZiFwsxHnGBIt8Xx1kU909zYosdP02ATYLhmFwxUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788886915; c=relaxed/simple;
	bh=5d8UJpFaSJfSNW6yzfI50pJOlLgSWgqJ7dUONz5Rn14=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QN8gwlsbeuT7fnXpGHeW21HOwJfv+xRBZuGYnz0XlH6BHMHD0gJymQ1VuoUUBkQAbT1+uJGkst6EE8iKIGKGUtln5P/brBHRKuuth1BO47TzAbVq6TX0UErtFEd5nAE+ihufQUf75SO/wzgJN9fds83GiRtes7HqQC3JxxKzVAU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Tk2H7SiG; arc=fail smtp.client-ip=40.107.200.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Tk2H7SiG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rC/DKQB9gBXkf8rgGGaNSL059n2lntCzMoWAnVFy03cw8nU+dABhGHFzSAoz5Lvlor09hO+aYVeUxbmAc7G5uFHZbsh68yKAQakV3fy9rg3YngM/xzg52nDjcSzSgpLl+N5mI9m644erhzq2kaTLSUO9xUoQH60X7K4MIrgdVtnHynSwrhQNrJtKPBp++Yh3OUw2u/KR/zOAI4dTrf1QRul3lIJ7iO3mPzK53CoGtaVWAwpGQJNm8zKjmyURqp0aOxmcwtPBBeurq+KVfePR3DtQ9Igh5Ipa3Cherz+3XweayVUDgdVf15OE5t7fKREGa1RJbjdAMSNJH/C1LR+dyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gvsqk5g8PbICSv1JBa0k+MxRcU1r0VofP5g4gCPaacE=;
 b=dQxIUdzFYTAmX1VOH/HvwScluhJMiidXaRNYCMA96E47BU4Imkurrx5IAAPIAX1zykondkJRpSMy421as1g8txt1410scfOOZ5fFD4ZXw57lwCsVp+WtWB7HowtTAYBZmmBQ+Rue1kzQKc6yXaxeM4AeiDR5nNSnT2wtIjdky0qvh9v/I9gjU+L0FsN0dESL1Rg1U8jcMNKt0c4aaTNPKkBnqZMlgc2fhlmTxo+QGuknRp6LxkqIWCwCnJDYUzoWu77hmsWCq4gi07tF2IZFLw2nXEUfktD134ci3ykPRN2wYq0dphR7Mkjye8Cwjp3Kxu3chi4DKR75NFC1YyHDqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gvsqk5g8PbICSv1JBa0k+MxRcU1r0VofP5g4gCPaacE=;
 b=Tk2H7SiGSwpEiLesakqqp0kFCo0D4kISRzy9t+HtNIxD+3O9ieQVT6LJWYJVzjPbkAQTopm42Xnad016MtVArfP3VESC92amcZpJEei5KjxNqQpVPYH2X6yL6UAykNxFN8d7LrQur0gfqqfxdqC8YmwgEMoQC5P6KQxNUIHV6NsCu4OeDScnOy0AtSVS5p6jk3mFbqR08Irz9oZGAGovq3Q2ZFWxvQ5Ae83Ta9Mxsu5i4pBBcMdpJl6ldPdF2Oxc9grxirDpvtEcOjADjetRWHG1tmpmk5D5rSUHD+VCxhJhLlrIi0qZiVQzWUfCgF64fHo3/23duJZe6rsCrY4Mkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ1PR12MB6051.namprd12.prod.outlook.com (2603:10b6:a03:48a::18)
 by SA1PR12MB7246.namprd12.prod.outlook.com (2603:10b6:806:2bc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 17:01:46 +0000
Received: from SJ1PR12MB6051.namprd12.prod.outlook.com
 ([fe80::96e1:b300:7b78:d3a9]) by SJ1PR12MB6051.namprd12.prod.outlook.com
 ([fe80::96e1:b300:7b78:d3a9%6]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 17:01:46 +0000
Message-ID: <a3ae0812-5e45-4351-aa40-5eba9f97e85b@nvidia.com>
Date: Tue, 8 Sep 2026 18:01:44 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 0/3] usb: host: xhci-tegra: Add Tegra264 XHCI support
To: Wayne Chang <waynec@nvidia.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Thierry Reding <thierry.reding@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260903074539.613220-1-waynec@nvidia.com>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20260903074539.613220-1-waynec@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P190CA0040.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::20) To SJ1PR12MB6051.namprd12.prod.outlook.com
 (2603:10b6:a03:48a::18)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR12MB6051:EE_|SA1PR12MB7246:EE_
X-MS-Office365-Filtering-Correlation-Id: d28db0b6-9b2a-4ca8-52ef-08df0dcadddb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|1800799024|366016|56012099006|11063799006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	o8JFug9bAjpv56GWmDpusSaGtrVg25iUHfrofHUzMiVBsl7FAG8AkRcajufnIOItLirKz3ip3FISM87Hk/dd38PVPcgQT+997KrbJEwL4vnDIsSbbGGYltM9rBPSBdv95lA6aFKlxyal2+dYMxsw1DhPsjZ8P2EFgizLNyRbWidRSMx476NqiYkY7fsdGDv8zSTLPKT5xyCi1YCKUXFUdhQGpL3kJYP17LAhIz4Fa347EpuAeF6myTJTqpU6vQIK34ZIV6OTQOLa5SqDB4VDjYVdCxaB/njsxHQUPjdfL/nTpyZlUzJHZHuP+i6ccUH4ZdEBV7gQM1tlPVeQ+BHbPf8WCDWRMKRe2/SoJT8mUSkK1ED237yBEElYU+iY5qKmANx7D3bJVldR6HJP+PljqEtJjkeM4OSeW5LlgQkLz0Y0iynv9hRcgqdrFogvXymWjAe4N+d8ZD34AbFJ0kMXVnTLcBm2fO192rhavtIyJ0AAOBQ3Ui4dDaoOz9ZIe0ai0OIXjLOJxAkzuG20VUzPxgdhxk1PRWS43qBBnb0KIM4guq69EPNgmzjnGODVr5Wdv3a3hvzjBlc0yMfj8SZoDJfqSNMBqSv1O/0Oms+xO3LwW3BnKpoJimJdh5v+r8m1L4lUgzjKJDZ/Mlc50IeeOCxm1cb9BE4nBLKkrZ4t/sM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR12MB6051.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(1800799024)(366016)(56012099006)(11063799006)(10067099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bjVMV3l5NGRBRVk2U1lnaExIS1k4SjdzVWtZUDIrUG9jSnJ6T0lSbmRmelR1?=
 =?utf-8?B?bFA1UjROL1MzYlhPRG82RndaZmNxc2lBRWdVTHpUeFU2SjlKVG9PNzZWSVpG?=
 =?utf-8?B?eWNsR09sUEo0Y21mZEdwd0JrYThONmxmY2Zjc1llY25zQTB0RzhLVm9vOHNF?=
 =?utf-8?B?WDU4WitpWVd6eWJLK1l3a3UzalpUeHhZcnZjSHNCank3by9ZOVJnYmN3Szlr?=
 =?utf-8?B?L3lvTnBXdTJPTkFGR3pYamQ4M0lsUnZpVWk4MDlaK2MvNUU5cEIwekFsM1N0?=
 =?utf-8?B?TWVKa3laaTBIc1pjb05hcHNBWTRmY1RRZUJTSE0yTG9udFdvRlZuVTFBZWJS?=
 =?utf-8?B?NCtmektPNWs3MU94TzZjQ0xla1VPT1MrbzBuZmRseWczK2Njd1B3TGt2UTRh?=
 =?utf-8?B?S0dJUEUxd0swdXRRdW44U2U0ODR2TTlVQjZ4S2J1ZXFWbXJyZFg4eXQrZUlO?=
 =?utf-8?B?U2NXY0FXc3VhWWd5eXh2NEk1NWdOeHd4T1UrTWo5SGRtRHVBbzlBN21ubmxX?=
 =?utf-8?B?QnBJbmdORGphRmFieUROUGFEMThNZWR2NXBHRWVSdkZYNk9VYzQ0bGhpQ01y?=
 =?utf-8?B?OUVaZ1pBQ1RtcG9pVkdjV0ZoaUVZY0FTczN5NnoyeW00QUo3TkpyNm9nZzlh?=
 =?utf-8?B?cnNoaHR0U2cxZjRSYWJTNy9jRFdBTTlLK0JLbk16SjJvejdpcS9VK2hLL01t?=
 =?utf-8?B?SEQ3QnVCRkkwb05KcGFQYThKY3NlbWhUZ1dmb2dmVVhrUWF2UHdTWmM2SzhD?=
 =?utf-8?B?NVlUTms5M21rMm5GU2xJSnA2ay9yQ0dhODFzY0txR0NyWGdTdHN3ZjRGdzM4?=
 =?utf-8?B?L2h2RVY1bHpJL21CSDdPU2U3MmlvZTU3aWo4YXBBZUZqUk5iSXdQNkhDUDdW?=
 =?utf-8?B?K3dXdWRndXowalgrWnpSMXBLZ3hvUnRWNnNxYTM1ZkJRdGdNbUZJSTd0Y1ZM?=
 =?utf-8?B?SSt1bmFlTVRQcU1MOXhDRHJkQ1NOMkFCbnJDdUQzeUYraDFmdG84VlY2ejUx?=
 =?utf-8?B?eC9XeTZFMmphaE8wcDg4c2lqck53Y0JWaVorVWo1VStJbW9USkUyT3I0MXR6?=
 =?utf-8?B?V01KTkxuSnJrLzMzcXVTdm9Qbjh6RkZSQzJRZHkwaWU0V2FYTllxSGwva0l2?=
 =?utf-8?B?ektlUi9vU0tvcTJsZ1pRdjN2TEI0VXo0ait3OWlnYitKY2FBeHVUdk9UbzBX?=
 =?utf-8?B?ZXBtTjhBdXNPOGJTbVBOZ1dxaEhFSng0Q2owYnRlcVpnanBlQmRFYlhFVSt2?=
 =?utf-8?B?a3g4QmMzYkwrbjRZUGpIYTRjSi9JbmJsMk5Jd0MydWY3Y0QrUUZ2Q0U0UTE1?=
 =?utf-8?B?aTVrUzNGU2laRG5hWFlvMmZZaXQrdUdOeEMzMk9zZ0VWandDekFaS0hiTHUy?=
 =?utf-8?B?UEt0aDFMQXZkNDFsWXRibkI3ZzdvT1ZNUlBkVU9NSFdmTlNwRDN0a0xSMmhx?=
 =?utf-8?B?OGIzbzVZZHRSZGthY1BqYmhsYU05TkJXNm4xTkdYY2k0Y045NFdWUDhOUFlj?=
 =?utf-8?B?ek9xL3pHS1BLaDloRnNlcFMvdStxY3lNdWx2TWsyNkNienJUZ3hNOGp5bjdN?=
 =?utf-8?B?clhOUWtUM04yT1FucmZvUCtzd0NrUTVHc01nRVpTYW9oeENYVHdKQzQ1OHdj?=
 =?utf-8?B?ZndFeTRGQWV1K0NnandZUjhCS0NCOFUxamJzakZucWFucXAyR3Q5WHJiWVVI?=
 =?utf-8?B?Ylo3bDhkSlJ2cXROdDhOYUVYbEQrai9TUVJIczh2SUhLVGdxamY1RUw4R1A3?=
 =?utf-8?B?N0l2R1pWSHhrMkY5U05EME1KYkVJbUttbTMvdkdZbzdTcDV2SkpGVlBKMUYr?=
 =?utf-8?B?R0VibGsxQ3FxYjl1RTArRkoxRXRxVGdmT2RNam1RcjkxWWE4UWhEUXJEakJ6?=
 =?utf-8?B?Mm96QlY0S1NJL1dxNmRXOGlhc2kzdGpNUG1FVW1VRDFUcExQbnJ1T3dNVUh3?=
 =?utf-8?B?NWF0alh5aFRMWmdwcHR0ZGRYK01BZWJVQmtFek0yb1h1OGwyZDc4YXB3bHpD?=
 =?utf-8?B?djdsb0dFOVRWSGd5Z1dFS01RdnIzRi9BS3RYbGZjeDdKL2NyS3BkUW1YcGl5?=
 =?utf-8?B?N21RRlJ0ak01WmVxUStCTXYxUkZHdUpwNHFKblRRcHBLaUVyaFF6MXpQMUow?=
 =?utf-8?B?T3VPVTRUeFdmbUFxMm94MXlMRkxpZTd4cEhKZmhXVjdQOCtFZ3VxUnI5clpQ?=
 =?utf-8?B?RUxQNFZLZWNyeGF0YzZST1NIelFtVkRWQWM2aXJienI4NnBHb0dtb2FMSjdl?=
 =?utf-8?B?MDdQek1rZm9qb3BTNVZMeTR3TDBPU0FtMjFnOFpsb1lRMGFBOEliR1F5Yk03?=
 =?utf-8?B?aXNyd1hoZjdRMFRBTjRDOXBVUnhHdFhMNERaUGgvZVhybW5WZUtyQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d28db0b6-9b2a-4ca8-52ef-08df0dcadddb
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR12MB6051.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 17:01:46.7979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p8Gm65S3epMjjvWfFkPmsQbuuvSZr+0Mtp2Pc1Cug8rYYGt4qioLQISyugf5LKt4w0jHwrKAJF+ZeiuvdEfnMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7246


On 03/09/2026 08:45, Wayne Chang wrote:
> Add Tegra264 support to the Tegra XUSB host (xhci-tegra) driver and
> its binding, as part of enabling USB host functions on the Tegra264
> Jetson AGX Thor platform.
> 
> This series was previously posted as part of a single 8-patch series
> covering phy, USB host and arm64 DTS changes together [1]. Per review
> feedback, it has been split by subsystem so each maintainer can pick
> up only what belongs to their tree:
> 
> - usb: host: xhci-tegra + its dt-bindings/usb: this series
> - phy: tegra: xusb + its dt-bindings/phy: separate series [2], sent
>    ahead of this one
> - arm64: tegra DTS enablement: separate series, to be sent once the
>    binding patches from this series and [2] have landed, since it
>    depends on both
> 
> Patch 1/3 (dt-bindings: usb) also addresses Krzysztof's V2 review
> comments: the iommus entries are now listed individually, and Tegra264
> gets its own allOf conditional pinning interrupts to 10 and iommus to 5,
> instead of inheriting Tegra234's wider top-level bounds unconstrained.
> 
> [1] https://lore.kernel.org/linux-tegra/20260831185835.3732707-1-waynec@nvidia.com/
> [2] https://lore.kernel.org/linux-tegra/20260903071937.533646-1-waynec@nvidia.com/
> 
> Wayne Chang (3):
>    dt-bindings: usb: Add Tegra264 XUSB host support
>    usb: host: xhci-tegra: Skip MBOX MSG_ENABLED on Tegra264
>    usb: host: xhci-tegra: Add Tegra264 XHCI support
> 
>   .../bindings/usb/nvidia,tegra234-xusb.yaml    | 52 ++++++++++++++++++++---
>   drivers/usb/host/xhci-tegra.c                 | 37 ++++++++++++++++
>   2 files changed, 84 insertions(+), 5 deletions(-)

For the series ...

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

-- 
nvpublic

