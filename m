Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2075.outbound.protection.outlook.com [40.107.94.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5621FBEB6;
	Mon,  2 Dec 2024 10:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733134159; cv=fail; b=uxpXcRt+04IB2HqB2b5GdgZdqu5NV7L0tFQScGgJmJphlK5+UVcnM6SRVjp06A9rlXVtjlb8Lxwqj37Ei81394HXedUA+sDseNcccvN8/bVNQ1Cz2Lrnf10+xoZMt+VV5w4EKLTT8XQm4gMsWa0o2df9BXmFErsS5MMExXfSoCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733134159; c=relaxed/simple;
	bh=PE7ppWrZlg7SwiazTleZrAbTBVh/1KW0vKevfVsl1s8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lgx/8MzLBrJ8qt/RQtXjoFLSsDbdSNkwKXRYlz3pLcORW5tTcimx7pl3wemvSHB9Otz/OepWt6a8jskfiS7h25O+MaoJ+tVpC40lmaHwmd2b1Y1yekcSW/i2eqIckoeJ9FMc4YE5q6l1RJv8YOKydiDQx+JNw8CtSauXQkpmeko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=iELXA4SL; arc=fail smtp.client-ip=40.107.94.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="iELXA4SL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pGePzHUuQKDL+JlwNuiDgC88o2xp7qtZW3Du6JGpCK+WqNIVt8XcwXnEkibK3dFcSvYQ/ol+NWQ5d00yZp5x724EMBAzMLrf+Xc/a4WQMVKmn9vNBxFsRobnQLBt1hlLHvSV028JqPjSCBtNSW09GTkXrBpjl4mo2HtQsK3rFhNpFsP8+DQvm7k2Y/BXFusIOovXHPUPdwB/eEtlZ05Be1IDt/4EExn5s5PgOu1FbbrgEI4rRY1dVWt9TA0rW8n8lOMiQnUCkkNwKD2hBjmOBvebTlcazfJEMpT9MQSc07bKRJ8TNkjLFroS8L8OqyeQJ2yf66cUkj297FbbUsrzIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PE7ppWrZlg7SwiazTleZrAbTBVh/1KW0vKevfVsl1s8=;
 b=velc4C4u9QodRFu2DA5DyA8oBMLhU2bbuYAyREzUoq7rSAPv4NDu3DRhALUSopnzRPTvqbU8wzACRf4+LmB1RUxYWoJGnpJgdWXvikTUrGDkqwrHGcbB4GqbURZqq1eCObmWyiHtrhQPrNMWeGwM9R7tI9owshzbXlBJQz2LOSTSjk4yaD46PX9aP6bMVTWtqksI5ZS/xp6oFDyuCAYROncHigvet+aiJR5V9plxV+19WNCG8zajGS9pHqEMxpUi0Y5FnL6Utt7q4z1rTueMYhQq83F8qceLluId4I55+prAf51dwgdPgDJ7muOMXoq9QqEchyrGd1HyQ7vbp8SDJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PE7ppWrZlg7SwiazTleZrAbTBVh/1KW0vKevfVsl1s8=;
 b=iELXA4SLLUU1T7/Z5K7kvjair8WeS549Fr+27h8SryRdHr5thYoLqfXJ1hORkUafrsZACpR36UTt7I/YBrb/Dsg8dTKTntNTM2cl91xyzsZ1IoSh7AdbLUlw6n1umoQ8H0uamPB2mpHVoP9llrzdHEJ6xz0lGW2OdQ00pAL3mnhpDCNBBuwj7hySTMPrOG+f1GX/obYFVgsKtnJjuV2aRKfNW7daOYeU1TZg9zdXazhg8u3MLnQcnONvQNxjt9fO5TbVVYy7020T0atVmIXZwEzlIxvlKSvYxnkcu9/ghBS0QUjLwXHG8dc0HI/bNTdGcT0wVI1wfBhQQWC/gNwcww==
Received: from MN0PR12MB5716.namprd12.prod.outlook.com (2603:10b6:208:373::14)
 by MN2PR12MB4048.namprd12.prod.outlook.com (2603:10b6:208:1d5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Mon, 2 Dec
 2024 10:09:13 +0000
Received: from MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::1770:161a:675f:7861]) by MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::1770:161a:675f:7861%6]) with mapi id 15.20.8207.017; Mon, 2 Dec 2024
 10:09:13 +0000
From: Kartik Rajput <kkartik@nvidia.com>
To: "thierry.reding@gmail.com" <thierry.reding@gmail.com>
CC: "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>, Jon Hunter
	<jonathanh@nvidia.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v2] mailbox: tegra-hsp: Clear mailbox before using message
Thread-Topic: [PATCH v2] mailbox: tegra-hsp: Clear mailbox before using
 message
Thread-Index: AQHbQX9u7HPxaUwbcUeZ3vvtIADI0bLSwW8A
Date: Mon, 2 Dec 2024 10:09:13 +0000
Message-ID: <dfe3fa28a907dedd263dbecb7b7ec96e7c3e27fa.camel@nvidia.com>
References: <20241128085930.52571-1-kkartik@nvidia.com>
	 <hofrxrz5qvxohlvxme4brhng6rrs7s6wwoqwnu3smjbbonhwh4@xajjliw474v6>
In-Reply-To: <hofrxrz5qvxohlvxme4brhng6rrs7s6wwoqwnu3smjbbonhwh4@xajjliw474v6>
Reply-To: Kartik Rajput <kkartik@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB5716:EE_|MN2PR12MB4048:EE_
x-ms-office365-filtering-correlation-id: e68c71ff-7a9a-4cde-a2a2-08dd12b95f66
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bWE1aVpkWWsrMkNLckhaa3pJQUNKRWFNbHdHR3lpbXlqVXJmVE9GWEFzTzJF?=
 =?utf-8?B?SURzUFAyS1YvV0ZRanVGeFJKRUxpVUF6eEhyQXhQNXZtc01wRVBtNzBHRHk4?=
 =?utf-8?B?U000SDZmeGtRNHBSYi9qYVl1K2lQRlhBMUJibWFPKzZwMEJOaWtmTnI1Ymd5?=
 =?utf-8?B?Q3BySDR0QnBGWFB0bVZibHF2Rm1rQlJxWTRQUUF1aFdXS3BPeTc2VDh1bXFr?=
 =?utf-8?B?REd4K2J0Ujh1OTJ4VHFwZFBuMkJXOGxuNDB4REM2TXRKUkdxZFlZVlBwWUl5?=
 =?utf-8?B?VDRPbDRSSzJBby9nVWE3c1hObjN3RkVxT0hrV2pZUmRvOWtLaG5VdE0zV040?=
 =?utf-8?B?QW1DQTRZL0dzZmxNRUVIL2VHUkd3SDU1dkxsMXN2eXNVbFV0NTVUbXJGWVNr?=
 =?utf-8?B?Zm03UkhpeU50M1VvMkhLMno2MFphTnp6dGlKdFA4ekxzcEpWZWc0TE9JeUhz?=
 =?utf-8?B?SXFRRUIxMnhNTjc0WjE4alQxdDg1eWR6VTYyeXNZeFpNc0ZSL0hBS0R0Wm9a?=
 =?utf-8?B?azdLMXNlUCtjNUQzVlcrRDNYSUxhZXI2QjI4NHZkKzN2Nlgrbis2U2lLZnh3?=
 =?utf-8?B?aVFQQVduU0NHMjNLcHUvMmZBNTdrbWowREFpZzJFdUkyTVFJLy8rdnV3WWZi?=
 =?utf-8?B?ckhFWCt6ZkE4Zjg5cGRmZ3Fva01LZ0RWdzJiSDVjUGhmZFV2ZGdqL0JqRFZs?=
 =?utf-8?B?S1MxK1pNd3lQK1lQRUZ0cHFKckMvQVYrWm14Nk1LNG1KS1ZNL0U2cnQxeDFK?=
 =?utf-8?B?dEpNVzh4aXNtWVMyK01PTkRQT1VvZ0cwU2hCWXljTkJteFZwY0Q3dklYRVFw?=
 =?utf-8?B?eHFNdVJSVHBuZXBtODBnQ2J6ZHc3OHNET0M4OHphVEhrMVFpRlhBbk5XOURp?=
 =?utf-8?B?bEo5UExWT2k4ajV6WGZKenY5d0VnOVg0a1FiWm9OOGpFbWQ5TTdGUnFrb1ZU?=
 =?utf-8?B?cXBlaWw2Tm5Hc3RvZXNabDY2M3AvUStlajBRYkhic1lySC9KWW10K1RCdmRp?=
 =?utf-8?B?S051Y3VLV3gwQ1RJRWRjUUVub3lRMzZtdk1WWGc3UWowMFhEdGdXNjlDMlBl?=
 =?utf-8?B?M1RMblpiYy9OVG5aV0RiUEVoWnF4bUUzMWlGYXJZc3BIdDJGeENibVlMaEN2?=
 =?utf-8?B?Snl3Yi9hNnNGUkdQRW9GaXlOU2N1dUF5TzFmT0RBZ09NS2NERDNuak5MdGcv?=
 =?utf-8?B?OCtqbThPcm1kQ2h4a00yRCtrWkIrT3EySmIrTWJrb2ZET1pyc25CU1RtRG9z?=
 =?utf-8?B?SVJzSk1sOWo1M3ZJbDBhSExzc3FINU5pT0VkSWpUSG4xdGhrMGJSdlNEWCtQ?=
 =?utf-8?B?eTlrazVjV3c4ZmV1QzFXQnd3WnZaYmVQYVhoVnhpalMySTEyS3hST01xRFZH?=
 =?utf-8?B?VXlLK3FGajZFNUJXYXJCOWlWWkRqTU0xQTM3dThJb0J6WmZBbHlGR0tEdkk1?=
 =?utf-8?B?TnFZOU45TmpHd1dZYmlQakovcGtsWk1kT3NSdHBnTnlUUnVFTGQ5bkR3WlFx?=
 =?utf-8?B?LzBSd0FpS3B0RERiWWllNEZPVWwxRjE4YVJ1N3ZyOE9CSlFZa25xOE80NkQ3?=
 =?utf-8?B?N0g3U21tV3hMNkhLZmw0MUhUaXR5QUwwWGxaR3l3ZTZ3a3pMelBZWXBRV2c1?=
 =?utf-8?B?elYzaEZ6Ullqc1JlOUtRQTBLUDJQbytBcFhUSkNQazNjYzJtZ0dINjcvcUV6?=
 =?utf-8?B?TCtXb1Q0eERMOFlBSThFK1FmdU1Ucm1Cc2pwa2tycnlmVEpaM2Q2cjg3elFG?=
 =?utf-8?B?bmk4WnZkWXNxMUV5VnovMXZ4RTJyTE9iV2E4K1BHY1ZwVGNabEoxMXUyS2dn?=
 =?utf-8?B?WTdrZW0vZHVuVDAwcWJhKy9QaHlxRndKV0lBcnZWZXh1Ylc1MDNMbUJwZHhh?=
 =?utf-8?B?bnhvNE9TbzVtLzgrZnY4b25GUC9hS0ZoRUNhNjJySGZ1N3c9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5716.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aGxFSmJpR1VFN0VsTmRPR0NCTTl3bXFFYjhPTHhaZmI2Y05DNmFsMWx2Wkla?=
 =?utf-8?B?YUVHbElHQzFhd05yZkRacWVJQWhaY3hkR1d3a3E0b3lsRmtmTVVSYXlPV1I2?=
 =?utf-8?B?ZEdxWTMxT1ZXdHA0eDRLY2ZjOW9Rd21qMFk2Rjl6cTlOM1VTaFVJRkp5cVgw?=
 =?utf-8?B?WnNFek9qRlppOXVTYVR0VTFaZVFpOUZzakQ2KzVzbzR6RE1qVUJ2bG0yVGd0?=
 =?utf-8?B?ci92VnJLUDdMSHNOZjZUQkNqQlNEN3NxTDJ3OGg2cmpTYXB3UG95dG9JOW1Z?=
 =?utf-8?B?NWFnMXI2TGQwa3FVaThQOXBWaVB3YWFtSTYySllMMFk0emN1dzNZUXBmN2pJ?=
 =?utf-8?B?em5sVktpemc1eVJqS0lWQ29IWWkvQk0yS0Q2SEhTMTdKV2h4cnUrYU5sMVN0?=
 =?utf-8?B?aEM4NmNuQUFBd1RnTS9BelZmbHN3SkZyNFZpVE9pSGZnUnpSYTNHanBya2I0?=
 =?utf-8?B?bjU2d1Y2dWdCU2ZMc0hKZzRnQmFKdlBZRjRsRkZ5bEp6VW1TYjZEUitWa3Vx?=
 =?utf-8?B?Vm1WZ2Y3eU1RSmp6ZGdNYTV4c2Rlc2JSNTdBTHkrNklEMzFxdnJzZGpDY3I2?=
 =?utf-8?B?U3p5K1oyM09BS29kTVVOYWFuY041U0c2TFBTTlkwUVl4R1EwcWMwUlRKVGtm?=
 =?utf-8?B?K3EyK1BDR2pUZTdudU1NYUY3c1o4RnMxYW9JUG8welNqWlYvcG1zMVNtMytz?=
 =?utf-8?B?M2RlL0RQTzZzUjk3d3ljQkxHRGVjZGNoRHRqellndmVNblRwb1BLZm9XY094?=
 =?utf-8?B?aDRBNnZJTE8rVFhWTHlEb3V2Z01nUzVydVVZWVV2eUN0ZCtFbnBoLzNQYzR2?=
 =?utf-8?B?OVYram1QcXdDd1FVSkdJdEg1OFNiSDFBc2l2dWFVK256L3RkOEJxR0x6ZjdZ?=
 =?utf-8?B?b1IrSWhuTStvSUdsYVJuM3I3UnFvd0ZUTWtXQlZvMW9jNWcwZnRjTnJyTVVZ?=
 =?utf-8?B?K0RoUGhxbzkyN2YxZFFxWS9ka3o5b0NuOXk0blRnMGpCcGJrbStpTE1vdHVx?=
 =?utf-8?B?UzVoNHloemN5bElzS2FtMlFUWUFkVEZJeVBaalZHTi9nanJ4djQxZFZqaHVl?=
 =?utf-8?B?ZkxoVHFlS2Z1WVRVdmg0RW0xM3NDVEIyK21CTFI2dWliNDBENHFjSTdoOGs0?=
 =?utf-8?B?L0ltMnY3bzlMLzAxdUNUenhjYmlpRzFzQ1hqelZHOS85cWRrVE83cUxaK1Ny?=
 =?utf-8?B?R0REdkpXK2RBZGhVUUxHS0VIQkdQdnIxL25zQmt1VFlTS2RWS2hoMFl4OWNl?=
 =?utf-8?B?aEhnY0E0dEltZGxYYVd2UnZvLzNQT1hkY0IrYXVaZUE5NTNyYW5CSVovNjFK?=
 =?utf-8?B?TkFSazRjamltcFRQMGRWVWhkSTc5TGtGbjFyakRVSDRxTUN5STZldDNKQUJy?=
 =?utf-8?B?V0EyMWVuaWE1ekRZanM0MWlYZWluVEF4cTBmdGlPMjA4b3FaaTN1eHhYd3Fm?=
 =?utf-8?B?V1A0ampjZnY3NmIyOHF1MWp5OGxpejh6VlpIeVlwTDFzMitFNEt6cnRtY0gr?=
 =?utf-8?B?SjlLS2FGTDRKa2dNc3NHNU00Sm8xSXN3K09nV2I5bXBkam40NGowdG45U2RG?=
 =?utf-8?B?bW1PUDNyVG5EdDVweHBSaWdwVW83enlDNVl2MFJ2SEZSQXp0ZThnbU5Yd2lk?=
 =?utf-8?B?YzBHZjFKVFRGcUhYdkhXSWswQkd6MklWL3JLUGhQdjFBTTRJTXFPMXNEYitL?=
 =?utf-8?B?QU40cHFyQTVwTVlKV2JwT1lOZStGTGwvTW5xVXFwMGFNTFNzR0RuaFV0eURN?=
 =?utf-8?B?R1RHWmtuS2VydDlqa1BxcFhzclhsOExOb1ZSWWdDNmJGaGM5aWlmcFJTUGxU?=
 =?utf-8?B?NldOVGtoZWZ1aDBJNjFUYzYwL3ZVRC85Qk9ZWVdwZThieUcyK3NGZUdnVi80?=
 =?utf-8?B?WkxUTU1EMDErYmZCTUMzMXBQQmlqcXB0UnJPZWc2d1J6NURaWWQxZHh6QWxy?=
 =?utf-8?B?dU5FaFVzSWkwR0hUL1Nuc1pwZEhadW1yL3lJeExMMlBicE1vTCtOS0hLTmlP?=
 =?utf-8?B?UFhXd1JpVnpVcFpMUlN0U2J4UnZXdE9FSlVycFV3Z0dJSytDNHpYRmVSL1Zz?=
 =?utf-8?B?alAvVExmZmpEcllSTGRhNWtGVzMrelFBb0gwSkxsWGxpS3hZRVBkcEFkTG5X?=
 =?utf-8?Q?3DY0TGivRUBrZhEQfG56XLH/F?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2764AE59E96C4D4EA959A6320BA34EF8@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5716.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e68c71ff-7a9a-4cde-a2a2-08dd12b95f66
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2024 10:09:13.5020
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PxkmhWOOVIzaB0mzRPs6fWPZBvQV16dBbr6xqkbjPsW6FDAufhhKJ7DHq7JZ0ey2neOkhYuB4flg7gJlT1uhRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4048

T24gVGh1LCAyMDI0LTExLTI4IGF0IDExOjIyICswMTAwLCBUaGllcnJ5IFJlZGluZyB3cm90ZToN
Cj4gT24gVGh1LCBOb3YgMjgsIDIwMjQgYXQgMDI6Mjk6MzBQTSArMDUzMCwgS2FydGlrIFJhanB1
dCB3cm90ZToNCj4gPiBGcm9tOiBQZWtrYSBQZXNzaSA8cHBlc3NpQG52aWRpYS5jb20+DQo+ID4g
DQo+ID4gU29tZSBjbGllbnRzIGRlcGVuZCBvbiBtYWlsYm94IGJlaW5nIGVtcHR5IGJlZm9yZSBw
cm9jZXNzaW5nIHRoZQ0KPiA+IG1lc3NhZ2UuIE9uIFJUIGtlcm5lbCwgdGhlIHRocmVhZCBwcm9j
ZXNzaW5nIHRoZSBtZXNzYWdlIG1heSBiZSBvbg0KPiA+IGRpZmZlcmVudCBDUFUgb3IgcnVubmlu
ZyB3aXRoIGhpZ2hlciBwcmlvcml0eSB0aGFuIHRoZSBpbnRlcnJ1cHQNCj4gPiBoYW5kbGVyIHRo
cmVhZCBhbmQgdGhleSBtYXkgYWN0IG9uIHRoZSBtZXNzYWdlIGJlZm9yZSBtYWlsYm94IGlzDQo+
ID4gZW1wdGllZC4NCj4gPiANCj4gPiBGaXhlczogOGY1ODVkMTQwMzBkICgibWFpbGJveDogdGVn
cmEtaHNwOiBBZGQgdGVncmFfaHNwX3NtX29wcyIpDQo+ID4gRml4ZXM6IDc0YzIwZGQwZjg5MiAo
Im1haWxib3g6IHRlZ3JhLWhzcDogQWRkIDEyOC1iaXQgc2hhcmVkDQo+ID4gbWFpbGJveCBzdXBw
b3J0IikNCj4gPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZw0KPiA+IFNpZ25lZC1vZmYtYnk6
IFBla2thIFBlc3NpIDxwcGVzc2lAbnZpZGlhLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBLYXJ0
aWsgUmFqcHV0IDxra2FydGlrQG52aWRpYS5jb20+DQo+ID4gLS0tDQo+ID4gdjEgLT4gdjI6DQo+
ID4gwqDCoMKgwqDCoMKgwqDCoCogQWRkZWQgIkZpeGVzOiIgdGFnIGluIHRoZSBjb21taXQgbWVz
c2FnZS4NCj4gPiDCoMKgwqDCoMKgwqDCoMKgKiBNYWRlIHNpbWlsYXIgY2hhbmdlIGZvciAxMjgt
Yml0IHNoYXJlZCBtYWlsYm94ZXMuDQo+ID4gLS0tDQo+ID4gwqBkcml2ZXJzL21haWxib3gvdGVn
cmEtaHNwLmMgfCA2ICsrKystLQ0KPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IERvIHdlIGtub3cgd2hhdCBleGFjdGx5ICJzb21lIGNs
aWVudHMiIG1lYW5zPyBJIGtub3cgdGhhdCBUQ1UgdXNlcw0KPiB0aGlzDQo+IHNoYXJlZCBtYWls
Ym94IGFuZCBzb21ldGltZXMgaXQgZG9lcyBnbyBpbnRvIGEgd2VpcmQgc3RhdGUgd2hlcmUgaXQN
Cj4gY2FuDQo+IGxvb3NlIGNoYXJhY3RlcnMsIHNvIEkgd29uZGVyIGlmIHRoYXQncyBvbmUgY2Fz
ZSB0aGF0IHdvdWxkIGJlIGZpeGVkDQo+IGJ5DQo+IHRoaXMuDQo+IA0KPiBOb3Qgc3RyaWN0bHkg
YSByZXF1aXJlbWVudCwgYnV0IGl0IHdvdWxkIGJlIGdvb2QgaWYgd2UgY2FuIGdpdmUgYQ0KPiBn
b29kDQo+IGRlc2NyaXB0aW9uIG9mIGEgY2FzZSB3aGVyZSB0aGlzIGhlbHBzLg0KPiANCj4gVGhp
ZXJyeQ0KDQpIaSBUaGllcnJ5LA0KDQpUaGlzIHBhdGNoIGZpeGVzIGFuIGlzc3VlIHdpdGggdGhl
IFRlZ3JhIFJDRSBkcml2ZXIgKHdoaWNoIGlzIGF2YWlsYWJsZQ0KYXMgYW4gZXh0ZXJuYWwgbW9k
dWxlKSwgd2hlcmUgaXQgbWF5IHByb2Nlc3MgYW4gSVZDIG1lc3NhZ2UgYmVmb3JlIHRoZQ0KbWFp
bGJveCBkYXRhIHJlZ2lzdGVyIGlzIGNsZWFyZWQsIHJlc3VsdGluZyBpbiBhIGxvc3Mgb2YgSVZD
DQpub3RpZmljYXRpb24uDQoNCkkgaGF2ZSBwb3N0ZWQgdjMgb2YgdGhpcyBwYXRjaCB3aXRoIGFu
IHVwZGF0ZWQgY29tbWl0IGRlc2NyaXB0aW9uLg0KDQpUaGFua3MgJiBSZWdhcmRzLA0KS2FydGlr
DQo=
