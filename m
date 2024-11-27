Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2074.outbound.protection.outlook.com [40.107.236.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE6F1FF7D0;
	Wed, 27 Nov 2024 15:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732722979; cv=fail; b=JvJ8iPfJo1gaP/HnlPIum/YyGUTTmdm/r5iMn94JNd0QW85ea5gdJoXvRsbqMZrvwRz87eAeite26+e4C/vzfsvxVY4jQ15+oXQtCgyzLc1utB2Qb6anTZ/B5eEkDXyZwpXHUGqBgLzLAYo57oySd0xA4eWr1hElmVCB6Q7eLds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732722979; c=relaxed/simple;
	bh=J+kO9OyrRF6jZMVMKC7txJL/qqMF4YCSdauY1PwrphA=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rRzZQ6NaiyTs33CwVY5ui1eOQptXgCXn/bRnkGE6VNcDFXKaz0jmH3+At6QEHFkLXQgOiavwYEmYLgiWG37LePXJx66w/5oLpcA5V1+r3VrXpY7yPBujJJ8r7wSwqmQ+bGL3fiVzvbYmMh6DWe4YmZRaUCOL9CzIlzMYxmb+i/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=D3kTiOlU; arc=fail smtp.client-ip=40.107.236.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="D3kTiOlU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cVLMFhiWof4qPP5V4a4HjJ8iax3cqvlnQj/Jndo/V/m7uRoX7PPkxZoQtGcB0YJGfIle7LhZcvEzqEn1+5FgDVJ7EMdsrUjZHmLbmhsaxrx1NZaUH29f9b66P4BIjLc3FEB3N09OUfTPrn+CbECN0AAAPYByjrwEJXgJ/oKiBzFx+25be6jDVY1HqNfuamXVHu4qKTw6U6HL98ALMmr/SfiLGnKYRnyGIn0cFrVh0iKP5ygvIzCHfs2bFFOMGwmg6ucPO5Jhe93/ftL8iar0njhOZOLrU3fJvCmPi86qdbnL09NC8ByY9kStfS5zjSSV4pkEwIz10rmsVPlc+Lek5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0SuOpA4NCHZAJZY2GFKAA2eUctxgkMGPlIToQzkmD0c=;
 b=nwnRvhxUqR98GQPQ0mHo8qNdL1hwD65tAeZzKWx72LXXHLKu1Hk8AiEqKvWNXfOV5Nc7QmxHvfQuaARFJFhl9bnkZub5Af+4E9K+TpTumLbhzUXce5Rkd/IHQ52Dt3zmcj3jK1dklz7zGTbxslK+srJorKOdBww8YRd2Dmxn8zNxPd6z7A6+CtdMMhnjFyVAkpniyZCyKlweeYY4SGNgSYTdsQw6xz6uJPkvA7zQsIlmS9m2MPwioYeXqmwDH7wlFDrllTdPg+HeSBC+/siB+Kv8HwWO/vGb0EnP2EDXgCxJ7Rf6JeDZCRMbTPtIUDya1TPPYKQFhGoC0xC/BkRNCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0SuOpA4NCHZAJZY2GFKAA2eUctxgkMGPlIToQzkmD0c=;
 b=D3kTiOlUklf/vEMXSqYgTcL/Pow34iof2/42z6RDwA/vYz3WA1UDott4CduS4aHthdN7lrlIHhCyVqEYhnl57hfm3OLiSXhTDPp2MfjI6xPIrtdhHFqjp2QpGxKZR2t+iESpD18xbpqt8YCsID62Fya6/6zEzdiwUtpYb07oN0U4vZYg5MWbhCbSQOLhrXT3wuGbgOf5gdX+Le2SvKxnrwAtSabMIp5jtOTgmvkFzluSLDFtvWbi7ggxi1QFpEPV1mqgpoXfeMKNqV9wIpVYXEtjnbOs17sAubrdU+3SoydSk1VyH8eA2bIPOlh52pKD7f+5C7faDf4b9cTOxaXI7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by DS7PR12MB5837.namprd12.prod.outlook.com (2603:10b6:8:78::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8207.14; Wed, 27 Nov 2024 15:56:15 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%2]) with mapi id 15.20.8207.010; Wed, 27 Nov 2024
 15:56:14 +0000
Message-ID: <ad0b5587-00b4-467b-b646-738e1b2f92f9@nvidia.com>
Date: Wed, 27 Nov 2024 15:56:10 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mailbox: tegra-hsp: Clear mailbox before using message
To: Kartik Rajput <kkartik@nvidia.com>, jassisinghbrar@gmail.com,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241127062053.19165-1-kkartik@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20241127062053.19165-1-kkartik@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0063.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::27) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|DS7PR12MB5837:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cfeb428-e97d-4864-571d-08dd0efc05ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cFgwcHRtdWI4dDdVcXRjSGVXMndVSDFqU01ycXUvSkxwTjlkY2FoT3I2VTUw?=
 =?utf-8?B?L2JDQUZ5Q25vcDV3SlZxWmJvL0lOSEwyckJ4a090UTNGU3FnMlVod2REYU5H?=
 =?utf-8?B?WjQyWEl5a0ZjUGxpajVkQjFNbFFwV2VFQVBTYVJZMmVVSjRURDJjSDNZTlYy?=
 =?utf-8?B?aVNBLzRzVkp6L0VFaUhXdGNrVk9waTNjbmdpdGlZU0Z3YjEyQlgyanBzVnZH?=
 =?utf-8?B?cllyYzZEcFF3TEw5TUJWYzRtQVB1N3BqYzJBdllXWENuTkN1dlhDbHdtSkpY?=
 =?utf-8?B?MllRQ2hodEtHOVBzdmdYeGtsQnRKc0ZhaDZid3dDNlVrNTBLZnJqajk5Skxr?=
 =?utf-8?B?NEdXSW5TbWlmUkoyREZNWlZZMUV4bzY3eGxFMU5lSEtLejRTMU1wSU5la2Rz?=
 =?utf-8?B?NVptK1RuYktpUyswT0RpdnBnSzlQb292Zm1WOTZaNHhXeFRsUzlMYk1uYVFV?=
 =?utf-8?B?VGt3WHFieHcxb0lXemFhZ25Qd1JiSEROQmIxRXRhdVpoQmpkWXYrWFR2bUVU?=
 =?utf-8?B?VDYxa3JhM1IyUFp2bnhYM2YvakZIVEZtNHpVcW1uYWlpTmxBR3dwZHN2eTdH?=
 =?utf-8?B?aGtUQ3N1WkhKZzh3K3FGeU5sZnJNYS9WVGtYcm9yT2NOaDRqaE42VVpTbG9s?=
 =?utf-8?B?YkVxdVpnVmRXbFFiTE1CQmpXejQ5bUlsQzdjYWhDblpTRXJDK3dVSFVkV0VV?=
 =?utf-8?B?dHcrTkxaUmtobjZ1TjdTMll2dHJTZllrdlhhZ0pkQjE3Um1tazg1d25FM01W?=
 =?utf-8?B?MUNUVTA3UVpYTFdIL3VwK1RLMEwxMzFpNEgwa1dxQ1QzY2pqSmRFT2U3aTI3?=
 =?utf-8?B?L3c5Y2UybUxjOWd0alNZQ3F3VkVWNlZWZTQxYmJ5ZzNIZzBKUjNTVkM1amF4?=
 =?utf-8?B?NWV3SVhKNWUyQ29rdU5kUmNMUzFSQnJZTjk2Y2pGVERINjNJTGdaT3RNNEVZ?=
 =?utf-8?B?ckN5c2J1WGJCelZrK3gvSWR3bUU1QUkvcFR0eXpXTEd1SkRiQndjV213bS9o?=
 =?utf-8?B?dlQ3NzVTTjBHaEdHUEFjcWc2MER5N0YzUCtwNk5ySWxrd2s0SFl6NjM4UWIz?=
 =?utf-8?B?dTdMMDM5aVFnQ0JWajk2L1hucGVoNW1YS3FZZG55cTZVQnVGMEtOU0tPMGVx?=
 =?utf-8?B?UHFiK2l1bUxUbE5ETFJtMFM5UnB0aVJ1RW9CaXVNbGVXVGo0OTFnaW8vanVk?=
 =?utf-8?B?Q3lRYndaei8va2RQVUVpS3JGYkI2ZVBtRlJNbXNyVThvOW1QMG8wZVdFdGtV?=
 =?utf-8?B?Yk9INi9maTQyWFBMSzFBV1E5WEJtelZVaUVWaE0rWFY5bFhvNHZGVUV6ZTRG?=
 =?utf-8?B?K1A0NnB0TUxnVDNLZUltQ3UrblQrK05mTC94MVhDSFhhV2JjR1FCdWUrSTJN?=
 =?utf-8?B?S3c2RnN5bWN6RVhlbDVOMXZ3WVE3WW5MZDFlT0tMcGdSaWZvaUhQN210cW9y?=
 =?utf-8?B?bTZQNlBjTlRNMWdZbGlrQUlYMEVhVEpjMkJCN2YrcHptdzU1RG1WU0J3dFlh?=
 =?utf-8?B?UUgyNWV3YXdMZFdZSTViTERhekJ4TCt4NW00SEdZUFhxc2ZGeTlvb1hpVG1h?=
 =?utf-8?B?R0huaHJqdDNza05NUDV3VjZJSUlENWx2ZnN6a3k0MThHWXN0T2xDMy8yVVJt?=
 =?utf-8?B?d1hMYzZQMFFIaFkvYW1PTThoQmJ1b0s5MDVCdmh1UzNJZlJzck9Cc1hLaVMw?=
 =?utf-8?B?dkZVazMzSGhMeG5XM0FnR2NNYnhCaXVldTZBbXVRMFB3SWowbG9EaUtoYWo0?=
 =?utf-8?B?TWpiNlh6S2dnNTA4WVJFeDFVYnk3S28rRllMdUQzakNrS0FaUXJhWithZ3V4?=
 =?utf-8?B?TnY5bnRxeUtrd0NHRUF4Zz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MlRkbThINXQyS2hRNmZZSGxjSDJ1TzkyUEdTMzN6Q2syejdaWHBaQ1VrMkoy?=
 =?utf-8?B?WUcvb2lxWGtCYi8vYk14MFNqWGxkSTdFSUpodmx5VEdHSzY3dkRpY0tMUWZi?=
 =?utf-8?B?UzJjbEY1L29Zb0hnam1mcldDNlNueDAvSjg3ZVB5NXNFTVBGK3Fsd3BCNHRV?=
 =?utf-8?B?bkRyNU5yWHF1Qm9kSnM3Rjg5aURLM0UyeU9MTVgyQ2JwSXFWcElHaS9Fd05y?=
 =?utf-8?B?Tnl1cTk4RXlycXNFVHhabmxVNEw4SStRYUpHVGYwdHNzeVlCamJoMVNjZk9V?=
 =?utf-8?B?L3BlSyt5L0UvRTdnbzNQZS81cDBRdGtMWFREcExMZjM5R0l0NDZsT2krdWNO?=
 =?utf-8?B?cUw1Zk5EOXc3cHBtcno1SjVOUkE0UDZVdDM4SHFmaGVQRW52dEhpdlRVN2wy?=
 =?utf-8?B?MHFzZlFwbU9CaE5SeENSOVB6eWRMblcrUlJkZ1owNlJEZW1IWnJBUTZlWjZ5?=
 =?utf-8?B?RUFsOUxSUWR4ekkzY2hhUHM1eENCQUJSUHVoazRHTUZiRFNSSEdVazBrTFlq?=
 =?utf-8?B?TnhZMkF3TVoyeXVDejJPQzA3VzVBa2NqZ2xHemg5SlZ0UEtJcGJmdkxGcUFl?=
 =?utf-8?B?b29UM3hDbW52Mm9sVW5MaXBOdXFoSEVxeng0Zm1rRVRvZThiZzZGWDhYYnJ0?=
 =?utf-8?B?L29SR09ET0tseDZlZWxRSVNyWHc0dnE2amQ2Mis1Zk81RHMzc0VCcFBYVVZZ?=
 =?utf-8?B?bTFhRE8vU0tOdlorSWczeVBpSzJpTWIyaFdzVEJWbklsRDdUN1E2YVJhVWw5?=
 =?utf-8?B?V3RLakhVMVpaYUNBZG1zL2wvSVFsM094clU4MGw3UWVRQ2UrbzBDWG8zbVN1?=
 =?utf-8?B?R2lxaitPUlpkTEhMSm1PQStHT3lMLy95aVcreDAyWkQ3U2Z2S1VKNjJZL0tP?=
 =?utf-8?B?c21YOHB1cit3dy9LLzYzNDB3NXdtK2h1MkNWL3lhbnFwand0SjI4MmIwREhV?=
 =?utf-8?B?dk1LcW0rZVVHbVhvSTA0THllOTd2SFdCMXdTeTBzUUNhaDV1Mm1xU1A5MGdp?=
 =?utf-8?B?MUdFUlZTYnhHdlpXVWJVSlN0a1lSL0txNnpzajhDdWNuSzQ0S01MU0xFY25K?=
 =?utf-8?B?a0dNR0tVejJtOGlQZ2s5VVZaSnpTQU4weitRVlFsNUI2ZEpsd0cyZGZkL3lV?=
 =?utf-8?B?SlJCQk1LOHFYZERVN3VHWkh1VDJSbTFIb0UrSUxMcG9Td1BBWVZ4a1BiVXhZ?=
 =?utf-8?B?bmZJSjVvVUhwaEJTR0dBSWNmRGtoSzVHRHphOGF1VkRESmJkS0FJVVlXYWFM?=
 =?utf-8?B?TW53aUVudEIzeW83L1k0KzNTRkd1MDRzME44Yng5aDZrZzZHSzRxakwvKzhl?=
 =?utf-8?B?Q2RjSnVwSlZjR2hIbGREcDE4TEdlcXlBNDJaSGpmekx2SFZnaWxyZU1yM01k?=
 =?utf-8?B?RWhGQXMrRmJGVHQyU1FIcTRSRno0U2R6d2xXVFJEc2xEZWpNeHBoSEpYak1r?=
 =?utf-8?B?RTdKeTJ0Uk1lUTVzbUJ0d2FYWXpCNlhDM3cxak0waldBN3d4MW1rWmdQYnIr?=
 =?utf-8?B?bUhOdUI3cFRaWkJTYTE2WFNsWFhOa2dTNGVDOTFoZHRhMWgrNmpqeVA1bU1S?=
 =?utf-8?B?cFBCSXRseVJodElkck50QXI0anBYY0RsYjZEdjRlMHJGSG5tZ0drVlNSQWpo?=
 =?utf-8?B?SklubVl1SDVpNCtwSHU4aEVvWWFDWmlYNEpTdmgvaTVkcjBMeDFHeHNBa0NO?=
 =?utf-8?B?MFhtUnNzbjVnaUkyQndsSkJNNjJ6cmd3YXppN2JkdnNQMGJNcE1xbEFvTGtx?=
 =?utf-8?B?c25ReXhVcDQ0ODh1c2RWaTlxdlRWTFpoSXNJMXpWTHRUelE1bzRyN2pIdENV?=
 =?utf-8?B?THlSMGtKb3RyLzM3cmFTZkpMc25mNDF4VjFiK1orelJreXZXeGZRVUdobFcy?=
 =?utf-8?B?Wmd0NFNJVWpvbVl4QjhaSDF6ajV6KzVFL2VxZnR3UCtWVWoyR0gzMTNjYmlH?=
 =?utf-8?B?eUJKUHJMdGRrTmZBd0gxeGNVditsaFFabVgrU3JrNjlEUDBNT1FJRUNBMDV1?=
 =?utf-8?B?WEJEbm8xSlpIMU4vTTQvSE9QTVVZZ0V0d3NOb3BnYzVIWWVocDBMdG1GRUds?=
 =?utf-8?B?Qm43b2wxcVJQU0dxZHR3Mm9HSGdJQVY2UmpEK3ZTdUNKR3dOaUEvaXZjSnQ4?=
 =?utf-8?Q?qjph4AJXUqK2cvy9jSiCpO6M+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cfeb428-e97d-4864-571d-08dd0efc05ac
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2024 15:56:14.9078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nZOrRE+gZI3hFuz0TmcDxjFYWC0uhMBBoLiO+YfLJs3QI34XL6YECZX12Sr7NbaMCop65JOGcJFIDxCBOUz8tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5837



On 27/11/2024 06:20, Kartik Rajput wrote:
> From: Pekka Pessi <ppessi@nvidia.com>
> 
> Some clients depend on mailbox being empty before processing the
> message. On RT kernel, the thread processing the message may be on
> different CPU or running with higher priority than the interrupt
> handler thread and they may act on the message before mailbox is
> emptied.
> 
> Signed-off-by: Pekka Pessi <ppessi@nvidia.com>
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>

We should include a fixes tag here. I believe that this would be a good 
candidate for stable too and so worth CC stable on this.

Thanks!
Jon

-- 
nvpublic

