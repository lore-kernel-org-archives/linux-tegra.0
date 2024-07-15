Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2043.outbound.protection.outlook.com [40.107.100.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991381850B4;
	Mon, 15 Jul 2024 13:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721049957; cv=fail; b=cMDPAAwyvCiCSqrAiPqK/E3YQz7ta9BwbkuEbGSgh4rx5ooKKw6Cd9iS8j4DAGUeJR7GrYm7bUFrlX3AmVRF+/cx0ssNXnYWvA8UaXdTDVMZR5YtPjOXS3meS8ixfXOYheV4oVDPSPOjuzGNmRJLleVVyThoLia+uo80uSRqHRc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721049957; c=relaxed/simple;
	bh=1begFKCyN7FuJEoLor/5+NhDq5SBXvRWfiemAO/luGk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dQkjvitJKAYrkeF2/fA6xkUczMF+Ex60yMOZjDbDKGEpk2srZcYlv9obE2ytYv4y81uOC03yZNn82cucugFF2fndx7KG9jVUWX+c5asr2TuKcIR1SgFSff6ZrqeNVvJiQ2m3pLfochqbsh23/UDuCtGLtXBBNAbmZMWGp2BYgXM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TJHnvHeo; arc=fail smtp.client-ip=40.107.100.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TJHnvHeo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YVy/JAveplGHlOUz/2ams6GOFfjiX5ti2iuVQbK9OH2dzRJDSUT9NgSiMj409u3QgGEJ6eheUV3uJS99G+4LOz3QE+hwLu6/YF3bAmOmfYMA1z2CxsmkUaAWI8tSfrZQel99GHvnN36BGuA4I9o98FF4PdSoLHz5/hFNiyNlj69aGkLHIQfdum1YLVMq94WC7HDXzbTovEtIXevZORf+cu3+JJNoUTWya3zEUWoJAFtAKVAdO2cqnGWSOwBSIaMiWFgnzaouY9bLCu9hhpID+i/X4iLCTLJQEh79fgKmtOuC8hExJkOcWoJjIjrYC0kEZAyqG+nuZw6SxZ1+W7m90g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZSvHoZ6qPCbyrRK5FSNl3HZkqb5Yvd8dOLvZFw2PmDk=;
 b=U54rYT1wD6DhjfxgZnbN9DOAfdInKCCOiefEIDBbKwXy6Y2AWB4lUTiQ1Vi8p20ELFp4dhqGX5XiaW91xCFA4tCKoYULMufyagoMWDj5K714f4Iajfigb+Nb8lhx4aiw0Ca6xTo/fIU+ZKaQY2KF6svlXHks+71DIhieJxT37fbn7wFzk/OqGGkLKaRY3ujrmTcPG3h0+Jd26IzH5DHRfE12HUdjpaN5CP8T1yseB6W8mUB11ehQLVjE/0bpJDytKWbcHUH/53/0kBu6PNo+2gXav++pbDjvbEhW7zcWUpLOXFGO3je7gGaAhepUOzf5wWQGydwVZgp5Fca1FzNg3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZSvHoZ6qPCbyrRK5FSNl3HZkqb5Yvd8dOLvZFw2PmDk=;
 b=TJHnvHeoBu6IsQI4BsnvhYqg7ifqZQE9ymHDtu8AB8nmlu+SBIqtyGlgUznGnKnD/GZP5etDu7r5LXry9oqB6JpNDmxjTuHWaw85UidoKS0Nr/TbqtU3GBYgqComq78yb2AKhU5njvBuVy4h6R6G60CJzRjnjhhB3g2eaD0bYe4ykkLK6wll4CZ/xd0Qn4F0TR+qbw2DmD/CGqota9Q8ms2YPwZJ7B+HOOrIB7XHO6ial/yvIWeAYNDNDKJExKFe8/u81zobTjNCUKIa9kmq7P8GZaxWGMfKbe5s7F7Na2HrS7kyWtg6cbqmeAxk4NU9pLIPFWRIVcc8acFdOqLKfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 LV8PR12MB9081.namprd12.prod.outlook.com (2603:10b6:408:188::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Mon, 15 Jul
 2024 13:25:52 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ae68:3461:c09b:e6e3]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ae68:3461:c09b:e6e3%4]) with mapi id 15.20.7762.027; Mon, 15 Jul 2024
 13:25:52 +0000
Message-ID: <dfe34cb9-1a71-4f3b-ae71-52e886d11768@nvidia.com>
Date: Mon, 15 Jul 2024 14:25:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/8] timers/migration: Move hierarchy setup into
 cpuhotplug prepare callback
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20240701-tmigr-fixes-v3-2-25cd5de318fb@linutronix.de>
 <20240703202839.8921-1-anna-maria@linutronix.de>
 <3580126.iIbC2pHGDl@steina-w>
 <4f24a2f1-0f6a-4ad4-97e3-398cd9981127@nvidia.com>
 <ZpT9jSNcCLnEScWL@localhost.localdomain>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <ZpT9jSNcCLnEScWL@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0295.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:38f::8) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|LV8PR12MB9081:EE_
X-MS-Office365-Filtering-Correlation-Id: d4cf9644-93a6-44c0-6429-08dca4d1a605
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RGpBclY3ZVMxSHV0U0NVNDVrbmVnSXlLdEU4K0ZuNmd4bTlPdStuU3VmUTVz?=
 =?utf-8?B?dzN5WDFmbUF6OGdlcTRiWHN5TFgrb1FqcE9kT24ybGs2Y0w5SE84b0NNVXJn?=
 =?utf-8?B?Z040Z3FkSVFUa0R4VlJ4U1N3dkdzbVdZMCt5UU43dTBoYWlYQXcrd3crMTJ3?=
 =?utf-8?B?THFaYUZYYmUyMDBIbmJhTGRDMHdxQ0ozZVB3YUF3TXJLRDZ5VEVpMjAwTGpE?=
 =?utf-8?B?MW5yRjJpM1J3ZGVPbGgwU3MvdStHNGppaW8zT1ZzOTNDMFgrNmk0Z0JFUzJ5?=
 =?utf-8?B?NklxQm14SjF4aFZFck9kSHF4L2drRjYzY2Q3Tmd2cWhQbmxDUG9TK3Y1VGZL?=
 =?utf-8?B?emJjWXlIdFcxVEh1NWsvNjZud1Yya0tUT2NGTWJidm1zaktpR0xucEk2Vitq?=
 =?utf-8?B?WnpUZllicVFYcUpUU01mMmx1ckdZbGxMMU1NS3lsWXhoaHVlOWs2UFo3M3N1?=
 =?utf-8?B?Ry9ickVBWmJnZjdYMkNYeDU2SUxzZ3RmdFFSSzBLL2UvSWF2dVFSbExscVY1?=
 =?utf-8?B?MTZ5SGRaV3lxcGRlLzNKQUVtSHFUN29uUXlFa2p6N2k4N3BLMUNpV00zSlJk?=
 =?utf-8?B?cFc4TU9EWi95ZVd5aitUMlo0RHZZR0M0cE9IcHBrdFZyT3JYbmZaemNxSkRQ?=
 =?utf-8?B?QlZNb3lSN21pYURNMVJsemo3TklmNWtUQWlzUXlmNFVOTGlRZFBoWFpxd3Ev?=
 =?utf-8?B?NDIwcFg5UW15NStIekdUbWN1OVUwRndFeEFhQzhuSWlJZUJBTW1DaWJvMzVr?=
 =?utf-8?B?R1dlaWtJNmlKUU9PTWo4Vis5bHNCZ0FSMjVLVWRMVWN4L1YyOXFVSGdEOFNE?=
 =?utf-8?B?UStpYWh5dVVQSXVra0Nja3BnNnZGU3NOY3lWMmhFc3lXb3NVSFN1MjJVSmlr?=
 =?utf-8?B?d256NCtxTkFyTW12M0JJTStxTk9UMVg3Q0pPWE1UQlliQWdLTHBCenZ6MjdH?=
 =?utf-8?B?QWdYMGprUWJTZTZQMitFMUx0TE1FOHoxN3Q3UTAyMW5BS1FjSjlmSHlYUDBV?=
 =?utf-8?B?aklFYXVWQndNTFhtRXJnNUJmeCtiM3E2MGVTSVJ5YTRyZEw2aklPc1pDSURZ?=
 =?utf-8?B?UUZuMkJvZitKOFNZR2wrK3llZUEvSXJnR0t2VDFQNm02eXZieDJCY25zYit4?=
 =?utf-8?B?TlVEQW1kRVBURXBwLzcrR25DUkVPQnRGWUFjOTVyT25uSkxwMURDUk5YREZF?=
 =?utf-8?B?Z2JvN1hTMG84NVR1RWMvWVBvZ252cnpvaHdCWkd0U2lEbXB4N2pyOFdYalhp?=
 =?utf-8?B?bkN0QWFyOU45VnZaU2NUbEhGSVd2dHp4b3hUQ0lpSktIOTBxRU85ZFQ5Tkt6?=
 =?utf-8?B?NDViZGQ5aEFxT0RSVGNHRk5PeDhndmNncTE5b1BFaUN2YkIzQjdOQ092K3FY?=
 =?utf-8?B?aEJtNytzY0JUVWZvbkhwVWlYTHdyNW5kSkVYTDUyS2tXWjl0UFVtUVF5TW85?=
 =?utf-8?B?ZUJHVjE1cFYrWEIwTTN0cjU4VjJ3UDRyeHNuNEhOblExMklMUGZBeXp2TlIr?=
 =?utf-8?B?K3NDUFFoZHdWTTFia29XbWRlSHJoMUNncE01dVRxSExQbjI5UGpBZGZjak9L?=
 =?utf-8?B?a1poRWNCWUdrdGU3cXpEb2ZCNEJ3K1gwV0UwWnA4c3kra0F5dDhlRG5qZlpn?=
 =?utf-8?B?ZmdSNmZnemNVWnZ4Y0xUTGxzcHdFcU5ISHJtcWhIeVdBKyt3M0hiS3VsSFk3?=
 =?utf-8?B?aDR5UUhCWm5mTDhnaVpGV3BLM2FZQnU5ZGtqdFh1WVQyazRnYzdObWRHWXdk?=
 =?utf-8?B?SmwwbWxwdWsrVHB4L2JUbmhiSWxBQngwKy82Z1JWWnlJN3N4am1ZbFpBRDRp?=
 =?utf-8?B?RzI1cElDNHRpY003UWRxdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZktQcHZGY2U2SkdsU1N2VHZkYnBWNE5aV2hUeFVmVFlkZEF1amtnMWNmM0k1?=
 =?utf-8?B?REg0cmd4ZWdOcGZtOGtXMTRzdU9TR2NwS2VCMGNVcXlFbXhIbkxIRlFLdHBk?=
 =?utf-8?B?R280YlRuUzlBb1NpdjBSMUh4cFFseEJTdW04RWtxalJzRVJIY2VOb3RyS0VY?=
 =?utf-8?B?MHRNNkYyQ3dERDcvUythUmtlWVFQK2s3STZSdWxMaXJXa3pxM0w5dHUxR1Fu?=
 =?utf-8?B?TG5jcktFY2Fyci9Lb2RWM0RWVy9SaC9PQ095WUpndXFxYm1KRXZhelJFdEJZ?=
 =?utf-8?B?ZnExdEtDRk43UkVIMDA0MEMrYmdkN0kwd3VCNlRMRmV1R1dZUkcvQlZ1Szk1?=
 =?utf-8?B?UkMxZGFMaVNMQ2hFM0Uxb29tcUplMGR2T1lrdk5JcHMwYmJzRzdsbjFrdHlM?=
 =?utf-8?B?cm1kVzdZem5hKzZJV1VpaTE5MktzcGVoWWdUUDlGd3owNnhlTndjbWlLaXll?=
 =?utf-8?B?bUZoSzhidjFuNzdWVzRsdUhOUmIyR2xyM2tGeGFkblYvR1YzSmZpQmt1OE9I?=
 =?utf-8?B?K1JjYmRvVHpnaDlVLzJDU2xnZFh4dkx4OFByVVk0QUhpQ1FZeFVxMW5pbGZi?=
 =?utf-8?B?VkptRlh2NEgzK1g0RXhaN05XNUJuZHRocS9EUm5BemszcXhpd2Nsb0tuSDVN?=
 =?utf-8?B?VGRkV2dNWDFLNFJ1QUl1ejk0VTllZVg0ZG1DUGpRYXQwQ3pGYzlaOUt6V0lY?=
 =?utf-8?B?YmdmK1RHZFhCTnpnMEdxSHNZcTR2L3gvbUFUd2Mvamt4cGNXU3ZldnRuaG1Z?=
 =?utf-8?B?UmdXL2RiR3RjdDRVbWpqOVBpZFhNMmFxc3k2alJIeVE2YXVVYVBSZk4zMU1F?=
 =?utf-8?B?VWZFRG11TEsvTFZwQ1VtMktxZS9JdXVMMkZoMkM4bmxJV2x2UTRrSzU0UkVa?=
 =?utf-8?B?R2tPbU01SWRhcXZaMnFieVRGK3orOWtQdlJ2ZVQxOCtWb3ovTDZaVTBwQnVi?=
 =?utf-8?B?a0Qvc25XT1M1VGdpQlltSGIxVWt1eStPVFZSTkNkMWE3bmJSMlVvWG5LZkt0?=
 =?utf-8?B?T3djcGVzT204Z2F5bkJMSjlOS2tFS2YxRS9aR1hvWmR0VnlGcXhuTHNkYnlD?=
 =?utf-8?B?R1YzaDhpSnZBWUFGdVhqa25maldDaCs5ZlAwaUpjMGcxQ2VkRXNsVW16VGNl?=
 =?utf-8?B?dXRZdDlyL1V2QkZBZlVWVi9GRzl5c2dlTXZ2UlJvdkZCZERMNGxDM3p1OWdJ?=
 =?utf-8?B?STdhd3Q1dC9xNmNoNGVNRHU4OWVOYjlWZ21tMG1IVTVNNjRGN0N1WEtONlYz?=
 =?utf-8?B?TlZnVHJiVmJGNDlpcGwwM2lSUmJic3ZyejRFMTRrYTJkSW9sOUFtRW52d3B3?=
 =?utf-8?B?RHpsT2RLSWkrbFdVWTM3cENyYXE2STJSNjFWY2paUk1HcXhpS3huZm5BaVZ1?=
 =?utf-8?B?T3J4dS9sTjJJWVpwMDJWRmk2b2c5Zm5IM2hJQ3VETG1jeGtaaDFONkJWN2Jq?=
 =?utf-8?B?SCsyZTJnK2FiaGRvb3NyclBtMzVXU3VZRVR5OWR6WXRmOUtOM1cwcTAzWjNH?=
 =?utf-8?B?YWhVTStOZnJjcThmaE5oTUtYS2ZaK0MyeGxrQ2VtM09JRzRGOHQ4eUZKSkFX?=
 =?utf-8?B?UHNKc1hMSnY5cVNrcUZkaGtmRkpURUZ4bEdjUUVJODlyZjJCZW1aVW05R3dY?=
 =?utf-8?B?NWN5dyt3QnloUW4zdkpWMkZxNnF1R2UzbUZ5dWh4QTBFVUdjcFQ2SXB6OTkv?=
 =?utf-8?B?d29jRzg4RFc3SklJUEF6WnNNc1pNbHJkUWtRdGYwbldNM2hQcjNSWFZRaFVI?=
 =?utf-8?B?Q09lbjQ4TTJ6S2J0SnB5STVRRjVvdzNuYmM2NHNPYUp6QlFjUEJGa1orYnhx?=
 =?utf-8?B?V1QvM1FCb3E3cnRLRzVxTThxNnpQS1JwUXRIU2lyM0ZiSWJhdnpydjFOd2RL?=
 =?utf-8?B?bWtoenVkSFh6ZmdqNXpwdDlESHM4VEZnRCs5Q3lEbnVzN3l4Mk9yQ2RHdlhO?=
 =?utf-8?B?aWFtRGRBVWViVXpBT3ROSjBVOWs3UHJTV1kydWltMXJnSzVwcm83emxZTWM1?=
 =?utf-8?B?YTJHY2pIR0FHbkJ3b0FneCtHSnJiQ0JLRXAydzdJZTlmT3UwZDhVSjg4dnhP?=
 =?utf-8?B?RXA2U2VudThHUzZXdnFlQXJNRjVlWUlwRHY4VFJuOHNYNldmRjB0T2lyN2hy?=
 =?utf-8?B?Zm5nM0U2VjZnelEwMlRVMTgzcEpBdHNBRHpuTlU4U3V5VnNVOWE3b0t1UWNL?=
 =?utf-8?B?VkQ4TldRa2hlRHhmYmx4bjdyUWMvb0ZkeHUrUWFsenAwaHNYRG5qWHNZNCs4?=
 =?utf-8?B?Y3pwN1ZuWGNqNzZGSjU0dDRzMmhBPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4cf9644-93a6-44c0-6429-08dca4d1a605
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2024 13:25:52.2845
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fU9rEIvqDYV3skHNdJVUNA28nhWUmYJxdikjJLWteKne7E3N39e0MpFtR2U4+8A7xLfFdqCSrkBsCFZircwcIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9081


On 15/07/2024 11:44, Frederic Weisbecker wrote:
> Hi,
> 
> Le Mon, Jul 15, 2024 at 11:39:40AM +0100, Jon Hunter a écrit :
>>
>> On 11/07/2024 09:56, Alexander Stein wrote:
>>> Hi,
>>>
>>> Am Mittwoch, 3. Juli 2024, 22:28:39 CEST schrieb Anna-Maria Behnsen:
>>>> When a CPU comes online the first time, it is possible that a new top level
>>>> group will be created. In general all propagation is done from the bottom
>>>> to top. This minimizes complexity and prevents possible races. But when a
>>>> new top level group is created, the formely top level group needs to be
>>>> connected to the new level. This is the only time, when the direction to
>>>> propagate changes is changed: the changes are propagated from top (new top
>>>> level group) to bottom (formerly top level group).
>>>
>>> Now that this commit is integrated in linux-next I'm starting to see the
>>> kernel error message:
>>>> Timer migration setup failed
>>> on my arm64 i.MX8MP platform (imx8mp-tqma8mpql-mba8mpxl.dts).
>>
>>
>> I am also seeing the same on our 32-bit and 64-bit ARM Tegra boards.
>>
>> Any feedback on this?
> 
> The patches have been reverted on -tip (still in -next?) and Anna-Maria is
> working on a new version.


Thanks! They were in next-20240715 looking at this mornings tests.

Jon

-- 
nvpublic
