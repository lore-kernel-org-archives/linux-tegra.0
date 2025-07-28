Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2052.outbound.protection.outlook.com [40.107.236.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF310635;
	Mon, 28 Jul 2025 14:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753712243; cv=fail; b=X4fTlcvKBG6jM3Ulbv6a/WsHNCBaeQX3h0qJh3qNSYodtCs/Currp5OLYlE/xn4CJ8KV8GZBU5sph7rOewpTT4ThtBTsiz6lxBtn/rt/9TE8VyOY4mlcIce0QGdRtdGPOkT3d2FJ1fxh1A7NF0tER8zX9qXlqR1yjwkQfdcCkEY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753712243; c=relaxed/simple;
	bh=2Q6XliEnMD2ZPDUIugScSm9B9xT+Saud5Q0k4ZC12kk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=I9iAFjSDG7skxKkVffivpGYaJYyL/YG9kKg3E4V9YVtKfXrbWOywjUePN1bfF0j2MglVadYhaohGFtDN1PDUlloodL7mb9Jg4AxUPAdHDa7HGR4ZJAwSlMRKcHOPYPmON4Fgvaum4B5Il4kgal70F+jjeKnjsGKBC3kykKpYh9A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SFQdmEHJ; arc=fail smtp.client-ip=40.107.236.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SFQdmEHJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UmhAhmf3wbENSdF1jg2j3UdmcF5FwoQJLgiM8Zug4/5KtNNdRxzaOrVFXFlak8f0GOvoO+0mFZBsqHw/dLPKUkSpIa+Wc1NWfd+gAZoib9hP9Xv5p5zWvpqmIQjfA+KU714xZxuszZtOjYdqehQhHIIFkD4MgObiE+Mavlh6VtHYtkaQ3xRUKqYGkZ/RR7aeirPew55hUEhO3ZInX9CkYIqrPSHbv3meB5CTUe3mVXsC7/DfuBXHjSsJTBdH5E39P2zZNXuVT9eo08KHq9it11MJAalozF7P5qXzdIRaYIl6ugHBn6jQ4aU84druleP8S+WD7vXEhAOGiHENz5H0AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Gqcs0dQWfY2VcIG1NG49of/jjQnF+EZDcg/lUfa5U0=;
 b=IRsf5547RZGnNvbLEVu8bPORxDXky97Fzc1vOPpkm8/X9czpEbI7gFG5Y74BM8BTmFT8ADQaOfzQ6mkKdbefcYfzXNW1VRNSdfEUKE70qrko9jlJohHjOx2KYAQugDxhrSst2S6mdwKXgDKUkKMbL+55bapMKkeeT2RTRf3+S1dsWCq1xM+JJXlfNiBZ2LizHZo10SPg9Mhyi8XTBsRWikTLuJ2fVzLNXp4zu4/GlUNXu5tI8NECVDEPmzDSAryY/3F6CUTeU0cJSqPljucvGgYmmt4FyXgNiVR9gHwlQunKSV7e/lrLLzfEUT78oIsoYWctzUePXP4F8/zt41bacw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Gqcs0dQWfY2VcIG1NG49of/jjQnF+EZDcg/lUfa5U0=;
 b=SFQdmEHJitSupdeFxxLfQLoSYfmLrGimz/WLR9DVpYsgCTeTpI6XaduEmaAsLyy+YefXHLd7DxzkYhMscUln9alHZWZSgPQVG1qWyTCuOP+CXIL38ZraNWjDhzsGWY0aSoG4ptoO+7cuqqcdIzmvt6Q6G+1dBDnfURplMlGIn3WXNuG+kf7UGhyUI0yNm0JLrOnUZwllu0WiKklAlAJOK++3sGDhh7OvmS/tCnDPBrm+xrqlEfwNRe2yxAam6fCOZTqZTOlutJtc1i/9Etg+4VkpbBkwXu1l0TxzOe6gvC4kSQ1K/AChRVVD7bL4GEOfKlfwtzCgRHjAQFJ+SYcJRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA3PR12MB8761.namprd12.prod.outlook.com (2603:10b6:806:312::15)
 by LV8PR12MB9406.namprd12.prod.outlook.com (2603:10b6:408:20b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 14:17:16 +0000
Received: from SA3PR12MB8761.namprd12.prod.outlook.com
 ([fe80::4d63:f057:7c2f:c157]) by SA3PR12MB8761.namprd12.prod.outlook.com
 ([fe80::4d63:f057:7c2f:c157%6]) with mapi id 15.20.8964.025; Mon, 28 Jul 2025
 14:17:15 +0000
Message-ID: <550bcad5-4de6-46fe-9f2d-f77ccbd582c6@nvidia.com>
Date: Mon, 28 Jul 2025 15:17:11 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: tegra: bpmp: Use
 of_reserved_mem_region_to_resource() for "memory-region"
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250703183434.2073375-1-robh@kernel.org>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20250703183434.2073375-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0570.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::14) To SA3PR12MB8761.namprd12.prod.outlook.com
 (2603:10b6:806:312::15)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR12MB8761:EE_|LV8PR12MB9406:EE_
X-MS-Office365-Filtering-Correlation-Id: c9db5e8c-6f18-440f-9df5-08ddcde173b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MXp6MHN6aVpCbVdUSlAyTklQMjEybGoxa2IydmVQWWQ3dUh6MVR3Q2orYzNi?=
 =?utf-8?B?c1BUdkxTWkpBS1JnRmQ3Ymd4V3JYSVVLdmJhMXBlZTZEZFAzVW5rTkRadGZh?=
 =?utf-8?B?b2Rmd0ZBNFBtazlQMHdIYUpyWGFwcVBFTnppOEs3ZlZZZERVOUhjSzVuNmtP?=
 =?utf-8?B?OUVSVmdOdHp0TU00aXp1N25TeU1Mbm5LbEJzZ2FUZ3BKVnFDamtObWo5L2w4?=
 =?utf-8?B?WDMwZzFYbi9GbXZoZXVZYXlVUERiL3R3bXppSkRBYTdoeUZOQWliak8wK2J1?=
 =?utf-8?B?NGludFdFUXZiTS9ZYUhPVndGRHRjZUNaVDJvMkpuUFdaN3BIMi9ham4xVGtQ?=
 =?utf-8?B?NHg0YW9xdktGWEM1ZU5UWERzL2RkSU13VWlCQXBvV0N2RnpiN3hIS3FkcWRR?=
 =?utf-8?B?ZEsxc1dyK1NOQ1l3c1FIbTdZV2lKL3VQUk84WWJoTnVielhrTW54azFQYmpU?=
 =?utf-8?B?dUtyaFZvOEJld0tHNmhMbWRObVVLQ1ZBRWFrTW52TXg5bEZWWWdjUWgwWWZX?=
 =?utf-8?B?OTF3cGM3RTNBcFhGNFpPSW5sck8xR05CM3hBVTU0M1pNVU9EekhsbkIrUUd1?=
 =?utf-8?B?akh6VjVUWHk1S0lsTDdHbVV6b25XbnNFdHlEMUZJSitxZG9PdGhkbHJnY2xD?=
 =?utf-8?B?WStQT0ZMZ2hPWC8xcjJqallXM0g1R2twS0xPQXJ2RCt4NUw0L20zcUpIQVdV?=
 =?utf-8?B?OVBPNnl1b3hzb3B3R2pFcTFKUkpnMUFRcCtWV3pqWHg2MUFiYk1VNmlrN0Qr?=
 =?utf-8?B?RHFGZzJvUmp4ck9aNy9RbkdXekRpMTBHM25lbVQxM3ZuQzE0ZjlCNmx3TE5p?=
 =?utf-8?B?T1p6N0xiM2ZzaDRoZXVuWTgrVVl3YzU0L1lkTGNmOXZya0ZHai9qM1JQUUdj?=
 =?utf-8?B?QjN3d1hNSm9wM2lxOUY0N2pSNDhJQURFempWZEVVQzgrZlp1OXdQb0lScFYz?=
 =?utf-8?B?T1JTRFV4MDRCdlhiRnNjeWZGcFpZVGptSWNuaTFNUEFoeHFWdDJzbm1Hc3Nh?=
 =?utf-8?B?WGRuRGdNVkNPL0IyY2pJS1JpRnhQTkhSNzBNcVpkOGJ3dUxGUWVKSnlCcFF1?=
 =?utf-8?B?U2gvUTNSWE1COTZMRmxZODJEcXd6SFlQblE0UkJnWm9ZRFZVUmd3L01oVzdV?=
 =?utf-8?B?T3YyN0dJTmdzcW45QmdIWEF2Vk5vKy8xNVQ3UEY2NTZpZnF5b2dTNFdkZHR4?=
 =?utf-8?B?SkFkaXVwVXIxOTd3eXlYQ2VrT1N6bHc4YlRSaTYvM1k5MVJIS2luRDdTUHcy?=
 =?utf-8?B?UFoyTEVoZC8xaHQ1OEZhaEQ4Y2hVOGZQTjcrNVpoaWErV2d4b2IweDhvMXVQ?=
 =?utf-8?B?SkRRazJGTi9GSVB0SXVqOGVleEN3NkYzSW83dHM4d2ZxTktEcTZKMEdRVGhN?=
 =?utf-8?B?aGVZUDdwRlVyNGlYdVFBRkFuekRQVEF5RE9zY0dpRU1DeWtvYmVObTBoVENE?=
 =?utf-8?B?b0JzY1o2N0JCeTdsNmhjR1Zkc0NtU1RzRHNSbSsvcVZyQW1LclR6elRpMUc1?=
 =?utf-8?B?d2x3K0hKR1hlSVlJb3NvTm0xY0dqekljWSs2V0pOUjA0WDZabHIwajhxd203?=
 =?utf-8?B?aVc1L2tOVXQ0MXh6cEpkbUVOU2JxTGszNXdqYUI0b0dwSXpqRjRyVkJ3SHFS?=
 =?utf-8?B?eHltelpBMEZBT0ljY2NpQ3NuTGxsNlU2M1ErWDZMRVNBb2VQcllmVlVhRGJK?=
 =?utf-8?B?UkNjM0xDZEQzaGU3VEZ4YkNsQ3ErTVNkVGZpV2lNczZ1MDYzclluYi9RaVhM?=
 =?utf-8?B?UHdDTjg0dmNUNThPdHFSdDFEWkxYY0NaVTBZWUpNVXNQNU5FZ2ZJTExtWEVC?=
 =?utf-8?B?S2p4Slg3Y2JNcVF6L3Y5d3N0SXBONDZUa3E4OEZIU1FDb3Roc2YwamVoRWZR?=
 =?utf-8?B?dnVHVThVUHZtWWNiNGRzeWsvSXRmai9oNEJ1bktjbGs1QnlqVHpwbExZc0Vu?=
 =?utf-8?Q?hIp1x4Ko2uw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR12MB8761.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anl6aFo0ZW1ncis1MzZsUEtremVJRDBEWUMyeFhoRFpLekNwRWlVZjRWL2Qr?=
 =?utf-8?B?aWpabDgvSm9CZUsrVUpySVhVRk9PeGI5VVIxWWJUSkhsdVpnd3I0dnpONExT?=
 =?utf-8?B?VUUzaFlaWmtyMlhIUHdJRUUwd014ZnY1OWJZaU9qN1NHb0QxZjdHWmxHN0M2?=
 =?utf-8?B?ZGUrNFdtUnhVbGtWSUltU2tOVHkrcEhxeHhpMVp0bkV3NCtVMUVkOGdoK3dM?=
 =?utf-8?B?amlDdGs4SlVwUU1henNHM1NRaVFoamc5VUJMaWdsNEFCbE91a0E0Q3ZJUU1U?=
 =?utf-8?B?TUV5VGZZMlhMVk5GTVRDMzhnTUwrV2k3VE50WlkyVlhueDhSR3J6RkxVVzdj?=
 =?utf-8?B?ajBISURMdWpzN3JCLy8yczRzeGlRb2VTcWFkcVRKdk9oZmN1N0VOOWpReFdP?=
 =?utf-8?B?Z05ZVXowaFdIUFFreS9uK0thdDI4QXZjSUlXaFpFT2M4bDVuRGlXSEdaQWdU?=
 =?utf-8?B?QTg4aFJEdVVpaDFWQVMzU1h4bDdKU2ZxZnZRWFR1bXhxaHRFOTlOTkRHM0Jv?=
 =?utf-8?B?eGwzeVV4RUJyaGZUanJKdEk4M0l1eDhsbWFrRmZ5MnYydHVHRFZZLzRJNm1Y?=
 =?utf-8?B?bEJiaGFDSnc5NkNwbGE3STBjbzJxTGx3ak4zeEcvdmg2NHpDcEx1SVBpSksy?=
 =?utf-8?B?R3ArWVVoNkJvcW1iaEM1dHNuWXN4aUJEOG51ZXVxWm5FU2JQa3pLMlpVMVM4?=
 =?utf-8?B?NUN1blkzZWN4WVhkNFZ5aE5BZ21kd3ZETU93d3gwaFJSeUJJQklsVjZoRTFB?=
 =?utf-8?B?bmp0TERTeExEU0gxZU5yd0pkaDQ3V0dFSHZjMDdUbjc3WWZNbXhXNkdFRzNp?=
 =?utf-8?B?QjVJbyt3SlVzWkpYRmplcksrV1NyTkJ1bHZBYTdBaVJmVm1jeWNaOUhJVXJy?=
 =?utf-8?B?eUR2RkQ5WmdMeVdKUG01aDZxaG5veTNFVkhGVlBlRlRVRnJwQ1hISzl0VFJL?=
 =?utf-8?B?ZGVmdW53T0xWc05Yb1hsQjNseVI1ampqczd5Mjh2dlhURmllSlZnK1dDM0pk?=
 =?utf-8?B?MjUxRmU4dVVZRGtidHp1Sm1tUkMzek9HZE01UWpOekxCQjJDSHpFaEZkTlU1?=
 =?utf-8?B?UEtVN3JoUjQyNGJkZSs4azVEZzFkQ2Y4NDdCY3NIUHJYcW9VNmhpaXJ1WHN3?=
 =?utf-8?B?M0xiVzV3bVkxUk4zY2dQS1IzWjVJMnVBMFlqMFRqRUNSdEkyMzJxWFFRK1FB?=
 =?utf-8?B?M08wV0g2RGJENE5zZ3JpYmt1YnVCblFmL2VDN01NTkdsRG0xYkZoZnZ2WjYr?=
 =?utf-8?B?M1VERnRLUkRlM3ZyT00rNFFKcWFramtYcTJMclhJcFNVbzdaWElESVFLbnJu?=
 =?utf-8?B?YWNrMDRnN1duVHVWS3JFMEtVMThpVGJ5Z2d5Nkp3M3lJTlFyTUNhNFFBa2gr?=
 =?utf-8?B?blFDTDBwMHIzM1FtNEZWQStZdVlHOStSb1VKVktMenF1cWtjbHRXQjJ4MW9I?=
 =?utf-8?B?Qmx3RW83WURJdG0yWXlwMlVSSFhRQW03b3JZRGM4M0tJaHFyT2JsOTlyWmpr?=
 =?utf-8?B?T3Z0YXNQNDgyL2kwUUV0RjJqTWo5WEpxWGEzVmUwN1AzcnpGdGw3QWFpQlBH?=
 =?utf-8?B?b3Y3dE0yN3Blcmt0ZHNkRzhXeGYxOEhGcXU0SGcxbURkaytVMi9GY3hXdFhz?=
 =?utf-8?B?RSthakdqdlFuTEJ0elM1ajJkUHVLTzYrL0l3cnFyZEF5cVd6aVc4TEt1Q3Jo?=
 =?utf-8?B?dlBKN2I3TzQzYXNMb3lvY1YwL09zRERDSUNtNTJFSCs5QkV2dHNyYkppdXE3?=
 =?utf-8?B?S09HVUlMSzJSNnltY0s2UmUyTHhHUnVLcFZjSVI4UDZ6VXlFUEVxV3gxbWFk?=
 =?utf-8?B?OGZBaFVUUndzQXVUN0lwMHorbmcvVEtraDJFWkNlU3pCMEh6OThrZFdtdFN6?=
 =?utf-8?B?eFptRk5tTEpGbnVFME9BSzNqQkdIaDFCTFA2QVpqeFBVaXQxVzJoUHo4NXVG?=
 =?utf-8?B?eXNMNlJWYU8zbXNnU2lOcFNiNWpob1l5ODMyb2FpYlpKbSs4SVV0MjlOYW53?=
 =?utf-8?B?VVFLRWtWVTF1R0xzQVNrN3F1OHAwek5VMFB4YXRpMmdzOHNoWEFYRnplT2tB?=
 =?utf-8?B?UGVybTdFMkpELzJ3MFhHV0s1TWt3clh5M1ZuY2pSU0h3U2JMYnVlSnNIK2ox?=
 =?utf-8?B?cHExcnhzWXAyKzJjZE01MEs3SXFKT05SOTBDQlBoMnlMclVQemo2SWxzVW9R?=
 =?utf-8?Q?1exfKi7XsXsH0HLy6lxrxrokW0s5bjnCq5LpollnZ16L?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9db5e8c-6f18-440f-9df5-08ddcde173b3
X-MS-Exchange-CrossTenant-AuthSource: SA3PR12MB8761.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 14:17:15.4104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /tQHpYuKSKHKFvjn/OK1wDXEMdEAjGRTj4U4b8Kca626DWHZwIWZfC2XMkF2tuN6KREbOIQ9u2K2unFun/ezcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9406

Hi Rob, Thierry,

On 03/07/2025 19:34, Rob Herring (Arm) wrote:
> Use the newly added of_reserved_mem_region_to_resource() function to
> handle "memory-region" properties.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>   drivers/firmware/tegra/bpmp-tegra186.c | 9 ++-------
>   1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/firmware/tegra/bpmp-tegra186.c b/drivers/firmware/tegra/bpmp-tegra186.c
> index 6f0d0511b486..7cfc5fdfa49d 100644
> --- a/drivers/firmware/tegra/bpmp-tegra186.c
> +++ b/drivers/firmware/tegra/bpmp-tegra186.c
> @@ -6,7 +6,7 @@
>   #include <linux/genalloc.h>
>   #include <linux/io.h>
>   #include <linux/mailbox_client.h>
> -#include <linux/of_address.h>
> +#include <linux/of_reserved_mem.h>
>   #include <linux/platform_device.h>
>   
>   #include <soc/tegra/bpmp.h>
> @@ -192,16 +192,11 @@ static void tegra186_bpmp_teardown_channels(struct tegra_bpmp *bpmp)
>   static int tegra186_bpmp_dram_init(struct tegra_bpmp *bpmp)
>   {
>   	struct tegra186_bpmp *priv = bpmp->priv;
> -	struct device_node *np;
>   	struct resource res;
>   	size_t size;
>   	int err;
>   
> -	np = of_parse_phandle(bpmp->dev->of_node, "memory-region", 0);
> -	if (!np)
> -		return -ENODEV;
> -
> -	err = of_address_to_resource(np, 0, &res);
> +	err = of_reserved_mem_region_to_resource(bpmp->dev->of_node, 0, &res);
>   	if (err < 0) {
>   		dev_warn(bpmp->dev, "failed to parse memory region: %d\n", err);
>   		return err;


This change is now causing the following warning to be observed on 
Tegra194 Jetson AGX Xavier platform ...

  WARNING KERN tegra-bpmp bpmp: failed to parse memory region: -19

Looking at the binding only one of 'memory-region' or 'shmem' is 
required and for Tegra194 we are using shmem. So I am not sure if it is 
worth making this change for this driver.

Jon

-- 
nvpublic

