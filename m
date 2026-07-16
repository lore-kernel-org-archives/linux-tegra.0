Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012019.outbound.protection.outlook.com [40.107.75.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D833B38AE;
	Thu, 16 Jul 2026 07:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784186844; cv=fail; b=oe3twVAH4R1PfAaOXpuE5m7vRbEPGHMDoPwNB2hxH48rco+2ru3+0UfYIEwNJvbE9klYHqM4E08luOWo6IIn+W4dZz/d39bO2h2CFffGZ0bt4kOOuC6yp2sLKz8MUYlfMZmDPcyeyrUTTTYoxmYKWV+uV2/5ngFN2pk5BtIqyws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784186844; c=relaxed/simple;
	bh=z5kkpfIiT5uKLzzwePTghlS727zkmp3Y5kDF4mkCW38=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pWMUNa0NbKydzM/VCpzYugreM9heQeshGzsjQIZNgXmGyaMg4RwU9WnWe5qqo6WXaoSksRZSbo0jpNlgphB9sdLt6CbvUyGzoMQrcUZGm1eXi583nQfoPFZTS5ARVcqlqKBOhAykJ9R1Q1pEOFI9QVWU9XnQFodIPxyFj2FujmA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=LpbcV9lc; arc=fail smtp.client-ip=40.107.75.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="LpbcV9lc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BXmymIom9DlwPRdFNqkXXxRfobcxCCmTxFQ3Bhl96rSTOTsNhQuRbezN/eglGRIKUS/NofK3nYkdXuJFBJQwQ6LwqLjHjqc4atGcPzAh8jZM8nJt9Mac+DykNn99Htj1rPFp2fca05c9BURIJO+XBTap0gzD/S6FmJrEKBYO+j5Bxb+aUIR1e2NRfjF8Hbu4dtRfS0r/l1Di2dzNqIzH6aUn4nInO11L80ErDL1I+i//5hRtFClfJ4ttNdwPDrmnKhHHc2NYTCs4I/snA/bltOQap1/tfZtJy7uvINiVsVwS/dMsXbHvdvIBCOevGtUfoMjEnoCOtqBQTWPnRPNykQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ib3Aj3CLLkNvZH+hwkF1u7TE8XXpxZokltwHqWl0HKQ=;
 b=OzX7QR8Rd1ee0TbovF+dGUkKq25m5IvUnD2n+JPE78xB0ELfIASNnlUlqaBgzYF9k8lUPtgSoDaCxq2KZUkdQZKGSCqHaIFAt8p67vFKAMqhUPxcFQJFc10df9UMHce76gQBrAY3XrSc+wZ5YcOouO4oKq4CgcwFpe+HSiCdLhA6YzNmKosnK+OVeX69qZIoj/jwadGn82cJuToWurBFZN/UTXmUP3dZPjHnWDIeyAvJB68TUIDVlwF5MkDI/u9zpfSvaR2/XrLlX8NJiDUBr525umuKQk5UquQgtr3kKIJbjhYYJrJHI193ebmIiSqljwAh/+kAC+bl2NYt0/J3Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ib3Aj3CLLkNvZH+hwkF1u7TE8XXpxZokltwHqWl0HKQ=;
 b=LpbcV9lc15byIw0We9wtp6vQbzxRGWOEzmOwfDrs8S4WT+GB/neEaswKM2upxcwrAoqw+fkLloopohNL4jQWRWWrb4KgEl3wV6LL7xZhsA5XjiS31/bgwF0ybb3M1UQE6FBXJcgD84FQqcecGOLTISxSKyBq7KwPtd+COWI3k6Zca7r+XXrDLA5CHUUI57wOle0k42KkBOVUq8Nv8JJWg05TPqIVp1+5zxhvJ8pUpGRzwUBAccSgHa9mqTsctWk/R4EQCMuW9IVfbYCfdBqvQFEVzYgd52VmFNF8aMTsp8V5j02o6Zr6Mz5bLQUz7iEiXF7Mmm+2/YxsTSESgIHKWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com (2603:1096:408::791) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Thu, 16 Jul
 2026 07:27:14 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 07:27:12 +0000
From: Pan Chuang <panchuang@vivo.com>
To: mperttunen@nvidia.com
Cc: dipenp@nvidia.com,
	jonathanh@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	panchuang@vivo.com,
	thierry.reding@kernel.org,
	timestamp@lists.linux.dev
Subject: Re: [PATCH] hte: Remove redundant dev_err()
Date: Thu, 16 Jul 2026 15:27:03 +0800
Message-Id: <20260716072703.502632-1-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <uIEUpy0pQeWhsholK67nMQ@nvidia.com>
References: <uIEUpy0pQeWhsholK67nMQ@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TPYP295CA0042.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:7::20) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|TY2PPF5CB9A1BE6:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bd9ce9f-3638-4c27-adc9-08dee30ba739
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|23010399003|376014|366016|56012099006|11063799006|22082099003|6133799003|10067099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	UpyGSqO6CEPkCslmO3rh2qfvNZlN2K7qlmeIkNo0BtrkRKYz0sBvzbbCXTMad7aFyuR5rgvBN5uAknsKOfQOq8n2XSkn/yIYjAz6TUYfE9JinGAcd3U9FnLHAMbI0r9x2j49i1njovCPmN6g8hBjpqxiv9mbRyCZUl1qKQM0y/D480sxxpNJdqoWFBqV43YLa6o+5vPONvKmqU1nJnRnMNTdw+moFrnXmXWtC0DqgJbB4RrbQuDpEjs83ek2/21Pdx6VuWEUeeNOIU3G2KmUzljEccvSoFwsj8fQtGB5/UhHRNAkSH5E5dgC/jCIOrH//FGhXWKxov3rj/S/8jyrvfiaZzT1oPR0nliwGwHfg5e9S3uYb2rUDG39KjhUeNlVOdbStha5PwuQUNpP9Km2WEdTeYEyISe4j0xvM5nMrVjpzxu/8aE/Q7/MMu6/RTbAsi2XQeM98E1NjTLL0tePBaCM1rABW5uWMXvEjgoGG2nqriy3hUEluuBzJ3/d2gsW0AXFq+xsWcQfLQ857b0rRXjplAbbCqMYnC+ycDUKhiF/R9Abvt7ukJ7ZttvBf0JWXr7R7QTlujKz2viCPusq/7Ki7RLe41M+r1D9NXcY/uJDFyU89g2BCgCB9tjxX9tYwmUx10uGH26bnjeZDTAWpJa7n07PFoiqcgN1LaZwP3oPx9BmXifPgV84CdYDmKzhBljgKKoYo4QBIaIXmxM3NW1JFkNS3eRylYqaCqGRH/I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(23010399003)(376014)(366016)(56012099006)(11063799006)(22082099003)(6133799003)(10067099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0dkVkZkNUdjUGhvUlo1NTlUTWhPbmpyMEo4NjZGa1J1ZFdOaWZlN0N3WUNm?=
 =?utf-8?B?WHMxd2ZZNlhJL2xVeUxKckZqaTU0UDMzNHo4WGhzaE9FdkcrVXpqN3l1dTdj?=
 =?utf-8?B?bXJCaW9PN3I4MWs5OVduczJrci9qZ3l0SDNQNjcyVDZBUkJrdHh1R0JZN0xu?=
 =?utf-8?B?ek1TSGkyNG1sNXdmSG5BZUlNME90Y05DejFnaFFxNkpmeEZ2d3NiTWhwK1cz?=
 =?utf-8?B?WGM1UmRzZmVVejlZNlZhMUVNRW1MTlJoWmhMWGhVZzRlazZkSDY2TUduWUt0?=
 =?utf-8?B?ZFA2QUpyeFZJd2FvRHJKcXFxTXJJKy9NMTB0MFNNUWlaV1ZDSW1nZ0RUMGI2?=
 =?utf-8?B?YnowOGhFVHJ3QktYZXRmZlpCUngwQkhvcmxMamw2ejZCTEJsczNtemUzbmI3?=
 =?utf-8?B?R01ZUFlaMnpNN0JzQkkxaGdWMXlVNTZ0NW9uNjBuUmpYSGZ1U0J1bWs5RUJz?=
 =?utf-8?B?NmVqZlFTZHcyZTRObStia01RVXZwQjF4aUZXUEZQdUkwVk1ySHFhRzh3Q0Nu?=
 =?utf-8?B?bkRGOUlDallvUDRHV1gxMDJOVkFFbXZkV3BmM2ZqQ2dReG95d1VmUEs5d1J5?=
 =?utf-8?B?ZmNSRTl6K096aDA0OWxwTjUvMHd6SVJPbStYYTBRTUN4OG5aNUZleHZuWkxG?=
 =?utf-8?B?cUI1Mys2V1EzL3JYa3VTbnp4cVc4dXFYVFkxblVTSU9VbVZDNTEvYUNQekRO?=
 =?utf-8?B?SkxiS2Q4dlFUTEZOYUJiaFAxeE5EcDlVbnE2N050aHZPRTI0SGg1UEtndml2?=
 =?utf-8?B?RCtaUTlKWk5LQlJBMHF2dXhHdTBQUFZyeEV5U1hZR1kyTnJjQlQzUVoyVll4?=
 =?utf-8?B?TFVtdndhRnIvRU4wNXBqejlPTlpVcEdVSjM4S1o4U29kTW85M0VFTGtNdmw4?=
 =?utf-8?B?SzJIZkV6Um94aHY5L3dYMHJURU9ielo3Y2dHUW9mbDhob1pPN0RMT3VRS2U4?=
 =?utf-8?B?bXBUZGNRREVXVzRVSTQwQ2VVY29JMG9ReGdxckU2RjRubit3OEx0bFNXajV4?=
 =?utf-8?B?YjV1WkY0amhmNzlFam9Fd2FuR1ExYUxwNFhtY3lvN21XS2FSdWU5UU9VM3ly?=
 =?utf-8?B?VEVCZTlPQW1uZ1ZFV3h6L2VPNXd2UklRcGhSdzJyYlJZZHhBRmUvR2FQR1hY?=
 =?utf-8?B?Q0Q3SVl3MjVsdG5OdjZNZWFLYjcvNE11SGN5eUc3c1hkQUVmWXJ5N0ZqMjhC?=
 =?utf-8?B?eHJzcFFCWnBzTG4rc21HMGQ2MDdqZXUvTFJobytXWkpjdHpXT1BkLzgrUk5t?=
 =?utf-8?B?WE9tMzR1dlFLUlFGWlVsd09SOVdBNE5BMFVMQkhHK0w0bGZkWThEUHU0dnls?=
 =?utf-8?B?VGhXVGtJczQvZXJMbjVkenJuUXdGTURIejBCcmNndDk4cXJQRlFwNnJwS2RZ?=
 =?utf-8?B?WU50M1lsMk5RTFd1VXM1clFOOHVhR1FiZzA5WTdNR1FQb01Jd2s5Z25Cd3lv?=
 =?utf-8?B?SHFleWNmKzZGTEcvTkFjd0dkYitFMk9pV3pSUHRYVjFSSmZKWmFZbUwzRTEx?=
 =?utf-8?B?emxBZDYzb3JxL00xYnpDTGFXamRsOElRY3k2SVZCMUtZWndFQmR6SkNEWi9W?=
 =?utf-8?B?bW1UT1JNVitycFQ1QzREbDRTb1c1OTJZdzFjK2hyT1YwSDFwdmNSSWpQUGJE?=
 =?utf-8?B?WkdIRmhhOVhjM2F5M0xUL09RcUFVcFZxK2pOWE10cjV3TGRINW1QaVRoT3Va?=
 =?utf-8?B?TkMzSTYxNnQrc0dnaThsTTE2WlV3WXBhbzBkbXNGc2tnUlJNRUVuYVhJRVBi?=
 =?utf-8?B?NlFkMzlyUmVlQkEzTVRacStWLzc1dHBLdnlmYVlnbHFPVndlZzRJQVpZZGJQ?=
 =?utf-8?B?SkIwYWVubGVFRmVFd1FGVWUxR2Jva3RRWU4rMjk4Q21IT2d5My95LzFyd2t2?=
 =?utf-8?B?YzJuTnVVcjg0bEwzM2QrTkdKYmpzM2VPZ1ZyZEVFZ1E2M2NvcnZXMDI1b3k4?=
 =?utf-8?B?ZTh4SFUrOE9mV2VpTDhkdG9Hd3VkSXpTdkwvd0p6OEZjd2dtcFZWVkQzeWFU?=
 =?utf-8?B?Z2xYUE80Nnh4UytYVU0wMzBFY1lCSHo5TkF3a2lpRUJBMDROdWxybCtyYmt0?=
 =?utf-8?B?WHBQZlJHUFdmeCtjeWJoUVg4TmRkbXhNY25mVnk2QjZ2YjI2NW5wYXRTZ0l0?=
 =?utf-8?B?a2YxTTVoUlhNVUp6R24xVko0OVZQdFZjOXlIZjVKUzAveGhPS0ptWkkwbTBC?=
 =?utf-8?B?SjR5dGVrb3N4cGFDNk8wOER0ZjdlU1g1NG42MUdpYjRRVDJPNDV5UlNmQmww?=
 =?utf-8?B?Y2l3d2ZnS1Vta1RFWm5scldjZmxib1ZjOE91UlFPaFF0VUJ5ZGwxcjRXeWo1?=
 =?utf-8?B?NnRNRUNJeTRvL0M4YVVpRUR5MURkYnlMc0pQS21CSXVXZ0ZVZHhIUT09?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bd9ce9f-3638-4c27-adc9-08dee30ba739
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 07:27:12.5850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6B2lI1KG8NRBR1oPnGu4V8AxZPdomUoN/m/9eHDpCGxXtUyI+Ps+0LdP/B2Tu9Sa4E4BgLdMN7P7bAzfvZ9qow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PPF5CB9A1BE6


On 2026/7/15 14:17, Mikko Perttunen wrote:
> On Monday, July 13, 2026 10:29 PM Pan Chuang wrote:
>> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
>> devm_request_*_irq()"), devm_request_irq() automatically logs
>> detailed error messages on failure. Remove the now-redundant
>> driver-specific dev_err() calls.
>>
>> Signed-off-by: Pan Chuang <panchuang@vivo.com>
>> ---
>>  drivers/hte/hte-tegra194.c | 4 +---
>>  1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/drivers/hte/hte-tegra194.c b/drivers/hte/hte-tegra194.c
>> index 4a7702b32b24..e29fb105ca2d 100644
>> --- a/drivers/hte/hte-tegra194.c
>> +++ b/drivers/hte/hte-tegra194.c
>> @@ -856,10 +856,8 @@ static int tegra_hte_probe(struct platform_device *pdev)
>>  	hte_dev->hte_irq = ret;
>>  	ret = devm_request_irq(dev, hte_dev->hte_irq, tegra_hte_isr, 0,
>>  			       dev_name(dev), hte_dev);
>> -	if (ret < 0) {
>> -		dev_err(dev, "request irq failed.\n");
>> +	if (ret < 0)
>>  		return ret;
>> -	}
>>  
>>  	gc->nlines = nlines;
>>  	gc->ops = &g_ops;
>> -- 
>> 2.34.1
>>
>>
>
> I suppose 'hte: tegra194: ' would be more appropriate, but it's the
> only driver under hte anyway.
>
> Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
>
>
>
Thanks for the review.I will update it in the next version of the patch.

Best Regards,
PanChuang
