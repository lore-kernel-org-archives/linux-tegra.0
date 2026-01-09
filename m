Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010003.outbound.protection.outlook.com [40.93.198.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA401FC0FC;
	Fri,  9 Jan 2026 18:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767983787; cv=fail; b=nyrYsPir3C9cnfMao8U0Mor+QkrC6BwIII8cK1SWstqSs3Ulv+N0DCclyIwTTMThAzJUwme1yz/F9Hh6dDXUKcoi9xjRc9OJ220Xli89guD+mSeNmg8csydB/yBF4qcCb9g2bKf5KPIeKHEcZ4R9gvZzitMt3kRZee32Gy8BBWY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767983787; c=relaxed/simple;
	bh=DcwwUv8WfCKq727/jdXDfW2zDSNuMP+pRs62nx7etZ4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cHcQquHLkSs+cfygdZFP8tqLnYD8AmrUpK2ncT1E+hZ/8U3Vj/gkLRzzuX8ugO2hB3p6TJ+RfEwK2cEeeFutOJIWvckV3WdlkejKsECD6O3ayZAtXPK7L/Zu/3ateeNyZFPZr4YyCL0Ra+d9MId516DCQtUQlE6rz7lbvIal618=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GDw9/2rz; arc=fail smtp.client-ip=40.93.198.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GDw9/2rz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oCe8vrVjUZxXmWCKNZHdinF+eOSplHckmgXO4MsfBBeNU5T5ZBoTqJwMamPwBDJSTvq4wh3CdfLRmIM0RMQho/y4pW1DxCkGbBSA0phe0ny0vr0sc3j7TX+C0qm/JMmyXMxzfYmjAYTGbVjoGrR3//i5zDRzSvcGWMX/1P7jP2Cb4X8GdpLXp8q3oK9VLzlma4xIv9we08HWBLARRDIy2R8Jha4dj2hreV0xNmzYvO8m9Y5/sHaxuZYE5UbCduyIbT5jRsuPDCV9jsWpt8E/NvDs0WK8p8VCHwEr5Yx9SWFz37WlxlX1lJ7beQhoODtXRT43FcbwXSdPN2GeXeKyUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7fiSvtSpouC3ZCwTNLgiwoPzHu6e3D9+6lSOxvm+gPU=;
 b=BJIh3koVClOBh5C8ViStsnpUGT28l0+IDhhK/G6aPVEZDCWNP1G3eho7sVIjoX5WPm2XvDFU7dNFauFWI2ecbpKkUjf8VIHjXN6sw4bLlBmDLl8tS6j9eBXH+yl+F3OQANHzgjEScHGGyFtBfnu9U5f7lEzjJq9iMKEwPL9xnzecty2jC4HVDUSPUghCWOz+8Cu3RABwL7FHxAyT8eRaq/i4XPUn6UYEbj/xoYgk55G0aKbvykVx7Dv+U2dQdBVxwFztTzldp+/F+t37v3rEXYAyk0F1UpbJevZY12xbc0L9r+qVED4RUohZCFZlOKPUpJEIrZQrcUHSH95yZPIEhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7fiSvtSpouC3ZCwTNLgiwoPzHu6e3D9+6lSOxvm+gPU=;
 b=GDw9/2rzaeDyi7KbzPkVPm4Jtj025ex9MoDTG2u6+bQBj/pznOLQzhwiPXFCpigQqdgWIYecFKKMzGGMEMFGt7wlFqjTpdqwqKbzKQZSyXl7bsDGuZTrQcbaPtlum7RphjCuNQrJKc33edss227rhFv5EHk48OXra8Fm+vOwEtWCNBIw5JOTa478+NSJ2taNLIhwcxtaJqIazIl35dLRUMKHhmC7ytjZCdot5R/FqNfMF/u/dLShfj9fdzPI/0Q8ISp5as+2mLEzayiripbvtNdY7Q1SiNNolWCy7HSnH9gE5Dx9rcxYj5OObwUNUaVb1wXflFG3sTGKXMeRj9HKgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by IA0PPF52B16157D.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bce) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Fri, 9 Jan
 2026 18:36:22 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%7]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 18:36:22 +0000
Message-ID: <26c69151-6342-4504-933a-802dda910a83@nvidia.com>
Date: Fri, 9 Jan 2026 18:36:16 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: host: xhci-tegra: Use platform_get_irq_optional()
 for wake IRQs
To: Wei-Cheng Chen <weichengc@nvidia.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thierry Reding <thierry.reding@gmail.com>, Haotien Hsu <haotienh@nvidia.com>
Cc: linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, Wayne Chang <waynec@nvidia.com>
References: <20260108102152.241073-1-weichengc@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260108102152.241073-1-weichengc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0118.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::8) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|IA0PPF52B16157D:EE_
X-MS-Office365-Filtering-Correlation-Id: a4be4002-c9fb-40df-e32b-08de4fadfc6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N1dya20rZitSR3B3YVNoZXFZVE5MdU43RFl3dEd3WGRaZUh1bTNxRGdnK0NC?=
 =?utf-8?B?NjZDdlYyVWc0b2tNaTFJekhvMlM3NExrMlJQMHUwRXIvc2g4Y09HdUk3Yk5L?=
 =?utf-8?B?eXFTbGZVeHB1Z3hyRmpXdmxHMm5JYmJ1cjVnTTBQeVpTcHA3RTJPTUZ0WXlq?=
 =?utf-8?B?Yk13YnA5K3NmSmVlV01MdXNxaktBZjROZFp6VWdFNnZVTjJrYk13SHBGSkl2?=
 =?utf-8?B?OG9UakN1WFZmSEtvTXp0M3ZBNnI2aTBnU2VzVmo2UTY0YUdwYzJSV0ZZUExR?=
 =?utf-8?B?S0FKVUNTaU9aWkNHbnVtMXVKU2FFYlpXOG9UMjM3SjN5SC9GVUpQSjJ2bnFB?=
 =?utf-8?B?azlpNmZxSUJxVzAraTZ5M2RDaE9jRmV5cll0cFpsc1NKYlJqbS9Gak1vU0t0?=
 =?utf-8?B?REIwZXdGQjU1V2tIeUxrQ3ZWaHdRWFZVNHZmd3pCNGFVWVFzV1dPTjR5dFBT?=
 =?utf-8?B?WDVRTStSejZ2TDNTZFhkQXlKeG4yRy9RY0lpb1pzV2Fqd3RHaVhLMURDVHJB?=
 =?utf-8?B?VWgxL0EweUZVZUdrTytaa3o1Q0dCQ3pqb05NaUpSQW1jNW1XOVRZUFRUeEdR?=
 =?utf-8?B?d05aY0g4TWZRUWUwWTRFNzR5Y1lEYkN0OHhMcks4NUl0dStLS2xyeDdJOTVD?=
 =?utf-8?B?Ny9HMkhSeEd6d2RHQXhrVUNVYXVvQzVhU2dMSFZRMnJtVlNYeElrT2U5V2VS?=
 =?utf-8?B?UnJYQzJVQmJEYUFMYVNORE1Fc0xMekdkRkdYN21xNUl4c0Z6RmpJRURQUy82?=
 =?utf-8?B?ZG1abmRpUFIzRTBNaVdJbzJnb09EQ0tYckEvOHRYMmZyZWFsS0paaTh0eHFw?=
 =?utf-8?B?NU5WL3IrcHZiRmFKTmdTVmdwN1lFd05EZXUrSTg3OUdXTmlhUEYrUjdCZzU1?=
 =?utf-8?B?UjFWVWNSSURLRnBLZnROZEtVUzFSc1E5QmdkQnJwZlJPR2c0V3N5blIvdnhS?=
 =?utf-8?B?a1pRS3lKKzFyS1VyZFJOeVJ6dXIxeHZuZm5nWGsrYVRaM3VkOURTbnlqYmxi?=
 =?utf-8?B?VVFlK0tIakdFc3NtdVZYaUJUQlc5NmJlbUd5VlgzVktxd0Z4Zms5OUo2M2NV?=
 =?utf-8?B?ZmRLMWRwejRyYzMxbHhWZmFHY0xaaEJrdXN0ekJ6QzBMdmpaUjJLaSthMGRq?=
 =?utf-8?B?NWJUdEVmajVNSi9OZXBMSXdmVWtFYmcvMmhySnZqdVkxenE2MkxNRlludzFJ?=
 =?utf-8?B?K2o1NFdlOXJ1b0RQdEl3azJady92bVFWMCtpRkwraW5YQU9vTWxyVU13L3gy?=
 =?utf-8?B?clAycFRMci9uQ005K2RZbENoaGRXOUorTU1zbE9MZWtRWjVCcEE2RjF6bUlL?=
 =?utf-8?B?bzIzNFB4TkVjOEpFZXdmYjNHOTQyaCs3RUlCWVcrR3FiV2hzU1RROFExZThX?=
 =?utf-8?B?NEt1MmNLemc0b0k4STNzNmViNWVNdUtERmpFWm9lWUFVQTN4Qk1jUzNLS2gv?=
 =?utf-8?B?SzJEcUhGUlNXVFlJNVJjMUt4clZlNnVhNUhMWk1OaFF4alFWOGFpQ2NUbW9o?=
 =?utf-8?B?NEtSdUFGUlRKa3Z2SGRJSENtTWZkWEppTXg4V3Y2NUthcWhDZy9QZS9DdlZS?=
 =?utf-8?B?Z1R3TmtjM3dPSTU1N2hjbU5QRVRKSXdBVWlMbTB4TXcyN3ptOFFyaHVUcVdy?=
 =?utf-8?B?c3k3WFkzZnRENmRSUGVzbjVwQXFvdTVZaHBCQjh6bDRaTEhnMWJyL0hiNnRV?=
 =?utf-8?B?TXhJc0ExT0FwNWpOdmdsY05Nd0p6TSt6RWZyUGZwODh5bENTWURhT3VobENU?=
 =?utf-8?B?c3pQYmJMamhlNFpmbkUwWUtrQnVEa3h2STE4dEdkTW1qZDlIMXhLdHNGdUdt?=
 =?utf-8?B?MUFacVJVNjBJQ1pQdC96TXhjdUJEU3lZbCtyWmQ2YURUZ1Q4UURJQ0RFbGY4?=
 =?utf-8?B?bDdhenNxTUdldUVGL3BiN3o0SThNMmxtVkV5bnN0QTdKajE3YmgvbWhVenN1?=
 =?utf-8?Q?YFVlcEbEwLmGZ9y3I6X93GrBpD272ugc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MG1kWkpERm1BL0pjck9hS3ZKR24xcGlTVzZhTUJJZDNpVmYyWWcvVGc3S1Vi?=
 =?utf-8?B?V29WSHd0bW1WTStjNnNXSTJzcHRiZzYyVDNxRmVyMGtRZkxHSk9jbTF0bjBR?=
 =?utf-8?B?ZDIrNkxEQy9jbVNvU0pBNGJBNFFPRkllajRZYUhGMjNNM0k3N29PWXUzN0pP?=
 =?utf-8?B?eTEyb3NaWlZqd1h0a2l4WUY2VjJ0a0FKc1BuRis4Um9pOE5xUVpNeFZsS0Vw?=
 =?utf-8?B?bGlhVTBXaEFsd2JnNDlaMGZ2S2pzcmVEYnRrNDRwRTl4WGd4amhqRU44Y1ow?=
 =?utf-8?B?WlNWek1TNTJwaFdQbFd1T1NnaEpSY21NOVNMVnJUNnRxNm1IYVBINHkzWGx5?=
 =?utf-8?B?ZVpSZTZJZUVxN1Z4RHJRdWc5NnZVNFM4UXBqNjYzODV6d2pJK3hXODRnMWMr?=
 =?utf-8?B?OUNVZFdpM2ZmV21pMnJrQkJzWDRkeVR1TXQ3NlBxeHN6M3pBR0hVOTI5SXZV?=
 =?utf-8?B?cXBNWVh5U3dMSjdkWXk5ZE94TjZaVG5NUnArNXg0dUkwZzllZms4UlJaemNY?=
 =?utf-8?B?dWc1L216MDZuVnQ1SWhMUVdoUnI4UnJ5TmttSk5XamlnS1BMbE94T25SajRT?=
 =?utf-8?B?VWEySXp1T3dVRExTaEtaSDd6c2syYm4ralI2dmNFMG4rb1ZkMVpPTXNjcGNh?=
 =?utf-8?B?dUI0ejhJNEFjakljZEZxRXNJbHkzdFFLTlgzL1dNamxVRWF6RnFwSlVjR0lw?=
 =?utf-8?B?azhXbWFkKzd5REM5dzVwbFlEdWNWS0E3WlJ1R0NkZzB4aGUvMVpPREUvM2pY?=
 =?utf-8?B?eU9aY3RabnB2V3FJM1M4TG5DSlJqMGpzOXVtRXhZRUZGWnpEUm42THdOMVNq?=
 =?utf-8?B?bXVzeStpYWtZekExaldyd2R6NTdONExPcEZSYlRMdkxCUFdXQ1lqNjdTa0Z5?=
 =?utf-8?B?M2xzdkFlSlBOdjdjd0pzbnJRVENySFJZNTJybnpIeDRLOThuRTVtWEIrUXFm?=
 =?utf-8?B?Z0hXOFlSSUphMlJueTB6NC9pVUxQelIzRDRPVi9jSzl4RFJCMDJQOHFKNVFp?=
 =?utf-8?B?cjB1MEYzblljVUIxTXQ5SFNQT0F6L3pRbTdvZzlsaFNCNDA3emNYaWpzVnpO?=
 =?utf-8?B?R281MDByVFpsMHhrVUZWYjIzUkhIdFpIbGdSQzEreFpkeEtlNVp4RFpLYjBr?=
 =?utf-8?B?bFVvdmZVRGtTUHFkUFVyQWNkUFVLcHBWRDdERjBZWGY4Um53bXpmbkFSOUVG?=
 =?utf-8?B?MHZDY2QyUnQrNDQ3R1BFVmE1N2V5a2JpWGlZY1o4WEJKMEEyUVRpdzJpVFV6?=
 =?utf-8?B?Y1VLVTcrSzhJU2xWM0h6MG5jWml6SGIyOWx4OERvNWVXam9yL3ZxemI3Rkg2?=
 =?utf-8?B?cjhJUFd2NDdCSTgyZi9rcmJjL0szbkUzQ05OZUYyRVM2eWlHWHpZcUJwOUNu?=
 =?utf-8?B?Q2hHV3V0bjlVQVJTTUtOSEk5U1BUQ1hQY2NpL25zSkVodWt3Z1dhcUpZdi8z?=
 =?utf-8?B?eHRHRjMzQlMxYmVpTWtjVklzWlJKTDlBUDBIR2dLbUgrQm9wN3BsUHVtKzc2?=
 =?utf-8?B?NWl5dG9aZm1DbDRCakM5QnRlblZtZTRMLzQwOUl0bml1QTdMUTN3WXZkWURP?=
 =?utf-8?B?TUlpOWIyenNLRkxqMmJRMnQ5VTZKYmoyOVZLenZXZjNSYXZIdmhaN3p1Qi9i?=
 =?utf-8?B?SXVyRENQWm5jYzg1ZTVVdnlIVkROVHBWNnZvVElaWnlOeW85Z1o3a2NBM1Jx?=
 =?utf-8?B?RnV3TjRJU3hZdEZscTVUL00yTmdkcGtEakQ3eGRVdGtVQ1dtOGVCMXNSWGZi?=
 =?utf-8?B?MXhzbXFQblJZTGR2a2NER3pUeXJTSXhqOVJBQ0UyWUlJaUZDczN2bmZDUnMv?=
 =?utf-8?B?eUIzWUpwbGg0VmRKS01PZ0Z3bTdBSkNxZy9lTUYvaDRUR3pUaFNKVXliV2NY?=
 =?utf-8?B?ckxvckJZOUQ3UW5zaFFEWmQvZnc1OTBVQlpVT0V1YVpPazFSa1pQaTZ1cjBo?=
 =?utf-8?B?TldLaU44b3E1TUxRQVJzWFRXVTdsYVBBdEhXZnJNaHBZZG4vdWtKMUN5aFor?=
 =?utf-8?B?MDZ2bGovYUlYcnQ4MXFqZWs1d3h3OXJrTjE0WlBzempZVVM4S2xOa2lkeS9p?=
 =?utf-8?B?S0hTOE1SS005anZUM2l0ODlSZW9rbVpQYmNmM2R0Qi9kUDdsZHJpSXNuSkNG?=
 =?utf-8?B?bG5aN1AvZkpJMW1qRDhrdyt0SEZPUi9jTXJzN3NsUWVSRmd2L3IrZGxlOEpr?=
 =?utf-8?B?S0FOQ1VldlRJR09sUDhoUjJlN3dnSHh3cktUSlM3N0Q1d0M5eGxXb3JNa1kv?=
 =?utf-8?B?RUZXOVdDWlFJalBTWDVQT2hnZXBPUWt6NkVmWStGVG5RTUFpUnB1S25WckIr?=
 =?utf-8?B?dlk5OEJQcHE5TnVCTjJqT3hwOGorT1dnZk9ZZmZkcktRakdrRWJ3cVhGNlZN?=
 =?utf-8?Q?Cq1uImq1zJS2b0ZfErjyUB9GFmkQsEvJfoJ2Z/+yVTLuu?=
X-MS-Exchange-AntiSpam-MessageData-1: SVK14oFuDWsVDw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4be4002-c9fb-40df-e32b-08de4fadfc6e
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 18:36:21.8919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lv3jahUzNr4aYTQRoNGWJsWTWmsAB8bDQ/uqcEkZdtT25VnL5xylTtGo9y+ADK8Ilm0lsOHrOATyDZP2nQ7Xfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF52B16157D


On 08/01/2026 10:21, Wei-Cheng Chen wrote:
> From: Wayne Chang <waynec@nvidia.com>
> 
> When some wake IRQs are disabled in the device tree, the corresponding
> interrupt entries are removed from DT. In such cases, the driver
> currently calls platform_get_irq(), which returns -ENXIO and logs
> an error like:
> 
>    tegra-xusb 3610000.usb: error -ENXIO: IRQ index 2 not found
> 
> However, not all wake IRQs are mandatory. The hardware can operate
> normally even if some wake sources are not defined in DT. To avoid this
> false alarm and allow missing wake IRQs gracefully, use
> platform_get_irq_optional() instead of platform_get_irq().
> 
> Fixes: 5df186e2ef11 ("usb: xhci: tegra: Support USB wakeup function for Tegra234")
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> Signed-off-by: Wei-Cheng Chen <weichengc@nvidia.com>
> ---
>   drivers/usb/host/xhci-tegra.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
> index 31ccced5125..8b492871d21 100644
> --- a/drivers/usb/host/xhci-tegra.c
> +++ b/drivers/usb/host/xhci-tegra.c
> @@ -1563,7 +1563,7 @@ static int tegra_xusb_setup_wakeup(struct platform_device *pdev, struct tegra_xu
>   	for (i = 0; i < tegra->soc->max_num_wakes; i++) {
>   		struct irq_data *data;
>   
> -		tegra->wake_irqs[i] = platform_get_irq(pdev, i + WAKE_IRQ_START_INDEX);
> +		tegra->wake_irqs[i] = platform_get_irq_optional(pdev, i + WAKE_IRQ_START_INDEX);
>   		if (tegra->wake_irqs[i] < 0)
>   			break;
>   

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

-- 
nvpublic

