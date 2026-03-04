Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010002.outbound.protection.outlook.com [52.101.56.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938EB3A1CE6
	for <linux-tegra@vger.kernel.org>; Wed,  4 Mar 2026 10:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772619565; cv=fail; b=N3bCAMiG3UQN7zvuarE/TTr3wAgv6ZwJG9+goNbCloYysyrWy7PJNiSEg5fYBc1FqTTEF99A73G3tLyOXH6Vogqwn6vVcSENPsb30U6Sb+jAYOF1T0LWhLcKtMRlOL/962J2B7Zi8vfPZVxE82XES9byGEIYYavseQoFkoRsUvc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772619565; c=relaxed/simple;
	bh=bjObage2nvZBCwTrzBkwqx0hIE6y3gfk690vd6GscZk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uJUb8E3D2Ff4wU4KHuGdsEZhLFhSLVt20jYB0d/rBreF8eXFS0jiAOoWr+MFszvU8uBuq4BOkGK0RqCCLO4jc5f+YJnDNqA2hwzDTUSuoTIGns7nhZ/7zQ2z5njF/5641fWmjTjx2TlhOdlq0TmrXJy9r0BLLzy2PFiq5Mwk7M4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ety1WZ5a; arc=fail smtp.client-ip=52.101.56.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ety1WZ5a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w6hLcLy1TQ7bRjZDbG0heh8742qQI3zTlAbEFVx/uG/ujTr9Kuzt6kiJBXuSpRpnQBTLw965aMoLYjeqFl5SWXIjKY6DVkP7IxVoKaRPUbyAgeVA3LgFlydjLNNVjHRo2IoUR0qN33hpy39fRqHSAd0u0KFZCeELDffc3zhewGbCIlx8DjqQp8n4j8XZ67ntXuhT2hfHFWGaFKsA63pKFufNWHfNuF8DkEJMGGPOBWYSj2uTPKZaSh6zol1jjI6K+UAV3bYHx+KmJyzS3r83i0HOUE09bNjhDFscsjToglq0QAyVsp+gWuEkYC/YE2oIsWoa/5khFiJHRb2UR1J9rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cpLyarRFPJCQSb/TgLAeuQqYHGZXD7OmHG/i8nTx5eI=;
 b=h1lBvwOJSKXErITQYWmxTEsNRMgMUVUbQwQWGRP54pkHmjdV8O0lrwgcn9baW+2GyGlKYIKplHgXcXjkUW7xA9GqODj9qRT2iZrmpSUaMJeGvWgt4BjjpGkF202ZkgyNKsjkZvGlsUqhlvxLP6Snu/glgyDkOUnF2YABTRSxv5RG3ZTDrH9Yc6QMZNPQlRpBsTf+34MzO2Sg+CCt8rL4AnScVwli0PTGWZJssqZqJ5q4WYqnOfbjQGqto0dp9NG6LZXm3jrMJwp+cHbrz1kUzQ94PCrCbnSkZKGqSYWMVSMgj4apd+g5MM/h4p4Y+Ryo1gOBmO4Ws+kogoP1cY11fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cpLyarRFPJCQSb/TgLAeuQqYHGZXD7OmHG/i8nTx5eI=;
 b=Ety1WZ5aPd6CSuv2hg5DvAgOi104ACW2y+A1gn1tijkPHgHOZtr+yfUROgKrjqnWw+lOSrw1UJPWW8twYeYg4YbomnxD3yo2FGSP/ZVT6YdCOZivQ/y5MFs3lMTZQbfMIuwfS4d5YJxLxxHqrP89xqL8kK9kPVnx6XpCvzZJrZkofE2uGmpJ5N0wPeO9FVAIDFXpZdAxyG7KvoJiKEjQzU16dzXrvipPZz/98J33jm2bqPYSbY39WPTAI1KSYDxzCNiL1t5hFK7DhmY7GnH3TeWSSE7z9FWQdCY3Iy2Om0nlIFpPjVS8/PJRNN4h1a2DYhIxMrGPAXu4UlxjKjCRIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by CY3PR12MB9579.namprd12.prod.outlook.com (2603:10b6:930:10a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Wed, 4 Mar
 2026 10:19:18 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 10:19:18 +0000
Message-ID: <f220c1f5-5066-4270-a00c-5c65941d1f0c@nvidia.com>
Date: Wed, 4 Mar 2026 10:19:14 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] soc/tegra: Add Tegra238 Kconfig symbol
To: Thierry Reding <thierry.reding@kernel.org>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260226150933.4067324-1-thierry.reding@kernel.org>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20260226150933.4067324-1-thierry.reding@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0458.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:398::15) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|CY3PR12MB9579:EE_
X-MS-Office365-Filtering-Correlation-Id: 51cba90f-66b7-4d56-59b2-08de79d77e99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|10070799003|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	w6BLkR4P3OIR336CxwxU8MLn24tSSpSCKgmq3P8NdymFJffIR7JEGInija5MtPj469lbpGPIkZuC9XusMeoBu9WS1kk7+Zjf4n7j0eDvMbTxP/JcA5dpCGi3tuaQN0rQgB9hAOmXD3dQVtOrQHYReaIBHxTH2WeR3ie1i+ef0BwDYdBUqVLP5RiXOY141Yel6LMJL+7sfivDwxMsHUB2gbmCj96ZsQ4e/jkdzX3txEJYW0xdsoybONdls7W8d0ncpaAgipLAjiQPMuju0TC9fkoBtR9TwJ53xMk5CDAeMkn8v/EUuuYO66BZWu6Xo5APWptBlwNLr7Zn8O/2pnxKzGmWWiqFhb86Tt7iPgaB0W5lAXiQ+JDeEjfln62+5x+83HFBXCxlZpbdKg/a45p/DYUGFN7wS68uqCSM8sKCX0EzmgGxgXiDYr+ylJ0ZSfA1PW65SBpDCruGoOYAAFqralsrSLUNllahvxsNqlxgcdC5t+BZ4T2CykYYqb0zTajSqIUdlMdyzpoOORRJqMOLR+yBlFKyNTbcjYYpbH0qtUJ5jTqyblbS2Vpv+TCvj54dFEPpPKl/vL37ajU7MOVMfnnknAbtgDRSgPCtVoskwziy5XtF7bSSD5LwrF/jJatNOJqR+MJUtZHT8ktAY+LrNplO2crJhzh5hsOrzZIOmzXjdO4KUpPGMKiUH59G2Qhmjgidn36jc9eXZ8wO4Sa5dVg0Y3QETimWYdIKbhU+Xl8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXpNb1dBUml1dFZjWStEVW9QQy8rZnU1QjlNL3BQei9NUHplK0VYTlBLZ1B2?=
 =?utf-8?B?Wk10NWVkbzJTTXVhN3NOZFNUeWMvek9mOEJVN002amxvM0l5U1hjRUVkWUZL?=
 =?utf-8?B?MjVjYjVrMWxKbmtVbFZmWGlNQlRGN3lnby9NMWRlWmtEUldiMURnb1dURHVO?=
 =?utf-8?B?cjhuQ2RWOThxWStxTnNOcDJSRHJPSTZPeHc5TVlxNDAwd1ZISkc4V1YycDdj?=
 =?utf-8?B?em4yMWNHeWFaWHl3Qld3WUF0bVNhN1RRZDRUK25sVDhvcnhxSkdPdDZPVUtY?=
 =?utf-8?B?NEJDRlZGWWkxMTdaaWRXQm13eW9XMjZ2ZkpiZVVMb2hOTXg4NU5YaTQrQzZn?=
 =?utf-8?B?WUI0aXF5YmdRajhmUkszWVBSczhFcXkrNHVVeTBSQ1lxbFlPRUVhUlJlVERO?=
 =?utf-8?B?MzVBY3dsV2QrOEQ5RTlLSGJKakZjcERVbEYwblJaaTIvR3o1TkRYZkRUYWtH?=
 =?utf-8?B?TEVFeWVKTUJ3aGphbE9Rc3Rmck5rdlJrR25oOS9hWjBRWTMxZEhJQ2N2NWs0?=
 =?utf-8?B?V2YvdFNXZUlBdVZMQnNFWWtSVFJCV0EzUGtlclZIWmcrQm50L0hTak1GUkE5?=
 =?utf-8?B?ak9pbEYzNFdkdS9QUC93V25SbTR3eFBXSisrVEp5ZlN3aVI2K1V3dTlodVMr?=
 =?utf-8?B?c05zTlBRaGp3Mk1xZEg3SnZ3MVVjKzNpZjNvZ2kxK3JrU3NWejBBK3ZWdWZU?=
 =?utf-8?B?bUF0QVhPK3o0SGV0MVlpWWNOQzQwWXIyU3NFSjFNTk1vekV3WUZ0ZlNSbERE?=
 =?utf-8?B?YzFoZDZVb1czZTlEUVlIQUo2OVREWHZKbkFGZVkwYUd6RVZjRWQ1TU1ZV0Vr?=
 =?utf-8?B?SzFQVDc0TUJGNy9kYTBjNXY2S3k2aTgwWmVIR3NuM0g4bXdjWVBCZVhmZG5B?=
 =?utf-8?B?OUJsV1R4VEsvenFFMk1yTFQrbUIyeENQWnhCejZEVEdoUE8vUm5tYi8yK2ZC?=
 =?utf-8?B?OTNyU0NwYUlVV0cvRkdJSEZrSTZSeFJad091RjNNeHlDb2haSSszZXBJWExs?=
 =?utf-8?B?emNxajc2NSt1SkhoUURHR3l6NzVYd1hqSkJOaXo3QkdJRUpxbWYyR0krRENu?=
 =?utf-8?B?QnJvclkrSlJXUXo3OU5sZlk5aXQza3k1ZVFlcE1vNEs0dEF1RVIrR2d4RWxk?=
 =?utf-8?B?aVZEVC9pcGhwaWw5dmU3amtJOElMVWtZbHZCbXhNMVVrMVdNY3I4dndNUUNW?=
 =?utf-8?B?TENDd1RPNmFJUEo0N0JwWGpMRDVnYmxQWnVrVVZBTnY4bDZ6aTdodUc5Zjkx?=
 =?utf-8?B?NjcwdVZnMkpsZnAyQnhpU3h0SFMrSWt5c1RuYzlTTHBMc2pJVitEU3hsNVlQ?=
 =?utf-8?B?dUhxUkVMQnVQZmgxTnY2ZEkzdUhHZWtOckhFbm8yVDd1TGZQcFdvcEF6QnFI?=
 =?utf-8?B?S0Z4dHJVYjAydkJRVmVaZ0dsSXJnT1B3T2tYM3RwN0xVeVJicHZtT05SL1Bp?=
 =?utf-8?B?ckJoT2NVbTROaXh4UFYxUDY1cldlQTlxTmU1L0U3blRaZG5jd2tvWHB1ZFRa?=
 =?utf-8?B?bTlJeWtTd3plKzR0b2o2MFZkN0RIWnhZWndWK29pSkx6S2p4blpjQ2l5SWFW?=
 =?utf-8?B?TUtpeFJQTUJKVzJhN2Z0aVV5c3RBc2ZnUHJQVlNwU24wTVdsd3JYUzQ2L2My?=
 =?utf-8?B?OHFyNmV1Ty91anJTaU5paVhqVVYvbmZoaytrbGtFTkt0SytwaGlWdS9nc05z?=
 =?utf-8?B?TlMxZDdPaGhvNWREOFUvNmwrbHRKQ2M4SFhYSitCT1JUZ1psUVFLaHB3aFhN?=
 =?utf-8?B?Y2krK2ovUjdHcHVrVHFoZ05aTUZPNklOK1BZa3l1RUJYdEZwRFowdnFtZGpv?=
 =?utf-8?B?S3lHN01CN0hCY1QvUWE3RXdUZXg4MXZlTVErbW9POW9wYk10MWtrdUhZbHkv?=
 =?utf-8?B?Q1ZQdEdrTXBNTHdwanMxbC9TZWZJS1gzaWoyVi9FU2EyVThqT01NREp3aHBP?=
 =?utf-8?B?ME1ZbUNNVDZwOS83NDNnbzJGcGlUdmNENXIrR3hVMzhpQ1ZYM1hPQVpTWGl3?=
 =?utf-8?B?Zzk4bHo1clI2U1BXVHR1QnVIT3FsOVU5bUFRZUlnWW1nNldpOWhnYkg2eFVC?=
 =?utf-8?B?dmg3TFM0OTJQd0dMTXVkdGFSS2RFSmJKMkk3NVYrem13UGthS28rSnNCSjdm?=
 =?utf-8?B?T01WRTVlUGtXSkdhaTdiQVl2bEtMeC9lQVV2VUMvWUJlaFlBSkZ1QzJxQ1ZK?=
 =?utf-8?B?d3dQQm84N3ZpOC9saVJTNXZ0akpvRVp5TjBtZE5HeFBWMG1OUDBqRU5GRG5C?=
 =?utf-8?B?SUJPN29GZk94SjVHbldMMzRPNGdBSmJGbUkyQkZVQ3FBdEFaam1meGVXL3Fh?=
 =?utf-8?B?cDUrcEdZNG84eUNQbVh0V3BsR0lrZ2k2c2dydGZzK2NHdmFabjFwaHFFQlBn?=
 =?utf-8?Q?STz/+1SzfDzv19st3SSqIrtII1s4aWJNv4hUnS9svojhR?=
X-MS-Exchange-AntiSpam-MessageData-1: hKFvKkx9gnjPPQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51cba90f-66b7-4d56-59b2-08de79d77e99
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 10:19:18.2830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dYk7mrC3niuPKKI69pl8UMDOlo+uA46czmgpgEQtdr2ao2osxdb9NuvdolSu/R3Z0Nz6/dibAqP1+iBbZb+wEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9579


On 26/02/2026 15:09, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The NVIDIA Tegra238 SoC is an upcoming new chip. Add a Kconfig symbol to
> allow fine-grained selection of support code for this chip.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>   drivers/soc/tegra/Kconfig | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/soc/tegra/Kconfig b/drivers/soc/tegra/Kconfig
> index c0fc54c3cd35..0a84bfd5c657 100644
> --- a/drivers/soc/tegra/Kconfig
> +++ b/drivers/soc/tegra/Kconfig
> @@ -125,6 +125,15 @@ config ARCH_TEGRA_234_SOC
>   	help
>   	  Enable support for the NVIDIA Tegra234 SoC.
>   
> +config ARCH_TEGRA_238_SOC
> +	bool "NVIDIA Tegra238 SoC"
> +	default ARCH_TEGRA
> +	depends on !CPU_BIG_ENDIAN
> +	select MAILBOX
> +	select SOC_TEGRA_PMC
> +	help
> +	  Enable support for the NVIDIA Tegra238 SoC.
> +
>   config ARCH_TEGRA_241_SOC
>   	bool "NVIDIA Tegra241 SoC"
>   	help

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks
Jon

-- 
nvpublic

