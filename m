Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012019.outbound.protection.outlook.com [40.107.200.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0068440863B;
	Tue, 30 Jun 2026 12:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782821379; cv=fail; b=k5Oo9PuLRR1effnTgL53LAAAYX7KOyUVATFagyU0ZdHRmlws3S5XC2Q1uIvhsR7KxjiQcgZ1juK+zbsgVGiMc/zh+12HbR+2bOWoMelkXRZ/ycbZrbV/AtjENImXQaKCJo/BJZnkFkoyznpGf8pLaWP2SSpJbri18+d/r3+ZrJU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782821379; c=relaxed/simple;
	bh=0FYg0iS9PYs/oC7/gSwCBUjOlXd/2s6wHA34zCYKcx8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VnV+xMaA75SyZH8fMDBgZnh/lPTl9i05Vbibti+BiIUbRXKJUCxdl5daN6S/AY+bUo0ivOlzEQdtm8sDRldKIcQsrE+ZlBzRCmhTLip9Zvc459pEW/RPpSaCGHerZEq8fp8MdTsTjBgx29BZVuD25ah3fcHM5RLVBVcg5YlXrZg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fQ6et/Rl; arc=fail smtp.client-ip=40.107.200.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fQ6et/Rl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mmm8wyG+mhtb+pez88hD7I62wzgwSGNoHsq06oOndaaMVarbIoGJ3sNElFtuqcAjhP9zU0eXk7huYfdGXXFiDo+6yVUfcGZk4nSgZAL+lpVYhocWkdGJIzuvGAKMUGO8kB6JPmHmjXOcuWJGnsK+YfIGncoEgqVUHG6Oi9zHX4t2/iQIm0UTju+JoiB9/1CpeXbSq+8KwOEbmoN4cXU5fNekkvpYOyMcMw/YQi04fOPVdB0JyxzCkkQwv6mYZ4RFopNUVkIHWHNttLz4A4T5uNkbX4EmNW0YZB10rEUkVcKlEbPbODvQoPGS2SFDRnXzRVgPXN4xwZKBo8eB0mCTYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WoZ9p1j9Uc1k4M2iiZs2YNn+MPIqgBBLH+5SceAxMT8=;
 b=ujJ3YPcMAGU7ymQDkQq+jWNbRAYs8amR8JA388A4t1q+kKAbtZ6tioXm1mlc/1P8rR9bjelT47P1NsqCm7aXVEXPoDaAWQut/158SmgYpBdzjr8LIM7FgB6P97xFcPPIltGm65n/pWayGj7l2c6Se/LNTjGc2uw/40AsyJFc/VWgKmjMXFUYmWotronjBajI5Y8xzqaBZPiRBdr9x8xhTMLcv6TurrSxr2wdmCbfny6GyDzO2UxVlx37/oZp7paqs0rxy3Vw+Qvp1mv2CxPgRExoxgsYPgl7Lu1U+x7YXzFlSwR1lFZTZMu289NmH8/+heNioCHNXMyzQ5IFez3XZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WoZ9p1j9Uc1k4M2iiZs2YNn+MPIqgBBLH+5SceAxMT8=;
 b=fQ6et/Rl40LNU2HsFB9NVK8P6s2PA43bj2WmMMKZKjgmn8N1HFlh4S9SJ0+nBzARa84IkG4RF5FraOb5oAM/o7xc8pdsuhOxRwIBhB+XfrECVPHg3ngURUlACf3vfDeIDz4heB5N61mcOHglQWLbqgqsnlvCrFSGm1bDqPp2oD+IZ2JilNJInAxQ2P8oqW51EEWYgbH7vqSt//lV1UeXJkuBPv0T7sz3Bvgm1wQ1u80WFtjdCyU+zQCIPk8W4Iau1nroi7vGcbvn+hm09YkDWrGMOqRBzNNSfJGu+aHN+g3ebLdwZYm8vadeDgfpJD0+QqykMsyJnRwZXkhhX7vtBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ1PR12MB6051.namprd12.prod.outlook.com (2603:10b6:a03:48a::18)
 by SA1PR12MB8699.namprd12.prod.outlook.com (2603:10b6:806:389::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 12:09:31 +0000
Received: from SJ1PR12MB6051.namprd12.prod.outlook.com
 ([fe80::96e1:b300:7b78:d3a9]) by SJ1PR12MB6051.namprd12.prod.outlook.com
 ([fe80::96e1:b300:7b78:d3a9%4]) with mapi id 15.21.0181.008; Tue, 30 Jun 2026
 12:09:31 +0000
Message-ID: <00da7fd4-68a4-4a92-b4a1-600b5a2b72f4@nvidia.com>
Date: Tue, 30 Jun 2026 13:09:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/17] arm64: dts: nvidia: Add EL2 virtual timer
 interrupt
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>,
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
 <3c714ae3-8f62-4785-9f61-ba9899fd70d8@nvidia.com>
 <86wlvgpacz.wl-maz@kernel.org>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <86wlvgpacz.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0572.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::22) To SJ1PR12MB6051.namprd12.prod.outlook.com
 (2603:10b6:a03:48a::18)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR12MB6051:EE_|SA1PR12MB8699:EE_
X-MS-Office365-Filtering-Correlation-Id: 8baa65b2-3042-4a88-0a94-08ded6a070e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|7416014|376014|1800799024|22082099003|18002099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	ENXOA7ci6QXEXHVdlkUE6pulKhSqmpI3MHTCRazR8sOa9vViGTuNu38w7TPQQlJD/XcxAGFq2C2pdev8Va6qf+PyPI10ccwr+9NuT3lH1ilFRFedalxyX8pmmkfxC2oNcCjtdTiCv0SKyPdHOHPKtUfrwsRqweJbNCtYH7qRLhWMyrXNyy7RzDWVE8K8lnJEn/4ef+i+WaN5tsQohd6FxQVyfKuQ0fo0HjYnUlloz+O0PoZWolBBhWzYYtqIO3Gtu2CS+N1yTXqL5VsygoTuj6sssMypmlU8L6qOMfsJUo95ODAhNSyXe6b+fpnzsj2jcEcr2uskcwj2M+HoLP7vFm9d+/VYh7JRsQ4vHttmvAyRUgggcOJeDYKTfPjg4dAi1cwmBWEqMckXwzFlQtTHHzJeaKljpgFCbAPkyVNawFmpu2pnV5fyQ5WaS8jHg2NYjkn841YP990uBlJ2b953ghjeTnASl1+BxxlUYJjzuYomOVdNgGKgzV8dj0OSqDMtfY8LKPcv/3MLySEpCLzSXjGdrIZXbDyfCVSSJpewfCLv1IlHbsP4T7lqJlnUQ5DDlf8fdtojI8UIlmXPwmURZCmzVitBxW2pe40goxpST/ZXP7FHwfwURni7565MVr5Y0D334igdGfxWnbOr6Kk3quZNKL/2XKIPOpAA37zKm4c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR12MB6051.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(376014)(1800799024)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OEkvYUx1c0tiNzFhd3RDbWtJc05JWVovRHpHLzFKYUE3YkdXY3NqNGFLZSs1?=
 =?utf-8?B?NnpIN0pKUFhWSm12YVBQT0hRMFJtRHo5VU1qQ3EzK3VzR0EvZEptUEsxWHBq?=
 =?utf-8?B?K0pIRzhJZmlIZi9vNmt6UzA2bkFSMlI3cjF3bWVBUEl0eGVVdllXSGlvNVBh?=
 =?utf-8?B?RkRnRm81cE91VE5jN2FSUUY1YXd1WGprc2dURkMwTXUzTUlMZjU1Vm5hSDNu?=
 =?utf-8?B?N0M1dHFaVFNpQXdGSG8xWkw1TGpyc3BzYUV5M0Y5ckYxazdiek5aN3RYd05n?=
 =?utf-8?B?L3Bzc2xJNmk5SU5IN2c1UXNQUlFUSmtnZEhWb2FnMk1mK1d1NW9iQUQzTEF1?=
 =?utf-8?B?d0V2VXJrMXR1UHAzb2ZKT2kzazIveUs2cXlFU1NRYjF4UXQ0eVBoSkYwN3la?=
 =?utf-8?B?V0gvcFJNaU43NWVVU1hkenRWd2ZKZ1lTbjlWM3NHRWs4OHhxMlRKS3ZIZ2w4?=
 =?utf-8?B?Ni9PNEp5THpTRUg1MXFVUWFyb3hvWWJnd3FvTjVCbGE1dlZMWEdFZGFKcHdt?=
 =?utf-8?B?QnJFclNHd09MZlYvY2xVZWFDZ3NCSitDMm1ydTV0NjhpcHNmMmhFTnkvT0hl?=
 =?utf-8?B?TEIvUFJWbmVjVFV2bGsxREFKT2tmdENmenRPSkk3QXFiTU1ITk1jZ09UNi8v?=
 =?utf-8?B?SmhBeEc4UUVBK2p3bUw3QXpFUWxYTk1MTlRTQ1BCdTBQMHZQWi84OG1oL0pF?=
 =?utf-8?B?SHlQTDBrbnU4aWVza0k1T2xvNnBHTTJZOUgwTDdzME84MnNFVlVIRmZpQ2RN?=
 =?utf-8?B?bGJEd2FBTXlZeWFzS1puTjlHN3lMUFBoRGM5MUpGYTZPa01xM2swK1VTTnlR?=
 =?utf-8?B?dlZSdHdTSHZIeEpQeDNiZ1VhQklVbmFDSEVleUNQODQzZERESHdZOHU5VGh1?=
 =?utf-8?B?c2hCcTFvNDNERzk2RWdWZ0M2SGc1UmdBdGJUalZjT01hL0RUWnNua0g3YmxN?=
 =?utf-8?B?anhBQWQ5RnFDYStmSjhOMTlndXZrM0swM3dPUU9nNjBJVGRuamdFc3h6VDAx?=
 =?utf-8?B?T20rczVqcGg4RS9XREdueUtGOXRITE9zcFkwSTkyanZDK0FRTlZ6Q2RBV0x1?=
 =?utf-8?B?VmVzRVRheWphTkdzVm9NVnRpS3JxY2ZYOG9PaDE4elFVZEFrZmlEb0JxUE1V?=
 =?utf-8?B?R0JnL0hhWlJzTmgrdGlGd1ViTzU2dkZNUHVBRUg1R05qK0Mvcm5JZjlublpr?=
 =?utf-8?B?MW1qN3Y0bGtRR3hHbFdoUGV1NGE0UjBBNVNpcjFsbXVORWJ1Rk5wMmxBUDNs?=
 =?utf-8?B?OXZLWjlpVFNldzA4ejlaMFpFaWozeFZxckp0aHVmdzV6azkwcnpyalJxam9a?=
 =?utf-8?B?cWF3dlBPWUVrQ1l1SWVYbGdQeVpNeVVpR01SN2p2VW8vR3FZMElBMEFUQ1Yv?=
 =?utf-8?B?b09RZmFGdG5iK3VoQ2RwTVhQdkdEMU9HRkRvay9yTDc3b3ZNazJHVXpseC9H?=
 =?utf-8?B?SEs5cUVwekpyRWJ5c2s5WkI0V0poT1BSVXR2UWxqbCtSMWxpK3FFQUpPT3ZK?=
 =?utf-8?B?SzJTR0k4dll5YnJDQUpoS1NLT1RlZm4ySnVMWURIUHhwQWo5YXhYekNEdzg3?=
 =?utf-8?B?RWQ2OTBBYUZlQThEMXlMbStLYjYrZ2lSRlNQcU9XdVI0QjkrVG9wOS9admlj?=
 =?utf-8?B?eVNDOUJVZStaUjJpTitQVlMxQ1hudit4NTFvVjRLc0Z5OXh1MGlMNEFFM2tD?=
 =?utf-8?B?bE5nclJ5YUNQK1pyMi9GUnN4QUlNUHE3U3Z1YkxnL0ZkMDVkUnpxME5iTVhV?=
 =?utf-8?B?VEVGT1lKT0hlTnJxbCtYUzg1QWwrY1pHU2s1a01Nc284a2dmLzFrRndNQVhk?=
 =?utf-8?B?RFBhVEMrdG1mVjBHOVAxTUVOYkRFZmpWdzFOZzNXZTBJZ3AzOEQyU0R1YnNr?=
 =?utf-8?B?VjVjbnlJbXdoN3llcFozSmQyRjlJaGN0L0JMU3Z4WXpXdHlIOWVEVk1Hb0RS?=
 =?utf-8?B?OERTMjYwWFhxazZaREhOWWY4VzhuU0pCSnJzTFgrVFM4enI1Uk1YdHlCaHJ0?=
 =?utf-8?B?OWZaazVLd3h6TlhDbU96d0VPWnNmRmtPSUxaVHdYcENycnBNeGhWR1AyMlF3?=
 =?utf-8?B?L3pYSmw5YTFoc2JOT1FYSGlqVnpEZFJMWVRTeDV5NDVMQWtYMG1Od3NjMXVj?=
 =?utf-8?B?MTRFanFENmxRZDNnVlJVazExWXY5NnJQMlJCUEptNERxeGVqSElPa3VsWk5R?=
 =?utf-8?B?cmFubGFTUVdpOGF0UjFIWDRibVd1NmZiekl6MFRXcGc2SmRZMjBZN29PUXF1?=
 =?utf-8?B?L1lDN3laR1pUL0QzMHJObnArakJiTzFmanlNWUVlL1hDaVBhWTNlUjZORitl?=
 =?utf-8?B?aXcyWmpGMHRHUGV0WXRlYmNIN2x1bUpkSnVyZThwUzdqemR6MnpRQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8baa65b2-3042-4a88-0a94-08ded6a070e9
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR12MB6051.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 12:09:31.5417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jkRtO/qkz7kZoO6E8FSkHx5lqbVdLVu1KUjxK0O+t5vwB8sTovvRtnCiwlJF4WnuprV5OxYbw9D6DaWCERAnHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8699

Hi Marc,

On 30/06/2026 11:54, Marc Zyngier wrote:

...

>> Sorry for the delay. I gave this a test because I observed the warning
>> that was added on the Tegra194 and Tegra234 platforms. This change
>> fixes the warning for Tegra234, but on Tegra194 the platforms I tested
>> hang on boot. It appears to be similar to the issue that Marek saw on
>> his platforms and so I am wondering if Tegra194 also doesn't have this
>> wired up?
> 
> I think you are in a better position than me to find out. It also
> could be a firmware issue not making the PPI a Group-1 interrupt, and
> therefore not allow Linux to configure the interrupt.

Yes absolutely. I will see what I can find out.

>> Was there any resolution to the issue reported by Marek?
>>
>> FYI, the Tegra194 SoC has the 'NVIDIA Carmel ARM v8.2' CPUs [0].
> 
> There is no resolution so far. Florian was going to check what the
> deal is with the Broadcom-related systems, but hasn't come back with
> an answer yet.
> 
> The possibilities are as follows:
> 
> - remove the interrupt for the EL2 virtual timer and live with the
>    warning
> 
> - add a patch such as [1], which should document the reason why this
>    is now working (and fallback to the EL2 physical timer)
> 
> I'm happy either way, as long as we know exactly what we are dealing
> with on each affected platform.

I would like to get the warning fixed for Tegra234. Do you want to split 
that part out of your patch and then I can test and we can at least fix 
for that device while I see whats up with Tegra194?

Jon

-- 
nvpublic

