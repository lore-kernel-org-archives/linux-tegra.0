Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013042.outbound.protection.outlook.com [40.93.201.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2EE3F9FB;
	Thu, 18 Sep 2025 03:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758165530; cv=fail; b=HA/LmzyN72fqb9d+Psn2bvL7ERsoq8KJS+7yUI2cXus/cqXHOKFunuPYZsLUeDRhY9WkqItuhlF86y9XbvFMlRIU98tA3ikB1z2ZHm+czm/vRdSm40LPHMDiEvlX7IItn2kf0QW8bACMrn5FnoruzNZyCj0m2i95x95bvYoZhFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758165530; c=relaxed/simple;
	bh=Ch1tEV0VrXCpEcmVyn5c9H5yvLQTjn7QhPSaYI37ozo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Rwi3dqJHJPJQ9E6bC8EysCcIiyOlPNwn61viIJ+c+t9IZ5xyJBF8f2kyfblArO/ktibOUf3AVeSr1IoiNQMsRkieDbBLd2OqVidwVzCbGYxU15awwvitb67reKkU5Zug285ZzGGna3pkCVLWYWuWE0IG+TG32bwmrpeFHtcNRos=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BUjSEKBS; arc=fail smtp.client-ip=40.93.201.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BUjSEKBS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=prUIu3DiLc19KCBE1NuWgLIbYUaGbC1+z5f1PjnYlg8p/c3Q0uPDuvSH0MiRAAMjq/MWGyVC0L/BjXEzUnT6ts7fIWa2VutT57vLKz4pylYcfiR2j6ZhqMVDrR/DtK3gGZChM7933W4g0Iab7v7O57ees09FPY/Ru+kKWQW2Go5IiewjY84M70FOwLod6vl2pxID2DjQaf9t1iaS9NKINNbEharGUzeBic+FZQlnvYj1zS/VkGi3wCbhGk9r+7VwE5s9wVBYhzp3RGTohQ93rec28kLIeGS+uQHoeqb4sAUKWnYrvMCKkYS4UVoT8SCrfPkdPda/QkNtmE4/+6XCyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XqkhYKMNvjLUnbcUjFn1BlcsMCQ1nBHmuwMXWre8pbs=;
 b=e6P8fyk3b1tqJk51XEUDwu1tZ3+jAPKfPeuG4O1+jp8sIxfBJdxjVcyw61U/8Dbd4bUIDZnLAEUec05oOTE6FzKgOunPXu1/F+gvnZSbA5HgJYtAI/5Mjws7kmo3n8gDOQodcJIOjF1zxP4nxHe8fNt8VjcOXbIID0EVCrhoIwouqxK9Munv48zY689WvZuosBdBCkpwh5ZukdPEVn8yQj//njTdHOI9F8mHmvL1Dp3aYlL8OQrKUPmZSfRky3Gpjh5QanAZ6MbuYkDigXV2H8C3yTLT4xmvTbZ278WUfd5FRLzNHVuU7GtonuL9UnfaDwwSsvpv0Wt6nurMMRwcjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XqkhYKMNvjLUnbcUjFn1BlcsMCQ1nBHmuwMXWre8pbs=;
 b=BUjSEKBS2PqWoXr8h4Gj+PhJxamg8DSWF4fulI9zYSDD8h6X13im3cuIyu9NP3G97KWFhhPak7dg1BJsmE/fX8bi9+n9xF+E4QvxXGe/h2dWTMDchjsyPbUWdyevHYhiUz0qwMJCW383xYnVdWCgiFIrgU8+YQM/zBvVDQnk/VdbHSN440ek/KwhwP4yBrOL1oT8FLRJxeiVEYjEzHjpSWZGgyP9vHco0Xmw1wHyMxYvxORKFUzmRKQuIpuRN/bcfDzOI7yvnRsC0iz4zQz4MXY+jjdNPKMjqLtEVa8czeCBJPXwit+fKCwNaT2Jv/8VgJNTLq3LVQHWt++GHkq52A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 IA0PR12MB8976.namprd12.prod.outlook.com (2603:10b6:208:485::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Thu, 18 Sep
 2025 03:18:44 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9115.018; Thu, 18 Sep 2025
 03:18:44 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Joseph Lo <josephl@nvidia.com>,
 Stephen Boyd <sboyd@kernel.org>, webgeek1234@gmail.com
Cc: Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
Subject: Re: [PATCH v3] soc: tegra: fuse: speedo-tegra210: Update speedo ids
Date: Thu, 18 Sep 2025 12:18:23 +0900
Message-ID: <4371304.kQq0lBPeGt@senjougahara>
In-Reply-To: <20250903-tegra210-speedo-v3-1-73e09e0fbb36@gmail.com>
References: <20250903-tegra210-speedo-v3-1-73e09e0fbb36@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYWPR01CA0045.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::15) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|IA0PR12MB8976:EE_
X-MS-Office365-Filtering-Correlation-Id: 00957bf9-9282-44e6-a6ce-08ddf66212cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bkdrU1BsdHpDRnNPcUZlVEtvK0JpT3dCdDd6VTJsL2Vod2lhanU2UDYzM0tG?=
 =?utf-8?B?eWtpdFc2UFd0V2hDVGFaUXg3NGpMN21tbXQ2SnRRUjVXWFR3U0JsU2xzeHMx?=
 =?utf-8?B?N0ZFZDNKc3drdXA5T3p1eDB6OUtaaEx2Z2VkRnIza2hLTzJBTjc3Wmp3YWtD?=
 =?utf-8?B?dzJYeEx6YWFtVlA1ZVp0bDFtZGFhbXJvVklkMms5NWM3cCtNVVNRN2I4ZUxR?=
 =?utf-8?B?aCtmWVNXWW1SMklxQVpsK0UyRTRrV3hDRnJiQVRaRWJTUXBObjZJTER4WTVi?=
 =?utf-8?B?TGI5UERBblcrQU5Ja1ViVDhEMjdmSWdHTzBiOGtvVmliajMvYlhUMngyNmJX?=
 =?utf-8?B?WFRyRDhXdzJkRnA1cU83cHBnTEpoaThpM29hTkZQTlhLVzdjU3ljZHhpakh6?=
 =?utf-8?B?b1k0Q0U3K2ZidTVWUjJIMklQUWd4NWNEVTByNlZDWERwcXFFWWtRWlJZWU13?=
 =?utf-8?B?WXlwU0YyMUtvOHJzY2NKaU80S3FZTTBpSUtJQ29ISG5EaXo0UjVxUS9PR013?=
 =?utf-8?B?VnJ6bXp1OXNsYnRmcVNnUkd2cTVYd3kzcGxZVUpIa0NRazE1QkNFUldXVytH?=
 =?utf-8?B?R3lCSUltNkhGTUY3bVdFTThKNFZpeW8xMURsVzBiRTNhK29GcXloc3JPRVI3?=
 =?utf-8?B?S080V05DM2Q0RERSMDZKZkUwMXhiaThkczJock1yOE4rN3NEcHdIVVR2MFdq?=
 =?utf-8?B?MnRYaHNSeUV5d1doL25Qb05IaEMxR3NjdFRFWTFHN0Q3TDFRTlMyVC8xdXd3?=
 =?utf-8?B?NUUrQng2TmJ4bVJ2dEIxK2FhZlNFK0pvN3F0L0xqRTdhZ3dOSjF0M3o5aVdE?=
 =?utf-8?B?RnlVL3krT2NOOEhLSG5xaVpidjFGNGUxV3lqcXZ0bE96TGM3aHgzcHpaVy96?=
 =?utf-8?B?d1V5YzN6MTlENlRQU1dlR0VUYlViYW4wV3dHTk5HcUVHUFBtaHJlU3ZSb2Jr?=
 =?utf-8?B?TUJIazNoTlpUUGdiMlhLUGhibFBuQ1dVOHpTbUpUY3UrNk9VMVpTMEtFT0VX?=
 =?utf-8?B?ODdvWnBPODBCc2FmRUZLdEU0WEVtQ3ZnZWRxclBQQWJqTFI0OUdsRlJRazFy?=
 =?utf-8?B?L3ZoRG1aSFUyWklwUHhvVHZOaWtXWXRKTVVubXVqaXlNTWNpWlh2aVJUZ0xB?=
 =?utf-8?B?enF1L2NRaGptMG9EYUZJdmFLc0ZpaU90Y0JXeUc0azVQTXExQUFwRTRDWFI5?=
 =?utf-8?B?elhBcXlPOC8zMmVtOE5wVUxDTkV3TjhmaUpYYTBIOEJPUkl4b0pMWFpNeHNh?=
 =?utf-8?B?VVRUbU5wbk1BNXljUWNnNEJuN0FHZGhQcDlqK3FSWHFXYjI5bklWcHJTVXJG?=
 =?utf-8?B?UFpVbFJhUStIMnl4VmllZ3hTalcyWW1Hb2JNRmdzZ0cwU0RPOXdlMXhNT2E1?=
 =?utf-8?B?THNUNW5DZkJSRmNCNlpnR2RqUmFyNXZ6WmQxSWxZSGpVS1VLQzZJZk9XQ1BO?=
 =?utf-8?B?cC9MV0Y2UWVXWkR1OTdPY25iOXhkcjlhTlpKNjRhcmNFZ1NhOEo3bktXaXcz?=
 =?utf-8?B?ZXpObDhMMkxOTlh3ekxFTysyeEdSQkFpU29Zejd1TTUvTkhUdmhYZDlyQVhR?=
 =?utf-8?B?bDAxbmVGUXVzeUJUaDBhVCthQzNyTlI5M0oyd1E5YXNFeEpCSGtMbFhMK3BC?=
 =?utf-8?B?ZWV1LzhVdWw0NW1tSkw2MHNjQXZYQXlMd3ZKQjhDOHRjV3dZMVZoMFdPODhF?=
 =?utf-8?B?VGVkOUtFNDJqc21XRW8rUVRaZEk2VzFZL2RaWk5QMkFFcVduQTRVaTNqUTRk?=
 =?utf-8?B?TXFUMFRlRXdUcWhibXR3b2p4MDVsR3RyanhMQlZuZUJXWWphMUJDNGN0cXox?=
 =?utf-8?B?RHVMcmtnOU9vTnVmTnpmZkJta0YwV1B2MW1HTnR4TWhYcFpQNnhoMStOc2RM?=
 =?utf-8?B?RmdEVWw5a25VMjJmSXhIL2NIWU9NTGM3OXRuQXU0YzdqS0NhM3BNaDU5bWlG?=
 =?utf-8?Q?gKXVm4Ecl4Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6494.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dlA5SUMyWjZwRzhWTytGVis1Qy9rZjZOQkRkck5zd2QrWXNjNks3TGMzL1FX?=
 =?utf-8?B?Uy85dkpJblJnY1FmYXhIbWMyTHFoSVByWVNVck0rK0VRTEh6akY0Zi90WnRy?=
 =?utf-8?B?bFJUdytubjJDYVg4enpLam1GWmp0aitZZUgxcXZvNytwNHZJclpuRkVqenUv?=
 =?utf-8?B?S3Z2ZkcxMTNrMUdhMXNkNkVWczZFYUR4c25hUzBJT25DSGlDbWJSS0tNRFNV?=
 =?utf-8?B?amVjdU1VNVQvcU1ta09kelJNUlBYZjJsS3VjTWExMkg5dlFhOWE3N29XTEgr?=
 =?utf-8?B?YUdCVE5mdkYrWTE3MG9kaDdjT2ZpWlhURXVkcDN6emRoOHA1Mk1mODhVcSta?=
 =?utf-8?B?cU4ySFBvSGhmOVlzSHVOMllxMEUrRkp5UDh3Tk9PNEdkOHJYMEdHU1BRUDM1?=
 =?utf-8?B?VHphRHhmcjJ5LzZrd1lRY0ptK0p0OCtqVzF5OXh4eVh4RmFOMTI2QzdtWWxX?=
 =?utf-8?B?SjE1YjJsYWR0eTNVS2xHUE5MSUNzaEJIOCs1aDJXNmd6VWhpSTl2d2FDZWtq?=
 =?utf-8?B?Q1lvVmtwUE9CbVMzc1U4R0FqZUVvVWtmU25KYjlYVjhSbkVESzNzYkhpdFNY?=
 =?utf-8?B?S1U2NTJHU2VVc1NZWWlWaCtwOEoveEg1ZHV1R0hFMVBvUjBKRG40MWZ0MzNu?=
 =?utf-8?B?SUNnbW5CRFRZbCtMWnNQZUY5STZNWVpxMDNoKzU1cWhXcXhiSld4YmQ5d01I?=
 =?utf-8?B?WG5XUko3M1drWGN1RzRoUjdzb3JOUU9IQmxlR3hyTFpCRHV6MG1YVFZLVjRw?=
 =?utf-8?B?bjFRNHFucitiY2lNeFlJSFphTW9tMVprZndkbnlHV2J1SkpHb0NPMUEvWVNF?=
 =?utf-8?B?ZFNKRXcvb3Iyai9ISXlWYUF5enZFYk1wL2FUYjcxaWFzTlUwdmpjeklNMmc0?=
 =?utf-8?B?aHNna2RuMXNVWW5rOVNncGZDOENZV05leHBHYmtwaXJhSUJYRStLWk84ekhp?=
 =?utf-8?B?b1ZJRnR5ZW1jV1RCaWNhbUVSWUlLQ2RtZ0RkQlh1cFAzck11NzlMRUFqTWxJ?=
 =?utf-8?B?a0RYcG84R0FlZzFLbXFTeFNLbFBjOUNCak56RjJGOE9iN05jbDJUUmtKNFlj?=
 =?utf-8?B?dmV6SmZkMlFqZDlyVFcxcThWZUlsSUVFUE9FMExiYTVGamdGa3RBOEkvdW8z?=
 =?utf-8?B?dTFoY3A5ejQ3dHd3eGRPYU9nSnpQRHpnUDJ3eDN4Lzh5NmpOakRBaTZIWGN5?=
 =?utf-8?B?ZDZ1em15SENwQzJ1U0YxRlFiUGc5NS8xQjZ1aFdGWmU2YzNJWXlBZTFOc3Zw?=
 =?utf-8?B?b0lNMEVlM0tBUmxGeW9CUFJJTloveXpsYUZxUEJvOE53NklrU2x4RjhCTXRr?=
 =?utf-8?B?RmZTUkxDNUFyRi9JUVBjR0g3dGpRejY5VU5rVzEwL0NwOXd3TzI4TEdwSzNS?=
 =?utf-8?B?SGlKUFdYYncraElNTzgyQWRtUDNmUnphb1VTaDJhZjFzVTBqVWg1RWlvNmho?=
 =?utf-8?B?U2NSQUwrZEcvaWZ4UU9TRWRKZTBhZnhWTXJadHRScTlTbS9kYzRKUEh1eHYr?=
 =?utf-8?B?S3g4RzBkb29KV28wbWlYSUU5WUZueTJMK2FoYW9XQ2JJNnNESG96cHdFbkR6?=
 =?utf-8?B?dmdwRm9VcHhWQkFzUlRUK0NTSVZBSncreW4weHlDNXRNa3Bsd0wycWVBQlcy?=
 =?utf-8?B?K3REeHlOekZVY2tiMEpFSlV0RU9IVVdRMmlrUW90cWpNNCtIWmI0bndWaGVp?=
 =?utf-8?B?aS84bTU4Q3JCOTkrMitET1JSSGlaRXRCb0xab1pzMDZQNmtqWE9icCsxWG1B?=
 =?utf-8?B?K05vT29Mblk5U0RFRUExVExKZ1lzam9nOWpyeFc1M3c3YmtKK0FQeFY5dEt6?=
 =?utf-8?B?amNOQXk2eDczOFRoajZUQWduWVhzZjRYb1NyTytHQVJlSjh3VlpySE5zQ215?=
 =?utf-8?B?MEI2Y0gwOVIvY2xoZy9DV21xVGE5ak5lbjVXTzhaM2RET2tPRkhNdStuNjNr?=
 =?utf-8?B?OHdXMUd5YmYwK2RjMGJrM3NHQXlyNEt6bWh3blhSMEgreEpKS2JKM3NYS1Qw?=
 =?utf-8?B?NVJLUk0rMGY0Q3hkZTdra2I1L0lGVW1lZ1RoWkhMaXBRZVFqZlo1WWpVS0JY?=
 =?utf-8?B?OUlkSmJrYlJUZmgzN1NKM25oWDY1MGowbTNkSFM5cU00VXh3MU50clRkTnQ1?=
 =?utf-8?B?S3p1anlkd1I5TFFlVSt5TnBxcUNBRXI5ZmhaOTdMTWx2UUFvN295OElFNlJB?=
 =?utf-8?B?MENLNVRmd2h6bURyM3lLb2J2Z2FzTENyZ0E2UTRRNERMU2VoVDFPa3lYTjdH?=
 =?utf-8?B?MUk3TFVFa0Z0ZVljWXVNcGJ3Z3l3PT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00957bf9-9282-44e6-a6ce-08ddf66212cc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 03:18:44.1888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nMx3qeLQqVcNvaC6ZD7BxT9h3VE1sRM/5guHMX9lzoL0oHkHYK6vhwX/yNlr1m25fWzffJIyCdwOYcZvoNaoNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8976

On Thursday, September 4, 2025 10:58=E2=80=AFAM Aaron Kling via B4 Relay wr=
ote:
> From: Aaron Kling <webgeek1234@gmail.com>
>=20
> Existing code only sets cpu and gpu speedo ids 0 and 1. The cpu dvfs
> code supports 11 ids and nouveau supports 5. This aligns with what the
> downstream vendor kernel supports. Align skus with the downstream list.
>=20
> The Tegra210 CVB tables were added in the first referenced fixes commit.
> Since then, all Tegra210 socs have tried to scale to 1.9 GHz, when the
> supported devkits are only supposed to scale to 1.5 or 1.7 GHZ.
> Overclocking should not be the default state.
>=20
> Fixes: 2b2dbc2f94e5 ("clk: tegra: dfll: add CVB tables for Tegra210")
> Fixes: 579db6e5d9b8 ("arm64: tegra: Enable DFLL support on Jetson Nano")
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
> The Tegra210 CVB tables were added in commit 2b2dbc2f94e5. Since then,
> all Tegra210 socs have tried to scale the cpu to 1.9 GHz, when the
> supported devkits are only supposed to scale to 1.5 or 1.7 GHZ.
> Overclocking should not be the default state.
> ---
> Changes in v3:
> - Drop all patches related to limiting cpu frequency from a dt property
> - Link to v2: https://lore.kernel.org/r/20250903-tegra210-speedo-v2-0-89e=
6f86b8942@gmail.com
>=20
> Changes in v2:
> - Define units in patch 1
> - Update patch 1 commit message to better explain the need
> - Pull all downstream sku's into patch 2, which eliminates patch 3
> - Update patch 4 commit message to indicate the limit is due to thermal
>   constraints.
> - Link to v1: https://lore.kernel.org/r/20250816-tegra210-speedo-v1-0-a98=
1360adc27@gmail.com
> ---
>  drivers/soc/tegra/fuse/speedo-tegra210.c | 62 ++++++++++++++++++++++----=
------
>  1 file changed, 43 insertions(+), 19 deletions(-)
>=20
> diff --git a/drivers/soc/tegra/fuse/speedo-tegra210.c b/drivers/soc/tegra=
/fuse/speedo-tegra210.c
> index 695d0b7f9a8abe53c497155603147420cda40b63..60356159e00d2059e55eaacba=
27b5ca63bf96c90 100644
> --- a/drivers/soc/tegra/fuse/speedo-tegra210.c
> +++ b/drivers/soc/tegra/fuse/speedo-tegra210.c
> @@ -65,27 +65,51 @@ static void __init rev_sku_to_speedo_ids(struct tegra=
_sku_info *sku_info,
>  	sku_info->gpu_speedo_id =3D 0;
>  	*threshold =3D THRESHOLD_INDEX_0;
> =20
> -	switch (sku) {
> -	case 0x00: /* Engineering SKU */
> -	case 0x01: /* Engineering SKU */
> -	case 0x07:
> -	case 0x17:
> -	case 0x27:
> -		if (speedo_rev >=3D 2)
> +	if (speedo_rev >=3D 2) {
> +		switch (sku) {
> +		case 0x00: /* Engineering SKU */
> +		case 0x01: /* Engineering SKU */
> +		case 0x13:
> +			sku_info->cpu_speedo_id =3D 5;
> +			sku_info->gpu_speedo_id =3D 2;
> +			break;
> +
> +		case 0x07:
> +		case 0x17:
> +		case 0x1F:
> +			sku_info->cpu_speedo_id =3D 7;
> +			sku_info->gpu_speedo_id =3D 2;
> +			break;
> +
> +		case 0x27:
> +			sku_info->cpu_speedo_id =3D 1;
> +			sku_info->gpu_speedo_id =3D 2;
> +			break;
> +
> +		case 0x83:
> +			sku_info->cpu_speedo_id =3D 3;
> +			sku_info->gpu_speedo_id =3D 3;
> +			break;
> +
> +		case 0x87:
> +			sku_info->cpu_speedo_id =3D 2;
>  			sku_info->gpu_speedo_id =3D 1;
> -		break;
> -
> -	case 0x13:
> -		if (speedo_rev >=3D 2)
> -			sku_info->gpu_speedo_id =3D 1;
> -
> -		sku_info->cpu_speedo_id =3D 1;
> -		break;
> -
> -	default:
> +			break;
> +
> +		case 0x8F:
> +			sku_info->cpu_speedo_id =3D 9;
> +			sku_info->gpu_speedo_id =3D 2;
> +			break;
> +
> +		default:
> +			pr_err("Tegra210: unknown revision 2 or newer SKU %#04x\n", sku);
> +			/* Using the default for the error case */
> +			break;
> +		}
> +	} else if (sku =3D=3D 0x00 || sku =3D=3D 0x01 || sku =3D=3D 0x07 || sku=
 =3D=3D 0x13 || sku =3D=3D 0x17) {
> +		sku_info->gpu_speedo_id =3D 1;
> +	} else {
>  		pr_err("Tegra210: unknown SKU %#04x\n", sku);
> -		/* Using the default for the error case */
> -		break;
>  	}
>  }
> =20
>=20
> ---
> base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
> change-id: 20250812-tegra210-speedo-470691e8b8cc
>=20
> Best regards,
>=20

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>



