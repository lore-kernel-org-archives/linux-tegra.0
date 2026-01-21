Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011038.outbound.protection.outlook.com [52.101.62.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6C43E95B1;
	Wed, 21 Jan 2026 14:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769006434; cv=fail; b=g6ygpRNdmNk3zAumh/K+qdngb3cL2M1IMxs7WbmCbdCMDy56h9JZVhY2X28UPwn64DgENf/NIqEVO+0l7kInnls1XDU2ZLiSQ2xsKBG7psjX+n3piAHQThwALgp2+GpkBijGdBwQsE8qO4Upn1OBFuC01UuZV0htXf87/gGylfk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769006434; c=relaxed/simple;
	bh=oMSicAOJxoshEdNuXLhasyHXa9xxuEioQPnWtIJZtWE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UW7+qmjo/VNPPxgRedDtaGUNJUUi8qSOHyyhVgICauMYXpzNL2TzZkgXaMu37N5PfIdxlMgcvgyDf27yLO1LV3VItHhJx0pT5lWzpYvsrILDbXoh/7XpTGjLnqi9tRojWTi32FluFQ0y0AT+kkIXHxtyrWUBOJZ7WWCjvuXeNcw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VqVAF1xy; arc=fail smtp.client-ip=52.101.62.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VqVAF1xy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ear7FqqgWwAz98PJgq6v7UJNk70AeYMvgzDkNwcRgDjeJNX8TuXdseJijeGZn6XoRKJsjZmoh9GO7MCmQ4wE/jzDdwWYj2no1CKPk9vULeYyVh5CTH9FHuBKUPGBujIa2zraO4w5BlD3ThVcWSH9TvT2vDmyVHSpXslXnbrx/lhbfHhO1M0+9EGdzuoHvzh27+wB4n9rwHFXlx9PLbXu1jkbcok5Ogw2vWqpRq2FAajUIZYqRANQhdqWC6Q76ZzgDbh1owKB3V7lSl0smZq8P/6gyFCEXHcp/NZEU62G22EXtgtTu5IkZCDX5ypxwn/TkhV1D3Cz4ZK4mg3dlbjQug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ltQA27IEoe7OWqsGv+vlpmF/JKixfJhcbFQ9JKObso4=;
 b=S/8w+jWtUv7QTEJ9S3VlWZm9KFnZVST0T+9oZxfDCI5PnRfUXng7W/jVxl/MgSvimK9/01jldwQTUrzptHCO1aPL1SVQ47iQd4lYFoMSjRhqMAeQWhY6upkVDIGGn6DLJJJI0IiOCOKNY2sxwy3LTZnqJVePbyuM4a5irXKN6qQVEyfY8CYpF3a60lcOPQdNsonIs6Lm2OAincVn4NcRC8Z0yvWWkNn9iqk54z1JfEJS9fAa/8Hcxs9ut1Lr3T4Zvv3vRnztp4nySDo2vtbxmOoLX8i1mksxgE0tC3pyiaAwIC7u1MbmFitvcrdN6wRnHo500yDHbB9k1ItRJ7tTLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ltQA27IEoe7OWqsGv+vlpmF/JKixfJhcbFQ9JKObso4=;
 b=VqVAF1xyNvBUPJ1CULi1jwa963jOQifw5XCeVtmeZjOtMNFFeAtfVkdAYK4IKnP/L3W8ho01bwFCUNA8otj+CS++lowO+x+YK7VDoWiaCBD8xQYnKszgdgfdPbfV3qvqUraXY30/YNh/9C1h/KOWeubNLqHp7HFN3K0NdJ8pQnHRdVFmtKN2ZKHNBs4HZK9fS0fwxfY0UibQYTcDUDtlG/R486apiby5reP2WcBfPTScNhtW+0C8f3alrvQ6xDB2ZPq0Xhv/TyzXhqf4NrftE69aH6j3ZnslFRNBenoopTCAWtDeM/F9HfjUMd7ZEJziG5DTHOaAChAUuKgpCzlz6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by DS4PR12MB9586.namprd12.prod.outlook.com (2603:10b6:8:27e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 14:40:29 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9520.011; Wed, 21 Jan 2026
 14:40:29 +0000
Message-ID: <5112e8b6-9da9-4926-9eac-cd6297ac61fc@nvidia.com>
Date: Wed, 21 Jan 2026 14:40:24 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/4] Add I2C support for Tegra410
To: Andi Shyti <andi.shyti@kernel.org>, Kartik Rajput <kkartik@nvidia.com>
Cc: ldewangan@nvidia.com, digetx@gmail.com, thierry.reding@gmail.com,
 akhilrajeev@nvidia.com, smangipudi@nvidia.com, linux-i2c@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260113165929.43888-1-kkartik@nvidia.com>
 <aXCWCYR-DRF9urhl@zenone.zhora.eu>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <aXCWCYR-DRF9urhl@zenone.zhora.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0516.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::9) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|DS4PR12MB9586:EE_
X-MS-Office365-Filtering-Correlation-Id: a8ca7548-bd2a-4fba-a360-08de58fb05b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dVptYWNFSVRCcTVsZTZURFVCUklxK201RW9nQmFvT0loK2lIUFZva0xmc3Fq?=
 =?utf-8?B?UXB4dmc4SXdwSEkyclBCL1JnbHU4NjZHcHV1TlAzaWNld1dGMlh2VTFoVjds?=
 =?utf-8?B?aVlOOTJoQVIyNWc4U3pxdnNhTUY4UEp6VXhtTTI1TnZSNjZJSHVwRWZydjRz?=
 =?utf-8?B?SFNqcWkxT29Jcnp1WVRXMjRZQmlrS3grM3FkRWZvbnFEUERkRERYQnQ2MEth?=
 =?utf-8?B?cmN6ck5MRUgyQUVaNm1yUVFrdnVJZVM3bFJoTnpVcHBtRU5qUEMvRi80Wnl1?=
 =?utf-8?B?UG9MNEFteThwL2lRKzRvRWxZdG1WZmREVEJKVEl2cFNYNTR6WFNGWHFTcnB3?=
 =?utf-8?B?UWtMV1RYd3pwMmU5TVkxRFVTcTI5VWpycmR6c0sxM1ovRWF6Q1B4bVdaVlI5?=
 =?utf-8?B?RXVNVUloOHJvM0N3eTJZNk5LMjhEanVKMlZBQ3NIT3FYdUlSWUtkcUZYaGdE?=
 =?utf-8?B?RUpVQVJRRFVkdVhpUGJCY3NDUFVqR0FEYlNlWUNUdjBOU01vdWJqc3hVcEJE?=
 =?utf-8?B?M0JHNHppVHlOWDQxVTRaUWRIaUg1cnRqRG1BeTlqTE1lTUNUOWRjckozVmF1?=
 =?utf-8?B?VU0zeDB6OHJ6Ymt1T3hZc2pjRDdTU28yYjl2M1dSN2hzdVVSbEVrV3RlOGpD?=
 =?utf-8?B?MG1uZXdRQVNPaGtXZkxtbTFYaXBMdkZyVEEzUkhvSXdpTmZleEh6SkdxQUR2?=
 =?utf-8?B?TzI0eHRHWnN4Zk1haVlFYmlJQkZGU0ZiUWpVcDErRkE3WDBNb1JwVXRqVllD?=
 =?utf-8?B?WGxvTkJOYW0zZmJYMkNVbXF4VmVkWTJNY2hVd0RZMWtnVTJpekFRd1FzMG1o?=
 =?utf-8?B?NGFVVElRVkFuUi9kZGdoYUt3UXpYOFdZV1E0K3RRTllaYUxza3FQSHVCSXdK?=
 =?utf-8?B?VTYyVUlwMVVwTkFMVUlOQktncHZ1eE1meTZOMDFNdzNXUHlpOWsreTFKdDht?=
 =?utf-8?B?ajlWNEJGY3A0d3BmNVRSK3ZzUUpKNHN6VXV3TGlsdWMrbmtESHJ5MGcyM2M3?=
 =?utf-8?B?SDlvaTArdWgyQnliUkRrb00zT1EzYXFRMFVYWEN5eHN6TTMxNkNDdHBFekFB?=
 =?utf-8?B?UTE2QnkxWWUxaHRBRkVJVXZlRm9VODc2Zm5XNnErSWlNMEI0cm1yYmxjbVhJ?=
 =?utf-8?B?aDNBbHdUVkNKUWpPNGI4U09OZmpRcEJtUjBYdnBRcFRjSVpVT0R6TU5RWUtv?=
 =?utf-8?B?L2ZJZEIrVVd4Z0xTNEwzbHJCMzlWMzNyWVQ4QWpHVEYvYXY5cGZadWVLUkRa?=
 =?utf-8?B?U2tnK2JnN3d3U1JDcmQrT2FqTUw0VWRodlY4cmVibmJ0M054eGwxQUhWZTNQ?=
 =?utf-8?B?NktRUDRUaVNxTXNQZDdiTlE5VDZvNUplRVR2UHFwYkdHUnluNmI1RzhKWk5k?=
 =?utf-8?B?WVFLWkJGZGNKWmRSazdCTkdubjJTM1NzV0RxdlRzcDdTeXZqeFY0UGxvRlF1?=
 =?utf-8?B?WEk1ejRhVnpWQTIrQzhCYWlGZXRndVRRcFhxWWdpZEhSY3RzZWF2NVVyY0lw?=
 =?utf-8?B?WmRWN20xcnN6Nlc5MmcxV3M1UFRVU3R4aTZKQ0JxZVdObklobThEbGJMdE5U?=
 =?utf-8?B?ZnBFVm0xd280SDcxZTBDeUtPdmc2anRtR2ZrdFFJcEwySnhqM251UWpWNUg2?=
 =?utf-8?B?REpSV1M3WjEyN0wwZW54WWozWFdibWR3dTJqem1sUWZmYUFsTUlyYVcyMUpr?=
 =?utf-8?B?SFd0L3BGYXBQNUNYZzNXZEtKb3JkY1BXZHllTjQ2K0owMkxuOFEzM0lCR292?=
 =?utf-8?B?dlBxbXN2aExEemxZMEdpUkRvTjZlM2tWckNkZ1YyMVpnWWRtK2VkT0NXUXdl?=
 =?utf-8?B?ODJMYjhwclBZdHlmaXNVS3lRdTlOaG5vWldYdW92Z01OS21CaytzZ3BCWXhM?=
 =?utf-8?B?aDJaVllscEZMWUpNcXVQNE1GY2xJa3VGS1lwSmxxVWsxQlpPdW1NMWN0amhr?=
 =?utf-8?B?d05tUDA5U2pYRVo2WUZwY2R1Y0haMEVxLzRGdW5hRnN1L1lBM2lCQ01jQVJu?=
 =?utf-8?B?ejV6MHU2TTZZdWpTZlQ4VWNiVWt2a25JY05wZDhldXU4OUdQSTJib253UGVv?=
 =?utf-8?B?N1NXUWZXRDcrOXU4anEvd2xDS0trZGR1MURmdWV2Y1FHMUMrOGIxU0JqcXlR?=
 =?utf-8?Q?p7QI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnZWSnlBY3VOK3Btem4xWlJBazhrRXN2TTVjOTJRZVJUSm9kQlFCZlp1RDM2?=
 =?utf-8?B?NTJGWFdiNWdtM1JVcE45Mmd3WWxSeVNSWjRHMnJtQVZhT2FNclZkczlKeUl5?=
 =?utf-8?B?UWsrdDFQcVp5bEt0N2lyQ1F0RG0wMGhFK0pYVVV0OFBSYktJSGc2aWVvNmZk?=
 =?utf-8?B?eG04OUt3VGF0SkJubitVYWxKeEtMb0hPNmlZK0FybUl1UVBGdDE2TjFZZ2VB?=
 =?utf-8?B?OG9MTExES09va1psUVdOSzhNc1lmWU04U1Z4RHlZd3FlTFJ0MDVldC96Y3Jh?=
 =?utf-8?B?WThOKy9MZjRFZ0hMSDk5a1IxampVMStCM1R6S0ZOZkZYNHRWL0tncHZYRWJU?=
 =?utf-8?B?Z1h5YW1QUEpDVnNqNFREdURlaHl0SFhYV1BZcXdUNFF3M3dlRWZxck9BY2Fp?=
 =?utf-8?B?M2lvOE1iS3RGUjUyUk1GR0EvVzZ2ZHVrRUVmdkxqNkxQQTFMNDhhQm1iMnRY?=
 =?utf-8?B?YVRnaE1pN1pZa0xLTDZ4ek41ZGhoZFVUNFFLZ0NCNGZwUnFjZXdvMzNEa2tm?=
 =?utf-8?B?eVkyMVlNckJxMldVTVlWMTRFYU1PTHBXVTRDT1h1MUJkNU1RZExnaURIejNT?=
 =?utf-8?B?VWJLbW5VNk1HK0Vva1p4TEVSNDhUdDVEQi83eHRGcSt3ZWVPMGoxVXd6OEdt?=
 =?utf-8?B?V200bWJkVVAxcXliUXRZMHF3TXJtL0hBUGh4ZkdiTE4xcnRIRlg1Mm42OWFB?=
 =?utf-8?B?WWI2cURWb1d4b29pOXluWmM1R0xLckFidFM0aDNiR3BKbWxIZkJFelkrK2sw?=
 =?utf-8?B?TUZkNW5ydldXb2ptMTFCdVdsMmJISjdMTmhLQS9abnR4RVNyMm1GOEJHbC94?=
 =?utf-8?B?UXRGMmRhUy8vWDdqeU56Q1Vpb2pScExvZ1JYZGxHV3VrM2t1azdDUVFIWldm?=
 =?utf-8?B?ZEJhUktsZlFUaVE0K0w4R3VaaGt4UTJXMm1KemdpUGdpNkxKVHNnMHZJL0pT?=
 =?utf-8?B?Q3Jhc3h5Z25YU255eXY4SnJyYzFrVEhsSit0K2haTDNuMHRDdnd0VmtncG9u?=
 =?utf-8?B?TFZINDFKQVZkZk9kd0hKcG1xWC81SDh5UktvM2hkazdxWlRrdEZUK3I3OWFB?=
 =?utf-8?B?dm1oRGlsSmtVOFN0TmlFN3FNSjl3SjVUSGpyclMzeFY5SCtERXd3cjNweldu?=
 =?utf-8?B?TEFZV2hnaUFqTW9BbituL2MxbkVZRDhHeXNqR0w5bXIyWTNVMVljZ2JWQk11?=
 =?utf-8?B?SUZEZytmY1o4TXhxeXVranlhNGhGQ2RLc0szZ3ZRbWh6bmlSRmFtMDY1a0g4?=
 =?utf-8?B?eWhHT1FBd3oyUmFuY2xPRFdBa0ErSU5zZUg4U0lFSURRRkU4andpSGpXTWhF?=
 =?utf-8?B?a0NMQ1FZZTU2VWNVNjdCWklXNnNhK25YZGY4UWdUZnVvZSt3MlAwaTNoNWVs?=
 =?utf-8?B?UitFZ1A5SHhRYXIvc0RiUDhkK0JvS3UxeDFyOTZDOXg4ZHNqTG9HVGhOeTFO?=
 =?utf-8?B?RjVZUVRzaWNtckNPcGlkRzhPS0hJV1o2QlRUbDRMY1czZURFMGFEMTROQXhF?=
 =?utf-8?B?OEZGOUxQZWk2RjcrT1dmcDJwQ0k2eGVlYzE2M2twdElFWVQvWklUaHQraXVJ?=
 =?utf-8?B?MXZGZmk0MjVKZG0zbGJxNUZkQUFUNkJJVjF2NmplYzNtbnY2bjR1RUhhVVhB?=
 =?utf-8?B?MktyeG5zRnpDRnZWc2JRaUFYVmMvZUlja1lMbUI2SXJrQ1FxVTIvMSszOTRL?=
 =?utf-8?B?Y1VZTTc4eERrT0dzNmFrYUgyN1NwdGk0UDlkdUhKV2dIZGtDZGU1VVhPRHVu?=
 =?utf-8?B?aFM5NUxaWVFNQ04zZ1lxN0FIVGFDeVlvMnd5SHdNM2Zxa2J4NnN4U1MwOGxS?=
 =?utf-8?B?OGZWV1A1Z2NkWmM5L0hweXJwYk5oMFM5ekNETHlTenE4S0tmbUl6UFJkblRT?=
 =?utf-8?B?czFubm1ndXZjNVUrVnUyd01CS0xMR2J2ZWJ6OGtrVU12L2VsNWZnOG5ValV4?=
 =?utf-8?B?dVlWR0pQOEJVSUx0SCtUZmo5Ry9MWThoTVlmTnpTQzlZak91emFDZUcxdVh5?=
 =?utf-8?B?bmFoakY0NzlBb2NsVmJPSkgyZ2dYV0plSU02c1FKTE1DRnh4N2pjUElLdWFK?=
 =?utf-8?B?U1FxZzZXd2psUmJTeElOOEVBeUVseTVIaTg3VkFHUkZQYmtScGhFMW15NjNF?=
 =?utf-8?B?K2wxQXhON255OU44UERRbWlJdXJnVngwejVNOUJLZjYwbXk2V1NuangvV3Z2?=
 =?utf-8?B?bDlYdnpYU3BWNHlKb0ZXblFERldySW1ST2dML1ZSUUNWanFWR2pGcnd3aDkv?=
 =?utf-8?B?MGhJZklHN3kyTlhrWkdDalUyZ0JvaWhVYTYxMmJ0ODJSYjk2VGpmaUEwWEVx?=
 =?utf-8?B?c0o3ZXZreXhEWFNPSlczRG16UWlNV1ZzMHExTFJqUFkzZVhid01KVWFwdUx4?=
 =?utf-8?Q?QApkDMwPVxgYImgIdRjeofBOAXOq0OxosN8XszYnLIwnb?=
X-MS-Exchange-AntiSpam-MessageData-1: 360KK+nAnYRWog==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8ca7548-bd2a-4fba-a360-08de58fb05b6
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 14:40:29.0433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +29HMUqdcWP9nWH2owJJZLBM5xdPkBdW4TSfGVqHFtN7v0pSaZEUBYPnbgNTAlnXDj0L3Xtr67dwl7TsUcrifQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9586


On 21/01/2026 09:04, Andi Shyti wrote:
> Hi,
> 
> On Tue, Jan 13, 2026 at 10:29:25PM +0530, Kartik Rajput wrote:
>> Add support for the Tegra410 SoC, which has 4 I2C controllers. The
>> controllers are feature-equivalent to Tegra264; only the register
>> offsets differ.
>>
>> Kartik Rajput (4):
>>    i2c: tegra: Introduce tegra_i2c_variant to identify DVC and VI
>>    i2c: tegra: Move variant to tegra_i2c_hw_feature
>>    i2c: tegra: Add logic to support different register offsets
>>    i2c: tegra: Add support for Tegra410
> 
> Can I have someone from nVidia acking on this series? Laxman?
> Dmitry?

I had a comment on patch 3/4. There is a V8 now, but the commit message 
is still not quite right. Although I am happy with V8 in general. We can 
do one more quick spin and then I am happy to ACK.

Jon

-- 
nvpublic

