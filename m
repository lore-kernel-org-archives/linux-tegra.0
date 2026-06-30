Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010022.outbound.protection.outlook.com [52.101.61.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BBE2192F9;
	Tue, 30 Jun 2026 09:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782812573; cv=fail; b=SYMckkWs+5mSXi0PVb08Wfkg/jDdrd3YCARedOGXagJmk3HrjZ/Bu9hfhYXm0l6lnuoHoUBdHUUuoLSZel7UVar/oTcA2BVUzJ4ai1utoZTn5Ct306OKKayiYIkzk1slBqDF4SZX76Zp9CzXrRX+iMfciiFdg79hjUIngNLnsME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782812573; c=relaxed/simple;
	bh=NEe6S47c/lhGUrKovlJkLb5mcILPC9NOyM6T36Gz4eg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=idOoaL3FTg42dAh5F28SbkzFfeBjrvzkIJjJ6fZYDnyVVS4IwZp0BsmJxq8WmfxnRy+lj0XGLO4tBwqmVsfK8wjrZsLzIZOOHaiqNRZAL/P0VZF/HlFWh0kozqAZFtBLt420GkgcFAX6pk3yGZbu3BJsBMe2QUHv0ZSmmJe8AXM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LiGwf6h8; arc=fail smtp.client-ip=52.101.61.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LiGwf6h8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FmYPTkhrCoH2JkiGaREz9NW0CbAN1t0oDEZzIETAyrro3+UTDvIW3321j4DEiYQe7qbKW4P0ZImJoWonm2eZJg0/pZtJHJsdL+WE1CkzZRvPMIhdrvyJYhnW+oAESiP2ImpW9cvW95hAY93MkbiFagihny1iQlMwLskg0FYYJrcJlypJF5xXzthb4zPFq4MtfXSinveDGYIusX0u1mh0KY0RMfzI5j1Jj4RtGkuDEOcilKCEjMEykpgpxonC+UVl9BHIVAtj5fgthWteD07FypZHWaD5ArJduMht+7mhqPvP996XpCVhlWAgGGTYUZSdo4XRDTs9VMcZqY6/YaQi2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zt77Lbtsncie1+AFWqr0tPcSeJdAyekHoPRmDpf4Y2c=;
 b=jx2OcuBN6lkkQtckVuIu1rLlu/LoLFxootvxOmxrcqfOCEcDcdIlCZtR2FzCJr+D41i0R4brnY90IpelDqP+3prdts9wuoGd8HGuN/zyybdvxl2Su5Htb+RHh1xSwxdMSLdmu5YWy99kjamaystSBq9Y+raH/LD/Jb6kWlSVDabct3OyUFUq5AveuP7otE8o8z12GrOvUiBTWEHkwQ44+OnCAdvoLqALFM0JGc1nbJCGTjic1Y7ukfiMO3h3r6AzZJsRyyUAwGYRrqNfohdQAI/lEqwx4hpwjXyLyOxgkbO/Quqt8OSPqkSUoP3bU4qXYhyHTnvXuwmIQWtYP5V3QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zt77Lbtsncie1+AFWqr0tPcSeJdAyekHoPRmDpf4Y2c=;
 b=LiGwf6h8e/QrnFr/jsXPDQekn7V+ePCxGzF96r+8C68rXQO2K82x8Zfv5bmb8xq8BB2uN8XhDYijdaspVegxhuDRIo8byNl063pZKxVLPZg5ii3OebvOBdNkVX0rbqH54m6rwTI7weifDeBFSL846MDJm6q09mXKf2EjCwl45Xids36bWWxrSra3rmSngUaHaocFx9yziVcldF0CywbNJZk//CK59g1yzDf4CPSsiE0tCJiEbv3ivF5Qq6Frg2+jh9y3GDHfr3OwNT4VmRtmTrCQ62p7UiQbwDlBC/tWTAJLHSQUQjpYLnVrgicfROD08/QuMVPdrcj3fc8+Vos+sA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ1PR12MB6051.namprd12.prod.outlook.com (2603:10b6:a03:48a::18)
 by IA0PR12MB7700.namprd12.prod.outlook.com (2603:10b6:208:430::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 09:42:47 +0000
Received: from SJ1PR12MB6051.namprd12.prod.outlook.com
 ([fe80::96e1:b300:7b78:d3a9]) by SJ1PR12MB6051.namprd12.prod.outlook.com
 ([fe80::96e1:b300:7b78:d3a9%4]) with mapi id 15.21.0181.008; Tue, 30 Jun 2026
 09:42:47 +0000
Message-ID: <3c714ae3-8f62-4785-9f61-ba9899fd70d8@nvidia.com>
Date: Tue, 30 Jun 2026 10:42:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/17] arm64: dts: nvidia: Add EL2 virtual timer
 interrupt
To: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Daniel Lezcano <daniel.lezcano@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ge Gordon <gordon.ge@bst.ai>,
 BST Linux Kernel Upstream Group <bst-upstream@bstai.top>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Lars Persson <lars.persson@axis.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?=
 <afaerber@suse.de>, =?UTF-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?=
 <eleanor.lin@realtek.com>, Heiko Stuebner <heiko@sntech.de>,
 Shawn Lin <shawn.lin@rock-chips.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Michal Simek <michal.simek@amd.com>
References: <20260523140242.586031-1-maz@kernel.org>
 <20260523140242.586031-13-maz@kernel.org>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260523140242.586031-13-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0482.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::19) To SJ1PR12MB6051.namprd12.prod.outlook.com
 (2603:10b6:a03:48a::18)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR12MB6051:EE_|IA0PR12MB7700:EE_
X-MS-Office365-Filtering-Correlation-Id: bfbdd434-1c28-41d0-b7e7-08ded68bf120
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|56012099006|22082099003|4143699003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	1vYksPvq+pPyufTPmJ/8reBSOt1O3WpVvJsgtkA/NMbcdh9liSxmbcrh+UFfleOZi5Zyu5AM0feyigswrOSns0uWvl7L7BEn2g5fHlakMn5ynwbZjoHbZGsxTBgF9cfMOVUSR0QEhJaF8QSMVJe9I8vpmZreAhM3LHW0J6nMiqQvSU0WG26x/gIrhU+E6+mM4P39/23O7ASFgmHVW7SuPNG24AqfyCXNfd5LaURNxYk0T9UYueTkv1C74ekFbMWolE7IOmxw5fsSYUQHh1jrEshaY4qvAS3w/wXqobXOkFZcgnbb/qn84EC+mHwqh3cCL+FAw1+B3maSOfi/nlFl1isbnJNULZ01MQgAVyt7r7Qh1NEQtmaO7V9oMkh42iW0Ol6Ch98ojwCOOLVAR3v0YicyEAKaPq8UDAtAaDH5N19lDeO7DraaF9fAhtcS9GQl7hKKuayG8FbceGpbSde5jmfZoqhH8C0XA/mF0Y6m2xdCuZQS4xgHk20jcV/SWOmg4iuhEcHWmVayATqc/jRwc0vvf3oPy50htPo0YKN+s7SKY3pFLqwB4lj9xVzHrKmoM/wjtUQshkJyudU7o7Pbaosh9AVMCn9woicoKbGgZaHmj+B+M62OP9UJvtu3682lAHNtDmSFHWm5vDLHsBMIW/DfIuLzmHukpKQ2JKBRxxY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR12MB6051.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(56012099006)(22082099003)(4143699003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUhzemJnQVFjK0RtYWpXVlVmVFRxc3MyOVQyWWlrb2ZlaHZCaFNFRUY3RUpp?=
 =?utf-8?B?TmM5VkZkZkZYRW8zY0w4VUM2VmQwVVBEcXFoSzFxdlN6VEJ0d0NFWmlDQnRV?=
 =?utf-8?B?V1Q5dG41V2N2cENRNGM3c0FLMS9wTVR1SlVURDdPcWNleXo0YnZBeWZNVVRO?=
 =?utf-8?B?Zk9XTWdyZmZFdjRXMVd4ZDJsNHdFektQVFhwVVRDQTkrZjJEMGtJcnBIVnJV?=
 =?utf-8?B?bmFZSWttSXJRSG5NZSt5UkMyN3BGU2NnQXF6T0NQYlBwTFE0a3B1SHl4dTVu?=
 =?utf-8?B?TlZMWFBZaHpHZTAzUk1lN1dwWTNOa0QwWXBoYjYrYUhOWU0wczZnOXlwK1dk?=
 =?utf-8?B?VUt1UWdkKzNxTmhGb3pNMkZacGxKVGZpdkRkamtGV1lZYXF3Vlc3TVlYbjV4?=
 =?utf-8?B?eEVjOG1vU3VzVWU5cUNNR213dWxUM2hvSHVJWitWM1RvQW9lMnp2Z1FhUTZO?=
 =?utf-8?B?Mjc1RFZOU2Nib1hEVFI0aFNGWFV4dHV6elJYYk5IRVhSQkdBcEtmd2VmTWlp?=
 =?utf-8?B?ZHJWVUdBMWtnKzJtcVFjQTV2eUFGTmE5aXZMdXczTFVYTDcyVGpaMDZqcHUz?=
 =?utf-8?B?WG92aUt0Wmc2ZHdzZXNCdCtYUHMvMnh1eHdTd25YbXg3N1hQQVFiclIvUVhH?=
 =?utf-8?B?MEgvV1pBN21BMzc5ZmZySzlKMEZXcnRzaERQV0xXdENaQ1lQTSt0WVkrWE1h?=
 =?utf-8?B?a3hhdjVvWkNLUXE5cnlCZU1pVFJZaHRQMkloMVlUY1dNZW5kd3hZUkg4dWFE?=
 =?utf-8?B?dFNpZ2FqZThQNS9WbXRkSGNnOXpVS0RGR1lKZVA1RkF5L2F4TXk2UXNnTllH?=
 =?utf-8?B?YkgzcVBRSVdQalcvZFk5b3hiNENGdEJSRW5mR2tDK2VrN2FqU01jSU5BL0JP?=
 =?utf-8?B?UVZLRFZIcmFJS1VYK1cxRFV5My9NVHFaYmFDNloyMkFSMVN2N1FXMDg1cWd3?=
 =?utf-8?B?VzVXQTJJV3hCVm5mMnpTcWM5OGlFdHlidzROZE9lQkJqcFR3bUV3R2UwWHRo?=
 =?utf-8?B?WjNFTFo0TFIyNm5NUmtQdXlwSXBPdDFpajk4NzVyVWh3MEk1ankzN01Zc3ZM?=
 =?utf-8?B?S1p2NDViMStnSmVEcjVPWWJyZVFiQUhWMFZaTjlETUY3VGJBa2Y4S3FuOVRK?=
 =?utf-8?B?dk5OeFRJSEVWQVVyWFVUdzcrMk1RRjBBYTZodDdaK3E1S0xaUkhJbysxaVJx?=
 =?utf-8?B?dTg0ZWJZbTlVLzYwS0NQYkwwaWVPaGJ6Uy9tMFpHNFpWaWd4NTU2YWpjYW0w?=
 =?utf-8?B?V1JUL211R0RBc3dKYmprL1hSV3NiSEtDQmYzcEtXYzVLS2hNM0hOUDRjN0Jy?=
 =?utf-8?B?ZHRNMWVhalN5VHRLK3BrWG1XZ3BVbnhMSEVmSk1JTEpQOXpPOVUxdGpweGFl?=
 =?utf-8?B?dmo0NWJ6YlZVT2E3RGJDU3VMdGhPVGV2QkRRSy9uMnhxVnVEWTJSSzF4cTRE?=
 =?utf-8?B?WU5oRkNQcUxzbGRyZVpkU2xYaTlPb09UQkpKbERBNkNLWkdkM1pudkwwckxh?=
 =?utf-8?B?eGlaRDJESDFRbm01bnNsNnVTTm5jZ1NsL2RjSWd5WjQ3QXk5dmYyYWtnQjN4?=
 =?utf-8?B?RDlPZWg2dUFNV3RlNTFHclNpTUVHNmFpdnp4Q3ljSkhoNWh2Si9qNXByaFZz?=
 =?utf-8?B?a3JXY1JFS0tzekhJM0VCTVc3VEFVaGE3RlZBM3huMmxFYzFkb01uMmwzTDFT?=
 =?utf-8?B?VExMK3ZnVUt6Y3Z0blFubkM0ZFF0ZUs4ZWZGQ2ZSSEN4eDJKUVNlNHI0b25Z?=
 =?utf-8?B?eG9rcFUxclF4b2wyR0Y0eHdacVY3dVdGbHliMEVjcVZIcjA5R3pmSndhOFhX?=
 =?utf-8?B?L21idW9oZHl4a0VEeis0MTAyTVpyd1FDODN1SnBRcnRkNENHVGs4UEdVNnE0?=
 =?utf-8?B?a2hDTDhpMHFZYnJiUmh1QzRKZFZZZXA0NFBQUmQ3WWk5M0RHbkkzKzRmQmds?=
 =?utf-8?B?WkMwQlJFb3FiQWZkaytlR2diamw0TnBObGVodEVPWFNXTUhpSHc0WkxPNXdR?=
 =?utf-8?B?UERZaThLUEtOcEZCQlhNVTZ1aW1xOFdtRzJuV0tkQVJ5ODVEU3FCMkdHOVZk?=
 =?utf-8?B?cENKVTZkazEya2Qwc0Z3YVNmWE5xTDQvZG1zanRCN3dwQWxWV09GdnBwa2hv?=
 =?utf-8?B?RTRrc3pLYy93M0VkT2JabFl1RnNVZUIrNVd1dVhKZnBHNnRvSkN1WEM3Uk5m?=
 =?utf-8?B?bDVqVlNwTktLdFVDak1kUE1KblU0NGE2K3BNNnRVK2JKQnhUSFduZmtlK1R5?=
 =?utf-8?B?ck9kbzhVVXVrd1krMG5RVFI4T2I2ZjIxSHFWdStpdDE3SnFOKzVVVG1SR2JF?=
 =?utf-8?B?ekVEbHp6UC8rQWtTL3BCY2h0dmtGK2p2YUxrMFVuOC9oTVBlSS9MQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfbdd434-1c28-41d0-b7e7-08ded68bf120
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR12MB6051.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 09:42:46.9674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OM1SJlOgXEZwOPBlIKwwqnKCNam7lrhcZ8daLNGm7JL0/ArjudpUcqwWUauvLeo7PIUDFvU9ioc0W6q7hYL4ZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7700

Hi Marc,

On 23/05/2026 15:02, Marc Zyngier wrote:
> The ARMv8.2 based CPUs used in a number of nvidia SoCs are missing
> the EL2 virtual timer interrupt. Add it.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>   arch/arm64/boot/dts/nvidia/tegra194.dtsi | 2 ++
>   arch/arm64/boot/dts/nvidia/tegra234.dtsi | 3 ++-
>   2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> index 849694f751d90..45cc180ac9973 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> @@ -3163,6 +3163,8 @@ timer {
>   			     <GIC_PPI 11
>   				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
>   			     <GIC_PPI 10
> +				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 12
>   				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
>   		interrupt-parent = <&gic>;
>   		always-on;
> diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> index 04a95b6658caa..ab9813f9ba30c 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> @@ -5872,7 +5872,8 @@ timer {
>   		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
>   			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
>   			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> -			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 12 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
>   		interrupt-parent = <&gic>;
>   		always-on;
>   	};

Sorry for the delay. I gave this a test because I observed the warning 
that was added on the Tegra194 and Tegra234 platforms. This change fixes 
the warning for Tegra234, but on Tegra194 the platforms I tested hang on 
boot. It appears to be similar to the issue that Marek saw on his 
platforms and so I am wondering if Tegra194 also doesn't have this wired up?

Was there any resolution to the issue reported by Marek?

FYI, the Tegra194 SoC has the 'NVIDIA Carmel ARM v8.2' CPUs [0].

Jon

[0] 
https://www.nvidia.com/en-gb/autonomous-machines/embedded-systems/jetson-xavier-series/ 


-- 
nvpublic

