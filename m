Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2074.outbound.protection.outlook.com [40.107.92.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C578727FD7E;
	Tue, 10 Jun 2025 13:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749563209; cv=fail; b=TfG9Xz3slLrSMyiCikHS1Px9SKDw7h2HJp5WFMk6iKUoBUbs1OaoMSXjg5nRiN5HpuZYMyaOsOYvPEXHu4KHTfZzYkxdcGGuf6fgl4I64m8LUPZg9D4EgocEiguurU7yQlGp6C1xQRHjmHSYAaYe905wLuNfoLV6MwMy2VPGAfo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749563209; c=relaxed/simple;
	bh=3KCT8LW1k/Fow98rigys2kb0Y/vjjNIZX6fSryVQboo=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oyxxeVG+P0Nfli1GZbqy/9xD3LCTLIBGCtx0du/jQc+O6mVTebQGLFBtYSAxIu1fSAfB3eJ0fGm8wgjIed0sdsHcKhozwbjRTC/SeVfW39TgYnu9aKel01jv3ZTGUfiv2U4eI2UQvfNOxDVoay8p3+MrDtoSpjJbFQCGMVkqVJk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VMuVWleU; arc=fail smtp.client-ip=40.107.92.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VMuVWleU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o7wBfwFl0D79JDal9BY9Ry3LHVUMgt2bKGUcrxG285I1b5nvEJjlnWukS6pjmIpdzPS4lwvynHUOiUb0h9/r32P2SSFbAYVK7CRuYG+zngjJ/1qRa2pUNaVadSINFzV9yq8Vu1FM9mBg2pJe+Hdsjme0CA5jZ1wi5CCG9ebxGuJAdvC7YJSS8G7v7pXzHxfy0qCoU8QlbvKLt5Xk1gPW1+Y+t4bROo6ee9lQpjCp2b+soiL7ohMu1bwn/rhOw4ncaKdx7G56qOpO4xpAf4IXp+ElEVp9fgGqQYf6IoLknqvcC0trmID9YQ1DQbwaa8QoCwiieuGKDdEspPO6yZ4oMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RG//rHfVD1VuwMOKVsJ10Sc8fwijFnLtCoY6JwQxv60=;
 b=vtcylQ9XT2RhobUOdfOqRShjG/iAWb9vSZB05OhgiWnyUD6PxQq84aVxyJkoxcf6WcDiTSdiNkZaFvEry7Do2diq17BP1oZys5Ift0NmVNxgrwS02o6C/CRdF01enVOdIRuVQimkLwUgZF74ji0tmm1CU3jG6ffgxdACWLoevbD94UXRvjtO2JFaTvGeDRMglzTosYWmOsUN7Jeaj3DacDMwrnOQZmHeZXGsGfJ4h6YLzGcfmGtSAtFDGhTsn92HIFgymnRdBjgzPDhj/p69DYj//kCjy9gARvWhmGgUMq+TdKcaW3HrYGvFQjIDIgLbmDPDzlN+BQY3PNCBu5em3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RG//rHfVD1VuwMOKVsJ10Sc8fwijFnLtCoY6JwQxv60=;
 b=VMuVWleUgM5CERXP1Huxo1W6fbnsdaphLU7OfSSFYTsXCw3Xn1hRcw+oMtzUcKKJIyBONMUPIauDcEkdtGwgHA+fwqeDciqgSET6btscsviAzyNE5ODb4QlLy1YsMkoHm5uLZO9sl/pShRUQ4GPZzvJ3XOfMSr2erNzOdgkBfT53xIpepu2wc/yM6uieG19G4wqCB40NI+iEGuXS8dli/R8DVVkq/CVrLxO0NQ2oQF1eg55f0KZsYq76MgA0JoUzuUhwaoYECesOJ2OwAJSMd+5GQsqnidtR4ODUl3OYrCjkBp2x/lwy4GrynzSrqrpuLKFO20RCJHa0/kWUA57D/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by IA1PR12MB8312.namprd12.prod.outlook.com (2603:10b6:208:3fc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.36; Tue, 10 Jun
 2025 13:46:44 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%3]) with mapi id 15.20.8792.036; Tue, 10 Jun 2025
 13:46:44 +0000
Message-ID: <bc15a890-e2ad-466f-8880-2b3a16a1bd5c@nvidia.com>
Date: Tue, 10 Jun 2025 14:46:39 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 0/2] Disable periodic tracking on Tegra234
From: Jon Hunter <jonathanh@nvidia.com>
To: Wayne Chang <waynec@nvidia.com>, jckuo@nvidia.com, vkoul@kernel.org,
 kishon@kernel.org, thierry.reding@gmail.com
Cc: linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250519090929.3132456-1-waynec@nvidia.com>
 <9d00d20f-f766-4b44-a162-35a70ebc6041@nvidia.com>
Content-Language: en-US
In-Reply-To: <9d00d20f-f766-4b44-a162-35a70ebc6041@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0060.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::20) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|IA1PR12MB8312:EE_
X-MS-Office365-Filtering-Correlation-Id: 34330b91-86bd-4ed7-16ad-08dda8253cdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NGVBdWtXNll6a1YzMkZhUXMyOCtvZVJKT29zbzhhUXRYc3pYaFlQQW1SbEty?=
 =?utf-8?B?NGVSM2t1K0J1T09zL2hGZjJkZ3djZVJLclpIUEF0aGlvRmFDbEVla0x3NHpN?=
 =?utf-8?B?WGVDZ1ZqSkZXUzNHNDRFZXNHaGZIbEF1Zmc3bC9KQ2xEZk5MWW5oSVdLWk1v?=
 =?utf-8?B?ZE9KUXZHUTJxaC9sZlNqWE5VdXBvVGlGUC9nTzVjbUoza3JMaHlvdWh6Rm1l?=
 =?utf-8?B?VERNSXJ6dXRWOEM2aVVlOWhLTEZldmh1emZ0L1NKVzhWVzA5NzBDMnVLZ2lR?=
 =?utf-8?B?ZUZ5b0FOdjdtdHJpblBqeTdMM1ZxOVdtOUFMUDRLUys2N0Q5WStHZjYxTlp6?=
 =?utf-8?B?a2NocFJtZVZvK1ZSM3dkV3o5dTRvL1FWZENDN3FibmthMEpWY3hvTml1Q3Bu?=
 =?utf-8?B?SHlnNThIVy9ZeEJvTk9HK2JndlRVNUp0VkJCZnhnN0NLdkhudU9zditkUUdx?=
 =?utf-8?B?WWpFNk5CbTEwZW1vYjJOUzdQRWFnOEFOTnl6bEJCWC8zZHFPQlllOFVWMlJm?=
 =?utf-8?B?YUJGMWRvNnVqbG5xSkhHK1RrWUMyUDNGRGV5K2w4RVRJZWVoZTV2VXNuZnc1?=
 =?utf-8?B?SlRzVWg1N25UWEZwTHFDcmVidjVaczBVcy84UUx0Nmp6bndqUjcxaVZaSUFS?=
 =?utf-8?B?OFVVVTNEaTRoaHp2N3pGRGlRYldFdzF4bTMvc09yY0dZWkdwOFl5bndXeEcx?=
 =?utf-8?B?VktVcHFzZDVXTG0zTmVhclhMeVc0MmMzazh3M0Z3UHhIamJGZG54UGt0OFBu?=
 =?utf-8?B?bDNyMitvMCs0YmxhcDYwY08vdXEvdHVhMDgzVzNUVm1RUVVSelhGMkdQSVV0?=
 =?utf-8?B?NmlQelpxeUx4MnVPclk1NDlBSTh4RkorNkpxRXVMTWkzZ0R5OEQyb1l4NGgv?=
 =?utf-8?B?MUt3bUl4algvSlNWZzR1Y1JVOUhvay9JdFVwVXBoZEZXMlF1RlhpM1oxbGtC?=
 =?utf-8?B?UUFBa2JFdE1POE9Pd0g1TEVnUExDRTc5ek8raGhQazZ3bXM1Uk5ucEJKZjI3?=
 =?utf-8?B?VGhrd3JSR3lPdHQ2NGx2SmdaRldrbWtHS2JYbUhleXI2YndicXlFOUxNT3ZB?=
 =?utf-8?B?WFJLaVIxdjFBWkFtNlltQTRER2dDa2p4cS9uakJVRGdhRGRtR1kzY1hIdVdy?=
 =?utf-8?B?bXJJdzBVQzdiSEJjQjFTSlh0VCtXem5iSXV1S2Rpd1QxdnNyd3RDd3VlQTdK?=
 =?utf-8?B?SDF6aHhVMW9HdEs2YUZmeXJLVHZLWmF3dmE5bGNQZlpEaHRpZmdKelhrZVFD?=
 =?utf-8?B?dFZSN1g4THh5YkJDRmlhaEtRdjJKa3V5K1ZYRHZISXZEYjVpZXJ2RFlaMUx5?=
 =?utf-8?B?b0JZaHNOZjdxUTBYTzhjL2loSTB5REFZdzBGemIwYXM0T2JBOERCMktoK0dF?=
 =?utf-8?B?eGVKRjdWdXVpNU1BU281MEVmKzVGSm9DYjYzUC9OUnpmYzJFK29ia3Y3Q01V?=
 =?utf-8?B?SFRFbm1iQThRbzBvSkxGYjZ2VG1BRkJKQmlOZFA1YS9SUlNySTZ4MFlNZVNu?=
 =?utf-8?B?aFZFb3dkVEZ1Tml3LzVVQi9KUmNYcVFxTUhCdDd1T1ozZS9taGwrR2FqU1RT?=
 =?utf-8?B?bnB2bUNhb3pXU0hkaVlBcmVpTVk3QzI4ZHJJVWlFaVBmaXBEbG9OazE4WlM1?=
 =?utf-8?B?cG1jL1FEeVdCQmlNM2l4Yi80REJCaWEvWTFzc3FaY3A2L0JPN0x1SWhQdytI?=
 =?utf-8?B?TFJRcjdicjN2RmhLR0lUYWdEN3FUSmNWNXZCbTE4VnhqM2RRT1M0Ly9WYnRR?=
 =?utf-8?B?WTMveEZhSDZmR0g2NzYyYU5FSWR2Rms2djVlMnV0QnFZVVA2WEtlOWRzNngr?=
 =?utf-8?B?ZmJLVVBBOGd3N1hJN3BvbGRFTmdURFNZUGp6QytxNWxZa25ra3dXa2JoODFy?=
 =?utf-8?B?aFBOQVRHOE9WZXFPd3p1L1BhS1JhY2V1SndxL2VWNmxHNGEwZWJRNU5ZZlVo?=
 =?utf-8?Q?a/8tRP10Nqw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NmZINEtKcmRGWVB0MHhKemwwbk03NktzemJyOXhjYmUxMEtXTzhNU3VWS0lQ?=
 =?utf-8?B?cGRraXkzT1IzdHlCK3BQZTFQdXJWOVJwZkdiWUpIRkNydjIwV3VTcVJsb1lE?=
 =?utf-8?B?dllIUjA5d29wTDl2d0RIa2loZnB5U0R2TUl6K3VUQm8wVkJSUERDQlVBNVR3?=
 =?utf-8?B?QlI2TGw0dHFUcGZGSVY5V0RveVZHQmpwSmhTQWhOeHcvQk9vQXhPWnY4ai8r?=
 =?utf-8?B?aW9GNEZyYUVzR1JlMllnT0dESitGT1FsU2JXMXp3M1YxNFo3V2VmdTNGK01p?=
 =?utf-8?B?NEl3eUF0RHdSMXRSazlBWnB6SGtCc3FLOVZ1aWlQNDMvenA2QnpTYWhHSUhM?=
 =?utf-8?B?UHplLzg5NWNUZUtnOVVGTkFZenYvL2hmUlJHV2U5QjdmVzBNbVY3aGRuUTRE?=
 =?utf-8?B?NlBQL2xleW5scjVGZlJCVjJodW5DYXhkVHVVRWZ1RFhJUThoQkxpbCticFUx?=
 =?utf-8?B?WnRlak1PNWFjTjRUaUlqN1pZa0lVNjJlQW13ZTJLdkpLaUVaMHNjdExIN3lT?=
 =?utf-8?B?WlhvaDhic1l1d3ZwQmIwYTBtRktUQm1OejZOOUdEQU1MdWJOSmNOVkxiL3ZD?=
 =?utf-8?B?ejFSdXhpQ0pqWk10VEVMUkVBTDJpdkJMNFN0UnNTeVJFYTcwQTl5YnYxZUpR?=
 =?utf-8?B?bUkrcXp2S2ZOT0ZabUxFdGpVbkhCTjhRTGE0UHRBenNiRWJ3eWg4YjFVcTdX?=
 =?utf-8?B?SFhPRXozQldYa05Lc3JWcUg0c3BUUFRLTUh6WFRDV0FtNlM4OWNCaVFFK1ky?=
 =?utf-8?B?NWY3Vk9mZ0FHOEhTdzJqNEJSQ2l4aDNxQWY2UU1RelUwNm00b3JCOVh4d3V1?=
 =?utf-8?B?UGFjYlJ2Yi9hSENEVDlFbU1xTkJJemJYUHJLRXZxTjkyUWttYTJOaU9CeU9n?=
 =?utf-8?B?MUtzTm9Pemo3L1BsVTcrVE1lb3Jwd0psdTlsSFJubFFYck9pZGRzVldxQ1RL?=
 =?utf-8?B?Y1JLMklkU29TQWUxUXI5RTJ1S0VSaUNFMk9lUnVSVHg4ZnpPbllSa2swMW9r?=
 =?utf-8?B?Q3V3aGtSOXZldURnSEFkbjVjV21zeDVYa01HTFY0Zlg3ZFdnWmJqNVhCT05q?=
 =?utf-8?B?ZkVzakp3bWovcU9QTkRnc1p6bXZHbS9mbWUyNVlvQ2Y5VkFHWnBTK1JuTXVQ?=
 =?utf-8?B?Zkx6WHo4ckFsdHhYajVTM01qbzlrUUhNemZwVzQrY1F4eFpOVmR0SFdHTjNI?=
 =?utf-8?B?RzFKY0orNUJIVVk2Qnh3dU9KSkNLNS9QTFZ0RStBTHF3MVVaQ2Y1azBDbU1Z?=
 =?utf-8?B?R0w4NGVoYjFyQ2l0K1RVeHdZM3RqNFN2M2s3K1hJa0F1eHp5MXVDSFcyZXov?=
 =?utf-8?B?TTlxVEVvK1pXNUJ1M2ZmZ1p0VnZzVzZZTmhmZFNEUllheXBMQ2pBREFIWXZo?=
 =?utf-8?B?TjRkN3F3Umtlazh4cmFjWlhKbzBlVENDenJVclVkTktrSWFYSmh1VGhrVkVB?=
 =?utf-8?B?RHMxR2FEQVlja1VpRjgyWWIxRzUrSXd3QXRxd1hSZlBQWjZJbnIya0pUMEJY?=
 =?utf-8?B?ei81emRxc2dlY2lmMnFGa0twWHVLcVpJd1VCM2lINFhjK0NHTmxFTkRJWEl5?=
 =?utf-8?B?Qm9ISTRkK0hWMjA4YklJVzk0dzFSalUxeGFCelp1TDNUdXdSZUpKUjJKcHhN?=
 =?utf-8?B?K2J5MGRrU2g5QmpEWnJHSDJXa2VNZXZDVGIvV213MmVvY1Y4dzVObkVQRE50?=
 =?utf-8?B?b2ZyN1ZWQzRqRVBhY1FFSkFjSjRNSThISi9CY3hrLy8xK1k1cHhZSTFOR1hE?=
 =?utf-8?B?TTRMVlhMOUY4OUE3cnp5bVJlRWtBRzIvNVNyKzlmd29WajQ2bWNTU05sbHRS?=
 =?utf-8?B?VjRxWEFDQjJ6ayttZUIrZm9EQlNGR3pNVDRLWnBXMXdFSFRKckFzbStrY1Vt?=
 =?utf-8?B?WTEwT1Q5dFd4TXVFYU5USkttSjVtT1hpeXcvVGVhODcxcWhTN041eTIreVRT?=
 =?utf-8?B?MmI4ZC90Z3VEVzhYQjFjanU0cWN5R294OWJQRFIwcmV2cDdMQ29ReGFjeWQr?=
 =?utf-8?B?dldvUEpxZ0lHT0NaMWlxNUllMVJRLzErQ1paakRLYkRiVXRCUmt6cmJYeGhJ?=
 =?utf-8?B?cGZxcEpVZThBZmRhM0hvN0E3ZEYrZ2dRc3ZFdXoybi9XUWV6L1lZRXBpSDNC?=
 =?utf-8?B?c2ZTMGxvdHJFMkd6MFNHNmQ1bFJETDBzUFlPNGJGLy9yUlppVTNnRVZHcDF2?=
 =?utf-8?B?b3BGUWVTdnBQdExNRERGdSs1aVplRUt1M29HN0JsS2hHT1BpNE9KNnFqTlFj?=
 =?utf-8?B?MzVzclRORGFmMDJGRDFnT2RBVUZRPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34330b91-86bd-4ed7-16ad-08dda8253cdb
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 13:46:44.7432
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b/BkyqKio4DJwt9xom93x7VxiilmABr5qe3+dfB8fWJ3IFBVfZBClTF0JNwm/ROZk2iDjT2Ar19lITZTvLyPnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8312

Hi Vinod,

On 20/05/2025 13:06, Jon Hunter wrote:
> 
> On 19/05/2025 10:09, Wayne Chang wrote:
>> Decouple CYA_TRK_CODE_UPDATE_ON_IDLE from trk_hw_mode and disable
>> periodic tracking on Tegra234
>>
>> Haotien Hsu (1):
>>    phy: tegra: xusb: Disable periodic tracking on Tegra234
>>
>> Wayne Chang (1):
>>    phy: tegra: xusb: Decouple CYA_TRK_CODE_UPDATE_ON_IDLE from
>>      trk_hw_mode
>>
>>   drivers/phy/tegra/xusb-tegra186.c | 16 +++++++++-------
>>   drivers/phy/tegra/xusb.h          |  1 +
>>   2 files changed, 10 insertions(+), 7 deletions(-)
> 
> 
> For the series ...
> 
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> Tested-by: Jon Hunter <jonathanh@nvidia.com>

Can we get this into -next now?

Thanks!
Jon

-- 
nvpublic

