Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012048.outbound.protection.outlook.com [40.93.195.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8AD42BE620;
	Tue, 13 Jan 2026 11:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768304700; cv=fail; b=u03GqDVGfbiPW7cQAyUp4RuS8RpZwqtzEST0MEmoprh0BxubxNmDd/jVbKFmN2hXpf8Z4OAj/6+3+ABwaxIbzWYfFobcUHD661Q/xmt9U8+zlNjpCBc2vaaq3AqRZa3hQUr0LKbW92ZmPPrq2ya2duzrv6k5Jg+Q06bSqutARMc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768304700; c=relaxed/simple;
	bh=PN2yod+MvfgqIixlTnWJh8DsdmU3/HEka2NHvr9b2I4=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PnRz4edDkg/8f/tv5H9fjRlIFBrGUXYnqDnasg/W/YttBmz4vAWChQG1CpsFOZAhHemmy6LvQT3X+MbRCNdQDMpyrZ9B194btZhhWAjp8JeEkJcB+F0urqBkxu2DX8uh89FuuBEXsJi4GKuKiTQa1+LOp7v4C9jXWRvzZsX1uZs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QaClEiO8; arc=fail smtp.client-ip=40.93.195.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QaClEiO8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r1OOkvx5CXtLSMMWldw+EssY0KJVW9HA83PGTXQrWLaanF4tMLTanUhjPCirIU8QxuhzAgJT6+9TbwHA6UjoppwZbKgPZXqwjxJysTLUzdfhxvk4qWnmE30g6SQ3CwmMzRb44EXD/F2JT+TmVFg3Ts6TPBJ4sMxfvPU+iRXyXswoCfuM3FiJKv+DW5BTLJcSGGICwbwyXrqCMhTKE9264o3cmlCtMmu4VEls+g3xvvTV1Am/QSFC8JwSEMD43I2qvs/8zlF7hpUo/f7oP0b3Iwj4ToN50dJE2ZEQ2CECDD5xcpJ4vPUDDK7q20VteddBekr4B4+wYZ2/Rn7jJrUlMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+q9s82g9kIa3hS7fkQecWGhdEnZQ/dk7sNSFf5Caaxg=;
 b=Knwk4956eaxf9ycDmdfDddRiurJdDlV+PqXiHmF7I+IKi5KMJRsVZ8zQJy6GuSLIKJ1kyp0gx4ygq81AfBqPMcI180bQ6PdHe7qKbQ1uNh0YrnCgWMYQx4FbonUhF4dqmpKoHBlAmfBwyFI1VDh5URvvAUqOJg8mmeS+5GdVLxFb72ElRa9GH2aGT28cKE0eYA5tuuDKilfvBcf5Nkhxg0g8epaQ2WVNKqjhfDp70u4bSdP7WI/tF+eDhffRHfK+fdjmXJ3XpfcTTtaIkwNVdus4eSh6CqxAlQRP/iuwOgIBYpPG71klISnibo5HMsfKzulT3vSS5uPTHZDBd2znoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+q9s82g9kIa3hS7fkQecWGhdEnZQ/dk7sNSFf5Caaxg=;
 b=QaClEiO8mgvurNvg6ss3PsncYK9bQuHhLD6p85tAIQJd2bwdixcpsTwTKuVgKNWuME+HKv3bjVvQ9RQ11F7Tf9rCNtkQ7d3zRO1fbPxiH26hgUb/NPjYlzvUFkHyfo2Hxx2XLyOmaT6dz4QNg9Rv8M0C8y30P1ya0twA/bNB+EqI7150QuedmToU31+x6M5Sin3Wwm5WsBuWWWbiUH3UxSJm16Yoil7knCnT3WNrgiaImmclzaZI2utTzyMgvQJbBge/2HQgbN531wlEYQvJUbfpcrWc07lovr4Q0TPTEs+nKbwIhuYRK9HOWIHn1DyV3k3wcu33kI38uUa+WEHGdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by DS2PR12MB9566.namprd12.prod.outlook.com (2603:10b6:8:279::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 11:44:56 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 11:44:56 +0000
Message-ID: <6a0d379f-d215-4efc-bdd0-c9a74d31614a@nvidia.com>
Date: Tue, 13 Jan 2026 11:44:51 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] phy: tegra: xusb: Fix ordering issue when switching
 roles on USB2 ports
From: Jon Hunter <jonathanh@nvidia.com>
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
 <e9f18b0d-6462-43e7-955f-45337914b321@nvidia.com>
Content-Language: en-US
In-Reply-To: <e9f18b0d-6462-43e7-955f-45337914b321@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0P221CA0026.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:610:11d::6) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|DS2PR12MB9566:EE_
X-MS-Office365-Filtering-Correlation-Id: af7eb40b-6a9a-4671-47c3-08de52992c4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WnNkbXpQZXdhS1hVYy9HNEp4amkvcXlIczhkR2xtVzNqc01TbGVoYUNlb3lv?=
 =?utf-8?B?eFZFRzlEME5wVnlWSUNrZnAyam9obWhGUkwxLzZqbXV6dFp3cUVUSWV2TEhM?=
 =?utf-8?B?RlE5VHRqaG1TaUFSKzR3dFNQbStBTis4TGYxSUI2STk2eHRqNndnRHVVaVNS?=
 =?utf-8?B?cE1WY1ZUbVdNY3EwUHlkNlFMNEk5TXhCOGVSK2J1ZzBIMGE0dmRGbVgvUXcx?=
 =?utf-8?B?NEM3UEUvTTdKbU4xSEdBUk1IRmQ5SnpYQlhSWFU0RHZiWU1pZXlUV1RDaXdZ?=
 =?utf-8?B?ZmQ1NHlkWFY3QW1STGRLTmVzTlNVdkYvTU9STmVJWXpnWTg2NzVzb1dGTWpO?=
 =?utf-8?B?WTBUL28yZmpZT0Y5ajlpVU5NQTYyTWk0c1NQendoWXFYUXptQXBTc3IyS0Fu?=
 =?utf-8?B?UUpUMDVINE04dkZUT3IzYVQ1cEk1UkU4c1l5bU1mNTZrb096a2JsT3ZxZzB3?=
 =?utf-8?B?R1ZEN0E1VjZ6SDljZCtTQk96WTV1eTZNbEhWZkl6M1Boa2x6OXZoOWlQcVhV?=
 =?utf-8?B?VTVTYSt4VXNwODRDQXFqN3ZTMW5pOTVSSWo4NWt4TSthL3J4RkFBUll4cUgy?=
 =?utf-8?B?c2NUb29DeERPY0tUT2IxOU9NZm5CN2pRandtTS9RelRTTndtaGFSckVwNlZQ?=
 =?utf-8?B?T0pyRkFIZlFhTGNhRUFveDN5dXdFVXRSUklnNEtKMHhnY3F0b1hROUc2d3Nh?=
 =?utf-8?B?YVBEM2pPdWR4WXVZTUltTWdaaWNRa2pYd3l5RjVMbTZmQUtIRG5XbFhUSjZM?=
 =?utf-8?B?WS9JbDMrYmZKRFJkZjNtN0J3Z0NMYVZ3dmdVVVlOemFkWXJGeFZXaGgxRk1n?=
 =?utf-8?B?a05sbFY5b1NHQkEyY2JJQnBOVGpQMFZNNWsxY20rN3ErS3VabU5keFB3c1pZ?=
 =?utf-8?B?ZjR2ZlRxTVJKNGpBeGMrR2hUQmJMQVNSSWllWTFEUCtJWTVZdkpqOHE4ZXY2?=
 =?utf-8?B?OHlabmhOcTkrMUNMM0NMMkY3Y2lXa0FiZkhzMy84clZUNm5kUWIxRE5UL0JL?=
 =?utf-8?B?U3ZDK3NKN01uRElKV3ZhMU5nK3loQnRZc2lmbG1wblEzYTZCd2h2dk80eGUy?=
 =?utf-8?B?MW1Fb3lEd0o4bytiTEVLeGpqMmtBWDBSYkVSenlDZUNyRkRJdlUyYURuQWI4?=
 =?utf-8?B?SmZoa24zYVY4Vm51c1htL1hwaUdFYlcwNHFkdUllMTZGTGt2MUYvQkZwWksr?=
 =?utf-8?B?YkhCckp0dHZQYWVqSU1aamZVc0ZqMmlVQUJzWmpTdHBkcXNSNnBJU3VRSXVn?=
 =?utf-8?B?UU5rZmRKMThoZzFIRzl0QkFRNVp3YWd2aWc1ejV3aFNkbzhtTkkvenhyTGlF?=
 =?utf-8?B?Y1ducWFLWGYrRFNOQWpNQVdDSFJpcWh0dktkV1JmQjQ4VU03RmtSRDZlaSt2?=
 =?utf-8?B?TDBxVlNOandkNks0MVZxZmRJbm5qNzBEcEt5T0xKWW5YTlJIdElPYnZqWmFl?=
 =?utf-8?B?c21qK0hOcVRmOUlpYnZHNU5sL0dQYXd2ZHQ5WnFyaUdEcTk0NzUyN0xZL2VZ?=
 =?utf-8?B?d0l6cUNiNGgwaEpRNFh4RXB3R0orRjAzZ2ZTSDdpcTFZTFFYTCsycHRWVTdM?=
 =?utf-8?B?RDRFc1F2RXJka3NGWGNVZG12RyswSWZJMDdMSFlET3lPNWxGckNvWUQ4VXFG?=
 =?utf-8?B?QnFVZnFxSmREMXVQNm9wTWxvcUlHVy9lcS80OTl1VjZseTMwRlRoYSs4QWVZ?=
 =?utf-8?B?ZDlUaCtIN2pSbDVJeGk4a1NaVHZhczZ4NU9WNkp0VFdYeW1XK3BEZEcxYU9S?=
 =?utf-8?B?UUpiSDJ4bGpITDBnbEpKSXRseGlXbmRDNHQrK3YzMWVKTnZjSGJzckJQazZB?=
 =?utf-8?B?MHFhNkFuV2FES1FVTW9uMVpOZVlTWHRWWFNFajRidkczUlRPZXdjeTNrZlhi?=
 =?utf-8?B?Q0tqeTl4d21nVzRYTUZjQUNvdWZZemFUeDE1eFZOMmJjV3I0RG4yeFRXSEJS?=
 =?utf-8?B?L2U5NlBpL2RJZDY3OW05VFBrSVBiU2ZONG5xU1dLbGpZT3JZQ1gxU2tWdnBz?=
 =?utf-8?Q?mFUh+e2U1D6qOBkZx8fjN9OZ3lR8dY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUdqT0FkSHh4aG1iTnh3WWswWDhhYkdtNC91Y3hsaFhuWFl5d2RBOCthY1hS?=
 =?utf-8?B?MXFBakZDMFNNenZMdFlhdTRZOUpuR09iMndBNjFneUMzSkNXZjlWVURsVVBG?=
 =?utf-8?B?NGp6NUdwaERjM3hZZXVWQ2lZQlg1d0dYVGM4VjMyWUNrQ2lNakl4Z3Nzb29h?=
 =?utf-8?B?TFk5UlpNREpDenFlZjdEcUVmMUV2QlJqYUQ3M2RsSkhpc0lURHpUWDJXSmQ2?=
 =?utf-8?B?OEFNUXNBRTlON0JBMTRkVDNsRW9CWXVwWFRUdGVBaTRpeFZIQU41NmVzcXZQ?=
 =?utf-8?B?L1EzVUVXUUw5R1JSdXBGQnhzQ09pODZpdUErNVhpcE9tamZzbFB0a0NtbXJt?=
 =?utf-8?B?QlBqSUxCcWZtYjc5U2V1V3dmMVMvblFWb1RrYkxSZ21XOVlZanRWS1RtcEJn?=
 =?utf-8?B?S2c2TWNXWmtyS3lyYzVES2o5MHZPa3BYMjl0dkZIUGVkQmtHb1FGMk5QWGRq?=
 =?utf-8?B?S25EZXl6N0I2QWpEQ3h1MTF6a2pRcG9LZ200QWN3RkJEZERWMHYxdG9yUWpX?=
 =?utf-8?B?QUpTaEoraVJ5TUtMZ1lueHlkeVJNOTAwcnFoclJGa1FNNVJreXgxT3JodW04?=
 =?utf-8?B?bFlBN3RDeFFaWWdTWlBXNnhJRDNDMGxCNi9paTh3bnpaajg2WWpiUGtzVHRC?=
 =?utf-8?B?YlFobENYK3piSFRLZHlEbm55SHZ6cmUxRVkxdHRIVWJFTVRWczRrSy82UkYr?=
 =?utf-8?B?SmFONlRidndiQ2pjZ2w0RUYrcEZrMSt0dXM0clQzTXZTM3lQSTBjSUxLUlA5?=
 =?utf-8?B?TWRmV1dFYStwcFMwN2JieWNNSmtBempuanh2MGY0UTJ3b0NocVlzQndMRVl4?=
 =?utf-8?B?VjFEclU1ZURXMEZ2a1FHUTJlNnFRbGlObUd5byttb2lrU291TWRKNFVoeGNV?=
 =?utf-8?B?ZU0xczgveDBlY04xQ2pIRDVUUGtxQWtONWtjanZoOUc1eHgwa0w4c0l0TnZH?=
 =?utf-8?B?bjAzZlJDYzdYUHJhMjJCTDZBclE3c0pGZk1aVzJJb2ZjaU9PVzE3Y2dqZnJy?=
 =?utf-8?B?SlhCUW5HYWVoYWJJcW0ycEltZnV6VVVuZnN4TDVnT2xCaWVLVllUYkJZdTAx?=
 =?utf-8?B?N1l1ckNvbmI2Ti8yS2VJU2J0TndnbTg4T1BKMHNDQzF6WnhKbmZsTGVIV3hL?=
 =?utf-8?B?WDkzNTh6N0svVVkvcDVTMXVEckVqVEJxMnh6ditKYlloQzlYN1cvQVJsZ2Fo?=
 =?utf-8?B?THljMzJacnlKRTNKZEJWekNsa08rMFlLaHJKeEk2WWRvaFRuL3E3bmdwMldy?=
 =?utf-8?B?L2pLS1k1Z1FvWU9HaU4wSjNOWEd0UXg5QWdKTUhUSVpsYmM4TkllMFhUWWtt?=
 =?utf-8?B?ZzRvaGZBMDQ3MXZlOWdkSUc0SFFuZlREb0xCMHlINTlzSjRrSHIvUDFRVkFP?=
 =?utf-8?B?VFc1S2hPWk1MTThid3djU2dCc2w4WXFRVCtZcUU4U3dOQktmdW9GZS8wNGdV?=
 =?utf-8?B?ak9JaFpHTlRHQXZTUG1McTVlYW9LQThKbHBVWk9lZGJJY2lqWGF1TTg5ZFNa?=
 =?utf-8?B?MVFLODI5M0VYZk5iQWF6MzdMdG9hbTJKc2dYMFhCTEtNZlN1bHJhR0t1STBV?=
 =?utf-8?B?cGZ6eGVLalRSaE8vS0U3d1VmNzRXa01vQkc2UGYxbXdkd2s5cm9ac2RhdEx3?=
 =?utf-8?B?NGY2WlBXenlvTjFTamxxN01aN0VnNjBaWHVMMGhlS2xjYkJ6Mm9icmc5OEQy?=
 =?utf-8?B?ald5OTg5THdmbnI1aGQrdVZGNk1CNnlnZ3NrTzMwQlVlN0hJZ1FRbE94VTQw?=
 =?utf-8?B?UmdsRk9PTzBhWXJ2Z3hqZ2JlZ3E4VCt1VTZ4M1NQUXZpSzVDdUh5eDVBSkw0?=
 =?utf-8?B?cDlwQS95SXBEeWVsZWF0RElLcHlsdHl5TXpLOEI3Y2I0UU9UTTJYOUlaS1Er?=
 =?utf-8?B?QTIxWFhzcTNUTWRESEZVbWpRWUxjNXN3QXF6bEliakpETmw0d29oZ29iWUJu?=
 =?utf-8?B?OXZEVVY4dXQrUmRUeTA3NUY0Mjg1RHU2UWVYdDRES2ZQTGQ4K1lFOWs4ZzFs?=
 =?utf-8?B?emo3eEZCOVJEQmYyNmxGM1kvcDA1MzA1Z3VaSkpadFNReDlyMjlaUEJ2QUpv?=
 =?utf-8?B?NGdxVEJkOVZXa0U4U3NuUVhuOU1rWW8zeHAzSXlXRFp1eWYzRHc2RFVCZXRw?=
 =?utf-8?B?bFBYRWJxUWRqQ1BBMVBBVzcyNU14ZmRSdGx6clVDN3FLMzZORmlWU2JMcEVW?=
 =?utf-8?B?cm1zeVNYaDI2VGN4V2lDbE5BN1ltR3RnQmR6RE1yc0tMK3VoU0xOTUYyc2pk?=
 =?utf-8?B?SkRMdzZmbWFTcmRwTHBzYURnOVRYeVNOM0p5VDBreW1LeUpOa3EreWo1RFFV?=
 =?utf-8?B?N2hWSE9MMWJUaS91Z3V6NnlJR09LTGNLYmoyTzdkRERybEh3cHBTdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af7eb40b-6a9a-4671-47c3-08de52992c4b
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 11:44:56.0825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VkGZMO6/8KwimXP9i8iuZJVuxdnKP/c0e9caYOsE8rwUOGEfT4AWZSrUPSm3lYMDSVDg2r/jwnreRTtPS+3VOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9566


On 13/01/2026 11:35, Jon Hunter wrote:
> 
> On 04/12/2025 21:27, Diogo Ivo wrote:
>> The current implementation of USB2 role switching on Tegra relies on
>> whichever the previous USB controller driver was using the PHY to first
>> "yield" it back to USB_ROLE_NONE before the next controller configures
>> it for the new role. However, no mechanism to guarantee this ordering
>> was implemented, and currently, in the general case, the configuration
>> functions tegra_xhci_id_work() and tegra_xudc_usb_role_sw_work() end up
>> running in the same order regardless of the transition being HOST->DEVICE
>> or DEVICE->HOST, leading to one of these transitions ending up in a
>> non-working state due to the new configuration being clobbered by the
>> previous controller driver setting USB_ROLE_NONE after the fact.
>>
>> Fix this by introducing a helper that waits for the USB2 port’s current
>> role to become USB_ROLE_NONE and add it in the configuration functions
>> above before setting the role to either USB_ROLE_HOST or
>> USB_ROLE_DEVICE. The specific parameters of the helper function are
>> choices that seem reasonable in my testing and have no other basis.
>>
>> This was tested on a Tegra210 platform (Smaug). However, due to the 
>> similar
>> approach in Tegra186 it is likely that not only this problem exists there
>> but that this patch also fixes it.
>>
>> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
>> ---
>>   drivers/phy/tegra/xusb.c            | 23 +++++++++++++++++++++++
>>   drivers/usb/gadget/udc/tegra-xudc.c |  4 ++++
>>   drivers/usb/host/xhci-tegra.c       | 15 ++++++++++-----
>>   include/linux/phy/tegra/xusb.h      |  1 +
>>   4 files changed, 38 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
>> index c89df95aa6ca..e05c3f2d1421 100644
>> --- a/drivers/phy/tegra/xusb.c
>> +++ b/drivers/phy/tegra/xusb.c
>> @@ -740,6 +740,29 @@ static void 
>> tegra_xusb_parse_usb_role_default_mode(struct tegra_xusb_port *port)
>>       }
>>   }
>> +bool tegra_xusb_usb2_port_wait_role_none(struct tegra_xusb_padctl 
>> *padctl, int index)
>> +{
>> +    struct tegra_xusb_usb2_port *usb2 = 
>> tegra_xusb_find_usb2_port(padctl,
>> +                                      index);
>> +    int retries = 5;
>> +
>> +    if (!usb2) {
>> +        dev_err(&usb2->base.dev, "no port found for USB2 lane %u\n", 
>> index);
>> +        return false;
>> +    }
>> +
>> +    do {
>> +        if (usb2->role == USB_ROLE_NONE)
>> +            return true;
>> +
>> +        usleep_range(50, 60);
>> +    } while (retries--);
>> +
>> +    dev_err(&usb2->base.dev, "timed out waiting for USB_ROLE_NONE");
>> +
>> +    return false;
>> +}
> 
> 
> This patch is causing the following build error today with -next ...

Sorry this is not in -next, I had just applied locally on top!

>    MODPOST Module.symvers
> ERROR: modpost: "tegra_xusb_usb2_port_wait_role_none" [drivers/usb/host/ 
> xhci-tegra.ko] undefined!
> 
> The above function symbol needs to be exported.

Nonetheless this needs to be fixed.

Jon

-- 
nvpublic

