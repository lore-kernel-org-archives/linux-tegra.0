Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012011.outbound.protection.outlook.com [40.107.200.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D336E31A80C;
	Wed, 17 Sep 2025 13:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758116207; cv=fail; b=Niydmya2fQv7lrUIvxjtFNhcX8npvrzVBmmN2WwBUvzR5S2MjaZMwxBTbTXfOm0uQuqPlgpwdove5FV7LO/C0IiKSL1n/MJrZHpat77pWBAknq3ehM9d6f/uFRcszLTCLJE+aqVFLsFEePSVSDIlH1wO9hIasQwWt/3cBwNpnuE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758116207; c=relaxed/simple;
	bh=v4m1Ja5f7rXctt0xZbgR/RorRFR2J6dvPgX8ZZhEN2Y=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QEi81dQ0y9qYBbefoBFy+lLazloQIkbq2rUneUvEgHgoLPZoTzVCihmTYFGGNziJoXEa8X2t4wAIKxE2jXSiUxLeItYQaWg/+cCOkK0mVRujqEqDLA6JGl+kikAuXz8v8HIZTCsqJG0y97e1TRy4JZ7qcVcT51MuEFeurPt7isU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SuEvidoW; arc=fail smtp.client-ip=40.107.200.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SuEvidoW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NO4Nk0y7yWBLFslBTFFp3QM2oE4gNC0ljYxOjFXUcn4fnpI3TN2hkNrPijuQATdxBeh51MyDV1YMJVRENnkI5okngyab54HZYpm9f5lj+5B93374VjFgt/Nz+H0CEvo2diLgewyCh7QTI18Pqhmh6tN8/elX2cwTmJpiP8VIbVjaue/m0EvWQGD68G/7tGDMbU4IwkaqSodc8ZFWnVgbfpbu6TsthJtY8n9V5DRZxt2hYZevCfwX0EBcYaOZ+h1zCO6CpCDjL88eeQtAlwy1gDYX6eKOu72d/KJbgk9VEKbWp5R71LUhab7+DgFH+n6DYAQRP4kClW2ZAlxgmLprvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ePu4Hs4WSZfoUsPdjV9k0Q4lWPPEy1B1GEYaL00pYqE=;
 b=fRICegg5297zF+DDbeaVQuOb2lccWwY3o+pFCvNxybN0RRCII9HywR7UNY1r3jX9YbUZ9gnHeHDHMUer7YmFLZknyilyf0ms1U/znFnbkJ8rypcgfR+93UhSHZ6rCH5NWevrKN+SG4YcrACLOwqJW/gTGYqoo6j91WlLL9SQSXXFUD6rPMS5f8oeLcVp2IT0hQzLm5nNYQJIE9MxYAx72kImbo1YSF9EqujfGtWfq4KVzWMECIyCl8iDPK94lIW84a3CH5ewa4QYgBekAc7vLzsEC/QPP6Nb/8VDZsKU4zQvnQaKHgatZF4spJ7PDkrYYUIaXmGWP00EmGRO8rWcAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ePu4Hs4WSZfoUsPdjV9k0Q4lWPPEy1B1GEYaL00pYqE=;
 b=SuEvidoWkLdkcOyinhG6YSzdNaY/I8Bf70iuQzRfIfA++e9T/clcTBFpPIwSOMFZ8rBCwYs4exYrtmBClanGW46WQsa5yiWAl7EsMlwBYSpjTodpP7l//M6/dbmnLNhvICd5b8zcOkXnHRL/XIkN5+sPzM38opqSX9QWJim+NUPjkuNbbVw7uUIgb98M9g+xDsCvDXFXYu8ediWudSn1cLPfsOXxMACfa0bF97mkLrKl1xqX06sT3NH1hxpNMIdnJL+xWrvbkVuvOSQLHgGx5ksC5WddLwDOdeckh36PpLngc/5plxgdI9vPEPEYjKvPWa+zo1niLxoHnNhHzffgLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by DS5PPFFF21E27DC.namprd12.prod.outlook.com (2603:10b6:f:fc00::66b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.23; Wed, 17 Sep
 2025 13:36:40 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%5]) with mapi id 15.20.9115.022; Wed, 17 Sep 2025
 13:36:39 +0000
Message-ID: <a3833c6b-5574-4aaf-86cc-66c10801ff3a@nvidia.com>
Date: Wed, 17 Sep 2025 14:36:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: tegra: Remove otg id gpio from Jetson TX2 NX
To: webgeek1234@gmail.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250513-tx2nx-role-switch-v1-1-d92ea1870ea5@gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20250513-tx2nx-role-switch-v1-1-d92ea1870ea5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0618.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::20) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|DS5PPFFF21E27DC:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ffd8b83-1f36-481a-b339-08ddf5ef3afc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dHg3T2trZXdqelVrV21YVDRXWTVoSWFxS0R2aDlteElReGtJc1dtNStTeEdR?=
 =?utf-8?B?N3lvYTk3Ykx0S0l6N0QrbE1wOWhHemEzRU9xbksraElkSjBrelFYYmNQSWdk?=
 =?utf-8?B?S3B6ZVV5MTI1bFVNenpFU1FXeEQxNGE4a1N4Q2loaTg4OGVVTXR2eTBSd2tW?=
 =?utf-8?B?RFR1WmVINnUxOG1XalRtamdQVmQwTVJmV1FYSmZxSEdOSnVHV2hoS0o5VnBn?=
 =?utf-8?B?WEpRTVJjRzBJQjZXd2VlVElraENSdGZoQ2tnMUVhSDRBNmc3azRSZE1qeEda?=
 =?utf-8?B?VjQvQlFWVlNBYzhRdzhQcjhwZ09KWC9WOU1sSGVJR1NlaFd5bVBtSFlOZ05n?=
 =?utf-8?B?cEtDRTg3azM2ZG51ZVBEOVIya05Uem9wOU1XcDVpNmVybWF5eVY0bUE5N3o0?=
 =?utf-8?B?VVVORHBLQ2VDWTlTQ0JxRHpvZmduOFl3RWQyRzRCUVcrOFNNSUN5S2Z6djY5?=
 =?utf-8?B?WE41TWVTSGZjQTJMZDVWdDlXNXJzUXlVZmNCMVMxeFJmM2szeDRsem5seVFE?=
 =?utf-8?B?eWlWZ1B6Wkh5d1EwN3FmbE13d1FPR0hzNWtWTERYUDIxUlhLZHEwaWdJaWo1?=
 =?utf-8?B?WWRNNXJER1JZWHVpYURrWk9uQXBKaXM3UFNqaS9ZZzVWWWZyV1NXU3hCMVl5?=
 =?utf-8?B?WklIL0NZT0ZXUmR2V2ExM3FvL3VTWnI5bGc1aS9QdUpIRVhnbDJEUjZiN1lo?=
 =?utf-8?B?WFZoYTVTTHdyMWhoSWJnYy80SFdycEFRUHhWQldnRmtkWExrbFZaVmhxOGJk?=
 =?utf-8?B?akdWMEVpOG93aGVGdXo2L2thKzNBZEMwb05YZ0xLcTgyN3cvREVuSHJqNlRx?=
 =?utf-8?B?TnlNamRRQW1lWTVKSVk5WGVnUHpGY0RsdUZteHZxN2d2NDc4dk85NmpxV3Yx?=
 =?utf-8?B?d1lmU1JTTURYeHVoTGY1TWx2Y2NjeVpZUmNGVnJRWkFCYmt3b3BaNWIyZzM3?=
 =?utf-8?B?cVkvZFdBUGl6UUFuWnlTVzZaOTR4b1dWYnhDZVhFYkM1YzNvN2VOMkdQenlq?=
 =?utf-8?B?TWdiZWZVVVFvVnJjTTVZS1FtUmp1bXJ2ZHlmY1dXQVdlMkRUMEJoc29ZamND?=
 =?utf-8?B?MVo5Ny9vRFk2MlhTMWFLd3RTdit2S0ZXZFpway8zejdGdEtFUGhlVUg3RHBZ?=
 =?utf-8?B?ZkI2SHhMSWY3Uk9POVorNTluMjVPZFlDcUQyUXp3TUxiREpjcjJsa3E2cFQx?=
 =?utf-8?B?UFFBN0dxQUhzZmZuekpVdE9PaE9xTnV3VUZIMVVWVjFPS1UvaXk4VkppNXdZ?=
 =?utf-8?B?SzhVd2Nib2gySFAyWW5TT0U5WnA5dVQvRStERmVKeHZPQ0o0Q0lmNFJWT1FB?=
 =?utf-8?B?VTRFUUxSZXB5YTNDcVpnbUVQOGcxdlgyUHFMYjdza0lXeU9vQnpVcVVqNkdp?=
 =?utf-8?B?aTNCNnVIOVprNHRKd1JjdUREbmxUUVk2cjIrenZSSHpVUEZaN2hQZ1R2cS9s?=
 =?utf-8?B?OFlrNzR3TU9CMTZMTitucVFXTUtRbzNkekNPYnFmdU9QL0k5bEQ0eFhscWQ5?=
 =?utf-8?B?ZUZZSXF6Q2tybVVQTkEzSlhnbXVRdmdjbmVLUVpRWDZzbVhpTWh2MlMrWStz?=
 =?utf-8?B?Q3AvWWVZeEtncnhRdGIreGx1bmN3d1UvblNRRGNBdkErN0FXeko2bVVuQ256?=
 =?utf-8?B?a1dLaGtYNGdoditOSk4reTF2VktJZ1FjaUNwbXZmVDNBRXhBeXJIS3hsZyth?=
 =?utf-8?B?aWlpOU9jWjRRRUd3bWZuWHkweVB5a3hzd1FpZGJtUEk2RE1sRWdMQXkzMnQy?=
 =?utf-8?B?SlBxd3RZU0o4bHE4V2tEMVNGUkVsdEtVTHdBWjdaVGd4MWRqdXlhYnJaeFJZ?=
 =?utf-8?B?WDc1QkFPUnZZcEJGUThpMVBua3BTWEE2SVgwRm12aUhsK2hXZE9sU1dBTVhD?=
 =?utf-8?B?djB0RWNkOVRYbWU3NjZPV1ZxOEJ3L0UrOExSTFFIUHVha2c3dDF0WUh1NnFy?=
 =?utf-8?Q?GnhPGUiP4Ag=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmdreDNrNk1Ma3ZIMmh0bFR4TkpFYkM1VXkydlBLZWVzUUU0STNYenE0YUxp?=
 =?utf-8?B?SUgxU01mbVVmSHZYbjdJRTR2aCtCUktVcVp2NkorR2pYV1N5dnVtK1NCV0FE?=
 =?utf-8?B?NlRRL0RrS2o3QU1KTzdtNzRtTm15WENGV0RkcWd3eDJQYStZZXVQeVFPMllO?=
 =?utf-8?B?NVFUZzVIOHg5ZjhIOE9KOE5NemZveUtjdTBGM2hJNm1WZ1U2VXhNVU8xQW83?=
 =?utf-8?B?a0txcEtPakdnOHpmOWR2OWJWSnpLcHdvNVJPdEE0cjgyaWhNbG4yQWxWbGp3?=
 =?utf-8?B?SnpYSS9RUURMazJMa2xBZ3M1OFVQaWl0dVNJT0NGdjFKaFR4UEVjc09HME9T?=
 =?utf-8?B?NFBaSHk0VU5OZVRGSWVScDVRallxY1dIeHpFdEVmT0Vmb2d6Zm1pN0Z3cHNI?=
 =?utf-8?B?TUcyVVBIdGVsTmFIblFYeVFsZTJMeWVUZ2ZtWjlPMnRLN1VFaEwvQ2FValZU?=
 =?utf-8?B?Y1F5ZXhXblIxZFFsbCtlTm9TWGhGMzlUMzBsenh1c0FmK0NsN3VqUmkzZ2Vh?=
 =?utf-8?B?WTR4Nk1seExFMXgzL0Z2U3ppd2NlQldSMlYzWTFKMGVMMWNjcmhDU2xwTzcv?=
 =?utf-8?B?WmRnZU1QYUJrbU1kR1NIeTA2VGllemJsaitxaHlzVGMrSjExYUJ2WUJyTUNi?=
 =?utf-8?B?QlN2NnUyTE44ZSsrekNybFJFK1B0LzV1N2poVlVRT24vTzZQZWNJdDh6V1Zx?=
 =?utf-8?B?dXpxYUZuR2F6MXFkQnBGMDIvY1Z5U0NqV0piZGc1b0lCZS9QYkg3NVN2VlVJ?=
 =?utf-8?B?d3R1MUVOMWRFbkgyQzVyK1FBazliTGRzSU52OHlaYjJxd3NYZFE2U0xackpu?=
 =?utf-8?B?dzk3anh3Z0pjSUlwUGtlZnZOTUxTSUw2cUZ1c2JuL25zNU42OVFuYTNwcXJr?=
 =?utf-8?B?RStobEFpODNmMDVoVFlCc0hJS2JmcHY1TEM0Y2tTanNId0dLbXR0NzJzMlhL?=
 =?utf-8?B?aVpHTmNQZnkwem9laHZyZDlmOGVyUkV6anBMYnpVZWFHOStBVUMyb1pCcEtl?=
 =?utf-8?B?bTBkTzlSL045VUFudHNWeWNQYStWYWw3QldxTHE4MVpHbktTZEVRWlk3WVAw?=
 =?utf-8?B?b2tjMTdIem5TMUVaR0Q5eUNhQXJiek1OelZyTTlsRTJCUHROMGZMbDZqY2x5?=
 =?utf-8?B?YjJmU1dsL2I3ck4yWm9UV2VKRkNQbDRrUE5MdXRJcTBGOE5MQkFrREt3OUlJ?=
 =?utf-8?B?c1g3c1ZBbWdVZnZ3VzJXRzUrNkk5bm1Ka3IzeWptTWhsek01OXFTdnlxd3VP?=
 =?utf-8?B?Z1pqR3dVZURSam1sWG43QnFPc3p4RDFvSnBJTk1zNTRGSVB4R0Uya2hsMjVi?=
 =?utf-8?B?QTVoRzVYZzljMU1vOGxIVjVVZlFwTHR1SmpxMjlRVWZ3ZUFMVG9OVEkxMDFw?=
 =?utf-8?B?N0VCcmtPa3AzOE1UVDRjekR5cXJkMXJDb1BISWhxYXI0MUgyeVU3Q0c0aWpH?=
 =?utf-8?B?d1J0RzlvWWlmZWFQMEt5Nk5NeGkrOWRFSFQ2Rkd4cTNsMU5EbkloWDZIK0xn?=
 =?utf-8?B?TGowWkszQ1JUQ0NycnJvU24zK0FlMm9PUzUwZmtieXlTOVFnMm1qVGhSNzdB?=
 =?utf-8?B?Yndqek81dWlCUXhxKzI1WG1GOU1Nem02b3pTcFJMMWRORldjQU5KVzloeGtr?=
 =?utf-8?B?L2E4b1gxMjIyMDA4R2YvVEZNUGFKdUQyTDhvUU8yTmVDVXozOG5HN2Zqdk5H?=
 =?utf-8?B?WC8rTDU3SUNnTGEvcmVzdDV0WEJJd1lkdnBDSXIvN2ZPb1hrR1VQbk9Ob1o0?=
 =?utf-8?B?WFIxYS9CY21jcDNQMEFMYlFtSVovNnRCbkZMVWVQRkNkeFQycXdlWDNtOTVT?=
 =?utf-8?B?cDRqUTZQcTNrek1PcHhNY1Jpd05lYVVYbHZ3cWQ5OFRPam5yOEF0RW03YTAx?=
 =?utf-8?B?eWVGOXdjVUhMZHh1L0ZyWmxyY0M1QmkybTNuOU9ja2ZkditTc01GbitIRDJT?=
 =?utf-8?B?OTYvR3F2VE9ldVFUdTUrdEFmbmJZb0RQSVN1L3lGMXdWcE1tN1pWUzZiQlFk?=
 =?utf-8?B?aFFPRlFqbUdrc0RUZGtFc1p3UTJTK2d0OHBkY1IrOXFrbldrb2ZObndBRk5C?=
 =?utf-8?B?SHN6eUpVb2ErQXpNOFgrcy9ZcDIzZnhqN0xRM2w2VTdpM3dEb2JmUCtuNWx3?=
 =?utf-8?B?ekdidy9GUXQ3aGgxUml3aGkzWk9QVDJpSHdWa0RhN2V6blVtNFNTcXJzOXRw?=
 =?utf-8?Q?SKQe+yiKyWzvvT5tgfhZN1qJ9AVQ1lHdPw9XkzAKNfR+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ffd8b83-1f36-481a-b339-08ddf5ef3afc
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 13:36:39.5673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S2Syul4meZW3C7PVVT4dTUSjXjr1c4qV/0aGG0s/T3JawnCRpdctST4IF5xwxYjzB5ObiwgsRe93N7trLG+nGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFFF21E27DC



On 13/05/2025 22:10, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
> 
> The p3509 carrier board does not connect the id gpio. Prior to this, the
> gpio role switch driver could not detect the mode of the otg port.
> 

We should add a fixes tag here.

> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>   arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts b/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts
> index 26f71651933d1d8ef32bbd1645cac1820bd2e104..81f204e456409df355bbcb691ef99b0d0c9d504e 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts
> @@ -669,7 +669,6 @@ connector {
>   					vbus-gpios = <&gpio
>   						      TEGRA186_MAIN_GPIO(L, 4)
>   						      GPIO_ACTIVE_LOW>;
> -					id-gpios = <&pmic 0 GPIO_ACTIVE_HIGH>;
>   				};
>   			};
>   

Otherwise looks good to me.

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic

