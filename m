Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012064.outbound.protection.outlook.com [52.101.43.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9053B5306;
	Wed, 21 Jan 2026 14:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769005912; cv=fail; b=CAKh1NQTrtUROagbsi1T444N8oW3pJnqCNkyhSJVi4o3JwjK+dQ8KQkoEGGfAo7evzdLHw4CpLhS6Ji+CrO+oJce8kDsm0RKf3zDh6z8PNkzVvxdb0fezfwB4wNU/r/Gv/XUWJgN4WnkH3PZvPObUojBm4JmaF5hVcsd4MPTRk4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769005912; c=relaxed/simple;
	bh=xYHkWcJ+3VEomc8Fu6X1QXeMtCehv0lO1oOGJ47teeg=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=K+q6hYGKuYI4Wn6Fsi0jRbPpC+TqG6TuRzr+IB4vbmuz7WHgW4WPc+cn45489cr/CVys0fCWhNEPhy+gKlH7zjbqS+n0r0m4tWM9yho2aISyyChq7/fzgRaficTzryglUsUi9yPtu1uaIQzZVHPU6lj7cjDpuFikUaraS/oJ3HY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QPVe6hbe; arc=fail smtp.client-ip=52.101.43.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QPVe6hbe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qYv4FIL6KKvLnblBZzpdawFRxKdqFP8qjTyQgE1chKFLXXB1i64enKFeWlrB0uhotV7VjmBgKpqsrLqBXOpJa5QG8hRNbkZmQXDfit1rFB0RgJ1Bafeqny1J212giJD4T8Em1FFqvQXxYLV8Bvm1epE2yNmi0E82IISBbx6HniIfCPQdNtW5XeVjnGIuRq/uRcroK3Q+Y/+viyHG44TCEZCSH7eFm+ME+Iim0gmSkMRRylZ0Ub0zPSPSUHZtzW4d359+uh3VBAG25qmsrWbn3Q8YuNuPgWIiJKA0lPE6mVE0VHbr5Mop3qjhsNG0nOAuPTtomvN/PlRNcZmsyJxTsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/qgmrLPcWQM/gv6JUu0VipndhOhQyOyVS7bKD+KfzHo=;
 b=WWlzsiBTZbEzcq4satPWSx218WoLLvVshrs2SBJIIY6Qjw1l9g1/MI1KnHVO6ZEkWqnMi93AMr6nISpJ2eNYwvGn2bPmZqrtCVR0Wd6PcfcTt99mChtBNwgOIQzJDcUvjElH9VuqfUTKGyyEvrtt267sJBAdWdGh09PH0RzvqKBzjjj+qo6B4sg8cZMBlX8m+P4mspX43dbvECyhASCl6GbeCA9vg+iLtzGmJP3C0DajQ9MSyS/MdcgchSmdJX1yfIfiF7yriQQuGZjlDgj+3sMCyqbPfmKBQjpKrmTIsIsQ5bOCIgwH1nqDOlvaQQxnaNtWoESRhTP5B0DtQP1w8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/qgmrLPcWQM/gv6JUu0VipndhOhQyOyVS7bKD+KfzHo=;
 b=QPVe6hbetOpGaVYpLWNzGeNMGk3zb/eYq74X/UM0IcitX62tufOOuzE23Euu6vUNOg3yLRvAj1R1oDVuMQdqz1KhEmWfbKefDCv+2c+GN1jEt+EUaNexhbG3Qgot2gJtIPsLvWRfp4amgYcdKn4mv2rJudGJyXa1YIFl3Uo/mbrC7xSBRR8aR1wo863eE5T4TWnsj3jEAXzl52B91Mnn0E2yNU8WTFth3db7a8bNlRl/8W7SAx0HZ8h6ZKGpPvy4tqvEyfCP5Qkq4PNSc7HtaeQ4m57zXGfXyBYQhcRT4fZk3WQqiyVrxMWX2z4PB6GYn2FK0DrKzWLN08tSepGh0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by CH3PR12MB8909.namprd12.prod.outlook.com (2603:10b6:610:179::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 14:31:47 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9520.011; Wed, 21 Jan 2026
 14:31:47 +0000
Message-ID: <06bc4b6b-e758-4e38-9520-c373646c7360@nvidia.com>
Date: Wed, 21 Jan 2026 14:31:43 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/4] Add I2C support for Tegra410
To: Kartik Rajput <kkartik@nvidia.com>, ldewangan@nvidia.com,
 digetx@gmail.com, andi.shyti@kernel.org, thierry.reding@gmail.com,
 akhilrajeev@nvidia.com, smangipudi@nvidia.com, linux-i2c@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260120092032.83100-1-kkartik@nvidia.com>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20260120092032.83100-1-kkartik@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0268.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::16) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|CH3PR12MB8909:EE_
X-MS-Office365-Filtering-Correlation-Id: 731c68e0-a59c-41e9-e077-08de58f9ceed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RnhTWjhtejN0YmZqdzF4NXJSVlBkdktWbFZrakRMeFNzYWJ6b2lweGdRT3Vi?=
 =?utf-8?B?U0VBWnQ4U1BiYnNWTXlhZDVnWkdFaVRPdyt1cGljUlF5eWloOWY0VCtaaVpV?=
 =?utf-8?B?M0dHNVBuelUxaUhPaXQ4UFgraExiYmZ4eXdsemdad1Y1RlBnS0o2aVY0R0NJ?=
 =?utf-8?B?Vk92TlhyWXVILzMycC9WUEhzbC9xbStmN1ZSNDVETHhMWkRxemtyK3ZQalBm?=
 =?utf-8?B?MUp1RFVHRVFxRzFVdWpHSXMrNlhvcjNFZUhqWGFrcTc3REcxMktBV3d5MW5V?=
 =?utf-8?B?NkczcHVkOWZhUGVlYUJPRUJ0RmtnTndLYnVlem1qVlpDcDlmUlZSM3g3RkM2?=
 =?utf-8?B?ZysyV2wxZ1dFZjRtbjhENEU2cE9lcFpGVERiaUN5ZEx4YzFidnoxUzBsUEFy?=
 =?utf-8?B?QWtBVk9SU282V1JkNFZ4dHVLNmRWQmZ4N2ZJYkg1NnI0T1JjQXFWL1p2dCts?=
 =?utf-8?B?bVBzYTUwZkxYbU9pRFhXc2R4akg3YnFwSUs4bjlzMzY5b25nc2YvZjlmOHYv?=
 =?utf-8?B?L0lpOTdCQXc4dk5KVG1ydlRxcXFGdjFvK3dBbXphQUQydWRrdTVjL015d2FN?=
 =?utf-8?B?aktlMlNvSHRkeW55ODBMMFRwaHo5ZlJFenFueHA1MWJqamFmczN1cTlBYThQ?=
 =?utf-8?B?c0Q4QVUrOGcvTDJPRXRtb0hwN2N3eE5nTUR2Z2VsYzQ3b2pmZUg2cDIxVnMz?=
 =?utf-8?B?UVRzZCsyYUVneG5oMEVUWlAxYUhvS2lCNUV6TlBnaWhYVGhINTRtOGs4QWEz?=
 =?utf-8?B?amtWZ3QyS25VVnJNUS9DdWJ1R2tKK1B6OWVXb1lHd3haN0ptUzBvb21FbHZ6?=
 =?utf-8?B?em9LeHFLWGNqNHdnYU10VS8zU3FQd1RBTXlzbmpwZm10c1NTMDYzQUlWcmht?=
 =?utf-8?B?NFJuelRaTXVFcGhrT1JhN1hSdFJ3UkRpUlZFUko1UExMa0lMOHowY0duQ3pM?=
 =?utf-8?B?Z2RXMWhYZ1BrMXRkdHFMME5uM1J2Z0lNZ2F1ZXBUZHFxa1hyNVpLblRoQmYv?=
 =?utf-8?B?eGE4ckx4RVB3ZlltejlVWmY3MFJDdFhmbUV2WjFFNEdOaTYvb2hQQXdjVnF2?=
 =?utf-8?B?Rjd2UXRCUzduaWtOUzlSbHVTRUk1SVlvTmxKYzhXeExVSVFnc3UrYm1USEdh?=
 =?utf-8?B?YWpoS0xrSmNpVUMxUWQ5SVY0SkJvSWdtVWcyaFp2cWJMK0F4bGtQTzdxaTIv?=
 =?utf-8?B?Mmk0OGcvYU9mT1hVUlpEVHkrSFBoN21GWG1UYTJxdGowRnVCSVFNM2wvUUhU?=
 =?utf-8?B?YXN4TklaeFJCMEJYYzc2RjdoOGVVTWRwaGJlb3I1VDBVckowOTlJajIrQ3FM?=
 =?utf-8?B?MmhKSldWc1Rad0NKSUIrUHExMUl4RC8vRGJVZHBJNXpoemJ1WVBPZHBPZnFG?=
 =?utf-8?B?V1N3VG5JVUdIL2d1SXI3em8reHlMc2pNUGowVStDUU9OZVpHZnBDaHlXak5C?=
 =?utf-8?B?cnFNOVFYYjNsYjRRRHNIWkFFYTcxdWErYVl5b1ZZU1BpbldaSFJiVUlkcVEz?=
 =?utf-8?B?YVlESTlxRkJDR0NNdjBsU3BQcUhhQm4zRXdLdVYveHRFQ3hac3Bsb0gxTlE4?=
 =?utf-8?B?UG5mSGliVVlkK0JXdnY2SzhqS2JnZkcxZUlDeWFXY0V4YVZCOVVPc0VNSXpK?=
 =?utf-8?B?SGxMK3k2cG5HU3RTbTBuNXlIdWJGbXpCWUtLVUtLVjhONEZBaDh0L1hCMVMy?=
 =?utf-8?B?ZitPYm5ZMjVkdkMyYm1GNXpvd1hDZjkzZzhENjV3VElMQ3lNZFZGMStocjJ2?=
 =?utf-8?B?WkdJYklnd1J0UWcxQVdmYkVqZCtIWVFzTTc2c2hDNmRwQ3l2N0ZMVjVXVEcv?=
 =?utf-8?B?MUx5NGk0UGRzQThJdkpsd2VIeW1XckJoTDhwSitMS2F2VmZJQStGM3psK1Ru?=
 =?utf-8?B?MkVQNi9VT1R2SytMUVFhY0llTFRWNGJYUVo5VSs3NzNxUEtKZEJzNFcvdVBs?=
 =?utf-8?B?dnE3TitMQ1IzTzNlTENiWHJucmFEenhkV3VaMkJzaUVUdXN0aTBzYVZrUTdN?=
 =?utf-8?B?ZVU5SDRQS0RLWjFiaHdNVHpiZWxnc2R6MC9BTGxSZGgxY1YvSTN4b2ZPSTJj?=
 =?utf-8?B?UFJYbzd3anlNNWpySTBBVjFaYWxpdENRbTIvd2Ixb0ZsYnlaU25lT2ZpTUVS?=
 =?utf-8?B?SGNyWW96V2cybmZHYnA4UldhazNFWERSZWs5TmtnSGRnMVRXUkJSc2hTSGpV?=
 =?utf-8?B?aHc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VjVIUTVvbVJFV3l3YXB3N0dNb2JwdUVxM21CdFpkM1J2ZUJ1cHExUWIybWJP?=
 =?utf-8?B?NlliRVIxd1l4ckoyaXVzanNKZEdxdkozTVVySzRLUGpTWmZHL0dGSmk3Zytt?=
 =?utf-8?B?cDQyMVR3L2s4WkJjTEREVjlQYTNvZENkdkE1RjJiRmJpNFRMTmJHb3VhSlRi?=
 =?utf-8?B?dkprMVJ3SWU1VlZTUER4YWliejJnK0ovN3E0L0RocmZWamRieUc3WVVLZEl2?=
 =?utf-8?B?Y09OcmZqU0gzZzRVYmFCTDFWbks4RUxhVzhVRnpKdVZQTGJpcVZXMmtBOFhW?=
 =?utf-8?B?d0pSczhDTEhoQlc2LzlzeGVDRVVTaTh1M0FtUVB4Z1doaGZZNXl1RVZXZlVw?=
 =?utf-8?B?SUgxd0RqNThCcXFWbkFwWlZlZ0p6bDdBQ05iZm5RVzdFUzNZTHJmT3c3eHpk?=
 =?utf-8?B?cHFXd0h2V2dPN2d0TUxXL0hPNEFCWjVQWFlBNUVlSE9mb080Uk1KclFEUklz?=
 =?utf-8?B?ZVNHRXVDS0JuTzV2RjViNVBneXh1YkdhWTAxQ1FyTDhKb3h3RHc0WVhUaXZi?=
 =?utf-8?B?b2xmQlozQ281VkZ3TG02L05kcjJZeTBuTnhIdkw2U3hIT0RTSjdoNHRPUTc0?=
 =?utf-8?B?dVFEMVhPSlU2SElXNDhxZld0dCtuOUdLRGljL1hOQWVoY0VLT2pGcnk0U3E1?=
 =?utf-8?B?VjZmSDJLNnEwYWRNTVhXaDhqWFM4QWpXL2tWc2RrdGVFd3g2REY3blFKdHYy?=
 =?utf-8?B?cFJIa2xOZ3dGK3lGY1E2ZUNyVExCRjVLNkVDTjdCVXpJQnJWaGFSM0VodTgz?=
 =?utf-8?B?aGtCZXREMURYdnF2Q1ZhbmVLeEx1YkQrQVZ0cU5OWXZKYTlHaC84NUVUdlU0?=
 =?utf-8?B?Ykx3cGxGTWxpQ0RsUEZhVU1mVWNrVkFMak1xTDU1b1dHbklnam10U0NOQ0pL?=
 =?utf-8?B?K3lnRGtQWHJpK2kza2NFRllMdkxkdUtsaVFzUWJ0bDZMb1FwWDRXaUpqWGQz?=
 =?utf-8?B?dERvMGdQMVpFc1FLZlpNU25OcFk4NEl1S1BqNDNrNHpQVnBwME03VEtlcTYy?=
 =?utf-8?B?SFMxVnlMMXhmUkdoZlVKMTYyeVZrSzl5U2lkMmdFYWRCZnZXUG56RTBKR00x?=
 =?utf-8?B?ZlhaaWppMUg5UXpxR0w1aTF2V2NiSE9KcWtHZmtuZ2ppWXBQOWhnKy91OWhn?=
 =?utf-8?B?MVNoRnRGVi9wYmgxbE03Y2Evd1dBRHhNZEsxYmExekRtTGx1bFBLREFSb1Yz?=
 =?utf-8?B?eEM1N29aNjVNN0hEY25BZVBFaE1WTTBNUHNjOU5lRm9IRm1FNVNwT05xVUlM?=
 =?utf-8?B?U2hydjYyelp1TkFpTjhERzd2ellOd0tBMTkrL1JvbmNJUFY1Ty94ZlZqbGha?=
 =?utf-8?B?TnNMNy8xYTZuWEdSWWN1UmxzemRzdW11QmJka3d6dnZkekpuWUhpTGpBMmFi?=
 =?utf-8?B?Q3lyS09KQUxVRUllVzJoYzlRSEZLQlU1dmt4bU9yenNQeDZIbjBybVZKMlVz?=
 =?utf-8?B?aStoYkhQSEpxby9JTzZLcFd0dVUyWFp1L1BZMDlicWhiQW1vaFY3R1QyeFFH?=
 =?utf-8?B?WEtKUTI4QVpYTDFwOUhMVmFWTEtNZFRlUFA0Y0VnRXRJTE44S3B6SDlZVEt1?=
 =?utf-8?B?TGVQYndZN0NWSVZ3clR6eU9EV3IwcnduQ1RPZ0djUGovVmQrTFJhdS9xT0Qw?=
 =?utf-8?B?ZnhrcGNHcXJuaVlrTjRCdzJSMlhMWjVjT2tIcVpmdGFDVStHUTJKZ2pBbzln?=
 =?utf-8?B?NzRWdjU5MWcweEhzVHlxa0QrYzN1MHVjcEFhdU9QUnBoOHBEallTZDdYQndI?=
 =?utf-8?B?bk14ZlV1bnlBS1JnWW1RSCtNN3JiTjNtSDJUaGZzbDhlWkJsYWcxeFg4clpx?=
 =?utf-8?B?Y0hSdjAzS2ZtRnpmcnVXUFFESmtLbjRZdFVsL05LU2JLWTFlZHFUSmlLTUQ3?=
 =?utf-8?B?NWtpc2xldU9nTkEwQlBsaExXWlFkOVljbUVqbTNaWnMzeWRXUU1vY0d0QWh3?=
 =?utf-8?B?Q1h1WVQ5UW5PNmdWRTFQb21NZlZ1T2R3VDZYTThveC9GODZEQ2RVVTA2dzh6?=
 =?utf-8?B?QUxvNjdRVTBZR1dzeVBhM3Faanl3UVVRanF0RFcwSHRHekZKZitzV09vK1Zz?=
 =?utf-8?B?VUp0ZU9BUnU3aXRpVTV5Y0tQbXh3SkFTdlhBUW1ucHFNNHN5b3lpWU04a0lW?=
 =?utf-8?B?UFcrL2FTWCtKa0xCWDRJbmkraHNKVDRXcWZLT0Qvdk42Q3cyV3JpNjBKTjFT?=
 =?utf-8?B?UXUvRXQ0SHZxODBqT3hPanYyZzNGWExYOXpPcmtXNVZvZk1QVlhZLzlvVmlG?=
 =?utf-8?B?bXZDRWk5NXVnS3VVb29qRFBHN0VXQWRpMzBBbUpSWmRMUzVGbjRnYUY4YkFK?=
 =?utf-8?B?dzkzZEFxREtJSUFFdXE3a1hLczNSeVBzbnVJZWJDSGhIMS9jZmVhRTU5Q1d4?=
 =?utf-8?Q?EieU+BewBsQqbc3CBEc1/iXWshmAOAhknyfdOCmvsCqxq?=
X-MS-Exchange-AntiSpam-MessageData-1: Mp80Fqv23KxknA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 731c68e0-a59c-41e9-e077-08de58f9ceed
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 14:31:47.6000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iWubusFyDQPuxE5Sr1iAnmNKfpRxXzcfl2ewm6FfYvdgsmGVZRXXElO5YBs2Qe8rW7n1Xz9ktTwqMaIFin3bEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8909



On 20/01/2026 09:20, Kartik Rajput wrote:
> Add support for the Tegra410 SoC, which has 4 I2C controllers. The
> controllers are feature-equivalent to Tegra264; only the register
> offsets differ.
> 
> Kartik Rajput (4):
>    i2c: tegra: Introduce tegra_i2c_variant to identify DVC and VI
>    i2c: tegra: Move variant to tegra_i2c_hw_feature
>    i2c: tegra: Add logic to support different register offsets
>    i2c: tegra: Add support for Tegra410
> 
>   drivers/i2c/busses/i2c-tegra.c | 557 ++++++++++++++++++++++++---------
>   1 file changed, 401 insertions(+), 156 deletions(-)
> 

Series looks good to me in general. Unfortunately the commit message in 
3/4 is still not correct and now makes me wonder if we should even mess 
with the tegra_dvc_init() function?

Jon

-- 
nvpublic

