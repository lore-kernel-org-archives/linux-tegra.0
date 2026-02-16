Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012000.outbound.protection.outlook.com [52.101.48.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF2A7261C;
	Mon, 16 Feb 2026 05:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771219124; cv=fail; b=aUxh7LfqyI11G+ch58cNdzS6F3brgNuU6t3GjwSmFLmHdkT3L2nnG6VS6WINefz1A3x3mxDv0w75YeG2ttY0v/jOhzy54QhRnAYOcEHJTTo88C7jvQvxgseZoWSZfLIYk78ax1X+Y0lPCnbGrqVFeugQpfA0Dc0rLvORXoUBhu0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771219124; c=relaxed/simple;
	bh=O88JKTJ0FXXaoAuXuZSFKpyDu23ofM7PDOT87UzlDjQ=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rQyqeibwPPfeWN0IK0ojwcIlWX6dJcS7GX0hh41ZCbBKkigZuFFjj5BzPwnB4wLKxB7UIVYj2wzdhu2+Zf2lvNLEhK/CbDGV12slvWw8u4gDugTugN8HE2P4ZenRFEdM1yXF2/ybHjqnexTHQHogA/CYlF6zPETkd39naOdUo3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hJL2t1j5; arc=fail smtp.client-ip=52.101.48.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hJL2t1j5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fhr2ioBpaDSkqSw+Yg0l3rW7x99IcVev9arQuVAqvQa8G7ROwbv6hbFeM6ml7o8x3M2qzdw4+4v39afUd3YEkcItswkJWjSdJfjk/a8jvY3v8T/Ld+eLfxTQ/bzOrg1qhNR6+S69kiJ60iQl0jriKFvUSHs/YRoON5dXURHfrGHCK57M+audWlLO+9bGZ1btT6yz4mLamkFd8QCRt+Eswa/e0qZjjQpOEsnz9yLrEJABgNMPMjUUA247ceLvQue+nzViCHrEbny24ODKRh5JHwx+QnzkBap5pJbLcmszA/8mNOpMYM6HyTPu0Yr7GhuE2Sr/lPif0VQwTb3D2ts3Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/++j6Wd9Dd1cZUuJOSZO8nRHhNPxxOYtDwFCc10HKfg=;
 b=P7eDRfAV7EQXShwdw6yhxCuFuhtxRvve9a/RmxwTsPdJ/Cynk/ev75Bl2lJh0RhLWxHFrwhp8vKnIsdX4g1zaASILY6TUKQydarebYiD5af6iGO33HBAt1JlY0m1LoEzSYPudKxHBwHCQ2OcZTpNDTi7r26DzQo0kIs+rVgU2St6Z3bqqhP2flEE4HEH8aHPt5bV9Spw9zeDOelOKEaSOk7DveHp37ZHPpf1OOmsaCkcJtJRGj0qlWfnjlYFwjsIM6j4ZjsGKr34E8ttdK0/Hmqfd/CpqLkXjpcZN+IjmBzVEEY1hH9XAXmUINDwt4EShV51zv813KeHTZAQAHvzPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/++j6Wd9Dd1cZUuJOSZO8nRHhNPxxOYtDwFCc10HKfg=;
 b=hJL2t1j53cl5tUYjxLRLsAClbCn2L9fbmPRHl8fk08wOMLG6TRjBMRS2bL2XzN0JxNjaUPLqBPIxPRTK9dK7V7U+DQ7zjmYxenfHfG9uyzX//A5pGxejI4dS4GkFKLissCD2SeCewG/KGQ6tNJFhNh7D1aQB/hpFxJFT1fuYF7f+d0xl+qE0eWlInYfNznq+XO9BpgQXy6YoF5iWpswhuer4BNGKNlX3dDJpQ5W3pRcZNlFPH+QDJzPDaRqp+1RW8sKtCMSSCSa69HtC/fdfVdlQrJjJABqpPEypuGuAdxvlcoMHD2HXV5rNmEsVg4KPI/bAyOzysfMBK2zV4AGUnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5716.namprd12.prod.outlook.com (2603:10b6:208:373::14)
 by CH8PR12MB9766.namprd12.prod.outlook.com (2603:10b6:610:2b6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 05:18:40 +0000
Received: from MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::bac8:2b43:2a64:4c76]) by MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::bac8:2b43:2a64:4c76%6]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 05:18:40 +0000
Message-ID: <9d6f1013-03e4-490d-b2b1-1b1d44b34d77@nvidia.com>
Date: Mon, 16 Feb 2026 10:47:45 +0530
User-Agent: Mozilla Thunderbird
From: Kartik Rajput <kkartik@nvidia.com>
Subject: Re: [PATCH v10 0/3] Add I2C support for Tegra410
To: andi.shyti@kernel.org, linux-i2c@vger.kernel.org
Cc: ldewangan@nvidia.com, digetx@gmail.com, thierry.reding@gmail.com,
 jonathanh@nvidia.com, akhilrajeev@nvidia.com, smangipudi@nvidia.com,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260129103043.148490-1-kkartik@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260129103043.148490-1-kkartik@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0147.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d7::9) To MN0PR12MB5716.namprd12.prod.outlook.com
 (2603:10b6:208:373::14)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB5716:EE_|CH8PR12MB9766:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a84ebb2-ddbe-404b-7f3e-08de6d1ad81a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TldIY0Q0Rk9vTEF5Yy9ZYnVjNkFXUUNabDVUU2loYkJ2RnF2RzF0UHlNRFgz?=
 =?utf-8?B?TlZYbEZPYVoyQlduMUZyR2lkcldzMmpZSHNkaWdWTGpJQm5FS2ZlbmUrSnE5?=
 =?utf-8?B?bTFWSm9ETTQ1SXJybTRUUk9nOHBXQjY1SEVkdzMrMnVHNllFR0puVjNoS2tt?=
 =?utf-8?B?QnJ4Q2pRMHhGbllDR3VKWFBkWjNzd3BuK251ZTh3OFpiTjgzU0ErdkZEQnhu?=
 =?utf-8?B?U3pmdEdQclU1QldYV0I3MzhaNVdjTUxzdHJQY1pYdUQvRDdFRWRFc0JtV2RX?=
 =?utf-8?B?L1pVTENrRUR0TWh5TXRCd054TXMzQlZPWlFCcEdrQ1RFamp1UEVybFJQclp6?=
 =?utf-8?B?OXVQSlRDRWdqNitZMkI0d1YrL2REY0xJTngyYlBzNW9FaXlhS0VFWS90dndB?=
 =?utf-8?B?Zyt3OWw5dGZBRW8wOHRDRkJGM09sRmllUkszb2FuRnlSY2ZVVkduWkdMQVF2?=
 =?utf-8?B?UWZIRE5QMGdQeVhqL2U0dzRVMEoxbHZXc1kvUHJBcTQxdld3V3kxam54MHUz?=
 =?utf-8?B?d3RMZi8yK2M4S2U5RDVsRXh1RDJwcXA3c0MveWd2OEhhaUFOTlFOS2FSQk91?=
 =?utf-8?B?K2MrTWdSUzI1eU5FdGx4WG5KdDB0K0R0MmxRb3ErRlNMKzY0OHo1clJWenBq?=
 =?utf-8?B?UllGWVVWU0pvSVNKalo4UVoyNStteG92dThhZWlqVjVQMFlNUGtxMW9hUkRX?=
 =?utf-8?B?Yk9zZ2tmSExmQVdpYUszczZXUjJDMkdBaXdkNk5wR3V6clo5bVJYZTcrc1Fs?=
 =?utf-8?B?L2d1QUNaZDhkdVBOY0I1WDF3aVlxNlIwa1Fnei9QQnYrcTRoeTJjMEZUOE50?=
 =?utf-8?B?cFJncFVCWXVoOW4vcUFzQS9RS0E5cHVBcjJLR2VocTRRTmVZRFFiNTlKd2RH?=
 =?utf-8?B?cFlPMFZDOThKSDRTUXEwQXhaOXppeGlVWFJUdzB4ZENhM0ZaR0VIbEhzMDB2?=
 =?utf-8?B?amJWYlNDRVM3YmJBck4xSG9OdW90VkFBVjJIUkdENnN1SkdmZ2N3bFZVSERT?=
 =?utf-8?B?VmQyU3BacXJxN0hlZWVmeWF1Rk9QNlB3VWJFcHJqQ1pweHRFL0dLOHF6SE9N?=
 =?utf-8?B?bWdMdHorSE9ycG5ZUVdRSmZpcWsrcXNHNFl5V3V2ZjNOb2J1OU5vK1lvVkRM?=
 =?utf-8?B?dWRZdW1rTmswcVVyQW12MUNCTHdSSi80YnlQL0tzYkh0cFY1NTNXOUlKVnRY?=
 =?utf-8?B?ZTZHOUNwM2JSMDhsUHdLcHlWSWJ2bEw3NHpROTFlU0NHaGJ5UkN0dmptVDBU?=
 =?utf-8?B?d294Uld6R21sVW1Qd0ZNNEtVdG8vOStMTzY0RXMvamlQMTZMZnNpSk1VbktV?=
 =?utf-8?B?dGx0UzVjMnZSaTloWHUrUm5FenhaUS9pTDNIM2ZZSWYwT2IxWHV4SGh0VmNa?=
 =?utf-8?B?WW1rLzdMN2hoUThPbHVIZ2NzZ2hZVEw0bkpTMFd3QjBIUnZmdVlsTGphWjND?=
 =?utf-8?B?d2ZGazl1dnViRjlDM1lzb0tEQUdNdGxIUHFmSUFRYy9sSkxyMHlacWhCSTVH?=
 =?utf-8?B?bXUzMDVKKzRJdm5UdGNGNEs3MjFJazNubTFEQXcrM0hRbXJ6VUtWTXQrckZN?=
 =?utf-8?B?bElwUDRGK0luSDlYSDFLdFUweHVON3pvbG13ZnJQREw0cFkxUGhIcnZwbFU4?=
 =?utf-8?B?WnN3MUlSclFwait1cUtXZ2M4enFBbm5XaW8rQ01BUFNlZTZoTnlMcVVXVHRT?=
 =?utf-8?B?WlNDWS8vVWpqY0ZkdFBLb2ViRmQ5VnB0b1BQQ1Fyd3dqajd6NmlCQ3FGYWhR?=
 =?utf-8?B?eUVNS2g5Uk9NdFVBaWdrMGFwNTZYRWE3V0ppVS9SdVpBbmVRdFE1YnVwRmFR?=
 =?utf-8?B?bXBJSlJVaUVzYnN1TlVDT2lPZHFKY3RDV2QwY2VHY1JNT2hnOG1sa3RlbkJS?=
 =?utf-8?B?b256WURTNXdDWkROVmx0ZnFZL04yTjZURHZaRGFhS0VIVGJhSlE5M3ZNQksv?=
 =?utf-8?B?ZlZ0dnZBWjMrTW11VWNnQ0xCSzlOMm0vcmQ3ZGlLOUQ5cGw0YUViRmo1c2lT?=
 =?utf-8?B?eHoxK1Q3dm5nUUo5ZkRkNkRVd09qaHZrQ09kNjdZeU1vUXBkTkVVaFRSSTIx?=
 =?utf-8?B?eitrcjR3cGllMERNV0d6WTloMTk0SXVRd2NZTDFIWkpLNllTWjVCdXRCQ1FB?=
 =?utf-8?Q?irbU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5716.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVpMbDQyenZYWkdBZGRqaEtWRkZmY2t6UGpxNkU4VzVFSWJSNGx5WFM5VHZR?=
 =?utf-8?B?bWRCRFFkcnhMM2lFQ3BBTFU5L0hPQXFKTEVEcHRLejhoQkxGMWVFZTBtV2ly?=
 =?utf-8?B?alVuU3dJVTMvOENwL29QQmF6NlJEbzdQWXBaV0s0SHJQR1huNTQ4d0JoSFpa?=
 =?utf-8?B?bUtwVElwYjZsY0ZKN1FpOWJYa042emU4L2xkQ3dra2JKT2gwK2pEYmVXMWNx?=
 =?utf-8?B?L1FsYTRFS2szZ015WVBoZmlyWEtmSS9tQjR5YlBwQXlXRXBlV2RwK0w4UDJh?=
 =?utf-8?B?SnFtdWFxRktLUFNqMkZINndGMmxKczBWSVF2WUlTMm9TUkxNY0NoajUraTRs?=
 =?utf-8?B?cWZEU0VvYXhWd1VDL0RoSXVkb3hucXN5N2kyaXMrbVJpQU4ycWF6OFdFRk9v?=
 =?utf-8?B?Umd6WitDczZibVhwaWswdDJ3N3NEdnBvdmJ3ZnBZREdBcGI5YVpNQ3FHVHZN?=
 =?utf-8?B?Y1N3cWlJYXZBMC9keE91c3pDbjF6U09EanI4SFJLbGRPRk14NEtUVUpQN0Na?=
 =?utf-8?B?ZjY0TCtDQWF2YWQ3NzBvNElzeXIrcnpmNXFaY1BYUTM2TEdHQ0NVenlFMW5R?=
 =?utf-8?B?U21oaXpPcmE3VkU1Z290L1lPODVMalgwSVlIUHJhMUVaZXdOdnF6SnlpR2Qv?=
 =?utf-8?B?NExJK29BcGUwWHJ2UmYzUXhMTlM2eXZFWHhqUlN5VmJyTXNvVEpjb0ZmRFMx?=
 =?utf-8?B?WkxpQXQ1VVNTZFBSMEZtazVWWU1rVTErVFlPcE1yZXpaTFBpRHM5NXdYL1Ft?=
 =?utf-8?B?Y1V6K0NLckFmbGdxRC9PQkZZTHZ2SC8xamY5Rm5OOFNIUUZYYk9CR0s5OTlO?=
 =?utf-8?B?cWFrSVhEc3V1UlMvMCsydHdtQklUellCQ0R4L2lIL2V0eDFHeHlTb25uUG5L?=
 =?utf-8?B?TFJ5cStvUDNGWTBMQXVqNWZJcWNTSDZCM0lLQ1c5ZlpES01Fd0ZramczTnRB?=
 =?utf-8?B?RUpWaHZSWnhZNnhDdStLcCs5RDRBTnBXZGtlTnkxeUlFNVhIRmxHNXRQRWRG?=
 =?utf-8?B?QWxBNnNraUNCdUs0VUNzTkJ4SlBBOVNFYjFZaFZPVnZrQTZCT2lkRWJMRGx3?=
 =?utf-8?B?WFhVVGFkK2hqQ2M3UnVkeTl0eUp1dFNobjVSdlBvd3VhU3lIeW95NHpTMEl0?=
 =?utf-8?B?MzBTVWpDeDQrSlRZMlk3MVhqOFFsdndxRkR6Z045eEpkRVQzZ3VITkJDZzBH?=
 =?utf-8?B?aCt0dHZPSHdkWlBicWVFR3hQUlpqMWM2MzV4MFZtR3R4czRKcVZ2NHFXZWpB?=
 =?utf-8?B?bjVzTnB1bVJHNnV3UVg1MjlyRjd6K0tIemVIZnlSa2UwMGtURm9JdlVxak84?=
 =?utf-8?B?SVRXcDhRMUJhS3RKb1A3TmFjZm42NVh4QkNqZUhQWGNaSHBpTWRWU3FKeDFH?=
 =?utf-8?B?WURkWkd6OUtQQ1NzRlFlWVpRcnZIU2wzY3BOclo4YnFyZXo5cHdSc2dlQU9W?=
 =?utf-8?B?NStZY282b0lDMWxBTUt0eTZORnVLNUFpZWdUVWZBUy9lNEdpRzRQQlZYKy9T?=
 =?utf-8?B?aFlPVytqRFFtalpBTkJQN2Z2OUJsMGZTR2VPTXNNTVVveHlUaXJLZTZHeUQ5?=
 =?utf-8?B?QzhBTlFWazJMMGttVEFPMlROaVZuVDBCRHpQR1oxZHhkUmZyNUpQa3k5ZHNk?=
 =?utf-8?B?STJwWWVhOWtjYjF5eFZtK3I5Y25DWnpmc1I2SmZLakw1bjJyNEpMSElmZ3Zs?=
 =?utf-8?B?RjhpUk5FUTVoM2ZjSzBQZ0hDRlFnWEFBUFRwMEVUSDBzK2QwT21lL2RSL2tt?=
 =?utf-8?B?SCtGaFVueGNSVjlUbXlVVnYzUGZtU2VVZCswaEp3b2xCUWFxZUVlS05NUDkv?=
 =?utf-8?B?dDhKOXB0MVByRzB1ZE9PZFd5VHdMWXpQcnBRWVFURE94RkJHTUM0R0JZRzRN?=
 =?utf-8?B?Tmt6eWZSeTJkZW80U3JsVStPUjhiVm5LVkFpZFdEZk1iYXJKNFFqSDBYdldS?=
 =?utf-8?B?bzBKZGFtY2E2Wm5WaWQzVFB0dlhsUkdWM1pxK0g0ZU1BY1QydGNRS2ZlMkRO?=
 =?utf-8?B?a1JGbDZFdjdOazZXQzg0ZmdEdkNDVm5PT0ppRWk1eENESmpHeTZhNHNacTZz?=
 =?utf-8?B?U2V1UnRCV0hRRkFWaUpFUVpUWEI0Q2J2dGttT2p3b1R5d2VaK3Bvc2ZKKzZi?=
 =?utf-8?B?eWNpRnFhR0FwWFJMc0tzL3lEUkV5aVBpQ3piSGRNY1A2bXkzWjZwSFlwWkN6?=
 =?utf-8?B?M0JTMjR4U1BCTHU5UVFnMGNVWVdBRERvamVObHhmeVVVamc2alZESTNuSlpo?=
 =?utf-8?B?MzFCRG8wcFU3TXhhcGQ0TVlORXREek1UZzhZLzAyajE1WCtTM0Z0d3ZuUnk2?=
 =?utf-8?B?RFMwL0xMNjhSc1lXcTNjNlpLQ2dTeStNT3I0cnM4NDJkTk44aWc0dz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a84ebb2-ddbe-404b-7f3e-08de6d1ad81a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5716.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 05:18:39.7018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8s4qE0Jga95XuU292E+n0xRA/H2sWQZ30ZXaSONgxVsYbYanJW0tDBz3m78mqBqAdHifIvehuHb8ruZUV5TXPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9766

Hi Andi,

On 29/01/26 16:00, Kartik Rajput wrote:
> Add support for the Tegra410 SoC, which has 4 I2C controllers. The
> controllers are feature-equivalent to Tegra264; only the register
> offsets differ.
> 
> Kartik Rajput (3):
>    i2c: tegra: Introduce tegra_i2c_variant to identify DVC and VI
>    i2c: tegra: Add logic to support different register offsets
>    i2c: tegra: Add support for Tegra410
> 
>   drivers/i2c/busses/i2c-tegra.c | 534 ++++++++++++++++++++++++---------
>   1 file changed, 395 insertions(+), 139 deletions(-)
> 

Just a gentle reminder regarding the latest revision.
Whenever you get a chance, could you please take a look?

Thanks,
Kartik
