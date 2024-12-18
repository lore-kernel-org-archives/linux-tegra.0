Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2042.outbound.protection.outlook.com [40.107.220.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AC379C4;
	Wed, 18 Dec 2024 02:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734487736; cv=fail; b=VW4Oq6uhRltQTxuLPS6DiCYugcVeE+PSGrmOwpjtLWIC6sVOymy3hAquqOOz5sRBglCd4LHHSzigeERs+VZzzJyt+Ox2/vsDV+i6TZTv92bX1hUJ7dY1JFZPH/h9cTdFeQ3BYJgZIeDNiMB3H013bFgPiYNwMf/s7xgHtgwi2fc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734487736; c=relaxed/simple;
	bh=V8ZRg1fVwuBrka7CF5tNcGw3FlEAaBJF574/TTOBp74=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QpPyG2Ulxf1CdUWlr00oMTuFubUJl/7hwZnG3sakQ0vHuA0RzeC6EqY1iRSV+lAzt6yCSf/bN4tM42ifqt8Vgb5tsv+v0D0enK8XvVEMLJcmTE6+Q8vlmvXGpgwF692/dyG7+/7m3P3GrA7tOh9ywIY8GE8dMt6x2A9HxZLyj2M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=S04fOC4Z; arc=fail smtp.client-ip=40.107.220.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="S04fOC4Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L+2pTs7xi/wHc29NW+47sMLBAldGBWOD4uYJ4nyTENSWJI12WOnng6zDWjqoXH8Yjenjg2kZ8+gJunoXb+48LbbkbbIhaRGGEiclL6qWC9iYhBaoOtNqZh6oxAVrcGitGTWTMcB+nY6wShTtdy/hH2JUJxXN7wFqm8vKg0Q9EXtSTBpgcY2dUZtd1ONV3l3+4oaU7sem79olPxMTFS4if7yd9j7QX6OcidUQa33nlaiV1nbwfj1qkIUZB4jOfyk23tjOx1UgRXXoDoAnxtMKgmTZdF4Rctn4BV14kIHwYsZBwkesl7y1rPY2Yj2H9j8WUBn3yyDPWuaetKyv47umXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Okz+rD0Gpctjqw+fWfFyQKMYlWLrcBzVX1I6juNWooA=;
 b=NB8/RtL7sr+rrg6M/t1ZpH5uxgBr4zsijL/8O1EPX5aeoyaiP/CCvL0ZXtF/TAtG0wu1S0EMUCfK7zlhMIMzcXTJEO2rdIicLH5RT0LkmtwKOpXCZKtVmsGXpf0ZRaV5GQ4q962J/YRc7wdFg8IDV9K/R8i7h7zdW6SszrhB5wwYI7/kL3SMqmXq169x5a+hXFGfk2vn6ZQeeC76rYqWq5dHhD4gHSkTj2U4+kGm9RnILjsV6kNo5+GxO8ixDGLbnSXzl5W+yF3LhNbZYAO94M8eAkmJGVKzOkY8b15pbazEZWQw0LazaYyfJsX2BDePQCbe9vIzUVcwRZLUPeaZhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Okz+rD0Gpctjqw+fWfFyQKMYlWLrcBzVX1I6juNWooA=;
 b=S04fOC4ZjOpFsxT5rtEcVL1nLzqd+26BbI+6vGk/uSA2el1g9J8a49kWvHdpxegA+pQ4+yCex7gdFM+hjuQpRS9JID17WME0bcyljwV+BuyZGR7HYr9zG8MGe+0Mc7u/4JaGqPRSzORGh2TZjCXHj4kQWpj+YUPy6GqxFZzsjsCpI1XzmVgne3jR3/p54ZUCOZCh023Ly684I8cltZ3QoCKopZ8jNqIJwvUfxNLSg3iNtwPxdJX6fTKtV6JwI/9NM/rA74NWAmzatQ0c6VPNV0e8dvpZtcVVt3aGlpUowt6kTGe6NrE4LlbD2sImTUBm1kstfc5hQmNijw+pd4zjAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB6237.namprd12.prod.outlook.com (2603:10b6:8:97::18) by
 DS0PR12MB8220.namprd12.prod.outlook.com (2603:10b6:8:f5::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8272.13; Wed, 18 Dec 2024 02:08:51 +0000
Received: from DS7PR12MB6237.namprd12.prod.outlook.com
 ([fe80::64de:5b39:d2ef:8db6]) by DS7PR12MB6237.namprd12.prod.outlook.com
 ([fe80::64de:5b39:d2ef:8db6%6]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 02:08:51 +0000
Message-ID: <ea7c155a-b3f9-4f19-929f-0d9474aa2e89@nvidia.com>
Date: Tue, 17 Dec 2024 18:08:48 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: tegra: fix typo in Tegra234 dce-fabric
 compatible
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Ivy Huang <yijuh@nvidia.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Cc: Sumit Gupta <sumitg@nvidia.com>
References: <20241213000305.3533971-1-yijuh@nvidia.com>
 <20241213000305.3533971-2-yijuh@nvidia.com>
 <ffd6ec4e-61a6-4713-8be2-20d06ae5b448@linaro.org>
Content-Language: en-US
From: Brad Griffis <bgriffis@nvidia.com>
In-Reply-To: <ffd6ec4e-61a6-4713-8be2-20d06ae5b448@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0P220CA0008.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:610:ef::6) To DS7PR12MB6237.namprd12.prod.outlook.com
 (2603:10b6:8:97::18)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB6237:EE_|DS0PR12MB8220:EE_
X-MS-Office365-Filtering-Correlation-Id: fe055a3c-c098-4962-f01c-08dd1f08ea80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WE1RU3M1aEdvQ0g0WkpIeGtYbGpHcHNweTF5dzR6Z1NkL3Y0Q1VzYmxFVDh1?=
 =?utf-8?B?Tm9JQ3BpWk9sQzFCK0IwTGVtSU9qMVVDSWc5TFFvZmdjMFFncFFSd25zUitv?=
 =?utf-8?B?bUJkR3p6Z1FqMnorWURhU2s2Qk9qV24yekpZdjN6ajhpbzAvL0pJUngzK0Qy?=
 =?utf-8?B?bTNsUE55d0IvMFZXdEZSRWZzaVA3SEFkdS9WbjlZeVI1eFhBSzg2V0tYOU9U?=
 =?utf-8?B?R1dzNDlveWd1RnJGV2tkM2pmMU9ZL29vSjR2Y2l2RmdIb1JnVEFlZFFFTDdo?=
 =?utf-8?B?cXNPUTExeVA2cW96YmRKMTJia2l6cXVYaitadHArdk5uSE52Z0tsenh6b1Nx?=
 =?utf-8?B?b2hkYlR2ZlFsU2ZYSzRkWU9ON3pmaS9PKzRKL0w0cUlIVTBJZ1RMKzY0QkhM?=
 =?utf-8?B?eW1lQ2VqNXBkR0pBV1E2SXZVUVc0QWNBdDV6VE9sbzVJcFJ6Y2U1Um55dks3?=
 =?utf-8?B?UkJmU0FUYy8wclN3UTZuclBUR1NvR1puOFhpSmtxWW03OUxkSktzNVJlc043?=
 =?utf-8?B?TEpsTFJsc3ZqZWh0eWs1N1VXc3F2bkdzRmhNcE41Z0VXOFJRRVoxTmxhWTlk?=
 =?utf-8?B?dU5QVzFKYWhCYUF2YjVpbWsxYU5FRUorcDUxa3hzb1FLdXJESzhEWjlEOTcr?=
 =?utf-8?B?NE52SnY1S25DZEZjTWZLMXVMd3dvQ0Vud0QzZ0xaYkNmOHFOeWkvcDk1MG1H?=
 =?utf-8?B?M3BIMWM0WXNkRWsrUEZsbkJDQW4zbExjWWtnV1dzcmpIc29RMnh6d25HTTh2?=
 =?utf-8?B?RHNOQUFrSkRYdElIMnVoZjRKTDdvc0lrTHBmWUlPUTN5eDZEU3VUTkdKdXdp?=
 =?utf-8?B?TS9kNit0aHlvSTdCemdJbjh0TmlsWGUvYXQ3blN1dmVMZG5UcmltRE5Dck5n?=
 =?utf-8?B?UDdmS3NwK3hGMGt3TjFadE9KMXdLclhmNG16OFhqdm1sVVBTeDVVcTAvaGpM?=
 =?utf-8?B?dTc3c216MGlXa25xMWllTGdpTCt4RXdGaklQRDZPTGlSeDJ0azNsbjc0Q29j?=
 =?utf-8?B?VFZPQzlOZUhsTHhyNEVSY2ZDMkZkSWs2L1ZiZkJ0SkV6WWtUeFl2d3hUWjh5?=
 =?utf-8?B?TXVzQ3BuejZUdlorcXlkOFZNS2hNY1g1OFdzenIydEhIQXR5dmRobk0vcEFl?=
 =?utf-8?B?dmoxeVVsaWNlS3E4bUlnR2U0azJnR0lKUit5cmdzdjFrVnlUOTZtekZibTd5?=
 =?utf-8?B?M0VXcDV2cGNZaVV0THRCVHJ1blUvaGpEMzVldDBPSTMxTFRVc1pCRTEvdk5Y?=
 =?utf-8?B?QnFFVXdIenpoR2x3VlRYRFpMRXVXaUMzMTNTVzRaOWZycENna096ZTdMVTJC?=
 =?utf-8?B?VFNucE45VXlNTm5rRHlyUC9GK3Ezdjc5dmUySUx3SXVRdlB5VG1Gc2lwNXdR?=
 =?utf-8?B?ZVEzN3dpU09GOG83eU1EY2Q5ckd6VWw0Zmp0dmx3RnY3QzcxQlE5MFcxZWFQ?=
 =?utf-8?B?a0ZnRUl4cnVPY2JUd0MxM252a2tvc0NhdFpKOWNoY0U1K29xaGtuQ0ovU2FG?=
 =?utf-8?B?WnE1Yll2d3pnY0dJcVdINmpmbjJROVVIRlFodHFUdDlVSjJaYytLZlhudEtQ?=
 =?utf-8?B?RysxT3lucjJDRVhtYW5yWlJDWEhyM2p3TkRXUDRTci9DcHBMdDEwT24xbkxv?=
 =?utf-8?B?SzA4MkNQU0k3Zy9wSjk5bWVaOGxIR00rVFVtM3NHcWdLa1I1RWJuVWxhRy9K?=
 =?utf-8?B?bSsxODBTNjhLdHJDYmtydDNuNTFJODkwb0ZhbWsraG56QjdyOGcwa284YmRS?=
 =?utf-8?B?ZkxtWi9SQzJHb1RPbXRDd1c3OEcxMkMrTVlWTW1aaVhKbnFRWUtRY1EzQ2V6?=
 =?utf-8?B?aytjLzhlSTd3TGh1VDJZaGsybTJJWDBIVGVoUHVBWWhTL21OaGlMUFc1SXpU?=
 =?utf-8?Q?NfWtF+yVr2bPo?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB6237.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDFCL2R3Y3NWZDYyM2p1RE1aT212MmRRUU1LMjhCaHVhdmZsVW81Zk1IRDRS?=
 =?utf-8?B?QkNkREpTQ1VkOCtoL1RHbm54ZE12RHBCL2hZc0o1d3RIN0dKSUJwcmFqYjBk?=
 =?utf-8?B?cGVkcHBSMVRoUzN6aW9xNk1mUVVac1NOdmVmS3A2Ky9Db3R4WlljelJlVEg0?=
 =?utf-8?B?SWc1bUtGcFExdDRCNU1XcWUrdW5Ob1FubWVuQ0dNWWg2SUtuTVp0M05saUFa?=
 =?utf-8?B?ZE1DQTZ2TkFxOW9oak5iTlMvemwwa0V4c2NGRlhjTDNObzljU0kzL0V6aS9y?=
 =?utf-8?B?d09RU1puR2ZUOWNKb0Z6SEZoL2E3aEJYbkpzZ3dhQnVvam5jS2pQa0YyQ08v?=
 =?utf-8?B?S3Bhem0xQWVpKzdOLzd0VVUxTlhQemdMdkhYUFdhT0JUZ0FSUGZQSmlWUjcx?=
 =?utf-8?B?b3hId3BNZkpVZ1U1WXEvWG80VFdVQWtjK1BqZ2ZDcWtxQ3NTS2tCTis0SG1p?=
 =?utf-8?B?YWo4TkdiczFBejFlb094RWt3MVUvM1ZnemZZNVJTK05HUHdVQ2s2MjR3cVNh?=
 =?utf-8?B?RkI5Nit0UHkweWdFZ01vQk5VUHByQkxJV21rc0N5NGVzekQxR2tHREdEemdV?=
 =?utf-8?B?cDUvb1NGdHUrTkhvWG15bmpFS0dUYTNwc1JGUm9kRGo1MzJaQmF5UzNPaHVy?=
 =?utf-8?B?TDIwSWVHY2RrVHNDYzZmeG9zeExuQVdubXVFcU9zYzdrNTJFOG9wb25XaU43?=
 =?utf-8?B?U0xYUzhZMFc4ZlZJWHJNd004NXFJdHArVDRyRHFaS0gwbWFzZXM2UG90MkZv?=
 =?utf-8?B?dE1CZytsbUh6NW84Y1R3bitRdk5EcVNRaFlBTit3SkJwNEd0dVpYQ3BTZlZj?=
 =?utf-8?B?eXUyU3hVb2ltNTJid29tMjlzZjdlbHlkY2x4T3hySUg0YWMxTFJ4WjJoWmVX?=
 =?utf-8?B?MGRybklIUWZpVzYzVjI2MldHNnhyR0FpYy9jL2M4ZmFmUEhpTWhHNEt1bVNk?=
 =?utf-8?B?OEh1QmFYZWpIWVh3bW5mTXliQVpTbzhkdVYvRjJKdVk4Z0hKNXRrajUxWStx?=
 =?utf-8?B?cEF4ek1DZVZUNENLRnNBTUY1S2NTOHNPRFl0TEYxcVJIL1BaNS9qTVFjYlo0?=
 =?utf-8?B?OVczMC9zNUFPNEdDb1B6eGQ0Q3JqbE1pdEFVRXhaZSthQjdxdUppamRyY3g2?=
 =?utf-8?B?SW91ZzJ5eWFTYllBQnpqeWtpbHZpREFlM3JBL3NiZDZwRktCOHZjN3Y5UmJl?=
 =?utf-8?B?dkZFOHVnd29pNEpYNmxEUDJKMmh3T3lJdUlkcnk5U2w3VStaVmZLMUNhZUds?=
 =?utf-8?B?OUNJZFpEUFV2WHp2MnFhNm1RSUdpWGZqRGlkUFVJUjkxNkovRUZsRDVkKzZL?=
 =?utf-8?B?MjU1ekQvZjRQUi9xck96YXdCLy9YVUcyeTJKWk9VOTU3cVFoYmlZNHNVYXNw?=
 =?utf-8?B?cnFNTzJPU1lRNG0xZ0ZmaCtNQ3FyMzdBMndaMUpyazVZK01LT3RzcVUrTzJQ?=
 =?utf-8?B?WnJiTXorWkswbERmQjlMaDZyUS8xTGNjZnJrTXVjVUpLR243UVMrdmVWYWxV?=
 =?utf-8?B?ZGkyYitPSEgrOVNzM1p5WlVtSUtGVm1DRWhoR0VRZkNFUUlZOUtkbitwcTln?=
 =?utf-8?B?WjNZUXlwaGNZRm80ekR2a2M3UnJBQldrMnlraUZtWDIvcWtIc3dmZTlkRkw2?=
 =?utf-8?B?M3VwSUNrUVJUZVFSbzFhd3dkR1F6M0VGZ1NkdjhyOU8rWGZWekJjUDdQOXRY?=
 =?utf-8?B?SFlnTDRWOXhlQklIcDBBTDZyZUtKWGJvbExuaHpsRHJRYlMveDJxc2FQaWJp?=
 =?utf-8?B?OVJaN2NIYkZoMEJONVR0bVMvSWUzUjFlOXZxNnl3ck1rTDJOUGFHUGNCQzVm?=
 =?utf-8?B?VzFoR0h6WW9jNktqQmlmUHd6Z1NsU0wwcEFHZU9HdU5uMHljMWJCSzNDdW5k?=
 =?utf-8?B?Qis3U0FsNi93cWJIU2FVeXNQUkh4d245aCtyRUJpczlXbll2Y2NVOWNuTDl5?=
 =?utf-8?B?RngrOU1pVGo0b0I1WEVmYlFGOFhQeTV5enMvZ0R4RlZyYk53WVkraDdaOW9R?=
 =?utf-8?B?Q21FVEZiOGdsNG93T0R4OGQ5YXdORXplZEhPT2VaMzFGWUFpWVZnaTVkbHA0?=
 =?utf-8?B?d1FXNEdkZHhnQVF2Q1BoRVI3NGpSbnBOa1duYzdQTHhoZk5OWnpHaUJZNjFo?=
 =?utf-8?Q?XNlsoru7yJesCKqCoNtPNiPnx?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe055a3c-c098-4962-f01c-08dd1f08ea80
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6237.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 02:08:51.2968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VtyUyBhWW4CaNgAZY82ADrtldnLCWOOWEQYQie7Yp9XmOcHqatnbMgWSqLZI6vkbMFfhx9YGINvHZQBCzrxHig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8220

On 12/13/24 03:10, Krzysztof Kozlowski wrote:
> In what way fix? How does it affect users?
> 
> Why no fixes tag?

Thanks for the review. Ivy has addressed these in v2.

