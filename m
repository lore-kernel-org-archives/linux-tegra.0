Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012011.outbound.protection.outlook.com [40.107.209.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45B1377EC2;
	Thu, 23 Jul 2026 05:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784783758; cv=fail; b=iiaR/8A38nlzNVDgy3PkEYpZY4160el1UUAZYqGeW8LDtTqM/qMNuLxRI+cNWAL7vr0sVSJHIT4x1+Yl+/m+XI8mTHB4TtXoyCXyi2wkfCOEG3aDC2iowFS5L+pwHPwcMup1A8H/DnPs3qRmWPO8CnjpvV2Jtb9ri4GdbhAt7IA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784783758; c=relaxed/simple;
	bh=KLy/xsoMP/6bOvr9WrdQjRyCDrVqBZJyMToaUOXX4jQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nHzIUOWtepelGSIBUmzwBYJpKs2mUzmsDoOP5Vk5rG1VihobUpzfyCtx9INCePM10zY8vwOOTOhArAme+APf8ISkbtolgx077lZI8d4fqC9mSpeSnTSfheyLMaTs9iW34P1UVaeCShV4qBmzz+edCHD7u038OrqW2h0IBprZQWY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LoNSMvHH; arc=fail smtp.client-ip=40.107.209.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LoNSMvHH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NYcSJWM/VUYwCdMaSU8GsYfalez//nPeCdFF34RdJVXMTDZWRufkiY4IYeQMdzfor1AjS3gikpKptFi/BKE2e5xkRIZdMAR0L7YxGjBAj2td51d1WTrSBVCdTLTz9QjE+HyOAEX8WWIR0mw9Mq0KmjZaANEkENERFvfwM0+mN7+yuCmCJi/dYEYWF7DiasXgRlQkut47z/lhWxdj/kfpv2PKHW+hHxulITpKsjgB1d2GK3vsxtWCoNi+4RlIgFtydCAhQJ0PImQn00Iyc658ptBAIsyYbwpK9b7sUjaFQzd07hPcURUcgFqoo6cGMPHOeHXRGKbnoPg1vBgeac5IOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u7buWsDW6nyN7z0D2b9CK+myWyqsxPciGUePHAv0fWQ=;
 b=xfMwvyiGQyoeQ5TjiRWy6MFoI14gPEb2I1OFcX38frFDG4wkcDOikrUOcpUZnbkIuX29z3QVBEo8y6nGzfxSuNFfoCq/oi9P0FagUNqVsayVDp5798OrgsfOGRSi4ufOPlSZ1HRrVqkgpgoiALHNwnyqTVERP7UBMJS0qH7hR7bx+PMFI+1C3NiuNv7uTCjhmwoYjZoobCzsVIaCb1+CLJHfYJN8s6gmlBrblpngQ1ofUxjs6R+kGEAsR5Id4acDsRWWpUhpG1ckxuTciAxoSu+8YAyGRNQR7las/1T2dTWt9J7DhScYPFTWwY3e9PhMw1F3pYfu+nvyD7qZhIzNGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u7buWsDW6nyN7z0D2b9CK+myWyqsxPciGUePHAv0fWQ=;
 b=LoNSMvHHR5F00t7VloFI0qakbsR50DWUm0b1Jg3703cC0tQuPyG4fq3kwJKVmxPl8Kr8yr6Su/xjqQ0JMpWhIgWxllRXz9nHjAG4+sqkO61hJENtiehUHT7bXSVy1na+Jo/bOtxKksD4kTzeMwHgT8I2eDE2y9A3rj2x4OrNyLe9cElpYbL+jBaynGRjSVuG8E0sBzGOoJEGDKZkfmAoi9jm9MPwq8XFa4X7eMRAWXToxR8YLuJHS2jhr/HaO93vau4VEa37dsBzZwV2VB3hSIraArG3gL9j5tm5f1sQKCN+OYQ7g2xS6T95YaGfEVVAbhJbXFVjtOf7SOvWJV8Zxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by PH7PR12MB8827.namprd12.prod.outlook.com (2603:10b6:510:26b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 05:15:53 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%6]) with mapi id 15.21.0223.017; Thu, 23 Jul 2026
 05:15:53 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@kernel.org, jonathanh@nvidia.com,
 Aniruddha Rao <anrao@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 Aniruddha Rao <anrao@nvidia.com>
Subject: Re: [PATCH v2 4/5] firmware: tegra: bpmp: Add MBWT BPMP helpers
Date: Thu, 23 Jul 2026 14:15:50 +0900
Message-ID: <aso9tq6bS9iLGL62qG0U8A@nvidia.com>
In-Reply-To: <20260722110544.193551-5-anrao@nvidia.com>
References:
 <20260722110544.193551-1-anrao@nvidia.com>
 <20260722110544.193551-5-anrao@nvidia.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: OS7PR01CA0299.jpnprd01.prod.outlook.com
 (2603:1096:604:25a::13) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|PH7PR12MB8827:EE_
X-MS-Office365-Filtering-Correlation-Id: 53d3de7e-e381-45ce-96b9-08dee87977e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|10070799003|6133799003|56012099006|11063799006|10067099003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	bprSs6YadkXijgtgfTWNRYFL+lHNUdajKyC+QzCLp9Ky053DTbaJoh05vqSjfaOY2pmbykbbNOl1sicNPpV+Znr/iwi/7YTo8zDiYpCcngcxUKN+kMf6xycqctYED4nSGbmqaZNjCi4Juva/P2LWTWn9DVRdPXCvdN5FjGI2eDZHFCe+4gio8zKhYjZOzhzhwzoKU0Ejl8suUYaLURcCEbb4cAhHdsumhOBcawMpheNGF0VZeaHX/D5JpJ10pAtYOVjVC5St8Lqry6r1DR6gFtq1UEohqankKLQIZLquE4xloM0WtiCdRBOf90av00StFDaGNUuu7oLDMSkhTUHm8Zl96+yWAX21P2PznuvLA5elFkfjTvh7aCNOZQ6NQKblwmkccMJHXn1aywVhNLjNNpPAma47m+NKwn2NM1bOD8IkOV4+nlW/zjSrM3DwQNWwr0J86SZQh9EerlMWObaxQ+rAbkaKO93CuEKzNiAS0eiNTNC+yPMYzJrj04NZgbA1dtYM+IN/Mwcq0YCy7KZNPGjqb7wVsGORL6EJ37FXabxC2IU2AFvaMUbh/Kz3XgJK3vPcFT8eroAMTJXQoU9ZGIY1Yux3qXDSr8M7NZoAhYA5HJaX/tb5pzy/tRO7GPTykhJ4+ZbUWKEKOiDmrMzBfF4fIYsCd5aMs0W2PHFvNu4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10070799003)(6133799003)(56012099006)(11063799006)(10067099003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGs3c2h4amE0RU5QcHhSbWp1WEVxSUJWYnRncUplRlZFT3k0YUhxOWRvcnBR?=
 =?utf-8?B?T0YyRTRyUkxqRDR0cnRrVXk5Z05ueGVZeDVLZlF3cmVWeDdwSnJPUTZIN21o?=
 =?utf-8?B?a3dEalVzUXZnOEhQcjI5ME0vNHd4QmZ1NUV2aFVxZHNQTXNsWkcwNmhtRitr?=
 =?utf-8?B?aTNhdUxzVmYwKzV4NithRDM5emEyeXJXWFRISmc3dDdpRXRFSXBnTU94UGlL?=
 =?utf-8?B?NStzZ3FuNWxFL2lnMG0xaUxic3h6czhvOGk4SmxWQjk1UmUxRmtYRWE2YmJB?=
 =?utf-8?B?b2lYY096Mzgzd1VqQzd3ZTFJUjNkQ0ROYmlORG0xdDJGTjMrNGdRS2IzQm5X?=
 =?utf-8?B?Z24wYmV6MHNHcVAyMGRrTktiL1hhSTMvenVzU3dRcUc2QkpYT2sxcU8rc2dS?=
 =?utf-8?B?aVlDMHNjZnYxTkhPM0QxSEIxT0Vieit0L3Z0ZTJDTU1WQzVkM3FzNVRObG5R?=
 =?utf-8?B?eS81NWQyWVZSOEVRaloxYmQ2cjNCZmkrNytUd3JKSUVZNGZGWHFqQmdyMlh5?=
 =?utf-8?B?UEpmcGpBVSs3UWo0VkZoeENpZlpyNllyTXZPd0VoZ1NUZkp5L2FITWIxT2d0?=
 =?utf-8?B?QmxMRmFqd0Vqb2xsV2RaYkp6dG5OOENLclMxZU1PVGtsWkpjaTBBRUFELzE2?=
 =?utf-8?B?SVRTNVMyM2dUR2V3NmhDVitZQm5oVEtUMWdmYi9yK0xXY2REb29NOS94WWR0?=
 =?utf-8?B?bWRuc1pMbnpVbURxT00ybFNBUGVLeXdzbUVYWC9vQTVhdWl1aXlhbmZhVUpk?=
 =?utf-8?B?S2poR2dkLy9lN3lMSzBqVGx1YXp2WWdBQTN0aXVBNUNMU241cWZ1NUo3TTRI?=
 =?utf-8?B?cUV0WmVreThxMDFrQ1U1cGZxck1qeEgxT2k2RVBSeDN6ZVRpaXpYam9RWW5H?=
 =?utf-8?B?cThVNHl3UGkxWjE0QlRGaDRvVFRSYU1nVkozMnc3V1JvL0hiUkN0aitUQTdO?=
 =?utf-8?B?cVB6ODZsZDZrK2kvbnFsdzQyZ0JPb2UrK3RLMjJzYzZTd1FWcGt3N1ZRYVNJ?=
 =?utf-8?B?L0UwZWgrVXY5QXlEdzVKbXdNMW1Zd0RGUlpKWDRYdGtuR3F1UzdVS2RLUTI0?=
 =?utf-8?B?RThhT3l6UmRYOWQxQTdKdUErbmZscVRCcWVucW9JRFpNQmpRaURmWHZvVU5R?=
 =?utf-8?B?Vyt1TUl0dHFiL3lOUC9XMjh6UGg1Q1ZyOGkycHFGOFNKWHFzT0ZFRHNqdDkr?=
 =?utf-8?B?OVZuWHJSRTYrSXgxYzVZY2UzRHM5WXMxWXBIdHdJaWZ5MjJBZTY2am1CL3hn?=
 =?utf-8?B?NDgxaXU1c01ZRFQxZFI1Q2YxS2JhWVRrUzJOMTNHYnRMZndkRURNSCtCeElT?=
 =?utf-8?B?QlVCMUQzZGxick90R1I4d2RYdEU0Q3pDdDFVRGRCeDNram1SanZWUzlweWc4?=
 =?utf-8?B?RTh1bVFiT2lVbW9MVStoZlV3YzA3NU12YjQ4TXBEaXZxQ2FyZ2RUWXMwSUZU?=
 =?utf-8?B?dGlvdVdreGFSck1YT0ZMZ0xmTU5xL1NHRjlTNnpBcUtZRjNOUG8wMnZydGJr?=
 =?utf-8?B?VStQUm9TVCs5bVJaUEp0cEhSOEw1OHhpN3djM2ovd1ZIaWN5aElsWHdoNTZP?=
 =?utf-8?B?SDkyQmtkTXRhSHJjN3JxaFVEU291VEx6N2hKSGg2Vi84K05Ub1VoNVdGSmV3?=
 =?utf-8?B?bStHNzVZb0hVR3QyK0docGFkMGsvcVpQZGJRVVlYcXdmZ2pKY1dDRDBvL0J0?=
 =?utf-8?B?N1lDOURqSFhsTmlOZklicEw5eS9mYUYyWktyVjU0NHppREdBN3hkblBMMXpD?=
 =?utf-8?B?NVZEZktUYm9jRkllTVl5OTFtT2NncGRLYmFvWUgyOURiRkVXL2FiYjJ4d0tE?=
 =?utf-8?B?aktzUGJ0V2taYmI4LzRCaU9rY0dQemE2Q2pxamc0MFR2MiszOEpDQThLdVRI?=
 =?utf-8?B?ZmxOczFLeW9ud3JBZmI4S3Z5SGV5czBtcjZwanZIejVVOHpHR05yRk16dmZq?=
 =?utf-8?B?RTRPOGhFazNHTExnNnZWdXJSQVZ2eGRUUXNzNDJmWnpsOCtkTTVmcTJoYllq?=
 =?utf-8?B?NzJuMyt0UUhjK1FpNGlZbkMvV212czBMSHU5L0JmeVNWS2xZT2xWdHRVbVVT?=
 =?utf-8?B?WHBUQitES2JuNThhZ1dUL0RBalh0S0xKSk0xTmtpeGtvMTB6bjBOekJTUFVY?=
 =?utf-8?B?SDhIMHliQU93cVV4RWlTbnNFSkhzbWtuKzZPdk1WOVZJcUhPMVE3djVhV0ho?=
 =?utf-8?B?ZFNuaGRDS2RSaGkvRU56KzZta0tOVzlBemo5UGVQYnp5Z2YyRzFGakJOYlE4?=
 =?utf-8?B?VWFNZXFYcHdadDMydEJOMjdQU3cyeitpZTJkd0hSengxdjk3ZHF6Yzd1aFds?=
 =?utf-8?B?QnY2eHNQemxpNjV4aE9uV2tBd1l2QlF5bFowNjVDcXNveWRwQ1pBTk5ZdW5y?=
 =?utf-8?Q?DaXJ8KDl0MOTS4pvGaubl0OliH/23cjUBCu6WNvuSTllc?=
X-MS-Exchange-AntiSpam-MessageData-1: QMsBXDG5gMJuZQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53d3de7e-e381-45ce-96b9-08dee87977e2
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 05:15:53.5526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OOt8IHvH05VvXcswKYzd3PeU79uqOaFhyh3rJ68RABKG9uzjS4/b5jP82ytECN2aILetWR58fLBGHhYgKh9kmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8827

On Wednesday, July 22, 2026 8:05=E2=80=AFPM Aniruddha Rao wrote:
> Add helper functions that send MBWT requests to BPMP firmware.
>=20
> The helpers implement the GET_BW and SET_BW operations.
>=20
> They also provide a QUERY_ABI-based probe for command availability.
>=20
> Signed-off-by: Aniruddha Rao <anrao@nvidia.com>
> ---
> Changes since v1:
> - Use generic tegra_bpmp_mbwt_*() helper names.
> - Fold the helpers into bpmp.c instead of adding a separate source file.
> - Drop SoC-specific Kconfig dependencies from the helper patch.
> - Return BPMP firmware errors directly.
>=20
>  drivers/firmware/tegra/bpmp-private.h |  7 ++
>  drivers/firmware/tegra/bpmp.c         | 98 +++++++++++++++++++++++++++
>  2 files changed, 105 insertions(+)
>=20
> diff --git a/drivers/firmware/tegra/bpmp-private.h b/drivers/firmware/teg=
ra/bpmp-private.h
> index 07c3d46abb87..b3770e71020e 100644
> --- a/drivers/firmware/tegra/bpmp-private.h
> +++ b/drivers/firmware/tegra/bpmp-private.h
> @@ -26,4 +26,11 @@ struct tegra_bpmp_ops {
>  extern const struct tegra_bpmp_ops tegra186_bpmp_ops;
>  extern const struct tegra_bpmp_ops tegra210_bpmp_ops;
> =20
> +bool tegra_bpmp_mbwt_cmd_is_supported(struct tegra_bpmp *bpmp,
> +				      unsigned int cmd_code);
> +int tegra_bpmp_mbwt_get(struct tegra_bpmp *bpmp, unsigned int instance,
> +			unsigned int vc_type, unsigned int *bandwidth);
> +int tegra_bpmp_mbwt_set(struct tegra_bpmp *bpmp, unsigned int instance,
> +			unsigned int vc_type, unsigned int bandwidth);
> +
>  #endif
> diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.=
c
> index 2dcb74a45b59..2cf8490b8b2e 100644
> --- a/drivers/firmware/tegra/bpmp.c
> +++ b/drivers/firmware/tegra/bpmp.c
> @@ -675,6 +675,104 @@ bool tegra_bpmp_mrq_is_supported(struct tegra_bpmp =
*bpmp, unsigned int mrq)
>  }
>  EXPORT_SYMBOL_GPL(tegra_bpmp_mrq_is_supported);
> =20
> +bool tegra_bpmp_mbwt_cmd_is_supported(struct tegra_bpmp *bpmp,
> +				      unsigned int cmd_code)
> +{
> +	struct mrq_sochub_mbwt_request request =3D {
> +		.cmd =3D CMD_SOCHUB_MBWT_QUERY_ABI,
> +		.query_abi.cmd_code =3D cmd_code,
> +	};
> +	struct tegra_bpmp_message msg =3D {
> +		.mrq =3D MRQ_SOCHUB_MBWT,
> +		.tx =3D {
> +			.data =3D &request,
> +			.size =3D sizeof(request),
> +		},
> +	};
> +	int err;
> +
> +	err =3D tegra_bpmp_transfer(bpmp, &msg);
> +	if (err || msg.rx.ret)
> +		return false;
> +
> +	return true;
> +}
> +
> +int tegra_bpmp_mbwt_get(struct tegra_bpmp *bpmp, unsigned int instance,
> +			unsigned int vc_type, unsigned int *bandwidth)
> +{
> +	struct mrq_sochub_mbwt_request request =3D {
> +		.cmd =3D CMD_SOCHUB_MBWT_GET_BW,
> +		.get_bw =3D {
> +			.instance =3D instance,
> +			.vc_type =3D vc_type,
> +		},
> +	};
> +	struct mrq_sochub_mbwt_response response =3D {};
> +	struct tegra_bpmp_message msg =3D {
> +		.mrq =3D MRQ_SOCHUB_MBWT,
> +		.tx =3D {
> +			.data =3D &request,
> +			.size =3D sizeof(request),
> +		},
> +		.rx =3D {
> +			.data =3D &response,
> +			.size =3D sizeof(response),
> +		},
> +	};
> +	int err;
> +
> +	if (!bandwidth)
> +		return -EINVAL;
> +
> +	err =3D tegra_bpmp_transfer(bpmp, &msg);
> +	if (err) {
> +		dev_err(bpmp->dev, "MBWT get bandwidth transfer failed: %d\n",
> +			err);
> +		return err;
> +	}
> +
> +	if (msg.rx.ret)
> +		return msg.rx.ret;

BPMP errnos are not identical to Linux errnos. We should not mix the=20
two. Same for below. Return a static error code here -- if handling=20
specific BPMP error codes is really necessary, they should be returned=20
in a separate out-pointer.

> +
> +	*bandwidth =3D response.get_bw.bw;
> +
> +	return 0;
> +}
> +
> +int tegra_bpmp_mbwt_set(struct tegra_bpmp *bpmp, unsigned int instance,
> +			unsigned int vc_type, unsigned int bandwidth)
> +{
> +	struct mrq_sochub_mbwt_request request =3D {
> +		.cmd =3D CMD_SOCHUB_MBWT_SET_BW,
> +		.set_bw =3D {
> +			.instance =3D instance,
> +			.vc_type =3D vc_type,
> +			.bw =3D bandwidth,
> +		},
> +	};
> +	struct tegra_bpmp_message msg =3D {
> +		.mrq =3D MRQ_SOCHUB_MBWT,
> +		.tx =3D {
> +			.data =3D &request,
> +			.size =3D sizeof(request),
> +		},
> +	};
> +	int err;
> +
> +	err =3D tegra_bpmp_transfer(bpmp, &msg);
> +	if (err) {
> +		dev_err(bpmp->dev, "MBWT set bandwidth transfer failed: %d\n",
> +			err);
> +		return err;
> +	}
> +
> +	if (msg.rx.ret)
> +		return msg.rx.ret;
> +
> +	return 0;
> +}
> +
>  static void tegra_bpmp_mrq_handle_ping(unsigned int mrq,
>  				       struct tegra_bpmp_channel *channel,
>  				       void *data)
> --=20
> 2.43.0
>=20

Since these are only used by the sysfs code, I would squash this patch=20
into the sysfs patch and move these functions into the sysfs file.



