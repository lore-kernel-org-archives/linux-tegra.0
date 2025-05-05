Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2052.outbound.protection.outlook.com [40.107.100.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F110413AA53;
	Mon,  5 May 2025 05:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746423253; cv=fail; b=quUxDoES9xXRCziNvDqDjzXH4Fnx5KPklPxJ+OkE53n6ZmeKugen/VD9mrd0enxu74EfcaPN403zTeT8lWkxy21Ix4HEnzh9lS5DIndzgolZZ3JVG4ZBl/FG2jbdEqU2yuIlz4g9QBU2MrsUE1sWvWwJZAJxVI1DfgksCYcd3fQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746423253; c=relaxed/simple;
	bh=QvFmctrAu/WgtN+8SDR5QVbfskcBrbY1gNMSAMH5y0Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TBt5PzkGAiIlpxCGPKCV334QFw45sFQwpjF8M0lz90d20LGiUcHHYzePPRlOLvVLKYGkCH133nGqpRdYEZumoJ4vEXF2iBpJKHwGDa64+HXTayVv6yjRDbFWfdc6F8Yrz/WIupfP7+lu92Z9ehgUE/X2DTC6lxtXPjzGA2/3Gzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=imLo1G2D; arc=fail smtp.client-ip=40.107.100.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="imLo1G2D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pky+0eYYkyuOcM1dfdAVZHkZfsWJHkYt47M9+gGDTZiI6SqQL0mfDkC5LPYMiyHaLDuxDuZX2yeoApabLz6evM07h+U8WUzUE3gvWS0Q4nIs5pEP06c+IZOZ1nmq5Cwhuxp+CLSAWHlKN39Uyp2BrhA5kWx7xgjJxus3CrpnO8IwpFeyrATrjKjNUfUG3DO7ihYIGQtILRYoxlnKJ4jGIEZlP5A5S+Z26pjJE40+gwFXd+1EFn2HkPH4WUD2f5PK9VQolz7FNEl2S724tlxWEQMo8GgSDMicHdjZG0s5fCSmu7eyWfvKSVoFrfZ4CuBniZLxVhy9VQaMkSXxzVLdbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QvFmctrAu/WgtN+8SDR5QVbfskcBrbY1gNMSAMH5y0Q=;
 b=KsBwe+ThEXDbY1W8YfoDDSABs7I45zJrnl4UCk0E5FB+gwf1tAu6pecPdG5R2Mzrol+FSVPufNd+zZgurlDRlMWA4sJxLtMOufTKPMH1g/T+DVPummrLCwIomai/8ZuMqLWIc0L2QZeu7GK+UheEoJooNctmcDS5kIZmwMiGCXsONBpoQRe53SpRRyRZUsEAdRvI3e42L7v+DKuSXV70/tcE75H6NbHeJNWWfPDhxFSa873al5SLKIyaKlXI+x64k79Ggm+qEgSzqDIoGMWKAIUQQiV6J/ncEe58pLAKZBfPcJMPnGzd85ufAuDWkIl08F0uDgNey5DUHwVmut/hzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QvFmctrAu/WgtN+8SDR5QVbfskcBrbY1gNMSAMH5y0Q=;
 b=imLo1G2DIPvsVZWBOOhA3Rdjtb98ChgsOrXCiNV4VZBXr6IqbO5w02KGXK1iCqYJlfEPr2WJyqLMf8r/RMHATTzGp6pfFuli82kOQygelNhs7vtT3uwt2SObGbDvwcC801KD9ejOswqPA0W24oBZt7a6egdD58QXWzPJrGuCpX2whYrJuCCvxLHA7NUMRagaNxj1DRiJ9rcnQZuaAOkZKIHCL+nJLAh6n92x3TT5vcO3wERwGGzcFkCkh9dN5NWclltUUYjaQjoBxt4Qvot61u8qRAoFyZFtjuQY/M72aJiBQKRQNRZMAcihr8tLHExgO6W8oMVid9GHHasJM/cwgQ==
Received: from DS0PR12MB6416.namprd12.prod.outlook.com (2603:10b6:8:cb::6) by
 DS7PR12MB5933.namprd12.prod.outlook.com (2603:10b6:8:7c::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.23; Mon, 5 May 2025 05:34:06 +0000
Received: from DS0PR12MB6416.namprd12.prod.outlook.com
 ([fe80::c1de:5f2:909:e0c4]) by DS0PR12MB6416.namprd12.prod.outlook.com
 ([fe80::c1de:5f2:909:e0c4%6]) with mapi id 15.20.8699.012; Mon, 5 May 2025
 05:34:06 +0000
From: Robert Lin <robelin@nvidia.com>
To: Jon Hunter <jonathanh@nvidia.com>, Daniel Lezcano
	<daniel.lezcano@linaro.org>
CC: "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
	"tglx@linutronix.de" <tglx@linutronix.de>, Pohsun Su <pohsuns@nvidia.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Sumit Gupta
	<sumitg@nvidia.com>
Subject: RE: [PATCH v7 1/3] clocksource/drivers/timer-tegra186: add
 WDIOC_GETTIMELEFT support
Thread-Topic: [PATCH v7 1/3] clocksource/drivers/timer-tegra186: add
 WDIOC_GETTIMELEFT support
Thread-Index:
 AQHbuxv+LeZnI9ouXk2TXsmvoikGMrO/EGmAgAAP2oCAAAnygIAABDUAgAAGOACAABMQgIAEPqIA
Date: Mon, 5 May 2025 05:34:05 +0000
Message-ID:
 <DS0PR12MB6416E7BF479EF8C67BAC6147D98E2@DS0PR12MB6416.namprd12.prod.outlook.com>
References: <20250502043727.396896-1-robelin@nvidia.com>
 <20250502043727.396896-2-robelin@nvidia.com>
 <aBSOJTlQUUnFIEVr@mai.linaro.org>
 <af0e0ab4-89d5-4f77-86c7-90d2bc3e13dd@nvidia.com>
 <aBSjyZJ0__ctBa-4@mai.linaro.org>
 <5824d505-0a42-40cc-84ec-814f0bbfb79f@nvidia.com>
 <93f063fa-0012-4018-8c37-a2bfa623d2bf@linaro.org>
 <a6a45384-18b4-4500-8b8e-8cdd8df5ac1f@nvidia.com>
In-Reply-To: <a6a45384-18b4-4500-8b8e-8cdd8df5ac1f@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR12MB6416:EE_|DS7PR12MB5933:EE_
x-ms-office365-filtering-correlation-id: ed4d057d-a365-4a81-cafa-08dd8b9673b4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?QlcyS05RL3F3N3dFVml1cHJFenlNb0V1S29vM1pKK3NzV3RNVXhUc3lGUEM1?=
 =?utf-8?B?bThMWE13V3kwWFhrZ0Q4Vkg1cGJqQ0E1cFAwTmpXVmtTUW5lZllFOWVvYU8y?=
 =?utf-8?B?L2JsRHF5ZEVVZ240K0x2SGg1QThkdmlTUmtSRUJ0U0FrUmErM3dzRXFaTjNZ?=
 =?utf-8?B?Mlc4dkU1azd6d2FtWnZjZnFMRWNVUVF3VnJma1ZybVdsR05UeXZ1WFVUelRy?=
 =?utf-8?B?QmZydGdXcVZGZURJblg0RVY0SUFPNjJRN0JjMlIycDAvWFhQWXlRNzhRWVhC?=
 =?utf-8?B?ZEhManUvUEYycGdIMnNwVmNWeUxqeENpSkdXanI3MjB4bXpnZDhZRFEwRU5Y?=
 =?utf-8?B?OGRTL2dCUU8zSUE0WFZyek9ZRjc4VUlqYVFjbkNZd2lUVHJlOE9YcHZPS3px?=
 =?utf-8?B?WlR0YS8ycDRlY1pyU0xLMVpxSmZZMlNndnp1OTNndzNvOEZJVUdKbS9USUdk?=
 =?utf-8?B?azVpVFBGNm5XcnFOczZlb2hnTHArOHl0cFl0dnNrYjc2WDhaRkd6aktBc2FX?=
 =?utf-8?B?UW9HTTE4M3JoMkh4VFpEMG9Ic2RNTlNBNmlvUW1KaTRGSHNmRVFobjROcW1r?=
 =?utf-8?B?R0Exdk5yTGRtSE1JNHcrYmdjWE9LT2xZWWVmY1ltOGZVeHJDKzNjYXdpV1ZG?=
 =?utf-8?B?Tjl4OGhHV3BpcmpsL1NKREtJV1NudzlIZ3RHVllSZW5WNTNFUHpzTzVWZWIz?=
 =?utf-8?B?WDdWZEI1RFcyaDJOYXVPR1RNdFNqd0swYnVIdEpBRVZ3bFdIUzNheko1TXVR?=
 =?utf-8?B?djFzQzdkU21QeWVMSG41TWdiM1pUR28vVW1aaXF3U0pQWFVqTFp3MS9EWUll?=
 =?utf-8?B?SEJnR0Yza1dJeFhObXZvNXFVbS93aDZSVlB0c1BqSTlVaWgveGNaVHdSVEhS?=
 =?utf-8?B?TElvemJkZGt2N3ZzaldWQTd3ODlKS3dReVJFNkxJWG1SbEpQS0hCRVI3czhv?=
 =?utf-8?B?WnFwSE82T0liOW1xVDBjSFdDZlR5aWRyU0F1aGludUNaRG9ROHpBSTlEWmtF?=
 =?utf-8?B?U09XSW04UGpCUWVoYXRyb2hMY2l0NXZlQlR1bXZidnZsazNlWG1kYkxXVndX?=
 =?utf-8?B?WmhMYlc2S1dzU29rV3JwM1M5cDhhU1ZIRmFRR1dHUW1nRTFxVjI1eUFyS3c4?=
 =?utf-8?B?NTlDYlpYR2R1TmFWcTVYa25DdEt2Y05XVytKcEIyRWxOMzFyYWpSTDJkampj?=
 =?utf-8?B?dDVHR2QrQmRGOTlXdy9ZV0dMUXRWNlpTYWtlekNkaVBnT0FXTkp5azNYUHQ5?=
 =?utf-8?B?TElhRkZsS3VqOVNzVnErZHQ1UVUrSlRFREd1dGVLZm85b3VDU3pSTFROM20x?=
 =?utf-8?B?MDRnRzUyTVk2cnMxcVRkbzVoeHhWS2c2WkVzSE9nZGRkemVYazJUQVIwYWdn?=
 =?utf-8?B?R3RWdUhwYXkwQXFQZ0ZXckp5YjdsN3N5YzljYUREZ0t5MnhaVUtiWW5OTnVH?=
 =?utf-8?B?RW9KN29neFVKa0RhajJFeXVROVA2VkdBeXlFRjhZR1JDNXBrcDJ0aHphVmhJ?=
 =?utf-8?B?aUk2V05QL2drc3Z2L1dtdm53YkpqR2ZubE5YTThjUVJDTS9hMG9mc2MrTmZk?=
 =?utf-8?B?ZmN5RFpuMy9NWThDUGYrdGcyS0VZelJMaE0vRnNEYjVQMDBDZjhIR0VnSUJC?=
 =?utf-8?B?elU5MVJPUE9zaDRlOUFvQlcyc2E2TUFpbS9ObzVQbnk2VHVPRG9ZVEpidmVp?=
 =?utf-8?B?YmxNRCtSaEdXazI4Qm1oK0ZYSTVDS1NuTDFUV1M3UDlpN1o3UFh2L2xDRnhR?=
 =?utf-8?B?UFNHUUdoSVRCYlpmSGM2WkJUZmRubFZMWmRkT2Zld3JyeE9TV24wZFNFUXJO?=
 =?utf-8?B?NEtscHNnSms5MWs3YmdkeEpDUmt6T2psY0QvNFJpSzBpVyt2eTI3THdnM0Vm?=
 =?utf-8?B?d0RCN0hCME1sZlhNd2U4c09lN1RGWThTcjFHdnI5NnJFTXRzQW0yZENjWmpB?=
 =?utf-8?B?V2F1bDFDZHZDWDl2aldLbmcyUXdSS3liZmh3WENRR01CajBMUG96Y01MNnRt?=
 =?utf-8?Q?w7W5Cseg6HQVNeBS0lVk4PaWQlyGZ0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OXcwenpXdnlGUW9GS3V5SXNUU09meTdBOFIwbWpTT2ZXandQbFdMc1JDaHdO?=
 =?utf-8?B?KzJHTHRyWkhvWXdMUGtGblcxclRFd0xhRkRISSttenQwbWdBK2FhTFIxRkw0?=
 =?utf-8?B?eHpMcmJaYzZocWpvd3ZjZ1RVUlkyRXVPcHJPUVZRbkxkUFlRNkMxME92c0dz?=
 =?utf-8?B?VG1MWXNmTnpQajd5ZjlRRlVIdmthK1lMQVRDMXJDR0ZMYko2eDlVTmUvZTd2?=
 =?utf-8?B?MXpZRDhUcjJyVUovcnVSM1QwQkFOaUVHemNrck85V2ovTWUrZmhlZFA4Y2po?=
 =?utf-8?B?TWt3Z3FycFZTUkR2U1BoSm5jd1A2cHR5Q1ZscGNRMldwSGx5U3EyaWw4RFYw?=
 =?utf-8?B?TThCbG54QnpFWDlhOUZRUnAyTDN2aVVLcnlkUkpVMzh1M0Y1MG5uWDBjOUIx?=
 =?utf-8?B?MTAxMDNmVnNFb1p1Zk92eWlIQ0Naa1JEL2ZUY1JvckRXa2IxOWsvQVloNGZa?=
 =?utf-8?B?MXNrdEZiN1luanRzRzhLdGlKNzJORDVVeXZ1d1Q4a1J4bWtpaGhtclIrTHUv?=
 =?utf-8?B?NW5BOGZtazdmeVNxQzVzNCt2TzFWUlNmcHF3OWxwRm9xcUJQUjZDVXdRZ3gx?=
 =?utf-8?B?SWkzbHJra3dLT2lBSW1jSUdYenNPMXJlY3BEQXJOSFlvM0FQYWFyMmYvckl6?=
 =?utf-8?B?ZDJHRy9pU0pOcytMRXRFcmxHYmEvUHVISThVWG5CY29BREg4aWJRR2t1aVA5?=
 =?utf-8?B?ZWp4a2JqbWNVRGJWTmlOcXNIazhNamlDMDIwQkh5MW1MekN2bUpVN3NTTWtp?=
 =?utf-8?B?V24vd2JaSnN4b2hZMFNpdXhEenZmV3hBRDk0RlBxZ2dmcmYwSEVFVTA4RDRl?=
 =?utf-8?B?NTcwSnhvY0pQY2tBclRGemQ3dk13UXhOTmI4eVNIbjJhU3lNWkp6R2dwSG9K?=
 =?utf-8?B?T3R1YWdYclgrU3ZvN01GeHZ6YmVrb3dFMGlhbytZQi9naXZwK1VhWS93MnRu?=
 =?utf-8?B?dUxMZnI2SlhMVnl1TjQ1aUc3T1FXMU51QnBWZC8renBiak1KZ3ZIeW56UXhq?=
 =?utf-8?B?RU9KbGdQV3FIZDJPOVAwanhIdmhUN3RRRi9ZVlBjVmZySXYxWUV3OVhXVlhY?=
 =?utf-8?B?NUlldENZaWhUOCtCOWFDQXptbVk4WmhBVUtGU3hZTTZWVk40YTBLYmY1Q0pV?=
 =?utf-8?B?NDNwQnlrclZod0RRdjdtc3ovblhVblA0YjhxTU9RNGg3Zm8yb1l3emp4dDR3?=
 =?utf-8?B?STYrblRxZ29xWnV6dmlXR3I5Y2lUTDQvU0tvS09lQTNTK2FsaEE2cTVkZU5F?=
 =?utf-8?B?TUZLS0t4Z3MxclhGYVZ5Slk4ZmZ2VkhVUElQZmthSU5iOVhqTlBxQlpWNWdD?=
 =?utf-8?B?STFKVFFOcCt2N2U0ZDJ0MmNKcEsvejdTK3ZqWTZJekVNMjJwTlVCam1SSjdP?=
 =?utf-8?B?Q2o2MFdtWVJJdmZZdE5OUURIamdiS2NEQjRacnV2L2tuTFlCYW9oZHZJWXZB?=
 =?utf-8?B?L1RLUkxoQkdoTjkvby9GSVNaWlFpUWp5dDE2OFhwK0drQ2xwK0lGK2wxKzIw?=
 =?utf-8?B?ai8zbG1OVFlxV2w5YXJYMlhWMzRvcnJwR3FCVEVwaFJicFlhRmJQWHI2bk1l?=
 =?utf-8?B?a21sZHlxV3JXQ0Z2a01DcjhHSGV3aktLUDhNbUZQSnRQL01lQ1VoTEdSU3V4?=
 =?utf-8?B?TzdvSE9wa3hvR2NkbjNWRDVsMVhTM2tFbHpWMDYvNWR2K2w3cWk3cDE5TTJM?=
 =?utf-8?B?SDJEcHZZN05jamszb2w0U3daekpYMXVhR1RYdk1abE04dEVsOHJwSWRRRWFN?=
 =?utf-8?B?bHJVanpkR09vRFRnbTRzc0N6dEVhdjNRR2NsVVMwOTFuY2daNjhwK3JZeWhx?=
 =?utf-8?B?S090MUZ2cWh1N1VJM1BXR2JLQ2hlWCsxYXN5WmExaTNQNmxwNnhyK3Izc2o2?=
 =?utf-8?B?VmhUbWY4cEZoSVZraWExRUMvMXJXL0RnMFJrSklnZ3dFbUJjY2JQZStCZDl6?=
 =?utf-8?B?bmtJQXErWXNmVm4vYU1ZUkdkSERLWVNKK3FFQkxnTFFsc0tkcXg2R0x4a0lv?=
 =?utf-8?B?U0JjVGpxTUdneUQ5ZXo0cE4rU3NJUVZudVpVTHZVYktuSVRRUzZMbTdCbXpv?=
 =?utf-8?B?bE1wTTVNZy8zbkFsUHI2OHBMdGlvSjJERXp2S3hMVmlsaWxUb2orc1pHa0lx?=
 =?utf-8?Q?3Z4U=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed4d057d-a365-4a81-cafa-08dd8b9673b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2025 05:34:05.8723
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /ai9BuiuFTm4hxVABtY3uRBLXlNjSvmBzeSpNkCO+Wn/LrpyY4QrlPsvUv0owrarkvU9uzk9wFN4YNITmI8Fhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5933

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKb24gSHVudGVyIDxqb25hdGhh
bmhAbnZpZGlhLmNvbT4NCj4gU2VudDogRnJpZGF5LCBNYXkgMiwgMjAyNSA4OjM3IFBNDQo+IFRv
OiBEYW5pZWwgTGV6Y2FubyA8ZGFuaWVsLmxlemNhbm9AbGluYXJvLm9yZz4NCj4gQ2M6IFJvYmVy
dCBMaW4gPHJvYmVsaW5AbnZpZGlhLmNvbT47IHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbTsNCj4g
dGdseEBsaW51dHJvbml4LmRlOyBQb2hzdW4gU3UgPHBvaHN1bnNAbnZpZGlhLmNvbT47IGxpbnV4
LQ0KPiBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsaW51eC10ZWdyYUB2Z2VyLmtlcm5lbC5vcmc7
IFN1bWl0IEd1cHRhDQo+IDxzdW1pdGdAbnZpZGlhLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2NyAxLzNdIGNsb2Nrc291cmNlL2RyaXZlcnMvdGltZXItdGVncmExODY6IGFkZA0KPiBXRElP
Q19HRVRUSU1FTEVGVCBzdXBwb3J0DQo+IA0KPiANCj4gT24gMDIvMDUvMjAyNSAxMjoyOSwgRGFu
aWVsIExlemNhbm8gd3JvdGU6DQo+ID4gT24gMDIvMDUvMjAyNSAxMzowNiwgSm9uIEh1bnRlciB3
cm90ZToNCj4gPj4NCj4gPj4NCj4gPj4gT24gMDIvMDUvMjAyNSAxMTo1MSwgRGFuaWVsIExlemNh
bm8gd3JvdGU6DQo+ID4+PiBPbiBGcmksIE1heSAwMiwgMjAyNSBhdCAxMToxNjoxN0FNICswMTAw
LCBKb24gSHVudGVyIHdyb3RlOg0KPiA+Pj4+DQo+ID4+Pj4NCj4gPj4+PiBPbiAwMi8wNS8yMDI1
IDEwOjE5LCBEYW5pZWwgTGV6Y2FubyB3cm90ZToNCj4gPj4+Pj4gT24gRnJpLCBNYXkgMDIsIDIw
MjUgYXQgMTI6Mzc6MjVQTSArMDgwMCwgUm9iZXJ0IExpbiB3cm90ZToNCj4gPj4+Pj4+IEZyb206
IFBvaHN1biBTdSA8cG9oc3Vuc0BudmlkaWEuY29tPg0KPiA+Pj4+Pj4NCj4gPj4+Pj4+IFRoaXMg
Y2hhbmdlIGFkZHMgc3VwcG9ydCBmb3IgV0RJT0NfR0VUVElNRUxFRlQgc28gdXNlcnNwYWNlDQo+
ID4+Pj4+PiBwcm9ncmFtcyBjYW4gZ2V0IHRoZSBudW1iZXIgb2Ygc2Vjb25kcyBiZWZvcmUgc3lz
dGVtIHJlc2V0IGJ5IHRoZQ0KPiA+Pj4+Pj4gd2F0Y2hkb2cgdGltZXIgdmlhIGlvY3RsLg0KPiA+
Pj4+Pj4NCj4gPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFBvaHN1biBTdSA8cG9oc3Vuc0BudmlkaWEu
Y29tPg0KPiA+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogUm9iZXJ0IExpbiA8cm9iZWxpbkBudmlkaWEu
Y29tPg0KPiA+Pj4+Pj4gLS0tDQo+ID4+Pj4+PiDCoMKgIGRyaXZlcnMvY2xvY2tzb3VyY2UvdGlt
ZXItdGVncmExODYuYyB8IDY0DQo+ID4+Pj4+PiArKysrKysrKysrKysrKysrKysrKysNCj4gPj4+
Pj4+ICsgKysrKystDQo+ID4+Pj4+PiDCoMKgIDEgZmlsZSBjaGFuZ2VkLCA2MyBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pDQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvY2xvY2tzb3VyY2UvdGltZXItdGVncmExODYuYyBiL2RyaXZlcnMvDQo+ID4+Pj4+PiBjbG9j
a3NvdXJjZS90aW1lci10ZWdyYTE4Ni5jIGluZGV4IGVhNzQyODg5ZWUwNi4uOGQ1Njk4NzcwY2Jk
DQo+ID4+Pj4+PiAxMDA2NDQNCj4gPj4+Pj4+IC0tLSBhL2RyaXZlcnMvY2xvY2tzb3VyY2UvdGlt
ZXItdGVncmExODYuYw0KPiA+Pj4+Pj4gKysrIGIvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci10
ZWdyYTE4Ni5jDQo+ID4+Pj4+PiBAQCAtMSw4ICsxLDkgQEANCj4gPj4+Pj4+IMKgwqAgLy8gU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQ0KPiA+Pj4+Pj4gwqDCoCAvKg0KPiA+
Pj4+Pj4gLSAqIENvcHlyaWdodCAoYykgMjAxOS0yMDIwIE5WSURJQSBDb3Jwb3JhdGlvbi4gQWxs
IHJpZ2h0cyByZXNlcnZlZC4NCj4gPj4+Pj4+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMTktMjAyNSBO
VklESUEgQ29ycG9yYXRpb24uIEFsbCByaWdodHMgcmVzZXJ2ZWQuDQo+ID4+Pj4+PiDCoMKgwqAg
Ki8NCj4gPj4+Pj4+ICsjaW5jbHVkZSA8bGludXgvYml0ZmllbGQuaD4NCj4gPj4+Pj4+IMKgwqAg
I2luY2x1ZGUgPGxpbnV4L2Nsb2Nrc291cmNlLmg+DQo+ID4+Pj4+PiDCoMKgICNpbmNsdWRlIDxs
aW51eC9tb2R1bGUuaD4NCj4gPj4+Pj4+IMKgwqAgI2luY2x1ZGUgPGxpbnV4L2ludGVycnVwdC5o
Pg0KPiA+Pj4+Pj4gQEAgLTMwLDYgKzMxLDcgQEANCj4gPj4+Pj4+IMKgwqAgI2RlZmluZSBUTVJT
UiAweDAwNA0KPiA+Pj4+Pj4gwqDCoCAjZGVmaW5lwqAgVE1SU1JfSU5UUl9DTFIgQklUKDMwKQ0K
PiA+Pj4+Pj4gKyNkZWZpbmXCoCBUTVJTUl9QQ1YgR0VOTUFTSygyOCwgMCkNCj4gPj4+Pj4+IMKg
wqAgI2RlZmluZSBUTVJDU1NSIDB4MDA4DQo+ID4+Pj4+PiDCoMKgICNkZWZpbmXCoCBUTVJDU1NS
X1NSQ19VU0VDICgwIDw8IDApIEBAIC00Niw2ICs0OCw5IEBADQo+ID4+Pj4+PiDCoMKgICNkZWZp
bmXCoCBXRFRDUl9USU1FUl9TT1VSQ0VfTUFTSyAweGYNCj4gPj4+Pj4+IMKgwqAgI2RlZmluZcKg
IFdEVENSX1RJTUVSX1NPVVJDRSh4KSAoKHgpICYgMHhmKQ0KPiA+Pj4+Pj4gKyNkZWZpbmUgV0RU
U1IgMHgwMDQNCj4gPj4+Pj4+ICsjZGVmaW5lwqAgV0RUU1JfQ1VSUkVOVF9FWFBJUkFUSU9OX0NP
VU5UIEdFTk1BU0soMTQsIDEyKQ0KPiA+Pj4+Pj4gKw0KPiA+Pj4+Pj4gwqDCoCAjZGVmaW5lIFdE
VENNRFIgMHgwMDgNCj4gPj4+Pj4+IMKgwqAgI2RlZmluZcKgIFdEVENNRFJfRElTQUJMRV9DT1VO
VEVSIEJJVCgxKQ0KPiA+Pj4+Pj4gwqDCoCAjZGVmaW5lwqAgV0RUQ01EUl9TVEFSVF9DT1VOVEVS
IEJJVCgwKSBAQCAtMjM1LDEyICsyNDAsNjkNCj4gQEANCj4gPj4+Pj4+IHN0YXRpYyBpbnQgdGVn
cmExODZfd2R0X3NldF90aW1lb3V0KHN0cnVjdCB3YXRjaGRvZ19kZXZpY2UgKndkZCwNCj4gPj4+
Pj4+IMKgwqDCoMKgwqDCoCByZXR1cm4gMDsNCj4gPj4+Pj4+IMKgwqAgfQ0KPiA+Pj4+Pj4gK3N0
YXRpYyB1bnNpZ25lZCBpbnQgdGVncmExODZfd2R0X2dldF90aW1lbGVmdChzdHJ1Y3QNCj4gPj4+
Pj4+IHdhdGNoZG9nX2RldmljZSAqd2RkKQ0KPiA+Pj4+Pj4gK3sNCj4gPj4+Pj4+ICvCoMKgwqAg
c3RydWN0IHRlZ3JhMTg2X3dkdCAqd2R0ID0gdG9fdGVncmExODZfd2R0KHdkZCk7DQo+ID4+Pj4+
PiArwqDCoMKgIHUzMiBleHBpcmF0aW9uLCB2YWw7DQo+ID4+Pj4+PiArwqDCoMKgIHU2NCB0aW1l
bGVmdDsNCj4gPj4+Pj4+ICsNCj4gPj4+Pj4+ICvCoMKgwqAgaWYgKCF3YXRjaGRvZ19hY3RpdmUo
JndkdC0+YmFzZSkpIHsNCj4gPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCAvKiByZXR1cm4gemVybyBp
ZiB0aGUgd2F0Y2hkb2cgdGltZXIgaXMgbm90IGFjdGl2YXRlZC4NCj4gPj4+Pj4+ICsqLw0KPiA+
Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAwOw0KPiA+Pj4+Pj4gK8KgwqDCoCB9DQo+ID4+
Pj4+PiArDQo+ID4+Pj4+PiArwqDCoMKgIC8qDQo+ID4+Pj4+PiArwqDCoMKgwqAgKiBSZXNldCBv
Y2N1cnMgb24gdGhlIGZpZnRoIGV4cGlyYXRpb24gb2YgdGhlDQo+ID4+Pj4+PiArwqDCoMKgwqAg
KiB3YXRjaGRvZyB0aW1lciBhbmQgc28gd2hlbiB0aGUgd2F0Y2hkb2cgdGltZXIgaXMNCj4gPj4+
Pj4+ICtjb25maWd1cmVkLA0KPiA+Pj4+Pj4gK8KgwqDCoMKgICogdGhlIGFjdHVhbCB2YWx1ZSBw
cm9ncmFtbWVkIGludG8gdGhlIGNvdW50ZXIgaXMgMS81IG9mDQo+ID4+Pj4+PiArdGhlDQo+ID4+
Pj4+PiArwqDCoMKgwqAgKiB0aW1lb3V0IHZhbHVlLiBPbmNlIHRoZSBjb3VudGVyIHJlYWNoZXMg
MCwgZXhwaXJhdGlvbg0KPiA+Pj4+Pj4gK2NvdW50DQo+ID4+Pj4+PiArwqDCoMKgwqAgKiB3aWxs
IGJlIGluY3JlYXNlZCBieSAxIGFuZCB0aGUgZG93biBjb3VudGVyIHJlc3RhcnRzLg0KPiA+Pj4+
Pj4gK8KgwqDCoMKgICogSGVuY2UgdG8gZ2V0IHRoZSB0aW1lIGxlZnQgYmVmb3JlIHN5c3RlbSBy
ZXNldCB3ZSBtdXN0DQo+ID4+Pj4+PiArwqDCoMKgwqAgKiBjb21iaW5lIDIgcGFydHM6DQo+ID4+
Pj4+PiArwqDCoMKgwqAgKiAxLiB2YWx1ZSBvZiB0aGUgY3VycmVudCBkb3duIGNvdW50ZXINCj4g
Pj4+Pj4+ICvCoMKgwqDCoCAqIDIuIChudW1iZXIgb2YgY291bnRlciBleHBpcmF0aW9ucyByZW1h
aW5pbmcpICoNCj4gPj4+Pj4+ICsodGltZW91dC81KQ0KPiA+Pj4+Pj4gK8KgwqDCoMKgICovDQo+
ID4+Pj4+PiArDQo+ID4+Pj4+PiArwqDCoMKgIC8qIEdldCB0aGUgY3VycmVudCBudW1iZXIgb2Yg
Y291bnRlciBleHBpcmF0aW9ucy4gU2hvdWxkIGJlDQo+ID4+Pj4+PiArYQ0KPiA+Pj4+Pj4gK8Kg
wqDCoMKgICogdmFsdWUgYmV0d2VlbiAwIGFuZCA0DQo+ID4+Pj4+PiArwqDCoMKgwqAgKi8NCj4g
Pj4+Pj4+ICvCoMKgwqAgdmFsID0gcmVhZGxfcmVsYXhlZCh3ZHQtPnJlZ3MgKyBXRFRTUik7DQo+
ID4+Pj4+PiArwqDCoMKgIGV4cGlyYXRpb24gPSBGSUVMRF9HRVQoV0RUU1JfQ1VSUkVOVF9FWFBJ
UkFUSU9OX0NPVU5ULA0KPiB2YWwpOw0KPiA+Pj4+Pj4gK8KgwqDCoCBpZiAoV0FSTl9PTihleHBp
cmF0aW9uID4gNCkpDQo+ID4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDA7DQo+ID4+Pj4+
DQo+ID4+Pj4+IEVhY2ggY2FsbCB3aWxsIGdlbmVyYXRlIGEgYmlnIHdhcm5pbmcgaW4gdGhlIG1l
c3NhZ2UuIE1heSBiZQ0KPiA+Pj4+PiBzaW1wbGVyIHRvIGFkZCBhIHByX2VycigpIHdpdGggYW4g
ZXhwbGljaXQgbWVzc2FnZS4NCj4gPj4+Pg0KPiA+Pj4+IEkgcHJlZmVyIHRoZSBXQVJOLiBUaGlz
IHNob3VsZCBuZXZlciBoYXBwZW4uIElmIHdlIGRvIGNoYW5nZSB0aGlzLA0KPiA+Pj4+IHRoZW4N
Cj4gPj4+PiBkZXZfV0FSTigpIG1pZ2h0IGJlIG1vcmUgYXBwcm9wcmlhdGUsIGJ1dCBJIHRoaW5r
IHRoYXQgdGhpcyBpcyBmaW5lDQo+ID4+Pj4gdG9vLg0KPiA+Pj4NCj4gPj4+IFRoZSBmdW5jdGlv
biB0ZWdyYTE4Nl93ZHRfZ2V0X3RpbWVsZWZ0KCkgaXMgdHJpZ2dlcmVkIGZyb20gdXNlcnNwYWNl
DQo+ID4+PiB2aWEgYW4gaW9jdGwgb3Igc3lzZnMuIFRoZSBkb2N1bWVudGF0aW9uIHByb2Nlc3Mv
Y29kaW5nLXN0eWxlLnJzdCBzYXlzOg0KPiA+Pj4NCj4gPj4+ICIiIg0KPiA+Pj4gRG8gbm90IFdB
Uk4gbGlnaHRseQ0KPiA+Pj4gKioqKioqKioqKioqKioqKioqKg0KPiA+Pj4NCj4gPj4+IFdBUk4q
KCkgaXMgaW50ZW5kZWQgZm9yIHVuZXhwZWN0ZWQsIHRoaXMtc2hvdWxkLW5ldmVyLWhhcHBlbg0K
PiBzaXR1YXRpb25zLg0KPiA+Pj4gV0FSTiooKSBtYWNyb3MgYXJlIG5vdCB0byBiZSB1c2VkIGZv
ciBhbnl0aGluZyB0aGF0IGlzIGV4cGVjdGVkIHRvDQo+ID4+PiBoYXBwZW4gZHVyaW5nIG5vcm1h
bCBvcGVyYXRpb24uIFRoZXNlIGFyZSBub3QgcHJlLSBvciBwb3N0LWNvbmRpdGlvbg0KPiA+Pj4g
YXNzZXJ0cywgZm9yIGV4YW1wbGUuIEFnYWluOiBXQVJOKigpIG11c3Qgbm90IGJlIHVzZWQgZm9y
IGENCj4gPj4+IGNvbmRpdGlvbiB0aGF0IGlzIGV4cGVjdGVkIHRvIHRyaWdnZXIgZWFzaWx5LCBm
b3IgZXhhbXBsZSwgYnkgdXNlcg0KPiA+Pj4gc3BhY2UgYWN0aW9ucy4gcHJfd2Fybl9vbmNlKCkg
aXMgYSBwb3NzaWJsZSBhbHRlcm5hdGl2ZSwgaWYgeW91IG5lZWQNCj4gPj4+IHRvIG5vdGlmeSB0
aGUgdXNlciBvZiBhIHByb2JsZW0uDQo+ID4+PiAiIiINCj4gPj4+DQo+ID4+PiBJIHVuZGVyc3Rh
bmQgaXQgaXMgaW1wb3J0YW50IHRvIGNoZWNrIHRoZSByZXR1cm4gdmFsdWUgaW4gb3JkZXIgdG8N
Cj4gPj4+IGhhdmUgYSBjb25zaXN0ZW50IHJlc3VsdCB3aGVuIGNvbXB1dGluZyB0aGUgcmVtYWlu
aW5nIHRpbWUgYnV0IHRoYXQNCj4gPj4+IHNob3VsZCBub3QgdHJpZ2dlciBhIHdhcm5pbmcgZWFj
aCB0aW1lLg0KPiA+Pg0KPiA+PiBZZXMgc28gV0FSTiBzb3VuZHMgYXBwcm9wcmlhdGUuIEl0IHNo
b3VsZCBuZXZlciBoYXBwZW4uIEkgZG9uJ3Qgc2VlDQo+ID4+IHRoZSBpc3N1ZS4NCj4gPg0KPiA+
IFRoZSBpc3N1ZSBpcyBpZiB0aGVyZSBpcyBhbiB1c2Vyc3BhY2UgYXBwbGljYXRpb24gcmVhZGlu
ZyB0aGUgaW9jdGwNCj4gPiBhbmQgb3IgdGhlIHN5c2ZzLCB0aGVuIHRoZSB3YXJuaW5nIHdpbGwg
YmUgZW1pdHRlZCBlYWNoIHRpbWUgaWYgdGhlDQo+ID4gbmV2ZXItIGhhcHBlbiBjb25kaXRpb24g
ZXhpc3RzLiBQcmVmZXJhYmx5IHJlcGxhY2UgdGhlIFdBUk5fT04gYnkNCj4gPiBwcl93YXJuX29u
Y2UoKSBhcyBzdWdnZXN0ZWQgaWYgdGhlIGJ1ZyBtdXN0IGJlIHJlcG9ydGVkLg0KPiANCj4gU291
bmRzIGEgYml0IGZ1bm55ICdpZiB0aGUgbmV2ZXItaGFwcGVuIGNvbmRpdGlvbiBleGlzdHMnIDot
KQ0KPiANCj4gSG93ZXZlciwgSSB3aWxsIGJlIGZpbmUgd2l0aCBXQVJOX09OX09OQ0UoKS4gSSB0
aGluayB0aGF0IHRoaXMgd2FycmFudHMNCj4gbW9yZSBvZiBhIGxhcmdlIFdBUk4gc3BsYXQgdGhh
biBwcl93YXJuKCkgYmVjYXVzZSBpdCBzaG91bGQgbmV2ZXIgaGFwcGVuLg0KPiANCg0KSSBiZWxp
ZXZlIHRoZSB0d28gV0FSTl9PTiBJIHVzZWQgaGVyZSBhcmUgdGhlICJ0aGlzLXNob3VsZC1uZXZl
ci1oYXBwZW4iIHNpdHVhdGlvbnMuIEluIG15IG9waW5pb24sIHdlIGFyZSBnb29kIHRvIGtlZXAu
IEJ1dCBJIGFtIGFsc28gZ29vZCB3aXRoIFdBUk5fT05fT05DRSBmb3IgY29tcHJvbWlzZS4gSSB3
b25kZXIgaWYgRGFuaWVsIGlzIGdvb2Qgd2l0aCB0aGlzIHRoZW4gSSBjYW4gZml4IHRoZW0uDQoN
Cj4gSm9uDQo+IA0KPiAtLQ0KPiBudnB1YmxpYw0KDQo=
