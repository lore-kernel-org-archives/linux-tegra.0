Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012012.outbound.protection.outlook.com [40.107.209.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787D0220F2C;
	Wed, 17 Dec 2025 22:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766010393; cv=fail; b=jDrIjSAljXItXM563CUlCLk0+CqUZokVmOilVf3NGi1gxmN+DcNGUezp/Wu0cN7dL6jmwvZqHKsg5qpjZcBh4aXR5flf5sYmRg12wLH20bp31ptFPe3juag6l5nCNc/fLmbzd/sodXJrq+pZu+7hPTFJbNtczkMDtg0BtETrF0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766010393; c=relaxed/simple;
	bh=G7WFdlvgP9QsUId13UmUwCwH7YRcZTU9x8Q9YYOwh5Q=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sFNVx6l4/KzN9OzqKKexGJ9yfNOQpUAMeQTTD+RVHFvUTxdfmBc8mn4X0ere4oWg4pOCvlLSWbaRj7phosCLw8oU0wzfhNTRwtkMgKiqmcDwB5OgtC6WvWahgs35o23fZy+US7EHZ2QtCJXv37nb2wzFO//Bnvw8Y9uSxEr6Sus=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=toReZr6q; arc=fail smtp.client-ip=40.107.209.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="toReZr6q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a87KSodv7cuouvWT6FytYe/AmZ+ZTyI95wFus3wLADXr9GNzNWQlVnelus8hdSeHNoSGAqPZFNds5nNhAODWyrM4MrNXt8SYWb7l1FYt/s+ETLMHQ54L1mGpFlvObch0Uq9FXiodKBQVlNqaMlAbRmpdgdTleKHZksjdyR/g9ioqnfPmWuTkLpkNxxZk5h2bF6dZHc5B2Wy3wR43DN4fFhd+w83oVuOm+9xlEC9gXmXmXuiV/KbeNPRTonv/l7dTOCOU10LjkGBpHbEKCTf8uQNfULbSIhbZToyaeT69Gto2EUWmJokQFXpZ6WSESL2nGg6+b7ZO8bBAs3HyKwmdvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1q4pPa38vV7m9g5cOqBlx5afd5natcEc/GI5y8v+t28=;
 b=qZ1M2UR5iJ4c/XNiq1U1gL9r4SJ8uklAgcnJ8vb5fAnGLVCOig1P75319OlwDTHZalwCeiU5UKBx9xdns+2xMahuvr/+dkzaV5skEDz0JbTSfuts3g25A1g+TcWHxWaHnE/T7pnqExfjivyrl4VNOEqyoUimxKuCD+tjBaSDBAj19LV6asFpolLqQz0BkQGdN2vhAZ9KUAnufAuqKrfrEHsSMPH3GV6fcncEHiRoQXARs5BCkF10ZAVTfs1gO5A9URRJS5gOq54NYTe0+YagPbXaQjZkPMR02EC7wsN5ZH8aCh4yoal56rafLJlZ3Qlsyoj46MOqdn4z6lPLgY7lZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1q4pPa38vV7m9g5cOqBlx5afd5natcEc/GI5y8v+t28=;
 b=toReZr6qpPk9zwOYEmIZ0RItNv1MUJbF+v/+QkGPRaDBocU3HueI7teQi5PkuYguSOtlm2ilMugN2uSbAepeY8tmE/vmGoxtAHDmPEqU8qNFZp02+WqeJkPMM6/pk+AAdHqbXGNf85JwtpqA56t6CFkZ7l1VrdeRch1O8P2AZD4/CdZHwXh09XFjhO90zUOk4y6DetwuV+yx3CDDBEZVBTzNHhbrYvxjzpqyNtzSoJSCIAS+3rxJfn6753u4E97Pe9PLRqrMJ89lgdBHMays2jbIgWY9k6SnvAVYRA+2SwgL2nIrv0PWb9GNHNUO/feVHCXzPOkvedZOIbYPqTGRXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by DS4PR12MB9659.namprd12.prod.outlook.com (2603:10b6:8:27f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Wed, 17 Dec
 2025 21:53:07 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%7]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 21:53:07 +0000
Message-ID: <0c5eddc0-8b37-4199-a8b8-f235ac3aa476@nvidia.com>
Date: Wed, 17 Dec 2025 21:53:02 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] memory: tegra186-emc: Support non-bpmp icc scaling
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20251027-tegra186-icc-p2-v4-0-e4e4f57e2103@gmail.com>
 <d16803e5-7b6d-4472-b50c-aa324cf52736@nvidia.com>
 <CALHNRZ83Q2Ha8VYoWAnqoCZQ=Fd9rtVRVLwRFxAY68ePQ29GHw@mail.gmail.com>
 <29cf2c16-3a0e-42c5-a083-16f77ae5d09a@nvidia.com>
 <CALHNRZ9KAv-hL6+6Uiaz2O2odm1rqMnjNxNVPsbCOdqX15KTuw@mail.gmail.com>
 <856447ae-4338-471d-a71f-a34aed749ac7@nvidia.com>
 <CALHNRZ9y0n6JNfeDUQgZoECkxo+We0_G8TP0H4advcSqrX86kg@mail.gmail.com>
 <f906f85f-b110-4328-b177-02fcdf7ffe53@nvidia.com>
 <CALHNRZ8go4ATHgJ4SE=7pkAMgRP_0tj5z4pDXjxicV9o7F13Ng@mail.gmail.com>
 <1b9f0b14-876c-4c6e-90eb-b04d016f88e8@nvidia.com>
 <CALHNRZ_GGAg_VP8gSdtw_1CA2A0netrOeA2+guZfxyG7POhHoA@mail.gmail.com>
 <adc7ca5c-69d8-4164-bd89-3381b101576a@nvidia.com>
 <CALHNRZ-SU_kyak_u6mfUZBHJ9Cph6=-edhL+yhRizu8DDy=Big@mail.gmail.com>
 <CALHNRZ9mfO_DQR-RuH_QH=18R8zTt9VqbPaVCdnDKUWzx1pm3Q@mail.gmail.com>
 <45057c95-1dba-4302-94fa-f63941ee2b20@nvidia.com>
 <CALHNRZ8gJbyuD+0yFQwCJ+g7OcffjkXopRSJKoDnr5WMmUVGwQ@mail.gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <CALHNRZ8gJbyuD+0yFQwCJ+g7OcffjkXopRSJKoDnr5WMmUVGwQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0470.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::26) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|DS4PR12MB9659:EE_
X-MS-Office365-Filtering-Correlation-Id: b360f82a-1009-484c-ca70-08de3db6a9d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?dUJpcGR4TFA4Sm9aS2tqaC9kcjVWSlBtVkFtdkZDVkVDaWI2Z1hUMTRMNjI1?=
 =?utf-8?B?bjNrakJVT09DYjNOeU5qMldaT2k0TUpvajlmRlV2Sk9ncFE5T1Jqb2JvR1pC?=
 =?utf-8?B?Z0pob29GY1dlNW8xV29FQ3I0WTFFaTBhRTRLczUrQ2kvRXZYZ0VNVC8vZndL?=
 =?utf-8?B?dW5NNTFCS3EzUEhqYTRvWlFUbWNnZGZpeldzbkJ0Y2wwTXhwaGMrTVB4cGNG?=
 =?utf-8?B?bU5xbFJRaDVmWjYrT1NBazIzdXNlYjFEQ0RNWU9yTDdpNDBMYUE4OS92Y1BI?=
 =?utf-8?B?eW81VlEyUy9yZ3UwczRDcXArbnZuUE9IWmlFanI3RkpobFYyUzAwZEkweEJ3?=
 =?utf-8?B?eFV0am5kNnZ0ZklUWWZOb0V2SWp6YzFDdzg5MFl4ZFZNelMxR2NkV3NFY3Bt?=
 =?utf-8?B?RGFnalptSEQ3MDlLTDl0amhTRmUwcU5PT29TOHVmQ004UmZCRlk1UEpNRUxI?=
 =?utf-8?B?OG9PZ1FXUlFsZzhHanBhd3NYbFZKNENqQm9iSVFxQ0ZoLzdkU1lyQXJWSjVE?=
 =?utf-8?B?UXN0NWVUV0h6czRvYlBiNTNrUWhyZjBXVitNb2orblNzZXV2YmZjTWdZSG1Q?=
 =?utf-8?B?cG9iZW9hMmFSZm95WElJWVo3N2NpbVJHUWRVWGFOOExTYUtacTRGVG0ybVo0?=
 =?utf-8?B?WWlsWlBubm50K1JzNTVJY1cxejR5bDNVditpYngrQTNRNnRiLzQwNElJL0F4?=
 =?utf-8?B?Z1N3cy9ML202WC9ZM3B5YTNWL2g3bUszbjZPUGI3djg2dEtvTHRTTmFvTzNB?=
 =?utf-8?B?TU9BTkllc01EV2JqQjgrY3c3S3lZeXZmeHdxTWhMS2JoWXdzbGFVZmhScW5T?=
 =?utf-8?B?RkRuc296aVQ4MjFIRTlDTVJaN3E0UGo0UjloMlV6MGQrTFdDVXVPWUdQbWJ2?=
 =?utf-8?B?RDVCVXFpSU42VUFsa3kzTkFlRndNanRFMkdINnhRQUZ1bmNqTmx6Tjl6VkJQ?=
 =?utf-8?B?ODVxU2JreFprWGY0WTBEWWJFZ3grVnhBNi9aRWsyQVdlQ2QyMXNwMG9xOWxJ?=
 =?utf-8?B?UjBxTEIvd1dwaGtqYzZuUjloWkRWMklKSTZ2L3F5c2FKdStNWUxQWTJlUmE1?=
 =?utf-8?B?ZUFuS0dGOW82MTBrUEMwMUd6Mm8rVXpaQWNYQ1oxK09DVkV6M2ZwODlhMkY3?=
 =?utf-8?B?Yzh0M1ZZdXVLdDlBMlhwUE1walBxY2ozNWpMYVpCV1F6VDZmaWdMd0prVWlt?=
 =?utf-8?B?QUhkMU5GNCsrM0dxQ0pJcEJCWEtRSVZJSjdORGhSZTd4Mk5vWkgvRU5RcGhL?=
 =?utf-8?B?WWdibkcvaUlrQk9qWUQyMkpuUUxlcGtaWnMzMHBpME5NYkFJRGQ0S2hPK09s?=
 =?utf-8?B?akxkL2wxUTlNb3Zxck1yRC91U0RhNGU4cjlhekdKWVQ5SEI4SHByazE4QTNQ?=
 =?utf-8?B?b3VBanpKaFlmTTdYZUpYOVZvUlJza2xtbVA3cllRM2x4SGtCSnhDQlBuNUlz?=
 =?utf-8?B?WCs3T3RrVTErMnZ3YzBJSExQVENsbXl6NGNUYSs4N0VZWEhnWDVSR3RGOG5W?=
 =?utf-8?B?UWpHb25SUHp5anMxczRzZmo5b3N6RDM4d2U5Rk5STllRSzFmUjNkRkkzMW1a?=
 =?utf-8?B?aGRqbmVwZ3FaanRONVJKdTJ4ZFhWakVzZStUTHU4VXV5dFdRRUVqMjl2VjVl?=
 =?utf-8?B?UFZjRCtPR1gyaWtJU1J1LzcweVJSQUNHdGJDTTJTU2xZeW1sUWtiWEFGeHpr?=
 =?utf-8?B?ejFDamtxQW40T2VqRkFXUHBKZUtrcldoQzNqMU1LNTViWUlsdlRTRytDeXg1?=
 =?utf-8?B?ZEJXZ04xWnRRc0JOVy93NXNkQis4RXdad3pLbEJKMHFueWxhNmg1WTVMNHpP?=
 =?utf-8?B?NjhjNXZlZmJXTmwyczkwU08wYWZqNU1tQjFmU1pHTmw5enMvSzFKSnUzSWpJ?=
 =?utf-8?B?Nyt3dlhncUlyOTlnVUkxaFVsNGNZbXF6cXRLdlJIR3d0L0RlQkhWQmIwTVpH?=
 =?utf-8?Q?O0DereGdcOeHGsJ4Hur+8wfyCfNFoIrd?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?ckdpeENKYW4zZnp3WHZzZDV1bms3a2VvT1dYRUdWcmtYOFBBSGEvNTJMNXRI?=
 =?utf-8?B?VW9JYmQvVDdRSnBHTVpGcnFDNWVudEhDc21QZzlHNzRVeG8wQWJmdDloWG5Y?=
 =?utf-8?B?RVR6WWM3V0F2anlzc29BWE5NUHYyYmwzSkZPTzFiY1lacS9aZ3hQdXpMcWJD?=
 =?utf-8?B?cDRIRXBuUHVZNVhQU0ZxNk5USy9rTnl4Rjdpb0xVNnB1TEJiOTNBejlJUkI4?=
 =?utf-8?B?Yy9FMzRqNHlaVEhpcUQzTENIYVh4dkNEeGV6c3FMK0JPQXovWVZKQi9OclR6?=
 =?utf-8?B?ZkdrY2FpSW4xbi9Va0dKUElRTVVDaEVtclRWWE1mUVl6QTNvRnJBZTUxZTk2?=
 =?utf-8?B?SVBGSzRBbFdEQ3hBeVlZQ3lYNmh6RHM5TW1WNFpkTm9iQk1reVJuTFJUUStC?=
 =?utf-8?B?cWlCdTVYMFNwZDdBNmlVNjNJUEpjMnAzNkhzMEhkY0k0SEViUW9BeHV0M1BT?=
 =?utf-8?B?aE9LSkk1Q2VrcGl1Z080L2E3UThMM3RzdzRaNEJZWDF5d3o2TFFyR2t2TEth?=
 =?utf-8?B?OUlEU1FtWUJSVHIzN1dFOHhoWjRweWpodTRwWG9tcXIvc0ZyMVhOSUxMa2Vm?=
 =?utf-8?B?UnpVMldwOFA0VjBTM1RWeVdDN0V4bjg3V05YaStZQ3dTTXlEK28xQjVnSDhN?=
 =?utf-8?B?anR3dmJRRlFLSWlMSGJrWXhhMzFCYVgxRWNZRnNPOEU0VGo3d3F6U2p1RWJm?=
 =?utf-8?B?cFBoZjJkdWdqQTE3NU1OckdSZ0lHaHd6RWw4WUYrWmJoVVFiREZPV3RrOXVI?=
 =?utf-8?B?ZFlPL1ZjUkRJNlUrNjQ4MFViNzJiUnlKNkZaOWVXNUQxem5SS3RkcFMxQThn?=
 =?utf-8?B?ZjV6a2VIdHU1MFpjR2ZvTnI5OGwzbVZFbUJaUU9xUjY5OThWTVBFYWtyTjMv?=
 =?utf-8?B?Ynp2UmZUNkxqT0l1UWYrWGRPTEVjSXlvamlqSjVPTElnUms2TFNvN1FyS1Mx?=
 =?utf-8?B?QUlFdEZvNW9GYzJaelpoaFRWc2V0bnF6WGhpMmhIbkZ0aXZ5S0FkaG4rT012?=
 =?utf-8?B?WDh0YkJQelZZa2RtenZwNHlPaFlnNjB1dUVucjFzanFrUkVLWnJ5RVZGSE8z?=
 =?utf-8?B?SUhKMlVzdFllSTV4Tys3Vm1RRzlDQmxnajRrVS9NR2hXakFSOVljM0lXYVNz?=
 =?utf-8?B?d2poQlJRajZPNklqTEpvd096VWVIU2M0ZGh6anhROUJKQkI0dUo3S3VvbVRq?=
 =?utf-8?B?aXdtMTd2U2lGWkNIY1JUNUgzd3ZWMkovWkFldFhkZzFyMW55dUpQSGdUc080?=
 =?utf-8?B?a3E2VUJ4VFdZRFNubTdSU1pIUjVxYVhweitsT3hvWmNReUFxUnRhbWNUcXcw?=
 =?utf-8?B?TXd3ZFZ2c1FYdUtKQkVBcCtlbStxRzEwK1B1TkhvMVZUM1BVVGJ0UjdaMzE4?=
 =?utf-8?B?d2RqeVZQcmlKdzRxWHAvUXBVK3ZjbGRrS0VZMWxZR3djYkZSNkJrODh3eStj?=
 =?utf-8?B?cmhvcWhYWkMyYmMrQUhrQ1g3cHZjSVFvNmloazMwYndYbUsvZTlyNHAzSjc4?=
 =?utf-8?B?dmhmVEtSMEc1NjVHZE9veXhGVGVrUzA3TTJaYVpkRXhhMXphUzhrc0Zndm0z?=
 =?utf-8?B?RXF1TlAzcDB1cS9ncExHUWtCdVhYL3NZZXNlb2E1VVBjMVFoQVh1cHdmSDFL?=
 =?utf-8?B?bHdadVhjem03dDduZm9tN1VSNUttZFA3cXVqKy96eEZSQzlEOHZ0d1JxOGhQ?=
 =?utf-8?B?YVRJTmd1WXZsQi9SWS9XWXdXWXZ2V0tiek84Z0xmY0l4M0xXSGhQd2doVXVE?=
 =?utf-8?B?eWFkNzdyU3BZcTg4Q1c4Y2QvMjFRZVdlMnFvSGpzSk5zd0NuZ1VHcjNGM3Qr?=
 =?utf-8?B?N0VibVNHdTJhRERJQ1VVcmhjcWJNVGxOTEpkekZoSVdyMXdtNSt1blpJc0hE?=
 =?utf-8?B?aE4zSTA5VE1GYm1oRXNaYTVnSUxJZXIzWlRzbTJTSWg4cHFZRG1sYkJ4Ty9C?=
 =?utf-8?B?OE5zWVZWTWNWOHRCMmxLY1ZZblNUYVBMb1JyUTlycUVhU3orcXdkS1FnOVpz?=
 =?utf-8?B?S2RqQUFZMUFiTnVzWEloL0xwa3Z3QlM2NmRWMTlJcHlJR3hsZi9Rc213S1Zm?=
 =?utf-8?B?QUVlby9pN1ZzQ3duQ0o1WHI4ZG9WVDM4WFRVc0FaY1oyQ2NLNGdWKytQTTgx?=
 =?utf-8?B?RTdEbjVSb2JFclZpTG9mRkVESnU1Zit5dzMwaFFobEZJWmJUQkhWZk5vaWhO?=
 =?utf-8?Q?8uMq0BXVhdUYpycSNnZorayZUo7bzLRLjPRCCf7Hy4+P?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b360f82a-1009-484c-ca70-08de3db6a9d3
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 21:53:07.7037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0vZmSCh+TNzVCiASEnx9Zn0/eeRVg7jk6246mWLsf7DBfisgxXs7+Zt0iX+P9WqCxEGg03CEFpGGmUd6rBFF2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9659


On 17/12/2025 20:29, Aaron Kling wrote:
> On Wed, Dec 17, 2025 at 12:59 PM Jon Hunter <jonathanh@nvidia.com> wrote:
>>
>>
>> On 17/12/2025 18:39, Aaron Kling wrote:
>>
>> ...
>>
>>> To try to move a resolution along, let me try to enumerate the issues
>>> again. Again, please clarify should I have something incorrect or
>>> incomplete.
>>>
>>> 1) The primary issue is when an old dtb is used with this commit and
>>> the pcie driver is loaded. I can reproduce this issue on t186 and
>>> t194. If this becomes the sole remaining blocking issue, I would like
>>> for an exception to the normal rule be considered and this merged
>>> anyways. Since it does not cause a boot failure and distros package a
>>> new dt normally anyways. And to my knowledge, working around this
>>> would involve redoing part off the icc subsystem itself, a major task
>>> in comparison.
>>>
>>> 2) T194 is reported to have low clocks even with a new dt on the
>>> Nvidia regression bench. I cannot reproduce this, even with the pcie
>>> driver loaded. Can this be re-verified, please? And if it still
>>> happens, can logs from the failure be made available and/or more
>>> information provided as to the state of the unit? Like changes to the
>>> default defconfig, modules that get loaded, etc.
>>
>> Can you list all the patches that need to be applied on top of the
>> current -next and I will run it through our testing to make sure I have
>> this correct.
> 
> This series, message id:
> 20251027-tegra186-icc-p2-v4-0-e4e4f57e2103@gmail.com. And the dt
> series, message id:
> 20251021-tegra186-icc-p3-v3-0-68184ee8a89c@gmail.com. So, my build
> sequence is:
> 
> git checkout next-20251217
> b4 shazam 20251027-tegra186-icc-p2-v4-0-e4e4f57e2103@gmail.com
> b4 shazam 20251021-tegra186-icc-p3-v3-0-68184ee8a89c@gmail.com

Thanks I added all these on top of next-20251216 (as that is the latest 
I have tested) and Tegra194 fails to boot. We always include all the 
modules in the rootfs that is being tested. You can see the boot log 
here [0]. We are using an NFS rootfs for testing and I see a message 
related to the NFS server not responding. I am guessing something is 
running too slow again because the only thing I changed was adding your 
patches. The test harness reports it is timing out ...

FAILED: Linux Boot Test 1
	Test Owner(s): N/A
	Execution Time 219.31 sec
	Test TIMEOUT reached. Test did not report results in 120 secs
	Percent passed so far: 0.0

>>> 3) Setting the max clock via debugfs fails when icc has pushed the
>>> current clock higher than the requested rate. This is a logic issue
>>> with all tegra emc drivers that implement dfs via icc. The suggested
>>> resolutions are to leave this as is to keep consistency with the
>>> existing drivers, perhaps updating all later, or to update the
>>> existing implementations in a separate series, then send a new
>>> revision here to match. I am personally unable to verify anything
>>> older than tegra124, however.
>>
>> Thierry and I chatted about this last week and we feel that debugfs
>> should be able to override the current configuration. So this will need
>> to be addressed as well.
> 
> Alright. I will start looking at getting that logic straight, then
> upload a new series for the older archs and a new revision of this.

And just to confirm the test that sets the EMC frequency via the debugfs 
also still fails.

Jon

[0] https://pastebin.com/5ghbSsu7

-- 
nvpublic

