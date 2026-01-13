Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011050.outbound.protection.outlook.com [40.93.194.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3451429AB02;
	Tue, 13 Jan 2026 16:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768322218; cv=fail; b=axRlodbwU7A1RaHmvWrJj1BvCcArLAxdGx4ZM2Ud1mQUPABFnfxaX0MDhGusaNt7J4v40Qkkw9lqJoRUjglrke1cLuSI3WTsoDdtceXpP4SoRxim6i96dE5aHqVEp3yByVlKelTXRZFl+IYxgA+LUSY+6M0hcP+yUy+WNxH67gM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768322218; c=relaxed/simple;
	bh=5N87tcO6WSD6kzM7AdYnyJrQipJP5hH5+PysWdcHOb8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aHrU9U0ysozuhe5FwwKuq39IcZJ/8T2qA++F3hJzeMSfioByKwvR4u24Ceo8+4uMzbYn9vb/7Lshl210RyTMof8DugrHLkdE2NMiNU2yb2780uXCIVNT3vKSd/73AlfTyhxV+RyNjeJbwj7O6/So8D7lf8BufGJ0mFU0+yH2FWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uRFVGg7w; arc=fail smtp.client-ip=40.93.194.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uRFVGg7w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VQF0CsgDEq0Iv09CXW/q3j7zKBkfqQB7YpKV4qJcNIfwa3U2nMT4MmKegEAO+G5loQ7XKb/DK9iCtSEtxPGRZnvSPTio7FgvOuihf/iL0PPA9BV1DFQpHqYIEiF467d+w3Te75yzjIYVGKIDU5IE2npeT14E+XwjDkpcA8tf42PzJCOgznzGKAx3vO7KfmTltqtU8gmKbsFljq/ORNpmbwq2iABjbiK6tP+mH5o3wkzuiau8+49Na3Oy8dvVjnsUPwLE1PEU44HTUM2cLyu9D1N0WR/D1klZxpieRfKAIoGrpXbA5MOMtSfYAmDxZaHu89gxTzJLSCGCR+x1/oFlWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dM+6c4Ktx8L9SRLnqyln0jYmWy4fcMtX773079/KVNo=;
 b=sWEDxViQVgzhZvbKM5fBmZ4MV8qXA/G6BeuWJ9FpmgyYAic+fv4JQn6d+whnrk9qMr5pz/5/GG6exet/nFFp/8MzapvOzrV3LDOilpSAeEdXE0cB2oVBEXyKEGGdZCjybVmAw5nPQ7RqAD8yn+CtNhFQ6vGx6z+atGkKhnkTPLAqEMY3I4//PNbfzgjXhFwPa5/eAPBKOdn480mmZZCFWz3d8FSX6ttGbX0AjHdoUHagkdkYODJMGUOAbbut0KZBtse4XIq+F2DPaG/+f+jriH6cmcr1UOLsMHKKVALWMJNO32rfDoJ8Dy58KuH60r2Qoub54/40KdxhS8hfiabsTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dM+6c4Ktx8L9SRLnqyln0jYmWy4fcMtX773079/KVNo=;
 b=uRFVGg7wAGEPefLaTt24DltSXE6ATeFB/rJq9rQshdq/IPwKmv7fsX1iAdnube3u9DiiIVbebCluS3JESpqYjUwdetIM4szw66HRFzGYHCuVFR4Jgb18eSoFRsfXpQvcW4RYMIkkdN1ClEyKOkiZuiNxDuA+cIrOM4R7+H5BI+ZaRtMv7dUs61CAFz51xE8JJnope9cSKPvexcreIbIIcVNi2Z4VZhX4mNdyj2B6lcBKQsGaJNXVM6DMo1/zKBFi4bnNe4MhMHKIAhZU1pwJ57u7xZQkUb5vya94OkH/BoLLyA8RHtf61pUBYBKRiyR42sFQFN95aOLg+EuCotQRQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by IA1PR12MB7589.namprd12.prod.outlook.com (2603:10b6:208:42b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 16:36:52 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 16:36:52 +0000
Message-ID: <85c760b1-2279-44f9-8dac-77cbf6a4835b@nvidia.com>
Date: Tue, 13 Jan 2026 16:36:47 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] phy: tegra: xusb: Fix ordering issue when switching
 roles on USB2 ports
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
 <20251204-diogo-tegra_phy-v1-3-51a2016d0be8@tecnico.ulisboa.pt>
 <86cd3ff0-1609-44cb-911c-f0e97652ca1b@nvidia.com>
 <ae36f759-e889-4371-8c08-b8ffd1b69250@tecnico.ulisboa.pt>
 <703a470d-87fc-4580-a743-952e422984d4@nvidia.com>
 <c3f54ffb-cf4b-47ae-871a-6dd60b17c9cb@tecnico.ulisboa.pt>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <c3f54ffb-cf4b-47ae-871a-6dd60b17c9cb@tecnico.ulisboa.pt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0020.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::8) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|IA1PR12MB7589:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d8196d1-bcfa-4531-4a34-08de52c1f497
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aGlQUjRPaVZMcDcyaTBIRm1rVGttaVQranNiWXUzb0RIcGxrdENqbVdKZGZG?=
 =?utf-8?B?dzVVUjF3bXgzL2k5MmsvTkpxYXp2enlTUStoNXp4TERaVTVmS29vYW9nOXpV?=
 =?utf-8?B?UWlYVWJYSFNFRmFtb3hBRVA0UU5WR2R4ZDBGZGwyUGlEYkYzUlAwN1dXSHR6?=
 =?utf-8?B?djFpeFl3aXdiUmN0WmR5TkQ1Wk9NVTd3cHdvU3dzV0FxMjNGQkx6U3QzVEhW?=
 =?utf-8?B?Y0pCNURxWTNJTG5tNFFkMzY4Q3VGWEp4anJXUEVNZU5uZjdRa0lMVlpYT0JL?=
 =?utf-8?B?bnZ4cHltRTJDUlRPUStGUSt6Zlg2d3JIakExcFFuYkRhTE5oTTNMYnBqYmVU?=
 =?utf-8?B?MjZOTzlKbk40bmtvUmU1b3FEWHJ6RmZJUEpxN3RwWmVtU2JtN2JsT0kyWTJy?=
 =?utf-8?B?T08zeUdJb3FHaWFtTWhvUzNZTlNSQ2ZtWXFZa3I5ckJhZW1PS1B4SUJScXFK?=
 =?utf-8?B?MmlQVU1uaXRURTdCWjh4ZmFZZG1NUXhFOFFPMkJIODJXdnVJczRJb0I2dmNs?=
 =?utf-8?B?NzA4UEVsTGtBcFQxQ2dJOThNZ0l1OVFuZEo4ZThNcDFyTStwUk4yR1FCdkdz?=
 =?utf-8?B?S0t6Uyt0UlMzaVFQdDZ2UlhxWjJvejNSWlg2ZGJBWFN1Y2hYZkNWK1lDNHFp?=
 =?utf-8?B?OWFtb0FBL2pvVGxGenIzYkVCY1MzcFVlR0Rhbmg3L3hqWllNY3hwQWh6djZr?=
 =?utf-8?B?ekk0VWwyZncyVzU0YmFpa0t5UWhkNzZ4MDZ1bWwreEEvLzdXWXZIbmRtcGpk?=
 =?utf-8?B?MHhsZ2lCL3NKSHpXK2ZyMkNTRVNYMktkSCtDYmpUTkxTS0h0V0VZVmFwTjVB?=
 =?utf-8?B?dnFlQ1Vnd01xaW11dDRRZ21XTHUycGEyWUpmaVJhSno4Tk0yZGFhNmRFbTFp?=
 =?utf-8?B?T1pybUJwS3A2ZWZoaFI0SnB5RWc4K1VTcU1OcFVwNUF2WmFxbGZCakhVTHlV?=
 =?utf-8?B?U2JTc3UwN2Q4YlJua2VlZWpoRzJndkducHNvbTUwdlozeU5jSUdOYlM4dDBa?=
 =?utf-8?B?RXE1c0M2K3IwbDltajdyU2sxNlZhTmg0MHY1N0R1OGZOMWxJamZGa3lqYlVM?=
 =?utf-8?B?QzlIQnpMQVQvSlFDMG1ZNEJ0UEk1YjV3WVlVWHRzQzRiSkMwQTlnTko4eUp1?=
 =?utf-8?B?MEFpUGh6Y3NTbFp5R2hsSE9uQlFITFJaMHFGZDRUd3BZUVNkbVpuaHFxZGlD?=
 =?utf-8?B?SXVxeU01eUpTQ21qVDNkTzFBUVk0T1lYemxJQStIYTZkdy9iOFVUZ09LOFhG?=
 =?utf-8?B?NWYrV2xiSzR0VTNBVkhxQXJmb1l3Y0xsbVlrQVd4Y3VjMmJ2Vzc2SHZDeGFO?=
 =?utf-8?B?aTZseHE4N0N3ODBCTzVHdjN4WHZ0T2h1REhJdVlLM2hiRFlhdy9VeEY3Ty9t?=
 =?utf-8?B?QXcxZW10SmhEbVZxaVVLaWhacjlYakxvbUQ0eDlOWGpEa1RQeW45dFZoR2hU?=
 =?utf-8?B?OTV1L0ZaSTMvajIvaGZnRVVhUVhBSDRTVlFBYzhoV0JUUVRCNHd0cHFzSGhP?=
 =?utf-8?B?L3diMkZPMUxDczJSNmo3L0M3YUlodHhmTTF6RFNveS91ZzlQY0pnVzNxcGVT?=
 =?utf-8?B?aU9nQStUbWs5aGJ3dWtkOUtwcDg0eHcwS0NLdDd1Y0hXMzhmQ3ZoVGh6amJq?=
 =?utf-8?B?bVhwNVNOWkp0V2xmV1Z6MnVEZXZpa01IVFVmS2RGWnNQTGhDblF4QVFNVjFP?=
 =?utf-8?B?YlJrUzRLbVZtdHZGSTdmVHgwU0o4dzJaTjRIV3FVandEalQ4RUlzSzBzcFdz?=
 =?utf-8?B?a0JkNlFvZEpZYmsrTjJQd2s0K25iTnoxSmRKWVExZzBvSEFHZG5WYjRsR2FG?=
 =?utf-8?B?Tk52a01PY0FzRVl1SXQ3MlVKMXU5VTVFd2RNbndlWkZZT2s3N1dWYTRHNXFh?=
 =?utf-8?B?MVViTkR5UFpKbVozMEJTWEJsQ0hCUW5HUi9FUVlWdzJGaGFDYmpHd1pIWm94?=
 =?utf-8?B?VUQ2UnBWMWRvTTlIdllId3NZU3lXZXl5aVdoMkh4QzBnY1RWQ2hYenE3bjMr?=
 =?utf-8?Q?I4ppdncv3Wa5FwkzQiiL+/s+LVA4hc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?azRuZzFHZHVPR29hbXJxdU14RkRLaG5qc3k2K1JyaDNHREcxaDc5eENTelkv?=
 =?utf-8?B?NnN2N3lPQVEwRFRyOWtYRGpMN2FuSXJjaFdHSzBLWUlqWW5OTHBWcmwzbHBG?=
 =?utf-8?B?MGFQV0oxa2FzNitaOVFSYmU4SjNkQ3M1L3FaVDJ4V1dHU2UrQVJkVW45dnhU?=
 =?utf-8?B?STRudUtURXJIWm9iclhxZ215T0RYdDdUTVFJNkNHdjhTRk1acTB6K1pVeFFE?=
 =?utf-8?B?SDBmbW44MDFLUklZclJJUFQxaUdTMTVkd2pwVjUvNENJTEorWEo2ZXN4R0k0?=
 =?utf-8?B?b1h4UHYxUVlRZWpaUlc0dUh0U3NveStVUGsxdExCejZVQUhLN0RxcHpwdE9X?=
 =?utf-8?B?NHZVenBMd2hXbzBCRjJYVUlEL3p6WVVxQlYvRXVpZjdzbUZWZ1MyZEFSdFhW?=
 =?utf-8?B?elVDNzgzbG1HK1NtS3hxRkc1T096by9rdUxJdENBWVJtRkxKN2Q1UWpBanJl?=
 =?utf-8?B?WVdiYmNCNFV5VnU1Q0hoWTZlRnFtZE5JcVkwNHNJa01VbVlGNVNUOEtjc29p?=
 =?utf-8?B?blNuR1l2UExrRG5VckdFczJDVm5hN3BPL1RXdDlqSzUydHpPQk9mWEpzdkhC?=
 =?utf-8?B?Y2k5YWpnWXJ5YkYrdmVKOTUxNGhBVEFvOGxzSlRoeFp0QnFFZlFLYnNPSUlI?=
 =?utf-8?B?aUtlbDdUR0dFWVN4dXhxbCtIdnFycThMTlpZbmMvYkdCQ1h0TU4wek1ISXVt?=
 =?utf-8?B?NHhabUNOREZSQjIrVTQrRjVaUnhuekxwNVBxc3VqenBtWnBmdW9pZDhhVWh1?=
 =?utf-8?B?dlVaODVLdTJKeU1VSXlyTWYvWFFQZGV6VEx2YlArUjYzSFRwbTk0Z0ZXNi9U?=
 =?utf-8?B?M3pIeGY3ZWwwb2ZXOUxjS0JzRVBIUWtibkwwV3RibHlnUTR4YTR4clFsUWV6?=
 =?utf-8?B?S0hna1k4N2dHd3NTUTlQZEtmTEZnc01IK0ZrMHBUb2JNaDBGbERjNW1kSnA0?=
 =?utf-8?B?N21YZzlwUEx3bEV5Y3E0cE8xRWNhZWx2b0Z0bXdyRmFFekdJTi84bUFNZzJ0?=
 =?utf-8?B?YWMxVmpZbFVYTnJKallEQ3k2amxDbWNUUDdVOU9nRW1RdGFQRVVZNEErMFlQ?=
 =?utf-8?B?Y1dwOG4vUUpXcmNva3lvVFNTSWplY0dPYThSY3FNdWpJMm43VDgyNTJlaUNM?=
 =?utf-8?B?eHVkc3J5UXYraFBVR0lrYWcwcDVpVCtHbWdmanBTemxVdzlJYmJMdHlNcnlC?=
 =?utf-8?B?VGxMdUpFbWlyVXk5cENNYzdvZ1lVekJWTXRYVnFPVC9RZXppWDdsdWx0T0l1?=
 =?utf-8?B?aThsN2pxZFhBZzQ0S0h4R0wvUU1vSUR3cjFDeVZnUzE1TnJkQTdnVGEwdVR2?=
 =?utf-8?B?bTN1Z1NWaG50dlcwM2wzekVGa1cwTHk1eHRDeHBxU3hNaGgxelRwMW1reGwy?=
 =?utf-8?B?ZStqMXk2cUdwRlpHd0QzZzJjOE8vMXFDdm1WZjFDRTJKZlZEZndFZThsd0J0?=
 =?utf-8?B?am5mdC9uWnk4VE5xQXMvMjMzQ3o2TDFZdklXaUlvb1RCQ3FaSDd4dDEzTkdQ?=
 =?utf-8?B?Zm1DeCs1SXpuYW1Wd3pQTm1IajJlTUVQcjhOMUticnZrdmNkMUJhc1JWNU9P?=
 =?utf-8?B?aHkwY1RDamxCbnNwbTB2V0hFQVBHNXAyblRIUWlVc1FrQjB2VUhoMkN5ZVl4?=
 =?utf-8?B?aElOTEVkV2EvVXVlSUMyK3dBNHRSMHVtbFp3OUZLSXhvSnFmOXNMdU9HZDJT?=
 =?utf-8?B?YVg1TkxJT3V0YVpMMzkySHBzRjdaSDZtMktpbzkzR241UFplTEhRRzdkUFRw?=
 =?utf-8?B?eTNiempNYkRjZ3JSbndlZG53bXphMXAwd1RqWlpmdjE3dmdTNHdKczJ6VEFG?=
 =?utf-8?B?N010MkxyNjZJbmtKN2V5bml4VWxsTDZMcmtHMXRzd29KL1NLNDAvc2hHbHVi?=
 =?utf-8?B?NXZNN2lRNVF4aERCMEpoanFXQk9HUHdBQWVaK0FOb3pxWktzMVpzN1F6VWk0?=
 =?utf-8?B?TmF4Qm9FNmVsa0dMTFczNTdVMC9NMWllbHVDdEpLaTgvVTZmMGhtMTlkOGtX?=
 =?utf-8?B?MCtIZFJadlRkWXJGR3hjOUxycW9oVkN1aFZDZHhZUy9obk5pUlYzdzBSK0tR?=
 =?utf-8?B?a3ExLy9iZEwzU2NmTTZJd0FFZE04UW01bmtPaC9la3h4ckIvaFloVm5BYVJq?=
 =?utf-8?B?cFArQUVpYndVWlZiK0hxWC8vZWZHRUdLdGVydGpQT05aa3l1dHZvaUpwUFB2?=
 =?utf-8?B?L0xEdmIrNGkxdlljR05MVU1VWTlXTGxBK3RLM2g1WDZOU2VaMlFnSzBrMHNa?=
 =?utf-8?B?NHY5emsrMjk1Z1pXOWFabit3VzcxdUtFMmFVZnE0a2xyQk5HZFhwbkx5Tlp5?=
 =?utf-8?B?VklWSUl5OWticWdKMlV3ZnczaEpGQnVsUUViSjd3dXB3SWRBdFdGdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d8196d1-bcfa-4531-4a34-08de52c1f497
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 16:36:52.1024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bQ4mbebXYPLTK8kFarss7TDkwY3Os0AsD1m1JOXo3j83UaPP6dXNxUrGFqFtCHVT6xfYtSHTSndoIage2WAFkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7589


On 13/01/2026 15:10, Diogo Ivo wrote:

...

>>>>> -    if (tegra->host_mode)
>>>>> -        phy_set_mode_ext(phy, PHY_MODE_USB_OTG, USB_ROLE_HOST);
>>>>> -    else
>>>>> -        phy_set_mode_ext(phy, PHY_MODE_USB_OTG, USB_ROLE_NONE);
>>>>> +    if (tegra->host_mode) {
>>>>> +        if (!tegra_xusb_usb2_port_wait_role_none(tegra->padctl,
>>>>> +                             tegra->otg_usb2_port))
>>>>> +            return;
>>>>> +        role = USB_ROLE_HOST;
>>>>> +    }
>>>>> +
>>>>> +    mutex_lock(&tegra->lock);
>>>>> +    phy_set_mode_ext(phy, PHY_MODE_USB_OTG, role);
>>>>>       mutex_unlock(&tegra->lock);
>>>>
>>>> I am trying to understand why you opted to implement it this way 
>>>> around and not add the wait loop after setting to the mode to 
>>>> USB_ROLE_NONE in the original code all within the context of the mutex?
>>>
>>> I did that to minimize the amount of time we wait while holding the
>>> mutex, as we can now possibly wait a significant amount of time for the
>>> role switch. Is this an unneccessary optimization?
>>
>> Do you mean it will be longer than a few 100us?
> 
> Currently the worst case in wait_role_none() is around 300us but again
> this is simply because I chose the values with no criteria except that
> in my testing they have worked thus far. Do you have access to any
> internal documentation where the transition length is documented?
> 
> In any case I think that the underlying principle of minimizing the time
> we hold the mutex is solid, no?

Yes, but it was unclear to me if there could be a case where we are 
waiting for USB_ROLE_NONE but we have already transitioned to host. May 
be that will never happen, but it was not clear.

Jon

-- 
nvpublic

