Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010042.outbound.protection.outlook.com [52.101.201.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CACB944104B;
	Thu, 22 Jan 2026 12:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769083863; cv=fail; b=pAhjZwoL6bJJb66yvqQcALjhqEOHrTNByRFSDhBfsENk41pnGA+6Ur1MmGZa4dRIqG7MQ7+D5x5+Ms6JiiURWw1oo8aLRjssLpHHvjT5XxwPnchAwoQQSYka5RrX3QmI0h7QV/RVY9ss7ZS5y8NzR/6s5Y42R1idvI4aFl2Q8Yo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769083863; c=relaxed/simple;
	bh=AxjJn/CBSozKs/8VJHWofnBRO4H6ihK9NKW3BSDikmI=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cJ+BJt85GJrJq0hw/Zv4psWg1Ir4RtgPiP67SpX/UqVUBDLxYyBPXL98d/swsglbkaXHcojD8rvr2Jv+p1GMcuzngygN4uABfPnsVWThzMlI2z/U08zuRdWbISG9JglwawjT0L0AdCGt+mXrkC4DHNRpPhzOMp5woiIi4UoPuas=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Oz7Xc/bT; arc=fail smtp.client-ip=52.101.201.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Oz7Xc/bT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u9jTS9ZJMtFxx1guNEeHC1Z4V6YzBVNn8CFc3g+lP7L2AFgdibgT1dv0s86kKS9q5L/+9GBNm346ATW1HoGR8MLKex7YsXy+sWsf9MaCSM9dB3sOUAL7dC6CAvEyezAzhym9lpG8011PlY+ypBB2Jzv/dnSwPW9KFyUBtQX/b7y2MvlWt4kGHAzgR4tLdLkURguz56A7jtK8M9pARV5WzhsnE4pVGffj5cscyucDexN5R277GTSPeDzOhMudXIOaXbhByiH49TQviAHIFSnCulLxcqB/cMqOFO1Ix2iQiE99Xx40hw0bEdzBOvuQGE5iMDxPy6dDDa+jrsR4V8jC4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HavdpNhAZVMl1P/sPWPw4ZLFgw1sC0nw5rVBWZ/TohU=;
 b=Kw1P4bYLheeRf65NuMNz3exc/Ajt+Fgtr2I+GVjMbTP7e5QLpH1HdFFgnjGJ2lxLKU/QzdjGLoPU4TUyxhKbJbMXZ9+OH0PZX4ALDGFiq5SmejdwQwZRIITr0bCqvDkqFtjwUpreWxpZg1IvDZyqpouEy3zW/M2QgqagFNcY75lxp0LevVAVyUlhtIVfeyalmeYCLU7OZQoZTf4Rkk+3XvJ/2s5sHbDT8TZIPGpr36ITVI9N47C4eiixIgMKawj41D6VP/ir3obcXaWlVUCK9h69YDVVS9/C1NzJS/+4tm5epmiBAb3B2+57ey3fGmb/NvBxKJFWCRBGDSpesKQUAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HavdpNhAZVMl1P/sPWPw4ZLFgw1sC0nw5rVBWZ/TohU=;
 b=Oz7Xc/bTMtGCVS2FgkA+RiODli0fkRt3wCo5EHwo6k5ywVeSgeqv3cRXdfn9Z6GhCrVYRfIYZe5W5zpkr9jXQkI5/KI0wc91ogg0ypN+ENt48bTsyuYgLTUmFi6ScHLR3/r4jhN/OYABVnuaio0x3woAVqqOtCFmCv3fGUw/VJkHB8kY2e1pLyDCYFs2SBCOEiFkU5P3kR2zKVfK30+tW9HYl34pQtLAFNdXOCDHqMUeKa7WRg+ccoRq7y8AHuzt5NFM1QDPZFNHiKwUPJZKceHReGE5OW7MUepczvgc6fSX/GDJfmwZqCgZ4fSdzrhQK9BW4qhl4o4qQp2ZNZeQqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by CH3PR12MB8712.namprd12.prod.outlook.com (2603:10b6:610:171::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Thu, 22 Jan
 2026 12:10:55 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 12:10:51 +0000
Message-ID: <80ed9e52-9173-4e7b-8df9-aefe7294904d@nvidia.com>
Date: Thu, 22 Jan 2026 12:10:48 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc/tegra: pmc: Add PMC support for Tegra410
To: Kartik Rajput <kkartik@nvidia.com>, thierry.reding@gmail.com,
 jirislaby@kernel.org, pshete@nvidia.com, chleroy@kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260122110805.97899-1-kkartik@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260122110805.97899-1-kkartik@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0317.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:390::18) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|CH3PR12MB8712:EE_
X-MS-Office365-Filtering-Correlation-Id: b814dd99-966f-4f09-b681-08de59af490b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VmJ3OFA5SWJhSW9UOGhYSExTckQ1NS8wclNhNmdJcERqWlp6dlJpbm1KNVZG?=
 =?utf-8?B?eHp4SXNuSGZIZ0w5QVFSSGx1RmF1b1lick95Rml1SjJ2V0ZKTExsODB4RE1k?=
 =?utf-8?B?bkl1akZ3MTFpbzNJaXFvSmpsRW9ramNvVjJZZHprSk9zYUJaVng2ZWJJZFlk?=
 =?utf-8?B?MGpRVTNBc2V6dkh2aEMrZTVtcytraG9MNGZuYWNIVUtZT1JJTkFzdkZGdWFj?=
 =?utf-8?B?QjNHYnhqcUkvVkJ3SVFFdVRBdTdXd3I4L0hQKzZLeXMxK3VUOEw5aHUzL2w1?=
 =?utf-8?B?Wjl4aHdDSkdtR0pxdDBmRUJJTFJtVEJXR1lhUHVSWWM3Y0srUGZoRWFYQWV3?=
 =?utf-8?B?b2RLdXNIZWtYSDhVWUtrNFh0Yi9EdlpmVTlJS2NRVUlyZUx0S3FZUGhRVWU1?=
 =?utf-8?B?SWRsRnNmYUowWUsza0VDZVlNRUhCMVJLak9wWkg4bG04QWtJaGFHWjh2eUUw?=
 =?utf-8?B?NzRGYzVxYkJ2VjlCTTJiQlE1d2R1dTcyNjZBOFQ1S3N2WXk3SmQyb2FMQzFT?=
 =?utf-8?B?Vjd5c1F5R29IK1VBVlYzbFVHU21HUVFiUDVRa2NOYm5RdlpYdXIzaHFJblp6?=
 =?utf-8?B?S3ZwUzNUb2JiWS81Z05HT2U1OGpXSFRwaVNOT1pVejl3a0lwQURkY1pnYk8y?=
 =?utf-8?B?WmdJMGQyY25qdGNrblVyNEFxVnd5dVJna1o1KzJ0bjE3S1g1ck9ZVnBTbmdG?=
 =?utf-8?B?bmlwcWtpcm1nZ3lWQmV5bUxjS0wwRHlaMm52SXBIRjNwTHJESzZCa3F2QWJX?=
 =?utf-8?B?ZWFVdnpUVXlxUTZTcXFBSVc2TUpQNlkxd0RRZWU2NlM2aDZXanFDSXVuYTRa?=
 =?utf-8?B?Q1BDZnYwNUpJQ2VwTXB5SGJ5T1QxZUxkSlV3Skp5ZmFYWDk5T0J4Nld1WlJt?=
 =?utf-8?B?cE9lT0IyQm9wR3h4aE4vUkkzL1puMXkzNnE5WkZOYkRWTWpHUi9HU0U3d1Qr?=
 =?utf-8?B?TWVMdmZDMktjd2VVQmxYWEUwVzFTNGJnbDVuL21lQ25rZXhZZ1VEeC9PaEhm?=
 =?utf-8?B?QmhsaTR0Z3lWU3ZMMnE0SmlVOG5lN1o0U2NmUWJKRWRWakN5QU5ycjVHL3lS?=
 =?utf-8?B?OFBaZ3VUYUJrZjkwVEtwR29DR2NnUThvMG8xc0JHamNieUxIWmF1eUM5KytE?=
 =?utf-8?B?WnNFZDdadE5JWlp1WHBXR2YrMzFWREJ2U0o1elQ2RFVhempwZTREUHNaL3Vq?=
 =?utf-8?B?QUlOcHVMRzl6Si8yME1heHp2K3lzVXpNWXBQUnhKdHBFZEp2ZTF0alI2ZXZF?=
 =?utf-8?B?RkFFNk05a09zdmJBK0ZoSVdtR1dENjRYanArV1RzV3JNc1B1c1pXV0Q5TFln?=
 =?utf-8?B?TVBOZzRvRGtsVU00STR2MS9nN1JCNEpvM2ZHQWRiU1ViS3RnWDBONHN2ZktU?=
 =?utf-8?B?VzZ2cDgvT29TODVKcTJBejZva0d4dVlZUTl1WGNWRWhiOTdEODlDeWl0UWtG?=
 =?utf-8?B?UHh6YW82eG1NSzl1dGJRazFIdnpJMXVGcy8zbGw5dy9oaVM5eVdsRUNNdCtW?=
 =?utf-8?B?TWdtMFdKMkxIMUM4b2VOSmoxU3ZyYTZpY0JmTGtKditHc2xiNnJOUDN0eHlI?=
 =?utf-8?B?RnFsTkdhUURLQmxRYXMyeStQN3plSnhUeWVXejc2a1htUU9aUU9vZ2ptNVd1?=
 =?utf-8?B?UkZEVVhhTTcrcFg5VFk3VWpCV2hScGRjcXhaN2kxT01ocVRnTlQyeFkraE5a?=
 =?utf-8?B?SW1BQzZkckJYaGtvZHV6VDRjRVVGdGw4VkprdUgwOG4xNmhvTnJZa3N2YjNu?=
 =?utf-8?B?U1lFcXh1N2R1NnZ2QzVzdFhuQlpobTVLc1V2TkVHalVzN3M1eDJzeEhsRXZy?=
 =?utf-8?B?U1R1bGZwUzhZekZkaTM5V01maEV3di9mMy9KcmpHMXYrMFVCVXhxUUdpeG9Z?=
 =?utf-8?B?V0VrYlJLMzNTSTJ6YXhzNndnSmdNZGUreGUxVFd4Z2FlRXpxUGEwZUtEUmdz?=
 =?utf-8?B?WVNGZVVKN0V5UWlBZEl1SllzZERNOHhHcUlkNkFwV0ppM1JIM2gxa0p2aHJO?=
 =?utf-8?B?RW9aOEVnU0orcjlmQ0JWR1N0Q1ZDSG5aVmg0bTV6OWl6RURZTDROZUJwaHhs?=
 =?utf-8?B?Yy9XYi8zbnJtazViaStJTDVKOTNZRndQd1dOTjhieTJmNWZyOVdDUTdEY29F?=
 =?utf-8?Q?qKfA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c2FNVnJpcUNHeTRMQkMyYXVRYzlDOGVLK29vZUprUFpTWWZDaGcyTDJVSWRE?=
 =?utf-8?B?WjV2bmJMcEZmUjdRdUFSbGRoL2duT3l2U2hJR3ZnbWs4QTlFcEwwODFGL3ZJ?=
 =?utf-8?B?QkZ3UkxUQXVjZHM2U2phVnA0VTUyQnZLRWxkOVh2b2xveklXTm1abmxMWHN6?=
 =?utf-8?B?VjFsMTNoZ2ZzSndFNC8yZ0t5K3k4MmNzVXVrUUJZMVcwWEtJR1V6aytXeGw1?=
 =?utf-8?B?RmFDWlBobVN6WXdpRzhSUmN3bGdSaG8vZlhGaEVaeGJJR1l4dG8yVGl2UFJs?=
 =?utf-8?B?TWhrTW1oMUkzclB3akkrUEc0TzI2YVhPYzA3dFVEU29PYUNoYkZtREtCU1Y2?=
 =?utf-8?B?cEZwcElCdnRld3R1Tmh1K2lwaExzcXN4TWNNdUdYb0FEYWE4VjVYV3EwZ0ZN?=
 =?utf-8?B?MDNlYW5iT1hMMlhTSndOSGZuZTBVT0dYWm5jRlh6YytEcFlBQzh2M2R6UTNF?=
 =?utf-8?B?V3BLNGtwNk04NlRYUUl5ZG1DbFZCTzNtNnVQbk1JclZEQjRnais2WG1Od203?=
 =?utf-8?B?ZytZbkh1TXBkVkxHejZmT3JGaXR6SXE2UVh0eFdiUGxSYU1zTzlyUmtjL0Vr?=
 =?utf-8?B?OFE0bTI5NHh2WjgwZWpONGNkWERpNzFMM3lJQkFXVisyQURtVzJaVzB5QzFx?=
 =?utf-8?B?RzNrekZ4djlxWjJvcS9weW5NTXRtSTYxY09RNG1ML2l1cDRiSCt6V2UwOEl0?=
 =?utf-8?B?SFlkREZIYXJqaTZtajgzY1ZDMWIyL0hNdXNqVnVZRFFMOGxKbkwwRWZYd3VL?=
 =?utf-8?B?dWhWbm5CVDZDTHFYVUtVNlNGd3c2b1IzTStzaEw5bkMyWi9kMHdGUWU3T3hD?=
 =?utf-8?B?YmxKVExxZ285SHdNelEyS3B2TlQ3bWQ0RlRoMlhpTjVnMm9FYjY4MVVRcW1X?=
 =?utf-8?B?c1g3NmNWRkc4OThzd21nYzBzaXVGNXpYRng0MXA4M0RmaURuRXBNV0QxNjNQ?=
 =?utf-8?B?MlZvU21COXkrVlIwS0dJM0dTWTJoQVg5eTFiZzNDaFNZUDIrTHRXVEtZRkY2?=
 =?utf-8?B?clZQV1gxVm5hcVRXdU1FU2R2allwRkVlcWxERHNQRVdBQmZ3SWZyMVNNNjJJ?=
 =?utf-8?B?VDV1bzdzYU4zV0xLOTc2eW04TWthSk94ekJJUzYvcjd6cFlDcXRHQ2VjYUZS?=
 =?utf-8?B?OWprcjA0ZGp0S29RejlrZ3FHMHdoQkdQbkpxZkdqS3lrYVhKaEMvQS92bDN3?=
 =?utf-8?B?WlRsMkNKaVV6eEpDSHl4NlNzQnpSUXhNR2hvaElRakdDSWt2OURMQi9JbFRP?=
 =?utf-8?B?WWd2NWhBNFkxTDhPRWpVL2ZJZmp2bENhTkNteWZhL3A0VTU3NmRwWHBsV0h4?=
 =?utf-8?B?NXBCcmUreGVxVFluWW40SEYveDdvQ2ZTa0JmQTRnVEQxR3JJS1l5NjBWNTR1?=
 =?utf-8?B?WFhYR3dpaCthc3BzYldOSXhqZGwrempBeG1NT2EvOVFWZUtGSzNnN3crTEo2?=
 =?utf-8?B?d0drc2xYbmVhNGl0OXBvUFd4dnBMeVhNZmxZMkJ6UFZUY1dZMDhwdlhhVk1C?=
 =?utf-8?B?blErMTFMOEM0ZkFEeGtkWHFXZ2t6UFduY25xRWJUZ2g0ODB6YTJrM1h6N1Mr?=
 =?utf-8?B?Y2tkUVNaMXFPZkRnK3dnMUFLNlNrRmRkR1hDZ0FYQzQ2QWxBcWtzYzEwbDlD?=
 =?utf-8?B?SmRzK1E5NzdXK1pTaGpVeWNVS1Yyb0J2WXdGYm9rL0YvY1VLa25iQ24yUlhm?=
 =?utf-8?B?eHZnM1I1WWNyY0o3TU43Y0JYU0RaYThOSEdtRjhIR1RYNlNWUk5tRUFKSkhW?=
 =?utf-8?B?cktXRUdtNUE4YkU3bUI4ekRnVXhuaTBsOXZUUjdXbWtYUTNuajU1OVBKNkFR?=
 =?utf-8?B?R2JrOVRLT3FMbFBRMURpOHBCVzZoWlJzeVI2ZWZFWXdhYWFxckxla28zQnVs?=
 =?utf-8?B?MlVoWU4yMzRBNnNsd1NOellaancycnBxcTJYNmxRWjhBZ1QwU2M1MEsrcEdk?=
 =?utf-8?B?Ty83ZUlIbFA2ZFNjT3hzTDhVbkFFZ0VKU0MvL0t6Rjc1RXArdEtKak11aG1u?=
 =?utf-8?B?eTVrN042VFFUNm5DU3hZK2d2Z3BrNkhzL2NlcG4vZUh5VTl4R2VBMkpGVEsz?=
 =?utf-8?B?QjduMDBhOWMySFcrL1lDaDhkUWFSZG4wMElrcmQ3QzVmM256anlTQ1prNEdt?=
 =?utf-8?B?RjZTb2VYeVBNTGQwSE5UM1gyWm9wS003Vitia2VKU1BKTVIxMU03U01QN2Vp?=
 =?utf-8?B?Rk5ldDVia3dsZzUyT2RLUUZuM3VscUM3T1M2SFpZeUhjUmdSSHRyUXU1cG5v?=
 =?utf-8?B?Y2ZOSXBPL3Y4UUNmVmtLMUxNRkdFbGtmTXc4Y3VLOVVaczVjb3JCTjAvYWpO?=
 =?utf-8?B?ajM3NlY5Y09jbHpEMWlnU1ZGVktIUHMyMTN1Q210NGdMcjBTNG5pQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b814dd99-966f-4f09-b681-08de59af490b
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 12:10:51.4430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Uu5nLiEJXgedqlDbwlpBa/Vb4vBEqdO6U3Ub5UeQ0AvBABT6gBP3NPReNN9m9/gWJCTz6gCgqPFrSt2OC00VA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8712


On 22/01/2026 11:08, Kartik Rajput wrote:
> Tegra410 uses PMC driver only to retrieve system reset reason using PMC
> sysfs. Tegra410 uses ACPI to probe PMC, unlike device-tree boot it does
> not use the early initialisation sequence.
> 
> Add PMC support for Tegra410.

Maybe ...

"Add PMC support for Tegra410 which uses the PMC driver ..."


> 
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> ---
>   drivers/soc/tegra/pmc.c | 128 ++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 128 insertions(+)
> 
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index 9cdbd8ba94be..2bdcd6d30261 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -11,6 +11,7 @@
>   
>   #define pr_fmt(fmt) "tegra-pmc: " fmt
>   
> +#include <linux/acpi.h>
>   #include <linux/arm-smccc.h>
>   #include <linux/clk.h>
>   #include <linux/clk-provider.h>
> @@ -3095,12 +3096,30 @@ static void tegra_pmc_reset_suspend_mode(void *data)
>   	pmc->suspend_mode = TEGRA_SUSPEND_NOT_READY;
>   }
>   
> +static int tegra_pmc_acpi_probe(struct platform_device *pdev)
> +{
> +	pmc->soc = device_get_match_data(&pdev->dev);
> +	pmc->dev = &pdev->dev;
> +
> +	pmc->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(pmc->base))
> +		return PTR_ERR(pmc->base);
> +
> +	tegra_pmc_reset_sysfs_init(pmc);
> +	platform_set_drvdata(pdev, pmc);
> +
> +	return 0;
> +}

Should we just define a tegra_pmc_probe_common() that is used for both 
DT and ACPI? The above is not specific to ACPI.

> +
>   static int tegra_pmc_probe(struct platform_device *pdev)
>   {
>   	void __iomem *base;
>   	struct resource *res;
>   	int err;
>   
> +	if (is_acpi_node(dev_fwnode(&pdev->dev)))
> +		return tegra_pmc_acpi_probe(pdev);
> +
>   	/*
>   	 * Early initialisation should have configured an initial
>   	 * register mapping and setup the soc data pointer. If these
> @@ -4615,6 +4634,108 @@ static const struct tegra_pmc_soc tegra264_pmc_soc = {
>   	.max_wake_vectors = 4,
>   };
>   
> +static const char * const tegra410_reset_sources[] = {
> +	"SYS_RESET_N",		/* 0x0 */
> +	"CSDC_RTC_XTAL",
> +	"VREFRO_POWER_BAD",
> +	"FMON_32K",
> +	"FMON_OSC",
> +	"POD_RTC",
> +	"POD_IO",
> +	"POD_PLUS_IO_SPLL",
> +	"POD_PLUS_IO_VMON",	/* 0x8 */
> +	"POD_PLUS_SOC",
> +	"VMON_PLUS_UV",
> +	"VMON_PLUS_OV",
> +	"FUSECRC_FAULT",
> +	"OSC_FAULT",
> +	"BPMP_BOOT_FAULT",
> +	"SCPM_BPMP_CORE_CLK",
> +	"SCPM_PSC_SE_CLK",	/* 0x10 */
> +	"VMON_SOC_MIN",
> +	"VMON_SOC_MAX",
> +	"NVJTAG_SEL_MONITOR",
> +	"L0_RST_REQ_N",
> +	"NV_THERM_FAULT",
> +	"PSC_SW",
> +	"POD_C2C_LPI_0",
> +	"POD_C2C_LPI_1",	/* 0x18 */
> +	"BPMP_FMON",
> +	"FMON_SPLL_OUT",
> +	"L1_RST_REQ_N",
> +	"OCP_RECOVERY",
> +	"AO_WDT_POR",
> +	"BPMP_WDT_POR",
> +	"RAS_WDT_POR",
> +	"TOP_0_WDT_POR",	/* 0x20 */
> +	"TOP_1_WDT_POR",
> +	"TOP_2_WDT_POR",
> +	"PSC_WDT_POR",
> +	"OOBHUB_WDT_POR",
> +	"MSS_SEQ_WDT_POR",
> +	"SW_MAIN",
> +	"L0L1_RST_OUT_N",
> +	"HSM",			/* 0x28 */
> +	"CSITE_SW",
> +	"AO_WDT_DBG",
> +	"BPMP_WDT_DBG",
> +	"RAS_WDT_DBG",
> +	"TOP_0_WDT_DBG",
> +	"TOP_1_WDT_DBG",
> +	"TOP_2_WDT_DBG",
> +	"PSC_WDT_DBG",		/* 0x30 */
> +	"TSC_0_WDT_DBG",
> +	"TSC_1_WDT_DBG",
> +	"OOBHUB_WDT_DBG",
> +	"MSS_SEQ_WDT_DBG",
> +	"L2_RST_REQ_N",
> +	"L2_RST_OUT_N",
> +	"SC7"
> +};
> +
> +static const struct tegra_pmc_regs tegra410_pmc_regs = {
> +	.rst_status = 0x8,
> +	.rst_source_shift = 0x2,
> +	.rst_source_mask = 0xfc,
> +	.rst_level_shift = 0x0,
> +	.rst_level_mask = 0x3,
> +};
> +
> +static const struct tegra_pmc_soc tegra410_pmc_soc = {
> +	.supports_core_domain = false,
> +	.num_powergates = 0,
> +	.powergates = NULL,
> +	.num_cpu_powergates = 0,
> +	.cpu_powergates = NULL,
> +	.has_tsense_reset = false,
> +	.has_gpu_clamps = false,
> +	.needs_mbist_war = false,
> +	.has_impl_33v_pwr = false,
> +	.maybe_tz_only = false,
> +	.num_io_pads = 0,
> +	.io_pads = NULL,
> +	.num_pin_descs = 0,
> +	.pin_descs = NULL,
> +	.regs = &tegra410_pmc_regs,
> +	.init = NULL,
> +	.setup_irq_polarity = NULL,
> +	.set_wake_filters = NULL,
> +	.irq_set_wake = NULL,
> +	.irq_set_type = NULL,
> +	.reset_sources = tegra410_reset_sources,
> +	.num_reset_sources = ARRAY_SIZE(tegra410_reset_sources),
> +	.reset_levels = tegra186_reset_levels,
> +	.num_reset_levels = ARRAY_SIZE(tegra186_reset_levels),
> +	.num_wake_events = 0,
> +	.wake_events = NULL,
> +	.max_wake_events = 0,
> +	.max_wake_vectors = 0,
> +	.pmc_clks_data = NULL,
> +	.num_pmc_clks = 0,
> +	.has_blink_output = false,
> +	.has_single_mmio_aperture = false,
> +};
> +
>   static const struct of_device_id tegra_pmc_match[] = {
>   	{ .compatible = "nvidia,tegra264-pmc", .data = &tegra264_pmc_soc },
>   	{ .compatible = "nvidia,tegra234-pmc", .data = &tegra234_pmc_soc },
> @@ -4629,6 +4750,12 @@ static const struct of_device_id tegra_pmc_match[] = {
>   	{ }
>   };
>   
> +static const struct acpi_device_id tegra_pmc_acpi_match[] = {
> +	{ .id = "NVDA2016", .driver_data = (kernel_ulong_t)&tegra410_pmc_soc },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, tegra_pmc_acpi_match);
> +
>   static void tegra_pmc_sync_state(struct device *dev)
>   {
>   	struct device_node *np, *child;
> @@ -4679,6 +4806,7 @@ static struct platform_driver tegra_pmc_driver = {
>   		.name = "tegra-pmc",
>   		.suppress_bind_attrs = true,
>   		.of_match_table = tegra_pmc_match,
> +		.acpi_match_table = tegra_pmc_acpi_match,
>   #if defined(CONFIG_PM_SLEEP) && defined(CONFIG_ARM)
>   		.pm = &tegra_pmc_pm_ops,
>   #endif

-- 
nvpublic

