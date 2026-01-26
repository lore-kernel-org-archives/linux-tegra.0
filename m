Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011057.outbound.protection.outlook.com [40.107.208.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8B922A4E1;
	Mon, 26 Jan 2026 06:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769410278; cv=fail; b=l9morzirIBS4EIVpSBezuah6YLsScYXK42axH1zvbXzqbzYS6n8nB+3Pf7SLYvnkTZYcSvkm2tWxs8f2RH6WsEyNhmnSV4IJV0h0Ye4assfe4BSvQwB0KINCFPVKwHzuw0u2lp5ZSypnqO8Rog0PoxJO/mAdfZqj2fKB92UUHmU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769410278; c=relaxed/simple;
	bh=N7uN/KWZgHBkhWdP2zOUolUQgREziMRLbTadxDJ/Y7Y=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=HTGsum9twPani9+WHKgcA7erd7H/Ce6Zq1RdMIiVm1JBosUYbpS41/e1aLkZ82NxMdIFrr3mOvhWgnayvgJLsK3FoENF0cslvlcAkKbBUnpBPnCc1HAT48B+ffAGb71P02IyBsDFRuBwlTS22xZJ4qlgZpaGMUkF/RQiRI+HYXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kj6whZ5x; arc=fail smtp.client-ip=40.107.208.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kj6whZ5x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T6KqTgnSi5hym4nty7Qqo0eDq7kPLeCWnIvbCXAToCtI6VHi7WDQyK0RWFERNGqogOk0Ue6+lfBgmD6t/nhM6GIMdAx4B7djyh55OMuuzbjJ2SCCe6VSc1bLZAbWkfQH/E9vs3BvOe6l7Nap3HPCtGmcfyaZKhYLv1Vo156DUXdtI5moNEm+W/QDlTnG3p6CAVuJjT2YN+2aVf4idOFcE5eMPHE0mdiM3pF9NO8k01X8eoMutya/36uq0bIY2/hTFz5Kw+2bMLdLsf7AI4UDN3DEJmWvKPPMfd6pYUOaLT7+XRADfWRxNMqhhk7NS8obVvRCPfRkBH50ynhRwNax1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E8+vJ+Ek71ycTM40iGGnPh/i6e6jyuDHTMftUZQXQxA=;
 b=IFi8EIFOfIdwmV1k4KLamaU2UJmn9+E2arIoyTOs8oTWq/3sL8VCtcUFQCAcKbMmaBzC637LzIr4SkEHfehBr4Ku5r6Dt5c91LheoW/ypp1XpPgl+2CFiuIyLluruuu4U2AKD9AvnMgxqmb25jHd5VhBYtH8dBnl1alWHWC9dG4BkHyzcqMVxCQmHyRzkYpMPfLAkWaFzeyV0o01KIH1FVdfZ9swKh6m7WB0Ah7aaIGRuj+V1AW0Z01wds4lObaYJPCMVHvLavijP5kDmb1xkErA+8DNtfIHbnYd2h4V5wqMOawurYLbdLy9WP+h5QspPVYGmfz3cQbIsjC82O0X6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E8+vJ+Ek71ycTM40iGGnPh/i6e6jyuDHTMftUZQXQxA=;
 b=kj6whZ5xBkV6I3/BhV9EEhax9jDRzkkAx0xx3iQ/O1YiMWRqyxF9t153OsAoLVrCvoFEK5s9R6fMQoiSFkVbtyYeRJCOCEHI1uFvNubwCnpguRMKac1x345oDogBku5CYvhcRqo75S9tPWBhffZmzlg0pawboyTSsAIOVvatRrJSwu3kSFBkkmOr8vWP3nYuLEAuOK3dh0TCtaKsm8ZjTUwKM3xpRtpNsVtSVIPzX9B+iizKz6mSUUqre0vPXrtOue6Nu7H5WGvzymSu8x6Kt82vN/+tD/YfLyBYX81P+TpHJhCUvV0gSKyxXvk0iCOPqSFqGP5cDs4ZX4MbANg3bg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB9152.namprd12.prod.outlook.com (2603:10b6:510:2ec::22)
 by SA1PR12MB9490.namprd12.prod.outlook.com (2603:10b6:806:45b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 06:51:14 +0000
Received: from PH7PR12MB9152.namprd12.prod.outlook.com
 ([fe80::fc7a:4d2b:7118:d39c]) by PH7PR12MB9152.namprd12.prod.outlook.com
 ([fe80::fc7a:4d2b:7118:d39c%5]) with mapi id 15.20.9499.004; Mon, 26 Jan 2026
 06:51:14 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH 0/2] memory: tegra: Fix DLL setting in EMC sequences
Date: Mon, 26 Jan 2026 15:50:41 +0900
Message-Id: <20260126-fix-emc-dllchange-v1-0-47ad3bb63262@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQyMz3bTMCt3U3GTdlJwcqIJko7Q0S5OUZHNLCwMloL6ColSgIrCZ0bG
 1tQD6MLIwYwAAAA==
X-Change-ID: 20251126-fix-emc-dllchange-c2ff94dc7980
To: Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
 Svyatoslav Ryhel <clamor95@gmail.com>, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Thierry Reding <treding@nvidia.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P301CA0075.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36f::13) To PH7PR12MB9152.namprd12.prod.outlook.com
 (2603:10b6:510:2ec::22)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB9152:EE_|SA1PR12MB9490:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f1d60da-d192-4d3b-e4dd-08de5ca74c5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S1VzeWxDUnlaRUtUdDVvTGxPT1RPejREcG5XcCtrTGI4Tnp1ZXA2S2NtbTFM?=
 =?utf-8?B?UllVOUhPck9USUxXTXNNUWYyQzZhT1hkcWw4aS9SYWRycTd3RkFZLzlZRzU4?=
 =?utf-8?B?cDlwRHc5ZGNuQjlwUS9BblRocVZaNUFKK0U1RENzS3o1OVU2dHllak4zS2xk?=
 =?utf-8?B?cFJYUm45Nmx1YU1sNVBlcUkyRTRjN09KMXpqYXZSWWxybEgzNzluQk5kS25G?=
 =?utf-8?B?RlBmUUx6c211ZUFjZWMvc2pDZ3F2MngzUTV4OXd3YURvRXJ6dFhQc2RQbFhG?=
 =?utf-8?B?QWNqOEY5WFJUaHVGeDhzVmIvM1BmbHZPYVllMU53OXJJR0o3bmxERklDdHY1?=
 =?utf-8?B?emFJWDc4ZGFrVmNHb0Y3MUxyaGowZFFSODU5ZWQvVDV1RlhXZ0xoNmJ4R0Z3?=
 =?utf-8?B?N0JqcW5CNHhrUDJFZHBqckROWXhLNERqMnBVV3QzL1BjOGdGeGl0QXNFcW1V?=
 =?utf-8?B?M2tsaFgyazVXU01ZM1AzR28yTVJJK2NmOVRNU3ZFU2ZudXo2TnFQVzVIWitW?=
 =?utf-8?B?dEsrUmpuNExkYTdKbER5WVhrS0g4SjJRVU5mQlk4ZUpkUXoxRzhXK2dmQXda?=
 =?utf-8?B?RXM3ak5MVXhYUE1EWklBeHVJSE5uZnNoV25TajlLTExDNzNMNHg2MFRYdVUv?=
 =?utf-8?B?WlZLZjVxT1BhVFdLUnpwR0ZTLzM0OTZQQ1ZUTk9qODJjM0s0dktQUkFUdUhm?=
 =?utf-8?B?ZWNIOWE0N0ZQcGp3c1JhckxOVFUvdE1NTXhPMzFEYTZiaG9DUjRIdUNUazdZ?=
 =?utf-8?B?U1pUOVZiQ3N3MElyaGlVQ09WdHRQTCs1OURnNXFmUTFlWjY3MFY2ZzdkQkk0?=
 =?utf-8?B?cFVRNzBUQXkwSjFiUkFDcTBKZ2E2c2ZETXhWU2dvaGJzODBIY3hGaGhSbUY4?=
 =?utf-8?B?NzhZQUc4YlEyUmVPcFpPQnU1UkFwY1lQLzMxNml0aVNzOTlWUTk4VVJacUlr?=
 =?utf-8?B?RnV5OGV5Z1JGVDZWakdWNWsxZ0NwV25Kam5tMnRueGZxYjM4V1EzbThKakZn?=
 =?utf-8?B?R1U3SG5iMGl0V0twZU1NcGl6dG1QdFRNT2IrbGtzL1BSVUtQelB0VXhGdkR0?=
 =?utf-8?B?NjJvalV5eXFLTkVqMU9ZaUFMOFYxazJHUmY0TXdNNW9wK0JXeWMwZTBkMnJF?=
 =?utf-8?B?RTlGdUFHZDZJOHRaYkl5MkhKTko1NjhrV2JkdER4bXI2Z2ZiRmNQNHRVb1ln?=
 =?utf-8?B?bFZPbzVTU3lWQ2NiVG96dkRBelg5MXNZVU4yRXBuU3JBTUptbGU2TU5WclhF?=
 =?utf-8?B?Umc1Z3lSQ0RmNEdBUnVXRlNlQllVQUJJNXl2ZHhCMWRCelZ3UWViYUJWaUUw?=
 =?utf-8?B?cGg3WWF5UHAweWxzUFVUKzNMRjI2WDg2cGplRzI1RFpWSmpLSUQvVm9TZnAr?=
 =?utf-8?B?ZkpCWmFqMGVEL3dyUFBIazM1TlZFOCtKQjg4VXduTE5vdlJJWGFTckxvUHBx?=
 =?utf-8?B?cDFIbFhzc1p4d3c0SGZGOEJQelVpVW1UTlBFQlY5TEdKRHl6SWM5L3RVSFpF?=
 =?utf-8?B?RXc3VS9XczlHOUt3NTJlVnZub3IzakM2UlB6Qzh1OVZyUS9ONytyQmpPV01L?=
 =?utf-8?B?VGZSNXg2YlY3RXY5YysyUVhsWjdYMUZJTXBQcjRzTU1kdjEzQ1l1NjExMVZT?=
 =?utf-8?B?M1BkR0VEVlJhelRiNzE1NGlmY2VWdmJvU2FPYytOMk5nalZkT2RQVms1Sm43?=
 =?utf-8?B?ZDdQWVJRSUFtQnFINjBuNE55Q0lMaDQvdFdEK1FBdCsya281VlZZT2NCVmxl?=
 =?utf-8?B?eG05ZmNpOFVpdHJ3amcyZFpEVUV3YW96QnVZTEZqTStFK0l0c1BaNWRJbkZM?=
 =?utf-8?B?aUVMUXk5UVBmM3MxSm8wNHpPRXFTbU8xWTRzOEVrb0RQMkNvNU9KS1F1L2E2?=
 =?utf-8?B?L3A0WEdPUi8yWTJXS0NGMFhWVzI2SXlUdE9DbHNIKzFnWE9oRzlpZVRiTDNw?=
 =?utf-8?B?c296VU5pU0xpWWVmeGx4dWQzVFgvT3Z6aGQrS2piUHB0eW5YY09QczZpdnB4?=
 =?utf-8?B?amUwYyttUWJxM3Y5LzBvZFRvbVlzN0VpVkRZOTBBUmpCd1BBZkZLa1ljVzdX?=
 =?utf-8?B?eHpmU2toalBWaGU5Zld0NExqV2VjbzZrUHdPRDhiVWdNQXVLbWd6MWVNRkpF?=
 =?utf-8?Q?Ve54=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB9152.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWVzTWJWVjVUbFowMEFFSDkrektNbW9vU0hwUE44eHR5eE9IT0sycDN3eW8x?=
 =?utf-8?B?UzkxUkI4SmtzeTd0cHYzQXlhS3JibWFiYVJOalp5VC8vQk5Bb1RvL0lkRmJG?=
 =?utf-8?B?Y3MrWFh6T0NraVN2ck9NeG1nOHRpSUI2TWZ2eTJUNXFHU1drdEdVY0NvdDVH?=
 =?utf-8?B?WEdlc1BKbmtYREwxZ3BvdjZTWDJaT0JvMlpXUWJQSDdrVHVodzJhMm5RTkFI?=
 =?utf-8?B?RzdJUGJSd0JnZXZjUHlxUTkvMnVManpUWkNoQmhUTnd2akt5N0k3UW9henhQ?=
 =?utf-8?B?eTY4NUlQWm5oek1PQURBSnRQZ0Y5dHZnZFJSYytReFlMUGJodkpJclVSRHA4?=
 =?utf-8?B?QWkybUxsdXBLRnl2cDVLRVM5OUVKbTlDVzRJMFdhYm5jbSt5THdXa2NsUzNI?=
 =?utf-8?B?WEpJendNUTFGSmxhd0JJaXR0bDduS0lJd3JqczE0WGFqdFFrdHJHK1F4MnU5?=
 =?utf-8?B?M0I3UlZlcWFkZ1RTRzFaWVI0Rm9UQXVOSDVFa1RRSlF2WDNiVkd2aWFQWWlr?=
 =?utf-8?B?N21YTDRZb2JSQWdYVGN0QW1wV212aHdsZmt0emdlSmc5emhPR21DS3lvY1BV?=
 =?utf-8?B?ZlFGU29BcHBNd0hjYmFqWm9xVUZNVUhMWjQxVFZDWkZjZ01CTFpiVFhucXZi?=
 =?utf-8?B?bWVkV3E1Y2wxREN2N3p2d3VjUjNXRHRaV2IrNTZyaTB3bjl5d090MWxCdmdp?=
 =?utf-8?B?N2NzZ1JTLzhaSDhTU3NOSWpBWTRra1VKZExXT1ppNE5UT3JMS1BrUThBNFBZ?=
 =?utf-8?B?Ui9yUXlEVlFTZUpsS3doSk1tM1RBTnpHTnFTNjFIV1JSbEprTTVHT0RKNTNx?=
 =?utf-8?B?SzB3Z3V4VTc1RXNraTQxd0J0TjJRYVdpcG9ZUS9QRTdoTDdELzA3NU1DdU1y?=
 =?utf-8?B?azJldE5OZ0ljaHpsQ0FWK2xIZjBUOU1DTmcrZ0I2dllIdkluK2hGY3h4NEc5?=
 =?utf-8?B?WDAxeSsrczRRcEJhdlhaZUk4d09Jb2pnUG50UWxRRzRqQzNPclg3bzlibjdT?=
 =?utf-8?B?MnE0UW5QNGNIL0JERWJ6UUhoSnN6L1NoM1U4OVg0U0I0cy9vdldOVUFYMUNP?=
 =?utf-8?B?ZGp1Yi9ZQUt0NGFlL1VEWXc0dEMydnZNTDZSbXU4VFRSVmRNSnZhRWEvMFBz?=
 =?utf-8?B?NzlVS1JqVnpjSEEyMC9NcW9RcmVuNkFQVXVJclJUc3BtMG1JZlRrVCtWcjE2?=
 =?utf-8?B?cVY3eDFVUkxxZ0xKYXN6U29ETDRieDIwRUluaHVHZDBhWWNIQlVjVy9BVGVD?=
 =?utf-8?B?a2NnM3JIYnk5SE85di83T2t6UHZKTDRrOVVGR2gzMzNMY3VUaENJM2FxYXBK?=
 =?utf-8?B?UGZaVGlHQUF5S25XdWNjM0FzUHQvREdmTEVicllyQzZITkFQTXlJVEh4RzhH?=
 =?utf-8?B?bmtRZ3cremtxUlozK1RzbjZxR3hPanVwOUpqeVg4cHEzRXpGRTRIeGVQYUta?=
 =?utf-8?B?cGh4YmY2cHRETWh5azM5c2hyZ0ltQWhkVEtoclVOZkJVcDlyQWJ2dWlndTdj?=
 =?utf-8?B?Vk4rbm96WkVLM2dqb3BwTlJnZ2JCdGVlNm51Zy8rcVpFNSsvU29idS81Kzlt?=
 =?utf-8?B?ZkhkbTJEREY0amN0NlFsTm0yS2pLdUxSb0JWY1R2anlURXRtRnBHaTZTT2hn?=
 =?utf-8?B?REEvU3VEYjJWTjUzZWhkK2cxMWdnUlZ6OENGeVhmQXo0SEcreFpLbEtlM2lB?=
 =?utf-8?B?MmRsbElEV3YyYVlWVXBoM0RIQ1NCVVg1Qk5EQWpBNG1ZQUJVTVdTYS9iWnoy?=
 =?utf-8?B?NzF6UXVMVHNndTRob2plbUlXZTg5VlArOHlxRS9kc25NMktwdm9CQUN0cjVW?=
 =?utf-8?B?YUZjMXY0dXpSZ25QR2FHeTNReFk3SDVNWHZDaTA4M2IyeXZjMVpGOTV2bGVK?=
 =?utf-8?B?ZW5KajFjZ2dBNHAvQjVSSng2eW82dFcxSEhkRTVkcDk2TjNWcGI4UHJFMHdX?=
 =?utf-8?B?d01jT1BCeHkrSVgvaktLbUlMTEZrOWpOaW5CTEVVSzBWUEo5WW44aTdDeUJi?=
 =?utf-8?B?RUNJY3JFTnM1emRSTVB3aE9KQndsQ3h5WGVtK0ZiTUZ2ejBwWXFHTk1sbEV1?=
 =?utf-8?B?bVRyeCtyUHRZNnBkLzJzUS9KeFI3Z09jaERFbGFDajV5UFBvTzdPRjZBUlR6?=
 =?utf-8?B?enZkM0xLZmRsR3I1V25UOE5qek51MWhnUDVuWDhuRXhkM0ZoeHU1YXZrdkF2?=
 =?utf-8?B?cHQzaFlDblN5dWhEL1kvWkpUNkVyM2xpVnVydlc1a0NZbU5MNjRRUldaeGNU?=
 =?utf-8?B?WHFsMm5LUFk5ODNKcStWbHJxckIxNlFTcjNnWTJKREVJOWlYZjh5QWpCbVA3?=
 =?utf-8?B?VXF1eHJoeGMzcFJCZFVreVpGd1B3aW02K25wZjU1SFJjbmQ0SDVtMlJMR0Fx?=
 =?utf-8?Q?lgEXigBQF6jW4cCBJxDLA2lu0+ciqc8uQ5o9OnR5B2euo?=
X-MS-Exchange-AntiSpam-MessageData-1: 2iR0tv28urcjHw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f1d60da-d192-4d3b-e4dd-08de5ca74c5f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB9152.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 06:51:14.6153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DNB91S7QQ7MuVrv+PDntV5DdLxdYYxsmfbn+bBPNHojWV4dbEcWRP69xQOykv3ECjoSOlk7fQV2/mLOfidmvRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9490

The code related to DLL setting change is incorrect in the Tegra30/
Tegra124 EMC sequences -- fix them.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
Mikko Perttunen (2):
      memory: tegra124-emc: Fix dll_change check
      memory: tegra30-emc: Fix dll_change check

 drivers/memory/tegra/tegra124-emc.c | 2 +-
 drivers/memory/tegra/tegra30-emc.c  | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)
---
base-commit: a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
change-id: 20251126-fix-emc-dllchange-c2ff94dc7980

