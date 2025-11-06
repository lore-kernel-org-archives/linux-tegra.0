Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012068.outbound.protection.outlook.com [40.107.209.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E782DCC1C
	for <linux-tegra@vger.kernel.org>; Thu,  6 Nov 2025 17:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762450121; cv=fail; b=Y3j2CLpq4WrFCxd7x/fPwWb3No6H59AsZi89Wqw+GmcHRNHCyT0smxUkcEJzCIc66bs6gvyyy+O2FNtmdFaAeWh6X5MnLvTeqYQ4+Pktwh9pliQqNQa+KhRq1eDXxjKgp5PKoK4vutIp3syO7qvsUvldJrVnnxDe4MU/U3sXjA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762450121; c=relaxed/simple;
	bh=xUAarRSjglp/L5ZY72Ed+AQtXrIl7YCZhbkhTUQB4zM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VwgOZZTMwn3RPYEmEsLGWKQlSn9ZaTKdTDvdtB07TEeW2E4Tnd8P/LJGnArZs933qmtoGwUzctEyO2eCEDpV9L+WNdi8rGDxtCN89nxGEEOjZUz0U6hLMLK4gOB4lL0qftL5il+Ot3Mf3Qo4zHATVPb8jHTZx6efI7ZQWEIpPYo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ipOctOrh; arc=fail smtp.client-ip=40.107.209.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ipOctOrh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fL/X+RAB8FWs66mn4nzyj/0sLoQ4NbBihFlpKdCyYPvJPO7pNNDCrflgheobDY4yElGye/L1/+IW4ZEIPkg5h1uMX2A3fFunNMovyx6V1iqoIlp+pVdOUZpDZlwEU+vbp2Aw71MYNpBCrjnMWEL+QlEJthsCO2drXcYPY2vzXUGERL1TZe/70SnlzxdncbWa5OJh/kK5p0zUf/+LS5Q3CP37BaaK+9CXvhrR/AUuQMGNOaJ4yfk9KQRfAUqr5zgUbmooz6vOi1Xha7wV5apJSBkfU/tPLEQetVBIELlE65kJqcalUWIH0h4albHwLqSg62EwViKxX/7uS/2VuDGMdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=or/eFPuwxlJUtAVVcEbxgP+BodwWgAHVA8dtlROmO3k=;
 b=kmLHhCbRcxKgvto4TRFGDKIqa06zWlgFYXckEpijUYoijP/a/nzrPagyCufcDYaWACQ/FTGQKTHpNPVNys13P5cUjsUJJxax/IlsB39zOgWolWT1KBh4xON/JcEfU2XI3EeC6NwBXn3kF2MdxIWA3MieyvFkdtK8gyfcWvif4OvphV3QcsjNnYfOM6Bi6ISMcrSJz5ueUOqjdSklkvj8dTOr+4kpGTh6NsTivTI7PPimPbV8RWHzE9asvmydOJFnY43MalU+4ROyXLqINCSqfML62m3WxOUcA9iVyzGBrRk0g5M0J66oJnVSbrbCkkklt5E5YBYlbZ8Gsk+PrTUnXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=or/eFPuwxlJUtAVVcEbxgP+BodwWgAHVA8dtlROmO3k=;
 b=ipOctOrhB3NFO7Rdj/QL8g/wsUGyPnye+3v3JWMDgGRnbt3UEuibQV7hqbIcAqU9SLs67STo4+kGKC3BXXhxi1Mi4cwlr/boWDuHnWB19BEbGwuN31ev56/tOwq0cZJ2HWsB380+hbeBOrm3jjTQf18qFCtfVAxUmmrt7YSFU36F5onXSKSGD3+ZYX6HeOTx6BkNRVb+N9rlf4GarvIq2wkunmbnHnTrM6PO/WcXE0OhJpvUHU43yeorezzHFCmK6/0lc/9tSdA3OsnRAkD5vqh/IZiy8f0cscglKCj6gnF4Fsc32eRBzPnYhnSjQ3oU4fz/1YHdEcbCjvZ8HX2p5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by IA0PPFD4454CAA9.namprd12.prod.outlook.com (2603:10b6:20f:fc04::be5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 17:28:37 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 17:28:37 +0000
Message-ID: <cc99b4fc-88e2-4721-bebb-fb283fa22e0b@nvidia.com>
Date: Thu, 6 Nov 2025 17:28:33 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] memory: tegra186-emc: Fix missing put_bpmp
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org
References: <20251106172600.1708237-1-jonathanh@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20251106172600.1708237-1-jonathanh@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0124.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::21) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|IA0PPFD4454CAA9:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fb051e6-d1a7-4b27-60c4-08de1d59eb7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K0svNGdMbXg5NmF4MEo1NVdEVEFJeDhETDc2YmRZMVZNd29rRWRMRGk1dGRT?=
 =?utf-8?B?OFlzS21JV0sxZmc5K0VBRWt2c0dHL3NMaSt6UVNweDBsMnZTVU43eUNRcEkx?=
 =?utf-8?B?RWFMZDNCdUZZOXJZWHRXb1JrSnNJQU9wL0VhUzFBQVRkZVdiT3JucktZRVl3?=
 =?utf-8?B?K3M3dWI3dVRseWtuWFZPc3cwK0ljUENWMkRGZW9vaGtRQUdqaE95czhHVjZs?=
 =?utf-8?B?a0ZYNlBhNFd3Zno3c3lMUCtMclFqakduUXBMNjFOaUlEcjFERnNDL2RmSGtG?=
 =?utf-8?B?UXN5Y1dvUzM1RUg4Sk5tUkR2dncwdHlERkYwdTlleW1yYWZFTFREdmt3WmJr?=
 =?utf-8?B?YmhJV1d6citnL2pPNFpnM2g5S2lvRFgyTlBTTzYxZlJicXRWT1dBY29pWTJo?=
 =?utf-8?B?OGk5emViTGdqYzlFb0R0bmpJdEI5TWhNY0s4TGVreEhta09BeGVYR1lzZkZ4?=
 =?utf-8?B?aFFzdXFDQkw2YTkybjFaNW82UkFSZVgyMGZvSUZQWEtlUlMrMXRyUlhyUXQy?=
 =?utf-8?B?K2thelZPRENYcGRFTjI2TE15Zzhxam5RWnROOVJKcG9vR1BaUTNWa0RQc2NX?=
 =?utf-8?B?Y0l3d3F1czhiaFp5Z2pzRklaUXZsckJoTmFZZzZROHNkY1AzeURTdGhNZGc0?=
 =?utf-8?B?bHJ0Y3YxdUJXNGZxZk9RNnV4cEd2d2tUbVRsb3owaGRKM3dMUHd2VEhINXVZ?=
 =?utf-8?B?MU9ONDBhYnR1alhpU1c4eFVmNjVFRk9qbmd4U1R5NTc2YzFJaWVVRDJCSHlJ?=
 =?utf-8?B?bSs0bnN1OXJEVHE3QmFTUnl1TTRuR01PcmNERDBJRGFOZ0JUT2V2Yk5oUXZP?=
 =?utf-8?B?Mk85bFZtSkwvODFGTll0akJIYS8wOVV6ZGdMM2JrUWFaekVQSEdFcWljOTVa?=
 =?utf-8?B?TlVnQWNxamR4ZThhSE0zSFpCQ1JqY25oeUVqd3pxUWdhU0lvd2tjais2dHJR?=
 =?utf-8?B?eTc0bGUvekdualhoYTR5TWxPNHAzYUhEUXpDaTZqalZ6OEJKdUY4dmZOcHp0?=
 =?utf-8?B?eGptblBieFlSWEp0bm50VExxOXlSQU5YQ0x4UlNxSnBZR2o3ZlpwbmxCdFRF?=
 =?utf-8?B?Z2lydytRWWR4SlYyc2lQMk50YzJIcFMvTjFnMWhNekZwdHk0dWh5RWthMCtX?=
 =?utf-8?B?THZhMzFZRGg0RzM1YVVsT0NwL09raTZhS3EyWGNrUStNbzhjQlh2eFhZWkZz?=
 =?utf-8?B?OUNWLzAxYlVCSW9LM0lnWnYyYjlDZXdtWksrMmJvSjdjWVhMNkM5N1A1T3A2?=
 =?utf-8?B?U2U1VElpOTl0ZVNyNmZBZkkxbk9ONDVxRVBoYXM2aytPM0FkZFF3WENNVi9D?=
 =?utf-8?B?ZUVLNE1BdG9odEdVb3BKdjZka25GUDBpRThwcEpIc0loUys4cW5jK1FiRmV4?=
 =?utf-8?B?cXlOdzlJakNUQmlXSDlrdWpUSVQ5aHNsS1pCOEpRTnJKR0VoVE9DNEpJeHdr?=
 =?utf-8?B?ZjE1L2ZsT2NoUE1DME1sYXFXc3EvMGZ4b29pMkdXRWkrV28wcVVRLzJkWWps?=
 =?utf-8?B?ZDlMNGcyVHhMN2lzMm5nZmVQdkJRUm5vWTIybzRnNFhLV1gwV05rYUtoeGRt?=
 =?utf-8?B?eDN2Nm1qckhFSkZ4WmFISzNBdGx6ZnR1QldXc0hMT0t1OCtkMGc5cEFWc0lu?=
 =?utf-8?B?N0tSRVBEU2p5RmpwblI2N0JoWEZMcmtEN0hlTVR1OXZlMmsvckptSlVlWjJl?=
 =?utf-8?B?MmtTWDVORHBucmlXQlIvZzRxblZoWXJhY2ZRalA1allkWXRkYk5IK1lWN0Zi?=
 =?utf-8?B?UDN2Sys5N1I5cG1oQlFnR3dadi9XeEhlYm5CdFhqTjl5empWNTZBczV5VHhR?=
 =?utf-8?B?aGU2ZHU0Nkx4L2xBUzNxSWdFbkxRdzd2V25SMTlFWTI4L01MTmZmNlBITVVw?=
 =?utf-8?B?NVdVUmNtWU1PS1ZSelBDODlsSWtrd3I4dEZGdnFJaEZHdjI3c3A4Y2xzNTA3?=
 =?utf-8?Q?G76kzQXvRye+6fcThN4pGFc1TddGtxpu?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vm41RVR3dmpXQldCaFlzK1dXamFFaXpjcDN0Vi9LU0orOStCYS84cEFaanE2?=
 =?utf-8?B?ZUEzWmtmOGptSko4UkE1WVNoZmxvenNFWWRPbms2MHJjdjdYampJSjlKV1Zw?=
 =?utf-8?B?dmQxT3BSemUzZHgvdjJjTi9rNzlSQWk5MGROaXlxUFgyN0YyMUJFRjlHMWpW?=
 =?utf-8?B?Vyt0S2gvdEFwQ2dDaC9aTXdnMFpJN2VNUHVjWldBQ0Y2QXdGeFdMYVUvR3h5?=
 =?utf-8?B?TGZXOTdlV1NxWkkzOEgzdlVqbFhCc0ZWSUp3ckdjaElqenVYa3dUVnlESjNN?=
 =?utf-8?B?NjB3bEFOSFQ2a3E4ZmNsbnFzK1dYbmQxUVNtZ2pVbndDNGtHbGl4eXV2amJS?=
 =?utf-8?B?cDNJeFV4RVBSNlQycDh0QUtsaStBS2R6VjJJNDBXcWVoVmE2dWRpTEtuS2xk?=
 =?utf-8?B?aTM2VEhmZzFlVUx0WkxjWnkyelM5ZklHYXNVeGxsNzhVK0hRZkl3RWpyN1dh?=
 =?utf-8?B?MnphUDR0TVkyRGcyZ0swelBuaGp3ZlNaT1hsWUJWUDFEbWorYS8xWGdnaEFw?=
 =?utf-8?B?ZEhKTzNDWnk2MmZmaXJQUXV1ekk5dEFwMlZXbkxDTUlHZ2xQenEvNUxSV29h?=
 =?utf-8?B?QTNrOG1aRThSYnVlemFoYm56TFlrYjd3N1JDaUNDSEFQL2tQVzdxNnZMWVFH?=
 =?utf-8?B?UlZaWUZrK2lSSEJHQjN5WkI3UW9KamdwM1dYaVBPdXZFa21hUkdWWFdXKzln?=
 =?utf-8?B?azF0ekRsMCsvaWM0ZmxPbGxIYkF3UU0zNmdOVE9ZanQyRlZYVjYvOUp2V0c5?=
 =?utf-8?B?ZVdMeEU4S3V4MHNJTG1nbGRTU2I5bzliV0J5cEVGUHJldURvWDB1cXBDTGhH?=
 =?utf-8?B?aFYrOUdYTlZLTGZ6VVFnallvWXMwR2E3NGNhbUpYaXY2OXNYWVdkRkVJQUp0?=
 =?utf-8?B?MEtDL2R2TGU1Z3doSU8wZmFJbnRpVm5kSFllRUc0alhlODd2YldoM3BOY1pN?=
 =?utf-8?B?RkVhMTBsMitFelQxUTBjcWFxb2VRQ2NzOEZiYXRoWUtsc0JtRmd0MnRTNVpI?=
 =?utf-8?B?ZjFFYTRXRnVTVkpvZldxdUV6MjhuNkZjczF4elZza0tVc250SXdoYmtacmZx?=
 =?utf-8?B?WlprRkJNaUw3M0EzSEZhV3RNeHlSQ1ZzeHJhbTg1UWxQa1I1ekV2cEtTaUlJ?=
 =?utf-8?B?cTBydWZ5REJNVVhtWkFTd3FvSnlKUEs2WkUzczQ5OUVFNU5lQ1BBWndsNEFj?=
 =?utf-8?B?VjAvRTN4WDAzNStUWFN4b1N5TE5FcyswUG5Kb1hjYis5MkYvVGl1c0hVaE0r?=
 =?utf-8?B?UzlwL08xVnEzcVNRak9GRGY2ekhLaU1BL2U0MG0wT1k1aU9aSGtSZGJTbjZk?=
 =?utf-8?B?Q1BJVzBDcFViTklLYU1pNzFaS0J6S1g4b0g4VTdOMnF5NGMzKzl1bmtxbHp2?=
 =?utf-8?B?cTNteVZVREE0cFB5amRKbDVzTUNQdmF0dDgrTUFQSmR6cnNobGswQkhGYVlV?=
 =?utf-8?B?dVRqWUIzOTViNTEwNXE1aFNGb09MK2oxS21YK3dUck83clNuZHR6K0ZOTDND?=
 =?utf-8?B?Z1A3TXh2NWRNeU44QWJqbEZQL1dEeW04Q1V6V0lZZVJjckE2ZUlVbmdudXdQ?=
 =?utf-8?B?ZEpWSHFRUzdlSE1pWGJsSzlYTCtLaXdLV3ZZMm5IY1RCWW5VRUtyNm5DVzhD?=
 =?utf-8?B?VURoOUtweWxqUFpKS2tRMmhlNlBRVjROM0pFMEFOMk1iSTduQmdhZ21SN1hk?=
 =?utf-8?B?aVE0RkdYcit1MkhxWkFPcnd5QnB3eFR1N0xWblFVa3QwR3RjSm5TQWpwTFpo?=
 =?utf-8?B?cEFMSDBOQ2FkY2NtMUs5R0hOU0t2WEdab21waWZDVlRRLzVoam1kRkFoU1Jj?=
 =?utf-8?B?OFNvbHBFMTJ5c09JeU9NSXhHVG9vQXlyWWo2RE5VeFkvZnNmQXJQMG40Y3Bt?=
 =?utf-8?B?cENRZ0NrZkx6ell5MGVHcjQ5bjYxa21SMDVUcHRiSDJaZXgydWtIZFNyZ0tJ?=
 =?utf-8?B?c01TYXFqVjVhZjNhby82YVdXQTgzcHA3TUFmb2VSVm1pSXJuK1lubkc4b2kx?=
 =?utf-8?B?V2lvNjFTL0dMZURYaVBNbDF5emtoT3lPbFFnc2xNaGJFSE9rRy91SXpaYnNL?=
 =?utf-8?B?TWdRR2lQZHJJYURleXN5Q3pncFhVdlhZTStQUnRvWmhyTDdhNURYS2o4NUhs?=
 =?utf-8?B?a0NqRURvOVFLQkdINVFsWFUraUFJRXo4N2NsYlc4MzE5VkpteU9sWDZzUEVE?=
 =?utf-8?B?Rnd5T1lTQ0hDUEw2YnZqSFkxQWpVNUVRTk5HQjdSRHM1Yy9McS9VK0xSU0pr?=
 =?utf-8?B?L0M0YVhwSlZ4ZENZdUpIVUYzRUxRPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fb051e6-d1a7-4b27-60c4-08de1d59eb7d
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 17:28:37.6095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6wsd5eCgHNsnjwev8znQNeh8Bmmcblnt+TXSzfp2GhhPssRdQQvWkevnf6ziPTJKM4GmL8tCCSlI1qVSSM66dQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFD4454CAA9



On 06/11/2025 17:26, Jon Hunter wrote:
> Commit a52ddb98a674 ("memory: tegra186-emc: Simplify and handle deferred
> probe with dev_err_probe()") accidently dropped a call to 'put_bpmp' to
> release a handle to the BPMP when getting the EMC clock fails. Fix this
> by restoring the 'goto put_bpmp' if devm_clk_get() fails.
> 
> Fixes: a52ddb98a674 ("memory: tegra186-emc: Simplify and handle deferred probe with dev_err_probe()")
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>   drivers/memory/tegra/tegra186-emc.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/memory/tegra/tegra186-emc.c b/drivers/memory/tegra/tegra186-emc.c
> index 74be09968baa..2c3377ea7fa4 100644
> --- a/drivers/memory/tegra/tegra186-emc.c
> +++ b/drivers/memory/tegra/tegra186-emc.c
> @@ -448,9 +448,11 @@ static int tegra186_emc_probe(struct platform_device *pdev)
>   				     "failed to get BPMP\n");
>   
>   	emc->clk = devm_clk_get(&pdev->dev, "emc");
> -	if (IS_ERR(emc->clk))
> -		return dev_err_probe(&pdev->dev, PTR_ERR(emc->clk),
> -				     "failed to get EMC clock\n");
> +	if (IS_ERR(emc->clk)) {
> +		err = PTR_ERR(emc->clk);
> +		dev_err_probe(&pdev->dev, err, "failed to get EMC clock: %d\n");

Ugh this is wrong. Will send a V2 shortly ...

Jon

-- 
nvpublic

