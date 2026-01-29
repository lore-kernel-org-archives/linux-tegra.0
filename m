Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013039.outbound.protection.outlook.com [40.107.201.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304BC25332E;
	Thu, 29 Jan 2026 05:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769664673; cv=fail; b=rAZoT/0F5UmOT5a/XFebHhZYZi3/W4YwFY3/Ra6Lhgo7ZmiWzSwrpvRzsgsEpafDa0Z9KtnY6RJs1aASqLZ0+yn7UvinNPQeZfqYBXhTUodzwA53eyA+/k1ridne+6fLb+Uh0Z+Auyy8Zf373Ok83dvfXD6JoiA7C0BWja63WTk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769664673; c=relaxed/simple;
	bh=ud404ffChXU2Rq1VK3onxmGyalR8Jq9ss3u6eZQflKg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ITyFxHa1ohta89wTPdooOG4dtkbbwB6tgBx35txquSvk5TjnOO0b137lWQW2pgRwTlJowNrE3k1J8d0Zb4sWutgB4XfvOaCgVMelqG7auBFjkPb9aZlJZNepuvk0AnO48GRDibcTLLVgBXMoOVBPLsHtrdwyvq2sh2EjmoXcU28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RBix84f9; arc=fail smtp.client-ip=40.107.201.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RBix84f9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W8dGrIo2fU/+Cx8pv7sJS0j/g6/YSeD8efhEvoBQlhUjiuaLD841CUgEwI4r673zkbXCLjsG+taXE+VUPqDonY5fmEBDM041E7Qh7VQI7xONIhOGPKp0htV97gP4raGg4OOhhuLUqZpp6UO6xYZBQyZ5nse7QUZYeE29oSdoOLqCwz+NpSDsbQQvI2DgqpdB3WN2c0wKcO3rrHahHvP1Kt3oPJktOc7pn/7veuI3LVh66i7MDwMM0tgjl58gY3nmR6xuxPuWVeZ5DXHXFlXmA4caOsdBWDAxlM0ifQudLG8Mq4I+ty5qJ70UQlwVT6wWD0vdP9VPpGwBWs21q8TZ1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lIY8sAignNMf3wsd2YWlcX8PHRoNoLj1FFGjzobKdcw=;
 b=GkCeHUfYqAo+ZpkMVJOB0qNFbetIMHRMI+C3aq9l14BnuqtKHQFowneo0ajDMNSOfH3NXtqU93vroLLSXRRcW9KWWyatlQYQiNZDnZKPjFHhCP9BHMyodUKCYjqUKwajFOIWnK+l4hYXpaCmZ9awvzMCL5SwgAcxrjfPJXzlXtfSF9WxoYG5Y1yZj/BxJXNJUzSmby2FmLK9bNurtfIcuPKWMWgb3OlFEWItzB+8YKYm8rEUg318tea38zt31BUTO67xsecguLWX8cl0Pv+y+y3G7gj6PercJ0g62I1lXuLX2V2mZbplPMpkdrQ0YUXvfjsfmnOjcEkXvFJI3bP7Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lIY8sAignNMf3wsd2YWlcX8PHRoNoLj1FFGjzobKdcw=;
 b=RBix84f9qv/gBysaz+9klrvoJ3gBNgg0QNlUU1b3td7dDbvSUNVzrhRw/TUuFNv9WBWwx8FiuE2vMswukEcEs0mIn8RPBc+Zv22lhdDfUjpVIz/gprlYILbiBZGEhPouT1beojtSz/8cwn49eo2MI5wmSgGLKGzS1gKOGC9bU/eyMu83dd1qd/AdVMU2l3J/NGlKKEkWUGEwlpH7aAgjMOG5oXR9SzMhzfyCsUTtMOZ2ocJrYqeubiUsqWZf+TuRsDWH47R/VPHnFquWUiIE/otumotkJdmyFwVBGywjAHGoEuamoMg6eFWlVz9A0Z+4F9H44nyqnHTQHMQtPB/Z8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5716.namprd12.prod.outlook.com (2603:10b6:208:373::14)
 by PH8PR12MB6795.namprd12.prod.outlook.com (2603:10b6:510:1c6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 05:31:07 +0000
Received: from MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::bac8:2b43:2a64:4c76]) by MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::bac8:2b43:2a64:4c76%6]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 05:31:06 +0000
Message-ID: <a428421e-b652-4986-b45c-e479ef23e086@nvidia.com>
Date: Thu, 29 Jan 2026 11:00:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/4] i2c: tegra: Move variant to tegra_i2c_hw_feature
To: Andi Shyti <andi.shyti@kernel.org>
Cc: ldewangan@nvidia.com, digetx@gmail.com, thierry.reding@gmail.com,
 jonathanh@nvidia.com, akhilrajeev@nvidia.com, smangipudi@nvidia.com,
 linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260121153012.92243-1-kkartik@nvidia.com>
 <20260121153012.92243-3-kkartik@nvidia.com>
 <aXJe_2JC7KgfBgLa@zenone.zhora.eu>
 <e0d498a4-ddfe-40b3-af45-f07d2c5c2e62@nvidia.com>
 <aXqKnm3yR5G1I0Ut@zenone.zhora.eu>
Content-Language: en-US
From: Kartik Rajput <kkartik@nvidia.com>
In-Reply-To: <aXqKnm3yR5G1I0Ut@zenone.zhora.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0095.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::16) To MN0PR12MB5716.namprd12.prod.outlook.com
 (2603:10b6:208:373::14)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB5716:EE_|PH8PR12MB6795:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e882171-32c6-46fe-dea8-08de5ef799cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MEhmQ2p1a2ZNSjR6VjFHdm5tRDNDU3REeWhEdC9acmlOSUF5ZS9LYWxhRVI2?=
 =?utf-8?B?cnpSQ3JTK053OXFUci8zQThabklnTzdtaHNidmtQN1AwbTkrNStLZVRJSzBX?=
 =?utf-8?B?b0NyQy9MaHB2SCtPSERqZFFXcGVyaHZGMHhOSHU0bUp1NllrZmNmbDdUc1Y1?=
 =?utf-8?B?N0dlbXQ0bk14RlhDQ2w3UXVBc1FHeEVVeW04MXVZSDZ4bHV3bjU1VnVWNXNP?=
 =?utf-8?B?NDR4WUo1QTN1RlBHT1l3M3pVMi9DQVBES1Q1cTdmeGR4eWtiKzU1NzVESklR?=
 =?utf-8?B?azZhMlBNclBTQjFJVnRtTDdQdG9nNmM5ZzY0NjBEM05PaUF0V0w5ZG9vQVNa?=
 =?utf-8?B?Wndmc2xYQTZDS0ZUNlFLWFQ1c2NJOUFkam1WeXFXczhkeTE5WGtoaDJFSzd5?=
 =?utf-8?B?eVhhQnlscVRKdjE1VEd0R3dGWllSMDdrakwzemtxZzhFWmtvbWRjNVExNkhH?=
 =?utf-8?B?akJBaW1TU292WGVkdkZNQlZIWldzNjNJcFErazgrTFNmRHpyM0VrbDUvdnFG?=
 =?utf-8?B?Y2Zmb1AvQ3NCT29DUTlOYlVVT0d1alM1UmxacVBGTkZ0Ky9nRllyT0t0WlBY?=
 =?utf-8?B?amkyUitmZmw0MzBkMmFvelRkMlhJQ3dIQURXVHVtbS9BamFCT2xpU1BEMkth?=
 =?utf-8?B?NWxWeEhINGFURnh3OTB4MG9iYjFZcVVRakJRTW1WVjJwcm5qV0RzREZUUXo2?=
 =?utf-8?B?WUJrTDFucVdnNTRKT0Vkc3FwZ29YQmZjT3Eyc3lGZVNwa3ZMVy9aRnJGc3Ru?=
 =?utf-8?B?ZVUrY0c5amdlVGdxQUZGc2hMSlVmREFQZmc2NkRsWnNEb2tSQUVNWWRjZWtq?=
 =?utf-8?B?QVRkM0tSU1dvbllPUzYyRVdWZm5KZmhBUlQyaTJNUlFIY3dwZGZ2RENtSi8x?=
 =?utf-8?B?ZUFIRGdvQkRVK3FEMjlMRHZ4akFsTGtON3hldm5jOWZLWmd2RkxqcTJ4QmdT?=
 =?utf-8?B?eWFUTWhCSHc4aW1TdnFyL083bE9RRSs0ZmRFOTZYK3JSNm9JK054WWtaZk9M?=
 =?utf-8?B?U0pRTjFqSnVscjdDbC9nd0JVOXZ3UElMOGlPa0Q5Tzl4dzcwZTJodHBtVW53?=
 =?utf-8?B?MXpBbnNUdEEyTEJJd1Zrd0pmUGhKT2VwVGFKWUI2QVR2SnNzMGNsakU1U05K?=
 =?utf-8?B?UFJDTlA3V0pXKzlRZWlsSTh4aUN2M2U1YVNQa2FCWk00djhWSW8wM2UrSUc4?=
 =?utf-8?B?OGhweDhCQUo0b0haTUUxN2hoblNRR1h3YkZRMWQxNnNSaWI1UVNRRFBXU3Ba?=
 =?utf-8?B?TGVVQTVVbVFIWE9rL21PVFV4b3RCdHVockxZMStmei9qbkhjSHlVVm15Vk1B?=
 =?utf-8?B?aktjeDlXamxDVVNVOCthUEZRZUN2SnJJUk9SMXN2dG01MGRURm1jVGZSYkFV?=
 =?utf-8?B?bDRVZTdXdFBMNEpkL3F4MlAzOHBIVHQxamZGT0FPbEJHdDlFRGJwSS9TbUUv?=
 =?utf-8?B?TU4wdWtvRXBsanVlZDNCeWw0akVERVlVN3laOG5QM3FYeUFYcmhjR05ZMmJk?=
 =?utf-8?B?Y1U4NU5DMHprRVA5bGZWOVUwVkFQL0wxUFNXblNiZVlrOFJmL0JFbjI3SjBy?=
 =?utf-8?B?enkyTnc4VGFyejRRdFp3N0pjR1ZlVHRjeHhYdkExZTZGdmd0UGhCeUdzRUVW?=
 =?utf-8?B?NHBzbFA3MWlNNVZhMkdEV3VvbTdleWtnYWVWKzlTWkkvZ3dxbHFjWWdaYVE3?=
 =?utf-8?B?UXQ0TGdzZkY1WE5icW1VaDcyeWxRdGkzWkg2SkxQMFRHZmgva3R1N2N1ZnN1?=
 =?utf-8?B?TzZUYm5GQUVxbEE5OHFFcHVLT2tRVUtXVTQ0TXpkRDBYTURGaFZCVHJ2cGdv?=
 =?utf-8?B?bHN0eEhnV3E3dHo0elN6eGo2Z3pLVG9oT2pLQzJtM0JUQ29JYUJSdUo1VXVs?=
 =?utf-8?B?Q1Iva2JxTllMUE1WemNLN0lSbUMvVFdRMXgyZ3V6RlorYjhqNDJOK3EwdnlL?=
 =?utf-8?B?bm5XZ0F5ZmIwQTgzbXJ1c0FmakQ2amtvZ1o3NU5FN1VCTUdCWDhrUmlCSTE1?=
 =?utf-8?B?dFROSEl0ZWIrRXVLOG1wNC82M2Zsa09FelNrL3gzbytnNGY1Z2pkeFBTYmM0?=
 =?utf-8?B?QWJtTFIrY2EyYW1hbXRVeUhsU1JCNW5xb3pITm0vYnJBTEcwUTZrekxtb1VP?=
 =?utf-8?Q?tTC4bPZPe6+Pc2sFxcnqziQ/a?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5716.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3p2MlkzcTFLcHVENDlvRXNKLysvK3Z4TVF1ME56dm5TbXp6TS9QS0l5WE5q?=
 =?utf-8?B?eCt5QU1GajhYMWlPcys3QXQ1RVJpakFGT09yMlIzZllLa2FIYjJMVnBqNzBo?=
 =?utf-8?B?Qkg0Z2dzNlFVUWJPSUp5OVVZNWJoUzZVcUt5WDhLWDN5SEJUU213WCtzT2Ro?=
 =?utf-8?B?dDg1TU51K0ZuK1NoRjBqRU1DL05RM1ZFTmFOMVQzTmZpa05sR3ZUWUJkd1o3?=
 =?utf-8?B?OC9mYVpraTlXR0ppREdxbVQ0UTFPMDBreTZQM1dCRSt3L082UFlBajZIS1lT?=
 =?utf-8?B?aTNhSUJzbVg4Njc3RjVzS0grWnhaYzlMdkphZHlyczVWTWd4bnRDaWdoSGNV?=
 =?utf-8?B?bjVuSFg0SDFGZnVjYm1tdkxTcS9jQmhKTW02MGNHSVF5V0FYbExGY3JnaEZ3?=
 =?utf-8?B?Sng0eFJNZC9EbUd1S05Fa21hbHFQYnJ1cFhySXdDb0JxRklqcUc0ZFgvbzlQ?=
 =?utf-8?B?TVN2UFBqc0M0cVpCT0tYcUlQRGFjNFpjME9McENDTXFFcVl0L1ZiZjZvcFdx?=
 =?utf-8?B?L3hoSyt5LzZqaUI3U3dnRHNkT0U3Sk5NZmU3YjFYcUFKU05YUFJVKzF4K0gw?=
 =?utf-8?B?SkY0RlpiNVg3clI0WDIvWXl5UHJNcUU5QlhuYkx5bmdCK3JscmZUZGliR2FV?=
 =?utf-8?B?b3BRcXZ6anBCVUsycnk3V2xXVVJZQVhFMExvYjBlT29LQmFmRytSNEhBWXdm?=
 =?utf-8?B?RnNiM01KK29DRzlIYUkzaVZUSldkMjFtM3MzZUlmNmwwNGtGWG1BU1lsMVV6?=
 =?utf-8?B?T3B0aWgwS0c1dC9wOE02MXpxVERxSElaWTdvcFJyK1BBZjRIZWxySjlrN3Mr?=
 =?utf-8?B?cURzVEFDdGo3YWd5eGJ4SjZqRkdWdEFVak1CZHJ1cEtpb243MllKUzgrTUFE?=
 =?utf-8?B?ME5waFo1ZWs5S3J0bzh2VlRyWDZSV1dyWjMvN2psdllkV3pSM3hvSTByS1lS?=
 =?utf-8?B?NlpaeGllRm5zTjRrRzdYN1NMaGhsTGVjVWtxWDJmRnRWYUp0a2VBTG13QVE5?=
 =?utf-8?B?bUFqTXMzaWRPdG03b1gwQThtM3Rzd041MkFUKzNVbzFneG5HMjhXa1RVNHRE?=
 =?utf-8?B?Q1l1dmFiOHFBelRqK3VYd2JhemVwclRLTUpQTjJsOWw0UE9yRFdST05zcHBH?=
 =?utf-8?B?a3l3RWhmNnJFaEZYRFE0TkR0Wllab3hFZFVGM3FzenNBUWJHbWdhSEFkdFl0?=
 =?utf-8?B?ZitOSVhxYnduUjJYbE8wQ0k1cHNUZ1B1UUtDWXVMYWM0S2lmVjhLWnNzOXVD?=
 =?utf-8?B?WDN0QTRvMlB6cTRNSnROUVE0TzNnZUk5cmNhUlhyZGRNWlFHak5Hc25WaFN3?=
 =?utf-8?B?S0ZONE4wV0tvbE00U2QwRmwyTUVMckV2RGtjV1pwd0ZFV0FpVDZKLzFDTEVy?=
 =?utf-8?B?bm5yREF6aUwrcnQ4MmlEcit3YVlHY0tNcDQ5V3p3ay9SZTZ3WGIreWZ1dkVB?=
 =?utf-8?B?dDlFVXJhcDNWTXdIMGU2dlNxb1lpYW5HaUd0RVJLTTRQT2gyaWRkTGluZ2pr?=
 =?utf-8?B?WUJMc2tCOVo5VFBvZlNMV1NEQUZ5SWc4M0t2ZFFUbnB3c2l5ZjVzaVpzSFRu?=
 =?utf-8?B?Sk1sOGhBYXdHdkRMUGdZU0s0cVFMdlJTMEFUNmtnVE8vS0RZaGZHWG80Qmlq?=
 =?utf-8?B?Z3ZhYjhNTFJRMDM2dW45a2tCS3dGUFNUVXZvRzFaOHRMc0ZWMzcxbURRQXFs?=
 =?utf-8?B?bnVpYVRySENUSVlnY2JVNUVDZ3Jyb3hjQnVJbFpNeS9xOWFsZ1VQRmVaQ1pQ?=
 =?utf-8?B?UEJJcDhwUVVURnpKNzdzZlBobHhZUU1URUVtR3VSbG5oN3pXcXl6UU8wcmVR?=
 =?utf-8?B?dVZldC9Mdi9OU2VCRlgzVUpPSHZMNkZ4Um9JRHlab1JwTDdSQndqQVlRM3hD?=
 =?utf-8?B?QzdEWHMwVWJrR25wQnhyb1JVcktqclpMeHNjQis3WWQxbS9rOThyM2ZrckRC?=
 =?utf-8?B?RUl6RTlxNlZRNk9FNFQ5YzMxSnNLZkcyM212VFBmVzdtUzdPeVplMmdZZzRz?=
 =?utf-8?B?VDdFaVZ6NGN0akx6MzRvclEwM25BaFFLUjhReC80STNkZlo2U0NLckNyOW9r?=
 =?utf-8?B?Y2tKY3FsQW5qdXExK2ZhY0FqWGtKVlI1czNHN3p0RXlscnRiMUF0c1BVU09t?=
 =?utf-8?B?NFZsTkxYcXNORVlnVTRVVFhmd0IzbnhWQVRYMnZ0TVZMWVByOGhpM2FkSDVZ?=
 =?utf-8?B?djQ2YlFrSmdpOUFnb0ZLVTNDQXMrMlZKQThmejFrRHJjSktZNDNrbnJ6Wkln?=
 =?utf-8?B?SEh3b3dXRXJUYXVxV05lREVnbmt5SFpRYWdOejREeWtOR3BmUDBrSWdHL01a?=
 =?utf-8?B?YnlJTmxENS9GM1hLUm96R1RJK1BOUW85Q1lMUTZXNjFCMERKRGQ3dz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e882171-32c6-46fe-dea8-08de5ef799cd
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5716.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 05:31:06.8274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wKg8ChK7fBAzf2twl+fZG6Q2BdEc8asNoNId/lLxJtLp4XGH0PcUiP24fj4caPlNlB5uwuT2iw1boWEoNznMug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6795

Hi Andi,

On 29/01/26 03:47, Andi Shyti wrote:
> External email: Use caution opening links or attachments
> 
> 
> Hi Kartik,
> 
>>>> @@ -280,7 +282,6 @@ struct tegra_i2c_hw_feature {
>>>>     * @base_phys: physical base address of the I2C controller
>>>>     * @cont_id: I2C controller ID, used for packet header
>>>>     * @irq: IRQ number of transfer complete interrupt
>>>> - * @variant: This represents the I2C controller variant.
>>>>     * @msg_complete: transfer completion notifier
>>>>     * @msg_buf_remaining: size of unsent data in the message buffer
>>>>     * @msg_len: length of message in current transfer
>>>> @@ -332,13 +333,12 @@ struct tegra_i2c_dev {
>>>>         bool atomic_mode;
>>>>         bool dma_mode;
>>>>         bool msg_read;
>>>> -     enum tegra_i2c_variant variant;
>>>>    };
>>>>
>>>>    #define IS_DVC(dev) (IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC) && \
>>>> -                  (dev)->variant == TEGRA_I2C_VARIANT_DVC)
>>>> +                  (dev)->hw->variant == TEGRA_I2C_VARIANT_DVC)
>>>>    #define IS_VI(dev)  (IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC) && \
>>>> -                  (dev)->variant == TEGRA_I2C_VARIANT_VI)
>>>> +                  (dev)->hw->variant == TEGRA_I2C_VARIANT_VI)
>>>>
>>>>    static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
>>>>                        unsigned int reg)
>>>> @@ -1647,8 +1647,42 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
>>>>         .has_interface_timing_reg = false,
>>>>         .enable_hs_mode_support = false,
>>>>         .has_mutex = false,
>>>> +     .variant = TEGRA_I2C_VARIANT_DEFAULT,
>>>>    };
>>>
>>> in v8 I made a question at this point, could you please answer?
> 
> ...
> 
>> Are you referring to the following question on v7 of this series, which I've already addressed?
>> https://lore.kernel.org/linux-tegra/c3cdece5-1bf6-46eb-a668-2ee2a4358a88@nvidia.com/#t
> 
> I'm sorry, what have you addressed. It doesn't look addressed to
> me. In the same series, I want to avoid adding something in one
> patch and removing it in the next. It just adds noise.
> 
> Andi

Ack. I will squash these two patches into one to avoid this.

Thanks,
Kartik
