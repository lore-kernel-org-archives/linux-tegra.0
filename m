Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012067.outbound.protection.outlook.com [40.93.195.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A908F7D;
	Wed,  5 Nov 2025 14:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762351481; cv=fail; b=WOwS6qdsQIOzwzcCOpp6SCZehKhjVDEgaabtzI+dACzUDbVNS84tWCSJIk7NiG0dv/jJ9j8IE0JcawRsgdCL7W4yvsizfr3PxnrBPIGR470KYIMJQw8KOtDLVxZanR3PAHSk1njRvgQOteaL40Xdl/sBaKhvp8Pxl5GHBBz/hnE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762351481; c=relaxed/simple;
	bh=RJ1dlQtw+F9ubZE5Rt17wMiwDtH384xRh6060Nl43WM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=j7eRtpj0UpyG7f6dHP/nSSS7d11NQRuV6lEufk+NdDCXntglllkeqy7C7OJ1gaUk7sgvlK8DF6UMp952+tWHHWVJ4Cdtf+pKUmB1e7wII/cfA+PaYhKwZgOkXDYcT9LnUKx02O2LVAqwwAnV1ZfRJaDmywruzE7/UyVVnxQh8Qg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fPimvdf9; arc=fail smtp.client-ip=40.93.195.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fPimvdf9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aEztjVceo1TAYLCXwAF4tcmLHOtzstQ3DX1VJtlDStkeErFbsvHgHkdhFgVrbciN2Z5TTLxFO9BB6L4VPJ2/CyiWO2J2rTRdCwWFulsjMsWmLv0BMsv4yxiW6rptXqqKNNDOmJhLAJFSUcAlR/SVvegueDfA2wLoSlunrUCrz/lE7b+4TsS5uC7gD6afas9gMyeUAFRg8A501XJhDGN52wxrb7xF5gQlciwo/2wcLo93GTtbZQFkMqL/7MFVgwK+7eEMeE589saf1sgaJxNJhiUqG6Ny557+VsURPPgYLyD7SIQdpnM/dekVvocT7pBolx1cp5V/q/Yc5ZF2ioyGUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m6wJxFoMD1ErTXQBgLlcX2YD6kfpBNn60mOzaSOZ2Ts=;
 b=ECg4PWNNyangOMPmpqPMyYpHyk6qtBLH5P4/9jGyIWmfx0d+20cjPVIoATfShR16Z+a5pKNnRnILHZGl7u8PBNs6nCJHrgAlxjBkn7frV68NQsI5JUfYjuHEmUXPsumjQdz50Pr/CgB4qw+YWdHcjKzs39rmdsq5WHOOUnbKpaF8JhGeoc4AiDf42VetgGbSLwm+rmzNrUWRlgBWlhG9GFTfVtSqS8eeMxjFcRYXnq6ztJX+qwlAY30IXYxShG/syKPvCI0v3ojt8mC2II72MIVaXnBqoxR3n6+LAM6bxC550ehkd9/UfV9j7BPGQsBsvv4hUpo1CdVnJ+HJgnY3ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m6wJxFoMD1ErTXQBgLlcX2YD6kfpBNn60mOzaSOZ2Ts=;
 b=fPimvdf9ZL5P4LQ7TfEJgzI/y4wsS8sfpOJOvF23++bkR8FBQGPWjDc27ODydM/rtMNG470Rb26XcXts76ZWpu+0t6UaGgbUHpJBEFpXoEkyyTX6siB026rVHa/htd2Fv9t0jG3hqCP5iyFouZAU7vtxJ9dsDOGbTth7FHxL6KGbeb6aLgq8OuGkxfsrrNyAFDuk1KiJ/YGg5NU+oX1hxOlgJevkTgtDh9uQ2BfiZw979aShR77WBplRgCgawf0aEL1nyEEDQMRUcSDIhINuWQxFvcA9JOsurJwZq2tG46W+0Yq6TZMeLHVg0mNn6xdVFsEjAWvhimIXHp+oCaBn9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by SN7PR12MB6742.namprd12.prod.outlook.com (2603:10b6:806:26e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Wed, 5 Nov
 2025 14:04:35 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9275.015; Wed, 5 Nov 2025
 14:04:35 +0000
Message-ID: <f936dd82-2914-426c-b641-562378297211@nvidia.com>
Date: Wed, 5 Nov 2025 14:04:30 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: tegra: Add pinctrl definitions for pcie-ep
 nodes
To: Niklas Cassel <cassel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Vidya Sagar <vidyas@nvidia.com>, Vedant Deshpande <vedantd@nvidia.com>
Cc: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
 Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20251009142253.2563075-2-cassel@kernel.org>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20251009142253.2563075-2-cassel@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0583.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::13) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|SN7PR12MB6742:EE_
X-MS-Office365-Filtering-Correlation-Id: 23487e41-5c7b-4f48-64e3-08de1c744042
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R29OalZEZ2hUQ3g5bzFRTkVGanVHc0wwaHg5d0FyellZRkwxSTJINEkwR0t6?=
 =?utf-8?B?UnRKWWJ1dzlDYnFxWkNIMU1oRTRiSUdHVGhPOFBZUmFSVFd3RzJEMTM2WjB6?=
 =?utf-8?B?T3V2ODZFeXgrejRGSnErMzNkczVHVm1yeUlZMllIMkFZd05vZHhBN2M2Zzk1?=
 =?utf-8?B?QUZ3Ym4vc2ZmeS9IUTJ0UUdrdHM1OG1IdTI0ZkVxalRvd0NvTFlTbmpRMjBB?=
 =?utf-8?B?MEltLzRzM0Y2Zmt1dGJLVlk3WEhYdVVTZWVhMElremw2aFE3eFpweGlRVENP?=
 =?utf-8?B?Smx4ZDNhRE01VlpQMzB3RDhkUTI2eFpmVGltRkxOSGd5V2F5VUJ4YlVIYnd2?=
 =?utf-8?B?NjJqNUpFcE55L2RSQkRMUUtmc1FTZzQ0L2R0bVVXaytqWFZCSjZwSjNUbFZ2?=
 =?utf-8?B?d2dYUDFCL3hDbUNSaVEyK2d6R0g4TDd3SHJSWkhLRXZGZVZ4T3Q3NUFCS3l0?=
 =?utf-8?B?WnZ1TmdUZjRtOFNTRDRxVFVPNzJuL1dONGFrbGgvYVhTUkozNVJHWTF6aHlr?=
 =?utf-8?B?ZWwvTGtUL0pGQ3NRZVpIa0FJTnpZQWc4a2JKelNqWUtFRk9KNVZEZnRGOWlw?=
 =?utf-8?B?LzlJOVk5RTAyZUNMeXVJMzFqMktkeXdDUnpxRElUUDRDSTRJMnN3eEgwdkxw?=
 =?utf-8?B?QVNhUEVlNW9nbVB6UE04Z21UNzk2R2RiZVdjMFV6QjRkUEduL1h6bGpmbWtI?=
 =?utf-8?B?RkowREhoelg3ZHVZcGIyVWZXSDFmU0FESlNPR25LNU5ZZkFyeDBLa0Z0bVNn?=
 =?utf-8?B?VWNlYXpZTjl2T21LakJZK2dvZEM2dWlIUGRJd1R2N3ZzMXpjVHluckZ4aTlu?=
 =?utf-8?B?cmd0Q2dRdU1JVEQ4WEpwVmNueFhScFZsbEVnVmJzUGVXS0pMK1lOd2pPczU1?=
 =?utf-8?B?WjZ2UWliTkdJK05sZFhzZTMyc0pVNCthZkhnZ01TTHVCcGppRk1lbEk2Zmwx?=
 =?utf-8?B?NHlVOE5XTWwrZXJKWFdUSTJpQUs4WVRVYlhKSHBVUFEzWFZraThpOEVvYldV?=
 =?utf-8?B?eVZaUy8wa3lRZmZ4Slc4ZW9VWUp5STNGQm5pRXZUUU1MQmJYcElROHZGUFFF?=
 =?utf-8?B?QktZcnd6MHpZZkZsZE80NnZBKzBGNHRZaG9WRnRzeHhKYUxkWEdDMkZhYVlZ?=
 =?utf-8?B?Ti9IRmtQb2RsV05UU2xyb2YyRXhxNG1wcmhBeVh2aXpVZnlJaENuajZUWDB1?=
 =?utf-8?B?TEVVSVVGT3ZmMGFkUUdGcXZmMW5QMWpMYThvdmhLVSt5dE9nZXJZYWE2ZHVG?=
 =?utf-8?B?eS9IQmRiL3VHcWNrVnZxZzZCbkplaWJlUGkrazdEdlRxOEk0MFZCVWxEeTJt?=
 =?utf-8?B?NVcvb0VJSmRCYWFjWHpwdXJPUUJJUlEzdGlZZnZVcXVYY1hSZ2ljR05RcC85?=
 =?utf-8?B?SmpDWWJkSkdFZnNJbThNajU2VmZvblFkczBIeEg2QXg3M1A2aWhMUmw2ZE5F?=
 =?utf-8?B?NVVXSE9ObXgwN1BWbWtqTjlEUmhwY1JDQ3MrZVNDTWd3L2RiOUtlR1JxNHJX?=
 =?utf-8?B?NVoyVGljZlloc3p1dDFuZml5WTNrTVppdWhVcFVQYmovL1hIL2x2ck1JNlVN?=
 =?utf-8?B?S3BOM1V3QkFNekR5RnVIT0IvNUVNUEo2Mm1rRjg2K25QRS9yaDFFWDhsMVlz?=
 =?utf-8?B?TmtES0RYQ002cWhkWjR0bEtkUXBCM2trbTdsemlZYno0WUlRL2ZtcDZ5MElZ?=
 =?utf-8?B?WWdGR0JOckJJaDBkOWx2NThaUGNlYWVEdjJwUWlQQ0h4SS9NRXErZzNMVk1T?=
 =?utf-8?B?YXlTcVpXNWNiYVZlT2JlVEl1K3JMaElWTUtZeGZ0KzBIRWFZZzhBNlRpR3p0?=
 =?utf-8?B?ZlgxVHoxQmtUNFZUT1RNWnZoSUxFZHdPdUh5MllIQ0NBMGxnWXRLNGlRdk0r?=
 =?utf-8?B?bDYwWFM5OFd4RUR2TFExTGdUTTdpU2tiUWRwblBPQnFPSFkyUFpPeWVxWWxZ?=
 =?utf-8?Q?9rN74Hk7G1gPFJVGUhTS22idqoIYcqsk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0s5ZEd0VGRFS0hLY0RxZjFZeGEwNE41YndWMld3enpRblNsSVVOR3Y1SEVR?=
 =?utf-8?B?bjNaS2lMRkxEVHVFRnZKSXAvTFFSdEQ5SENSTkYwc2RHNlhzcEhxeGJsaEdX?=
 =?utf-8?B?OFBMbitvSmVnUmdQY3pTZGlHek56SExWSDROVFJPbWdWVkxMYm1ZN1grR0g4?=
 =?utf-8?B?Q2h0QTM1akw3TDZ0SHd6RkZ5RUZmUzJibE56SXZ1cURWa3BpWEV1QUNJSjhi?=
 =?utf-8?B?bHQ0dU9nZHdPdno1S1lPdTlIK29HM0VRL2ViMGo2Wk42cXMrdUoxeCtXV0lk?=
 =?utf-8?B?YURxd3JqWVd2SENXcHV5empydExPemMwQTF6VVR1eEZSbDhUV2J3TkZrQ0V5?=
 =?utf-8?B?QkZHSHVqNnNySitEOVpKQjhhOU1ZOG1kK0gvakpBRFk2SFozQitJbld4aFAz?=
 =?utf-8?B?TWdXYzQ3aXgxZS8rSjVxWitMQ2ovcksyVzk4Q1loei9FbTZWSzgxQVhDeUlI?=
 =?utf-8?B?L1I1blMxVUVVMk82QldBUzZCdk5IV0JSWUIvWk9waXZkWENuWVdmbkJGRjB6?=
 =?utf-8?B?S1pwYy9XTDdicC9NVXFZUU1leXRwbEt3RnlSWERLOTBlYWlhcUN4TjRPMmth?=
 =?utf-8?B?TFZQYllrS1Z5WktqODZDZVFQSHVQME5uekh1aDJ3RTlnMGQrRVNid0pIQVFi?=
 =?utf-8?B?SmpabER3RXpTeDByZmNtYklhTGtWdElZREtGVGVISEp2WjMxUlI1Z2luTmw2?=
 =?utf-8?B?clJPRFRqS0pCRXNHVGRvTEZEQ0ROcFJVWlpNUVZsOXFUNmZ1MmNlTW5QTmNT?=
 =?utf-8?B?bDFqWjl3d25XMVo4T0NTZExjRmRtVmJaZGlTMUVCdGFFa1NvbklzMStkQVhC?=
 =?utf-8?B?UysvSUtZRi9PT2VwaGRVMElXZnV3aTJjMnBWa2hDa2F3MUFjdGJRMFJVYWpJ?=
 =?utf-8?B?R3RCdDAvcHhhTG5Ec3EwSE05L2xHY2ZXRnQyb0tHcG1pWWU3djkyZ0V3aFli?=
 =?utf-8?B?MUh5dnNJWVZ0TXJXQmU2STBuU25jTkdrbVF1aXpjaEpLNUppTWYxakZRN1B0?=
 =?utf-8?B?cXVqZzBpTWF3ZGM2YWFnTk5EbnRGVDhvQ0lmRnVFZWZVd2toNWswMWtDYXEr?=
 =?utf-8?B?ai9yTHQwcVZqRWJGWG1qRmpkcG9oMi8zR3BLY1NoOUwrVlk1NDJiblZrSnRB?=
 =?utf-8?B?NlhVRFZncDhROTdkaHRmMC8wekRKaVJFK2VZZGt2dFZOVkVZd1VpakFOK204?=
 =?utf-8?B?YlRoby84WVZjTTM2NlVmazF1MiswQ1JVaFpSQ2dnbnhSZXdOekNRVjR4RDMv?=
 =?utf-8?B?M0p4L1hQYlJyWStxWXRuTFRsQURycVhOKzdUa3lOVk01ZFhibFdnZXc3ZUhh?=
 =?utf-8?B?VEU0REoxdUIyaklML1pXaXVwaGdkQ3p1MzR0K3FpYmFBUEdSQ3V0aWp0d3M3?=
 =?utf-8?B?eTUrb2pTc3kySHVEekgzVjRrWW82alo5UDdDY1cyWjZ3a1FHNWNZZk84MHVz?=
 =?utf-8?B?cFovYTNjcUFxZC9LMmsxbUJQdFNWSXU0Yzc3WlcvdDE3d1htQjBuZnJpS0R1?=
 =?utf-8?B?Zmgvc1o5enIwVmVEUStQc1ZhZ3IrMFdGTVRtb3p1eGdUN09Zb01iSHJ2NTAz?=
 =?utf-8?B?S0pvUXJORndERjEwTlJ2dGNMdnA5ek1hTVRJcEUvYVJjVTk2OTFKRGJrQk52?=
 =?utf-8?B?K01SellZOTRFdHZrQzZWSkdPTFR1OVA5Z3lQNDV6RitVYmtCanIyTEJiTDhP?=
 =?utf-8?B?bkV0N3hpVGRIbUhiVHBlY0tIdVBEcmRKL3J4bi9vN0hQeXdpUXliYVFiZ0dr?=
 =?utf-8?B?cjVwLy9RaDlMODBUcFAwVTlHc2NPbE5Bai8xeWtKaUpvVHB6QnI1RWVaWkJU?=
 =?utf-8?B?eTByVnVHV2swaWlPR3NxcWNWSDVzcmN2WlBOZGMzVExITXl2Z3lYT1VieUZs?=
 =?utf-8?B?RGVkeXVTekNUbVVtaC9wTXp6RHJVUlh6cEVPSGtmNzFHVFV5Q21WT3ltMkl0?=
 =?utf-8?B?WkVCcXdHOGEydkJhdXpDKzhTcXVzelRlUjVBUTRBalMzRHg5NHllVklqcVRr?=
 =?utf-8?B?VlVvMk1CR3dsUWJ3Q2dDenpRbkkvdlpVcm9yQ0IvTkNGRzRpbnVKcDgrVlJN?=
 =?utf-8?B?OGhTWkY2KzcybVVhcGpkM2M5cXR2alZScUtTWDF1THpRM0I0d2YrRjB2ZXhJ?=
 =?utf-8?B?MHNRUW9hWHZ3aWRSNmlVTGVVQzBWYW4ycmZsSElPbndrOXo2cnJsdTYvNThj?=
 =?utf-8?B?b3ZqQ1ZVODBjZFMydEV2bmxpR0p1Nk90RkU1Kyt4TFlnV0llSWZ6ekVFcVlB?=
 =?utf-8?B?NTBwNGEvd0g3K3hSTmtnVUZ1b25BPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23487e41-5c7b-4f48-64e3-08de1c744042
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 14:04:35.5942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RidlAgGLZLIiCzBtM1Csd8YSmWTSOKzDOe7EPBiWAAQ7xkHkzow4zeP+wkJdkSc2aUrEQnE5ei9ivXteMe1FqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6742


On 09/10/2025 15:22, Niklas Cassel wrote:
> When the PCIe controller is running in endpoint mode, the controller
> initialization is triggered by a PERST# (PCIe reset) GPIO deassertion.
> 
> The driver has configured an IRQ to trigger when the PERST# GPIO changes
> state. Without the pinctrl definition, we do not get an IRQ when PERST#
> is deasserted, so the PCIe controller never gets initialized.
> 
> Add the missing definitions, so that the controller actually gets
> initialized.
> 
> Fixes: ec142c44b026 ("arm64: tegra: Add P2U and PCIe controller nodes to Tegra234 DT")
> Fixes: 0580286d0d22 ("arm64: tegra: Add Tegra234 PCIe C4 EP definition")
> Signed-off-by: Niklas Cassel <cassel@kernel.org>
> ---
> Changes since v2:
> -Add pinctrl definitions to all pcie-ep nodes, not just C4 controller.
> 
>   arch/arm64/boot/dts/nvidia/tegra234.dtsi | 57 ++++++++++++++++++++++++
>   1 file changed, 57 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> index df034dbb82853..cc929e1a00744 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> @@ -9,6 +9,7 @@
>   #include <dt-bindings/power/tegra234-powergate.h>
>   #include <dt-bindings/reset/tegra234-reset.h>
>   #include <dt-bindings/thermal/tegra234-bpmp-thermal.h>
> +#include <dt-bindings/pinctrl/pinctrl-tegra.h>
>   
>   / {
>   	compatible = "nvidia,tegra234";
> @@ -127,6 +128,52 @@ gpio: gpio@2200000 {
>   		pinmux: pinmux@2430000 {
>   			compatible = "nvidia,tegra234-pinmux";
>   			reg = <0x0 0x2430000 0x0 0x19100>;
> +
> +			pex_rst_c4_in_state: pinmux-pex-rst-c4-in {
> +				pex_rst {
> +					nvidia,pins = "pex_l4_rst_n_pl1";
> +					nvidia,function = "rsvd1";
> +					nvidia,pull = <TEGRA_PIN_PULL_NONE>;
> +					nvidia,tristate = <TEGRA_PIN_ENABLE>;
> +					nvidia,enable-input = <TEGRA_PIN_ENABLE>;
> +				};
> +			};
> +			pex_rst_c5_in_state: pinmux-pex-rst-c5-in {
> +				pex_rst {
> +					nvidia,pins = "pex_l5_rst_n_paf1";
> +					nvidia,function = "rsvd1";
> +					nvidia,pull = <TEGRA_PIN_PULL_NONE>;
> +					nvidia,tristate = <TEGRA_PIN_ENABLE>;
> +					nvidia,enable-input = <TEGRA_PIN_ENABLE>;
> +				};
> +			};
> +			pex_rst_c6_in_state: pinmux-pex-rst-c6-in {
> +				pex_rst {
> +					nvidia,pins = "pex_l6_rst_n_paf3";
> +					nvidia,function = "rsvd1";
> +					nvidia,pull = <TEGRA_PIN_PULL_NONE>;
> +					nvidia,tristate = <TEGRA_PIN_ENABLE>;
> +					nvidia,enable-input = <TEGRA_PIN_ENABLE>;
> +				};
> +			};
> +			pex_rst_c7_in_state: pinmux-pex-rst-c7-in {
> +				pex_rst {
> +					nvidia,pins = "pex_l7_rst_n_pag1";
> +					nvidia,function = "rsvd1";
> +					nvidia,pull = <TEGRA_PIN_PULL_NONE>;
> +					nvidia,tristate = <TEGRA_PIN_ENABLE>;
> +					nvidia,enable-input = <TEGRA_PIN_ENABLE>;
> +				};
> +			};
> +			pex_rst_c10_in_state: pinmux-pex-rst-c10-in {
> +				pex_rst {
> +					nvidia,pins = "pex_l10_rst_n_pag7";
> +					nvidia,function = "rsvd1";
> +					nvidia,pull = <TEGRA_PIN_PULL_NONE>;
> +					nvidia,tristate = <TEGRA_PIN_ENABLE>;
> +					nvidia,enable-input = <TEGRA_PIN_ENABLE>;
> +				};
> +			};
>   		};
>   
>   		gpcdma: dma-controller@2600000 {
> @@ -4630,6 +4677,8 @@ pcie-ep@140e0000 {
>   				 <&bpmp TEGRA234_RESET_PEX2_CORE_10>;
>   			reset-names = "apb", "core";
>   
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&pex_rst_c10_in_state>;
>   			interrupts = <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>;	/* controller interrupt */
>   			interrupt-names = "intr";
>   
> @@ -4881,6 +4930,8 @@ pcie-ep@14160000 {
>   			       <&bpmp TEGRA234_RESET_PEX0_CORE_4>;
>   			reset-names = "apb", "core";
>   
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&pex_rst_c4_in_state>;
>   			interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;  /* controller interrupt */
>   			interrupt-names = "intr";
>   			nvidia,bpmp = <&bpmp 4>;
> @@ -5023,6 +5074,8 @@ pcie-ep@141a0000 {
>   				 <&bpmp TEGRA234_RESET_PEX1_CORE_5>;
>   			reset-names = "apb", "core";
>   
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&pex_rst_c5_in_state>;
>   			interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;	/* controller interrupt */
>   			interrupt-names = "intr";
>   
> @@ -5115,6 +5168,8 @@ pcie-ep@141c0000 {
>   				 <&bpmp TEGRA234_RESET_PEX1_CORE_6>;
>   			reset-names = "apb", "core";
>   
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&pex_rst_c6_in_state>;
>   			interrupts = <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>;	/* controller interrupt */
>   			interrupt-names = "intr";
>   
> @@ -5207,6 +5262,8 @@ pcie-ep@141e0000 {
>   				 <&bpmp TEGRA234_RESET_PEX2_CORE_7>;
>   			reset-names = "apb", "core";
>   
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&pex_rst_c7_in_state>;
>   			interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;	/* controller interrupt */
>   			interrupt-names = "intr";
>   

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

-- 
nvpublic

