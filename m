Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2056.outbound.protection.outlook.com [40.107.102.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FAA1FC3;
	Tue, 29 Jul 2025 11:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753786842; cv=fail; b=hlYpgleut3JFeJZbrYXWylmPpvaHEquyoKw0/Gy9UiJgoHxt27xzUJkwyQ6Q2rNbhDEPb3PtcC2MJfuBC0SMi87lX0XDe+6otwgzyUggTdduDxMXOPKjJQ1PmNQz6VP0LndD2+EycyFKBKkQqREIQm/t+e+kp+u6aO29vN9Dtjg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753786842; c=relaxed/simple;
	bh=SZBFYLiMmB2pbcxF2mRPXo4tKUIWkc8wptivrybc+Gc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JgJGKoYuf+3ixjO+76LPZhIYbLdXxQjXKkxsABWCzfH0PO1Q0zseviaXExPg2PKSeWDD9IeL1c75Jeuk/IZmN436rs+3/d+zqvVexP5KxrVqUxIhH3QPOk2m3M+K3snOwbgAcoegrCDdy+DPBzvq6nDXL2j7qReoI8sK93zMnyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=REOiCpHE; arc=fail smtp.client-ip=40.107.102.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="REOiCpHE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GgQw/CfJlqnL9q36hGizsGjkTR9p4G5PxPwwbzKo1c3owzLqQ6h0qLn4MwF7LGpMoucKiZvn9PC0KnSkwnHbMRp3zE5USx6C868XP11Qr0e9QLVgsvmPip2VloSoZPocHwvPLME5WV3YdBVDwQvwhSZpEhmBqvC55eV2mDqkvslV4zmx2hKj2VBwlMaBKkAwHEzTFLNXlAzrVOBaROV/lOaoaFzYfuQiCBbA8USq76g4qfqih+r7q2oYKWg/WKL/deDDyR8cIe5bR6ZxOm5uJlMYPVJgeh0QH7dqHvwbV+HoHWWUJg69b9eaUsNIb3cg8zqPZ8wZQVWg3cjTbKAvRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sfYfHsqOOPUMjnQbOM4dJty//DRa5KFpSHTMANY+XnU=;
 b=bx6/I/WPPTF896GGkDHeZ9uAQrLhxzpdOjiZERNlhZ2RHmlr4dcw3/Yia9hjKK3Mg44C/SgOaqV8PQa/g3Zoo+4jO9maiJq8KmRA8c63EWHzQAzzjxdxsTWSEwIvRkTLYvT8iAltUoFoFmOdLvCohjcCc5eBKuG2wJfRVPaY671RStsAx7OgAx20hAtdmFcduRVp3bKTh/OdfoQN7lARXOtcrFRMKNBRJP7U52j7ITwyUv8v63ShTFBE0jDz2+nwFWOjm5hcZBlGrfKbKfkMwemAGYcbTFp7BlUtcJjci6fRFq+amzQXsrN7c8eoeb82vWVj3LJfc3dI77L2lm/87g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sfYfHsqOOPUMjnQbOM4dJty//DRa5KFpSHTMANY+XnU=;
 b=REOiCpHEN0pXYjM2E+gKiQUMaI77uFvDtAPYKXugmWIoA4MXezTKSmzKGTRyHzTAIcJh/5Ot3CEkkQJUB3BtQnE7XZFBgVnRlRM983R0HwTCHtbl9PmR1UTILGYzISC9jktKTyL+F8RyTUE5CX8mlZUUby7wgghSavRO1IE1Olu3kIcEe+fOMFlZJvHs+vDKPDUOMroQj+QOyXBqy+ZfestvZCP5NuBeteAna7penNzAcamWO6LPAhTJCpsJ36A/yZRAC8HiJw47jfC+iRS/8Gyb+oO+POrYwvovQoeEJhk4czHBq9WmYiLMSXG6iYgnEAkgc+e6YMmczMuRmD1qMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by PH7PR12MB7283.namprd12.prod.outlook.com (2603:10b6:510:20a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Tue, 29 Jul
 2025 11:00:36 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%5]) with mapi id 15.20.8964.025; Tue, 29 Jul 2025
 11:00:36 +0000
Message-ID: <e563ac87-ffb4-4272-b8bf-ef673a0952a4@nvidia.com>
Date: Tue, 29 Jul 2025 12:00:31 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] regulator: core: correct convergence check in
 regulator_set_voltage()
To: Romain Gantois <romain.gantois@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-kernel@vger.kernel.org,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20250729-b4-regulator-stepping-fix-v1-1-3f7b8c55d7d7@bootlin.com>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20250729-b4-regulator-stepping-fix-v1-1-3f7b8c55d7d7@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0107.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::22) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|PH7PR12MB7283:EE_
X-MS-Office365-Filtering-Correlation-Id: bc265b26-524b-4a45-d76e-08ddce8f259f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z0oxN25YTkRJLzk5bVcwa1hlUzdVT05MUVE5TjFjMXEydTF0YXJKUFVUZjdk?=
 =?utf-8?B?bnJoaWZFOVlqK2NaMWEzM1Q4ZFZMZG15Rll2UjZTRHNvWVNuSnJyTHlwbFli?=
 =?utf-8?B?UTAyaHNORTUvTUxyaXZlMGVnY2Y2N3N1alNYZlI2Rm5PU3pXRjQyVXJPSm05?=
 =?utf-8?B?K1hraUJvZzkyRlcvNk85M1VoeGhQOHl0S1FjNVJZSjF2ZHIzRVlxTVJwUXF4?=
 =?utf-8?B?NTNnUE8yRVQ4eHhkV216OGJTYW5vaHFobW5UMjBUcUpWWktUKzR6MG13Wkdl?=
 =?utf-8?B?a3AxSlZVTzZxdlRsd1phM1pDL2JqZUNldnJVRzloV0JnTWpVUHFKQmJCMnZT?=
 =?utf-8?B?akVlOWJkYmpWMGFvbUVsR01WYXFhSHdpRUZQMisrblZITnZwVEw3Q0tNTC8r?=
 =?utf-8?B?QTRkRHo2V1cwN3dTbE11bzJ2eklhNlk0UlRNWEV3cXBqQXhQYXdvL0pLcG9T?=
 =?utf-8?B?cFRSNng4RnhNLzNSSmcvOFZDVDhjdFJhNnR4N2M5WWRMeURHSnN3enYxa3pM?=
 =?utf-8?B?eUgyR2I4SGRSeEttVEkwSnBwQmIva0pPaFBrb1lxbVQvSmJkTHVrMWcwaWxD?=
 =?utf-8?B?b3ZEdHUwa3NncTBZTDZ5KzlwSFRMazdUTVhWdTlyRlhSUmhaU3YwdSt3Q2Iz?=
 =?utf-8?B?VGx2SHNjRmRlVE56VUxJTGF4Y290UTlaRnY0R2dUNDYzLzBuM1pDbTlMSlNP?=
 =?utf-8?B?Vi82OGk5UTNVN0tMTWJUN3lIaStVdGxpWTRwTkxiNkliU24yNEhZbFVzSytU?=
 =?utf-8?B?Z21FRXUySkszUkxGT2o1UXpUR1cwcUR5dnFJQnh2MjVBNUpwS3hVTjR0cWYy?=
 =?utf-8?B?ZGZ0RnZKaFRJcTh3cnpabFdvNG9sVTB1UHExZkkxTWhySHdPQUc2RzNKczN3?=
 =?utf-8?B?Snc3bmJMQkk0akVrMytKU01wQ0pKN1hqcmdpelVudHRjMXNaYU03Wk85cW9L?=
 =?utf-8?B?MmhvZzhseW1tZDZNeXR6Mkw0K1R4RUZ2R1BuM1dGNW53bG9QUTRtZlAxcVJL?=
 =?utf-8?B?cDBETDMwUkZKZXZaN0JhVEFzcGhKMTdScm5iSFk2bW9VQ1V0K3lsZ21ZSVNx?=
 =?utf-8?B?bHh1S0N2dnR2QlIwdlk2VWtvZk11akhUMFdXWlFUMjRDd09kT0dMWFJvMnBZ?=
 =?utf-8?B?K290VU1rTTBXTUFqT3UwNTh2cUJ2ZVlaSjV5WXNvdWViMlpwUXpUamxmVTN0?=
 =?utf-8?B?MS9tSUN1TDFEclJXektlTFNleGRKUmFLWVlkNzJ4T3N5aWNLVkZTZGdOY2JS?=
 =?utf-8?B?N2k0SGQ2VXhoSWlMODM2QU9wcHp1bEt4OTlMYzJheUpSNDhEeHdlMll2TEVP?=
 =?utf-8?B?OEc1ZFdENnY0Z0dTOGZsbThYampMZGpqNkJmYWJ0SjZCK1pGS0FxdGFlTk1L?=
 =?utf-8?B?Uksrc2FuRmhiK01WV292UGt2bXlJcklBY0FkS3Q1ZFdyMThHVGZaa1hrdjhW?=
 =?utf-8?B?dmRLSXZXOTV2cS9wbkRzeGxCZlA0czk2UFN2a3o4Wk5yMUdzclN0NkFiMjlN?=
 =?utf-8?B?WTFIajhzN2RiMmI3TURuV0Rvb1dZSk5mcDU4QnFMYmREVXdRSFh1SzdLZGJj?=
 =?utf-8?B?aFAxSktMUFJrUlRUdjB4NXZjTHpDM0VPdnI5VVpKcjJ4SDlLQ2NwUUZNWkFB?=
 =?utf-8?B?TkdJN091YjVJUTVWODlwNjMxaUovbk42QkRsRGVpTy8ydDViRGRQOTJpSWdl?=
 =?utf-8?B?ajZnRm9KUjVaUjAxeFNyUGZqR2xEOEgzTjBvMkp4eVlydG9LWXcrRmtGdkZM?=
 =?utf-8?B?RUtxY0xmZE9wOUYrblZnNEpNS2laSjN4Q1hqVkV2SDQxMWJwS0xURk44T3FR?=
 =?utf-8?B?OW0vV3ZORGF2ZVhDNTdPYUNWY25GeG43TjEyZk1qV3dST0c0VEpjZGEzVERw?=
 =?utf-8?B?VGs3bjJvUm1JcXVwaGozZTJ4a3pHZm1vTktJVHcxNEVZN00wakhnTEV3L3JZ?=
 =?utf-8?Q?0IJLKydpePc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SkNJMFFvLzhKYlpwNnlqdlN6eVF0TlJUZDlsZno3a0xBYXE3cU1HZWVDc1pJ?=
 =?utf-8?B?L29HSHExTjR5dDVubWdyUGxJWUVCS2xzeVpGM0VxaGM2MmV1Mnh6a2lSOXBw?=
 =?utf-8?B?cXczOE13WktiQWpDWXJlSmRzOG8yRGI5MFdsemNHY2xrUTRlVWRqM2RRSGN2?=
 =?utf-8?B?MGFxNlJQQjRYQjZCaCtKcjZTZXY3bS9mdmh5S1FMaUs5VXRORDNlUGFaNlV0?=
 =?utf-8?B?MXhmK1k5cS9CaVZuY0pta2dUMGJ0czBMNVRRUE1LY2R4YmlESS9LL1VUalVE?=
 =?utf-8?B?SU5XRERIMnRuUkdsM1pmTUNiK2dhZHlsemFtc2FnV0ZSVnF1TmpJalRvQXhj?=
 =?utf-8?B?c2p5Ti9WLytNR2ZTSzRCVWpwWUhwbDBQY3ZIdGhRbDF3NEw2djZGeW9obDFH?=
 =?utf-8?B?WUV5eStIS3AxNWo2ZFZCYmZZU1RqRHhkNnJrYWROd2JDS0l2Z0NEV00rRmQ5?=
 =?utf-8?B?VENVV2ZKWXZMQWNjbFNNWnpDcE94ZHZPVEhLQW9GMXY1SXp0MFVFblFwbXFw?=
 =?utf-8?B?amVvM3BBa01qZUYyWWo5dnpyYm9ybGdtWEtlWDRpUjQrMVdJRGRSREVpVHNK?=
 =?utf-8?B?dXVRWVBIZ2IzTzVJUm9yRFBYUWIrMjVIR29NV1hWYU5mN0NaSlozc3pPMEQ3?=
 =?utf-8?B?Vy9XMkxyc0lPUjBScmQ5ZDZIYWxDZnNHVk85NngrY3lUSW5EVVJNaTM0enVx?=
 =?utf-8?B?dkhBa1AzNFpjc1ZwaGNYb0crTDdWS0RSdnVxRSsyQXNGOEJhMmtYVHZKV2d6?=
 =?utf-8?B?TlVTeVVBTTM5d3ZtNEdYb1oxZ2xPOFZpa3JiWHBUbnRTV2ZmQ0xhRDBVaDFR?=
 =?utf-8?B?aUE1ZlFkaS9YVG80NXVPa1NJOXhQL2Z4dzVIZGNaUGJ1ZTRSV3lwTzJsZURK?=
 =?utf-8?B?cjZiTE14dXBjM1hleFJ5bDBiaHl0OEh0VkR5dEFvcnRvTlQvWW1nNEkyUnV5?=
 =?utf-8?B?Q0hSdnZ5UEdHOXZxMXJjSU8yYXI5T1NnVXA3VmhiRWMweUdnSGpLQW1UN2Zk?=
 =?utf-8?B?YXZtUHVqeGZpN3ZuQnlFK2ZRTHQwaktpNzBRR0h5RStPWVh2cUgrbWRManFK?=
 =?utf-8?B?YmMwWGVJNU9zbEphUUhNS2s1RjJUS3FsOVZVL1dQV09FdnAyZlN5SWcxRWtG?=
 =?utf-8?B?Vnh0dSt2L1FYcCtXVlRWK1lDOTJhc3A0VGE0V2NhRnhlTHB2S3BWVHI1T0Zm?=
 =?utf-8?B?M2dzVEVpQVBCcHVXU0s2MTlmS1U1SGhZYUlpMXQ0cFNvampNdm1CY0hnMlYx?=
 =?utf-8?B?UE1OR1Qya3lwdGN3bTVMc042OUVLVnNWS0laa3lPYU04cEVFZXBDSEx4ODRa?=
 =?utf-8?B?S3BlWGFkTkNrTVNjMmsxQXNvMmJxWVhLWlNtVTZWSHo3TXdMdW5FTVlZTjNx?=
 =?utf-8?B?bks3Y3JrcGxremdQbWhnemZnMVBoZVQ3VG84WGwrYkQreTQ2NG9yVmtQeUJ0?=
 =?utf-8?B?bnc3VDhBR3NXZ3AxUVZWUmFEa2Y1RmVwUDdjNzBJenMrTlZOdGNpbndZMzdX?=
 =?utf-8?B?a2w3UXUwa3BEMkd6dm9IVUR0VVhkYVprVk41WnNZWGhQVjFhd1ZTbzdlTUJj?=
 =?utf-8?B?bHkxQWZ0ZmVVZmhNbEgyOUJ5VjVjM1U0bEQwYllGRmxtVXhGWlpKbHJYUzFF?=
 =?utf-8?B?U1MwMkZacFc3cjE5TWVDdHBVTkkxU0NMQXpJMFNlOE5WN0I3TUdySVlvbkFh?=
 =?utf-8?B?NU0xMUVvQ0N6czZEM0RIQ1pLZzA2dDlacVRGMkFNR2Z6NVYvRW5xaFVHZ0tz?=
 =?utf-8?B?SjFDaldnM1kvMHlxSzZCWHVza2dsbktEM01zQU53Y3ZvcnRTRzB6SEEvZEll?=
 =?utf-8?B?eVlXV2ErUkRsYi8wVnptZWI1L2NmZEJxZisrUjBGSTRoSGFRL2VLVXRNWkNI?=
 =?utf-8?B?ZlkrWUF4Uk5sZUowNDh0WW1YN2FjM2RhdFh2TkxYeFF5MHZoVHNEaDdiN3Nz?=
 =?utf-8?B?cS9hVzgvd0hzcU1nSXVHUXpMWkViTm8vdkFWRU9CUFB5RTd1djlzUFk1L1kx?=
 =?utf-8?B?OGNROGtteDZoYzB1SEhOTkZZdk90MGg2TEZtcmx2UmFlaUhOaHRHYk5Idnd1?=
 =?utf-8?B?RWlsMHNHaTVjUmRKOEljNGlyNVQ1WXlqbkZqQi92UzlsWU1oU2Q5bFo4UWxP?=
 =?utf-8?B?UDhFMFljcXNqaGUrUmRINXVxc2FubmR2d3FYKzBTQTZrL29KMFhxaW1QbVZG?=
 =?utf-8?B?dnc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc265b26-524b-4a45-d76e-08ddce8f259f
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 11:00:36.5595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 41QsKTuJ6E5VYiMS1Lxb41pZSpiL9L9prEg0ZyktJ4UnncaEdl1dGIwod5XBbfhvmNNMuzJS2XTeqpzZBX83Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7283


On 29/07/2025 10:50, Romain Gantois wrote:
> The logic in regulator_set_voltage() which checks for a non-convergence
> condition on a stepped regulator is flawed.
> 
> regulator_set_voltage() checks if the error in target voltage has increased
> or decreased, and returns -EWOULDBLOCK if the error has not decreased
> enough. The correct non-convergence condition is:
> 
> new_delta - delta > -rdev->constraints->max_uV_step
> 
> or equivalently:
> 
> delta - new_delta < rdev->constraints->max_uV_step
> 
> But the currently used condition is:
> 
> new_delta - delta > rdev->constraints->max_uV_step
> 
> Which may cause an infinite loop if the voltage error doesn't converge.
> 
> Fix this by correcting the convergence condition.
> 
> Suggested-by: Jon Hunter <jonathanh@nvidia.com>
> Fixes: d511206dc7443 ("regulator: core: repeat voltage setting request for stepped regulators")
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
> ---
>   drivers/regulator/core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
> index 8ed9b96518cf5186c0db147a6895a92bc59fae4e..554d83c4af0c1c98edb43b60dbfacb8844d5e1eb 100644
> --- a/drivers/regulator/core.c
> +++ b/drivers/regulator/core.c
> @@ -3884,7 +3884,7 @@ static int regulator_set_voltage_unlocked(struct regulator *regulator,
>   			new_delta = ret;
>   
>   			/* check that voltage is converging quickly enough */
> -			if (new_delta - delta > rdev->constraints->max_uV_step) {
> +			if (delta - new_delta < rdev->constraints->max_uV_step) {
>   				ret = -EWOULDBLOCK;
>   				goto out;
>   			}


Thanks for the quick fix!

Tested-by: Jon Hunter <jonathanh@nvidia.com>
Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Jon

-- 
nvpublic

