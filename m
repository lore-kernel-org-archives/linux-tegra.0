Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2077.outbound.protection.outlook.com [40.107.94.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6B3286A1;
	Fri, 13 Dec 2024 02:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734057142; cv=fail; b=XvS+mn5XdPYQwjhUOhqvk32g6ypCqVd92K4OWYAnYPj+QNPY+DGMqQHX9s/2UQUuJRr0TpN53brW+5S+y8AbrB8mRYYbZnoqx6n3npEquzc+8TWKcDbbueOVw7IySCBsmPgGAEq+7W1RRQ0GWZYAkqzIYKk+v+GMNL6Zl/p7SQw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734057142; c=relaxed/simple;
	bh=+TwQeZogFeHuQ5nJDGAxW+ez/oic6IRDBibLMI0iULE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jnTxtHqg0bQMwdYf06qwSHB6IKmw7jWt4plieMW89waZ/FCUmdAwC0bEnz1P/GOjRcoCXB/ovCuD+UYTD1vEKVgWKd49+UDGxAgCyxu2bhUD6fYosq5cKffJarXhruFyK4hvG1lsUgwdMa+OwFRPGqBAtw3VoKWclmebbHkuhgk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=eXVarXQI; arc=fail smtp.client-ip=40.107.94.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="eXVarXQI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WYyzZKBf3v18Ho4lJxWFEAf220Ip2QWTR68/zvM0C9ZSowoycOpyzz9eaKI/amFzaOUWQ85vieXawfYkHY6rSzXS1yIE5Z7TyGe7Tk11Bu5Ckj/jcX54N2k+1fpWJlmZNxYgeps6JvNSW55rYynHh412AY5a8UofThsaPxdJRStiE9cH4v0bsFDodKxevQieU/TzJl695SvfHcfwddTRtKXEr1uP0OHwe2qhx0PESXndsLwFgLzN2adbLe4xehA5sCggHFOdE3ZhD4F8TpgGrodLUuRx2QuxaJYbc5d1M/u1rO996nLVln21SVimSbeEeEWtRnq+Cc7VqeH0WDTb1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h27djzm1df4WS143oXfHf4wwIfK1GxLpGQN+1+pExYY=;
 b=MS2knIT84U1XhsvoXKyjcNHTIN+OfXeke+FzyFEi4Z/yJ47qV1a39NvwNAYNqDIzRHd8yKu9+wgOQNGZijO6MsTYnGl0sG12Hj13iTFUQqoO6GEVbgZ6Dtf37ygDSKe/pTx8bJBvmBLAnbFWNE1C6QbNqCCini2T2Z9BSTNOhKkXtdFrlHT8Q1mwxVZuUQLdRdWLKuLOlcgIBKyBVzOJvIjwRpxYe42soPpAeWevrIXTwAhEKAhxNuZUuh6bJpnjd/Yj54SA2Aw+5cM8QQe3LcAePLX+qLRxTklZRy7BuxfXvnw7xrX8FRTVtAQi16Th4EVychONJOUkADVBBCiyRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h27djzm1df4WS143oXfHf4wwIfK1GxLpGQN+1+pExYY=;
 b=eXVarXQI/nEs2DUHcRVbRmCgGAv71XKyi9TNUZVrJ+NXhd5BvI7448iVLCrkx2aCDfhC0diNZ64aCC/hXx9Hmpz8pKaRDZh+n0z8H49sgi6ik5b5WD4kAcUlhcev7W72nwynsdIMYX9hg9nrlPMbw43tfbFs6sQ+iKFRC+ydXGqIptIVmhsyOzGrh66cgwkgOhkPserXwOHoJxfqEPCJK7a5ICsUS4qX802ycjExZ6CdRN24vZlCAzjI7R8+SgttwYhCWsrCRtWX2ij0kuQ+PN5JmwGGTk/F23o3bWV+sP22RLco7pM0qI+bcTkG56HFN266Q0h6sNalIlxe70DRFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB6237.namprd12.prod.outlook.com (2603:10b6:8:97::18) by
 CH2PR12MB4070.namprd12.prod.outlook.com (2603:10b6:610:ae::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8251.17; Fri, 13 Dec 2024 02:32:15 +0000
Received: from DS7PR12MB6237.namprd12.prod.outlook.com
 ([fe80::64de:5b39:d2ef:8db6]) by DS7PR12MB6237.namprd12.prod.outlook.com
 ([fe80::64de:5b39:d2ef:8db6%6]) with mapi id 15.20.8251.008; Fri, 13 Dec 2024
 02:32:15 +0000
Message-ID: <2001b9f5-42c3-4336-b2e1-4e9b4505ef3c@nvidia.com>
Date: Thu, 12 Dec 2024 18:32:14 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: tegra: disable Tegra234 sce-fabric node
To: Ivy Huang <yijuh@nvidia.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Cc: Sumit Gupta <sumitg@nvidia.com>
References: <20241213000305.3533971-1-yijuh@nvidia.com>
 <20241213000305.3533971-3-yijuh@nvidia.com>
Content-Language: en-US
From: Brad Griffis <bgriffis@nvidia.com>
In-Reply-To: <20241213000305.3533971-3-yijuh@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR04CA0010.namprd04.prod.outlook.com
 (2603:10b6:610:76::15) To DS7PR12MB6237.namprd12.prod.outlook.com
 (2603:10b6:8:97::18)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB6237:EE_|CH2PR12MB4070:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e072f76-b960-4555-de55-08dd1b1e5b97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bTJMcFgvZDhXbGY4TmNjLzU3TFBHTG9aanZMbWhBcklpR2RsQ09TZkdQQVZX?=
 =?utf-8?B?MldSdDJveXRSMFdIcjA2SlhpWnJzblVEL0NEV054M21TNlJNcHROWitMbUN4?=
 =?utf-8?B?a0c3ZmcyYTlycC9QaEw1QU82ODJpYUpBYlVwai9SemtrNHN3cWFaZmYveUN6?=
 =?utf-8?B?clF1aDVxRnR0aE9MamlsYVBXdW1FK0lDcWhKV0poMXZ6RWEzT2Q3VGd0TjM2?=
 =?utf-8?B?ck9jVElTdXpPRXE1b3dVUVZFS2lZNkR4RU1HRnVESnBUVHZudWhxUXIwdGhS?=
 =?utf-8?B?V3pXN29tTk8xVSt2ZEJDUVBpZzhIdXBIakR5UWpBSEpFNjYxZU0wcnVSUG9S?=
 =?utf-8?B?aVBTSk8wakJpdG5XeW1MckU5NXIwZmN2Mjh5Z2ttY3hBdGlBL3dITGdTQStV?=
 =?utf-8?B?STRWdi9lazBnTWltdmUwQmhrMGhqTXRtZHovdXJYeGRoVHJ3TGtGd2hzZC9P?=
 =?utf-8?B?Mnc5clUzc2JLNmwzdG1BS1hHYU9iU1VSK3JIc3JmNC8vbHVkc0QxRytnZjJ2?=
 =?utf-8?B?WlgzU3A2bUllT1AwSHgyTnljc3ZmQ29DSWhIMWNhRXV5RzMxNFliQkRqR3Fa?=
 =?utf-8?B?ei9RNHFkU3BiUy9ZK1ZhK2twOU16MkFnNjlFcTlEcCt6TTFiOUs2UEk4TWdz?=
 =?utf-8?B?b2dnVWtxQ0liZG5CaDNxUmMzaktqVG04UlR1NHQ1NDR0ZFpDWTB6ak5wTWJs?=
 =?utf-8?B?emVESU4wQXo5Uy9NdzVoRUlISy9VUnppdDVkRXlpRnZhWk1IMXpNWHFVbERX?=
 =?utf-8?B?cUtrSXExekc5NGtMa2RYZnJBY3BNa2d0aEhUazBwZWZ5aEtJZ0JycVgzLy9x?=
 =?utf-8?B?YmZaejNpSjltQkhUUHl0cVRjS1VXRTB2VzJRS2dhcGV3by93Y0E0QlhsQVp0?=
 =?utf-8?B?SlhvZzhFUWRZUmRHWGQzelkzUTZYcTNNV2YwUzZOaVpkN2hUYmNQYzMyMXVq?=
 =?utf-8?B?Qmd0NlVSVmttRkNmbkxiNU5ZY3d4NnpkeURWelRRWFdQSkNMd2NHZ0w5UVpI?=
 =?utf-8?B?eE9ObGYzMVZjSmdWWmkwTWpYdjhXWE03bWFBNERxRjVocXRPb1RwenJtdnBx?=
 =?utf-8?B?K3dEUHorclJDV1dGbnFCWnpHL1ZCbHZURTVwWmhCNGNZSHo3Zk9ZeS9qSzBB?=
 =?utf-8?B?ay9XbnYwS2N6MmMyeXhJdzh3Q1JPK3B3SFFOQ3dCT3JCaHNoMEtlTHFGRVpk?=
 =?utf-8?B?YXpmN3ZpTmJjM2FoNTRxOW9XMUpRelY1WEZETXltc3FvUnV1c2s2MWc5Tmwr?=
 =?utf-8?B?cHp3SmZLV2JVd2l4amwveVF2aVI5ZEVlK096VThMV2FJbC84aWdWUWdqZU84?=
 =?utf-8?B?MSttOGFPN2dmYlRJRnJKZFRrRnh4Qjl4MWlKUjI4ODdrNFFRandtTktsWTBk?=
 =?utf-8?B?bFR0V29tZk5MTDliRFp2Qk5oTVBieWVsdGJ4Z2xScVNHVzdTUWQyV1RrR2dk?=
 =?utf-8?B?emhqczBwOUVsb1puTFM3U1J4QkxzTkxhakY5d0N2bEoybzBQU0p4YTgybEJr?=
 =?utf-8?B?TXdNQkRTZ2RFTTBvWDBPOWlBMnEzMW9KUTNxME8vaFJTSUs4a2lJZkJOTHpo?=
 =?utf-8?B?RXF4YnpJU3NXaUw5enV4T0NKTDFaeCtDRU40NVRCcEl4cnYzZTRadmpKL1pa?=
 =?utf-8?B?RU02UUNjdGZjdW1iaUdaNVhjTGlPMGw4TVo1NzVuSFJZcjh5OVh3VStHOXlk?=
 =?utf-8?B?UHo1MTRjTThacy81NFl0T3hkTVVJT1lZbnJKaksvWHE1WHdmSDJOTjg5VzlU?=
 =?utf-8?B?VFdUOGJFZFpOTkVuakl3by9tRi91a0hRcmJib2lFQU5SeENHdEE2NUp4ajky?=
 =?utf-8?B?Ylg2cVBCMDJYZklFOUprUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB6237.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXhIMVIrM1V2OVd6M2tZSWQxMk9hbmtVREU1bHhmaGo0MW12clZJTjduclNZ?=
 =?utf-8?B?SkVuVG5KcVJybWJHVE9GeE8wY3l5ZFpuMDVqSGx6TS84OVIrdVUramE0Zm55?=
 =?utf-8?B?YjhmVnpUQWRmc2sreEphRUduSDVtUHcxQUVFU1UzV3BORGhJNjk1TzRqZE8w?=
 =?utf-8?B?L0pXNWVnTTNBb0R1YTU3LzNxTkZxekFqVzhqRmVGUXFFMnlQeWZXQWVBS1c1?=
 =?utf-8?B?TkY4aFVFQlAwVDIvRmZub1JtK2NNeTJmamhqK1lHaTBRbnY4cnhiVlE2NVUv?=
 =?utf-8?B?VXZsUFIyN2E5ZzNiUnA5VWs3b0k2b09EMk95WWY2TGVRcVRFcUJpUGpWLy9U?=
 =?utf-8?B?aFdSbGVuTjZTekcra1FIajNnUnVXNjgyRmh2SzNBS3hHRElScmEvWDlOaTBa?=
 =?utf-8?B?TWk3UnNRcnpnaWVSR0FMRjZpZy81bldiTSsyT0ozK2ZraUt1Um9JRzAwYTJT?=
 =?utf-8?B?RUVBYzlBcDFSN1FGeU9SQ003di9CaHBwQ1dQYU00OEhzZG5kaVI5OW1OZUhy?=
 =?utf-8?B?cWFoNkVUcitkMzR2RnErVGNNSEZKQ3ZSMHNOOXJ5MjA3UFVMS0JQUGZNUk0y?=
 =?utf-8?B?bzk4UzJaTE51dkxwWW13Q0RxV3REdS9UNTVwRW10MFJSeEYwU1gyZFdteHJB?=
 =?utf-8?B?WnRaRHRnZURHVUZEWVhieVdQSkZZOGoyUmtyTklXZDVzYW5iUkM3K09QOXhS?=
 =?utf-8?B?RzEwd3RNV2JpZ21qMnhSZW5LaE9MYjJYeE43eUhNQjJBNzNteTN4ZmJXL2gw?=
 =?utf-8?B?dEdDTFBobXphUG1BWVNRM1NqY1NROGVKZnlqNmhVVUoxSEFzMVdOWmtBLzN0?=
 =?utf-8?B?cTdHVjhwNHBCWkQ0dmh1U2ppdWd5Nkk0V3JaSzV4d01maUFKQnRSaENOSTdQ?=
 =?utf-8?B?bUpaVGtCK1JjTGc1cFpIMmZKSlpYRUNlSWR6UGoyN08rbUdkRXZCbnJxUEl2?=
 =?utf-8?B?NUx3QnhZNW95N0lxNjF3aE1SUmhacUZFTnJwdldmZzZlWUFEWDFZUWRHMWNw?=
 =?utf-8?B?cjhjbSs0NWdjTDFTZFJuZTIwZVoxYTF4WWtqK1dXNEU3Y05JdGZxdVpPcmVG?=
 =?utf-8?B?VUYzSmhhejRJMzVWQmxLZFNrczRQc2F2eGJDdnJtVHNGREFwV0kzbUhQdVQ4?=
 =?utf-8?B?MDRTeUFHQ2ZLeTI2TnRYYlE0bGcvZTJVbHh4YkhHb2NLaCtnRW9uWm80aklP?=
 =?utf-8?B?UTk1U2FFOUE0ZklZRzM5Tm90WG4wUVVETm9aVXlxMmJGZVFRVFB3eE1QK0Nx?=
 =?utf-8?B?S1hhSTk0QlZoeVFNOTNHbEE5d2lhd3ZPMWNORlBTbHRzdEJ4TXBmSHladS82?=
 =?utf-8?B?MFVsRXBJUUJIWjdLTGJHMU16ZStTaWRvQW1vTTFVRXZuZW1WNXpsWTRSUzZ4?=
 =?utf-8?B?VzdZK3A3TWlQZzhUZHpFZGZDM0MwVk9FWlZqZnZ6RkVTUWxvK3J0U0twTTBD?=
 =?utf-8?B?SjZsd01pM0p3Rzd3Z2Exc3NDSTkzNGJTZVJ1R0pPY2NIUjdnRVNRK1pZd01x?=
 =?utf-8?B?dm9KUFhoMlphL3p1ZlBaRUcrdHlrS0hwYWJQRHFjSnBuR3VkUlhmbkd4VkNZ?=
 =?utf-8?B?Y0xiQ2FVbkM4a2tndWdSZnVON01QVWg2QXN5R0FMMDNJN1hiUGpFWXE5Q3Mx?=
 =?utf-8?B?Szl1NU1VWlcweHZuNTJmM0Z3eFZZa3Nxa3BSZThvZHlkNlFXT2tWblVNOUdv?=
 =?utf-8?B?ajI3LzVaR3lVSTNYZVpGR2pPTHVNQW9ZT0ptNytvclN3eE00QnRYWUJ5aTZE?=
 =?utf-8?B?RU5oZjRkaXJTYTAxMitBQXUwMjV5d01BN3VjSzRJdWJVbC9qcU5rejZNNlpi?=
 =?utf-8?B?YTJGdUhseUorRHMxdGdHakdwVWZYOTZkMFllamgxRDhJNVZFS1Z1M1lHcWh0?=
 =?utf-8?B?S2l1Y2ZJbS8xWHNVdWZHZnl5U1lYSS9UcVI1OEh1MkRVeWRmSXdtYkFQZG5m?=
 =?utf-8?B?OXZFZ2lsOUFXR1Y4bDhDR0lpRFVxRXVEY0VjcXBqMWh0dU1IV0tHbzhsU1ZQ?=
 =?utf-8?B?bWVHSjI2Sk5IaXBiOUNlanIzQ1pKRzBvZXhZUzc4LzY1TDZJd0VWK1hDeXNq?=
 =?utf-8?B?VFoyYTdNeXcyVSt4SHV2SGxzUE9oNVpJeWFaMHdFb3R5SnAzOVI0a2hGdFky?=
 =?utf-8?Q?/idgo5B5Pp+HQx+LWiDFz98po?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e072f76-b960-4555-de55-08dd1b1e5b97
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6237.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 02:32:15.7386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gr5VEh9bOWvpxJQB+tv/v+qeU1WWAl9gLwtQnXymgXhVf1KoQRKjpCrCKcI1WXaY/B9a/WgtwmO/VPAUha3nxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4070

On 12/12/24 16:03, Ivy Huang wrote:
> From: Sumit Gupta <sumitg@nvidia.com>
> 
> Access to safety cluster engine (SCE) fabric registers was blocked
> by firewall after the introduction of Functional Safety Island in
> Tegra234. After that, any access by software to SCE registers is
> correctly resulting in the internal bus error. However, when CPUs
> try accessing the SCE-fabric registers to print error info,
> another firewall error occurs as the fabric registers are also
> firewall protected. This results in a second error to be printed.
> Disable the SCE fabric node to avoid printing the misleading error.
> The first error info will be printed by the interrupt from the
> fabric causing the actual access.
> 
> Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
> Signed-off-by: Ivy Huang <yijuh@nvidia.com>

Reviewed-by: Brad Griffis <bgriffis@nvidia.com>
