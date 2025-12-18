Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011031.outbound.protection.outlook.com [52.101.62.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471B42F83A2;
	Thu, 18 Dec 2025 11:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766056341; cv=fail; b=DQIy2dyf2kVytjldoIuub7V6CdaTX5rnqUwe6zJNhnMqUb12rvxLhqzrel60qqL5p/TG4pJe99rs9x1r7EFQnu2wVlG72Ro16VJcyTK+vUxcGfGcvEp+2z4TsV42msYLrcwIxFpiqrtNxSAmkOdRLET1riCbNNk8qlQGzCjoDOo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766056341; c=relaxed/simple;
	bh=a8+CqtdmzxgdtRPd6ZAQo7SGwoMs0r9he1XWxMdiKKU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fUGNPzEMIg02HWwChL9SYGOAUyNLa2/FjLqTR2K1HbsnKYDoZxKRzOa58ZrjUDqGX9Dmw1SKKZ81HmLeH5Sx+om4jlKiZM4sgleo9lKp9Q0PmzjZ1YTEwxzjWATjz9mds0jokpv2lV31vjAHAox/SLi8HO4UMiUVXXYGyLpSHlM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FTxXpFun; arc=fail smtp.client-ip=52.101.62.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FTxXpFun"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hr0JwyYvGvdXZTeQMuJvtKQtmvr+GCFeYe1exJwKh5e/OYEnjROyi1t+HNYSNiPRQpjoNjCjoA+fE3pMaPBLNAxwPGMIQTBjjkx6XONOVgUZW2sl4wZFhqJ587m5OZaL8YabEMjOVmRmyfuwUEmO+28fpg9gAGIxYgLig5J9QkTeICdxP7GpCUE97xhGkWDbHnBjKxmwhM5vJUzonqseRMtjfCbayJ03hzN6efoNqmFe8XYYgpXRlPseDjvbfzLTQ316uXHfmSWOIbKE4snQt4spUef2QLqi00ERm3ND8X/DmHyFmvvrKLH1fmvp1MCdhhcT1reRIQh1WsWGTiTMuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oK0Nf0GCBUSruvI2Cha0R6QA899BNjxSSEcLiMBGItk=;
 b=kMuRvH0VSrr9S4i/numkg5LJW0BNVUkqWMjaCyei6524N/xGUxLY42S8q1zJw3LC3Pe6utz+THN0sqQ6FfNvZVJ96RqKoxwL0EmEf+raUxoe8v9FcdZWkZZqBDzf+aB1eq3+K27Ya4U6LLCVkvq9w6SvPQs2VCvBr0d0hKiy68wBBJeNY7s/gAXvHOX1y1supzeyKcROl3XYQ9QJLrlb8vOo1ZCdpJc5fK+dlEk0UyqvIvDpgbCam3YLLZ4AFagJ/1jYkOvPKHGfvWxfQKpYsQoLsIVZWE37IjKZuy+yuu1WwFyXcXgxzw7/Av3kjVwA7wf00L+eRW/q410IeRWL6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oK0Nf0GCBUSruvI2Cha0R6QA899BNjxSSEcLiMBGItk=;
 b=FTxXpFunodjK8d/0WGxYM3xXKLi0Kxvma/R2XHSEP70Gw98lY3hXidHHzsPEZuYPHCYHGHBjVT7mMoX9AGrbTmnlUVhxSFGbnGhXNQdO5XJL7fq0c79bW2Z89QFmHzbAbv1VtB80BxcGbWhlbuCNdn+aOyFrIO8SQKAk57RyyRv6AL6GTkjUEo1IZjAAqML4/otWdG59/XfqFInK5MV1QquDvU71xb7ucdfN8dwFhwFw2CX2u4ajRrNhDuvkE1ikkTwHuKDNBtZBqZapNi0FhrwpyRzLU3LFFkXhcUF2IyHq7vzkVtSyKqo508gTd9Lwd/TL6h72u6UQT+9jwt5Ibw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by LV8PR12MB9689.namprd12.prod.outlook.com (2603:10b6:408:296::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 11:12:17 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%7]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 11:12:17 +0000
Message-ID: <4900cf8f-9ec8-48d6-8187-126e111cd048@nvidia.com>
Date: Thu, 18 Dec 2025 11:12:11 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] memory: tegra186-emc: Support non-bpmp icc scaling
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20251027-tegra186-icc-p2-v4-0-e4e4f57e2103@gmail.com>
 <29cf2c16-3a0e-42c5-a083-16f77ae5d09a@nvidia.com>
 <CALHNRZ9KAv-hL6+6Uiaz2O2odm1rqMnjNxNVPsbCOdqX15KTuw@mail.gmail.com>
 <856447ae-4338-471d-a71f-a34aed749ac7@nvidia.com>
 <CALHNRZ9y0n6JNfeDUQgZoECkxo+We0_G8TP0H4advcSqrX86kg@mail.gmail.com>
 <f906f85f-b110-4328-b177-02fcdf7ffe53@nvidia.com>
 <CALHNRZ8go4ATHgJ4SE=7pkAMgRP_0tj5z4pDXjxicV9o7F13Ng@mail.gmail.com>
 <1b9f0b14-876c-4c6e-90eb-b04d016f88e8@nvidia.com>
 <CALHNRZ_GGAg_VP8gSdtw_1CA2A0netrOeA2+guZfxyG7POhHoA@mail.gmail.com>
 <adc7ca5c-69d8-4164-bd89-3381b101576a@nvidia.com>
 <CALHNRZ-SU_kyak_u6mfUZBHJ9Cph6=-edhL+yhRizu8DDy=Big@mail.gmail.com>
 <CALHNRZ9mfO_DQR-RuH_QH=18R8zTt9VqbPaVCdnDKUWzx1pm3Q@mail.gmail.com>
 <45057c95-1dba-4302-94fa-f63941ee2b20@nvidia.com>
 <CALHNRZ8gJbyuD+0yFQwCJ+g7OcffjkXopRSJKoDnr5WMmUVGwQ@mail.gmail.com>
 <0c5eddc0-8b37-4199-a8b8-f235ac3aa476@nvidia.com>
 <CALHNRZ_zhZ3a7h8nSWkpGv6+unKn6DkSA9tKQ6cmb5TXjGcC9w@mail.gmail.com>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <CALHNRZ_zhZ3a7h8nSWkpGv6+unKn6DkSA9tKQ6cmb5TXjGcC9w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0185.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::29) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|LV8PR12MB9689:EE_
X-MS-Office365-Filtering-Correlation-Id: d84db465-e63a-408c-72d8-08de3e264de8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QXpvNkN0bEVkSEo5bFhPZThwRzNmNWprNDl1V3lFTVpENTJHMzBMNDZsMW94?=
 =?utf-8?B?TkR0T0I1c245SHY5V0Q0RXR2bHl6d2cwNVBkYVZSNkE0aWZNenBSQnM0Qnlq?=
 =?utf-8?B?czRzQkNVY3NTOTN6bklBNTdmRjd3WGNTMTJCZXNEUitBNDlveklMNmIveGFt?=
 =?utf-8?B?eVdUTGovWnRVNkw5bjRwUTUxVjJiNXZ3bytPMmxGL2F2VmdBS0JvVGdDMzNN?=
 =?utf-8?B?Z3ArQUtuRUN6NmpQTjZ4dUtobisyMithaDFETlhYS0FYWUpDQ0RUVVBEYUNC?=
 =?utf-8?B?UWdqYU9MVE5xK0N2VWNaWEljKzlpbElobHlxcTZZa0hTY1N6QXdyZ09PRU83?=
 =?utf-8?B?QkY2R203R3VzNFVvWDlhZENkZmFnYUVPLzA0SXV4Uzhxem9oZlRmam9EcFkz?=
 =?utf-8?B?RnVySHUyODdnU0xqcnRKeGdIUHhYbmdLQ0UvVXZCT3NvbnhZTUJkVTlBeUFH?=
 =?utf-8?B?OXM3eEVTWTFpREZJcWoxcVQ2R0M4Q2lSWEtaYmlzOENuRllnQnNLYUhVVER6?=
 =?utf-8?B?aENGUnVlUHp3cnQxVWgzR3l0UXEyckNpbFJQd0gxYUk3VUdzd25OcHNkQ2dS?=
 =?utf-8?B?dTdnd1pNVEJXSDMxR0RrbENaK0doNnhIUkxZODRpNVhUMEVTRDRPRTVFM1Fr?=
 =?utf-8?B?SGJhd081RFF4WHFyemd0NWRlbEszY0F5UnRYMW5zbUZ0OExXKzhnS3Nha0pV?=
 =?utf-8?B?b1pKZHBsSFNLZjQ3TUxUL2ZHLzhwRldUUStxbG5VTjFmYk45aUN0bHZhRGdG?=
 =?utf-8?B?T3VYQUJzekRHMmxueVJNUWtlOERoMG9LL3g0aGt3ZFJXZll5SzAvQ2dHNXdv?=
 =?utf-8?B?b0Q4OWlCK2FLS3hTOElzdGJHWjB1YzVjTklBM2g4ekk0U3dzWksrTzQxM3I4?=
 =?utf-8?B?T1lGSjJjazJqaFJEeXJmUGVUS2tMYmlBNCtoYXBMdzgrK0RzMWo2cFZTU29s?=
 =?utf-8?B?U3hya2xTK0JTNHlKWVBQVm45ZExDTDVKWlR3WVZCSXZhN1R1R1EzeHZyQmJG?=
 =?utf-8?B?a3N4blM0cW15RFgwS3lvN1VwTjNuYWNXaVdaZGk1RHN4djZoaTByd0NFdkxR?=
 =?utf-8?B?NDRNd0RrSlE1QTQ1QzBjUjNmL1BkanV2RkdHQ3ZKSUlrdGlZSU5hT3pUajJ1?=
 =?utf-8?B?Mmt0T3VzWkEvSktSL1FHVWp3NHZXSXhOSnAvU1JMWncvb1AwUjBVTXRMM1ZX?=
 =?utf-8?B?akMvVlhidTJmbnYxT0NnS0VBeFh5RDBUdytxTWNLS2EvMFhFRUZ5aWFVZC9H?=
 =?utf-8?B?SU0zeTh6b1BVTWFGTGVPbmpWWktxVEFkT3pLMlBnM1JjMXFBWTFoRkFtcjJk?=
 =?utf-8?B?SW1uOElkcW84TlJJdlNWaE5zT09scm56SE11YlRRdmZoQ0RmeXFiTXFLOUNB?=
 =?utf-8?B?MXI2cjE1THdWTDRzTDBzQkttSTljazkySkVmdHAwSFFIMStBZmJBamR4YnNE?=
 =?utf-8?B?bERjQTZ1MVpRdFJweEhGUllHOElGbnhOV25FQXRMSFFpRVdrSThZaExaUkZj?=
 =?utf-8?B?dU1kUG1QOVVDZHo0cDRvRE40TURHa3FuTjR4R0Y5czAza0xvZUR3MnRyNVNY?=
 =?utf-8?B?YnU2VVhHZnppWmN0Y2Eyc3F2bHVKTjdVcVp1K3kxVkg2Ym9DNVZsWTR6Mmc0?=
 =?utf-8?B?UjBOMkVxUTM3UzhTTnRHTEY3ZlphZmdsc1hlYTB4QzB0R3ZiS1k3akVFRjdo?=
 =?utf-8?B?NFJVbTU0bHFtdm1pK0ZvWWM0cEZjaVFaelRYRy8wK2ZUakc0TVNyUE5ERHRj?=
 =?utf-8?B?Q3hJVVVndklUNkFHaHI3UzEycnJKYStlK3lEVVBFNS96Tzc5cW5UR05HNnpL?=
 =?utf-8?B?WTB5MjhDUUkrdHBYZW56NnlXRHFKa1hnc0kzVnN0WFpESFlCYXBSMjgzei9E?=
 =?utf-8?B?VG9YNGdiWlZqTUlvb1dGeUxjbXVCWnkzUC9keHpXK3FDNTcrSnlJemVTNnYx?=
 =?utf-8?Q?YqYOXitP1GJ5JSlXRTPIqLZo6si2AU2I?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkRuSWdHQ1VvejNYNGNGNUJFVDk3cXR3aTZqNEQyaENHRngrSXBjaXFhbWEz?=
 =?utf-8?B?b1hqRDJrdlpjUC91RHpQR25odDV2MUlZZ2d3YVNZUktTMW5CQ3dneC9RSGQ5?=
 =?utf-8?B?RlgzblRJcHhYT2cyeG9jcHc1VXQ4cGtva2x4cE1neWZ0YlByNlhEQ0JnM016?=
 =?utf-8?B?V2RpeXFhTWhreDl1eHl6ajFkbFJlemt6em9MWU5XVlRUY3RpS0JMR3c3cjR1?=
 =?utf-8?B?RXd3aURsNjRWR3VBWFpsQVpOQTQ3U0xnbGlLeVJJMmQvVVBPdDJTbzAvTkRD?=
 =?utf-8?B?cUZ0OXR0VHB0QTY1S0cvb0d5ekJxbUtwbWJWQ2dWN0hJUDNnN2owZVRMVzZk?=
 =?utf-8?B?TlpTSGpKallIVzhIMm5rNGRRTS9aaHkwOVZWbXZNSm45aWVtQjYxSzJ0cEUy?=
 =?utf-8?B?ak1kalFnTDJDeFFNTWtmNk9iYmVoaEg3UG1yL3RENER4bGh3R0JJRHNHV1pB?=
 =?utf-8?B?UGhMZ2JMMzl4b3U0ZmFVWnlHUSt6dW1ucS9la1pEUWhKMlgwWTZtdlRYdkhS?=
 =?utf-8?B?ajZMOE56bzQ5UWM3eFIzM2lKSWRJUXJ4NVBGZGhGVWs1MldwNHVQN29XYjk3?=
 =?utf-8?B?K2NhcXF1V0EzSXJYWUE4Y3c1cUw2aXNFREdvWjI0YTgraGIzd2VBNDRCc2JF?=
 =?utf-8?B?b25HVjRnbGsvUGhjSXgwd1Q4NEtORjBWNWhiS3E4UXZJMDdxRE0wMkRpL1FZ?=
 =?utf-8?B?bUhiMUw1Nk4rSmJacE16ZStpcEZGSWlrL1lGVjUvZWpLdDZEZzJjUHQrZU5h?=
 =?utf-8?B?UmFwcnIrZ1ZheERCWTVOZjdFenpNOU8yUTVQWlBjd0cxdE9OSjMvbFFqWUxt?=
 =?utf-8?B?ZmNRdG1JMHN5enFtZG10QW5JQ2NjalBRb24rZ2tYOEFCSkpBWTNITCtIV0VG?=
 =?utf-8?B?eTBETmpLSVgzY2NBTDhScUJPbU1UMEdmUVExU2w0Y1ZaaEszSGh2cDRyaVRU?=
 =?utf-8?B?aUE5bENjNHQya2RXYkpuaEQrN1VCdUp0bmNqTmxMQzdIKzlxMTIwZFhKbzR2?=
 =?utf-8?B?K0NSbDduemNJeFBjOW9vUlRlV0lGWS93bnpmaDFoY2YrelNKQThoUkR3YUJ0?=
 =?utf-8?B?bUdpaEtsNGtQM3pEUXRBZms0NHpqN3c5d2o2dUxvMHZtemJNaFRPZml1Mk1C?=
 =?utf-8?B?U0RnNHZxOElGMldCN0Q5VUV0WnM4VmRjYUpDYUZybG5vQTVhNnh5MUZUZG1S?=
 =?utf-8?B?bTV0bkVhTTVyTzg1NUd1NDBsMEgwNldNZVlaSXdlWjZLNWllOStmVmNjaXE1?=
 =?utf-8?B?anBacmdwQ250T1B2d21vZXFhM3JpOENlR1h1M21DT0phcytyNGhIcTlSMUts?=
 =?utf-8?B?Vk1RMVplamJiMXRNaTBaNWZnR3NvMmhRdlB5ZEV0SlNGK0E2N285ekJEWHoy?=
 =?utf-8?B?a3AxYm9zQ2FDRHZUNmJQaUZTd1NIRjkwRGd2NzBZcnh5NGFVNWtnUkxsZHNM?=
 =?utf-8?B?VC9tWENySm1CaXVaSzhQSGtVV2dBbXBTdU5oTmJTMVBuTUIvRnY0MHM3ZXlS?=
 =?utf-8?B?M1FUdnRnbzZ4QzZhQjh3SWNDWjFtWTA5dTBaV0p3NGJYeW5za0Y3cUg0TEVB?=
 =?utf-8?B?OXpDeU1TSTFuRXZ0T2dZcVYxQ0lycTRDYjkwTWpyKzRTVUNpd2FoWGZmc21o?=
 =?utf-8?B?TkFjcG9wU2hoN0YrV2l4S0t1L0dkOTBqbVplWXZoVUw0TDNpVEJBcCt2RzBQ?=
 =?utf-8?B?aWk3bDZUNU02QmVNL25TdUk2ZU95eC9NbkNNWXJvYTcxWXgzTGJUZUFMR2gz?=
 =?utf-8?B?SUFOamc5dHoxTE1DUi9saW5VYUszbmcweElSbDFGUXhMY2JwMVNUWkd5dThx?=
 =?utf-8?B?bUowZGY1WUlEbDdEQXl2ZG1sVWw3cFpTbmdIWjdMc25aaUE0am5uK1N0Nk50?=
 =?utf-8?B?QWMrNWVpM254eGY3cE11M1o4Z3pvRHZFUzF1SDRYSE1MSHd2dWVkVVZSTWcx?=
 =?utf-8?B?aEVpNERWZ0NsWVJQTEJIRnRwZzZvTFhVV3p6cTByNHdjUDZuc1dTZTRoc3hy?=
 =?utf-8?B?aW0xOEJvbFlGd3ZlUC9kdWxTZUszUDBJaHNtQUl3S0ZTUHJyVTBCRXdDUGZQ?=
 =?utf-8?B?OFpvcGNUcXlIbHlYMktsNmc2Y3AwN1d5UGxxbGYxNmQvQ0dqcGQ5bnE1T3BB?=
 =?utf-8?Q?2NjykEqq5QJizvp5QuuMIXxtf?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d84db465-e63a-408c-72d8-08de3e264de8
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 11:12:17.2789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p7OTGU6i54fLeDs76TwP9bvgeyI5t3puQqVjIFhJ1q+wZTDWdMKekvhP1IDs0Z+gq9IbA9x4ClRNljH405ME6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9689


On 17/12/2025 22:44, Aaron Kling wrote:

...

>> Thanks I added all these on top of next-20251216 (as that is the latest
>> I have tested) and Tegra194 fails to boot. We always include all the
>> modules in the rootfs that is being tested. You can see the boot log
>> here [0]. We are using an NFS rootfs for testing and I see a message
>> related to the NFS server not responding. I am guessing something is
>> running too slow again because the only thing I changed was adding your
>> patches. The test harness reports it is timing out ...
>>
>> FAILED: Linux Boot Test 1
>>          Test Owner(s): N/A
>>          Execution Time 219.31 sec
>>          Test TIMEOUT reached. Test did not report results in 120 secs
>>          Percent passed so far: 0.0
> 
> Okay, so. Modules are in the rootfs, none get copied to the initramfs?
> And the rootfs is on nfs? And for this failure, nfs never gets
> mounted. So... for this case, no modules get loaded, implying that
> whatever is happening is happening with the built-in drivers. Which
> means this case isn't pcie related. Are there any modifications to the
> defconfig? It appears that there must be, to have dwc-eth-dwmac
> available. I will see if I can trigger anything when using ethernet.

If you look at the boot log you will see ...

[    7.839012] Root device found: nfs
[    7.908307] Ethernet interface: eth0
[    7.929765] IP Address: 192.168.99.2
[    8.173978] Rootfs mounted over nfs
[    8.306291] Switching from initrd to actual rootfs

So it does mount the rootfs and so the modules would be loaded. I 
believe that PCIe is definitely loaded because that is what I observed 
before. And yes there are a few modifications to the defconfig that we 
make on top (that have been added over the years for various reasons) ...

CONFIG_ARM64_PMEM=y
CONFIG_BROADCOM_PHY=y
CONFIG_DWMAC_DWC_QOS_ETH=y
CONFIG_EEPROM_AT24=m
CONFIG_EXTRA_FIRMWARE="nvidia/tegra210/xusb.bin nvidia/tegra186/xusb.bin 
nvidia/tegra194/xusb.bin rtl_nic/rtl8153a-3.fw rtl_nic/rtl8168h-2.fw"
CONFIG_EXTRA_FIRMWARE_DIR="${KERNEL_FW_DIR}"
CONFIG_MARVELL_PHY=y
CONFIG_R8169=y
CONFIG_RANDOMIZE_BASE=n
CONFIG_SERIAL_TEGRA_TCU=y
CONFIG_SERIAL_TEGRA_TCU_CONSOLE=y
CONFIG_STAGING=y
CONFIG_STAGING_MEDIA=y
CONFIG_STMMAC_ETH=y
CONFIG_STMMAC_PLATFORM=y
CONFIG_USB_RTL8152=y
CONFIG_VIDEO_TEGRA=m
CONFIG_VIDEO_TEGRA_TPG=y
CONFIG_DWMAC_TEGRA=y

Looking at the boot log I see ...

[    3.854658] cpu cpu0: cpufreq_init: failed to get clk: -2
[    3.854927] cpu cpu0: cpufreq_init: failed to get clk: -2
[    3.855218] cpu cpu2: cpufreq_init: failed to get clk: -2
[    3.858438] cpu cpu2: cpufreq_init: failed to get clk: -2
[    3.863987] cpu cpu4: cpufreq_init: failed to get clk: -2
[    3.869741] cpu cpu4: cpufreq_init: failed to get clk: -2
[    3.875006] cpu cpu6: cpufreq_init: failed to get clk: -2
[    3.880725] cpu cpu6: cpufreq_init: failed to get clk: -2
[    3.886018] cpufreq-dt cpufreq-dt: failed register driver: -19

So actually, I am now wondering if this is the problem?

Jon

-- 
nvpublic

