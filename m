Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE8840F74E;
	Wed, 22 Jul 2026 10:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784716736; cv=fail; b=DaK17E1WI0hNVPAoGoBXyLocD/Ro3t/9CO18XC/a5zvCmDG4Zf1s1hiygw1NVta8Arob1w62926KdnDcmV76PpKmdpsXsuZxPbTAigLt8f2Wxqtzj18l3+8OpiVYkAJXU1AjlorDkXwZ4cleqyeI0sWMOD1o8cYT53uclU9qH+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784716736; c=relaxed/simple;
	bh=/7njgwk3LXPNtnv/mEhMKP2pKBStl8f4oxLTCfzO+v4=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=i4T5yD/UOKnKDGV/48PnrUMH8S4EBgjpfI1UzSoNo/9UcBUG4Ozymgk7w/fvAeFztLmMbuAk48GkeAH0FgR8K6Ys/2prfXRXLmwcEgp5WLtVIz9YncUQ076njpR8ZAoVNZ6G9eRtcHMu7o5ftpW+iR3DZA88tgAZdQL9RoCV0RM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TJYN7vDa; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TJYN7vDa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784716734; x=1816252734;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/7njgwk3LXPNtnv/mEhMKP2pKBStl8f4oxLTCfzO+v4=;
  b=TJYN7vDaZwEPYqF6inLdvLGibmyPryRndzX38kKqIFwDgUEi1FoXRktb
   i6IPl0vVomQoFmBwHasDpS4lSiusmFuXdamAaYzZGVhKTqGX0DptmldmP
   E8xCis+mYAkNnoNtzMYDVWitd8l7dxXYD42p9hu2qyuu4UJqCe3b85y3W
   DaMqTo9RYmBczrHX8ABnlQQV/v/G0f8TCZttdNu2JvS5OTaULD2+YmymK
   Yh84CQrgxwd5AtSm73I/Zfgvsudp+e55f3swGe7fr6G6zh1HWbapPnWSd
   6PMIYrOlktaOekj1x0RNlhmUZ6XKYnXBkcwcl1TGRPMLB1lW/y5twH/YW
   Q==;
X-CSE-ConnectionGUID: K3G13fAqS2iZOFsszTAPVA==
X-CSE-MsgGUID: 1vhNHoL7SQGnKPCdg7KRIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="84474685"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; 
   d="scan'208";a="84474685"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 03:38:53 -0700
X-CSE-ConnectionGUID: F1Wn3v0jSomIgD/e1Dm66Q==
X-CSE-MsgGUID: +7nW0uiyR4mO5jvYTRYvYg==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 03:38:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 03:38:52 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 22 Jul 2026 03:38:52 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.2) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 03:38:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sc7lNP/l4kuCBRL1viKiulRP0oIUyOyrf+o00zWbty0E0swBAUoLRmVzIg5FDZ7O0GyO/B0iDdG5675R0teSjBUgotg8K4FpLkFyMnCLUdS9Gt6n1EbuJSVRVDioVs5EzYNpgEbqBXfI26mZLekjjdRg1b1+YqELXeOqitFewhm1yLZYKyfqVagkMu6Y/yP6d3k5/Kr+pCFGm+H+QdaAFLdVw9QCITAppNmsrF/4JpLtLL++axjAPsx2V8wPxUS+4ovbCbIZnExjgo/uNg4UYIK5UbIyZPkuxVcQ7EmpQuUNQep5sY4xtJq79Tlg0BYBfS+dZus1MQ5BGA5+/Y/wOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e+gugPIe0TJOlKIHqF7TXLzrUxxJuPuM3fYt8iy2lIM=;
 b=KsjAbaSR4SxOnD0t0eq6Juu16+q7mLZRTrDQLyP83Lom30qLYQupooqvcdzHmI12Ks4XzcnMlKs6AoJLZI8Pu2kN8mC/HhLrAV73RClYAKQ4NAuQSkz1t1Ox39UStPeTi5yp3ARpu04iiu7/LTTkgs0Zk4TTKAWxmhYy3S3q/Jq+tQVVR8uBqESu9oQPlsKAtARPCR+3fUymcl9t3lxLPnd19ZBkdKvfaAOwQx9FLd77pwBbY4vg5xVh4PR6Abf9W0jUX1Ry5LR6bQ+qnh0YmPLV6/hBsOg5mgCJtcbwK718hql+jsfaiv1mRB24um3spYv22GF4mTIHwZlWB6YVxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by MN2PR11MB4629.namprd11.prod.outlook.com (2603:10b6:208:264::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Wed, 22 Jul
 2026 10:38:49 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 10:38:49 +0000
Message-ID: <97465893-3650-4f37-98b7-1db76fc6fd03@intel.com>
Date: Wed, 22 Jul 2026 13:38:43 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/12] i3c: master: Use unified device property
 interface
To: Akhil R <akhilrajeev@nvidia.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>
CC: Frank Li <Frank.Li@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
	Philipp Zabel <p.zabel@pengutronix.de>, Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260721040805.1696503-1-akhilrajeev@nvidia.com>
 <20260721040805.1696503-3-akhilrajeev@nvidia.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20260721040805.1696503-3-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DUZPR01CA0103.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::15) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|MN2PR11MB4629:EE_
X-MS-Office365-Filtering-Correlation-Id: c0129dac-2a10-49b5-23e1-08dee7dd6a80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|6133799003|18002099003|22082099003|4143699003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: SmLTPjqWX7i6SJoPEhPj8DFqGnPp5pFHnNUf4B3LYKIwuohSZOAVoqmHFQib8R4zA6m/lznHqyWsBRya8GBdtIp9cPar1y86isUXPM3lP2lvNZrWQhqseZ8UFAlWFG74BtwWvWL/lHLoaypcvmafZ1+suRxkw0SARVmN1anFve8Lf4Uun/fKw5j2mDkk0NQlnvY5rWDnsIfxT99RYojwx3ZNbYl7Xf51Mz2ReyZZiEBh73z3vwhntz5QJPSCjhI83pxNdnZRHpST/4dGOYAOvNzdQPdSskvqcYvY5YW/i105I8pi42y0gBPa7tl1RqBDqOjx/Ur3xWDphwblcoSFOvJD8DahPioSbQd1xVHBomb9tn5AuFvDFEhSI5tLKxtPPaHX2fNkKqGDMkZ/WFSOR7HtUMErViM8xMBw9iNKDgBezZVUdwRYtksMn9QfikiuQ67bCy10vazOW1vgv9ASSfZj8bBhtJ9th8opyTD3O7DDXO28pF7cWT7+CDQ0VN2yfKPIvTMXBxfAYdWt6E1HBkVKpM/bW4EAGWSxZU7NRPy8OrHa51iSBryfJTyMeS4C8GTcVhMRuFXKOE4xZvh2J8XL5H9bduOfJXfP4+UL4sEarFCVF3WrvtE3TMP1ENfvMi2IbX/vdwGFL0U4zKCX4K3vBFp947BqweX+EVPoEfM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(6133799003)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2dBOUxqbWhQOTRyNWVmS0d1T1N5ZGVraFozdEVKWkp4bXQ4UGs4clg5blA4?=
 =?utf-8?B?M2N5a0YzSFFKQzNGOVNIMmcxckdUQjFHVWRwajR5L1EyUW92NVdIL2Nmamdi?=
 =?utf-8?B?WUtXMTZCMENmR1NVdHl4SGlnK1ZTMElLU1ZiV0xNZnBqL0g3NUQ4K0UzM2dE?=
 =?utf-8?B?WVpaR2FhU3NidVFwdHJ1ZzVyVVg1MmpPRU1QZFlsVWxoWVJ3bm8weEhEelIw?=
 =?utf-8?B?dDVURVNMMEc0WmNWa0R6cm9DRWdzMEFMbkR4ZXU5MWI1NXN3ek1KQlQyRDYw?=
 =?utf-8?B?Y3VkQWFQNHIzcUpUaGNOallDUjFpV2QzdkJhZlVUbldMR2Q4WnNkaUtIeUs4?=
 =?utf-8?B?d3pVZ0hxUUpYeXhUWWluRE1iekR0NEZUVUo3SUZEaGpXZEU2Z29FeE1hTHNP?=
 =?utf-8?B?cmFxbVpWV1U5eEtwVjR5NnNTVjhUTGdkVENmUDBGK3FQdlBIam1WUE16YmF2?=
 =?utf-8?B?TlJKcEw4REVMVGhjN1RqU3ZYK0JwYXV4SVRzRkZuM1pEK3orZ0FTemh1YjFX?=
 =?utf-8?B?SkFuVHBkK2JVZFJCWEdtTll1RHZERW53TU5wNDFJZmlyaEdXK1ZDWGl6NnNE?=
 =?utf-8?B?R1NUK1RWcmRzc1BHV1kwYjFXVkdhR2d3ejRZaWNWKzYxVVZDRkYrWGtLS3c4?=
 =?utf-8?B?R2ZZcEY5QzJxVEdreVpqMlFSWDMrSHF0VHl5TFBJTnQ0VWRIb3pwaFJFSHVk?=
 =?utf-8?B?V0FwK3lGY3lVTmhwSXNITVZ0V3Z3MXljZ3IvU0pqSzR6R3RFRGdIb1J5ME9D?=
 =?utf-8?B?Y2syaU1RM2sweDhCOGl6Mmd2VnltWkRaR0ExNkxocG5Ed003TTJWeUFMTEUz?=
 =?utf-8?B?ZFduRUF6Q0xzang0UlZlL0RtMDIvSmdnK0RqaTBTQTV6QXJFZ1Z1Z1RYQi9j?=
 =?utf-8?B?SlE1VnhnMVR3WWRVeWl4ZE03Q2V0U21zOGJXaXdzYWh4N09jTXlnU0lsK1E2?=
 =?utf-8?B?ZjhhWkZtUC9mUWNIZ2dsZE5XdHoydHlINWtHQlRWcTFScXRmcTVTVzhmUndY?=
 =?utf-8?B?MjJnVHpDbTVOKzM1NkxxSitrNTZkN3lSdnVhdGxNV3FGMjAxVDBqZ01adHZB?=
 =?utf-8?B?YjdKM3NUdEt2VXlVSGoyK2V3bW9FLy91YXhHSlRKMzU0aU41UVV6YjlnUVRU?=
 =?utf-8?B?aHhrelRYOXJIWTh4b2doalozWEo4WTUvdDFtUkJpSHhNWTlJZm9rZldHWktk?=
 =?utf-8?B?SFZORlJXMFM3MnFJS3BmekhjMEc4ZXlWSHh2NVFmSHB1S1NSZ2dWb2lIdUVv?=
 =?utf-8?B?Q1dJMmNoMTdFQThJSnlPVTVkOUFmSFl0Y3ZlcXEyUUFwOUZoeEg2OE5XYmda?=
 =?utf-8?B?RTJjZG51V3p2bnAvQXhtWVBQSXkxRnVJNzNsckovRVFJakVSaGhlbkJoN0NI?=
 =?utf-8?B?N1V2ak5FMG5jMk5RSHpxNFZUVkxudW9KbkpHTTY3Y1k0NWJGd3VkQ0dLVlZG?=
 =?utf-8?B?K0JBb3NrTWJ6alIvNUVveEgvNndwQTZMdEZ3WGY3WU9qVEN1SlRNaVFLTnFD?=
 =?utf-8?B?ZURYWXIvWXRZUGNKbXRvQzRpckNxZDY3aUQ2Y2xncDh0S0JyaXBZK0k0a1RN?=
 =?utf-8?B?Lyt0NlFtUG8wdkFqTDNvc0xGZllDVDBiMDJiME9ObkwxS3B1c2VpUTRaTUR5?=
 =?utf-8?B?VXVNbmcrQmlnamdXQXZkeWZ2aWg4a2pkK3hORjNvRk16R2FlS1VwOXhYRTdn?=
 =?utf-8?B?MExidHBxZ1N3NjVlSkUzNXZIVlNFQXZSbGRnb1dLS0JPbXlTaHFMV1pGMjBS?=
 =?utf-8?B?RDJMRkdMSjBjS21RVGN6bUZyczlWZ09qWWU3NkhhdlpSTTUwUjMzL0xVcUNK?=
 =?utf-8?B?alROaWo2M2tVMlJ1bVQ3ci9zbFdLZHhhME1hc2lTSHdaWE9SVHJUUCtCSjln?=
 =?utf-8?B?UXpGa3loUkdhK1FsWExXUHduOEVWc2ZvV2h3UnBtWTVjVXlTdWhLOWlFYVZy?=
 =?utf-8?B?K21aNWRmNTFFdUgvY2Z6ZDlpU290K0NrYTFPQ2VFcm45WXNHWFZNSGdha1lD?=
 =?utf-8?B?Rk9iK3ZWT01JREJEcjdNQnBXRHZTT3FHd2o3ZlRRVzNONXJhU2x5NEU0S0Rz?=
 =?utf-8?B?a1dycTNpUm1aRU1GbVhYQUUwcjdGUFRpTjkxSldaTUxRTEdoT1F2Y0JiSXFL?=
 =?utf-8?B?b1JlRGdYNVhqaDJaK21YYVQxRjFycUoxQ1RxdUNUUGZmYUQyYkIwbWtEWVZt?=
 =?utf-8?B?UFN5QnBldWY4NWtLbFhXYmRFVy9SOFduQXRpTlRvSTlnYkFXTXlpSmQxUGcz?=
 =?utf-8?B?U0hvUmh6MjhTQUtBbmFhVXhteFc5MzZpNFIycmlCaHcrRzB4NU11QkdLQnFr?=
 =?utf-8?B?NjlKd0dtSWpNYTd6VDVrcHFRUzlhMHRQeGNHK3h3OHRxM3JZNUpQT00xd205?=
 =?utf-8?Q?AGBWUyNugkuO6kzg=3D?=
X-Exchange-RoutingPolicyChecked: hkSTgHlck2cefqDMqr9DYFtbvQMzoLf06o0tlQyQIcTryIj99Ix1V0bibDtgrVUkE+XMvSEN4GGSYIKQk8Q/w836ByvZhZgoNVyX5IJxWkq5SIa6VHqu10M+8Cp7gRdb+eqwe8j1Vp2fGkwTlSrcYrFty4OMxICyaxPmsJ6jZD1JRsZ0yJLEXdBjkTxkXoX+sgNVaAO22ABA/5GeurdxUJ6LJ1CXeAUV5U3v/OecJaIG13jBXTQr0anP3SoTK4rwnw+N/bXLHn2nDv9vuQDWbWmWbZnLZ9X7zPi47AsHI21aYOg4pdYgoGsLKexMpsvg70Eb9QrDJNJU78cTy3eCJA==
X-MS-Exchange-CrossTenant-Network-Message-Id: c0129dac-2a10-49b5-23e1-08dee7dd6a80
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 10:38:49.6004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ByUoKNol5q/porRWWqkuRXMhJYiTDycpUW8kPJ8D1+2+uN88RgAdQaGdDmsN9+b5Cb2ozl2rzEcOPEnFnB4Z+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4629
X-OriginatorOrg: intel.com

On 21/07/2026 07:07, Akhil R wrote:
> Replace all OF-specific functions with unified device property functions
> as a prerequisite to support both ACPI and device tree.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
>  drivers/i3c/master.c       | 77 +++++++++++++++++++++-----------------
>  include/linux/i3c/master.h |  5 ++-
>  2 files changed, 46 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index f1be38a640ca..4b3d9628bc39 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -13,10 +13,12 @@
>  #include <linux/dma-mapping.h>
>  #include <linux/err.h>
>  #include <linux/export.h>
> +#include <linux/i2c.h>
>  #include <linux/kernel.h>
>  #include <linux/list.h>
>  #include <linux/of.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/property.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
>  #include <linux/workqueue.h>
> @@ -491,7 +493,7 @@ static void i3c_bus_cleanup(struct i3c_bus *i3cbus)
>  	mutex_unlock(&i3c_core_lock);
>  }
>  
> -static int i3c_bus_init(struct i3c_bus *i3cbus, struct device_node *np)
> +static int i3c_bus_init(struct i3c_bus *i3cbus, struct fwnode_handle *fwnode)
>  {
>  	int ret, start, end, id = -1;
>  
> @@ -501,8 +503,8 @@ static int i3c_bus_init(struct i3c_bus *i3cbus, struct device_node *np)
>  	i3c_bus_init_addrslots(i3cbus);
>  	i3cbus->mode = I3C_BUS_MODE_PURE;
>  
> -	if (np)
> -		id = of_alias_get_id(np, "i3c");
> +	if (fwnode && is_of_node(fwnode))
> +		id = of_alias_get_id(to_of_node(fwnode), "i3c");
>  
>  	mutex_lock(&i3c_core_lock);
>  	if (id >= 0) {
> @@ -837,7 +839,7 @@ static void i3c_masterdev_release(struct device *dev)
>  	WARN_ON(!list_empty(&bus->devs.i2c) || !list_empty(&bus->devs.i3c));
>  	i3c_bus_cleanup(bus);
>  
> -	of_node_put(dev->of_node);
> +	fwnode_handle_put(dev->fwnode);
>  }
>  
>  static const struct device_type i3c_masterdev_type = {
> @@ -1044,7 +1046,7 @@ static void i3c_device_release(struct device *dev)
>  
>  	WARN_ON(i3cdev->desc);
>  
> -	of_node_put(i3cdev->dev.of_node);
> +	fwnode_handle_put(dev->fwnode);
>  	kfree(i3cdev);
>  }
>  
> @@ -1928,7 +1930,7 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
>  			     desc->info.pid);
>  
>  		if (desc->boardinfo)
> -			desc->dev->dev.of_node = desc->boardinfo->of_node;
> +			device_set_node(&desc->dev->dev, desc->boardinfo->fwnode);

i3c_device_release() "puts" the node so there should be a "get" here.
Should probably fix that before switching to device properties.

Also seems like the of_node_get() for boardinfo for both i3c and i2c
has no balancing put.  Again, it would be good to get that sorted out
before switching to device properties.

