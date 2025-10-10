Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013071.outbound.protection.outlook.com [40.93.196.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0721799F;
	Fri, 10 Oct 2025 14:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760107152; cv=fail; b=giYKOXs0BEtcMOMdbMslnF1zIb5uZQOjK3PgqhTfGHiBNJ11xDWYpNNELQmvsTVaPtfeGidIF+hAsFRiRCf3j5VDi17M8BETP40hUcHOzm+y9nTGqAEPSHjpxMKVctPEswwfnObcoXXBrpEumTiGNpX8f18g+QXmsGvWT7dsCOE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760107152; c=relaxed/simple;
	bh=PmCkEvfjy2z60NYxpniMcQO0TO56Mzpr70JhqDK12Oc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=j18xrlVpRTE2zoRARaWSinVLF0hiWWTm8a+Nae5r7AG8QTZXBI1w/Qt/pOZ0n8d2TOREodXxsomDwPG2k8mSGJZcILd+O6BkdRdeLMLGCi62O85NzScjanI3l+SwnnC0uo88kT4xpcgvA6ucbe0J1qA7f8kj7V27J9k6ExQyz6M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LkjxtHUN; arc=fail smtp.client-ip=40.93.196.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LkjxtHUN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RtBZYz3J69iA4xyYg/dZ+Zq7aW/Kpz3fWimylP6WVZPydTnMocDcP14RsR0ICqBH1He3ej/iL/LTecORphOH0FFqwBXXOhQLxmSKWboTLKGefQewJ0fP1zbYWwq2913ZmUlWiDOUbm/5mN1hwP9EPMqsNz5lxaiOcG3MTAfHdjQU9OEGKLj9rnzRMqKMHkGwpHmtM4cP1DXT6Xn+xRwAJvQCu9swGeZ265CwdZpQOFbSBE6uH9TPwoUIIpj0UkdR43xlPcgDOtQkHaM/1DFbsrwTMElZWc9zLWPlcHyN5az6QvC/i5JlqJQZeuE3zaj43LDQOwT4Lc/C6zQG7dUl2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OUMcQxpXlFHW6MHF5+cNF3KwGcEQPF01UUmXsjDWw9Y=;
 b=S6XeB10iLmyzG5lAom1zYOOa4hWbw0/szYRIz44RqEZg6DUH7PeS+cBMN8QmFDdzzFPNwHr3DaNr/bcmId9DueMRimud3Jld8ktV4YEs9GevMHJFpX1UoiAbbwwoE5VKD7VDz6thuhoct06/344icaEX4jgt7S1Qv4Womh5RTKLRUZdTX53tD9X4IFv7cHZkor4Udr6kMvhD1V35n3vMOI61seQ9R6WbCnJxuYp4E+4wgEHgf3MOlbsYipaOHiob72ZB8U8Rstktb9fywXQqpPXgPJXHkEzAfCKFvHL3XjsgPE/3osHMZy+nC8CO6Azb0ed2WsWbhiWnOsZwsX3NVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OUMcQxpXlFHW6MHF5+cNF3KwGcEQPF01UUmXsjDWw9Y=;
 b=LkjxtHUN2+2WiZ1RfAr6mVHpMYEJAlSdgcnNMa/LxoGj62EubZGV59ZJohpmUKQWwDrvj2kWBUrbysv5Vgx9uzMNBRlSiqt8TMhkU3Mrf+W7bBOrylh31CUcBC2i3AMApnxQBj52kvtmNahE8JHAQCXbbbQjb3gTBgbuqnWzRPDaByTD+B4sS7aZo3H2bSDxZy82eE+9+AnMgqbDy1f99pQE0xxxbQJuBmYlzhkUOO3JkdDRg1wiqFBQd4ulbU+Ix5PVoFRqCu4RecaNOn/H2G+NqGJLmBaihABoKiBCuPXEca+ajKqXCN2pQ03JKvHcBL1wAz1QEdcqnas7ix9JHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by SJ5PPFDF5E260D0.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::9a6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Fri, 10 Oct
 2025 14:39:04 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9182.017; Fri, 10 Oct 2025
 14:39:04 +0000
Message-ID: <c7bb79c1-c760-4b44-97c3-86e1c34fff40@nvidia.com>
Date: Fri, 10 Oct 2025 15:38:59 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: IRQ thread timeouts and affinity
To: Marc Zyngier <maz@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <j7ikmaazu6hjzsagqqk4o4nnxl5wupsmpcaruoyytsn2ogolyx@mtmhqrkm4gbv>
 <86qzvcxi3j.wl-maz@kernel.org>
 <loeliplxuvek4nh4plt4hup3ibqorpiv4eljiiwltgmyqa4nki@xpzymugslcvf>
 <86o6qgxayt.wl-maz@kernel.org> <86ms60x7w7.wl-maz@kernel.org>
 <us2hfdn7jpfepdmwk2p62w64p7xagaeoemg3hdt2vm54emtwlv@m6fkuti7hvfa>
 <86bjmeyh5m.wl-maz@kernel.org>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <86bjmeyh5m.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0311.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::35) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|SJ5PPFDF5E260D0:EE_
X-MS-Office365-Filtering-Correlation-Id: a7d67de1-e6c3-4b7a-b381-08de080ac2bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Qk9sZGZMaFN3ZVduUis5N2JobnV6MEFnYllEclRucGFDajNYQkNqSUtrVWJi?=
 =?utf-8?B?LzA4TWljU0hYVFRMTTR1MlRPQnh1NWZOcEZTOVJ2d05HMTZsTFIrLzlRQkt1?=
 =?utf-8?B?R3FDbjY1eU1nUW04STd6OW1oOFMwMStVajB2QnJnSHBFMnJZTitLTDA0RW1z?=
 =?utf-8?B?T1REaERJak5oTnY5R3AwRHZWbEhpZTF5bHlBYXNKOEIyeitoQnhpUU1sQ0g1?=
 =?utf-8?B?bC9FWko1d05QQVhOcXdsMVU1bDdjTnpDUnIxb2JqbnozamJXNHFDWVhtZWtl?=
 =?utf-8?B?cXdxdmRvU2J5OE9kLy9QWkl6ODBTa1NtdGVoakd3dTNWaStRM2d3ajZEemRT?=
 =?utf-8?B?bWN2cmhQcU5XdzdhbVAvTit1ZFNPYytxMEpzSnBtdGJIOENpQjJ4U1RVQVk2?=
 =?utf-8?B?bXRKQWgxbElOcXdmclhSSFZNNmxOS25mbVRkZExyZVN0UXpuTVlFYzI1Mloy?=
 =?utf-8?B?OGJPdjFvVW94VU5rKzErY1F0YmY2QUtsT3daeTZwQUdHN2hsYUFlTys2VFYw?=
 =?utf-8?B?dnZCUUFXSVpjeUhRUk1kWFZ4azIzR3I0Ni9JUnl2SWZsclp3NjhFNXU2dnlq?=
 =?utf-8?B?WE5rejVGcGlOeVV4REVmRHdpWlBEaStsMUFOcDVzeFNHQk84ODdDNHJ3Tk1F?=
 =?utf-8?B?cjNyUnZCVTljNG95ZGtvdUNhM1FBeVNVMnMyQkZEUGJJMmNOOWM4em01cDlM?=
 =?utf-8?B?b3kyS28zRzl5N09JWEV1ZjBzZXdEVGZmeVNLRThSSmVqVW5LZU9HaEdIdVlD?=
 =?utf-8?B?d1pKUlExTG9SMUFiNThMQmlaN3lqdmU4ZDFubHkwbHR5bHFOd0RtSlZMTFcv?=
 =?utf-8?B?QWh2UVRrWUdpbjNEQTU3SFRjMEUwT3pnN05LR0s1Ujd5TmdYdlA3SUk2L1c0?=
 =?utf-8?B?MzBEMW90ZmdzZEpnL3o0THptNE9ibTJUSmVGZWdUM3Zxc1JFK2FlY0V1aVI1?=
 =?utf-8?B?VmdmVHFwR3Y1T1lZY0I3aUlMNEI2KzlWMTh6SmRadGNLeGs3ajFhUlNJV0py?=
 =?utf-8?B?bU9OVVhCcklsWm50Vk56T0lESWdic3VoSGFsUEpkR1VocEJaNHc3U01IYXFV?=
 =?utf-8?B?NFZKVGZuYzJnVEJVa0c2Q2FWQzBJZkJIVG5ZdmorbEgxeU5QS2cyM1FVTFZ3?=
 =?utf-8?B?WTE1akxxeUZrUzFYaXdJN3VoVFROQmRWZXZzT25xYWpwbGkrSk9XMGVEaHVP?=
 =?utf-8?B?em00SVRNd0tRY2FwRCtQbkRUWkNXckgzOHdSVFlvNmUyWVdFajh3d2ozbnp2?=
 =?utf-8?B?OGR5c2VJanRRMGRwMDFjaVRxUFpzTFVOcVJLdkZTdmtzR0MyL1p1Y2hGMzho?=
 =?utf-8?B?ODhsM0R6ME9HektJKzdJTDVKMThGSXZXUEhiNWg3U1NLMGdZa3RQR3VmU0Q5?=
 =?utf-8?B?d2hTbXAyRkNDUjI0WUx4c1ppUHlvNDN4TW1nYXNLai82UTFYUk5NYUxtT29X?=
 =?utf-8?B?amZhWnZoaHU3S2ZyV2FyVVkvQXZCNUJsYStqblRYcy9nRnN3Njc5TnpYbGl6?=
 =?utf-8?B?aEZZeklRRzU3dmtDa0dCMXhqdGxnaldlWjhSRjA5QXRxYisrN0tBMHJhMUx2?=
 =?utf-8?B?OTcwQXNudTYxcmRkRkQ4anJUYXRlUkM4QWpuTGdBd1l0L05OTEt1Y1FCZGNZ?=
 =?utf-8?B?M3V0WkpuRlovUWxMNlVDNlg2Mm45VUc2UVJqVThpR1IzN201Mm00b0ZwMlZv?=
 =?utf-8?B?VlgreWFySi9OWnUyZE5URGhZTzFDNllCejUzcUNsaDJ4eExXRncvelVhWGpG?=
 =?utf-8?B?UERmVys2cDJBVkRGMUJpSVpZSEtHRE41NEZQMWw1Y3h5RmYramhpWnE5cUlT?=
 =?utf-8?B?Y3dVWUo0N0grSk1GWUdoVWMrV3JFMDBqMFpoczY5ekh3Y3ZQdXdQZmhST1JO?=
 =?utf-8?B?UG4zd2xiQ2RRZ0xwWGRRdCtCczI1ejZSZHBzWlFaUEVra0k2MkJlM3hJc0dB?=
 =?utf-8?Q?na4ip/oewl3OggvBPrPi3KaXns1RtlZT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUZBdkxJY0pnMG1sQjdEa0V6Y2N4OU11aHFwbFFSMkk1czBZTEFPT0tCMFp1?=
 =?utf-8?B?SVFYNDM4Q1I2UTRCMktCRldNMWpHVzdzeGVRc0Y0Wm05NG9SVzIzdHJVSnVV?=
 =?utf-8?B?L29wZ3lhaUY3TERGRURRSlBqOWkreGdWL2VVY2VDUnpWUFc4cVdWTy9WZkJB?=
 =?utf-8?B?Ym4yaGVHbzFHaVlTSW1JL2FRSXRudzdRVk9ZcTgvbW96cjFKU0lWR1BCK0tN?=
 =?utf-8?B?Mk01V0R4c0E5UzF1cFRBdXBBZE5yUEtEUG05eHpUTm56QU9LS1hBN2R6VTg3?=
 =?utf-8?B?ZkY4L2xUMmhZWFVaajVnckhyN0tiR1NyRkx6dDBLWEtsam9EekY2dkJFeHAv?=
 =?utf-8?B?ckVGVUtMWEV6SUpncXE2V3NJZUJRZUl1aHphUTE2MS9tSUVRODFtU0E3bUdS?=
 =?utf-8?B?UWlRMjZjSWYxa090dms1Q3ozUnNYbTdRSjI1Y1B3TDNoNG0wTlBGWE94SkZG?=
 =?utf-8?B?S1ZzTTFFb1I1Tjc2MERuNjV0RENMb1FPWFlkZ2dqWXN5MTc1MllhUDBtK3d1?=
 =?utf-8?B?ZXZoRkR5SUhhcTViNVhaY3BjaldkZk8vNmxGZ1V3akVsQzdWRGJoL2tDdGxN?=
 =?utf-8?B?UXUzQS9lZEFIQnRKZVV1Mi9STWlBVDZBbG1hckV1VFRIK2dadzdzdkFkR3hZ?=
 =?utf-8?B?TWJPWU83WmtaS2k3eUlkTjllS1JYT3ZoeThDMFVBMk02dlJ0RHFQWS9HZXVE?=
 =?utf-8?B?MGxvdFlVck95UWNITjhKU2FyNFFSbFNGdW1yZ3lycGxmclJmWjdWbUNZWHpa?=
 =?utf-8?B?bUdScVc3YW1ZeGZnbFhCTllxbG9rNExzcEFhaW92d0thdUd0R2x1SVg3SWx3?=
 =?utf-8?B?ZDhhYXU1V3RlN0JTZm9qM2VMbG9xMmNGZmNKZnJJeC9PUUFOMHZvd2ptNnhx?=
 =?utf-8?B?RDB4VVlNeU9MTE9Jb3FnL3hWUTlYd0xMb1FxWFROT0h6Zm1NUmFITEJ5YWJT?=
 =?utf-8?B?ZVdxVDlvK0w4Ui9zNENqSWJhZUhEZFVaQ1Yyc3QxU1hXR0dubFd6QjdLR0Js?=
 =?utf-8?B?bU91T2Jxc3hNN3hBT2o4N1Z4cFNpMG1iNHoxalQ3TjVxQkV3MmtSaEs5Y0dt?=
 =?utf-8?B?MGF5RnI5d1RKNlo2M0xod2VBYTlmM0puNTljRGNZdFZRMDJ1T3F0SFhQM25X?=
 =?utf-8?B?cVRVSXdpRUZYK1I0OFlqWTB5K1E2d0g2WER4aGJ1WVpJbDhlTUFDbS9WUjJz?=
 =?utf-8?B?Vm1XQUJzZTIvTWpBeXB1Rnh4OUJ5akNpSG5Ja0s0WXlUeWxKbWdQV0poZDZp?=
 =?utf-8?B?VXFMcjRLTkJHdEJlajlPWTUzSFpKd3hXVGNpZWE0OWdFTVRHMm5oVUZ2TG93?=
 =?utf-8?B?d0tLVWdBYkt4VlorM1laQmRDVVZiNFAwRkh5aHNqZ3NTRXBYeGQ3MHFmVThV?=
 =?utf-8?B?QzQvQ3FTM3JVeng0bTV2SVEyZDB2eElwUEE2VXFFcElidURUNWtTd2xmUEcr?=
 =?utf-8?B?QUVKb0FNUkdoc3pXM0U2VDFrL01kSTdleC90YW41cnFRb2F5Tk1qNjZSQWR5?=
 =?utf-8?B?dk5IeGk5V1F6YWw2eDdTOUNxc2VNakg5WmluaHJDajJzU2VjZCtRMDZraXdW?=
 =?utf-8?B?MzNJMzh0QnhCTzZQcndJcjZvVEhIRnNBMVVnMjRFUEp1UVlLZEZCSFYvQ1NX?=
 =?utf-8?B?UElyZjZFQ1o1NTM0emxlL25kTmg1Nzk0STVrUGx0blJwanBPc210SjZZVWxD?=
 =?utf-8?B?TFBHcW1tZVU4aldLTEpSbExkRUd6eFQxbzRFYTZEV05pZnFXRWtiMThFNStL?=
 =?utf-8?B?ejR0TEh6c2dlLytMK2Zzc3hST3o5VTMrbkhoQlM0QnRPZDNwQTVhaFNXSkMz?=
 =?utf-8?B?d2RPQ1lOdWwxRHZXNVVUaDJVQUltbFAxczlsaFpuWENFRDhydmNFOEdXM1U5?=
 =?utf-8?B?ZXJkNVBpSXZmY2FDQnhGOUROcGZyYTNOd281MzJITDhDd0RsaDRSSXVIL2RL?=
 =?utf-8?B?U05VbFB3K2RUZzc1aFp3QjVLd20rUG14TmxKYURFL282VGJMR0d0M2lQR21n?=
 =?utf-8?B?Zm1tRzRMUTc5QzBLTVpsZE5HNk9qQ2MrT3MraHFNQkM3c3JGY0ZuL2xwR3l3?=
 =?utf-8?B?d2hLVW5Lcmp4WUFuNVpQQ1lkZ3J1cEFvY0cvQnJEK25qMTUwWFRxUSt5Zmcy?=
 =?utf-8?Q?v5VDjuuPb3yle7q+F8UihB9Qf?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7d67de1-e6c3-4b7a-b381-08de080ac2bb
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 14:39:04.5795
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ljUl7q3xunuX0EncvSChr9y9WTILOPPEbKM8o72bxhm31LpEA1GUuXVkDHpEjtI/vMDgnuJ9ceOk7P+UXtzh2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFDF5E260D0


On 10/10/2025 15:18, Marc Zyngier wrote:

...

> CPU hotplug is the main area of concern, and I'm pretty sure it breaks
> this distribution mechanism (or the other way around). Another thing
> is that if firmware isn't aware that 1:N interrupts can (or should)
> wake-up a CPU from sleep, bad things will happen. Given that nobody
> uses 1:N, you can bet that any bit of privileged SW (TF-A,
> hypervisors) is likely to be buggy (I've already spotted bugs in KVM
> around this).

Thierry, do we ever hotplug CPUs on this device? If not, I am wondering 
if something like this, for now, could only be enabled for devices that 
don't hotplug CPUs. Maybe tied to the kernel config (ie. 
CONFIG_HOTPLUG_CPU)? Just a thought ...

Jon

-- 
nvpublic

