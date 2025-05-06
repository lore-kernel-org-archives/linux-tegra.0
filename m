Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2075.outbound.protection.outlook.com [40.107.243.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A2827935D;
	Tue,  6 May 2025 11:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746529758; cv=fail; b=eQx4X9QEPIOX5POW8AaRlnVg5yBnonmVlZmmd6s+JzukTSqRLSrJGpIUwfwx7mwz96bd44oi/vc7QZIjrOXSMvGK5nwzWs6FD0J5rBJbE1+Rr/e7B0nGFABlz0EdFw4bUJBl/A/BVHKutqUNPOt+w941lytzyiZrw4tdyWxiOOY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746529758; c=relaxed/simple;
	bh=lyvalV+uevY+cvYwIQr8eAOmi0jq2WurI1P/INcrBRs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oVyHLvzrQx/ph9cw7qxb29nip6tkf6Q5r/uaovt0W/fuwtgYcklOWgBGznbo2rYB1NUNqdMWl5hPz2f44A3ayrFcbGVtR+YydS9gsSe7mkVcjVeUH4S6q0Qx9QUdUEeyX9e7cIaWwqO394T6M+Jr/u5+haSvp22z1uJqZFlnM7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IMQ9f5BB; arc=fail smtp.client-ip=40.107.243.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IMQ9f5BB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=beWuhLUP+P13TleV7jjKO7Bdq0Ifb74bzkXr988PGhz7eNlws0K2iiIWGrJ/74mkO7qnF4ksdWyheFUT/6bkJ16ZKbEWt8J2tV5/K2xfgABBEKUUPEzo36T3rNDxvSRGSfeM6EjccK7WlvR5a14jfuFSV8GcHaoo4up6Ka7slJD0rLUBdJtHTy5EpkpyXUbdnkzZIDGfXKCipgJ7CYjye6x7qGCEriEOyBTL8E/RvzxuQ9vhn5qqXpxdOWaJ3/5Fji5WNacYnOWamD7x8ZJf/GLpL4H5Ba0JOhvD3+yA9NqhVyA0vWykk8Ia1BO6iqOi/bLDW+ZABBbQNjuJXXbLwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tjnKcJBZbjMOyoFYtbB0XSNRaMXSGS/+bF65FG80aag=;
 b=ABDdgBwL9mzZfmjjK+U5ic00tWloLwIbVis/SUoQeQpgG6jyJ06Uv/3hbiDoFUx7uoowNDLMQTszXOWuodD7Ta9kO7nt7KX7AW+08nyn41i/GkNDGxX1vKaHVkEHLZk4td4Hl6n4dKg+wAm9BRExNnocOS2lsDq0UmP5NPmKh1QhAN6fVJFK9yl4WG03zF62xD909SL4dRxY+AomkjRJH+d9mDLqfubPOKNTt7Tz+I/vlJQqcjVAsFqPfjPJEWktTqLZWiH7QmGanIawlLIW9LIuiSbOe0OTtUDE+dM2NiasV9ldav6y7eT6w6zJbEfP6bqD8pT00LL8UfJPPzC1TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tjnKcJBZbjMOyoFYtbB0XSNRaMXSGS/+bF65FG80aag=;
 b=IMQ9f5BBW/hzurYbV8BT8hc/s/YpwkoGQ6rlxsikBAJ5cygcyWO9ohzVWtnI3LgIu48Xxx+eCovBPixRr5D+5WTili8/Fnc9kDITvK9z7KRxglAPVMwbNUpf66jzBZgJqVPzOqAI+2BS4mPpKnSL1508lkuuAr1A/fx/aV9pyjt0o9mg/TiyqBp87YHIS0MLT6rm0QK4rVM6aDtPDRyTUVeWWdncCNs2nmiU9izRjgZlsinUi1pY7NQPLuvLFQmmY6dncGAGQSZ9fgmox7f9nnjo5QH4p4BWTny1kKVaP3rDW89jCRR7ifQ297a4sw6OXVnP4bB7oo7XUbh5Cz2piQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by SN7PR12MB6863.namprd12.prod.outlook.com (2603:10b6:806:264::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Tue, 6 May
 2025 11:09:09 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%3]) with mapi id 15.20.8699.022; Tue, 6 May 2025
 11:09:09 +0000
Message-ID: <a9898a59-2dba-4ffd-a535-893eb989efc8@nvidia.com>
Date: Tue, 6 May 2025 12:09:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: tegra: xusb: Default otg mode to peripheral
To: webgeek1234@gmail.com, JC Kuo <jckuo@nvidia.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250404-xusb-peripheral-v1-1-99c184b9bf5f@gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20250404-xusb-peripheral-v1-1-99c184b9bf5f@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0368.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::20) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|SN7PR12MB6863:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a00ca14-d02b-4456-dec1-08dd8c8e6c4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q1ZsTUhYU25Wc1NuNXYxS2pMWEhaSHdYOVA0NHUzb1YxMTkzS0ppL0FWcG9V?=
 =?utf-8?B?ampRLzBycy82eG9uV3BlOE9lcm5CK0lvT1lORlM5Q3QwRklpbDJsQlNCZys1?=
 =?utf-8?B?bmhVMEp2TDdnR3FDZVpFNG42OUhRY0xlaVFDbHJ5ck5Dbk55ZDZTSDlBV1FT?=
 =?utf-8?B?Qnc3OU90cnB2V3k5ckhkZWhBd2RJT1VvTHozSkVvV2xPSE5NSFRGWXJrOTZD?=
 =?utf-8?B?ekI0SmIwdG9WTUVuOG5ydysyVU52NmVwN0xydnNxWWNqdlJFMWNwSjVoTHZS?=
 =?utf-8?B?cEFuZld1WEovVGVOQW5HdS9xaHovZEF1SjVuT3ZFSFJDaUdIYzFhZnRkM21T?=
 =?utf-8?B?elhITE1lV3JKcTU4REVTNitJMENBTTRHT3NsWHBaejQydmV2R0g5VEVnN0pt?=
 =?utf-8?B?bVhweWJGRzI5WithVFJTcWlKRlR3c0s1cmJQMjNOYXgzNjl6L3BwTndMWFdD?=
 =?utf-8?B?WFFhUDNObTlVQ0l5WERmMEsxZ1FtZ2JncWxpRHFKRTBDRm5YTXNDdHZIM0RI?=
 =?utf-8?B?TGFlRXkwd0VTU1NOTWp1dkxTN1hCUFhFVW1ZN2JDaW1FRmMyamloaEVtNFVF?=
 =?utf-8?B?dnRyc0ladUN3amFjUW9nWlg2eHAwZEZVdmNvWkxKL2tPRHhVOVVxNXdDNlRt?=
 =?utf-8?B?U3N4dXhUVWFMSDZ3NWFIRmhReVEwU2UwMGRtTHRhU3pGb1NGK3FmU1Bzek9O?=
 =?utf-8?B?NlRrVDFCeS80b0QxbGY1MmtqUEtOY3ZFQnpoQnp0aXVHSzNWcHNhNVdQVmxu?=
 =?utf-8?B?dy9xQUJicFdsWndxVUF1R2Y3emU1WnpoTEp1S0VlMk5ZQXAvUXRxQm5HVTlB?=
 =?utf-8?B?aVN1YXJPcnhyVFlNYWlXcDlvL0UxUTlGTHRVY3RDeGgxMVJUS2JDRkFMM0V4?=
 =?utf-8?B?Y0hTNWFab1liWERpNHljcFRXaGJiZ1dMakpwaDRZd0ZZVkdUWGtxSHpYR3k3?=
 =?utf-8?B?YjZqajkwSkU5aWYwNFRLaGlmSlJoMGFJdk1nUHMrZDZuT0s5MWd2bXl2NXp3?=
 =?utf-8?B?cnR5eHVna04vR1lhVU0rSUxIWXJWRjJKTFNLKytTWEpQWDR5VjhaNFgyZ0lI?=
 =?utf-8?B?MlJrSDZTK245Z3JsdEtadmcxSWhyVkNhM1NsWmVUTzliekRQWFBJaGhtOTVZ?=
 =?utf-8?B?cTdIbTBhaTl6TUU1N2xpM0hWb3M1QzE0KzdQejVMR2JTVlREcG01OXpSV3gw?=
 =?utf-8?B?WWg5YXJGR0x6WGxSVVR5UzZZV1dMWmVCakhRMGZXS3RqY0V1MnJVcFhhQisx?=
 =?utf-8?B?ZVFIeGpUZS8zZlgzOVdkMStUR3ZQU1FvNUxyV3daMVdGRmNvRXR5ZFVPMkJq?=
 =?utf-8?B?T1ErN1VhY3VlclZvbDVkTVE3RUdpc0FhSm1HRnRLcTh0bFMvSnJVNDNRMUhV?=
 =?utf-8?B?NGUySG9UMGpSNm0xbU82ODY0SWw3TEoxdjdDTGtjejdGUDhlVGFZdW9ySEhW?=
 =?utf-8?B?NGx1cko4ZXE5QU51K21YZ01RQWtySXE0VmlDeUt0cUhsZ3V1Q1NhTTIreERn?=
 =?utf-8?B?LzlpNldGK2I4bjd5YklvQ1FmeHNiVVdBOTZOWlYvK05wV3AxeE5PZ3E3aFAv?=
 =?utf-8?B?ajFQRTNLYitNekFwZWY4MUd1cC9vRTMvbTZkNXVCclJOTk5LQzdWSk9heHJw?=
 =?utf-8?B?RGJoVU9Lc0VUNWNnYlp4emhMRE5aMXQxc0R4M3VUbndDV243T1B0a2I5d0JT?=
 =?utf-8?B?YmlyVElnVkVWdHR3Q0dLa3M3bTlFM2VvUE0yS2ZJR0Q4QXhnWkVySnJaK2Yy?=
 =?utf-8?B?OVhjZ0tHVjZDZDNyTGhpVER6YnJ2b3dnLzR6b3VxcE5PRlVaNVBuOEd2UGlI?=
 =?utf-8?B?WnVQTCs3REMwSEFIaGFsdm5PSWxjWERDR1FsYnBWd21CSnpjVTBuNUhPak9P?=
 =?utf-8?B?RVdYL1RQOG9vSDdvZHkzMjh6L1ZTV2k4ZFFOSGJLcW1KVURqd3RZSGhWVmZx?=
 =?utf-8?Q?9aBs1eg/InU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Nzd4WUs3c0tHbm9ra2dBUVBvK3ZaaHlyckNpbFZ1b3RYQkFTT3hmaUZEa3k5?=
 =?utf-8?B?N2hERVFpL2VhNVZiNDJnSDRUcWJyZDM0bXlrZEozWUNTOEVVTkFlb2NoZHUr?=
 =?utf-8?B?Qnl2OWF0MW5aTnMwdzREaFU0Rk9xNXhNaVFEbS9UQ3JYTEY4MVowNk53cC81?=
 =?utf-8?B?aEppaWVMelhHZ29zOFVXRWF2WjE1S1Fwb0hkaUYrVCt3T3VGT05hM01uTHFr?=
 =?utf-8?B?NnQ1b0RuT1lBN2dac3Q1MlBvTkYvdER4RVlNSTkrSVhSRFQzQTd4QnJncXNH?=
 =?utf-8?B?MzlPdG8rdWtqeDVKbDRMQWZ1NVNxcVdpWnhmS1F3OGRrcmRVMVpBKy9Ocjk2?=
 =?utf-8?B?K3VFQ05FRnhHaUN3aXIxZ1NOU2VGd0tHaEhEcWZxZTZPVWc1M0QvZDNNMlRk?=
 =?utf-8?B?RWE3cW9adGhXTVhNRk1KdHRpb3Zsb0dVRTQ1U0JvY0lJQXFvWTVKdmY0VVFx?=
 =?utf-8?B?Wk9IWlk4Y0RDUW5MOTVKMWJhTmZnMnJqZHlPa3MwM2JTbDg0ZkxIb0NrM2Jh?=
 =?utf-8?B?QnFNd2RTSmhjYVRVWk1BOVk5RjhHOXY0TkV1clo3aDJPY21DY0U5ZTlITDZU?=
 =?utf-8?B?SU5WMUlSb1hHMFZFOTRVK0xSU2dJZktKbXBCRFdDSklHb0liempIS2F5dHJ0?=
 =?utf-8?B?NHNRVFk2UitWb29tbXFYZXpXcFRPWk1CTlIranV2eS9qYXl4bXFYbXBZK2ZM?=
 =?utf-8?B?SU0yRTkrblpnRVhDMmhpeHFjeUwwdVM0RTBWWEdCb3B1cjN4ZnhLbElPTFo2?=
 =?utf-8?B?dFZ4U2d5UkcrVHpuZy9vQXFJMks3ZWdCNzhqSkROQjlDSlpneXpXNjBhcnRu?=
 =?utf-8?B?OC82dW5JaTNPZUlTZkplZDJGSTltK0k3aEFHVFNRNkVkYlhiSkZqTFo2cXdF?=
 =?utf-8?B?SEQ3SHRqb2kzR1hFUjkxbnIvaEh4dW9IdE5kSHloQ2ZRUGVIWkhaQVphRzIz?=
 =?utf-8?B?Z1R0N2NPU3pqZC9iSzlhamxGTTJqKy9TWmpMUnJydFhVRlV6cC9OTkVnNmFw?=
 =?utf-8?B?N1VoRm5sY3Z4Q1FyR1VwZmZwaUtjcGxJbWpXeFJLVTJSVWtKWE84UDVITlEr?=
 =?utf-8?B?Y0lTZlRHNG02TlR1bE1BZWlEQzYybG1zTTNjSEJObGJENkNNMmUvMm1iMGpZ?=
 =?utf-8?B?ZjZ3Yjh3SDg4MTlyNm55SDMrWXFHL3NYUFprUTE1QjJmV3kvRTJma2pBRVB1?=
 =?utf-8?B?MUlBUGlaNk9sU2NwT0liK0NuTVVNekFRSEV1S1JmeTd3bEF0TkJJR3d2N1ht?=
 =?utf-8?B?eFRnVkRCRzFXaEJObUlMTzVQUzRzWlRsRldhdm01N2RCNGF1cXhSL3dKTHg0?=
 =?utf-8?B?aEE5SmtXak1tT2VTSmRtbDR2TWNUQzVIZGxFNEJuMnE5R1RvS09vRXFjYTlh?=
 =?utf-8?B?djAxVkYyTmxabzFHVkkvbjdPMlk4SFg5alQ3Um9yMUJiWmV2bUREVHJyZWdl?=
 =?utf-8?B?ZTV4TVZlSnd1YTB2emVmenNGMVVTOHVNdFh4bFlUUlNaY3k2Mk1hQnlxYWoy?=
 =?utf-8?B?WC84dmJMTEZ1aFFTWHVycjQyVmJ6cHk5MzlXc3Y1ajlhQUVDZXFYWVNmdldL?=
 =?utf-8?B?ZXp1SHJpd0REaEZkcWVmOW1oY2tyK1JXVGtrTllxMk1oVnl5OTFMYVFYc2tK?=
 =?utf-8?B?WkZQRG90MDBOZDlxeHFhWjg3eGtIUk9VMkJIVDJtQ3kvV2Q0SGs3SFdQRmh0?=
 =?utf-8?B?VVA1cW9lbVh2ZFZVYXg4Zk5wSWFmSFVuMHp5eTFFM09BamxvRFFlcys1djR0?=
 =?utf-8?B?WXd5WSsvUnpRdmtUWFhJL1RYRUgrQnhYNDJvSXBPL2tLQ0NEMUwrREFKWVRv?=
 =?utf-8?B?TklKNm1pbTRycE9BSDN5ME4vNTlEMTZkelRHNXNWWU95TkMwSXRuVjVXQnEx?=
 =?utf-8?B?OEJVVDJlTzVUV1B0dG13dmVLR0VlMVNtWGZ5bU1DV29BQTk4LzVocUpVcC96?=
 =?utf-8?B?bkxSd3ZBR3Z5V2Z2UDZqckRtVHB0UGZlNEZ0enNaQjNqNmVzdVF0NUd0WFNi?=
 =?utf-8?B?R0JrWWVleUxad0VyUWQ1YU9hakhQSUx3R0YyQ0svSUxsYWhkRWVBcXpKYVZo?=
 =?utf-8?B?N0UrbC9Ld0ZqNDJvOWVVTVlVamZQMFBtOHZKQlpFSlZ1K05xSnJJODlJVlUx?=
 =?utf-8?B?UW11bGNFcnkzZDVwd3haMWJROUJOZzZlcnAvWUhPb0tHUExnVnc0VTdpQlpL?=
 =?utf-8?Q?5HWR4HgKTlHNG7a1VByVgjrfkwKgx6BY2NrNd+9j1KiH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a00ca14-d02b-4456-dec1-08dd8c8e6c4b
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 11:09:09.1998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nqxw88Jg72/Hq8oITyyS+S35GLaqYPuyUnZZQKvKA4CDSsrmIk9i8YKMqgjxYa9QgZVay5mVstRZ/57WtgSySw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6863



On 04/04/2025 09:17, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
> 
> Currently, if usb-role-switch is set and role-switch-default-mode is
> not, a xusb port will be inoperable until that port is hotplugged,
> because the driver defaults to role none. Instead of requiring all
> devices to set the default mode, assume that the port is primarily
> intended for use in device mode. This assumption already has precedence
> in the synopsys dwc3 driver.
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>   drivers/phy/tegra/xusb.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
> index 79d4814d758d5e1f0e8200d61e131606adbb0e2d..c56e83216d0f566a09b67377172fb04c8406f4cf 100644
> --- a/drivers/phy/tegra/xusb.c
> +++ b/drivers/phy/tegra/xusb.c
> @@ -731,13 +731,11 @@ static void tegra_xusb_parse_usb_role_default_mode(struct tegra_xusb_port *port)
>   
>   	if (mode == USB_DR_MODE_HOST)
>   		role = USB_ROLE_HOST;
> -	else if (mode == USB_DR_MODE_PERIPHERAL)
> +	else
>   		role = USB_ROLE_DEVICE;

It would be simpler to initialise 'role' as USB_ROLE_DEVICE at the start 
of the function instead of USB_ROLE_NONE. A comment would also be good 
to why this is the default.

Jon

-- 
nvpublic

