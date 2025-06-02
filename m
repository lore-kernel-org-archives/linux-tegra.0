Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2060.outbound.protection.outlook.com [40.107.94.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64821B81DC;
	Mon,  2 Jun 2025 14:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748875687; cv=fail; b=h14JmcU0S92DnunFMjOi2ChrT87oXppTRQ+v5xUbXxtqc2OU4VD/CucvvuRU5hPhI4daQQTQQZoCMTnS6CxyoSwZYa8cLmyc4zbM14RDJOXH4DsJXL3H7UuX0EHC/T31cQijFubUdEG4ySbutZwuwgzsKdG+SVJZDX76ntxt1K8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748875687; c=relaxed/simple;
	bh=ns9nQ37egKBNfuSf0oUCSVkxtzaToQtiNYk1/YnjxUY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mtuONyIqZB430Eld/B2H0p+N09LTw89D3lgMHVDE16m27ZKOK0sztYhzsd18KR48cWqyFJXW9hgBpOrW9gP/L4aq/MqULPU3VkBj5AqOM0k5uPQo5utQ+mLY2pLV1MP3GCiItKYs9Ujonc9DLG2415DVzcGkBqURCid+3wqT93Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YNo4QXI7; arc=fail smtp.client-ip=40.107.94.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YNo4QXI7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LqrQ8V+SyH5vSLpaCpefB6blbeN13yi3LPsrvVENMPOBFRvtKX5gMWx3HM96mUpIc3gANGgV9p6zaPAihNq0yBB108ajzSmAQwy4DjY+RDiyw+KpUm4HyFPudGo3zl6LR5udAQPBTiLp37xcZJ3jPM5iZkUSAsiaTT+vRl2u7+SNkHUoknpXMpfOqb/p7EQBzoow53h/MskwjEOkVmm52rilUTxPanEjcMQjqfddW305soB4vtgQ0rVX/Ye/XVJI8TCY5G7E+PBDaRH+wsiY2DWOdw4rDkWR2lpxxsU3Do5IBEro2qKCIQV+H8nUmtqyKMiwu14beV7un0LOM80aHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7cuFP6SXrs/XIgXmLdCSHTUbPUQi/Q3PN1CFBiF9hbk=;
 b=n00Vt29bk2HmcZ9USN8ASDMcaXG5LWry8b1E1xleWtaeZnDszuNmIr5mAzUhYhfaDPzmk50b40WF9UkXpwAdGa0Nv38yyG+t4o4Iu/F35ekq/V8Nxch2mmuQMN+hwxHAiAeMZ+N7OfkqzGQ91hh4jKxPGfOETYlUG72Mo0exy1wTnknTYikso5caG7aVG2mhA0TteG5JWtg2d+vo0s3AWZP8Xq0L7MRkuJA3noDMiBxIPETJzKFLPFQT5QXRvY5DjL7E0Nciiks89Fnu49MgYfkI/lw3Xt/d0ZcQBksL5pPp7jb5741qbLoMOWo4VqiYxI394PIb3293oAaRKtzdzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7cuFP6SXrs/XIgXmLdCSHTUbPUQi/Q3PN1CFBiF9hbk=;
 b=YNo4QXI7DrEj+CVodVjQIoaMaBqhRslDm/qc7Yg2oYbz3LbdPhicOgnagZ878VeweyI+sLLP39YmZ3aZ1jLORaksRvbyUEIhyAlHWoCayn6F+MYoR2/55PMcoRei4g6k9fm49qNWN5VgkxH3MQhrcqoUPT3z5VsRjcddenuksUsIV5kQLCbesMKuTuN5VnDb12ptu4anj8qrMbtz8BL4KvvqxsRmPheY0tr6NyKQz0pc+kbStbPfDv3Jn1zhfrYyEO/3UlxxZGb3gTfMpS8l3Ht9TOZOJ5Ux3TagPh/W/vEUELULMTydEExpirod4ygbJXCixcyKs/bGdyKCGPKBfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by DS2PR12MB9711.namprd12.prod.outlook.com (2603:10b6:8:275::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.36; Mon, 2 Jun
 2025 14:48:03 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%3]) with mapi id 15.20.8769.037; Mon, 2 Jun 2025
 14:48:02 +0000
Message-ID: <2d1be16d-c5ac-4567-84c9-73310a253b1c@nvidia.com>
Date: Mon, 2 Jun 2025 15:47:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 4/6] rtc: nvvrs: add NVIDIA VRS PSEQ RTC device driver
To: Krzysztof Kozlowski <krzk@kernel.org>, Shubhi Garg <shgarg@nvidia.com>
Cc: lee@kernel.org, robh@kernel.org, alexandre.belloni@bootlin.com,
 thierry.reding@gmail.com, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250520090832.3564104-1-shgarg@nvidia.com>
 <20250520090832.3564104-5-shgarg@nvidia.com>
 <20250521-dazzling-myrtle-flounder-a9e57d@kuoka>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20250521-dazzling-myrtle-flounder-a9e57d@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0156.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::18) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|DS2PR12MB9711:EE_
X-MS-Office365-Filtering-Correlation-Id: a7d1bf4d-8f60-40df-1e86-08dda1e479d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WklsT3JYUmxVb1JPUDFvYURMUnJvL1k3S2Zya1h2VWdaWXZRODZVdUxDYXJR?=
 =?utf-8?B?dS9hbHhReGR4OEZ6UjQ1S2lyMzBaZUtMTWhGQXBsaFpPSzI2SWNvb1RsMW13?=
 =?utf-8?B?cWo2SHlXQjZ4UlBwc1pRTStockFHcGxKOHRINm52d1NIVU1DQ0ZBWXVidmdm?=
 =?utf-8?B?OStRQlYrZnlhMFBkU0dhTHhHS1drTWxUVUp1V1lmSUlJSnQxTHNVdEkram5Q?=
 =?utf-8?B?bXZESURWTmgwSFV1aVdQclJkU084bDFER09GdGxtajR1Y2I4RStKQkt2UzlR?=
 =?utf-8?B?ckJHR3ZMVXFoaXdYZjY2Z3R4SVZ1U3hWZmViSzJEOStOaWFrMXVmTVJTeDJS?=
 =?utf-8?B?NjEyanlhemQ2cTlpR3JDZGlNbVFjU0V1dTZ0WEF5bERzNzFvT1U4NkVRNDVQ?=
 =?utf-8?B?UWZza1BhdFJuNGQwalJ0amZjNkZ5YWxmd1JXcUlnUkExeHJQQTlyWlJQYXdP?=
 =?utf-8?B?dVJBOXdQcHJQZno4SURCRzZSbHpjTFROYnVpQWRObFhGZXVQZGtKWlk1YW8r?=
 =?utf-8?B?eHVsbGdIUGFuQklFUDBVaWlnZGtxWk5jK3lRKzlqM01YcS9kSHhxSzJLVHNx?=
 =?utf-8?B?UEdEaWpDNlI1NGdpNjhRWWlKRHFVakUwSlg0UkxVTWNYRFdsVmRDSGtEbkFP?=
 =?utf-8?B?L3ZWa2lPTEpEZFZsQm80emFOMVRVQ3ZBZ09pakpOU1RNWExBdTRJNDhvanJm?=
 =?utf-8?B?K3YyT1p5NWJMVk1HVWp5WmdYLzlJOTVMdktHbVhVOUYrTFJudXlPWFI5ZmZa?=
 =?utf-8?B?SS9ZS3U0b3IveW9nTnNhR2VpOERCdGJoelVySHlVeGowUVlaM3V0dFNxOXVz?=
 =?utf-8?B?T0xadDhua2NRamJmaG40OUJHTlN6aFJiT3NsV21XSWJGbFVSNzA0a2dWaWt1?=
 =?utf-8?B?by9lZnI2OTFBbFZwQVVNdDFhbDNkM3A0RWdvUW5MdC85aWYxcmd1K2crTktD?=
 =?utf-8?B?c3o3WjlqZ3dqNndISWJFNzRBWGxmZkNuU0Zyc2NveXpYd1ZJS1dwYlFLWmdW?=
 =?utf-8?B?SU9lRlZsK1l1YktIVStQKzRKL0lzSUdrMlBzdVVtZUtlVGI0LzgyclRMUVBT?=
 =?utf-8?B?MUQwTi9LODF6dlhXOEZIN3h5MERSYUdyaDBOdWZhTStoaGJ0aTRaakQ1TkJK?=
 =?utf-8?B?RFVmY1N6UjRJREZlWDZaQ3VvdHk1NVJTaENCN3FkTWZ0SHk0UlM4c0lwbTh1?=
 =?utf-8?B?czhGakEwcFlhcEdBY3ZGWkVXSzRFVUZQMVQwdjZuNlhkL0JTUU4weFpaZCtJ?=
 =?utf-8?B?blVuRlhvNXMzYlJ5WmZrbjExZzFrLzk0NlBwRzJLemZSUEhocXNHS0tla1dt?=
 =?utf-8?B?NklXdUpNcloyWFBwWUI1b1Bld012WTBIQTR5MWdwbU5qOTcxMllFVWw3SGll?=
 =?utf-8?B?M2tKVG1FWWU0bzZBM2xMcnp1cytNQ1dSQTd2YS80NDR0alRyWkl0WjNOYm5w?=
 =?utf-8?B?OEVha0xpT2lUTkF0THBmd3hhbGhFblFFVWpHWFdlbE1RNzg2VDlJRUNxNU0x?=
 =?utf-8?B?WVJOdkltTHJ3cHArZUY3SmxMU1hScmJVN2lZTWc5SHNjaE5YcC9ETzhxM1RU?=
 =?utf-8?B?VWpXdUhLRjBtMGZ1ejNHNTBXNXRVdzBCMVQrQUZtaVhycm9MY1pOMXN5NW5I?=
 =?utf-8?B?UW85aHVDam9LL1BOSERnaGhDeW1hWDh4bXRXSjVOY0RuaU13N2U3bE9idkdJ?=
 =?utf-8?B?VXRvTFM4S2RGem5TUFNuaFNUSExWQ0FESURya3NEYTlSNHAvN3VycnlTTVdO?=
 =?utf-8?B?V05SZXhoV2xpbUlibVRQNHdtMEFUdzgrTzBWeXlsZ1VLMVV4N04renlYZitU?=
 =?utf-8?B?NUNwd1IyY3puVmU2dElqUzEydVhvTjhCMERtSzV1QXV5ay9PSDdFSEFRWmZL?=
 =?utf-8?B?SkZDaUM5RkZrMTZPc1h2VyszazI4S1h4VGZSYnQra0QvZXc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L05wMWRoMVhXdGVzWk5aMzQ2UUl0Z1FDV2VPckFPMjZpQlgva1NDbkJaSzYx?=
 =?utf-8?B?SGJJRk1nd1ZFOEk5Q04reWxPVjV5YmlmM3EzaFlneURiTUtzREFlL3BlSW9P?=
 =?utf-8?B?S1BMVXhqZzV6RGljUHlzemlQWGtmRzRKb2E4RmJKZk13emM1ZWEzTWg1YUN0?=
 =?utf-8?B?VUF4L2JtS1JSY2l1TS9pTlh6VmJBa0RPa241NERENnpGZjFPZ055SFZuU29L?=
 =?utf-8?B?eThUY2d0T0ZCd25ac1Nua0lQc2JKTnJoTDZtOVNJOUQwTTA5a0pHWjVqTTlz?=
 =?utf-8?B?UGswWlYrZkgyV3N2NzZiYngveURTeGJjMnRVVE9wNUk0UStUMmRtTDN1V2tv?=
 =?utf-8?B?R1RITVNBeldJbVZvd2RnMVcvUlZYQjhHbWhTMUZzb2wycFhrNGhxVFRKekFi?=
 =?utf-8?B?MzJ6UnBEVzVHZVlnNUJMeUZlOGVaQnFCS0k0cVBtRmJMWk84V0Z4aFdKRWNh?=
 =?utf-8?B?Y2x4SzNXdlA0S2hjdDQvVHZScTJEcmV0blFuTTE5SzNySGpsbEhnb0lLcWRx?=
 =?utf-8?B?Ym5maUIraE5yUWl2dHUxckkxOGdtV1Q1YUlZazlzamY3V3JwaXNaUFR1WVNu?=
 =?utf-8?B?M1B0TmZkbTVBMlR5WUhDZm1VNm5OdmRYc3hrQmlPd2RyZGxscWtWMzNSekhs?=
 =?utf-8?B?ZE91M2JSbjEyUlVlSTBhbTJNSjZKWVl4cWx0c0ZteGpxWFFVcWJVS1F2MWxM?=
 =?utf-8?B?VmJ2bDhKekY3V2UvN29XSGRRL1ZPL3VrVGlJMUROYlduSW85K0I1anRMeDVB?=
 =?utf-8?B?eU9ieXQvMWprVU1nUy84dDRhQ2gzTXZRTkIyZUhYYlRPeEY3THE2RlI3UXVJ?=
 =?utf-8?B?RUhSbnRaVlRLZG5rQWIvVlk0RzN4dzRrYnVuMk9VRzFudlVLUjQ0Z2ZqVVVh?=
 =?utf-8?B?ekpBRDI1ZW5OMmtmbXl3NXlHdkpNaG1vNURtZjBjTlYwbWFMOWdNSVNubFls?=
 =?utf-8?B?ZlpLY0lyam9RQTcwRktVTThMNUlrTE1pa2c3dHcyZ25Ma2t2RFJtL1hnUkJT?=
 =?utf-8?B?K0g0bXd1Z1JlbjNPU1dZOGRkNUpQN2hRNmdBbnNnVTQ2a1M5WWNVMTg4VjRX?=
 =?utf-8?B?NjJQb3VEcmpDaFljMHRPaHdHZE5Xdmhyc24zbXhwYndXVURGN1dTa21Na1lm?=
 =?utf-8?B?MmRSWWNwZDdzOURlVXF4QXZDaTJ0clczK0lTdS83QXk5TUY2cHJrYitBdFB4?=
 =?utf-8?B?VytRKzlnckhnam03cUhBUlc1NnpjZy80QjN3RjhXOWxIMEZQNVRYZVRoR3JC?=
 =?utf-8?B?MmhPL1VCTk1HOHhoc01ZcmYrd3hvWUZxUStXRjJNVURvcU9uN0I4NXZCQUFu?=
 =?utf-8?B?NzNhbmw2aG13RE1mRnpFbk05UnhzNnN0YkVvUXJFNXZiWXFtMTMyY0pqbHVH?=
 =?utf-8?B?WHJoUEtNWURLbEZ6VVI4NW1mMVdRcFZDLzBxOWVVUVQ4Mm1GbXBtd0RJOXRm?=
 =?utf-8?B?cnZ6akphZG9keTl0MEtsNTc3U3VsRWxlaG9iMU44SjhGcEJCVXI2OWVzK25n?=
 =?utf-8?B?UXVrT3dKb3g4dndCaHNWMzhHa2JxZXRTMk1DVUVkMXB1T0xoWFVkc25INUZh?=
 =?utf-8?B?Mk9vZzVRa0hWc3RiamlQMGN4TTdTZVY5b0V6SGU0MzJScTBOeC80dGlUOE9T?=
 =?utf-8?B?OUhtWkpFRVFYVzBpajl1a01Ub040TXlpaDRDL3BNTlluRnhOcXpKTnNid050?=
 =?utf-8?B?OG0vZ3dUM1dKVCt1ZHErRFltKzFYTHJadEpqUWhZbmg4MmppOVdna3c2WG5j?=
 =?utf-8?B?K05RZGRvSGhxekM3NFJKR0pkRXZ4M3Q1RkdPbnJZWnNPamh0RVpUd3FURUpG?=
 =?utf-8?B?ZTN4WFVvS2RKSnZXVUNHbHJwcGZxazF4cEZwak9ibHI3eW1OUWVxSE1ZLzZm?=
 =?utf-8?B?Q0JVZmVBb09OMWpCS280V1pIS0NROWlFNjJBenRJalhJT1cvNEw5R1IvTGkz?=
 =?utf-8?B?ZGRLTFI1UTNjWkVzZW81RGlJaTdwVk1wUFNlK0FZQkJwc3h0K3V5RzMzM2U0?=
 =?utf-8?B?b05kRVZ5VXdPQko3SjhOdExjQWM4QmIvNkZNMW5RUkRjQ3JDaDB2cFNUTFNN?=
 =?utf-8?B?cGw1dnM1NXRIT2dYUWtManppU09nZXBFTjhhYzQxc3RZMnhNN2M1WXM4b0lM?=
 =?utf-8?B?WWtRRWNFU3lvV0dVYXgzaDl2R1MxeW5uQjdHN1M2ZkZvTi9xODJ2eEs5With?=
 =?utf-8?Q?9A/cLe78HnCZEcLu7GSDdsVaXLRZL72xvl+mUaP/gUB8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7d1bf4d-8f60-40df-1e86-08dda1e479d5
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 14:48:02.8717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iCmqUKxc2ua1CxTFciVw5LkE9BB8pXQNlGu77aCih6CQm3eoHlPajM14Jp6uBZ/aQgaujCbzb3J5ZyJ/DvkLrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9711


On 21/05/2025 10:14, Krzysztof Kozlowski wrote:
> On Tue, May 20, 2025 at 09:08:30AM GMT, Shubhi Garg wrote:
>> Add support for NVIDIA VRS (Voltage Regulator Specification) Power
>> Sequencer RTC device driver. This RTC can be used to get/set system
>> time, retain system time across boot, wake system from suspend and
>> shutdown state.
>>
>> Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
>> ---
>>
>> v2:
>> - removed regmap struct since it is not required
>> - removed rtc_map definition to directly use register definition
>> - removed unnecessary dev_err logs
>> - fixed dev_err logs to dev_dbg
>> - used rtc_lock/unlock in irq handler
>> - changed RTC allocation and register APIs as per latest kernel
>> - removed nvvrs_rtc_remove function since it's not required
>>
>>   drivers/rtc/Kconfig               |  10 +
>>   drivers/rtc/Makefile              |   1 +
>>   drivers/rtc/rtc-nvidia-vrs-pseq.c | 456 ++++++++++++++++++++++++++++++
>>   3 files changed, 467 insertions(+)
>>   create mode 100644 drivers/rtc/rtc-nvidia-vrs-pseq.c
>>
>> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
>> index 838bdc138ffe..3b6dc27a50af 100644
>> --- a/drivers/rtc/Kconfig
>> +++ b/drivers/rtc/Kconfig
>> @@ -406,6 +406,16 @@ config RTC_DRV_MAX77686
>>   	  This driver can also be built as a module. If so, the module
>>   	  will be called rtc-max77686.
>>   
>> +config RTC_DRV_NVVRS_PSEQ
>> +	tristate "NVIDIA VRS Power Sequencer RTC device"
>> +	depends on MFD_NVVRS_PSEQ
> 
> I bet this fails when MFD_NVVRS_PSEQ is a module.


This is building fine for me when MFD_NVVRS_PSEQ is a module. 	

The 'depends on I2C=y' in patch 3/6 definitely needs correcting as you 
highlighted and will be fixed in the next version of this series.

Cheers
Jon

-- 
nvpublic

