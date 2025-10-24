Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010006.outbound.protection.outlook.com [52.101.201.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48A6246BA4;
	Fri, 24 Oct 2025 16:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761322632; cv=fail; b=AzY14wDJHVLnvazCIiBUluzXozCPLHgbiqJ8wLJbXYerv+94dp9p/QZztVuPcYAiHKEtoGfPLjD6rhRftSxoNLc3KMMNquF+kkdQ3HY3UdXS1LM4+S8vs9Mk3/o9q9lslx8hjEvhMnksBGOTk/iuND5wRbHMyMSsF+Y5p2m7kOQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761322632; c=relaxed/simple;
	bh=S8hAQs/ToHVcqNnZerfDLmUrNukEVSIdGr7NzHMloPA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tso2BZwEXp4orAHNx4vTX+3AyLgmQ50kwR7l8KYeQET9eAEX08IlHKBW9Ln7GPfjH1XcS5zfqJTb1AbFW4Rkkvji9ehslPoxAgfLPQPlmR7kpp99auSOqrSMzrv/7ZboIMAxc329UwVRvLLdCbWY0rXY0ptHcdGArw0NEiJLa2U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=t7E/lI/h; arc=fail smtp.client-ip=52.101.201.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="t7E/lI/h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u47Yfhmzbc/fLQKR0i8uN0d2AzxuvibM9Xuh96V0Ln29R/3ML7SNAzoE48xgpcgHcYOvdfdpEkvalDFSnG1eCNq8XnfdgfPJZ6NuCjhePTfEiIWqH/aGXUm7/RamcUQmAeLvwv3v+Ym0lA5SwOpE2La8q1UKUvzdUCnJFJk+OQ3wjvbzi78ixaZKNSu1CWUgL1MWXFyniWqMteLlBd1z9G5drMotkIDDgR2e4f9HyI9QokaHgiv/ocvxE9dCrpjsZbIEA7OiRzGYUnpEadvvfQ71IwckWel+CAG4KUiVLyx1mr1Lujn1N/G5Ye3RS63FzxdKKC9QBUqFSMtjUC3trQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h+J+aUg8ipJassEnH2NFsXLoOiVAi5XXzPwUQX3BuvQ=;
 b=qswkiWhhwX9bc/vNbx85XMngNWOxeB9lQuD8la3xuJj3jjwHtcsmkVstLtVoxqiPEE8VELtj69ud5a8+1ewVFHgjY3VIaT9ws5yjDRMp2o/gL1+Ci2p/42AruEdNXTbo5xF7ZAfmbuqbVVvX4l9mVAirWB8eLL4rfmYJkYhwpW/t9/PnqK+tVt890DPx7Zm10mW64wNYAZgvDhre8NXzr8F4lEHRFaq1OWL0MPQoCv5zAuNK/Y7Di1OAcOA9k5vXSzV6iBZYN8uFc7kBAM6HDZVZA+cLTaavc7DFfE0lYbRnmfTfrSqexEpIHuygMla0k84zshGDfvWCWnxPrH80hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h+J+aUg8ipJassEnH2NFsXLoOiVAi5XXzPwUQX3BuvQ=;
 b=t7E/lI/hvK+K+5Bnzht8/I+TJIYPcINCybVU4KjcAWqeCyjyOC/Q4e5laISHWvkZsbyFYnibyRarNyjYbUmGa+5+ydJR4zLPIhnQrPBW7yBVpZQYdODqXHfMFn3DpkbfFI3EYQa3H2kxxuHCacZ861c9km3CsCj7kuRZQSITOoGB/nMGjCk4GeWi/XKrnc7xdeUygghESMctcZSkZQ5Vqn4WhW/jzegG4Ajx3pLPWTtvEtQTFFyQtZytEEWyNqvHhf3FHpmBBvivrVC4ikveW2ahMgF1FXTEZTUPzFP7YOLmHYZPGpQFZv9sNrUHTe/I4t2S/c6ihrrlbrCYwd5rMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by SA3PR12MB9198.namprd12.prod.outlook.com (2603:10b6:806:39f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 16:17:07 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 16:17:07 +0000
Message-ID: <b31b45f1-4ef9-46b4-8b8b-bbfdfbfa3cf5@nvidia.com>
Date: Fri, 24 Oct 2025 17:17:02 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: tegra: Add reserved-memory node for P2180
To: webgeek1234@gmail.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250803-p3450-mts-bug-v2-0-6307125408c3@gmail.com>
 <20250803-p3450-mts-bug-v2-2-6307125408c3@gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20250803-p3450-mts-bug-v2-2-6307125408c3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0447.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::27) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|SA3PR12MB9198:EE_
X-MS-Office365-Filtering-Correlation-Id: 75adab31-cfd9-408b-ba9f-08de1318c6ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cGE5NWtJRTQwUThtQWdxUVVDOVRWWmlJd3dSRUs4bkY1RHBxenlRRkJHa1do?=
 =?utf-8?B?ZEE3b3lUSFBCcjQ0dGNEMURHOTU4eHFlUk9lenJ2OG9FeUxRbTVwMlhnT3dN?=
 =?utf-8?B?ZnlVNW9nbHlyb1QzM3BHYlFkSWVTSDRkSUpXUFIwL3RUMVN1UUcwbHZjaEp3?=
 =?utf-8?B?RlJqZGVxQ3NQdEdLbjdXRDFRb0k0ZjVUWmxVTFVOQnA1d1pmTkZqQWtaRTFr?=
 =?utf-8?B?aG11Wjd1dkxRNUN5NGhMUWV3QTcrV2J6Z3hnUFpUSFhLMnFUbkl5a05yWlYw?=
 =?utf-8?B?Wm9vTlZnS3FIQ0dJdkVudVovTXV6YTE3TjFNb1IvRXhGOVNoWWRmK0NaZzhI?=
 =?utf-8?B?MlFyYTN6TzkyNDRQcG1rMUJGVndsQ3czazlKSVY5RXZQYTJlZVFLUERDQ0ty?=
 =?utf-8?B?VjF5dnpPSmlBWGVZMUE3SGFyUnJ4b2NnUjBXYllXZHBHMUN2VE5BWjVUT2VN?=
 =?utf-8?B?Y3piVTVYVm4xbzNmMWY5RnJzL3REV0N6c2NrZG1odGFmd1ZnaVNDNWlHbXpM?=
 =?utf-8?B?Q1pyY2k4d1Q3aDZuUmZJVkdZOU5NMWJYL0NHY1lyY1NoSE1UWUdCc2dqdHN3?=
 =?utf-8?B?OElvUlg4S1JURlZ4VVkyT0EvVVFreUZSUjJlUENsTFRoWExnbDJad0ZwbHpW?=
 =?utf-8?B?ODdTdDlFZnlMQnlBMmhnMHRaMGFLUWdTeUJPYzJtOHl5OXpZL2NMT3puV2lH?=
 =?utf-8?B?TWQ0aXJpUGlxTkkzNlVhcnpaTHpha1VDM1JEMG5ob1lsQys3THpzQWhkZGVM?=
 =?utf-8?B?UThpY2tCUzRrL1NOa2VYYTkvL1BrYVNicHZjZG44cEtqMXFoYXlicFN6Mmh0?=
 =?utf-8?B?YThQdGx4ZTVCV3ZDbzUvUS9DVXVDWkl5dGVONU5TblpGWk1rMzEzUkwvaWNt?=
 =?utf-8?B?OHFkME43YytSWWdMTFZsRXFhZy9yS0NPSmlaSkNVKzZhTXJ0NSsyOEpIZU13?=
 =?utf-8?B?Q09acHJsMEZaVjFmQXdJOTRHNjNoWlpyT1JLL1R3WitRT2t4UkhvaUhFMXpG?=
 =?utf-8?B?L0lzZ0dwazM5OFpLWjArWi93MXBoQWVPOGRiZ1dNcTRuVnQzMVgrY1pBeER6?=
 =?utf-8?B?VUVzZ1h4V2d1cVRNZkI4amN6SjRDVXhRUks2VWJFTVV3K0VDSnpuY0hjUXdT?=
 =?utf-8?B?aWNOdmpEUEdiMkVtckFDc2lEWW1HL29GUnlMajF1WDBUbjFET21vM3BOSHht?=
 =?utf-8?B?ak8rd2NnVzdCQUNvMEdpRlVvSWswZGdraWFnb3NxZUZzYnpyRXJ4a1RveWJD?=
 =?utf-8?B?M1ZyTDdvSFRHL2NrUndoWU5PbzNPbFNUekloZUE2Q1YyeTBMRFhrMVBSYnNS?=
 =?utf-8?B?bUFTTCs3aUx5YlNwYllZTnpOeGdqZ25hYnRodGJmZVErNGw5VVNMYTQ0ZjR6?=
 =?utf-8?B?ZWhLdkY4MVBNejlwczJLejFubDNzQ2xQdk1WMkRMdFJJOTdUclZxTXB5SVYw?=
 =?utf-8?B?OGN6ZS94RnZTbHdXME15WkhpK1M1VUVYbzRYclpvVTY5NFNNUkVscjhHKzBa?=
 =?utf-8?B?WnY3bUh0NnFIMG5GSjdhVU9sdEpSdjFKeG1xaHdBdVJvYTVxeE11OHpZVUxp?=
 =?utf-8?B?YWk5eTZEcEpWckxWdFMyZFRZTENjRjJja1VFWDVKbGs5K3ZUKzR3bFhrV0Fl?=
 =?utf-8?B?cjNKeDhOV29CQmkyTDFEQWpZZnE3aE9IZk9OUHpFSzhpYXF3UzV1Ym9CNVhr?=
 =?utf-8?B?bGpkK3czc3RFMHpOWE05L1l6aExNdlZZNXVHZCtwSnA2WEpsL0ZCVmxZaitp?=
 =?utf-8?B?cTFvR01FQzQvazhPcVFUYWpVUVFhNGJXYmJ5NDhtN3FZMysvcFpEdVFtcW1z?=
 =?utf-8?B?UllKOUQ3VWtyczhnRWx3YUE0Ui9jcUc1UC9TdDE5Lzh6Z0NNNkQrTEJnOXhm?=
 =?utf-8?B?NEZWUUVLU2YyR0lXQ1ZudW4xaEN0Rkt1cE1wVnRYWXdGN2dJajZzbzVlQmhD?=
 =?utf-8?Q?0WkL3yhGxsS6eirxRpyy4eMHgfwo0hNc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWp4YTZqdktldU9nUmh3THYzTlBZRHFmTUQweXh6dTFjWmFrNnZubzFBNTdR?=
 =?utf-8?B?TUhZSGEyM3MreUVMb203S0Fid0oxby9lQ0lETnNUZ25nUEpyelhLMEtML2N4?=
 =?utf-8?B?ZUtwV2JVTTFpUkxnWFhBaFRHTmIrVDAxdlQrVkJyQWgrMlhNSFFwSHFtWXNM?=
 =?utf-8?B?T3FUY0VLcUZTdHdjenVMM3lHUTZuc1ZzTzRVa3pacjY4VjBuUlNzSnhtSGp6?=
 =?utf-8?B?L0YzazFCeFU5dmR4bERiZUk2ME5XT3dLeERyWWpmbDU3ZGpCTnZLaXA1R2FE?=
 =?utf-8?B?a3B4N0FDSktkYmt4Tm5nWXZMVVQ5d3dwUi9rU1pnY01XMDNYaXk1WFdZblY2?=
 =?utf-8?B?cEJzMnYzbi9sd0RHVFJLQ3BMb1E5dFJ0Z3B5ZWh4S3lyMWlrKzVxOHVSZWV3?=
 =?utf-8?B?NmRLUHMxMEtGMUsvNVk0NVZhcFJkSTIwc0FSc3N1cUo2a3NocE5mSDdDRXpa?=
 =?utf-8?B?MERPT2J3WXRlUWxxTk1vbUgxMVBzb1A4RllJSzA3UXdQWjRlZ25HOFB1NDgr?=
 =?utf-8?B?cVJ1aXZMY29GdXo1QVFtck1ncnVMb2VOMWlBaFJVQ1Jub0ZDNDM2cUVRemJH?=
 =?utf-8?B?dDlidWNkV2ZuV2k1KzREWDhmSWFDeHYySzd1MXVVQnp6OE12Q00yL3Y1d1Jm?=
 =?utf-8?B?TERNMHhTTU5nbENPczZBSFhzenVqT2hZalFIUER3eUNGNlJWM241c0FqWUxo?=
 =?utf-8?B?NWpSNmpGd0xsbGdsYVpwMUdOL3pKQ3d6QS8rbGVBbGp1NVp2U2RpaE5ZdmpI?=
 =?utf-8?B?UVhRcGpYaUdpbTBLVDVHelgrUi9EQms0Uyttbisvbm04eWFSbk5CSHFiRmo4?=
 =?utf-8?B?L0ZhNlpWT2wxTm1KWnlsV1hCeWpIUGdVZDhnUjIrOTBvRDVJZjkxay8wK3lX?=
 =?utf-8?B?Q29qTFJRSU9HNHhnOFhvWEdxOVltb2RKUVVFd3F3eDYxaERWcGJncUdRS3pw?=
 =?utf-8?B?THR6OHBRZGRNaS9NRTR3dFN1RkxPV2ZXNGhlY1l3MFJOdG9MeWFFTi81d2FN?=
 =?utf-8?B?NU9RWTZXcjNORFlWWExjMU5QcG5OZWtLYmo3RFdQa2VSWWNmekVJQUk1SWtr?=
 =?utf-8?B?YmxkTVJNZUgzMEw5OTdYTGJqZXd3dUsyYkxKYm9zTmhhVlFOenVRenZlT1Bo?=
 =?utf-8?B?c0x0UDNDb0VrYi9BYzZUeTNma0hvZFM5ZmhWUFN3U2h1WWI1RlE3ZWdZN2lM?=
 =?utf-8?B?ZXZHek5NMFBwcXkxb0VVS1lRTk54OTFWY3BoaXl5dEQ4Y0toZkdwSUlWZUsr?=
 =?utf-8?B?SE5FcWlSZkllZGRpUUZWMkppVkZSOWFhSVk4Q0FhUW4yOXgwK1gwUWZCbG8z?=
 =?utf-8?B?ZXhGbmI0emJKdVBhZEZIYUprdUdtcmt5VHBYTUVMOGZDNFkzakhwRSt6NkVn?=
 =?utf-8?B?LzYzZDgreDNRMi9XQm50ZFhsWmYrRE1uZlZ5Vzh3VkhSZHdMUFpRdW5vL3Vq?=
 =?utf-8?B?QUo1NFU4Y3FsUHBQMGJlaUlaV1cxVm45bkd0WGV1VGh1M3lzeDR4RFdTWFhS?=
 =?utf-8?B?R3I2QjRvSzhBZ2V2NzI3dmdrVldPZ0xTWTlaeUFNMjlkWjFUV1BWWGIzNDBt?=
 =?utf-8?B?NEM1L3ZhYTYrMFE2K01reS9VR2dQNVhYeUwrZHVCb2RsYStybnZQMUxGSnFp?=
 =?utf-8?B?VWVvSi9EVFdVR0FQOS9XUVlqQk5xNmROdUl4bVU2MENLamc4R0JDQk5GcFkv?=
 =?utf-8?B?RVFzTUI1R3N3TjZkbHEwb1VRNW1HZGZDNDdSclNHQ250bktZay9MMEJhUWN1?=
 =?utf-8?B?djJpVlFKbGxwM0RrQU1WNm9vc3lpNk4yRTNBRHRFdUxpa2RxYkFWK2o4YllM?=
 =?utf-8?B?UHdsTC9EQjdheUpFbWxxbWNkY0VFNVg3RTkvb3ZrQlo0RmRPRjhZTGFHZ0pQ?=
 =?utf-8?B?VnNnMGJUWDRQTGFzeFpibUpxdkZSMGM3WTFlSDh0TGFqeS9pYm1qdzRjKzlq?=
 =?utf-8?B?MGpRbHlTYnNtZllGRlBXWHAxTHBTMXhXUCtuNFlIcGRiRjdXdXBaODh3QitZ?=
 =?utf-8?B?WWxzaGswZDJOK3QvK09JNzdDNzRGWkFsaC9ObFl1UWljQURnSFVRTGM0eG1S?=
 =?utf-8?B?OFdVeVlBcWlnRXdkSVZMbE5Kbk05R2hTVERlalZnRHNPNU9OYzlkbkprNXhR?=
 =?utf-8?B?RFFYdHlHNTRFQ2ltK3VRTzBQZE5nTEpCdXhkYVo1NFVFYWg3NXg3anNZdkw2?=
 =?utf-8?B?cVdVcm81bXY1S1M0WmpzMUNRS2g3UStDSDhyNW5JNTRDVHhZcHNGM3pXY0tp?=
 =?utf-8?B?UVVIbThtQWR4S2dVZWNMSitVeVB3PT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75adab31-cfd9-408b-ba9f-08de1318c6ab
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 16:17:06.9653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PrFFu3PDzCYdwpmiwaeTK9C+55OuH+nEFUgHpRHk1/nwHd66xEK7p5EV6LAz54MVXwBOAAle2rquXX62E8anuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9198



On 04/08/2025 04:14, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
> 
> The Tegra210 L4T bootloader ram training will corrupt the in-ram kernel
> dt if no reserved-memory node exists. This prevents said bootloader from
> being able to boot a kernel without this node, unless a chainloaded
> bootloader loads the dt. Add the node to eliminate the requirement for
> extra boot stages.

Same comment applies here as I mentioned on the previous patch.

Jon

-- 
nvpublic

