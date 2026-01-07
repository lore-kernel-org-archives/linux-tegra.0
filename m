Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011061.outbound.protection.outlook.com [40.93.194.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6311A0BD0;
	Wed,  7 Jan 2026 06:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767768918; cv=fail; b=d3ORcr0JdNhlyV7fWPm/34wmFL/qmVMrYK44Oiaq1v57zKO8VxERYscoN7gU/0KvpLKWhvv0N6GUGrRLQn5Nb0qX75vanLvwFmAzRJcCy0Fg4XiUO5fkAOrXuafmrAdC/Xhv1Gb9vq9BFmrF6SIB3sTJsMLLZ6a/Bv2xMWQ0oTM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767768918; c=relaxed/simple;
	bh=JWKCVwmN8Pu6ukRhfKaWdWJJFRQCMdR9e8ry7Hd/BLs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=M32BEEzGazLBabYEiPv8cDG35c3/TRHN6Vbn+suuLf6VmcimRyTQqO0aavtecPhiElrGxB1XTrm0yN18xLeb3attt0OD9rpdkj8DIeiBXuLG7QhidIJIHXKrVoYZvh3K1S8nFoKuuQXrG5S7bLDN/04xhq1bMf/ogvPTIC8xYGY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IYsVyPp+; arc=fail smtp.client-ip=40.93.194.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IYsVyPp+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BZSTJruWTgkR7dowcyxkYiw0XgSjX2EpcmGI+VIPvSGXlJCrFOe8zQ0hSCWpN32Z4kpwu80ledtV1LLcDKFVV1EuBx9Z5O+efn+MkyZfr7YRwwyJQAUdJAbJgCsqJEldavxHwLC8au84wZkDqSMgtoHVaZoXpe0zn4mPaL1vn0ZYiViaoPz5ol6x8PVgO08qWd2SVGLxwjhLfYdUcRrORwBSfVDZdwdZA2NmEPDlSPG0c/4pLrwNTlyuL0gkS2QIU/T++Xf9j3kQzxpo6osnkD9HyB/jBLZMOLk/kmjJqD98aT9GFNPLUyqc/efa1NZ5rAK+bXXhmDkTwDcFXj7r6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=txvZ8Dzzei5eT/DLVrNgp5uGL6OFxww2+gEN1Bp+DIE=;
 b=OuK4ju1rrdYzpViCvrRsErtv0QhMyR+p7488BIg2yL1guSdaysIKPqNr+aVezKJqYiRpHx2fd2UHtx65q8SSZ5voiADCf8FG8AGUAGsELWqdfDL18nqDZIeJg1/k4xzrDuNcCL0M6L7mmESn7rHptUOvVCPGwhD7SnXuXdGlDApHiRrg2umiG0etZg9IhcYRdHKiCP4fTuHGCTNCWVeCRGbi/rfxd78rseyDFA+IqYgPQrR1AW89K7ePt6BlQ2wVQMy6EsUBlLDTuGw9/0HVJlAwNw55TE8eL0/2/40TteAeL7WXTBz7VyKtv6lNbUIgkcTeWZTBYElzOlK0aEFX8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=txvZ8Dzzei5eT/DLVrNgp5uGL6OFxww2+gEN1Bp+DIE=;
 b=IYsVyPp+f6Hss/ztiltYukyscISJ2s6q3OD/StqpyNWGncDIoUK9JuPOKutkp34O4Ih1Hywt9F252PQySh9cs80VCSfb86nlE7WjsfzpD07YZa8uNUNIf7xrOm7CVSTKNzwyGLP6DUAGv/2iowpjbOEnY9ObnPFgdF0lCWB5XXvQzAOyNJbjTzKHUxzmXggWbymUnIsq2BaY4HYEecV643nt5/E6LOQCSHvY8jsI49dIS5JN2AaEqKtC29fw0nvtCXsZbLGDJ7x6EDSCZUYb9W/sAs69t2z+uC8QUQaxwEBELaFSR28FDuoF3WCZEOM18SCNg92pV0IbyFIXZAH+SA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB7697.namprd12.prod.outlook.com (2603:10b6:208:433::19)
 by CH3PR12MB8660.namprd12.prod.outlook.com (2603:10b6:610:177::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 06:55:12 +0000
Received: from IA0PR12MB7697.namprd12.prod.outlook.com
 ([fe80::ba90:84ea:b974:7932]) by IA0PR12MB7697.namprd12.prod.outlook.com
 ([fe80::ba90:84ea:b974:7932%4]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 06:55:12 +0000
Message-ID: <b0032054-4eea-44f4-bf70-204fa414f297@nvidia.com>
Date: Wed, 7 Jan 2026 12:25:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/2] regmap: Add cache_default_is_zero flag for flat
 cache
To: Mark Brown <broonie@kernel.org>
Cc: Sander Vanheule <sander@svanheule.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich
 <dakr@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20260106140827.3771375-1-sheetal@nvidia.com>
 <20260106140827.3771375-2-sheetal@nvidia.com>
 <b5f70864-baf9-4590-880d-96727b7b80cb@sirena.org.uk>
Content-Language: en-US
From: "Sheetal ." <sheetal@nvidia.com>
In-Reply-To: <b5f70864-baf9-4590-880d-96727b7b80cb@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0206.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b0::10) To DS0PR12MB7702.namprd12.prod.outlook.com
 (2603:10b6:8:130::13)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB7697:EE_|CH3PR12MB8660:EE_
X-MS-Office365-Filtering-Correlation-Id: 75161db6-6bfa-49d1-bdc7-08de4db9b3ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OEVteEhpNUNwU3NzQ1VudFY1bG9KZmZ0ZnpQWCtnbnJ4LzJLaUJhQXV6TDVz?=
 =?utf-8?B?M2lXY0xwSHBJV3lNSFUrcXJoOTBBaDE5OFVGZEZtR3RSN2ZTVG5QeEtZVGdD?=
 =?utf-8?B?MTVSVTZTOEI2WkNPK3FTempLUVJvTEtPSHpwUWliU2h5SHVqaTFtN0JLZVJ6?=
 =?utf-8?B?YStYTDhTMnFoVitvbS9ua1NFcDBrcUk0bkJxWjNPTUVVdkRqWTh0bnF5M3RT?=
 =?utf-8?B?U2ZJYkxhMGJDM1UzYkpFc2JoR1YrVE8wcXZ5dFQ3UGttN0pOUnVZVjhtQ1lj?=
 =?utf-8?B?Nmk3QVI3TkVrdlJ1T0dWeStVS3BXNkFBVnRjeW5UMlk2VWhsUFpmTmtKYTZo?=
 =?utf-8?B?dG96RHF4bWdjUno4UkVEQXdiRDZKN1NkTEV4V1ZzeitmK2JqQ0tmOVFXMlIv?=
 =?utf-8?B?NmFHVm5wOGw4UmVXQnZDSGlGelNYZGJTRGQ5bEN4RDVKTWJJZDNPOTJOZGRL?=
 =?utf-8?B?TW10alNxUlhKclEwcFhGdFp3ZkZIbU1RNXd4bW5ZT1NXa1NLbzhYWmdheXlG?=
 =?utf-8?B?bkw5QXVycFpsYXowSXR1R0dBNjFVbEV0VWYraGZJVFFaek1GYUM1Vk5zVjcw?=
 =?utf-8?B?bjcxUWZCZ01oSU9sT011RXB4ZlltMGtrckozanpUbnNzeTNnRDhKSHoraUpK?=
 =?utf-8?B?Zit5MTlWc2x6UEx1M25tZXc0ZE9sTzk2d1REd0NGSWV3QTlYSlMyWk1xWUtW?=
 =?utf-8?B?UEdUWW1oa2pSYyt2NXpKSUZGTnhJNEJra2tCYU5zQi8vMnJuZkJNcGxKQjFi?=
 =?utf-8?B?ZDlqUHJDc28yb2ZtKzIwNC9sdTRQYUtwN1dsQUtZa1YwekltRTVyVVBQTE1O?=
 =?utf-8?B?Mm1kam9vMkRmSkp3aGQyWkxDRHJ5Q0VDaElNR0g1UU0rN3JnSEM2NGxwazJu?=
 =?utf-8?B?SXhqYXlaYkJHT2o0MlU1VTl3MXgvT3E4TDVOR2E1bmVVZnBNQWh0OXhseVFY?=
 =?utf-8?B?cUdGRGhPVHdmeUxadWFIQzM4NXE1b0ZzeFRNK2JwNFI2a0p4dCtkOVYvaThu?=
 =?utf-8?B?ZjJXRGlicnowem9QT3RZTFVWMnlkQ2thOThZYnQzVGMxM2tBRTVKMWV6ZWRI?=
 =?utf-8?B?b1EyTHR0MytOQzNoTnRpSlg5eFFSMFNHajVOZGFyUkZ0dVpBYitvRm5lY2Jt?=
 =?utf-8?B?UExXNHdrWjBLUG5qWGtjMmVuNG40U1VEWURLYmRmYnBvMG1ieFVYL25sTXdJ?=
 =?utf-8?B?YlBDNTJEZVRHcWR0aERrLy90TC9HaDh6VzYvQ1dLWWxzSFFnUFFQSmYxODls?=
 =?utf-8?B?RzJSOU54RlFKd29JU2Q5T2Q3MFNlRVZDdXV4S2tXbWw3U1c1OEJmU3kvM2ZX?=
 =?utf-8?B?OGl1dytDb21OaUZ6WVczQ29kVElQRG5iZUJkOHI0OHJ6Q0QxdUJUNlNBLzJP?=
 =?utf-8?B?ckdQSXJxTW9KWS9ROVA3dnIwUjlKU1l5WW4rQlI4ZWFPbFBaK1RQWE9IOElm?=
 =?utf-8?B?SEoxWUdoNWhRZ2pCTTZjUVZVdzk5cnlQN2dKSjVGTG44WDhhNU14NE55bUVK?=
 =?utf-8?B?RC80dEY2b1JBdGFqVUZXdnY2azc2dU05RzhwZnJEYmJhMFJkRUxoa1UxRTFK?=
 =?utf-8?B?cGZoRzFOZnVwd3huaElzdE5iNk5ONnFyeE0wVjIwTmxMVWRCK3luMXpzTTBX?=
 =?utf-8?B?a2djcDE5YXF0TXB0M1pBT05LZExXTG84anFLbHpybEZsUnlkR3JrakNiQzVv?=
 =?utf-8?B?S2Q3SlphNlRvYUx0aStCUnNZcmZwRy9ITStFK2JXQnUvOTl3SzhFdjVPOThl?=
 =?utf-8?B?Qm9Md1hJZUREMmRwRjc5QnIxQS95a0Rva2pFdEFQbXc0eVZmOU1ScTZEclZz?=
 =?utf-8?B?V05qRWZJeXNrR3lMV2E1YjNZeTk1Mm5BcVdheVZFV3doVklJbHF2cm5JbS9R?=
 =?utf-8?B?M0hET1ZjRVhKd3FMaUtWMjRLMVdHTzhBczdKaFlnUktVMnJEYTRJenpWUk9U?=
 =?utf-8?Q?crVqj66IQbJW2+U+37W6pl/tfjlcfvFN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB7697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d1hYMGhGNmhqczcybFlhVDgydzZXWnRCM0k3NWRTN0V4OFBuNXBRL3Q4OUEz?=
 =?utf-8?B?VTRVSm5KRjV4RHRVN2RnZ1Q4SUVKTm9CTTJGTjJ4K0NYbGhKVi83S0JMRnpH?=
 =?utf-8?B?czZidkxyeFNhcmtGT1kxRFFtb21PbTc5a1Bqd3VUcUxsaGJ2cUhzeEYyV2Q2?=
 =?utf-8?B?bUxxQitoOTBoeUVpdDdLbFJsZGM1V21YSmlreExzcHNJYjA0bDRGTTNETDFO?=
 =?utf-8?B?OWdxTFJMY1JHZDBxVXExeG5tMllUak10V2dlckFJa1dqOUtOeFJvUlNQN25m?=
 =?utf-8?B?aFlqVGk0dzRMaE5VU3hObDRmWnJDbmVhUVIzN0JQZ1o4bHdmL1VCc3o0K05M?=
 =?utf-8?B?TzVyRlRDdGRxbEQ1a3BIZlJqWXY3eWsyNW1OU0RYeGNMNzRqRVl4WGZ5Tmgx?=
 =?utf-8?B?MlVHREhGa3U0amJXQUlnRDQzLzJpME5zK3R2dkdCbFVhL3FDR0E0Vm5GSGVo?=
 =?utf-8?B?Ty9LMmJVKzE3TWVLaEZTQ0l2aEZUclFkUlhhL1JGd0paOU1XRFFMVnRSeXN3?=
 =?utf-8?B?TjNFK0c0cDFsai9wYXdVam80aGFtQ3hvRjY2bktaTC9ua0FYK1dZdkRzSngw?=
 =?utf-8?B?SXBjdHoySUhvK3FKMzE4S28xaTVOZXUwcldFVHc3SlY3L0JPU0lBZERUWjBk?=
 =?utf-8?B?aVlPeUQ5RlRrTXF1S2ZpWldIVW5RN3RTTndTQ3FNR2VwR1ExbkZ6MjB0MlEz?=
 =?utf-8?B?ZVZmWVJNejcwanVtQ0ZaeHJQWXdoOHBsR3J2RFJQWDVJaFdESlZtVHlSNWdT?=
 =?utf-8?B?em9DZG1KNS9TSGN2WWp3dmtzMDc1OHVxdHk1SmZhd1RBT2gyM0dqVnV5WWlN?=
 =?utf-8?B?RmthTWlYOUtIcm0zNC9Sa2doazB4TDMzbnc5SlgrMUVOR2JJd2xkWXdyVkFo?=
 =?utf-8?B?V2tBVGRyaGlublo2MWhyKzRQc0NUamQ2TTNQWlI5SXBOOUlBZUd2ZVlIZTFs?=
 =?utf-8?B?WFBYREJZSXNEVFJYVk00TEZUWHIvcGJQN3lNZXczNFZaOVJnVXVsZmxXNWF1?=
 =?utf-8?B?NG0xVnJ0ZTZwNmNRam1wRFY4MDZGYUFkWEtnZWpvNjVZb042WVBKRWwwdllo?=
 =?utf-8?B?U3FhY3VJQ2cwcHlFMGd2R3oxTktXYWRlb0kzc3k0OVRwcHVxUGQ0b0RHb2Vi?=
 =?utf-8?B?cjU3RVBaVGVpSGY1d2YwVU9xbEZVSjNDeUZZSVB2eVlhYmJXenNsRlZyL01T?=
 =?utf-8?B?WDhYbmhUV21xYU5VamZGOWl4ZlZiUjgvRisrYndrZTRkbGhFdGZ6QnFENkdl?=
 =?utf-8?B?VVpNdEpERlg0MWZxTWpBVDduZ1QwZFNqamtWR2F5WkswQ0VBM3FERllvbjRn?=
 =?utf-8?B?RnIzNGZOOWo3cnFPNWNvRFgxVEp6TTFuT1Eyd1cwazVCMmVGem5pVEtoeVFi?=
 =?utf-8?B?TWpLRHlsMDU2OEIvd0l4TGpORkhMUno4TkZiSHpHeFQ0cnhyR1NKaVBGWlBC?=
 =?utf-8?B?N2hrdXpDbXl0Y1ptb1NJZTNwU0Q2MGx1Rzg1RExqejUrSnd6OU4yZzVsM1Ny?=
 =?utf-8?B?VUg4dFlYeUc3cHQ3dmRiKzRzTUVORERpcjZzSTBZQTkzanYzVk9XcnBKQnBC?=
 =?utf-8?B?U3ZaOTl3dHFLS2k0QlVUN2ZPYkdYTUh3dGkzY2NTZGFUVmNMY1JMbVFPSVFk?=
 =?utf-8?B?cjJWVTZmODVRWi9rK0dBVUt4cnhHc3BZbW5sNmMrOUxncXlaaGxhaSt6NmpL?=
 =?utf-8?B?YmUrY2x0TXlhYWhobkFZb2RLb0pCejgzK0tsbkF6Q0Q3d3VHSXpmbWYxZk10?=
 =?utf-8?B?eWlnYnlUY1ljVWtscE44VnI4d0ZXOTU0YjdSZkl5KzA1bU4zWTVOUkQyclgw?=
 =?utf-8?B?K1pUZUVTd2NyQ1hzUFQrMlE0K0pNWlc2SkpyYmdvMElzTWNEZElFZkkzNjhW?=
 =?utf-8?B?eUVnWHJNeVY5aEhQYlQ5S3hvd1RMYy9JUU9wZGRkN1gxSGRWclRzaGlmREVW?=
 =?utf-8?B?SHloUVJDVWw1bGV4NVpjd0hQM0dGSTliWDF5Q2h0bWZQTlNPeW5sMm80b2J2?=
 =?utf-8?B?S3dqc09ONDRvbHFxMU1YL3JSdjltNTJ5ZklSNHhZV2U1cjArbkFBekpJbWlI?=
 =?utf-8?B?akZzc2tKMVNvemRRL3ovUGNGODdKUnhJMloreVd5OWYySjlldFJyeDJpaUl6?=
 =?utf-8?B?SXRCVEc3WWcxRmZDdzd4VnVrZCtNaVU5SVZFbTlTMEdIU3NxZ2VZekZTVllL?=
 =?utf-8?B?d3lOZXU4V3BjZHVQcUlmL1RzRmZNYWczOE1qL2NqMUR2R3JTRWVsWlFqeURQ?=
 =?utf-8?B?U2JrQW82bnJmdEFveXpWc2tvdVExVDJOQnBPbVR5YU5KYnlnclFYMEdmWXNH?=
 =?utf-8?B?Ry9ZbzVTUUVkeE9oeTZSb3FtZTF5R1Q3ZysvTjQ4akZHWUtyN2F3UT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75161db6-6bfa-49d1-bdc7-08de4db9b3ab
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7702.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 06:55:12.0518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KrwVAcXCNelixvJ/DF+wobb9GDoleh8glBEFvUssQUf74gP+Z3Bh9MTGEDMWMpt/KDkaUfkjL5y4Alqoe4y2fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8660



On 06-01-2026 20:42, Mark Brown wrote:
> On Tue, Jan 06, 2026 at 07:38:26PM +0530, Sheetal . wrote:
> 
>> 2. No functional benefit: Entries like { REG, 0x0 } only set the
>>     validity bit; the cache value is already zero.
> 
> For sparse caches specifying the register also allocates the cache
> entry.

ACK

> 
>> Add a cache_default_is_zero flag to struct regmap_config. When set,
>> the flat cache marks registers as valid on first read instead of
>> warning. This ensures only accessed registers are marked valid,
> 
> Why do this on first read rather than than just fill the valid flags
> during initialisation?
> 


Setting valid bits on first read rather than bitmap_fill() at init ensures:
- Only accessed registers are marked valid
- regcache_sync() only syncs registers that were actually used
- Avoids writes to holes or unused registers during sync
- Safer for drivers without writeable_reg callback


>> index b0b9be750d93..bf918f88bfd3 100644
>> --- a/include/linux/regmap.h
>> +++ b/include/linux/regmap.h
>> @@ -452,6 +452,7 @@ struct regmap_config {
>>   	enum regcache_type cache_type;
>>   	const void *reg_defaults_raw;
>>   	unsigned int num_reg_defaults_raw;
>> +	bool cache_default_is_zero;
> 
> It would be better if this were something specific to the flat cache
> since otherwise we have to consider what this means for the other cache
> types.

I can address this by rename to flat_cache_default_is_zero.

