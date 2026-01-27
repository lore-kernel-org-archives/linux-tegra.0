Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013030.outbound.protection.outlook.com [40.107.201.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A77235CBC3;
	Tue, 27 Jan 2026 14:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769525593; cv=fail; b=uwsDQT0hVpR6zKZw6XJlHbP0Kgc396ZUZHHnSQnAi5T+0QpoDA3yPCRlTACoWNZqJwyC0peWzaySnt2pGs/iIZLz1DZSrcTfCmPQWJsH9yVGvCPlwaoXBSCxnTkTBRrhz9WX5Mu+RzctmnJUVrPyFEXSU8TLewuRukLghFsa+bM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769525593; c=relaxed/simple;
	bh=vEWZC7BonBlZNp86TJAhs5bKwckNLmxCmmKLcooP0oM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TVq0f1KsPCA0L8GxXoUGBjPas00+z11HyPSOR6wb90c1S+ehkCkpg4XAopwj9ChsWgH3kGYeKwAVMUGqSz4R5rq/fvF+j23qiGQz2aaqrf83AO57l2nXtJS2wz2Y4LhIGUf9Sa6jIbD0hT3JZAMsc3qYoZvM/couLUNSGr4+KtM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DoZ7c6+Z; arc=fail smtp.client-ip=40.107.201.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DoZ7c6+Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TXZd/wr0S4bohhRcySOvEDDPIYAroQu1n2Lod5ZZq+TWKqCFLergCpmaBbioFhiTBZUZRJj4g3oQT31pkhJADRvOevAQNqyCbgTY3iuGc0ZPK5ezfvaFaaTtQkgWm1VZ2Ab0nJVf4U2DbHkeRg4C69PRkj6QdiiWgK1eIS0iQlQaAkNOBu38mYta9PYbBLf/0WovWYY6DfqO9Pr2JZ5xDe7zkiJ6FV+yCKxT2MNmah+oOOVKjOAcu9hG3jhvkHV2o988UKMA4ViRKTo3xn2y8uLOvouc+Ua3mySZ8iZSqvQLgvC7s8hR+sfg29g6/v78OWVClIdhDwGj1lxe0EMcmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QUguUK9ZF2xpQfm4C+YtE3Uihi6VI4q2YGVCwiaqk+Y=;
 b=JMT9Nc/1+WZp6Et4V2sNaFpEXMfj5k0TYdA9ZwYK1RseRyBwmFdKFS0/zEK6XSe9VwXS+fz5cPUcVWpemA4q8ccMxuckZk/whjApN3UVJHQOouxpThL4Ig7E3gP/grtjG93l9t4FtAIriya4fpHJEFV90korxhRxIlwqESBsngDnvD2ksByT6Ow9JH7Zgd9FShzQogCUgX535iRPQXbQKya9CiIPECfkao7RDmeWAoh3avDVnVkfl+OMPYWS250zdMIa/2r8oX2jGQUX1Fq7QCHVnPXB8IPZHhCDOYH7uAROUXux8y8gR93kuGvILLpxhPq4d5qDG9BrK1ah8wEyDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QUguUK9ZF2xpQfm4C+YtE3Uihi6VI4q2YGVCwiaqk+Y=;
 b=DoZ7c6+ZW5tmjlSsqEavsvV9OXAfIUNdqeefW3xmun4ZSEKxd9k0uMI2e4EJiJprBj1lL29HKAuwWr8Sno1y5GIeCber7WHtuijsk34Ad2kgIVFBLEqMdC1vogwEkxAMV1aQ3Zt4C4XbmFMa4B7EtoszU4VWdWeBGAUcTTTpPvnABpJkiXtu/Q1oCFfeWWx/N6lR2e+kACuXzhDcjNHekEQ/31HRyPEpOgXoYbqNbGYJyoMC9Z5PCynfZdmQxWWfV+tZiU+uNOi38Hsqp0Af5tbp0prYgG6u1nrPPMwmEQ2FOmFTmrTwsidldbLxUw1FbLA4UP6lsYbHJ7BVQ5DdOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by BN5PR12MB9464.namprd12.prod.outlook.com (2603:10b6:408:2ab::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 14:53:08 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9542.015; Tue, 27 Jan 2026
 14:53:08 +0000
Message-ID: <13729ce4-66e7-4864-abda-f999008161a7@nvidia.com>
Date: Tue, 27 Jan 2026 14:53:03 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] driver core: enforce device_lock for
 driver_match_device()
To: Danilo Krummrich <dakr@kernel.org>
Cc: Gui-Dong Han <hanguidong02@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Mark Brown
 <broonie@kernel.org>, gregkh@linuxfoundation.org, rafael@kernel.org,
 linux-kernel@vger.kernel.org, baijiaju1990@gmail.com,
 Qiu-ji Chen <chenqiuji666@gmail.com>, Aishwarya.TCV@arm.com,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20260113162843.12712-1-hanguidong02@gmail.com>
 <7ae38e31-ef31-43ad-9106-7c76ea0e8596@sirena.org.uk>
 <CGME20260120152328eucas1p1024a7488ae10b8b7f2fcb74baee24c75@eucas1p1.samsung.com>
 <ef37ed64-24ad-4b82-bc6c-d3bc72aaf232@samsung.com>
 <e32b0819-2c29-4c83-83d5-e28dc4b2b01f@nvidia.com>
 <DFULF717AOGG.GY8B9ET26KND@kernel.org>
 <f10007af-3629-4769-b89c-bbf4aa013bf3@nvidia.com>
 <CALbr=LaE=nS30uMmm_spywEHPYgC_w9qb9L1wFvwBe=PDae1Mw@mail.gmail.com>
 <DFVBKRQ35CC0.95P329BK5KZA@kernel.org>
 <956d5d23-6a62-4dba-9c98-83457526f9b6@nvidia.com>
 <DFVDC5NWTOT4.NA2H05V84CWD@kernel.org>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <DFVDC5NWTOT4.NA2H05V84CWD@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0017.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::7) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|BN5PR12MB9464:EE_
X-MS-Office365-Filtering-Correlation-Id: f9e88c05-16a2-4344-d98c-08de5db3c8e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NjFlMEwxemVaZmpRdlBSMTFodjVvdkp6aUFocloyNlF3QnZFODNMRkUzY0sv?=
 =?utf-8?B?N1ljdll3SWxZajJDVjJOL2lrcWR0cjNSemFib0UvU0I5ZWJreE1KeU93Undx?=
 =?utf-8?B?YlBFR2VBSHU3eVQrTllOdzZXcjFwZ3BuS1MrR1BBNFRlSGtFSHQ2UkZXcDhh?=
 =?utf-8?B?c2FzVjl1RktQY0QrR1diSXphT2NOWkN4Qm9TTGdWai8xSmQ0cG5KOTl2Q1Y4?=
 =?utf-8?B?c0Z1R3FsaUVwNVM1S3NYZVl2MUFmN2RiS3FiQ0pZYUFCblRRNE1yQ1dseTV2?=
 =?utf-8?B?dUpBbFhSR09wd0lHK2VSMlVpVTFqa3BqUm1iZWJsSFp0K3ZpUnpSVDh1L2pa?=
 =?utf-8?B?dWRrczdDbFdaK2xkamM5aWdEaVd6aXQzWjNreGpCMnovNG1GRCtnUklDY0Uw?=
 =?utf-8?B?d1Rrb25RNFU1OTZocVhkSVBQYnNnYTRmRHdLWWpaNzB5b2JBMGl0alY2Z012?=
 =?utf-8?B?NmZyRDlZNFlLNUZaeHUwT3RIRFAxbTBQdnhYWWZCcU9iTHpNR0p4dWNmQ0NX?=
 =?utf-8?B?NllRd25BNzVkaFpzTmprT0JHSUl0dHJ5UjdVOVpjOVJxQU82RXJXYlRaVFNY?=
 =?utf-8?B?YzlHMlBBZWxnU0NJN2RCWktjS3VtN3BrQkxmdVh3YytEZVo2SE9leFJwNVk2?=
 =?utf-8?B?VENuajMrR21sRXlqUW5WcUo5aGxIb0F6eTlaRFRpSWxCZVZyekUxTlBrYTk2?=
 =?utf-8?B?SzRDODVWTzZ2U3JkTFFwTWdnUUdnSTkrVkdoenYyS0kwNllaUzNQdnFiL1hZ?=
 =?utf-8?B?aUg0NkhqWk4xZVNYT1kzQ2FwdTBzSHpVc3ErTy9DTTl4T3BmMk5sa25mNE56?=
 =?utf-8?B?dWEyc0ROSUtIWndIQkhTcEVvTFNOSjRGYlk2YWY0ZWJGZENHQ1FnYnhNeDFo?=
 =?utf-8?B?ZENlbTJIV2t3OWRZMVZBK2dQM3Z2aVNjQWpjSm92RHh4ekhpM3JNa0pJTGN0?=
 =?utf-8?B?dkl2SmRSY1BEQVZaa1M5VGVYSlJURnZXaUdPVVFzYi9QdWlYTUlYTlk1MVdu?=
 =?utf-8?B?STZpTWVrcEE4MzRFaGNUZ3JMYi9qNXVqanpFd1dZS21mSnJzU1VvcG5TVEZE?=
 =?utf-8?B?Qk9PU2drZ2pJcG16d0dUYWlkTDdNVTJkUTlUNENqaGJRU0tZVlA0SUtuL1Y0?=
 =?utf-8?B?aXV5REVKOVJCbVFlZlNpOW9iVmpQUythcDRXNjBLb1NRelcrWDluemtLbVp3?=
 =?utf-8?B?enBqdXdIT0JwbUdBMkhtVExQMnJSNVdPdzFxdmhoZHYyS0xQbnlpMzQ4YjJt?=
 =?utf-8?B?WmVEUEpibURRYmRkOE1NVDdnRFBoQkxuY3huK04vSWRVclRWdGErblJjVU9U?=
 =?utf-8?B?NkcrNUxiNXBmTjlJODN1Y1ZUNjFxcFhQQU1pMk40aFlKT3QvaEhja1RTVE5P?=
 =?utf-8?B?U2hyTFZQNmRacVRqV2hkQitnWkhlaW1SbnB2Z0lWRmdoRllMYlN3K0ZacC9i?=
 =?utf-8?B?akpkZjlSVXhOT0pSbTNxMUhNREx5OWhnQ2MvbkJGN1Jpd1hqeGtkMERNWi9V?=
 =?utf-8?B?MWhDaVp5RzY3N1ZHNG95QnJpUitvNmZGdCtkQ2I1Q1c2Y3RMTTFtY1lPVzFt?=
 =?utf-8?B?TDJtNm0xaFROclVDZ3pBNjZhR0lUenU0VVNoNER6cU9YVnkzVkRYZkRoZ0kv?=
 =?utf-8?B?N282NWpxeDErdFRobnAvWWx3RGZJVjhCRzhXWWs3Y2JRa3FGb2ZXUjBqTkRD?=
 =?utf-8?B?RGd0aXJDZDZZZDBCeFBtbHN0SzNrLzRTdURTUENsbkt3QlZaRUwxVEdxUmxs?=
 =?utf-8?B?dFhDK3VwYWtqelhYUEl2K1JpZWVMTHFpQmQ2MTJXRG9XczMrRU42Z3Z0bS83?=
 =?utf-8?B?S1p2UFVlVjNRRytDS3VjZmlNM01WVWNTSXlJbnAwM3ZTTzJNRi9PN3MwZ09K?=
 =?utf-8?B?YkRHV1NCVTA3NUR5TEZZT1ZEREZ1RndLUWpJY3U5OGtzbm5CNDNHbTNIZnZk?=
 =?utf-8?B?bnFYanpJcCtobG9DYWpnakY2bmNvaFFZWXV0Mi9YS3dRMSsvNm9PRFMyZGlh?=
 =?utf-8?B?bHdNRGpIUUVKMHhGelgrWUV1YjlneUY0bVJmdDlSWWNuUWE3UGUrME85Sldy?=
 =?utf-8?B?Z3Z3dkt4UTVqOCs4UU5lS3prUzlxSWliUFVnT3lNRm9wbVJTSklLcHZjK25H?=
 =?utf-8?Q?emTg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YzVNQituMzllRlR0U0swUTlRS0h6Vko0aFVlMThENWNDMk5oYnlnRHZTWlFG?=
 =?utf-8?B?eUdVaVdyUlhMajhJdUhoUG1CcGlzWkwzWHNRQXFVajIvTXFoc2w1Mm1IWVl0?=
 =?utf-8?B?ajlSNEx0ZjljYmlxUlNYTjRFM3pjcmlmZG5wMzRDMGxUSWtjQmx1dGZoWWlV?=
 =?utf-8?B?eXdYMTZNbGtrUWVWOXhaak05U3BIdjlORGxWc3FZT0RKY2JxSVptY0NoUmgz?=
 =?utf-8?B?cUJrSWp0cWh6bEFLN2tVR1RKdnRndHdHaFZrKzZjdUtHcll2bTZGMVpRU0ZI?=
 =?utf-8?B?VU41bUg1TzF3WC9RNjExZFJYZmlDcTVuY3UwNmg2N05xQmRldE0ybE14SE1k?=
 =?utf-8?B?VkU3YVIzaldOUUN1K3RFc0VlMWtiNkpna0c1VUFjQmxhd3hPclFnamdVVzNr?=
 =?utf-8?B?YkNEc2dHcGZZL2psT1ByYUpYN2xuVS83UW1RV3pvQlZ0d1hqWGNoQ0FjQXU0?=
 =?utf-8?B?Nkk2K29zY09UUmt0QTlkL2t1YnpjSFVZR0FyempMSUJkdXlPZzN0ZzFXclFB?=
 =?utf-8?B?K1dRMjdXSVBSNC9VelNtR0VmNHN2dTRoUlY2YmcyUXZxNExia09QbGM0MnhC?=
 =?utf-8?B?dUV3eUxueTdlTU1xZ1RVTnRpN0gxOVdVS1J3QXh4V2RKN3pOYm9tcHFZaXdG?=
 =?utf-8?B?dTlxZWF4V1RnMUdRU2F6RTlPaTN1TGlLVk9HRnk3RHIwYWhIOXJ2R0s3LzNo?=
 =?utf-8?B?YXd6V0xMMTg3SUNFWkpORFF0T2laZlZvWk5NR0wwZXRpNFVJK243MzBQUkpW?=
 =?utf-8?B?Y3Z2b1FiRDNIMVlTRUlaYTNzTjR2ZTlOVm85ZlRVeG1WWjVuWEo1cEtKd01N?=
 =?utf-8?B?b0NQWlM0a1hQL3I2UC9BamwwdWhmTHRUR0tpTS9zWVpQL3JpYUxsZm0yTk5O?=
 =?utf-8?B?eGZva3M4SGl4a2lEVjM3bzNLL0xCc0xqamR1QVNWZUVHVCtVWlgyQ2pzZzVM?=
 =?utf-8?B?VFBjdm4xR3B4cENadlRiZkgzcVlUeUhUWXNSYm9TMTZKMURJbCsxZXZRRy9O?=
 =?utf-8?B?bGE5RnA1RzNNMFRSQzRFNWtyN1N2L0ZsTFhNRTFZWHI3STNFcy9nNFA4dDJl?=
 =?utf-8?B?d1JEc3RtRlRETVVma0hld3ZiRHVTck81eUYwTURSeHJoa3VTUWFjZ1FQVm50?=
 =?utf-8?B?eWRJVkFEWGFoS3dla2huMVNLbTZMaitRSE05eUxqZktUbmNVcUlyeHNPVzZv?=
 =?utf-8?B?NmtLQnZiZ0dNekNMYkxjNVBQZ3Myc1dpUXZuU1N3N0lyNVF3ZDFGMzYzdGJu?=
 =?utf-8?B?ZXFaU1daUnRRdEtlMjFwWnlyWkhreEhxeWJRNzRKWlJwSEF0VFozNDBQYVFI?=
 =?utf-8?B?VWg3bXdjTThQRWhibkxiRDdFT2Z3WUVvUWxxZ2UxSGp1T2VyUmdqckNFMXRq?=
 =?utf-8?B?NC9nRGthTHpUaVE4OTY3STdyVGZwVURQOUVUbkQ4akJJVWIrbzZiNE5ROGhB?=
 =?utf-8?B?blBlbWZEZXNnNzFxcUx6NEw2bzBUM2tSOVh5Z1NDMTdjUlZLUVhaTkg5cGZX?=
 =?utf-8?B?TzNxZFNNdDRjVDhpRCtNT3krTkcrOHA2UXFuWlhXVEoyTnlVcXFoV2tWQzFr?=
 =?utf-8?B?amo4emJPV2tQL3RnbHpTYTM4OVFjOExqbExwSGNBZzhxR1RTSHk1cXJNYmFv?=
 =?utf-8?B?VlhSU2dyRnNQME12czQvdFlMNHdQTHVmR3F2dC9hQXgvUm5RdXEwaGRKT2Zs?=
 =?utf-8?B?VkRkeWpiSWZkL3d5b3ZmaHk5cGR2cDcxclh2QzhmMGJ6a0hTTmcvRzl6QUFk?=
 =?utf-8?B?a3VzQk5TaVdjaExpZTR3cFkwcStmQUFPZkpDVnREd093dFgrd3VMZkd4NTFj?=
 =?utf-8?B?T09ZSTV3T1JpOHVWSW5CcHhiODhNaUFmY1BxaENoTUszZXZWQ0RJR3p6R2tD?=
 =?utf-8?B?eXUyNnQ0cElxdnV2ZVpCVTZqUlNQc2ltMVhLWUpLSzUvQnpoVjhucmhrc2o0?=
 =?utf-8?B?MFFQUS9VKzRXdVRCRG44K241RXcrbTZQVytSY3pIZlhCekxldGtndUtHd1Yy?=
 =?utf-8?B?VUc5NzBZTjRWMDExY3hnZkl0VFBuTUQxQmlibVJvNFREdFpSaTc4S2U0TnVs?=
 =?utf-8?B?Uy9UcEg4aGNZOXR6Ti82S3RIamQyUTBFSDc2T0ZsOUxuU3pQMFFWT21nRlYv?=
 =?utf-8?B?QkRQS1lTek1IZjhaNk5PcVpNRUQ4Yi9ta0FIQ1UveGMxQWNsRkhGcnJISDRl?=
 =?utf-8?B?TFFwU1NWSUN4UlVyYXZ6eGpzY2FBcWtSTjlNYTQ5QVJrK3BPeHRGWU0vSnRG?=
 =?utf-8?B?TEowTDltbzJQL1VYYXgvRGJsK0s5NFV3VUFBWmZZenVUb2xseHRIREFtc2ZF?=
 =?utf-8?B?Y0J6Z3hORU9PdXBMbUNuREVKMnBxS3czR04xakpBZTB0eUxFVUhGUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9e88c05-16a2-4344-d98c-08de5db3c8e7
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 14:53:08.7025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MqJOL1dJK7EzgJX6wmIDAiZmcf48iQeN7XbDv7CgFyoIoO6A0hxPG5e2OHbnN3sxyTthCzT0npaQK0XkJ6xxKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9464

Hi Danilo,

On 22/01/2026 19:35, Danilo Krummrich wrote:
> On Thu Jan 22, 2026 at 7:58 PM CET, Jon Hunter wrote:
>> On 22/01/2026 18:12, Danilo Krummrich wrote:
>>> With this diff, if I intentionally create a deadlock condition on my machine, I
>>> do see a lockdep splat as expected.
>>>
>>> Anyways, another option would be to attach a hardware debugger (I assume you
>>> have TRACE32 or something available?) and then get a backtrace from the CPU
>>> affected of the deadlock.
>>
>> Unfortunately, these days I don't have such tools available so that's
>> not an option.
> 
> Hm..slowly running out of options. :)
> 
> I remember you previously said that you can still SSH into the machine? If so,
> can you please share the the first output of
> 
> 	echo l > /proc/sysrq-trigger
> 
> directly after booting?
> 
> Subsequently, can you please also run
> 
> 	echo w > /proc/sysrq-trigger
> 
> and
> 
> 	echo t > /proc/sysrq-trigger

You can find the output of the above commands here:

https://pastebin.com/PuhFURwh

If you search for 'state:D', you can see that various drivers are stuck 
waiting for the mutex. I believe that this all happens because the SPI 
driver crashed during the probe and prevents any further drivers from 
probing.

Jon

-- 
nvpublic

