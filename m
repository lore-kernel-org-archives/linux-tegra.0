Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011063.outbound.protection.outlook.com [40.93.194.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCEE395D98;
	Mon, 22 Jun 2026 10:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782125067; cv=fail; b=c/ZYpxwn7qVIUJ67xQSx5Lo/7gAaoftAJTp2CIlRhdYzhQXjQCVWxIPGEmQcrY9AvoNuJ4psr5oSI5OD+DjQq0L9J7XKzccpDCGV3RdOMiO7JUUMpUwm3DS5UHGBxreko1nqz3oaLc3l92pkX+zHWKqlimLYGvMqVUSObrrWTvk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782125067; c=relaxed/simple;
	bh=0P/fUuHY4ozD5HU/6+81+Y/949qcyWWH/cDSVwyuRFk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cXgB2grueaJDxgtU5uZljxADLMsI8Mht2GqZ7IUsWwNyd52WxFyJpTbuX1BFmg9umMcM1j7zPw1M03MmtQ5lNbVy/Q1bLxpqmMlYImwNANvwPWcNG0FeeqTfQxchZ3PrWUuvI4h7HbS1SKPgKjtXEaE9qIM5arpfQJ8BrsNJms0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=raEwkztr; arc=fail smtp.client-ip=40.93.194.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="raEwkztr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VKDSNSH2VL30cfz3VGqLjgw7MCaEW2qYsRiLEmJ9i1dQaUypJ6qH/VggbLIWNjb0JH71LnXI60KFycigQqe6+ShK0CItb3nhdBYkR1nGA2QHLii6nZb+JxLgeUxNG7V+jQ+5UWQwZk6m+j6j/o5E6na9KbOTni9dpeFuEB4+QJzGMBqQmmS9W9EC4BQRSCfqN4n13VETqDLyt8Zg0pFuk5PEOGZy3Js7NwFvBaj+7nVs/CSu4bUSNDecBnqYrvKB6NNyuzu0JM8bZdAp7akDYEG9bZyabAU4p8UWYAOkVkyRO/qpJRimyP+v+wnCwnEwRdvkTHna46nt8BwuplPQrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=luyJOIZog/oclA6atQ3zscB3pSoJ+xKFozlHskY6nO8=;
 b=JTU0jtYE83pCzRmoV20jQM/zI5xBvcVxaw5iHhkN86Xb+VO1NTG+5ksuv0V+MNEu/mvZ8ld6vLi48LOGkEtcGNg3W6IiymRpwrkd5+cL2LdOteHivn5dhraxDQWoxqaYPebTmv7X1UlmFykH+UTmv9D3QVl081s8pUvPqSQWKiXMPXU3X5a7Q6XgjFURQJjZtNXI7tDL6w0PVmancg2J3K3eKoK+NQoupL/L5fHYuNf16Mcvkg3StxczqKjuUZRg5Eprs063m9xtE1zeyaSGGcbZ/ZIXsGXaAn5+SUZUnvAmB3b2F5OuWzguv1Sba7NPBKvH9a/18Q3/mCiwy+S46A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=luyJOIZog/oclA6atQ3zscB3pSoJ+xKFozlHskY6nO8=;
 b=raEwkztrl1vbEnzS1HGSyOFqfTXkqRkrYi7zwJgqOB+bpim9BdX56Z4dOHn7j2IsFnELqtPfjBKrvhF5c9nC5VHU6u2VLUHVD3a9jku8YM21PUMS42Ga8EcGMek13NbrySuBNAGaWUMy4cUVd3/rv/XN7boCJuc0S/xtbaJd+YkWPYNw8XY8AiBsS7w49vash/vbFlDyj+L9hXNBlE+emgMp/AmgVdcxiYvZLVKdc3TJl1bAZk6Piqu2mF8IV6teAe06Jyzz6aEIdpW7Cq7pcLTqV8ymMfvX2QkmpvQ695djWlka7cjOrvxMcc/FxR9QZLxX2A//k2TWuLQun96ExA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BN9PR12MB5179.namprd12.prod.outlook.com (2603:10b6:408:11c::18)
 by MN2PR12MB4343.namprd12.prod.outlook.com (2603:10b6:208:26f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Mon, 22 Jun
 2026 10:44:21 +0000
Received: from BN9PR12MB5179.namprd12.prod.outlook.com
 ([fe80::cf08:f59b:d016:c95f]) by BN9PR12MB5179.namprd12.prod.outlook.com
 ([fe80::cf08:f59b:d016:c95f%4]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 10:44:21 +0000
Message-ID: <d89e306f-0947-4bfa-843d-664ee3139dfb@nvidia.com>
Date: Mon, 22 Jun 2026 16:14:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] arm64: dts: tegra: CPU and cache node updates
To: treding@nvidia.com, jonathanh@nvidia.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: bbasu@nvidia.com, sumitg@nvidia.com
References: <20260121104536.3214101-1-sumitg@nvidia.com>
Content-Language: en-US
From: Sumit Gupta <sumitg@nvidia.com>
In-Reply-To: <20260121104536.3214101-1-sumitg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0174.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::29) To BN9PR12MB5179.namprd12.prod.outlook.com
 (2603:10b6:408:11c::18)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5179:EE_|MN2PR12MB4343:EE_
X-MS-Office365-Filtering-Correlation-Id: f95ce025-7acf-4fbe-b929-08ded04b37cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	3MA9BtlE8SdxXOscWG6MDWdR9YwHtfCOhwbNn53nLu+tLmRhybH39N9iWLcGLk1Tn2JqIM2UL70omicBxHKvKybMl1ruBYCDUwoRLuI92IPZvFimE/grScafqaXRAlzoamD6zDOHMr0voGEAxmQDxVkHDfd25KROgZb/bJozBz5mbS7O7f56Fc9KmeDIV/gKJABvCEsmCoAsz8GTC2A7s8NRAhZ5ci6LkKIEPdUCN9zt7CeEVJpADH7ShMx0563bkeSP1mcy7tXDk78Ep86InziwK0eNxnOdkgXmhjOmYoCmAaWalfh0gmr0N4Rb/eRKz0AprG7v00GZjwaAkgYYwjcLtfzlm61SXL1AyX4nN408CtSOR2obVYWfTsTzKebPVjZkL1wpnsWJrPBpY2ROOYZjH1ofwEheY9jvc6DFow/zPyh08rORc3UoyJdZvqhXqn7KGmvC19DvxHyc88YBBLj1OuTUANCH0sr6Hsl5uchuQw/1YbHeqHNWwTr1LNDQXo3qMt8iTaff8XS0NAgkMibVvX5YjbOSbTtG7aULI6lypi4RVcdcie/TLEwyL3CTzCzn39vxmZE5GBiIQKZSmifAIHeKULzIuqCLd9HcQWCk6bId6iWWK9cP9q9PEOrmUv48WaN7hPpBE/01hi52IOEsKH6IAxjAefyAuRhVuH8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5179.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NkNHTUNkcC95aDIvR3FLMnY4Znlrb2JtMkx4LzdQUjZld2IrRVZvcVhCOGFn?=
 =?utf-8?B?R0ltWXRYZUp2NG9vY0JZbzRHNHpLamo4YjhadDFBNFJZM3B6QjN4THVWQnZj?=
 =?utf-8?B?dm1BTDdlSWZsemR5V1l1S0tyczFSZlpwRk5Fb203ZWNpdzd3UXZ4aERZUzhu?=
 =?utf-8?B?a0w3R0R1blUrWnpoa0tUTCs2UFRJWm83OThCQUk2dzlaWG9IaWRCOXJrN1RR?=
 =?utf-8?B?SXpBSHkwbDVoYmZpcVN1MWt4b25QR29KS1pyUldsMFRZb0hnWW9ZaERvaXIx?=
 =?utf-8?B?NTRHTzN5RGVBL2JsdFFpOXA0aUtKNWc3ZElmbkpmelQydVdoY2Y0azZ6VkhC?=
 =?utf-8?B?SGdEM2dEUGI5cEhuN2Z5bnZnWTdaOXFFVEdDSHJKUFRJdFk5SnUvTXFXVkU0?=
 =?utf-8?B?bnB6MlFRK0QwMGx0UEdpNWsvc1JaV2ZwcXFuWG9aRi8xL0FQa3ViN3dQZis2?=
 =?utf-8?B?dFhRMG8rZWc2TjlWdnN5WFF5YUxBYW1aa2ZCbEN0K05xNGUyWmRPQkRKa2xQ?=
 =?utf-8?B?WjNTN09ROUFScmk4UUpoRDJ2RFJQREYrL3NQQUxuREQ1WCtXVnRMZkl6OFRy?=
 =?utf-8?B?aTk2WEYzVlh6cjE3STNLNmVoWHlMdzgweEZYVmM2UFNFYWpRU01LSGlGSTYz?=
 =?utf-8?B?SFhWQUJvYVJqK1NuMDZWclk1UlJtbi9zUGNZY3d6d1pNdzZyM2NZRkphaDZv?=
 =?utf-8?B?VnpHTGZBanpMWThvQzFrWnRUWHlxRnZLV1dJZWtCcU9zMHI4M21TdWNhajdw?=
 =?utf-8?B?NmNua3FkOXNlZEp6OWw2S0FNU2dyT25IMmlSSm9pK0RWekJXR3VwWWluekR0?=
 =?utf-8?B?Qkh2L0VlTmJXYXVPQXM5c2lKdW9XaU9jRXNmTituL2dDR0JhVStuaUxOTW1x?=
 =?utf-8?B?ZHpWQ2ZjZ2RzQitSUE43M2NGSUxkNEdyeVpaZ0dVeFpraVFHQVAyNVNpdVlk?=
 =?utf-8?B?Nnh0Z1VxdDVFbFY4Q2MrU2FlV3RsbkN1MzdPSUxYclQwM1l1VUJpTjRNaGZ4?=
 =?utf-8?B?RVRKTmZqWFVoeTlTdDFaU1lUbUg3ak41VjI1dnZzbDB5M0FscUR2Ni91eUk4?=
 =?utf-8?B?RGRJamxzeVdHN201S3VPRENocWpuN3pYWmp4alVxc0JCdThsMXNSODduRUxj?=
 =?utf-8?B?VFU4eERVUG5aRjRIdnZ3Wml5OGRmbFdXTEl2NUZLOWx5emNoOEV2ZDV3amdp?=
 =?utf-8?B?SXBUSEJrOXpRWVU2aHUvUzhWeUxuL1I2VjZhZjJuWEpxazVWcmpZSWQySHRX?=
 =?utf-8?B?UG4wN0JaMFQ2bWwxZWEvMGg5KzlEWEs3QmJ3b090UGxabmVqQ3lXOEpESnBB?=
 =?utf-8?B?YkJQNzgzVnpHd0IwYlpZbU5PNnJGNm9tcmcyZTVtN29xT1F4SUFZYm5pNjd2?=
 =?utf-8?B?K3lZUGJhN215U0xqcFFrRDFFU00rQVAreUdTSG5sOXJvbnMreDNjclA2cnlu?=
 =?utf-8?B?aGVEcHNLVUNacmxBelNZNy8vT3orVkZzdWJ3K3podFRySFNqdlJiQ2J1ZDQy?=
 =?utf-8?B?M3QrWmlJTHVYbUIzSzZtRE13eERwZkFiQ1hFM01zM1JXby8zZWJ4U3dhQnYw?=
 =?utf-8?B?dzMwT2pRKyswV0hydHpRdWh4STdqdTZ3cHl0SU8rdkM4M1ZoblltbTZyVFBh?=
 =?utf-8?B?VytPSWh6NEF1VWk5eVUrVG1Tb3JrVnZDdnZ3NVJ1RzlrdEJyTi9IR0lUUVBa?=
 =?utf-8?B?eHpxaCtpZXBrRVR1MTJUUk83ZmVCM3F2dE01aUp6Y2NUaHRSdXRNMDMvcU52?=
 =?utf-8?B?OTMxRFlleC9aVmRIN3AyMW54RnpqK0dlNGdCSjVXY0RBV3REaDhFaUp3Q0kr?=
 =?utf-8?B?cWdwR1NabnI3RGNkUnBsL0lSWmZ0VEk5QzVtNnBXRkI5d1J0SkVJa3U0OWJN?=
 =?utf-8?B?MFlJVHFIamRlQ3VkWGp5L0E0Vjh3V0NjbnFjQmx4cC9vaUdZdlVINDRoUmdw?=
 =?utf-8?B?YnJoOEdMVndIQVM2elhIUVpsNTZ0a2YrNFd2M3JyQjFDa2JMblRZakg2UDV4?=
 =?utf-8?B?Y2xDS0J3amdiL3dyNmU1QndXTEw1eHhXWVp0V1pIU3YxTmNhMEZXVG9CcjFT?=
 =?utf-8?B?dS9yd2J1WnhCTTN1UytSeHNCMGlJbHdvUHRxa2VBWGZzanR0Y1hVR0w0cEQr?=
 =?utf-8?B?eXRITEpaNE5lZEFNOTgybmhsUk5qQU5UblBNTjV4dzFFMTFVRHBob2lwc2cz?=
 =?utf-8?B?RkNUTE14WkxmTlJvNlRURDVudlp2MC81L1FqeEtxeHFNcHBKWVpNRmZOQ2o0?=
 =?utf-8?B?QlZTMmNDaHR1bk1tYVZmNnFXUnEzZlBJS1BqSjlYVHh5UE1IdXY3VTdDeXQ4?=
 =?utf-8?B?QTg3ZVV2NEhkVTlJeEVIVWlYejNLMzUrZWkzV1E5SnZmRkNEQVVtUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f95ce025-7acf-4fbe-b929-08ded04b37cb
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5179.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 10:44:21.3959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XW48IGkEC+NiLmn1abAmZL8mQBBM5j64VoMZ776a8AR5sb+oIsqS7vE7s5A5WhOhQEgOSYC1VCkxK7kZTNEWcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4343


On 21/01/26 16:15, Sumit Gupta wrote:
> - Fixes for Tegra234/264 device tree CPU compatible string.
> - Populate CPU and L2 cache nodes for Tegra264.
>
> Sumit Gupta (3):
>    arm64: dts: tegra234: Fix CPU compatible string to cortex-a78ae
>    arm64: dts: tegra264: Fix CPU1 node unit-address
>    arm64: dts: tegra264: Populate CPU and L2 cache nodes
>
>   arch/arm64/boot/dts/nvidia/tegra234.dtsi |  24 +-
>   arch/arm64/boot/dts/nvidia/tegra264.dtsi | 323 ++++++++++++++++++++++-
>   2 files changed, 334 insertions(+), 13 deletions(-)
>

A gentle reminder on this series, which got missed and is pending.

I have verified it still applies cleanly on top of linux-next.
Please take a look when you get a chance.

Thanks,
Sumit


