Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2046.outbound.protection.outlook.com [40.107.244.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2785214F9D5
	for <linux-tegra@vger.kernel.org>; Fri, 28 Jun 2024 09:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719565534; cv=fail; b=fmXbRdc8mrdqldC0beFIdcJlPIiwyy5hPsb5krEJQRQlcaFtlw9hiFsa5wRIyKA8BGBpGy6iCGDBOVZoKVcmeM+Uz3gqhTMFjSAjk11K3MyaGDkOpAiVkyI5o9RR4ftO0OIxN4zeXMCZEkhcaU8bs5iQ6K2hhBN84RGcwudrOrw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719565534; c=relaxed/simple;
	bh=XWl3RpVCUD5xYghAXeRtxS75Od7o3mVLhkdF0hhgJ1U=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=erD7JHXvHX8CCZBf42vXSymUFTnFZEYHGqdEj9dxqzt1v055P4IJva+gvMBCix0AGbT6o8E9Vn8lhJHv0j65U7EL4GH7HHVDv4pRFmMWxjf9ujbk/IVKjlYh4Tp6bTFDIgIIipNmnz87f0MMsJ/wXC9IeMY6UtD+Trsr1AC81cQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kInnWwJ6; arc=fail smtp.client-ip=40.107.244.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kInnWwJ6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LbQHBSG1z6/ohJZ9KpbXlBz6K3xbH9s7mW51impl26GHzuDXLTEtIqgbEXp5xBkzpiIUk662UoAiBa5eJNITb7lQ1kTGwn5zF36ybaZ56cLOE/d8o2NXj+W4Seh5lLiOyjNOCapeTTCEahX9ZQPKoz3RIVb0J2SD1V+XSS5aHXQlSSNRn5p9sCz3KjfkMK7n7o96XE0o7XyLK2UYwlkkl4O9cAFEWey306Mp7QNrSAJ3jndSp63I5ZOv1WuUXGk/rJ/nZWUCNqbiDqZinwzJBmZWBkPQkY5ckKWrrLH4ySx/yNSEcgqIOR7mf4CG73QISW+XFYpZow3yttW0krKuZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l95KPAxTgYBMbx1w43F6QEOPOlR1Efqc7ayDeOT+CQ0=;
 b=Dmq75HPTCecr2yJqCr3Za+bLjhaZL6r3h11IhYU4nD7dlvnH0N9oOBDtJcaaDJr1z/8q0HrYnDsoIaO4Qu/T1XjWWFvrCGP9PU/C20uPBQRQTk/Tj7JgNqWB6IPITewKZdzBOR7MpmnS3IMuaFLshk9SULxdFxEflETE38R0QIXXU6GmVyHOQ5qeusk+tlLR2zHZtJ1qdwVh7joVzEhZaTjd/s55FxzD2hXOkMdupW54puRNsRx1Hb4ujWeY7YqUZqeEXWHpKXOhmsXoqOXnW0MnD0iwQU06WRNpD5FkI7fwU2LUyPIlMJBxfmQ6ShQnOXsBT9f3Mmje6NavVdO4Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l95KPAxTgYBMbx1w43F6QEOPOlR1Efqc7ayDeOT+CQ0=;
 b=kInnWwJ6dypVG7POGqTJsvLRi6egHl6dAlfrbp1M9+3IKe7fkX86X9MSIAQADZZgzEEc/uydde9L6GxwFiLrglnFsnNiAAm3okaXf2NeXTPpglI4p5HaUG2Z+RgWzb2mJ4zpxELp0EC7E2ib1he8j6ays3XJ+n6hbtXGHTA62jsvcKLCzgjwIRbbRFrlfCENosHcirWL941BT44oSuTp16lSDBG3rKdy11ffEHOMXkt8kB09ESdSZ81djNyQW2c6gVTk1XgZmYDmVh1TPTVA52skYPUZxXY2vF4gYSQe3um7vDNKuzBIp8mQRJ4Y3FOtJiBhnd7py6w4Ujbr+QXd6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 MW4PR12MB7287.namprd12.prod.outlook.com (2603:10b6:303:22c::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7719.26; Fri, 28 Jun 2024 09:05:30 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ae68:3461:c09b:e6e3]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ae68:3461:c09b:e6e3%6]) with mapi id 15.20.7719.022; Fri, 28 Jun 2024
 09:05:30 +0000
Message-ID: <f8ddcef7-2f83-473c-959e-1808275a5e1d@nvidia.com>
Date: Fri, 28 Jun 2024 10:05:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/17] mmc: pass queue_limits to blk_mq_alloc_disk
To: Adrian Hunter <adrian.hunter@intel.com>, Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>
References: <20240215070300.2200308-1-hch@lst.de>
 <20240215070300.2200308-18-hch@lst.de>
 <89164197-7218-4f24-bf24-0e67a1882c78@nvidia.com>
 <20240627094950.GA30655@lst.de>
 <23aa9894-f913-409d-a385-8813711e2898@nvidia.com>
 <20240627111941.GA4523@lst.de>
 <9cb2b062-1b37-4d1d-8731-da69c2fe7a74@nvidia.com>
 <20240627124420.GA11113@lst.de>
 <0df2f214-0d0d-445b-96a5-03fd70da0dde@nvidia.com>
 <1a913d79-6a34-4b19-8ed2-6a8d5ecdbfde@intel.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <1a913d79-6a34-4b19-8ed2-6a8d5ecdbfde@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0648.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::19) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|MW4PR12MB7287:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e6f2ea8-1e78-494e-9a09-08dc97517581
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q3MvbHVjaFI1Q2NCelo3U05sdStOUGlHOC9iVlMxV1FUY0RPTkNVYkZWVmxr?=
 =?utf-8?B?L2dSWlZ3LzRoMFFFWXd4N1FtOGRja3Z6UFlhK09IOE93cjV1NEcxMFp5SStk?=
 =?utf-8?B?bnhsK1FYYm1kZG1qSDlkRHZYRUdQVzdlRUNCVytjZksrQ2JiMVNOS1hrbGNh?=
 =?utf-8?B?MEhaQ2s5NTh4TmpDbkszOVFsdkNVd0dqVDkxWkVwUGVxc1BxWkEycExvbE5Z?=
 =?utf-8?B?eE9kdXlSUlc3MGRBdHJxQVVHdEhRN2pJeUVzY1lLdCtiZGZmR2RhRzh1UVBN?=
 =?utf-8?B?ZEp0d3gvMFpXN1NvTTlLNVVLaHo0aXRIc1M3M1hhV0piOGFhajZZQXN0dzFE?=
 =?utf-8?B?WXZwV2V6RUk4UXF2bVZnUmRFb0huRk5FNWNJQzR6bEczaHdLUXF2dlpYNng3?=
 =?utf-8?B?bWc3aWlhcndNREphVk5iTFRjRXB6TjBDNjMrTXJDbDRGUnJkTlFxM01ob1VT?=
 =?utf-8?B?ejlIM1VBaXArQ0poRTE1bG5pRUpJb2tHeU1ONTd3elhkWUF1dEVoOTZuNDMv?=
 =?utf-8?B?b2pMdlp2c01QbW1zMU9ZN3JidWFpK3lrWG9wRWVOZnNQL0R4RWhVWE5BUWxS?=
 =?utf-8?B?MFRGenZjcEZDb0pZdm5rd3FEdFJocy9pQ0YwVGxYMU9SaDI2SUJ0akphWU9Q?=
 =?utf-8?B?SEdzeFVsU3o0d3djYkZ4VGlEUWY3SjJaQ3NLVzNpajVvc2VDOGdkaVBpc1lp?=
 =?utf-8?B?ZFZUb2hpNC9hU0VvTk1Qd2xUZVJLdjFVbUNjUjRwZlMxNzhKTkNRRG1zZ2tr?=
 =?utf-8?B?R3Z1ME0zNTFCMFpydGZmd05JQU1sZHVUTGVLak0yZzByakFRZGJRUzcrUzYy?=
 =?utf-8?B?RTJpclFoM3BTcXFwVkV6MjViU2Q2RlRhU1JBVEdJUlhzMUVXV2tOZGZIM09T?=
 =?utf-8?B?QzZPenRJQm5ucEozT0x3QWhaYjJSMUVJYVRlMVF4TjJFRmM0d2NYejRYUGF0?=
 =?utf-8?B?MnpCRHV0N1F5Q1lOazFVZDZVczQ3TE05RFBzZjY5ZGRSK0VUOVpQb2hqNEpC?=
 =?utf-8?B?S0RFY21UdW5LaU1YTTBVWnljTUhsS3ZVajJ1Z3hjLzhqZm5RSEJSVDI0Nmpj?=
 =?utf-8?B?eVRsamRGWjhzbEhHUTJKck8rUzM4Q0daWExCMzRBMWp6dVBST092aDBSTGtO?=
 =?utf-8?B?UzllRDlKdnVhMmo4QmhpYXFYNVhPeUtNMUVFNmp0WndvTUdvQ3dPRGRDeGdJ?=
 =?utf-8?B?V2svNW9QaDlzNG5HUEJEZm40ZmR2WTBiZnBpODQvaWpOWk9TNUtjUXRGajIr?=
 =?utf-8?B?bzBHVm15TWl0RnBGZW5mM0UxYXNiWXJQQWZkRkllaS8yMUZsQU5kTElTUGpF?=
 =?utf-8?B?QWx6bG53b1JEZEIxMEk3TURBZWVqbDlLM00ycGJpWUVpdjN4YUhNd0RVQVdK?=
 =?utf-8?B?bGR3c2JzbnNvSGpnWlIwNXZxWVcrcUlXK2NaMW12SEpZeGpJMFE2OXgwT3FQ?=
 =?utf-8?B?NGwvL0VqajBxTGt4elA0czAxNWxhckhOQk1ybGVCZnc1emNJZ0ZWS2l1cG9C?=
 =?utf-8?B?MnVDTW96MWhTTkN0UUJqd2xFLzVNcEkyTldOYkV2MzdJckpuNFJKMmoyeEFy?=
 =?utf-8?B?ZDk5ZytJUU9WRnFYb3RnUGJFVmdXaUYwbTRDYURtSENycThQcm1KcHhCdm9M?=
 =?utf-8?B?czJ4cE1DbjJMU1UxUWRIbEJGdDdzZFJiS0FaY08vSTB6YVA4b2pPR3F3Wi90?=
 =?utf-8?B?YU9Nb1RHOFdPYmlnVlM3UEQ4Y0dSYzVFQWVSTTM4ZkFUcFpZd3ZSa3ZvL3l6?=
 =?utf-8?B?M0pzT0RqZlVTaGk0WFJtaXV0OWV6TGl1eDJzYWJXQWY1a0pFcytVSTNWM1cz?=
 =?utf-8?B?STBZaEFZNDJQMG1tdHV4dz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZllEMkVSL3VVQ0kzSnNrbzN5Y2dRTjhyNmZJaHlUT1huMHNqL1pUNGx4RDA0?=
 =?utf-8?B?Rm12MDZwU0FmN1FDQ1B0V1RETW53R0ZNbjZibVNtWnI3T0xzd1Q3NEw0czVD?=
 =?utf-8?B?dE1FUE9IWEZCNUNnQnI0ZXFNUE1NVTVnNFo3bzR5enFDRE9Jb05NMHZmaXZ4?=
 =?utf-8?B?N1k5WVhoU0tvcVZJRnpuUTNpV1BoY1pLaFVoNVNUa1B3S1Y2SXN3Qyt4MHgr?=
 =?utf-8?B?RmoyRzRFd0tPcmFGdVhlQkZNQitjd2hXVWh4R0xIdTZpL3ZkdVF5cHlrNFN0?=
 =?utf-8?B?YkkraFlVTlA1ZVBwTkZCYUgzUmtKNUJQMStEYWwwd2tJbkw3MHhMOHNaVGJZ?=
 =?utf-8?B?cHZkbHRtc3lmY1gvYXdCS0ZBMWFHWGF2WTFFNzFoWnBMOTdoamtHNUlFVCtD?=
 =?utf-8?B?ZW9EeGM2NTgyaDhxQkk5WjkxSTYvcDJybGVwbXQwK1Rmd09kYXg4YUYxR2dU?=
 =?utf-8?B?cHh0V3d2VHZRZmlmdDJ1MjR2ck1XNDhMQ25SMS9HRWIrdk5FcDFWUThtN3I3?=
 =?utf-8?B?M2RUekM2Z2NxdTFGNmdaTHhkaVdzdTZHNktKMFQzYXJqNTRZZklHY2svd2Iy?=
 =?utf-8?B?Nktid2JrNFQ2UG12ZUk2emdjekZoRWgxQjB4RjB2VG9ER2s2eWVZbWdSRTRt?=
 =?utf-8?B?Vmp6Wkp1bUNDb1ZabUMrcjNJcXZ0ZmhBbTg1bWNjL2lCUEVUVjJNa1VZSkhr?=
 =?utf-8?B?WFVkQ2hIbnFWblRqRFBsOE5kdXVOcmRobkRINWJWU1JZRnFWa1BLZzlkajlB?=
 =?utf-8?B?YTliR3JFR1dGMVpBMGIwZ1NpbSs4MXNYcW1odVNYOUV4dkd6dG14VkhQQUJt?=
 =?utf-8?B?WldPZThYVnRaSW5JYW56NFZ6by9lcDdyengrRVB1eStrcEFKMnVLeTRyd2dQ?=
 =?utf-8?B?WWNFSHVxWDBZUG8rWmd4aCtRSk11N3luSlQ1UTlBUCt1NjRrNVRXMWhLUnlm?=
 =?utf-8?B?Mnd4WG5MUW5NVkc1Y0NmTXVHTTk5NW0xOTY3eUovMHVxOWo3NkNMbXJDNkRu?=
 =?utf-8?B?Nk51N3BSd0Vlb3NWVTQ2UzcwT3pLclJjSUM5ME1vMXNPazFkNVpNOUdSRVdR?=
 =?utf-8?B?QllMNzBIcG1uQXFOMFl1MEpEVU9sMitvN1VMTE5yUjYxY25tcW8yK1c4WVN5?=
 =?utf-8?B?b1FVOWN6T2lzNGE3SnZHWXdMaWhKcXF6TUZlNzFWa2RBSWRsNGhuMFVxUFpS?=
 =?utf-8?B?TjZia0lrUGdLQmFrWGxrNk0rWFJwcTlLOUlzQVVNYUlMOVNyckVPalRnNVpu?=
 =?utf-8?B?Q2xERDFpUWs3R0xGdzFlRDNvQXFEVnhZeHBMenlpSlJBa0pCL3NaN0lCVUdv?=
 =?utf-8?B?RjJha0tOWG1kcnoweW5MZWdVcGpvR1BJMWRhREFZOTdoQVRCY0pISWQ4aHhw?=
 =?utf-8?B?Qi9QZE5mRG45S3BSSDJwaXc3WGYwL283c1kvVGFRWkh6eEwwR1B1dXNuQ3Bj?=
 =?utf-8?B?MTd3N2t2bmtvRmFNSTFpTnlkSWNYeWhFWTN6R1pDOHFRVHY3UWRjVnFVRXVB?=
 =?utf-8?B?MnZrRDJSa3U3Zkd4RXgwSVZTSk9CRGFaMFRwUjBDaGR6bnNiTXJ1Q21HMmZJ?=
 =?utf-8?B?SWFVbkY2a0RmbXJJM05LSHExeGQ1bW1mSW96TitIRzRyS0p5eVIzeGYyRnJn?=
 =?utf-8?B?SCtKZEhwTWw4QkxHL2x1NTVhUFJKcEhCa3QvQ1Y0OE1lMHMrMUN2cGNtMjgw?=
 =?utf-8?B?ekhxaVloK1V1UVNncWF2OU5oM3A2M08yeEFTZy8yUmRRdzNBVWJmY0VSc0hO?=
 =?utf-8?B?QllkNk5KTzA5VC9rckxJTkc2QW56YkM3bldJZy9oSXN0aXZqYktVYkpMTU43?=
 =?utf-8?B?K0l6dVlFM2lQTktRRHJ5bHBRRFlxcGpwa3JZUHdrMUczUTVLbGEvME5xYURp?=
 =?utf-8?B?dzdDV3FRYy9QNXZ6SGd5NUdrZ0hGQVlvNnB4Rnp0M0RLV3lSa25GTHRZMnla?=
 =?utf-8?B?cHorNVgxekdMWXcyQVpWRHVlRkQ1OGNwV0daTWtlTTNMZFdpcFBnQkZ0azBZ?=
 =?utf-8?B?cnlueklnTGZUYjluZURYS3VUNlBveVd1VGZ0RXVwQlFsVzhaaUMrYmZZeGhK?=
 =?utf-8?B?YStxRHpQT25ISWd0WUpranprTXFON2s4bkVwOERVTE5CWHgrTXB5d3UzWjRS?=
 =?utf-8?B?cW4yYUQ3SGozYkR1ejZNT0p1QTFac2h5c0lnZ1lGRlp2d3lob1IyNnlBUndH?=
 =?utf-8?Q?m1MRH6nj9xsgE/0yk6MOZlKWRIz49973/0H1HMMcTpjc?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e6f2ea8-1e78-494e-9a09-08dc97517581
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 09:05:30.1647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: URKIW2xGXP9hUTzKkldlgolZ9VHezfajv/VFQdf6scQUf3/YeOqGIJ2VaqrLDk2n3gkxy38rOTK/b95R41v9RQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7287


On 27/06/2024 14:44, Adrian Hunter wrote:
> On 27/06/24 16:09, Jon Hunter wrote:
>>
>> On 27/06/2024 13:44, Christoph Hellwig wrote:
>>> On Thu, Jun 27, 2024 at 01:30:03PM +0100, Jon Hunter wrote:
>>>> I have been testing on both Tegra194 and Tegra234. Both of these set the
>>>> above quirk. This would explain why the max_segment_size is rounded down to
>>>> 65024 in the mmc_alloc_disk() function.
>>>>
>>>> We can check if this is needed but if it is needed then it is not clear
>>>> if/how this can be fixed?
>>>
>>> The older kernels did this:
>>>
>>>      if (max_size < PAGE_CACHE_SIZE) {
>>>          max_size = PAGE_CACHE_SIZE;
>>>          printk(KERN_INFO "%s: set to minimum %d\n",
>>>              __func__, max_size);
>>>      }
>>>
>>>      q->limits.max_segment_size = max_size;
>>>
>>> so when these kernels actually worked despite the above warning it
>>> must be ok(-ish) to just increase this value.  If that is best done
>>> by dropping the quirk, or changing the logic in sdhci.c is something
>>> the maintainers that understand the hardware need to decide.
>>>
>>> The patch below gives you the pre-6.9 behavior just without the
>>> boot time warning, but it might not be what was intended by the
>>> quirk:
>>>
>>> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
>>> index 746f4cf7ab0338..0dc3604ac6093a 100644
>>> --- a/drivers/mmc/host/sdhci.c
>>> +++ b/drivers/mmc/host/sdhci.c
>>> @@ -4721,12 +4721,9 @@ int sdhci_setup_host(struct sdhci_host *host)
>>>         * be larger than 64 KiB though.
>>>         */
>>>        if (host->flags & SDHCI_USE_ADMA) {
>>> -        if (host->quirks & SDHCI_QUIRK_BROKEN_ADMA_ZEROLEN_DESC) {
>>> +        if (host->quirks & SDHCI_QUIRK_BROKEN_ADMA_ZEROLEN_DESC)
>>>                host->max_adma = 65532; /* 32-bit alignment */
>>> -            mmc->max_seg_size = 65535;
>>> -        } else {
>>> -            mmc->max_seg_size = 65536;
>>> -        }
>>> +        mmc->max_seg_size = 65536;
>>>        } else {
>>>            mmc->max_seg_size = mmc->max_req_size;
>>>        }
>>
>>
>> As a quick test I removed the quirk for Tegra194 and that did work, which achieves the same thing as the above.
>>
>> I guess there are two open questions here ...
>>
>> 1. Do we need the quirk for all the current Tegra devices? Thierry and I
>>     can confirm this.
>> 2. For devices that need that quirk and use 64kB pages, what is the
>>     appropriate way to handle this for sdhci controllers?
> 
> Probably just do what the block layer was doing e.g.
> 
> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
> index 746f4cf7ab03..6a1dea0d8d64 100644
> --- a/drivers/mmc/host/sdhci.c
> +++ b/drivers/mmc/host/sdhci.c
> @@ -4724,6 +4724,13 @@ int sdhci_setup_host(struct sdhci_host *host)
>   		if (host->quirks & SDHCI_QUIRK_BROKEN_ADMA_ZEROLEN_DESC) {
>   			host->max_adma = 65532; /* 32-bit alignment */
>   			mmc->max_seg_size = 65535;
> +			/*
> +			 * Block layer cannot accept max_seg_size < PAGE_SIZE
> +			 * whereas sdhci_adma_table_pre() will anyway split the
> +			 * descriptor to handle size > max_adma.
> +			 */
> +			if (mmc->max_seg_size < PAGE_SIZE)
> +				mmc->max_seg_size = PAGE_SIZE;
>   		} else {
>   			mmc->max_seg_size = 65536;
>   		}
> 

I know that this is expected to work, but just wanted to confirm that 
this does work.

Jon

-- 
nvpublic
