Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012040.outbound.protection.outlook.com [40.107.209.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD1C43D4E3;
	Tue, 31 Mar 2026 17:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774978551; cv=fail; b=KyPqwbPfqxw5u3hu0DFvWXNYZ0tI3leTz2aINru/jUvBZLplsx7JIowlGYfNQ6bb5bzJ1GA/2Yd5xKsYabvBxVQUgDrDLa8cGVLGRVPegBOxLuxJYaEX6gz2bmFellRraa37Kkypi+5XaIdg/7rDIgFjWp9A8cstndTqZsu4fU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774978551; c=relaxed/simple;
	bh=vN6MWKg+gzbWHF05Zqrov+GuFAENZKej9nO8uaEFSmc=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RQqxwuKqlA2C7GdruvHKkK9Q4970bXIrsO+pgZScMZKy1StnJebor1oZjkbPZhLU5CNmcLI4dvaYqpr2eppqP5Lh6ClkWOaC6ZVIoFyVu8z3UI0NYSN4l18frekvyWTn1OQJTwGA+rmZvo6nsGbEgcOjGmqNoUT06VeMlE0iFAw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GSzUYEYf; arc=fail smtp.client-ip=40.107.209.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GSzUYEYf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y0UiIafbQlE6TJRmO3HuhjHxRRSaWBLpqaBuSTN3Trg6A4YL8+zrMCAiEv6m37TtXC7h3RS+1t5MvRIA1PLJoGduMSUot4uS+K7wy2ZKDm5CB84GgMMD/Ey6H5tA3V3LW4RqOunoHHCbGy/s1luT5JeeIHlA58KLoXeOIhpxRIW17LmQWFNF9Y+Vlt5KsTEffsjcNxft5QEcaOZFn0rTtsePiv1qmxwHXdqb9xVkEqlpd5HDWX3yePUlXuvLgk/haHqMHt+c95uzav+XiQZohNk5avAsaCmRhfX9EMhIIu7rMd2gAkrd8hKNmzpz/RAtOIF1WQAi2HS+8BKQlFbXpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=99BMeXBm8I6SX0wZ57eNgIfxbyJ6vvcr2dFyfWnxhjY=;
 b=UmKrAUJbnHY3sMVTO5YySZ0mEiL0NbFdSjJMiQgVeu3QHBmPTpWX9I5SExzuPFUXSQ8aYcKVlLhh9tLFxnElHf7obunKQM6BkEUqs/MkBYTAdrAXvfqmlTq4mD+CMu8Kfb2OcDL7K+JuqDESAn+wnIHl9A6my9CeufnHdVqrBtGwh7hunMwn6AkGaG/QdTr30ZK4cOQEdUbAGbGx6uJvOtrNZbe4Zcnw9q56ifbc2yvxpX2GKt4pK9HqodxKXFhzls3zsA2lkkLj04mrhPRcG+ehRqTbZjW6mWphugQaZGK4JZn4AAzdJ4PlidAFAS6yPWsyaKZDU28dIuZ7pLN5aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=99BMeXBm8I6SX0wZ57eNgIfxbyJ6vvcr2dFyfWnxhjY=;
 b=GSzUYEYfodR2wTiDcirrX2PYYnsdWlXmkQkS0Xi/fl0atM3z+Lr2VvPm/U5k+aGHqUF6yhv9wIR5Ce5+NnX+EBrXWap+V9tZhbH6nAXth2kru0onfP+y3Bcr889UVhl9Z1AezKLTxonyvOU6fyG2vQMDdmJM9+xOeWu4409qBdE4iTIFSsXwq4zcMD0G1DP7rDnsEShRQ2w8etDJSgd4MFN7OSBwdGJnkAnk5QV3CUHxFsxt921IjHiYkGyngeufPt/fKqGKd6qhguy2yFNbSmVmwS90shoKEkXODf9fnDsqUjb/4ikrliTDGIxoSwL3XRd83gGUAW5DKfZnKwffrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA1PR12MB6329.namprd12.prod.outlook.com (2603:10b6:208:3e5::19)
 by PH8PR12MB6772.namprd12.prod.outlook.com (2603:10b6:510:1c7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 17:35:41 +0000
Received: from IA1PR12MB6329.namprd12.prod.outlook.com
 ([fe80::eadc:c846:73e9:8ccc]) by IA1PR12MB6329.namprd12.prod.outlook.com
 ([fe80::eadc:c846:73e9:8ccc%6]) with mapi id 15.20.9769.014; Tue, 31 Mar 2026
 17:35:41 +0000
Message-ID: <6cf9532a-d3e9-4668-9577-91d5e1dd0f6d@nvidia.com>
Date: Tue, 31 Mar 2026 10:35:37 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] hte: tegra194: Add Tegra264 GTE support
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Suneel Garapati <suneelg@nvidia.com>, jonathanh@nvidia.com,
 thierry.reding@gmail.com, krzk+dt@kernel.org, conor+dt@kernel.org,
 amhetre@nvidia.com, sheetal@nvidia.com, kkarthik@nvidia.com,
 timestamp@list.linux.dev, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org
References: <20260330170657.185854-1-suneelg@nvidia.com>
 <20260330170657.185854-3-suneelg@nvidia.com>
 <6bbff5d0-c75d-42ef-8877-de60e7113db4@nvidia.com>
 <3f88abb3-fcc4-4d73-b003-84fc0bd28306@kernel.org>
 <42ef5cb5-1db4-4faf-93f5-beefc0d321de@nvidia.com>
 <0cc95f5e-a5c7-498f-ae2e-32017141b619@kernel.org>
Content-Language: en-US
X-Nvconfidentiality: public
From: Dipen Patel <dipenp@nvidia.com>
In-Reply-To: <0cc95f5e-a5c7-498f-ae2e-32017141b619@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR0102CA0035.prod.exchangelabs.com
 (2603:10b6:207:18::48) To IA1PR12MB6329.namprd12.prod.outlook.com
 (2603:10b6:208:3e5::19)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6329:EE_|PH8PR12MB6772:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dbf937d-0b6c-4ab3-b0c7-08de8f4bedd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	pqlP2rV7RueIWw2i2SD1Z0DdmmqJ8FL+wL1T8JNST5NBhNKqsjXcnP4UYBnyDkZ5XCk6IQt5VkqR4gEkCq+OMICicowX3u0l9jekb2kV43bW07JAj8HqGR95pAAYBjstRimrdRuOTuK01TEBBFLDu4Gw0hOzacsHOvEFNd1OGwuFaqSlg1KrczBQQPiqCDNFgH1xraCLlZEUpR2WddW1Zzo+s53UGSeZXSqWo9C66K7fPSCjXsmJoKCiLzGEaHGTUJtOWEXWjN5nL9m5QCam2/k5a1DY/YgKyz22Wk3cJ63QiAzAdO4xM9i5yNUzveWbYFcOsros5MlD6lhNZdyUjGk17OQwSevJt1j/TPiuLEFaQyHoojhCPjnWSKLNb4iwRJrTUb7FJWKTKHYH8ybC0LosfOCqKG1X4Sxui6h4+F4u7XlvSOd5wp8+G8MMEu8t21iDPonihZBeRJyOtux/S+ESc2ap4JQk4r4dBx1tyUhd0qX4BHw/s6CEzof96dQvWKEVXfbh0kS7P+SPkUpQpdo+LcMh+xEuiB5OXhjbchziF41mvQ3SDWST68ccodU294zMQKruokGHrBaoi5TA+U6YOogSH7nnyhnQukb6zyk2fviKIkQh2fetGlLIEtEBT9itbGjiVdIcy03AfPSdfT5/z3sOnuhEzVo7UcLaDQIzLkB3qWdBa6DQzUvnIlqH9Ux+zY7kLMJV2vZcosopEk8nF2o6z2Ugkp5fWVvYlxCnGgs8r0vXqBugJxEu5T4vdEPcU5hgIXrGhNwxXnzIYw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6329.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0JzVWJWRWduOXlpd2g0L3RSbFJvT2F0TDNSM3M0KzFjL2lPd2dNOUZiTWVl?=
 =?utf-8?B?WHQ0NkJ5L0ZjZGFUMWZHMTVNT1lIcUpranJnZFJHVWdPSWdZMUVHWFAyTzFC?=
 =?utf-8?B?WUJUUmJvcEIyQmhIeDQ2RTV5M1hBd3J1QU5TeVd1enVTQzdTQTVhZUowRmpV?=
 =?utf-8?B?WnlSUVRIczg3aWNHMGZZeFpPeEZoS29Ta0VnMHhLNTZ0VHI0TGszQ0U4SmJt?=
 =?utf-8?B?L0xFR3BUWWtWelhHNG9SZmNGRC9HenNveUJrVVVsSzcxYW5remdWL0JxODdN?=
 =?utf-8?B?YSs4RlpUVUtSeEdRZlZzbWgyTENVb0hWZS9jWnB2ZWhuRVRucWZYc1NWM2ts?=
 =?utf-8?B?SXNFZ0hmcHFKUnBCVG05V3pmY3ZzOFRwd2dsVFVxUGNMb1J1UFNjdGN1VFdk?=
 =?utf-8?B?dU9oeFN1VlN5NmtEcS9EcDJmdXU1b2sySzA5dmVTdnFWUDRpK2xlcGwyZzlP?=
 =?utf-8?B?ZURheitaVHdtcWVnRTNtTlFEVHpPMXc3NWc3ZFo2dDY1eTk1THZ6QkMwY3Ar?=
 =?utf-8?B?ZitQR2VLZVpUaUtCWVdUc010d2twdEhiQ0JDNGtZWUFWekVjbkRTbVlkVm5r?=
 =?utf-8?B?TDhSckxlMjBNaDlIRmRxVjkvM2FCMGJ0Y2JJM3ZzRkNDaGpuOWErV0FST3FO?=
 =?utf-8?B?d1cwMVJqZnljSWxOR01wVFNNQ0Izc3MweHBTOFdibTF0cDBXSWcvbzJLZStR?=
 =?utf-8?B?WXJvR2xtbGd2d2g2QnpiSGxUOHNMdzJtRVlYM25Lc2lIMnRmanBydFJBMUk5?=
 =?utf-8?B?QVBjYUFxb1VwWE1KUERuSG95V0IzcnJFMlVYUFVtU3IweURhZis1aUVYRHN1?=
 =?utf-8?B?ZGZQSzlUbW9YSXY1V09jUWR5cXpsbTR2Sk1zdFJZVWZPMnhCSG4wOVJvQ3dm?=
 =?utf-8?B?anFnaEg4UGNIak1BTE0zTlYrWndWSGZ5NTdnaVdxS0FlcWhWRkhQYTRWYzFq?=
 =?utf-8?B?UnQ1SEhJdWo0SHYwcCs5ZlNxcmNoWlBxczR6SFphRlpLTkozOWtmT1k0YklZ?=
 =?utf-8?B?OWFncHB3N0xYTHVnY3ZneHF1SXNrdEhJZXBmRXNkOTNYdHNFN0FFNERtWW5K?=
 =?utf-8?B?aEhUbHFYVitBd2lZeFNqb2J6QUNBODhBMm9oN2JabVFlYXQySUNlYlFnNUFJ?=
 =?utf-8?B?ejNUbU5nL204aUR1VDBHdXpoTHVRaU92eldBQUE3eTQyRGNrV3N4bWVWZENQ?=
 =?utf-8?B?MHprc2h1UWFtazR6ZlZmam9EZXVrM0JRa200Tml0TUJhZEUyWGlSNUUxbFUy?=
 =?utf-8?B?NGJXZFRWVlVZaTliaG5OK0NKZFRWZVQxcDVPalpubUs3blQ1cHIxdXZnQThN?=
 =?utf-8?B?WWVkSzBQM2tPMUlXZW82TXpSMzdPL3E3VnFsSlAyNlJhZk1HTU4xOStibTlh?=
 =?utf-8?B?d2JESTFBekJNL1NrNlMxaGZMS3Z4YWFFcjJnYjVBQTIyb1dSVVN4VDkxV1dB?=
 =?utf-8?B?NDJMUndPS0RTN1VQY1hUc21GMnd1U0Z3Lyt2TFFySjBUa2Zva095cmhpbkJJ?=
 =?utf-8?B?MGpkUzlCR09aejloNDFsajZhRTRrUkQzVGlLM3RheVVOeDhQOUx4b20xTVE4?=
 =?utf-8?B?d1VUTVBYSDZNamNlcG1FbjdwOUhSU3FDaDVNajZJYmlMMGxXMXZxSmo3dGlw?=
 =?utf-8?B?YkdKSnJvaE5xVnpCcVR1UFRtdTJudHhtTVZCWEpJVDZQczdiZy9wSG9ReDJY?=
 =?utf-8?B?SnRBWTJUczllUGVoZ1ZDOElJaWdlb3czRFdpVWphWnJJVTBEL2VUWjJ5UDUx?=
 =?utf-8?B?bU9kUGZ5cGI0SktVTDhCZFBidStZSit3c2tORGV6a3o5VlJCUnFsN1l5b3F1?=
 =?utf-8?B?YXljcVpEUFNsWVYraDBmN3ROU00vOU9xVU1TaEtmbmVERXRqYmlLR0ViWk85?=
 =?utf-8?B?cGRHNS94R1hqbnlwOSt6ZzVwdGlITkt0Z1ZCZisxQU01ZS9oSmUra0RpQnJF?=
 =?utf-8?B?M0lJMklFZkRzSzYyY001ZmhNdjFhZU5PNE4xUkpJSzNRVVlTSGs3S1BCTlpN?=
 =?utf-8?B?UnYxQ3lHZSt1OGxtcEZ1MUw2OCs2eURUelFNdlBqZ0JvalNWVk5RMTM5UDdx?=
 =?utf-8?B?QnB6Z3d6cGlvZU0rVXIrRFJ4LzhjRkN4UGJRdTVLUUtaYko4VFFtZWppbEcv?=
 =?utf-8?B?ejJMeHVGckJDeTZmMkp4Mkcvd2NKYURUdmxPTGtTY2doNllZR0svUzZKK0dO?=
 =?utf-8?B?UU9YdXZSb2Z1NCtaUVJzZCt4QjJlOGx5dERRb0RqSnhMV2RqZitKdFVLc2dX?=
 =?utf-8?B?djA4cUJJZ1liSUNKWE9WendXa0R3UEdLSldSTFRDbGo4cVBKZjhBdU1pRXJ2?=
 =?utf-8?B?YUhRU0ZWakxyQ3R5bVFmdlFiQzJCeklzQkxaUktsb0lBemNwb1FWQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dbf937d-0b6c-4ab3-b0c7-08de8f4bedd6
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6329.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 17:35:41.0346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bgvwuHEuhPWRDGSDVAkXKFMjxZWVGqaSJcbymsNQ/voTXXQTAb52wQ3rO/JvBBhktS0oi3POKXaRFoCh7B4MdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6772

On 3/30/26 12:33 PM, Krzysztof Kozlowski wrote:
> On 30/03/2026 21:32, Dipen Patel wrote:
>> On 3/30/26 11:39 AM, Krzysztof Kozlowski wrote:
>>> On 30/03/2026 20:35, Dipen Patel wrote:
>>>>>  MODULE_DEVICE_TABLE(of, tegra_hte_of_match);
>>>
>>> Please kindly trim the replies from unnecessary context. It makes it
>>> much easier to find new content.
>>>
>>>> Acked-by: Dipen Patel <dipenp@nvidia.com>
>>>> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
>>>
>>> What are you certifying here with SoB?
>> I was preemptively adding my SoB since I had to integrate this patch into my HTE
>> subsystem tree. But for now, please ignore my SoB.
> 
> So you wanted to say that you applied a patch? Why not sending ty
> letters with b4?
Please ignore my SoB and consider that as a mistake.
> 
> Best regards,
> Krzysztof

