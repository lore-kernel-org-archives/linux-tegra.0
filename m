Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2052.outbound.protection.outlook.com [40.107.93.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A2E84DFE;
	Tue, 22 Oct 2024 05:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729575080; cv=fail; b=UGh90ycuFA8jrnx+GqJgxdr8NYsDhiXfqSkuhHoCP6hhOxbs35XwjaSZZnzk71vwoqX7qtutdvCHz2yq245fI1j1ALOs3gVONDPEiGkYhEhisQM/nflVFn/ghI+7FFYKQaLOPsevG7EygI7LNlB3kq1Wxh5v5Trw0xHucStUfmQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729575080; c=relaxed/simple;
	bh=EN45V5w2CBL3vHDBBqCrDEyFgw6yu/pS5qPtDj7aYY0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mLn3kIvnWbw/Sm1pYMfKYHexNx/LBRPpw+lg+0eA83J8MPonibTtNSR2sQ0baQ1rPWdmUxq2mWB35xhtLYXqJiSiXwSVep4j70zERkj0wVySQIDwM04BhLtjlyY8aRG51GGlLhDyVUVM7McejatmxrCXiZBGl+RE1vHGJGyG8yo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tqCJgDWg; arc=fail smtp.client-ip=40.107.93.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tqCJgDWg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HADAh0GuLmBZ+QSdI5DCOOn56tbC0/7tz5nqv7l92ZMscTySJXRr5FsbkRzr3jzaAzkpaI8miiggA2iUO1RhYwSqZ7xKN5oUE6ij1hRXoeXiDxEz4547WxESnGX5e4N4DvaSwWz3gzsSt8HmtjLLjbOgBc9JwfQLBo8mgkWWUZ6SyC6HyDlfRTJJ88gXjKYGif8cmNiA+37qu+eRHYHy53Vr7dhccU8xKdrTpIJWw1YzYw1VeFztP3Aat0UaC64eVVLrYyd63B2ghELqV2bRUb+nCkbza/0ui+DcxgloHWtUhMv1i8/7Ex4mhRdJBc3CIGOGF8gt+KsBNuD7c+dXCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fGh3VXHBPfkXTsyiO+nvLN02M7Ev7dRdfb71RrPwHwU=;
 b=pOVslH6c9n9eTnWjnuyNVkm3YlVmVL8jtp0Wx8x7QfN13bvPxbinPIeMFws1vjYgC/hN8g6hndLB70jJCoR9FkN6MHj3FjtKKioOYl39rFs2dIYe0qMG56xBLbsbh2HhruqQ+tquMSopgTTjg5C3l5CUkLBr1NaUre+kzPWY5Ze5HVfPwjBuucjMNQrQWwwsjC8QsvH6yFX8nVjH0EVU2y5cgXKoFCmV+JSRHzbxpHoQ4X2r5xS5xIt+Op0bnN+QtWM0kspOhI8RoGmbYTIT0hMcqax907GIGjfES15P2b8WXW69GO8Vrk1hgMug8Co5U9e85p+auwpPCH6RxPUI/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fGh3VXHBPfkXTsyiO+nvLN02M7Ev7dRdfb71RrPwHwU=;
 b=tqCJgDWg5QxgNYlI7iEDTR/BZVfqg3e7r97r4vKlybgOOWrRqvwOT868sFp59Wy935dlnrIo/DrpWbaXC8XZidwDYGX4JFEkRgMfZfB0QKAY3Lt+sodeRgaLN3avmSKNP2xEhutOYEQwLR8r0I1CQlCye47dE2J8YxN4H7tKLRFME2KTiTTqp6lWHiyCsQRgOz9jqCRhuH1UCEZG+quIF57L3p+eSbP9rhwfuF1fTwYo+VfHSlItPdnEplRRKKA4ImGJEXQsQwbFq2gewRvUk0L1C89mchpWIct+VCKMq3545HdbZJHcGDX6lMN7xplwQpwQYKsYa4AK/aXOFnoa+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9237.namprd12.prod.outlook.com (2603:10b6:a03:554::5)
 by PH8PR12MB7375.namprd12.prod.outlook.com (2603:10b6:510:215::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 22 Oct
 2024 05:31:16 +0000
Received: from SJ2PR12MB9237.namprd12.prod.outlook.com
 ([fe80::be92:6add:7086:6020]) by SJ2PR12MB9237.namprd12.prod.outlook.com
 ([fe80::be92:6add:7086:6020%5]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 05:31:15 +0000
Message-ID: <be5a4452-5042-4785-8ac1-6f5cae7fe871@nvidia.com>
Date: Tue, 22 Oct 2024 11:01:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: tegra: Add support for S24_LE audio format
To: "Sheetal ." <sheetal@nvidia.com>, perex@perex.cz, tiwai@suse.com,
 broonie@kernel.org, linux-sound@vger.kernel.org
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, jonathanh@nvidia.com, thierry.reding@gmail.com,
 mkumard@nvidia.com, Ritu Chaudhary <rituc@nvidia.com>
References: <20241022041330.3421765-1-sheetal@nvidia.com>
Content-Language: en-US
From: Sameer Pujar <spujar@nvidia.com>
Autocrypt: addr=spujar@nvidia.com; keydata=
 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
 tFh1Kv06N2eJoLklRzTKy6I=
In-Reply-To: <20241022041330.3421765-1-sheetal@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0010.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::19) To SJ2PR12MB9237.namprd12.prod.outlook.com
 (2603:10b6:a03:554::5)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9237:EE_|PH8PR12MB7375:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bffcd79-ec9a-4ce7-bdc5-08dcf25abf9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bWxLeGY2NGM2R3htYWl6QkxhQ1FISXlRdE8yeGY5ZjF3c1A4dmV1OEgyRlJp?=
 =?utf-8?B?TnhYTVR1SW1QZGd1Z3BtWVJ4SVBEZjZ4UStiTFJEc29rUnUzT0U3aE1BVm8x?=
 =?utf-8?B?WTYxTEFncEcyTXc4b3hyVSs4QlNVRHJkd2VmNUdWazJEcmk0N2ZlM3FFbVQy?=
 =?utf-8?B?SktnNFFzTzRFOExlS0t0Yy9PdTFwZFZkMXR4ZDhmdFJSdmVZUVZ2dkhQWTFJ?=
 =?utf-8?B?YVZwNDIwRDdsMXU0V0VQZ00zNlBBKzg1ZjZBUnVpQk5TaGd0RjZQNHExZEFL?=
 =?utf-8?B?VnJvK01Ra3pNcmw4cEZ6UFhjR3B1Rm9SZU1udVh5ZEkwekNvQW5nNk5ROVZF?=
 =?utf-8?B?eWg0dkRWU3dRNG1QeTNqM1VMczlydkhtUk1CaXpLSExoZGIwZzJnbjU0b1li?=
 =?utf-8?B?K3NoVjcxYzYxTGdiMmVYK3ZjTStLMFZBelBFemVsNEFwOExmb1lKeWtXRTll?=
 =?utf-8?B?aHAxRFlEcTlqbklBL3RYTkVMNTA1aG9sZG1ib0dWOEpwVjd1bmJOUnV0SDFu?=
 =?utf-8?B?YzBzUm1QRjVIUWFrSmRyVUFkL0xodE1oY1hjdUZzU1JsbkVzbXlNc0JMdnNz?=
 =?utf-8?B?NVY4RVBTREZ3eWJ1T0VYYWxoU0luYzlFOFU3M2EydWVEQSs3S1l6QXdzNmJT?=
 =?utf-8?B?cUJLVDFVU0FhN2NRTEREK1VBZFlsMjVpbHRrVlQ2TzFxZXd6L1pxUjFsdUk3?=
 =?utf-8?B?OGtJNnMwQXpnbFAyTjVuTUlIRjJmTGsyUVRlVHo4eDV2Uk15ZzllNEJUa0c0?=
 =?utf-8?B?Q0VWSnUrZDFJUW1JTjZoN0huVFQrMTlKdGFrOTdOaVVvV21Ya1J1WEp5SG1T?=
 =?utf-8?B?U0VZeU05ZjlXRzBjeE1Pb2Z2SkJDZlovQ0d3b3ZhRUNieGo5aXNmZmhjbHZx?=
 =?utf-8?B?Z21oNmFUa0FFYjhVd3dQWFlUbWVVU1hjVXlyZ3ZyYW9KdlFtVHVkYW1rMGlS?=
 =?utf-8?B?SFFvSGRQOENpQlFSZ0c3QVFjZlJ6enZ5OTJDTEl1eFBVbW5ZS1pML05FNXJp?=
 =?utf-8?B?Q2VmbWNIQWNUTXV2VTdWaS9rNUNwNHJ1aE4velhnSVhYQ2RlSjBBRWtXYjRU?=
 =?utf-8?B?TTRXUDdxZjB0KzdmdUZ3TmpXSW8waEZiQzF3RDNWWUdzVVB6cEFyNFY4dEFP?=
 =?utf-8?B?eVdJVHZ2bXExV0dreERoMlQzZnFSaTZhU2xYM3cvTU5NTlVEdXdPZ3kyMlNm?=
 =?utf-8?B?UFZVcENEWUtPSlcwQ28yRlJ0a1Z3RXp0SmlRaVA2T2d1TVkxNnQ4SzMwT1F6?=
 =?utf-8?B?UU1hQkVlVDF2ZnRvRlU3V0dOV2ZDUFpZd05FMmo5V0NEdVhpL3F2TjhuN2RU?=
 =?utf-8?B?elB2SzNKMElvTy9vUlNQdUFQOEtNeVFHUHU4c0ZvdDczeVdTbEpsa0pqVDc5?=
 =?utf-8?B?bHJMRGwybGdTaW1TS1h2Y20rUjdKQ2NJZUxDVWpDekR5TEFKc3ByKy9HMkM5?=
 =?utf-8?B?TTFXOU1IOVVseVFsZFQ5bjdJSExkVXA4Q3FsdWZybmcweDFZV2VrbHU1d0do?=
 =?utf-8?B?Qmo2Z3NGVHByeEkzNHhtcy9zb0ZyeS8zUlZheCtFZDhTL1RlNm1vZTNhYjhp?=
 =?utf-8?B?RHZwODNXWnBvWmFTN1hYNXlpR2t4U3RSaVptMUVTaU1aenZieHpqVGtkd3ZJ?=
 =?utf-8?B?K1c3Ni9Mc1piRkx4V0lvTlNScG4vTnRUdi9md2l1bWVaNnVVS3NSK1RIVzho?=
 =?utf-8?B?STB6YUV2SGpFbm04dGZNd25uekFHU3RraTZPUWRhUlZENDdhMmViU29ubXVB?=
 =?utf-8?Q?CcnJ3zKcMAwIlzUUU4ilLoTFHJV3JSPNi/43HRy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9237.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RStPS1MzTTB1VGg4SHN4V1hGd2gvSEJIQUV4NXp2ckxLZU5aby85UGNBak9l?=
 =?utf-8?B?TVp3aHpLcWpRZUJMRDZvdzliZFhDYmhYNWliTzZHU1JCdVJzQVRsTnpWU01z?=
 =?utf-8?B?UDdOSVVuUFp5Q0FUanRqelkwaE9yVkI1ODBXb2VhMWRmM09FVFJkYkNOODJx?=
 =?utf-8?B?TVN3M3BudlJhMWZDNVhsdVBQanJJWEpHSm93OUFOWWtoNkxZZ2dMMmZnd001?=
 =?utf-8?B?ZkNCdyt4bTB1a3l4dU95WUpmZzdmWmhaM1BoS0ZBVlVhMGVnZUY0QUdLZzhF?=
 =?utf-8?B?aEoxMXlFaW1PQWxSZ1lwaVNVU21ySEJLbkhoeXkrSXVZb3hVcGx6QUFqSWdv?=
 =?utf-8?B?b0dRdVkrK1hjSlhHejZ0bFZ1SlR0VmhNRjNEZFFPTVhSWDRSY0FQdm5pQ2pS?=
 =?utf-8?B?YWVSQTBOdE9ndXBLVGhqRnJoYUxRV0M1aHdXMHRLTkU2eU04T0RuQ0RkTGVv?=
 =?utf-8?B?dU9jeW13TXFieE1rUHBoOHVGTFVXVXB6bjdjOFZyWDRzcnhHK0lMTXE3S1dq?=
 =?utf-8?B?WTF4VFNnR1I4Rzg3MWhsbGxsbGlpUm5aOVh3ZTZIQzA3aHRqUkx3Z1B4M0dj?=
 =?utf-8?B?WWl0VE9hbnZRNHJqVStXajNwRWgxRDhTZXl2eUhRcEFucHdlN1FuYmc0emxw?=
 =?utf-8?B?SUhZMWZYSDBXK1dJemllL2RwQTQrbC9jUVhwUFNxVjRTQ3dlWXl1c2dPcmdH?=
 =?utf-8?B?dmJmQlIreEJaWGNMc1FQSVJuU1dCT2JZbmJONjNTL29oVzlUWFNydWdrZFZq?=
 =?utf-8?B?THh3NGxvdW5tT2pFc2s4MDJKREMydmJFMDJKeHQxMWxBOG91WlNuQ0Y5dXVD?=
 =?utf-8?B?MXRVdmtVUFRPTVozUThsVi9mbGdwbUplSUhUSlpEQzlXeEJxVHdhcXc4WVY4?=
 =?utf-8?B?U091KzJkYllnMGN4dGJVSXRkWFBpWDFzSGhKUEQ5M0Iwa1MwTUhZMkFFRUpB?=
 =?utf-8?B?UFVVTVV4dGh1QWxHc2dJYlFHb0VqU2M5QVZEYm03MmpRNkdnMFg0cTVBWDZX?=
 =?utf-8?B?N2FKTW8wd1ZrcjB4M2tzbFhHMENETTZ0TEEyeGI4WmRkeXNhQWhDbDFxT3ZB?=
 =?utf-8?B?TExKc3hmSXg0cXZtQWd5VkZCajl3YmlrcVJ0dGFZeWlrdktvMlFaVHlnRFQv?=
 =?utf-8?B?clo3amlLUHRVQTJKZEh0SWlwRFFrV3BpOS9qYmtaRGFZbjM3TnlXajVYdnhI?=
 =?utf-8?B?ZDAxbnQ4dUdXNzBTTnJoRXhSdGFZMEVubWc1blFUTGRTbDVhZjd5aC80cWR4?=
 =?utf-8?B?d0xjdCtzcTFlYjVZWElwNFh0MTJ1MHI4RCs5R3dMQzQ3RVNLVjlFY3h5Z0N4?=
 =?utf-8?B?WXl1RzFZTFhGZ3F0MlZoRjJaeFQyM1kyUVlUa3RSR1FlVFR1aEhxeitPN09J?=
 =?utf-8?B?bVZ1RWhzY3RwSndnWExSUlZIKzVsTVhSK1l3Q1ZEalFKc050QXFncFZhcnlm?=
 =?utf-8?B?d2dwNFFBLzd1N1dRVlloU1ZjZHJ6b2lUVXprQXZPUnJONWwyVno3Y3RTRUZj?=
 =?utf-8?B?UzhhcUYrZ3AwWTEyakMxZk9xWUxlaDB1c2xjbUdNQWFXdG1GZnNEK2lYSFYw?=
 =?utf-8?B?dG5mRDVXZlM4N1VwUmV4SGs4cTlZSFpEbjB6aVBnTDQrRlZxSHpoQUIzQW81?=
 =?utf-8?B?MDkwUyt1MGcwTHV1aUp6VHc0Sy9CVTJVbjhYRWREVGVoREZCY3FramxkRGRj?=
 =?utf-8?B?Z05mQ2FFaWxyNzlNdkdXUVNaZ3h2Zm9GNkZyZVdPMlR1eVBZYW83NFk4Ym1D?=
 =?utf-8?B?NkhrbW1leXc2UWRkU1FGMDdqeUVtR1ZYVDBBcEhMSmNUSVJMbnhIL3oxbDhV?=
 =?utf-8?B?bEtSOXo4YTlIUVdmOHJjSVBVbC9IV0VjS0M2WWp1bDVCa1BCOHRuN0FOS2dZ?=
 =?utf-8?B?eE1FRUYza3Q3eFFUakR6SE1JR3JvRlVIZDhwbUlUT01qVjdRSldOcWo4MFlK?=
 =?utf-8?B?aFQwczRrcDFCZ1gzcW9EZGNPeFZQTWdCbyt3dytWYnl1UEtpZWN4N1dLamFR?=
 =?utf-8?B?Z1VObFdTY1VSVmJ4R0IySGVBZnRXeVlpaVJoTkV6YUZkUytERWd0TWY5MGVo?=
 =?utf-8?B?M1hUeFYrSE1MaTMyYW5WOEJKUFdhWk4vdDV5ZUJNTVdFajBRVmNqdzJHY0ZB?=
 =?utf-8?Q?3zM0KSp0HElSZNSqI75UuI8yG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bffcd79-ec9a-4ce7-bdc5-08dcf25abf9c
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9237.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 05:31:15.8577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zhEQ1kR4TfQEf1XbmpPbRudNwuWf1dItmzRaK8WUdTUPfXzH+cQLHbac7vrvUn4ye61q5ryQUZrLyokGR8e8dQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7375




On 22-10-2024 09:43, Sheetal . wrote:
> From: Ritu Chaudhary <rituc@nvidia.com>
>
> Add support for S24_LE format for all internal and IO AHUB
> modules, except for ASRC (which is already supported).
>
> The data flow happens as mentioned below:
>
> - ADMAIF picks 24-bit valid data and converts it to 32-bit before
>    sending to internal AHUB modules. This makes the driver change
>    simpler for internal AHUB modules.
> - IO modules CIF converts the 32-bit data to 24-bit before sending it
>    to the external world.
> - To maintain consistency across modules, conversions between 24-bit
>    and 32-bit occur either at ADMAIF or at the IO modules CIF.
>
> This feature has been thoroughly tested and verified with all internal
> AHUB modules on the Jetson AGX Orin Platform, as well as with the
> external RT5640 codec.
>
> Signed-off-by: Ritu Chaudhary <rituc@nvidia.com>
> Signed-off-by: Sheetal <sheetal@nvidia.com>
> ---
>   sound/soc/tegra/tegra186_dspk.c   |  3 +++
>   sound/soc/tegra/tegra210_admaif.c | 11 +++++++++--
>   sound/soc/tegra/tegra210_adx.c    |  9 +++++++--
>   sound/soc/tegra/tegra210_amx.c    |  9 +++++++--
>   sound/soc/tegra/tegra210_dmic.c   |  7 +++++--
>   sound/soc/tegra/tegra210_i2s.c    | 14 ++++++++++++--
>   sound/soc/tegra/tegra210_i2s.h    |  9 +++++----
>   sound/soc/tegra/tegra210_mixer.c  |  9 +++++++--
>   sound/soc/tegra/tegra210_mvc.c    |  9 +++++++--
>   sound/soc/tegra/tegra210_ope.c    |  9 +++++++--
>   sound/soc/tegra/tegra210_sfc.c    |  9 +++++++--
>   11 files changed, 76 insertions(+), 22 deletions(-)

Reviewed-by: Sameer Pujar <spujar@nvidia.com>
