Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010049.outbound.protection.outlook.com [52.101.201.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50301205E02;
	Thu, 29 Jan 2026 13:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769692124; cv=fail; b=PAn+ni50jjFFKxiZkez3bW0CxHbQqAmlSCTbyaIEbrVQrq5uFyJbuki79/yJEwTyCVh9hhwhKiwOX81IxKzQaojL9mlFITgW6RiQrV9MLxXgabybEEE++ICCvqsauKflFqtyhnQXEp52U82V22VYgbW1oZQRoqZXd8HFTByP7lw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769692124; c=relaxed/simple;
	bh=U3TIu5GEBAPojY+wQ3s8t8on2RZXEH7VtBQ21mF4jMo=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jybt0Kh3NBkjJJER66OVMGRJ5omK4Ww6yE8j3jbVYHphdFSmTWa4SvB2rK+Qk0labWpkqRPC2u7n1+PdF6mECRi8mvK6/TBtTqGPHeZdQK6UMkreufvTUxpg8QyguyB5wRGWjOBMlrurOKS/ffK/mlPEvmUmffCMtPG/gqC0vmE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sFOai0qI; arc=fail smtp.client-ip=52.101.201.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sFOai0qI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GOejecruNQRpBYn5e8FoTpsFGO9sFzwc2M7ekQU/69a2z6snr3xz1TiPFf+AiX2O52P+vkFv+oRolaQOTkNsmUBTKyCn748upa1FGdrH1sKZXfnIbQsrdyCvfCPzaCQuiXugcIsKuH3Z7dulZv2vgR+Ufp8h5xQ0KY1dVfalBGEUke3rKPWTzt3PATzAx7+HCEe/EZ0UN+RTHzWtboo9fUp9RGDIabSYMJeAc18NImKosVhbIeo5cWpVu95wYopkUeTtm6f8+PvAehxdQXu0NJi9OG4vhNjrfwAFY8xGsITrILEccWht2cl73NHIKrVUw+58vn1QdIyUroQOqT2cPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BH2rIHh8Z6uVjzO/azPaO+WwEVuhKpzqKUmtRzMBmz8=;
 b=RnP6t97XlYutJvw+ehgqMuba4ya5NW0Y3hhOfSimXg4xcf5IgRPYLA8KQpbOa7hNSFBEVzPPrC+Qr0zrc+WPQkZq5G9WuAjQ4T6DfZHBUcj04toomRQ3geW5fAUU5SkaMSyz787ZXa6E6Mqs2aTqGFHiOlxWh+Lkm2jPOEnMGftQexOcY60vF+KgYjO/BaBMnY7y4mdNi5eYoMHQBDVY+YfbWU7r1UGqnOCCDQaLyl1wAx4N5DH7u4EHHWms5j+F1gLxfzMGQe6zcAxa6vV1S+v45gzog2lS0pTpYgQMe1Zkwh7VVvsVNkiYS11a3sXDJfmZ0U+DuHjkELdqxtBUZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BH2rIHh8Z6uVjzO/azPaO+WwEVuhKpzqKUmtRzMBmz8=;
 b=sFOai0qI4UJqWaZNJhkUXQwrI3le0lj80fE+cm7AiWCPE0faxaG/YM1un3eclQe08fzdrpquhIlSZcRj36bjCN9b22T237cIulssomk6OLbZvls+F+hkiJlShQyOBFK1yX7kt+ZW2BXM7RV6s+kxvv3SC664p3tGA0lrXyMOIuXJewZIhDe0ZWDcgSVpTv9iJGJYXoV5yc/z1ab5Clff05T3ZNlCHHVkzHR/efsHKk9W2xz8/+6B0l7xC9lzpxLyztxXGJqkEMSZsQaCLYPgn3CF65n/OH2K/9B+UN8QQw+ZFfsBdvqrhTDG3hAodcrzqJlBChNlM3knZvJberr4Wg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by IA0PR12MB7578.namprd12.prod.outlook.com (2603:10b6:208:43d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Thu, 29 Jan
 2026 13:08:40 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9542.015; Thu, 29 Jan 2026
 13:08:40 +0000
Message-ID: <efd1d01d-0499-442f-b6a9-b8cb84acb0b0@nvidia.com>
Date: Thu, 29 Jan 2026 13:08:35 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/3] Add I2C support for Tegra410
To: Kartik Rajput <kkartik@nvidia.com>, ldewangan@nvidia.com,
 digetx@gmail.com, andi.shyti@kernel.org, thierry.reding@gmail.com,
 akhilrajeev@nvidia.com, smangipudi@nvidia.com, linux-i2c@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260129103043.148490-1-kkartik@nvidia.com>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20260129103043.148490-1-kkartik@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0075.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::16) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|IA0PR12MB7578:EE_
X-MS-Office365-Filtering-Correlation-Id: fe2685fb-ab55-4b1e-0335-08de5f37854f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UW5LRHptT2ZjbitRUzBPcTFTQ0E4TmVjNWhCd1dwbE01VlhBTURwalBXckE2?=
 =?utf-8?B?Q0lrSFZZRS9xQzhXNHk4RFNXNU9jTXEwak0xTzhwcnZKclpQSU1GRVNWOFZ4?=
 =?utf-8?B?UGNYNkl0Umdldlcyanh3Zkl0bzl2djdUUkc4S250L1ZVL095NDR4RjNIcU1B?=
 =?utf-8?B?VU5jYzhFT2M2ZnpMeDE5ZWNLeUUwVjNEOGVFdVRBVTFlank4WFdrYnNPQWRl?=
 =?utf-8?B?QWZPNityYmYxdnlpcmlkbzJ2d2hzTFhDVjc0WHJkbC9RcjYyTGtDSnhIdEZq?=
 =?utf-8?B?ZUk0UDJQdEc4Ukt2UjVFT2xlTnlveHVWb1lTU2tMaVU3WFVRcVdNSWVWMnl5?=
 =?utf-8?B?OGFFU3JXL1RaTFF2WkJHNVl2QUdLU3B3OUJ2U1NIazM0WThBMklOT2I4Qk04?=
 =?utf-8?B?UWtFYUFpNVlabVRkeGNPdlF3djhUNHYvdklBbHVUMWlrTFREREFnZVZjL1B3?=
 =?utf-8?B?RWxaWVlySmFma2VoUDdMY1lWRHBUNHUrRzNOWXl5YVBQOGZhUlp4SHdsRjdw?=
 =?utf-8?B?TitBbUdZNVVlUm5iMEhoZGJiM0ZWU0lwVDVIMTZCREl1T21HOG14K05oL2h2?=
 =?utf-8?B?RWdoRVpZVXNZdVlQL1JqdGVTWDRiQ3QzSk9BQ3A0UEU5Tk5EWWZRaTVmY1cv?=
 =?utf-8?B?cEdCMnAzMmV1d0Y0Nk5ESmFtN1V3Q2dxbHNOOUYwam1ZZ0pUR3lnS3ZjbjYz?=
 =?utf-8?B?cExsMTRDTDFrbDVOM2dGM2JOZFhsMVJZalZwK3hQd3NnTDN0RWRhYVdLWExz?=
 =?utf-8?B?YmNST0NtdEUybWQ1TzlxdFpMUTBJZFcyK2cwcHorN1hlU09IdmFYWUJ2L1R6?=
 =?utf-8?B?N1NjeEJGVFh3M1JKOEJJWkJaWmZTeUpzdnNBOVZVeEpnMFFTWTRqVjVIVUZh?=
 =?utf-8?B?WnQ0bzdPRGNUYnFqd1kxZ1cvS1ZWOWFjb1ZpZnRDVGI1RjlXWlhDcHBwN0dL?=
 =?utf-8?B?ejRvM2VkelVRMks3VnpWdFAvWkQzZE4zSjRiVkhla1lidWF3UCtsK256UmRW?=
 =?utf-8?B?SURISktPa3A3aCtzSlNDNFVZQlN0bEpGWmJuZkFOOXpDTUhVSTkwYlU2UTdI?=
 =?utf-8?B?ZW1GN2xmR0FMQTJZc0lKRGlUV2loNEhOclJZbXpWbjBzSnB5NkU2elV6cmxn?=
 =?utf-8?B?dlFmaFJuUTBlbkw1aDI3eldQZVM3enN1UDBjcktrL25oOUgvUkVBVWdLNFdT?=
 =?utf-8?B?bDlVM2JPY3RMQ2w0YlVpdXdJL05KdjRkbFJKUTFQY1ZLcDNoODJLWjczZU9H?=
 =?utf-8?B?cHlPU0tZcVBUMWVJMEg4NTFYZ0I5dTRKYk43UmF3U20vMU1mZHZHbnVmVUxR?=
 =?utf-8?B?UXZPN1BFb2hoY0JRNjFmZUFBbllIRnh0bEJFZmRMbUg0R3lJUTRwOHRVRDRS?=
 =?utf-8?B?Y3dWUk1zcXRaaWpHYVVRS0dhRjllNEFBZkJsQUdidUpXcERET0RpRE1DSFR5?=
 =?utf-8?B?QW9henRVdUJkM1REYThsbHpMY2lSMGJCSmNESzVXNEVTK3VpZHFsZHova1RH?=
 =?utf-8?B?NUEybzMwQ09KUncrZWQ4N2trc2JYbkdRaVBNSmhObXNJcFV1NHR1cC91OVlt?=
 =?utf-8?B?VG1uSzVBTms1TjN4cnVOeFJJS0hWdWdmc0lPOTJPbzZ1Z0pHbDhpNlFCYTB4?=
 =?utf-8?B?SWtHVmN0YThaQURGZGdxakt0c2xmRGRkZ2lPMTEwL2g1VHpoSXpWR1A2SDZD?=
 =?utf-8?B?czR3OHJYdDVWT05STXFxNEZ1cjBpVTN1OEEzRmFMSlZWMzFwME9PTnZ3b0Fo?=
 =?utf-8?B?a1V0dGhMekM0ZGUvMGptSU95VFZkd04yeTNxTGNrTkFCRHhTT2xGakNBQkdX?=
 =?utf-8?B?SWI0Um8rbFk3OWZUN3NWektSQWVVNzJXQzI4cno0K3V6QlNuN2hGYkNKOTRF?=
 =?utf-8?B?NFU5RngzWCtIbnVZVER0amxyS3RnaVMxUjBrdFhZdlhJYkpBUUc5VE5QbjJh?=
 =?utf-8?B?b1Ztblo5YS9IUEU0L0g3ei9BbGpGMzFUN1hUckhGTEpDWHBUUlJwZmt0Q0Nj?=
 =?utf-8?B?cDFjK2E5UFUreG9zUGJNNk9SV0JRZUhCa2R3cmhPQnNFQnBsV3hYbkZCTysz?=
 =?utf-8?B?eXBuUGRUcXZ5cFdiS2o3N0c3ci9FWE1BdGNUT08zS2plMUhaQ2pPd1NtRFQv?=
 =?utf-8?B?K3lpYjRwUmw2Q1N1MkJYcDFtTEp6bVdaM3Q2VEo3RjMyT2NoUE03L2puTE83?=
 =?utf-8?B?NVE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ek9YRzJlK3lFY21lTHY1SXovekdxRTV3c1pxT3FjcFJzTlhsZ3gvQmJoQWpj?=
 =?utf-8?B?ekN6ejkrY1JvVkMwL0xwNGhVUVBFMUNnWGxBcGYrL1lydC8zMVdOaXROY3dx?=
 =?utf-8?B?Z1JiWGJMRXQycE11bmFad0h4eHJKTkFaREVxR3hPclUycHF1MWZaM0JPNFJu?=
 =?utf-8?B?SXZRTFl2RDJId1kwMU5TK1ZMdVR3MFlyMS9nZ0JrVmxJZElXY3VFYWozMC90?=
 =?utf-8?B?aFo5RTM5Uzc5OTBTdDZ4amRFcVI1UXQrM2NEa0tqZ1BYcTZaZnU4aEs2Rlhl?=
 =?utf-8?B?RDlUcXUwUHRMeVhTUVkxY21RT08wc2loK05ZTkpuMTk2YTdqeldRZTVJSzhm?=
 =?utf-8?B?THN0cWJHVUVWWTlvVFdJT0g5VG5rSjI3SjZFUC9hSDY2UEF5ZkhSc1paMm1n?=
 =?utf-8?B?ck1IWE5YVis2NGZMcFVMSXZOci8zMzZqQ2RpamFtTHNpWjlBMGRJMUxPZmd4?=
 =?utf-8?B?aDRYbC9NYytnTm1Kb2hyVEtIQXZ1azhBNVVkdVpVck9TQWNTUTZxR28rbmlN?=
 =?utf-8?B?YUZiMytZODZLMnFlbzdkcldBWWhqYXFyalBmT0hkalpTYUkvMjZ6RUcwZGI1?=
 =?utf-8?B?Tmp4SERheDFFV2htbTVtTGpzNURaVnVvT2FnTzlqVGIzOC9RTVRyMEJaaDZY?=
 =?utf-8?B?T3B0L3l2S3BVNG81bHByYTRqLzNKUGs2NFU3ajI3UUcrUTBYN1pONnA0TGNL?=
 =?utf-8?B?citqMExwMVlrRzhQa1BMS0V5R0dwb0RUeW5MemNNU1lwTjJVOGNjY2FSNVFZ?=
 =?utf-8?B?OVFmenNhMVJ5NzJiNnNXMDBoNHJQc0ZtTGpJNmluRHI2bDFpRjQ1RXB0aTUz?=
 =?utf-8?B?Q3pYTDVZbitRbjc2SWFpcFRIa2I1Y2grUlNXamhTUkpMY3hhQ3V6SWF5TlFp?=
 =?utf-8?B?cW5SdU9aQVZvTmcxdzA1T3ZYYWZTNnY4KzF3L3U2cER2QUNUeHgrMU8rRVFY?=
 =?utf-8?B?V3A4b3c1WkNacjBjeldkNmNZMnozNlNtdTV2V2ZhckFNRGppZlBnUzhPMWdS?=
 =?utf-8?B?ZWtpdytIc2IzSm1TTEVZY2lXYmllM3lUM2V5c2FJazhWeEtXbDRyUzVQYmdh?=
 =?utf-8?B?VEptVnBPaDdBRVpPbjgzbitiOW84anRYN0Zkanlsdzg4NHpoTThqSkRUYVpS?=
 =?utf-8?B?eGlJaDNiUHpFMG5hZVdlQk9YcGU5RlZKRGZrdWttRmkrOFlNNENVdmNoeUxw?=
 =?utf-8?B?K1lDWTFNblVzRzlkcDdoUHBDMEpGL1V3N05saFZvMjIxa05VMldUUzJOYmlN?=
 =?utf-8?B?SS9IVUJOdTdQd2h4eG8vU0RlSVRicTArZzc5OVNWcjZ2ZDA5dE5wUTVLNExJ?=
 =?utf-8?B?Q0ltRWt5cWFIak5lMEtFVUQvSEdTazFWTWxJZWdiYmllRzIwdEU2OTNyUHZR?=
 =?utf-8?B?c256V1c3VDIzWUpONmxPN3psQzZZUW9NcWV3azYyQStDSzNHOFpmTnF4eFIx?=
 =?utf-8?B?czhjakljMEVFelZOT0I3eU5XWE1HN3AxTzhIWS94S09WZEl3akxsOHdmSmor?=
 =?utf-8?B?SzIzVVhGY2piNytSaDMwdXgvSnV6YmxrRXVNVDNTcU1taE5NVGNSNFQyUzg0?=
 =?utf-8?B?UGRNdDZoTm8zZHUxcXBLdW5nUEtFTU9ubjR0NWRLQ1hEbUVQOW5Wd29UcVQ5?=
 =?utf-8?B?eTN2aGZXWkRHQXE2MlFvS1dpRysxaHZON2tINGt1ZzFlT2xVTyt3OTlCaUtD?=
 =?utf-8?B?VFVHbzlUL1J3OTVFOEJKNWlselR0b3RRRnJsWVJVVzBMalVCK0t0MHFwNEV2?=
 =?utf-8?B?WTZqT0dCbHVjcU51SWdNMGtzQytEUGFzT3o0OGtyWTc3eUxJZzBrMmRDc3pY?=
 =?utf-8?B?Qkx4Z3lmdTVTdjBmaENHeWtWQ2FBT2hsT21lYTdnTW1LenJwaUFVRzhoR01X?=
 =?utf-8?B?NVVKQVRGc0dGRW84cUJ6MGFXUEVkWmpPTUViRGRWQWRRZ1NaV2ZpaCt4RmxV?=
 =?utf-8?B?L3Q3MStDc3NXRDd4MzlhektycDdDRUpRa240anZaVTFpWDdLNklRNEFqb2Vi?=
 =?utf-8?B?Qkg4czg3eUF4cDRJVVJUVVVQRitYclhDMGZlOVdaVG02Qk9FWUdST2lqZnNt?=
 =?utf-8?B?N3JYWmRwd0RKaC8vc2VFcjExRjRVRUJaY3RRTnFSdW1BQktjQUYwODNrVWpI?=
 =?utf-8?B?TXRDM0ZJeHB6eXRXNHRNeHFXQXRMRkI5M1ROWWhRbXk0dTdjNmNLV2FnQ0RF?=
 =?utf-8?B?UWVCU3lYWkJSVFN2RGZ3Y2l1TS90bHdqK050UGR1bGlEWCtwcEtzQXV5eVNJ?=
 =?utf-8?B?VkVNQzVHSjJVRnZMZ3U4ZXZMSllQdlZVUG1VczNkWE92ZlhKbXVlZlpBdnFM?=
 =?utf-8?B?WFZ6WkUxVUhISjlKSHpBNmpkMjNISGUwYmorZ3FYY250VmJJYUFsZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe2685fb-ab55-4b1e-0335-08de5f37854f
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 13:08:40.0156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cFS2ivzdmwGqnUJOevVfm/SR3VUGkOGKggStjYYyTgtKD83QcTGRXE0OIlX9Br94ejt38L7ysTfGGv+gZVGi1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7578


On 29/01/2026 10:30, Kartik Rajput wrote:
> Add support for the Tegra410 SoC, which has 4 I2C controllers. The
> controllers are feature-equivalent to Tegra264; only the register
> offsets differ.
> 
> Kartik Rajput (3):
>    i2c: tegra: Introduce tegra_i2c_variant to identify DVC and VI
>    i2c: tegra: Add logic to support different register offsets
>    i2c: tegra: Add support for Tegra410
> 
>   drivers/i2c/busses/i2c-tegra.c | 534 ++++++++++++++++++++++++---------
>   1 file changed, 395 insertions(+), 139 deletions(-)
> 

For the series ...

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Jon Hunter <jonathanh@nvidia.com>

Thanks
Jon

-- 
nvpublic

