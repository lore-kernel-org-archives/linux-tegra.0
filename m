Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794406335;
	b=Pr54UNmdfeYfoshrryyGvTosSdH95qi2uTlilCzngwlTJO4m+SfV3wq8XkECGczXmcAu
	 VGLidl3hj18P6oMtZFjBLWdNQwIo0GhjgzN7c60ZX+qdZxw3wp8LlzahF8bpEJWeyc4T0
	 B47ybtD7WZnPfb4f/vgqTASdRaHfZOzYk4LCqMNJy2rDTKrr6chnpS+uLEME2R0xsGx5U
	 YBQLpcpEmKQSU/ZSfAoIuxGSaIrsmiz+IO1aXCOxSkKsCEGxh3A2oWc1YfXTn5HjJchzq
	 7AmaZjYDKktdbwwu/pos1Vp8Eb5UckuKGM57d3qHucnoYxhmFQX1CdjO9EUDTlJrTCQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794406335;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Dn+Culyw4ZYE+1rWw64tx3+N8CqdChzMPI6DCsQOogw=;
	b=WvpcbkFJwlY01iTF4P8Z3PxrxLg8I8Jde0//i09xV5tw+bkjnqSzJgCwUA2vh3H2OBt4
	 7UOLXiwYoyRqB6Kp54sDXxYcuG9mGrMv2BvgBnYfzOjphUl8pLzTRw9S++xzq3k0YsyiP
	 R1MDxNxJy9u2lq/7S7neN9VDgNT9EMf/CVEbzCTiZXhkfIFRpTx27lk6q8axg6L9U4J7+
	 6RxVSnN1ZK3sMu6KydmtAczhl3VW+83s3HU5LJGikjMjpiHh7SlA6VJOeLU49RUQIzJmM
	 ve1XEGLziP13cI06q+4M6ZzNeWRatBHtHlH4tAUV903WEQVjdEIOm++q29MvWZHt1fg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=iOHL5kAS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.11
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010011.outbound.protection.outlook.com [52.101.56.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39575606A324;
	Wed, 11 Nov 2026 14:12:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39575606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=iOHL5kAS
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V+ByT48v+4U0GUmBMr9+okovvEBmNIYvahDxBv5s7sv+v7CXsrUrLzy+q8fqvJT7rz1xCURGPtNmJJ8scvr1eOf+6Ap+QhS1Mj96hJalwJ31WFfcWHrLK30xuWfIzMveaZy6/8re0ZGTjzfzFmM2o0xwgS2f2UK9ToNM/hFrOkURySNEqkVGOSgyi6Bjf1WjXZB5kpFdXTD7hKlKd97mAeeNhUdlkC7C6qdCvMNVGNfKUFxo/I1ECKMUn/Ylx49FdCMytrzoDv/ndFc9lBYGSRLiS3danUzdyvu0E4qFFhwRqcc9AZOHiUs4tct+43QrZIq2g0JoPRFJDPvoKu6sHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dn+Culyw4ZYE+1rWw64tx3+N8CqdChzMPI6DCsQOogw=;
 b=JPCVA2f/mAjinYSNnGFIAJDQ22WvLPj4pcOQxj88nIlLIRa+tjFd+3BEHc3osffDoOX59DSVqW0GgKsKxbpKHqIN+3/3dg2ey2uzITJsjvL9WVgAb60C8TIPpYt/tAAnedjo/TOBy2D2fXF+5Tpb05lQOxsx1zFPOL/Ou+Pr29FPbrCwQHhhEMmEM0xFStPrrdnZbtcpWG61fz+37rfoOEflw9D+sVCArpeTpYI6DmH469QMahH5YMTedvcWUlmXnJI3OxRjFGSRO1Ax2k5z1keJWHLHSB94/s/hshi5Z9vNyeM+1ywdmTu5teZtWzN1nDnrrR2QTUNRU6ZH7B+cng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dn+Culyw4ZYE+1rWw64tx3+N8CqdChzMPI6DCsQOogw=;
 b=iOHL5kASTvINZmENqjT6HPteOTHTucSXP8eEt7Uzhh7WHXSfp6k2ls5/biP86cQ5nhMXBfjOI45u41lMa0m1srOkkZi03/2oBmgiRUc10+wUXxpJDXWlB3n+rcU7KPvt84VraIriFNKLdhPp9w7VjjWMAmzebNZkFsRf+yZIyfz7kbI9K3bG8NklcJPV5Xv5/bKQgQXnm7etI3D5xShLkiQGHkoZOdg0zwTlkKdNE/5rDSGU6TrnuLXUGi3EMY78IAxW6pN23BoodDkIumACXY2k2FE/R+X4ViC17uyKN3B59Jl5QQg0dJSsmo0kmjfoWMYcG1y04tel3S5Y1XmyaA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7110.namprd12.prod.outlook.com (2603:10b6:510:22e::11)
 by MN2PR12MB4343.namprd12.prod.outlook.com (2603:10b6:208:26f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 14:12:11 +0000
Received: from PH8PR12MB7110.namprd12.prod.outlook.com
 ([fe80::736a:e1be:ec64:5740]) by PH8PR12MB7110.namprd12.prod.outlook.com
 ([fe80::736a:e1be:ec64:5740%6]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 14:12:11 +0000
Message-ID: <5882de47-d50c-4e64-94b7-dc41b0e647cd@nvidia.com>
Date: Wed, 11 Nov 2026 14:12:05 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] dmaengine: tegra210-adma: Add Tegra268 support
To: Sheetal <sheetal@nvidia.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>,
 Thierry Reding <thierry.reding@kernel.org>, Mohan Kumar
 <mkumard@nvidia.com>, Sameer Pujar <spujar@nvidia.com>,
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261104110932.1097294-1-sheetal@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20261104110932.1097294-1-sheetal@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P193CA0012.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::17) To PH8PR12MB7110.namprd12.prod.outlook.com
 (2603:10b6:510:22e::11)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7110:EE_|MN2PR12MB4343:EE_
X-MS-Office365-Filtering-Correlation-Id: 85b6f03c-c43d-4ab1-10f2-08df3ffdc763
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|23010399003|366016|1800799024|376014|7416014|18002099003|22082099003|6133799003|261009223027099003|11063799006|56012099006|261102123227099003|261021121427099003|261021123027099003|261022075727099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	dXrSMpXaOk2YMDXeloRBR1V+E7yU6B+2loOG3xnKKcYxcoFrJxza3bCqXOo3ULgTEDS8f41PBHeqcmYSDtyWJeakWxwt8k2qQp58F7CaOGazT+INnz3+BeIaOvn53ooJBy0hwpudp5Wi2UnEaZ6SR42lf/7Lw2uQUj5rppFGBAFogGSERFtJpaGJtb4djPwmn0SAiCs/B4tB02r+AtDeyEcvyXg2FMNKRfE+o4qbXSmc+3V42DTauUixiEBvbHtpG4IEMOWfwt1WKxnwf0LvldXPkdarxl/jMLip5UmATGOGbWmfbi4X8bgIz7SH3e1K9i8nW5T9T1U5mPSJukCaoN81qFRdMeqMNwNPDcP7h6cZwyj/v6ZOKm7ggNjG7RzcO6Psw7EHidu8rbhBazaMQLyHQXHCMvp8veHMKGlI60UAoOelI/an5Ha3Cvd2YLuke7ZDCFKBHd/DdO3Au5QlgUxJtCMkvP2IvvU9PSxCBYJBFVIKz2nUr3HAsQFFs5WH118yMyBUwOFUefLjDc/3Trclrl9RoyNoGkVVDlqGPfAgAFFlVtxzsp8KpJKOgLeW8y7ncde5hX8wvJ9DCkIfUWH9YJnQV2vnuYwSg2rk5xLgjXnklkYLaDJV73Gbt0NJ07T2wNYcmXtImyP9Zm206tZoUmqe0weN6K48sS+YEUw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7110.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(366016)(1800799024)(376014)(7416014)(18002099003)(22082099003)(6133799003)(261009223027099003)(11063799006)(56012099006)(261102123227099003)(261021121427099003)(261021123027099003)(261022075727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YnBUOGljeTNtMUV2d1M1bWd3SkpKeW9aNmNURkZPRTlnQ3pIWHdCTEFlZEpu?=
 =?utf-8?B?ODExVHpyR05SL2JMM1lJQ1BKWlhXZG15Z2Mwa0tyZXk1ODhCbHZWNzNuSzF1?=
 =?utf-8?B?N3JJTUliY1Q4TXlKTWU2Q0hZa0JuSkxtb3JlVnZoTEtqUHlxRDd4Y3JWemhi?=
 =?utf-8?B?RXd6MmxITHM3VG9Hdk10bHZobFdGeVdEVmJJVWdMUUNNZXBwaGpUYTZxakly?=
 =?utf-8?B?MXlMb3dGRllYbUFsMDdxTklqclN1bW9yV0hUQ0dEQWNxM0NOUG5ja2YwSG8v?=
 =?utf-8?B?TVJpTUhGaFdkTkhYbGZoN3gyRFdwY1Bpc3pIRE5lNXVyaVE5Zno3WWZjWTF6?=
 =?utf-8?B?VmtHZkQrTWlGZnllODVGY0dFdk5oMU5sTUpqenFONms1ZnozNmdUaTd2dUJQ?=
 =?utf-8?B?NEN5bFAzUVJ3ZUdkZmNVbSsxMFpEUTArbHp2Znh3S1VoYStVSTc3bkxEc2xw?=
 =?utf-8?B?TFg0UndXR0NEQ0lhZE5IdUVwcjhMU0xlQTlidm12MmdSZEVxSGFadnI5QmR0?=
 =?utf-8?B?THhNdmswcGlzU1c2b09yQ0NXaGhhQ1pNdHpnL09hWHZDY1JMbndwVEhRVFA5?=
 =?utf-8?B?QmZQWk5OWjJCbVZnVEhaWCt1TFlUWk9wc3ZFbXczbjYrWkZvTE5FY1ljSGhj?=
 =?utf-8?B?OXdvcmxmWFhNdmxKZjg3OERydHJteDR3ZkJSVUxHMFVRcDRrQzRLMmwwSWJY?=
 =?utf-8?B?S2d1R0FQZXFLSVNNVHNqVnlnbVhEVHBqRDZwSTA3YlNZL1FWNWZKMUlTa2pC?=
 =?utf-8?B?TDRSMzdCVmZPOUZuL1lpRHBETEhVL0lYV3Z0VmdOQURyRnJ4RUsrTkc4ZzRV?=
 =?utf-8?B?ZmhMcUMyczUrdlI1bGRPU04xa0VleEswc0NPeFoyMS8vOVBBcGlrL2tKRkx6?=
 =?utf-8?B?dXg1bDRqK3pEUUpOWXJDL3JOZTFoR1dVTFJoS0E1VnVmZ0JPL0NHZVlPdmpk?=
 =?utf-8?B?aGtqMjBid3lmVllPOGtMd2xzUGtWRm5tRzRIWFIzS3NsRHZ6UEUyWUo3eU1L?=
 =?utf-8?B?L2hyVW1OWmFwNmhsbGNYbTFZYmhrQnQ1Z0g3NVlxcFMzVmpGWUU2OVkyS1lr?=
 =?utf-8?B?ckVNQXo0emNjekdoZVZUWW5EQ1JWMDY2ZkZ4aUt5RVFWbncrWnJScXRYeFNN?=
 =?utf-8?B?d09OWHYzbU9vaUVtNkhZMmpQM3lMSW95cGcvdU5DUEtDMDkyMm5jdWgzOS85?=
 =?utf-8?B?ZlBVUldVUlNjQmdUaWZ0TitqeXZvWUNvaWRuaUUzcUttNFRrUWRmd0FmcjdC?=
 =?utf-8?B?SWc0TDVZNWRoUG12Y0lOVFpOOVhZLzczK01LWXhqbGlEQU03SXhRWk9JeHcw?=
 =?utf-8?B?MVdWbHNtQVpZN0VwN2E3MFdFZzI0V0ZwR0c1YTFJSk53M2FLNC9KRmhvMUUw?=
 =?utf-8?B?SE9DOUlSVFE4S0UxSlpycmFSa1gxYzdtVE1lcEdOd2gzTGU1bWpyNnd2WjRM?=
 =?utf-8?B?R0pVZytIb2VuMm5OY0ViMUdld3BiL3VjT2hUd01KWVBXR2srVHo1ZG5LNHpS?=
 =?utf-8?B?Tzc2S0FqcEZXZ3NKOFZMVVFNeFRZeTlvZkYxQi9lR0gzZ0s3ZkNSeHNLaWNm?=
 =?utf-8?B?aWdxVTU1ZGhyWnNDVDBxSHhKRE16RmdTL3FSRHdMOGRQQUpOeElUQUVOMW40?=
 =?utf-8?B?ekozVG9OSnNSb3VDeWlIbFNkUVFJV2YzcGp0cjlBWlFtMlhFbkMyYVlkSTRS?=
 =?utf-8?B?WEdNS1lxVFlKc05wdnVGc1NZM3piMFVkeWJLcmNkNS9mVzNqZDdwSnJac2NJ?=
 =?utf-8?B?cXdYR1ppaVlNSVhsemZ1eU4yUW1wcm5idCtvZUJJUnRCNjNtRUk4OUxvYXQv?=
 =?utf-8?B?SjJBOUt2bVZHR0JKUGp2dEtBOUladjZQaTVRbXRuYWtyYmlBK252V2tEWHJo?=
 =?utf-8?B?YmZiQlhwbmo5bEx3cXhwaHR4djVoOGhEc3RkMG1FczRJellFZytQd0RTS1lh?=
 =?utf-8?B?Q3B5NjhQb01QUWFRNFFUM1hmMlRUclN0TXRhTGxtcEhpU0Vnc3RxM0Z5Wmt6?=
 =?utf-8?B?Nmp4TmVhNmJpMVM2bWxVSStRT0RXTHFWVEsrWmNXUlk3M2Ntd1dDd05BZVJQ?=
 =?utf-8?B?UnU5TEFIbjZjV1pmREFQU3pOWFVlQi9tRkFJMUd6NGxqMWc2TXJtM2dFU1dj?=
 =?utf-8?B?TWx4N0JsQVJ3WGZWQkx4alJIenVGRWl5ZFM1a1NFZEM5ZUl3NThuSlgwekF6?=
 =?utf-8?B?Tmp2Sk9IcVVIb0J6a2MxVHhqSWJNVGhLRHczS0VteUZ3dE52MTRQNGZkeW5D?=
 =?utf-8?B?amVTT0VDYlJmUEtjUzh5OGd4YWRzYy8xUEI0TjBxVWJzRzVKczRwTUJSa05m?=
 =?utf-8?B?aWRrd0NmVE1neE1ObFRucTZIMWhGT1JZY3graXNjOFBSU0JmWnQrSVgyaVRP?=
 =?utf-8?Q?pvThdLMdxK+EUAhcKGKajhi/jeBdQ8RLvMjXsv2GzuqnU?=
X-MS-Exchange-AntiSpam-MessageData-1: mZMRRRb3mOv1LA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85b6f03c-c43d-4ab1-10f2-08df3ffdc763
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7110.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 14:12:11.7204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H8Nj1ENaEqcaXCWIGpHk2058WpG/iZgrHSZzb4JiJ5c+ix2INVaKwnNeabFQCHASemCKrWA0tDDLKb/eSn331Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4343


On 04/11/2026 11:09, Sheetal wrote:
> Tegra268 reuses the Tegra264 ADMA register layout but has ten DMA
> channels, five request IDs, six pages and a different uniform FIFO size.
> Add its binding and SoC data, and derive the shared page configuration
> masks from these limits.
> 
> Make the Tegra264 FIFO size explicit first so Tegra268 can select its
> FIFO size without changing the existing devices' FIFO programming.
> 
> Anupama Kunkulagunta (2):
>   dt-bindings: dma: nvidia,tegra210-adma: Add Tegra268 support
>   dmaengine: tegra210-adma: Add Tegra268 support
> 
> Sheetal (1):
>   dmaengine: tegra210-adma: Make Tegra264 FIFO size explicit
> 
>  .../bindings/dma/nvidia,tegra210-adma.yaml    | 13 ++++
>  drivers/dma/tegra210-adma.c                   | 73 +++++++++++++++----
>  2 files changed, 73 insertions(+), 13 deletions(-)
> 


For the series ...

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

-- 
nvpublic

