Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012056.outbound.protection.outlook.com [40.93.195.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F74366061
	for <linux-tegra@vger.kernel.org>; Tue,  3 Feb 2026 05:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770096716; cv=fail; b=SZy/zWPczcmBvTXd6HKCswkVueQQJr/csQG/KNjIi2AF6eqbQwTbUNP5Pn2/yyXU2K4TQzQyeKk0qx6/RPYlRENab9tHNkrdLm3vusmAq/lja7+TSKZTNhC5wpAEh84fTuDvNDPiLSri/dZ79mlrcBNrMBQQalTKi7pK+SbC3BU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770096716; c=relaxed/simple;
	bh=pTrjmNMrhkitwQQ1s0zRqYQR8LFg55vnFm4sUUfrC48=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ti+oCPYhYvmTrw/SosW/A4AJ8d2wrS67Kcz3nfH+rYe5JUAzc1QdHHOTmZUZyIVnIRtibdMFwuKq3kLHGoagCgJuPeLBjd44NxoVN+4Oye4ePiBeWB/kgrz+IUz4UhispItXjU+ZjsRxAcTDgHHxpY3dfD6TdatRlJ/d+bzgrLc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HarxMPlK; arc=fail smtp.client-ip=40.93.195.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HarxMPlK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vlewA7fL1A2/g++nyvPwfXeGI0qcPmVfMVKfQbntQ8qE1IChfLyWfOVdk9GN+/M0MD4D1t4fs3U1n36EfpgH6IMTisuIOKlhiUoPAe1oWf0kTok/lYbGUlZ1pJ9ZQfKxSRWQBW+zzIFmyHJiQX1Y/o7EOkWTaSt/cbTwQZSlrXRuTvXmDovLtjE8q0j4K2yLneKCaeLf1hJZjzxbJJZyjqcjmquyr7IqfxCI5IJC9Nmpz84QcpkHWzfPzNWWzZLy8eHf0ocfA8PPAndGQ8Z3fq8GGcyxZnsb538CasicgCdv5A91sajuu1+2wBKTvfq1e8aSScMrVqQbb9vYUdUXsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fEgVtwIF3F4UvU9bLK/HGcpmYvtcynDfkcsxfTdGd4g=;
 b=qsRBOMyJ6OpJ2Rp+lBmT1G6Si1Mgh1ScplOcWGRoYe3SScWDkUKB3NHUGWw/JstQOfAgmz+HNiyyNXHV/FvItbiDULXbI6UV+bzglecEer/DiKa1cgsio5uAVcyteMN8HurCvhnBh7RAczHWQdJjQRacX+KwuTQRT1trXb+HFWvxmlRbZrhilJwZTnStDqN+68uZNsH0qMmt9CpovQY2SiHBS0Ii0ZC8VbzQeDpPsHvDvnvAdk028xobLVQMUkHRd/xiG6J1JrwhMGlR4ZVAWmMcHnwsZ9POXOA0U9q1/L9mfqjjsYoZpOCtAZVVNcrwHOm9ZnU+gqDfKHz/g+2Djg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fEgVtwIF3F4UvU9bLK/HGcpmYvtcynDfkcsxfTdGd4g=;
 b=HarxMPlK0QNsq8zdBEbqjEZcRoyT084Ds0s91hbmPfLJsWYZNqqz/cbAuASKvS8Vob+8ScFOzJCoxkRi9ZwZ36GZ2LYF64JdPtsOksmMwmVaxbhmd+hUKcXvDSYVsxQScHuutTmaRRmR9AXJlyY35blj8NZ7KdSO3EKY9HBx7YCvVRKNGOvDa9aQVL11Tmbu3hAS3b/9jjGOWzjIey+prptqOTT4gyKKvA8bfeslJXEaI90OvCieeRi0iePq66AVmfBREDBMzqY1NkddG3tvHmTWxmMOHyp+l93pTrA/7yNvNNtiaFdz7kEWxU9vHuSxFj3G224jEoR36V7DiGatKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by SA3PR12MB9180.namprd12.prod.outlook.com (2603:10b6:806:39b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 05:31:52 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%4]) with mapi id 15.20.9587.010; Tue, 3 Feb 2026
 05:31:52 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: JC Kuo <jckuo@nvidia.com>, Vinod Koul <vkoul@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>
Cc: linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org,
 Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] phy: tegra: xusb: Remove unused powered_on variable
Date: Tue, 03 Feb 2026 14:31:46 +0900
Message-ID: <5642332.Sb9uPGUboI@senjougahara>
In-Reply-To: <20260202153314.1634145-1-jonathanh@nvidia.com>
References: <20260202153314.1634145-1-jonathanh@nvidia.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TY4PR01CA0108.jpnprd01.prod.outlook.com
 (2603:1096:405:378::18) To LV3PR12MB9166.namprd12.prod.outlook.com
 (2603:10b6:408:19c::13)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|SA3PR12MB9180:EE_
X-MS-Office365-Filtering-Correlation-Id: 079df097-4b1c-4fde-6f92-08de62e58858
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|10070799003|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OGd6aG9VSlo3RVRFQmYyWWNBZGxtK3B0OUtlTG5EaDZGNnphSEZOTnMrYmt1?=
 =?utf-8?B?SXVLeHNmMFQvWlBDV054SFRqMVJidnBXMVhYSG9YdGVHWWtmMFRKYmtzQnha?=
 =?utf-8?B?WWx0TEh3emtQZWVNVlNKVFV5bXJwczVYL3JyNXozQURmcXQwSDhpdloxc2NO?=
 =?utf-8?B?Q3RCbzYxMWs4VW93UXh5SURGKzFDSkRQUzBqdURRT1JrSWJ6ZXJFcVNERll5?=
 =?utf-8?B?VHFhWSsvSHRZdTNCQ2xHdHJtK205SFFtekFnUml0MndxenRxQXJPVW1QYXZL?=
 =?utf-8?B?Ni9GMS9iTFZpQzdya1QwOGtrVUF3a0tRSlE5SHRrZTlhMDRCMFMxU1pqYWRM?=
 =?utf-8?B?bUZuRXplRXZBdEhmeUZCUHhKeTlLWktpalBZU3ZRTURTVU9MRkgvQzVPTDB3?=
 =?utf-8?B?SVNzN2t3V00rS0s4T0p3YmsvSXpwNHBub1kxekdXdmJIdEc3Z3dLUDh3YmZ1?=
 =?utf-8?B?eDk3aVRDZDdlOEVvQnFWcCtidi8yYWF0TVQrL3hCTFh0cFJkN3FmS01DaVZx?=
 =?utf-8?B?YUY1T1FIQzN5aUYyUjBVb1lNMG9md0lWQlBHZi9xU29pcnlEMjBtYWpKanhv?=
 =?utf-8?B?NmIya01mUWxRcWZkWDJnNWx4aGlsaTEvRzViWWhlVHJHZFhJa3QwcnErU3di?=
 =?utf-8?B?SkJtMUZRWGtpdEY3c1A1VVlGdU9KQXhYMUxhQnRDNXJ1THpjbGJodURUcXpz?=
 =?utf-8?B?eFhkVUI3OGJqc0U2TkEwSmxaamU3dmd4REtSVkRZQTZrQWN6ZUFPTkdtU3c5?=
 =?utf-8?B?NzMxQk9BVXBXbzNmMStUbGpLcnN3T3RMd3ZXcDk3Z0NXWG1qSExkYXpyRnMw?=
 =?utf-8?B?c0pQQyt4eWphU05tQ0g1WXF5UTd2S2hVdFJPQVNZb3RSeHVLSE9pVW1XN3oy?=
 =?utf-8?B?TDhhMzlxenEvYU83MHVuTFgwcmhuaTd5TGw0RnlybHJHQjZVbXJYYjd6bjRj?=
 =?utf-8?B?NGdSZ3RkL2dtZE0zM21DWFpjZU9PNzBudG5HQ3l0VEFweEdXN0xRNmt2c1Ez?=
 =?utf-8?B?OHJTeFIyQW91YjBPQjM4OUMvQUFLTTZYazBOSmdZQXdFU2JDdlZWd0k3UnZU?=
 =?utf-8?B?UkFKRGl5NGx5N0JDNEJUM2xBT1RQK1M2Mll1bk1keEF6UlFyKzNpTFZQU2g4?=
 =?utf-8?B?amYzZ2RwS1NxYTluNTFOa0hiZndkS1dndDFMU1BncmNoQXU3Y1gwRGZ3b3J3?=
 =?utf-8?B?anRFcDhMNGRDQkltdDJNQmxFd1ZMR2NvVG81aFkrTFZjT3RNNzhEN0gwOFY5?=
 =?utf-8?B?QU1OdGRJWkl3Z0dCOVFQSTh0RTJXZGZ5MCtUUUs0VFFSVjNPbUtEaFp3Zk85?=
 =?utf-8?B?MUtFSDZIOVpDME5RT09yNEQ5dGpCbXl1NjVuSWZqNzRIUGlOWE5NaXd4bThV?=
 =?utf-8?B?Szh3bnRFRkhBcTMzd3p0MTl0cnFnY1l0QlNoNE5Na3NpSy8xZVJJM2NtZUtD?=
 =?utf-8?B?ODhMUEZZc3I5MndHdW1pOWxRTmlOckEzNzVzMlM3T1Z4NVQ0UXBUcHpRVFlH?=
 =?utf-8?B?WEJnUUJiTWw2YXQ0NVZReThLWStqZUxkY052VERSMDFwdm1jQkthWHNyMjg0?=
 =?utf-8?B?d0puWmxTNzNyK1NoSW96REF2OGJCbktPQWg5T1JjU3h0RjZpcVFUUEFhMXlE?=
 =?utf-8?B?Ti80bm9KZTMyZHJ0NEJlNTh2Q1hBcGovYjZtVmtCejZWc3gzYzhEYnBSaHJk?=
 =?utf-8?B?WFpqWncySnFOb3grZndCYXZDVURYN0ZrRmFTc29zcjNJSDNhWElFYWdmaWdE?=
 =?utf-8?B?OU1TOURXRjlNbkNrUmtpWEh4QkpNazNRdFRNTzB6Yml6ZjJSa3ZqbWM0cnlu?=
 =?utf-8?B?UFg0OUw5RnZWVXRNaTQrQlhMbzFFS0J4QWVtaEFoeWR1RXFkazFPRHZlTlhW?=
 =?utf-8?B?Q1VXc2FJTmhrODNvTzhvbVR1K0w3WTdoZmthNFpXQmsxcUlSRmNYRWVwSmh3?=
 =?utf-8?B?d3pPZjdTeDcybmpzK3JOWmtBL01mWkdLOEFqbDNJck40UEJMczdBbFFzSGE5?=
 =?utf-8?B?bW9vaDVORTJGTTZlTW84YlRNS0tYOXQ5V3pnRWtBSWd4SVQybE1xVUUwUDRX?=
 =?utf-8?B?bmh6SnFyZ1dHVmVhbXZUeUd1eGVKOHloUjNEczZUQWdjYUY0OGo2YWFHVG1p?=
 =?utf-8?Q?2HNU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDRadmhKOUREbEdPSE1JQjNMbWZmalp0TW0zMElKUi9JdmxtNG45MStXREZX?=
 =?utf-8?B?UTJoRU9zL0F0aUlXWmtkWTFqOEJGUGZLQmNDdHBxSzNLbzVURnhMQWlmNWNt?=
 =?utf-8?B?WUtEWUlpQmFVYVRab1lMOU56TnFUaTB1aXYxcyt2TDJ4SkNqa2RXL3ZRVFkx?=
 =?utf-8?B?cEhEMmJDOU5wWHd4U3MxUjF6RmJQT1ZPcXVNYlFlM1R3QVh2eVhnSVdNb0Jy?=
 =?utf-8?B?OWtxMWdEOUcyRHRCaGNZUC8xT2sxVldzMERlZ3JROWlpaG9rOXplUmhzT1d5?=
 =?utf-8?B?OGRicTFROGdoUmtnTDcweGx6OStzYkJ5UEFuUUo3OWVFN3F3eUplZFh4QWZ6?=
 =?utf-8?B?WUkzMXNrR0IvR0pYbkg0elc5dWhFaGJ4amhYOFhzMHR0dGgwZFJGMjVpOGRD?=
 =?utf-8?B?NEs1Y0tmdzFEK0JIZC9ta0ZpVE1sbEQzWVV6bjdmcHhsZWJQYndXSmdpSVE5?=
 =?utf-8?B?N0UrbXkyeXZTYVk0UmJTOFNiUzZFVFNNVE5NUmwrQnQxcEN1QlB1ZjJBNE1G?=
 =?utf-8?B?b3NOL0tIaEFWQXpGNXp0RlJCS05ROW5IQ01RN3pLbFc3amorWW80bUQ4czRk?=
 =?utf-8?B?TUx2Y1FSYTNUTit4eUhxbFNJTDFZZCt1U0kxWThraCtGVFRKZy9XRVlDei9q?=
 =?utf-8?B?VVJGUmpmN0ZXWno2c2s3dXN3bXE2TWIxVEx1WlFGeFZUcXZkUDY0d1pRMEM1?=
 =?utf-8?B?b2c0RlZKb3NXSVNRUWRxME1OS2wwZnR5M0JJMnByRVhPUHh1Ti9zVERkWDV1?=
 =?utf-8?B?aEdzKzdJcXZlTDBGSW52aTB0WnhQZmlWWmI0VHRibzJBNnNhMVV1Y21Bc2tS?=
 =?utf-8?B?K2VWb3dXd1IxWE0wTENHbEtOWi8rMGN1ZjcxZEFxY2tlaEs3MmpwVHNJTFRl?=
 =?utf-8?B?Vnl2Q1IwNHhKR1Q5bXlvaCtPWUthMHBicTNpZ1N4dnlwWUVjTktiQzdOVWZw?=
 =?utf-8?B?SUQ5MXZJQmdpQlhTT0RnUXprNlZhSmNmUWJOWmhtdElJU3h1aUM2SXY0NUdy?=
 =?utf-8?B?Ry9aaXp5T2lGcnU3TjNSUnpuS3RyVWg1ZHVRVjZCdXoycytQcEdMWjR6a1hh?=
 =?utf-8?B?UUNrekp0Z2RId2hxT0JxU1hBZFExK2dEN1AwRVZySnQxbjgvbW1TbUNqWWg0?=
 =?utf-8?B?enlkaEJudDVzR1pjTTZjbkFFQ1BWbUMrSnNFc1BLT0NqZC9BVHY2RDF5dEQ1?=
 =?utf-8?B?OTNnZGw5VnpaU0gzQU1zYkJ4MTJNNFcxVFV1TjlMNnliV2w5MU50RUFqNHAz?=
 =?utf-8?B?SVNaWkt2a0R2WTl1OXJ0TGErWHgzTHorSG42TzRnMU9IeVBSMG5BMG9PcXhE?=
 =?utf-8?B?NmIwMXg2OEtrVDh3WkJScUdDUHhxVXU5akx5UGpENWlWcnMvNUhiSVVhYmFj?=
 =?utf-8?B?elJVVHJudnRsdUFFL1hKVjNSUzRqa25sSGsvZDJMUXZKYkZ3MXk0VDdpallN?=
 =?utf-8?B?KzFoTmlvQnJzU082Q0JEM2hydWpxY3l3eURrUnZZSURuaTc0dkNYMnd4UnA0?=
 =?utf-8?B?aW96Z2RqcVIwd21kWmhzaEYzY2dBdkJyb0hGcEFvTFM2YndvYisrdTlyYW02?=
 =?utf-8?B?cHY3YVpyMDNDZDRZYVZoaEVONHRpN29NUUdveDA5citCMThkZWtSVklNSHFB?=
 =?utf-8?B?WDY5QmpvSE1DblRCK3hrUW5xcWs1L0pmL0hhb3JpQzZUNzFQR3BmTUtaWFpD?=
 =?utf-8?B?QkVDd0pwQ0tabUpzZ1NZbEFVMitjQWVkclFEc3gvaGVMMjJYMFVRL25GVlcw?=
 =?utf-8?B?Q2hsb0ZZR1RNVktWWm5sSVFKdmo4RkFud0VjQ1duTDhMWnh4TmRpcHByVmRE?=
 =?utf-8?B?eFlrTTA2SEFmM0d2VU1qOXNJRlBiZitKMS8rL1lNZHF3OE0ySGw5U1JHWC8z?=
 =?utf-8?B?WHhmSlE0UCtUcXlDQjZhWUZiL0JMNjlmTE5WbVAxL0ZrdVpKK1c1MW16ZXNj?=
 =?utf-8?B?RExZZEdiaWNPK01xdENvclZGM0ZHUDE2bGRkM0VKOUFiMkN0WHVYUVkwYXFB?=
 =?utf-8?B?L05XUUVEcnlqeDN0WmxVcXVlZnFhcXdEM092SEkvS2ZNOEJOSjVBWDVTTUhq?=
 =?utf-8?B?cmwwY2NsckJla1NrM29tTWlrQlZ2TjBLWFZlay9RRllKcGVtc1BTSkUxTS9S?=
 =?utf-8?B?Z2RNaENQTm9vVmZVY2svSmdHTHZnOVlCNCs3TWd0WllDc2g5UUFoSE42ME5R?=
 =?utf-8?B?ekNHMWhFbDJ1V3pxMldicmU1c21EUURBUW5EUjV3Z0xGcUs4WDlHWmw1WEJn?=
 =?utf-8?B?RVJQWVMyTUhiVXc1M3R6Mm50blB6bm5xSHZGSmhWem5GaE9DMDZ5NDZRQjFX?=
 =?utf-8?B?a0xIbFZDZXJiSWVlNGNOdjQ1ZDQycDhIU1hrdi8zSnZHZE5vN1kwZGVUVXFE?=
 =?utf-8?Q?qfQa/giJB3ngxd+1bjwyFcTWvvAvH4l0RmBWsMP2mTffJ?=
X-MS-Exchange-AntiSpam-MessageData-1: WfHK+MksPsSs0w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 079df097-4b1c-4fde-6f92-08de62e58858
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9166.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 05:31:52.6669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jRju1ugK1JGNtl/9HypSL9LsntTO/bV6FJell5SMu2oqFrC6/qAccKejfkYiRJ/UQMNj5gEQ9xtcdrwL0wnWvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9180

On Tuesday, February 3, 2026 12:33=E2=80=AFAM Jon Hunter wrote:
> Commit bbf711682cd5 ("phy: tegra: xusb: Add Tegra186 support") added the
> variable 'powered_on' to the structure 'tegra_xusb_usb2_lane' but it has
> never been used. Therefore, remove this unused variable.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/phy/tegra/xusb.h | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
> index d2b5f9565132..cd277d0ed9e1 100644
> --- a/drivers/phy/tegra/xusb.h
> +++ b/drivers/phy/tegra/xusb.h
> @@ -69,7 +69,6 @@ struct tegra_xusb_usb2_lane {
>  	struct tegra_xusb_lane base;
> =20
>  	u32 hs_curr_level_offset;
> -	bool powered_on;
>  };
> =20
>  static inline struct tegra_xusb_usb2_lane *
>=20

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>



