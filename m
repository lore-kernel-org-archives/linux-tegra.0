Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2069.outbound.protection.outlook.com [40.107.101.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB2C768FD;
	Fri, 19 Jul 2024 08:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721376591; cv=fail; b=DxDCCAmDoRihwxRcD02qKimsaIOGT2NcuiaI1IB1PG77UaxcjupV73qYDK6bkZkca/1IKn0sCy47eimvMV5SUaZTFoCS9SiI6Ghz2A74P8hmbitxSr16M6UBMjlTsWKrJUUs0I3WqpK0rFFii1AZlgeZl1Zn4vIw3VC3j1kvIeA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721376591; c=relaxed/simple;
	bh=cO53D9I02VY1m4rCMhpwyrGINo73mZmRkjuRjNRv+z8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=n4kQIm+RsjhZCRq3Sw5sonA8WZhQloAFyY8dshoP1Yq7UNi5IE5126gQNojdd87SC93HAxFkDlGdaPiz+Pw0CItLRt5ZsO/6YhgCZrlcPt5pTu5uwoDcsypAxhnoGsj1zcyb9d04mmH/RoY/7MDbJt8NqaaBqMWUzviSPHA7qvM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XUQl+Ely; arc=fail smtp.client-ip=40.107.101.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XUQl+Ely"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gvHWSFRdXgP5/1NA03jneeE1sP6zArkiNf6xMcx8+1q901lIxAHi6IyImjDlNMy9ySkn0ORj5495PLWr4Q+XgXgeGpkj1+7cOgO8/t7Hp3quV5jcfnq/3nSwUeUQXEr5+XP1UcVJmlSAfWMFFRHCDcwJPM7/vaMPHaqdlYRZinBC1MQjsjBwc5EBI2WS1heTGoacYz2yIjlQlRnx8LaLnws8Rg1ZEpVXShzNTMhAScpGlkIzd9i/YRe64dEaiKPmZppYwZUz2gsOfo7Q+j4Z4e4ZGMLh1+u3q6T7IlRAzGFiS3z7xOyz2g9VuhMogWCOgWaObcMKlzpnH/QKPaQGaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XFWLiD9QkZacP9PVVOoe9smjCkfmR3NomVC4oKH919g=;
 b=PYQ5PuRqM9GC77O1M7GeQMhieq+S33QxzZq/iBqvwe6t2jOi/h7Oov4KUJd6w+gP/NbS7GirnvjneXAkZiPXkkbIGMRqqk8D91W+WQPSOs6I6TEclMYZwfgE1k4J+P72pjb+6b+zGJ90119CsnbVWOlJZAahjtikf4X50ZxMejeGErOeXjTl6zKWmnF7L9pt1ifvvJOVmJT20uClKHQg0SYYOmcRU6YreP0VRXamSgOXnhostz54j7ccDOLnWDnV+FANV1j2SFU8CjVd23312eTbIvODPyaZ05GDMn6QUCurNBF3YQU3vcZ/fxRVQtVL/Bw2pG/PRk8rhysHtViEag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XFWLiD9QkZacP9PVVOoe9smjCkfmR3NomVC4oKH919g=;
 b=XUQl+ElyMmNlg4DFJ2QlKmJCyqDE/wp+ppfe5Tx3Iul5q8B4tpbt4BfcLJDoe1Q2r/z0MsYLbvC80UuBAc9usq2RGrXoT6B00cCz0Z0kGAkbEV+lx2r8S9ibbLPCp0VBFp9BAQeQb61bm2qYJsENLBlgoG3BDljH/V6LA5Kxb43YO9omDb0YPL0nplSe/ikh/2aZV09pjYmdVrxSumH0guOWAzijQU6B2/UwFnjJA50PirxNIGVg9QB+3adVFEZq/qzYDtRDomorGhECbVj5aWROMpJAbrpLphol5j/3+7JGwl+2k5e+kPcWdC7dYs4gk2MtcZ00fsh5xn354/akbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY8PR12MB7706.namprd12.prod.outlook.com (2603:10b6:930:85::18)
 by PH7PR12MB7210.namprd12.prod.outlook.com (2603:10b6:510:205::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Fri, 19 Jul
 2024 08:09:44 +0000
Received: from CY8PR12MB7706.namprd12.prod.outlook.com
 ([fe80::eba:a472:8ec9:b80b]) by CY8PR12MB7706.namprd12.prod.outlook.com
 ([fe80::eba:a472:8ec9:b80b%5]) with mapi id 15.20.7784.015; Fri, 19 Jul 2024
 08:09:44 +0000
Message-ID: <4a038fe9-fee6-4e65-a1f3-8a74cf3df922@nvidia.com>
Date: Fri, 19 Jul 2024 13:39:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: tegra: select CONFIG_SND_SIMPLE_CARD_UTILS
To: Arnd Bergmann <arnd@kernel.org>, Mark Brown <broonie@kernel.org>,
 Mohan Kumar <mkumard@nvidia.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-sound@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240719074831.3253995-1-arnd@kernel.org>
Content-Language: en-US
From: Sameer Pujar <spujar@nvidia.com>
Autocrypt: addr=spujar@nvidia.com; keydata=
 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
 tFh1Kv06N2eJoLklRzTKy6I=
In-Reply-To: <20240719074831.3253995-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0082.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::12) To CY8PR12MB7706.namprd12.prod.outlook.com
 (2603:10b6:930:85::18)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR12MB7706:EE_|PH7PR12MB7210:EE_
X-MS-Office365-Filtering-Correlation-Id: 097f0d72-746e-4dd4-8a79-08dca7ca25ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QVBxN2srYU9NcUNMZ25JSm9LelBxUFlrcUtvVFFYU2NWT2NLczkwbUFzbWZI?=
 =?utf-8?B?M1VnR21PeHU2RXhYU3BjNDI4T09mNTJvakVudVVNUWNRK2prTi9MOGxIME10?=
 =?utf-8?B?SkxnU2pxK3g4eldnbWhHcTdZN2RxN2xXU0ZCNFBqaDJnSkEyZlkzNUdiempu?=
 =?utf-8?B?STVvcVRhbVZmQWljdG14a09GOG5qZjdGOTh2cVFrTzVzcEhkRUVBeENVY3Zt?=
 =?utf-8?B?OHI2enZzKzIwVFp3QVQ4WE9ob2VubEJoT0p0c3dybnd2ck9ENkpCM1pmYUNp?=
 =?utf-8?B?NnBDaWtFYjVLL3N5eCtHZGRENTdEU2krRjNVdk9zalBzWFdOWCtkTHNxb2Uy?=
 =?utf-8?B?UlNhKytGdUdvRlk3ODVXSnpZT1EvbEFlMmQrQTloWkFUQnpEa1JjcElaa3pt?=
 =?utf-8?B?VlJVRW5HbUZKaFB6NUcxQ2g2ZjBWb3poaEhTdjhQekxPang1TFNiQmFOVk42?=
 =?utf-8?B?WHp1c1NMY3kvRGhiNGNNN3pnVEp3L0xMcDRGS0VCQ1RkeGFNb3hWZ3ZYZ3pr?=
 =?utf-8?B?OG9ick53YVI2dmZTbXBIVTZUZUY0UzFnUG5RUHI3THFscExrZlgrWktZaXhu?=
 =?utf-8?B?dzJUV3dCbGhaQlliTFc0Y3crVmdPZkFHZ09ocWg5K24yZTlEME1Dd1R5VzF4?=
 =?utf-8?B?K21GSDBCSFhYU21JLzZaMDlCRURtakZlTTYzMlFyaTl0YTNMM1Z1QjMzaGFq?=
 =?utf-8?B?eDBPaTRkVktWamo3eC8rMUhIaEFHWWJHaWNxbTJiVkIrRWg3YTNzMllhM0Vr?=
 =?utf-8?B?a1pqR1krR0V2QlpIZFlPZnZ4NWdmMzJ6MTdsdlUyUzVUa2x2d05HbXNNb0h0?=
 =?utf-8?B?dHpLVlNNalZtc1BvQ1l0OURya0dsbnhYWmZTS1dLRCtDRkpkRm5US3NEeVl5?=
 =?utf-8?B?V0RMNFhnRDY1cTFNRW9kOExjbjZCY0RsTGl6RktLRm05KzRPWU1JM2ZIdm1U?=
 =?utf-8?B?emRFRHc5b0pYL3d0OUdUZk8xSm5XeE1vT0kyQVZHSVo3cHRRWlB6NCtNV0th?=
 =?utf-8?B?OC9tblpOMHlXalVraFJrZlM5N0FXRm1OSEhZb3VlSkVpelFJSXFhNkRYRkky?=
 =?utf-8?B?QWowNU9BVkU1UXBXajhvWCs2STNjRU1MNkRBVlBuM0JLQzJIWDBDWXkxajcw?=
 =?utf-8?B?RnFzc2QzWUtJRGZsRVlSV255WEd2bXU5NGowOUJsQ2NIY0lxek8xVThIMFF6?=
 =?utf-8?B?ZHlEbnFDNVlZUjU2dVBIUnBMZkttbDRCUFV0ajBvcWdudU4xZzUwUWt6RXRi?=
 =?utf-8?B?RlhSMnlDZ0FyTjJ2aEFwM1RlOEllM0VuYU8rd3ltUmd5U2ZFM09QTTRjc0pE?=
 =?utf-8?B?MWtXVmdualdmSnk3N25kK04wYVZienMydlpHWTNWSjZ3Wm5TYjU0K3ZzRVpO?=
 =?utf-8?B?cEJXZFIrNDEreWdsdVpDSkFKUy8waXlqQXd1UEJZZ3o4Ui9vN1dNbjBTVTNP?=
 =?utf-8?B?cU16S0tXZDFvUzdmZVNJWCtFa3lZVTNQUHF3RFA0MjBYaUpPd1kvbFlPalUz?=
 =?utf-8?B?RXU3ckxkUVVtaDR1K3lTSHphRngvUGpoOW9tMm42d0dIeXRMclRFV3kra0l1?=
 =?utf-8?B?TUdnMzFmRTJHcTRsSXVsU0lTem1KbEVmVWJMREhQNmRJSDVPVHdwK1JVR2FC?=
 =?utf-8?B?Qmt6YVVVR0hxMnlsWk1QTU5Sc29ISG0yL3hEU1BuYktPclliZVVmbWt6K29Y?=
 =?utf-8?B?T0RNYk90R095RFc2SWQ0T0trK0R1c1U5YmtJdTkzZHBaWWx4VmdZQVFXS1Bn?=
 =?utf-8?B?ZHY5WWZmaFd3MWszbnFhdGZjWVRCTVUzNzhIenFaN0hGOXVQU29jZ3JTYnov?=
 =?utf-8?B?Y1Q2ZUpPSzNGV0N0VHFnUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7706.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cncvVmNtNmRKZnY5d3ZoWEJmSWtBRUJ0RjlhMk9GNWdseFR1Tk82VHBndmRX?=
 =?utf-8?B?bzVkQURLc0RlNkJDYWRuUXE2dVVKSmU2NFRXQ2NOVXRVYzNKZEdpWForK1Y0?=
 =?utf-8?B?MFptYkx5N1FOZWY5S3FMSjdXK1dUWENBdDQ4cFBzRW1pdXB1NzI2NTF4UzI3?=
 =?utf-8?B?UFZ4eVdPK1NHSlFSYlNwcjFzODF6TDgvdVpOTDdqMHdlV0JHVXBha0phNWth?=
 =?utf-8?B?OXJ6UDJDVTZnWXhkaGdFZlVZMUpHbW9Qc1ZRUy90UVFUQjRZY1ZGQ1BabTdH?=
 =?utf-8?B?RWN3MEVUd3Z3QlB5a0p0WFhsQVBWVWlsR1JWL2FoRjFWR0ZzemRPSmlmTjdI?=
 =?utf-8?B?Y0pkK3JYWFlSb3pUOU13VkZQQllwQU1JeXE1ZVFBOTQvSVpnL1UyTDRMbDAx?=
 =?utf-8?B?TEVnUUpKeGJwSEpFZEp4bVlVSTlxQU9kSjhVVTcvU1VYV1Vvd2dzWjlUNEtN?=
 =?utf-8?B?c0cvZEI3b1ZoNWdid01KTnFrZEsxTFZvc0xHNUtVbXZ3U2FaQmJBZlZ0blpk?=
 =?utf-8?B?N2pKK1pQZzZ6TGt1Y1lNZGdFRjFBUzBBTFVYb1F0SGpmUEI4ajhVZEkyOFNQ?=
 =?utf-8?B?dTZ4aFRHOHlUN2s4VkxacWJ6ZEVpcTF3b2UraGQyVUVnNHJpSFZiNEZ4YkZV?=
 =?utf-8?B?VjNYM0NBWGdmSUd1VXltQi9aSGh3dTRpZTZaN0orVkFKV3NkU2d2eW9RQmNB?=
 =?utf-8?B?SlZFMm1MTWJMMzBwVzVHcFNIZzJPNmkvcGVNakZFZy82bU5XMjhFNUxsT2Jv?=
 =?utf-8?B?eCtUdndqMGlsZmFtczJpcVFOZlZWWnN4TUY5b21QWi92c1dKRjgyMEhkU2dp?=
 =?utf-8?B?NENUNGljbFE4djVHeTFhZlNheEcyaE9HTnRDR2JqUEZmUU1YWFJEUk1QcGU5?=
 =?utf-8?B?N0J0aHFWU21lT3VOR3N0eVY1eUh6aDIvd3RSL0swdDl0aVZhdGdzYXNWanEr?=
 =?utf-8?B?eVRwR3pQR3RLa0dqOUZ2dkREeFpTZGRXUEc1OUtkV0FCYXlFQ2ZyNm1tTDJ0?=
 =?utf-8?B?ckVaSnZ1dHpoOUtpT1NpOXpyaytmaTJ5U0VpSm9LaWl2bWJDRytGNHNJakh4?=
 =?utf-8?B?ekczeDN2UnpKb1o1djBPYkoyYm1CZ3dwNGtTRklkc3d4Zm05L3RROWJjcG5n?=
 =?utf-8?B?djd4NDNtcWhVY29PRXN5b3k0VmZPN01RVWxsalVwWit5TE0zanh6MExIRFpG?=
 =?utf-8?B?ZE0zNlhaSzY0SW1xTmx2Y0w4UjBFMU02OUZIc1JHYXBYbVpDUk9qcnByV0dK?=
 =?utf-8?B?aEViN0x1elJGNEhNSXQ4VlkzRCtKZHdVU1g1MEp4UjFhblFoazVzYU81WDI4?=
 =?utf-8?B?SWx4VmFkTHJTMGc2NVFpdXFybUc0WENFYWZxRTU0ZlZKK2pKVWM2SUloM05V?=
 =?utf-8?B?U292MHF0VkdFOWwza2pTelJIQTNWalFxSVg5VkdMQkRzQU5HQnl1SWRLN2J0?=
 =?utf-8?B?c1daQkNROWJWUDFXbXBhR1pIOGNZMWhjaXc5OXAyQ2tQekN4UmExZTlMa1o0?=
 =?utf-8?B?ekdwckR4cWsyVXB6RHNZQlJrQXJIY3U1THZUNUdQTnViTlpJY0lINHdsNTZG?=
 =?utf-8?B?VGw3S3J5bXByMytqRytqVG4zUjh4L3JyRXNOWE5UMFBRSjFKWTNLZklWSE1K?=
 =?utf-8?B?b3ZuQ2dnZHFnR2M0MHNDNVRuc0FlNVA0bTZta0NNZzJVRTJoVHJtSU1panJi?=
 =?utf-8?B?M2RvaDJhTVJsYktWYys1RmRXa3FpaDBuUGE0V1NmTEE5YlVxcndpQnd4TzEy?=
 =?utf-8?B?VUFyS1NYNWJNcittSUgxclZDNEZzOEVDVGxTeFdNcUh6NW1raHdSYVR3VjFs?=
 =?utf-8?B?cGxISWpjT0p2VzVXdTRSekZpcml6cU5QT2k3RW5yY1VMak9MLzFyaXZhTWhq?=
 =?utf-8?B?bVNMLzFDT2RGNVJzYk5uOXU5YUpkeUJaZEtZd2RsbVhTc2sxeTh2OS9JSjJh?=
 =?utf-8?B?T3JwTisxYlJJUmNFNDZ6TjhzakdNMGxKYk1wOXFYOEx1T1pNVHZ6MlVsL2lZ?=
 =?utf-8?B?WnYySXRXZCt5TXh1eitlSWsxSkJSN3U3L1F2RVhOaStBcCtmdmswY3VqcXRH?=
 =?utf-8?B?VlJKcTV2dkdrZ2tEbjBDQ0lSOFpqRWk3OTdFQ1NheitqMFNqeVcwWER0dW9E?=
 =?utf-8?Q?Z2n34LVPp918cRSAsLrk/rak3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 097f0d72-746e-4dd4-8a79-08dca7ca25ee
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7706.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 08:09:44.4711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DD9DoKACw+XO1jChtfAY7wuJyFMW7Ro98Zq2mz19wutrshLdrKqnbAEtU88/Db5V5km1jVKUrbaUnq5UzsRZAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7210



On 19-07-2024 13:18, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> This I2S client driver now uses functions exported from a helper module
> but fails to link when the helper is disabled:
>
> ERROR: modpost: "simple_util_parse_convert" [sound/soc/tegra/snd-soc-tegra210-i2s.ko] undefined!
> ERROR: modpost: "simple_util_get_sample_fmt" [sound/soc/tegra/snd-soc-tegra210-i2s.ko] undefined!
>
> Add a Kconfig select line to ensure it's always turned on here.
>
> Fixes: 2502f8dd8c30 ("ASoC: tegra: I2S client convert formats handling")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   sound/soc/tegra/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
>

Thanks for the fix.

Reviewed-by: Sameer Pujar <spujar@nvidia.com>
