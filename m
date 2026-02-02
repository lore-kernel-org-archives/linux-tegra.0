Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013028.outbound.protection.outlook.com [40.93.196.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B3B27B347;
	Mon,  2 Feb 2026 08:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770019845; cv=fail; b=YYxmA8gPCfwHw9Jt7cbK5DC2js2NMXMoudC2f6sgoFF4t7otfd6zsrfJZvWxkuUCsmwHhAuFw9rOrBratIStenhQsNt0Q8tUl5dkw7ZrcgTTrvOP8xSZIyDCfJ3UbInxsBm6rKhzD0ELqEKtkTdLY1lHgcSfelQidVbzEAge26M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770019845; c=relaxed/simple;
	bh=0QceBAIq9QpOeJPhRzQMYPqL86mFwPrGs3zOk/e9R4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mhzmJFCyOfVMNQ3pHKLWziTurThrMDfVg08kr7CKLcf0RcvQeyO0AvMl1zbKk5Jm2QHyrxvSJtHaNMD3c4jsufJhLFFV1+yoEObkNKYx+p8lDywsDHJiXQhSl7j5e6+iYmbEY+zb2RM5uXQxW71/3QBtkfcw69uZ0bKlZY3VQlI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DNCcpfyu; arc=fail smtp.client-ip=40.93.196.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DNCcpfyu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C6Xf5xUOGi6YBde54o8BgKsPx+CyWfBpDcEETwrYXQ0tQbR9SGNAOPxpWV9d6D98+d1mXJmsKqlX96i3WB03tGeoHS9UbV7m2nfvmCIA1SnKmLkQ4p3fH2BQsXjSKrJuBVskx+iS3yYHket23xLn0JYahzUanF1J1Z4gy1yXPIgg720c2W56gBdQKXPun4xxX6QIEEMAEJ/UnKm06o8bijxra6/Y3SlZgKk9a/HOlHnqz2w6pdAhOzFiahpgAIxudnRj86UK3ZiTiGfDdzMX9leUKy2SgGvMGqEgV32kh3r1zaYHsZu6yP+trB22hwZPNEpZOVpDXdiK3BQArOc0/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JxgLYIH9MupBXDj22MHRB4osb6TuvZwPRGeAcGoCEJs=;
 b=CMzr/fq9GE9aaBAwbVVR0MGeZmHp9/uxu0Zo0yzjjsLHfw0tyh6iSWwLPauitr8o2bIddYpjJnIXUXb0vo2FAEoZ2eligBao4v93OpwD4OTJ+dvsfIvy34b1sjXDS8VQzzQ7ICLgZ0r6pe33eEHP8RFB/YsAQJFG5FZmskMD9AUgCXtLh+jAoH2iy7I8xUFNer+rtQmjEbApIr3anbzFrhBeJUOaaP532SqX+Yyy9vHowy3iO9CcHzCYi+hoNNlnAJoKg6e6siMnuDGwsBKTayRJRYzbqewamSdhsw47xkPNeeiNCcHXp7p4uAKQfBnnK+r0NUZW0n4o6/4tqnLxLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JxgLYIH9MupBXDj22MHRB4osb6TuvZwPRGeAcGoCEJs=;
 b=DNCcpfyufeLL9d+/Xlh8nCfjrT5VSCNYlPy6rvOkh8sAOdbfxfjizUj/OJrS+g25PhZFw0FavOVhyJtWwgRmxNs/f5jj3g5vaUljazpKc4Z3RGT0iVkYueJupZiN2WPqIVh9hvTGdChS0RpVQCo4GDEADufv3upBbz9MrEoXDFgmu4mYrXx3kkz8kGyf8KLRpSklUA2SmWSjxFZcdiecGeX6BArtCoA0+96jja69DmV43pQ180eWgB/k4VzHCIQNeky5F2wTzKS0FgpOxUdjxkBH+YfYlBGMWmiqPjYnD3i6Tas4IKtdVruSknvlJeq5GwmCJ9wOR807lJcIg1RuPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by IA1PR12MB6649.namprd12.prod.outlook.com (2603:10b6:208:3a2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 08:10:41 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%4]) with mapi id 15.20.9564.007; Mon, 2 Feb 2026
 08:10:40 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/4] usb: phy: tegra: HSIC adjustments
Date: Mon, 02 Feb 2026 17:10:37 +0900
Message-ID: <1952298.CQOukoFCf9@senjougahara>
In-Reply-To: <20260202080526.23487-1-clamor95@gmail.com>
References: <20260202080526.23487-1-clamor95@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0013.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::20) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|IA1PR12MB6649:EE_
X-MS-Office365-Filtering-Correlation-Id: 166686c8-fa01-46a6-4859-08de62328e11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|10070799003|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YzA4akR1Zk5iKytPUFE3UWZqL2diU2FwU29Bdm5lRVJsVWRxbWJtdTFnWnk3?=
 =?utf-8?B?dDNrbWwwejVWaVY3RXNpMG4xVkRNZlBSMUFNbXFPVWV3SUZnY251SzNBRCtS?=
 =?utf-8?B?clJVVjhkaUppNklKVlV1K0ZxWTJjbWdvMEtpNFhZMFdSVTZkT2tjTDZaOENK?=
 =?utf-8?B?S3FpN0VlcDkrdC9ZeTAyZEhjRDZyalFEeTNFcCtGRVUrd0Jpd3YyQm4ybUhY?=
 =?utf-8?B?WE5HK2dxN1Q2cWx0dTFWQnU4MUhSUWI0QmRTa3o1TnRTMzRTL3M5NWpOM012?=
 =?utf-8?B?MU1rRkZNNm4xWU1kNFFWOVh4V2hQL2tPYVZwVUlxd1d0cVFENEJyRE8wSWVh?=
 =?utf-8?B?TzRIWDlGaW4wRitzcXBHc3ZiYUlpbytnbzBqQVFvaEN5V1lvc2dIWjc4VHVx?=
 =?utf-8?B?M1BVZFJNNHBvUTRvZzFEZmFiTWxjL09zMjMwYklTTTZVRzlrbk1uY2xRYzg0?=
 =?utf-8?B?bzJoaFZweUZJdnRRcTNQcFAvcEx5bnBYampmcVNoamhZWnZFdGlUWmlJUWRW?=
 =?utf-8?B?RGtTYkczcHpEVFNCeEp4bGpJSDh6K3Z3RWNZNGhsYjJRZDltV3BCaVhmc3FU?=
 =?utf-8?B?MFVITGYwdUFRZTN4TTRJOVIzMTBVWmN4dnZaeDFSbGxCQ3dkSDJCMGhXUTRz?=
 =?utf-8?B?L1dFTXFibG02cDk3eEV0OGdaWVZMK2V4d0lRTzI2TlF1dTlPMU90dXBmRVVS?=
 =?utf-8?B?WEZBVDN3Sm1UQ29wekhEbVJZeFBLM3hEWjRNYmJTeThEcEJhdm1lQWxsS1Jv?=
 =?utf-8?B?bnYvVVVGbUlLMkk3MVg1NzR2bmhXVEpwS1hLRjFMSGVBV215NVZlYVVHQVV0?=
 =?utf-8?B?TXVIcURnQzg0MTNrZGp3UzgweVQ2bkZiSkFSem1nRzkwN0N5VVVZN0w0ZGJZ?=
 =?utf-8?B?WklaRkE0bTM0NEp0aDFLbUllRG9IaWxqQTE5ZWlodUlJMnNSMU0rcklUOUhi?=
 =?utf-8?B?TGtGMDdYbmQ2YVlEM3hyNDc3RktLZmtCdnlNZ1hLZTJDRWlubmxwVzQvQlBw?=
 =?utf-8?B?T2JvZXFnZzdPS2ZxVllpWkswU0R5SXVEMkdpdHVNMytoYmVMUnd5ZitZTUZm?=
 =?utf-8?B?ZkZ3MURaM1htTC90cVdlNnZUNmpnTzhQWm5xQkZ6R2U2RXVTaTZFZkxjeWxi?=
 =?utf-8?B?T0JIN2Izd2xoYnlPOGlYL2F4eGxBeXh5eE9mN2xCQjR3UE9kTkxOdW1HVHIy?=
 =?utf-8?B?dHpuUlozQTlwVG5UaXROa25mYXdTdlNpNEVBWmVaTlh4T3B0UDFuMmY2bkdD?=
 =?utf-8?B?REhDd0J4dkhnMXJPNjk2Wm83MFhuS1lYMVo1eTlSd2dKblkySnYwWkx1MUxL?=
 =?utf-8?B?UXZhNEE3Ri9rclp5b0tqNVpDNTJXQXZKcUtDdkF4endpSms3MFhPQ0tXb3Rm?=
 =?utf-8?B?S2JSbURjZExmVjV4QXhDekJxUHZBVGljVjJOTnJqT2c3MXVUdTg1MEZkQ0dw?=
 =?utf-8?B?c0VQcXU2TGNUL3BuSmJvbHA4UzUxN2J6RzZvVFF6MW9LWCtUbThCMHlmdjRt?=
 =?utf-8?B?WHBIb2JMK2xma0U1MTBacDJYVStyZ2JUVnI5OEF2OEZSeEdac3NPaFYwYnB5?=
 =?utf-8?B?VEFRNXp6YS9DQzEvYmdBMmg0K3pENEhrdlRDUVM5ODBuVFlDQXlCdnV2NWtL?=
 =?utf-8?B?NWpVSUFuT2RXMjQ2MkRkY3QwazdGRWg2c1RXWGYrakhucENGL0tjTEpyTzBL?=
 =?utf-8?B?bWhKN25DeWJtdStjeG5Xc0xqOWxlZ2tCM2ZCR0RLaTdZcHRZUHBEaC9CbzFu?=
 =?utf-8?B?bjllWkxFSkpucFpvYWcxQ2xubzhsWXhFU2NJY3M1eU41QVZjUlB0alozdDdh?=
 =?utf-8?B?QzJ1KzVkOWJEajE2V0Vpa3k5S1k0ZGhEVy9Gc2UxcUpKSkRZdVNMd212V1Vq?=
 =?utf-8?B?SGdxQXZncVl2ZnMwUnJuS3h3U3VaeXZpbzkrUVVvVXY0MkNSTVJIakl4TVVI?=
 =?utf-8?B?SDFUclQ2Z3dSYlRtMDVib044am1hcHpHUUxjQ0xScEs2M2I4TVB6M1BYRUxr?=
 =?utf-8?B?dFBoQkdVSDlPcmI1OXoyQmFZUGJDMzdSSWp2WWZrS1lpM0phVkYvRzR1UmtH?=
 =?utf-8?B?aGJWbmRFQWVtWlVrZVRUNEROSWxLMkVSQWdCeFZWanB6d2ZtVHFxYkFQSUta?=
 =?utf-8?Q?qiwQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3orMXhsU0pmVkNFVDd4NHkwcU8zY2ZMMzU5a0U2TFRiS3ArWjgyUTJOeW4v?=
 =?utf-8?B?bE1hZWxHVUp1ZjROT3pmKytodGZ4WWE4ZXBJZHpKMmYyQVhhSUwxbGh1dlZZ?=
 =?utf-8?B?R3R2YjcrV0lWaVhSUE0yVC9HNHoreklYN0d0YTBMc0taRmQrdjRDY05Pak8w?=
 =?utf-8?B?M0JSaXg3RHZ2eWlUeFVPUEc0OTlaQ015V1NMUXNtcFg3UzJ0MzA0aUV0SE52?=
 =?utf-8?B?SVlmVVhNNEM0UjN1NHZDUEhvak1wUW5DU1NVckRuNVlmczdUNG5pZ0h0K1pN?=
 =?utf-8?B?MHJZVU5VSnp3Y2FScGlIU1pKVExiaG9nN2ZNdVJVTTlJY2xnYWV1c2J2dEFE?=
 =?utf-8?B?TjZES2xKTjVWekQxdisxOVVhcEx6eHB0S2xiZWdab0FGZS9CbGFuZ2FRSzhN?=
 =?utf-8?B?RGd5S2h0b0ZQYmJLZDJLMjdOZlRMUGd2OFBoc2drcndsN0pTL3JSQ0tRVGp4?=
 =?utf-8?B?MksrN1pwanNoSW1TVndycmZSZmY5Y3ltWkh3QW1yOWVzZTR0MU4xQzVpOWd4?=
 =?utf-8?B?NnJ4THJmRHBwcmh4aWJCbVBKQVF4cS9oY3pYWXZyUWJwOGQrQW02N0g2UnFs?=
 =?utf-8?B?L1E2akpoSUFtQ2lGc05KekFLbCs1VmU1V1ZiZUhjVXp5cUtEbFN4WTYyQ1pZ?=
 =?utf-8?B?VUlXWHRDYVdMcmVuVzQwMGhlcU5obzF4WHdPbmxoeVJiMmlBNHNrU2F5RU9Y?=
 =?utf-8?B?aE84bWpMdDZZN1FhbzRDcWxYTzQ2RWpCV0JrTmcvQ1lzZmpUM3JnMnFVSDVL?=
 =?utf-8?B?Z043N211dmZ2Y3RMc1cyU3VOL0dSeFU3TVFVMTRCaVBNWGI1cTNHY2NtQSsx?=
 =?utf-8?B?SFl4eEJERnVmbHhDdWJTakJUM2p1VHZNVmFNWUJlWlJDRGhJdmJwbnc3MkVH?=
 =?utf-8?B?Z0NtbmtZLzR6Y1hHWWIxQ3hvRE81TldSdFc0eS9veEV1bzlydHBibUd5VERI?=
 =?utf-8?B?dDkzWVNwWGw5RTE1dEFLN2hEd1A0Q2Q2ald0MVRQbnR2c0RsbGN2UGJlMVUw?=
 =?utf-8?B?WGxBVG9FUklaa3hwR0p6eUFUL3B3R1o4RnIwYllhZmY4U284c01jb0IxeVo0?=
 =?utf-8?B?TlZBR2NiMDFUT0k5cFBsZVZlSHNNdzZFWW4vWjRFRmkxZjgySzAzUEY5aTQv?=
 =?utf-8?B?VzRDZHFDc2ZaS3kxKys1NXEvdFd4UkE5UlVISXhrVkZFSnI0SDdFT1FoVkNU?=
 =?utf-8?B?akorREV0RzFDN1lvenhIZEM2UHVBWmxHZC9Gd2l3eEUvcUwxR2dDbUdraWxR?=
 =?utf-8?B?dWJGMWEyNmNPY2d6Y1d0VWNEUERoZGRKZ1NlTHlLSW1nczZ3RDdrQm9LNTNm?=
 =?utf-8?B?bVM0RnFZTWpqVnQ4bE1JN0twNDBqRm42dnhvNzRLc09yZWZxakhDaGpDS0ds?=
 =?utf-8?B?VUphYWNKVGJwSVdnSGtFUGo1em8reXVRMFcvanc0cWhWNm1OQ1JHd28xeHNL?=
 =?utf-8?B?NzFtMzU1aW1NU05lbk5FZUo4UEx1Uk5tcWducnNVSFE3N1hTTHYrUTNSZDB5?=
 =?utf-8?B?U0F4SmEwYzVtdWgzM2ZKSXlqQmc0WEFURG12dFJoUmhicDlRTkFDTGozM2x2?=
 =?utf-8?B?bWs5S21lZHZJK1pWcWlVeENwNjdhaWRuSUJpV3lNVzhuQVo4bnNhaWlnUXIz?=
 =?utf-8?B?b21PeC94QkpGSER1ajhFaHF4NExYaEkxZTVHZFFwN3Y4ajhlZDZudXI1V0k4?=
 =?utf-8?B?YVRheXNnb2pYRVVyUjlRTUFUdzl1OEVIOGNnWUwxdWFZK0w5TEhsMDl5NjU1?=
 =?utf-8?B?N3hCSkhmT2YrMGR4TzVjQWdtUWZFS1M5K1FQeGZxeCtWK3VhTUVmTHNGY2hX?=
 =?utf-8?B?cDk0T1QxRTU2eXlDNmxwNm4zQUpCMFBZbTdndElvT2x1WWpNVXVlS2RVbmlP?=
 =?utf-8?B?ZkxSWHk1alh1eUFhT0o5bHdRNzZPdkVwYXJjNkhzWlVSeHlpY0RwdDRSM1Iw?=
 =?utf-8?B?Z3R2clNJQVFyUU4vNE05RmZ5Wkw5OHR1LytQYnNUdVB0QTRVZ01zTVZsNUww?=
 =?utf-8?B?a1VLZlJ6QXRVOFN0UDQzUmJxWTlXTzZyS2NCWER4eGx3blRiVnhRMUluSWFN?=
 =?utf-8?B?a0F6cFBOOEdoQTA3OWdYK0FOb2lUMVkyME5RMWZibHhZQlk4eG9sYjk4dXR1?=
 =?utf-8?B?aDNCRlZxaHJVTU90NjZCa0JCZkx2dnhTM2dENDdVWWduYTlDdDlCazJiTTlC?=
 =?utf-8?B?VkVPUGFLL09taHVXanNPTUh1MnJ2MUdPamRSdGNya0QxZzFjbnVmL3RCQ1h6?=
 =?utf-8?B?Y3NYWnY2RFAzaU9sZGNmVXk2OWJPdjdselE3NHpxNlVxcFdWbnVSSjZGTzBE?=
 =?utf-8?B?a05tUWxEQTRHWXZxcHdMMi9HMjlpdlk5ejlzSmVma2oxeVFacUhZSVZ6VHRD?=
 =?utf-8?Q?RMxqczs8jrz8Nm4rj8lwLz7WHgUKMI2ueD7rlX250fkGX?=
X-MS-Exchange-AntiSpam-MessageData-1: 3js8CFohZ0IGYUzW0wWwNGQiKSJMX9UhLQk=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 166686c8-fa01-46a6-4859-08de62328e11
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 08:10:40.6246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: moqOBLWH4JnDZ3bhkBIf88Rm+gnvSi02cEKcbvpnlum+rOI7IuFXElwS56zu9Uu8rSAHmDwozXvmyN+fv0CcUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6649

On Monday, February 2, 2026 5:05=E2=80=AFPM Svyatoslav Ryhel wrote:
> Followup to a recent HSIC bringup with a few small improvements.
>=20
> Svyatoslav Ryhel (4):
>   usb: phy: tegra: cosmetic fixes
>   usb: phy: tegra: return error value from utmi_wait_register
>   usb: phy: tegra: parametrize HSIC PTS value
>   usb: phy: tegra: parametrize PORTSC1 register offset
>=20
>  drivers/usb/phy/phy-tegra-usb.c   | 45 +++++++++++++++----------------
>  include/linux/usb/tegra_usb_phy.h |  8 ++++--
>  2 files changed, 27 insertions(+), 26 deletions(-)
>=20
>=20

Series

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>



