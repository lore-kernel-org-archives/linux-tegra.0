Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2085.outbound.protection.outlook.com [40.107.220.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6314D86349;
	Mon, 28 Apr 2025 14:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745849047; cv=fail; b=prP7Ym245NprH0W98kMCDhPovTL5mJqMo0XNgAfb3ZihTnW8lSzk4yrcIF5OGmZ+HSSEtX7ABuMbS4bz4SaTmrNr6/sBDEwfMj6fmYoZZ0Y+pFsXVC7bA6CHa8ABg2Y7SoRxoz9Cs9mi1tq74CI9m2lFoO9F9wTPHIPmw6h893w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745849047; c=relaxed/simple;
	bh=DertSmKvi427jveDEL7X6Ib2NCHCRy3cvmSO9ghzU4w=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=h3MEaxnk5hidfe4uQNCtZSy/JR6KjaKD297FxjaGvYI12tvlIL+JyK+2JRoXBjLdiaT39QML76jQtjBgv9jV3/6aN3xnQKS9ywpsd1260K4j/D46II8DL0irfCP6rLLOE3Pu0+xPzZ9fZNGXVz2f5KeJO7ad3fv9hHozWdXoXvE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kZp64RFo; arc=fail smtp.client-ip=40.107.220.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kZp64RFo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xHYQXGDk4nY1MShQeJTABDf9kQnp16hIIchOodiwlAONcAZAK2xJDHOaXFDwC7q03JnNZva2oU0RuAIgDWmaWgbDrgSkod+srOJ4VRexgSeuc9kQQaiWyp2wIM1sKc8qLuuVIvuSGlFjfZww6tkC8N6kfUhZ9X4IV1Un6dDZ8nv3IqO/UiokkuXZ3mLpohJ+ZQOObzAy1UPfGjYC/M2SdKoQABG4msVL8ru13p39mIDaczU/t1tJq8di3ODyqIiU2hf0Awzanek3RFrig/tUE3RFa+x2LN8PgyGrfo8nbmRsk1lfqClzxzCcaS4/5WYP+X7cfMNOZ8aB1OBMxeEfXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p6dDbd3JxCd10NcExZpnHLZM6f7WrZ5WyWvSKdoPwL8=;
 b=twYEtzmkQD3JWFFZTakGNtjkRzQl09vI163ms1c0paIfo6xvc9CrOMZzuRBR4G3tGbcNpxbUYvC3ki6O4llzXizAnw61bQcv7e/SsP2NWHVXs9YVm0hSGKBaDt55dYG0N+sCqNK1kBUs5zjP4z9vxr+xDI29kY+1VwcJoe36+8FF5j3ypEtV/KC8vVURp649418W7ry/emUX76s6qHFG2G5aRjYnAEkVKE2RIjwBrUII5rMFjzIBT8rVIGIpxt9D80i5axxm0sGVcbJfUL0n85wkTDlbN47W2PzI4Ux5cOPWJOT+Pm7XAUlcKIcccrgdCB0B7cwy+FAjycwPqBgLTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p6dDbd3JxCd10NcExZpnHLZM6f7WrZ5WyWvSKdoPwL8=;
 b=kZp64RFoc81uyLK9x87hbMmcP5jmN+i4ZQeg5fsZN8WtWI21x58q3RlvNOQmAwURnPxkpjUufTAjF0BwxZGfKGpnr4+U1Q2rXU8mcQbibnJFeEM25AhjSB3Txl7jZP61ttO/GvSk4gCQ7VVevYGHa3zTfu/lofj1Yt7HT1tcto3Lb0utzx8OJnL9bGZBt4bHrrSkvEoR7o7HItRMhrKflUUTiI9xeuQGEOzR3cTRQcHl2FFGkkLblGl/DJ5S1vszKn7kcrs+GEEauihtp7fxhKOoMpRWqaWdSaGQDT62pdmDyHGhmmNitVxKErMedRaJVx/Ahrod780eXKlQ1gwIug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by SA3PR12MB8761.namprd12.prod.outlook.com (2603:10b6:806:312::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 14:04:00 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%3]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 14:04:00 +0000
Message-ID: <e5e8b5be-7434-4693-8696-5e0e68f07c75@nvidia.com>
Date: Mon, 28 Apr 2025 15:03:55 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] clocksource/drivers/timer-tegra186: add
 WDIOC_GETTIMELEFT support
To: Robert Lin <robelin@nvidia.com>, thierry.reding@gmail.com,
 daniel.lezcano@linaro.org, tglx@linutronix.de, pohsuns@nvidia.com
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 sumitg@nvidia.com
References: <20250421100821.2907217-1-robelin@nvidia.com>
 <20250421100821.2907217-2-robelin@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20250421100821.2907217-2-robelin@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0494.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::19) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|SA3PR12MB8761:EE_
X-MS-Office365-Filtering-Correlation-Id: 470da2f6-802f-4633-f3c0-08dd865d8648
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VkJOb3p5R0psR055aXY1V0RhMlFQbVlVUlVnaEsrMGRnb3lxZFIxNEdFdzJm?=
 =?utf-8?B?VHBOQUh6Rjl5d0ZYbDliRVdqUWtERDdSbUJvcEJQS3gzY2xiSDNBeDdsZTk2?=
 =?utf-8?B?dTNFUFRKb3BoQlFKZVgzVkFaRlA2eUtDZzhxN1lueWtyZmJUci9uVVBMR05U?=
 =?utf-8?B?Z1lkRVU3RC9oVFMyWlBkYnAreUlPOHQ2UWJSc2FsdU5mUFgyeGtMbmZ3OFBN?=
 =?utf-8?B?MlBPWEZTTUxIcStjczZMU2xWYVZ4cFFBWm9ScjRDRmFrdzZ5NGtvd0VoRG00?=
 =?utf-8?B?d1g5eGtHWWFPUy9rRFgzSVFEZlNyZU9SNWR5UmNwQytyN1ZULzhyK3JqK01x?=
 =?utf-8?B?V1UrVnZLMCtPampWNGM4bHdQOFNvS2xEK0NVRVQ5N3lldGYxT2kwR0Y5L3V1?=
 =?utf-8?B?dnVFR0VJS0daTGZMZVJLeDJNQ1ZGUlg1RnZjci8vYUtyNHdKaEhWR3RtdnpI?=
 =?utf-8?B?c3hpYm9udHdSbFErTmNsZVZyaWNPYi96TEloV3RONXB3WFhZL1VoYzZDZGFN?=
 =?utf-8?B?RFg5RVVRZlhiM2JqNjNIM0FoNnhrZy9wUXg3c1FBU0hlQm1ZTVFLeDdzbTdz?=
 =?utf-8?B?MDNyMlB5UG9ZTzVISEtQcDZGY0R5NGFQMDFrNlNQenRtTzluMDJsbUpaL2Qw?=
 =?utf-8?B?Yjk3L2x2NENETmhONlRheXhNNzNaWGhwVlp6eUZIM2RnNHhGVE1LZXpZeHBL?=
 =?utf-8?B?RzJRODZXVHdtS0MrVC9iZU11K1VYeVFnM1FoOG1Ka21JZGhHYjBZY2JsWnBH?=
 =?utf-8?B?NXNpbUxBZWFZOTNjdlNrUnV3L0VWL05iak1CdHd6b0MyTVZzZ0wyaEFtK2Zk?=
 =?utf-8?B?bGxnaFoxb3ZZUHY1SjdCeE1QUWlQWVNaV0E4UldNTk13c3NaYUIreC9ZSWtr?=
 =?utf-8?B?VFpUVUlsVjk3SkppSUozTTVDWTNGZlN4VzJuNHdjaTBVaGQ3aGtRZWtmSjV6?=
 =?utf-8?B?cGJzajB0OXp0MDdDRCtRZmIvTkc2d0Y5dWZBR0R4YTdRcENvVEhOTktQc1VU?=
 =?utf-8?B?Z25iWnlETU42eDVRWDZhMWg4QjFLdVNCQ05NcGRkT3p6S3BvbjNyb1VxWFRt?=
 =?utf-8?B?MG0wdHBGb0Mvc0RSVlFReG84dGVqUGJ4ei9NRjBZNWY0RlEvMnVVMWp5R1V6?=
 =?utf-8?B?MnVZSkpoWnJSSW9ic014bnp1cXp0b3p3ZkQ5TGg3d3owNTRDT0p1NXFKa0ZN?=
 =?utf-8?B?VXNYenNxVXBSUTJoM3c1aGVnakt6aGZCTFV0VzhPbFlNdy94Y0tMMzcycnhi?=
 =?utf-8?B?MWVOSlZWNnJQRVhrSkNFQVRiaGRzaWpVS2Q5K1JHb2xiN0x3a1VSTURYL3Fx?=
 =?utf-8?B?ODRjVnVudVJuRG5STzhuMTM5czVpQ0RvU0wzUHVlYVhGb3d5bzJPYzlNVU8y?=
 =?utf-8?B?YitlbGlzOWE0ZFpXczJSQnVKVlRNU0xWRmhEd1dDeTgrdXhjUzRjZVdYVXg4?=
 =?utf-8?B?SHdUTTkyVTRveDZ4QjA0UkNyaUdvQkdVd0k3TkpoSXhDa001akhlLzZVMzVE?=
 =?utf-8?B?MUJOWVVEYnBMb2F0cHpocG1MNXBMenhLaGNhZjRReEpOZGdDVUZCcEJBUFh2?=
 =?utf-8?B?VEQxZ2puckRFdDhMRGt0TzExMExtK2hYUWRhZzBZQU4wWFJIM1A5cFhHeU8x?=
 =?utf-8?B?clF3WWJHZmpSSGtJNW9kMzRLOWxSTDM3b1hQc3ZsR2RxUEhCSlNERkZGZjRp?=
 =?utf-8?B?cmhzQ3JLNFh6UWNKNCsxYkRCeGdSRmx6SzBwNTh5clZRYzA2VURzMkVkM2FD?=
 =?utf-8?B?aUdsbi82eGNiR001WGRURzRQNU9aeTB0RjdyK25LUU9GNnNEa0xvd1NyUmhX?=
 =?utf-8?B?KzR3UVBZT0hQQWVoR21uOUZrbEZ6end3R0M3Qld6d0VxSDJuRHJmWEVDR3ky?=
 =?utf-8?B?bTJNQWhBWG5xMm5yQXB1YSs3dzM0OWdZTjMzektRTTN5RktRdGJlRDJwU1My?=
 =?utf-8?Q?VJbSDY7vdzw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TjhKenNZaStsdFlZRXJWbEkwNWw0NG9MUVdBVXlsY29VclNjelp6d3VxSDhh?=
 =?utf-8?B?S1ExVis3RkNkL3FvempZTk5GbWtCODI4WEZNNzR4S0cvREJVczBWNVF1R1NI?=
 =?utf-8?B?bTZucTN1NG5BS0tvd1MzcGJ0RjBHQWxKZWtydXFjUkhxZWp5T3hiWnN5YTRV?=
 =?utf-8?B?aE1ZR3hROHlPOWc3U3RlaFhFRmpvV1VEVlZEUkNYQmRoUy9KOFU5cWlScVNk?=
 =?utf-8?B?NGx4TjNQakJtTHpLSHpuVVE1ZVJWZXNMdzRucjNCbGxmRjJqWUJZQ2RISFRz?=
 =?utf-8?B?eEw5UlpqVis5SFZHQjhGNHRUVlh3OU9aSU5Jb1ZYOUxmTnQwZUMyazhBWUdZ?=
 =?utf-8?B?cWlXNEtnNlBTemdvcmttL3lvR3dHZ0ZRN2dyM0dhQVZEck5BV2xxT2FWYVEx?=
 =?utf-8?B?SmFIVkQxWTdXVmJZeXBwQzVPT3ZEUXVsNFdzM0FVVW4zVWkxOEF2czhQQ3p1?=
 =?utf-8?B?S1Y4cVMyQ1ZoVUxldW5Ld0dCb0ZBNUVqRDFnbHJoOFRQWTM5OVBQQ1FKOW0v?=
 =?utf-8?B?Wi9sWjJ2UWgwK0srZUFBUnZlOHVlK2hHeDM5S3ArK3puaXVQc1dEZ0NNcjFE?=
 =?utf-8?B?L2IrWXhlU2VkaHZjTVNZRkNsbjRiUjRxWis2cm5aeXFoTFppYXdxOUNiRk9P?=
 =?utf-8?B?ajUyR01MVHYwZUs5K0JLWUpGVDZyVUFiRHVyNThyMi9yVmRSVThpN2lrNERm?=
 =?utf-8?B?TG5WMnMyQlZibHl4S2ZPMWtjTUc1elFHL3JzdEEwZmpYS3NXREZ2OUVmQUUv?=
 =?utf-8?B?RVFjcUNLSEtpMWkwZ1J5eWlOSTB3RkorZGoyMVBVM0JIRW9PdW9yb0tUWWxk?=
 =?utf-8?B?WjMxQk1XK3hRKzg2Qm9WUnovZlVYdmpsb3dhT29Zc0kwMW9VUDBPa3lJYkF0?=
 =?utf-8?B?dnlqZVBNUjJlekFjcGFJVWdiVzJuLzk2cndxLzVrK0VnTlIxS283K2hxdWNG?=
 =?utf-8?B?dkVnZStiT29HYnd2MStXbk1CaDRsanBGaitzNUI4cUIwUnFVbVdSSlpHUmsy?=
 =?utf-8?B?eFVYT1JFNjZDNnVjUG5HQVRTNm9TcHFDTmFmOTJmb1lTSmNrdEV5NmhwUVYr?=
 =?utf-8?B?MXpOSUFvWFl1bHpTN1dkcEN5TDVEZzM0RUk4YzBlNGxtam5vcXRkdkpvNUU0?=
 =?utf-8?B?aU5GUTdiR2pSMFQreURCVzVYbkJsMDNwc1dKaGppWW9ZTTBNWmJZS2c2VXg4?=
 =?utf-8?B?VlBRcE45cExHaGNyWjYxY1RZTGdDR01FZEZPSFBQYkFaa3Rxd2oxSnZPb0lR?=
 =?utf-8?B?Q2w3UWdvQW9ETzZGVFN0ZmhLYXNDT3ZlTG45aHdlYjgzUzJDb0ZJV2JLZFMw?=
 =?utf-8?B?c24wT2dzZ2Q2Z2FjaTU2aTYzR0dnRXpRWE0wci9CVTVKcm1MSjlmT1ArZG02?=
 =?utf-8?B?V1VBRlBOT25oRFhmdnhxanNwOTN0THlVVDRKYjJMTGs0SStOdGJmWFFkTGh5?=
 =?utf-8?B?dk5yQkMyd2FUNUx6QWtHWjNPdmdFTGEzVjJOZ056T2xJOVVuM1R2aXdYaldE?=
 =?utf-8?B?QmZjV092d1o2RnN4OW1WdWQ2T1dtUFROcmE1K1RrbFQ1cTJvdHhaRHUzR2dE?=
 =?utf-8?B?c1VucldDVk9IU2JZMEozMjJnWExKRjhlN2g0U2IyMGJTam5sVXVtbkVQemNm?=
 =?utf-8?B?alVsdDB6di8yTUl0cEtvQVBwQzJFaVZtV2hQdUFkNWdKdjNKNGwyVWhIK0pD?=
 =?utf-8?B?S000YXVoRWhSRlhOR2VWTFUzb1F5YjQvSmlvZUJieGZkaEIzNW1YNllWK1VB?=
 =?utf-8?B?OStDZENMT2szdHUvb3NZVVdWd3Y3eGl4eEszVjZINDZyb1FsczVOZWY5Nm5Q?=
 =?utf-8?B?QU9mS3pkNXdxN2UrUnMxMHJreFFHdEJ1alNseWdTWlRNTTM3Tkd3TTB0dTNx?=
 =?utf-8?B?WlFJWFdtT0M0YkF1WDJ5M2RQSVB1SUhjUlBJOG5PWjZwcGxtQ2RIWUxxcGd0?=
 =?utf-8?B?QnMyU3pOR21HeGl2K0pyY2tKeGxlNXZIYzZnY1c1RjgvOTBiRWNSRGlseGcy?=
 =?utf-8?B?S1VxdmxlK0FxT3lTVnViOWc1a3lESnFXKzdiVkR4RVNkNnhGUDZmVm1NWTlF?=
 =?utf-8?B?eFd6OXFkekptdktJK2dRazlDcnBFcXNUbGxFM2Q3NHpwVko2RXZCWVB4cGFJ?=
 =?utf-8?B?WFlJVkhlYmhDc1o5UVZOWUJKZ1N1SzF0d2Q2b0dNQ3JyZDJZRlQyMWxpRi9r?=
 =?utf-8?B?aFNrKy91Z1FRdWhpQy9FZDJmaW92SmM4UVczdnpEc0VXR0h0V1gzQ0EyMGhq?=
 =?utf-8?B?d2QxVWtPaWlIRXIxemJtdXNwRS93PT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 470da2f6-802f-4633-f3c0-08dd865d8648
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 14:04:00.3128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qhm+5oq0tTU9w/5ha836j4mrS8BkH05AsVPSalU96q06bOP/sjxvQoEVQfj3U0ome/Vu8UVRqPNJyEcuZB8eQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8761

Hi Robert,

On 21/04/2025 11:08, Robert Lin wrote:
> From: Pohsun Su <pohsuns@nvidia.com>
> 
> This change adds support for WDIOC_GETTIMELEFT so userspace
> programs can get the number of seconds before system reset by
> the watchdog timer via ioctl.
> 
> Signed-off-by: Pohsun Su <pohsuns@nvidia.com>
> Signed-off-by: Robert Lin <robelin@nvidia.com>
> ---
>   drivers/clocksource/timer-tegra186.c | 58 +++++++++++++++++++++++++++-
>   1 file changed, 57 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clocksource/timer-tegra186.c b/drivers/clocksource/timer-tegra186.c
> index ea742889ee06..56d08bf1b6b0 100644
> --- a/drivers/clocksource/timer-tegra186.c
> +++ b/drivers/clocksource/timer-tegra186.c
> @@ -1,8 +1,9 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   /*
> - * Copyright (c) 2019-2020 NVIDIA Corporation. All rights reserved.
> + * Copyright (c) 2019-2025 NVIDIA Corporation. All rights reserved.
>    */
>   
> +#include <linux/bitfield.h>
>   #include <linux/clocksource.h>
>   #include <linux/module.h>
>   #include <linux/interrupt.h>
> @@ -30,6 +31,7 @@
>   
>   #define TMRSR 0x004
>   #define  TMRSR_INTR_CLR BIT(30)
> +#define  TMRSR_PCV GENMASK(28, 0)
>   
>   #define TMRCSSR 0x008
>   #define  TMRCSSR_SRC_USEC (0 << 0)
> @@ -46,6 +48,9 @@
>   #define  WDTCR_TIMER_SOURCE_MASK 0xf
>   #define  WDTCR_TIMER_SOURCE(x) ((x) & 0xf)
>   
> +#define WDTSR 0x004
> +#define  WDTSR_CURRENT_EXPIRATION_COUNT GENMASK(14, 12)
> +
>   #define WDTCMDR 0x008
>   #define  WDTCMDR_DISABLE_COUNTER BIT(1)
>   #define  WDTCMDR_START_COUNTER BIT(0)
> @@ -235,12 +240,63 @@ static int tegra186_wdt_set_timeout(struct watchdog_device *wdd,
>   	return 0;
>   }
>   
> +static unsigned int tegra186_wdt_get_timeleft(struct watchdog_device *wdd)
> +{
> +	struct tegra186_wdt *wdt = to_tegra186_wdt(wdd);
> +	u32 timeleft, expiration, val;
> +
> +	if (!watchdog_active(&wdt->base)) {
> +		/* return zero if the watchdog timer is not activated. */
> +		return 0;
> +	}
> +
> +	/*
> +	 * Reset occurs on the fifth expiration of the
> +	 * watchdog timer and so when the watchdog timer is configured,
> +	 * the actual value programmed into the counter is 1/5 of the
> +	 * timeout value. Once the counter reaches 0, expiration count
> +	 * will be increased by 1 and the down counter restarts.
> +	 * Hence to get the time left before system reset we must
> +	 * combine 2 parts:
> +	 * 1. value of the current down counter
> +	 * 2. (number of counter expirations remaining) * (timeout/5)
> +	 */
> +
> +	/* Get the current number of counter expirations. Should be a
> +	 * value between 0 and 4
> +	 */
> +	val = readl_relaxed(wdt->regs + WDTSR);
> +	expiration = FIELD_GET(WDTSR_CURRENT_EXPIRATION_COUNT, val);
> +	if (WARN_ON(expiration > 4))
> +             return 0;
> +
> +	/* Get the current counter value in microsecond.
> +	 */
> +	val = readl_relaxed(wdt->tmr->regs + TMRSR);
> +	timeleft = FIELD_GET(TMRSR_PCV, val);

So this value is in microseconds.

> +
> +	/*
> +	 * Calculate the time remaining by adding the time for the
> +	 * counter value to the time of the counter expirations that
> +	 * remain. Do the multiplication first on purpose just to keep
> +	 * the precision due to the integer division.
> +	 */
> +	timeleft += wdt->base.timeout * (4 - expiration) / 5;

However, wdt->base.timeout is in seconds. So I don't think we can simply 
add this. Don't we need to ...

timeleft += (wdt->base.timeout * USEC_PER_SEC * (4 - expiration)) / 5;

Given that this could be quite a big number, we probably want to make 
timeleft a 64-bit type too. So we may want to define a 'u64 
timeleft_usecs' and 'u32 timeleft_secs' that we return.

Jon

-- 
nvpublic

