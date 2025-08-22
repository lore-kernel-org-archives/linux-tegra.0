Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2068.outbound.protection.outlook.com [40.107.93.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BB214A0B5;
	Fri, 22 Aug 2025 01:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755826144; cv=fail; b=uRO+W3olHtFUcqrKZlM8C6DgYG5D3Q7FNGHfRwp174gwFRgPL9knSOHcz6JnMUPGfy8kmmFgWbEs6gmI33IHFWsG9pCgPMKc9XqTNi5zhJBBHRL9A2RMCPWzONUvetTDwzbRewz2fet5h0RWdXVGcBSEWnsycK5Tp9ZHGfamBrw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755826144; c=relaxed/simple;
	bh=wdYL1kdiJOtijvWk2SkEfi0iTV4uqhMui7tQD3/Cguo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Rl/UM4CkwG8FYEglfg9wfI748p3OVzJruFS0/FG/STKjt3GQ0eQNXvHjayaWnpOEKVYtzT9iP13NBxLX8vPt1S15P+KtbtR0wZuYvpef1D2bGdlII429J3FeZhFqOC9+i+J8TaIBcsg8WKdX7CSQiZfFvHp5s+FHUaqwU8N0oHQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=owJKgric; arc=fail smtp.client-ip=40.107.93.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="owJKgric"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G4MBBw4eUvKumTyIoAv+i5DhlbPLCgbDAYq/hgQxMAfcg3yYwIpDDbTT81hKcsTtB8ZrDrJ/8o3KxM6bfBBk4DP8+SL+45KThKXhNsgTs5gMFcbehm/NOXwiZSXoKu5HMIR9eh8OwWKVmFaWaEfUk7DZ8Q/nuB+7Kc0LfleXmNRbWBJMTUyZoiLwXvZ0ugGa28msHCO/mlNglry987xsduRRQ3i18ACYbqAxWDkfHa3dbzpu/2Z0gQraeTUxCJtm4z220WD0W5fwDgMSR7m6EhiV4qx3ftZUAaN2/CzaRws097TvtExpAscA9J90CQa03bV3D4kRrMGM1naFHxfCUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wdYL1kdiJOtijvWk2SkEfi0iTV4uqhMui7tQD3/Cguo=;
 b=P+Pp/vb3WCr8hkIilv+Nx6tbvfTpm/W43Wak+ONaxSDv7qRk26O3xHR3IMzmzxI4nSrLmfSX/Dc8ZqudZOAuQewn4IFmDAeeOx2zQnCPX4Y/jbBSPaYSZiZvuXGmFm7ZermnrDhalwaivjno92ARGMO3F0wUAjlOz0prFvXDrajewk/3UgZ0k7SXJsqLngsSdvj0oWK2E7+aDjXt6HGMkEiNdzbKbumInErDbpzh1rxesFvFqqCBNfqc9VkNNA34i+le2xm8ZSnnxwLaoHldB+DkZqDHWobi7JepFw8rxbnlV7ZVvy1LGUpq28YsGBRJjDYdxWW7/RLXswH5AUVixw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wdYL1kdiJOtijvWk2SkEfi0iTV4uqhMui7tQD3/Cguo=;
 b=owJKgric4UK1m2F1hd8T2l80dDO7PRYW3g5PLiwBlBqx2xcAGyVsqxr07bB/WOXW3U665sPQ6uonw768r7qqxouejqlbKdh9auFzGw/JPh5sgaC3hUq7ExhIgaTAyLAsNpXBlunI4yxt1CIpXuKhpTRTRH3PHECB/JHq1zfGk/AhuOxWS8HBQL3u17/XY/mTWjg3zvcklQrwlZrMfwvPhi8NLw82DxbJFClRN62vW0pcbvevWnjwbQkBKu2Ia/H07ii1aO9OPVVJ0ZKUzWm3pcuY6SpzBml4OfFMEOT+SDcWaD8w0nI/gyX9vepO+E5I5pKDFdlkyA6kEnRlEu4U5g==
Received: from SJ0PR12MB5676.namprd12.prod.outlook.com (2603:10b6:a03:42e::8)
 by MN2PR12MB4127.namprd12.prod.outlook.com (2603:10b6:208:1d1::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Fri, 22 Aug
 2025 01:28:59 +0000
Received: from SJ0PR12MB5676.namprd12.prod.outlook.com
 ([fe80::abdb:7990:cc95:89ce]) by SJ0PR12MB5676.namprd12.prod.outlook.com
 ([fe80::abdb:7990:cc95:89ce%5]) with mapi id 15.20.9031.023; Fri, 22 Aug 2025
 01:28:59 +0000
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: Robin Murphy <robin.murphy@arm.com>, Ilkka Koskinen
	<ilkka@os.amperecomputing.com>
CC: "will@kernel.org" <will@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>, "suzuki.poulose@arm.com"
	<suzuki.poulose@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>,
	Thierry Reding <treding@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
	Vikram Sethi <vsethi@nvidia.com>, Rich Wiley <rwiley@nvidia.com>, Shanker
 Donthineni <sdonthineni@nvidia.com>
Subject: RE: [PATCH 1/5] perf/arm_cspmu: Export arm_cspmu_apmt_node
Thread-Topic: [PATCH 1/5] perf/arm_cspmu: Export arm_cspmu_apmt_node
Thread-Index: AQHcC+ImMFs5yr1DfUmkmrpnMiJW+rRqdGWAgAF7uzCAAWKsgIAAjxsA
Date: Fri, 22 Aug 2025 01:28:59 +0000
Message-ID:
 <SJ0PR12MB567608B25A04CB5837BE5A57A03DA@SJ0PR12MB5676.namprd12.prod.outlook.com>
References: <20250812233411.1694012-1-bwicaksono@nvidia.com>
 <20250812233411.1694012-2-bwicaksono@nvidia.com>
 <88a25a26-109d-b5cc-4bd2-776c3c2ba113@os.amperecomputing.com>
 <SJ0PR12MB567600C6753A076E2ECD6FC6A033A@SJ0PR12MB5676.namprd12.prod.outlook.com>
 <35ff1e0e-5810-49c4-8a1a-d58ad7a5cc31@arm.com>
In-Reply-To: <35ff1e0e-5810-49c4-8a1a-d58ad7a5cc31@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR12MB5676:EE_|MN2PR12MB4127:EE_
x-ms-office365-filtering-correlation-id: c94153e8-1404-4455-319d-08dde11b450f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WWNRSW1GSnoyVCs3THQwakJNSEtCWE91amViOVdmYWplSWsvSUV1SVVHUCtC?=
 =?utf-8?B?UkhnTG9HbXdpVkdnZFZ3TmcxZ0xndWRiT3I1Qk54OEpZZ25SalpHU1Evdnhx?=
 =?utf-8?B?NFhVMGxSTVdzaGQ2a01Lb1VFRC9BQ3hwT2txZnl3UTVCYU95R2t4WW44bkJY?=
 =?utf-8?B?bzc2WVdkeWZwYURwOSthTmQ5anlPOTZKRjJ2VlpJZGpDajVwb3VSaUFDemxj?=
 =?utf-8?B?TmMwVFdPYzNMYWJIR1ZWRzNocEFnNW5hamtyaGlNUzNhWUtzSU1lWWtZWmYr?=
 =?utf-8?B?ZzBiMnFFb3NZZjNyZm1LSllOVmZCQ3lVN2RTZ1lxOURYQnN0MUx2QXd3dk9O?=
 =?utf-8?B?NllpNzdyaTVhckRyaysybkkyVm1IQXplbkcxT0VseG1zT1lpSW1DL1JYbVpW?=
 =?utf-8?B?WEI1ZWVXd0JXOGwvMkRwNSszTHlFaWNUTDdzekNITTRVTFdKREJqbkFOWGZ2?=
 =?utf-8?B?bFJ5Y3FtU0dOcUh5eVNueWpsd1I0aWNkSWQ2YXgyc3ZGNGx0Vk9XK2loRmpK?=
 =?utf-8?B?YXVVK3VZUkRJQm1nYXcxU0tMNVVGcFhnZXZHMzkzdkg2RmpRTUJLZk0zbUxT?=
 =?utf-8?B?UkZJY0Vtc1o3UE01MGZpSi8weG50TjlwNWpQcmNMMStSY2pOa2NyQVZwYVJz?=
 =?utf-8?B?SHgzdHFjRnVDWVpXNG85MVVQV203U1RheTVTVGRGV3U0V1RoWVdmeDdmVXVY?=
 =?utf-8?B?Y2pGVnRaQUZKMmRycEdWNXRrUG94TDRaTjRLQzBGbmNCekNNRUU4Vk5qcGhp?=
 =?utf-8?B?eDJ1QnR2NENOaHNEeXZBNjE1cW9xcVUybWFyTHZpVW1wakw2clJZbXNvWitV?=
 =?utf-8?B?b1J2TFVJZXV5Zll4RTRPanFucUZBb2ttUDlUY2ZUSlpuMlNpaGQycDAvbW82?=
 =?utf-8?B?TUdGUnpRT0g3OElGbGhEbHZ4R28yZm1QK1BOZjhnTUZBMTBEQUZyL2Z4Nzkz?=
 =?utf-8?B?Wkc3ODR2ak0rang2YkhYV205ZS9ER2ptcGY2eTlmWHAvNERFS2N1aTF1Yzk3?=
 =?utf-8?B?c0VHWEcvYVpuUmRJYXQ3M1hVRXpzaW5mQkF0THNBeXMzWW5oVTN4Zm1YSGRk?=
 =?utf-8?B?L3Fwem5KOGNNdHVZSzFmdVlrTmdYR2FvTlhOaEpBU2RrL20rcS8yZEI3UGF3?=
 =?utf-8?B?U21MZTdodTU3WDdaQ2E1RWQza2xFR2svSWp4WU1yT0RlNEcwZ3NLR2VLVExX?=
 =?utf-8?B?WmtFeFhqZDJ5WmhEQldGdWxIZjZOS0R6WGkrdkQ1WHBhSDltbXV2dTV1SkN2?=
 =?utf-8?B?ZTZKMzUrRzhlaWdiSElsVzVtcHZsWE45SXJ5WmNaS240SGFFMFNQTmZSN1FB?=
 =?utf-8?B?clNSWkpOYml5aGJSYmNNb2hyRWpNQml4UlFxZy9GN2diSkJYKzVhLy9CaSsy?=
 =?utf-8?B?M3FONkdCNXc2UTNJVVdiT09LeGFrbXB1NjBQRDJFRDljM01kTUNkcWtOZ0FS?=
 =?utf-8?B?a2NlczFhRFlTT2YveEtLZnRoYzllUmgyTGp0c2tvNXFncXNzRmIzZ1VGMjVG?=
 =?utf-8?B?V0ovdTk3MmNraWIyZmphZGRqd25Nd1dURWU3K0ZuSExHVzg2SEZybE1wV3dE?=
 =?utf-8?B?Nm41a1lWTkFTcW5ITnlYWloyMXk4VzlERzdiUXhTcnp4Q0Fhd3ZFMlgrd2xk?=
 =?utf-8?B?alZ3cE9mK0VwMDg2akVCYm5lVnJIKzVXa0p1TzJ4Y0pEcFZGL2FxcHE1QXY5?=
 =?utf-8?B?OVBzSXp0clhUUHlwOEViUmFGS09WaDM4bkFqQUxBQVRsazhTS1c5SUptMDNa?=
 =?utf-8?B?TUcrR0doU0FRR1pXYXNaenNyczkyUEVhazBWbzJkM1JsSTVrRDR4eTU4R1lU?=
 =?utf-8?B?UENsQjBGYTl2SWVTSEhPWHdwbGsrZHM4VEFNeWFiamxuY0dHajZiMm5RbXJH?=
 =?utf-8?B?TEdvYU0vNFY4WVBXWWxyNzZLYjNrTkk4enhkYm85MEdoNjFKRG8vLzZSZ2Jq?=
 =?utf-8?B?MVZMYWQ1VURzM2VjbWZOZzZ6WVMwRDdpdkt2RlhpZFVOR2MzNHpSdmxxSFBL?=
 =?utf-8?Q?pPuOF47wj/aX3bcLJREnBsyY2zGT4A=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB5676.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RXNtWlRCeTdiT2sxRWswYmhwQmhrREtmWEhJUzdEQmEwbDRubm4rbEpWc0lx?=
 =?utf-8?B?Y3AvWlRtc0hMN2FaSDM5TzVDNHZOVWpQQS9pTWJ5Zlk4d1BpWEdEcFdJMkk2?=
 =?utf-8?B?amhVa3hScjlVTXRTUGpaaWk2UllYTGRoSzl2RDlmeGN4VUpPc2hlZ1lXejNX?=
 =?utf-8?B?bDh5a3p5TFhHcUgxVUVWQ1c0RWVPNmJHTXM3UWdoQ25lQTBqNlVJMW1mZUhM?=
 =?utf-8?B?UXF2cnNsQ1lqSjZvb1RYMW9Xa0hXREVvWkdoOXhpZVhWdG9obDR1S0hoL09z?=
 =?utf-8?B?RThpK1V2TW05UzdJMkg5U0N0QW5ZamhiaEVKdHczdFg4QjhicCtseDJoR1Bl?=
 =?utf-8?B?YzUxbkJWOVNUUUJLWFYzZHVDSklKbHdROE5oV3VzVm8zMlpaQksyeHl3UFJo?=
 =?utf-8?B?YTE4L1hJdDVmVUEwL3Z0VnRZck5ueFJGclBnU3g5dTZ2bDRDUDJFTnF0dXVj?=
 =?utf-8?B?Q3N1anVKWVlrUzNzMEFSc1pIM3N0UUp2S1VlOUVmcis2VVZUamNhSHRxU0dZ?=
 =?utf-8?B?TGc2Z1E3NFN0bm1jREQrc3RMTUJvZUVYMG05M3VZVkR5ZDYvR3JQN2hpaXI0?=
 =?utf-8?B?aU5XdW1BejNzRUl1Q3c3VDJDNHRUYVY2ajZHNlpydDhqWXYzaEplaWFROHIx?=
 =?utf-8?B?c01EUXFXQ2hqUTQxVUlmWk9JV1QzenMxdjk5NUtyeWhLL2doZ1VnKzlmMUpW?=
 =?utf-8?B?djI0UTQrMDJEQ21ROWtPZDhucDNoMjZ2T1p1MWlVVGJVWElKdzJweEZXMWJU?=
 =?utf-8?B?c0pRci9wUDdVQko3dExjMDBWbHlwbVNMMmpxVFlZd3dMMDlZc3hraDhmVGE3?=
 =?utf-8?B?bE1UZlAvYVdPQjI3U0trU3E4RENzYnNuMjFvVHZoRkhIUmVGdUV5a1piT1RS?=
 =?utf-8?B?OW1KTzRtejVGWEpncWozYzVQOUZIZjcvVEpVYWxqQTV3TXQ4azNvSnF4WTBE?=
 =?utf-8?B?S1ExUU5RNDd5WDR3dHRsRXk1L2Nubm9CSW1MeStRcnkzd1JrVEw4OGRuOElw?=
 =?utf-8?B?c2t4VjRldDNQN2xGMXFYc1d3ZC9oQnltdXdwcnVqdFhTajBURWdrNUxOY0k5?=
 =?utf-8?B?UGZ4N3pxNHN5L2IrMm9RMEt1eGxpcEhXdHdnMDRoRnRlK0dkZkNlT3pBMjl1?=
 =?utf-8?B?eUk1K2gvZHprT05zTW5Ccy8rRCtRZnIwUjNjN0dEYXEvMFg5OTRJUG04SDFI?=
 =?utf-8?B?Y3BmeUViZzduZURRYXgwY3R2WVM4Zk9JSWsveVAyWmRURzBPSDdDUjJiWUVx?=
 =?utf-8?B?b25yR1RTazRtdENPK000cmVUcFJhZHE1bExQUUFRa3BKc3l5bWFpVXVZdDR4?=
 =?utf-8?B?UUhxZnA3WjJqcWpBQi9UckdYM1hFK2o4WWJ4R1ZyKy9UTmxCS3RwOW5VaGhR?=
 =?utf-8?B?bWpMNkFOQjBXWUJBeDB3dDIxQ2JNakd6R2lQZS84Y3g5TDBkVEFOT2tZdHBy?=
 =?utf-8?B?WHYwNVVZcDc4bm9IaENVR25QYXFOTkNUQnZqQVN2QzNVaWJWNHgxTnNHSVZ0?=
 =?utf-8?B?WTY5cmsrdkR2b3RCVmQ5N2FEUmZTOSt5V3hySkNlc3NtU3NSZElEbUhTUTVX?=
 =?utf-8?B?S1QxMG9HZW0vTHFRUlRZdklybHBSaURROHZwUlB2M0o2MkIyOGh4TDJ0VGd2?=
 =?utf-8?B?VmhrWnp3R3BRNWQwZzQrbHVqNDFEaGlJcTRVQ1NWK2NXVER4WnlSSEpuV2JB?=
 =?utf-8?B?YTFwM3dKVld1UGNiaXJqWXI4WDJnbERQNnVCTSt2YTkvMkh4dmpEamtKaXNK?=
 =?utf-8?B?MTIycklDd0JhdzdkeHpuRFNvZCtLKzhFcnVicFk2SXpaaUN3Qm5JZ1VJY2pC?=
 =?utf-8?B?bmNLalAvVjNIRFFjU2hHeWFSdWhxd29OQTM5UWdoNlBmaDVleE5mRjRWT2Ro?=
 =?utf-8?B?bUZFWVdidmZ0SHhseTUraWZVV3huOXE3UW13M0Nnb3BidjZmNmt0dGxKVnNp?=
 =?utf-8?B?Vm4wRW5lbGhDcG5nQzNucHFwZFBMSDZTM3hrbmlhSGpKVzVwU1hVekl2dk1W?=
 =?utf-8?B?Qm5wNDhzUGZaVE5JUTVDZEFPaVpxalBDeFNhUGhyc1IzbkdBa0Fsdjk4U0xp?=
 =?utf-8?B?SlIwV3JrMXhTd0NESVVvL2MyNUt4Si9ZYmUwTXdhbTNuVVd6UW9pRFZCZDly?=
 =?utf-8?Q?eqzA7ZB9tOSdtwMTpmYACA4zl?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5676.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c94153e8-1404-4455-319d-08dde11b450f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2025 01:28:59.5318
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D+r8gDOB2IE9NyRY+E0sXKorvy4EJF+jC2FYy4ziiVHwOiLAoIrPMpcqMTQAHSu0BNAr7NX7ea3JAkXx01Ba8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4127

SGkgUm9iaW4sDQoNClBsZWFzZSBzZWUgbXkgY29tbWVudCBpbmxpbmUuDQoNCj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJwaHlAYXJt
LmNvbT4NCj4gU2VudDogVGh1cnNkYXksIEF1Z3VzdCAyMSwgMjAyNSAxMTowNSBBTQ0KPiBUbzog
QmVzYXIgV2ljYWtzb25vIDxid2ljYWtzb25vQG52aWRpYS5jb20+OyBJbGtrYSBLb3NraW5lbg0K
PiA8aWxra2FAb3MuYW1wZXJlY29tcHV0aW5nLmNvbT4NCj4gQ2M6IHdpbGxAa2VybmVsLm9yZzsg
bGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eC0NCj4ga2VybmVsQHZn
ZXIua2VybmVsLm9yZzsgbGludXgtdGVncmFAdmdlci5rZXJuZWwub3JnOw0KPiBzdXp1a2kucG91
bG9zZUBhcm0uY29tOyBtYXJrLnJ1dGxhbmRAYXJtLmNvbTsgVGhpZXJyeSBSZWRpbmcNCj4gPHRy
ZWRpbmdAbnZpZGlhLmNvbT47IEpvbiBIdW50ZXIgPGpvbmF0aGFuaEBudmlkaWEuY29tPjsgVmlr
cmFtIFNldGhpDQo+IDx2c2V0aGlAbnZpZGlhLmNvbT47IFJpY2ggV2lsZXkgPHJ3aWxleUBudmlk
aWEuY29tPjsgU2hhbmtlciBEb250aGluZW5pDQo+IDxzZG9udGhpbmVuaUBudmlkaWEuY29tPg0K
PiBTdWJqZWN0OiBSZTogW1BBVENIIDEvNV0gcGVyZi9hcm1fY3NwbXU6IEV4cG9ydCBhcm1fY3Nw
bXVfYXBtdF9ub2RlDQo+IA0KPiBFeHRlcm5hbCBlbWFpbDogVXNlIGNhdXRpb24gb3BlbmluZyBs
aW5rcyBvciBhdHRhY2htZW50cw0KPiANCj4gDQo+IE9uIDIwMjUtMDgtMjAgODowNyBwbSwgQmVz
YXIgV2ljYWtzb25vIHdyb3RlOg0KPiA+IEhpIElsa2thLA0KPiA+DQo+ID4gVGhhbmtzIGZvciB0
aGUgZmVlZGJhY2suIFBsZWFzZSBzZWUgbXkgY29tbWVudCBpbmxpbmUuDQo+ID4NCj4gPj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogSWxra2EgS29za2luZW4gPGlsa2th
QG9zLmFtcGVyZWNvbXB1dGluZy5jb20+DQo+ID4+IFNlbnQ6IFR1ZXNkYXksIEF1Z3VzdCAxOSwg
MjAyNSAzOjE2IFBNDQo+ID4+IFRvOiBCZXNhciBXaWNha3Nvbm8gPGJ3aWNha3Nvbm9AbnZpZGlh
LmNvbT4NCj4gPj4gQ2M6IHdpbGxAa2VybmVsLm9yZzsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5p
bmZyYWRlYWQub3JnOyBsaW51eC0NCj4gPj4ga2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGludXgt
dGVncmFAdmdlci5rZXJuZWwub3JnOw0KPiA+PiBzdXp1a2kucG91bG9zZUBhcm0uY29tOyByb2Jp
bi5tdXJwaHlAYXJtLmNvbTsNCj4gPj4gaWxra2FAb3MuYW1wZXJlY29tcHV0aW5nLmNvbTsgbWFy
ay5ydXRsYW5kQGFybS5jb207IFRoaWVycnkgUmVkaW5nDQo+ID4+IDx0cmVkaW5nQG52aWRpYS5j
b20+OyBKb24gSHVudGVyIDxqb25hdGhhbmhAbnZpZGlhLmNvbT47IFZpa3JhbSBTZXRoaQ0KPiA+
PiA8dnNldGhpQG52aWRpYS5jb20+OyBSaWNoIFdpbGV5IDxyd2lsZXlAbnZpZGlhLmNvbT47IFNo
YW5rZXINCj4gRG9udGhpbmVuaQ0KPiA+PiA8c2RvbnRoaW5lbmlAbnZpZGlhLmNvbT4NCj4gPj4g
U3ViamVjdDogUmU6IFtQQVRDSCAxLzVdIHBlcmYvYXJtX2NzcG11OiBFeHBvcnQgYXJtX2NzcG11
X2FwbXRfbm9kZQ0KPiA+Pg0KPiA+PiBFeHRlcm5hbCBlbWFpbDogVXNlIGNhdXRpb24gb3Blbmlu
ZyBsaW5rcyBvciBhdHRhY2htZW50cw0KPiA+Pg0KPiA+Pg0KPiA+PiBIaSBCZW4sDQo+ID4+DQo+
ID4+IE9uIFR1ZSwgMTIgQXVnIDIwMjUsIEJlc2FyIFdpY2Frc29ubyB3cm90ZToNCj4gPj4+IE1h
a2UgYXJtX2NzcG11X2FwbXRfbm9kZSBBUEkgYWNjZXNzaWJsZSB0byB2ZW5kb3IgZHJpdmVyLg0K
PiA+Pg0KPiA+PiBJIHRoaW5rIEkgaGF2ZW4ndCBzZWVuIHRoZSBsYXRlc3QgdmVyc2lvbiBvZiB0
aGUgc3BlYy4gU28sIEknbSBjdXJpb3VzLA0KPiA+PiB3aGF0IGtpbmQgb2YgaW5mb3JtYXRpb24g
dGhlIHRhYmxlIGhhcyB0aGF0IHRoZSB2ZW5kb3IgZHJpdmVycyBuZWVkcyB0bw0KPiA+PiBoYXZl
IGFjY2VzcyB0byBpdD8NCj4gPj4NCj4gPg0KPiA+IFRoZSB2ZW5kb3IgZHJpdmVyIG1heSBuZWVk
IHRoZSBub2RlIGluc3RhbmNlIHByaW1hcnkgYW5kIHNlY29uZGFyeQ0KPiA+IGZpZWxkcyB0byBn
ZXQgYWRkaXRpb25hbCBwcm9wZXJ0aWVzIG9mIHRoZSBQTVUgdGhhdCBpcyBub3QgY292ZXJlZA0K
PiA+IGJ5IHRoZSBzdGFuZGFyZCBwcm9wZXJ0aWVzLiBGb3IgZXhhbXBsZSwgdGhlIFBNVSBkZXZp
Y2UgZW50cnkgaW4NCj4gPiBBUE1UIGNhbiBiZSBkZWZpbmVkIGFzIEFDUEkgbm9kZSB0eXBlLiBU
aGUgbm9kZSBpbnN0YW5jZSBwcmltYXJ5DQo+ID4gYW5kIHNlY29uZGFyeSB3aWxsIGNvbnRhaW4g
dGhlIEhJRCBhbmQgVUlEIG9mIGFuIEFDUEkgZGV2aWNlIG9iamVjdA0KPiA+IHRoYXQgaXMgYXNz
b2NpYXRlZCB3aXRoIHRoZSBQTVUuIFRoaXMgQUNQSSBvYmplY3QgY2FuIGhhdmUgbW9yZSBpbmZv
DQo+ID4gdG8gc3VwcGxlbWVudCB0aGUgc3RhbmRhcmQgcHJvcHMuDQo+IA0KPiBSYXRoZXIgdGhh
biBleHBvc2luZyB0aGUgcmF3IEFQTVQgZGF0YSwgbWF5YmUgdGhlbiBjc3BtdSBzaG91bGQganVz
dA0KPiBlbmNhcHN1bGF0ZSBhIG1ldGhvZCBmb3IgcmV0cmlldmluZyB0aGUgYXNzb2NpYXRlZCBB
Q1BJIGRldmljZSwgaWYgYW55Pw0KDQpUaGFua3MgZm9yIHRoZSBzdWdnZXN0aW9uLCB0aGlzIG1h
a2VzIHNlbnNlLg0KDQo+IEkgZ3Vlc3MgaXQgY291bGQgYmUgYSBnZW5lcmFsaXNlZCAiZmlybXdh
cmUgZGV2aWNlIiBub3Rpb24gLSBldmVuIHRob3VnaA0KPiBmb3IgRFQgdGhhdCBzaG91bGQgbW9z
dGx5IGJlIGNzcG11LT5kZXYgYWxyZWFkeSAtIHNpbmNlIHRoYXQgY291bGQgdGhlbg0KPiB3b3Jr
IG5lYXRseSBmb3IgZ2VuZXJpYyBkZXZpY2UgcHJvcGVydGllcywgYnV0IHBlcmhhcHMgd2UgZG9u
J3QgZXhwZWN0DQo+IG1hbnkgc3ViLWRyaXZlcnMgdG8gc3VwcG9ydCBib3RoIEFDUEkgYW5kIERU
Li4uDQo+IA0KDQpIb3cgYWJvdXQgbWFraW5nIGl0IGV4cGxpY2l0bHkgcmV0dXJuIGFjcGlfZGV2
aWNlIG9iamVjdD8gaS5lIHJldHVybnMgTlVMTA0KaWYgbm90IGFuIEFDUEkgbm9kZSB0eXBlLiBW
ZW5kb3IgZHJpdmVyIGNhbiBjaG9vc2UgKG9yIG5vdCkgdG8gZmFsbGJhY2sgdG8NCmNzcG11LT5k
ZXYgaW4gY2FzZSBvZiBEVC4NCg0KVGhhbmtzLA0KQmVzYXINCg0KPiBUaGFua3MsDQo+IFJvYmlu
Lg0KPiANCj4gPj4+DQo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBCZXNhciBXaWNha3Nvbm8gPGJ3aWNh
a3Nvbm9AbnZpZGlhLmNvbT4NCj4gPj4+IC0tLQ0KPiA+Pj4gZHJpdmVycy9wZXJmL2FybV9jc3Bt
dS9hcm1fY3NwbXUuYyB8IDMgKystDQo+ID4+PiBkcml2ZXJzL3BlcmYvYXJtX2NzcG11L2FybV9j
c3BtdS5oIHwgNCArKysrDQo+ID4+PiAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQ0KPiA+Pj4NCj4gPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BlcmYvYXJt
X2NzcG11L2FybV9jc3BtdS5jDQo+ID4+IGIvZHJpdmVycy9wZXJmL2FybV9jc3BtdS9hcm1fY3Nw
bXUuYw0KPiA+Pj4gaW5kZXggZWZhOWIyMjllNzAxLi5lNGI5OGNmYTYwNmMgMTAwNjQ0DQo+ID4+
PiAtLS0gYS9kcml2ZXJzL3BlcmYvYXJtX2NzcG11L2FybV9jc3BtdS5jDQo+ID4+PiArKysgYi9k
cml2ZXJzL3BlcmYvYXJtX2NzcG11L2FybV9jc3BtdS5jDQo+ID4+PiBAQCAtNzAsMTIgKzcwLDEz
IEBAIHN0YXRpYyB2b2lkIGFybV9jc3BtdV9zZXRfZXZfZmlsdGVyKHN0cnVjdA0KPiA+PiBhcm1f
Y3NwbXUgKmNzcG11LA0KPiA+Pj4gc3RhdGljIHZvaWQgYXJtX2NzcG11X3NldF9jY19maWx0ZXIo
c3RydWN0IGFybV9jc3BtdSAqY3NwbXUsDQo+ID4+PiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGNvbnN0IHN0cnVjdCBwZXJmX2V2ZW50ICpldmVudCk7DQo+ID4+Pg0KPiA+Pj4g
LXN0YXRpYyBzdHJ1Y3QgYWNwaV9hcG10X25vZGUgKmFybV9jc3BtdV9hcG10X25vZGUoc3RydWN0
IGRldmljZQ0KPiAqZGV2KQ0KPiA+Pj4gK3N0cnVjdCBhY3BpX2FwbXRfbm9kZSAqYXJtX2NzcG11
X2FwbXRfbm9kZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ID4+PiB7DQo+ID4+PiAgICAgICAgc3Ry
dWN0IGFjcGlfYXBtdF9ub2RlICoqcHRyID0gZGV2X2dldF9wbGF0ZGF0YShkZXYpOw0KPiA+Pj4N
Cj4gPj4+ICAgICAgICByZXR1cm4gcHRyID8gKnB0ciA6IE5VTEw7DQo+ID4+PiB9DQo+ID4+PiAr
RVhQT1JUX1NZTUJPTF9HUEwoYXJtX2NzcG11X2FwbXRfbm9kZSk7DQo+ID4+DQo+ID4+IFJhdGhl
ciB0aGFuIGV4cG9ydGluZyB0aGUgZnVuY3Rpb24sIHdvdWxkbid0IGl0IGJlIGJldHRlciB0byBt
b3ZlIGl0IHRvDQo+ID4+IGFybV9jc3BtdS5oIGluc3RlYWQ/DQo+ID4NCj4gPiBTb3VuZHMgZ29v
ZCB0byBtZS4gSSB3aWxsIG1ha2UgdGhlIGNoYW5nZSBvbiB0aGUgbmV4dCByZXZpc2lvbi4NCj4g
Pg0KPiA+IFRoYW5rcywNCj4gPiBCZXNhcg0KPiA+DQo+ID4+DQo+ID4+IENoZWVycywgSWxra2EN
Cj4gPj4NCj4gPj4+DQo+ID4+PiAvKg0KPiA+Pj4gICAqIEluIENvcmVTaWdodCBQTVUgYXJjaGl0
ZWN0dXJlLCBhbGwgb2YgdGhlIE1NSU8gcmVnaXN0ZXJzIGFyZSAzMi1iaXQNCj4gZXhjZXB0DQo+
ID4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wZXJmL2FybV9jc3BtdS9hcm1fY3NwbXUuaA0KPiA+
PiBiL2RyaXZlcnMvcGVyZi9hcm1fY3NwbXUvYXJtX2NzcG11LmgNCj4gPj4+IGluZGV4IDE5Njg0
Yjc2YmQ5Ni4uMzZjMWRjY2UzM2Q2IDEwMDY0NA0KPiA+Pj4gLS0tIGEvZHJpdmVycy9wZXJmL2Fy
bV9jc3BtdS9hcm1fY3NwbXUuaA0KPiA+Pj4gKysrIGIvZHJpdmVycy9wZXJmL2FybV9jc3BtdS9h
cm1fY3NwbXUuaA0KPiA+Pj4gQEAgLTgsNiArOCw3IEBADQo+ID4+PiAjaWZuZGVmIF9fQVJNX0NT
UE1VX0hfXw0KPiA+Pj4gI2RlZmluZSBfX0FSTV9DU1BNVV9IX18NCj4gPj4+DQo+ID4+PiArI2lu
Y2x1ZGUgPGxpbnV4L2FjcGkuaD4NCj4gPj4+ICNpbmNsdWRlIDxsaW51eC9iaXRmaWVsZC5oPg0K
PiA+Pj4gI2luY2x1ZGUgPGxpbnV4L2NwdW1hc2suaD4NCj4gPj4+ICNpbmNsdWRlIDxsaW51eC9k
ZXZpY2UuaD4NCj4gPj4+IEBAIC0yMjIsNCArMjIzLDcgQEAgaW50IGFybV9jc3BtdV9pbXBsX3Jl
Z2lzdGVyKGNvbnN0IHN0cnVjdA0KPiA+PiBhcm1fY3NwbXVfaW1wbF9tYXRjaCAqaW1wbF9tYXRj
aCk7DQo+ID4+PiAvKiBVbnJlZ2lzdGVyIHZlbmRvciBiYWNrZW5kLiAqLw0KPiA+Pj4gdm9pZCBh
cm1fY3NwbXVfaW1wbF91bnJlZ2lzdGVyKGNvbnN0IHN0cnVjdCBhcm1fY3NwbXVfaW1wbF9tYXRj
aA0KPiA+PiAqaW1wbF9tYXRjaCk7DQo+ID4+Pg0KPiA+Pj4gKy8qIEdldCBBQ1BJIEFQTVQgbm9k
ZS4gKi8NCj4gPj4+ICtzdHJ1Y3QgYWNwaV9hcG10X25vZGUgKmFybV9jc3BtdV9hcG10X25vZGUo
c3RydWN0IGRldmljZSAqZGV2KTsNCj4gPj4+ICsNCj4gPj4+ICNlbmRpZiAvKiBfX0FSTV9DU1BN
VV9IX18gKi8NCj4gPj4+IC0tDQo+ID4+PiAyLjQ3LjANCj4gPj4+DQo+ID4+Pg0K
