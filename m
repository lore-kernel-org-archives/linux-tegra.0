Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011037.outbound.protection.outlook.com [52.101.62.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70DA1FF61E;
	Mon, 10 Nov 2025 21:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762809923; cv=fail; b=sB/m77IGf8HmjFfaZzZb+3zTmV0QW9L2YayflgXm4Dw9KxELQ8j90EADfvS2k/LFCFyzAhwT+Gq4qMowgYWLe3dh3utNsBk4lp/O3IUAfvdtQ1ABRmfwPyLpgvv/BnRJbn8oGk9oyHKe9JcFvAdFnRFd9e0VI7Zs54jkHFK7guE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762809923; c=relaxed/simple;
	bh=E0L+eLa07i6HpRxGWbXYE9SthVPZlrPIZkKRc44H4yE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=S45joqqqP41pmyNtBCYjfLUZkYZaMbBHtRMul8ayyq8QsxsxCpUgvNxtOtCfGlMOQFz1ewbOR/NvZeO1PHEmpxU6+jEfqoKAVgvsvD2/w1oKniwJ2FsWLlXvOlxOwYCzLiwjJgdp4wivm+DGUfXPncuGAVxftSHh49KkJ/WwpJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WuYUcCgS; arc=fail smtp.client-ip=52.101.62.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WuYUcCgS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oa6h796+V6ZKY4tO+ZFXRK3Uz5E3Vip/Rvr7Iu3vVoRcDYwSBIF9mYlHrgH+v281zaOv2M2h/jWJMzszBe17E3thYTqxeoj8AxXqZrt2oWYvhulqndHY0fDkyRnU+h3YQZ+f8IHwAd4WMurMDWPMaSbzITZWTw6Itb1IK8PM3gaMzksljY7FpLhcAUURafJxidTC+AoezAAXZwPcIkrgyYzK57IO+5J26uOFbPW7cqHkrMIch0TDWMdk80Qg+rOhDYRZq/r5S1T+RJj2krCSGL9SzC25uue3/NpiHkkaCYjxSYZkGLQkAsbAUi0Peu4SEfetiemjhR/Yy5FsgkCBCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=awTg2qF9FkJR85l5vpJHdl/HwRbflk7wamYLXngGd2A=;
 b=zN1MyBkYUSom1X4tdMUMyvvAw69gfuzz6yW9AuqT7DFI/+5bmez5y++qKnaXjp59ESKmLRSYhldXghImUX/3Az7LayiUTh+1821SF6YrLX+pB0CU/aW2fEa71+sERtQREWkmgdkWZO0Vz7i4X/kBrWiGBaQfZoPzECFaLDLidTp1ls8eiXS+UDvjgsr2yXHkMpLrRAbyGf04JarXluNvGEEfg8UGBwDoTS1zlyWxZxKPMUFLlC2u/GrOiYbfdqjfj4hgZip5sDOWdRTKtU0EQDwTiw1p0ipL6wGRYr/E3l+2y05riJHUC63bH820uGLQUb8fdXqtI9x4fK6WCsLAIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=awTg2qF9FkJR85l5vpJHdl/HwRbflk7wamYLXngGd2A=;
 b=WuYUcCgS69rvEY5ECRth56UdSvQJCC87KkFM0v0t3SPsuhAEa+F3qTOJktvJG/VUMhlrgfgd1pQJ1TKfCBBaUTWSiS0iPqoy2/Ha9oj1UP1qDERiA5V+8boYjr+J/vitEkC3Xcztk1Y4YiLu7BkJhfIhcf+tnCOHxNkGgkAdvONDz40zf2hjbeHV4N/bhWPqM8n4CqWkxY65ldxlP66wUo2MCH7Jf3zNIxP8xUx+qRTiscIf414K8Vv5M3I5h9br2j8J7lLo3rR0JOVac2J0iWHxZmtbYPkzMtmdE52CWhihfVzm1GSAuAMvn3DnLSj7iUWhGl31wj35mU7EpE03SQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by SN7PR12MB6862.namprd12.prod.outlook.com (2603:10b6:806:265::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 21:25:17 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 21:25:17 +0000
Message-ID: <82c8dda8-6fcb-48f9-bdaa-f3d1431e41ae@nvidia.com>
Date: Mon, 10 Nov 2025 21:25:12 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] memory: tegra186-emc: Support non-bpmp icc scaling
To: webgeek1234@gmail.com, Krzysztof Kozlowski <krzk@kernel.org>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20251027-tegra186-icc-p2-v4-0-e4e4f57e2103@gmail.com>
 <20251027-tegra186-icc-p2-v4-3-e4e4f57e2103@gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20251027-tegra186-icc-p2-v4-3-e4e4f57e2103@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0260.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::13) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|SN7PR12MB6862:EE_
X-MS-Office365-Filtering-Correlation-Id: 59b556f2-df38-46f5-29df-08de209fa4cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SnBTWHlFK3dmd0xxMjlpK2RtcWh2eXlSaVN1bVJqa0cxN2Y1Y3QrNmZpN0E2?=
 =?utf-8?B?QkFNMm8xWmtqQTkrbWl3Nzlmdko3MEVDZDVkSmRER0RUUkdzWmZ3cTREbm9X?=
 =?utf-8?B?MmJodWRwRlRBMGMxQ3MrcW1jakF1dWVoZ2JTOGRlTUZwZWx0dnFqVDN6MUpu?=
 =?utf-8?B?dWo5RzFvWlY3UHZjRkhkclhMV0RSU1JNRjdGdVcwUUIyN0x3QWFWdWVTZXF0?=
 =?utf-8?B?QWRtUkJEWFFweTVOekR4NVhsa1NjS2oxN1FGMFBMcVZtKzZLaDBKNEpRNVEy?=
 =?utf-8?B?OTN4WjJlOVpPMExGS3pYSHlKdXR1VmZNcmFxOW5LTS9sekJFV3dJVzJMUlo0?=
 =?utf-8?B?ZWhMWmIrY2dLRGw3NFpyRGczaWlGdFhUekxBVnlPbnJjVTY1NUdGRkNtMmJk?=
 =?utf-8?B?cVFxaFRqREtaWng3SE5tUFpMV0l6QWZ6TlpxQS9tVmlmZSswbWJCeG1qdzU2?=
 =?utf-8?B?YVc1QnduV25IdCtZcXR3Wm1Tbm9DbU5uYnhSSmpRUkZkdjVNMlZGcWtxQUVo?=
 =?utf-8?B?MDZUQ1dPUVpYdUhtQkZyaWhSb3VqYUN1aE4rU05WMVJJSDVESGUzM2R3bnkw?=
 =?utf-8?B?dXpOSjdSZzI3V1NRMjJXT2FHdHlRNWU0blhlUHRXSUdLUWZkSnlaYzV2WG0x?=
 =?utf-8?B?ZmJ2WGs0T09IRTRsY0wraTFzNWV4Yzg4N1duUnk4a2srNDU1TUV1bFo0dndm?=
 =?utf-8?B?aVRFT0xWeUh2VUllNTdoeVE3RWlMM2RubW5rVzhpWVg1VUUzM3VaV1hDUkJr?=
 =?utf-8?B?bUxSejBubnIyaWRQR2dUdytteUl1a3N2OW92cTcxWmRzb3pKSDlFMFJCdzBh?=
 =?utf-8?B?WlMvUGRPZUlpNmlNYmhHZnBzeU05c1lmTHNiclFabHhQMjgxL2NIcDZmRUNO?=
 =?utf-8?B?U2g3Q3lOajdHVHVYUGFyaVoyWGNSTVE1SHJYVEZmSDQ2alRpbXAvM3NUb21V?=
 =?utf-8?B?WTAra2pwaTN2QkUxY1crYkcwVHlJZVo3Zm0wanM0eGZYdnNnZzlNVlVrVzFO?=
 =?utf-8?B?QTlISktqNVFMK3YvQ1E0djM5S29pVmd3a3IxTzFBQVJXZ29mYk5aOEhqS21O?=
 =?utf-8?B?cjlQb01TU3VEaFBETkV4V2lUWWQyeXMrTmpaYnhHYmRYOEpWd2FmbXRWaXg0?=
 =?utf-8?B?aVl3OVZva3dQSk81YlMrN2M1U3UxYm1jRnNHcGViTm5mYy95eGZQNThIM3ZB?=
 =?utf-8?B?anVSdm5GcGlUeHQ0VlFOMTlHZ1NrRGtWNE1XSDEvVEIwOWtDTEp5VnV0Rk5n?=
 =?utf-8?B?T0RxcDlUSVBzTzdGZkRDZjhhTDdsS0M1NmxzbGdrdmFucTlIR0FWWU9oRitl?=
 =?utf-8?B?RkVjSGhUSkdYTFZ2dFhjNnA3VTBXQ0g0enJxcVMySHpvTGVTemI3eUQ3NWNj?=
 =?utf-8?B?TitIcHJwSTQ5WFZUU0lEUVNZeHFySXdSc2liaEdGNFZHNjNHa2phU2NCSkpT?=
 =?utf-8?B?NGFST3hZUGhkVDVPa0NuVlA5bnI4dzg4a0ZmbjNKdGZuVXZvZGdjS0xrSjRj?=
 =?utf-8?B?TTNhNEd1Yi9ETlRlSnRzUlpsS3RSMG8xTG5ZYjZEYlhkRUtMK3lQRUNNbUkx?=
 =?utf-8?B?elM1eE9mbGxpWVFmaVN4akRPcGJ3MlNqVGJINGRydkFWa2ZGWnd4Zkw4bENk?=
 =?utf-8?B?YVN3UjlXN0lSTUU0bzYyNklhQnRkUm9TTDh0WUgyNGQ0MUF1akF6Rnk2NVIr?=
 =?utf-8?B?MkNlMjExTVlKanVtc254MWo5ZWdhTFpuVVd5TjNUVkszMXJqN21CQlZPdjdt?=
 =?utf-8?B?M3JlTlZoaUtDWDVZVEtjUDRabWEyTGdBWmdYWXdMRCtqZmdLWGN0UnFodXBn?=
 =?utf-8?B?VDNkSHVhV1pFMWpCU2FOQzkyN3hJRTRyUmZPbGdFTHZUREVUM3crZEZIWFlN?=
 =?utf-8?B?OGorYXdHWHlQRmprZEtEcC9EMnZTREJEay9lTEEyelN3ODlQZ0N2RjJBM05U?=
 =?utf-8?Q?IsugMEPSmVUpz7dQQcHTMAEtFssx8bwZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2JmYktQek1hSHVZSUFwVVdGcWtsYVAyV0k3SDN6NGNlejAvSUpPZVN3UEVu?=
 =?utf-8?B?bEZwS2hUeXlqVjdqQVYxZG1TUS9LWE0zMUJ6SnhBU1djQW8yRVNTaTJuNUNk?=
 =?utf-8?B?eXNqZ3JTTk9xNWVRcDUxbG52NVdNNTJLTVZ2SE9kS1I5Wi8rMkZUcURWOUpm?=
 =?utf-8?B?ZDJzM1pwdVo2Y1c0MXl4SmE5UTdxWXZ0OGIweGhuejlreEVFK0Zld29USURJ?=
 =?utf-8?B?RjZLenhHdFNzeVR0VE5zQnBlTkk2czRjYTZISEJzV0ExMTNCMi9zRkJ4eXBw?=
 =?utf-8?B?U2FXeFpFUHZLYm9Rc3ovejNieEZWRzNIa2Npbi9tL1Z4SUVrNG1WanhMSGpK?=
 =?utf-8?B?RHVSOFBIWk9mSGtDbUNqcDhmWnNnSHRpVGRCTHhVT3FtS2NDd2I2MXYzUWdP?=
 =?utf-8?B?VjB1Uk4zNUNUNHBpcVhTem82Z1BlUDh2QStrVjh6N3BZT3VhbkxlVDV4UkV4?=
 =?utf-8?B?ZUp5NGIxU0szQkRXM0dzUEVCUDQ2MVZPWFp6aWoxei9mTXRSQk5EUHhhY1Nk?=
 =?utf-8?B?TnFKNXUxenUvTlFoRGdSK3lDZy9rWG5oS0xUQ1JyN1Z3Y0R4aGNsdklRalJ4?=
 =?utf-8?B?Mzh4SEU2Y1o3RXFkU2FxY2FuaUFBd0diNHBUd0tEOUhWbGZVRDIvamY0Q3cx?=
 =?utf-8?B?QW9TRENFcVpwU2dEQzl4NWpOWWdIVnVIQ1BXUDFPM1lEakJmVCtoVUVWU1lS?=
 =?utf-8?B?RmYxVm81NG9qeUJTK1RRREF5ME9hVldBVW96VjJUTUU3QW1OblRROHBzeCtU?=
 =?utf-8?B?NjA5alJHR3Q5ci96NXFxQ2dnQjhybnRRUHpiRDdub1ErcUhlVi9GZERidno4?=
 =?utf-8?B?Q3VuVmVnMlRDeHVXbDVadSt3WEw2QzYvUWo4K3VaMmFCS1ZYazNCQXRMU0c2?=
 =?utf-8?B?T09rZm1tdU9ET29MUzhhZGdhbHZ6YXB1bTNSYWZ3cG40MVdVOU5yWG92Njlj?=
 =?utf-8?B?L29rbngyN09XVVRvRzZpNVFQclFDNldFTFMzaWFUbFRhYzQrSjNpWUxVY1Bs?=
 =?utf-8?B?WmRBQ0QvVEQrUjJ0Z1g3MFVqUy9nMFk1MWtXdFp3RjJnQWtuUVFFdVk3cnJ6?=
 =?utf-8?B?U2w5NW9PcU9QaUVRMytwbFlVRzcxS1Y4S2tTS2pSNm52b3JpQWRCRGVpbll0?=
 =?utf-8?B?NWFZdkVmWHBJdHJjOGdlMDZLZjNOYWJpZkVuam8zMU9QelNXQWoxWDJQd215?=
 =?utf-8?B?YXI1UzBTYjAraWNQRmNQdWRKZUJscjNaRlRiY1I1cC93bGRuZzdzUUdVejl5?=
 =?utf-8?B?dEhkVEZRR1Y1YW1naERxK0Z1Z2gzSXZPVXg4cjNSSmxJMDVEaUtkS0sraHQr?=
 =?utf-8?B?ZXBJN3U3NkNiNDY1cFJFRTBoNmdCeXRmTjhEaFR0a1pEa2U5WHVsR2xTcHA4?=
 =?utf-8?B?YnR1MG55Mm9rWXcvaEx2WjVBZUlOVWZ4b1IyRElLbGE3ajdNZnFFMUVRUjRm?=
 =?utf-8?B?YmpBWnFJQ2NHc0dvMDJ4ZVZ2NEk5QlNkRytFVmk5eGhPUlpnbGxLYTRsb2dj?=
 =?utf-8?B?V2M4LzBWNkRqVmJURWVrT1ZBbDUyRDJiTFdiZWxFSGFlM2pkNUVsOXNHbW1M?=
 =?utf-8?B?Y0tlOFFrcW0zWm5uSFlRQkpvek82U0xLaFVEK2lhK0hwSDBPd1VwMUtvUGl5?=
 =?utf-8?B?QTUvMEdPNDNYQVNHNHQwSm1jaWVoU3lKcVE4SnFvVnRBN1Zna3I2VHhBNHFi?=
 =?utf-8?B?WHVKdml0ZTZvNTZMd081NC9NM2MzNUxDNCtncGd1Q2dZSEtkREhnaHhkR3cw?=
 =?utf-8?B?YlJkb0dEMEFJNEVtdVFQTTBsYm14VGNKWTU2R0Nlb2tPMEtOdlJpQXlqUjlj?=
 =?utf-8?B?ekJVRXZuWmdkNFR4VCtuQ2d2OHdXY0J5UU8wd2xIaWJqbkVZU1B5RTdFMGIw?=
 =?utf-8?B?b0ZkYmczbXppZmVpYmJmMWw5ZGM3eU8vT3NHWGJNOHFnb0NaaTB6Q0lQbEFt?=
 =?utf-8?B?REwrT1VqbWRmcGNJMXBHMFRUbU5TS1RQOXZuUEg0cEVwcFVlR1lkenFwVFVl?=
 =?utf-8?B?Mm5aNXZIazdEaEVpUHR5YVhyME5WWndZdkI4YW1XZ0ZiVHVMZE5wUFFMWVlq?=
 =?utf-8?B?bUNlR2ZTTklrRTJBbFZ3MzlYRVliSTdlNWc5WGRTNHZCc1IraEMxQnZENkRm?=
 =?utf-8?B?aXgzZzhpaFNaWC9ueFd5KzBHYU42SnNxaTZwL000SUFPMGRDVVd4WDZzUHRp?=
 =?utf-8?B?UERHMDExMEZBWWF1VlB1Ykt5V3lVRHRrSEtEdVVoOGhIaElCZ0JIWTI4blE0?=
 =?utf-8?B?TThwZTMxYnAwNmE2bVpHWTRQNVV3PT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59b556f2-df38-46f5-29df-08de209fa4cf
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 21:25:17.2495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RYO0z6zA1dDCHZPyqyOCq5msTCLe3ecR7q+w/KMamQrjrlBK9x4077pw/tHgKMrXrvkzz4A+d9dq6V1OtkQy2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6862


On 27/10/2025 18:55, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
> 
> This adds support for dynamic frequency scaling of external memory on
> devices with bpmp firmware that does not support bwmgr.
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>   drivers/memory/tegra/tegra186-emc.c | 132 +++++++++++++++++++++++++++++++++++-
>   1 file changed, 130 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/memory/tegra/tegra186-emc.c b/drivers/memory/tegra/tegra186-emc.c
> index 9959ad5804b444b269456d1fbae87b4bc111661b..74be09968baa7a0fbdce4359f470ce56b18acb10 100644
> --- a/drivers/memory/tegra/tegra186-emc.c
> +++ b/drivers/memory/tegra/tegra186-emc.c
> @@ -18,6 +18,17 @@ struct tegra186_emc_dvfs {
>   	unsigned long rate;
>   };
>   
> +enum emc_rate_request_type {
> +	EMC_RATE_DEBUG,
> +	EMC_RATE_ICC,
> +	EMC_RATE_TYPE_MAX,
> +};
> +
> +struct emc_rate_request {
> +	unsigned long min_rate;
> +	unsigned long max_rate;
> +};
> +
>   struct tegra186_emc {
>   	struct tegra_bpmp *bpmp;
>   	struct device *dev;
> @@ -33,8 +44,90 @@ struct tegra186_emc {
>   	} debugfs;
>   
>   	struct icc_provider provider;
> +
> +	/*
> +	 * There are multiple sources in the EMC driver which could request
> +	 * a min/max clock rate, these rates are contained in this array.
> +	 */
> +	struct emc_rate_request requested_rate[EMC_RATE_TYPE_MAX];
> +
> +	/* protect shared rate-change code path */
> +	struct mutex rate_lock;
>   };
>   
> +static void tegra186_emc_rate_requests_init(struct tegra186_emc *emc)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < EMC_RATE_TYPE_MAX; i++) {
> +		emc->requested_rate[i].min_rate = 0;
> +		emc->requested_rate[i].max_rate = ULONG_MAX;
> +	}
> +}
> +
> +static int emc_request_rate(struct tegra186_emc *emc,
> +			    unsigned long new_min_rate,
> +			    unsigned long new_max_rate,
> +			    enum emc_rate_request_type type)
> +{
> +	struct emc_rate_request *req = emc->requested_rate;
> +	unsigned long min_rate = 0, max_rate = ULONG_MAX;
> +	unsigned int i;
> +	int err;
> +
> +	/* select minimum and maximum rates among the requested rates */
> +	for (i = 0; i < EMC_RATE_TYPE_MAX; i++, req++) {
> +		if (i == type) {
> +			min_rate = max(new_min_rate, min_rate);
> +			max_rate = min(new_max_rate, max_rate);
> +		} else {
> +			min_rate = max(req->min_rate, min_rate);
> +			max_rate = min(req->max_rate, max_rate);
> +		}
> +	}
> +
> +	if (min_rate > max_rate) {
> +		dev_err_ratelimited(emc->dev, "%s: type %u: out of range: %lu %lu\n",
> +				    __func__, type, min_rate, max_rate);
> +		return -ERANGE;
> +	}
> +
> +	err = clk_set_rate(emc->clk, min_rate);
> +	if (err)
> +		return err;
> +
> +	emc->requested_rate[type].min_rate = new_min_rate;
> +	emc->requested_rate[type].max_rate = new_max_rate;
> +
> +	return 0;
> +}
> +
> +static int emc_set_min_rate(struct tegra186_emc *emc, unsigned long rate,
> +			    enum emc_rate_request_type type)
> +{
> +	struct emc_rate_request *req = &emc->requested_rate[type];
> +	int ret;
> +
> +	mutex_lock(&emc->rate_lock);
> +	ret = emc_request_rate(emc, rate, req->max_rate, type);
> +	mutex_unlock(&emc->rate_lock);
> +
> +	return ret;
> +}
> +
> +static int emc_set_max_rate(struct tegra186_emc *emc, unsigned long rate,
> +			    enum emc_rate_request_type type)
> +{
> +	struct emc_rate_request *req = &emc->requested_rate[type];
> +	int ret;
> +
> +	mutex_lock(&emc->rate_lock);
> +	ret = emc_request_rate(emc, req->min_rate, rate, type);
> +	mutex_unlock(&emc->rate_lock);
> +
> +	return ret;
> +}
> +
>   /*
>    * debugfs interface
>    *
> @@ -107,7 +200,7 @@ static int tegra186_emc_debug_min_rate_set(void *data, u64 rate)
>   	if (!tegra186_emc_validate_rate(emc, rate))
>   		return -EINVAL;
>   
> -	err = clk_set_min_rate(emc->clk, rate);
> +	err = emc_set_min_rate(emc, rate, EMC_RATE_DEBUG);
>   	if (err < 0)
>   		return err;
>   
> @@ -137,7 +230,7 @@ static int tegra186_emc_debug_max_rate_set(void *data, u64 rate)
>   	if (!tegra186_emc_validate_rate(emc, rate))
>   		return -EINVAL;
>   
> -	err = clk_set_max_rate(emc->clk, rate);
> +	err = emc_set_max_rate(emc, rate, EMC_RATE_DEBUG);
>   	if (err < 0)
>   		return err;
>   
> @@ -217,6 +310,12 @@ static int tegra186_emc_get_emc_dvfs_latency(struct tegra186_emc *emc)
>   	return 0;
>   }
>   
> +static inline struct tegra186_emc *
> +to_tegra186_emc_provider(struct icc_provider *provider)
> +{
> +	return container_of(provider, struct tegra186_emc, provider);
> +}
> +
>   /*
>    * tegra186_emc_icc_set_bw() - Set BW api for EMC provider
>    * @src: ICC node for External Memory Controller (EMC)
> @@ -227,6 +326,33 @@ static int tegra186_emc_get_emc_dvfs_latency(struct tegra186_emc *emc)
>    */
>   static int tegra186_emc_icc_set_bw(struct icc_node *src, struct icc_node *dst)
>   {
> +	struct tegra186_emc *emc = to_tegra186_emc_provider(dst->provider);
> +	struct tegra_mc *mc = dev_get_drvdata(emc->dev->parent);
> +	unsigned long long peak_bw = icc_units_to_bps(dst->peak_bw);
> +	unsigned long long avg_bw = icc_units_to_bps(dst->avg_bw);
> +	unsigned long long rate = max(avg_bw, peak_bw);
> +	const unsigned int ddr = 2;
> +	int err;
> +
> +	/*
> +	 * Do nothing here if bwmgr is supported in BPMP-FW. BPMP-FW sets the final
> +	 * Freq based on the passed values.
> +	 */
> +	if (mc->bwmgr_mrq_supported)
> +		return 0;
> +
> +	/*
> +	 * Tegra186 EMC runs on a clock rate of SDRAM bus. This means that
> +	 * EMC clock rate is twice smaller than the peak data rate because
> +	 * data is sampled on both EMC clock edges.
> +	 */
> +	do_div(rate, ddr);
> +	rate = min_t(u64, rate, U32_MAX);
> +
> +	err = emc_set_min_rate(emc, rate, EMC_RATE_ICC);
> +	if (err)
> +		return err;
> +
>   	return 0;
>   }
>   
> @@ -329,6 +455,8 @@ static int tegra186_emc_probe(struct platform_device *pdev)
>   	platform_set_drvdata(pdev, emc);
>   	emc->dev = &pdev->dev;
>   
> +	tegra186_emc_rate_requests_init(emc);
> +
>   	if (tegra_bpmp_mrq_is_supported(emc->bpmp, MRQ_EMC_DVFS_LATENCY)) {
>   		err = tegra186_emc_get_emc_dvfs_latency(emc);
>   		if (err)
> 


FYI, this patch is causing a boot regression on Tegra194 devices. I 
noticed that tegra194-p2972-0000 and tegra194-p3509-0000+p3668-0000 are 
no longer booting and bisect is pointing to this. I will have a closer 
look and try to see why this is.

Jon

-- 
nvpublic

