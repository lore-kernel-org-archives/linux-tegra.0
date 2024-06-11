Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2062.outbound.protection.outlook.com [40.107.244.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DB84AEE9;
	Tue, 11 Jun 2024 16:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718123098; cv=fail; b=CQprb3UGz9rpC0qTt+LLPQTVkZVIFWWP+7+7CU5cVRZWRzidPgItinlih4gQUvu0oI5jiovibrPCqvgCxJQzxJxJI/qlVIWF3sE0lSTggUMR/fDd2kR6I0sahfLbmDrRqewr6r69pAxqc/Yl2a9CBbqBzpM3rmBii2LtIOWM/zo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718123098; c=relaxed/simple;
	bh=afNJdjimEAmWnJ4tXjYYU/9MBhh1lmWGpVRozyS9QCc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JRk3q/is+weuF0dvQy8/DYeE1OkH+pxsZ2YCKEBBe5MEvXoflsnrt/fuYiViexbKXpcP8dhtTL0LCd7ijKL94flN0gaKuHe0npKzFlyUoauvnidNXZF8TdYbK+WW8BbTXBeoMDbugneMGggI+hFjzGWf5y0lbPmJPq7vedWz+aU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cMqXtsT/; arc=fail smtp.client-ip=40.107.244.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cMqXtsT/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jn2wCQbbZISHcZMPQR/4/jU2VlMDydyku4HnCMvQf8N8OXFPEMub/GhNimlKuU6vE0/REtM6SEG62oPZY/EXOSlcTPDHl6/CD7wqdnjlzNYVX6qg/RAPlC7Kahiw3EmqReW+wL7IbdY74MCyKQs4Ve61Nc55NAYD060911Pg3WWZvL2h5ojbSr6CphWc62l6ssoxsy/oOV6Y8f7P+p6kL8jKDTuwyv0OOFwOQkW7M8ujExjVwHf9AVBknQBTMzXZGoc9Dd9iVDfIAioU5TlXGNHsvk0HXwik33ClpdujnrdktO0lrKtuWbNUBLDDw0IFn3151zDfz9ziMBwsIu1PfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d71/Dwv5cOyXFurFNeLY1lZ64fiOkN7Dmra2KxE+TLU=;
 b=FbeckLP1SXo+Gr+kbS7t/zGk2F0iSxMy+fSFFWwpLUxK+aPfQTqiyR9Ljx3Eqnk4Sjx20jhvFONfYFJhLdFpgGcwpILrVT0mF9h2TB41sGO9VEhLbfqeOywHec+yTAc1f+ENqNeqiKrIrjWJ8+Ad4KTQBqzZHSyB5C8NgJr66dJx/a+v1tMJnUIUTUJNy8AYy/VCZvEfVaAbdvWbzExIJq9QODCx9EFBytur8RxdMZm4geYvwrJlgjrsFJXeE0nWauImjxHKaIcSLQfzSQjMFX6WoYoN7i3eG5a2gpL5zegMbh86I/mq7EBXjhWXe7skFnRomCuZAALHbIMV3t1+rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d71/Dwv5cOyXFurFNeLY1lZ64fiOkN7Dmra2KxE+TLU=;
 b=cMqXtsT/jXpmntbKOTxjbg/jJSiVrewCDbit5u6pHQ/d1fHcW3L7ZhnASB9qzOr/bpZGJ7582eJPL/0vPJOho7V10vhzb/fiPK0OqCrbC9IFL90O0wXXzZWdiIrTu/Twp3x4KaMiCuR2snkiB+a32mytLt5/ANrgNA4KU87NZMG8PefwyKsTGqlHlZl1hjus6FDWJ0eNRM7Qhw05utMvgYAJiRoY69hSAvZJtiU0GD3whQ2YDnLo8vc4C0DB5OlRyLzGLeZiQlwvewcsv1hmPSOXKZnc1WCMTekA3R0zR2X+VB2r5Qhs8FEMCkRVy8XiQkqBrqjjbvTyxHQvseZxkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA1PR12MB6604.namprd12.prod.outlook.com (2603:10b6:208:3a0::7)
 by PH7PR12MB7378.namprd12.prod.outlook.com (2603:10b6:510:20d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Tue, 11 Jun
 2024 16:24:53 +0000
Received: from IA1PR12MB6604.namprd12.prod.outlook.com
 ([fe80::d4cd:4112:1ce8:7f3d]) by IA1PR12MB6604.namprd12.prod.outlook.com
 ([fe80::d4cd:4112:1ce8:7f3d%6]) with mapi id 15.20.7633.037; Tue, 11 Jun 2024
 16:24:51 +0000
Message-ID: <92059885-858c-4a07-9e2d-cda10c6c38bf@nvidia.com>
Date: Tue, 11 Jun 2024 09:24:48 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hte: tegra-194: add missing MODULE_DESCRIPTION() macro
To: Jeff Johnson <quic_jjohnson@quicinc.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: timestamp@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20240603-md-hte-tegra194-test-v1-1-83c959a0afdd@quicinc.com>
Content-Language: en-US
X-Nvconfidentiality: public
From: Dipen Patel <dipenp@nvidia.com>
In-Reply-To: <20240603-md-hte-tegra194-test-v1-1-83c959a0afdd@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR02CA0017.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::30) To IA1PR12MB6604.namprd12.prod.outlook.com
 (2603:10b6:208:3a0::7)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6604:EE_|PH7PR12MB7378:EE_
X-MS-Office365-Filtering-Correlation-Id: 296c6790-2b80-49b6-b808-08dc8a3304fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230032|376006|366008|1800799016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OCt4RFB2djZzU29EdEs3YVNNeEZwZDN4TzhndVN5ckxKN1RyYkZ0SEp1MGJE?=
 =?utf-8?B?ZlN6QkU3VXVFcVlsNmE0N0dDeXJYc1MyakFXMHhJSVRQblFjU2lObkpFTjZn?=
 =?utf-8?B?OUdsQWRENXJVZHlRNUhoY3Zvc3Jqd29mSnVUNkQvOXB4M2Q5YUZ4ZWZHTWFK?=
 =?utf-8?B?L0RibE5ZUE52YVFiQ0RrM2Y2WXlBWEcvSzd5RmVoTzRUV0NERmIxZlZNb2Qz?=
 =?utf-8?B?V2FPbktSOTZVUGgyaFpEYjRDU3dGajA2VkJLQjlVYkZ6N2VNeVo3ZFVYcTB4?=
 =?utf-8?B?b0ZiNXprVVJnaW5NZ3VDeTUxUnprSU1EaVNpZlRtZHd2aXkwTjVIMXpnSXlv?=
 =?utf-8?B?K2xiTUVQdDFaWm1sTEluVUo0MnF2SDhoSHp4Q0ladUJ6VC9xSVdPMkJVclNl?=
 =?utf-8?B?aU1adE5LNTR4TFJIcm9OdFo3b2FQQXlxVkh5d1hBUDNSQzdKd0JBWWdBR3RK?=
 =?utf-8?B?cTJJT29KVDRhSVZ5L3Erd2QzY0pHcjA3QUV5VGZINHgydDNTSFlMbzNQSkNK?=
 =?utf-8?B?Tkg2Q1hOdGVwbXI4aG9VVUpIYXY3TitJUFpONDEzTmNVUUxWNlowS0UzbzY0?=
 =?utf-8?B?RC81SE02WE8xT1dpdDg4ZFEvM2VIWFJXTzBHbUFjeG5ZeGtzZEVlc0toWUgy?=
 =?utf-8?B?eVl0TFczcDVIVGtsNDdWSFdxS296bnpMQzZPWE9JZGRCNDFCdjN6MkNNMnBF?=
 =?utf-8?B?dzJiSlBscEQ4T1QzcktDZ2VqM29iT1l5Z0dNQnNyOEFuOWovR0YzK3BMOGw3?=
 =?utf-8?B?OWJ6S3lNVThNQlc4U05lZVdwTVV1b2hFZEVPS2Ftbkx1SVRUTTMyMksza0o1?=
 =?utf-8?B?ZjdCMFd3SXpabGNpa0Q1RE5SbzNNQmZEQkRIcng0UUN6NVRmdE1wVmhuZG5y?=
 =?utf-8?B?ZjhHSTd4SkwrVmU3QXNuOWZrNWZLSGQ3QUxHMHhxWnhDNWdxUkh0bHhrVlFx?=
 =?utf-8?B?RUl1anlEVWdybmFhNVR6S3B3bk51L01wMG1pRnFuZXFEUWx4YlphdGZhemVI?=
 =?utf-8?B?ZVY2TU5YMmJzdWhpMW90eStRUm1JZXFCOEZDRGNLMFZGUEcwSW8zNFJNRzdS?=
 =?utf-8?B?NFhtVDNscmlKYXJ2L3BZSFNoTHYvN0xVL3FiTi9IdE95dHhjaG5IVEZlUHBU?=
 =?utf-8?B?RmJMQ1NFZkRXRnRzMDFGV3NXYzFPb0k0MEpMU0Y0d0lWMEdBajQyN3RIUVN1?=
 =?utf-8?B?K0VJQWxUZmFoekpEZTJDTGQ0NU8wZFpBRWN0MnJRa2Z1d05kVkNNUWhrOGJW?=
 =?utf-8?B?SXdrdm93bEZGa2hOckdQblMwcjR4VTc5V093aEhMbHZkNTBzbnZkSVpHZG5w?=
 =?utf-8?B?SGtNYS9teFEvVHZSMEZpMW0ySmZDMWttUTZQU2poc3E5OUMxSm1ySmY2ZC9J?=
 =?utf-8?B?bFdjdEQvLzhKMzRqM3pOaEpMUFp4c2ZCVVlrOU1KV05rcThUTjk3UUppU0Vu?=
 =?utf-8?B?WDIyTDJBUGxyWlg5YnRZYTgrMjIwVFJWMzdiaVc5MjluYng0TDhTaVBDeGhC?=
 =?utf-8?B?d0lFamhHaUNsU0w4YTZnL0hqUWtkeUNMcHNzZEZiM2RvSXdxUmpOV2J3Q253?=
 =?utf-8?B?S09wMFc2dnBGQzRTR3FxdGtoUkhaSGlnN1RFM1V2cXVuemNCV2dmcWVCMUxu?=
 =?utf-8?B?RnVpamdUUjZ2UitDSXNDeFNkNDBQdk1UQlVzK1Y5akhXOHBYU0VzWGVZOWhN?=
 =?utf-8?B?UEhyUEd1SXV5WEpYSis0NHZwVFdNaVVXMWp5dFBrK2lVNHQrZUtaSEFtRGNn?=
 =?utf-8?Q?G+/nuVPpc+uSXazIUziZThSChCOT5M+2T/fqDjb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6604.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230032)(376006)(366008)(1800799016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmxzQ2hwV3dJK0paWFhHTEYyS2RCZUZDWml0RG50TnFkc1g0blEyVnRhK3Nx?=
 =?utf-8?B?RzNHblVvdWp0eG1oRnlvOUcrWDhuM2NScTlyVHBPeGVrRDQzbEg5U0F3a2ky?=
 =?utf-8?B?a0tQakhkaGlqRnVsRjJHN2Nwb1hLUmdLMU1vZ3hjRW5RcnAzZmh2Y0QxRUgv?=
 =?utf-8?B?c0h4RVY4RThDWGZVQVkzTDdITTlLQTUzQk9hN3NhKzNJOVFScDB2dHJjSTgw?=
 =?utf-8?B?djZnY2JvbmUzd0RXYlFsMlJndjVpS21Ka0tJS01ub3dmSi9lWDJCTWxDc0Z2?=
 =?utf-8?B?blpwYXB6MXc3Z1FMMElDbHN1M0JMQysxdmxuY0ZTcENtVHAyRVRsd2dYRUcw?=
 =?utf-8?B?K1JKaUxWK1gzWEdvbDdkTnNKMWlHdHpZYThkM2JwaGkvTXVtd1VOT1B1emQy?=
 =?utf-8?B?ZlZqdStHY215UWhqU0Z0bGo2aS9GeEU0RmhSMWV3OXY5bnBnK1pCN1pHWWdP?=
 =?utf-8?B?ZndlSGovYktBVnhzTEY1UnlvbVR1aVB0Q2hicGkrMGhiODZJQVZOejdPQzRV?=
 =?utf-8?B?N2gwc1FMUXNhR08va0xmcEJXZFFWNGFERHA2bkdqTmhvV2I0OVd3bHNCcFFY?=
 =?utf-8?B?Z3hicW4vd0hMMTVCYmF2MS90VU5LOXZRcUFIVTNlR1hjVmlvSFBVQTRmZStW?=
 =?utf-8?B?bkJaTFExUHlvVGxMS0JRN0lzU2N6dE1XU3RxYzg1RXo5Ym9TckQvK3pSL3Bv?=
 =?utf-8?B?bkREcGROeCtBVEIwYUZBbHB1VDNLbUdFZGhWWHVoQWM3ZE4zVitwVk4xR2Mv?=
 =?utf-8?B?d2ZDdEI0M3ZRZFFURjRHRVhWNVd4UndGTnFLMGFXaWZ3SnROelU1SEhrMU9o?=
 =?utf-8?B?cDRZNnAvaWp0aVA1R203RjEyWXJhR1p5QTJMbHVwcW1GUXBscURpSmJKKzQy?=
 =?utf-8?B?UUoxMkdGZ3o0TGpXRGl5WDZtTTQ4eDl6TXVnMDNQZGJPcmErUENzRkp6YVhv?=
 =?utf-8?B?c1NIMkRFNjBCR3UxeUpNTXVxRzVXckk4d3IyOXRlZFV2REhXWmxRMjE0OEJ2?=
 =?utf-8?B?YTFjZC9pQTdCbTdDcWhZb2lxeUJNQU5EUG9ORGUxS2tsV2dOVzV6VzhlYmRI?=
 =?utf-8?B?VEplc0EzSjhZQTdpV0FTR01YRmdWSnFJMDBpZHpWWVBNdEg5WlNud3AwUGlO?=
 =?utf-8?B?bmxXcVVjR1dvMzdoOVI0YUp6QmdOV2RMQ0VnenFUaUlOdDdvNWNPd1ZLeFBp?=
 =?utf-8?B?a3pUOVdXNUNwc1RUMU9hZTV1QmJtTmNYT1gvQnhIanF4Ky9MVndOeURPQ3F3?=
 =?utf-8?B?Q3pRUlBrWkxJVEdmaEVBN3JZN3ZkbGlVa0QwWFhWQTZxdVZOUS9CTU8wTmJH?=
 =?utf-8?B?K1FMUklqVk5Ia21QN0JNY2VWR3JYb0lMTHZJdmhxcktYd1ZpVXlENGhXT1BX?=
 =?utf-8?B?Q0JYTUp5ZjBBSnU3OERib3l3dTNpZXJoSFpKUGVNUGpPSCswTDBwS1VPK1lH?=
 =?utf-8?B?a1FhVkZwR2FpV1RnUG1NKyswMXlZY3E0dW5DTXM3bld4c2hDZGdXOERPSDhQ?=
 =?utf-8?B?ZTRFdFMvSTR4NzJCd1l2eWY5YnFPSmliWlgvYVhGY1NZU1V6ell3OENYeG9w?=
 =?utf-8?B?V2s0a1p3NTRna3o4ekdrT0dIaERMZURTMjUrTER0U1VBemdSUjNMYUNIMjNC?=
 =?utf-8?B?S25GRUdmSnorZyt0SytPVngzcjc3bFZURGhoNDJBZFpya3NWU3ZkZTQ2M2tk?=
 =?utf-8?B?alRZdVp6Ly92R0xYd1gzVWJ4RU91QlFjbzZleUpoQkdEYVpuMXdUUzVObFZD?=
 =?utf-8?B?YWV6Q0dybTlxdjdYcHhFN3pjOUJTY0pjZ0tsV3NDb0lKbTVWRGJKNEloUnlF?=
 =?utf-8?B?ZklNSG56M3VqOUlBNERmRlJMbUthaFh1MXdpYzRsQ3BPL3U3SWpvb0gxZVND?=
 =?utf-8?B?ZktxSk90VzBjY1I2REFkanA0SFdqMkd1cllGMlFYOXdHeHE4S1lVbG9kRFNT?=
 =?utf-8?B?K1ArSEk4bDIxV0lvSTdFdklvd1NsNWh5b1pYK2JHeDJ3bmlFSzA2SEp4aXlQ?=
 =?utf-8?B?UmdZdVhkRmJ3anFXOGZhaFdhZ2ZYRFhYd2R5VTNxQzhoUGp1cHNCaS91UjZk?=
 =?utf-8?B?bVRwRUFYZFNnVzMyR0JTWkhOK3JFTEpSWWZobnJLWExiMTZQK2c0QTBVUE14?=
 =?utf-8?Q?OsS6MMYCx7FgoM68Vk/dz7PKY?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 296c6790-2b80-49b6-b808-08dc8a3304fd
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6604.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2024 16:24:51.3559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L8IVorB9iiVYurkgXibSa8oqkwALGqh/Z3iwJJ2iiAY7VsPANoX1k5iZUmtnz+qAwEPhHFcdfYAkaWjyvainFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7378

On 6/3/24 4:22 PM, Jeff Johnson wrote:
> make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hte/hte-tegra194-test.o
> 
> Add the missing invocation of the MODULE_DESCRIPTION() macro.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
>  drivers/hte/hte-tegra194-test.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hte/hte-tegra194-test.c b/drivers/hte/hte-tegra194-test.c
> index 8ee038ccf601..df631b5100d2 100644
> --- a/drivers/hte/hte-tegra194-test.c
> +++ b/drivers/hte/hte-tegra194-test.c
> @@ -235,4 +235,5 @@ static struct platform_driver tegra_hte_test_driver = {
>  module_platform_driver(tegra_hte_test_driver);
>  
>  MODULE_AUTHOR("Dipen Patel <dipenp@nvidia.com>");
> +MODULE_DESCRIPTION("NVIDIA Tegra HTE (Hardware Timestamping Engine) test driver");
>  MODULE_LICENSE("GPL");
> 
> ---
> base-commit: a693b9c95abd4947c2d06e05733de5d470ab6586
> change-id: 20240603-md-hte-tegra194-test-668212d1420f
> 
Acked-by: Dipen Patel <dipenp@nvidia.com>
