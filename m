Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012029.outbound.protection.outlook.com [40.93.195.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C90125A2DE;
	Tue, 13 Jan 2026 14:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768315338; cv=fail; b=GUBLudVt4lJCdRgXcV/97usRQ4Ymay8eNwqrWxJdM0NB450/7C7XeBjCW26GjxvvGt+AyvARfOLdHhpLDQymWtmILtS94ytO9ZnIn/kAHujaNGO3EiX1OmTqY9GAidy/Qm4O+myh6NM8rQkI/KStlA27vda6Oa16kD2AmSOfmJI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768315338; c=relaxed/simple;
	bh=pNdOcF1+qP6U/1bmQegtC/p1E5hA547cVDLFxF/nyN8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BxkO2bLtf+dbQGVvD+6Pv/8Zl3y9ZLXyrmzYLsGCUdoEM+gqYyj6sNXXQ8Hj1mHGFFcJq4oEF7ghJjlvFqizrs2bdmb9yQVNj4SFN3Q0VR1xfltKSagzPnembOYUagp9PVjhiSQ04L214hPoavQtTtxFPt2ZzhOTg7CWj9oUiBc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CAKazBOT; arc=fail smtp.client-ip=40.93.195.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CAKazBOT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aNr3Qr19QiyQMhPBPp862kJ4t5Kn4YOp8iR1OlzDCbchn9FCIbpXhNzwSwuAxlr/olnzwwaZhWUdHCUUMxBpR7Z1hNnIMJ803IarWGAXt5HEMmoTxBZgmZOWfTzI1iH0TNpxmD5XEsz0j6YYlfLW5v5WGaUu3XDL9C39TwKbp+Ut1vFBDOY2gwy+bqwkyd5NSy3WUMoggdPpE6KRYYP+iJ+igjED17IvCsuJ8smfF1li/fWapLaUgtxHICr/lPAFYIOl9Szae8ihx8Hli630EXAFoYxX/kh8JRHKzrtbnm5YKB9teHYLiS1C9+peh2tnoyJ1R+/lDpklf1xPsUmH3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PQ5Da6zhuTfPmikOfQWtLKHoGPckaVXhvtnn7bhG9W0=;
 b=D34IFZpgS5xH7JgyeIMDwVz9nXLMP3WT8toJD70GDlJ5vnBzKHZgPerER3XrnGS+PXCrwyyRsqtYVbEqIOiZo+vpcOIG69UVMGlE2Ps0/ssPZ0YgAEWIAWwxEV1q49jZrIRTy5UdrlNKm9SL7fvRsiU38am1hJC78Pzmy6CY/9rA7P6bS/iA9BxPERq5JSiMJeaHV44nunbnC8MOJ359cvRlMYhNqtwmpzE0i7y195eYsqJhFaz4QCF6lY+848oU37rWxRdbnc7VhE+XuhO7MMFjsU1tLQoDXVi3guYmMU4q+6xmC9sEnu32Wnr3sQnvjNDV8FMBrJ+ZqbSwy6uEUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PQ5Da6zhuTfPmikOfQWtLKHoGPckaVXhvtnn7bhG9W0=;
 b=CAKazBOTQTiU1j4shH7kMTLCNSlGV0zDzEjdG+eZ/sNlgJnvJWtDTPNOTB5BWXSV1Ip9geJYDxN3FZSsbF8zAzWf1bXnOsA+Px9Sy7jJowcWe4LInwaH4mYsF7NYTVtRgtE5bfbCQhvGxyACNWQQah3AuSKJIdgR+sdX1/5aNbw9eZ7CgzmYjGv4ogF6s54IVpqvMUk1agmPgfcsPaJpJOGUJ+x3gCIKiyFBxmW5x2q5QcEC5CU3brCL1l20oPzWVPbyu9bx9OnIgNgH3LH9rYXsELJmWb3ODIgC7Ovkv6l7KDckunLdb/5hmMpPL5ne8Y/rC9lr7LH8+KOc7CosQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by SJ0PR12MB6943.namprd12.prod.outlook.com (2603:10b6:a03:44b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 14:42:12 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 14:42:12 +0000
Message-ID: <043663d0-d592-432b-8550-10669674d17a@nvidia.com>
Date: Tue, 13 Jan 2026 14:42:07 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] phy: tegra: xusb: Fix USB2 port regulator disable
 logic
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thierry Reding <thierry.reding@gmail.com>, JC Kuo <jckuo@nvidia.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20251204-diogo-tegra_phy-v1-0-51a2016d0be8@tecnico.ulisboa.pt>
 <20251204-diogo-tegra_phy-v1-2-51a2016d0be8@tecnico.ulisboa.pt>
 <c5450fc7-230e-4435-bd1d-3db4f1f6e736@nvidia.com>
 <54afff11-df9b-4c25-bd1d-8134196ce093@tecnico.ulisboa.pt>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <54afff11-df9b-4c25-bd1d-8134196ce093@tecnico.ulisboa.pt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0512.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::18) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|SJ0PR12MB6943:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b121553-1843-423d-796d-08de52b1f004
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K2k2N3E3OE5SUUV4OEFzQnBYZnJFcDB6QUVLZFdyL04xUloxOUJYOTNWa1Zi?=
 =?utf-8?B?TXFFNzM4cWpjbWxCR2YyZG1rYnB0VEhXcnA2UTdMNlNhSCtvdGZpVGpxZ1NF?=
 =?utf-8?B?MWJMWUV1SFVSM3Izd3g2VGwzQ2FtYlNFN3ZZK0lsdWNPUWNGenBVWVJyRWY4?=
 =?utf-8?B?R3k3c3dIR2VvN1VWRXFxMEFIM0VsTThMYmhLZERMeDAwbmVhQU9acmcyWHFs?=
 =?utf-8?B?MnMvQi9WZDVQbkhVL2I5c1lYdnJPSnRPQTh3QmU0eGk4RVVmT2JvZGI4Wm9S?=
 =?utf-8?B?VmFvTk9IdjFNS2tHMGJtVGQxVXdiL1plTnl5bUJ3bkMrZTcrMDhBcU5jcERI?=
 =?utf-8?B?WWtqM1hWdTg0b21IbTUwbUs3UVI5d2xTVFAzUGdULytodE1NSW5rd0VZTWgy?=
 =?utf-8?B?ZTlSbTBmUDU2NEp4TWVLTFBHd0xCS09MQk40RG8zWVAzd3BTV2JYTGpPdEpG?=
 =?utf-8?B?eHo5cXVvQWQxTkFqc3I4NG1hcmN3bUxLOFdpMGYraXlrak1xVzZHZnFGOGxX?=
 =?utf-8?B?WGZRMlhvOUp6WTJXYm5HaHhORmJvN1dnSXJTSnBSTGRFdWRpb3V2a0pkVHhH?=
 =?utf-8?B?UFEzaHQ3NHRHSU9QdG5oTzcycVB3VnBzQ0QyZ2h6cmFBbTE2Y0VKQUtjL1ll?=
 =?utf-8?B?MlA3MEsrRU1KSmxNTWxUYzZ4V05LOVptdjQ1eHhOQllIdlJxRWFuWjQwRWZz?=
 =?utf-8?B?eTkweEVvZDE4eHNiYjhGaE5TamtvcVBDeHREM2hIa1FYYUtzVExHL1ZpNXJl?=
 =?utf-8?B?KzcrM3czYVRTSzJZNVlieG5yYUNtQXhBT0JEdkxrNHRUOXpvWHJtV3ZlVmNQ?=
 =?utf-8?B?ODFCQnR4Sk8xL0pUSjRFSDU2MUFPcURodGZWMEVjd0dxZXF2UEtTWVRHVzF1?=
 =?utf-8?B?SXpqaDJmRXBqcWtvT1kyaUl1a2VuNmhONEdFS1lEZnRNMFZiV2duNjlacGtE?=
 =?utf-8?B?Zm5DckhVb1ZBQllYTkxiZ0lyRzRUV1VVeFRYUkRJajdlRGNRRUZUcGhWcjBm?=
 =?utf-8?B?NWdsNndvMDZBNmRBdE9XaWhxek1Ca0pnb1NzNnFPS0NDTjVwWDc4cGFmeWdV?=
 =?utf-8?B?dldCbUpXdkVVNGY1Q29FMlJva3BkMm9WcXh6OXBGL1h3c09WT3BkeWl6WkJa?=
 =?utf-8?B?T0lIaFU0akJkOEdrSTdtTEZoRmIvck13YTMzR0hvQytJclNaMngwaGE3S2RD?=
 =?utf-8?B?eWpTWllOV1hIZHRkOTh6cVJLUGEwK2RsdHJOVlFzUEpRd0tyem91elJjM05i?=
 =?utf-8?B?Mmo4YlVuZS9jS1FXZXpaVUxhU1pUNEh3RDV4YUpUaW9yc0xIaG83QzJnd3FX?=
 =?utf-8?B?U09TVW16dzl3a0lGRHlZQmJteVdjTTBoZzdLOHZuR0JpVUt0QWJyNjV0SFZ4?=
 =?utf-8?B?Q29zRGMwdkFrc0tibCtTVVQrV2J0VVJMakhRaEM0bUNDeTFvNHB6b3RnWXV6?=
 =?utf-8?B?SUdLSEtYZ3RmRkttYkl1djY1WFNWNEdIK2wveTJUMnF2MlFONlJlM3B2WTJD?=
 =?utf-8?B?S2dZMVFGeTNBOFUzZnBFTFNrTy9GMWhMSnhVN2lmajM3TGc3bXlwU1g2SFMy?=
 =?utf-8?B?Yld1dzVoSDFCM2c0ekFGc3JtanFaZk9pM3F0Z1JUSUFTOXVGT1BERFZpNTJU?=
 =?utf-8?B?T3RFUHBKTEJHR212UldhOTQwZGlETGJ3clN4aEhWQWtKemRvbEUzcHEvU2xs?=
 =?utf-8?B?SjZidXBZK2ZtaVVlOVQvc09sTHMxcWtoZWkwVXpyamtjd0tuWXVHaGZkN2F1?=
 =?utf-8?B?cDA4K1pIZGJNNW5LQ29HZ3pyc2RTYTlHY3k4UFFQME1CMTV2Q3FtTUc1eXgx?=
 =?utf-8?B?SG1lalozWFhGL1prRjJMZzRjTFhUdnhWRmNWT01Bd1lrRU9zN1hkNlNQS3VP?=
 =?utf-8?B?ZmpTYWY5NC9nZ2xZd2o5aFZFV2dBSWJUclhUT3Q1OE5IcVRmdnBvWExiTjR4?=
 =?utf-8?B?dHZFZHhySC9BUWdQVE9WcXludTFoNEZzeWtDU0xCSWQ5VGV5akM3YVFYejlP?=
 =?utf-8?Q?jiWC1lR6CGXN7rXB40HhqmRj0XO9Xs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGVvN281elgxVEtaVWh1b0x6eHZNZ1FSUDAyRWlrSXZPT0h6clVmUitUQ2M4?=
 =?utf-8?B?SEs3bURoYWpCdVBRampDZS9ORXFLVllFakNYRElPS0pMQm55TGRCNWEzc3Zw?=
 =?utf-8?B?NFRqWExlQmFtUE41ZFQrWmxUSlRaSmF1THVxM2FGVVhUTmoyMHM5OFZ6bzMv?=
 =?utf-8?B?cTYyR05kQjNOU1VhU1VNU3VpWTlmRWI4NUk2TitTTm1LWk9EMEYrVm0vR3kz?=
 =?utf-8?B?UW1oQktidG1LUXJtSVpmV2dZWExORU1ob1ZJZldielF3UjUybFo4QmJMZ0pQ?=
 =?utf-8?B?MDZoUVZEYy9RVWExZzBwZXlFdUkxOERwOHM0QlBpR0NHaUZyZldYdVFnMUxB?=
 =?utf-8?B?QnV6SCtxZmVaOHptazF2YmZadmg4ZkYrQjJPcllrMW8yYTd0MVF0R2o3OGJq?=
 =?utf-8?B?SFBMNXdGc25BRGs3WkRnWnlXTGszRWF5U01PTkttRFpUTlpZMUNZTnYrdUV0?=
 =?utf-8?B?V0FhRkNZMjhZVVVySDdPT2lhYUdzcURXMHdHZGpTbnhvRi80SkNXczN0TW9U?=
 =?utf-8?B?bStDTUFxbzNpWm01Vmc3ckRpYkpsOE1mKytkL2YvdzE1K29IN0l0L1dUZ2hH?=
 =?utf-8?B?NHJTemUwdlIzM3lxSGVOR3hrUUVCcWlwdHhGS1J1STlWVDFySkJNNGdtcG5w?=
 =?utf-8?B?UzJmRGlCRGEzUWRCMUJSVmxyV2ZDV0Rmd3BiVU1lNGVVdGc1NlprNUVMT3JJ?=
 =?utf-8?B?enR6Ti9nYkw0dUNxZTd3VWZUQk8wVHVpeFYvdDhhdnZRSWdpZkRpWkNKQ1R3?=
 =?utf-8?B?YkVBTjV3R2p3N0dXSEttQUZGL01HM1pXYUxmZjdUVENmb2NIVU8wUEhRNU50?=
 =?utf-8?B?ZjhLemZPem5PY3dqaFY1MlRvUWhFTjRpK3RXTHorbHNmY29OQ0V0WThQVTZa?=
 =?utf-8?B?RlBhNkdOWFM2UC84T3k1UmNCTXJSN2gvaE52T3JLRForTjhkcTY5WG9XZ1Qw?=
 =?utf-8?B?R2lCajlpTUdpOUtjZExWeXJvZVR6ZTJlN0plTHlXQk1yYzNtTzJQSkM4eERT?=
 =?utf-8?B?TFZncm1DQW0rV2JvUHBpb3dJRlNRYlh6RGk1aTV1MUl3Mk13SXJqaGxaSVUw?=
 =?utf-8?B?V1VuYjI4aXBUVmk5VnRhbjRWQktSRTFzTjg0MDh0ZlF3Nk1RY3FDeWhiR0s3?=
 =?utf-8?B?L0IzVVNRN2ZLcWFXNHNISTcza0x1ZkJtUFNZWlVUdlMrUDF1UStGcDNmSXRa?=
 =?utf-8?B?dzBqWkgvVzZjZ1hJekhLWGpzV25SMHJJWUk0N01SMzJ1ZlNvZDVxb3NRSkRG?=
 =?utf-8?B?dmdEbk5SMEtaaVZjVFhuTktIcEgrYWNwcExUcWJXNzJnbVdaODFTQTl4Z1p0?=
 =?utf-8?B?Nng1ekV6bkdkOEhIWGRMRjhGWGZzWm5yR2w3eC9Qd2Y5ZUthRlduL1gwYUZs?=
 =?utf-8?B?aWJ3WmFmWlJWeStNVG5FSTFscnNNWktRb1VWeTNmY0JvclN5OHJpeUdyejdY?=
 =?utf-8?B?cWNUbVZMQnAwWGx2dit5TWtuaWxHNFVEeVBDUTQ5U2FkempCY0lNMjBqS1Ix?=
 =?utf-8?B?aWhhTVJvUGQvY2xYZThrcFRTSmRsVmdpSFdRMENLeUl3eEV2V3NnUDRvOUYz?=
 =?utf-8?B?V3RSUmpHRDM0bU9qbWFLQk9QNXBLenlwZ3VtMXF3UC91Y2cvcWE5TW5KaExp?=
 =?utf-8?B?N0lhcEFlMFBSVlRoZnRoKzJ6QitiTEhNOTloNHQxemkxdHBqbEdhSXBmaXUx?=
 =?utf-8?B?K2dLSE5nZWxjRURZSlNnQWZlL2ZuMWtIZXhLUCtDOFZKZndWTm02U3dpV0FX?=
 =?utf-8?B?bnRwdWorbmgvVms5cXg2N0hBT1Fnd0NUbGhmeEk5UWk2L0hGSE9zU3h3KzRp?=
 =?utf-8?B?bC9Kd3owQTV6dmlQMmdjR3l4YS9pcThDNUp1d1lrVGd1bXcvbVg4aGRxTjly?=
 =?utf-8?B?NWR3QUFrOGptcjZGT3VGYm1ReXltRlpoRDJ5cmVERXVuU1VQTyttSVZ2Q1ov?=
 =?utf-8?B?ckR2RjZ2dDlMelB3dG11clhPOTNINWNXbzVYd1JIcUZoa3ZRaVIwWnZsUUdK?=
 =?utf-8?B?Tm1vZ0VhRlhyUGVRMFRkZkxCY3k2ZC9PVTN5N1N5ZXlXbFpVZ3RCZGJGT1ky?=
 =?utf-8?B?M3dUZTh1QVdYOVY5UzFtL0M3b1JEaGJLSnZ0U3dtZnpKRWtEaHlZZjZZNzU1?=
 =?utf-8?B?ZWtwOXRxQzBSK3p4Mm1zclpTNFRlaFlCUXpLUFlHc2c1bE1JOHJnK3ZIMVBu?=
 =?utf-8?B?bHVmZ1RnQVY1QzhpUkdhUlJKSVBmZklhVFF1SGFFOXZUZm14Y29wNk0zYVR6?=
 =?utf-8?B?QmFnT1ExTHVZdTJvWEtLV2x0VDdPS2RYd2RSOFM1QVdrcHFRYmgrSFJ4aTAr?=
 =?utf-8?B?d2VkM0tEeGdiMVNCdlNlUjJUcTJGNXBFYTV1R3Rqc0picjZiT1ZqUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b121553-1843-423d-796d-08de52b1f004
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 14:42:12.4850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 59waTxhK1CmksUhHN6koZ7wuYE2cd5e5e1aiwKSFi8qjWp7ADeApq2TBnIRzhHdX6lOpCFxqSG1qxCSUdVY+wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6943


On 13/01/2026 13:59, Diogo Ivo wrote:
> 
> 
> On 1/13/26 12:01, Jon Hunter wrote:
>>
>> On 04/12/2025 21:27, Diogo Ivo wrote:
>>> The USB2 PHY mode handling on Tegra210 incorrectly relied on
>>> regulator_is_enabled() when determining whether the VBUS supply should
>>> be disabled during role changes. This is because regulator_is_enabled()
>>> reports exactly what is states and not if there is an unbalanced number
>>> of calls between regulator_enable() and regulator_disable(). For
>>> example, regulator_is_enabled() always reports true on a fixed-regulator
>>> with no enable gpio, which is the case on the Pixel C.
>>>
>>> This then leads to the PHY driver wrongfully calling regulator_disable()
>>> when transitioning from USB_ROLE_DEVICE to USB_ROLE_NONE since the 
>>> driver
>>> did not previously call the corresponding regulator_enable().
>>>
>>> Fix this by keeping track of the current role and updating the logic to
>>> disable the regulator only when the previous role was USB_ROLE_HOST.
>>>
>>> While at it fix a small typo in a comment.
>>>
>>> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
>>> ---
>>>   drivers/phy/tegra/xusb-tegra210.c | 5 +++--
>>>   drivers/phy/tegra/xusb.h          | 1 +
>>>   2 files changed, 4 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/ 
>>> xusb-tegra210.c
>>> index 3409924498e9..63ad57d95514 100644
>>> --- a/drivers/phy/tegra/xusb-tegra210.c
>>> +++ b/drivers/phy/tegra/xusb-tegra210.c
>>> @@ -1934,9 +1934,9 @@ static int tegra210_usb2_phy_set_mode(struct 
>>> phy *phy, enum phy_mode mode,
>>>               /*
>>>                * When port is peripheral only or role transitions to
>>>                * USB_ROLE_NONE from USB_ROLE_DEVICE, regulator is not
>>> -             * be enabled.
>>> +             * enabled.
>>>                */
>>> -            if (regulator_is_enabled(port->supply))
>>> +            if (port->role == USB_ROLE_HOST)
>>>                   regulator_disable(port->supply);
>>>               tegra210_xusb_padctl_id_override(padctl, false);
>>> @@ -1944,6 +1944,7 @@ static int tegra210_usb2_phy_set_mode(struct 
>>> phy *phy, enum phy_mode mode,
>>>           }
>>>       }
>>> +    port->role = submode;
>>>       mutex_unlock(&padctl->lock);
>>>       return err;
>>> diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
>>> index d2b5f9565132..273af147dfd3 100644
>>> --- a/drivers/phy/tegra/xusb.h
>>> +++ b/drivers/phy/tegra/xusb.h
>>> @@ -317,6 +317,7 @@ struct tegra_xusb_usb2_port {
>>>       enum usb_dr_mode mode;
>>>       bool internal;
>>>       int usb3_port_fake;
>>> +    enum usb_role role;
>>>   };
>>
>>
>> A similar fix was made to the Tegra186 code by commit cefc1caee9dd 
>> ("phy: tegra: xusb: Fix unbalanced regulator disable in UTMI PHY 
>> mode"). Although the above looks simpler, I am wondering if we should 
>> make a similar change to the Tegra210 code so that they both are 
>> implemented in the same way?
> 
> Looking at cefc1caee9dd my approach leads to less changes but I do agree
> that standardization benefits us here. However in that case I think we
> can take it a step further and actually just have a single function
> tegra_xusb_padctl_id_override() (and likewise for vbus_override() and
> set_mode()) since they all seem to do the same thing in both platforms.

Yes I think that would be fine. I can't say I have looked at that in 
detail but that would seem like the logical way to go.

Jon

-- 
nvpublic

