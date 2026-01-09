Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012028.outbound.protection.outlook.com [52.101.48.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2931FC0FC;
	Fri,  9 Jan 2026 18:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767983809; cv=fail; b=R9MEJ9O5NXlTQ+w4PLNJBjtygIph60nh8W2E6pVFQQzPNoUqDQ8VYAGb5CnMA15X2ycloKTtXrKYZvnp4TULu0l2q5DISqfhdxW08hiTVe+IrxVOFzH82to8U/v93AhNAGO3CWjrt917cFG054D+Irs9Z1hYVNq5qCxLto8yiCo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767983809; c=relaxed/simple;
	bh=KTx4PJfwPVKqkmg+bP3sc+xP9ESAkz3kn6TX2Vlt8tY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ARsaEKMHhnz+sjka/lzNUzU867tLBXZl6RTuo59K5ZGMK+eRTJFruG47wvn4iOl8UVDEkO39vGsrLP169DZBqjjA0P2FBvwTCf3ZzEy803XSV+iWnFrlG73wfx2TxAl6CfjZo3HT0wIMO0COy2/sA7eRJ99AskJ1x2oKb7RVg9U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=iW1I/gUi; arc=fail smtp.client-ip=52.101.48.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="iW1I/gUi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vopw3LS/xcApkhiwDZvZBk5BVzr0IbyhXJx0pTqnlaMoijBfztOjJF5xg1jIM2qVY1pQ882tTnfc3fDZncK4cicgDZJ6hwOnwMuQ8u3EHQa52CPrpvq118/yx/tJLKoJOS+rw3xe2t7jAWTZfliwC3wCgyjcZRcdEWBqzv1CphJGWYHaSrFvebvhGRlOmD2vlCNJPCWtAtnAzddvzWrtM2otsrRfHs0ZpajLh7szaezA4H144pb2/W/Md+LJc+/QgL2WHMGsO3NRaLcSq606mPVa3SbGk8ImGkCeI6bvpdZifdyX4ZbPkwVIsmE2PQ8bUzZFjKgwEJy6remV7Lh/yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N9li82byccfoNIhGzViZ0HHDp8n25bl5NCI88GCr/+I=;
 b=KDh4D7ox4pWVqNc/M4sFZ76oWtmKJa7hhxUnyVO5ERaH7baKAUIYLQmLqMw7JaKjLJPJTFmMqz6ZBSBo1OzGC501IdjpB8HPOLw/a5GLbF4MajgN4gVVqq5jg4E2OD17oUlVxwOupDdJD4uqcYYJHy8giVYR6dLrZMeilzJ9AYDQgpbfV48c4qjWZBH0WRcOBE7Bmy+h6lnkOG+UZd7zUkZH9UmW0xpHAwoBYjb0WkF1dPp/OVZ66soSl6am3yqXxwUy8x3Gfiv0BUfykYPuzRWaqoK1kLXND0d4YRdLmFpZiAlAl4lzTVeCCFgv8bIfr99oiHYQ8pswaWnMJX4YBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N9li82byccfoNIhGzViZ0HHDp8n25bl5NCI88GCr/+I=;
 b=iW1I/gUiEn0u16O94I6o1JRerllb+eVgsRJ/AxQ6d6AOv2IYbh8gYm02ndKxmN9HQdYSwGrlELYr5i3eok5WT5jK23lev6MOnxj5QNTaIoBuf1qTwYWN5kokX91zezJcg+E0cq4o30PFb8Cw3dGv+iyhgsvwMPv58TJJVsv589reHnhadDmiU4uOAK/nCS+taolz+mOrTzlzzP+I3xnrb1sAj5krxhMcrzWAB6cerZRayDeEedZH8F4HyScVbxwz4Bua631Xb44lU/ywj3/Ngo/JJBwhhDDoMKd8yblQ1IBImJuIAWBpSql9YG0Y0FjIhI9b9y8Ab1odM+vapp1ROg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by IA0PPF52B16157D.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bce) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Fri, 9 Jan
 2026 18:36:43 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%7]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 18:36:43 +0000
Message-ID: <e6e83a4e-5eca-4ddd-b0cb-e78921d1e5a7@nvidia.com>
Date: Fri, 9 Jan 2026 18:36:37 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc/tegra: pmc: Fix unsafe generic_handle_irq() call
To: Prathamesh Shete <pshete@nvidia.com>, thierry.reding@gmail.com,
 ulf.hansson@linaro.org, chleroy@kernel.org, jirislaby@kernel.org,
 haotienh@nvidia.com, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: petlozup@nvidia.com
References: <20260108050103.126008-1-pshete@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260108050103.126008-1-pshete@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0120.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::7) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|IA0PPF52B16157D:EE_
X-MS-Office365-Filtering-Correlation-Id: 5925d876-c500-4346-3804-08de4fae0929
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UndMWFNCSWQ5Q2w3dStGdUlBeDBuTURUTVkrUHU3SXQvcm1nOHdmbDJ2M2Vt?=
 =?utf-8?B?NFduMzVaTkZZQXVnZjh1Z0lReW9NTDZLckJvOWZWekxWNDloN2tGQ3pKWjVN?=
 =?utf-8?B?LzVpeStOSm8vaHQ1K0dQLzh0aW9OeEhNS0JtbHNiWVZySWRZcWxXYjZacmZX?=
 =?utf-8?B?QU9sNnpRaVpvVng1L2hBbXV6cmlkNXpUazV6cGNOMzl1UlRJa0hUY3VqOVQy?=
 =?utf-8?B?SEx0SG44MHdaVzlJNGpFZ2RXcHA4eXRlVFc5ckEvemN4T0JuT2l0b09qOGxB?=
 =?utf-8?B?NGtJTVRqWWpaWlppcTJwYS9YY2R2d1o5MEc5emJDZ1Z3bTNXb2MxRzFGS25Z?=
 =?utf-8?B?NG9aOGVRT2JTbE1SNEhNR2owL2twTFZGdnhUd0c4V3FTZkxYRGxhUUw4MG81?=
 =?utf-8?B?YmZRd2FPQ1FjR1hKbWZtMEdLS216Y3FHRkliMlJFRXB6YUFTSWdoQ1Y3cVkr?=
 =?utf-8?B?aWxxL1duK0V5aTBZWEVjQ3d4U3lEWGN0ZEw3RGxUUUw4QS9CUldrL0ZPeG1k?=
 =?utf-8?B?ajNKZ2NoeGFtMFBGSmkrS05OTkljOTIvNHgrZHVLZEJ3MDB2QlIrdmg1TmNk?=
 =?utf-8?B?MUkxbExMeHg4c1RrNUZ4dFpYZXdPOFVCRUxVSUFFRmg3b2x3YzFGa2tPMXhM?=
 =?utf-8?B?VFRGOEdSZnNrdUptbFhReUU1V1Bnb3J3Ny83TVo3d0V3anovNURBL082aTdt?=
 =?utf-8?B?T0hPV3IyUEkzVXZTRit0NnZLM3pxMTA0bUFRMUFsem81bDdJSXdSRzZvZUJ6?=
 =?utf-8?B?ZlcrWEFjbmlCTFJsWjZkMHpZZmVlMmlMZVJBTTRteHJ4eVpvUzNFcWNERXEw?=
 =?utf-8?B?MlhCNGtLQmZ6VGFwV09vdEZCQkxiU3doMmdsK3M3SDFEWnQ1b1RDemlHTXlQ?=
 =?utf-8?B?dlRYNVRtcFdVT3AwZ0UyeFNkVVh0VzhhVWw3WGNyT0NOYUZ2OWljeDRJN1Rr?=
 =?utf-8?B?UnZ1UzMyelFlMWJzTFZLVDBMamxpYUdOSDcxSGMyUGhGdzZvZkJRRDdjMFhy?=
 =?utf-8?B?VlRBMjRRVTJYWHlnWU05MXg0R1lhWUtjc0ppNCsrRDVaM1FRM2k3REFBbDhJ?=
 =?utf-8?B?TThMbUZUV0pPZXBla21Ka2RSSHJGV1ZHUzQ5ZGpjZWpLWWV6RklSMXFvNExL?=
 =?utf-8?B?ZTZ4VStmZ1dYbFRSc2MrbGNHcHlLbU41ZTV0cVorVk9hNjZFelJOYlZPdE1p?=
 =?utf-8?B?ekcxQnU2aFVzaUtTRnV2STlOeGxwTW96cEM0WmgwYWVZVllaVm00N3l6WWVp?=
 =?utf-8?B?dkVsK0FXYkFLcFYzZHhwWWYzUWhOUUtKOVBsb1JTdUFjdVFOSC9iQUxDMFMv?=
 =?utf-8?B?cVBJcXQ4RlVrZHZ5Q2RvZThyZDdqSEdEZWxWemRoQU03czk4bzJwRDFQSSt2?=
 =?utf-8?B?VHROejc3b0VLY1dqQk1USDFybDdBWm5NWjB4VUFtREFxS0FiRXJYazUwN1Fr?=
 =?utf-8?B?Y0hLTEw4OGpQYXlyL0F3WDdzOFFpWEN0ZXVvcENtelNnZUhLRDVyeGJhOHlw?=
 =?utf-8?B?SGhmM0JXbFZnUW9QQnhmQkJKTm9PQWRmRmNnZEF4ZGpQKzBYMCtEN1BoTldh?=
 =?utf-8?B?c3BqVXZXMytrcHZqUGsvd3B4NU1CMk84Smt2QlA4S2NOSGJpWGtzaDJ4L3g2?=
 =?utf-8?B?Ung1MU5uc2tEK3llMDdnOWk3T2hwWk9rbWpNWWFzWENNY1ZyZVlGSVU1VDZT?=
 =?utf-8?B?RzU2MS9HajV3eSsvRjdWSC9sQnl5YU9OTHEwZzhsSFdXM0VVNGs2MXdPazlp?=
 =?utf-8?B?TkJWVGgvQklLQ2FTd3ZVeGp4bFdyQ29RSjdmN2FhK2dEZkhxMTlUNDNJdzl3?=
 =?utf-8?B?d1dEYmoxMmZXZE1YWllHS1BvK1dlWlNyVXlJR3NrckdUem5FRHhOUGdRMWtv?=
 =?utf-8?B?eDVOcURDTEFvZURxUnRwb2pmTlg1cGk4aDkwNVZFTGMzSU1MU1NvU2pBa25E?=
 =?utf-8?Q?UQJt5hzJlH8ImdU3gsBSsCzRSoMkGkzY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RkpNd3FFT1JFOWErU3dMZDRLclZvZXRFMzEyZnR0Y1E0c2dXYlI0Zk5NemNE?=
 =?utf-8?B?VmpQRVk5R3NOVDJHZm9yakQ1Z0ZCcWNFRzZmdjlQaW5qT3FjcFd6VDczbXRI?=
 =?utf-8?B?NUF0UzA0bTlHTytKV09oVG1lcWhSYXNWNUNNeVhBanUzUzZ6YmZ2VTVMTnpW?=
 =?utf-8?B?UGlDeldodnc0WVZaSmR6bUZOZ2xrOHlCSEJ1UGVQSUNKQ1JydlpJcE1BdzhC?=
 =?utf-8?B?aG04TW9rY2VqcU5UQTVBbldxUzhkaWhXL25OZklreERQYWh6RGdmemxZbkpp?=
 =?utf-8?B?MEpkV1BoVDJaSjlCK3JtUnhuTTlHbEo3a2gxem9mTW5PVFBsTHRIZS9GTnZF?=
 =?utf-8?B?MjkyZDJuNWFmK2NKcUpjUnFYQzF1RFd6VXdGR3dNb0dseVFNbUVjVEswZjN1?=
 =?utf-8?B?dHFGcm8xV2pnT0J4VFZaeHlxSmlVbFJvWnh2a2lDa1VucEFja3dNNFJ1a2Ji?=
 =?utf-8?B?SXBCejd2SzQyOFBNakEyczBvSWMvV2VVN1VUR1ZOVzVwZ1NyaUpyL0ZuUWpN?=
 =?utf-8?B?bGpaY0x4Q0ZmT2d5ZE90ZUJhU0F1ZzhWM0hRSE4yMjFlWDFEcjNEbzZlZ2k0?=
 =?utf-8?B?OTNnazZyVzJhSWlvZTduTTVPWlVNTk85OHF0V1ZCUHNBOGFSTzZTb3o4Q1hY?=
 =?utf-8?B?aHNTK3NaUEludENmeWhJSHVURFJ6cHZwWlYzUXRSd0dkeklIeE9mYVZTaUxs?=
 =?utf-8?B?VE1lWERNWExBMUhLVEloaTdwb2R3YlZYcGU1QVlHQnVjVVFScjczN1RiUDBI?=
 =?utf-8?B?T2djUXdBOVpnZS9aeHYrb3RyMkdlbUg0bEdtZ3k0WXIvQTZYUkNpcGR2TWRz?=
 =?utf-8?B?ZW9rL0daYmVuc1BiZjkrWVpPZDhHMkxnSlR3UDBOd2RwZklHWkFDYlUvQ2lw?=
 =?utf-8?B?aFRBdWhUVlp0VGhMV25ickR4WDRWeEhsWEtiNm5BQkF2RDRiSysxOVpJbnBB?=
 =?utf-8?B?alY0RmRxanA4WFB0RU9CWndEZElqcWs3YW9MWER4c0E4aUJmUXhCVDRzbW9N?=
 =?utf-8?B?dVVibFBlUjVIaWZXRU4zYy9Eek1jd0lkUUNvdzBMU25zNDFKMG9mckZua0R4?=
 =?utf-8?B?VDA1N21EVzhHbjB0VkcrL2hIaGdOVC8yRklLMGNkbFdHVS9CM3lBbjkyTlQw?=
 =?utf-8?B?QXdMR3czVVl0dnZJbGEyS01uZWxFU21kWjZSVG1ORUdxbDBHODNRUWNObTFn?=
 =?utf-8?B?OEpQU1BET3R5MDNsOUNvQllDZXkyU2FZclZybkt4UXhFN2UyLzZvbEYwTEgz?=
 =?utf-8?B?OWQrOGc1anIyZGxTcjJRVDdXaDVXVUJnRGJDWkFaYVNUZ3pTTTkzZVpRbFh5?=
 =?utf-8?B?SG0xS0c2T2tHNWRxdjNjQ3lEUU9rZG1RVE5Qc3BwWmliWGYzbGwrVHE5NDFr?=
 =?utf-8?B?VlpqR3V6VHowa29ySkhZemZCUDFDUEJkVWJ3N0FGajFlVHpRcmV1RTAvTDFq?=
 =?utf-8?B?dSt4eGkwWHl4ZWZqNk1wbG9XQm5hRDZvOUlnNkQ5djNId1ZvbFVjRVBlM3Ft?=
 =?utf-8?B?OUZ3ZVljM3pCVWl3TDRGc1dXUmV5czl0eGpaaTZrbGo3aC9DM1V0YzZYZmlo?=
 =?utf-8?B?MDlUKzE5b0RXd3R6blZFOFhpbDRKQ2ZscFY2cFBSWW5BakRkbERJTy8xS3RP?=
 =?utf-8?B?SUVkaEkxNGw4ZEFVdVd4ektxS2hqbTdUc2pIV3hlWkV6cW41cXJRY3RwSXlW?=
 =?utf-8?B?SkxrcE1ROC9hcDVBNjl6UjJFdGQyVWhsaFYyOVNRdzltd05zdWkzVzN3L3Bs?=
 =?utf-8?B?YXpTZlRsbHJCMDZpNURRYStWTm5QbVUzWWdCL29vT0NsUWtUU3pYclJlWnJB?=
 =?utf-8?B?M3dzZXIxNUxURlNpZmloZGU2WmpSSGFRKzhpSzNkSDVROWVEc0c4ME1HQW9G?=
 =?utf-8?B?ZUpidVl0K0t5S3BYR0lJUHdYaC9GN3QzZVdNNm9NZFJQZSt6dW5FWmJ6dnVr?=
 =?utf-8?B?MEFrMjZDK1A2K29RNlVVS0s1LzMvVTlkMWhQYWtTVUlhOEx4YmZwU3MwRkRL?=
 =?utf-8?B?NVI0YW9peFFveExaK0lZZC9MTUVvRmtpSmN1UzcyZEJtWXpuRFd3RnV1c2lW?=
 =?utf-8?B?OWs3TnZVRUhSRTNzYXRYUzJzbzNFeEpmT1dDV2xta1dqOTdTZkVveXpac1VM?=
 =?utf-8?B?U3IzZWo4a0srOERyb3ZRTm01OGNxOWlSMElIZUJlbEc0bFFSWVU2Y0hacXFm?=
 =?utf-8?B?QXl2dml0RjJBZlNtWjIzWmh1ZjhKT2ZwQ2dzVk1yUFRDRURaWmdNci9MUG5o?=
 =?utf-8?B?RGxyeWV6Ym45akN2NEpUUzNuTlhBeFM3dnduR3NScGpQd2hIN2FPdDc4RkVS?=
 =?utf-8?B?MGdpMmZXcnZzdzVQN3hXbnpLZ1pSWVFKbXJiSkhpR3hZeG80cVN0TVJtdWNF?=
 =?utf-8?Q?17La3/eJDLxhe2f9/erUmLHXT5aFKDqXs5D7I2Mhar3dD?=
X-MS-Exchange-AntiSpam-MessageData-1: 8yER10jThTs0wA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5925d876-c500-4346-3804-08de4fae0929
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 18:36:43.1958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: orVjjYwNnyAx1bjdHbqdZX4zDR0UIwIoZR7sSbal6aSVOCPqIXDhnbeXuYSd1LYwzlzIOLYC5K+x6XNlDfiNYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF52B16157D



On 08/01/2026 05:01, Prathamesh Shete wrote:
> Currently, when resuming from system suspend on Tegra platforms,
> the following warning is observed:
> 
> WARNING: CPU: 0 PID: 14459 at kernel/irq/irqdesc.c:666
> Call trace:
>   handle_irq_desc+0x20/0x58 (P)
>   tegra186_pmc_wake_syscore_resume+0xe4/0x15c
>   syscore_resume+0x3c/0xb8
>   suspend_devices_and_enter+0x510/0x540
>   pm_suspend+0x16c/0x1d8
> 
> The warning occurs because generic_handle_irq() is being called from
> a non-interrupt context which is considered as unsafe.
> 
> Fix this warning by deferring generic_handle_irq() call to an IRQ work
> which gets executed in hard IRQ context where generic_handle_irq()
> can be called safely.
> 
> When PREEMPT_RT kernels are used, regular IRQ work (initialized with
> init_irq_work) is deferred to run in per-CPU kthreads in preemptible
> context rather than hard IRQ context. Hence, use the IRQ_WORK_INIT_HARD
> variant so that with PREEMPT_RT kernels, the IRQ work is processed in
> hardirq context instead of being deferred to a thread which is required
> for calling generic_handle_irq().
> 
> On non-PREEMPT_RT kernels, both init_irq_work() and IRQ_WORK_INIT_HARD()
> execute in IRQ context, so this change has no functional impact for
> standard kernel configurations.
> 
> Signed-off-by: Petlozu Pravareshwar <petlozup@nvidia.com>
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> ---
>   drivers/soc/tegra/pmc.c | 106 ++++++++++++++++++++++++++++------------
>   1 file changed, 76 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index f3760a3b3026..a0cc276e235a 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -28,6 +28,7 @@
>   #include <linux/iopoll.h>
>   #include <linux/irqdomain.h>
>   #include <linux/irq.h>
> +#include <linux/irq_work.h>
>   #include <linux/kernel.h>
>   #include <linux/of_address.h>
>   #include <linux/of_clk.h>
> @@ -336,6 +337,8 @@ struct tegra_wake_event {
>   		},					\
>   	}
>   
> +#define TEGRA_PMC_MAX_WAKE_VECTORS	4
> +
>   struct tegra_pmc_soc {
>   	unsigned int num_powergates;
>   	const char *const *powergates;
> @@ -468,6 +471,10 @@ struct tegra_pmc {
>   	unsigned long *wake_sw_status_map;
>   	unsigned long *wake_cntrl_level_map;
>   	struct syscore syscore;
> +
> +	/* Pending wake IRQ processing */
> +	u32 pending_wake_status[TEGRA_PMC_MAX_WAKE_VECTORS];
> +	struct irq_work pending_wake_irq_work;
>   };
>   
>   static struct tegra_pmc *pmc = &(struct tegra_pmc) {
> @@ -1905,8 +1912,59 @@ static int tegra_pmc_parse_dt(struct tegra_pmc *pmc, struct device_node *np)
>   	return 0;
>   }
>   
> +/* translate sc7 wake sources back into IRQs to catch edge triggered wakeups */
> +static void tegra186_pmc_wake_irq_work_handler(struct irq_work *work)
> +{
> +	struct tegra_pmc *pmc = container_of(work, struct tegra_pmc,
> +					      pending_wake_irq_work);
> +	unsigned int i, wake;
> +	unsigned long pending_wake_status;
> +
> +	for (i = 0; i < pmc->soc->max_wake_vectors; i++) {
> +		pending_wake_status = pmc->pending_wake_status[i];
> +
> +		for_each_set_bit(wake, &pending_wake_status, 32) {
> +			irq_hw_number_t hwirq = wake + (i * 32);
> +			struct irq_desc *desc;
> +			unsigned int irq;
> +
> +			irq = irq_find_mapping(pmc->domain, hwirq);
> +			if (!irq) {
> +				dev_warn(pmc->dev, "No IRQ found for WAKE%lu!\n",
> +					 hwirq);
> +				continue;
> +			}
> +
> +			dev_dbg(pmc->dev,
> +				"Resume caused by WAKE%lu mapped to IRQ %d\n",
> +				hwirq, irq);
> +
> +			desc = irq_to_desc(irq);
> +			if (!desc) {
> +				dev_warn(pmc->dev,
> +					 "No descriptor found for IRQ %d\n",
> +					irq);
> +				continue;
> +			}
> +
> +			if (!desc->action || !desc->action->name)
> +				continue;
> +
> +			generic_handle_irq(irq);
> +		}
> +
> +		pmc->pending_wake_status[i] = 0;
> +	}
> +}
> +
>   static int tegra_pmc_init(struct tegra_pmc *pmc)
>   {
> +	if (pmc->soc->max_wake_vectors > TEGRA_PMC_MAX_WAKE_VECTORS) {
> +		dev_err(pmc->dev, "max_wake_vectors (%u) exceeds maximum (%u)\n",
> +			pmc->soc->max_wake_vectors, TEGRA_PMC_MAX_WAKE_VECTORS);
> +		return -EINVAL;
> +	}
> +
>   	if (pmc->soc->max_wake_events > 0) {
>   		pmc->wake_type_level_map = bitmap_zalloc(pmc->soc->max_wake_events, GFP_KERNEL);
>   		if (!pmc->wake_type_level_map)
> @@ -1923,6 +1981,12 @@ static int tegra_pmc_init(struct tegra_pmc *pmc)
>   		pmc->wake_cntrl_level_map = bitmap_zalloc(pmc->soc->max_wake_events, GFP_KERNEL);
>   		if (!pmc->wake_cntrl_level_map)
>   			return -ENOMEM;
> +
> +		/* Initialize IRQ work for processing wake IRQs
> +		 * Must use HARD_IRQ variant to run in hard IRQ context on PREEMPT_RT
> +		 * because we call generic_handle_irq() which requires hard IRQ context.
> +		 */
> +		pmc->pending_wake_irq_work = IRQ_WORK_INIT_HARD(tegra186_pmc_wake_irq_work_handler);
>   	}
>   
>   	if (pmc->soc->init)
> @@ -3129,47 +3193,29 @@ static void wke_clear_wake_status(struct tegra_pmc *pmc)
>   	}
>   }
>   
> -/* translate sc7 wake sources back into IRQs to catch edge triggered wakeups */
> -static void tegra186_pmc_process_wake_events(struct tegra_pmc *pmc, unsigned int index,
> -					     unsigned long status)
> -{
> -	unsigned int wake;
> -
> -	dev_dbg(pmc->dev, "Wake[%d:%d]  status=%#lx\n", (index * 32) + 31, index * 32, status);
> -
> -	for_each_set_bit(wake, &status, 32) {
> -		irq_hw_number_t hwirq = wake + 32 * index;
> -		struct irq_desc *desc;
> -		unsigned int irq;
> -
> -		irq = irq_find_mapping(pmc->domain, hwirq);
> -
> -		desc = irq_to_desc(irq);
> -		if (!desc || !desc->action || !desc->action->name) {
> -			dev_dbg(pmc->dev, "Resume caused by WAKE%ld, IRQ %d\n", hwirq, irq);
> -			continue;
> -		}
> -
> -		dev_dbg(pmc->dev, "Resume caused by WAKE%ld, %s\n", hwirq, desc->action->name);
> -		generic_handle_irq(irq);
> -	}
> -}
> -
>   static void tegra186_pmc_wake_syscore_resume(void *data)
>   {
> -	u32 status, mask;
> +	u32 mask;
>   	unsigned int i;
>   
>   	for (i = 0; i < pmc->soc->max_wake_vectors; i++) {
>   		mask = readl(pmc->wake + WAKE_AOWAKE_TIER2_ROUTING(i));
> -		status = readl(pmc->wake + WAKE_AOWAKE_STATUS_R(i)) & mask;
> -
> -		tegra186_pmc_process_wake_events(pmc, i, status);
> +		pmc->pending_wake_status[i] = readl(pmc->wake + WAKE_AOWAKE_STATUS_R(i)) & mask;
>   	}

Missing a newline here.

> +	/* Schedule IRQ work to process wake IRQs (if any) */
> +	irq_work_queue(&pmc->pending_wake_irq_work);
>   }
>   
>   static int tegra186_pmc_wake_syscore_suspend(void *data)
>   {
> +	unsigned int i;
> +
> +	/* Check if there are unhandled wake IRQs */
> +	for (i = 0; i < pmc->soc->max_wake_vectors; i++)
> +		if (pmc->pending_wake_status[i])
> +			dev_warn(pmc->dev,
> +				 "Unhandled wake IRQs pending vector[%u]: 0x%x\n",
> +				 i, pmc->pending_wake_status[i]);

Missing a newline here.

>   	wke_read_sw_wake_status(pmc);
>   
>   	/* flip the wakeup trigger for dual-edge triggered pads


Thierry may be able to fix up the missing newlines when applying. With 
that ...

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

-- 
nvpublic

