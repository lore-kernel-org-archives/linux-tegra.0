Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010028.outbound.protection.outlook.com [52.101.56.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74AD2FE050;
	Tue, 11 Nov 2025 11:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762859608; cv=fail; b=MnGElGw9WDl8xZ04O8+MOuwfQcHCcuAW44GpLpllo/5TwXY+0v32XhbmsrV5V2Pjv8W9wASoFcavsCz8b9ANpYhepq9aAUUASfaG/8LgMkUc1HoMXbnYnWHqtOZKrLGY033aVRR0Zp/ea9h72zf6O589bFpUaApANySDrcLsolY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762859608; c=relaxed/simple;
	bh=my7WKsXVaPEjqY4vVr0KJr7CYaY1xfGoa2tRQzOdFvc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aQklwk3rN5mV1eKeZsCXTiKiooxiKCelK5gR+z+KL/QqUrQR7q7R35R/FxU7iL0aL2bSa2DIcHjrsQUppYdNkPisqWKoZ86/tTxSS2zmf8vDfpx3EEYB3HPJr/s6zdSdweA0H7s7RZPiIQoJbeV65CHYpvMK/6AvmrJUHK/yKJM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Wi+ihWwF; arc=fail smtp.client-ip=52.101.56.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Wi+ihWwF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SIODqkhhgw6wdoDO+MEjPUS5EiNjyyrfML+JzPd9JxcCCZSxuZW3m+UyiJSQjVf2t9PA0ZULTtm5Nrie9HDAr9T/mLNMbyLk4jCJ1L+j9TASIf74R885ndFxa64Pfn5lj4Rxz+XM0WHRskn20AgQ10egq5JwuCKXJ58tlBXuGr4aZXdLaTf8luT3J+tk76b2ID5Klzr5/Rojnu1Sc7Cg86VxZDGWRrREUPaYsWc0VlaK/m5b0T5PrZxkdbDe4V+IvuqBhVlV/Y8gyA/Eliws/bbWGZg5nUXIECGo7HXUisDPT8OLIWBRBOjENEfcDpusYcJxnPBqY1/zW10pstZi9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UkkSMkWRGWpJ8h2FEf8qKzUimNZMeKPZ0WYH/QbBrsY=;
 b=K6SHllfa7KDZdX7xCbzK+2VvTLVwxClPB/2Vv33rb7fIlXEy2VxnACx+4LtEgnTCuPvJGvVNXtYve9oV90+8wcSuZ3FmROe8epZ0QmxBLvTmT//BHe/9+IC1XoXZBiCVqofGSNiMIyvgM5icRoCBriTzvsarMeDefuzwF1mVJK7GhTfB90t/ADjgsNwwn61j+vSWrdg8WlgNDLJgEfpDMeF9RVu4QaP7jZOaz3Kina9anxwv/OHVsOU4c1GtHyYkxr8xois0jmBqRyeh+cWN1eIMI8c5hUJqOOU3AWpAyGrvQQSw6aKuk9CBE26lRZVuo+kmcWYc5+8+0tZwoP4rkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UkkSMkWRGWpJ8h2FEf8qKzUimNZMeKPZ0WYH/QbBrsY=;
 b=Wi+ihWwF8XgkmyXxXUjy9yRnKPDJ1Wf9AKP0NTJfE2fDHOED9bMUB648pzFX7LyaZpwEB45uFWBmLe3C1WDDw24bS9QxEgtLyai/6XUZhpAYYEESOE1aM7i8G5U+fp9tC1DPXj8E0cVSdjJqu1yyrCKyqxnSLBYI3KMrIXhT3DxHC6kEST5YiT0SpRX87Se1Q8/5pFSuWtrI+g0/W/WnMMsKGs1cQlwatuekL23DPMDeALWnGfw53IKOBaXAyd3el1h3f+huUwQGlaoebOjStpO1hu3S+FeDf0kj1jhxdI0mZCFmrpkibnh2N0jo3gn/2jTTtdQoNWi+gc/XBKxgBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by MW4PR12MB7120.namprd12.prod.outlook.com (2603:10b6:303:222::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Tue, 11 Nov
 2025 11:13:22 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 11:13:22 +0000
Message-ID: <e6ce190e-6df7-4c36-abca-f09df3cc80e7@nvidia.com>
Date: Tue, 11 Nov 2025 11:13:17 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] memory: tegra186-emc: Support non-bpmp icc scaling
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20251027-tegra186-icc-p2-v4-0-e4e4f57e2103@gmail.com>
 <20251027-tegra186-icc-p2-v4-3-e4e4f57e2103@gmail.com>
 <82c8dda8-6fcb-48f9-bdaa-f3d1431e41ae@nvidia.com>
 <CALHNRZ8nCojreFCMXfbBBhWAMtmWN-04XtuW8fEsVD9bw+-AzA@mail.gmail.com>
 <CALHNRZ-CO5i9jeLkEG2cmHxcW1bcLhxcBSxjmL2euHfQy8yr-w@mail.gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <CALHNRZ-CO5i9jeLkEG2cmHxcW1bcLhxcBSxjmL2euHfQy8yr-w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0331.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::12) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|MW4PR12MB7120:EE_
X-MS-Office365-Filtering-Correlation-Id: 440318c0-466f-4df4-1727-08de21135398
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S205OE5qUDNNdnQ3VDV0TjR6SGVqdVBPTXk0SEV3Yy82ZWdRSCtKWDNUZkV6?=
 =?utf-8?B?SjlWTFU2SXRrTHlzSmR4TXZCekpkYVBzZVczd2ZyK25VZTlEeG5NdDZJTVkr?=
 =?utf-8?B?aXZHbWZpanhEZnpzYyt3MEkrL3p3WlFYQUxWejhhbklnZWtXSlM0Y2FyamZF?=
 =?utf-8?B?RGlIUUhvZ1hybnJscE5KZDdlL0JpNVVaWmxhVmhmWUlTdXpJOHBrSzRWalJt?=
 =?utf-8?B?ZWZsdVJwVDdwWlR2YmtNWVduazR3VXBheXlMUG84cm14QmZqNFYxRUVGMVE2?=
 =?utf-8?B?d3c2Qk5FSGhNbDlUN3BzWVlNU2NJNVlYUEYzM20xK29jYlZxb1hGQ1JTdHJI?=
 =?utf-8?B?dGpTSitzY1E5WFFHSDVIMzlkTmVPenZHeGFpZWV3bUZDZHF3NVNIV0lRckhS?=
 =?utf-8?B?NUFqSTA2MmpvckNwRjR0SEZpOGR2SXFmdXordXpnL2JWUkg4SnBQblpuUGh4?=
 =?utf-8?B?cnBaR3RpRDgxRG5ZV0RLVzhkVTFOWEJPdkNuRTlFNDFCUzIrOHJsWlQvWFYw?=
 =?utf-8?B?cUtXb2hDTVhNN2hKVy9HVUpQSGxlL2JtM0MwWG1jVkxWaUNOK0FXOEhWMWlV?=
 =?utf-8?B?OXF0TTlUVXlGcVg1ZEJoQ1JlVG1LQWVZaGpXZ0Y1NHVrTlpwQW5zMkFSMHh3?=
 =?utf-8?B?VXl1UER5MEo3M3JyekE3YUUvenlhRU93UFE5KzRBMTBiMnhicm82Q0dwZ3Vh?=
 =?utf-8?B?elBsMUkvUmR3eW5vNWFOdEVUUGlkNElmL3hXZnJkLzl5OGxnWmgyelA0STR6?=
 =?utf-8?B?Qy9IZlpRZkdOZURneUxQQ0k3V0lUeWFzU1UvczFacVp3ajZtSVFFNGY1NUZ2?=
 =?utf-8?B?MCtVSS9mWG1SS2JnSkFDaHVMb3ZKTTBEdkwxQnVmZ0NoWnVHSXA0SUlQQysx?=
 =?utf-8?B?OXAybVEwcFN0a1ZUcVV0UUhDbGJjNjB0bDRwdFVkckRidDFJVlRBSm4xSEFF?=
 =?utf-8?B?RHlNV0VZdHhhS0RWYXd4bGFhdm53U0U4M0ZBdGpVNVhpblpTaDNYc2JZcFNK?=
 =?utf-8?B?WThDcTZENUpwVG44Y0NJeU1UbE1jdEczWlllMDMxYnlpUWJWU2hNcW9QNkRU?=
 =?utf-8?B?K0VKWGp5Z3hLNWVlSzJXUmJMY2pxNTFZcVlaSm8wenJDNUFwV3VVOXVlK1VP?=
 =?utf-8?B?cXhkeXJQdGFmYjBMcmloNmxYWmdNaHlUR3ViZCtmYXdIelF3YnpaUW5WN0dH?=
 =?utf-8?B?YkhnMlJVNDlvS2d1RWRXSnhIY3Axc3JKbC8rMC9JWU02TzFPS3orMTlVRVZu?=
 =?utf-8?B?L1VIQzhtUzJDbUFybGRpSTM5R2R5eEhXSENOdlZnS1ZnWHU2OGJVMUJ6UHBy?=
 =?utf-8?B?L1RnQU9BdFp4VnFQMWUxdlVIQW1kS1IzbU9VbEVnNFJxdjFMd3FudDM2bHow?=
 =?utf-8?B?VjJteTdLRkhHWGFPdkQ3TWZmeFRQdk00NzJya0JtWGdhTjVxMDk4enROVFZW?=
 =?utf-8?B?a3lGY1pnMGMrRHZoSnZvd3kyNmwvVTcwaTlHaGRGZkxmVTRGRHZZb2I4aGpL?=
 =?utf-8?B?QXY5N2E0aUZVcEpVMmpBelZRQkpoN2Nwd2FlRXNLV0R2TDU4T0xpdFVwdnF0?=
 =?utf-8?B?eWVRbUgwd0JwUHdwSjdXZ2tEek0vd0lSUjBtZHB3bmY4Q3IrMUkxUnhHK0hw?=
 =?utf-8?B?T3dUOFR2RmFVSnlZWkJ2WmEvL3lWQ1NTRTFmWUFrWmFZaWFKZHlrNmhSOVZD?=
 =?utf-8?B?eEdWRUxhZkZJQ1AvM29oOU1PNW1xejFKcWdIbjN1UUUwZm5tYjZNTDI4TWRT?=
 =?utf-8?B?RFExeVJHSTZtQjB0RGNkRXZ1bFNLYXcxdGk3bUdFRGZuSU1QN0N5bFN3QTA5?=
 =?utf-8?B?NFJxcWoxdkhZTHhwbEV2bDlsSEEycE84Vmh3ZjhIQkZGMEFDRlN0RDJwekdS?=
 =?utf-8?B?Z2IyVFdpVlFkdERJSDNmaUZ0TGxJUFlXZis0UUwxNzZYdDJybjYzc1pwT24v?=
 =?utf-8?Q?4obGN22kTdfOuNJDWxD2dVh6QnMXPNZj?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?My80bml2Rm8weGVrOUZLY2JnUjh2WEpCVmhjRWsyZDRtSFZlTzNHZ1NQbzVG?=
 =?utf-8?B?TldLZXhVK2NQYmt2WElsUXhRSUJVcXlQV1VWeWlYZkErYXNMUGJhL0p3VGZx?=
 =?utf-8?B?N2cxd2hhL2RMY00zRHBhdy83MXRnV255aktpR0p1bTdtU2ZEUWNYSkh1aVJ4?=
 =?utf-8?B?aUQ4RjRtZHdLWDM2RHJRai8rZUx0TG9STXNBWnBhUXd2QnhIMFVoTWphbE5Q?=
 =?utf-8?B?STBZdjZTcnNIUWpGbGpuWUN3b1NPYkJzTXhNME1jbkk1djFPQnYrNkZ4UnFu?=
 =?utf-8?B?b1lDUWFLWXV4cG5QLzFRYndTZm4xN3FSR0FPODZmT2R1VSttb2VkT1g1emtW?=
 =?utf-8?B?TlpXeE5ENTNpU08wRmpOOUdrRUxxRk1UMmw4Qyt4Vm5ZRElVQkU1blVhU1F3?=
 =?utf-8?B?Ni9USTIrdnhpSzhUTFNLN05wZmJjVEVubitUcGNnTjNzTkF1emw1R3E2bGla?=
 =?utf-8?B?RVl4R0xQUjlaMC9SZVdHRThFMVJkdTU5eXFVMjdPck5QWlJ4N1pERXBFek5U?=
 =?utf-8?B?djBZVkJXTTV2ZkF5ZTM0R1FmOGRRcUo1NG5lVzFHM0oxRUNCUWltS2FsMWg2?=
 =?utf-8?B?VGZQN091YW03L3pOTlpCSm42dEozY29nbVFzQzVuaXVtQW5pNWhwK2RqYVdE?=
 =?utf-8?B?dEFnNTNRWVpocVBHbFY5MVVwOXV0czdHNEI5R1d5VE10SlNXdGRWZzN0aFBm?=
 =?utf-8?B?M3A0UVc1Y2pMeFNVNW5hajNGM3RBWkgrYmE3aXB3bDNncXRNL0Y2aGw1RDRn?=
 =?utf-8?B?Q0FJNE54NlZTTzdjR05Pa1pQem5IbFA5NEF0aWwyT1FITGZsZm13TlZKMlR1?=
 =?utf-8?B?a0hzNTErTzhlMThoWFFmSjN2SUh3V3hRaFoyN0diQ3BKQ091ODk2a2g1aXZk?=
 =?utf-8?B?ZTBBUGkyWjFMVE1xUXpjdURjOG9YNFJvWDlOUm9BbFA1UGRaZ3NkT3A4akhv?=
 =?utf-8?B?T3pwc0dYWUZUUGRFNnB5aVFBUytpVUk0STJENW9tTHBPY2dmK1lRb2kyYjNG?=
 =?utf-8?B?ZndNdWxiQ1V4QTVic1d6QTczTzA3TzY5dHE1ckNrTzRSSVNxMm0vZkU5YU1m?=
 =?utf-8?B?ejFZRWY0QThZK3RDRHpiZ1BjdkhkdGVFQW45dGZtWStjNXBhOTA2STBod2VX?=
 =?utf-8?B?SnBaVytOejJYUGhCTXhtclZNaWFRb0xLc2p1cEkzTlBLNDZUd3BHY3RTZDNo?=
 =?utf-8?B?RisrelV4a1ppbS9rclVoTUF2NVR0MG9tRDFCbnpVaTNoNkZ1MUszR2QvSnBT?=
 =?utf-8?B?K1JPeDNWOWMvVW92Q3BhSzhUcHE1eE1pWFQ0eGtNeVp4MUlpK0hVMnFXakQ1?=
 =?utf-8?B?eUJzYU9FS244aEp4RjVjbUcrSHpOL29yN2J1b2ZoVkdsYXkzbGVxWEFWb3Q3?=
 =?utf-8?B?MGZrK0Rqa01sam55TkdrOTBTZnN1K3oxRXgyZzhTSmNXcTJKZkJsT3hFeGJH?=
 =?utf-8?B?TFFKNkd0eGR0VG5nK0oxdmwyVzZGY0EyTTJOM0txemJ3U05CWHJ6NFdKdzJv?=
 =?utf-8?B?MFRNN0JnZ2tjN0pyTjdGSHI1UGJnYzZrT1hnUHg5ZXZrUHJ6aVlFTHpmajIw?=
 =?utf-8?B?emt6Vm45RG1EdmVzWDJrbjkyRTJtMUJCMDI0WVdTTWljeTVPNHFOY24vb1Zx?=
 =?utf-8?B?VXpDcVRHT3piUVpNMWlzSjBQZzBPT0RJN0lMdndodjBScVFxdG5qaml0MXJy?=
 =?utf-8?B?ZTFlVTZ1bzViZ1hXdDlIOXdhYyt6Y3EzQ2pyakZ4ZGtjNGxQSXNIb2tRR0p5?=
 =?utf-8?B?VTR4Q3YxenFXeGthUmlmWllERzVQSnFBNENyNytYZzBFZFJLUDhtS05FVWF2?=
 =?utf-8?B?Y29YcTVOZkQ2L0hoTzJQVmNnWGQ3VU8xc0Fka2ZhRFNaMWRzV2czY3hzV2s0?=
 =?utf-8?B?ZDU2ZTR4OThRdjVhZVZFZHVlVFlsL1owK3RQTjllZXNjZW9UcWxUNk5MWjla?=
 =?utf-8?B?ZGowOXFuMTcxTDZYTDU1cHh2T2svWjRETXhLSjNZV0l6NUhqNkpzZldMUnJT?=
 =?utf-8?B?NFlYanpzMWlJcHhvbjhMWG42R0JjdEFyUytXU040bE9LY0lFYkpUSXN3R0Vi?=
 =?utf-8?B?R004NTh2aGx4RnI1SE41MjNGVXJ4RUdhdVQ4a1hzOFB0UjE0WjViUnhGOStw?=
 =?utf-8?Q?rVwudeCR+zez392V7cYLKZ3Ht?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 440318c0-466f-4df4-1727-08de21135398
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 11:13:22.5645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /0DLtyzEwzhEuvHPHpOGSIaRUmzqGMy7uzweMrq1GFZNbBvLhBTLylmVgK6KB/yPKoHEhq+3BR1Bwym+i44fqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7120


On 11/11/2025 01:39, Aaron Kling wrote:
> On Mon, Nov 10, 2025 at 3:55 PM Aaron Kling <webgeek1234@gmail.com> wrote:
>>
>> On Mon, Nov 10, 2025 at 3:25 PM Jon Hunter <jonathanh@nvidia.com> wrote:
>>>
>>>
>>> On 27/10/2025 18:55, Aaron Kling via B4 Relay wrote:
>>>> From: Aaron Kling <webgeek1234@gmail.com>
>>>>
>>>> This adds support for dynamic frequency scaling of external memory on
>>>> devices with bpmp firmware that does not support bwmgr.
>>>>
>>>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
>>>> ---
>>>>    drivers/memory/tegra/tegra186-emc.c | 132 +++++++++++++++++++++++++++++++++++-
>>>>    1 file changed, 130 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/memory/tegra/tegra186-emc.c b/drivers/memory/tegra/tegra186-emc.c
>>>> index 9959ad5804b444b269456d1fbae87b4bc111661b..74be09968baa7a0fbdce4359f470ce56b18acb10 100644
>>>> --- a/drivers/memory/tegra/tegra186-emc.c
>>>> +++ b/drivers/memory/tegra/tegra186-emc.c
>>>> @@ -18,6 +18,17 @@ struct tegra186_emc_dvfs {
>>>>        unsigned long rate;
>>>>    };
>>>>
>>>> +enum emc_rate_request_type {
>>>> +     EMC_RATE_DEBUG,
>>>> +     EMC_RATE_ICC,
>>>> +     EMC_RATE_TYPE_MAX,
>>>> +};
>>>> +
>>>> +struct emc_rate_request {
>>>> +     unsigned long min_rate;
>>>> +     unsigned long max_rate;
>>>> +};
>>>> +
>>>>    struct tegra186_emc {
>>>>        struct tegra_bpmp *bpmp;
>>>>        struct device *dev;
>>>> @@ -33,8 +44,90 @@ struct tegra186_emc {
>>>>        } debugfs;
>>>>
>>>>        struct icc_provider provider;
>>>> +
>>>> +     /*
>>>> +      * There are multiple sources in the EMC driver which could request
>>>> +      * a min/max clock rate, these rates are contained in this array.
>>>> +      */
>>>> +     struct emc_rate_request requested_rate[EMC_RATE_TYPE_MAX];
>>>> +
>>>> +     /* protect shared rate-change code path */
>>>> +     struct mutex rate_lock;
>>>>    };
>>>>
>>>> +static void tegra186_emc_rate_requests_init(struct tegra186_emc *emc)
>>>> +{
>>>> +     unsigned int i;
>>>> +
>>>> +     for (i = 0; i < EMC_RATE_TYPE_MAX; i++) {
>>>> +             emc->requested_rate[i].min_rate = 0;
>>>> +             emc->requested_rate[i].max_rate = ULONG_MAX;
>>>> +     }
>>>> +}
>>>> +
>>>> +static int emc_request_rate(struct tegra186_emc *emc,
>>>> +                         unsigned long new_min_rate,
>>>> +                         unsigned long new_max_rate,
>>>> +                         enum emc_rate_request_type type)
>>>> +{
>>>> +     struct emc_rate_request *req = emc->requested_rate;
>>>> +     unsigned long min_rate = 0, max_rate = ULONG_MAX;
>>>> +     unsigned int i;
>>>> +     int err;
>>>> +
>>>> +     /* select minimum and maximum rates among the requested rates */
>>>> +     for (i = 0; i < EMC_RATE_TYPE_MAX; i++, req++) {
>>>> +             if (i == type) {
>>>> +                     min_rate = max(new_min_rate, min_rate);
>>>> +                     max_rate = min(new_max_rate, max_rate);
>>>> +             } else {
>>>> +                     min_rate = max(req->min_rate, min_rate);
>>>> +                     max_rate = min(req->max_rate, max_rate);
>>>> +             }
>>>> +     }
>>>> +
>>>> +     if (min_rate > max_rate) {
>>>> +             dev_err_ratelimited(emc->dev, "%s: type %u: out of range: %lu %lu\n",
>>>> +                                 __func__, type, min_rate, max_rate);
>>>> +             return -ERANGE;
>>>> +     }
>>>> +
>>>> +     err = clk_set_rate(emc->clk, min_rate);
>>>> +     if (err)
>>>> +             return err;
>>>> +
>>>> +     emc->requested_rate[type].min_rate = new_min_rate;
>>>> +     emc->requested_rate[type].max_rate = new_max_rate;
>>>> +
>>>> +     return 0;
>>>> +}
>>>> +
>>>> +static int emc_set_min_rate(struct tegra186_emc *emc, unsigned long rate,
>>>> +                         enum emc_rate_request_type type)
>>>> +{
>>>> +     struct emc_rate_request *req = &emc->requested_rate[type];
>>>> +     int ret;
>>>> +
>>>> +     mutex_lock(&emc->rate_lock);
>>>> +     ret = emc_request_rate(emc, rate, req->max_rate, type);
>>>> +     mutex_unlock(&emc->rate_lock);
>>>> +
>>>> +     return ret;
>>>> +}
>>>> +
>>>> +static int emc_set_max_rate(struct tegra186_emc *emc, unsigned long rate,
>>>> +                         enum emc_rate_request_type type)
>>>> +{
>>>> +     struct emc_rate_request *req = &emc->requested_rate[type];
>>>> +     int ret;
>>>> +
>>>> +     mutex_lock(&emc->rate_lock);
>>>> +     ret = emc_request_rate(emc, req->min_rate, rate, type);
>>>> +     mutex_unlock(&emc->rate_lock);
>>>> +
>>>> +     return ret;
>>>> +}
>>>> +
>>>>    /*
>>>>     * debugfs interface
>>>>     *
>>>> @@ -107,7 +200,7 @@ static int tegra186_emc_debug_min_rate_set(void *data, u64 rate)
>>>>        if (!tegra186_emc_validate_rate(emc, rate))
>>>>                return -EINVAL;
>>>>
>>>> -     err = clk_set_min_rate(emc->clk, rate);
>>>> +     err = emc_set_min_rate(emc, rate, EMC_RATE_DEBUG);
>>>>        if (err < 0)
>>>>                return err;
>>>>
>>>> @@ -137,7 +230,7 @@ static int tegra186_emc_debug_max_rate_set(void *data, u64 rate)
>>>>        if (!tegra186_emc_validate_rate(emc, rate))
>>>>                return -EINVAL;
>>>>
>>>> -     err = clk_set_max_rate(emc->clk, rate);
>>>> +     err = emc_set_max_rate(emc, rate, EMC_RATE_DEBUG);
>>>>        if (err < 0)
>>>>                return err;
>>>>
>>>> @@ -217,6 +310,12 @@ static int tegra186_emc_get_emc_dvfs_latency(struct tegra186_emc *emc)
>>>>        return 0;
>>>>    }
>>>>
>>>> +static inline struct tegra186_emc *
>>>> +to_tegra186_emc_provider(struct icc_provider *provider)
>>>> +{
>>>> +     return container_of(provider, struct tegra186_emc, provider);
>>>> +}
>>>> +
>>>>    /*
>>>>     * tegra186_emc_icc_set_bw() - Set BW api for EMC provider
>>>>     * @src: ICC node for External Memory Controller (EMC)
>>>> @@ -227,6 +326,33 @@ static int tegra186_emc_get_emc_dvfs_latency(struct tegra186_emc *emc)
>>>>     */
>>>>    static int tegra186_emc_icc_set_bw(struct icc_node *src, struct icc_node *dst)
>>>>    {
>>>> +     struct tegra186_emc *emc = to_tegra186_emc_provider(dst->provider);
>>>> +     struct tegra_mc *mc = dev_get_drvdata(emc->dev->parent);
>>>> +     unsigned long long peak_bw = icc_units_to_bps(dst->peak_bw);
>>>> +     unsigned long long avg_bw = icc_units_to_bps(dst->avg_bw);
>>>> +     unsigned long long rate = max(avg_bw, peak_bw);
>>>> +     const unsigned int ddr = 2;
>>>> +     int err;
>>>> +
>>>> +     /*
>>>> +      * Do nothing here if bwmgr is supported in BPMP-FW. BPMP-FW sets the final
>>>> +      * Freq based on the passed values.
>>>> +      */
>>>> +     if (mc->bwmgr_mrq_supported)
>>>> +             return 0;
>>>> +
>>>> +     /*
>>>> +      * Tegra186 EMC runs on a clock rate of SDRAM bus. This means that
>>>> +      * EMC clock rate is twice smaller than the peak data rate because
>>>> +      * data is sampled on both EMC clock edges.
>>>> +      */
>>>> +     do_div(rate, ddr);
>>>> +     rate = min_t(u64, rate, U32_MAX);
>>>> +
>>>> +     err = emc_set_min_rate(emc, rate, EMC_RATE_ICC);
>>>> +     if (err)
>>>> +             return err;
>>>> +
>>>>        return 0;
>>>>    }
>>>>
>>>> @@ -329,6 +455,8 @@ static int tegra186_emc_probe(struct platform_device *pdev)
>>>>        platform_set_drvdata(pdev, emc);
>>>>        emc->dev = &pdev->dev;
>>>>
>>>> +     tegra186_emc_rate_requests_init(emc);
>>>> +
>>>>        if (tegra_bpmp_mrq_is_supported(emc->bpmp, MRQ_EMC_DVFS_LATENCY)) {
>>>>                err = tegra186_emc_get_emc_dvfs_latency(emc);
>>>>                if (err)
>>>>
>>>
>>>
>>> FYI, this patch is causing a boot regression on Tegra194 devices. I
>>> noticed that tegra194-p2972-0000 and tegra194-p3509-0000+p3668-0000 are
>>> no longer booting and bisect is pointing to this. I will have a closer
>>> look and try to see why this is.
>>
>> Interesting. Both were booting for me during my verification, though
>> my use case involves the dt changes that I don't believe have been
>> picked up yet. Thought I had explicitly verified without the dt
>> changes too, though. Since I was asked to do so on this or one of the
>> other similar series. I will try to check linux-next as-is soon.
> 
> I just built next-20251110 using the standard arm64 defconfig and
> flashed the resulting Image and dtb's to p2972 and p3518 (p3509+p3668)
> and both booted to cli on a barebones busybox ramdisk. I do not see
> any errors from tegra-mc, and the only error I see from tegra186-emc
> is that it can't find the opp tables, which is expected without the dt
> changes, and is not fatal.

Thanks for testing. Something is not right because our boards are 
failing. So may be we are doing/testing something different. However, 
this should not break. So there is a problem here.

Jon

-- 
nvpublic

