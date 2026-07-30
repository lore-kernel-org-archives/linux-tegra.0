Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013061.outbound.protection.outlook.com [40.93.201.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D213BA22C;
	Thu, 30 Jul 2026 06:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785394096; cv=fail; b=AkbRgIsSogj8uIU4KczmfscZdRd1nkd7gNW6RUECBTwR7rzBlYs8DBbLZh+dP2oOHBCRb0UG9tWpFvm/QLVB9J/UT3lK1tmbkMQwowT4v63G2YpVwNym1Rv4eAAW3N3CzWJyWa/NFb3ZaVOxEA0PBq0JiTHeFcKjtVMlDhNUF9w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785394096; c=relaxed/simple;
	bh=w/vWffvl1AS/6N+dxqRxx8Dy72Nzo2KS/BCUEyBnig4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PgKedxY9weV1H1zEs7cMCRnM7ohx0hDPZ1R0TZ32ozQ9SMosZ2afP7Pji1mzh6MEOVRuNL8DDnYRA8zW+un9vspiicbu3zMugEnIgx9jZRO0xQX8b/0FFMO+tQPllRwfDtoiWMJC8n1QaptFxnwrk94wdEC0lS72jhAqpGCv+CA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GTCo9jOa; arc=fail smtp.client-ip=40.93.201.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GTCo9jOa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YHN5aiH4MnJUM4vsuTe9G+oXx38KfX0x1QEQ9Wo4endpZyYipOez7mtU0QJGPFJsXilyHBn8Ql0YLr7yVj2BO3FjzKOq3EoYQK2QWhvJHMKUE3yM3pgV/G8PY/BDy923+KHpdPUinZLMBHsBkIQ9pzH4rTWFY094sLjJ+NTBycfl/sStB4yvF6OtKhgAox012ay+UigBuo2So5AuArngxlCpuIKGa+6LwDP3BjDlmbWoDzjns8kjbgQg7l4tTgBNenrJl6PmIKX1fNgrp7N/RIvXKD7FCXnGT4mhlxuYp93K7VxCxPekSGlOezDWP7ML50ub/cFFAgiacd9hv9KhxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g2bulfbI1F5JVSfEJZCrQnTWoMaG4TZlpQmPiZr3jbQ=;
 b=n6HhVR7OfWtu87zu8oY7Bon8aN/RN88mBkmEzutqb1qkywEA8um1biayk3zV7ZttauuGVM5Hldf6IouAAzhnJZlcVGnu9nTOj2o5PYDFE60vUyiAy7Tp3MQqk8haGqXFq9PWHQ/blzi8Y+xZnJh0DsVMPYdbYvtqFbXgh7nJfG48yywneN6Jwn6uijU/FN9nHyTGMWfXDjAZ7GEpyP5yw4rc558pxVvDk5HltU4xzJC0AFtdYbPotxPEdciofN9V+GWsR3MeHf58guqn9ORSTFEqNreCJN6Q8h+emgcAKkOYrFvFjUFPIzoZY3ywvXIGHP78KHvUBprgj8oYPNeM9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g2bulfbI1F5JVSfEJZCrQnTWoMaG4TZlpQmPiZr3jbQ=;
 b=GTCo9jOatlXMs4bR/IiV6vB9NpM/XDO1k7OdwI6cI2A6lnFetr6f4AeVLcoTL/H5laHLGwS538dwVgrNyqoHqyirJ0SQ9q+WRFuPbSYq+M94vpZDCsWCO9ffwz/6/wz/DGpqF/qNqnT7141ua+9N25NP3t/Qf2wYUruMZmSiAV6h/95aQLRHQVkLjPQNb2Hsy4ECbwuHpS8rs+er/83k420HEHdvtgcRl61fGIcajSeFPYEeLt470MPHHGOo+1tiQJNStSG6hgw6t2UxOJHTzaUWpgEg/Z53iMGKr7c/ZMgT8F6cu/Hb604wK/RT4sQu7OW/0wcPcHqwOGnPphxLew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by SA3PR12MB8810.namprd12.prod.outlook.com (2603:10b6:806:31f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Thu, 30 Jul
 2026 06:48:05 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%6]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 06:48:05 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v2 01/10] ARM: tegra: tf701t: Configure CPU DFLL clock node
Date: Thu, 30 Jul 2026 15:48:02 +0900
Message-ID: <nt1GgPbtSq2-xvilIMu-lg@nvidia.com>
In-Reply-To: <20260721101059.451699-2-clamor95@gmail.com>
References:
 <20260721101059.451699-1-clamor95@gmail.com>
 <20260721101059.451699-2-clamor95@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0173.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::16) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|SA3PR12MB8810:EE_
X-MS-Office365-Filtering-Correlation-Id: aa0489f1-876f-4c28-a286-08deee068203
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|10070799003|1800799024|376014|56012099006|10067099003|18002099003|22082099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	t7rgqzInDpmTi5+feFobeE4ZPZxxI9luCQZHqdxm3ssoTArMuFwu6VUaKPSdGGOnIC4kYOaQJlF8FGdX60VnITl0q0WlwOq+J9vVN7A82Mdd5AbTLd4ImXfkykkjpxJlJWG3ME1U5tzs+ZSQKBxN6lMw19ggx+HaaZm4vUrD6kzoOeO6kCE8/n9JNEEzkK2G7t0L1evcK9XEVyNX2TNstaIIsi4+/gmq1u7zz0w03mf1F+kLowJWykd4Zkp9NIFxeol9NRA8C0AJtNkvzSHI/4/WXFm7cLdiesWr5m1bQk+BNBbnj70HzZjIpEqnxnSTZ5LggR8j0ciNuwgKTa69b4xQmGBKSxw4Q75jd5fafD+rrKq2cgr3vq3j6UNwKh7kvZKSAsdOvoNk6HFKBshHroFvlaIca1YDf/asuR39lCfUYdns9W2I5dK5J9Xgfgnn7cHFyT7bUviVENZOtIxMROKR9yjxgzv3g61Z5JSx7TVPffT8uPKQy/pq89PvPrj1dQ6X6ZDGvzrP3w1xuP2fYX7z+pSu4gu2llCoy2q9qTQdtxyEB9kArwDoTliQzP8grFK26V8JkziQr9PzP0oXwsziFh4tCbvpfi/5LmQM8la9mb4uAdEvfdlTfuHXQOklrZi+PA1OdUKYkWZYuhIS/dddEu0lVF4iW3A8T5WaiSI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(10070799003)(1800799024)(376014)(56012099006)(10067099003)(18002099003)(22082099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUlOZnIxckVacUlRNUtZY3IvMXJ3djVVVzRackJkK1JEUmkydkxOdmxzODRw?=
 =?utf-8?B?TUxvZ0FSUmV3OFNuYW83anF4NU9NSm9MTXhNQm9PaEJWbmtoekRIRFg4NmNN?=
 =?utf-8?B?K243UVZhT3Qrd1BDZ2RYUUlFRlJDbWxIMGV4TDJQdkdZeEhnTDRZallvS1lv?=
 =?utf-8?B?ZHhvMVZ5WmxKWHJSL0s2eDRwT0MvT2U0NXg2Y0JkTEs4U3M0cXZITDlpbERW?=
 =?utf-8?B?VDhRMUFPd0UraTZXTWFJWjNHV3ZBL1RsTFZ2Qm56VDgwZ05JMUJLSHNIYVg5?=
 =?utf-8?B?d0NIcTljejE4S3FVQWNlQzVBcit6NGxiOXg0NFRGc3RJczFjaUp3c0xOYmhr?=
 =?utf-8?B?R211NlFvM1FSRU4zUmszSkFqYzdrTjNnUUJlQVhOWWRHOVpYQzU4VitvaThB?=
 =?utf-8?B?cUhIMEd4ektMMmVVV0oxeE1YQlhoT1pjV3lrbm5SUCtWamxKdGpuaXN6ZXFE?=
 =?utf-8?B?SHZ5OUY1bTFJUW9DUEdlbHJLTWxwL3NlUTNCMjRIcEFuVEowRjcwSzRjUmlt?=
 =?utf-8?B?eVMrVVBNc1FOS2JoVDhPRkROU2FiMkw4LzlnZy95WmQ1Rk9ZNDdsM0ZXUjM3?=
 =?utf-8?B?akJNQ0UycTJIamZYY0xxbjNiZ1F4NGx3ZTdMRlNsaUdaS2pTUFZRb2hkdHdw?=
 =?utf-8?B?TWYwcGk4NEd5cndSeVNraWZZYmRwcHhRNEJLa2p2dng1MUszcDQydzlpcjU5?=
 =?utf-8?B?RHRBWm9aYjdnL1kyQ0ZFVGNoQ0J5YklLeUNKRG9RSDdyM0gxNHJYNk03ZlVz?=
 =?utf-8?B?dUxvMHN5dUticnpBc2ZoRWZuam94Nk9JZjNRVXlhc29rVTBHNTdrWHNUNk92?=
 =?utf-8?B?dFFiSDkvSmhxREZpelIvVVFDUG0yUnFNOXlzY0NYdXZuWENsOUlYU0FQVU1O?=
 =?utf-8?B?M1hPMTRPTGRTL3BYRExRMlZXMkdpMXRubnpDUmFEKzA1REUrZGNRc0pMS0xk?=
 =?utf-8?B?T1hnS2RreFdzcmVRaDkrV09BVjNhNXFJeGNqTkROQ0VCVEEvUEE3WHZ1SnA3?=
 =?utf-8?B?b0FjZTFESWdaLzQwYVBUcTA2L2ZCbWVDMkkzbWtjQ2RWUnRLeENzT3V2SGtT?=
 =?utf-8?B?QjNTVm1wTDduSmo1anRvUjVhYnNtbnVPbHQvSXZMSHliVWV2NzVEY3hzS083?=
 =?utf-8?B?Q0lTb1JuWWxIZTY5NTA3ZUpWajI2STI5TU5HNjNKY3B3SVQyZmEyRWd1WlB1?=
 =?utf-8?B?U2tQNWl4RUZPYzBQclZzT3YvdXFLRmpob0pzNlgxdldCTUorMlByd1o1ZFRy?=
 =?utf-8?B?VEU5dVVWT21xa29XNU0zN2V0YmJLc1RiNVpoaG1YZVh4cDJZeFAzTm9sUDlF?=
 =?utf-8?B?MFdMVGtRV3c3MkMzZzVXeUVpZVVnVmZlZXZrR0tFOGNURmdwVWYxazN2Ymhr?=
 =?utf-8?B?alJhNG5LRlVzSTZTaHVOVHA1YnVEcWV5QmMxR2w4VUQxbDVBR3kvR0VFVUI5?=
 =?utf-8?B?MGhPS3luQ1hsSGsyaHVxbDdlODRsR3o5VWNFRVMyK0o5SGNKR3JQdHQ1cFRz?=
 =?utf-8?B?dElhRURkQlFPcUZlSStDTTRIczI4WU9UVlI0TmpqV0VVcUhvR29HL2RMazVx?=
 =?utf-8?B?YUIvL0hrd0puOUNrUEhHS3VjYXlxYWpqRDlwN0VOT09hMmJqV3hKMjlwVmxj?=
 =?utf-8?B?UVRzY09kZXFxaFFBdi83ejYzZERPNXo5QjJ0ZWRLYmZtWkh2dmtiT1E2TTZv?=
 =?utf-8?B?QWJzQy9wMGo1ang1N1lOdHNubzJ3dXlxQmFYcXFJTXlsemJybktlcTZXU0hh?=
 =?utf-8?B?b0k2Zmo1ZlVDSkNBN3VBYmZCejBEYkRNejl5dS96eW11MWZVeFdMUVNYZVZ3?=
 =?utf-8?B?Q2d1WmowMXBFejhNMVMwRG8vdzRGK0RkN015WnNWci90RE1EbUUzOXVJNFNk?=
 =?utf-8?B?RXl4OXFIdzdhdGJFVFVRZlRRRFdyNUxyWG1KLzkvU2dZNXNVZGY1YmdMb0o3?=
 =?utf-8?B?NW1SdUFPTWl3OHc2SS9Fd2FKWm9kS2RtcVRzYjhHbXZHMytGTy9aSXVoMldF?=
 =?utf-8?B?KzZXMU1HalpPRFhETFZLZlBON09jN2tiRUFaTE1ydDFxZWNHRWFjdkF0VWRR?=
 =?utf-8?B?TElmUDhvQStFTDUybC8rZWN2eE9jajZzcklXSi82K0ZnVDV3UERxdEtmOFRq?=
 =?utf-8?B?YVpkWFQ4MFk5MWZTY25iK3kxQVpzS1k3amxPT2Q2anFHc01vZFBTRzBHNklk?=
 =?utf-8?B?MUlDT1ZBZ1grQXBPWXRhOGliNFVmZTlLcFJEd2VRWUthcjBkbStweDF1RmQr?=
 =?utf-8?B?RVFSTXhwS3pNOVlYSmFRUGlpY0NsQmpkV1lUTEQxcHMxN2J0dUVwUGJzMDls?=
 =?utf-8?B?SWkwMXYxdjkzbnJSaDMyTWJyRWkzTXFzeVY3dU1PMDRjZUw4azdoR2hrMXdk?=
 =?utf-8?Q?8SQHH8hTbQ8lh/e1Y43SAs2+sj5RtNkIWySrUqHeg2ePD?=
X-MS-Exchange-AntiSpam-MessageData-1: y3pZ1zv4w79bgw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa0489f1-876f-4c28-a286-08deee068203
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 06:48:05.3282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5YcbnevyMTDP1t0fC0Z5XexLG+wqRxu8wQe4wDm+i6vHko2eBabVG1gAe8pvTxjw7qK5evN1KZKQOlouHWd9KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8810

On Tuesday, July 21, 2026 7:10=E2=80=AFPM Svyatoslav Ryhel wrote:
> Enable DFLL for ASUS TF701T since it is now supported by Tegra114.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm=
/boot/dts/nvidia/tegra114-asus-tf701t.dts
> index f02e2cf65fe82..5358cdb6efc10 100644
> --- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
> +++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
> @@ -1621,6 +1621,14 @@ i2s@70080600 {
>  		};
>  	};
> =20
> +	/* CPU DFLL clock */
> +	clock@70110000 {
> +		status =3D "okay";
> +		nvidia,sample-rate =3D <11500>;
> +		nvidia,i2c-fs-rate =3D <400000>;
> +		vdd-cpu-supply =3D <&vdd_cpu>;
> +	};
> +
>  	brcm_wifi_pwrseq: pwrseq-wifi {
>  		compatible =3D "mmc-pwrseq-simple";
> =20
> --=20
> 2.53.0
>=20
>=20

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>



