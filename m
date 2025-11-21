Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010016.outbound.protection.outlook.com [52.101.46.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB0C33D6D4;
	Fri, 21 Nov 2025 11:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763724301; cv=fail; b=PLXuXwGYgCMF3Ln/uHUQY/FemsnirjCAQTmb+sA+XJDDEmGKnY3KUwaZJqLhpEhKGn5uIxBDZmtgXjvB0z/DMd+SltTklAxaHa5JyAZDXuBMF5D0xgMgpvbaGtTyhJUkWgEm+xNb5NyR1KKJTKyjaGopOCTmfKv4sFJrdPjw68E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763724301; c=relaxed/simple;
	bh=8Ja21E/i+CVaDr+SRd8w4dSaINa3S2N6fMifr2X64iQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UCk30xDkxbdSaqoiyVkgGBXhDX9evAk4s16SViX6VfSBObM6mPFf9oGJTcGY2/Ubj+wcFPKWudxSrDsQhd1IACHqT/WI5uIY+RwVbDyuBB0pE8q0LlktpM0kWZJkYs/dyRwkNW0mMPWZFcApThHmzpgMwC4WkPTxR/c8WdUoDHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=b+yrr2Y6; arc=fail smtp.client-ip=52.101.46.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="b+yrr2Y6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K9XL3kOq8LfMkK3FJQhP/FTWm/EsNZvJcMqj95ukaK0UmnDggUYtp4d1dBnr58dBgSl9GfbJ/KnzaUE+uGtbX//IAfNvlgrPeBLW6teNmmKPPoL1sb2mUdFpZLwYNKTyy03fAN7vom0lhJNRmznKPSvxyCwEElk5EXtGyTj3DTDuV5F6ZcOIS+CT4Memy3FKzs4SngjEn7F51CA7iqjm40RNJhZqG5LXFRZaq+5nl9ClVLaRgdz8KpeZcnQEKYqVYurV5K6z6GvdSfIEkF9OZLuBWdaQItkGAFhzER12EKFfHfsqEmAi+pcOemg1qucxIQMNdk5KNVW1JTe+gWqSbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T4vTh+zFAPPaQnzEKTVEKBZV8QJC66qTrGUCM2z+Gsw=;
 b=VfTorAexKOR4b0xpJ7bJ/NG5Z8ZGhIo/sf84/93JEGzzrmqDtxpcQUSUL4ZT9iAcYCDofyHqF62BelzMHsE5kjnk/zLOlUcBbtnTqXotkyFte0EKywUNAwjn+CcYbVB6tsQ8yecgIbqO0biWIFicsHVHzdAq6yjnUfPO0rTofschBn7OROT9J4YFxxF2NMnFQ5Lgm/byolu7DIb/iHQYPhf8tFUTuG0NElYUoE9o9mrCLJg+5BaPgYH5xsoDmxgJgIifHLy0rGWlv1nwjdv/7WGYx2bsdQp5hRuK0KPYwULeCBy/HwtJq+YRXN0H4Plqrxo83vDXSpstI+gXoNYkcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T4vTh+zFAPPaQnzEKTVEKBZV8QJC66qTrGUCM2z+Gsw=;
 b=b+yrr2Y63SZyyAICN3ZkLRoyL4EIfsuUqefEHOghXMBSuP9F8RKl9ECdX91iNp63pyx+Omuc1SOGltWhLi5iqhQtVILIOMhdk2s7RNKt8RkCay4WeGsYVHNVtRgxPyeP50Y15JRZeEXNIUwUiNiAO5NcD6gLT8WrKF9TUIqzTUv9j2DH5Ttuy3ONqMp1190yLIyWGaujJgvOxBWMxzdo3hdOccsepSUC6ll6dEB5Z6wClU1l2oJt77fGu2/mr0QUmvr/5mOFcrgSHQ9RaBv4kKQ6+4Dz2bwOTwXjBMdpzzF5qGKBHlcHBzcLSeTBtbElaWG/08tR6dA5fxqGeu++Vw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by LV8PR12MB9083.namprd12.prod.outlook.com (2603:10b6:408:18c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.12; Fri, 21 Nov
 2025 11:24:55 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 11:24:55 +0000
Message-ID: <56aed0ec-b104-4612-8901-3f6f95e0afab@nvidia.com>
Date: Fri, 21 Nov 2025 11:24:49 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] arm64: tegra: Add interconnect properties to
 Tegra210 device-tree
To: webgeek1234@gmail.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251021-t210-actmon-p4-v5-0-4a4dbc49fbc8@gmail.com>
 <20251021-t210-actmon-p4-v5-2-4a4dbc49fbc8@gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20251021-t210-actmon-p4-v5-2-4a4dbc49fbc8@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0493.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::18) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|LV8PR12MB9083:EE_
X-MS-Office365-Filtering-Correlation-Id: 12659a4b-4ff4-469b-a4f9-08de28f09894
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SldOV3B4WW1ZcUlHdjlXam80VWRPUXhtN29MR0QzRUxrY3lwZVZxeUJyeGt5?=
 =?utf-8?B?K3JGRXoyM2lsMXpXd3czdzh6cnkwTnBuU3hsekxUU2M2VWp0U21xb1NaY2ZG?=
 =?utf-8?B?blNJNHkzU044Y3piR3RaVHk4d2xnd3didU04emhlQWVocXpBZFE4ei9FSEZV?=
 =?utf-8?B?UHlOK1BNQlNwOTMvNGdZb1c5SE9zK1pTTnRiZDZuZ2FVVTBrUFNQTTY1azFK?=
 =?utf-8?B?bEZXbjJmT05xZnc1YVU4RUFza1JkUm1sOG1DOGt1Rk5xeU54WGRZU3JYZ3Ft?=
 =?utf-8?B?V2VNNE5DZWpVOE9TMnhRcENiVzFobEpqVGhXK29vSjRQNDRoS1MyYlJqbldw?=
 =?utf-8?B?R1NRZDhKb2xucW5WS2YwQWtibzBUR25XZFZWU2RudzVxa1hQZERWNW9nY2Vo?=
 =?utf-8?B?S2s3c0VyOUpEZGgyZlRINDFxQnZXNzB2QW1KYmlHaHJtWlpSVVBYaHJVQW9D?=
 =?utf-8?B?QWNmZ3VENVpkNE9aTVlNSFZiZUNhcTVqWElBME9pTStnOEhjVTRqV0lFZWVn?=
 =?utf-8?B?bEtrMlBBMzdpT1FaU21NL3g2dnBzMjVjMnlSWVVYSm1Ia0doQys3a3BBTWhK?=
 =?utf-8?B?RFlJa3ZqU1RldmZPeXhkLzg3akdqaEtxaFhwbGswVHR2aUZWLys3YVoxUjNh?=
 =?utf-8?B?amRkRFd0VDRvTkVSZEFIaGpFUE1HY01Xb0NINTYyckFGbXB5REgxNHJ4S083?=
 =?utf-8?B?RlI3cFM1TUJPZWhIekl2bkYvRWthRmtyblFaQ3k3R2tZRzQxZmFYMklZbUVQ?=
 =?utf-8?B?UkYvZXNGSEd6cnAwbS9ZU3gweVp2M2dYelp6M1kwS003OEFSS1dGVTQzUUY1?=
 =?utf-8?B?MnQzZTYyaEJUNWNzelhZMC9lSnFOOHZxTEV0ZTU0aWZ3TXluaWJBc0E0Q201?=
 =?utf-8?B?c05TVm1xV1B4dVFvaHIvMVBkcVQydk9nZ25IM3BqaFFPWHVGRzNrUUhUUzh5?=
 =?utf-8?B?akthSFhSZzQ3UUxRZ21WRm55bnZTTlRDdUJ6U2w2TlpxRi9idmxZcXYzVUhY?=
 =?utf-8?B?aGxicTZIVHV4OENwT291Z3huU0xRMG1UK0VRRThUeWZFWWRCN1VwZGVabGcy?=
 =?utf-8?B?UGE0L3RwM0E2bklWR240TGdISXNpVjBZRnIzMDdVc2g4VzZxM0lwRHRzdXpT?=
 =?utf-8?B?OWNVWUxsTzVPeTRHcWExVGUwbkhScHlqcTFSbTVFWkttTWJsSk5jV0trT3d0?=
 =?utf-8?B?YTNXdkE1ZUVnRmJNd2I1YnhkQlZLR3ZsZTdPV2xYMWNzV2RiTE1uQWIwQ0NY?=
 =?utf-8?B?OHNyWjlEL21qbjBRdzFpNDZYRmxBaHZsVmhBUmc1bHI5SUNwWWttTmJSaUxF?=
 =?utf-8?B?TktrV3R1SUJ3NVBNL05UTkRyaUlhNFQrOTk1MHJ4SlpEVFNrNFRZMTVSZmdL?=
 =?utf-8?B?MHRvSWlrVjZDNzhqd3BzZVN1b2NWbWQzRnBZbks0OE9yeGtJR1NabzViNDZo?=
 =?utf-8?B?Q3prL210aU5ReVRKKzZjMnJTdFdyWG1rSWtKUTYxaEthMGFiTXpzVFJ1UDk1?=
 =?utf-8?B?aFo5S0ZpSEJTTE4yWTk1SkYvWHVBQzJQSlZIcUUyMzBkOVZTV1J5M1hodWRF?=
 =?utf-8?B?dnhnRVNxTTl0cFNKRk92Q2UwRitiWTVBOGpVMXZtVGY5RC9XbGplYU5KaGJ6?=
 =?utf-8?B?U1J3cXVVZmJPS1FoTitPNE9qaTN6OXJEejFIcXlGUGxKVzVPWVg1Mnoxa2Zl?=
 =?utf-8?B?U0F5TEhaRWdvNEp6V1A1aERiOGM4cDBORWRHYk1nT3VqWVE3bm1kSDQ1bnVB?=
 =?utf-8?B?M3pEV1RyWnNvZmtMZDhIKzB2STlRelVGa2Jxc3lwSXdhRDNndmVJc0pieTIz?=
 =?utf-8?B?ZklpcGtPSUxnVUNhd1EzOHpwaXA0UTBpQUtqWWZTT0FZTytVYUZ0ZkNJRldj?=
 =?utf-8?B?OHd3bFgyRDNJOWdDUlBCdjNjd3ZLWHUzUXRzcnhSTHhNL3hSL2o4d3Y1LzFF?=
 =?utf-8?Q?6bx9I/OnpEvGVy0M4XItrzSpA595A11o?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SkVENkJhblI1bGpub0VzWHlrSW9tYnFvUlRTd09vWjNjbEtheXBPUEtPeTAx?=
 =?utf-8?B?UHl1SGhBUFhJTkZoZ0RiQi9TWGE3enRyS0xaNnF3Qk04cjRkbStnSWN1Ymhv?=
 =?utf-8?B?R0M0TUpCR0s2bjVqTzE2bklUcVFhQmx0bE51WFp6ZDJWQkFETDZMR1RxSjlU?=
 =?utf-8?B?amkybjMyYWZSWnNENFlBV25wVElMNzRrQkRva05Yam9VUUkvUXhHMEhWQTFM?=
 =?utf-8?B?bTljYWlyR2lud0tNcmhLbktaSXBPNmVHR1JMOXBwdHNDQzhaMzdqMHhlRDNr?=
 =?utf-8?B?VWhkb3lHb20rNnVVcjhuQUx2WUdqRGZlU3RHc3c5VHh3L3UzMHpRN3ljNHUw?=
 =?utf-8?B?V1J2MHNnVk9wWFEwcDBJakcxWDJtL0ltcUY1blRvSUJzTm1NMUxFYmdyZUVp?=
 =?utf-8?B?ZThxQUtCSE9RTzJ5MDdmVEJpZldJTURFeEF2am5HOXFCdlBiY0ZodEkzUDBC?=
 =?utf-8?B?OUNsSkdDVkw4azI2dUMveENFUmV3L05MTnFjODVrcXJhK3Mxcm5uaXJDMkty?=
 =?utf-8?B?TVBwMStLbzArNFkzTjYvMVFnZ1dlejRCZXhHRnlKNEcyQXd3akpldk5hK2Rk?=
 =?utf-8?B?MDFLbi9tbnJHbDc2Rk9OMklWazZmT1dlQkk5S0FUbUE5NWlUOHFOdkhmUGQ4?=
 =?utf-8?B?RjdOUUNjQXVxM2t3WXhScDErS2k4WFZCclZUNXNFdHkrSEpzWmtMVldvUUEv?=
 =?utf-8?B?cm5wU0tBZ3RLYmNaNUZ1eVVyMW5FbDhlTnBhUDJnWG42dVNDWXgwMit1RTVu?=
 =?utf-8?B?WmwxbDQ2VGhyTit4SmNOZ2ZIN0FWQ2Vqb3lRM3prSEg4R2J4UGVOMk5KM1lL?=
 =?utf-8?B?amY5V3BoaWVQbXJYRi9DZ3V6V0JhNkV3UnZIcXdINmFxbTFkM0djOVZrTkpm?=
 =?utf-8?B?VzlvcmFaeGhqT3V0YlFxdVZuR1ZhTXNHRG5ydGx2di96b0lYRUlVS0ZWKzd3?=
 =?utf-8?B?Tkp5L1RVYzZueHVWNmZ6aGFvcVF1NGdlWXlJYzNPcjZYdjFVK3JhMkpjKzJz?=
 =?utf-8?B?QnROaS9tSmtJMHJuQk0xMzFtZzJkUzc0VWxWeitFQnl0R1dpQkc4RXZ1ZVVn?=
 =?utf-8?B?K2VuRGU5MkJITjdHUzMvMnY3Rllldk9OSmwweEpkZDVOSzJVT1ZKcHU3VXcz?=
 =?utf-8?B?TEJuYjVrUDVYYWJoY21ram96QWZqTWE5c2tQYVNwc3gwaGR6R1ZwajMzeXBu?=
 =?utf-8?B?SiszVmg2YjQ2ZmpNcmtTNzVrM0xQakh4UFM3ZkRCUk8zQU4ybzhocnZGbXdP?=
 =?utf-8?B?cnN2K3ZlNU05bDBWMFR6WlU3a3MzZ3ZPTlovTVBPSnNJSE16SVJWNmwrY21Y?=
 =?utf-8?B?aUpjUjVndHp6bXFJSndCTTc5eDJTMTEzbVBVdTFtUDR0K1JDUWR5dHZHSFlE?=
 =?utf-8?B?c29CTEJTMjhmV0RpZDFVSzEvRXBwUnhYUWovNUVVdFVyMUw3Nyt3Rm5VTXB1?=
 =?utf-8?B?S1BheFhCUXZTeWhJSld4Y0krRGtleWVjOStmRXVJK3VkZHBjajlzd2c0blh5?=
 =?utf-8?B?WTNpT1dXQWxmcENlbk5uNURTSXlaMlhFVnFoZjI3OG16dUNRUmpYVlN2YVJJ?=
 =?utf-8?B?aDl4cWxTMXJJaU5hcE5tS1k2MVZDSkY0UFovNStMK1NmYzVEZHEvZmxhSGNt?=
 =?utf-8?B?Rm4wcWo4REFWMk44dW03WU84ajJnRTdFalhjSkM5QUpOYkFKYlZ2aUlrSnNp?=
 =?utf-8?B?MDROQUxyYlRuQmJXMm5UWVlHRzkwdTVSaEJMcXRrS3BzTENDbmZPek0xYklo?=
 =?utf-8?B?dS9QbWZBVG1pQUZhN1pJbkRMR3BHSWZSMEp0Y3dzUm1LYk1BK3VxaFZUdTZu?=
 =?utf-8?B?allOTXN5WmRKM2k3bFBaSk0ra2szQURKWDUrMDEydDJBNGVJZEhEL0krdDI3?=
 =?utf-8?B?OVcwaS92MFhhSnRFRVZMNnBxTVQrNGdQOUVmaVRvbkhHMVg0SFptSHdzOWZu?=
 =?utf-8?B?eTBnaDZaalM0NFJpK1FZeGlxYlJuR2FKTWUrMVhQV2N1RVJsbk5DUDA5bDVQ?=
 =?utf-8?B?ZmZIN2tpVGlyK0tMczZRTmJZTlNVVHduZTdQNklMWjZlN3VqS1YxdzZZZGt1?=
 =?utf-8?B?Si91K3pRQ2RHRVpYanlnNEZuakZOVXkzQURJWUhGd2FsczNlRG8weU1zNWIx?=
 =?utf-8?B?WFQwL0NsRHZUZk9HRXNpSkFjRjVaKzZ3QjA4cHpHOFhxbGVwb00vY20zcVFY?=
 =?utf-8?Q?2BD+MQxo0XgzOH3CiwfdKrMJ7/XLkk/QMEO1RUGZADRZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12659a4b-4ff4-469b-a4f9-08de28f09894
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 11:24:55.1579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iq9O+mB6YMuTddMEMy1KSLSTYrEq17Wl3JZZ7XjjLxk60mUK0D0Eneqg5XKg+Jft0Tb2rwMWez6stsghuho17A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9083


On 22/10/2025 04:13, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
> 
> Add interconnect properties to the Memory Controller, External Memory
> Controller and the Display Controller nodes in order to describe hardware
> interconnection.
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>   arch/arm64/boot/dts/nvidia/tegra210.dtsi | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> index 6da10db893add44a98fde1666c382511212fd43c..2fcc7a28690f7100d49e8b93c4fb77de7947b002 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> @@ -202,6 +202,19 @@ dc@54200000 {
>   
>   			nvidia,outputs = <&dsia &dsib &sor0 &sor1>;
>   			nvidia,head = <0>;
> +
> +			interconnects = <&mc TEGRA210_MC_DISPLAY0A &emc>,
> +					<&mc TEGRA210_MC_DISPLAY0B &emc>,
> +					<&mc TEGRA210_MC_DISPLAY0C &emc>,
> +					<&mc TEGRA210_MC_DISPLAYHC &emc>,
> +					<&mc TEGRA210_MC_DISPLAYD &emc>,
> +					<&mc TEGRA210_MC_DISPLAYT &emc>;
> +			interconnect-names = "wina",
> +					     "winb",
> +					     "winc",
> +					     "cursor",
> +					     "wind",
> +					     "wint";
>   		};
>   
>   		dc@54240000 {
> @@ -217,6 +230,15 @@ dc@54240000 {
>   
>   			nvidia,outputs = <&dsia &dsib &sor0 &sor1>;
>   			nvidia,head = <1>;
> +
> +			interconnects = <&mc TEGRA210_MC_DISPLAY0AB &emc>,
> +					<&mc TEGRA210_MC_DISPLAY0BB &emc>,
> +					<&mc TEGRA210_MC_DISPLAY0CB &emc>,
> +					<&mc TEGRA210_MC_DISPLAYHCB &emc>;
> +			interconnect-names = "wina",
> +					     "winb",
> +					     "winc",
> +					     "cursor";
>   		};
>   
>   		dsia: dsi@54300000 {
> @@ -990,6 +1012,7 @@ mc: memory-controller@70019000 {
>   
>   		#iommu-cells = <1>;
>   		#reset-cells = <1>;
> +		#interconnect-cells = <1>;
>   	};
>   
>   	emc: external-memory-controller@7001b000 {
> @@ -1001,6 +1024,7 @@ emc: external-memory-controller@7001b000 {
>   		clock-names = "emc";
>   		interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
>   		nvidia,memory-controller = <&mc>;
> +		#interconnect-cells = <0>;
>   		#cooling-cells = <2>;
>   	};


I am seeing another failure on -next for Tegra210 and bisect is point to 
this commit ...

# first bad commit: [3cad4369399a31277e9e20de723c665b30cba574] arm64: 
tegra: Add interconnect properties for Tegra210

The tegra-tests [0] devices test is failing and after this commit the 
DRM device is no longer bound to the driver.

Jon

[0] https://github.com/thierryreding/tegra-tests
-- 
nvpublic

