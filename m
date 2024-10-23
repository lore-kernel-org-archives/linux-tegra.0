Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2049.outbound.protection.outlook.com [40.107.92.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9BA1DFEF;
	Wed, 23 Oct 2024 13:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729689906; cv=fail; b=Ztc5YVp/3fz9jfIcFhqXV/iRV71y0+MPyhP0jfh0ubXVwzUhRM73sELrML1zxWsClkpnaPXboff7ZsLwIKCTxWeZEsri1xblhMofD1VZfoDLpAGqsXrNlGmLKXqBPCUWexhvYHgh8ZnC6nCksehlCz811uIfnKIe7eGKXJ9on6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729689906; c=relaxed/simple;
	bh=TQiNm8e96j6qtNIpKJaNc98d6vbbKYOtn1L+Ghl+Kn4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=h7rikUzI+bujqLMKNbN88rZSBWihbZ4XYEfB31jPebRt5W+rJV0JCgUQLcBELQ6xYDypqloRB+YhJcXaMzckfq83Se2bb1RMd59qfth2xw/qbV7jQlTScwtJpdpElcH7EJXlc2TP8kH1/dnUucstnf3/mW0r/R46B6HcaKltsss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=g3X3uGX9; arc=fail smtp.client-ip=40.107.92.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="g3X3uGX9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TpJwUAiVMaE3NX+S54mSLZEAgv3njaIc0Dvluyv6TxW5mhKKN9xHuvidSmsMsdpeaO/c8s2cW5kP50dOLZMGBu0Zzn9Jwiz9A/k6IR8P3UWPbSF6bH8pxP4an4+1xMdnQlQaE3B6tvn6AXsToO9bZmaxIUMJBJbnp9bxWBfO+LETNLqhLF0SlJZceVoEHhpNcOD19hTE5RJVaYAy93RKeAcdYtvM0HtQEhIZNjjFZPEW6hK0hBnNy/dmE6HjH6Ogix54reeRlaQbtyUHV7ndaEXv8ke4JrlMjdH9sdO9uF1FcUcfCJjtOuxgvdnDWtUfhcWpbT0NuftibeVlpz2wcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mMkm5hmvYfH/llhF+ignyEiAPD7vI5T60NS1AjoZDSA=;
 b=TR6FGlqmv0xG3+SBjn0twtdKGr0B7c6oug6DMXWOIHnmKmx530l23zertcDXQxzIgLBtlDCqUZ3bQ0tcNzWvgS6a4QFEwHkAvBYMvfsr2Dw8EhXe2hKB1dRnhnUTnQ6Kj7aCK1NtHY3egy6j2UGqmTYQkFkqpMt8MF2CghH0HPGjXAuAhgARIx+MRx0hyc4GKscQuLoHzN0MZjDmXYng8ZsV2sjYZgjkSj234Y/KOKkbo9zEjwquk3r18vhTe6ML2pf5StxG8IrFLWAku9ZHdklzuUEMoM2vTTm6qWC3Rm7ZSFYaFcJ2U5j4sAdz441G79j4Wxas/iB606C0+xeREg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mMkm5hmvYfH/llhF+ignyEiAPD7vI5T60NS1AjoZDSA=;
 b=g3X3uGX9rOWkP0RLiTokeRLKxD1yCuc64dZczdtFd2Y1Z8rJdlrKhW8qC9Tus/vF2VdBlS66DdLw8xN1kzgFaIDL2OiN8a8hG4yJhLiU4MEOYRxHLbEOP5CTaIcECM3JDX4l3bm4phETfFpg0Lj3MEmlfwIe5TFKi8TPJpvd01TWWjZYzyoejQnV6xtKAlzxM4kxJBZ500DoY2kqegSRXhfUKVMvQAJ8uOSvwa5pw8v6ktTlop0d+CeiDECpRAwblZ95lPP2pgMZbqq1zCiDFUlyKIMmHAXNY99Qx4yA2XZ1mIa0sRrvtYfICeYBkUl5/QmCEXeeqIkr5q6u5DVxOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by SN7PR12MB6816.namprd12.prod.outlook.com (2603:10b6:806:264::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Wed, 23 Oct
 2024 13:24:57 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%5]) with mapi id 15.20.8093.014; Wed, 23 Oct 2024
 13:24:57 +0000
Message-ID: <8b4723ba-fffe-4616-8055-02a9cf6f2894@nvidia.com>
Date: Wed, 23 Oct 2024 14:24:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] driver core: Don't try to create links if they are not
 needed
To: Saravana Kannan <saravanak@google.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20240910130019.35081-1-jonathanh@nvidia.com>
 <2024091152-impound-salt-c748@gregkh>
 <d89c89f8-0036-44a4-8ffa-ea89ed576a9f@nvidia.com>
 <2024091627-online-favored-7a9f@gregkh>
 <b1b67db0-3b9c-4d96-a119-fe3fcf51b6e3@nvidia.com>
 <CAGETcx8E9FddpwMO4+oqeEc0RVMLbUOs2m+=B900xzrLvEkSXw@mail.gmail.com>
 <2c42677c-5e8e-4805-b6a5-0a5baa3e55b5@nvidia.com>
 <d9aadede-dfac-410a-b65b-e295c9a64951@notapiano>
 <CAGETcx-_z4hxyNSwT-D1MKNzAjOGSX+o7x5G8J0KkiUyy+RkDQ@mail.gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <CAGETcx-_z4hxyNSwT-D1MKNzAjOGSX+o7x5G8J0KkiUyy+RkDQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0272.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::7) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|SN7PR12MB6816:EE_
X-MS-Office365-Filtering-Correlation-Id: c2a6875e-b5db-4402-16bd-08dcf36616ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MUs1TXVTclFaTlFSMU94b2MxVytYOW1zRlBVMUVBd0UrakRVOWdzQWlpNjUr?=
 =?utf-8?B?T2ZzL3ZiN0luTzRuZUVoQ1htdDVZeTlJMkVjN2JIdFNQS093MVoyVUxIbVh2?=
 =?utf-8?B?VFZ2Ty9MbGsvWmVoanljcGkyRlgvK29oU3VwVE8xUytjT2hLT0RqSEdyeGRp?=
 =?utf-8?B?aXRoOHdJV2tOTmI1ZHdzVXQwZE9TR2Vtd25CY2Vid1hSVzVCa2hsZWNyc0xF?=
 =?utf-8?B?NVozMDR2bEtENXpKVEFqQndQcVdUT210M2llRzFQQ3JvZDRKc0ZTTndNTWFR?=
 =?utf-8?B?bmlKZTU5Z0NvVnpSN3B1bTZkNmRTbmlyY0hxVmtWWVdBbndHM043WE9PQ3Zr?=
 =?utf-8?B?bWNkUUhGUmtXSU11bXpyd2pucEp6UTJiRWt4Y1VacG1tbGxNekRiaTNicWJL?=
 =?utf-8?B?SnpGN3ppaHJ1dElXbW43aWFDM3Y2WlhlbEJ4NDhuUjQwdTh1emdvVksyYS80?=
 =?utf-8?B?b0tISE1zSFMrUDJidkExZ2ZaTEVzTTlWa2FzRHRncXNGRkpNeVAzSEJwbitI?=
 =?utf-8?B?c3JUaVdDOVFhbDVlRlNDMGx6b2dJOTI2UzJyWmx0aDk5V1czY3lmM3FlSm4y?=
 =?utf-8?B?aDQ0NGF2VTdCalY5YkdYcGJ4MlZ0Q280QUJrby9vT25oRko0SHl4dWlDelJw?=
 =?utf-8?B?MmhxL1NXeGlxN2pJQjJJV2FwQ2wyZnd4enk1bGh1azBUaEJxTzIveEJSZm9M?=
 =?utf-8?B?VE1pczdjdkZxbDZaWWd6T256dmJQZjBqeFVrRUtrVzkyZGI5RDFGdE1MMy9s?=
 =?utf-8?B?dGhWanpKZjhhTGhGNktxZFF3OHp1bm51ZUdCNU5SOCs1SytuQXREb2x2cVhk?=
 =?utf-8?B?bWxRenVPTk5kcVNYNDlRTmtuQWIzdXhTdnM5WDNWdzRmdUtqU0owUzRJaGVl?=
 =?utf-8?B?aGRvRmI2MEt1MWVqcHVGeDg3L1J6Z3lkK2U5MWQyaTdyTW5YRFlEM1BVajV0?=
 =?utf-8?B?OWs4Ym5PcjNRSjk5SzlFR3UvTENpS3QxSTJjR3dIaUlabDBHRWNSZWhRT053?=
 =?utf-8?B?Q1VhSUFuNUN0QTNBeW56ZmRpNzJRcGlWdW50ckRjbW5NdkJjdUJwRmNxZ3M3?=
 =?utf-8?B?cUJzaGVqM3NJekp2blozWVJWREZnV1g4Z2RDbUU2UmpWN3RaMnlxRkxNMUpX?=
 =?utf-8?B?NVRPRVNSVjRmblRLQlBlVlhiYUdFUi8vT2U1Y1JXRGFidm5hWXdWL0lOZ1Vk?=
 =?utf-8?B?dkNCOE81UVhFbnNLc3FDTVZXN3o0bU56REx1cDhsenlRdHg2dEtIUXFiWUZO?=
 =?utf-8?B?M2dRV245QkZwTDFET2pwTkJsVHVpVEV6Y1F4TTlUSWNJRDdFU1h6OVhaVmMv?=
 =?utf-8?B?SjdXaVNpa251bHNsOFRiYnB4K3dlVGtCOXFTbnFCRHN4cEtGd3Mva3ZIKytT?=
 =?utf-8?B?ek5RS1FrbGxidGhvbzR2em1pS1ZBNWFaKzVSNk44UUJDYnQzVDJTZGpmSXRx?=
 =?utf-8?B?WVNwR1hRTGU1Q1JPSzlvc1ZtMmJEWlowY05kWWdSblRuT1J0ckh6dk9Fd0lI?=
 =?utf-8?B?Vy9uMnhNZTVtRkwvZm1yQTlVMzFqY210Y0xEVHNhNDIwaXd2WVNadk5XL1la?=
 =?utf-8?B?MGxERHBoKzlWVkZUYWxPWjRZbnNacEFzeVVaZTV2ZmVHSWdUWkJOeVlGV3R0?=
 =?utf-8?B?eTIxY2MwWi9XVlRzNWkvZnJBTnRhaDhQSExrQjJIVFY5K2NXV0pDZk56Q29D?=
 =?utf-8?B?YmsycTBOaXdzaUUvTEo4L0xTV051cUFzYWpXQ1p4MDdWeEROMEhMQjFjcjRu?=
 =?utf-8?Q?wb4xNED0uz1O0DTXeZj/9YwJWN2c3DJvYZNza1E?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WXhwTkFlaFJzd0NzTFEyVkxCcHBUZzZZdUdjSzN5N1NobzA2R2tGSlpDT0pj?=
 =?utf-8?B?VWdqSDNSaXZnNWZuZEJWMTB4eERoUG5YMWZGeUdiTldxSFRoYnorblQ0dnUv?=
 =?utf-8?B?SjRhWk1teVBqWlpSeG5xekd6RS9tWFdFSW5KcXhMc2NoS1paZ2h0cUVoTWZm?=
 =?utf-8?B?Y2M2d1pURVZxQzJObU9KOGdxbFZ4QjdKSFlwMy90V2ZITnNjdnMyRTNmMG9n?=
 =?utf-8?B?azNHNi9KWjFWS3F0VEJBTXRBMXM4ZEtUQnY1eXpMdTJ3ZkRJdUtPVmlpWlY1?=
 =?utf-8?B?RHlNM0o0UGprakdWcS9TbXdvZ0g4cjhhRVhESkJhMUxISW9yR1NFVmdMeERt?=
 =?utf-8?B?Y3pUZ1dNQkdjcEszR1NMTmJ1UHNuL3krei9MV2N5dXZpR2lyV00wQi95L1ZT?=
 =?utf-8?B?RUhqaWtmUlBTYUx4Sk9hbnAyc2tON3ZlVjhWMUtyODlMZ2Zsb3plcTl1WXhn?=
 =?utf-8?B?cCtUSDJBTzJZdjR5NmFkL3A2YWUrdTFQUGh2VUUwT3k0cXFqeUN4bk1zMEhS?=
 =?utf-8?B?MWxQQ090MFFSWGhrakc1L0dnbUUweWlqWTVHOGFTYUFZZkhqWnozQTNSaHM4?=
 =?utf-8?B?ZTd3ei81Z3BOK01OOVp0QnlRRmJHU2NnUWN1YUVZaS9rRExTQmZ6bWhVOE9G?=
 =?utf-8?B?MDdhV3M3aURQWTB3Uy9rSXUrUXBERUsrYW93TEVXV3drU2tDV3hIQVNIWTk1?=
 =?utf-8?B?Y2p3L0oyV2IvODdLbHhncWV4WGQwWGJKKysrYTd6d0VWOVd4bFc1eXd5YitH?=
 =?utf-8?B?Y001K0dKNHNNeG96UUs2RTM0MjJQY0lsanBXZjZKVWNsaXlOeW1WZkxTOHpH?=
 =?utf-8?B?eFdWSUtoZ1loMC9NSFNlNkR0UmpzWlhNZi9zWkNtTW5kVmZVanVoOHlDajg1?=
 =?utf-8?B?S1lwTUJsMW1SY01lMXB5MHNLbnZsK2VzUFRpcEhucWVhZGc3bzV0QVFYS0FG?=
 =?utf-8?B?YUVRUy9lNG1KcmwwTnJ3end4RERFYjY5bm5wc1V5UjkxNkpLTkptTzU0bzJI?=
 =?utf-8?B?U3JMRzJIT21YMWFnNGZFL2RqVG9KdmY4OHU0VlRoNUcxdGNNR3NKa2ZiMTdm?=
 =?utf-8?B?dVoxME02UkJJcGNRRWNaRnltSDYvN3FqbzE1WjQ4eUY5UG5BT2F1Sk9YL3l1?=
 =?utf-8?B?d0JSdmFIK21FMkdKZ0xIbW1GZEVHQVRJQkhFYjVuRU9wa2pSNnJ3RmNKRzFn?=
 =?utf-8?B?am1sb3ZlN1dsRjBmbVpEYWZaN3Zhc0xraFVlVFlTVFlyd0tsa0pFRlQ0d0Nz?=
 =?utf-8?B?VDJnQ2dvZzF0ZXNadVJ1Ky85aEQxL3ZaQWJOaEdjR3dNcENLUEJsR05USXRW?=
 =?utf-8?B?bzVyc3lXUG9xQVBJdC9hcWYzR09mLy9ibEJEU2Jjek9FaTdmNGdERjdKSDhl?=
 =?utf-8?B?NGloVUFIb2owaGRzK3JDVU42UXpzbmVDbFp1QXRXRGhRT1ZtMnhBWUZFR3Rw?=
 =?utf-8?B?SXgzdi96N3VjOHFqbHdqaE0wRkhacnVJNVRVS3RMbldQc2tBdCsyNFpIeVBv?=
 =?utf-8?B?K1ZjRzd4K2U2OFc5NFFCcUJzcUplc2ZiRGR1U0hnZ0RxUGprd0twUzVGNzlQ?=
 =?utf-8?B?aWY5bGQ4U3ZwU0R0QXBXR3BKZmZiYmFMWW0yMExxS2xOdTBXQ2RweGNBckU2?=
 =?utf-8?B?RkRkQ1FvYjhYNVZOb1c5Zk1ON1VXRFZYanpGb05vZ1BlVUxFalA4aVl6K1ZD?=
 =?utf-8?B?Ynd3Y2FjakY4RWhMM1l2c09vWlptbFM1T2l5dFVRcmxWdXY1VXpPYWcxMXlt?=
 =?utf-8?B?Uk9JNGxtd0YzekdkdUxzdS9jdTJIVUNabU16Zy9iekExbXFZWExoNjlsMHpH?=
 =?utf-8?B?SXJ4UGRMVUN5WE1nY0ZFNy9meGM5Y1owMlJxNWRNUFl0bWR6MTcxaEVKdS9Q?=
 =?utf-8?B?NWNjSVZXbTNCMTVDeVVobXExN2xCZmg4WVhBOHQ2WEtzVDk0V3FkYmcwWWVH?=
 =?utf-8?B?ZXoyUktORTZIc2RwOXhnbHNwMWF2ZWFRemlQWDFLa1RWNUh1Y1Z1ZlZDaU9z?=
 =?utf-8?B?SklEcmZ5SWJNMmFQc1VqbEExVEtFeERQNHdqVUdybVU0LzlSWkdGZm1jYmxL?=
 =?utf-8?B?TXFraGVDektLZytQbUIrOHdKdnJPamlFRWtWWW1IR1NnRTRyNU1nRHg3SGN4?=
 =?utf-8?B?WVRvcXBNZ2c2THBKS2JrUVpEc3dGWlkzSS9mbTJsSVYwcWlrYU5wTTh1Q05z?=
 =?utf-8?B?TUFKczdsQmZmcGRCV0lJQ1ZQcmZqUEZzVWlyRWNiek9TV3FSRTBBTysyQVdV?=
 =?utf-8?B?OC96OEJJdFhqS09FMEVRWHYyNThBPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2a6875e-b5db-4402-16bd-08dcf36616ba
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 13:24:57.6525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: soaZ5JQJXsIDFtkC1g8XE3PantrEyBqds3fU4ZKgxiR8B20aK611T/B4htjrSNrVcz9pkihVbnOxyLVzpLgvdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6816


On 23/10/2024 02:00, Saravana Kannan wrote:
> On Thu, Oct 3, 2024 at 7:59 AM Nícolas F. R. A. Prado
> <nfraprado@collabora.com> wrote:
>>
>> On Thu, Oct 03, 2024 at 11:25:22AM +0100, Jon Hunter wrote:
>>>
>>> On 02/10/2024 21:38, Saravana Kannan wrote:
>>>> On Wed, Oct 2, 2024 at 11:30 AM Jon Hunter <jonathanh@nvidia.com> wrote:
>>>>>
>>>>> Hi Greg,
>>>>>
>>>>> On 16/09/2024 18:49, Greg Kroah-Hartman wrote:
>>>>>> On Mon, Sep 16, 2024 at 03:50:34PM +0100, Jon Hunter wrote:
>>>>>>>
>>>>>>> On 11/09/2024 15:32, Greg Kroah-Hartman wrote:
>>>>>>>> On Tue, Sep 10, 2024 at 02:00:19PM +0100, Jon Hunter wrote:
>>>>>>>>> The following error messages are observed on boot with the Tegra234
>>>>>>>>> Jetson AGX Orin board ...
>>>>>>>>>
>>>>>>>>>      tegra-xusb-padctl 3520000.padctl: Failed to create device link (0x180)
>>>>>>>>>        with 1-0008
>>>>>>>>>      tegra-xusb-padctl 3520000.padctl: Failed to create device link (0x180)
>>>>>>>>>        with 1-0008
>>>>>>>>>      tegra-xusb-padctl 3520000.padctl: Failed to create device link (0x180)
>>>>>>>>>        with 1-0008
>>>>>>>>>
>>>>>>>>> In the above case, device_link_add() intentionally returns NULL because
>>>>>>>>> these are SYNC_STATE_ONLY links and the device is already probed.
>>>>>>>>> Therefore, the above messages are not actually errors. Fix this by
>>>>>>>>> replicating the test from device_link_add() in the function
>>>>>>>>> fw_devlink_create_devlink() and don't call device_link_add() if there
>>>>>>>>> are no links to create.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>>>>>>>>
>>>>>>>> What commit id does this fix?
>>>>>>>
>>>>>>>
>>>>>>> Hard to say exactly. The above error message was first added with commit
>>>>>>> 3fb16866b51d ("driver core: fw_devlink: Make cycle detection more robust")
>>>>>>> but at this time we did not have the support in place for Tegra234 USB. I am
>>>>>>> guessing we first started seeing this when I enabled support for the type-c
>>>>>>> controller in commit 16744314ee57 ("arm64: tegra: Populate USB Type-C
>>>>>>> Controller for Jetson AGX Orin"). I can confirm if that is helpful?
>>>>>>>
>>>>>>
>>>>>> That helps, I'll look at this after -rc1 is out, thanks!
>>>>>
>>>>>
>>>>> Let me know if there is anything else I can answer on this one.
>>>>
>>>> Hi Jon,
>>>>
>>>> See this.
>>>> https://lore.kernel.org/all/c622df86-0372-450e-b3dd-ab93cd051d6f@notapiano/
>>>>
>>>> Ignore my point 1. My point 2 still stands. I got busy and forgot to
>>>> reply to Nícolas.
>>>>
>>>> I'm fine with either one of your patches as long as we define a
>>>> "useless link" function and use it in all the places.
>>>
>>>
>>> Thanks! Yes I am also fine with Nicolas' fix too. I quite like the dev_dbg()
>>> in Nicolas' version. I was wondering if we should define a function for this
>>> check too.
>>>
>>> Nicolas do you want to update your patch with a 'useless link' function? I
>>> will be happy to test on my side. Looks like you identified the exact patch
>>> that introduced this and have the appropriate fixes tag too.
>>
>> Hi Jon,
>>
>> I just sent a reply to that thread yesterday going a bit further down the rabbit
>> hole to try and answer if there's an underlying issue there that the log
>> messages are just exposing, but I still don't understand all the devlink details
>> involved so was hoping for some feedback from Saravana.
>>
>> But if there's no feedback I can surely update the patch with the commonized
>> function to fix the immediate problem. I'll wait a couple days to give Saravana
>> (and others) some time to respond.
> 
> Finally managed to squeeze in some time for Nicolas's issue. It was a
> real issue. Replied to the original thread from Nicolas.
> 
> Jon, can you do an analysis similar to Nicolas? What consumer node did
> fw_devlink try to create a link for and what consumer device did it
> end up creating a device link with instead?


I am not 100% sure what you want, but enabling the same debug messages
as Nicolas I am seeing ...

[    9.867969] i2c 3-0008: bus: 'i2c': __driver_probe_device: matched device with driver ucsi_ccg
[    9.868004] i2c 3-0008: bus: 'i2c': really_probe: probing driver ucsi_ccg with device
[    9.898834] ucsi_ccg 3-0008: driver: 'ucsi_ccg': driver_bound: bound to device
[    9.898845] /bus@0/padctl@3520000/ports/usb3-0 Linked as a fwnode consumer to /bus@0/i2c@c240000/typec@8
[    9.898858] /bus@0/padctl@3520000/ports/usb3-0 Dropping the fwnode link to /bus@0/i2c@c240000/typec@8/connector@0
[    9.898871] /bus@0/padctl@3520000/ports/usb2-1 Linked as a fwnode consumer to /bus@0/i2c@c240000/typec@8
[    9.898881] /bus@0/padctl@3520000/ports/usb2-1 Dropping the fwnode link to /bus@0/i2c@c240000/typec@8/connector@0
[    9.898893] /bus@0/padctl@3520000/ports/usb3-1 Linked as a fwnode consumer to /bus@0/i2c@c240000/typec@8
[    9.898899] /bus@0/padctl@3520000/ports/usb3-1 Dropping the fwnode link to /bus@0/i2c@c240000/typec@8/connector@1
[    9.898905] /bus@0/padctl@3520000/ports/usb2-0 Linked as a fwnode consumer to /bus@0/i2c@c240000/typec@8
[    9.898910] /bus@0/padctl@3520000/ports/usb2-0 Dropping the fwnode link to /bus@0/i2c@c240000/typec@8/connector@1
[    9.898923] device: 'i2c:3-0008--usb_role:usb2-0-role-switch': device_add
[    9.898961] usb_role usb2-0-role-switch: Linked as a sync state only consumer to 3-0008
[    9.898963] /bus@0/padctl@3520000/ports/usb2-0 Dropping the fwnode link to /bus@0/i2c@c240000/typec@8
[    9.898970] tegra-xusb-padctl 3520000.padctl: Failed to create device link (0x180) with 3-0008
[    9.907920] tegra-xusb-padctl 3520000.padctl: Failed to create device link (0x180) with 3-0008
[    9.916841] tegra-xusb-padctl 3520000.padctl: Failed to create device link (0x180) with 3-0008
[    9.925798] ucsi_ccg 3-0008: Dropping the link to usb2-0-role-switch
[    9.925808] device: 'usb_role:usb2-0-role-switch--i2c:3-0008': device_unregister
[    9.925903] ucsi_ccg 3-0008: Dropping the link to 3520000.padctl
[    9.925908] device: 'platform:3520000.padctl--i2c:3-0008': device_unregister
[    9.926001] ucsi_ccg 3-0008: bus: 'i2c': really_probe: bound device to driver ucsi_ccg
[    9.963266] device: 'platform:3520000.padctl--typec:port0': device_add
[    9.963296] typec port0: Linked as a consumer to 3520000.padctl
[    9.963298] /bus@0/i2c@c240000/typec@8/connector@0 Dropping the fwnode link to /bus@0/padctl@3520000
[   10.015196] device: 'platform:3520000.padctl--typec:port1': device_add
[   10.015291] typec port1: Linked as a sync state only consumer to 3520000.padctl
[   10.015302] /bus@0/i2c@c240000/typec@8/connector@1 Dropping the fwnode link to /bus@0/padctl@35

Let me know if there is anything else you need.

Jon
-- 
nvpublic
