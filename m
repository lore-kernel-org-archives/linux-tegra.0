Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012063.outbound.protection.outlook.com [40.93.195.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BA5229B1F;
	Fri, 23 Jan 2026 14:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769178610; cv=fail; b=Jlho3ew0iAsvQlTdFV1Mjdu7PXjC0K4HJKKIk5B6dvyvDPVIENcFhlDsJ5ci4uiyKzjE42kOPflkw7H8pSHFeXpDfc1OhMkWjaG4IOJPWTMr1aFZnQ+D06gjssbvKIPE5Oeym8+/c9eljCVzwgkvaC0mzZXqBP1KtYn+DADspck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769178610; c=relaxed/simple;
	bh=Z88lhniwcUwNHakwZ+zHeAn+i6E1qk0YsvHw1DTCypw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CnnTL2rwPcOYsk1u89WCFz5LCdKaeAoyDMi1RYrvlfAtR7OurfKEPtBNc4f+58atdDM0XHilXOnKHDu9Ovs4qqiZ3D2B4GtXt1SmOr8wNkuzsHQpBj9oeIDP8BkJlxA3JF41RQe/r1wPfUO/gtGKPmX7cGmYMRahrnsBj1uDf7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FvHUIt98; arc=fail smtp.client-ip=40.93.195.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FvHUIt98"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M9kA3hkqIH0wVdHuYansMCWt9u+VsGMQ8xDNXln4IizhaIVQeLjt6yspadAPL99Xf4ZtJzrUZmpAhz2wtFIlnwdEktamR6zkRZg2kgN0+ho85FH4p9y/Q4Uav8R2dNRXxXmNx4IZDOFE/IXTPp1xHI+Z0mdk0JopRu3nOloj6Ho10WnsUjDrRm8cFs3z6OmpjNK1YU12WxCssBLS2QUCUXYBqizjvVKxSwRoixImkZ1i7WB2a0smyHbmYMXgI40OtifJTaEWchcn6vQrh+R92GbmO6qgvkrMxT/yVzJvZZOnx5LJ2qWKWnjQm6wuMV4bB40rDkcjohT6udSxbN/HZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GQEPVZGlnq+SrG9oTynF4kd9IKi3hFXd1Jw/TSqXPeo=;
 b=gGkPaQqYcji/QwCjOm2rEbwlNByrquMGgHdWOyu0Fq8HTDdW4Rdpaheghrv/KYDBJHUBQM+HYOKUC0ajia706DEoEb/vbK5ltvuTXR9+HtdnwIduDGfMsrM1nauJ90ONRUnEcj0/CUxYziIiwiQqG3sGcrweFMgV0s4I9BEUjs+E3CiivzQnCZjSonNCZsBOc3rkpMCP/boJHPy0871CldU+8d6/MCxz7I5IziishrfYn1HEpkFoIuwkQsVfRJ38PX65GBv0WnMJMpeyNEAu8F9COQjz4fEAAgcm2gXmT9GcZT7FfPb/Bd1hZfi4vGjAHz1giqkB8RIeuRJZj59k6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GQEPVZGlnq+SrG9oTynF4kd9IKi3hFXd1Jw/TSqXPeo=;
 b=FvHUIt985NtG5rsvSJ6bVtaRw0VMldQfc2C3+cfelhkQOIEHXNUvfRCicfYjvKp7KlRlF2xOrNXUpQQX5gOeOsiyzSRoIBHIbsueRgwBNAyJcpVv6Kvf+FPPUqOllm06iA/1xIbT3yB5EkyF7yMDIjt4LEGjJNJGnaCSeKCL5/Az+A7yMCsgbHZdSeHxWUdwbJMDNLwEJQzoeX2ayTsMyPzmZkhfQzkzQoMvUultfZYo7dgAc6oFtGCDS5LTT42ApSpkmr3VLht864e7nBB5gQ/fXIW5Oc7SvqPJ5Lu0hoZSHcmiAQcy/mEiYgjphaA0NrYsNmDH3IJU2YSK2XxTMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by PH7PR12MB6539.namprd12.prod.outlook.com (2603:10b6:510:1f0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 14:30:00 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 14:30:00 +0000
Message-ID: <b3b0635c-657f-4869-bc88-06de9287a464@nvidia.com>
Date: Fri, 23 Jan 2026 14:29:57 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] driver core: enforce device_lock for
 driver_match_device()
To: Danilo Krummrich <dakr@kernel.org>
Cc: Gui-Dong Han <hanguidong02@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Mark Brown
 <broonie@kernel.org>, gregkh@linuxfoundation.org, rafael@kernel.org,
 linux-kernel@vger.kernel.org, baijiaju1990@gmail.com,
 Qiu-ji Chen <chenqiuji666@gmail.com>, Aishwarya.TCV@arm.com,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20260113162843.12712-1-hanguidong02@gmail.com>
 <7ae38e31-ef31-43ad-9106-7c76ea0e8596@sirena.org.uk>
 <CGME20260120152328eucas1p1024a7488ae10b8b7f2fcb74baee24c75@eucas1p1.samsung.com>
 <ef37ed64-24ad-4b82-bc6c-d3bc72aaf232@samsung.com>
 <e32b0819-2c29-4c83-83d5-e28dc4b2b01f@nvidia.com>
 <DFULF717AOGG.GY8B9ET26KND@kernel.org>
 <f10007af-3629-4769-b89c-bbf4aa013bf3@nvidia.com>
 <CALbr=LaE=nS30uMmm_spywEHPYgC_w9qb9L1wFvwBe=PDae1Mw@mail.gmail.com>
 <DFVBKRQ35CC0.95P329BK5KZA@kernel.org>
 <956d5d23-6a62-4dba-9c98-83457526f9b6@nvidia.com>
 <DFVDC5NWTOT4.NA2H05V84CWD@kernel.org>
 <2b7109c2-2275-4a38-a52f-f4f901a6d182@nvidia.com>
 <DFW11G0SNME0.3G28YPXH64DOT@kernel.org>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <DFW11G0SNME0.3G28YPXH64DOT@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0050.namprd03.prod.outlook.com
 (2603:10b6:610:b3::25) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|PH7PR12MB6539:EE_
X-MS-Office365-Filtering-Correlation-Id: 749cbdbd-e467-4d40-bae6-08de5a8be3f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZDN6b0g0Qzl1NGVCNFNiSlZCaEMveTFIMzk5MzBNSEtmV25FU05LdCtUWk5t?=
 =?utf-8?B?WVJLVTNyNXpGdEJ6dkFRWkNRU1dKQVluVkxqTGUyQmpvNHl3THAwcExqN2Zn?=
 =?utf-8?B?aUdZSDNFazBEWmJMQzRxYXFQcGNwWXMvNDJSQ2cyYVIwMmtqQTA5MkE3WEpo?=
 =?utf-8?B?djc3MTNyRUE1R0p2U0pTMU1PbnVjUnJ6YTNEa25UZXJTaHJWMVpaQldsRGFX?=
 =?utf-8?B?ZmZ3VU9YUDdUK3pGWnljUnpzeC9Tb2VyV2dwb3dUSlZCbGNsZmZPYmUrME1U?=
 =?utf-8?B?bnYzQW1oM1NCOHdUYWxWcjdRWUowTmdKSUdUK1RMdHJ2NW5Yd2trNk9KcjQ2?=
 =?utf-8?B?d0FzZ3BHd1ZmMWJ4QXA2cm1uK01sMGFrSnZaYXVuNWZlT3ZQZ2ZYeHV6S2Vk?=
 =?utf-8?B?N0hwRDRPRW5hQm9mRzhZQUtPaG5EQTlTbmxaSGpCSUxSbkkxWGJ3ZWs4MVJz?=
 =?utf-8?B?Qy9majV5TVRDRXlPM2JNbVZlRlBYeGpicmJETE0waFFzVGVwMC9UWUhSWStj?=
 =?utf-8?B?U1JKeDlzaXJOZXlRQzByWFR4N0lCbXhFd3hsOTFTbGFMTEo3Mm9IMkxKOHBM?=
 =?utf-8?B?VTJuenhXdE9mam9ZNnhUeDNzMjVqTVM3N0dGODN4T1V2SUJIS3BvZzlmQ0Zk?=
 =?utf-8?B?SlpyMktPYVdESjNITkRJLy8xbTkzbWtiZ1NOdW1razFvKzRwSy8wOXJocHUz?=
 =?utf-8?B?eUV3TDBiQmIveU1FSzFvWkpDSGwyWCsxYWVaM2VBTTh3Mi9uNWNVaDRxVVdi?=
 =?utf-8?B?Rlg2YXBJT08rd1lMZng3eW5sMEs1TEY3dzRabFFscXEzbGtFd3lpOTVqcWps?=
 =?utf-8?B?bVFHZFk5VjZkVEhsOGtKMVp1S1gxMTBVUFhJdWlZR1hOejQzc0VtVmJuZVZ0?=
 =?utf-8?B?NXJrU2VJT1BodHFYdEZ4b2ZJL2J2SmxjUG1URk45YVVMZkoyckl0Uno3NGM1?=
 =?utf-8?B?cWs4V0NMeFRONVlMWG16Y3M3K2dhZDBBcElJSDdpWGorWkU5TGtiSjIrTm9M?=
 =?utf-8?B?aTBHc3BNODV6TFVRSDhwSkNZUGxMbE9NcHRjalU5aUJzMzF6MVE4NmxpQlZF?=
 =?utf-8?B?WXYrS29COU5RVkJlZ043NjBpSkl0RlNBbFUzalBOSmZtaWZwcXhtUFhrdzE0?=
 =?utf-8?B?VmFnM3diT0Nyd3EwcHROM25lcjBkVStTUWdpenN2NWVZeGhzSzBqcFoyRGk2?=
 =?utf-8?B?bWg5WnV3TG5CdEFVd2E1blVTK1pSaXpWUWlMNHFubXlXdDFZWnFKQUpWK1Mr?=
 =?utf-8?B?bnVtM0xQVnJtOXlRdkJNWS94TDB6WmxFVjE3aTJsdXN6WmNIbkpSMVpTSjhs?=
 =?utf-8?B?bnVPcGtnejBFeDdlY1VVMjdBWGtUNWdBaHc3VkVGVitKR09zdGdMMWhBNWlZ?=
 =?utf-8?B?dDVkbDdmOTlWYkM1SDJFS0diM1BIQ1J2clc3aEs5cVRRamx2VEkwQ1RFN2RM?=
 =?utf-8?B?cUFtRmlrcUhRS3NWVCtWUkNmWHRUN3VpdVpLMERNcE9NZlNWNGFtUjVkak1w?=
 =?utf-8?B?RjgrSy9QRGxFbytLQkFRLzNhU1dYbHZLa2tTWDNHZzRFRllkUWRjam9pRWNu?=
 =?utf-8?B?ME1HMUJPc0N0YkJUa2FRYmh4L09GWXRuM1VVNFdldWNCcElDdmo0TXE0bnNt?=
 =?utf-8?B?R2RQTnhaQmlBdHRxT3lGUnZ5eTMzYlBEbXF5QXVJeHNrVkdkUnlXVWpvTWUr?=
 =?utf-8?B?cHMvMG84TDZHNjI3UEpqbWt5b2x3cmpTOEU5V04xY1JtYXFhM2RwMnRzRjNT?=
 =?utf-8?B?bnNYMFh2aVlDK0tNYm9oMzRMdjJDZUZtTGs3Q0s0VFFseXBQWTVROVE4RXBU?=
 =?utf-8?B?czJwMndBQ0ZPQjV5Qk8zTGNHZEo5c3V3ekpsQ3lpMjhkSWF0NElXeldtRGM4?=
 =?utf-8?B?dmhwRVMxSUlwdm0wWlFpSjJKRVYycDNXcVVQTmRLdmFsZzliejRoTTZwK0F4?=
 =?utf-8?B?Ym1kNDVPZUp2bzg2YWluV3M4QSt2d2J0amVycElMcUNsWng2MnV0ZW5JSTBt?=
 =?utf-8?B?Z0w5YVFyWWpKdXpDb1BjZEhtdkIva2pSL1RjMnV3RU43ZVFYTW5rU3lhT2JW?=
 =?utf-8?B?eS9iZ3hhbXYzdTIyQ2pMRW5TdlNwclVaK0NqZjFqNFhucGp1MStNTjNDZmlH?=
 =?utf-8?Q?OZIJHw5ksy4t+H0JXnKljk5K0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YjBzaXZMaVBDcTkyL1lGTkE5Q3c0ekFSdUJuekJvbGE2TTVyRGpMeTZSamhT?=
 =?utf-8?B?clpUbnhlcUhBTzlNaWtzWlBkZ3Q0VzhLMlEvWmliNEswMzdxbE9pbDlOMnZi?=
 =?utf-8?B?V2o4bkJtQnU2OVRHdXFPcVU5V0pJTy9nb0lmWVZWK3ZqN25OR2FrN0xiRUl1?=
 =?utf-8?B?aFlmMnZjSVJuand4eU5zdDRTZDlTWnh5Mmo3cGdrclh1dlVqRFJ6VFAvVlNo?=
 =?utf-8?B?VnRJUjBDRng3bTdMZjNtdFhQUW9lTk5sZVpHdXJnSFdtd2ZPbDRuK3lNYWtY?=
 =?utf-8?B?cldVemhKdlhuZEpvR0VkOURieEJQVUhzVVU4b1pxdkVheTh6NnAxMkY1b01F?=
 =?utf-8?B?ZzA4TXpNN0ZpNmV5eE5lZ0ZLbTFBKzVEOUVmb2N2Y3Yya0ZKY3RJdUh0M2dr?=
 =?utf-8?B?UzNUTElxTWJIcUd1NDJJQUlKSWxVVEUzWGxVUXZwbFBvQ0FsUENZT09aZXNH?=
 =?utf-8?B?d2htYmU1cVUvR25jNWRXb1lzUkphcFFqTlZLVjhHVUdaY2ZsZ3kwRExvdTJs?=
 =?utf-8?B?SGZRZTJMcFhwTnNJVzNSMGx1NTJUL0lUcWl4TUxka0daaVpTS2FtNDZnMVls?=
 =?utf-8?B?cFdSR2JrV1p6dUVOTFgrbHNqVDNpRTRaRVRvcEV3cVgyalZxU3FRVHMrUlM5?=
 =?utf-8?B?aGlnUUZZTzM3ZTJtaStaRngyRElWUWF1WVJEbkd5dVE2eTNVOFYzSnM0S3ZY?=
 =?utf-8?B?Tmo1c29DdysrUWY1VkU4amFOSFlzd0ZTeVFIQngrTzVBMnpoYStvY1R6QUZ5?=
 =?utf-8?B?ZitvemxpRlFqNmlKVnhyL0xQZTVReCtvemhUdDZwcGFSVHE5T0RQOCtZL2xP?=
 =?utf-8?B?d0xwTHNyZ0lMT1RRNk9uUTNUWDl2QXcvME1ScC9BQ3paTlRhcEUwcU5LVjVk?=
 =?utf-8?B?bXVCaHpxTUlSa1d1OFBwSDZoc3ZWMThuUEwrZ01Ec2d5UUgyWFdub09aQXhP?=
 =?utf-8?B?OCthT0UzdnpTeUMrRlJrVG53Q1dFU3U1b2liZjBieVlLOWlYejZZRnNZZXly?=
 =?utf-8?B?bVZ5L0F5Q2FDMVhrTVhxWThUenlVb1ZRNlczUDFCRVBWM0pkMlVjc3RGdW9B?=
 =?utf-8?B?RDc4eUN5SlFSc1FkRFoyOHFYMGt5WjB1VkRjYUdsNkVDdXlRZzVEejR4Ykt6?=
 =?utf-8?B?eTZmRkJQdHEybWhuYlVaZndMaXlzTVpCM2tZRitDUEFQWW83aisyb3RFS3Jp?=
 =?utf-8?B?aFZKVVRZcnZLZ3k4OU5TcXlXUGQrTGJjcFU0Z0Vsc2N6Y3BJaUlGNllTZDhY?=
 =?utf-8?B?QlV0MFNnb2dBWkZtcS9yb3hnYkZudVd5bkVNbStRMTZXU01ScklUYm5pY2xB?=
 =?utf-8?B?VHgzTmdoQk1RdEpOQUtkV2d4WEpmR2VmQ09sYUplR3Q5Q0xXbkQrWndMN1Bp?=
 =?utf-8?B?SmwzVFd3QjJaVk9FUTZXKy9FZVp4bUNacUJRQ2dHbWZOTjNnaXNVTzU5RDFR?=
 =?utf-8?B?RUEybGNkc2xzTWFGaUxHY0tRNkZJMEx6UnNsbkJNQXJtTDkxc2gyeUxoZ3Nu?=
 =?utf-8?B?Zjh3WlRhY3VCdHhtTEVZeHpWS1krNkF3OXRyYW94NkU5UjFFVUdIWDl1UTJh?=
 =?utf-8?B?UFdYK0xJcUJINlRhczZUV21GeVJEZUNsZWFGY1RocEZsOEg0UFpjQ3h1dE9E?=
 =?utf-8?B?amdGellqeVl2UEFlNmtWUGRGbnVRcXBjSmhOdEVCZGNmSWxKRCsycW1kaURT?=
 =?utf-8?B?ZExKYnVmRWtIeU0zTDcveEhneGhEbUFrNjY4UDQ0UXZObkQ1R1kxSEhkcGVV?=
 =?utf-8?B?QUNvblh5OURScFdtZkxicWI3R3BSeS8yejBlZUlXN0hrNmc2Q1djV29ZdXU2?=
 =?utf-8?B?dzg1UmJTV3VTeDYxRkdsNU40eUJXMW9uQjRnVnd1aXhKTlA2OWJjZnZjdzFp?=
 =?utf-8?B?U0RCbENvWHZFTGlwcjBMMEJlOGd0SmRWeWhDUjZCbW1GQStsUHBsenFKOEFo?=
 =?utf-8?B?OVhuQlE5Y1dTZDF1bUwyZXo2TVVYZjI1WU9Lc1VQL0orSGhFQmxYWlgweW91?=
 =?utf-8?B?Qm5PSk51TnJVNjhORm92Qms0bUxLQWpHaDRreE8zQjU3cGlHZ2o1ZnBJc3N1?=
 =?utf-8?B?ZFpEeUs3N3RTOGRCa3h0Y2FORjVianZpWDIrNXgrejZncGs1emI5RENaek1N?=
 =?utf-8?B?RVY4R2V3L3pxWlg2aHNGRlRLVGFqSmNpeVlDNnFLK1E5UC9palZhY0VWMVhL?=
 =?utf-8?B?WGw0U2QycVc4MEtFM2JlS050aGE5ZTBCdWdLdGFzUHlmMTJqTEJObTBkVDhH?=
 =?utf-8?B?OEZicGNrL2Y5SmJzQkV0aVlWWFRGMDJTQmN0RmZ6YmJHRkpLZ2tsRGlTRzd3?=
 =?utf-8?B?Y3RhZjZUcU0vWEwvaXpKQjlyUnNKcnVwSGdBeWFsNkpTdlZldVUwcGdOV0li?=
 =?utf-8?Q?cnPq68vWeEWqgYHd4OYyANFurX7Qd7H6iiHoW+Vf5TUNJ?=
X-MS-Exchange-AntiSpam-MessageData-1: dJq8wyfJcHDe6A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 749cbdbd-e467-4d40-bae6-08de5a8be3f0
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 14:30:00.5744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EmAO1F5jl79tFAFwJ5l65UmfgxKx2RxcBtc7VClVHItJDdkt2/ePhpKyvyz68FnIz9nJOQhxWNY7kJoL9Qe2/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6539


On 23/01/2026 14:09, Danilo Krummrich wrote:
> On Fri Jan 23, 2026 at 2:57 PM CET, Jon Hunter wrote:
>> No worries. There appears to be a couple issues going on with this
>> board. With the patch reverted the board boots fine and tests pass. Even
>> in the passing case with this patch reverted, during boot I see a NULL
>> pointer deference crash log from the QSPI driver. So I disabled the QSPI
>> device in device-tree and with this patch the board boots fine and tests
>> pass.
>>
>> There is a on-going thread for the QSPI driver to fix these NULL pointer
>> deference crashes [0]. So the QSPI driver seems to be the root of the
>> problem.
>>
>> [0] https://lore.kernel.org/linux-tegra/aXJWRUhAe8F67-zG@gmail.com/T/#t
> 
> So, are you saying the problems you are seeing are unrelated to this patch and
> there is no deadlock? (At least this would explain why we couldn't get a lockdep
> splat with the diff I shared. :)

Not exactly. With vanilla -next I see various tests fail on this board 
and I can see various devices are not probed as expected. Bisect pointed 
to this patch.

I can fix this by either:

1. Reverting this patch.
2. Disabling the QSPI driver.

Now the QSPI driver has issues which need to be fixed which I am 
wondering once fix will avoid this problem.

However, I guess regardless of the QSPI issue, should this patch be 
having such an impact?

Looking at the bootlog [0], you can see the crash is occurring during 
the tegra_qspi_probe() and so I am guessing this what leads to the 
deadlock? And may be there is no way to avoid that?

Please note that a lot of the boards I test are in a farm and I don't 
have direct access. So although I can see the test harness SSH'ing into 
the board, I am not accessing directly. However, we can run whatever 
tests we want.

There are no OOT drivers being used this is just vanilla -next.

Jon

[0] https://pastebin.com/wJheruPP

-- 
nvpublic

