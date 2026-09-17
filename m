Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010035.outbound.protection.outlook.com [40.93.198.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7154AE130;
	Thu, 17 Sep 2026 20:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789675324; cv=fail; b=PCPe4Wtzxz0w/so88VG0lHjYqPChIZ+rLwZYQ+/Rt0K2d4t47PfgFbpoCW7SvIQIdOdRIopqWhTsaPXR6HHep/XM3IqJ/+KikUCAwastaoobVQ6IHviAcMFPkXVoXKQV8MocReSR5FtMkbccmeEnaTjEhgj5V5W9oLsLoQYqZJo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789675324; c=relaxed/simple;
	bh=+wnrXmEsL/zqu3lk3RdOgmZTvCXSrenq2OsNOBL2cIA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PwH7DfY/zOQQn9hSklf1G6qG2Nn5iucm+hzsNzh0+XBMC1zJBccgkgDUb+P5b/f53G/Iv2TWIhFnMmBo1BCQFnigkcFGACD774PzzmaPMTBm5K/LujK4Lxs7xi+csYnUBtZX/39eAHMIFq//8r0nWNtmyjsPU7CB2KoOdqNnJeY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ENd6wz1j; arc=fail smtp.client-ip=40.93.198.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ENd6wz1j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sCZLAioZFSuR9AaLzr5fQU1ay+MNoFiavuzNbXrXy8A58IAL6rbCIUZkvUAexaVG6/9FqYayyEIzv1zupo3fBKsLtEEMSAb/LgJWfObwh8PaO1wJ8tMKLt5fOiytaxY7S4JICPwE1QbMGKtwaptbTXaS38JXaj7OhGUKLxNNGNtgFgxnBJKCgfiJ0cbUZd4O7KT1C2NNpP9d1ubV7gOoyhEFAMMQ1IYsdMz2Zcfi3CybHVgroKFKJwZsC2rrWB/z0pILuy9NjmUwAzx5NGY5kALkNUPNXS53gm4KOkZjbj9UnoqVRqf4GxH6XmWs3eONngeImW5Ogbo5e1Yxeo9+cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4sW1ylFEkm6iul+DwZq+vLnE/U/QmWkGnJAr0tS3Gk8=;
 b=fOtOdnQqzdAz+CBv8elrYKw95i61RPsdK4AR/yh7be3d9bUq5HmMdoSbj06jPOg+lyhezA5kYFUou2zZkMwpo1IScWpESrepRcEeLiyIJNHFw9oq8rlHnK/uVfkUkIADinrPTfK9LFfhE3UpfasXblKWpV8v4rTq5nrAM8Wo7HESL35lsnPHm8+XKMPC3s6+iGX1VLM2VaIGDBkaLtIMr7/xrfv47tWn9Prs5tPLEP1AABlklzQMN4y1ojN4NkUZduFHiJ69p41C5V5hT/a950Z7OGoTk3T2wIL7S/DyfCQeibBYm7xDk3HziRMfM3/tT4nW2lh1LAxgRVAMWBjvWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4sW1ylFEkm6iul+DwZq+vLnE/U/QmWkGnJAr0tS3Gk8=;
 b=ENd6wz1j2KtYyrHHuLkqUSGNDeSPfWnzjfpwWcVQybHdG6hL6nWgjk/lCe8fAqyGh6sHZzlylfoO1uW0juNNsKSakGS5SE4GbYQCaG6uFyaD032yN5EEYq6B4TJ5643f1CtzVBaVzfD0CIpfS39UokU+7e29R9DTh/fxQhEmHM5sKqsk409lTtlb7k0fGbhazN3lDT96rns8L+ZuNKrtIkvI0l5MM/RYLT1aVTBSnSYT54Bsen1Q2Ln3NcWrmRlpMCYJDVa5UzStNhIClbiuisncJveGkJyZzOwhoSEQDYOsgWhl/0dWB46BLhX7VhWPLYKNDM8gAghYjOb2E+yq+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7110.namprd12.prod.outlook.com (2603:10b6:510:22e::11)
 by PH8PR12MB6940.namprd12.prod.outlook.com (2603:10b6:510:1bf::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Thu, 17 Sep
 2026 20:01:59 +0000
Received: from PH8PR12MB7110.namprd12.prod.outlook.com
 ([fe80::736a:e1be:ec64:5740]) by PH8PR12MB7110.namprd12.prod.outlook.com
 ([fe80::736a:e1be:ec64:5740%6]) with mapi id 15.21.0428.009; Thu, 17 Sep 2026
 20:01:59 +0000
Message-ID: <1114db1e-55fa-4056-bcdd-f1512bac70c5@nvidia.com>
Date: Thu, 17 Sep 2026 21:01:54 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] ARM: tegra: Clean up AHUB on Tegra124
To: Thierry Reding <thierry.reding@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Charan Pedumuru <charan.pedumuru@gmail.com>, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thierry Reding <treding@nvidia.com>
References: <20260902-tegra-ahub-dt-cleanup-v1-0-028f3c5e72f6@nvidia.com>
 <20260902-tegra-ahub-dt-cleanup-v1-1-028f3c5e72f6@nvidia.com>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20260902-tegra-ahub-dt-cleanup-v1-1-028f3c5e72f6@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0102.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::16) To PH8PR12MB7110.namprd12.prod.outlook.com
 (2603:10b6:510:22e::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7110:EE_|PH8PR12MB6940:EE_
X-MS-Office365-Filtering-Correlation-Id: eaa675c1-719b-460f-fc9d-08df14f6884f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|10070799003|1800799024|22082099003|18002099003|11063799006|4143699003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	5AqV3TYweG9PHAauAPTQ0dCt67ZMEPRrPBUZ04ad8m468JRJJHXZJ1ikNVirZJVGUsWRf/3X1vyvcbb6DMAVd4Z3kgZswIquS646KvRgPnE0ulaWtbiPSvhhaJRL8RrLDu9q/k2pVBJ8oyuDtaG3CioJZd3NfT6v8xE/SmmwqXglPVVJvncerZ27PsNPeqEpNZAsHsiHZ8CgSGOsvY4Znvmhv0lvT2EjOCZQvz+IiltJqXL/mMXonk4/dH8fWdMVJUkYYc2ajIfQkb32rXTLYJPgpfIvMSPao5jY8Byg7Tjf0GPpayimu7gRZ4SFPHmAu+ar+A+Y0YQ/8lizlRDA59PQu7lJ31cQAV4xeNKL+MYIbuwF5Mh8uW4uVbCs22LHNeltZFb+bhO3B66b5HkAVP83yiItAb3KUeR+VwUzLlJgJD1kyi8LikBtTNEikRFZff3ZtQAlVnGDekqHXBSgxZvphcfYyqK66sW6vuj8C0CpvphggoJL0fEFOVmzyO8PCiltC+pd5aXUs823Rn4unK+hMWOoW3juxnX7d4KoxA7F2nlMDK3iR+K95rdTPeXaavd9/kvpWFfL+6EF0uF7ZISpZFK9YzvpwR+/AMDtX1qKEu3fhsyEl+OAC4pRPygKXv7dFVauNt7ajIh27/e5HoW5/XPzRyASK6QlFeX6ya4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7110.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(10070799003)(1800799024)(22082099003)(18002099003)(11063799006)(4143699003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wm9BYmh0MWlVUjVLTzBjeTArY0tTc3JsTzVFSFFKclVYSlBmMGJwYk9UNm9x?=
 =?utf-8?B?b2VEcTlsRDlPRUVlVTd4RmZsNFMyY0JYczVGREp2YjhHWUQ1T0xQdW9sMGFs?=
 =?utf-8?B?K0U3SjdoSmcwT3hES3BDSFVjek92dnhSV3krNnNpdWJoRWc0NzN3dGVuNjQz?=
 =?utf-8?B?eDVpWHZYOE50U1NsaDZlUUc3UDZwUUtSdkF6UENYUU5zYk5iY0xUaVVpT245?=
 =?utf-8?B?MlQ3VFV5M0ZZUDQ4ZFVwbGhVbURjRlNSelRmdFlOeDlZWVp4d2RvMXg0cmk3?=
 =?utf-8?B?eEs2bUx4NWl4QjZKUCs1T1MyQVJEbldFR2ZuM2JBaENHanFhRXBGRzlXVUxW?=
 =?utf-8?B?REhzdEhkeGRWQ3Y3c0dJV2p0WXlPVWJwdnJqRGp2L0JQQml3RVBUMXVFK2xm?=
 =?utf-8?B?ZThrU2FOQXNxT0ltanJ1YmxuaUJiWExtVk0yek94cDRFTG1JZ2RUYWIxVlFG?=
 =?utf-8?B?RFEwWnlkWFEyZnk3NThsK3pXUzRIV2VhVWpVM1FGV1dRVnFTRTMwTVV2UXpq?=
 =?utf-8?B?TndJa08rWUowQ21uKzNkZm90M1pkVjR5WFdvZGFRd1U4cG9EQk9FeUFiRlpj?=
 =?utf-8?B?dHU1QkYwNmpPWU9FL2tqeGpKd2JkakoxZktLZmF0L0lZQTBQOHNKWTdNN2pm?=
 =?utf-8?B?R2FyRmdEOE13NytPbFV1elFTbDR5QW5wWi9objVqQUdJZHJSS1psMVNWak1V?=
 =?utf-8?B?eTJ6OVRFRFNsT1NoNWthSFYyOWxCdUllVEZJRzFUc3kySWM3NGdLeG1sMG5H?=
 =?utf-8?B?M0JnRXBsYitlYm1BSFN2LzVsdkVEWUNVZEZMMlBxcklENFlGY1NyaEF1emFZ?=
 =?utf-8?B?RXBLL2piR0t1dm10UlpDS3JnellmZmFuMlRNYmV1RXBDSmNWRXhlajU1RjM3?=
 =?utf-8?B?bFJlQnNFaXA3M2FyalhOcTd0b0U2N0dkcmRGT2RnYVpHekZ3RWdra3Q3TUFr?=
 =?utf-8?B?Rm45a3k4TVcwY3dYN2wwQnMvV2pvNUp4YytmTVBXOHJ1a0d1eW0vWWExQWFQ?=
 =?utf-8?B?MlVaQlFJb2hSZUNKVXJ2bVlSWTI0c0IrYkc2WEhCdE9Ib3dVNjg0ajFKcGl6?=
 =?utf-8?B?eVBTd2NjN0dHaWdhNXJxcjVJVE5VNG8ra3dHcFRlYU90ZFp1RjZDMTBUZG1W?=
 =?utf-8?B?RFVIQnh2M2gyaEJQTXF4OGc0RWVhQko3WG83bjZZQ1k0Nmo3bWZqeGExeHRJ?=
 =?utf-8?B?ellVWnlCVEJrREpYMUgzTTd2c2JBMThwS0lhR3FHeDRvWWxUY3I3czYydEpu?=
 =?utf-8?B?S1pCK2lBYVROajIvOC9La084K0dWaVdsK01hK0ZvZDcxM3VIWG56MnFZQk50?=
 =?utf-8?B?ZnZaNXJMell4U0tNWUdWeEpPYkJRemtCMVlpT0FqZ1ZNaTJDckZ2WjROL1B5?=
 =?utf-8?B?SktsbHBuUGEySWpBZkJQV3phSndZeG51Yy8vZVZITVNSS3NxRGd5WUoxeUlu?=
 =?utf-8?B?UTBJS0VjRjdxUnBQSTQ1VW9JdmNmdW1SVFNVTDFYYjF2a1pCTXR5QVBzWUZa?=
 =?utf-8?B?SnhCYzQ1Vi8yNDVQVHpodWFNRnZNS0xTamp6WTREL1hFQWVQRUltRmZiNjA5?=
 =?utf-8?B?UEkvSTVnNjA5NVFvRnU3VE90MDl6UGRpZmU1amovWjRpd1FhdytERk12R0JP?=
 =?utf-8?B?OGZzcVBwUGd6a2t3dDVhN3Z1eFZRcjN1aVJTTExaN05EbG53d1ZVUnFDUWEz?=
 =?utf-8?B?dUlnZWtycmlHanpmcUFqYUpiR0M0eWZ2QzJQdnpZOTYvaVRjc3o5dTJXcThj?=
 =?utf-8?B?QXdRalBPb0ltem55WVEwckVNaXRBSTNhTW9GcWg5aEF1T1RhVWRLRkpZY1pm?=
 =?utf-8?B?RXh4NEluL1FaTEpaQ2FQWkh2MHZGWHRGVklXSWlFQ2haZWlBK0ZmbG1Cd3Zk?=
 =?utf-8?B?bTZqM2xielVZeENKQlpnb2xNUFJKNmhLK0lJa0x1YTRXUTgwbFVaVkNETUda?=
 =?utf-8?B?c1JXbWJ3ZEpCRklEVXF4bVo3R0U0TmJ1N04wMkVjR1pMd0ZRQ09kMlNJeXBq?=
 =?utf-8?B?dnJHWE00RTMxSXFPbjlHdTZOZ1dOYVJBaGpmbnZqWkpmU2hNbStpblNxSlRG?=
 =?utf-8?B?L1QwWG53OUZscm1sdko3aUNBZkRpS3BZbjR2MVF4K0QxS3dXTkJKOVdJd3hM?=
 =?utf-8?B?eHBqc0ZEV1IyejRML3NESFBBL1B5VDk4VFQvVC9wc3pxcjNJTFFUc3VTK3NY?=
 =?utf-8?B?VDNvTUcxRlcwa25sTEllL3B3TkwxVFF6VFRYK3RJdTNJeDVIZDZCaWZBVjR0?=
 =?utf-8?B?cjRPNkdOZitCNUpueFptWUY5aWJpMWZSZ3lMOGp2QytVY3lmOElwVFhCSURR?=
 =?utf-8?B?VWUxWG9Yd2RPcmE5TzcyS0pydEtocTk2a0swaE5ORUdaV3R2TWdIY05VWnJi?=
 =?utf-8?Q?yiiocXYWHXwP+B6685gz8PEtF23V87Ja8PWpOtN+whn87?=
X-MS-Exchange-AntiSpam-MessageData-1: yKA1RfvQ6K/mIA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaa675c1-719b-460f-fc9d-08df14f6884f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7110.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 20:01:59.4686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fZsx6yQmpaWkJViGeuD2lWUlgYO9CUk1qTx7Ve6peqCxGGe+S6KPOQrtzQ9+YryuWVlZfYjB0V6XYa1x6ADS4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6940

Hi Thierry,

On 02/09/2026 11:17, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Use #address-cells = <1> and #size-cells = <1> because we don't need
> 64-bit register addressing for this hardware. While at it, also adjust
> the ranges property to encompass the entire AHUB range as per the TRM.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>   arch/arm/boot/dts/nvidia/tegra124.dtsi | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/nvidia/tegra124.dtsi b/arch/arm/boot/dts/nvidia/tegra124.dtsi
> index ce4efa1de509..7a71dba42dc0 100644
> --- a/arch/arm/boot/dts/nvidia/tegra124.dtsi
> +++ b/arch/arm/boot/dts/nvidia/tegra124.dtsi
> @@ -1114,13 +1114,13 @@ ahub@70300000 {
>   			    "rx3", "tx3", "rx4", "tx4", "rx5", "tx5",
>   			    "rx6", "tx6", "rx7", "tx7", "rx8", "tx8",
>   			    "rx9", "tx9";
> -		ranges;
> -		#address-cells = <2>;
> -		#size-cells = <2>;
> +		ranges = <0x7030000 0x0 0x70300000 0x10000>;


I noticed a regression on Tegra124 Jetson TK1 today and I am seeing ...

  tegra30-i2s 70300000.ahub:i2s@70301100: error -EINVAL: invalid resource (null)
  tegra30-i2s 70300000.ahub:i2s@70301100: probe with driver tegra30-i2s failed with error -22

Looks like the first address in the above is missing a 0 and we
should have 0x70300000 and not 0x7030000.

Let me know if you want to fix up or what a patch to fix.

Thanks!
Jon

-- 
nvpublic

