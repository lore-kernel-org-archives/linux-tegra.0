Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012047.outbound.protection.outlook.com [52.101.48.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837D82F3C3F;
	Wed, 17 Sep 2025 03:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758079283; cv=fail; b=RaUr6ZkT0aR8xkB+a4CW9QQcqzy4RJfhGc83GuGTNRqKJOUJrC7A3C2fSQI1axTU+uPeoccvmlrvRhPrFwJhUYafkBVoiIn0c2JrsVn/+1dw8v5f1IaVU+JBj/AGBYWWnOu3qmC23LpePeW35s91wT251s4n+riKzcZazX5cD5I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758079283; c=relaxed/simple;
	bh=sgyQSk7FzRjXPJGZ0gZoE2+MOcb7MPZ+njhInwoFfso=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CM+BWXPmsK9E6eMCYSNaZ/dCOrAf0aCYS1xfSYUhXdgAzonu8LajY0eAzvJnufsATbe7TMVBk0rNewLMHBtthrze6I1jKUunWFS4aiSN11YUOtBjEfZZuGeJwORbhaaH6hAZuYnXrV4rPj1uNjxFqEhheBI8n3QFJzW0NAdyVpo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Px5zmTtZ; arc=fail smtp.client-ip=52.101.48.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Px5zmTtZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YdeY0s9guFYzMUC4cbrRMYX7Q/vC1Y7cv90lqSLehNoMd86vPgEVBn8efNECeoX6oaf3CKGuXhJxpd5PkLqaqIHpYqNaAXJtYGtfCgfLJDLSlYWA9cpYVBuCqxUlvuNwKNdmcyG61/wGBWAqB3OZuWT+jRJv3bEOa8ZrhLa7i3ehYHktV1HZGsOeB6ZDDQPg3imDUmPRAX5V32xL9aunEqXgzmJBdLCTM8H3C+6Tin9u/8fHzvn2tYqNR97ATI6menOdTY4mqhjAJXeYMGDhnpZNzFJp5pZ96cfJJ6U0N9GZA217HJRkaiNMZ6QQKlvw+QgHLCYFPVx/6QWmWXaqVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mR19jdIIFQzST2oCFzjsS7IvmyJQNnwfongCWyQ0GCc=;
 b=JGbaUn1+Jgg+rdCH3WP0NUvMUfl4A/7WJ4ZD+xISEtxeo870EHYdDyn04SMOMGZUSzRPblkuGIwYhTMJnVpDJmBMcF3DJbrX2Ajd0tYVUxKnZBfy6ALrKoWySe7QTL8idcTAozOqmnDGhKKeOb9VsDfKu08MyoQw/EsUNhByICIqraeKiFkD+tKzvksaXY4o3qNvYG1gT6nuV2pd9jzcild8+B4yGTMMjWSPuopXWMDk+4uGPoCIDdT3jbV7mUonxED3OXcEIKcJp7YKBQW6vV2QHOF+OdfaZguu8/D+xhJB+IIvvlBhvVt499OpB6oYwHEkM5Bx5dTQVt1VnoUzOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mR19jdIIFQzST2oCFzjsS7IvmyJQNnwfongCWyQ0GCc=;
 b=Px5zmTtZN0jmPpvGaeVOnjYfxs7RwPKTS9Nqbx9LKcs4PZS5LXIB3DlvdgFZJvB2ALzOqEcHxniFoZecvybQSlFmtAaQoVvf8eQWV1gsZCtMTyXlW9yEPjfhWfSIuK29EnoMadhqDif/nR7Fbu2TfLizLgLgB1CjzFxcf3Hth2qNrgOmRZIol6PVOpBOIX2oM4hGD9bxXfhpMDxqHCOdUyOBV10M1ZmtfJC3TugNCHXQQdD4qAvoo2S6GoLHc2t9OnYEtEpe0lrg/LxCFSuk8fZ4HSxdSL4b08gzAt667Ab86HJN5XUPMAxFvYXfiAAl143kU+s0Dw4whl5M5i4aBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.23; Wed, 17 Sep
 2025 03:21:18 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9115.018; Wed, 17 Sep 2025
 03:21:18 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding <treding@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/4] ARM: tegra114: add missing HOST1X device nodes
Date: Wed, 17 Sep 2025 11:44:42 +0900
Message-ID: <3549625.aeNJFYEL58@senjougahara>
In-Reply-To: <20250827113734.52162-3-clamor95@gmail.com>
References:
 <20250827113734.52162-1-clamor95@gmail.com>
 <20250827113734.52162-3-clamor95@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP301CA0040.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::12) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|SJ2PR12MB7943:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a7449da-9678-45a3-aec0-08ddf5994487
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MEhLc042S3Y3SGdrRGtIbzZPam1mNDFaSFhrdnpvd2dOYzNTOWN0c0JXNzhF?=
 =?utf-8?B?RUVnTXgxZGJ2b21XNDg3S2o4cUdsNVVFRFNsT0YwYTJVY0UxN0EzS2d0SmNL?=
 =?utf-8?B?MkdjdHNDNmZySUlwVDZ5YlR1Z0xWSFVJVC9NZEVxeFBqR2F3TjlDTUo1NGhN?=
 =?utf-8?B?aFd6am82aVlydDZoN016ejBmU1RuemZLM1ZnMnFOTnpnNGZJWlVuWmQ3YTBG?=
 =?utf-8?B?NTRUUDI2STdTMmdCNnR3STZhTlF1WksvcGJZdmxsMFhSdVB4SWNscngvM1c1?=
 =?utf-8?B?c1pDRXM3b29NcTdjNzJaQnJHS0MrOEhiZkI5MW1jQ1NyVXhLRTNRUmpUdFJm?=
 =?utf-8?B?NlJBdmx5SStPd1lKZlBxdGNVSTRneWE1SHpQRTJYMUZwZmhYb1J6aVFWWnNE?=
 =?utf-8?B?T3NUdHMya0RZR1lGOVNhMFg5czRkK1o4QVkyaTFqbE8xNVBmQnBiKzdrb0g3?=
 =?utf-8?B?aGE2ZmNFQzZMVkViWVZ3OVRWOUVVSVBZaVplcDcycDBYK3R1VGhGYzZMU1VX?=
 =?utf-8?B?SFJ0cVgrY0pQKzBMR2syY3ltOGlVNHdjRXRORjgralZhTThOUk1JR2hkT3pw?=
 =?utf-8?B?WkJKUzBMcjZCWXlSOHdzSTJFQWNPcmR4Z3FNV1hyaG1iSzY5ZnZxYlhiWkl6?=
 =?utf-8?B?RFZxaHZObUkrblZaODJFR2IrbFVyMlJSelVPSGhBMklIQkJHTXdpaHJERXhU?=
 =?utf-8?B?ZUdFcTBBdG1leGxPb3NUL21zTFZCZndrNmxJSVMvcWZkTFp2cWE1bDVRQnpQ?=
 =?utf-8?B?clNtU21OVjVYMk40L3lTVmFjRXZWZDhxVzUyUExqclcrQzd6aWEyL1ZSR3c0?=
 =?utf-8?B?SS9wVmNsWWF0cGhVUENaNDl3NDBaUzZQQi9hNklmUmFUN1FucUh3dVczcGIv?=
 =?utf-8?B?cGhnamtDVFcxWWNFNTVva1daQWxmbFlOSEV4U1JFdFVCb3ZwWGlqQS91QnAr?=
 =?utf-8?B?MmhpSGJBOHp5NzVJbVBWU0Q2MFBjd1c1em5COUlsc3ZOL1dkUkZNTnlkRkMy?=
 =?utf-8?B?OE91TEd3dGJFdm84MmhaVjJKanRVS05Hc0ErMWV5MmN1K3U5Q2U4V2NWRGI2?=
 =?utf-8?B?U2Zob3dTNHVtQlRyRkpGV01GT3Zib2VOMk1KMDlPb2ZJZ2F4WTJjQ01tZSs3?=
 =?utf-8?B?U1dHMENGRjdlcjRLYkZMWU1kdS9vV3RSYVJCbW1ETEpUaENCMXZxeVlhbnZB?=
 =?utf-8?B?cTBYc3N5cnpyYUFRNm9ieW1Jb1l5Q1pLTzZid25mdjJzaWJscGs5TzhzeERw?=
 =?utf-8?B?Sk1UdnNmeFkvVlNHMy8wcnpNTUhOVWR4TVR3QVVIUjhLMWdwTE1UUENBMFRn?=
 =?utf-8?B?Wk5BTmZJSmlFK0xoNVJabDZienFOUHRoRGNYankwdVBtNityT3diclp4VHVH?=
 =?utf-8?B?N3YxYzNHc2l3bzRIWFVseEU0cnhKU1BJVlhnWCt6cjlWRmZ2ZjZ2c3ZQbW1y?=
 =?utf-8?B?eExZbFVNNVd0bXpBTnBVNW1NZjEzTFh2VXNBbVNFRWNQK0xMUStkU2RMcXdz?=
 =?utf-8?B?K1grUitrVUFmeE9xN1orUU84eGc0VTB3ZkdpTWtiRWc3bkd1YjB3U090Z1BS?=
 =?utf-8?B?Vk02UDJuWUNCUDFjdVUxL3JwSnhBYlc3SDRaaXR5VEdxTy9wbnFIT2owVEZT?=
 =?utf-8?B?ZDV1endDT2dCUWw4K0t1Zlp3UllQOFMwUUxwTVZpVThBMTY2dW5KN2txclhR?=
 =?utf-8?B?WWFsaSs5UFhoelY5d2JQdERJdWwvZ0NGYnZnN3k2MlFYTjZ2TTh6K2xjY2Ru?=
 =?utf-8?B?WEovMTlkOHE5bFlGUVQ0MXpsUUZpejU0OWN3RWt0Qnk0QlFNWCt1dlBKZVMw?=
 =?utf-8?B?NnBHK2VWUkh1M1dycWFySGZYUGM5TWI1TFFUS1NEWXdrZm5Ja0FkZkhVZGRG?=
 =?utf-8?B?czdFOVRtUS9HaWs2ZkpZUVFIME16K0loZy94dDFNYS9rbWdZc0hzSXp1MGdJ?=
 =?utf-8?Q?t+My+5jyZ1s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6494.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RlA5bm0wNnVmSGhQeWQ4VHFrQjVsNDNhOTRTeThyR2o2WS9PamdleC9JL1dJ?=
 =?utf-8?B?L0JVTzN2b3lsSkcrSU9ranRJMjJtZW1sQUo4R2dPSWJZVDA2Z2JXSU5CVkRj?=
 =?utf-8?B?WVJqT3g2VDVSdVAvNVpucE9nSzloa2NwM2lUNEdmejVxOUF1VHpaRjVLM3I2?=
 =?utf-8?B?K1ROY0VweTd0ZDRaU0FKUG1KZkRaTDdMcnQ4V1BFNm01NklmbXA0NEJVWk1k?=
 =?utf-8?B?Nnc2ZlhOcTl3WERYLy9wRjU4bEwwRERZRHhHS0tzWmZldkJkS0YyVlYwNTNZ?=
 =?utf-8?B?WmVyVnBWTUVsSjdvNjRINW91Q0J3ZlJsek8yUGgvVVNlREx3LzlpN3FmdU44?=
 =?utf-8?B?d0FQWUVpWFh4ZnJHNGh6aW14TkRYU25rVGlxZmoydVRLUXcyZTA5eFQ4TkJz?=
 =?utf-8?B?WjNJdURCL2ZzMUxzVzJ1VkwrajR6YmJkUEd3cTlQQVBJUGdvNnl3VWVhUGEw?=
 =?utf-8?B?NDF4UURBY2xnSGdzeUJFdVFwNUJFMzQvMGV1a3Z2SkF1OTFlUGxlNlB1eHpl?=
 =?utf-8?B?ZEhhZ1pKQnI0dVl6aWhtSGVMZnJrcS9UendIM1BzdlNNVnZuVGlJOVlpajhT?=
 =?utf-8?B?RVp1ZGNTUXJHdlNLbEJKcTVYUUdNdmlYZE5JR2tIQjZ4c2JHdk95QlU4ckt3?=
 =?utf-8?B?OUM0dGc5UzBGVThuWFFQelYvL0xCWGhDSkUydGlxSC9xM0QyUUQ2Yy93L1Fl?=
 =?utf-8?B?NnJkaEJGdmhDN2FpNDBuLzRwRHM0dlA3bXpydENmQzUreFhiTHVFZlRhQ0cz?=
 =?utf-8?B?bGNhd0lMSFVmeGpiVDd0QVlVNXFNVjlsZk1XbksrM2VYSDljTmhVRlN0Tjc4?=
 =?utf-8?B?WEUzWExOOWVSeFNWNkpPOHRUSSs4YlZxWjQwWUxBNTJpQmFFYVdqOStxV2FF?=
 =?utf-8?B?WUI0REZTTEFVL0E5T09hQXJRb0oyajkvTFowNzF5Zldlb04xaHVneS9aS2Qv?=
 =?utf-8?B?SDl6bGk2UWdBd3UzMU5ZSDlpdkFJTmxPRUU0bXVkUEFBMXFKakdSL0JpZWdT?=
 =?utf-8?B?bW9rV09DMzRYbkVVWElzSjRqTjNrWmFBcG1JMVRMbUsyMHFhL1VtYkM0TjdE?=
 =?utf-8?B?RjBqV0JoVmhtWTR0V3ptclhhcFA3TTJ4dmNhMW5UYkJsNmovaGVOdDBIUUhD?=
 =?utf-8?B?TnFRNlJSUUpmRldVRnU0aTVsejZvdHB2N05xT1hqVnd6SVZKZ1pDbk9ZYVpU?=
 =?utf-8?B?MDhOd2F1OG4xd3FFVE5QRHl6Ukp6Q3BkczE2L3hMUG94MG1hZEl4QTBvSnhU?=
 =?utf-8?B?OGxIeHgrb3ZuQW5lZ1l1bHpLWGJneVpCSk94VUtFV3QvSWF1NzNxSVFuMHVu?=
 =?utf-8?B?cFVycmpnek1JbllJaVlGTVZ0WGoyM05BWFNUNlpDM3FjWjhnT3dTcVUyNVRD?=
 =?utf-8?B?dGFnOVMzbFlkZWNQSkd5LzdJWm5lMEFUVmhqbmFBaFpQQ2U1WGJBendxb2U2?=
 =?utf-8?B?YUc1QjNvalkzOWFRRk8xWkZtbGMxRGZlSlBobEthNzZmamIrU2MvVU9xMTRq?=
 =?utf-8?B?V3dMajRwdVdPSnZtV3VjK3B2d0llRDBzRDVJSHVEaWtUcDF0UElBV1k1YkhD?=
 =?utf-8?B?WnlsZzUyUkl4TWdVdlFCRFdENzByUWwxZE0vWEpvRlVPR2lVVzl4S2g5M1FR?=
 =?utf-8?B?OU1vOTE0ZWFlakdnZUhod1I5dGhPUTBkeXFNZVRlbWhvWTZvMWcwQ29QT3RX?=
 =?utf-8?B?N00vQWYwK0hzSnN2ci9FMWNoNWpqeWZzQTRONm1LNFlhVUVsRWlOYU9YdGRE?=
 =?utf-8?B?VXpYOExTVFA3OG1sUkNEZEdwSW9BOVJNZC9HdVlyOWFUdDhCVEk3UHl2cXN4?=
 =?utf-8?B?OTN6dE5Od0V3Y2YwM3BDVHNWaHZEWUFzcTVGamsrajN3VjBqS1ZvUkFVV3g4?=
 =?utf-8?B?Tm5oeWJqOUpiOXZ3TjAvMTdaRW5UamhvOURsVFBVZ0EvSTlSR2JHNHlTZWxo?=
 =?utf-8?B?Lytzc201VjJjUUp3UG1ESWllMUswMWFrbHRNNVg3ZStYcHpLMGd6bDY3eENu?=
 =?utf-8?B?V2hwWGdZQ3l4N2NDcVo3RFk2M1lIelJoVEhRdTkvZjZ2TUlDN0dMdy9yTnJP?=
 =?utf-8?B?STVGYkRiangvdlRjVUdWWGd6Ykc0SlZHa244djdsempXUXNPdC9tZFU4Ulhv?=
 =?utf-8?B?VFRHbVNYelErZ0VKTytLdGdOL2NnL3ZmWThPdTg1MU5ZUjhXaFlVaEw1b2h1?=
 =?utf-8?B?ditIc3VkY1JucXR2aThkVm5iTnhtWW12YlJNWkpwTWNudzcramIyeTZhVkRr?=
 =?utf-8?B?MjlkUVo1MlhQUUFKbFRaZWZHUFl3PT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a7449da-9678-45a3-aec0-08ddf5994487
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 03:21:18.7637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 33bGJpXbhwuj6rVoTRwqrWMHWIZlhXBVjveD8atX6i1RHQCokZUToNlZe9yKC4lDsg2l4vewpHStbvmlChqR6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7943

On Wednesday, August 27, 2025 8:37=E2=80=AFPM Svyatoslav Ryhel wrote:
> Add nodes for devices on the HOST1X bus: VI, EPP, ISP, MSENC and TSEC.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  arch/arm/boot/dts/nvidia/tegra114.dtsi | 64 ++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/nvidia/tegra114.dtsi b/arch/arm/boot/dts/n=
vidia/tegra114.dtsi
> index 4caf2073c556..8600a5c52be9 100644
> --- a/arch/arm/boot/dts/nvidia/tegra114.dtsi
> +++ b/arch/arm/boot/dts/nvidia/tegra114.dtsi
> @@ -47,6 +47,45 @@ host1x@50000000 {
> =20
>  		ranges =3D <0x54000000 0x54000000 0x01000000>;
> =20
> +		vi@54080000 {
> +			compatible =3D "nvidia,tegra114-vi";
> +			reg =3D <0x54080000 0x00040000>;
> +			interrupts =3D <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&tegra_car TEGRA114_CLK_VI>;
> +			resets =3D <&tegra_car 20>;
> +			reset-names =3D "vi";

You are adding reset-names here, but in the last patch you're removing it w=
here there's only one reset?

> +
> +			iommus =3D <&mc TEGRA_SWGROUP_VI>;
> +
> +			status =3D "disabled";
> +		};
> +
> +		epp@540c0000 {
> +			compatible =3D "nvidia,tegra114-epp";
> +			reg =3D <0x540c0000 0x00040000>;
> +			interrupts =3D <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&tegra_car TEGRA114_CLK_EPP>;
> +			resets =3D <&tegra_car TEGRA114_CLK_EPP>;
> +			reset-names =3D "epp";
> +
> +			iommus =3D <&mc TEGRA_SWGROUP_EPP>;
> +
> +			status =3D "disabled";
> +		};
> +
> +		isp@54100000 {
> +			compatible =3D "nvidia,tegra114-isp";
> +			reg =3D <0x54100000 0x00040000>;
> +			interrupts =3D <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&tegra_car TEGRA114_CLK_ISP>;
> +			resets =3D <&tegra_car TEGRA114_CLK_ISP>;
> +			reset-names =3D "isp";
> +
> +			iommus =3D <&mc TEGRA_SWGROUP_ISP>;
> +
> +			status =3D "disabled";
> +		};
> +
>  		gr2d@54140000 {
>  			compatible =3D "nvidia,tegra114-gr2d";
>  			reg =3D <0x54140000 0x00040000>;
> @@ -149,6 +188,31 @@ dsib: dsi@54400000 {
>  			#address-cells =3D <1>;
>  			#size-cells =3D <0>;
>  		};
> +
> +		msenc@544c0000 {
> +			compatible =3D "nvidia,tegra114-msenc";
> +			reg =3D <0x544c0000 0x00040000>;
> +			interrupts =3D <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&tegra_car TEGRA114_CLK_MSENC>;
> +			resets =3D <&tegra_car TEGRA114_CLK_MSENC>;
> +			reset-names =3D "mpe";

FWIW, I think 'msenc' is the appropriate name to use on Tegra114/Tegra124. =
I believe MPE is a remnant from older chips, even if some downstream (and I=
 guess upstreaming) naming still uses it.

> +
> +			iommus =3D <&mc TEGRA_SWGROUP_MSENC>;
> +
> +			status =3D "disabled";
> +		};
> +
> +		tsec@54500000 {
> +			compatible =3D "nvidia,tegra114-tsec";
> +			reg =3D <0x54500000 0x00040000>;
> +			interrupts =3D <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&tegra_car TEGRA114_CLK_TSEC>;
> +			resets =3D <&tegra_car TEGRA114_CLK_TSEC>;
> +
> +			iommus =3D <&mc TEGRA_SWGROUP_TSEC>;
> +
> +			status =3D "disabled";
> +		};
>  	};
> =20
>  	gic: interrupt-controller@50041000 {
>=20



