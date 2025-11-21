Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010042.outbound.protection.outlook.com [52.101.201.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDAF22259F;
	Fri, 21 Nov 2025 11:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763724090; cv=fail; b=lyHDwxUuyAmlMA7sliBuS8k6y2vGsTgCgrO5n/CKV5QTP3d/MIMPl99V4Bm/Trgx11P4yx6UPqRucHQiIi4dD7XYjTKjOA4E9/YSGQHnmRhQj/rjVOu/4uMYuosNcx+2GjQ2kyTRvrFfbWyjZX+SX1R27LJnJfItN9XGc976K0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763724090; c=relaxed/simple;
	bh=y4t8FG7lyATJtAxjJIAW/+PMlp01lrqmJTD1ZkLXxZc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JFrpw8zF3ovprHvcqXAHBWVRdv5N6d5PYV1pEViWrzaEmWJ10ZKF5JKlsnG9FCu+pqsP/jCQZyMDvWqOK4GtwhC3zz18VkpG0AQZLnkx07/u4TCl+/LhALkAWfhJ2HLytUbRHlHPibSr9m6o5RxZOKG9QmO7sVNSmfo6sd8QxpM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AkIld1bL; arc=fail smtp.client-ip=52.101.201.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AkIld1bL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=puFTvBv0vsabLToYSa8s0ubgl2u32LwXioxh2E80iLHFbruTt5r3pWDJvPI3spYh3Dd4ax+LF5qluGVQ1fudh/qKjPkij+5cGuefIXcRlCsWpCV/vLR0wByjETxi/HHABpE8YIlWumcASEOo7wJgI8b/bI7/C8PWbEAlqvyeWY7PQMLeJvbUXI6bD0W4YhLFpNj+lHFtKspjxXNokEm16iZIFkl3RhM/b/fPAz2epqKqfr081xAYWkd0pVfE8I4oSz1gtPGu5JnNcuBImaL7Jsq58DC7h0kPGrP2NNGcMzcCBglgpR5fT4GzCovHYbuB2OMlGsVUwe6FtGjmoQeDOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GUBhTwi7/sFrBlNUP37W5lxiU9UuVSg72Hqs/ta5fFI=;
 b=h0oFWkVVEHHWOTcN6iqDm+XH//aS6KQD6KU6I4AKn6h4xeg+K3nvr2vTMQErThbBXqfv77bZP0OAIxCd8VU2/rRq9Y9qHO14aKnn5ncJCdBKeMRuk1QkVgYDQybmvJyE6z7D3SRzLr/kU5pqaBTT6LJrnoo5MYvV7ItPrF3blDhBIMdh/Y/iTMIJPiDwNgi4HLSsSzV7nKwgPIf2QTNbLlpfn0BAa/EHraAEIhLxyzV1ZjSE6eHJGnBVd/sSfjysx/vIpK8Q5jcPVajBJRs/DjPVv/iC90XHtVAEw8AgAPJ5yidtk3YGliHYZAHiOT1jNJUVnR7TH7D+O5YexGqE+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GUBhTwi7/sFrBlNUP37W5lxiU9UuVSg72Hqs/ta5fFI=;
 b=AkIld1bL0S8+YPm520dyHVS9m2q2g9108ghqDOcMxOGXOP2g4nKZ1YjpzIjKxMHARuwcHFipiDMgQFoAP5ok0qBLYyvz6z54CFJzkJD1EUyxk8PvWzwmr5RoIuIKlEmC4aXsPjhsmw0rwB+edDk5RL7A/CJQjQ/bES/x57uS02UZkf3OibsaeWmVNhApOW0ivKfJwVHAg0Qcr3lrjvyfMoeZo90WNa2jwxQnaDo8dzkOgXFwrTMIuDpeynInhU4ox3gQsH91SJpcy0FOlOgv4pwnkAPdeH+EY4znCZ9GC7E+vb8Jz6u5JVMOxgj35R0+gveQKij8RI8kaZyyGDyORA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by LV8PR12MB9083.namprd12.prod.outlook.com (2603:10b6:408:18c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.12; Fri, 21 Nov
 2025 11:21:26 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 11:21:26 +0000
Message-ID: <29cf2c16-3a0e-42c5-a083-16f77ae5d09a@nvidia.com>
Date: Fri, 21 Nov 2025 11:21:21 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] memory: tegra186-emc: Support non-bpmp icc scaling
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20251027-tegra186-icc-p2-v4-0-e4e4f57e2103@gmail.com>
 <20251027-tegra186-icc-p2-v4-3-e4e4f57e2103@gmail.com>
 <82c8dda8-6fcb-48f9-bdaa-f3d1431e41ae@nvidia.com>
 <CALHNRZ8nCojreFCMXfbBBhWAMtmWN-04XtuW8fEsVD9bw+-AzA@mail.gmail.com>
 <CALHNRZ-CO5i9jeLkEG2cmHxcW1bcLhxcBSxjmL2euHfQy8yr-w@mail.gmail.com>
 <e6ce190e-6df7-4c36-abca-f09df3cc80e7@nvidia.com>
 <99ca4992-5736-417d-854e-379542549bee@kernel.org>
 <7f3dad08-cff5-40c2-8e7f-f6441a3d6b91@nvidia.com>
 <d5d23eb5-f43c-4e4b-9926-3fba6ffd3acf@nvidia.com>
 <CALHNRZ8vFJyfFXbxFehWA9TGkdrEUy9Wsm-DxEOT=tVbYTcU5Q@mail.gmail.com>
 <249bbe7e-e2da-4493-bdd5-8f4b17aff8fe@nvidia.com>
 <CALHNRZ8uPaKqSpFWkmYZn==Xw=rxh95Xm0_6LPN1HDj20zofqw@mail.gmail.com>
 <d16803e5-7b6d-4472-b50c-aa324cf52736@nvidia.com>
 <CALHNRZ83Q2Ha8VYoWAnqoCZQ=Fd9rtVRVLwRFxAY68ePQ29GHw@mail.gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <CALHNRZ83Q2Ha8VYoWAnqoCZQ=Fd9rtVRVLwRFxAY68ePQ29GHw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0654.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::12) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|LV8PR12MB9083:EE_
X-MS-Office365-Filtering-Correlation-Id: 25aba2fa-b54e-4f8f-5030-08de28f01c07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c3dCN0QveVdmZlFHVkhldDZsZ25ZOTJDMXhybXRpejFscmN4TUw3NFBoZ1dL?=
 =?utf-8?B?ZEZRL0hTVW9QNmlYWkQxaXdNclowTGJvR3hkVVZRNzZkTkYwVmMrQkZOU1la?=
 =?utf-8?B?cXVZR0lvRUZSZGdFMncvMWdYd2QwN3FzUi9LUy9seFVtSStiWnQ0VUJBbHlJ?=
 =?utf-8?B?OUgyWEJyRGc1dnJwMUM5bkFTdE5lQmt0SDhUNWgxL0I4eEEwY3J5VmRrMC8w?=
 =?utf-8?B?dEduRTdOaGNaZXd2UkJWS3lGYjJ0UEQ1U2FNcE9lY1JwZWV5WGJBZXdZdGF6?=
 =?utf-8?B?YTljcDFrbkdtbWtuMzNSK0ZUNUthNjFlSkhRM25RQlpsS0Y1ZWZSMmRyWUZ1?=
 =?utf-8?B?aVVEOEROdmJZY3owZmVFakdXYXREejVEbGcxdFhIdWNXekkrMVBPTWNqT2pQ?=
 =?utf-8?B?dm15Zk0zYU94RGhNNU5nZGM3eGQ1K1d6R3dHS1hYbnpaNTdZOUVVTzQxREFh?=
 =?utf-8?B?a2JPZUovb1RBNmxvTEJhWmROL3hWa1FrODF2L3hJdUd1TitGcjEyek8rZWsy?=
 =?utf-8?B?Smd0TnBqYzVnZk45aFJrUFJrcEFQWmZDdUFCZTNuZDBUYm5YWHJoakpVSDNl?=
 =?utf-8?B?Y3pucVpKaWdReHUxeEN3UllhTTVkM3pQdi9jZndPR1BFR2tSdmNFWlFHaERs?=
 =?utf-8?B?OEIvMkR6MkxOVWZtUHlXNExNM1hNWDlYQmNITE1JMGRPMThlSDZwQTdudU1t?=
 =?utf-8?B?NisxTHpNdGNFRE53ZmdhNUpmVE42cEpzNHBnY3ZrNlQ1SXdFbTZvdXRZVXhX?=
 =?utf-8?B?R1BRLytsL1FoOUNUSmwwRXVwbkRXTUh3ZlYzL3RVTWFvR2drK05nbFhLRlpP?=
 =?utf-8?B?RzRaZVBOS0ExTGZZUFRQNkFISzFmdm5ZZTZOdGNoUmdNQTJHTGJSQ2pOMnh3?=
 =?utf-8?B?Q3lXTUcycHFWbWRpMWp5cVJMZWlUdURGdGEvNGN1WVhKSzlrL1MraWlFTzNC?=
 =?utf-8?B?WXVPUHhCQVl1ZmNKeGwrZVNKWjIxenNZbDZOcVZlUjBUWTlRd2lWWlYxMHhn?=
 =?utf-8?B?U1ZKMkxhZ2pWWnhmWk15N0JoUnVEdmlrZDJnT1VSeG9XUTZpbHgwb1Y0bGVS?=
 =?utf-8?B?SzdiWjJQUGRwYmNRMWtrTkFMOVdkTStNL0FkekVqZEl1c00rd0lOQ2RLdmpK?=
 =?utf-8?B?NnE3M1ZTSFpkRndKeTBDdU1pbGd0Qlp0UXFVWUhLNm9FeWd0RlZ5eS9mWVEy?=
 =?utf-8?B?SU9CbkFzUDdRdmJpTEkvV1JjVmF2eCtIbzU5NWhzaCtxaDMvZUlDRUNEUmkx?=
 =?utf-8?B?UlZVbm1xaVkzNUIvYjk1L3lua3B1SXlldU5nbmI3ZzFIcW0xSFRWeGFJUkpG?=
 =?utf-8?B?b0pPbzhMK2xrb2JlZThSbXdZMWo1NmM0UUc2TllVTHN6SnBPRlhvQnBnRVN0?=
 =?utf-8?B?RXcvdjVqd2U4NGZ4RTQ1NTBWM2JmbnpzS0FoVlRrd1B3M2JnNndhT2VVOStZ?=
 =?utf-8?B?SGpibHVlWTZOdkdTNFFWUHYvWG9PWmptNUVUTUozKzRXQyt1Yi85bWN3ZFFU?=
 =?utf-8?B?NXFzNWlJMHNlN1FzeGxHYjNiaEpiY0pIdlE1UUllS2FaRzlmREk4R2lqVU44?=
 =?utf-8?B?NGFOM2IrdWhNT0xxVE9GOU5MNXdoTmJKdWhIczdXMUFhSVgrY0k3dVczN2xZ?=
 =?utf-8?B?S3Vpb2w4ZWtxTGQvLzgrNis4TmZWb3R1d3NNYU9FRXZvVDl1enZiTkp0bldQ?=
 =?utf-8?B?NWRDV09jUVAyMkNNQ2hVY0NPZUFrZjFBV3VDWjN3VEdDY0VvZXlaOWk2YmJD?=
 =?utf-8?B?Vkh0ZHlkTEM4VUQ3M0tyVXFoM3FZRytzRkx3bnlNV1dGSS83VlZ2KzQ1MmE4?=
 =?utf-8?B?MERVTFAwVHhQeVpLUVo0azVtL3VCRDJyMUZFcGxrRHVvR0tWZkVycjh6a2Fo?=
 =?utf-8?B?QmxtWXJQdDVNdlF5KzBCTW44U215UFpxWVc0SWtTc3VucWFucG1TQ01FR0xH?=
 =?utf-8?Q?IV8QS8EoeMQEFF7uE7mRirlZ2dRvjcnQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TS81MHB2S012TnJIWUpuQ002czF5TUp4VmE2cGdCQ3pBOWd2RGpySDlhTEhs?=
 =?utf-8?B?TmJIdmlLdmpCOGZvV0NIalVlV1FHV2ZnQ1QxTWFLOUUybEt1OXFVaGMrdkJv?=
 =?utf-8?B?dzB5THVTbXM0VnVHRnVjcVg4UFBFU0I2N0J6UmpnZkllS1ErS0xhODFFVWcy?=
 =?utf-8?B?TDRadGdkMTNaRVYvNG11ZFN4VVlmZDNKYlRTVWREeWZmSEtLU1F3dHBMTmxB?=
 =?utf-8?B?cEhlWi9zZVhIYnZSZ2JiZkJEYVl0TXJBd2xYam9DOWkrWm90ZmNpUElEYXZV?=
 =?utf-8?B?Qi9Cb2pDWFRuQ0JEQ1JQSHNCMDZjdXVobmhrbTdyYy9sTnlXcm9rNEc4Qm1l?=
 =?utf-8?B?d1o1MUJZTCthOFlKeHl2YWUxK0hBR3hkQmsvRk1CdmNFYXZsQmd3MDQvbTRS?=
 =?utf-8?B?NkFZTHlQOWN2VEVHVjZUR2V6ek92UWQvM0dYWGtZcVc1VnREY1NKZGdwa0Rn?=
 =?utf-8?B?azJmZ2JCamV4cUtqbHFETU5rS2dkSUVGQlI3NHJ5VE1JenVDNWdlZ3RKdms3?=
 =?utf-8?B?VlFVakRYRWZEVzVraWRDYnFZVUlrbk1qTWFpMEltTnVFaWxpMktOU1p4Q1gy?=
 =?utf-8?B?cWk5ZG8yTWI4dUV2cEdsMlg5S00xUG1rVWFuRTMxOHdPUGs3eUVsNTdMeU04?=
 =?utf-8?B?dXdBYlcvUXV1eEhwL2dzM2VuN05ESDd5b0Q4ODFMMTFGQ1pIQ2FNVWdFRThK?=
 =?utf-8?B?ZUIxT0VJM2EwRWEzWEFpRC9DMTNmSlRWUmhnWm16M2M2a3ZaamJCODVHREtX?=
 =?utf-8?B?ZDRqUTdYdGQ0NFhZQ3EwNVk0cGtOUjVqUzR1MU41UUFLOURBVnh6c29pMG05?=
 =?utf-8?B?L2tDU1h2WXpMK2lScE91SlRBMDNGb0RrT211Mi9sa0QweEdCYWViY3dEQUVt?=
 =?utf-8?B?UHJjUHlmeWxzUjBIYVRoUUhXM0JySkxXWVgrRzBsV3lubHhzYmtIbCt0ZHlH?=
 =?utf-8?B?SWtpQVVkYTZLei9FbVB2WFZKR0FhZys2WTFPcWR2Q0RlMWhDWW9TKzNxQkly?=
 =?utf-8?B?eCtPV05jMU1XbTl4Qk95MExnSUpVS2ZRM01YTGVaZUJYZCt1bXNvTVZXcEww?=
 =?utf-8?B?bHFvc3hiV2lLMG9Lc3NieUczd2w3b2NLS2hPOVFkaUo2ZHlMYWZ1N0lwK0Vm?=
 =?utf-8?B?NHIya2pycXJQUjhxUEhvWWVxby9HSm91OGxheUt3TFNLcTlMdjdCZE9UbWNh?=
 =?utf-8?B?d2I2aHVTaG5EUHRKOUpWbWk1NHRKM0hiWUNCMWlQZGk0S2VkMTZLWXBBVWZp?=
 =?utf-8?B?WHBsbHUzb0lYZldvSDIxVnl1RHZ5U0FuQ1VhRHd0Rjl2SmFjWVd6dnJrSXcz?=
 =?utf-8?B?aHduSk5IM1Ira3hiN2hFTSs4VG1WN2Z4MXpIR28yMmRvZVkyK1Y0MW0ySC9D?=
 =?utf-8?B?M2RjYWJNNWMvOU1oNW9MZ0VBSzZTZE40Tm0zTTRTWmRNekFNZEMxejR5ajdj?=
 =?utf-8?B?RGtGdE9Pa3plS3Y0MGg3eGxrbEpnTDM5bExnSzJIT0xWV2ZvWm5QaVd0QzEy?=
 =?utf-8?B?SHRJUGt2QTVjblRhbFFhNzVGSFp3NC9MTmJWWVUydldmTjlRaHZ0RDdRNTRU?=
 =?utf-8?B?UEV5QW9HbG5lSnp4ZzQwNG1WVW9INCttSHJ3dEJPZWV4ZkJlY0M4YU9VV05t?=
 =?utf-8?B?M3dya1o4cWdOZk0yeTVSK3VGUExWTElzdkp5NzZUMy9jajNCRURQSFhmWGdJ?=
 =?utf-8?B?NHp6L3JhRVdvZ2xGWTZQdGE3SE5MZkh1ZElma1pzdmducVJtSHh6ZmZYTVRK?=
 =?utf-8?B?OWZ6Vk1QUjhXa1hIQXZsSHRocmZ2TWx3T0ZCSWp5dUpaS0RyajRzL3htbGxY?=
 =?utf-8?B?Q2VQcnNIMEpZeWFUeFYrWU1jd2xuNTF3a1RmZGUvZ25SbDJKcVFLUGNQUFJM?=
 =?utf-8?B?T2JWY0d3ZXRadzBDck9rcXhuaVhnVHozWWpJZkNLU1pWZ2dpYTdacnBZS1FV?=
 =?utf-8?B?N2djbzIveFdiUlorejhEVDkrSkJtUGE1UXZWWTRMdFE5dTNxZm5ndDdva251?=
 =?utf-8?B?T3JWczNoRHhSRHRPd3ZKZThBUzdBWlB1Mk9TQnFIbm45MWozeG1yRHJCR04r?=
 =?utf-8?B?eUx6czFiZFMzc0JOTGUzR0Ewbms3VC9XL0xZMXpsSzNYa2lYM0hZNWd0TlZq?=
 =?utf-8?B?bDBpK01nRFVrT2l5NmFyMEZlZzVHa2FJSkRHSG5yMHJObHhzemZweXk2b1RY?=
 =?utf-8?Q?rwZa0Q/9q6/gsf0GkCygS3Np0a8ECpxvPz0JPzXxD7BV?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25aba2fa-b54e-4f8f-5030-08de28f01c07
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 11:21:26.3048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sVIRL/kxb0lGRnRlDIREBwQdq+6zkjbmB2isqX0KXRSGHUW5SljovcMvVCJnk1x/7UTJcB0M1s3XgYAAYkfqIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9083


On 12/11/2025 07:21, Aaron Kling wrote:
> On Wed, Nov 12, 2025 at 12:18 AM Jon Hunter <jonathanh@nvidia.com> wrote:
>>
>>
>> On 11/11/2025 23:17, Aaron Kling wrote:
>>
>> ...
>>
>>> Alright, I think I've got the picture of what's going on now. The
>>> standard arm64 defconfig enables the t194 pcie driver as a module. And
>>> my simple busybox ramdisk that I use for mainline regression testing
>>> isn't loading any modules. If I set the pcie driver to built-in, I
>>> replicate the issue. And I don't see the issue on my normal use case,
>>> because I have the dt changes as well.
>>>
>>> So it appears that the pcie driver submits icc bandwidth. And without
>>> cpufreq submitting bandwidth as well, the emc driver gets a very low
>>> number and thus sets a very low emc freq. The question becomes... what
>>> to do about it? If the related dt changes were submitted to
>>> linux-next, everything should fall into place. And I'm not sure where
>>> this falls on the severity scale since it doesn't full out break boot
>>> or prevent operation.
>>
>> Where are the related DT changes? If we can get these into -next and
>> lined up to be merged for v6.19, then that is fine. However, we should
>> not merge this for v6.19 without the DT changes.
> 
> The dt changes are here [0].

To confirm, applying the DT changes do not fix this for me. Thierry is 
having a look at this to see if there is a way to fix this.

BTW, I have also noticed that Thierry's memory frequency test [0] is 
also failing on Tegra186. The test simply tries to set the frequency via 
the sysfs and this is now failing. I am seeing ...

memory: emc: - available rates: (* = current)
memory: emc:   -   40800000
memory: emc:   -   68000000
memory: emc:   -  102000000
memory: emc:   -  204000000
memory: emc:   -  408000000
memory: emc:   -  665600000
memory: emc:   -  800000000
memory: emc:   - 1062400000
memory: emc:   - 1331200000
memory: emc:   - 1600000000
memory: emc:   - 1866000000 *
memory: emc: - testing:
memory: emc:   -   40800000...OSError: [Errno 34] Numerical result out 
of range

Jon

[0] https://github.com/thierryreding/tegra-tests

-- 
nvpublic

