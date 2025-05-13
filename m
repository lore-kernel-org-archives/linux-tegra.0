Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2080.outbound.protection.outlook.com [40.107.101.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3905645;
	Tue, 13 May 2025 17:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747157581; cv=fail; b=nTmvUQ11lxqRZjNzRdVk9b0LtyVcweurdjW1o8IOMv00+vDmtSZsxwGOjaCH95zZMvDsqrgB+CFEsph45xGzwH/JXISx/2yVkeufGV76IR7cdF3qvzXuaB8Lg9gbVZkiH0fdgKgZE+CO+Up0F6zzc1KMzoNSN2E8pKINr5OTswE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747157581; c=relaxed/simple;
	bh=al+zHDNfwwwIKydLfU99VIsHseH6eCFtG5Blx+2v56o=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=a/bnXqru4L5Ffa5pzhL+xh1CdPrz1pnzT5PWbCb7uE5WujStVGSLsk3iywsldKukERvhQA9kDPQmodm0RWdGVg2C8560L7++DDtVjAK0gkgB2ULJn+oOhO+PtlZu/jjkIMBIiGQ39wYifgbX/rZD5fEcDRBIGv4pQdRj7MpzkGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=L84c446W; arc=fail smtp.client-ip=40.107.101.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="L84c446W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BE//8l743bimmLY3p1z9aa8nRYRozKH6NyE9I2cu2tlpIZYANVCrkfJYfYvGC4vWgYjS5GV/5ppzUuyBNM7kUiuClc1DxYE0N+sne5PYzJLYv6GxXzdjpWaIjPlT44m0TFrD4oFNX/zuNHIsGx76aWcSkWB1nCjFMM/xscajwWmXO3ZT7DScWnAmF3V85OqVPDkiJPeXeMH137phVsu54q5qPDWNNzXnQ/fqcGok6sJfkwm+xeCJ6ri0nMidKeu7Ca2z93xPQ5rK74IB7dUj7EwQJ5zwsBGvwqqIWrEz0aopH+J35L2gI+jUaASg5gCcaFPL5WKOGgR0YkgdETwJ+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2B/PdRevDekkCoaB1eQUOmfD8vVt/yG409R90GLgrfA=;
 b=ANJFL6Wxdf01NGkir6hh7wjBh46uNqc/U/eOWpoG0+vbKex4MbMqLn5x33g4mw8Kft33Pmf4HIaHmSd2+f8PJGBhYjUOXESzsXS5S5iDZ5wMSVu0YXLZr8MsqalsKFDzAhiFGfM5UJrHvkYTEHL/6C3i9brCxldfvqgW53SA5cApj/Vll1txDPvrdJQwJ43foVUI6WbDn3kXdMWfWW2zH19+6NbMis7RIl3d5Q2JAvLYSsEGPPnB3j+1YmdzoDkNgM9LLI/uGNjUi1E9W9R3+D0kZMtHhI9hXU2yyqYH+3Y3notZPUDo1BEsSjEk8Vhq5KRXWQ4H0Rqq//7df+6jrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2B/PdRevDekkCoaB1eQUOmfD8vVt/yG409R90GLgrfA=;
 b=L84c446WFIuOscLEWbpcWRgncJaJQDgNXhHAZIjuRxQRX2axkyPRas81DCWkX1ZskmEWbKr9gv+OfTSs82SBPUG8+qC50PxOG8VOeOeEa0D5smJdJzYTIimFTwtJou6tfuaicO+JIUbevH5jlCB/MJYnbVmwDnbB0QH0YDu6/6mezE3DWuTH/gsQmUMafd+aJxLXjM5BROh8Jci6CR2qqM65Bnd8gq7noqAlW8iOJutESrTAjsU8YbNNFMRNFHi8oUpJLG0Sn/VxKbW+c1aQRUET4M5KC4FsiiTEM+0+oWSNVRLJY6s1gJWUZHppIkytwQ7CXyJISPDv1GkpGBSCBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by MN0PR12MB6293.namprd12.prod.outlook.com (2603:10b6:208:3c2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Tue, 13 May
 2025 17:32:54 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%3]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 17:32:54 +0000
Message-ID: <35f464cf-c264-4f2b-9e0b-fd8a71526aa1@nvidia.com>
Date: Tue, 13 May 2025 18:32:49 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [patch V2a 35/45] genirq/manage: Rework irq_set_irq_wake()
To: Thomas Gleixner <tglx@linutronix.de>, Jiri Slaby <jirislaby@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20250429065337.117370076@linutronix.de>
 <20250429065422.128859754@linutronix.de>
 <e9a0abc5-7ee0-4ee1-9e19-37d43a5d41de@kernel.org> <87plgtq0qb.ffs@tglx>
 <87ldrhq0hc.ffs@tglx>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <87ldrhq0hc.ffs@tglx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0451.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::31) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|MN0PR12MB6293:EE_
X-MS-Office365-Filtering-Correlation-Id: 32d02dc5-d20e-4563-5ff9-08dd92443120
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U0pwZWpTSXhMQXkzdzJjR0FPZVpYZkcxaHNDcjMrYkNSOHcxd2l2aC9KWWdr?=
 =?utf-8?B?QXZWbjlZUmwydVhyTGdiUlZKS21sa0l1S3VtYmhESFU1UVBDa1ZaSHNwQ3Zy?=
 =?utf-8?B?c0VTTG9vK0tuMkZtOGZRcnVlVkN5cWRzN2pSR2doNnUxbjkyV0haVzE2Rm0z?=
 =?utf-8?B?UVNQTCsyMzhYNzQxN1FDdWlVTGVOUllGOThUMy9hZEVvUHNXUjE2dXBVRlA3?=
 =?utf-8?B?QVlLZU84RWF0eDJYVTJqMk8vVFRlbm5zd25zMWNIVTRmSDJKWnJDK3ZHUzV2?=
 =?utf-8?B?bFVpc21oNzJiS3dDR1dXRzYrRjZKVzU1YXVCMnA0cis0N2t3RkJHOWd4VEI2?=
 =?utf-8?B?Q05MWURUeS9PSkRCU0plWi9FZ1VwNkFpbEo3MGc3WWM0WmVSNVdZNDRlMzlG?=
 =?utf-8?B?K1NMT21MazNPNHpBVEl5OEYranFkRzB3UzlzSjVSVUJwWHlCRW9XcWZ5RnpL?=
 =?utf-8?B?M0lDV1hKQkl1UjJzUmxVOTY2Y092aDhaRXNua0FxVExoOFRFT0EvSWxUVG9Z?=
 =?utf-8?B?RE1keXpGTnppTVR1THZucWcybncwaFY4QWJLZmZXQnduMmNsVytwbmJKYmQx?=
 =?utf-8?B?bzVva1AzamhpV21RQ24vYS9PSUpZN2M2b3A3aWdWakJJTWxpdnl6bXAvRjZu?=
 =?utf-8?B?VUppQnhWVXZiTGtOL3J3Y0Fwc2R4NFNEaTk1OHh0QVJqRHdQcitwN04zVjd5?=
 =?utf-8?B?MWRRTkVRSWM3UkM2TVhobnROS3hRVHNVUVNUMGRRUC92d3gvL0RsRzdiMjk3?=
 =?utf-8?B?VXdncFIwR1hpSlZ1RElTUkFFOWw2dXpKeW8zc3E1dXpnUE80WHhEWnRUT3ZK?=
 =?utf-8?B?TkQxNmdhSkhRU1V2VFQwOFV4S0R5WmRoZG1ER24yMis3aUNNYTlNckR6ZER1?=
 =?utf-8?B?R050YUFueDVJSVlPTS9uTDhlZWZKOGFYakxLYmJBa1FrWlVIa1dpQUhmc2FZ?=
 =?utf-8?B?S1I3TlQwdjlwS1NmREtaUjBTaXdnYVRnY1ZDQmhSMGZ0YmMzN1ZWZnNWaFV0?=
 =?utf-8?B?c3V1a1lMNzBXSVVaNVhvNk8rRnBKTkxSV2JsTFBnZlRSM1p2UEliam9qM1BX?=
 =?utf-8?B?QUxvRTZkUlVWWVZkTldxQnF4a1FpenJxdjZpRWpGaXhIM3c0a2NtNURaTmNp?=
 =?utf-8?B?NnhKcEtpUWkrUGxVUWw2Q0k1aUFrUElLUWRMYTE4RlQyT0VVTUF1Yncvb2xr?=
 =?utf-8?B?bU5wSy94RDBTVkVFVWlsdWg0d1hTeGo3WDBVSitIbWJDRVlId0lJc0tnUHEw?=
 =?utf-8?B?bDlZZkdibEJocXV5Sm5lb2huOGs0WXhqd2ZDYlo1b05XQXVDc2ViKzhETm9C?=
 =?utf-8?B?Q0hkUFNMSkRyZU5MbmlSeXc2aFc0YmxwNWs0Tmt1dXorQnlBUWRpajl1MndM?=
 =?utf-8?B?MTlsZDFNMUVVY1BZNHB1WnlLSVB2NXJ1ZDc4TS9sSzlOd2FwRDQ2YmNicGxY?=
 =?utf-8?B?SkZVbld1YUFWd0w4S2dHZWJTZnJHVTltR2JPaVkzb2NNZSt2Y050MUp1amVh?=
 =?utf-8?B?MUhPK0dndTFBdUxWSWhhME04R2c1bTAzOUtqZFY2WmlBdXhBMSs5RzY4RFYz?=
 =?utf-8?B?Zmp6VFZtMUo4TURlb0VsM2VvWE9rNTB3Sm5yZkVadnpxUkZzbTRobWcwOUpE?=
 =?utf-8?B?R3hqLzdvVHZhby9VSVlRU2poTUFUNDQySlhRVERWSVEwbHpwMENFUnBCMjYy?=
 =?utf-8?B?SXBFK0I2NmRuZWhhNDhGdVhQN0I4Z2plS0tiUU1WcVk3ZHBreUR3Qk5maDl6?=
 =?utf-8?B?R1dVTmMzRkFjQU1jU1djS0pzR2hLZFpab0tqTithdlRwc21KL2NKS3QvajlE?=
 =?utf-8?B?TXo5YTh3MldXbkJJakh1N05rVmhoOXNwYkl5WWduMlFmRDB1OUIvNUlKYUdQ?=
 =?utf-8?B?S1gwRVNKdmNmWXAxMGY1K1F2UGJkSWU5OUtBNnBId24veWtXK2VGbWVGMEMz?=
 =?utf-8?Q?/oS8OzOrjig=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TzFhT20rTTU0dk96VnF0QVhWTTA4bFhkRVlWa2VQcy9vTnprZ0xIZnZiblJo?=
 =?utf-8?B?Y016NlJDSnRYdC9wUExWQzZ2L09veWhZbEwwMTBLa3ZnS2M2OXQ4c0RiRXl2?=
 =?utf-8?B?K0I4U200R2lrKzhiVWZsdWc4Q2NmMy83K0JEWGNXUm9sSUNSSGNoYlFPRlFO?=
 =?utf-8?B?YkFtUjZxUSs0MFVZL0t4QWdOZGp0cjJwSjBnM1FXSWpoR0Jnc0FZaWNDdGJm?=
 =?utf-8?B?ZFhDY0JNTjNtMnF0RC9raUJWejAzRzFnR250cXdZT1l3WUhaYTliU0RoaUxq?=
 =?utf-8?B?K2V0WkZSQWpPazBmdVNzc3ZqWFRydEZzSjRRUTBWdGROMWYvaVBDQzJBaUhw?=
 =?utf-8?B?RFN5WmlXbTdiakhEV0Y2UGNvVEpDTEZYSTRvdkpnanhldjkwUUpvRlpBYlkx?=
 =?utf-8?B?UGVYZVVDR0NSS3B2bU14MG9EVGViazJLb0tOSllwMmZkSHYxeTJCUTVGMlhD?=
 =?utf-8?B?TXFSNkpYTWJ0YXNEQmxTZ2M5TGk2WWxaZlB6eDFWZXVEcnQwYjJJWlhpZ1hP?=
 =?utf-8?B?OWYwQTl4TU52NWdBZVpuendkYko2YWdEK0k0Y0pHNGxtWmtJSjVwNlhQWERQ?=
 =?utf-8?B?cmRpVnhTcE9wNzJyOHlLdnN4Z2I0NmdKTFVyMUhpd1cyVWVuL0xsZTNTN0hj?=
 =?utf-8?B?c2k3K3JTRm90dmpXUm5QNW1BUUx4dXUwZysvbHI3Vjgwa0FoeUozWHA2eTJh?=
 =?utf-8?B?ZDdNTXNoRnFTY3lQWk9OU3lIb0FhaStSUnVPUjBXeEJiQ204QTkyVFR5eTVp?=
 =?utf-8?B?UHRKNGtmYzRpam1pRHExWEdJSGxJR095c28va3FxeC8xZDV3MHUyUnpqa3k3?=
 =?utf-8?B?blF3SEZJM2NHZGJlQXphWWxjV3o3eUxkUm5nZlNkRTh3M2F0azZRTWNGU0NB?=
 =?utf-8?B?SjNwTEV4R1JNODBza0xBaE0wZWJmTU5TcERoWnJhWitqc3FHRW9hNnI3d3dC?=
 =?utf-8?B?dTNqTlVneC9XREJabjEwYWhRRElNeE5UbDNIK2V0cmFWZkljZ1IwU0ZLUklq?=
 =?utf-8?B?UmdlUHBOSmdRMGI2QlFkSDFxUUlLQkxzMnAyRGVDazNoc3hVU2w4bzcraE5n?=
 =?utf-8?B?SS84Ymc5WVlySjdpY2ZSaUhmSDNBRkc1YXFDM3Y1bFNtMzgxWXJBRXZmZXVq?=
 =?utf-8?B?dlUwWmUwN3hTUnpSLzgwM2VJZHlrNjl4OE1QR2ZFR1JuZy9SSjl0bGJCekR2?=
 =?utf-8?B?MFZvNkxqZzdBcytwRTBJS3pxckx2NUp3Uy9WR1ZWSldHUS9hVWJ6NUVPcTZk?=
 =?utf-8?B?MmdIZkg3NWhyRmhYSTBpejI3amlMQzlsVnhTeUhUYlF5SkJSQUNOeHVzMjJE?=
 =?utf-8?B?RGg5U294VXB2ZG9QNVZUZWR6SFNhMnBwNUxORGo4OUxXV2lZOUtmajArRDN1?=
 =?utf-8?B?MFBiOXNMM3NqeEFpNXFyK3UyTmJQQXFjQUw4Z1IvdWZWOUlIcEtiL3V3UXlO?=
 =?utf-8?B?VjljT01jSTcrcUNieGFLekZReEtHdCtwRDgxcElOWnQzSWZnMWczdmJhYjJX?=
 =?utf-8?B?bHdyQlBJeHUvUStDUWd3OXhqQ0Z5bkxhOFd6VGE4aGNwVVlPNk56cG1kQVlv?=
 =?utf-8?B?V291bUVBMGU2bjF0ZjY1UWhaTUdPYkR0eVR2MnI2VDE0QkFmTjZxam5HdWJs?=
 =?utf-8?B?SVFLZ3dxaW5GcHB3TnJwTkRCQ2VYZzZ6aG5sVGx3d1hLQ0lBYU0vYnBSTHp0?=
 =?utf-8?B?STlUd1JIU3VIcWdYcE9KQjlYMWdaYzRtRk56Z0pCVHUzRWUxMkpvYUdRUXB4?=
 =?utf-8?B?VFZvQVI5Q2lCdHUxVGQvUW5ZVkFleEVra3pmdTN1ZWMrZ1BhWkRGMmV5d3kx?=
 =?utf-8?B?Yy9Ub0NUWjkycHd2NVRPeENOcktrUWZoZmJ5Q2M3T1JEem9hUTFYZ2NLdkt5?=
 =?utf-8?B?NmhNSFZyc3BzNzdqL2hnejJSOGZQR3RYOTlTVnJKdXVzWWhvV1pLYVc1V05t?=
 =?utf-8?B?Rkh3b3NoYjRzNXdwQkxGQTk3UCtoV0dJcVJYbkQwTnU5SytMTmx5SUgyYmZu?=
 =?utf-8?B?ays4MXQzNUpFb0FJQTFYdHB4ZU5IRmlmeis1RmphMDY2UVNrU1dvbXdQVWdj?=
 =?utf-8?B?dWpnay9JcHgzQVMyZy9kZ3dzRXhVWEFGTitFVkRraXQ4cVlaOTBDSkhvemNZ?=
 =?utf-8?B?SDlQaHYwSy8vUWQzRmo3cEtEb3VtWXVoRkFvVllJdjFHWCtDRmpHYlZXaERj?=
 =?utf-8?Q?QOF1VqulEN1uAG0Ojf2okLK2kTY3R8nXIV+jbg6GLCyj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32d02dc5-d20e-4563-5ff9-08dd92443120
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 17:32:53.9474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DiFIHZYNWRCz8C1COkymm01vsa9Ki+XmbboRa0B3r9S09BlUn9YEyl/qqb7z2VTjl0GWaoD+u5edO3MRSta8Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6293

Hi Thomas,

On 30/04/2025 13:48, Thomas Gleixner wrote:
> Use the new guards to get and lock the interrupt descriptor and tidy up the
> code.
> 
> No functional change.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---
> V2a: Fix the return value for the on/off paths - Jiry
> ---
>   kernel/irq/manage.c |   65 ++++++++++++++++++++++++----------------------------
>   1 file changed, 30 insertions(+), 35 deletions(-)
> 
> --- a/kernel/irq/manage.c
> +++ b/kernel/irq/manage.c
> @@ -846,45 +846,40 @@ static int set_irq_wake_real(unsigned in
>    */
>   int irq_set_irq_wake(unsigned int irq, unsigned int on)
>   {
> -	unsigned long flags;
> -	struct irq_desc *desc = irq_get_desc_buslock(irq, &flags, IRQ_GET_DESC_CHECK_GLOBAL);
> -	int ret = 0;
> +	scoped_irqdesc_get_and_lock(irq, IRQ_GET_DESC_CHECK_GLOBAL) {


I noticed a suspend regression on some of our Tegra boards and bisect 
pointed to this commit. I made the following change and this does appear 
to fix it ...

diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index 2861e11acf3a..c94837382037 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -846,7 +846,7 @@ static int set_irq_wake_real(unsigned int irq, 
unsigned int on)
   */
  int irq_set_irq_wake(unsigned int irq, unsigned int on)
  {
-       scoped_irqdesc_get_and_lock(irq, IRQ_GET_DESC_CHECK_GLOBAL) {
+       scoped_irqdesc_get_and_buslock(irq, IRQ_GET_DESC_CHECK_GLOBAL) {
                 struct irq_desc *desc = scoped_irqdesc;
                 int ret = 0;

Hence, I wanted to ask if this should still be using the buslock scope here?

Thanks!
Jon

-- 
nvpublic

