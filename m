Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2047.outbound.protection.outlook.com [40.107.220.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E830D23ED75;
	Thu, 17 Apr 2025 11:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744889692; cv=fail; b=elDrgFuDLVjljwztXlw51iA63Tj3LSfca83b6+JAecvnXC2Bnn8oJ9T2m5XA9LHPym2KRtL11z/Lqg61n/o2HfFYxfJLGxb8NJAieZskcMJ6S7zQ7tlo/2/E2QjfmkfJcoE501uBtFgyUhCokk50YMBxTmVTIYWH8KAvehTt/es=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744889692; c=relaxed/simple;
	bh=SFSWGHiE0WRMQoSO/VW8Ba6m5V9a6KmuiFnBDUoVIQ4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=X4pJaSnmdxyYP55ovgc303KAOlzyRWmNSAeTbHZbcQORAPkR/ImRZLYQDEfavISPZIq4rQhE6eeAW6N9cKOO7JTzLim95m5dJAyhjo/HCnPUFaN9gXXsXFeWkh0VYlOlgY6qfIamS77VED6FavLm1xDeLHfW2bC4JP3dgA93e/k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KtXTbO1H; arc=fail smtp.client-ip=40.107.220.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KtXTbO1H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oZR95Yjwl4fNI4oXeQ71Du20t/EkBMHV3rjg+xncn5L9rFUoTz6/ycQjnkZXjJbqiOCwdvGQ4rVIZLt3e+6CTrT4A1Ohb4QyXU2QICiF00kJ3lpZ2A+b/WIJ0n6e+N6DmObsXpoSlTk+f685mc0CwqX2rhEXWNgqLF8CkO87Teq5k44clDNgbSzFsypRyoeiome0m1nhR/8j8aXhr89YzbFCYgVrkTTkdPfDfj6W9T2sS9sjHo0UWQTr/ihJFNQjZUnn5a/QfqZF/Qq/5tCumedzBJysMg+NSYIW/noeS1P6SIRHwiNKFBbZCOlDzUJ6B45YkVLGWP6qbsyNnJElTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SFSWGHiE0WRMQoSO/VW8Ba6m5V9a6KmuiFnBDUoVIQ4=;
 b=CgZ78qYt/fqcrhjtXugsUu8aJ+cRq800DF8WPO08rmsT+fbFCAODRucLGtC+9XbiH06y/Ur+/jw9bvXM1lPXoYdjQKT+bcaThp3DLXRHU5xKw9qrHXtj+czMQ04E36KC9+k+hU0TV+GzlVF/ccq4HsFl/rZ/Nu5ZSh9bHg4dis5dC/QgTq3qCxFZ7BdVEJE51VLGFRa8Kl9p3GlfGcHPjYVutc8dpgFNhgSRkNAzWLTLwNSnwwW5kZcQNdiDgmyiW9BTnuIy2s6CFqwCrD/Wbe+MxhkzoAfSNLkk94Jn7r4SpApyt0Ac+gzFsDQAx5+T2tIPM3TmbF0U0rKctV00uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SFSWGHiE0WRMQoSO/VW8Ba6m5V9a6KmuiFnBDUoVIQ4=;
 b=KtXTbO1HN2phbcbASV9lEIJntLb0KNB4MoehTcPLLhkzqnYpULT3Jn4PhYEV+SluHyYovnJKwOagj4w5EgaK7Kg8mFFE1AGquVSfRvIEc6rC8G8qaQl5mAYbr9NqWTRD685LKpbezPDUABtpeEFVFQw3mNrDDHm3/szXBWjbfnTtSdtvzd0z0OWMmCsKrSmuJmb5cHQdUGlnkE7+r7E9GAZe2Rd6ySCR19JTcInSaNhmeY8t9yt8apR9RqDOzm2rAqcpgcDjIgaD2/eCssB/o1MFXVKeRCgI4m2IBHj8sbR4UPsEcolekDFTBciRNw1cET+6f8uirmaCZ8uxhGiKfg==
Received: from PH7PR12MB6418.namprd12.prod.outlook.com (2603:10b6:510:1fe::18)
 by PH7PR12MB5619.namprd12.prod.outlook.com (2603:10b6:510:136::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Thu, 17 Apr
 2025 11:34:48 +0000
Received: from PH7PR12MB6418.namprd12.prod.outlook.com
 ([fe80::c212:c319:304e:bb09]) by PH7PR12MB6418.namprd12.prod.outlook.com
 ([fe80::c212:c319:304e:bb09%3]) with mapi id 15.20.8655.022; Thu, 17 Apr 2025
 11:34:48 +0000
From: Robert Lin <robelin@nvidia.com>
To: Jon Hunter <jonathanh@nvidia.com>, "thierry.reding@gmail.com"
	<thierry.reding@gmail.com>, "daniel.lezcano@linaro.org"
	<daniel.lezcano@linaro.org>, "tglx@linutronix.de" <tglx@linutronix.de>,
	Pohsun Su <pohsuns@nvidia.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Sumit Gupta
	<sumitg@nvidia.com>
Subject: RE: [PATCH v4 1/3] clocksource/drivers/timer-tegra186: add
 WDIOC_GETTIMELEFT support
Thread-Topic: [PATCH v4 1/3] clocksource/drivers/timer-tegra186: add
 WDIOC_GETTIMELEFT support
Thread-Index: AQHbr3uLybnCKRqXkE6OC62X28+DLbOns3yAgAAEIoA=
Date: Thu, 17 Apr 2025 11:34:48 +0000
Message-ID:
 <PH7PR12MB641816B01C956C123FDC5C09D9BC2@PH7PR12MB6418.namprd12.prod.outlook.com>
References: <20250417093110.2751877-1-robelin@nvidia.com>
 <20250417093110.2751877-2-robelin@nvidia.com>
 <6456eb35-3771-4820-b316-3b5ba6c74453@nvidia.com>
In-Reply-To: <6456eb35-3771-4820-b316-3b5ba6c74453@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB6418:EE_|PH7PR12MB5619:EE_
x-ms-office365-filtering-correlation-id: c5fd588f-f14c-4321-2d49-08dd7da3dc04
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WUVCeUdWOGJiai9TYzc3bUdGR1VWN0xla3cvMXAyaVdEbGIrMGg2VzRiQ1JW?=
 =?utf-8?B?aTAwcDhBME9xZXh0RE1Cak1QODFjV0FPT1YwdG1vK09DaWNEUUlwQlMvb1pF?=
 =?utf-8?B?ZEg4MUQ0TGZTbFo4RlJGMllMV3NaV0R1TzJkREFJekl5Y0lpU1pLNnBaYW03?=
 =?utf-8?B?QVlpSmRaeWhYK1UyM2Y0SlAzSHl0bFFlTVB2anY0dkcxMEJmakJ2TXlzeENY?=
 =?utf-8?B?K3dOOWwvZUQvR3MxTGVORFZBYlllaGlWZ2p4VkJnU0ZpUlN6Y0ZmdHcrWFor?=
 =?utf-8?B?aG1jYWJyM1I0eDd0Z2g1T3p6VVFNcGdITVIwRkFRWnFXTk1KdmI1Q2VTNHVs?=
 =?utf-8?B?WndMbXpVc1Z2VmRTSk9FdnlNamlHdW9DVzZUNExMOTM1NWcza1JDcUhha3pV?=
 =?utf-8?B?UWx2SUo1MkE1M2FBUXQyNXozS2ZlczgzMmwza0crNG4wUldpK0FxUnh2aGVj?=
 =?utf-8?B?Qi9RYkFQOWkraXBhK21xNWk1TjRSaVFoRFl0QUZac1FEU1dUc1MxWjFMUUwz?=
 =?utf-8?B?WE1ESkxDR054TEtYTnN1WEdaUUVKbitISEtSWTFTeVplMEtDdjVSbW15SmEy?=
 =?utf-8?B?U2t0cGVxU1dUSmJKNjdEV05LL1RITVVuN29NYkZON0dRRzZEVnZuQ2E4Zzh2?=
 =?utf-8?B?WlRXSDVDT0hiRlhGaWJsMUhmRlpSbGY2R1BHNzlGOHNRVG1PQ0xPL3RoZEM5?=
 =?utf-8?B?MTdqclN6S0R2N2hzZERITXZhZU4vb3NWeS83eWkvSHV1eHc3dUl0U20yR2Jy?=
 =?utf-8?B?cWFiN3lBMkVUZXJYcFBBNXhYVDlKYjFjWWtmZkRGOVU0NVJHMXlZODliL0Qy?=
 =?utf-8?B?aTI3YXJjZENIcXFvTTkzMndqWHBFNG1HbjhwZHlkMTg1c1pEZGw0cEhwaVNn?=
 =?utf-8?B?VHpCdE9yc2w1RXhWM2RrdzVMSXRZS2lvNWVqMWRUb2ZKR1k0S0xaOVNQTVFt?=
 =?utf-8?B?bjFEQnpIZ2hka0s0ZkdVQnRqRzlPWldxYVRqNnpURGpQTWE1b1JXYUFHdHM4?=
 =?utf-8?B?eTRKM0p2N3NPUW1tZnU2K2xpbjhSZHRLQkZZYURZWVFCYWRrQnZCM25GaVRw?=
 =?utf-8?B?MzZ4d2ZlRm53MlRHMXo5MU9mazVONUVwYnVKd0ZhUUx1U3FQakdha1lGRklN?=
 =?utf-8?B?Mm5tQVRtdmVvRjhXZnBmSkJrdHFMWjY0ckVMdTFBY2s1SXpSM3dMREJPNUd4?=
 =?utf-8?B?bUcySStkRWIxbjArWkwrdUV4UlkwUzg0S0lTdll4ZnhVellSYzBxOE1OK1dq?=
 =?utf-8?B?THk2UmNoUDZQS2lJdUlVaFM1czJtVjJLemdrb1gzVkNSM2dtRnRmNXZ2NElO?=
 =?utf-8?B?bElLZzAvSDlEWUxOcG1uMytsL1A3dTJNRHhVY09pU0kyYjFqaG96RkdBdkpo?=
 =?utf-8?B?ZGFGdWtUblRnMHVxdXljYk5CWW1hV0ZXZjdOV0ljWi9YRXJoNHJZTzNxMEZ1?=
 =?utf-8?B?eVV2SXJROG04UkprK3pqck9MOFVTWXVXV3VQNEMvaUhWRmpnTy9neDJ0ZXgw?=
 =?utf-8?B?cnF0TVJ1eWNmL2QrSjUweG9pdnR3Vk1BdTlhZEZkMDlhOWtGSzVweDZJSTlP?=
 =?utf-8?B?d3NTbm0xWHNzNHRYVi9aWWZodXpiSnluUElKellsMHFRaHJrK2MwUHl0ZlFT?=
 =?utf-8?B?SFcwRGpxbDBESVZOazRlMkMzckJjRnJGTjNtSFMxbVBqUk8rZmhGYXVqTlEz?=
 =?utf-8?B?V21Nbm1SWWJ5YVFFY09iUDBvRURzWDlsMnNZSXZkL1I1NkxNdTY4K1Q0MmlF?=
 =?utf-8?B?VktjS3hYZTlHd3kxNU5wNllCTjE5TW9hUkxPdTRmTU5tbjhSVk04UG9PN2x0?=
 =?utf-8?B?OCtNYW5WczZBMFp4OWxYNXlMNkJhVGdqcStOWk14L2JkclNrMUgvWHU3VnZ5?=
 =?utf-8?B?TmtVS3NWMlBCNVFsMzVJSTdsTFQ1WHZhVEdPY0tkME5uSXdyc255bzlCMEJV?=
 =?utf-8?B?bnlXSHpzYi8xTStxeEkxbnIzUVpzTjNGSFJVaTQ2dzJCTjBsR2ZHSlY4MmNp?=
 =?utf-8?B?RERjODBuVll3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB6418.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?amhnZlF6R0pxSmVlSGNpd3BJRW9TRllHUytQaTVoUjFNaXlKTFM3TUU0Y2JY?=
 =?utf-8?B?WGlTSDlOelkwVzBocWNGVTFaeEVIUnZDY25nbnVsZ3FiU01BVE05dGgvbmxB?=
 =?utf-8?B?Zi84blp4WnpEamYwYXlmRnVuck1ZUk5oaG5mZmpnaFplLzdWVUY2WitUNzZE?=
 =?utf-8?B?S3p3NEtEMnlINi9zSmtQc1daL0ZlVjdjTVdCbUczcDNmTTltSDNHYURYL2t5?=
 =?utf-8?B?V1pqaVRwVTFDVjkwblpFamgvNjFRVW1FS0VyalJuZ3NYbWRjOUxrTG51LzFx?=
 =?utf-8?B?YzhMM0J4RVFxR0tKd2hZY1V1c3FnT1RKd21BZG1MZEFZdDRkQ0pQbCtPdlU2?=
 =?utf-8?B?SHdxMEs0eFA0eThWdGI4a1Z5V0JOWTBRdXJ4dCthTitITUFwYms1VDQ1Rldt?=
 =?utf-8?B?RzJOdUNFMHMySTRpdDVROGI5N09HTnVWTmx3eWJuM2szc0NqZ0ZzdmlBU0Vu?=
 =?utf-8?B?aUNWTWNoVkx3NGZXbUZNUkdGR3VBcTVHSjRSVjdQc041Rk9idHptVHRSQWlv?=
 =?utf-8?B?NHpnd3RuWGliSzFwc2lreTI4S3l1azhHUDE2ZHpDU2lHTzFVZ3JleFk5U28z?=
 =?utf-8?B?MFBhMTg1SWRmVjRLalpwN0N2MkZKSEFWS1A1eEZicDlKVmdhTFhHRDkxRVV3?=
 =?utf-8?B?Ukp1UXozWXQ5V01tR3FyNmwxZzBmZHZkQ01sZks1LzdZWEtaZndHWm43WENL?=
 =?utf-8?B?YkxiMFFheHRhRWZLcDhkK2ZKMmxHVmpRVzZ4dklOSWxtQm02VGczUUJUUXgr?=
 =?utf-8?B?SDJta2ljdFl5ZURJZy9SOGk2ME8zSThWeWlFWENnZlhhZFZ1K3VQWjJOVUo5?=
 =?utf-8?B?ZENnb2t3aXJISCtOS0h0MDREODhtM0hPM3p2YWRqNnFub2J6Z0pUZDVVTzdD?=
 =?utf-8?B?UjFzQUJlN05QTlYzQmZ2UDRmSEZNeGlPenlIRUwvM2RnNGtEalhVZU10bGdJ?=
 =?utf-8?B?d2srRk1LM3dDMlRQemNJY0QyQ0FsTHpCWnR4cjNUc3R1UGY4RnpCMGh5ZTJq?=
 =?utf-8?B?NHZRZGZDMDIyWS9qQll3ZUxTaEk5QjMxZ3QzWlo0bk10VFNVT3dmUDdRMDEx?=
 =?utf-8?B?aXp6ZHlwTzdwQlNxMmdCY1czdTNnMEhSdzQrV3NMT1lHWlFOY3pYYyt4c2FU?=
 =?utf-8?B?MzAyV0xxZVU1dk5DRWJOUkZCN3dBMmZyeWlCZ3pjWW5iSVVHYWRuN0p5eFdN?=
 =?utf-8?B?NWJ3MXhqZms4cmxRU1E5OVBGejk0dGJVOFlXOHhqejg4K0hxN1lSazZLTldH?=
 =?utf-8?B?ZU1kUUp1NmdBbXVkdFJXR3dGbkNwNWhLNy8vdnpOaHV0YXgrcE5rZUR4MEJp?=
 =?utf-8?B?SHY1cFBKZXhPMS9kRDZ4RS95bExEVEl2WmpaT25tSjNZdlhHTVlrMmlwdys3?=
 =?utf-8?B?cVZWZlIyVU1UZzBkYUZ2bDREMDNtdThsbkg3UnptZkhmdWFFY2d5Smk2K2Fk?=
 =?utf-8?B?MHlsaW9waDZpR21Id1dGQnR2NjFjNlEzWGNwMmhBL0tQdWl1OUZNL0h2ckk4?=
 =?utf-8?B?ZCs1YzZ4bis4amxydkZkV20yR1FQMk1URDk3czJDOFNmM1dPUzFwcUFFRU1x?=
 =?utf-8?B?MG5kekZQYURBZlh2T2pJSXN5TGpvcGU0REdJWjdPcm1iMUl4Ti8wNFMySHJw?=
 =?utf-8?B?blo5N0xQQzNSOUF4Snk1MzNESWdxNUdDM0hlK1Q4RjNsT09WRis5QTUvKzgz?=
 =?utf-8?B?OUZPaWdmMzh6MFlUWHNQVytLeGl1a21hemhNd3F3WjdZWCtSK0puWWptV3BI?=
 =?utf-8?B?dlZkckFQaUsvQTNIbFFKQ3B0NDN5NTErNzJBRHR3LzkzbW44VlVwMEp6NUdr?=
 =?utf-8?B?MFlWcEx5V3pJN2JkRC81RkJFdHFUbU94bzNQL0pzeUFPeVBzT3c0WHd6N1R0?=
 =?utf-8?B?QmhERE1PVWZZYWN6Z1hINi85Q0RNWEhnVnorTkF3K0IzYkgzcUV4cExuUGww?=
 =?utf-8?B?eXFLL0NodzJzdUFNKzV6dTEyNUNPM2NGTzhEYVE5SDZKY2t4eEVWZkRDVDAx?=
 =?utf-8?B?TGVxSW0rVmd4V09kUnNUTW85MzJoWGZEYTkwam9QWGpJOVplWVhRWmlCeVNn?=
 =?utf-8?B?b0lJWnNFcjZlQ2g2dzVoRXozcGxOWHNsVW9sLzlEdGJkVnU5bnB6TjJsTUpn?=
 =?utf-8?Q?wAOM=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c5fd588f-f14c-4321-2d49-08dd7da3dc04
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2025 11:34:48.0404
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pkzjAinedaZn7hUlbIm8b4V0NO+OlGHzOrTcPEySjFnbIFnvMrIffwdPp54ASd3+gBcjMh4xgWrjTCBRkjL7Cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5619

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSm9uIEh1bnRlciA8am9u
YXRoYW5oQG52aWRpYS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBBcHJpbCAxNywgMjAyNSA3OjEw
IFBNDQo+IFRvOiBSb2JlcnQgTGluIDxyb2JlbGluQG52aWRpYS5jb20+OyB0aGllcnJ5LnJlZGlu
Z0BnbWFpbC5jb207DQo+IGRhbmllbC5sZXpjYW5vQGxpbmFyby5vcmc7IHRnbHhAbGludXRyb25p
eC5kZTsgUG9oc3VuIFN1DQo+IDxwb2hzdW5zQG52aWRpYS5jb20+DQo+IENjOiBsaW51eC1rZXJu
ZWxAdmdlci5rZXJuZWwub3JnOyBsaW51eC10ZWdyYUB2Z2VyLmtlcm5lbC5vcmc7IFN1bWl0IEd1
cHRhDQo+IDxzdW1pdGdAbnZpZGlhLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCAxLzNd
IGNsb2Nrc291cmNlL2RyaXZlcnMvdGltZXItdGVncmExODY6IGFkZA0KPiBXRElPQ19HRVRUSU1F
TEVGVCBzdXBwb3J0DQo+IA0KPiANCj4gT24gMTcvMDQvMjAyNSAxMDozMSwgUm9iZXJ0IExpbiB3
cm90ZToNCj4gPiBGcm9tOiBQb2hzdW4gU3UgPHBvaHN1bnNAbnZpZGlhLmNvbT4NCj4gPg0KPiA+
IFRoaXMgY2hhbmdlIGFkZHMgc3VwcG9ydCBmb3IgV0RJT0NfR0VUVElNRUxFRlQgc28gdXNlcnNw
YWNlIHByb2dyYW1zDQo+ID4gY2FuIGdldCB0aGUgbnVtYmVyIG9mIHNlY29uZHMgYmVmb3JlIHN5
c3RlbSByZXNldCBieSB0aGUgd2F0Y2hkb2cNCj4gPiB0aW1lciB2aWEgaW9jdGwuDQo+ID4NCj4g
PiBTaWduZWQtb2ZmLWJ5OiBQb2hzdW4gU3UgPHBvaHN1bnNAbnZpZGlhLmNvbT4NCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBSb2JlcnQgTGluIDxyb2JlbGluQG52aWRpYS5jb20+DQo+ID4gLS0tDQo+ID4g
ICBkcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXRlZ3JhMTg2LmMgfCA1Ng0KPiArKysrKysrKysr
KysrKysrKysrKysrKysrKystDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgNTUgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xvY2tzb3Vy
Y2UvdGltZXItdGVncmExODYuYw0KPiA+IGIvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci10ZWdy
YTE4Ni5jDQo+ID4gaW5kZXggZWE3NDI4ODllZTA2Li4yMDFiMjRjYTU5ZjQgMTAwNjQ0DQo+ID4g
LS0tIGEvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci10ZWdyYTE4Ni5jDQo+ID4gKysrIGIvZHJp
dmVycy9jbG9ja3NvdXJjZS90aW1lci10ZWdyYTE4Ni5jDQo+ID4gQEAgLTEsOCArMSw5IEBADQo+
ID4gICAvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5DQo+ID4gICAvKg0K
PiA+IC0gKiBDb3B5cmlnaHQgKGMpIDIwMTktMjAyMCBOVklESUEgQ29ycG9yYXRpb24uIEFsbCBy
aWdodHMgcmVzZXJ2ZWQuDQo+ID4gKyAqIENvcHlyaWdodCAoYykgMjAxOS0yMDI1IE5WSURJQSBD
b3Jwb3JhdGlvbi4gQWxsIHJpZ2h0cyByZXNlcnZlZC4NCj4gPiAgICAqLw0KPiA+DQo+ID4gKyNp
bmNsdWRlIDxsaW51eC9iaXRmaWVsZC5oPg0KPiA+ICAgI2luY2x1ZGUgPGxpbnV4L2Nsb2Nrc291
cmNlLmg+DQo+ID4gICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+DQo+ID4gICAjaW5jbHVkZSA8
bGludXgvaW50ZXJydXB0Lmg+DQo+ID4gQEAgLTMwLDYgKzMxLDcgQEANCj4gPg0KPiA+ICAgI2Rl
ZmluZSBUTVJTUiAweDAwNA0KPiA+ICAgI2RlZmluZSAgVE1SU1JfSU5UUl9DTFIgQklUKDMwKQ0K
PiA+ICsjZGVmaW5lICBUTVJTUl9QQ1YgR0VOTUFTSygyOCwgMCkNCj4gPg0KPiA+ICAgI2RlZmlu
ZSBUTVJDU1NSIDB4MDA4DQo+ID4gICAjZGVmaW5lICBUTVJDU1NSX1NSQ19VU0VDICgwIDw8IDAp
DQo+ID4gQEAgLTQ2LDYgKzQ4LDkgQEANCj4gPiAgICNkZWZpbmUgIFdEVENSX1RJTUVSX1NPVVJD
RV9NQVNLIDB4Zg0KPiA+ICAgI2RlZmluZSAgV0RUQ1JfVElNRVJfU09VUkNFKHgpICgoeCkgJiAw
eGYpDQo+ID4NCj4gPiArI2RlZmluZSBXRFRTUiAweDAwNA0KPiA+ICsjZGVmaW5lICBXRFRTUl9D
VVJSRU5UX0VYUElSQVRJT05fQ09VTlQgR0VOTUFTSygxNCwgMTIpDQo+ID4gKw0KPiA+ICAgI2Rl
ZmluZSBXRFRDTURSIDB4MDA4DQo+ID4gICAjZGVmaW5lICBXRFRDTURSX0RJU0FCTEVfQ09VTlRF
UiBCSVQoMSkNCj4gPiAgICNkZWZpbmUgIFdEVENNRFJfU1RBUlRfQ09VTlRFUiBCSVQoMCkgQEAg
LTIzNSwxMiArMjQwLDYxIEBADQo+IHN0YXRpYw0KPiA+IGludCB0ZWdyYTE4Nl93ZHRfc2V0X3Rp
bWVvdXQoc3RydWN0IHdhdGNoZG9nX2RldmljZSAqd2RkLA0KPiA+ICAgCXJldHVybiAwOw0KPiA+
ICAgfQ0KPiA+DQo+ID4gK3N0YXRpYyB1bnNpZ25lZCBpbnQgdGVncmExODZfd2R0X2dldF90aW1l
bGVmdChzdHJ1Y3Qgd2F0Y2hkb2dfZGV2aWNlDQo+ID4gKyp3ZGQpIHsNCj4gPiArCXN0cnVjdCB0
ZWdyYTE4Nl93ZHQgKndkdCA9IHRvX3RlZ3JhMTg2X3dkdCh3ZGQpOw0KPiA+ICsJdTMyIHRpbWVs
ZWZ0LCBleHBpcmF0aW9uLCB2YWw7DQo+ID4gKw0KPiA+ICsJaWYgKCF3YXRjaGRvZ19hY3RpdmUo
JndkdC0+YmFzZSkpIHsNCj4gPiArCQkvKiByZXR1cm4gemVybyBpZiB0aGUgd2F0Y2hkb2cgdGlt
ZXIgaXMgbm90IGFjdGl2YXRlZC4gKi8NCj4gPiArCQlyZXR1cm4gMDsNCj4gPiArCX0NCj4gPiAr
DQo+ID4gKwkvKg0KPiA+ICsJICogUmVzZXQgb2NjdXJzIG9uIHRoZSBmaWZ0aCBleHBpcmF0aW9u
IG9mIHRoZQ0KPiA+ICsJICogd2F0Y2hkb2cgdGltZXIgYW5kIHNvIHdoZW4gdGhlIHdhdGNoZG9n
IHRpbWVyIGlzIGNvbmZpZ3VyZWQsDQo+ID4gKwkgKiB0aGUgYWN0dWFsIHZhbHVlIHByb2dyYW1t
ZWQgaW50byB0aGUgY291bnRlciBpcyAxLzUgb2YgdGhlDQo+ID4gKwkgKiB0aW1lb3V0IHZhbHVl
LiBPbmNlIHRoZSBjb3VudGVyIHJlYWNoZXMgMCwgZXhwaXJhdGlvbiBjb3VudA0KPiA+ICsJICog
d2lsbCBiZSBpbmNyZWFzZWQgYnkgMSBhbmQgdGhlIGRvd24gY291bnRlciByZXN0YXJ0cy4NCj4g
PiArCSAqIEhlbmNlIHRvIGdldCB0aGUgdGltZSBsZWZ0IGJlZm9yZSBzeXN0ZW0gcmVzZXQgd2Ug
bXVzdA0KPiA+ICsJICogY29tYmluZSAyIHBhcnRzOg0KPiA+ICsJICogMS4gdmFsdWUgb2YgdGhl
IGN1cnJlbnQgZG93biBjb3VudGVyDQo+ID4gKwkgKiAyLiAobnVtYmVyIG9mIGNvdW50ZXIgZXhw
aXJhdGlvbnMgcmVtYWluaW5nKSAqICh0aW1lb3V0LzUpDQo+ID4gKwkgKi8NCj4gPiArDQo+ID4g
KwkvKiBHZXQgdGhlIGN1cnJlbnQgbnVtYmVyIG9mIGNvdW50ZXIgZXhwaXJhdGlvbnMuIFNob3Vs
ZCBiZSBhDQo+ID4gKwkgKiB2YWx1ZSBiZXR3ZWVuIDAgYW5kIDQNCj4gPiArCSAqLw0KPiA+ICsJ
dmFsID0gcmVhZGxfcmVsYXhlZCh3ZHQtPnJlZ3MgKyBXRFRTUik7DQo+ID4gKwlleHBpcmF0aW9u
ID0gRklFTERfR0VUKFdEVFNSX0NVUlJFTlRfRVhQSVJBVElPTl9DT1VOVCwgdmFsKTsNCj4gDQo+
IFRoZSBhYm92ZSBzYXlzICdzaG91bGQgYmUgYmV0d2VlbiAwIGFuZCA0JywgaG93ZXZlciwgd2Ug
bmV2ZXIgY2hlY2suDQo+IA0KPiBJIGFtIHdvbmRlcmluZyBpZiB3ZSBzaG91bGQgLi4uDQo+IA0K
PiBpZiAoV0FSTl9PTihleHBpcmF0aW9uID4gNCkNCj4gICAgICBleHBpcmF0aW9uID0gNDsNCj4g
DQo+IFRvIGF2b2lkIGFueSBvdmVyZmxvdyBsYXRlciBvbi4NCj4gDQoNCldhcm5pbmcgZm9yIHRo
ZSBiYWQgdmFsdWUgc2VlbXMgdG8gYmUgZ29vZC4gQnV0IGZvciB0aGUgcGFydCB0byBmb3JjaWJs
eSBib3VuZCB0aGUgdmFsdWUgdG8gNCwgSSdtIG5vdCBzdXJlIGlmIHRoaXMgbWFrZXMgc2Vuc2Uu
IFVzaW5nIHRoZSBiYWQgdmFsdWUgZnJvbSBXRFRTUiBvciA0IGJvdGggbGVhZCB0byB3cm9uZyB0
aW1lbGVmdCB2YWx1ZSBhdCB0aGUgZW5kLg0KDQo+IA0KPiAtLQ0KPiBudnB1YmxpYw0KDQo=
