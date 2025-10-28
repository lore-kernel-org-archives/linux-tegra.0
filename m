Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010000.outbound.protection.outlook.com [52.101.85.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8047A4315C;
	Tue, 28 Oct 2025 10:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761647548; cv=fail; b=GG6ysHz9bme98zcYugoxh8XpVts5kWf9s9MM07RzZ7WgZUXfYOVe9v8kryubAvgMUaHIsaPbjT3E7+4QiwP/FJ8eC8UG8RRkUpu72mCHzXeQirCDrEknlpNYdZMYxPHwECPtiXa1W7yobyMD+f67rW5B+8BOX+B/pcbfQfYaaFA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761647548; c=relaxed/simple;
	bh=yfWHmK/a9TBfJ/UyMzC1YVCSXsubr0tFemZbO0DEKB4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pTkpeBKFLrUZrvBrz3RFbO30fsG1y0O3evr9ZpFuwDRGscnQ2l9uQ8WlndJwSXQxiqipMzTZWwQOz2Ze+I2pk2i3yJx5AFyYHzgU1EE37YSFkPJeF/em1ISkiHq6pkHbYjiEvwIoqzuoWQG2eXNcglO72Q9BQBcTTI+Xa/uz//Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NlKNK0QE; arc=fail smtp.client-ip=52.101.85.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NlKNK0QE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AiPfBbOBWrjAk0rWFUTjsm4/AdqXPeySwfQNtwFQlrq2UN/4EY2wHyjn/WVZpqysITJJpBS5n6vryKR5PxhAnwn4UFwjFLGnF2MF9FLHmCykkdn+SwxMOjHNN3eXGpmwvt94imNUelKRyQHxcunN2BmVyUOufq7bB8CTdwcgSok9l6HySXaE3oNgxjqeoC4IZSZODD2sEwexX7Gco5q+b3Wkahcmk+TUjaYaEdWQADumVhUdM+jJAg2fwkUR4BcPwy6/Ld5fd/GH0ytrojkH/N8A5ulQVz+CQCC7jgCG+N2eMhglZPr1v6cinOm7rZwPfraEsPhd5KNtJI4KL0t/MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=phyecoy82qct9ZYFuZwxBieYlJtxjhYH81ovmQXxnbg=;
 b=MNfJLveMC5l6iXnpfJ9PLINbsVwTY2L9VcqYepvMgewUCeBCldacaQiUxgi0/xsk1CkKhh3YR1LPFiJRzOT6pTX1cWQBffFiRAvf80Qk+S0CxY52mBRetXmtGDkoYQq+rHC5Op5YurNdCGuhwNWJ/GOXxE/LekajD/Gyjjpz8u3nJXPNiFMWbHqpBWdguHOiSLvd304ppSMnOC5vlZqadbuU6l1sUKbz6RInBzTjns70bDbC17xwvX14f9ZxDzhbF+1uo6e3Z3pwZohiCsbr5irtLLC7Wn7tmP9tmGe2Xbat03GQs+1Cwz3jum6/PONn/pfOAcP99H/8EAYl3wktVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=phyecoy82qct9ZYFuZwxBieYlJtxjhYH81ovmQXxnbg=;
 b=NlKNK0QEkf2D2NSQOt/HLDYzFKDx8/lA4iXFIkCTGIFBp/ACC/KfzzH7R53WbT8CvgZUtqCNj5JZcjW9dV0UlD44urcjVzGb91edSgjDNDGNxd/nFGbAAsOs/PaI6xzGmZ5U4zRVemLBcGsvrk+TJq5+gbxoGUullXNidTPaYtwABfRgHQTsgYEPdXw/fgN7YyXXBQ4VL9zJQvluhETZhyIfa5zCI/7aBP6KzMyH9wAVVOAZEcL/X7/YUJCY4OFDIQ4ET4IKs9R6vjU+SwrqP/ozrWNne8jAbpYGkqaVkEiCyW9oVgYFpo7+Ezd7KUNGpvhPnZEbddGZNHdwKUXCXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by CY8PR12MB7490.namprd12.prod.outlook.com (2603:10b6:930:91::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Tue, 28 Oct
 2025 10:32:24 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 10:32:24 +0000
Message-ID: <0049bde1-15e2-4c33-8de9-49f3df0d7650@nvidia.com>
Date: Tue, 28 Oct 2025 10:32:18 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: tegra: Add reserved-memory node for P3450
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250803-p3450-mts-bug-v2-0-6307125408c3@gmail.com>
 <20250803-p3450-mts-bug-v2-1-6307125408c3@gmail.com>
 <8ed69b4c-f656-47fa-a247-1c8d94dcc35d@nvidia.com>
 <CALHNRZ86NjcNJhRJd+jtD_7fRTFJ2szPFAAN3HSad_xwnVrHWQ@mail.gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <CALHNRZ86NjcNJhRJd+jtD_7fRTFJ2szPFAAN3HSad_xwnVrHWQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0084.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::17) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|CY8PR12MB7490:EE_
X-MS-Office365-Filtering-Correlation-Id: f2ceca33-f41e-42d3-0b3f-08de160d486c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b3lURFNjQzBiK3ZMc3ZpYnFxcWV5R3ZDS1BVWDhTaDJnVGovbVg4am16YXlr?=
 =?utf-8?B?R3dYemU0TGVOOW9GZXZ2N1MrVkpBUmY3NXVpZWxkRTU5Y3FnVzE4TUNMUk1C?=
 =?utf-8?B?enlSeThKeXArK3NlS0pzYmJzUkliWS9yMHpQMUdmNGwvS2dPT01oazBoVEFw?=
 =?utf-8?B?LzlwKzZtTWJ2a0g4T1Z2SGtYWXh0c09qT0JOR0xGQkt6SUNlc00yWUpUTlh4?=
 =?utf-8?B?KzEvaEN1Q1UzOURzUEJTTkc2ZkgwSzhua1lXR0VCRkRzZjhtMmNpYzhrcisr?=
 =?utf-8?B?RmhaMW9nTWJZdWJGS05tTG8rUGJtajczbG16TW95S1RCSG91MkovbGt3Tk0y?=
 =?utf-8?B?VEVadG5JcFk5Z0pXS01TeERWWnRTRzlpSlJQa1dScjNwSlh2MDdzNTNKNXhI?=
 =?utf-8?B?Ni9aZUpRMkZyR3ZlbFAvNTZmbzhybnZPWVZtcVc5SlprVDgvaGlydGx4V01U?=
 =?utf-8?B?NGpzWVRyNEo1dnR4aHB3MTlkRVlKSkxQazQrWXY1cXlXakk5RVlUNlVRWjF2?=
 =?utf-8?B?TVc2NkhjV1lyL0FzZUpkQVdtdGNLcFVJVUQwVFk3Umcwc3A1L3cwb215dWlZ?=
 =?utf-8?B?QjNPVEsvUmFtcWhVU3RIRHVBTGpYVTk3YnRWNUo5UEtCeE1YRDBoODgvdzVh?=
 =?utf-8?B?bVRvNTgvZHpiZDJIb1gydGVXRDdlTDRNajFnS3hRbXlQVWxkM2dMbmozdDdS?=
 =?utf-8?B?RWtTTFBHenFTUXc5NEhRb21RZWl5Y3FlNW5wME1JbjY2VmlMWUtXYmxTblRq?=
 =?utf-8?B?bUVac1k0SHNvdTJoVTRsVUVyQktCTUJWcFIyUGJIR3REL0pIVHJsTmR3MER4?=
 =?utf-8?B?MGlackhaSDUzRi9IVVpTcW5IUi9BVHRQMks5UkJtSzNJbVM0RmhFTGp0dDRD?=
 =?utf-8?B?OHFqSTV4KzRhdDV4R052anppQlRpTVgvWDUra3h2MDh5OTdBZW1LNjFoNmVz?=
 =?utf-8?B?UVgxRVBFZjlOTGpCSDdneG9JREdyZkRNaE5VNHhHZnBUV2lUejdLOWEvL2dV?=
 =?utf-8?B?N2JHbkR2NGMvOUZlcHRERjFvd2FTTEpOQldTMzhmRWVFZXdzekNJTzdQVytv?=
 =?utf-8?B?d0lNYkRRV3p2cmxueDVrRFBPNE1EZW5nRzNtazh0ZFo4MEZ5MXNBSWRkN1Qw?=
 =?utf-8?B?Uy9vSFZMdEFBWGF2TVU1M0VHMU8yV1NtNzVwNmJaNVRPdkNHUVQrN1VOUE8y?=
 =?utf-8?B?ZEh4bk5IbzU3VW5LYzArVXRnK09Yd0IzeEdkRzJhZ1ZCVmsrYzBQejNNUWtD?=
 =?utf-8?B?VTk0VS9lOWVPRi9WM1lwcEY5WGZXN00yQ3BadE0yVjhIRnNwQXpSdDVNU2VI?=
 =?utf-8?B?UDBteVp4dkhGSmttTStLMTVRUzVmNHo1V3l0WDA1YkM4cGVONlU3cUFTaGxu?=
 =?utf-8?B?RlpjOXlUOGV6RXlVNkFxd3V5VC9YUEJqQktFY2hOR0tyazJxaXpPT2h2UnhB?=
 =?utf-8?B?NEJ6cEt3S0RxcFBhZEM5VkJ0Z1ZYN3BsMkFEUUQ2RXBLaWZLbmZJQkxMQi91?=
 =?utf-8?B?OVFLWWdxOGlBalp0TVRKdWpsMml5Yzc5enAxSXZHWkxyTG8vT0hEK25NR3JL?=
 =?utf-8?B?TFZ4Q2doRVZCdmNkMERBNFA2VU82Y1lUdHVUVUQ5K0gvUUNZYzVrMVNJQTFy?=
 =?utf-8?B?MEgyUGVWZkZOOFpzSk1pN0R2cU93TGtrUnBlMWRQNkNWc1JqVlBvbzBKNzhN?=
 =?utf-8?B?Q1l3VE53UzFUS3Q4OVVtK1F2QnVITzN0Z3kreXlNKzY4a3FWS3FCNytCRDNM?=
 =?utf-8?B?MG05d21QREFNOEVIUDE5VUJvSGlhVHo4UlBWRzMwTU5rSENGUkNDbnA5MkZr?=
 =?utf-8?B?RzFNdXRSeUJMalQvazZ3dnZ4U01QK2wyUFdncTZoNmpSeVFFV3hDTmhIcy9D?=
 =?utf-8?B?VTBORU1mNHJGTFhqcy9hQnI2TmxSQTNmazlpTmlYUVoxWW56ZlJCOHg2UDRZ?=
 =?utf-8?Q?oSqHgUfLcmITCAHAty+DAY+sQHT0LAJw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXBQcEZQTHdtZzZ3SkgyMFhkaDYxc1I4ZkxvZDJ4aXk1T2lvby9uVTVkNUVB?=
 =?utf-8?B?UTZhUDM3ZXlJRmRjQzNwazlVMXhFRkwvY2ZtcitWVHJYWGtQVzgwY2FMM3lX?=
 =?utf-8?B?aGZTM2c3bXVrbGFpSXVkTXR3Wis0OGEzY1FQR0lOY081OG9YN05PVXB0b3Jk?=
 =?utf-8?B?bVA5MStYK0NWOTU1U2xnY0RQTi9DbGM2ZU9SQzl0STFJWTRhVnJlQTZhVzFm?=
 =?utf-8?B?VlEwS1VFUlNEZGtMdVNlNTJXVGd3a1ZPK0NGdWgrNy9MVjhNTllnTTRlelNB?=
 =?utf-8?B?WURxRDN0dWREc0k3d2pDV3IvTnFwM0xqWk1uNTE3Tkxqa2kwTG9kMVpWdHpZ?=
 =?utf-8?B?OEV2d1RZVTVoY0Y3eGFZdTloV1VJcmNJQ2FWSzFxb2I4V20yWGRvdnhUckhl?=
 =?utf-8?B?dHZkQldpY2I3ZFNDMmlQZGJUbTEvUTVaTzVFSXYzcVZyc0ZNQmNYbndkZEJv?=
 =?utf-8?B?L1lqZGhGZjA5dkVVbzJDODBVOUpxY3A3Z1YycVlFR2dpVDlLSHk2aXhhaCti?=
 =?utf-8?B?bDdhcXNHQ1huV0hHU0ZUMjRhNTdUVVBGODdKUGlJS05tTnVhbnFYczZyOW82?=
 =?utf-8?B?a0hrenh3SWNnKzRxWWZkZkdYMVEyOWY4cTZoeDR3NlhlaEFicnJzQ3N6WVJI?=
 =?utf-8?B?NnNQb1cvcHZlSWg2cnExVFZ4WXNMNHpGVnUvTm5RZ2ZGWDQ5SlRvY3Q4OVRS?=
 =?utf-8?B?dkpTcUQ0N1BKcWlTb0ZLNW1yRVFPM0pKTFlnQW1wVVJNNlIzd1ZMVFI5VXhl?=
 =?utf-8?B?amhiTkQ3NkVHUjMrdVFVaUlPT2JTNVlNZzk1NmNvV1F4NjVYZkt2T3VNRE1N?=
 =?utf-8?B?c1I0MnJTWDZrKzUyZGpNN1dKL1BxRWppdHhzbWhaQWpwSmdaSTJWNzRieFh5?=
 =?utf-8?B?SDJqTkVnRmFwQnJkYzZQOVNpUFNwOHJYY2VRME5nandmWElpYkpsUWF6NXY5?=
 =?utf-8?B?R2huZ3U4SkFyaDRMc2t4MEJYM2pDdkg1L1NaZEdFTDBRT0xPTExoOTVSVVVh?=
 =?utf-8?B?b2h4b2lvRUhPZFAzVFRQSkdpWWdzTEc2YTFEQ2wwQ0MvVTNQaWZqUXpNNlNh?=
 =?utf-8?B?V2kvc1VCY1BacVJaL3RjSlBBL1NLWWJxQzNwMS9VSEFhM0s2QU1XejdUTHpX?=
 =?utf-8?B?Q2lCQ003M3B6LzJRWVJCSG5ySWZWais5RmpWTUI4WFV3RWQ4VkN4UWVXK1V2?=
 =?utf-8?B?MUFUQURuVCtCVWhGZFhaVVJqcUMzTnA3UDVRMysxTUZWcDZ1eVEvb2lDcUM3?=
 =?utf-8?B?elBiYTdDRFdSKytiTEdMb3VodWVDdmNTZmdqdlJQSW9UL3dTaXFjTXd3MDRM?=
 =?utf-8?B?ZXRLNnhqbW9Vd0U2UU94SGY4SFF2d1JPZE9wZmFROEw5aTc1TVg4djlzT083?=
 =?utf-8?B?Y0w1UG9Rc013QzN2bXVXcERZcXArRU5IQ0MwaTNXYmIyRkN3MWhwUExiT1Nk?=
 =?utf-8?B?MEJIY1VYWk1iZUhzeGdQdHVrK2VzUXRpUmVhMWlTODFMdjVPZm9CRDVpRk9I?=
 =?utf-8?B?V1Y5ZURsdlpRck1UdlVvQzVTNDh1WE5sU2RIR0h1YVM5WjdLejI4dkp5WnpJ?=
 =?utf-8?B?clVTVHdpMHF0OVBxZHcwN0ZwNnoyd1BTeFlkQUE4VDNGUXVVUW1VUHBkZDBl?=
 =?utf-8?B?cW02WUhHeDNnazI3ZGswTnBXVjl6OVZxV2R6SVI4K0VCN0JVWCt1Y1dPWGh1?=
 =?utf-8?B?VTgzU3llUFJZK1J3UElIYWRKL3l4MmFSRVhDSmlBMUVyZnBSQ2VnUzEwSm83?=
 =?utf-8?B?NkxxUStsNXQ3VVZWcTh1N0RBbUdTRXJPNVVMeVY0bXJPVWJiV21MS2t4Tks2?=
 =?utf-8?B?elRtVFNvWVlaMkJka1BMeTEvWjJLMGlsUjR3NHlaOTlIQ2QrYXhXSloxejc3?=
 =?utf-8?B?ajBMajhETWVvWHZLQVEvTVQ0QlhwRVYxUm42eVc0OFQwdHlmcmlocjMzNGNv?=
 =?utf-8?B?L3hLRTdORnV2akhQdjh5SGY3dXJrY0d6aEJFb09tRnNDcDFnREs0eWRqWEVn?=
 =?utf-8?B?MFJRWUVrOXhUNG5ON1FrQ0w1UUgzSzcxVUpuRlNvUTNUUTJEMGN2UENnc0Ir?=
 =?utf-8?B?UEhTRDlUbGVoenplTlJQeVVCc205em9FdGZUc3ZaUmoyTXU2eDlvKzB0NjFI?=
 =?utf-8?B?OGRkNjU5SzNhSGM1V1l0c1lyVm05VDJYOEFOUitNVG0yZ2F6Mldyb0s0NUJP?=
 =?utf-8?B?VHc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2ceca33-f41e-42d3-0b3f-08de160d486c
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 10:32:23.9852
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KheSq3GpGDF/3+R/iS4edFCkyVdy5OqzO4K4l6FlAMGeM0mr61wUp8tcxTIIm9SvGgNl2N5rpB+yl1eqMeXBYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7490


On 24/10/2025 18:46, Aaron Kling wrote:
> On Fri, Oct 24, 2025 at 11:16 AM Jon Hunter <jonathanh@nvidia.com> wrote:
>>
>>
>> On 04/08/2025 04:14, Aaron Kling via B4 Relay wrote:
>>> From: Aaron Kling <webgeek1234@gmail.com>
>>>
>>> The Tegra210 L4T bootloader ram training will corrupt the in-ram kernel
>>> dt if no reserved-memory node exists. This prevents said bootloader from
>>> being able to boot a kernel without this node, unless a chainloaded
>>> bootloader loads the dt. Add the node to eliminate the requirement for
>>> extra boot stages.
>>
>> I test this platform and don't see any problems. I assume that this
>> would prevent the board from booting.
>>
>> What bootloader are you using? Is this from a particular L4T release?
> 
> Please see the longer description of my setup on the revision v1 patch
> here [0]. I am specifically using the cboot prebuilt from L4T r32.6.1
> as it is the last version to support usb input in the fastboot menu
> [1]. The rest of the boot stack is from L4T r32.7.6. The partition
> layout xml is here [2], which requires setting odmdata bit 11 to allow
> reading bootloader partitions off the sdcard. There is no u-boot
> involved, only cboot.
> 
> I've had another report of the same issue, on a pure L4T r32.7.6 boot
> stack as well. The Nvidia downstream u-boot won't copy
> external-memory-controller nodes, namely the memory-region ones, from
> the cboot dtb to the kernel dtb unless the phandles match. Nv-tegra
> gitles isn't working right now, so I can't link directly, but on
> branch l4t/l4t-r32.7.6-v2020.04, file arch/arm/mach-tegra/dt-edit.c,
> see line 31. Which means that such only works if u-boot destination
> FDT is the downstream dtb. Using a mainline dtb causes the
> memory-region dt tables to not be available, thus the emc kernel
> driver fails to probe and emc clock stays stuck at 204MHz on
> p3450/p3541. Hence the user from the report trying to cut u-boot out
> of the mix in order to get emc scaling. And then hit this issue.
> 
> You were able to boot with a mainline dtb on the DTB partition and a
> kernel on LNX, without u-boot and without this change? I have not been
> able to do this. The boot flow will get past nvtboot_cpu, but falls
> apart inside cboot due to the corrupted in-ram dtb, never getting to
> kernel logs.

Yes, I am using r32.5.1 currently (which was probably what was available 
at the time I enabled testing). But with this I am able to boot an 
upstream DTB with the upstream kernel using cboot (no u-boot). However, 
please note that I don't use the upstream DTB for the bootloaders (MB1, 
MB2, cboot, etc). I specify the kernel DTB in the 
/boot/extlinux/extlinux.conf file so only the kernel uses this.

Jon

-- 
nvpublic

