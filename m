Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010006.outbound.protection.outlook.com [52.101.46.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E153E8C5E;
	Wed, 21 Jan 2026 20:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769025664; cv=fail; b=oD+lYcKYMSSaFU+j37/1Wz1ggpmkLaaHuOj2a89UxT4NZE0GYsJcdBEzg43RM02hABjvTqKo4vtdny1Rlwno6rM9je5XyeHEhLkQQJCDFpHYiAVFaRfwo+dwH6JhWReHeGub5Iusc82iJcOyIDBjDlo1c3fB+LndadjE5a6Ik/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769025664; c=relaxed/simple;
	bh=IAELSkc+C8IHRl1EttFQLLaV6iX36HFO+7sgDIlCTuw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Y20jAC8hrYEYGaU7WQ5SB6l77YJb35Y+8hRhSjyUEw2WD1bJIntA9I0Wb6NaQXcLbz4LkEjxRYu6eXrbTuRzpLQjrXq+OVHzm9ZtpkikigeMZa58qs2CQC0NEq2CI+PG1zGSaPqNvkW1nGsUfc0w1UGU5V7xXeYCLEXHQDrYzS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nzMVMbTk; arc=fail smtp.client-ip=52.101.46.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nzMVMbTk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a5cIwkafePJ/IscJRDk8cIAKXGLwOfCbV8I9SjZQcCcI1x2h0Em30UmkoFlTAqJfLcTq7IhE2y5p/aAAEcMQQyM8yJmLqCh2mEu/bU9P4V/Eg3glAF47cdwZAgMhXnALakaIFtOxgB6fQj00VOvPAwJNefvAkTH0umY5kkhFi4znVcSrLHSmg1pAExIAnDefcB3vkI7ISYF4/P+ISjXcphZUIPtBxgGyr58JJSuud+3hSXsmfMP2ht6ZAwRpkhLOBuwf650EpNt5oEHfI9UGDLzqlVZXNhU2PiUbjV9b+8WvMA1fDVU8YLbNg+tMUTPTMQbn5m+gxxGYbo5N+RdFpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mg5ikiNcYGOBBhrNhx0L2RE3nzYh3qsZZKyL3oGqztY=;
 b=Gg31o7YtdGoMAhiJ7M0bqbi4BFWtRuuh4mRfo3Aa9CcoRymCcsn4PrIWOICnn7+wCseioKO8m7bGrFpYA/INvTKXH0NdSB/V98LFlkNbokIJsPE9dc9rBm6NmX9I6uwMsPG8TTP1bhOUnFTUwEaihTRMcqOvVVZVFkZKEdmYRYsO181gPIfZbJ60nT2tQ3X4n1QN941YI7sCrhbD2rxk+Vx5UINKvN3dyYS0XgniybZ8bNng+hxsfHb42uYbcAWM2FAXG2dF41TD0dG5UYOq4kGQei+ClT5rOlv+ooyCpHIRCANjwVmC8vrBrIbtBkaVecoTnMXGkVCWIueno4tI4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mg5ikiNcYGOBBhrNhx0L2RE3nzYh3qsZZKyL3oGqztY=;
 b=nzMVMbTko1uO2U/IOkWQPBWEMcYqURCvdAviLbEsWkM0vRlHyXRhAxI1tjjsuw1mkstM4dgWT6ZJtXgLJl0tu51/DNjSxOlUxNUxrfIQT+jzxa+Lcrbx6pARFXzy92bT3VdD94/yMHZkojznJkb++AL9seVD21mDZfxjhspYtGpgKiP5Q2SIRUWp6WY7XZyuz3eN87f6TK62QnAvah4Kyn8s6p/9l/nrrtqMlp8uDMoAQ7IqsW4V9OyJRXaof+nhKc+fWBSmoaKVCobFGsMAWKebn+aZx1PuAqjFx6RDX8ydmdbKRNquAg0i9+h94NEglZ43/3p3bO0PoQ9OcOB66w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by PH0PR12MB999090.namprd12.prod.outlook.com (2603:10b6:510:38c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Wed, 21 Jan
 2026 20:01:00 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9520.011; Wed, 21 Jan 2026
 20:01:00 +0000
Message-ID: <e32b0819-2c29-4c83-83d5-e28dc4b2b01f@nvidia.com>
Date: Wed, 21 Jan 2026 20:00:54 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] driver core: enforce device_lock for
 driver_match_device()
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Mark Brown <broonie@kernel.org>, Gui-Dong Han <hanguidong02@gmail.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
 linux-kernel@vger.kernel.org, baijiaju1990@gmail.com,
 Qiu-ji Chen <chenqiuji666@gmail.com>, Aishwarya.TCV@arm.com,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20260113162843.12712-1-hanguidong02@gmail.com>
 <7ae38e31-ef31-43ad-9106-7c76ea0e8596@sirena.org.uk>
 <CGME20260120152328eucas1p1024a7488ae10b8b7f2fcb74baee24c75@eucas1p1.samsung.com>
 <ef37ed64-24ad-4b82-bc6c-d3bc72aaf232@samsung.com>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <ef37ed64-24ad-4b82-bc6c-d3bc72aaf232@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0039.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::8) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|PH0PR12MB999090:EE_
X-MS-Office365-Filtering-Correlation-Id: e999d4ad-55b3-47ff-b1c6-08de5927cc4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|10070799003|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TENYcnd2VitZRDRlNkFIdmlaemo3Wmxjcnh4U3pqU0llU0gxcnlQckhTVm9o?=
 =?utf-8?B?QWVRVmkvKzBkM2pkQTJCQVg3NXRjVHZPaTV4b3VOK3VqbHJqQkZwNmc5cEFh?=
 =?utf-8?B?cjBMNVZsQml1WFpmT1g3N1ZoSlJVczJXbEVQUUJWZTVUUkxiZmxrR3ZQaWRH?=
 =?utf-8?B?d3ZYcEZaQUlRQmZsNmU2VVpCQjZnQTJjdGNBbnJpaVJnTGpXZ1lnK2ozOWFy?=
 =?utf-8?B?UjZjc2pKTmFZZTVMMkxYaVdNcm9DVEE4enFlOGoxV1NsSkRqUi9KYTlRR01R?=
 =?utf-8?B?d2gxWlRjWjc3SDl3ckg5VTF1RHBwenROTWZ0T1MrVGQ5QmZRVkswODFiSksx?=
 =?utf-8?B?ck55cXVXenNmNTRHc3RoMDFBdXZQSHZiaklEdUtxMlFwR3NMQTltUTBoU25Z?=
 =?utf-8?B?eVVxd1hJOXhIZTR1TzZ3YklZUnhJN056VWhqdEdhZTdRclpjakJJRXZZejVk?=
 =?utf-8?B?OHpSeWVWQmwrbDNCVVE0N0FpR25INXdMR2JCTnNiMExpZFJ2UXA4SWtobHcz?=
 =?utf-8?B?bGNPa2hjSU9vaHRoV255Y0JZdkw4RkplNUNsT1dJejErSXQ5NC81bS9taGNU?=
 =?utf-8?B?UVF2ZVRZMGNYYitXdE9maEhzYkh6MVFVeEhDZ3k4QnFpbmJEMzdsQUdCTDlS?=
 =?utf-8?B?cWhrV20rS2JSZmZNWFU1dGlUWUhUOGR1ZUhhMnpQVG51WVVKVnI4QlpEUUZT?=
 =?utf-8?B?WG0zSHl2MDRUakl0R2lwNlA1SENMbXplQVVpUjMrcHpZVzRmMXc4aVVxTW5i?=
 =?utf-8?B?MmJXVXR0Mi84cUJraGJhSHZMRTZOaGtwNExNZHB0TXYzUVg0bFk5a2NFbmJs?=
 =?utf-8?B?RWg5ZTZ2dFdMb0M4WHgrTFN1WE9RdWpJM1A2MlA0d2hyOHlYOTl4WEVEbm1o?=
 =?utf-8?B?MEt1R3JtVkFqNnNtZFpLQkwyUkJLMkxrMTgyalNmREs2a0FWTWdGQUdiTkpv?=
 =?utf-8?B?VERheEYrbHJ4azh3R2kvVXpWalRFQmZrZHpmZUJHMGR6SCtTTHVxWEd3aTVO?=
 =?utf-8?B?M3RBSGxhckRiRWtEZ2d2UUhoZnhlZHpiZE1WQmVKdVhQTDZVNTBaaVJwOUV1?=
 =?utf-8?B?L08vc3hLckV1R0tOeXg1T0x6Q1hmZEFnUXhCZjhQQ3laWUZmYlVaaUo5bDFm?=
 =?utf-8?B?amV3Z282NDJLRHRENWNMT1FnMjdPeTc4Zk9iS2pJYnpZTE0zSVRWQXJ6RUVv?=
 =?utf-8?B?UFlvSEY1bHArTHVlSkUwWk9TQkRqbjRUQ0c2SkVXbCs5bC9Za3hPN3REZ2sr?=
 =?utf-8?B?TnI0NjhkUTBVS0lsT3lCNFRSQ0hjQXUzU1plYlhMWC9DVXVwYms1UjlkVE5q?=
 =?utf-8?B?ZjBTa1dOcjRtdTJDRDhqbzNra3YxdlJOS0c5SjVFTUdFRmg2cnV0cHZBSlo4?=
 =?utf-8?B?ak91RXlnN2NvM2IvbFNPTWs5ZWlYWlZLM0lkVjg2WEF3cmtkQkJtT1pndXd6?=
 =?utf-8?B?TGZwK3Q3K0xvcnhFVmJ2K3JxR3JWNU5HZmNBYm00MlhLd0RHR0dBbkVkWThL?=
 =?utf-8?B?SmFQSkFPN1BYYUdydnVoL1I2OERzaFBuRktEY1c3aEczUXp1STRkNDdDWVo5?=
 =?utf-8?B?Z3lpQUY3M05WK0VVQkgvalBYVldRZG9naHEzZzAvWDB4dlZ1bXg2Kzh1bE5O?=
 =?utf-8?B?S2ZMci80a09JY091N3dmL2tGREs2QUtlbVNEa2dBQUJTOUJRUWVkdXc4N3FV?=
 =?utf-8?B?Vi9ITWY5U200R3pGWmxWRGZzMjhMSUVrVUxTSjg0RjNzYURjKytqWjVRRzIw?=
 =?utf-8?B?NW90TTlGalJ1dk9IRC9kYWh4OFh6K2Vnc1Y2eENGMDBSS0w0VlJLeGc2VWRh?=
 =?utf-8?B?bkdwTnJObXBNV0Z5S2U3a1YrMURudDlSUjZzUnpsa0Y4L3VaR05qcDVtTkJC?=
 =?utf-8?B?akFRYzgzNlVHTXYwS0pyLzduei9LWVd2V1p2Y3BhT2VjTDRMUFVOVUdiRmVu?=
 =?utf-8?B?RzBsU01PMjhhVjVITHI4bGpqcVNVNU1Vc3Bad2tLbGh5UkdpUnEvRUJoZHEv?=
 =?utf-8?B?MUVjM1NoQjBvZTVhY003R056b3JmNGt3djFqVWQ1Q0t6YjZ0a3VYMzJtSDFr?=
 =?utf-8?B?clNUelppS0g5dGpDa1F5ZXdJVDk1WTBSVmZjU3RBVmRHZTd4c3VIQmlmWXFm?=
 =?utf-8?Q?XzI4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0JBQjd5MWwvOTNHVit1MWNwZ1VlRTg4SnZMcUtpckVQZWowZHQySjIzWnVQ?=
 =?utf-8?B?QnRIOFFzTlJ5YlVBRnA4Qkc2aitWVjlpSTNWb2Vybi95ai9rQ09ML3ZraWl4?=
 =?utf-8?B?VU94aGsvNm9tQVpmclJPMTlUbFUyblB3clEyMStBNGhZaitJMzM0eEZkbWU0?=
 =?utf-8?B?YnU2MVJLSGRKcHRoSlBpMHk2RGVSa3E1YnIxOWtDakZHckc5TnVseThWckF5?=
 =?utf-8?B?Q0xuSGNtanRWaXVwck9NY3RnODd0S1VLMTZVWXVUdWJ3bnc5cFZpR09vTlh3?=
 =?utf-8?B?dWM5WFkxckFzTC9tN3MyMjZ6OWxQVWxOaEM4UElqTVp1azlZcnZpcUpwWHNQ?=
 =?utf-8?B?cmhNZWM3VlFWK25Gb1REUERDeHM0cGdnenR6NHZVZnFSRHZRcUhKQ0t3cFBI?=
 =?utf-8?B?K2xVYWFyaEh5K0Vpcko3YkVkMDlZTUJlQStMWmJNZzNDbnZWL0pDNHJNUkV4?=
 =?utf-8?B?d2dJUEVndzV2NUVQOUNMeG1RMW1CSFpzemE2TE1RNS83dGZTYlVxNWpFMG9r?=
 =?utf-8?B?cUlDRjNsL2hIK3dMb2t3NmgrVFdEblFlVWJDZmxoSlpTeUlrWXRQN2hwNUtJ?=
 =?utf-8?B?VGJZT2kzcjBKZ2hCS05JM0wxSTgrdk0xOVBpaXZub2N6WCtacSswbTdDK3I5?=
 =?utf-8?B?YjZGdmhrWjkzR0FyS2xvSUhjd080eWNJTjZpQVVkczJabzVGMVRzVnNIdzU4?=
 =?utf-8?B?NTFiWElISVhRbUxxR2ZpQmpQK3RvYWMzMG53RW9ZRlQzaGtrMm5oWTIzQXN1?=
 =?utf-8?B?RStRT3dkSnRoZm5pbkZRREY4eUkxOEJDY2dFODVFSHJGYURmRGtPQmVLRENy?=
 =?utf-8?B?WnVPbFhBcEF1aUNZaUxCb1FCQm1Jb2ozMTY2UXdUWkU3VFVUOFBrMVBMWDVI?=
 =?utf-8?B?bEcwTDZjckJMM3VQNDA1NndVTU9CVWxJblVBeU5SV3psbjRjNkpJRUg0Y3VB?=
 =?utf-8?B?ZTB3bTMrR3Y1RkJWVXhXSDVRajNjRjhtc2xaL3dnMHVrN0k4dlRMb3lueFVo?=
 =?utf-8?B?bytYamw4Q0x5SlNtc2JtYmM1YVR2RDZFL3Y2MWFmSDU2U2JxWVY2UmRVR0hQ?=
 =?utf-8?B?SzNJeXJkRzE1NmNqdzFKYWpGTE0yZHlzdzdxbVBsNnAydm1FZk1JWUQwcmZH?=
 =?utf-8?B?eWRzckFRZ0YzNG01TzFRTW1WcHRPbW9xMXpCRDcyOURxRjlqampWY2pCSnZm?=
 =?utf-8?B?WFVYeHJhMExUYjg5UmhtRE4rdFpXNXFZcEw5cFFEUStJT3N0UWhNbzBkRFVj?=
 =?utf-8?B?emFtZ1pqYzRrSUQwcVVEcE5FYlo3c2hlU1BBVjBLeHF5cEMxQVVQcTUyWmdS?=
 =?utf-8?B?V1pzUEUydjZkOGoySTV1aDh1NSt0TGpCSVJnUFd5Wk5kYzhOa1MvTFZHNkVZ?=
 =?utf-8?B?MzJOUWNUVUd3TFdPNEFqa1hJT1JIbklMd2tpdWRQaUVRSDh4eFI3TVlGeHJo?=
 =?utf-8?B?ajJHUEVWVnlpaGc3ZzAydVB3OGZ0eDVUZmxHWE1YNVltYUtOeVc3Rk1CeUdT?=
 =?utf-8?B?bXVxdmhEWFdSZEJ1THNQbVp3eE5jZnAyQlJreEU0b3VvMDA4dWVVWXNGUGF2?=
 =?utf-8?B?bWxMcWdGbG1xYS9rRlNZMGxoY0ZIVnNGdHlIYmdzR2swc0g5WnZ6R2pvRTZu?=
 =?utf-8?B?ZlBDejMvNkVaWHlPbk80SHY3WWtBTEM5OFBPUmFwK2tEcm1vYXVoSWIrSEF0?=
 =?utf-8?B?WkVrUmFvMWRRSXA3czFYUDNnN0grakJETHlZemFMRUp3SjJKVTVaNWRPWWlI?=
 =?utf-8?B?TmtSdG5mVVl1WVM0cDJGQUV0WEJCT3BPUlBSOGdlL2lWQ28zQkJ5Ymx3Z1FO?=
 =?utf-8?B?aFVYNjVuME1FV0RlMVkzSWIvb0FDWUNrdE1PUHNoRlU4bjlMbEJGVm1KRDR6?=
 =?utf-8?B?ZXFvaDhmdWJDZ0ZhVEc2V0lDK014aDJNWWNQMFFDNE9NS1EwN1J5L1duMEp6?=
 =?utf-8?B?YjFVNGp6SEVGOTRMN0NoeHU3NWVnQkR5MlNCTlB0YlI1NDB5U2NjSnRDSWZV?=
 =?utf-8?B?UEtVOGozT0h3alpwdktySXBYd0pUMWVPY2MvY1lCNHpFRk1NeHFQcTN1bGpB?=
 =?utf-8?B?L21hSDRselhaT2NMc3NqelI1ckhpUi9iU0FXc0hYdHlIRlFLakx3cllKSWl2?=
 =?utf-8?B?QlBVKytPa2ZpTGlCNG5mSGMvNHArZ0ZHWGJ3ZldGYmo2VnF3QzFxUUNXc0lz?=
 =?utf-8?B?akhLcEF2OW1vcFpzWWlVai8yVTJHTmJpcHNpQVZtOTdGZ3QrL2xhRWZPN2lI?=
 =?utf-8?B?N2RmQ0U0Z01DYkt6SzAyMDVUbkM3WW9leFc4K1N2d3BlTWpkNnIreUVzcnVH?=
 =?utf-8?B?N2YrNTFtWXhRWTh0Z3Q0QUQyazdUZGdUa1dSK01va3ZvSEFmWE80UWxSMDAz?=
 =?utf-8?Q?5Hp8shAyPoO88l3lryXrFdbsSjrqgewCJJwqCztUhz5En?=
X-MS-Exchange-AntiSpam-MessageData-1: LArK8Zp5epfieQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e999d4ad-55b3-47ff-b1c6-08de5927cc4b
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 20:01:00.1777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /H+IfuaIWSxugZxWLVvsmlk2YfLPoVZJ7+i789q9nvA0PDZNBDkkBwrCIH7mYsv5olCDA4xKnDyzjJdb8WrqFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB999090


On 20/01/2026 15:23, Marek Szyprowski wrote:
> On 20.01.2026 14:22, Mark Brown wrote:
>> On Wed, Jan 14, 2026 at 12:28:43AM +0800, Gui-Dong Han wrote:
>>> Currently, driver_match_device() is called from three sites. One site
>>> (__device_attach_driver) holds device_lock(dev), but the other two
>>> (bind_store and __driver_attach) do not. This inconsistency means that
>>> bus match() callbacks are not guaranteed to be called with the lock
>>> held.
>> I'm seeing boot hangs on Arm Juno in next/pending-fixes which bisect to
>> this commit.  The boot grinds to a halt near the end of boot:
>>
>> [    2.570549] ledtrig-cpu: registered to indicate activity on CPUs
>> [    2.618301] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
>> [    2.623547] msm_serial: driver initialized
>> [    2.624058] SuperH (H)SCI(F) driver initialized
>> [    2.624312] STM32 USART driver initialized
>>
>> with no further output, full log:
>>
>>      https://lava.sirena.org.uk/scheduler/job/2387335#L862
>>
>> We are also seeing similar looking boot hangs on some Qualcomm platforms
>> in Arm's test lab which aren't verified to be the same thing but are
>> hanging at a similar point in boot.
> 
> I've observed the same issue on Qualcomm RB5 board and bisecting lead me
> also to this patch. My kernel log also doesn't reveal much information:
> 
> ...
> 
> [    3.671227] vreg_bob: Setting 3008000-4000000uV
> [    3.676929] vreg_l1c_1p8: Setting 1800000-1800000uV
> [    3.682826] vreg_l2c_1p2: Setting 1200000-1200000uV
> [    3.688547] vreg_l3c_0p8: Setting 800000-800000uV
> [    3.694080] vreg_l4c_1p7: Setting 1704000-2928000uV
> [    3.699908] vreg_l5c_1p8: Setting 1800000-2928000uV
> [    3.705763] vreg_l6c_2p96: Setting 1800000-2960000uV
> [    3.711684] vreg_l7c_cam_vcm0_2p85: Setting 2856000-3104000uV
> [    3.718408] vreg_l8c_1p8: Setting 1800000-1800000uV
> [    3.724287] vreg_l9c_2p96: Setting 2704000-2960000uV
> [    3.730218] vreg_l10c_3p0: Setting 3000000-3000000uV
> [    3.736226] vreg_l11c_3p3: Setting 3296000-3296000uV
> [    3.743413] vreg_s8c_1p3: Setting 1352000-1352000uV
> [    3.771370] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
> [    3.792020] msm_serial: driver initialized
> [    3.797633] SuperH (H)SCI(F) driver initialized
> [    3.802881] STM32 USART driver initialized
> 
> [hang/freeze]

I am seeing a similar issue on one of our Tegra boards and bisect also 
points to this commit.

It is odd because it only appears to impact the Tegra194 Jetson Xavier 
NX board (tegra194-p3509-0000+p3668-0000.dts).

It appears to boot enough so the test can SSH into the device, but the 
kernel log does not show the us getting to the console prompt. It also 
appears that a lot of drivers are not bound as expected. I would need to 
check if those are all modules or not.

Jon

-- 
nvpublic

