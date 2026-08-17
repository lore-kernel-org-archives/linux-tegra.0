Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012013.outbound.protection.outlook.com [40.107.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1262DC783
	for <linux-tegra@vger.kernel.org>; Mon, 17 Aug 2026 14:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786977701; cv=fail; b=J9NF2IhWN0q9BhWbct+cfBXsywczkIKoDoaLllM2GubEdewH9+vKA5OyTy9CyfeYke9qil9fF21WOenstl3W+rh8ByLjAv8rAZC8+x/eRc3Sb+cvHqJFb9MJTXml140lT3Fa95+jYZ0TOlAPth90BNu5ctND0EEGw5PnFzeJFiY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786977701; c=relaxed/simple;
	bh=tNccz3paIhRd7QxGrpbEMPVz5m6KSiZXOwITK2JrFdI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hC3y8odT1hd/ta6tSXeBGmRNOjTozYlmpVYqK7s2QPpE2HWqU8Y02YCyyulBEGT1d9gIgHonMGTKjx7J/6w1ND1QlHIaUEQWbT2dqA4TPu42Y4yfSSjOrSRevKxENs8iH4D9nRvJXWufFEyk6JhzPt8u4d0QwJMyK/3nqxZBcTA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mlczB8XF; arc=fail smtp.client-ip=40.107.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mlczB8XF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UCovv+H7Doo71a+khj2sZSEEbdIgMhQLGhH3A4IEKk8BdOVCDhphZANu+ICzLpHnVHpoUwPY9omUXFTkIusAhveyiM/N8hdSjdHbT3H+Ft4H1sbjx2sCaCk++GXsNdNDyBcbYkK5EJ5aGP7oqPHasCrBTrYsPs6+GdkmYUnfOWqvLSiVjUhJ44ckFBD2dDCzfZJdx1M27eaYl38VkeZHji7nMJrXvEqGy8XAKcmG1tsVw4fO3Fwp5TyXpa3YSohvWYZWpefseB/wvbeeCd101bl/K1qGHjG5pRN7PyMY4KwzOT9ZiQEhIYN38DFEHeJglZbOMf3re+cEMGeuI8deXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=StlfKUSUQ8SPsMq9ahRGmBXNBWe3Hz6WsfJbulN+TX8=;
 b=DYO0eNxUe+hlsR5oKC2XmSlE7N/v4f6MEq6ptRkF1JaVbZ1ZiEGPfXIagHhVTJQ/5ei/Bi6JhoPW0QoV5agnI+8ib5oIjDKAMyiViKvoAWHb4JExWVa3X21LUELby1dQU22BBn3SKhXg9qAI5L9DqaqKD2Ze4wB3mCg1lYfKCoMSMOi9CWPwUHAGXDzvD8l13SNcHZDJ0bVN6UNCJNpsylg49X3LuWKQ5DZoplxvgeh69MZdLtivqo0no4dBcMrQzZOw94YqIAyCpXaaaNmg3Qsd5aZQVYBuGtH7ItBd0sWZbrs2NQwo9JliqaJqU5gPGipBVe7RzWwRl0NdqIctyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=StlfKUSUQ8SPsMq9ahRGmBXNBWe3Hz6WsfJbulN+TX8=;
 b=mlczB8XFpgi7XHexy9wtED6Z4CEdMOpcfpS7Xybi8/PX8pM93k7jCkMtbX0bRp3PCMB435w4e5aVDTp7Yr16d8DieTRzmATBe+lj0+ajxAmH70Lo/Nqoeyd68XH+JudJMGPQWOmERyo5xxuKxknIjqP9orwafZmvnWze4YnzV92RaL2rffjb6gx/p3ixvE/kE13jmOyH1+F+nGnnQZezsZqSCMNjvAkVwwMnAGXJrn+lE6iHTY8fHF2H0tvKVCQi14pedi+EpiTi2IWJXKSsDdROcBJ0S91VjPVWsKDKSzxPmVf4fO4aTSRKS3cuii6j3o7wEkaBV3Ni+ne8+7lB5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ1PR12MB6051.namprd12.prod.outlook.com (2603:10b6:a03:48a::18)
 by CY5PR12MB6551.namprd12.prod.outlook.com (2603:10b6:930:41::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 14:41:34 +0000
Received: from SJ1PR12MB6051.namprd12.prod.outlook.com
 ([fe80::96e1:b300:7b78:d3a9]) by SJ1PR12MB6051.namprd12.prod.outlook.com
 ([fe80::96e1:b300:7b78:d3a9%6]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 14:41:34 +0000
Message-ID: <75f49105-f36a-48cb-877b-5ab96c8fcd90@nvidia.com>
Date: Mon, 17 Aug 2026 15:41:31 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: tegra: Enable built-in RTC on Jetson AGX Thor
To: Thierry Reding <thierry.reding@kernel.org>
Cc: linux-tegra@vger.kernel.org
References: <20260817143205.287870-1-thierry.reding@kernel.org>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20260817143205.287870-1-thierry.reding@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::24) To DM4PR12MB6063.namprd12.prod.outlook.com
 (2603:10b6:8:b1::19)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR12MB6051:EE_|CY5PR12MB6551:EE_
X-MS-Office365-Filtering-Correlation-Id: 212aa5f9-9ad3-40fd-3f07-08defc6da26d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|1800799024|23010399003|366016|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	osfuebrWNW6uUNBlPx3gVK0bT0Hga42neItsWGtRgsYdrvF4ZwocvN4hnzp2JrhaPMVTVSmosGUkoMktU8s/AvofUuWTDeEovmR9m0TRlZ+7U/THJuLrO4JtkfrGU63qQuzr0vJmO17BKSxJTBuZdE89mhOqbkzLeSlPAc1I0HoOIiIJttDgNzidg5mpkGwSsiY2FAeFLqrusDYkGkMojYK0I4XNErgwIJ0oelJl1CkFQAjo7UOijUIP4cxIUL99i3EG4d6w6qLvKqlWfY4hXrt86h68Hj9GqIkHhrPpVNjdh0L7sb7G5BtE2Z1jyGMWbKwwE7VL9PtLrC/xkD9vOPkpb8lE9OYoY5o9v1lWZQJWowl2eimUpEz4pPAkkOC5lafvqJzoNDU2Wu4Xqi1nv1DR5WJEMae/M7corQrkVhjKa16aTZch9vv2Nd4+KzESOjTz6IppFZp/Pm2mIe/HU6u6mJIcjgossF+EhcpsPuFD4BY0erXYEMl0Jaj0eTCi3dh1POsW0LltmDsJO+L35ElbZqzf32+NWI3vTw8Bj+YfbnfbPBNelH2SbOZ6xj/rkW2vZrofv38Y0T006C1fEGJP2q46GJ+QiASxHx5yqbekCcp9hVpgEwrn8w5VB6PwbIvnNn8Kqq7DqQsEJcw+TTFYRppsN0OULwAbSKlwfWY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR12MB6051.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(1800799024)(23010399003)(366016)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGtFU0ZSY0NBRkkyc3RoUXYvNWxWYU5aZWx4WEQ0cExyK1BrSjAxeWVubHRN?=
 =?utf-8?B?eW9MVWZmbkNONU05VUt1b0VVR1d6S2dScW5IbVRlUFJSODQ5cEFJUmh1UnBD?=
 =?utf-8?B?a2JFd2w0RndWUmdtdWxZQkRXOHArSWxSRUJMZ1JUdDJOWXBCNUVVVWNBME85?=
 =?utf-8?B?SGFHZ2NZaW40N2dmT0Q2MEJtSE9HRUV5M3g4R0dLeElMQ3hiOHdqMG1iV2pK?=
 =?utf-8?B?VDJkYitZL3JuUElCcGJpb1FtWjBScXdOdFdpdXJIT1o2bnRadk1uV3FXdWRa?=
 =?utf-8?B?WHpqc2FKSUliQi9KYS8vTE11SEY2Y0xQSFUrNW1RL3lLd0JWL1lBNWl0dHQ2?=
 =?utf-8?B?UjN1UVBkdkdjRnJ4dEZOb2JIcnVOU09GZmJLNUxqd2hMVnZWUHJkckR0dnhY?=
 =?utf-8?B?NTM5WlBycnBqcFZYTUpyaENaYnJBeU82NTRPckpCV3Q4QkdlQkZEODYzZGNF?=
 =?utf-8?B?U3ErVXZ0U25HbllWWlphY0Z3Szl1bm8xWkhqOEs5TG84ZG1vNGtIWUJ1MGNm?=
 =?utf-8?B?T3dSK0NyOTJxdEp3ZWFGWkZMT0lnRVFoT2c3SVRydWdIQVVPWTIzdDdjV1Fm?=
 =?utf-8?B?WkNqMENWZzNQczFMenkvVkNZUHlKcFovL0daQkVhWDF2YmExUlo2aWVwbEtr?=
 =?utf-8?B?VEFvc3FMR0g2M0hWa0NjZktjc2h2ZGw4MC9NUDlBQzBueVRnNVE2SUlZTVlG?=
 =?utf-8?B?TDdndGhocXY0WHdkSE9sb0lSTU1xbmZDOEplUDRIbFIwbzFTeWw0ZTN4bEd3?=
 =?utf-8?B?TnN5bFV1bjlhZ0pDbTNhUWVNZjJlNmlGM1dHb3UwUS9wVlU2U3piV3hYUThh?=
 =?utf-8?B?eXRlUkJucW96c3NQVTBQVGc2NDMxQTdXNGJhbTIwYXNDN25UNkpmeC9Vclh2?=
 =?utf-8?B?SlRXNWVWTk43Qi85NEtUWG9wWmZKaGJnZWZRTTVzbXVXNHhtYWlVOFcyeDRL?=
 =?utf-8?B?YTk3RHBia2lvbzZWWUp1YW0rWlR2ZzA3Ny9XMS9zZ2UydnNBaEVDRzBTR1pi?=
 =?utf-8?B?T0gwNWNyMEY4K1ExU0ozRnBVSkp3T3lKOWFCY2JWZ3dZSDFRZkI1Q045eGFU?=
 =?utf-8?B?ZjBSN2xYTXErZTd1VFRLQjR6amxBdGRQL0dNajZXT1dvUFpPa2wrS1NCSGd2?=
 =?utf-8?B?Zms3YmpLbXU5WVB2L1ZsRnpwL01kL2lPbmpCeHRrV1VuL0o1cS8xTVl4M2N2?=
 =?utf-8?B?RlMySER0YWFYUmNqb1V4WGFDMFBzMUppaHNNanJLTUZBd1VTbjJSbDB1WVFX?=
 =?utf-8?B?ZmJFZXJiU1k1YzlMVkZIeVNrMVIyV1BGczBCYUhsbGpIS1dyUmtRT0g5U3NF?=
 =?utf-8?B?K3YzVUN2WW5zdENMMmM1T29rdEdMalVqZVhCZEhrd0d0Q2ZMc2VHL1VWOFI5?=
 =?utf-8?B?SENMM2ZxaUxDTmU3YTI5dVRvQlhvMHh0RDB5a1MvZ3ZTdXpYM1ZxTFhEaG5m?=
 =?utf-8?B?R2RWSXYzdSt2Y2phZ2huUmZmbm8xblFRaW54cktyWHNlOGZxdkFJTktnZlc2?=
 =?utf-8?B?b3h2TmRlNVhRM3dTN0JXanp1OHFYYldmMGFMaWtIVGNwQmlOWlFtU3U4S1Z6?=
 =?utf-8?B?MUU5Syt3bFlZdXpVVDBsSDNUUFdkeTlWcURnSTdEamtRMTF6d3ROOUFQTm5O?=
 =?utf-8?B?UlhHY0NHK3UrNUtlNjdWSlAwQkhWWkIrZXMyc0RvdEEvaUd5M2djZmVWVmVP?=
 =?utf-8?B?TkxrMUFiS21KZHMzdGdIb2pXa2xzSGFqSlZqckF4Znl0S0l2emJiaG1TT1Ja?=
 =?utf-8?B?T0tHWlFSTU5ELzgwWUJXeWhrTngwK3hWOUVyMURhaWwrUkwwc3RLYjhFa0NP?=
 =?utf-8?B?WCtsd2ZaOGRBbTZZZExVVHl4RG9kQkx1eHdkeVNNODdFNHZwa25JMEdDOGFL?=
 =?utf-8?B?VVdnSEJHamJHZVdKZExxeXE3bHJDUkN3cmJaVE5QNEhUeWZIZWkvZ0pRVzdn?=
 =?utf-8?B?dWl5Wm45d1FUT3ppdFFXMjFqL013VGRaQXcxV1A3T0l5SzB2NFh1UTNVSkNQ?=
 =?utf-8?B?eFZ4cmhNZmEwbzJIcmVvcEFTclZOVVpFUVdGZzBtdG9ENFZBemxtYWJtcXNV?=
 =?utf-8?B?dGs3cmV6OFZVa3QraUtxV1h4NTlrblRIYmpRaGVEMmp0aER6UUdBL0pOUGpr?=
 =?utf-8?B?YVNkQTcwQTIrOHdwVHhpS1pQZTlWa2VkdDFhUUJ0TVF6UzJPem5TcVV6Qis3?=
 =?utf-8?B?YUF1Rm5sdEh4UkYvdEYwdnh3NW1HRWRncmYrNlJVbXZyLzB3STdSVXE2Y3Fz?=
 =?utf-8?B?bUlnSWtReWo4RDB0WkNza1ZCT0NpZnMxaUdkVHNMTHU5STBjd29ac0pyMkVr?=
 =?utf-8?B?eGgvRWlBVkpkVHp1MVVWMWltcFAwVFBEdWJJNWlQU2hpYU5ha0JCSGNMTXJS?=
 =?utf-8?Q?69Sw0b32R7AFNn1FwqCstBa0SqBQr/FRiEDpy7DqAB+lH?=
X-MS-Exchange-AntiSpam-MessageData-1: 9ibe1eFsIAc74Q==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 212aa5f9-9ad3-40fd-3f07-08defc6da26d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6063.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 14:41:34.8722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IbrQRwireOKKY1vA7ys7boeGvAxTlVHLJ3JQenaVhfK3RK5c+q1eYsKVbCzPjhl3l49yhec9PDb0guGxB2rabA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6551


On 17/08/2026 15:32, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The built-in RTC is mostly useful for testing suspend/resume cycles.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>   arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi b/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi
> index c4ba3322ed9a..113ecf297378 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi
> @@ -13,6 +13,12 @@ chosen {
>   		stdout-path = "serial0:115200n8";
>   	};
>   
> +	bus@0 {
> +		rtc@c2c0000 {
> +			status = "okay";
> +		};
> +	};
> +


Any reason we should not just enable in tegra264.dtsi by default? I see 
that we do that for tegra234.

Jon

-- 
nvpublic

