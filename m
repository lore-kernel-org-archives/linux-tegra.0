Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2077.outbound.protection.outlook.com [40.107.237.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A24A22F75D;
	Fri,  2 May 2025 10:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746180989; cv=fail; b=D5pJP4o1OjX++/3EvhszuxPl590bcbWot75AZtH7wJN5zzFOEsmQKdSBFjRJBybd1acpx/dlpejVWIdmx1Mxi3mUQpUPzxGbJFbWwXwFaI9RUYRpAKlN40D8dDQuO5EUS22Q0NoW9zgzt3rvtM59b5tp1SurL4G731ncns4G0ZI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746180989; c=relaxed/simple;
	bh=zPuJ14wsxK87vrgePtztwBN/nNVJMFlnegb+IhySpL8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=R1h3NBOhqjoRkUoFwBNd987UkmdHUDL7HzWDdvDaDTHVUONyq1scWDdqZHsJXjzAP9WRqp2DL742AO62iLAQpfzIJMcuLfASNdFx+Ej2I+tTfhGaTxLLE3TNLa+4pIs6KWHFd4vvZd0B7vN6IrzWH0Tk+Nj+ekAAIUs5tsT86C4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=U4FNWVLU; arc=fail smtp.client-ip=40.107.237.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="U4FNWVLU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WsBOwlzvLFvJjjYQhTQcN3FDcsk7BfVVzlrjleCwrPlz86/6bwumGnN5W9ll+BJSNiKnBi8TqijLRReQmdSFNXieTDgcNZs7VKzHFqYLVZvb0MsFuhw5qSKWJvsX7kMJrD1qrv9HTTUZRMI4zYPSO4wJmwIeDlPVTZJUayQcqUXia9fr+0nppenI5w/WOZClVeVwZ2eXOS9DVjc2i5gHFgPbCNvyojZR1DsnxUjsVf4rl/w+k44xm1TdxlTAeeFJNPGh79SpeCi9OG0NVuG9BhoHxRZN70Ugo4rr6FdQErGB37pLYvU4KQ1zQUPkZe/iU4UbauAP7o4BvOY9QlQsbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Zud4Gw4jJQ5QxEwE+ayDCqr/pqwOu7t0xxeo50lLPo=;
 b=TllWg7gGKleqOlIvEJ52i0IUpdRJjXCMaL2ZnFmJNScAgBP/lS8PpDHq8SEMr1lzwhT6oMxpbYBu6mML6Uba6d7PgemRb/9NzQ73xCjRsPPxAl3DskDPUjR9zE4xEXWc27iy1pjsGE9e0BHmHkcywOl4XbNDVCvM2SZPNJVzgOPf+g8O4qPz4LhyoYIs0d3OpXkJjVc6ZEkA+EMZGjH4pAiWfH1nVDiKuOwkXlPjU0//X6kGugr4i6zIFjn8DSpR62/b4PSZFd0lVhNSPwbKNTk3Imhy5IU2cy3UrQkxD2WyYHFNi4wg9aFEFW5185/7lv0ATxUhtoOJSVjinNdCKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Zud4Gw4jJQ5QxEwE+ayDCqr/pqwOu7t0xxeo50lLPo=;
 b=U4FNWVLU8BGlphFRLcEacC8wDQGHjtY6n4Bhpr68pMwo+7kW8fkcmC5rdI5G6do6BhG5STIRHqKMfeIxUdUv+2zv3dwEzv6Id2k92pp4ZcUnNqx2dvC91cUFt2r1GqXAzsIjLZ1O0kj1YhMrCVRrk2M05vRK8YzD3zZPPfLrSZD/5syr8IT9gbbID4xV1TgoDBUSGs8ibiSTza8sYGSwhaG11c7MUaS4jkbEyxIhkOE94WISQ/ACQkZ2ozDAdYJYRk5hMJDnQRy5/lLClm3NcwYwvJrhNdo4ibT5THCRmmvIgf9cCGihWg94dTSIoorszY/xtvuIp6oH/r9C3FlWKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by PH8PR12MB7423.namprd12.prod.outlook.com (2603:10b6:510:229::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Fri, 2 May
 2025 10:16:23 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%3]) with mapi id 15.20.8699.022; Fri, 2 May 2025
 10:16:22 +0000
Message-ID: <af0e0ab4-89d5-4f77-86c7-90d2bc3e13dd@nvidia.com>
Date: Fri, 2 May 2025 11:16:17 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/3] clocksource/drivers/timer-tegra186: add
 WDIOC_GETTIMELEFT support
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Robert Lin <robelin@nvidia.com>
Cc: thierry.reding@gmail.com, tglx@linutronix.de, pohsuns@nvidia.com,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, sumitg@nvidia.com
References: <20250502043727.396896-1-robelin@nvidia.com>
 <20250502043727.396896-2-robelin@nvidia.com>
 <aBSOJTlQUUnFIEVr@mai.linaro.org>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <aBSOJTlQUUnFIEVr@mai.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0104.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::19) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|PH8PR12MB7423:EE_
X-MS-Office365-Filtering-Correlation-Id: c6fb1367-74a7-45df-ea4d-08dd8962631f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZHJId0Y4Z1hrVlFkc1YxWlR6M1lXVGVHK0NteWlUR2hlRklPdnZSRnhsYTN0?=
 =?utf-8?B?TjhRcWc4MlR5ZFZNRXhBS1JZVGF1UFhoalNVYWg5c0JEVU12cS9sZ0libllw?=
 =?utf-8?B?MDlvclQvWmV6RXErVzlIaVVsNzc2dzR1RnMvNlJSZG1Id0duWlZsbzNTOGFI?=
 =?utf-8?B?V3JkN0YyVHhodW44UGVnSWZkdHRBKzE2S3dlOGVHbFBNWXJwZ0wxR25sTFVx?=
 =?utf-8?B?dGhGZm9mdWZ4RFdXTzFFby9lWTFKdEo0YmVHbTg3V1FrRVZTSytRZWhOTzJz?=
 =?utf-8?B?SC9IdEFBR3htZWVZaUNzRm0xT3RXTFNyOG1nenRSZVdMeXJkS0RUdG9XbnlQ?=
 =?utf-8?B?SFp1U1pCREtMdUswS1NsUFVDR05jaVF3K1FkRlA4OHlETGo0MEtiYnRJN1VT?=
 =?utf-8?B?QkVVQmpVdlErSHBjTWtrVUlBRjI4NVlXWTFFeFV1WUFTOFdQZEV6VU1CUnRn?=
 =?utf-8?B?dlk1SVFmcDR4eEtlbG1kZEpxZUtDR2lwTmpaZ2pwb3EyNk13NHNHbnJlUWZk?=
 =?utf-8?B?RzlVSlRhbU41cTgwaURMOUZCTU81VlpFWG5oc2NrTlN0cWE5VXlyaGdjek5q?=
 =?utf-8?B?TktpZ05SS0s0RXVrWjZpOVU1Ylo1WHcvUnBzcW1VblgvVG9BVlRHNCtnL010?=
 =?utf-8?B?QWE3MXdEcmMweU1panlOZ3hVc0pSb3phcVc0N3V6ZmhTTU54VWxKa3ZSVUxQ?=
 =?utf-8?B?bzlsT1k2TEdMVU1hNFFPL1BGSldJcTVXQjVIN1YxMjdPeWJlS1R0WmxUaGFj?=
 =?utf-8?B?MThhNHl6VEJJT29SeVJtNFc5ZWYvYlNTVEErWDVIRGUwbFNleHpmL1BXRHln?=
 =?utf-8?B?U0dFbUdQbjRXUmsvVmpRRFRBT2lzUUxNZm5TM1BNZVFZL0lWV3pWbzdHM0tm?=
 =?utf-8?B?cVRzY1Z1SWdSOU1kTHFseFdoNC9LRVBsdkkyWnhuUGlRYlJTaUpWaGpkTWFr?=
 =?utf-8?B?UHY0aStjb1Q0S1BWOVpabk44SXc2ZGtaTEFMR2QyWUJXYUZHdFVOV1FpSGxV?=
 =?utf-8?B?eEQyZ3JoM3o2T0JyUTVudmUrVWdTYnBhSnRsNjZDZENxc0tDMnVGMFh4bkRt?=
 =?utf-8?B?OFBRRzMxMUlLVFdSZGY5Z1FaS0gzMFJUMUlUSUVUVnJNdjhwUmZZUXVZRXkv?=
 =?utf-8?B?dzdLTDNNWjFFa3dBYzQ4M01DOXhhT083WUxQcS9qWE91LytDSXdUTEtCRVJD?=
 =?utf-8?B?ek1NZFg1WURBU2FZUVM5eE41ek42bGtKK2ZvRkFnOGNTNE9YUVNWZUY4OVRT?=
 =?utf-8?B?N0h6M0o0SHF0MUtxVWtPbVVNL05kdE9QYUtyR0hDTVJKaDJIUFJ6M0ZURWYr?=
 =?utf-8?B?UEYvRmxoT3ZHazJMVTlYbG5NMXFGOFFXZkgzenhYRTgrNnNqa1RmbW1kVllW?=
 =?utf-8?B?Z09lbXJHNVF1Z1JoaFVTYU1USi9iZDdpdHdlMkVNNThhOFZwSmI5T0FFM09K?=
 =?utf-8?B?MmEvcUF4dktLaURxRXM4RmtUNVZmVklOeXh0cTZKMkhDcUlIcGJEUnlCblQ2?=
 =?utf-8?B?UmdQYXJOV3ZiQ3NNRVk0SE5MRDhLSGcveTlEUllwekpoTW9xaTNrSEhkejhH?=
 =?utf-8?B?SGNmUWFlY05KN3NJcDl3TDJZcEtOeEZ5UzFJeVpWUklEaGsrWjhNYUpuWkhB?=
 =?utf-8?B?cEF1WkowYVVtQThNSDZITktaVjhBWXYzNThnaUlXZDh3TFVjUVlUSWgyV1lT?=
 =?utf-8?B?NEZSUElDTVRQN2NIMlhzSXA4RWJkUlRTNm0vZCtMK0FROXh0WGluVko1bFNB?=
 =?utf-8?B?STJkeUVQSU1FZDBZWnpHbEhMQWJQMFo2cU1xOEFpeldFWWw0ZmdsTUxoL3du?=
 =?utf-8?B?OURFUkZDMSs0TDdSSmtMSnhTNmNJUzNMWk9aa0pxcXVMMS82elBFZkphY0dK?=
 =?utf-8?B?d2pzU2lSVWVkeEpaSDNvektLK0trQ3B0NVlFRlVHL1RtQ3pITzRqSVhmSitL?=
 =?utf-8?Q?m3NpSe5JzZs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dUxDb1Zwb09qVURYOEJieGxBRkExekUvYjNxdDh1cjdwVzFhNmlvN2wrR0o0?=
 =?utf-8?B?TEtXRWdpQUp4eFVLYUE3RVIrRDRxenNHUFhXSERlWHZzR0h4Q2diSnFZNy83?=
 =?utf-8?B?NVFqa2ZrUkMwaW9OV3FZQlBuazZEdTBGWXF5ejJtRmZ3d3g3SEtYeWd3UlE0?=
 =?utf-8?B?cmZPdHZDYmh3ZHhpS0JucUk1ejlKL2l1Ny9sdGR3NkEwcXZKZWJWQ3Fwb09R?=
 =?utf-8?B?Q3I5ZG9XSEVFbkQ4VDlFTUpGeDczR3JYM3NPRiszbUZKS29lSkJnRWhmakhL?=
 =?utf-8?B?OVFrQ3RKaWsxWk1nWG9reElGWmlpaVRlTUtRQ0R2ZExQWC9ueWpQRWFvYktD?=
 =?utf-8?B?SE9US09qNU5kazFPa01BZFZwTlBjNmhuTFhZbzEzaHBsSUZhdjM5dHVJVm9s?=
 =?utf-8?B?TGI0RXNNWU1YRFdjVjNGWnFsODlPdEc4dW5Hek1UNGNKelJvKytESUhMRnMw?=
 =?utf-8?B?K2tCN28zNG4vb213cjIwTDlNVC9Cankvc1B2TCt0QW9pTnlBQVA3YzMzdTN5?=
 =?utf-8?B?cWdWQUV0WVhuaXNwNWdZMStDNUZLdDdyZFUralNmdy9hMmdGemFtUXRSNEFQ?=
 =?utf-8?B?TlRXNGZUYXRMVyt4K1pZWTdSOEVsTnczSU83S1hHTm1iWHp6SFVMMkZmWnA3?=
 =?utf-8?B?djdLSzIvVlBJaUtaZEJFS1NhYmEvN25mUElPMmNOOE9wWWxuUlRqOXNmc09s?=
 =?utf-8?B?QVlUdGxZaVRMcUhjYUdSNnV3bFhnUDVyUFkxUWpvY21RckZmZ1VBYjQ0RUgx?=
 =?utf-8?B?V1RyWEM2akFZaGpzR1dxYkJMRzEzSy9Wc1BjK2p1MkxEY3Z3aG1OSnlrWURm?=
 =?utf-8?B?dlNmYVBjUnlVbUdKTHM5RTdyUklVWlJzNVJxeE5kVFc4SXJxaXQzK2Y0UnAr?=
 =?utf-8?B?b3o5cDZzTWkwSGxSSWp2S2Fmd0dibWh1WFBnNDNoNmV4R3YybUlsNW9CU1dN?=
 =?utf-8?B?ckNXcGRNWFV6a2xHcDRDV3JDZGJhekpobkc5a0hTSll3STUyaUd6dlFwdUpG?=
 =?utf-8?B?QWVzSWdBck5JeFI4cVlNZ2srUVExcmExTUhPSGZQYUY2RkR3VFpWS2RUcDlU?=
 =?utf-8?B?WWEvWm1UVUNPQkd6U1FNRG1hd21yb0F0STkvZWwxbzc5cGF2cUVsYllpSU1U?=
 =?utf-8?B?M0ZLUCtXZjJySmR2Ymk4WHY3U3NUTnIrYWZxRjRyNXhEV3pDUG0wQk1pUXlQ?=
 =?utf-8?B?MzlOdzBGMjN6a2JocXQxdnhYT0xwWGJrQjhIZEVsSC85SXplK0ZuTzJEYWRR?=
 =?utf-8?B?L282dE9sZDA4bG9SdExYa3RRcDhHejdPS3hiMzZCQmNmWVZ0NzVDdXoraTRL?=
 =?utf-8?B?b2dtRm5OTzVkNUFQUjJLSFRYTzlINGRDVjUxb1VoNWxUa01CRzF6d0NkTjJa?=
 =?utf-8?B?WjExc2M0VXhOM3p1TkYyNVNxWFRSdWdBcnJpTXBhRW1ZQnRIWk8rdXZNT2I0?=
 =?utf-8?B?OVNpWmNENTNaMHVNQ1RYUUNQbTg0ZHR6cE9lQlRNQ1ZFVWZoNDNBaGt5N25t?=
 =?utf-8?B?aWM2VmdnUFZIY0dDZ1U2V29sOG1YNTVNMUhEZ0o2YzkzQlh1Wk5BT3ZibitT?=
 =?utf-8?B?bVo5UmR3TCt2bWNkd3RIMFQxN2N5NU96ZXE5YTh1dnprK1VuMlBzR1E5VEI4?=
 =?utf-8?B?aEhQWXB4NlNkNEk2MVBuVGIzcFJ5NDNVSE1NWHBLZmoyOXVIL3ErWWZPaE1h?=
 =?utf-8?B?QUlNcWVKQmVoc2RQVlRmYnFNTXBOZ1N6N2RLcS84SzY4NmIwZllZM3lMSDRG?=
 =?utf-8?B?OXFYLzZybkZ3bWloZGV5c1JIR1RCamd2NElncWNrcTQ4OVd4UzNXK0lLTW9H?=
 =?utf-8?B?UWtId2JtQ0RvMVNteTRzOXVQUC84ZnY2WUN3NFhPUDBzOUxPSmZ5NFJ2cVU4?=
 =?utf-8?B?cWZEOG0rSkduVTcxeTZYb2VLWDRIRVdxbG5nNWsyVjdkOW1pMnZKakxTUk96?=
 =?utf-8?B?MER6b0trcDliaUo5WVczWU5JKzdRK0VTMzN6bnIzTzlveU9JYVZKVjBHU0Fx?=
 =?utf-8?B?UDdDQW9iamVGZXNLZ0hxN3ZJNmMyendsbWV1UnJERERxdGNhMThSTWgwd2M0?=
 =?utf-8?B?K0lSSVM4QXVyMmluVmRHSjVhbGk5cytIUTIrQ2xMK0NJZGZLK2I2ZTR2dHJv?=
 =?utf-8?B?MWo5NjVzNUxPZUZ2SWZjQmJSZGJ1ZkUxT1RsMEZuVGZ1SW1PcmZwWnFYNjF2?=
 =?utf-8?Q?tn+snf9EqRysxQWPJfNGlEOLIARrJx26v4FXjfy6nfxI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6fb1367-74a7-45df-ea4d-08dd8962631f
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 10:16:22.2076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aOqBck47krcKL5Jz/qx3QWDXAiawpxUtMXEpXiGViamJ5kDTb3SrzUxgoJylXZan00NmXxFM0upihxxMdg/FOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7423



On 02/05/2025 10:19, Daniel Lezcano wrote:
> On Fri, May 02, 2025 at 12:37:25PM +0800, Robert Lin wrote:
>> From: Pohsun Su <pohsuns@nvidia.com>
>>
>> This change adds support for WDIOC_GETTIMELEFT so userspace
>> programs can get the number of seconds before system reset by
>> the watchdog timer via ioctl.
>>
>> Signed-off-by: Pohsun Su <pohsuns@nvidia.com>
>> Signed-off-by: Robert Lin <robelin@nvidia.com>
>> ---
>>   drivers/clocksource/timer-tegra186.c | 64 +++++++++++++++++++++++++++-
>>   1 file changed, 63 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/clocksource/timer-tegra186.c b/drivers/clocksource/timer-tegra186.c
>> index ea742889ee06..8d5698770cbd 100644
>> --- a/drivers/clocksource/timer-tegra186.c
>> +++ b/drivers/clocksource/timer-tegra186.c
>> @@ -1,8 +1,9 @@
>>   // SPDX-License-Identifier: GPL-2.0-only
>>   /*
>> - * Copyright (c) 2019-2020 NVIDIA Corporation. All rights reserved.
>> + * Copyright (c) 2019-2025 NVIDIA Corporation. All rights reserved.
>>    */
>>   
>> +#include <linux/bitfield.h>
>>   #include <linux/clocksource.h>
>>   #include <linux/module.h>
>>   #include <linux/interrupt.h>
>> @@ -30,6 +31,7 @@
>>   
>>   #define TMRSR 0x004
>>   #define  TMRSR_INTR_CLR BIT(30)
>> +#define  TMRSR_PCV GENMASK(28, 0)
>>   
>>   #define TMRCSSR 0x008
>>   #define  TMRCSSR_SRC_USEC (0 << 0)
>> @@ -46,6 +48,9 @@
>>   #define  WDTCR_TIMER_SOURCE_MASK 0xf
>>   #define  WDTCR_TIMER_SOURCE(x) ((x) & 0xf)
>>   
>> +#define WDTSR 0x004
>> +#define  WDTSR_CURRENT_EXPIRATION_COUNT GENMASK(14, 12)
>> +
>>   #define WDTCMDR 0x008
>>   #define  WDTCMDR_DISABLE_COUNTER BIT(1)
>>   #define  WDTCMDR_START_COUNTER BIT(0)
>> @@ -235,12 +240,69 @@ static int tegra186_wdt_set_timeout(struct watchdog_device *wdd,
>>   	return 0;
>>   }
>>   
>> +static unsigned int tegra186_wdt_get_timeleft(struct watchdog_device *wdd)
>> +{
>> +	struct tegra186_wdt *wdt = to_tegra186_wdt(wdd);
>> +	u32 expiration, val;
>> +	u64 timeleft;
>> +
>> +	if (!watchdog_active(&wdt->base)) {
>> +		/* return zero if the watchdog timer is not activated. */
>> +		return 0;
>> +	}
>> +
>> +	/*
>> +	 * Reset occurs on the fifth expiration of the
>> +	 * watchdog timer and so when the watchdog timer is configured,
>> +	 * the actual value programmed into the counter is 1/5 of the
>> +	 * timeout value. Once the counter reaches 0, expiration count
>> +	 * will be increased by 1 and the down counter restarts.
>> +	 * Hence to get the time left before system reset we must
>> +	 * combine 2 parts:
>> +	 * 1. value of the current down counter
>> +	 * 2. (number of counter expirations remaining) * (timeout/5)
>> +	 */
>> +
>> +	/* Get the current number of counter expirations. Should be a
>> +	 * value between 0 and 4
>> +	 */
>> +	val = readl_relaxed(wdt->regs + WDTSR);
>> +	expiration = FIELD_GET(WDTSR_CURRENT_EXPIRATION_COUNT, val);
>> +	if (WARN_ON(expiration > 4))
>> +		return 0;
> 
> Each call will generate a big warning in the message. May be simpler
> to add a pr_err() with an explicit message.

I prefer the WARN. This should never happen. If we do change this, then 
dev_WARN() might be more appropriate, but I think that this is fine too.

> 
>> +	/* Get the current counter value in microsecond. */
>> +	val = readl_relaxed(wdt->tmr->regs + TMRSR);
>> +	timeleft = FIELD_GET(TMRSR_PCV, val);
>> +
>> +	/*
>> +	 * Calculate the time remaining by adding the time for the
>> +	 * counter value to the time of the counter expirations that
>> +	 * remain.
>> +	 */
>> +	timeleft += (((u64)wdt->base.timeout * USEC_PER_SEC) / 5) * (4 - expiration);
>> +
>> +	/*
>> +	 * Convert the current counter value to seconds,
>> +	 * rounding up to the nearest second. Cast u64 to
>> +	 * u32 under the assumption that no overflow happens
>> +	 * when coverting to seconds.
>> +	 */
>> +	timeleft = (timeleft + USEC_PER_SEC / 2) / USEC_PER_SEC;
> 
> Did you check there is a macro fitting the need in math.h ?

I had a quick look, but looking again, I see we can use 
DIV_ROUND_CLOSEST_ULL() here.

> 
>> +	if (WARN_ON(timeleft > U32_MAX))
> 
> s/WARN_ON/pr_err/

Why? Again this is not expected. I think that this is fine.

> 
>> +		return U32_MAX;
>> +
>> +	return lower_32_bits(timeleft);
>> +}
>> +
>>   static const struct watchdog_ops tegra186_wdt_ops = {
>>   	.owner = THIS_MODULE,
>>   	.start = tegra186_wdt_start,
>>   	.stop = tegra186_wdt_stop,
>>   	.ping = tegra186_wdt_ping,
>>   	.set_timeout = tegra186_wdt_set_timeout,
>> +	.get_timeleft = tegra186_wdt_get_timeleft,
>>   };
>>   
>>   static struct tegra186_wdt *tegra186_wdt_create(struct tegra186_timer *tegra,
>> -- 
>> 2.34.1
>>
> 

-- 
nvpublic

