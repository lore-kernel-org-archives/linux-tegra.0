Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013054.outbound.protection.outlook.com [40.93.196.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D8235294E;
	Thu, 22 Jan 2026 10:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769077383; cv=fail; b=nEl0ASUOkSNW4z70gFC7/CSUAWus+klM5LKYcqFfmN82PM/0ohj7GtoAlBNohHV1778gDdN9VuchWu6DWQXqKsVguWHynaamMWP9zNJm+MXMLPuf3LBcdcWzC9jnG4nYqR2KF/OkgGvYbD/vVkZWdNW3UTmNDsHMUPD2geSSgaE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769077383; c=relaxed/simple;
	bh=nlABbVOqBEsck07AvVfthbCuPoKxSEkwLkFAFOxTazE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Mu6wcRHLZqJWeDrfcLKbtdr3cvnTaF2HAB9Mxr6RZkQvRMQIpoRlTiCXYFki19TGeu/X7KKopJsropntcXW1vrAR91VoXski6tDYomLb6UBevrZvYdUiWwMsJQqFzCJd1PNQC03A/54rFo+3hzK873oLFEXbEvINBMwBTxIcJSs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AgjKZNEx; arc=fail smtp.client-ip=40.93.196.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AgjKZNEx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nz81bIw1oydJ4I5/P46nAmQW8PH3ZOh6viYL+XaTWPijVZeeFN30Srq8ftiChv9gsesBdAeQ6BD3Ml0mYlomFycVQWb8kdAy63z4sfUPDhVq/d9gOrFQ7Awq/pBc7J3sIZJLxvkWLLg6MYMWmTbuW4of6RBkg62surK8SXlHEYQ8AyzOdAwNJP3iUGbYwXrOTvdBvqNLQo8AYh/47vJiL3Wr3g922JYy3wjbD2mrUCPOtOrnNbLvcfEPOQ5oeE40a0nG4xVh4ujrDnbB/AFCOO13woMrMIDejIuMR4E68ocftoWAVLNPR8jegGsd6drHqYAWhSaIkY1jiublDq5kXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0AW0xD1kLcvaNsd0pAJ32W2YZT7oHylwOJVYCqVZuz4=;
 b=SUlgYMNCBZnjswWxLXXGyPDYvq6hZKRqtXbx9ZvrktN97vGJ8w5TkC00n4taycsJDs6+HorDacly/ojNJPFYmEeWUxls56MSJMG78IWwa4nQ6ioG7LXsdHTSZ54cftMhVuzD3gxqAsr09ClVscVR1/LaoTMMJoZ3STeH/dL+DB/KSaxvYi7/EQhmNwPldBSgMS+oqPG6XIYc5NnaxbzZkSANzQkBxcAE/4pBkuxtZXdsYE3Q/fiDaKS3PHe5n5zEAlfkM+MI9MUFQSCMZcDyytnnR2FftK1a2nAMbtkLIbmT0rpz+ph8OCG7sP4zQUYEsW++151KBj6fEZTdxpGtdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0AW0xD1kLcvaNsd0pAJ32W2YZT7oHylwOJVYCqVZuz4=;
 b=AgjKZNExG/5bmNPwt3Is4xvPrL7PtOw8NCENTnUDv/PLb5DCj3BKwKoQXJYTepoLKcRmmeu73/jdqiNbNF0qmp3Gcnx2lqsutjp0ZTrHtLozESNoLVc95ybgzAolNFrawYpPFSiEtcGo6k/Xj4Q1vqGYomHkEsPcgm0dTBF6wZp48RMsvmgQCsUsU4HP7Fl6o5WwbAXlgG1KNuKSCUX+LeCXtbTLBcBTM44nCjsEJagifAdI672MtG9wa1XWuta7vCzF2KDzKXIFREQNM3UBu5G4HhgZ6VDIpuTL7OOXboW2J1svzJKtbndBwqRIUYPgOXlxW2udPrpEtGDZiwwEiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by BN7PPFFF39339DD.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6eb) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 10:22:57 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::1f16:244a:2a9d:2c93]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::1f16:244a:2a9d:2c93%3]) with mapi id 15.20.9499.002; Thu, 22 Jan 2026
 10:22:57 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Aaron Kling <webgeek1234@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] Revert "arm64: tegra: Disable ISO SMMU for Tegra194"
Date: Thu, 22 Jan 2026 19:22:51 +0900
Message-ID: <5289895.R56niFO833@senjougahara>
In-Reply-To:
 <CALHNRZ-YQe7_7UGfFNsBe6pdvFjK+1sS0Sye7od6WF+yqAYttQ@mail.gmail.com>
References:
 <20251101-tegra194-dc-mmu-v1-0-8401c45d8f13@gmail.com>
 <CALHNRZ-rArVkbEaiEVwMevfbu0dgX5P-ooVYTd-3RHvrhOJ5vQ@mail.gmail.com>
 <CALHNRZ-YQe7_7UGfFNsBe6pdvFjK+1sS0Sye7od6WF+yqAYttQ@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCPR01CA0147.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::12) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|BN7PPFFF39339DD:EE_
X-MS-Office365-Filtering-Correlation-Id: 166b79d0-63f6-40de-91a7-08de59a03617
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WFQya3hVNnJHOFNUVDdtTHNUeWg2azBQcSs2Q2R1eXlIM1NtMGVhbzdDWGk5?=
 =?utf-8?B?NE5TaXllalVreExjL1EvZ3Mzck9zb0xYdlJldTVJN0FBYzVqYnBwMm15ZXlQ?=
 =?utf-8?B?YmxCeTFBV3JodU1JQWpRazRIdVQxSGFFMGF2L1lIdHJzWHFiaHBPcmFiaisz?=
 =?utf-8?B?cjIxbkE2STJXUk4vdlk2T2tVRGVVSXhoaFFtamoycVFPNTlESDBXWkdCSWZI?=
 =?utf-8?B?U2xHT0NTWVJ0cTJadUg5eHROdlJxbVJSdzd6S3pZcW80NjVsZ2ZHVFlZNHBy?=
 =?utf-8?B?cGJMbDY1eFZYZkZOWWhDVW4vMGtuU2pTTFVJdzFFWjZJY00wWDBmdThEZkU5?=
 =?utf-8?B?WmVpYmJqL0piQWp3TU50ZEFyREI5eXhLNkFGQ2w3UXMyV2UvYy9hV2hZQXph?=
 =?utf-8?B?OVNCa3ZDQk1sRHo0dmcyZUFEMi9xcTZIN0czMmVRRjBaMGFLalpYTWhNeHc0?=
 =?utf-8?B?UTVzeFJuSVFzOXhvNVFiOWN6bjE0SFpqV1Q0bnl4Q04rcGFyczhOeFordCtO?=
 =?utf-8?B?SnZrdWlDWk4veTJIOHNJMHIrUitWSGtpWFpRVVplbFh3N1FaWm9xeTV6QmJj?=
 =?utf-8?B?R2w3Ty8wNnc5UTRyZnZPZjFJczFkSG9BVHBlTk4xUGFtazBwcGpPSEdkd21O?=
 =?utf-8?B?eXZlR0Z4b2ZMSFY1ZzNyVkh3bGlVeXM3cVNtbkx5aGZZOGh3UzZoMHJ2L3RD?=
 =?utf-8?B?R0E1ZlIwY3BDN3ZQYUhwaGxRQ2M3LytxSGoxaGNxMzNXeTNCTG9tY3h6K1lk?=
 =?utf-8?B?RmE4aE1WRU5od1BGSmtSRDEyenpjMUFxRFExSkdjVUlaVzFvd3h0SThvbFBU?=
 =?utf-8?B?WDhsMmg2T2lDcnR0YlFIaVo5R3o3RDJMVGNiblNsbUtHeDhNWWRYbzZrNFNt?=
 =?utf-8?B?Q2NiZ1M3clJhM0dQL2JvTHlKbGJCd2tuZTlLcCtmcjFDMEJMdDNGNThSTGc0?=
 =?utf-8?B?bjZ2MUJRVHZiZnB2VjluYmZWUTByVzVMTEk4RXpzcHlCV2xEeUc3dkVhSTEw?=
 =?utf-8?B?VUgwZ3NXamtIcmNMb05sMVU5cEo4dHhjTC9IWDg5N256SURkM1RGYXpoRlBF?=
 =?utf-8?B?NndVU1pVVnI2RHpTU0ZDbjNxUW4rRXFFclBOMjhON1JnQ1I2TTY4OG43N053?=
 =?utf-8?B?eTByUnQvbzMxeVBuVktYNzh1VHBrM0pYTVpPZEF2dDZuTWxKZWttekZLem16?=
 =?utf-8?B?Q3pqSDUzeUFJeVpYVllQa2NEcndneC9GZEUzZjFoTjUyZHlvUnhLSk9lcHI3?=
 =?utf-8?B?aXpHQnBzS0dSU0hIOE1YdG9OSzhoMExZdm1LeWNaN0J4aHpZL0JvWHk0Tnhj?=
 =?utf-8?B?Vzl0MFI2WUtRczhJSkJ1OSswYUdzTVVVT0JXR3JneGRNeGZuTWI4a2E2b2J6?=
 =?utf-8?B?QVZYclRtOEhhUzNaY0taaXVpOXVtWHRnY0h4Q0lScmdIY2QwTmkySE5CVWVk?=
 =?utf-8?B?TThmcUliNnByRCswWkxiUHkwY0NtWm84aW9hMDd6cmJXblg2RS9hT1Vnd0NL?=
 =?utf-8?B?S1ZvSXF6MTdHR3FNR1VtUWNRY1ZaQllsVTBFcndIQnlsN0p4MFpHWEEwblRQ?=
 =?utf-8?B?ZTg0bThtRi9BVWozU05QNGZ1TXkwUkxhV1NmWEVHOVhYMlovekl6Vi95U3dj?=
 =?utf-8?B?UGFQS3ZZQm9aOUJjUGxhcTFRTlM3Z0tsZTI5U1AxVWRoVCsvUDdEUHhXMXhT?=
 =?utf-8?B?RytISWs5RzZoaFRaTzVBOHJyMDgvR1paVERraGozVWs3REJpZEVsR0VZRVZY?=
 =?utf-8?B?U1ljMkd6MXF6OUVLYnFjcC9GRjd1S1ZOd3Z6TUszQlExd2huMWV3bW1iSjAv?=
 =?utf-8?B?UlJsa3p0Tk5Zc2FUNGIrV1VJODI1RlpBNzBPYjFDSVZVMU9kY2p3THVrNy9Z?=
 =?utf-8?B?TDR2VHRKVUVKbjRwcFF6YmJEbENJdUJ1RklQdFNSMUxyR2x0eHFhTHcrZThR?=
 =?utf-8?B?aVEwK3BPUk5OSUJhL2V5L3NsS1F5TlVTaEZCT20yQ1lzL2pGTmNUN0VXcDNo?=
 =?utf-8?B?Yi9KZnN2eHJOSi80d0NpZ1dtcW5xUGxkdmFvY3psNE11WjVwaXpjTzc2Z0J4?=
 =?utf-8?B?ZG1FTUNPZkRDU0JtVjZzNncvWCtkY0lTcHpVbGUvNWUrd1Z3aDA2M1VhSXdl?=
 =?utf-8?Q?kto8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFRUQSsyMktqaXpBeGpWelY3K1d2YXN3RS9EeG9YblpDdTZWVTZDVmhDMTdM?=
 =?utf-8?B?RVNYNmIzaEpKVTdoOTlKMVhKaDFOZ3dBU0ppQ2VMR2tPSkJCVjJRR05SNG5t?=
 =?utf-8?B?RUd1YmRWZkFhNWFUakZSdmpudERNWG1YeWxLbndxS1c3dTlQeTIzSmZTUmI0?=
 =?utf-8?B?QkludStrZDVRWGV4RjdCVGQ0bTQ4NDR0RlFaNjVrZitwRlhOZ0xmdk5HZXd2?=
 =?utf-8?B?S3JKcUpVVW1ZbjBKMGFkVVpnZE5BT0ZwU3Q3VXhWeFhHZFBzVmRtYXYvYjBY?=
 =?utf-8?B?WDlYWHFaSmFKL1VkYmhJQTdwdElqaWt1ZjliSnNXZVB5RWxZMFdQYzErQzdE?=
 =?utf-8?B?K0hDSklieVozVC9XWWg4WHNhZkhGRmlmZ2h6R3JVOFpBV0FKNWExNUc1ZnpB?=
 =?utf-8?B?MzlmRmtqYzgzbGlOSUhiOW5JSWR5SCsvTDZjQVpaK0Y0MFUvcElQYldPb1FU?=
 =?utf-8?B?ckZWT0x6YzlTaDVjYjRNbUwrb09xZEczR00wNzY2T3BNOWR3aVBpdHhjMWsv?=
 =?utf-8?B?UUpHUUkvVDZvQ3haVmlUTEdBTWlDUGpycU5sTVY3dVl3aXZ6a2g0SmVYYXVS?=
 =?utf-8?B?TlZjTkJ0ZlNxcWM5QVJIYmpGajlGcmkxYmdqWkltdHgvcmlpcnFOcEVja2Vs?=
 =?utf-8?B?S09zL0p1c0V3T2cwbDloZldoQjVtOFQyQ1A1d2toNTJSRVdPeXZlK3l3dWo5?=
 =?utf-8?B?dFNYRHVSYlpWNDhNa01JTmxFdkdmM0tkWEIzdzBONzg2aDNLUmlkS1J5UC85?=
 =?utf-8?B?Z3NYL25WUkJuU296dFN6MkU4M0FPWCt1QUxDUllOQk9oYjlQdTNlVWdjRlpa?=
 =?utf-8?B?eXRDdk8rT01TZUtJSm1uT01vR2hVWnBMdmszejlIN1B4VHV1dVhoR1huZjgy?=
 =?utf-8?B?WUgyTzFuSFFnMDFCejJCdVR4aVEwT3piOHhkazlaYkNRTWxwMkZMYUpIMjNC?=
 =?utf-8?B?VnBLenIwSStKTlFodzZjRmN6VFZQRUI5SEp0czBENCtha0lXRHpqTCtoRjRp?=
 =?utf-8?B?SmFHMmVTK1YzM3cwbi9obW02ZkcyTzZMU2xLK3U4ZWJPdXgzdnh0SUdSMVc3?=
 =?utf-8?B?MkpVOUQ1dHoxejFDWjJRd0N5N0lPMjZ5dksvSXBMRG5VOENzWHlzQ2JhejBV?=
 =?utf-8?B?d2J2aE93ZkRnQm13SHZFY2RsNnJOak9UK2taM29uWVJzYzUvaElDY09HV3FT?=
 =?utf-8?B?ZSt1c2RpUDFuMkU0MndGL1JIUnNRTjhQRGNaeXZKMWJKc3Y2R0hKeVY0QmFx?=
 =?utf-8?B?T3BHSFdNMm1jS0dNaS82OG9pSlNyVVh4NzRUalBUOENJdVNFWmt1U2xyR3Jk?=
 =?utf-8?B?TTRTMWZzdzNFSk01TXh0N05uRXN5VGY0S0wxOFhnd05BM3JmTk9PVCtnMmYx?=
 =?utf-8?B?aHZxKzVZRkNxd1VuMzY4c3U0VzRMZUQ3WXN1bTRvT0RIMjVjUzRpZEpkelRz?=
 =?utf-8?B?YllldUloOXFVVGtiVkJabUxGRzNMTUM4cEozTVd5c0NnZjljR3lwT29LNHBL?=
 =?utf-8?B?bXFpTXdzM2J0dVJoQ1UxT3dpSDk1SW4xUjFJNnEyby9uU2lmWUV3Qld2WjNO?=
 =?utf-8?B?eE1TRzNLaW5nVktZWHZEQVB2YTJPYmdidFpDVUhqZTA1Wm50ZVJlYkc5aWIz?=
 =?utf-8?B?N0svbllwRjZqWEQzc09xU2lrM2ViR2E5RFcwSHlUWldlN1hLU0JIR0VTL2xG?=
 =?utf-8?B?dkw4UUlWWHlIT0NHWjViZXE4YjJ2bENlRjNyZU13TU9NbHJSOG51QnF2UXhy?=
 =?utf-8?B?TjFTYzhRVEh1ejE0NVhxMk02TWcxekIzOXhNRStUNldXWDliMTRtbVVrWE9L?=
 =?utf-8?B?czlRV1F0ZFBSVFNTbUJjRWR1dzExdGQzcVZ1VGsxVVdQNm9iVW1xRnp6WnRm?=
 =?utf-8?B?eWFMQ2N3RmVCcVhaaEZWaUVnZVI1KzFmN1lPa3pwYm9mUHE0S0ZabHNWZFEy?=
 =?utf-8?B?cmRBaDBKUXJ5Z0hxbEpnMmJ6OGJjMkxnSExXOUl5Wjg3VUxkQTRrK0NYS2xh?=
 =?utf-8?B?NU1MQXhWVkI4Q1NUTlRLL3QxbmZMUWlOMHRrZFcrS0tiQzBDc2RnVTVQWEdS?=
 =?utf-8?B?Qk41M3d4RHJrbUJhd04yNFNKUU8rbEZ1YlNHZlJUSHJ1dHIrSHF6OWVQQk9y?=
 =?utf-8?B?NU0zL0JRS1lVRnY2SUlZUVlBYW1VeFR0K1BKMTl2c1EyYmMxYmdEUi95M3FD?=
 =?utf-8?B?MmNrNjZpbWhMNFI1M3VrdkdCUnExY1lCOTRKTGx6Y1ZweWgvT28zVFhkTnR4?=
 =?utf-8?B?MGg4M09yVWkrVURqKy9UOVNzWVdwZDhrb2wzVEdxck1oSjd1SjVtT2s2VVBN?=
 =?utf-8?B?dHUxSnFoQ3cycElmZTArUVJVZ01SalNQbDNBNVdKdXJPUjB1OG9QM3JvaWJX?=
 =?utf-8?Q?z7fU2WFLGiwF/U9Z+T4RtwdDNgpqvlAyskisOyoe2nUzF?=
X-MS-Exchange-AntiSpam-MessageData-1: VTyVIOEx0Z4G7Q==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 166b79d0-63f6-40de-91a7-08de59a03617
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 10:22:57.3531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dsuf01Uc3ebKyc/r5np73XiEfZQ3v5Z5wChhoV4VFf+tP/I9jK/aOGo7ax5GwGeWx3/Q3TXhij1raagAVaazUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFFF39339DD

On Tuesday, December 9, 2025 1:21=E2=80=AFPM Aaron Kling wrote:
> On Mon, Nov 3, 2025 at 12:05=E2=80=AFPM Aaron Kling <webgeek1234@gmail.co=
m> wrote:
> >
> > On Mon, Nov 3, 2025 at 5:07=E2=80=AFAM Thierry Reding <thierry.reding@g=
mail.com> wrote:
> > >
> > > On Sat, Nov 01, 2025 at 06:13:26PM -0500, Aaron Kling wrote:
> > > > On Sat, Nov 1, 2025 at 6:01=E2=80=AFPM Aaron Kling via B4 Relay
> > > > <devnull+webgeek1234.gmail.com@kernel.org> wrote:
> > > > >
> > > > > From: Aaron Kling <webgeek1234@gmail.com>
> > > > >
> > > > > This reverts commit ebea268ea583ba4970df425dfef8c8e21d0a4e12.
> > > > >
> > > > > Mmu is now being enabled for the display controllers.
> > > > >
> > > > > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > > > > ---
> > > > >  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm6=
4/boot/dts/nvidia/tegra194.dtsi
> > > > > index 1399342f23e1c4f73b278adc66dfb948fc30d326..854ed6d46aa1d8eed=
cdfbae1fdde1374adf40337 100644
> > > > > --- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> > > > > +++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> > > > > @@ -1807,7 +1807,7 @@ iommu@10000000 {
> > > > >                         #iommu-cells =3D <1>;
> > > > >
> > > > >                         nvidia,memory-controller =3D <&mc>;
> > > > > -                       status =3D "disabled";
> > > > > +                       status =3D "okay";
> > > > >                 };
> > > > >
> > > > >                 smmu: iommu@12000000 {
> > > > >
> > > > > --
> > > > > 2.51.0
> > > > >
> > > > >
> > > >
> > > > Question for Jon as the author of the commit being reverted. The
> > > > commit message states "we do not have a way to pass frame-buffer
> > > > memory from the bootloader to the kernel". If I understand this
> > > > correctly, this is talking about seamless handoff. What does this h=
ave
> > > > to do with enabling mmu on the display controllers? Seamless does n=
ot
> > > > work on any tegra arch as far as I'm aware, but Tegra194 is the onl=
y
> > > > one that doesn't have mmu enabled for the dc's. But enabling mmu
> > > > allows for better and faster memory allocation. My initial attempts=
 to
> > > > enable this didn't work because I tried to attach them to the main =
mmu
> > > > unit, see the related freedesktop issue [0]. After noticing in the
> > > > downstream dt that the dc's are on a separate unit, I made it work.
> > > > And so far, it seems to work just as well as Tegra186. Then when I =
was
> > > > packaging up the change to submit, I found that this had been
> > > > explicitly disabled. But I'm not seeing why. Am I missing some
> > > > additional factors?
> > >
> > > This isn't seamless handoff to the Tegra DRM driver for display, but
> > > rather to simple-framebuffer. While this does technically work, it al=
so
> > > causes a spew of SMMU faults during early boot because the firmware d=
oes
> > > not properly pass the SMMU mapping information to the kernel.
> > >
> > > In a nutshell what happens is that the firmware sets up the display
> > > controller to scan out from a reserved memory region, but it does so
> > > without involving the SMMU, so it uses physical addresses directly. W=
hen
> > > the kernel boots and the SMMU is enabled the continued accesses from
> > > display hardware cause SMMU faults (because there is no mapping for t=
he
> > > framebuffer addresses).
> > >
> > > That said, we did solve these issues and this may not be happening
> > > anymore with the most recent L4T releases, so it may be okay to rever=
t
> > > this now. We should find out exactly which release includes all the
> > > needed changes so that it can be referenced in the commit message. I
> > > want to avoid people running new kernels with an old L4T release and
> > > then seeing these errors without any reference as to why that might
> > > suddenly happen.
> >
> > For reference, I have rolled back my Android usecase to use the L4T
> > r32.7.6 bootloaders on T194 for a variety of reasons. So I am using
> > cboot as the final bootloader and not edk2 as in L4T r34/r35. I have a
> > pending cboot patch to support simple-framebuffer handoff, but haven't
> > fully verified it as tegra-drm is currently unable to takeover from
> > simplefb like openrm does for t234. But all that to say that since I
> > no longer use r35 for t194 I don't have the setup to easily verify
> > which point release works here and what doesn't.
>=20
> Any further thoughts on this patch?
>=20
> Aaron

FWIW,

looks like the edk2 patch to update iommu-addresses --

commit 6071946461389221d2314cbbae0377610b5b1f6a
Author: Jan Bobek <jbobek@nvidia.com>
Date:   Tue Mar 21 00:15:27 2023 +0000

    feat(NvDisplayControllerDxe): update FDT with framebuffer info
   =20
    On ready-to-boot and whenever FDT is installed, update FDT with
    framebuffer mode information, base address and size.
   =20
    Signed-off-by: Jan Bobek <jbobek@nvidia.com>
    Reviewed-by: Ashish Singhal <ashishsingha@nvidia.com>

is in since r36.2

$ git tag --contains 6071946461389221d2314cbbae0377610b5b1f6a | grep "^r"  =
                                                              =20
r36.2
r36.3.0
r36.4.0
r36.4.3
r36.4.4
r36.4.5
r38.2
r38.4

Not so good for T194 since r36 only supports Orin.

I'll look into getting this cherry-picked to r35.

Mikko


