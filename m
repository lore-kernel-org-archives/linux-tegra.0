Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012007.outbound.protection.outlook.com [52.101.43.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF9F1D514E;
	Fri, 24 Oct 2025 16:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761322588; cv=fail; b=UEEZsk+6X8a7O3+MiajQDFOTznsy1boeB7UO52+XTtOcE+qVwuLPjkMcJWWXZRAbZMPFmHuFEqUJ5sW4rwuyq8+tgIPilP53wfg4PRHqsW49vmzukRTqoU0xj8JGUf0e8yADGJoiCPA7VlEzCmGhl302JA8XxsU3Ti8m2VZnLPU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761322588; c=relaxed/simple;
	bh=h3iySMgVm942t+JLlIaPjBuIuI+CZSJRHVPTyQp0GPk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gSAcKc5WO2CsvVz5Kzao68VgQIGp0gj8Yaf699q6/iyyklWj3GVbdQrnxn471YlnA2FztPa5JwddctiDIx8F8wSwKiPIFJDjt5hBMI+f+VKFSQ0Zrw++hnZzDpYYf6AyhRzWPxaCo0ZcxUjlyqTAruUmNUNX8dRpzfJI2Rk1NZ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=G19NUe5m; arc=fail smtp.client-ip=52.101.43.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="G19NUe5m"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mZUnsMMHbpJhTvA1o80ZqnBRuK1FB5ZuGWHOIeH7k5S1F1fzUAr6Pr9kcmS7PrsSJ4xIzllgkaCROiZstGahv4W/RV9i2WMTBiYfjAKN8Ffj+6nUXXbB93yqkkMp04N8rR2iszPMxjC/XKLNmbPWZwH9CAu5FtiDhszluczJbJzneLB5538tKWWshXxmSVoNazs2fOmNMEvieXI8JN8c/p6dURHQIOVK5UyXMkH5JjyEky4hYKNgapCCUii2+69kmMCVN4SYftyjoNSTWURU2cN/GZbRK9UfSSkAyyt2e/OyJfglwbgiMPEs4V2wV+svBqLl47QS2LS4R8pRRw2OTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+5a72xe/JP3PYa8Dqt18SFpH6TyPNIKz69Smn3h83wA=;
 b=tXgMFO2TB4ing300HoJ/a+7/0dzcQHm5qZE66Z+kXDiN59n5oLkBhlrWZAo7d8IRB23s7ti24Y2dUf3qNJOm+8nCJyUyfUVzqpiZfUG57umkol2iQwzSPPkEeEiTU9kZadvcviVkIJ5c4EfA3BlZi3FLN23vDAGX9HoAsrxNmPGA3DNNA4AxDkDdGr9aaMWvkMbx1gaa6ajIC0Ufwh0joIZjUcnE/4U63TBeWk7daP+JHl8aGzSGSwAxDRy8GSIviUvlErjKAh5F0YQ6B9hWqR0qCfXqOc1fAcBs/O3uHB7rCpXqlhUShYU2HyzEXnH0iVBLDGsSwp4XGQ8cJ9CiWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+5a72xe/JP3PYa8Dqt18SFpH6TyPNIKz69Smn3h83wA=;
 b=G19NUe5mvDc6WzEtRSNesOmt/kYCpjfrnOCnardtiPlDa6NylT0jIIHKNwcGAUeOvUsktJu2X5kJOIiyVCBT0f5X3BuSPn8S0sjd1iYCnENNKt2TGM6gvRHp2/LizMF9caP6LUWk0tukEaOlRbayGmdAn2OQu/YCIaZTq4HBqVqHGmZRf5JRGybXH5YgdUC7ruQ0wwxkeZqUjp/18UAVDAd5XQHDvCdXY/9qCOelSm7lTK5vEMT/f0KJWAaqT6/qFLVtuHBBswLnVlphOf0Uxi01I3oMEjVdWGN6IvnXxyX/uCftXDye9ai/JPhG5uPONceZbHI+6qnyjerqV+J9NA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by SA3PR12MB9108.namprd12.prod.outlook.com (2603:10b6:806:37d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 16:16:24 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 16:16:24 +0000
Message-ID: <8ed69b4c-f656-47fa-a247-1c8d94dcc35d@nvidia.com>
Date: Fri, 24 Oct 2025 17:16:19 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: tegra: Add reserved-memory node for P3450
To: webgeek1234@gmail.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250803-p3450-mts-bug-v2-0-6307125408c3@gmail.com>
 <20250803-p3450-mts-bug-v2-1-6307125408c3@gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20250803-p3450-mts-bug-v2-1-6307125408c3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0446.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::26) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|SA3PR12MB9108:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dca1c27-c0c5-4bf0-80e4-08de1318ad68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K2VERFlIZFNxZFlHUUw0SCsyakhZRDNoOVF5YVBjTms2dlBWdGNqMllabEFL?=
 =?utf-8?B?NkZleU42c0g5bkN6aXRiQ2pBV2dNS0ZSajJxbUZYOGg0eDlqN0FLVEc4ek94?=
 =?utf-8?B?aXI0ODdxS3hjUjI5NkJPUzdZM3JuRFVFVEIrSkhzcEUxWVN3RE9XVWRMdTRa?=
 =?utf-8?B?RlhFN05SbDJaTXZUK2N2MEc0QVVqTVVPcDFKNTU4eCtJVTJuTmsySlZqdjNE?=
 =?utf-8?B?Wk9QNTlWMkJvbWswT0FiUmRwTnd5T1dOWDZocjNpbGVWdEk1U0ZZNmZIdkp4?=
 =?utf-8?B?eXRhK3hCL1FObGVFZ0NBVmQ4b2ZDbWN4YXFnZkVUVVQzN05aZVh4YytEV0dt?=
 =?utf-8?B?b2ZJUUxnWm1DakVhZ2RGREJRQmFXdkM4NlZJSXl5SlR0TnVUSzNJTVJ6Q1FS?=
 =?utf-8?B?a1pYVytuMDZtVjlDMk9idlEwSkNnQnBOZExwbHFQZld4ZzZZNTlHdXB3TTUr?=
 =?utf-8?B?RHdUYUFrNE04cmw1cE1OZEVidWtaT2lteFdqdkhDOEpyYW1tM1Ztdktld0g3?=
 =?utf-8?B?Qkhab0RYMTJrUFF6cmFJeDI4T0ZUNVhJS0tFa3hMdkJDUUF6RzQ2ZVJQQnF4?=
 =?utf-8?B?dVprSjlKTkpsNmJJamhnYUI5VFZsVmNKTDYxaFA5SHhlb3hQaG1XZFVES281?=
 =?utf-8?B?dEg4clk1dXIvdmovaDcwODdaNktmWnRMcFNDY2FwbS8wVVlWNUdZWnBweVFv?=
 =?utf-8?B?S2RHYW9GWTBjalE0Nm1FTEdDeXVib2ZOdUZnVCsvQlhsSkJPRWNDUDF6cm9z?=
 =?utf-8?B?TEZiREFBQlRjcStXZkN6VEl3NXlJdFlObEpLOE5kZVRWK0NUVk12VW9MVGkw?=
 =?utf-8?B?aFplRVBwU0lTOStkbllMbm1zdzBLd1J5N2pyZE13ajUxSTF6VjJHeWdKZXM3?=
 =?utf-8?B?bElTbEVsTGhqM1lGTXFoUExGelhlalBIVTVtZzBXMXRLZGJWL1ZCajZOQ0Rt?=
 =?utf-8?B?REdqZVZoZGFoM2ZGUytHQ0RMWGpIK09NR3V1RzBOUEUzbUdEdHdRVGpLaDhR?=
 =?utf-8?B?N0M3bGJVYkVyNEZ4RTJva0hDWDJvcnpmLzVhQ0tvaDVtZWszaytrWlFzeC9m?=
 =?utf-8?B?Tm9LR3R2c1NsWVRWYXVCZzM5ZlpUSVVnc3J6VGtGaUU2MXZqNlR5NnBJME12?=
 =?utf-8?B?Z09xZEk5OGNDUzF1UXZXMktsa1M5RFI1K2dwRlpRaDBzcEtaMHBuS1JyKzky?=
 =?utf-8?B?eHdmVTcwZGcwT2VIc2ZicFhzeS9EVW83cTMxdjhMYzgveTV2MkRyREt3MkJk?=
 =?utf-8?B?ZnpIQUQvbmxWQ0txdGhKQmxRUkRBWkVlYlZ0a25xQVplaHJRQXVPbndDOGtl?=
 =?utf-8?B?L1JsRHRGR0hMYmtvVTdLNERoaHVoenR4Y3ozVGE1VHdIM0kyUXdwbmxGanYv?=
 =?utf-8?B?bWl4V0l2Rnp3UVRrRExuWEZIakUrZDVLUzlYM2dYdlJsVWxQMWszRjF3YThs?=
 =?utf-8?B?MVpWbE5HNkNDdkFocDVXUWtLallMeEhWUUtidnR3OHF6ZC9WRVh4YUFSY1Js?=
 =?utf-8?B?Vy9seXBVK1FkN1hhK1Z1aVdwN29DWFhWVGwraEpJUnRPYTJTL2U5ZVRKaUht?=
 =?utf-8?B?am9qWUM4cjQ3OXVlOXF2KytSdXpQanByMStkenROb1F3bkRsZ3NLK0s5Qjg2?=
 =?utf-8?B?RFFxL05TUmxrU3dDZkxqZUxQcGNvRXJGbkxWTEFOdlpYM25ZZWwvUU1LTDFm?=
 =?utf-8?B?VklEM0dUVkRzTGtkbkg2RFY1WHIvb2RhTisyT1pkaXd5OWFzU1JWVXFkKzRE?=
 =?utf-8?B?dHY5dGZ5NFhwaHM5TGl3a09uMVJ3ekx6R2xDNW8vajAzSi9FU1VpbjdJVkpx?=
 =?utf-8?B?cjJnMnltWXI1UXVWWE92V0I2TlA0ZnRFK2E3RmlFa2ZkNnV0K1hvWlNPRFJj?=
 =?utf-8?B?Y001YkJJU1lHY2VNVmJxRkRSZ3NLTGZFVUZkdTE1NXRsWnYrLy9MQnBRamRZ?=
 =?utf-8?Q?6PShnlQtLEjPhEvlv0CsII2S/wkaehHO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10070799003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dkowRHhVOGxqWTg1OFFPZHJTQUQreEpSVEZkRzJpcitodFVINCtQdU1lQnA5?=
 =?utf-8?B?T3hsaFdPUE80M2hNclF6K3NMallVMGRrTllkcVpqK0M2TVFRd2IyKzk2eUR4?=
 =?utf-8?B?ZDl3V1k5TFllYU4yRFdJS281SjRlY3kvQ3pXd0tsZXhmSC9wcERxQm8zQlRI?=
 =?utf-8?B?cENDK1R2YnYzYXFsRHAzaWEybWh5WktGdTRuVGYzYmpNZXpQZyt4NURQdVRr?=
 =?utf-8?B?b3VMVjl5Um5NOElhWG5PSU9jTEpkcVFVVkd1YnMxNElRVVRmUjQyaUU0ODRD?=
 =?utf-8?B?Qm9vd205YTZscll6ZnFBTWxhaFgyd3JjVHQ3Skd1MDRkZDB1SFFtSXRoQTVy?=
 =?utf-8?B?a2JGa0F4ZC9vb2F2a3B3UEd3TStuRUZodER2eGVabG82QjRORVFDY0RjM0VZ?=
 =?utf-8?B?QjNkTXRTdVVlNENISTZUMUtCajRmNERGQVJTaEJmUHRicDZKWTJSbGFOL1Zh?=
 =?utf-8?B?SHovSnpQZEFzUDJQNDY4MHZHcWVpRFFmUGdia1dNbDVNQUdLWWFETzJoMmlF?=
 =?utf-8?B?SEpJT1VvYjByUHByeHBvS245WlZ5K1pCbVUrMHZQa3dIcWxsMTAvczJxUVJj?=
 =?utf-8?B?UTRwaURwb3kySnMwL0dVOVk0S3Y5NmVrRDVSRDI5RVlHU1h6REJkc2dLUmFl?=
 =?utf-8?B?ZkwrSUdqKzVZSVh5TmNqcmdCUWJ0RkJZdU1sUTJuTGc0ckY0QUpCSDFuNVJN?=
 =?utf-8?B?THhiWFhrZUZhMWpsRVBXZ2pEN3RXMHRsZU1rV055TFNPcG9IVXMrRE5GWThI?=
 =?utf-8?B?OTVicEpDek5Wa2VTU3VPOFpIOU1qTU95UWd5TXRrYU42dUR6bmFrZU1wcWQz?=
 =?utf-8?B?WkFkTHJpZU4yU1ZialZrcWtRbU9qVWdlY2NzN0VibWh0dlk3Q3d1YVloNmJ1?=
 =?utf-8?B?L1VDVWJpcG40eEpEODAxeS9jTW1VT011S3E1Vk1oQWdaZmUvTEFuT3B5MHk0?=
 =?utf-8?B?RTJvcWVFZDJUcXYrbWFFaGFtQ1Ivb1liYkdQMmVNSzJnRTM0MXp5UHJYa1J6?=
 =?utf-8?B?ZzFHQWNVODl3VU5uRkdodVVIVkgzb1VaSk9XeW9xbkpjQWMvK2dvakxYTlhx?=
 =?utf-8?B?ajBXRnhkcW56bU4vZDNkOHpKRXhrT2I2bUVla3Q4dC9mV2cvM25yb3UyamVX?=
 =?utf-8?B?Vk1pTG92ZVlTNEF2dUdaaDZOZDZ5aUFyZlI5M0VKMTk1dVRBTm50VmtibldJ?=
 =?utf-8?B?L2tzczFnNlZZOVVzMXdRY2NBdHlUT2NHTFFvL3hBenBGOVJQTkRuTm5BTlV3?=
 =?utf-8?B?WXBKT2Y2M0pybGlRL0lVNVlWQkh1VzN4SmJmQ0txN2x3ZUJXajc5MkRsNFIv?=
 =?utf-8?B?REhrbGFtOWhqa2JlV0phdFdaMU5zR0NVUDNPYlAyckdsUzYrdEd4WEFxQStn?=
 =?utf-8?B?bE8yTzdCQzJ4cTcvRmVSR0dxMUFMNEF4dUVHMFQyZzJTSlBmTTNFb0ttdFRY?=
 =?utf-8?B?TUpBcnhPSlRVUXFmTDZ5UDZGNkdXSUNJVVJmS3MrWXVRVldhRVVJWU5TVDdj?=
 =?utf-8?B?K0REY1lTOVdVaW5vZ2xkMG0zeXdtNElmOE1uRWdPTmJZTm94YXB0VTJBTDJG?=
 =?utf-8?B?cnFpM05jeDQrbkRuQy92VHVCSWRGbUYyeWJIQzI1azFLVVhxK3hQYkpPdlBh?=
 =?utf-8?B?RjNlaFVSdmFjdndMNWZjQkxDTG94RVlhQXpvVUlXQmJqV3BZbHdDcFhLam1T?=
 =?utf-8?B?eVhtRjdOVGxPL1gzQnV6MEk1RlM2eWFVZ3dqUWhuN2daZ05JWEdWRFFQbUV4?=
 =?utf-8?B?WHkrRjVkeFNWbzNMYlpyUTNLbk5yd2hhNllpMHBaSlVvY0N3RTMxZUZHUkc3?=
 =?utf-8?B?WHhiZFQwTHpaVHdoVFQ3WHhuUVE1YnlVVm5DNTJ4ZS85S1hoMW1RbkJaMk56?=
 =?utf-8?B?T2h5dmVaWndsREVHdE1QWGZXd3hudVY5L0dPR3NVVGVmdmtNNUwwdWhXaHBM?=
 =?utf-8?B?QzVCSVF1bEYrVjdsUnJPeEJ3ZVJEZVUrVmkxTDRObzlIVVFKTXErWm9kZUZL?=
 =?utf-8?B?aGZtVG84RWdoVmZtV0Y2L3lxVVplbDQyL2YreWJYZVhxSGx2Nno5WWdBNG90?=
 =?utf-8?B?WCtpSTh0QnQ0dGlWcmFmalhkRXFaeCtuRE5Yb2l0ZXFsZVU1NUpGSGc4RXI0?=
 =?utf-8?B?aFNZWGlmZjgrUEY0eUY2QW5xcFpSYnJHS1JuR2RTSlJSZlJQbVcweDNBOG1s?=
 =?utf-8?B?dWtTYmIxMXQ0ZFhhaVJwMHJjVFNEaVNKcHBWTnJnb0VPQmxiQmNWN0ZONmtR?=
 =?utf-8?B?c0ZhclZoWEdma0hFK0lpQ0ptVFFnPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dca1c27-c0c5-4bf0-80e4-08de1318ad68
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 16:16:24.5560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4u1bxaUtFCxSYQK+k/aIABHJ1rGVno4fDTUwemRbuZVCTRyd16VtCQlVUWuuFpxKGVgtkMsLjh9xgR2isqcADw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9108


On 04/08/2025 04:14, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
> 
> The Tegra210 L4T bootloader ram training will corrupt the in-ram kernel
> dt if no reserved-memory node exists. This prevents said bootloader from
> being able to boot a kernel without this node, unless a chainloaded
> bootloader loads the dt. Add the node to eliminate the requirement for
> extra boot stages.

I test this platform and don't see any problems. I assume that this 
would prevent the board from booting.

What bootloader are you using? Is this from a particular L4T release?

Jon

-- 
nvpublic

