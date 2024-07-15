Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2077.outbound.protection.outlook.com [40.107.244.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF4E188CA6;
	Mon, 15 Jul 2024 10:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721039992; cv=fail; b=bgH3CmqZegj5mB8/MZsY9235dZTVCgRuVVayk6eSHBm3f+1kdM+uUFsLVVNUCdszAQrl/sCkyf8TrU7w4xZQMG8oAa0RNICOqjwGTL3g7n4pD3xs9dmlOIH7BsAaZR6DAnd9zJxUJ2SJEGha9dW5fnT+SioeT4tWT1OZ9u7pdWI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721039992; c=relaxed/simple;
	bh=EuLrd2UFme/Wzdjc1eriDwFl81BAkylDGWHcAkoDWo0=;
	h=Message-ID:Date:Subject:To:References:From:Cc:In-Reply-To:
	 Content-Type:MIME-Version; b=TW+PrjVe/BHT/ploBq6cAQaaB15xX9BjEEhyYN0HLJCbwFdSegZAFWzCRtN1L1bCzDdDyXjL67u2iOiBbf2szaNOgCXikS6Unt8wuwSCPLOE/bnKjlb1fG6nSAiCgSku+c24Vtv1HD3GgiyhHJ1rhTcKXyq0aK+draw9B28Z1JI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Yl/WNvf8; arc=fail smtp.client-ip=40.107.244.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Yl/WNvf8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PvjF294d1agQpQ3LRUfg7B17GRGKALr/XoRDdk9hHQ4NIKfz9ePpaX6gc93LtS3wYL17YiHsuFAUOx2j+5MmLCr+c59lI8zIMh2gcOXCXDuf8miU0hrMe7AIrahgvJ51RuB+p36sLkdCf4Xa3fHjbe3pk90Rkb7aOZn4WxuU2SXTrXTHrG1mB/AZfZwudygqqNpNNNOddVEYpYF6XKR7sgla9210wzI1Kn+c6eIwApE80hvtjVx6dKWdO/C3/tJX30fAVOM1AeUTtqsu/0MM2m9AKksEamA9T6rDv1OkfCfDUinYYWQ00kOG+4Xe28RsI4V6CRtNvUxZbc7aFEWRbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D9GwISSGV9QLzrYzWvWfspMW1BO/5eJ/q0Q+ZDLegFg=;
 b=HD0avQAe5fo8i6585pzGwM/E548Xv43GAmd6vq6vgdhLP4JVdfJPHhOY1Hya9MK2VUmNwizulJh4ZrV/2u/4AA4DlYe+8sD/cJe5QaSoXUyFq4eusRJEZNDHUTFwdEJgW1sWzqZf68Ny3OPKL030JFMo4JW1RxmmjC7tBslzkN3LQqGN7+JOFfYxj+liv7jIMTsP9bzg97+TcazXPdY4dy02W9X7Ip1BI4lVkivp3L91FBUCK344e55ulqsYfj0O6pzbqrNlQzwGnQPNnLorv7nCfHP7k/3lzA95+tB6rKwRtuIB6xpWsqud4l/D16O7SSy1tZDd6qrws382729gfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D9GwISSGV9QLzrYzWvWfspMW1BO/5eJ/q0Q+ZDLegFg=;
 b=Yl/WNvf8qi8ZnvapznXaCru2PmfzInwg6pBebvEsfWCuhy6IBYiulswQWUI10c+d/PrY9+wSpBJHXhGMaH3ie8IgP8CNIbf/wDnid6OUrIgCYu0/kS4qIXkcR58uv1LvDnKT4vDfJcIpqORrnUcncd7zFkdpF/uk+5QjeFxuZSMsioQKTsIzqSh0A/SVfe4GLrDLE9w69SsKLk2TpXX96AKL6VmrBsM7S9cDFuLrBjxTNj1nDh7wGbehaJndPaEUtIRBC7rW/kwu5yDVvICjyhYaOUxcdEK+CuIcf8NrNxZpbtRcaupDPgPKZ71jEUxn7P6XQPbh9O7oysvmKJjs+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 CY5PR12MB6600.namprd12.prod.outlook.com (2603:10b6:930:40::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.28; Mon, 15 Jul 2024 10:39:45 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ae68:3461:c09b:e6e3]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ae68:3461:c09b:e6e3%4]) with mapi id 15.20.7762.024; Mon, 15 Jul 2024
 10:39:45 +0000
Message-ID: <4f24a2f1-0f6a-4ad4-97e3-398cd9981127@nvidia.com>
Date: Mon, 15 Jul 2024 11:39:40 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/8] timers/migration: Move hierarchy setup into
 cpuhotplug prepare callback
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
 Anna-Maria Behnsen <anna-maria@linutronix.de>
References: <20240701-tmigr-fixes-v3-2-25cd5de318fb@linutronix.de>
 <20240703202839.8921-1-anna-maria@linutronix.de>
 <3580126.iIbC2pHGDl@steina-w>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
In-Reply-To: <3580126.iIbC2pHGDl@steina-w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0394.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::22) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|CY5PR12MB6600:EE_
X-MS-Office365-Filtering-Correlation-Id: 933fea81-6d11-4570-5066-08dca4ba710e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K3lHNVpoci9rNUFCdEFmSHc4WGpDdnNpcndpdHg3WVdVUXNwMnRwVHpWU2Ex?=
 =?utf-8?B?djNSYXoyL2RLNndwR3BvZFBMYTNjZXcwTTNjVklrc1d3Ym15TzQxMy9wZEJj?=
 =?utf-8?B?UVdNOVBNbHV1dEY3b1M5L095bUZxMTRlc3hGUjQ1YWRXZXBIS1hZODZGTmJE?=
 =?utf-8?B?a0N1TG1zeWU0TGgzanRQaXE2ZXgvK0hqcXdpZU9pMnlVZXNhNTJndXhCS05o?=
 =?utf-8?B?TDNjK0x6SmViUkJYbDlubUM5cGlHcFVOVlprMzQ4WkpySXFtZTVsd3N3TEZJ?=
 =?utf-8?B?NnRwNVZIMnpZaVFHZmNYcHFvQWpIdU5IanJrOGpzaHBLajZQY0MzUnU5TzA3?=
 =?utf-8?B?WTQ5dStqVk9XamNiMThReHRJc1pDRmcyMmFFZmtoUjQ1MUdDNWplQ0VDTE40?=
 =?utf-8?B?K3NUZXRvT3JnUC9rYXRlRlJ2RllxTzlibGdid0lUbWVnVy90VDdhSlU1QXVi?=
 =?utf-8?B?SUZlOUdQZGcwaFA5bUdkc2dSTDlSa2dSd0hQRS9Xa1IzaEs1UlVDVDFNdmZl?=
 =?utf-8?B?M1JLUCtnRnZzZGlaalh2OGJwRmgyRHFxU1FQNFpubFZvNElBclFFb2JGVVlD?=
 =?utf-8?B?dnNSa1BkN045TDJxcWptR2czRmVocnh4RGxEK1BMZnFTQ3djUkgwTkFHc2xY?=
 =?utf-8?B?MG9QTFpLd0s1VHRVTWNSSUVBbm95cy9XaCs3UWorWVdFeW1UQ3lKdHdOdDlz?=
 =?utf-8?B?M2QrdEgyaWxRZUpkaDUyRTZuMk4rQVZINlJNU25QOWNjMWJRUmVIVi84YlRF?=
 =?utf-8?B?ak8rSGNrQUh5ZGZtL2VDdmZZOFpLdERzMDJETjMwbGV4Snp2Q3VvUXBBYVhE?=
 =?utf-8?B?QjFpaGQxKy9BdXdMVUo3WFJtaWFJZjUza29mOHZUdzlXTXhSRjRBVGZwMWFa?=
 =?utf-8?B?YTJNdk5sNWlzbGdEUGxUU0g4OEV4VCtqeTRCbkJBT0F3cmMwdHBucFlrTTNT?=
 =?utf-8?B?L0VSNHRrZnhlLzlFcW9yUnV3T0U0WDNiZHNtU011WDUxRDRpc0Z1a3JKZ1Fv?=
 =?utf-8?B?eUhZaE5yZVdXY0gyV1NyZlN4Uksra2xVWG9DVXIydllwRU1sRmNjSkp1aFVy?=
 =?utf-8?B?SERKcnZmUytkUGMwNkJVZTJrdVE4ZE9zZlphNWtOT2RrYW5uOE40TzJvUjJO?=
 =?utf-8?B?M3dPSi96SXZjcStWTXFsMzgzQ0dNNmdQSDB3RHNjTG8yR0JSeGhmenpSM2RF?=
 =?utf-8?B?VGpHb0hwWlo0YmJPSjJjU09JeDR6SGJMVWxJWThDYTZTK2dyV2traW5CSDZD?=
 =?utf-8?B?ZjdFMytwTUpQWjZTeEVLL2ZKTEhvQ0NINTZ0cDRwV0tQMlAxTTVRNGRjdFpl?=
 =?utf-8?B?bFYyaEFtZVVqQW1TUjBBMEljeGN1ZGRPQWQxN1JodnBIdzQrL1RDajFUV0Ry?=
 =?utf-8?B?amptRW9EVXJpYzNYWDV1KzZoejFNRUNpWVNhZHZmeDdHR2QrRklLcEZ5cEZJ?=
 =?utf-8?B?cmhYRHJxajVZOEVGaW1TNUkzQ0Qxc1NQaG1LdmQrQkdac3RBVlIzVnZPZGRR?=
 =?utf-8?B?YzA2Z2hTd292WnBITTd0RWE5SWNCckRUYjZXdWRiQ3BqUHpiSWswSXJkRncy?=
 =?utf-8?B?dDlvUG9SUE1sN0pnczFBcFBUSkp6aWJlM0hTdkwxZmd3V0xiRkZzbkFGTHlo?=
 =?utf-8?B?bFdqVzZBeTBSRk5ESDRuVlF2V0s0WnFwK2ViZWk1dlc2OVVWRkRxeDJEeFJC?=
 =?utf-8?B?OUZmSDg2VUxnUzJNMUljUXBDN05yVjkxNkNUeGcxM0ttU1RQVG1XYWRpbE5h?=
 =?utf-8?B?TFdDR0JRU1p2Z3RVdGlTYWlSUm1zY1NQYVJCVUF0ZXBLVUlzVmNjNDcrSXk2?=
 =?utf-8?B?WkdpU1lLZmhmdUZ4KytzZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cDRrdmJHZE9QMVRpSG91TVg4T3dQVWxKU1RBQnoyVEx5aDJZYUxQZTAyK0or?=
 =?utf-8?B?Y3JnVGkrbVp0ZVRkTmErSGQwYURzWkh4eDdYQnB4ZUVQeExva215UElNcXgv?=
 =?utf-8?B?RGNESWhlVXFaWXJaQVpkZVducWRoQ0cwM2FwWktKYzNscnB1ajUzQmx3a2ZB?=
 =?utf-8?B?eElLT1NQOWxIZEV6ZFZJc01HRERoMFgwdlhuUDdiR2R0b1E5bXhOZUpnUTRC?=
 =?utf-8?B?a2EvbHg3OXdGSXdoQXpwWXUxTDd0WGU5dUV0Q1BQWTI2UWNUSmo3cmFZYWhp?=
 =?utf-8?B?dEdaOVZvWXU1eGRjdTBzeUFFakZYT2R0emRzZTRpZGVPa1NiYlEreWF4UGdr?=
 =?utf-8?B?dWFRZ3djR0VuTnluVXB5NDd5QlRqQ0NYR0FSSHFvUFVraVlEWm1SMWpJU3lj?=
 =?utf-8?B?UUpDeUtFdU8zNi9qc1R4cjZrY2E2bXJ1QXFzR1IrM3NMdkJFdTZwOGR3TE9E?=
 =?utf-8?B?MVdLNG15SnJOV3c0ZE5ZOGJ4Y1ZkdkhFdG1MVk1lL1lMcnRmem81b1ZublF2?=
 =?utf-8?B?MEJRcnJtTUEvdGZPUHprN3Z5RERlSjdOSGlnMW5BUlVDa1VNdG5OMlVxY21w?=
 =?utf-8?B?V29vN2VoVEkzdWJXOXo5QjY0enNzaTA1c1BicklSSnh0cGNjM1BCSTRud1JL?=
 =?utf-8?B?SWhpVmZSekFMZ1pCSFM1dktXK2ltVmNnL1lJQ0FRK2RTVkFUeE9sbStVM2I3?=
 =?utf-8?B?QmNVRG5uQURqWGh3OSs4b0ptQjlRQkNYUjFUL1ZlcHRzM2NwdFQ2c3h1ZU0w?=
 =?utf-8?B?TGNnbmt6R1dsT3c1Y01Hd0dGM3FiY2EyaWcxSGJTRm5nRDhoQTRsVDQvQXlW?=
 =?utf-8?B?aUJrRnF2OGtDYzREaHpGZHBwS2crSW5DZ2MyeDAwcG9rNi9Cbi9NVGlUZ0Vj?=
 =?utf-8?B?Nzh4Wk5LUW50NzI2TElucWxUVHIra0FzV0xEUHJONjBqQ0U0RytQd0R5OFVn?=
 =?utf-8?B?cHo2UTBkRnd2ZEpYWVEvRUF1ZWU4elVEV29BWjFSQ1hQc2UyNDRvYmVNazJJ?=
 =?utf-8?B?VDJ4VEhWKy8xTVp5bm1zbVd6MnVTNGZRRGthSlg1NTBFSE1KdlAzMVNnNlBF?=
 =?utf-8?B?TFFtbkdINThjKzFRNWJUWG1JV1hYSnVicUNnM1oxOU1hSkZ3bnppNTVYZHhC?=
 =?utf-8?B?TTRsRzlwSWkwTDdhK21rMk4xVmVpQ0lJSkRmdHFBN0JlUDlmRXJBVDhMc2Qv?=
 =?utf-8?B?T2J3MlBYRG1LakdmTkJIcnBtbTRLK2ZlYXo4SG92emZ2NFdlcjgwdjFyOXR1?=
 =?utf-8?B?cm9ZeDEwMFdETndoeDdKeG5FVjBzRzZjbXYzSmFiWEZxaWk5MUw4d0hoZnJI?=
 =?utf-8?B?ZnFwcnhvUm9hK2lxcTBjU01hNjlKVjBjZnA3N3FKS3hkd3pDb1hQejdIdkYy?=
 =?utf-8?B?MUM3WUJqMGhBNUh1YkRVR01BdjN0aThjY0dnSURwV1MweHhNU3JVYVRTcFdK?=
 =?utf-8?B?dkpyRlFQZ1ZxOEI0SWFrZ3Y4WTlrLzhVUElTTGkvVXBvNzNsdjc1TEgza1VZ?=
 =?utf-8?B?eGVSK1Z6bnFQYStORm1vcm1OUUZVSmJLSnFVczZWOUNlUTlLdUVVNFhBYjVD?=
 =?utf-8?B?VTdxQUVLc3FxWWpwaHNma1JndlVETXljdkpDTkF6ZHNvVnZvSWYwUWl1WDBX?=
 =?utf-8?B?K2laTW81cE1KYk16aHFDNHFnaUhBWDB6a3hWcFU1YmhObjNoMDZNNHJXdFVE?=
 =?utf-8?B?MmpkTlpkaGV6Q2VNU1RJRW5QOXpkNjh6bTJqZWpTM0g2MjVTKzFZc2I0OFRO?=
 =?utf-8?B?Zzg4eU1KMmtSZHVEWGFlZUo3aW1zaTY3VEMyalhjTS9EclVJNnRRcXVGa3Ny?=
 =?utf-8?B?d1BYRXFKUkczdmswUy9tRVBYSDZkN1JXK0FCZGFpbkVzdHVTMDE5Zi9TMXdt?=
 =?utf-8?B?S0h2ems3aTlwUHl4ejBlQUdMbE04eS9QK1lsWWxJcnZvVStWTG8rbnRISit5?=
 =?utf-8?B?a1dGeDloaU4zcnRGNFIzeFdzSW9lMUFIb2x4SHJNaVZBRUxmdlhVWUM1N3hE?=
 =?utf-8?B?SzRwVkpqSitlOVBwWG9ScXBjQzduaTNlclJMNTNGWi9KN1dPUFFvYjJZbHky?=
 =?utf-8?B?OVQ1TENIekhBVFNBcDk0Y2VDS2hiTHBRM1pxSG5UenFwbncwM3pPdFhVbXN0?=
 =?utf-8?B?NGh0WmZjYzdoK2NGaEpES0YrTFhUSHZSbERadFJrVDZ1ZjlSRjRNY2MrSVht?=
 =?utf-8?Q?jD7ewfudpLEvRjOoogsW1qigHrjTO0tKQmNcUe/ycgRg?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 933fea81-6d11-4570-5066-08dca4ba710e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2024 10:39:45.2659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m+KBaBLYiRxqQ9Q0Hn/UwhXpaP/SYYBtqW9cAjmOg3FR87UDN5YULfRMbdjpGPJNAKY7k7Pfe2v8D0L2pBqCUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6600


On 11/07/2024 09:56, Alexander Stein wrote:
> Hi,
> 
> Am Mittwoch, 3. Juli 2024, 22:28:39 CEST schrieb Anna-Maria Behnsen:
>> When a CPU comes online the first time, it is possible that a new top level
>> group will be created. In general all propagation is done from the bottom
>> to top. This minimizes complexity and prevents possible races. But when a
>> new top level group is created, the formely top level group needs to be
>> connected to the new level. This is the only time, when the direction to
>> propagate changes is changed: the changes are propagated from top (new top
>> level group) to bottom (formerly top level group).
> 
> Now that this commit is integrated in linux-next I'm starting to see the
> kernel error message:
>> Timer migration setup failed
> on my arm64 i.MX8MP platform (imx8mp-tqma8mpql-mba8mpxl.dts).


I am also seeing the same on our 32-bit and 64-bit ARM Tegra boards.

Any feedback on this?

Thanks
Jon

-- 
nvpublic
