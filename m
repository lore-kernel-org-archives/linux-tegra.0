Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012002.outbound.protection.outlook.com [52.101.43.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E250D3E317B;
	Fri, 29 May 2026 15:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780068664; cv=fail; b=aplbBQq829ga/+U77xh1CgxgsRQGwDK+xinvsgejyII2W/eoP3FyMjtHcV/IA3WHvQPd56ZpCUWJ+pjtEYln2mIdo3+eAN8l6eHg9yL8kW+qvflADuAmmfAxvh6OPoShhpRZdgbn1Pzuh3q925NC5BiTtSwPET8wmqHkLHnD1K8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780068664; c=relaxed/simple;
	bh=n+lLhMXCdPETfUucWBjrNJgvDUeWFJPQh9F251Uy8Ww=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KZif8oSuaAGYSowb5GtZJ545wrxqodwuOhsWT41Ey076Ii2hiChF/SUjryHrA/e/5C4yxJifLPbZquwjgNVbNST4AXlB16x+b2CfYJlpg3DzNEMWW5sEp8EGorCfT7TLHXKyLfUafV28hvWXQWAWjSIhYkItbEP+ZhIb8JJhLcw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cNNlxPMM; arc=fail smtp.client-ip=52.101.43.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cNNlxPMM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JCP6rUhfnCmEAS+lAHsNf6xc6p5JpszM9Jb0TvGiGwi6qpELRtBMc+kh5yz5DJz3OE1G5oBjKDfZ1RugRAyJv2jC1uvGvFdng137CwiLG7ZU9TtWqbf5xn+Hk/5754LwBXAcNFQWODVFAxG6sUm876zNH2qbAmbRoHSDXfMBw1csik4FLgiqoWxBmsQU6I6O/QtaXCtG/NdCE44CSyLL02gkTF8zfR/Ck12a9kYT+adBsENx4TZi8HO7fyt6Mcn+ub/Cv+nBST6GzsxnWpq/1v+eVFbvajIy1cn92o1q9nk0gpsLw7el+G1tTozXNQnEPg+zMIrZw5HUTUebgK0JJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fqetpnWjdlOkH4fl/GxIjltWCPbqMaBpTr+P8J1pThw=;
 b=EtB99XnCNh6+wGJwlAC9XpnB0fF+2tqX24unpHXE9b1vllWbP8rSwfMLyIag9Hva0r4zO1yogbpphjPexoSjp67/lVcQusLjCXNo9gvMh/6ikQ+Mv3X5Oqgay7z4YVXhHXBddBnIwiJVoCWrOf0iPZo2TPEJFHigDsgDiOdOl2sqobG4H/SZMbrojjRmR3PnKFP5MIYTB7r5OnBO6KTzLp4sPfgj/K0S2S9NIklIJMhGjgcQXH8x9bUiB8HTmQ7MNfF4uFNgPLCLvfWP4EgMUGXANxs/6IkXxahNvJ7O1CuqJTvjILEdGW0R5Bc2xP0YtK/SJsmFzlrXtDrCiHWjRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fqetpnWjdlOkH4fl/GxIjltWCPbqMaBpTr+P8J1pThw=;
 b=cNNlxPMMpaFKZkasld/lrRBDGIN19ZgCq8c7faXdWYR/vG5i/I8UMYoytHD2mDQ30GXsInu0XM8MCvu/v0A8z+5HNNGCUZauntQuG5DSXyLzAB8hbLJ+TsUU84c9DeqfJ9hrSkSAGJD8xpNtJCRNEBUmb1wYCtpP05H+oCae+ueqOSxOgmHi4Iqw9v0L/OWVeGyDZ9bw3wT2HOGi2vbtGpBIjQQdAdTeQXuYslerfSQgbbLMwJagt8wc8MYp6v1itVjNTZgBoHdSxbwQvl7C9Z5xgj0ZzK1UbS4oTGt1OQBAetX5PEN3nUGY5kS4qebxgQI/K1Ju4mlE/pD1uiqYRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by MN0PR12MB6197.namprd12.prod.outlook.com (2603:10b6:208:3c6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Fri, 29 May
 2026 15:30:59 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%6]) with mapi id 15.21.0071.011; Fri, 29 May 2026
 15:30:59 +0000
Message-ID: <f66ac57c-230e-440a-a3c6-10fa43cb1075@nvidia.com>
Date: Fri, 29 May 2026 16:30:54 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: tegra: Support unique names for multi-socket
 platforms
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
 Timo Alho <talho@nvidia.com>
References: <20260522163034.80330-1-jonathanh@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260522163034.80330-1-jonathanh@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV2PEPF000239E4.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::179) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|MN0PR12MB6197:EE_
X-MS-Office365-Filtering-Correlation-Id: f2503a38-8f3d-4896-df2c-08debd9748c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|376014|366016|18002099003|11063799006|22082099003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	rVymot/MO+c7PxarDZRzalrcdJg/L742+NqchUwWQ2rzX9/WkoDqxT27ZyRpIzzG1y0HrEGmq44uVNZdJCua8fqj5CxbxPVO+GdJ9C9hVQBo+hex4i89VhcQjZ2meLtl/gXZHUwOeYina2BGFy+bxgX1EaEexanTkc9GK7buCNZSXZfDwyaPRg1dR7SB5se0K1hLgMmu1y0T4N66XFXigyLLP9uJr2PlR+kjPa/5wZpX7guxLIYe2Mn+PskH8OACqS/MiN12IC/+9R4sjbO0Rj4ihpF+sdzcqEt3+b3DzjpfYzwOFJ8ZBctSCcjLBtPYg4fjgnHlcKeROE2PGbcmNjbwcmsI3JAb2tgS9u6YbesEuubienTM5FFA/3YU7s70Wa1qI27dMJrw9+SpNlHpjzZikR5ZUMNTEvkjRt4sHOFsTQEsy8/7m7fubTdTLWccJFwToLYNNiDy4pHCoPxi8THWJ3tCfgLou2NvC6vNtHJFB9vhR4yB4iazE8BQrN9y4znLCRTEykG04JcrrtxU/2QNZZpiVNDfHtKl6Z6kp3MY+AWQ3asv7dVB7UJMoTQ4eau6S2WOqvYeFilwsgHL/vfC1rEstV17Y2Lk0aIEcXXmjMNCCV9tyi1Zzo6mMlDlurfEDgUMNzJ/6LTN3SQu5u3M8bQYy0ZGx5Mj/IbuP9e2GxskWKVi4bI0XVDGL8cjD2x1iPr/LvQ8v4Mxgbx/SA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(366016)(18002099003)(11063799006)(22082099003)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3UyT2R2QzVqZ3BjV2VZSjdBY0cvcnR6MzJPQk5SekY3WGhHejlOR2lPY3J2?=
 =?utf-8?B?OXNsZGNjOUlqa2JMOEFKMDIrMExiRkdUTnA5RFEwNVMyaUFBZDlCODZ5bTQr?=
 =?utf-8?B?alNkZG9jM3B2ZFhpRWY3TkNKZFVyOHNNNngxeC9yZW5Na3EvV3FXcGVUY0Uv?=
 =?utf-8?B?bC9wTDVKRkh3WGIrZEk4d0QvM3A1eldVUTFFeUUxcThLeFF5dUJYbTdUUUZR?=
 =?utf-8?B?SEZUU3FJb0wvM3huTlFCZURFWkJwWVRxZjUrK0MzcEFjNkFIb0YwVGhrTmw3?=
 =?utf-8?B?eTlFc1ZpeEJqTzF6NHRnOUpyMkVWSWw1Y3JzWWlydGdKeGxtYU1ZV0FUZGRG?=
 =?utf-8?B?elZZZXIxdGVKLzhFSDNlajBzSWxjbElVZ2J1VHQ1R2xvS0wzZWFUVVJEOTVK?=
 =?utf-8?B?MGVILzZoNEh5VDZIWjBVWmVOaWlsaGZ5a1FXYThlbTRONi9IS0t6bnlPWWk2?=
 =?utf-8?B?b2lIa3AwSWIvRG1nL1F4SkpHaGFRSDZuY0drWGtSZ3diNUNsMldjeS80L3dy?=
 =?utf-8?B?dVRERHQzVXd4TmFNWEEyYnJUcG9mait0dVBJWGM5NW1RbDV3MWt5Zi9sL291?=
 =?utf-8?B?cHZMcDc1eUczeTRVZVE4bWhIRkFIR2ZURVdMNUNQdXQvcHE1RjVlS0pFOVIr?=
 =?utf-8?B?bE5NK3NGRWdZa2Z3TlZrR2VqVWdHNGpPNGxwb3VXbmdqbUlMd2E3U1pPOEFL?=
 =?utf-8?B?QlpVdFpNRE1XcVFoZ3dVQzRNTEl0N1gzTENDQWtrbGtiUnFYUDBtS3dyNXA0?=
 =?utf-8?B?T3VGdGdpdnVVQWZyZlZJVWhHTmNrZ09ZeTQyZk1aa3lDMmc3cmNFMmNYSWMr?=
 =?utf-8?B?R0s3a3NFSFkwT1BueHlCYlIxL3ZVVnRjL0IzYUZFeXYraVI1UGY2OHU0WW9a?=
 =?utf-8?B?dkdUc1V3LzQ0U0VvWGpjZCtGdHMrdUwzZm0yNVYwVmFHaGpnVHFmK2QwZzFC?=
 =?utf-8?B?Y0thYjZXcWVwdE1qRmVpcTFDdFhOMVd6bk5WWFJUSnFFTEtxcndsSXZyWlFw?=
 =?utf-8?B?UTVUQlowU09RMlQ3UDFXaVhvRXRQcTZ2bmNMSVdVTDBJYmlIQ2xXQ1BRRFpK?=
 =?utf-8?B?blBmeTloMlFyZ2dxMVNTMDBsWHhmTWVjd2RZK0s4dVNVRHg5YnUyMnpObWlr?=
 =?utf-8?B?bEM0eWpHOUhNSDhSQU9yalpsRGVSbzhCYzdyZ2ZCdWtzZWJjTG9xNzJoRnlD?=
 =?utf-8?B?MW1rb1RZK3A2bzdxUGNrRExidnE4bXk2VkJNT1hPbElHamJJNW9lZzBWQUM2?=
 =?utf-8?B?T1Rsbld5VDgxSlpJL21aSlJoZTM1cG1BbVJuNXNoQjJFUUY4NEhyaFZsMmVr?=
 =?utf-8?B?K1BqUitqYjd1T3FjUUx2QzZrSDlRZFJxeTQ0anU1T2NUREppMGp3ZHA4YUZs?=
 =?utf-8?B?cldUZVFTVE91ZnJ2QVpJN05pci9qTnlBZnkyVzlSeERZWTBtKyt6L3NNeTNZ?=
 =?utf-8?B?OUJWU0ZjOFJOd2N6WDJ4ajB3dlZiNktQN3lONnB2OWhSeFFMdExhMnZzMS9h?=
 =?utf-8?B?dEpETXlhcWg1VlIrNk9GNEFsOGNLbjk3V0pDOUMzWnNQSlBwNkNXOVpFdlNa?=
 =?utf-8?B?ZTRlNXIzSnF2bWhPMzF2eUhkZjFoRGNVeFc1aC9XZnJ3NDVsMm9aMmVLamtw?=
 =?utf-8?B?V1JLeTdkQ05oR0llK2hiTWhabmVMWFdmamlhV2YzSjYvQStUdXZZS3I4cTZL?=
 =?utf-8?B?dXJtUVhWZjZadXEydkhnVWEzMjNpbEZZN21wamlXOGNKcXhDb2tCM0lyTHhx?=
 =?utf-8?B?cXhITnRPSXFnMytwQlV4UGlHRmc2WjdlRlc1UE9tQWgwWTViaXRDWGQzZ3lP?=
 =?utf-8?B?ckFwWGlNVGZnMEdjVERpQm01aHpxMElkTTVHREwzVkNpUSttRlZrUVJESmJp?=
 =?utf-8?B?bTZ3WWo2L0xJMU95OXBPSkVVMm85d1F4NXhreWtoU3ZBYTY2eDF3QkxVYWhl?=
 =?utf-8?B?SFl5Z05sZUpLdUJDRkd3cjJvQ2NEbXNhdVQxNHlvMy9uMVJFbU5ReW9HQlBo?=
 =?utf-8?B?WUo4Nmx1c2dDRlZJU1dtdEVTVG9vb1RwUkhQbWRXdWYzNXRab3JvZG9PZWhl?=
 =?utf-8?B?T3RyS3RkWkhoMHdFTGwwaGpGRWlTVVUvSDFocmZpZUV1S2IzcFNWVHZQc1Bj?=
 =?utf-8?B?MnRyUlpCeWs2WjI1VWhvS2tKVzdnR29ZWDhkSWVGMUMyOUlzNTRtc3hwbVVt?=
 =?utf-8?B?WjZlckpYNkc1UmZJS3A1V2ppNXlTYmRPV25mM05KSzdjZGJldENoMFVPQ01R?=
 =?utf-8?B?b3ZRaHM5L1hFdlVYY0lLRXZEMDNCNzA4dzcrVFFrYUxaQTBXME16WWVRblhz?=
 =?utf-8?B?QjM2SnRwNGczc0JOSW41VXFuL1h1OTVYVnZHSUVQdmppVFhGWFRydnltb3hQ?=
 =?utf-8?Q?O+BkMtLmZWuLuvBwdYsWVrpzwqfeEFJAsKogR+7g6Wsm+?=
X-MS-Exchange-AntiSpam-MessageData-1: dNtZy1yC+gcJKA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2503a38-8f3d-4896-df2c-08debd9748c3
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 15:30:59.3645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N5Rw67PM48JALkPhX3zxBc4av6Tau0AmYUK2XwsdojMM30paerZvvtraXsF1nVWk3VRuwKWeOczyxclrQc2SwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6197


On 22/05/2026 17:30, Jon Hunter wrote:
> On multi-socket platforms each socket has its own BPMP which exposes the
> same clock names. Fix this by appending the NUMA ID as suffix to the
> clock names for multi-socket platforms.
> 
> Use 'sizeof(info->name)' in the strscpy() and snprintf() functions to
> future proof against anyone changing the size of the 'name' array.
> 
> Co-developed-by: Timo Alho <talho@nvidia.com>
> Signed-off-by: Timo Alho <talho@nvidia.com>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>   drivers/clk/tegra/clk-bpmp.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/tegra/clk-bpmp.c b/drivers/clk/tegra/clk-bpmp.c
> index f6d2b934228b..428e776561c5 100644
> --- a/drivers/clk/tegra/clk-bpmp.c
> +++ b/drivers/clk/tegra/clk-bpmp.c
> @@ -367,7 +367,15 @@ static int tegra_bpmp_clk_get_info(struct tegra_bpmp *bpmp, unsigned int id,
>   	if (err < 0)
>   		return err;
>   
> -	strscpy(info->name, response.name, MRQ_CLK_NAME_MAXLEN);
> +	if (dev_to_node(bpmp->dev) == NUMA_NO_NODE) {
> +		strscpy(info->name, response.name, sizeof(info->name));
> +	} else {
> +		err = snprintf(info->name, sizeof(info->name), "%s.%d",
> +			       response.name, dev_to_node(bpmp->dev));
> +		if (WARN_ON(err >= sizeof(info->name)))
> +			return -E2BIG;
> +	}
> +
>   	info->num_parents = response.num_parents;
>   
>   	for (i = 0; i < info->num_parents; i++)


Thierry commented on a similar patch [0] that his preference is to 
prefix the NUMA ID rather than append because this is more hierarchical. 
We agreed that we should be consistent in our approach and do the same 
here. I will send a V2 with this change.

Jon

[0] https://lore.kernel.org/linux-tegra/ahmsDANt8D7RSYdK@orome/T/#t

-- 
nvpublic

