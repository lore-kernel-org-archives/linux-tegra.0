Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011041.outbound.protection.outlook.com [40.107.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E9D304BA2;
	Tue, 30 Sep 2025 14:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759244109; cv=fail; b=RKpNEbPme6Y4pHNX6FUxrcnpvk+oPc8Z3f3BnlCdON7Ol4nG2nezVhb6HmG2WEBW7Ar2DVgDrvanOJoEhJ0P6rgsaO1gZHtKWFPOCQBjtauagcUGp4UNVZoyWt3j/YRUcvuxtYoIgEM9u3HBKeIBY6UpVDN+BXTvxzmQHbsA1G4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759244109; c=relaxed/simple;
	bh=e85bPTQI+tX7dvbOs59MVCWJCK5gVm9ig2L+IFC1eOo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JtOOCvjT1IjHF7MGpu8IEIuVkunVn7O2cvS7LaBpompdTI/1MLcnIef1upMAKSDco7851Eme1OmUQdn/OQmsgEbwnVXm90U9CDZgx0+6mjZj0F1QpnakuN2SPAEqNCAfZp18cQ3OFgjJxj6Oi4fTpTtSlpuUjKM/LDfLfwI2wTw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ivFfmZic; arc=fail smtp.client-ip=40.107.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ivFfmZic"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=foO7de13yxYCLDNuhU7v0GzuCfFSOrNlAQwT0QXPItGNYNBZ13kQlyCncnjX88PDXaBZd07O7Ocf5bmi8BkFcOUGw2gusc7CjTcX4+mfy8tLCNgjLttFmu4DLL4LqtNF6O/7CEQcgEA5AcsErFlzrrXIHoORhfI0pzqlClZAgHSpnxde+iQ2lFJz7roH5TyEhMr3xGiF9OrpS47ueTLnGVdXijy37ShX/dsa6FyPfwy7Sipz0rlRRJM5U/4Zem3JyQji5GqD58EHqq61IgVP/9mKvNNRzQkDD1BfTEHohGwqKqaVlSGrMeb+E2RuvKrhgCmBOb0KFDrPO9qDZcs9Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EhZX+L8BmOCiamlolH6dG7Q7nnWyzKxhcKG4/GUrFXw=;
 b=SyvqWQK80Eu9S4YQKQiIZ4qirpwwQAZiFt6vxNr5UEsL9Sx43drB9NVZ2UjPrykGrGXm96iU1uit3LUxFWPEHMDACv/VGjL7DWn3LWyCsHlv/QGAY+x+R0QANYv3ul3ei10eTWjtYI2QQQ3MZFvl+q4HVQMOC9Uc2zJC0ktiNfGrVu4TmExzqekDzegIxWC1rsKwa0lfjU3XMwM/ouMFZg2dYQao3CAnRmZSwpl/2SCoPC6G+H7YQ3401HMrrQRNmF+cWMBBJtFbv/T9hZAoBZUcQ1ySPl2jYtHWsR2IWgc2lYZquDUyYOvuhAaVOH4APxM69lWRYdzm+6K9lAjqUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EhZX+L8BmOCiamlolH6dG7Q7nnWyzKxhcKG4/GUrFXw=;
 b=ivFfmZicssqEjUUDiE1m7VaC1yhB4ZVTtpOcJSgm4uZwpEx6rxypSil2XppJqcBaWq/E76+DlbM62WNccm3YETX5n1mKbrFLf0oZz9EoCrIdug7UnZTa1vx5c36dVWg9jAjOiMfD/4ZnefHDJzvcaUdPj1RZekSRRUWWVv+ZXm9qOMCfRkimhh+wdqUHTU7GT4UF/RLijAcNxwP99Z36/W6WIJnaAUTew4dGETdMGv2Mk8qyle6PbsZMLoulUIGDEn4maYbsX2j4VWzhrUFuE0S/6B+CXn3/A4cTPgMrtBiXxYW6iGINb095KvbpplWWBSjU1q+SZneZZNqt2v92ag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by IA0PR12MB7699.namprd12.prod.outlook.com (2603:10b6:208:431::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Tue, 30 Sep
 2025 14:54:59 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 14:54:58 +0000
Message-ID: <43f48d63-7bcb-47f5-814e-dd95fdf0b246@nvidia.com>
Date: Tue, 30 Sep 2025 15:54:54 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] soc: tegra: fuse: speedo-tegra210: Update speedo ids
To: webgeek1234@gmail.com, Thierry Reding <thierry.reding@gmail.com>,
 Joseph Lo <josephl@nvidia.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250923-tegra210-speedo-v4-1-c12b5400ca91@gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20250923-tegra210-speedo-v4-1-c12b5400ca91@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0086.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::19) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|IA0PR12MB7699:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fcf4abf-81d9-4204-8f11-08de00315375
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Wkx2bjc2ZGdicThlbC9aNjVHSHBLME9mcDdvdUpEd1ovNFBPM1ZQcjByU0Qv?=
 =?utf-8?B?V2RYMVdPYmlERmg2VlBnRFgwV3N6SHZOL3N1SmVUckNNMXhteE0zM0tDQUFs?=
 =?utf-8?B?SGwyNjQyM3FST0R3ZG50U2pqSzdEL1QzWjVPRUdnWTEyTE9UTG0yL1c3UlZG?=
 =?utf-8?B?ZGxpK0UrTlhqRTh2Qm5lWHcxMXBPZlh1T2g1Nm9zbmh5TWtuTkJmdVZxejhH?=
 =?utf-8?B?Mm85dDByV0ovRzQrdUt3VlBMVGd1UXo4WE5ndks1SWtrNTBpUWt0TlF4a294?=
 =?utf-8?B?SjZHS1F3RmFYeFdCRk9tMDErQnYzQnFDN3JGNWdKdHA1QlljYkhXN2UwUk15?=
 =?utf-8?B?U1F5bm9NMmMvTkVKR01NdWFqeVF2c3ZXWmk0eEU1TWh1NVpkMDhLT2FKMlNG?=
 =?utf-8?B?UVRZWkRTcm9YK1lGeWJpaUU0WDJwaEZDdDJBaURtMnlmZURSM3UrTFM4cVVw?=
 =?utf-8?B?emNVeHBPYVloR0xiUDVxTmhRMm5GRnBNQS9VRXJoT21kYkk0UzgzUXE3aXFY?=
 =?utf-8?B?eTJVZkVUdnkyTXJCcHg2cmJMZ09CWU5HMHQyUjMyZit1WmVxTmx2eGlDVGFp?=
 =?utf-8?B?VE1rWjQ4Z01EanJKTUx6ZHIyQVVHdnl4WVBBWTFYbGJpT0hTM2huR28rb0VY?=
 =?utf-8?B?eU1PUDdOc0hSVDJ3bGtFQ2NMN3crdTRuR1NkZVgzYjlKY2pWZFo0aEVmVDk5?=
 =?utf-8?B?TkFVVFNqN2pteC9mQldVTmZZcmFTR25oQTlKeGYyeDYrWXFDUFJ4aEk4aXFR?=
 =?utf-8?B?cjZvVjIrQVBkaGFiTER4dGtNdzJ4aXdzQW1rejZId0FmbTNnMjB0MUxpL3lP?=
 =?utf-8?B?dDNydXJmOHllRWtFN2hwdXRKUzg1NUJlVG5vWmVTU05hOXpDKytpbzFKOGwy?=
 =?utf-8?B?L2NPSzNpczNtT0tlcWp5dmFrMklYL0RlSnhqSFVTb0ZRZi9vZUFvZ2oyakx2?=
 =?utf-8?B?NlZKaFhsWE1MS3FUdXdLOWc5Uysvekt2dGJnOXpnclp1T09VMHR1R1JLcVpJ?=
 =?utf-8?B?eThEQ2VGbzNoZ0w5ak5EekN3cURLTmd4Z202eVMvY292cXJsYUdZeEhvK2c2?=
 =?utf-8?B?akxrLzFlczVPU2RHZnVPU3hXMW5PblI3S2Mwdm83SGxBbkVmd3lUb29BanJG?=
 =?utf-8?B?MnlReEpibGhKYk1YZjBCMElBdkcxeW5qL3l0QWU4MEwwTG43dWZKUGRDeS9u?=
 =?utf-8?B?cmlJNGdMVjdqeEZ5K1NjdkNzY3ZKakRYaWpldEt3c09TY1hZd0VYZnlGbmE2?=
 =?utf-8?B?T2FKcEJubW9nVWgySWtzdWlwdldFclpaYmFrTmhRNXlvQmR4M09ZelZ5cmFE?=
 =?utf-8?B?aWQwZ0xMWjhSeXcwbnkrZFh4aHloWjNZa3FtbW5ydy9xalBFc0ZpR1g5eHJU?=
 =?utf-8?B?Mk5VdEl3T3BuVnlTdFB5OThRQllhV1NGNTVXdkZuU090N1R2Mzhsc3pCbDA1?=
 =?utf-8?B?aVdERjVqWGNuMUxUc1BtdlRSb3JHQ1h1aUJzTUwzVTR3YkNNbG5nWk4zajFm?=
 =?utf-8?B?N1pRT0VWUzk5L2Jialo4ZHhiakt5Zm52MHRvblhrRUkwY3RhWkZQZExMQnlY?=
 =?utf-8?B?aGY0SzhWR0hKbytqVEs4elhvNTBVTzNJOU9zdk53YjBhTWxqLzViRFhJMXpR?=
 =?utf-8?B?emUzWHg2ejBGc2tKYnord3NpVVg2Qkx5ZWlYdFhJU1NZYTJYK0ZWQTVVWmQx?=
 =?utf-8?B?QUxuQ1lLSGZyY1hZZlJBMkJkMEJ0QnZhVXVjWE1uODRvZkVsWXBtdkhwMXZJ?=
 =?utf-8?B?SDQrc05RSFBFcWx4L2U5QkN3WXRYR2xYNG91bGh4N0RQeCtvT0JuUkRqYUpU?=
 =?utf-8?B?R3Z3RDB1eHZ6NFM2VEs2amlBRTkwSFFBTEtLTThIU3JJb0gxRFM4UGtpR2kr?=
 =?utf-8?B?eWQ2UGE0U21Pc0NOUFhjV0xFOFlrbWN4RjRNUGFBeXlLa0pod2RQR0RhRW1k?=
 =?utf-8?B?L2Y3NnpLWThoV3lYMGZQSEhvYi84Nmx1YXVTeXZKVzJ3NnJHMWppdjQzYnpX?=
 =?utf-8?B?TWdUU3FwMnFnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGY3T0NLam9iWk5FbDhjTVluZ0FYZkJvTjd1NVI1dkdMZC9kMlMzZlNzK21F?=
 =?utf-8?B?MkVrdFlldEwwZEV6WUVuUloxRDg5M2VsbUdvNnFQOFM4ZFEyK0tHekhYNklS?=
 =?utf-8?B?YXVGTHUxdkNCWURCU0dVVnkydW54YmF3ZUErMk5kdUsxbjJ5TmRodmFOWFdu?=
 =?utf-8?B?bkkvbzFHSXpWZkt4emhEQStVbFJtOFVkOXlzVzNwSERaaEtCWTdPcFdBNUVK?=
 =?utf-8?B?NTdPUit0Z253UUxiVWVVUHQrOGF3VklTMUkzWmpUeDhXUVlNVVBnZUlPWG03?=
 =?utf-8?B?M3hIc1V3RjlLcTkwc1RMNloweGNRcXJaY1pZOGdnTDNPdU9IaC9lWnJzZExF?=
 =?utf-8?B?cUhyZEtrR1AvRGRueXRDbUZkeVExam9jWlBERm8vTHZtYURGWnNPNFNYS2ln?=
 =?utf-8?B?U2wzVnh1RzBITkVRMlBDNzZqN3JaSmduRGI2Wk9iaWN2SUtvdnFjS2pnVEYv?=
 =?utf-8?B?N0hxRkpONDRqM3VvMG9lRE11Z2tDOHVEMVpaVHdxU3VkME9KOUttSlQyTStD?=
 =?utf-8?B?T2JrOUw3QkFhY2pFYXBsTGNDK2pGWWpXUnRqMmdVSmxWSEMxVCtmd2pGTTdl?=
 =?utf-8?B?aEZRUVpCUWhTVFZTNTNNRkZlL29rRC9tMFY5SmZPWC9JaVE2aS94bkQwYWNp?=
 =?utf-8?B?ejBERVdlTlhqM2ZsWlFVVU5sOGNqT2RvVFd6VjhlOHNjc1BTOE12SURwK1lu?=
 =?utf-8?B?WGl5STcvbHhDUDY2MHJrNjdjaENBMHR5aVFBOEdRdWlqOWxERWJ1N3J0K3J4?=
 =?utf-8?B?WWVuc2hPR25icHJKa0sraTVsUXJRWFg2ODRhL3hGbXphYTIxcC9rU3MxR2JZ?=
 =?utf-8?B?emNUa2JTa0JIVmNaR3B1T2ZBU29ud1Z0aEs0ZnpWbjFpSkk5TXBCTGhuYXlw?=
 =?utf-8?B?TFBaWjRrd1oxN1RBVEhuV3BvTXY4cXJjaytVN2l3cVNvUC9YVWEvYXFFNmxv?=
 =?utf-8?B?VUpNRjZ0UWtxZ1VJT3JoVVJpMVROdlYyN1ptSW04N2VGVXFvWURpZnk4VFFv?=
 =?utf-8?B?OG9xbUdVOXpmUklmWDBSSHF3anBDS0ZsdFNtZ1phejhYNlpEQkJnOXlENW5i?=
 =?utf-8?B?L0RmQ0pZcEFFeU1mYVBJTmJPcVVkS0R0SytnYTRmMGdnNTByUU5CRkxVMCtp?=
 =?utf-8?B?QTZ5UVRSUXF3M2p0L0xMOFViSjlLU2lGOEVFd3dVQndjYzFiS2lLZlNBYjd3?=
 =?utf-8?B?N0FlV2N0bloyeUZaSTFldlhpSTlsa2c1QmVZR3VlWW5NQzc2Uk9JVjhaQWtl?=
 =?utf-8?B?dk0wVmp4M3JhMlIvTXlQbVNhdDB5SFdSQVg0U2lLdEhUNlRkTDM5WFk5Sks0?=
 =?utf-8?B?TmtYVCtQdTZiaE1CV2g1VVVPVUtsOVd5ems3OGtENU9WN2RONVZ6QzJKUGow?=
 =?utf-8?B?bko4MVRRUEhreVBjSkQ3RzhsRkVFWko4MU16cVV2NkgzZUxrQTdGRHpKYW5o?=
 =?utf-8?B?MSthSWdzUDErM1VrNkhRbmxkMmxXeUNJUEZiQ0xlNTJFSGxaakJKSE5YZG9J?=
 =?utf-8?B?eG9uM2lxaFVveWpmalVBT0tFNTJUbFFESWticHl3VEsrenZBMTNENFppQzRV?=
 =?utf-8?B?VnZOUjBNenlyNFhjTXJ4cW9hSFkyT21Vbnk2NXZOamR6SmtxUWcyY2tRVGp0?=
 =?utf-8?B?MmNpdGdiRXYvNndZV2JiTW9RQys4YzhuZ3p2VmFzQnBhQkpMWHBXSHg5R25R?=
 =?utf-8?B?b3djMURQVzRTNFplT0ZLZ0RXL1lQTHRabzVpR2MwQ2N6WnZDWk9XSHlBd1Qy?=
 =?utf-8?B?ZGV1S0FiMzMyYlNENWdidnlwRlhTalNRZ1FwdmdSTTFZMWpGMFRLY3hXNXA5?=
 =?utf-8?B?N0NLdTAxZWJGWFdHa0RRTUwzMkMydVJ1WEJiVXNJQ3AwaVZPT0hMMGlpRVpY?=
 =?utf-8?B?c29aR010Z0V6ZVZjOGJWTjBwWVgrS2tqUjNXRmJ5bWhQZFJFVk1pT0pTbDRv?=
 =?utf-8?B?YlhsU2FGb0dPUis4d2k0NmFnVHJRRDBCekowTDJ3RU85ZDRpRnY2dHV1TW54?=
 =?utf-8?B?Wm9rOFlKbERud2tGNkVBeFJKMmRYMnk1cTVOSStUZjFzUWs1TjlOKzZxMyth?=
 =?utf-8?B?d2p4N05hS3FZbTA0T0d3QTc4cXFoTXI4S2tQQ0RiSmlrazhleUlucDFkRUZU?=
 =?utf-8?Q?Su1UxDc/yrhh+KsVOWvFqdV4t?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fcf4abf-81d9-4204-8f11-08de00315375
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 14:54:58.9254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pQfjNH26GFOvYUh3pOaYyhVrDLE/KfFYyXsE7fBt65th6o6ZIkzZ8ct3BuDIAw/7TuBHBOK39J4tbrDwy79AFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7699


On 23/09/2025 17:58, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
> 
> Existing code only sets cpu and gpu speedo ids 0 and 1. The cpu dvfs
> code supports 11 ids and nouveau supports 5. This aligns with what the
> downstream vendor kernel supports. Align skus with the downstream list.
> 
> The Tegra210 CVB tables were added in the first referenced fixes commit.
> Since then, all Tegra210 socs have tried to scale to 1.9 GHz, when the
> supported devkits are only supposed to scale to 1.5 or 1.7 GHZ.
> Overclocking should not be the default state.
> 
> Fixes: 2b2dbc2f94e5 ("clk: tegra: dfll: add CVB tables for Tegra210")
> Fixes: 579db6e5d9b8 ("arm64: tegra: Enable DFLL support on Jetson Nano")
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
> The Tegra210 CVB tables were added in commit 2b2dbc2f94e5. Since then,
> all Tegra210 socs have tried to scale the cpu to 1.9 GHz, when the
> supported devkits are only supposed to scale to 1.5 or 1.7 GHZ.
> Overclocking should not be the default state.
> ---
> Changes in v4:
> - Check soc chip revision instead of speedo revision in speedo id
>    conversion
> - Link to v3: https://lore.kernel.org/r/20250903-tegra210-speedo-v3-1-73e09e0fbb36@gmail.com
> 
> Changes in v3:
> - Drop all patches related to limiting cpu frequency from a dt property
> - Link to v2: https://lore.kernel.org/r/20250903-tegra210-speedo-v2-0-89e6f86b8942@gmail.com
> 
> Changes in v2:
> - Define units in patch 1
> - Update patch 1 commit message to better explain the need
> - Pull all downstream sku's into patch 2, which eliminates patch 3
> - Update patch 4 commit message to indicate the limit is due to thermal
>    constraints.
> - Link to v1: https://lore.kernel.org/r/20250816-tegra210-speedo-v1-0-a981360adc27@gmail.com
> ---
>   drivers/soc/tegra/fuse/speedo-tegra210.c | 62 ++++++++++++++++++++++----------
>   1 file changed, 43 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/soc/tegra/fuse/speedo-tegra210.c b/drivers/soc/tegra/fuse/speedo-tegra210.c
> index 695d0b7f9a8abe53c497155603147420cda40b63..a8cc3632977230fbfda0f8c3bfa7b7b25c2378fe 100644
> --- a/drivers/soc/tegra/fuse/speedo-tegra210.c
> +++ b/drivers/soc/tegra/fuse/speedo-tegra210.c
> @@ -65,27 +65,51 @@ static void __init rev_sku_to_speedo_ids(struct tegra_sku_info *sku_info,
>   	sku_info->gpu_speedo_id = 0;
>   	*threshold = THRESHOLD_INDEX_0;
>   
> -	switch (sku) {
> -	case 0x00: /* Engineering SKU */
> -	case 0x01: /* Engineering SKU */
> -	case 0x07:
> -	case 0x17:
> -	case 0x27:
> -		if (speedo_rev >= 2)
> +	if (sku_info->revision >= TEGRA_REVISION_A02) {

The dowstream changes just have 'revision == A02' here and not greater 
or equal to. That said, I believe that A02 is the greatest revision of 
this device and so this should be fine. Thierry can make a final call, 
but otherwise ...

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic

