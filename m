Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013021.outbound.protection.outlook.com [40.93.201.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D2B34D929;
	Fri,  6 Mar 2026 10:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772792297; cv=fail; b=N/IU2uDZvDbFtnePWiHBlFnggsBy/LRTvZsvk1g5yRcMztKI/v7Nlfa5X4oXB0NZahriKCOc0JELDh3IlWoMoqrpe1CeAtKIVOmeEUUvhE5XBMnZha5b4kP1Y+W0zk5Bx8T/BdbC0KJHc1Vy1OJWu4uewOz5CLeWrEzhAtKSMgA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772792297; c=relaxed/simple;
	bh=UEyD3kY7WwmGYXQJbwpOmS4wva/ANlGEaZzDiuuu4nA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tf+dGj5tSZ2qxddg2FgDyuxApWvBfwXqgP4jdup87BbZe5cHagZR0h03WQmVkWAqicgOiVJEfS9aOUH2wC3WkodQpXFJMHr3+kxRY3lQEgcSP9B3AX0NaplQRxBsYZjCP3MifLuL5sisusJdu6JwK/KQk4rlSm0kow6PjTx3UvI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=p0QUDJy3; arc=fail smtp.client-ip=40.93.201.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="p0QUDJy3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v2hzajuOJB/ayKaq/x0BAT8twbVmGYY9dO7AWmpuUvUBgSawHKLUXZ1j/6/kDT7kHpbaggioCH4WKr6z0vOKwnfla9V7lslAIjZUNmLK1eJG9OTMDlTzUzBTQaPGIXPnb2tuwrSP51wWWydI75/Y9Yw/Mbg6ty6X3++fIomqUCaVb0HBSFSwORBeWLA1/IP/DGs6jB5Fd8v3VWv3Bfz2ZgEHc1X9QnURYM6HGFiqfhQcTMKs/8WTgCDeKuSt4S8OZGCOXx8CiTbWj74f+JwwLJnd1Ge1+3xnh/yytkTj3gaUUVXxt6aMhQ0kgXN1FO7eqLOfu2oeq6uEPrXu9eDS+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ur4f5ZH253/0SrkkFxhwDtRRR5jXTJjszTAKKyprK/M=;
 b=GJZr+DsKw7Zl2YN3g06B6+mi5o1Z0+OhPNJRwsKmI2yOMLrSlmNohdFBZGjRqTy6zs5lVKjQKmLZDPLe4PpfdvMLqAxUoTyLBB09MMEte9zlvkMjNN1xv0j1Z5GUGB1IawNN6ImFaVzmLW+AQVWDMGETUEU/H34aefuu7T6WT8+6IJrEGZjZsI7dEWGflophh3k43bEFuDpOmj9mVbMWJJYYPrKePcdTHvsjvNC280J2tJC7NK6Id6kyd95ydqdAkIeMqO2mJuN5jHA0I1cQ3/JHM6OlVjMRLLr9V8uFicy8SH+E3O5woFV/ezhMc0n4wcyQrmTyyZkfIbgL9vvzQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ur4f5ZH253/0SrkkFxhwDtRRR5jXTJjszTAKKyprK/M=;
 b=p0QUDJy3/TGT192nH1uPWvdjMllBZboi3w7Q5r4WAKT9PwNtDD2jNctOkQ6+a652Qk3DGIyHIH8lhxnvAr3MHfOkndiTXJYqgpFOrtt2UAUgcGthQeMVW15ovTSxC3fuykH1mbxQywFXeP8uHBzkvezl1+FGa++jQH0ItO5amE0B8VaIc8vV2Za6deKUNoQ3eO+c2Ll4xHXYy5tEqvkSIU2XOvsXaoJhXL6Ys6qol6VVGQO2iqMcslsE5rWspS2pmPT/UA0jNYesMX2RnMUqmMQyKCuYd4s9936iOWRig2XcTbKboB9XEvxI5cGUFudBZs6MahV1DIRbAY9/fzSJwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by CY8PR12MB7585.namprd12.prod.outlook.com (2603:10b6:930:98::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.5; Fri, 6 Mar
 2026 10:18:14 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9700.003; Fri, 6 Mar 2026
 10:18:13 +0000
Message-ID: <9b3c0190-7996-40a3-8306-5038f42b2b15@nvidia.com>
Date: Fri, 6 Mar 2026 10:18:09 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: i2c-core-base: fix devicetree alias handling
To: Andreas Kemnade <andreas@kemnade.info>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, Frank Li
 <Frank.Li@nxp.com>, Linus Walleij <linusw@kernel.org>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, Kalle Niemi <kaleposti@gmail.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20260302-i2cfix-v1-1-a95418e9217e@kemnade.info>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260302-i2cfix-v1-1-a95418e9217e@kemnade.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0496.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::15) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|CY8PR12MB7585:EE_
X-MS-Office365-Filtering-Correlation-Id: b031c19f-7656-41cf-6ab4-08de7b69ace3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|10070799003|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	7iV3rETBpPvcWPdAN277WILm3D4NycWGxMIkRefMH6VBCoYyrJBM1tHBx8Uaw60Qc5XpBspC4bXUMg13r2WuoSSCEtyyjTkQqPsjJRd676xoF4JXtzjkS/shpdnl5lCbmzDUIaqfdsKIoiiwtWKoMYWu1g4GyzNNUKdOmhrZx74pmSnAA7mD3MSFuYHRDK9rqLUL37RQA0RCjeWoyGITdr1H++rSEqhTtPwq3NlTEOAtkRCRZD6xL7qInRsr8QS+O0iCk7iuT+1gtjDu5e1SMCny/mTkJZzCbMMDrazgqCGtYiebn50Ja8WyvpO0ckukZqS/PYB/UU1YS1z96JUoeQfsfxvFH8uNlbiAmB/ZqEp7uuurjRyEC0JTvWNLs2JzTw5D/XmpdeM8maJ6r98aLsyPsVScRFN3N0b3fMUSQvPw5PGTvqUgA7zYYwqMQ5ssDWhzt6AT9QYeHSVxp6rqSt55TbTpjawQW0Mo6QD/x8BE/PCuVQZquZOMGNLxPaJgXeLpEFInJ3cdOz8Ql4OpxlVCWzEmeVEkMawonr9IEW9I4KsqaF3ibORXdcyp1Gopi9+iGbIvXvBsWeVvMHXJ0trmIjNA7+mnVzZucG1lAw4Y51kgZENpZsiQVINC2zcufZRSZd82ZiD/jT3/0NZguooQAbnTXQM8hyAMfJcoAzsSPtOZ/OK5n9PjtDrejHTsXZf54RH2LBpf0EjKq2VFDMRBVsm7c4RX4w+tYXp7OEY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(10070799003)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUxubXNLZDBKcmFRck5WSVNBNTVoTmpNSUxrdE16M2UxdTQrU21UM3RBQis4?=
 =?utf-8?B?WjZ1aENyQURtcTAzcnJoUmxyQVV6YnBZT1kyc2JxNUE2VEJoc2hKUDh3b3J3?=
 =?utf-8?B?bzNFM3VneG5vMnN1NWdIM2owMjRMdjZyRTI2TmhmZ28weC9KZXpJL1pmU3Rl?=
 =?utf-8?B?R3NrZ1BNSVlRY01LbXc4VFNhYUVnVGwyL3JjK0JTdXU0L3NwSkZkR2R5M1lz?=
 =?utf-8?B?SDAzL3hUL3lEWWQ5WDR4NFJYVzZremdpdUhTNzNyTk5UV2ZpREhMQ1FiMUNC?=
 =?utf-8?B?WTNtSWw5TGVINm5WbThqMWQ2Q0E1bGgyaU9tNXlGby9LaW81dGh3YW9tTFFQ?=
 =?utf-8?B?dEhOL1pKUzVWb3ZHTkJJdkV5Z1psdUJPK1l3MmdaNmFvMGl5aDlWK2F3UzBB?=
 =?utf-8?B?dHh2TE1FQmxudk5kVlNjd3lpZHhTWFhqUE9USzB5SUxEK01HV3JFOFVyTldr?=
 =?utf-8?B?WkNBcnpkdjY0b1g2a01ZeVVINU9PYVNMRllXRlhYRmI2Wkd4R3A5QjFFanlD?=
 =?utf-8?B?VU00T3AxRUpWTGhkeG5SL0pyS0ZEZERJSE05Rk1mcnRDNnZCZmliR04wMGta?=
 =?utf-8?B?R2NxVWg4eldEaDVKTkpTaC9kV0RKa3JzQW5HNVpQa056eU92Y2ZHSHhLSk53?=
 =?utf-8?B?K0tBMEdmWTJDcGVqcFBhNk90aWdMUUw0VkcyVVVZalRQMXdXVHRKYXF5QVVS?=
 =?utf-8?B?aWZlclNYa0FDakpoNCtWWWlhY3o5VHNaOUk2Y0t5eURoSnZjNzVwemZkd01w?=
 =?utf-8?B?Y2UzQkpjQ2NHSHVYTnJ0eG9QTGdOQkFDci9lV2tlZlFIV2ZGejdMRy9VaWJT?=
 =?utf-8?B?M3JiSWF5amlZMFZ2MFNqakNoWEV4clpIZnVLYXQ4VGhQVXJvTHp1WENoMXha?=
 =?utf-8?B?T3FKWUNsUkgwdnpHNURmSUlndWUvWnBTZWdtRGhwWGMzbTBLVjEwOGJXb054?=
 =?utf-8?B?SVkyRFIyMDE2dStrUGdHdnpZNHVGbnJkM2VFdXN3VkJkeWZCR3BlUDJkaHFH?=
 =?utf-8?B?K1gvaUN6THM1bGJycVJTbW14Z3ZiUCtVWFFpNGJaRlBHUXBmdDhHSzJZOFcw?=
 =?utf-8?B?aUl2bGllMHhSWFRlWTFtL2RTVEJTV0JoWjVta05HQytRVXZkc0JNdVVkREJy?=
 =?utf-8?B?bFJMOXhGS2pac3BqbHhXV3kzQ2xPZlVwbzg5SVkybjhJeTJXdDJ2SUtxWVJu?=
 =?utf-8?B?aTV5UG5Ed1V6WnNyMGE0UEZlT0w0ekJpeXhTem1tMEc2RUMxeUFKaUdVZmM3?=
 =?utf-8?B?bmhaU2FDaDU2QVNLdVE0RzNscDNtOVR6RWg4UWFzTllXUHpYTTQ2U1ZTQzA0?=
 =?utf-8?B?M1Nad0ovTlU3NzV5SHFNUy95bkVJUDh1WUxjbzVUSjhCTmxYN29ycGVoY2Nu?=
 =?utf-8?B?Y2NBK1lHamhCNkF2Z2h6RTE1OTM2NTU0Z1dGNVFoVGZsV0hRQld3V2lsakxy?=
 =?utf-8?B?R2ZINldLWWJkd2tlMGdKbSs5OEhBYVpGUnh4dDhVSlVTaWFCSjkzMHdyaVhX?=
 =?utf-8?B?K3Z1KzNidE5LTml5ZzNBRUhoSEwrNGlrc3Ftd2JONURlNjYyMUxMdXFjbHE1?=
 =?utf-8?B?RVJhN2VZcXBicEdaL2JkNzlYejN1UHdldi9SSm1SdDZYR3dtWjlXQzE4M1FT?=
 =?utf-8?B?dVE5bWlTZ0QvVE9MUnR0cHl2eElVYUd0WjJnbFNUTFQ4OGgzNm0zeU05TXNy?=
 =?utf-8?B?NFBiYVlRZExkVlNDQi9kMzMzemdKaXA1Z29SRTVXcnBERFYzZVArT1NENjc3?=
 =?utf-8?B?ZVlrcUd0TEJLL1ZYWjB4WHd2UmtaM0grcUtEemptM0ZwUUx4czJ2V21LOUp3?=
 =?utf-8?B?QW9Zamh6dWZBZzFBYTZOYUtBTFlKTTBwaUxINGxPdHFnOTNnenQvQzU2Y0tH?=
 =?utf-8?B?ZGF0dFBMd2pIYk82QTNpdFBrcUtKR1ZEQnYzWmpTZTFWZDBScmhvbTFHRzcv?=
 =?utf-8?B?UTNFWmJTN0FhN0pURURFVXVuY0Y1RW5jL3IxWkVZTG5qeDZ4YnJYRUh4NS93?=
 =?utf-8?B?SThUejBqWG5iRUlHZGtsSkVvMnN3bUV2Yk5MS0R3TE04SjdvbklTUk5oTDl2?=
 =?utf-8?B?cHhWeWZJOTg3VTU5RnpUR2J2TEJPMy8rZkN1MnltNm5SV2dsSjhkUzIzMkdW?=
 =?utf-8?B?bzAvZ0Z2MGtoQmpiRkFEaEx5bmEzMlNoalBrR0ZGSG5HT2hBdnBVRHFiWWor?=
 =?utf-8?B?UE84ekZ6cmpTS0xmdWNpa2hVeTc2eUl2aitmSUUvWUcvWHFSMEVLZnIvaDlP?=
 =?utf-8?B?SkhQQURnTmZVUjBKK1Q2dmlJNTNmYmNVbkFBQ3RNRU16VVZWU29ZT3RkSE9C?=
 =?utf-8?B?T3ZCb3BjWDBoUWltZHR0N0tYbDZkZ0F6RElPVklkbVFUODdoeW41SWFIdVh0?=
 =?utf-8?Q?jbB/yuLT8yh6ReB5ZEUCKwpZKYfIMzYM9koabaUrsUY0i?=
X-MS-Exchange-AntiSpam-MessageData-1: ajpdTkETWO50sQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b031c19f-7656-41cf-6ab4-08de7b69ace3
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 10:18:13.6724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RQelNC35ZaNKK/7k9Q+UMnXHJWzGy6HG4mtacplB7riB9chGR9RWE56iGTH+5kajDIt2NcDfzo6Ctxc6RRC0IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7585

Hi Andreas,

On 02/03/2026 17:04, Andreas Kemnade wrote:
> Parent device is not set up there, so use the new of_node pointer to
> handle aliases.
> 
> Fixes: 0ab80451c70f ("i2c: allow setting the parent device and OF node through the adapter struct")
> Reported-by: Kalle Niemi <kaleposti@gmail.com>
> Closes: https://lore.kernel.org/lkml/EDF3FB58-4747-442E-8463-6F1C6E568962@gmail.com/
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>   drivers/i2c/i2c-core-base.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index dd8cec9b04c6..e22d784202b8 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -1657,10 +1657,9 @@ static int __i2c_add_numbered_adapter(struct i2c_adapter *adap)
>    */
>   int i2c_add_adapter(struct i2c_adapter *adapter)
>   {
> -	struct device *dev = &adapter->dev;
>   	int id;
>   
> -	id = of_alias_get_id(dev->of_node, "i2c");
> +	id = of_alias_get_id(adapter->of_node, "i2c");
>   	if (id >= 0) {
>   		adapter->nr = id;
>   		return __i2c_add_numbered_adapter(adapter);

This change is breaking a test we run to check that I2C devices are 
populated as expected on a few of our Tegra boards. For example, on the 
Tegra234 board, the I2C aliases are defined in 
arch/arm64/boot/dts/nvidia/tegra234.dtsi. Here we have ...

         aliases {
                 i2c0 = &gen1_i2c;
                 i2c1 = &gen2_i2c;
                 i2c2 = &cam_i2c;
                 i2c3 = &dp_aux_ch1_i2c;
                 i2c4 = &bpmp_i2c;
                 i2c5 = &dp_aux_ch0_i2c;
                 i2c6 = &dp_aux_ch2_i2c;
                 i2c7 = &gen8_i2c;
                 i2c8 = &dp_aux_ch3_i2c;
         };

Before this change, on the Tegra234 Jetson AGX Orin board 
(tegra234-p3737-0000+p3701-0000.dts) the I2C devices were mapped as 
above ...

/sys/class/i2c-dev/i2c-0/name --> 3160000.i2c
/sys/class/i2c-dev/i2c-1/name --> c240000.i2c
/sys/class/i2c-dev/i2c-4/name --> Tegra BPMP I2C adapter
/sys/class/i2c-dev/i2c-8/name --> 31e0000.i2c

After this change I now see ...

/sys/class/i2c-dev/i2c-9/name --> Tegra BPMP I2C adapter
/sys/class/i2c-dev/i2c-10/name --> 3160000.i2c
/sys/class/i2c-dev/i2c-11/name --> 31e0000.i2c
/sys/class/i2c-dev/i2c-12/name --> c240000.i2c

So the subject says that this fixes device-tree aliases, but it appears 
to break it for Tegra. In fact, this patch appears to have the same 
problem that you reported with Bartosz's change. Reverting this change 
fixes the problem. So I am a bit confused why we are seeing different 
behaviour.

Jon

-- 
nvpublic

