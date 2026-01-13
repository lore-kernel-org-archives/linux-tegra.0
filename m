Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010011.outbound.protection.outlook.com [52.101.193.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAA826E6F8;
	Tue, 13 Jan 2026 14:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768315808; cv=fail; b=i8bOLysDeWmwqJl1TCGz7z8L11g9CvBLx9Bu8RFko88qgyOKviezLJ4QiPoKOeiENvTbO8fezC1RLPXZchbPbZCR+/nyVND+pawmzLnG12FEQo5GsPwuP3jhiLB4ErGxkJ7vk+FbfvFn6eahdks6qTikwW70TLPCqm37KzR1g5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768315808; c=relaxed/simple;
	bh=GlDVOAXmMiGDtWvDRzVW+NUq/E8JTDdmdHjRiLKew20=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ocg4hYVPLQTC/po5BI7LL4d69V4NfMhGqV4gj/w8xxPjLrLvyfSm5uTYnwUgTOoLL1iZWNqz8uZx9x1UNqGyPm76nZ5WvNKhZ2ID/TrFHzjfGLdSHxuKkLmYiFtSFl+oEY9uvJ+QDkMHDDvYMDDS3hJmL8sooOXCDfvD+7IPAe0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=aYCrbr06; arc=fail smtp.client-ip=52.101.193.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="aYCrbr06"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N8HWHmkGYvx02R4oam6KA9IoSx7vqQQQZSxHhIqnhrqLSoKtueYDFsh2+aYvrAFSZ5tI4m4CXPYmH7p2X5oqVf5Nhv8izVKhtz5VW4DnighvM54kB3+rg6JEOIcuzCJt8NkIdje/MhuIsrULSg6jPmydq9rV/S3TRdiWWjxntCr9UwLr7vUqBErqNhEa+0vt/fdBzttBfvGV0i2xjBxgUgO3cuOeBrTRZh3n6xW/dzbkr1JfLRtTak7kAXBhZLnsjNSoCRxVixO4ppwXjZGtXR6O6/PHj+2AbSe/6M5GFRBHOURDiPTZpsU3lvqjRrXGwG+wwgYz2+brFShd+DKJig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8GxIDDt0TR/oxyBgCO9AEbNvBS/MWzZguL4DsWBTZXc=;
 b=x9RKFTZVCabq5ljWH2Fi3LRttxeBy2h5EsB7DEZ9ahS1tg3VIzNF9iOPu30IdWn07LaRFWyiUxmcw2LSZg3pQ6HFTzqdtOhsa4LUU+K36uL/jCKXvG2sMGc1vMPgAjW7DVaIEfCo03jEFfFutss3btF2YnijjHP9wSW134WjYujz5D1UC6u7DE/DkQm1uvrwS8CprQ8Rqq9PftOlKMKYFiZc+cHWVOayhhAdvJXxwBng1D0ykx7Zwy/PkclVLK3O7hYoCv4HnLaFxKUde0O7UbQc11NDnL28vcSkzvrOE7KX6spb7mkN8KL2YPYnPxVZPnrDOSM9PNl41xVyjMT75g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8GxIDDt0TR/oxyBgCO9AEbNvBS/MWzZguL4DsWBTZXc=;
 b=aYCrbr06S+6AWyQNePkbz0LUdMmhJrxcDOnSJk5mTM/PksOZootws4d9YzddtCsbRFfFVTVTjhUIT6I3Q8Vv+gbwRJ1keCsmF7a9ymtsBqz8gMT3Smk3g2vo4bwomdd+wOHcu6V6PBpzidhejfIke+DeekyEOYZ2a1Sj6SclTF+Ycx0C0FG5whf4Dz5JBqm1k0Ontoaglfv9Gl5DDSuZDVGsPsBVKa7j10wbnR3hWt32EccAsO/T8KKMWlntPwJqOfROcPTc4O2RfMg0r74GhCwCFzK3H+W0WC20cncSx/GlPLYX0j8nN7FFdGbbyuhhrUO1OCrspFtUxdzB9CWGtw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by SJ0PR12MB6943.namprd12.prod.outlook.com (2603:10b6:a03:44b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 14:50:03 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 14:50:03 +0000
Message-ID: <42df7bb1-c587-429f-88ac-1e5ffa7c2b3f@nvidia.com>
Date: Tue, 13 Jan 2026 14:49:59 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: tegra: smaug: Add usb-role-switch support
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thierry Reding <thierry.reding@gmail.com>, JC Kuo <jckuo@nvidia.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20251204-diogo-tegra_phy-v1-0-51a2016d0be8@tecnico.ulisboa.pt>
 <20251204-diogo-tegra_phy-v1-5-51a2016d0be8@tecnico.ulisboa.pt>
 <ea60f024-1f39-483c-87e3-36624bd58d49@nvidia.com>
 <ea4ee289-fb46-44be-b5e6-9d3beca7c0d8@tecnico.ulisboa.pt>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <ea4ee289-fb46-44be-b5e6-9d3beca7c0d8@tecnico.ulisboa.pt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR13CA0040.namprd13.prod.outlook.com
 (2603:10b6:610:b2::15) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|SJ0PR12MB6943:EE_
X-MS-Office365-Filtering-Correlation-Id: f0251f01-55f9-4b67-0bd0-08de52b308e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aytDZHBYS0pybG9pL25XS1RRbG1PblVXQndYVGxJNDd4emM2Zmhlb3U3WkIr?=
 =?utf-8?B?SERvN1F4N0pINVpGeXhTdnp4WlpPeUNxWkFFdW1RSWduMExJUHozUS92cmZN?=
 =?utf-8?B?L3JsL254bDYyWWlXYng0RkNKVnBoMXozUWczNnlEeWdXYlZUTkRDZUNyNE0r?=
 =?utf-8?B?Z0RNaVpaZFBmejJPdjBESUN6R21Wb1RBQ0VHNENtQ0k2Z0JQWE1JOXh5MFZT?=
 =?utf-8?B?MmQ2OFk2V1pwUFlKdEVTNzUrZFE4ZEt2bXBTWVUrN1g0cWdSYmVXRW8wb1Ev?=
 =?utf-8?B?QksrSTYwL3kwa1hYRFhNR0xHVzI4UStYTTJ6bWRoU2JCMW1RbTZ6aDExY3ds?=
 =?utf-8?B?eDlxeVBHWWVkVEFBNXZRQzFuYzV4NWFEYWtwQmJBU0VCbFp3Uy8vUzN5WnYr?=
 =?utf-8?B?T0IxQ2d5OXhuTVhmLzBQS2RqZkovSTdLUjZta0RwaUNSb3FaYlBFbmZkRncy?=
 =?utf-8?B?T2VlWTN5LzFlTlZQS1BQc1JTQ2U2MjFYcDNYTFBpMVZKelFqL2VuSUNkQ3pU?=
 =?utf-8?B?M1FSMXB0VWM3Q0pCZHF6Q3VNcVI3WXl5S3BncmllK1RvSXZuVUNLeFBxZW01?=
 =?utf-8?B?Qi80VVA2cU9lREJDbWE2V3pzZ2dYU01UWFYycVVWOWhGSmFyaW9DckJOaElL?=
 =?utf-8?B?UjdXV1I2L0RhSnJFZGN3Njg4Q2dBZk5tOUFPM091N1lzSXJ6MVRLOG5tajRh?=
 =?utf-8?B?MlRMV2l5dkx3MXlwdnZuVTBrR1p3QXpqcFVMSUJHWENzMnBkcjJ3anB3cGpQ?=
 =?utf-8?B?MkxNKytwZVpQQ3Z4S1NVOXYram5SZWFtRkVkVy9PSTViUkl5cHJiKzBjU09B?=
 =?utf-8?B?bDhHZmxBY2Q2Y01BWWJVSXJIZHJrb1lYZnVsNWpyT1o1R1Bwb2h5UTA5a3hp?=
 =?utf-8?B?VEVFM1JuK1hmQmc4R2ZJd0hJR0JSUzFHcEVsRmwxak1EUjNLTXBtVXN4czYv?=
 =?utf-8?B?eXJlUGRJVVI3U256RWFlbWVCakFldlZNVVBzVStsM3IycGxTYThkQkZiaS9S?=
 =?utf-8?B?ZExReFVxS2VKa3RYaTdiNmFwV0kzMkoyNWVNeXh4MlNTb2UyWERlekxYdDly?=
 =?utf-8?B?YW9Dcnc3bG5XdWVNNDF5cUdvUkFiMFF1MCsxQlVrK0tUVDhndHFPRUx6NzRN?=
 =?utf-8?B?cmd5alZEREF4QUpaSVdDZW1JMko0R3B2UUN1dE85eHhsN09lU1BvRXJoVEFU?=
 =?utf-8?B?RXVHcHRFbWRYbEQ3YWFxOGxudTlObTk1bi9YRk9ldW83VFNnZzdGaUhMMlNK?=
 =?utf-8?B?ZDhzMUE0QmpoOFNTMnlTVjZjTWdHMlFzZWZxWUZqVmZoaERvWnNCK3RvdmpH?=
 =?utf-8?B?Wlc0TUVBN0N6RFVvNGlSZXJiSnFTaFVOSHZzUCs5Sm1qMzlIQi9HbjFRUm44?=
 =?utf-8?B?YllIcFVJQy9XMjRyU1BzNGwzaUJQVlBwYm01S1NDTDgrb2FlUnVGWTNDK2R1?=
 =?utf-8?B?RDh6cnFiNHlVajQ2WFVHZDdqd29ocjhEREM1RXlYZCtNcCt6OHFHb1dTYkNl?=
 =?utf-8?B?UFRaZzJRanpRZjlWeEJDODRIWEZCS1N4clppYnVCaFAwWTFHYi9lRDB3c3Ir?=
 =?utf-8?B?NFpUTE1meHRLTWhVdUVvTWo4UGt6SWJZWEVEY3pHSmFkTmNCTEswNTd4MUd1?=
 =?utf-8?B?TVdXdE9kVG16THZDVEcwS0o4N3hRK2xEMi9rdFRBTEhWQkNSbjJoMUhlYWVa?=
 =?utf-8?B?RWh4Tm9EbVRnbnRPZDRHUUpwM1R6TnUwSVI0SVlDOFh1S3VuK09XWHFRSXZa?=
 =?utf-8?B?U1d4cnluMGRINnEwVEk0N0ZvRWtsK0dLckhSQUhieFR3QTlTUUJaZzJ0Z3Yy?=
 =?utf-8?B?WHZZVlFMeDBkNG9vdjQ3a0pwZ0hKbVNQcnQ4Y1pXYTFObm8zOXBxTUtYQ2xP?=
 =?utf-8?B?VGd0bFJPVnA2ZU16ZlhVbXQwanYyRnJ5eGgwTkFram1KVEtCaFVQU3U1eGdN?=
 =?utf-8?B?SDZxcEF1TUpveiszRXh5NlVVcjRwQ0ZrMERoc1lxZnZkaEJORDdkcEFhZ2Vo?=
 =?utf-8?Q?QPN2Ze7AXvgZGCPfdt6YnIubxTKRo0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXRjV21SeTBRT1NjblVJcHhVTGVZNzE5NGx6U2ZVa0dibExOb0Uzb0ZqblNJ?=
 =?utf-8?B?WnkycTV5MERTSERhVi90MjR3ZVdwLzhpVmdhYUFuYTE0WlJTK1J4YTY3ejJL?=
 =?utf-8?B?NUZsVDM0WmNlcm5tMEd2WldESlhqWi9ZTzYxQ2VIVTZ0eVVBUDdHandoSzdQ?=
 =?utf-8?B?WEVTYldSbElXbllxTjk4ZTBUaUhnbVJQT2M0eDh2UjF1VEJNZm5OaURqY0N6?=
 =?utf-8?B?K05WTEh4UCtJc3ljSVlPYXE4UTFtUkJFNU1XZFJEMlZsQWV5bi80aHRQZEdD?=
 =?utf-8?B?d01pSU1xREJpMllWak1SakhPRkFTakhmNy91elo3eDBTRitFYWV0UnZORlVV?=
 =?utf-8?B?ZU9lMmRUTmdBRncwZmtwVmJmOHh3amxhM21qcmtjSEpLNERkT0V4THdQU0Y3?=
 =?utf-8?B?aVFUUUdpL2lOWmEyZ21CZnQwdzNFVGdiL0dFbFBxQWdzMlBWUzRhcThrNjZK?=
 =?utf-8?B?KzdlMm90V0cvaEdyNlY0ZXVhdVRHT3hDYnBWOGx5R3c3RHphNS8vekNmM21I?=
 =?utf-8?B?UjFaM2FBUXAreFlrYktkR2xjOEtQenFQT3gwMjllZmQ3cXRHM29nR1IwRnNm?=
 =?utf-8?B?OTRaQkoxSlZQSWlUSEhNdFRwdHVIR2podkU2b2JQRzNGbjJKUXFtaW4yVUlB?=
 =?utf-8?B?bkxKWDFZMzBBRVlKVFRUUjNESGtLV0hvWXdtUEMwUGRhUEZIMFRaRDJKdkt2?=
 =?utf-8?B?Nk5CRTdqcnQyOXFWMmV6WHkxUkNySEJQNDZpTVU1Sk5xNXFnUVRjeFNzYk9h?=
 =?utf-8?B?Y3loUW5EUHJyaTFLQnUwNE1BNTV3WEw5NXhHS0x6QVBPb1kzcXFEV0hYN3Vy?=
 =?utf-8?B?U08zRnVDMDFvdW9uSUVIRmJnUVpnZXNGaUFWb1dsc2dkbmJXWWxha3FiNytL?=
 =?utf-8?B?dXRhVTlXUzJOeFFZL3QvYUZ0WmVJUkk1NGRLTzhPakZZSGE5c0Y1TWg3c0x3?=
 =?utf-8?B?b0FtZm9IRlA2OUwvVTVDdkU3TXVrOHVKUjBhVm55ZjRLTXNFS1RmeEpMR29G?=
 =?utf-8?B?bGhBR2tlYXZHUFg1T3A5SFkzYnhuYlc2WEpxa0E4UEQ1Z2N4N0tsZDRGQ2hK?=
 =?utf-8?B?WFRuOXRkeXZmbjY3WFR6Sjl4NktZREc4QVF3TXAxUFVyc2wvVXFib3p3SFZJ?=
 =?utf-8?B?a1JBek8wM1laTTFYVWV0bS83VGR1OFl2a3VaZ0J5NHhkUXArVFA4aVNvVCt1?=
 =?utf-8?B?YXRORjVTaEpPLyszeFlieUdXODVWSmdFc2YycHVERWNhUWZQLzRHemljaG9J?=
 =?utf-8?B?NlprenlSeWNzdnhGbm5KWXVqUU1XTnhwR3l5bFRkaThtalRhRzZzR0UrbjU4?=
 =?utf-8?B?NlRHQnN4c2piNCtkVjc4WEprZWRaYlcyUkRDOE9DTEdwYVc2YUkrQmhVTE9P?=
 =?utf-8?B?VXNFWVRibDlqL21IMGUzbGU1TVlGTFFqWUNYbkJnbTM1bmUzK1FEOUNQU3pu?=
 =?utf-8?B?a2Y4dXZwYXo4MGVDTFVqL295elMyUmpNSEUxRXZPTHJVK2QzMzRoQ3NEdzAz?=
 =?utf-8?B?dXRSOXVkV1NIVUFsUnNVUXZ1YlFjdmN6WjNDRWR2TjU5WCtyeWVnNExOUHZs?=
 =?utf-8?B?YmRjckNheFlOZSt4L29GMXhCTW9xZmM3SlJpZGdwVG83UmtxQ3RLZ2ExdmRK?=
 =?utf-8?B?Vm8xWHNrUDdHWFR1TVUrbS84WWt6U3o1T1VkZjFaemhrZDRlUjBNMENjSjBi?=
 =?utf-8?B?b1dlM1RKdGdOUWYrM3gzUkp4RUxXY2N2M3ZQMFBIMGVIVlNMcHpkcjFzWlpk?=
 =?utf-8?B?d2MwVi9GMEUzSUcvcmNxdWlCTW04c2ZuZmNnandqN2h5bDRwWmJLWkdSN0JG?=
 =?utf-8?B?bHFKUXRlOTYyRERuMFhJVm8rc2cwWVI1MW1MUFRTWmZiRExBbGt2VitSVnZs?=
 =?utf-8?B?NnY0UnJTbVYyK2RJVzBjekZKRVhYMW9sTWowYkRBL2JHNkM2ZVRibnoyM2Z1?=
 =?utf-8?B?blpwUitOVHpoZ3d4bnpJcllYU29rVnJjU3JUUjlpZDY0WUhUSHpBVFB1bVB5?=
 =?utf-8?B?Y0t5SHY1ZXl6SEN2VzB5L3JmQ2lTd1UzU01YcjljQ2d5WmdyTEtEdFJiMms4?=
 =?utf-8?B?U2syTGtjR0JpMmVvTU5JVEdDMDd2dDRTbDhFMFlLb0lraCtiVG92Y0hUL01S?=
 =?utf-8?B?WUlweVZkMWwzbW5EbGZKZ2Q2VzhXUnJ2b1RJVU1nRVB0Z0ttSTJSYnpmOGJu?=
 =?utf-8?B?TEdGL2pTejN4ZGVSd2lsYVRXSnNXR2pLSG9MV01wM25yME5GcGN5WUczTWY2?=
 =?utf-8?B?dUFibGZWbVg3Z2hjUHo5dGUzb0lNL1FJdGVHV0dYUG5zM2tJZGVrOGlFb2Rl?=
 =?utf-8?B?M2pDSjNVWnBSWjVvMnF1aVVWaXFWUm9LcjNZNVU4bjNWQ0RJcm5VQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0251f01-55f9-4b67-0bd0-08de52b308e3
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 14:50:03.6101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HpsRCjLemaT2myXyiyLAF2tc2SfnvtEuGtZWxO1Rxre6s1qe66HCWh11OcvnsyoxS2YOcATqIWpfol0ngbBaUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6943


On 13/01/2026 14:20, Diogo Ivo wrote:
> 
> 
> On 1/12/26 22:03, Jon Hunter wrote:
>>
>> On 04/12/2025 21:27, Diogo Ivo wrote:
>>> The USB2 port on Smaug is configured for OTG operation but lacked the
>>> required 'usb-role-switch' property, leading to a failed probe and a
>>> non-functioning USB port. Add the property along with setting the 
>>> default
>>> role to host.
>>>
>>> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
>>> ---
>>>   arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/ 
>>> arm64/boot/dts/nvidia/tegra210-smaug.dts
>>> index b8d854f90be7..49bf23d6f593 100644
>>> --- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
>>> +++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
>>> @@ -1809,6 +1809,8 @@ usb2-0 {
>>>                   status = "okay";
>>>                   vbus-supply = <&usbc_vbus>;
>>>                   mode = "otg";
>>> +                usb-role-switch;
>>> +                role-switch-default-mode = "host";
>>>               };
>>
>>
>> This change does add the following warning when building with CHECK_DTBS
>> ...
>>
>> arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: padctl@7009f000 
>> (nvidia,tegra210-xusb-padctl): ports:usb2-0: 'role-switch-default- 
>> mode' does not match any of the regexes: '^pinctrl-[0-9]+$'
>>      from schema $id: http://devicetree.org/schemas/phy/ 
>> nvidia,tegra210- xusb-padctl.yaml
>>
>> I know that there are many warnings seen for the smaug DTB, but it would
>> be good to ensure we don't add more.
> 
> The 'role-switch-default-mode' property is read by the driver to set the
> initial role for the port [0] and is needed in order for the port to work
> when booting so in order to fix the warning this property needs to be added
> to the binding.

Correct.

> As for the other warning ('connector' is a dependency of 'usb-role-switch')
> again I think the binding needs to be adjusted since in the Pixel C the
> connector node should be under the (as for now not present)
> cros-ec-typec node and the usb2-0 is then modeled as a remote-endpoint
> for the full connector. I am currently working on fixing the cros-ec-typec
> driver and already have a working fix for automatic role switching but
> in any case I think the binding is what needs changing. If you agree
> with this then I will add the necessary changes to the DT binding in v2.

Yes in both cases we need fixes to the DT binding that's all.

Jon

-- 
nvpublic

