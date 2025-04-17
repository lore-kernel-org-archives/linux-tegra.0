Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2088.outbound.protection.outlook.com [40.107.92.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87745185B67;
	Thu, 17 Apr 2025 11:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744889053; cv=fail; b=rDoQUvcUjYchOJP09qP0msb1iJAkh+O2xKBiQemcoPvnr8Rmzn9hYbx6Fo385onOQi8O0GFi49otk9L0pRvW+RkrYU/2IafLwXxNP8goYzb5XpOIRGyUZxxsHaCJWvIlwlVcSw0Cn6ywxJWoJax5Y4mscQ0qLo/HFppibL2kGYE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744889053; c=relaxed/simple;
	bh=XgRd2iqlUHuHf6NaKMmM6ysv4njzKW3GCuq8ZZodq1c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fFtbj05DK46SXdxRrrmG4sOCASUzBn6gKbeSX0BiJNVRDhRCaBM2FuX6N7ZtiEfuP+QY71NZZcq3koWuFe0U2sEGFA6dmEkuIvLRQfXwigiEybrM3jeRAEl4MOYtXI5wrzf6CID2nvxOshEEPflNAE3chSzGhJIMRDZeJ/4agGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dSKMy+Jy; arc=fail smtp.client-ip=40.107.92.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dSKMy+Jy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G9M4YOepgripCie3t4Yaoz+9evVNO5P9RKKMFDG6eBpyY7tZfP2SOIS7t5AvhAtHui9LPyYAV3fNBBp9Tko2uQ66OGGDRJmzV1/RAMmhH1/v4tj0x5dxC3S+LzJPO5M1e4dmJIBByfkElIpH5Z6zhy278i+WDHAl/pQ4ds+dbYFEfsP3V0qwPXnLFB+yEZIbqlPJ7zMPFdPpQ7fguHrHKRlMXc7gTqv9H/tTU2L/2whupvKj9QhN0G1vGZo9+7L+B8KTB2r8EsGRuE0mDsFLrv51ziaWUK4Z7Sm6e9k6fIWUoVlEojhMeZPAiUPoGLXEZys0CfE/dBDcdGo+0PW3rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XgRd2iqlUHuHf6NaKMmM6ysv4njzKW3GCuq8ZZodq1c=;
 b=BItWLaviegCtHRGqtKRlWIHZQTAoWJWvIlM4z5KQH2310sFh7oS8ntihJF51FMzeSNhyZ/cRwIUG7UU/eC0QsvcO4lW2NuPJbNwkNFi8VSKQjkExlxM6K+MIEbbs2/Nk6BtXyXbUDrvaYuh9kwvfFSFMDRFZehj+4d5bC3T1UCrMLR42itRl40lLFD6NXdThWx9t8lrlH/sU1f6BdIlpAbbWs2JffQtT6188DitezBO+LojMNs/dAY8vcfM0gemrZ5ufBB0r5B5RD8ac6BWd1LpzkxwphPd4T+Go/jmoqJcOxNi2/W9cHYfKNTEk2JexmxXbbj4ITgmWcW7nboiKWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XgRd2iqlUHuHf6NaKMmM6ysv4njzKW3GCuq8ZZodq1c=;
 b=dSKMy+JyouGpwxSgEHCb4vHgwDma2u91DbI8Ce4JBRyzRqNOW7SbELtSbtT6uQAOtu4oMduLOz5K/JJulWG+a6zAU25bLirH+9gy5GKhjONXCQyZ7rs5y1L4kUqgKfx0i+iLwcWVNNVxfTGN97RzpGkzFtFNIJCWnWwjhZRUkzRL7FzLI+jg4yWxvaLIhFzxGpcaGb5sYFBTp5Pid5raGPQ+txDJJgC6NpK+CU98kVm4OCg0zYGQnF0Xh3pxzu286GDvrSwEH6VQv+i4diMOB2yDe4as6p09iXyvtWHO8z2yr6VqqG8/COwK+h3vNqM1GxrSg9WaEw8GkT8N823IMQ==
Received: from PH7PR12MB6418.namprd12.prod.outlook.com (2603:10b6:510:1fe::18)
 by DM4PR12MB6010.namprd12.prod.outlook.com (2603:10b6:8:6a::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.35; Thu, 17 Apr 2025 11:24:07 +0000
Received: from PH7PR12MB6418.namprd12.prod.outlook.com
 ([fe80::c212:c319:304e:bb09]) by PH7PR12MB6418.namprd12.prod.outlook.com
 ([fe80::c212:c319:304e:bb09%3]) with mapi id 15.20.8655.022; Thu, 17 Apr 2025
 11:24:07 +0000
From: Robert Lin <robelin@nvidia.com>
To: Jon Hunter <jonathanh@nvidia.com>, "thierry.reding@gmail.com"
	<thierry.reding@gmail.com>, "daniel.lezcano@linaro.org"
	<daniel.lezcano@linaro.org>, "tglx@linutronix.de" <tglx@linutronix.de>,
	Pohsun Su <pohsuns@nvidia.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Sumit Gupta
	<sumitg@nvidia.com>
Subject: RE: [PATCH v4 0/3] clocksource: fix Tegra234 SoC Watchdog Timer.
Thread-Topic: [PATCH v4 0/3] clocksource: fix Tegra234 SoC Watchdog Timer.
Thread-Index: AQHbr3uKpvtLFAXPL0abZyID7ZCiJ7OnsOeAgAAF24A=
Date: Thu, 17 Apr 2025 11:24:07 +0000
Message-ID:
 <PH7PR12MB6418163E9BD4D9D94ECDBA5BD9BC2@PH7PR12MB6418.namprd12.prod.outlook.com>
References: <20250417093110.2751877-1-robelin@nvidia.com>
 <36b98b84-d18e-4781-8a80-51950eb941ec@nvidia.com>
In-Reply-To: <36b98b84-d18e-4781-8a80-51950eb941ec@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB6418:EE_|DM4PR12MB6010:EE_
x-ms-office365-filtering-correlation-id: 3b05ff05-b51a-48c3-dee7-08dd7da25e15
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MWlOazBiZHZwVDlDYWl3eGxPbW5OSk96bzkyUCsveUlucXZodGdhaktXTi9s?=
 =?utf-8?B?MUloR1o4TnMzTzJHVlVRZ3lsMjJ1QUV1S2tzaFMzd0hoV3dJSWh1UkhzMU83?=
 =?utf-8?B?MmlvMHNkMDhqc0JKOGQ5bDE3UWJHRTBQTDk3RjB5UVllUjhKTXc4Y1B0SUFw?=
 =?utf-8?B?RGpsellzMmlWNHdZZ0Y2UGtnMHpsWndBd0o2d0F1ck5DaEZ0K1BDeDFUT1Jq?=
 =?utf-8?B?Q3ZoOFhhZFBXTEpNVmRpOWZJeW1jWnlqV09Ha0NlYUFJbjlBaENrRG5MdWt2?=
 =?utf-8?B?d3FTeDFrRkY0MVp3Y1c5ZlNZQU9IYlJDSEpoaFZiSUx6N2hRMWZhYWJTV2VL?=
 =?utf-8?B?L3BpaUs4dzZVZm5WRmNvUUp6OU0vVmhJYzVlY2UwcUtTSlVOVzduUWxrTm4y?=
 =?utf-8?B?NDNTc2o3YXBkT0VHR2JqSm4yekJlOGNPU3ZKNHVOclFSNDF2c09sK0ZOVmNs?=
 =?utf-8?B?VEpYZVJvc01XYWFrN3BuS3FsRHRqdkd1MHFQRCtjMlRsYmNwNFpXQjRLRDh5?=
 =?utf-8?B?dVhpVGl3UW1MU0V4TENZcnNON0NSdmdiTXRmWks2aWJWaWVSK0hqa2owZDNI?=
 =?utf-8?B?Y3Z1aGZqQkR2WENSYmYvaDJndVphcU44ajZ5RzVoRXo1NDFMbFpaTllaMFdp?=
 =?utf-8?B?NzljNWtEL20rZzl3c2hWSWdzUUhtS01MTWJ3aEtzdVNzelZmdUFvU295dnEv?=
 =?utf-8?B?d1pBRDE3ZFB1bkdITjRjbk1iL1J2aStGMFZQa2FNckcwTnFId0NUTFZSdFE2?=
 =?utf-8?B?cFh3OThERWpjbWVzRXFrbzBVMjcyY1o5c1hpVExpM1laQUl6YXMzVjRqZ1gx?=
 =?utf-8?B?M0FJWHFjQy9QV0NiUTlGTVdCM0JMVWtUSk04dEF2V0lRblVrK0hza1BaM0Nl?=
 =?utf-8?B?UTRjRThKU2U0V1F5RmEwTi9VUmd4ZjVQaW1aWmlSZ0FtUkdhYlEvb291UWxG?=
 =?utf-8?B?MUcwSmFxazBVQnZkTUE0MjMrWVlFSld6VXprNjFTdS9sclJieVVrYWgvWWc5?=
 =?utf-8?B?a0NVKzBGYkhSNDlTZ3g0aUgyQ251aTJBTmRRQnBHQi9ZTVM5SFJRdjd4WkVP?=
 =?utf-8?B?dmJrMmJSekdzOUZuYVpSUzVMZ2sycXlYaTBjK1lQWEcyMW5uNVdYb1R2MWVQ?=
 =?utf-8?B?MnlxajNjWmVwbVNrb0dFQlREUWJxMlNSREt4ZVl5bFZSd2VMajhiNFFhWHdD?=
 =?utf-8?B?aFhDQ3F2MWNWQ3YxYTgvVEpQanBTWjZyOXRTSVVndDRKMDZJcTY4eUxOTGN5?=
 =?utf-8?B?K01nSGg3WHhNSkxjZU92alEwZVgzNjdLNnU3QnJvTklMMEVobWZBejdpcFBt?=
 =?utf-8?B?cTFjNDhIbi8vWi9hRTRBNHdGMngvS1BubHM0dkdpWk41c0pIQVFtazRZYjVG?=
 =?utf-8?B?UjJWNFJuRk9qOGQ3K1RZb0xLRkhOZ0U5TTdLT3FOaEZRTXNyckZLQloyeU8z?=
 =?utf-8?B?cUg1emJaUWloVnlVL000NC9NQUMxMkdBS29FWjF5K0V2UC90bVdLdTBZTndV?=
 =?utf-8?B?U29oSlRwdWtvZW83MXM2TEg4N0ZxM3pNWURWV3pDZ0xpV3p5TkduSFRocE0x?=
 =?utf-8?B?KzVzMGtXRHVRbXFMOW55V29NR2VFejFMZVhHVTcvdW81bGhXano0QzM5QVp0?=
 =?utf-8?B?clBTd2FseE9sT1N3VDF0d0drQzlacUhlaXZyMzZFbmJRcFEwM3BqWW9oZlJV?=
 =?utf-8?B?QUZhcENDbU95bGFKbks3WWpqZkl4a2ZkT3FEWXNnbTdERVV5c0hRZmxRWDhq?=
 =?utf-8?B?cEhGNWxqWmZNWitObTk2dDVSZ1VwY0VOZU5PMUZQTWdlb0NYcTBpSHlMTEhx?=
 =?utf-8?B?Sit4TmNvbW4zMkFIZUk2a2g1Y2dCU1ViVkRNbmNGUzBTTVplcFc3RUljMnp0?=
 =?utf-8?B?REY2aW1pbmZGOW11ZjVwUGJ0ZWdxUGduSnhoS1NiTWFpcTR4SFVvTSt6RTY5?=
 =?utf-8?B?NkJUdU9wcmE1aFcvY2hWT1lqa1VVWlFFeXpHMkJzQ0U5V2hWRkZUUm9NaXdT?=
 =?utf-8?B?NXZKVVZlK3JBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB6418.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VnBrdkFLbFhiQzR4VmNsRzREbE5VU1pZakVtTncwUlptbDl1dWhmOXdPQnhx?=
 =?utf-8?B?VHBzcEdDY0U1d1JpYktaRWE1SzVBYmN6Vkp3UkdrUWRxeGJuclBMNnRhQTZO?=
 =?utf-8?B?ZE1ZMSttQ1NpamVyTUZrUlptWUxzQm91VXp4VDFSSDZkVktoZTdxZVMzNVlD?=
 =?utf-8?B?bVM3UUgrcUVFdmsxQ2xSaHlleFZjaHUyWmI0RmFlMnI2T21NdldJMktrSzhm?=
 =?utf-8?B?eWhoOVVmYnJaeHRqcGovNmZEbzJRVGkzNUlBT1hQT2oxTXZHVFBGNGNSZXEv?=
 =?utf-8?B?ZXU0enhVYmFGVnhPc1FRYUZ1UHAvOHZibVNYVDhJN0IxQ2pQY2ZHTFZFN2NQ?=
 =?utf-8?B?bTNkWGJaVGRYSGlXanFqUWd6YkhLWHBjVWIwSURCSXlZTkppSHpORDN5UHVl?=
 =?utf-8?B?TXZEMnhraEI3dTQ3VWNvSlJJaXlRcGlON2pjUmlnUFhWeUUzb3ZQUUdiRTZD?=
 =?utf-8?B?ZHdzcXJEdEd6OFVsYlAwSmtSK0RjbnpyNWYyWUx1NHZsTmNCeHNERXhnekd5?=
 =?utf-8?B?SWxvVW1LdVNmYW5VZ3JWcGR2VlV4V25wT3lUNFBRdG1pZGdhMkVZS2hRS0F1?=
 =?utf-8?B?UXBFb21EUVhTNytnM0FMWWVjUkJFZlBjbTRkK2dLVEhvMFIwTkE4Z2NUVTNI?=
 =?utf-8?B?UXFTRVUxM0VjYjRmWmdMSGdwVEI4QVFSQyt0cmNyYStpUTZTR2U1NWJ0N0Nz?=
 =?utf-8?B?dUJ3anN4emdsVDhpODRZdlNaZHF6VXFtcm5WMUZMd1I3SUtZOW9jNC8xMlpO?=
 =?utf-8?B?Nm9XOEpNOVN1RlloL0FMNHEzT1VoR0Q0SXJ5QWdHeEgzYmFvdCtPclFmRHRQ?=
 =?utf-8?B?Mk1DZW4wY1d0Sy9OQUo1YjE5RG1FVlcvek5QNjA0ZmdoYzY5UlQwQzlORjls?=
 =?utf-8?B?V2pnVXYwNGhWZmtKY0V5NWlGbXpmMEZ5dUpsQWRRWkFVQW5GZ1NmbjdZR0hh?=
 =?utf-8?B?cE1xSkYwUWNyZlo5Wmx4VU81TmtlUXVDL1VMMkRneWxFdUZCL0xxWkI4c0pT?=
 =?utf-8?B?ZzF1THd4OWoxVm9CNXp1Y0dhUkhjOW5GLzRORnFoMHAydXFNZDExVGJTZmgy?=
 =?utf-8?B?ODRtdzJrcnNBS2hQOC9td1RlWS82U1NmRkV1QjR1OU42R3lIc1dWUHZxZzlj?=
 =?utf-8?B?WkxJWUhGR0xTa1Q3eGtzYk8yb1N5TUN0TXlvMEVBMGR6ZmJhK0V2VmVDL0xv?=
 =?utf-8?B?cldxRUpsdUt3bFVkWEtta0hJZ1hZN0pRL2lRSlhORHlpWEkrU1ovaUVhdTNo?=
 =?utf-8?B?cFY1SUd3NVdPZmNMbng4L2gvdW5nWDhuL0NVZzUwUTRZVkk0NVZ4RVNxcG5Q?=
 =?utf-8?B?aTg0eU1FY1J4VGlhanBQdUU2d1NjWTZPLzJWRnpKd0JFbGlWU2J5amU3cEdE?=
 =?utf-8?B?eVZob2pOc2ZOT3I3QmpNWjByOXVoY05kL3FKOWYwbFNCbGpwQXZNZDRTdFBW?=
 =?utf-8?B?WThyMVExdWc1SjJXUWI4QkMyQktvV0VnWkx2a0VVZlBiMDNhRzU0MnBlYUpv?=
 =?utf-8?B?eUZoeENLRCswVGV1aXd1TGNiNDViQ0QvZTFKaVNBZENVa0RPUERqbzhScGhJ?=
 =?utf-8?B?UFBKZTNOZE1JcGZCNEM1UnZ0NHBMa2N5dGEzUTc4UlB0dHdqaEduaDJwcml6?=
 =?utf-8?B?WGg1amV1eEZZd1lSV0kzM0RGdCtUSUpHb3JQd1Z0UzJkdFI5VnFLSTVrUVZ4?=
 =?utf-8?B?T2U5ZGQ4dUhQSk9PbndoYVlhb0k4Z2IzUDczUnZTY2dBeWR1Znd2WW1VZndQ?=
 =?utf-8?B?MGNISmpoU2NzRHQrWkVsUHJibXozWE52bnhWQ3BJSytxQmlITk9Jd1BsVERh?=
 =?utf-8?B?cUpkOVZyd2wzYzhBVW1VakVyL1o0SG9vSlJHWjhSRWoxblN6bndBNjhFZzc4?=
 =?utf-8?B?TjRlSTN1WjlUb0t5MHVzTGlhU01TcDg3elNFYVdURExZVi92YXp1VXBMQlJD?=
 =?utf-8?B?Y01JcVk3SWJJTUgybmUydmlBVExReUVqMU10WHVQYysvK1lOVzg0dHB3bU9t?=
 =?utf-8?B?RXFWN2djRFB3a0h1Z3JCMlY5VGUwSEkyU2tSWGNWK3BaenkwVmY5QThnY3Jo?=
 =?utf-8?B?TkpBSEhqZldoQzc1Z3BWUmRoTVExSnpvc29KUlZrQnVoTGQyZlRsemZPbnBr?=
 =?utf-8?Q?PDBI=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6418.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b05ff05-b51a-48c3-dee7-08dd7da25e15
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2025 11:24:07.2696
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y6Z0vqihBuG/oQxZHox7ENuEDz2LsqrE2GmtPupvE9yatvfRJzz90mMoPFJ50zUiNEf0fR2TpZYLRLNVfVuLyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6010

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKb24gSHVudGVyIDxqb25hdGhh
bmhAbnZpZGlhLmNvbT4NCj4gU2VudDogVGh1cnNkYXksIEFwcmlsIDE3LCAyMDI1IDc6MDEgUE0N
Cj4gVG86IFJvYmVydCBMaW4gPHJvYmVsaW5AbnZpZGlhLmNvbT47IHRoaWVycnkucmVkaW5nQGdt
YWlsLmNvbTsNCj4gZGFuaWVsLmxlemNhbm9AbGluYXJvLm9yZzsgdGdseEBsaW51dHJvbml4LmRl
OyBQb2hzdW4gU3UNCj4gPHBvaHN1bnNAbnZpZGlhLmNvbT4NCj4gQ2M6IGxpbnV4LWtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LXRlZ3JhQHZnZXIua2VybmVsLm9yZzsgU3VtaXQgR3VwdGEN
Cj4gPHN1bWl0Z0BudmlkaWEuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDAvM10gY2xv
Y2tzb3VyY2U6IGZpeCBUZWdyYTIzNCBTb0MgV2F0Y2hkb2cgVGltZXIuDQo+IA0KPiANCj4gT24g
MTcvMDQvMjAyNSAxMDozMSwgUm9iZXJ0IExpbiB3cm90ZToNCj4gPiBGcm9tOiByb2JlbGluIDxy
b2JlbGluQG52aWRpYS5jb20+DQo+ID4NCj4gPiBUaGlzIHNldCBvZiBwYXRjaGVzIGluY2x1ZGVz
IGEgZml4IGZvciB3YXRjaGRvZyBmb3IgaXQgbWF5IG5vdCBiYXJrDQo+ID4gZHVlIHRvIHNlbGYt
cGluZ2luZyBhbmQgYWRkcyBXRElPQ19HRVRUSU1FTEVGVCBzdXBwb3J0Lg0KPiA+DQo+ID4gLS0N
Cj4gPiBWNDoNCj4gPiAtIEltcHJvdmUgdGhlIHByZWNpc2lvbiBvZiB0aW1lbGVmdCB2YWx1ZQ0K
PiANCj4gSSBiZWxpZXZlIHlvdSBhbHNvIGZpeGVkIHRoZSB1bnVzZWQgdmFyaWFibGUgd2Fybmlu
ZyB0b28hDQo+IA0KDQoNClJpZ2h0LiBTb3JyeSBmb3IgbWlzc2luZyB0aGUgZGVzY3JpcHRpb24u
IEkgdGhpbmsgSSBjYW4gaW1wcm92ZSB0aGlzIGluIHBhdGNoIHY1LCBhZnRlciBUaGllcnJ5J3Mg
Y29tbWVudHMgZm9yIG90aGVyIGZpeGVzIHRoYXQgSSBuZWVkIHRvIGRvLg0KDQpBbGwgdGhlIGJl
c3QsDQpSb2JlcnQgTGluDQo=
