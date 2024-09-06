Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2078.outbound.protection.outlook.com [40.107.237.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F05B1C8FB6
	for <linux-tegra@vger.kernel.org>; Fri,  6 Sep 2024 17:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725643390; cv=fail; b=MUWJvkx19bvnfc4ICqG1xVqdzTjWqPbCYRzxFiOsQhELGVPVZhFrkObVmIdqOBBaA/uXMHn/SFnvcJE6jmT+0K2rIs3+YMA1GY2AgkiK4JiObUQpHmWJABuT8o9fwuVzXpjVqaguk0MttXRzATvAFVRHpVYJPl9/mGoilqwbP/0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725643390; c=relaxed/simple;
	bh=Nmfn1tEYVp+HexrX6TcAI6LTi4dNGlSlkmgMU9boeU8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lRhE5wG98MV30c7q57FagMHrmEn4eWGRt2PB/7iczdLp7KsOj8rXjYv52b3QBQJZJcXgPB2K/zxAwN0CbjYzmjEdiSYvinycMLHtCx5bx70exy/NfCSXyUCVA/9Gr0d6jbokUq09LQe8FOW9s4jNBM6o47r52Ht9qYs9j6qtE8s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=n8xLePdy; arc=fail smtp.client-ip=40.107.237.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="n8xLePdy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qvpiGFOKlJDiCEQSJp0sUVkSLA/97AP7wVBmNaQq23uIABgf+iVIBIREqf+BjztOqSCgQDU6aRrPxW5Z6kwzG+nshV7eRJFcGCvwTUqp4kQSikUWI7iWmll9Jl8efRCR2Hu8cM+77mM8+zgSRXs/bRt/VZS9PLqGykJ1pB6u/B29fbY6gygB0fsn3uABVDxocg+s4ZDwjmM7c4Dx+TWk29xp0t2+wx1zMz7XfY+8zLrU4S580xJa+Ab6nYVIRz6fpe+1UWHWdF/kOtGTNOJWkCfDW/gLsHZbI8WPV6ICnwNuuQixGUZBWOVKRYWuspbNffQC1sSCTjb7FrbAxtgGAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ffYFxZia1M2ps0jdAjCyXg+bXPF/SqEkr8DxQdSjiqM=;
 b=MDPEJz8dMkI57TdHgs46kmIoYHrL/0l5SxO/r47ufusHY6dLEGNtcdtxS9XMSK7ZK8HsAcfQNqFhHICjhv0/Qk2Yvcw5dZijAlWMqxah/YCYRBIbvFvuqGrpC0te4QdmTi6jW++Y4Dyg9r8eWngxlHst83G7EIWsZnk99T/0nVmkG8C2a3aYmfhX2IVmCrPEgLQIWCWj/5gzHiY4Y0SArhRz61ervS1cw/CdHNxIyL6emIagR0/BGMsVyrboQ+JUm7Hwf0gHg/FyN2NEDsKVmJGblWI4zLJFbobRD0/2jB4OX9U7AILj36gPfCi8w2wjrc8W51kJu1bUsgCIHhCZBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ffYFxZia1M2ps0jdAjCyXg+bXPF/SqEkr8DxQdSjiqM=;
 b=n8xLePdyUTqu77Uf/W2WRyqClq2afPrSgJ4vWktmyrMHUeOw6rQiQ5+XJUCghKaTawITqU2WUir6mtowCD+xPaOWaBsFlY1cvA8DcflDpkdbFFnhpAbw3lpt4qKldfm0lw3gnhfkFJCuWW55q0MbFUXX1/qRNrBjwktX8aqruQn9cSbWO8lplIj70pkjPP8nVC/P2E1fiiaYKjGiHNBXHdko3xe4aFu1OvRxZzgRoSZf7kD6VgVGIDCcD90dv5Luiy7tDx6Q+6pNLXwTu4pGP+5SIeSCHr+lvtLl3b/zTBdd7QvEWLO6gRdvQb9Os9DodFlZoucFgl4ZsKfY3JESNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM8PR12MB5447.namprd12.prod.outlook.com (2603:10b6:8:36::7) by
 PH7PR12MB9102.namprd12.prod.outlook.com (2603:10b6:510:2f8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Fri, 6 Sep
 2024 17:23:05 +0000
Received: from DM8PR12MB5447.namprd12.prod.outlook.com
 ([fe80::5f8:82ee:7da9:219b]) by DM8PR12MB5447.namprd12.prod.outlook.com
 ([fe80::5f8:82ee:7da9:219b%4]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 17:23:05 +0000
Message-ID: <c64154f0-25b9-4943-a3f5-52ee08b5f3be@nvidia.com>
Date: Fri, 6 Sep 2024 18:23:00 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: spansion: Add support for S28HS256T
To: Michael Walle <mwalle@kernel.org>, tkuw584924@gmail.com,
 linux-mtd@lists.infradead.org
Cc: tudor.ambarus@linaro.org, pratyush@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20240830030841.24500-1-Takahiro.Kuwano@infineon.com>
 <D3T1W2VQFGNG.14DUML0OSKRH@kernel.org>
 <66c8ebb0-1324-4ad9-9926-8d4eb7e1e63a@nvidia.com>
 <D3Z80PI18VZB.1ZLQ2TMR10UTG@kernel.org>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <D3Z80PI18VZB.1ZLQ2TMR10UTG@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0320.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:390::13) To DM8PR12MB5447.namprd12.prod.outlook.com
 (2603:10b6:8:36::7)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR12MB5447:EE_|PH7PR12MB9102:EE_
X-MS-Office365-Filtering-Correlation-Id: 89d51984-4980-4454-5ec8-08dcce98917f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NFl6TlpSbHdnR2crN2JmSDBaOVdiRXZTUVhuY0t0YWNEdnNOVldaSG9ONmxZ?=
 =?utf-8?B?KzRDVk5kZFByRTQ0R1hkVEp6SHFzUWdiNVZKQTlXQUhtbUsvN2I4NEVnL2tD?=
 =?utf-8?B?d1N4aDhDK3I2azBJbFk3Z2xkNVdpQUxTc0ZwSEtncDlNeTdOZWhHQzVRdlFi?=
 =?utf-8?B?RWJBb0tSZmU0M09nM3Z6VThicmd0c1gwWkxDeFpFdy9EK2RNVDZXRzMyMHpU?=
 =?utf-8?B?dE8xYWoyOTBRUitwU2xETC9oWnZqMGR1N29qMm50cHRyc3NPWjNrSU1PVkxT?=
 =?utf-8?B?ZEhnZFhQbkFQcmYwMlZVRlRuU2dzUkU2UUtLUjBFTnUxNDIxVG1jc1EvQ0lS?=
 =?utf-8?B?bVQwdFZhUU1UelE2T2w5RnJmOHVXbEFIUDdCa1piRXA4aXBOaEdvL3JXUTc0?=
 =?utf-8?B?OExaQS9mcGNCR2lqdkFjUUcrUXIva1l2VUR6S1k4TnZpa1RlV1R3d2cyUUph?=
 =?utf-8?B?NUpBb3lFSkF6THVzUGRvdUttT1k1OTZHd1ExMUhsZ1JoSEJCRE1qR0h0ajFm?=
 =?utf-8?B?SFowUzN2NXAvbGl1ZGJkQkMzOC9jbUxNUWx0TWpJSkxlWGQ3K2RocS9aZWtY?=
 =?utf-8?B?RlNIazdQMkpVUE1JZXhkcldBTTlVcGdCblUzdnhQeFo3c0x5TE93ZkIreU40?=
 =?utf-8?B?bGVqSVNZTm5Odm04WjdjMnNjeEJNUEdlZEFtOFJsMzRDcDZBUWcyV3lkVW5v?=
 =?utf-8?B?MEJoOGNmbjlLZlh2amd5Y1pOOUJqNldCeHhsUE54dHpTSUlLNkw0WGdTRDFD?=
 =?utf-8?B?YjZJdFNuc3VaMVl0dlRlcXVWMFM2VC9sMEZSTzY0amIrSTFWODNMTlM1L05s?=
 =?utf-8?B?cnNMTnJsN3NGbUdlNDNyN0E3SCtCUS9DZHowMXNNbzBNUlp6d2ZRS3lIcERS?=
 =?utf-8?B?VGtJaXlxRXloK2ZvNmt4b0Q1aWZtR3BBSUFBLy96eGd3eGlONzRXSG5mMXY4?=
 =?utf-8?B?WWhabDc1QUVmbXkzYUNENkdLR2pLeDhIclpVeVVxRHFDNUprVitoM0xraVBZ?=
 =?utf-8?B?bFFnQUR0K0l0dVVhUTE0ZjE4S1FXa1Y4Y3RkU2xOdEg2cWF3TFlQM1A1c2Qv?=
 =?utf-8?B?ZEFmRkZFUXRveFNVWS9mUmNjVXpQVHdQbmxrWkZsa1U3TGV0dmI4YWlGK2dt?=
 =?utf-8?B?VURlWGdFWDVOUFErY0I4QzRxQXNxNzlpOTByc2xtMTRjRVFrZjF2NGc1QXR5?=
 =?utf-8?B?dHdkT0VhQnQxWmE0bkp5aUMwazNyS0NLcWhaVlk5V2JSM2hKeDl5R1dybTEw?=
 =?utf-8?B?TWV3bVBvSFpzMlVSa3grVmo2b2dyeEFuUGJ4SWhEWnBuWFl0VnRBRThSd2RB?=
 =?utf-8?B?YTF2MGlOcCtSZi80WHc0OVhhU045dFYrbXZSQmhJVGMwRUR0c2IvNjN3VjNm?=
 =?utf-8?B?V0poTk9vdlJxT2QrSjU2dWFNSVRldHd1QXFpam1mclhOd2FiWW5pcVIrOEtX?=
 =?utf-8?B?MUxFdWJ1dXd3V1p2d2t2aGJsVTIxMDJNSUJTV1d1VzZNZHV0aG5QQk1uQ0ZC?=
 =?utf-8?B?Wkc3Q0VydHQxd094cy9lWDFjTy9lOEpQdjVRa01NZU1Sa1RTeVlWbW9mOWY2?=
 =?utf-8?B?aXVKSVpGWFROSWRTOFkwcFBlbWpWUDVwYmZUbXExdUNYNmlxWUZjMVl2dHky?=
 =?utf-8?B?eEgrbnM5NWFBWHFHSm5Fak9OMkRxVDFLTVJhUWp2MjYwWmtOZkV6Vk1lSVhu?=
 =?utf-8?B?OTRKMXI3dk9MZ0xic1Q3ZWd0QXFHL0ZTME1LZ1pNK1VraUtBTk0wVllaeXFC?=
 =?utf-8?B?Nm9lclNXNFc5K1B0djVSRFpDdUVsU1F0YkliaWlKaWhaV0xKSWJqYTBlb05l?=
 =?utf-8?B?NDNNQTJDaXlKRlppVzRzZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5447.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVhrQVVKS3FCTFFzMFMxbzVJVmNXMHBiUFdpZThQZWd6UjBQRDQrTWZQNmJj?=
 =?utf-8?B?NFV1SjN0Y3p3b2NFbnUrWE9mUVpkbkUrSzhjZzUrNkFPMTJtRHpOdGZTa1BJ?=
 =?utf-8?B?cjBjek9JVkRpakZzMVk0L2VGUUE5WmpvK2Y3UjVHZnJjNFY0SS92R1IzdWlm?=
 =?utf-8?B?MHo0bDl1UXJjYnRHYlpiOTV0WE9Fcm5LeFJEanNEcFJLZHpWWVoyRjZLazBr?=
 =?utf-8?B?ZTExM3dUS1BlclMyUWFzK3RBaTUra3JhVkViN0RRTGRUc1ZLYm1kb3lGc2lq?=
 =?utf-8?B?c1FiaEdNZ1BqbFM0UGU0MlZUTTlWNFBrOTQwbUhlOC93UzZYM2wwWU1aUlh6?=
 =?utf-8?B?MTBnd3Ardkl1TUVtMXJ1WEJRcUpFNTk1OTUybVhvQlpBeXZJdU52clFEUUlD?=
 =?utf-8?B?ZWpMSzFvbDVoL000QVFzaHc2bjh0WGhwWm9rZmFvOWFoNUxiU0ZrQkRDa3Br?=
 =?utf-8?B?SjlHQnd4Vm94aFBrQUVyK2h1Um11UnNheFpseEhMdmoxbVYvY3drdmFPMzJC?=
 =?utf-8?B?RkRhaERudHNHMWxSS2h4TlRSS1o0VmtUSDdDekhhVFZUTERabTZMNXVieWpv?=
 =?utf-8?B?SkQ5aktEcGw4NlF4ODRkVGN6S3V1Uk9ZZGlxM1dvOUhDQklZbzJwM1F2cXNL?=
 =?utf-8?B?QTBPZU53OG1DYno2Uzg5RW1ZWlhabXhXODJqbFVhWTRWVnFWYnV5K3R0dXp0?=
 =?utf-8?B?bkp6NkRJaU5mOHRxNFY3Qy9ZTEs2c1pEMG1SZnVUNnVyd1BGc3hzY292bjlw?=
 =?utf-8?B?aEtCWnJGVEZBUXJQbjNqdVhSUEwzck54YktKNDNGU21MRVBwbUZXSGdxdHlT?=
 =?utf-8?B?UGNGUEliSGora1VjVFhiRkxxRklLN3ovSjl0TjdLT1NpbEpWTk9jK1Y2R3Fp?=
 =?utf-8?B?WWtmU2E0ZU5EaHZqK0dZVlJpYU94NlNybTY4MGNjTkp5RGZ5NVVmbmpiWnk2?=
 =?utf-8?B?MWNrMXp6djZ3QUROVjRXRVJUeksvTmFqN2k5OVc0N2E4T0p3c2tzRXNLRE1x?=
 =?utf-8?B?UzJWRlJTVVJCaU1jUUdyWGRudmlVT3dFdDFUbUNMWFlrTUpBOVZiQnV6UXFQ?=
 =?utf-8?B?czhiOENCamg3cnd6aHJ3MVhsdGY4VElYU3pDUHVwVS9nOEk1RjZkK01HcFVU?=
 =?utf-8?B?cmFJeHlhT3dsVU5idFpPQ3k5L3NEYVFqL3BjTmlHdytYY2h4Z2hITVZWUFFR?=
 =?utf-8?B?UVBnYXlRQThUbE5LRDJFSnBPU1ZvTEZhdm1mL3FrS2VncnA5ZEhnNFhWc08r?=
 =?utf-8?B?eldsUTNZTmRFR1hOUEE5U0dsZms1SDMyQ0JMZGs4dXlQN2NTVmlPS2swNlVU?=
 =?utf-8?B?c20xdjJqc2ZMWHVza0RUV1hBUndrRnJFaWVpMnhnWEdoVysyQ200VEVvSW0w?=
 =?utf-8?B?Q1cxNEVGdllCR1V0SUFoQ0UyUTJUM21VcVprVk1WaVdmTzVFYUZRUDdvZnQ1?=
 =?utf-8?B?bU52b3dtOVN0b255MkFaK2dVdmRHakRpYUV1UjBjR0tIZ1pja3RaRitvMEtw?=
 =?utf-8?B?UGpMQkY4RUVDdXlYcGNFSFdZbjZLQUpYYUtwMnk5eFEvRXlhNS9xTXY2QWlx?=
 =?utf-8?B?cFhtVUxiS2M1T2VyWXUrQ1MyVkxuQkdTVVlZbEdvdGJNellmL0Z6dUxkenNl?=
 =?utf-8?B?UHZ4ZDYrelhsK0ZwT04wY0hObzFuVFI3QndWNVZPRlJCK2NrU05jYUJwNVZ5?=
 =?utf-8?B?QysyRjNndDhrWEl1RXNJbmZZMmNjQ2NseFhuZUFMRGRhQVZBT0RxdkladVl5?=
 =?utf-8?B?SHJQVURqQVJ0RERVa2pYN2ZxK21ieSs3UXNnMHRrbnpKQ1Z2dk5IT1k0Z1NO?=
 =?utf-8?B?cklvdDZFRzAzM3c3dDdTRkFWb1RaSVAveElJbnBxMGprRCs0U3poS0JqR1Y3?=
 =?utf-8?B?QkZvUUYwcUoxU3FpRHdOLzIvNVFqZVl6eUttVjUzbXNyK1dTZksyWDY0QXBZ?=
 =?utf-8?B?SzVyRm93bDREbWtuYmw5WVBqODI5cnQ3RXVveVdIeUViT1A3cU5reGFlOHJu?=
 =?utf-8?B?MXg2Smt6NDdxSXN4WkFQNjBBUDBxS0JzY3JLTno2Umk1WGlJenU0cHFuY3cz?=
 =?utf-8?B?SnVsU3VvQ1h6amwzWnRXZU1tY283M3Rvd3cvbHRCUkNLR3oySHJ3ZTYyUklJ?=
 =?utf-8?B?eVhwdUNzems1M0JDWitJZm1QMndHOHVpWm1Rd2tCT0Q3aDNTU3RZYTdUVnRO?=
 =?utf-8?B?SFE3SkVqdDNFckx0Qm5pTkNvRFZzVGFqQUlXU0ZCS1ZYb3dyUzdiWk83eUpU?=
 =?utf-8?B?ZkpwTWdwWFY3eGxGMGFycjc4djNBPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89d51984-4980-4454-5ec8-08dcce98917f
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5447.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 17:23:05.3423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dSjtJtgf2Qi8IpcZvi+dOdPyvxqexSIINUIISlXRRF0gzUb1I+Moblz222CzxbEIhX2bGnvmJqMmkDmsGt1sMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9102

Hi Michael,

On 06/09/2024 14:04, Michael Walle wrote:
> Hi Jon,
> 
>> Bisect is pointing to this commit and adding the 'name' field does fix
>> it. So it would appear the SPI NOR code still wants the name field.
> 
> Thanks for the report, could you try the following patch.
> 
> -michael
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index d8e551fd2e2a..101ee5b0ddeb 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3281,7 +3281,8 @@ static const struct flash_info *spi_nor_match_name(struct spi_nor *nor,
> 
>   	for (i = 0; i < ARRAY_SIZE(manufacturers); i++) {
>   		for (j = 0; j < manufacturers[i]->nparts; j++) {
> -			if (!strcmp(name, manufacturers[i]->parts[j].name)) {
> +			if (manufacturers[i]->parts[j].name &&
> +			    !strcmp(name, manufacturers[i]->parts[j].name)) {
>   				nor->manufacturer = manufacturers[i];
>   				return &manufacturers[i]->parts[j];
>   			}


Works for me! If you plan to send a patch feel free to add my ...

Tested-by: Jon Hunter <jonathanh@nvidia.com>

Thanks
Jon

-- 
nvpublic
