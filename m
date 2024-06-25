Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2051.outbound.protection.outlook.com [40.107.244.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB7317C211;
	Tue, 25 Jun 2024 21:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719349533; cv=fail; b=up8Hwis4Chsr24vhx7wnveWrZXQANecYbjHeWb0KszbfBZYeJKK1D7zUcRGl0xoYRRIsYpbJE8nxsDU51EVoA1O3osimVjl2Pt/rtdJUWNwFWuejFQ91UQkoSROH7+k1niqy5tKh/HC0NghN1azNO6Ple7hqlSS2taDtODXQS+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719349533; c=relaxed/simple;
	bh=CuDT67G4RPAzdkkUc8nwRIJvl5+dDPcfd8+JXtlM3zA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JcQvAsxL/xU3pHzg1CQMasRnwoPK+rqL6hnW4cuREhvixx0jCJu2pw/t3l/FwsC3TiwTC2pVwsatoX3C8NnRCUsqZfEqpdyW9hUqR82Bom/Jv3ehrEcjOYY8utLxr6lXDY1BIG1haQ3VqbM3SD8cviSSZszwjMOAL0ohkFawM8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MhqbuiRW; arc=fail smtp.client-ip=40.107.244.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MhqbuiRW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gOA7uKFUZk+PARCS9YNAT6xQv2KpTPKGHpmwcVK80uo3DAXyrneqS23QtHBHPpwiB3Vy0lr7ef919V8t7BAnI3bAMvQX/FljJkMC1ummLoFJ1269geGfnY/vLi1IYCeIq4PXcjqasmPDk+xGoEfdtMrv5GnvAY19t246TaCFV2r+AVEBx/QCmiQIcNldsdGHmwdwb2BWHlt+u2Zj5EQCeKB7clF0G1BvBB1X4/qCr5DWNNrAcbOuz0BCb58Ouc5KwAW8sGX31221pPj9vtDRjObGZTYTtLNYzaaQeOCxqvmEACXzXnvQouGRjengqABzlpY1tz6WpF7aN0/NXqe/cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QNKmGRIMx0pj/oqapE4fKJI5Tkq9+l1vyTuNoNTOD1g=;
 b=W6PZtyymB0wNtyC+DW+YkkBa9j75fj5fSlfDE9j8IsVpEnMzHwwDe55TGtWUHkZ/2oOv083xwpJBagWiqMYH84WDvFVtKET6XDFo6cqVobMgfFj0k+nJE4ra14li1VAh4UkU9GkbZGNG9tFnMibu6xPq9Be2QQl1STLlNr4NveZSnKFicI9R75SZgVEwm9Jz3V9uWz1ILPWM7ja6cZAr88OenBoKU2qRqh3+Fw8lal6xOnVTydjjVpcORz+RXyl8Mk4Slehe1Y/BAc76Qa9nS8T/4P6F6mwJ4dcBW5rw51wS092stiySoQomPHMzxwscgUmffbt303DVZeggn2UBgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QNKmGRIMx0pj/oqapE4fKJI5Tkq9+l1vyTuNoNTOD1g=;
 b=MhqbuiRW8qXiW94MXP8BCeT+Q/Fc4IkTqKksKwFtnv20bqXgxUDh6oaaJBYRVPAktWyAg3pcLlqmpsiTcSApMLnF4gfoi+mIG8QKStzpE8tJmnoNM845Q3cBSN3/nLObpPf2yskjS9VSniBjOg2NXST7AT1VtxuygJDvTJ/WqkLwHI0EI4ESjb7W8N1ujrr9+SaCeJZfSAVx63USIfsxes2LkXa1IczKcHvl3nnTL6wXe83d9aRZ8PlhUKFP7rlbnHxwqWHEWeYOi8sD8wHT29bg6SnoXuIYb1Bd+i5IO8fw+vvLv7HSzkDbSQadbOG6yHuEz1Vilff0XYOx0yBiEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA1PR12MB6604.namprd12.prod.outlook.com (2603:10b6:208:3a0::7)
 by IA1PR12MB6116.namprd12.prod.outlook.com (2603:10b6:208:3e8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Tue, 25 Jun
 2024 21:05:28 +0000
Received: from IA1PR12MB6604.namprd12.prod.outlook.com
 ([fe80::d4cd:4112:1ce8:7f3d]) by IA1PR12MB6604.namprd12.prod.outlook.com
 ([fe80::d4cd:4112:1ce8:7f3d%4]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 21:05:27 +0000
Message-ID: <36113c8f-12de-4530-9727-67c75b0daf47@nvidia.com>
Date: Tue, 25 Jun 2024 14:05:24 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hte: tegra-194: add missing MODULE_DESCRIPTION() macro
To: Jeff Johnson <quic_jjohnson@quicinc.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: timestamp@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20240603-md-hte-tegra194-test-v1-1-83c959a0afdd@quicinc.com>
 <92059885-858c-4a07-9e2d-cda10c6c38bf@nvidia.com>
 <d3f5890b-db18-4e56-9768-db0382717baa@quicinc.com>
Content-Language: en-US
X-Nvconfidentiality: public
From: Dipen Patel <dipenp@nvidia.com>
In-Reply-To: <d3f5890b-db18-4e56-9768-db0382717baa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR11CA0049.namprd11.prod.outlook.com
 (2603:10b6:a03:80::26) To IA1PR12MB6604.namprd12.prod.outlook.com
 (2603:10b6:208:3a0::7)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6604:EE_|IA1PR12MB6116:EE_
X-MS-Office365-Filtering-Correlation-Id: 362d81e2-523e-4600-d74a-08dc955a8a17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230038|1800799022|366014|376012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TVN0eHB2TnRzV3BJZFEvcW1UZVYrZ0F2eVFIQyt4UGduTlg0bXhzRllWMEh4?=
 =?utf-8?B?QWtuOHU5QWhlcTNkcXdEcWlQbVQ1M1hiV2xlUmo2WWg3SzJFTWxINlEweU10?=
 =?utf-8?B?am5xZEZoZWF4aDN4UllPZTVUdXpGTWpCZUx0NE9HYUR0ZVFwMXcrT3MvNllJ?=
 =?utf-8?B?NkNoeEN0MFRvSEtqUEg4czhQcGIxcGFPN2wyUTcrNnpaYmJzTzlKNTZSeVVs?=
 =?utf-8?B?Tm1yRFd0SFBFa0MwcXd2SWV6Q25DZERFckoyMi9JWmJjRFJaTU9nZWxHNDJq?=
 =?utf-8?B?UDRNYXpFYXZnMitreTZqdXNnQ3dCVStJYXF3cndUQ1d2Y2pvaG1IUW1URmwv?=
 =?utf-8?B?YkwybllRK1JsY0hBaG1MOUhidW1jMExaRnYzNXZyQU5tMzlyQzBmTnFRR3Rm?=
 =?utf-8?B?VjVvRURzKzQySmNTUVkzUHMzcE1mOUhEc0U1dDVxSjR6NEJmQm9rVUZVYUwr?=
 =?utf-8?B?NURWdzNLRnIvamJLN1VSOGpqYUxMQlFwa0taUlhaWHp6OWlOTWQ5VjBuelVi?=
 =?utf-8?B?L2dKYmlwTzZFMzJjeGp2WnhELzZPTE5ncW1DR0xSdGFzczFuY09VMlFwY3hX?=
 =?utf-8?B?RWc4c2VGL3YxVzVqSmgvajRGTlhMMUJqZXptTnJqNEJ6ckYxMXlrZHFYOWtv?=
 =?utf-8?B?TEY1eHBsUXBmSEVpK29FZEoycWhmaVhOVDNBMHRVS1o1MUp3eUs4UWVRaTlM?=
 =?utf-8?B?Y3k3ejhhT0ZXbDN0VUJjVXNlVTF6bGFEQzJWMjJFMlQ3ckovd3hCUHUzM2No?=
 =?utf-8?B?OUFoeTkzK2NVc1RCQTU2c3Q0SDlsVVk1REFNbDF1YUxBYy8zQU1sK2dCcW1N?=
 =?utf-8?B?ZHlTdlh6dmhXTk1BVkZRMWhWb2pJOTdJdFdCa3lBUGNRYkFpUUpwc3BpQ2gr?=
 =?utf-8?B?MGVtRm1xcGpWeW54VTNGbTZ3eWVKcllFU2l3MXRDMnNqTmlpMmtRM1JnSzdN?=
 =?utf-8?B?Z1M5TXA1bWtibmRYSlNDZ3BVUFkvSUI4NmtrVlhGMnRmVFFYOXY2NWdNWjA3?=
 =?utf-8?B?VTFveDlmSmFtNG1xRG9TWlZ0dHZ5SjRKNzhBbml1TWxtVWw0Tjd5c0dDTEFr?=
 =?utf-8?B?dUJVQlZDSnB5NjhaVkcweThrRHpOdVZuN3F3dmIrSEdMYUR1cDAyZlZuS3dR?=
 =?utf-8?B?Y29BazNrM3krWWx3ODNMYjJkRDFhM2gzSzRBWEV1ZWI1YmxlOEdyNFdXYmhi?=
 =?utf-8?B?cmFYNHBaRFZ5WUkycmthSkxCZ2FidllicWNTWHozZjB1TjVSZGlEVncyb1JW?=
 =?utf-8?B?SlFlUDhFdmRiUml4V201YVpNbWdpZTl5OENmOUJ4b2YxbmNITHNscnBMc1hL?=
 =?utf-8?B?ZXh1UU83WTBpemhteE95UGRKamR5MnlUOXFoVjNRb29LUFBFclUzalB0UlI2?=
 =?utf-8?B?ZXJONFNsaDhxWjV3dGQ3TTVhdWNEbUg1NGYzaDI2eG0zWG1oOEl5N09aNWE2?=
 =?utf-8?B?TENpRzJOVm4wVzcyVWVQT2FsNGFPU2V2SjA1cElYM2oyaGFsYWVYSllLQW1S?=
 =?utf-8?B?TkszZ0pja0hGWFBJcnY3RHNjUG1RMjJGRUFqdXk5UU1SYm1BNm9QK0M2S29S?=
 =?utf-8?B?UGFhUE9QaFR5NnJodU9kK2l5WnMvcHg5Sm83L0l4U2RqR2IyQmhBY3hRRFNL?=
 =?utf-8?B?RDRJLzZCUGtzUHQyOFNFbmY0TklZWDg5aWJQYXFpbHJXRHhGWHpQZUppVDFs?=
 =?utf-8?B?RUhXSmpGaWF6R09YMEZkQk1wUE5QdTV1MEgzN2YxKzRZZUhOMXBQQUtkenpN?=
 =?utf-8?B?RjRZdzlvbUJJT0RFdkZLY1d6TlNaV1REdVNIaGFOTXRURjBIM0Y4WjFtUitp?=
 =?utf-8?Q?xx84PhyQnlvNJeRJ98RKYNUnDjYwKbsbePTd0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6604.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230038)(1800799022)(366014)(376012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eWdqTk5SNElUbVE2SllaQnVjUE9aSk4wU05XRkR0MDFpWFNoNzhTZVo5V2Zl?=
 =?utf-8?B?dWJTaWpJQ2VQZW5MZmVDeWYydkI1bjBJeU0xSnpkaXJ4NTc4TVBSd3IzK1pk?=
 =?utf-8?B?QmdnbFg1UjJobnJqNU4xbkpFOE1mMGZBdURCZWNkSS93SGROb0pWN1dMZFp3?=
 =?utf-8?B?cDJCS2loY1BTNGo5TFJNQTErNmVTU25JT0ZXYm43SzFLbHd6SWRrUmpIOFl6?=
 =?utf-8?B?M1pjZERYZ1VtTWNQT2VpbUdkeHY4TDk1SDZXYk1iT2MxNkxlM0pSTkZZY3l4?=
 =?utf-8?B?bHZOU3lydFc0bFZPK1pRRGZwdnVGeVZKWGZBVG5HUFFOU25Fa3lSWUQvYW8y?=
 =?utf-8?B?dy9VSWU3dG1NY0swcTJnQ2xnaytUMVpUa0JPVmlHNWxacDNtei9QMW1DY2c3?=
 =?utf-8?B?ZWR3SVZSZWM1MndRT2RqR1g2amc0dXFxUzIyYXFGSlM4WlllazcwQXh3eFgz?=
 =?utf-8?B?Mjk0a09pSEZ3Zzd6TWc1dDcrYjJGYjM3WDI2Y0N4RFA5bkdkV3FtT082cGcv?=
 =?utf-8?B?WFFLOC9hN1g2WEp1Nzh3SE1Ec1hkYnFqdUtRZkVrejlRZkM4K290T0trbjA1?=
 =?utf-8?B?OTZzTUxOckIrbUEzaVRMRXJwQnd5MlZFMkV4cDBaOUptWnRGaEg3L2xjZUtJ?=
 =?utf-8?B?ZXhGdUUyUHZxOVJTUmhuVTlSaXlocTVwWnVGYnlNc2RHZVoySnJyaUgva3BW?=
 =?utf-8?B?a0ozaXBQNnZUcWpEWldtQXZacVJrNW05SjRFQ3FaSkd2QVk1blFDcHBJTTgw?=
 =?utf-8?B?ZmNrVkVncDFVNHBXN3BTV0ZtTFBWaERFaFphVWhOTFR2TEZRbHBUTFV2ZDl0?=
 =?utf-8?B?QitoREE1TnhVU3RaRWhxOFBWWnhPaENKQVFtcWVWSE9LYllTZWFkL2xiMDhE?=
 =?utf-8?B?WUFHNUhQQ0dCT3FNemx4V1RncFR6SkIxR21IT3Z5WUtYY1hjVUNnVHdudGgy?=
 =?utf-8?B?b3c0eXh0WWJoUm9PUERnQ25xbHcxdzVka1Qvbnc2QzZRUzBKQWU4T051clNX?=
 =?utf-8?B?OUdJeVFiUUlUcTlXV2R6aUN5Q1ZHYXJKd1lUL1NZM013OU9HN2ZsWEQ3QmFQ?=
 =?utf-8?B?NStLUFNSa2wyU3RUUUJCOXpXTWdHK2pvdjgwZ1NnbHRRcnloRGdQcW5DL1RC?=
 =?utf-8?B?ZDczWFAwQi9qN3VqUGNqdVBJaTR1emphT2N4L3hPMDJVZGRtZUtibkFUck5T?=
 =?utf-8?B?Qk5ianFnRTBuMnRQZFR6RkZaWXF5QWRRemNaTENrOU1qenhhQzh6blZVNmhG?=
 =?utf-8?B?UXJReGwrdUV0M3R0TEFLenhXeFEzQmNtVXIyKzZtT21wRjN6MVFLVkZEZVE1?=
 =?utf-8?B?bDQvdjl1RUZWZDEyZU50Y1JIODVSVGNvRGo1aVM0cVpuYllka0R0KzNNRnc1?=
 =?utf-8?B?SE1CN0pqM2RieTc4TW5ySExIdm5mWlZRYXlURFlMQ3kzeFR1c1FocVFYd0Rt?=
 =?utf-8?B?VVNTcDJueE5JbmR4a2VyKytKdURMS3pNcENVaUhwQ0l3NVdBbGplalJIdlRa?=
 =?utf-8?B?bEdPKzVheWhlc2xTSFZUVm5GNDdtNktWcGl2a2k2OTdmMlhDWlpxREpESEI5?=
 =?utf-8?B?SWVlV2pBajFIYlVsdWZmS2xIY0d1LzQrMW5PeXVSd3FuQ3IwVzhoMUVJcXIy?=
 =?utf-8?B?MUhVSUZ6VlBITWQ5N1BHeE9IUExBcGw1eHZ2SFllbXZVMUU3elpiMXduMndH?=
 =?utf-8?B?c2VtWTdjc3hmSmZ1Z291K0JQZVhCZHhqNTBQYXJmWWhqemRRSG9FWFovUDJK?=
 =?utf-8?B?SE5ZMkwvOGVuQ0M1UVZlYUtYK2RveW95ZnNzSEw3cGR0YUlldDExT1RGVEFx?=
 =?utf-8?B?ZnRuQUl4N3RMTU4xMjdjNGw4ZHQvNXkzelFybnJWMWIvVGZmam9qK0hKR0dL?=
 =?utf-8?B?SWFqZmlBM3BTbHI2TGFnT0dtVVdONS9lMllSQ0xXVmhVNEJYeWxJNjZyM1p6?=
 =?utf-8?B?WUw0Zml6Y0NHODh3cEtzMkN5eUlnM2dDQnhNeCsyNzhjL0ZPL0tpaUZMdFVD?=
 =?utf-8?B?WDlSa28yRmdnVC9RcVZLa1g0b1FSTG5WbWowTno5WHdGWXA1dlgrM3RYYzB1?=
 =?utf-8?B?aFhPNkZXVEY4cGNOb1BVSDhFWUJ6Zm1GaEtaZHRObHJxZ1BFMko3MVRKeXJ6?=
 =?utf-8?Q?qe+3nY1H2j1eJ9fLYXedDdheB?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 362d81e2-523e-4600-d74a-08dc955a8a17
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6604.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2024 21:05:27.8278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XZ5XmH0CB7x0Hf2QvcYtHc2PuV1NxMNCqsB1HA9p765DsTcEpPXchA+7HGm8a/lRmxVv650L+gXexVyLOLfqbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6116

On 6/23/24 10:53 AM, Jeff Johnson wrote:
> On 6/11/2024 9:24 AM, Dipen Patel wrote:
>> On 6/3/24 4:22 PM, Jeff Johnson wrote:
>>> make allmodconfig && make W=1 C=1 reports:
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hte/hte-tegra194-test.o
>>>
>>> Add the missing invocation of the MODULE_DESCRIPTION() macro.
>>>
>>> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
>>> ---
>>>  drivers/hte/hte-tegra194-test.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/hte/hte-tegra194-test.c b/drivers/hte/hte-tegra194-test.c
>>> index 8ee038ccf601..df631b5100d2 100644
>>> --- a/drivers/hte/hte-tegra194-test.c
>>> +++ b/drivers/hte/hte-tegra194-test.c
>>> @@ -235,4 +235,5 @@ static struct platform_driver tegra_hte_test_driver = {
>>>  module_platform_driver(tegra_hte_test_driver);
>>>  
>>>  MODULE_AUTHOR("Dipen Patel <dipenp@nvidia.com>");
>>> +MODULE_DESCRIPTION("NVIDIA Tegra HTE (Hardware Timestamping Engine) test driver");
>>>  MODULE_LICENSE("GPL");
>>>
>>> ---
>>> base-commit: a693b9c95abd4947c2d06e05733de5d470ab6586
>>> change-id: 20240603-md-hte-tegra194-test-668212d1420f
>>>
>> Acked-by: Dipen Patel <dipenp@nvidia.com>
> 
> Following up to see if anything else is needed from me.
> Hoping to see this in linux-next :)

Its in linux-next[1].

[1].
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/hte/hte-tegra194-test.c?h=next-20240625&id=9e4259716f60c96c069a38e826884ad783dc4eb4
> 
> /jeff

