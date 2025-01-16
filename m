Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2040.outbound.protection.outlook.com [40.107.223.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A43B17578;
	Thu, 16 Jan 2025 15:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737039723; cv=fail; b=u1gyyq+zl39KGoumCpfAsfdUsxaQWq9y4JfUQtvnJFUkZkWzj6yp70IeZfgBgMXooI+a0g+6Hj7kSWyCHsMQXb0XTsb+PlCezjaM1oU/wW3/iD0a6nlotiBUBrtsboOdaCjbeRSwY47r3DMGZtm94JsmM+AjFKHY/b9LUdqAbRg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737039723; c=relaxed/simple;
	bh=tOucJtAZsBNDG2ZvmtNll8NuXAbmuCPTD00Zt/47CaA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BlnsoqkfgjLKfPAqlMfURhpwgoRsj2qxUDw4M1J8JbT9LHT59ulJCNg/GrJ/9HfRVwADwCe/fR80lcv1RCXnZzYUzHy8vZgG1fH/YAxVV1DGnV8KK6v1+Ih7qf8Tfg6BOny2ekdLsGno6kYURcphA2ngBZsYvtgnf6isY7Be5NA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QAba0BOR; arc=fail smtp.client-ip=40.107.223.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QAba0BOR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FuTqg+jgGUQiDoVl8aR2Ch0zUbnbLftmHcjiHGVEfPM74HexIGZYWvozxa82Nq67nwYJOHiSVc/vu2ymR6Q5sggAyMlwpxM+K+jomFYco52rZa04Vg6+39k0+I1OW/iSR/d/LYEBM+XXnksnHDPoLlIiudLSpw2r+IcpdDum4rMyAopXyEilnssbp5mK3BPTTLx4SiDQBwnZ80Ia59hHKPW2jSlPO9ZBXmPjMLmEDHfmNvmicA9M4v6Sde/R2g2lXW+sPR6jjmBQrhKJswrgHQZKG12MdIAuv7TWFfb0KUGyuS9B1o+kAgSpl+DN080HQxFsppAfPYUXns+zc/VBoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=imy0KktN9iTKH/17q1MSjJwGdd3MO4e5gKZ02fUBgX0=;
 b=dbPs5tTMjtBAdVd+mqztlRApdIYv0mMOLygdfU/QaEKbkaY2y8bnS0fP1TepRtqmw08xRd1quPFp/W3jhNaOHugMR0kdSWVYGNQfMdS8EZN8PrslQqbdd0E2SechTCnae11OjuId7yy7IXw2ONmIAjXBgtl16QUhEJbtejsnK/6W/5HHhDDyQh/7wYlY0chBQsFRl5idvA/4hQwBkRwTVVqYGgdaO+dbPOgxmxYjYmJWLJ57R1U6l/a2SSdYvURm2RCVX7vqRikbla3/Vzwbc9N9lLVHvCFAOrfa0ZZ36/H5y98xPFbH3FRpzeOmJ6kp/VVTwSnpIKCyTXHbqWxuGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=imy0KktN9iTKH/17q1MSjJwGdd3MO4e5gKZ02fUBgX0=;
 b=QAba0BOR8i5XVHOAZK7qLYg9qnS2Im0SATgh9U1McKKCR7sdFgIztu2kJiXjMxaDAGBFPe8TIElLxMAnV50EGtMOUpttWbWn7+Ga4OHOHvThhpfphRGAzncHh1Udy1iEPLXi8B7o04TCORegadjs3BZTQtvfHjJRgQQVrcsBJ6k/e2AvqqjjmMyS0zmHoyePAjFQv0xwkC7F6NjbLU0Kwp0pullU9XFABxz2Q98Dj0wdK7s0A7CG8S0Ybj1+rxQLGdXKA4lgJG6tNgiM7YBeKhJR38C8eCiq9F70ea65y1vFailbrDZfwOHtaxcNXa/+q3T7FHbK1gAr4nzt+jKPsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by MN0PR12MB6173.namprd12.prod.outlook.com (2603:10b6:208:3c6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 15:01:49 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 15:01:49 +0000
Message-ID: <3d9db530-a0b7-4f18-9ad4-233356dfe68c@nvidia.com>
Date: Thu, 16 Jan 2025 15:01:43 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] usb: gadget: u_serial: Disable ep before setting port
 to null to fix the crash caused by port being null
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Cc: =?UTF-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>,
 Prashanth K <quic_prashk@quicinc.com>, "mwalle@kernel.org"
 <mwalle@kernel.org>, "quic_jjohnson@quicinc.com"
 <quic_jjohnson@quicinc.com>, David Brownell
 <dbrownell@users.sourceforge.net>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "opensource.kernel" <opensource.kernel@vivo.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Brad Griffis <bgriffis@nvidia.com>
References: <TYUPR06MB621733B5AC690DBDF80A0DCCD2042@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <1037c1ad-9230-4181-b9c3-167dbaa47644@nvidia.com>
 <2025011633-cavity-earthworm-2b5e@gregkh>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <2025011633-cavity-earthworm-2b5e@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P302CA0015.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::11) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|MN0PR12MB6173:EE_
X-MS-Office365-Filtering-Correlation-Id: 32602fdc-340c-438e-83dd-08dd363eb40a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dkljb1BoUTJRZDcyb0VFME81bExEbkJ0T0h1WUI3aUQ5aW94aTV2Tjdab2M3?=
 =?utf-8?B?a3dqMXpvSVU4MHNJSytXYlRmQzMyVjZ2d3JyUnhXQWlZcUR5MHdBVUFMbXlN?=
 =?utf-8?B?VE44bUFicUF4dVoxaEZXZkNNdlNPTlBsS3pOWTRSdXFHNTA0MzJEVklDKzRy?=
 =?utf-8?B?T1owMnpTSGc4UzR2V0ExTlZGbm9OdS9lZGRtSHNxNEZxL3pRTXFJOEsvRVg1?=
 =?utf-8?B?OVMzVEtRa1FvNmFmb0JDOHNISHlwclVpR0hpOVR4Y3V5WnkxditIOFRkRjdx?=
 =?utf-8?B?eDR4bVhqb0REczU1bEVtclN1NGdMT1BGeTRVODFIS2dLNFdmOGdLdGM1VEdk?=
 =?utf-8?B?cTVTVUdxYWZFMGdvWm52VENlRXRvNEZkMmJoaUlIdHA4dDNPd21BN2E5N1B1?=
 =?utf-8?B?ZmVzVUVNWmtCTTRIQ0xFTDFqRG41YUI2VUFRY0t0QXR1UGcxYzdYYjBodGYw?=
 =?utf-8?B?UFBmTE5vZG1rQktGNC9Tc0NlTEJIVCtzWjhUWVJyNklBZGxFMkcyN3VWU3Jm?=
 =?utf-8?B?enIzUmtHUWw5eExkR1N0Y1FGWTJyQ05OUkVwZHNORUtkVHN2eHFZZmtBREgv?=
 =?utf-8?B?akh4aHRQd0VzZ1BXYmIwZ3RBTkkwWUVqMHIyNGJ2SWo5aEJ2dnR5V05HVDlq?=
 =?utf-8?B?dUNOcUxkTzlZdjZtSjFsdzJHaERMMk5NdVhtYUpOOUYxTHFnc0NSZGY1L0do?=
 =?utf-8?B?THJUV0wvT0hGSi84eTJzRDFteTlmWVEvSWwzMC9nYVB2c2w5REk2VGtnUlFC?=
 =?utf-8?B?K25FZXp1WTNBeE5PT3dTbXBIUnpuOTJFOU5oYVNTVGpCTWZ3MDdzUnA5U0l5?=
 =?utf-8?B?WGVvd3dPUWN6YkFqYXJLWFVCdmxPMGdqY1Mwd050bFBJc3BoNXNYR09zd0U4?=
 =?utf-8?B?MzBBTnFqS1hNcXlzclNwVURKTEFIbHh1blJnYkNlOHA1bEU1OVIvTm9rc3Fr?=
 =?utf-8?B?VGpHVE4rMHpuRFlpTitCRnNTTlFQNkdCQ1dVWlVBbnBRR3RYMmRpRWpZQzlj?=
 =?utf-8?B?aHdqOS9DNHQrUWN6SG9rbisyOUdJRXhmRFdlSDFFZjVhWGtaY3RFTlV6US96?=
 =?utf-8?B?WEpTQ2t0OWtkbkpZUDhFMEVlNWwwTEcwZ1o4RzJzL2ptS2YrTjFDQmllUlVo?=
 =?utf-8?B?M1lNejJ6TzdxbVZEajBaT3BKdEdTWlE2bkxPQ1haZGhFbk1MRjJOcjF0eEx2?=
 =?utf-8?B?bzNGVlZuUkJmRURNbzVIcWhVR0RrNHNublJST0pwMWNVcHNMaDM0aGZpSzFN?=
 =?utf-8?B?OFdUWEMzZEtlU3BNZ1hHVmp3ZXVkR1AyeVcwbTB1eGR0ZEVxeEVQVGV6Rnhk?=
 =?utf-8?B?R1RBajVHZHcrU3BMQ2lLUWtPc3FSSXBWTG85dTdSNC9UekdXaE5EcDFnbDNt?=
 =?utf-8?B?REFzaWM5VXA1ZzZuazhTSTJMMXFJUFF0ajE1dnV4bUdxUFJhUCtFU3hHcGJq?=
 =?utf-8?B?bjMrdnUvVmhsV2tPUGRtWEd0SG81dDMrNTBMZWNBWWxtQ2tDcnNONTJPS1JM?=
 =?utf-8?B?ZXlCNTQ4Mmc1NlBwUmpBSGMrcVhCMkM2Nmc3bEFjUlRGNDRZTW9JdGViL1Np?=
 =?utf-8?B?TDBHbCtKTFBsWm5xMEMvZjVGSEZzUUQzWXhFUGNSRXREVGk2YUFUWGZSN3Zu?=
 =?utf-8?B?bnF0ZEtJK05JeUxXVWx6K3Zkc0l2K0h0M1htVTNuM2VQMlN3Um1Zd2xzcmpz?=
 =?utf-8?B?RGtFUHpZeWUwRFdHZ1o1NUFJMlFiYWlsN01qVmlWSlkrNHpNcHB1TnpGWm5E?=
 =?utf-8?B?VjZ5aFpsNnRQOFRuWitvYkt3WE5SV1hjMnhBMThGbCt4cnV5RVkyKzF2SERD?=
 =?utf-8?B?bE51TGJxajBQYVoxQmtYUCtHUGtocnV3Qk02ejFwMVhqd0RoMGlrUWNWdklV?=
 =?utf-8?Q?WJ9ezRIuOrY8X?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUI2bGVINEpDVWFwNE5tSUwvK2xRUmFsc2RiTk1oWkdPTFUvTDRrVHVwcmxP?=
 =?utf-8?B?L0xpSTZVaGNuNjgwYm03dXJaQjZQdWttL1gvSnR3OWVPSzMvQVZ4dWRQVG1i?=
 =?utf-8?B?cVV4VjNJWjQxRUM4ZVRTaXRncEJSWFZZd1hTbVZrZ2EzQUNubThTYmJHNDRs?=
 =?utf-8?B?Uk9uRm9mei9NdHZ2Z1VTRmhxN2M0R2ZjZEtXWVlFK2pWcXJvamE0d0ZoYmVp?=
 =?utf-8?B?N1dHMHRhMVVzMUpGRWpIbXZCS2h2N3h1UTk1bkM4dFdwUThLQlcvUklISDdw?=
 =?utf-8?B?bXB1dHFSWnl2WllzTndsdVRQWTFhaFN1ZlplV0xFNGlJUVUrSW1QT2NmUmo1?=
 =?utf-8?B?SmRIVEhWS05Ud1ZQVUxNdWFsUTBvSjd2WnNaMTBXdTdBSU9nVzF4UzcrN2NB?=
 =?utf-8?B?NzBFVUJkbStLRFF6OEt1dzYwOE45NG9yaHBWSW1HT1E1V2J6Z1c5blF0SE1D?=
 =?utf-8?B?aVJWckE0NWRrMytuS2x6V2tpdkc3dzRiaU5NR2tkRVgrQzhkbTNzV0szRysw?=
 =?utf-8?B?KzRWYy9hTVJWcmJBdnNoSUxTMU9NZEMzZ3NraWExMHMrMjhCMkVoSUlWVG4z?=
 =?utf-8?B?Smp0bUJ4eDhYUjJFNm1KeFQ2RkY5YUlGSW1DOW8vNjRyVitEZXhnTFZwbWZD?=
 =?utf-8?B?TzdxRmtNNjh3aDhUZlVsWFFnRWhseVNGSzVwZWVCVnZ0UDVGd1dETUdsQUF6?=
 =?utf-8?B?T2Q4dFVialdTZWQ3Z3o2VVMrckwwbFh4MEUxOWhEMHV3RGZTeVowN3F1VjZX?=
 =?utf-8?B?ZXpZZTJZM2pUalZLTE5RbWc5Y2drNHE0SnE1MXVaNGhnMTBsK2xIV0dtMFN3?=
 =?utf-8?B?YTlkRHJPaDhBRWNZbTRmM3dETzNOc3VBUnd5S1o4WGtNNHFqTXVIYlp0Wk0r?=
 =?utf-8?B?bjhPbWQwOXBvSk42ZHpNL2xxVzNJQ05vSERRcjhwaW5CamJHMldsSlZqM0dT?=
 =?utf-8?B?OVNJYkxwTlZCQUFadGNZSDV3Vit5SG1DWm10WGJWQzZpNnQzei9qSFR6dDVY?=
 =?utf-8?B?cU9nb3JmbUw3TlB1Nkd5UUVPNUNKRTZ4Q0NzYm83eUdyRmlZT1N6RnZBRkF1?=
 =?utf-8?B?MVk4dVBZbVBBYjkzMC9kak1DbTF5VVJrMjhxZTcwek1aeHN5a0RXcEtlWDZk?=
 =?utf-8?B?aS9HY0I2NVd3dWpHTDVFakwyMG9BUnFTaE51Rm1USEZiSk02Tjk0MUVoWFBU?=
 =?utf-8?B?VmI5cE56MUZEbW1CY2JEOVR1WEtmcVNZMW1wQXQxK0lXYkVxK1JJR2hsUVhK?=
 =?utf-8?B?dmE0WXJWd3pybS84QnFzaTlza3JiSUpxMSs2Lzg5djdqa3NzMTVxUWJJekFU?=
 =?utf-8?B?ZzhwWmNUT29iVUJnUDFiZ2JLNUkybTBTcXdkaGVuVUJpazBQMyticXRucHFw?=
 =?utf-8?B?aTJnMVdVVEdmcE94YmNTdFFZSDVTMkVsQjZHdG9CbmpoUk1SV3RLZndONjEy?=
 =?utf-8?B?c2s1OHhhWnA5WERialFBTk1TTzVnVm9mZThENW55NVNKTTc3UzNad3VtZVV3?=
 =?utf-8?B?ZjlMWjlPSTY4TGpVREN5N0VvQWdMWlM5MnhWUkhnK1dTWkpyRC9LcHFhSDd3?=
 =?utf-8?B?dnMzNi9KUHBVZ2FmVjNIWm1SWW1LbUYreXZncy9kM1JXWEZPdE9PQjYrQ1Ro?=
 =?utf-8?B?ZkxIbG9oVDUxdkhkWTcxOEo0MEtBU3Q4RmJqWlc0cEU0bEJvd3NCL2VLQi9h?=
 =?utf-8?B?MS9CWjZOV0FYaytodS9IdW9BUnJlSlM4L3Q2YmNZdGxmWU1HQWZQUHhpQUNG?=
 =?utf-8?B?K1paRzRlRTJONzZPUDBpTTA0WDJXRThMem9XRlBQRVhCdzNXWTIwdWxuWXI2?=
 =?utf-8?B?QmhpczM5VzRXWFpwdjhnaUdMdFR4aDlUc2Y0UDFWdVhDNWE0cHhFQ01vd1Rs?=
 =?utf-8?B?Y2F2ak95VDcyaGhhS1NkQmNEeEpsUzNJZ3BNZ3VPYkpWYUhrL1RmbUZyZzlB?=
 =?utf-8?B?K3Z5OWd0dk5CMWxmTWJuTDMrUUVVOWc3OFZSQkRvYkozZVFsNUJ1RnA4anZz?=
 =?utf-8?B?WjVwb3p4OFZjcEU2Y29yT0NlYjRrQWg2b09HZG1aMVB4RHpVQWR3ekZTb0dK?=
 =?utf-8?B?V28xbCtPTzZZQWRRN2t2MFh1R0NDUWtFT1huZHBUQmtlU3JzVEQvR2NPaGtQ?=
 =?utf-8?B?cGdKdUhjRmFrZTNKTXI3SjlZNmUzS3BNcTQwZStZVXdYUlhmUzFtYUx0aXRU?=
 =?utf-8?B?NVFXWUgvbWZLQldrSmtEVUdXVTByNVU3ZkVtVGpaQ2ErQVpuZzN3ME1xNXNr?=
 =?utf-8?B?UDBmck9vbVlkYklka3BXazVjdHd3PT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32602fdc-340c-438e-83dd-08dd363eb40a
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 15:01:49.4304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mIyc/Zrcha2n+4duNJaXYKuJiZHP6JrdG/ljxXMUCJeQ3TT7qZpnSJ409RIJq8FCmOevkSZvC6aJU9HNl7E/vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6173


On 16/01/2025 13:28, gregkh@linuxfoundation.org wrote:
> On Thu, Jan 16, 2025 at 01:11:36PM +0000, Jon Hunter wrote:
>> Hi Greg, Lianqin,
>>
>> On 17/12/2024 07:58, 胡连勤 wrote:
>>> From: Lianqin Hu <hulianqin@vivo.com>
>>>
>>> Considering that in some extreme cases, when performing the
>>> unbinding operation, gserial_disconnect has cleared gser->ioport,
>>> which triggers gadget reconfiguration, and then calls gs_read_complete,
>>> resulting in access to a null pointer. Therefore, ep is disabled before
>>> gserial_disconnect sets port to null to prevent this from happening.
>>>
>>> Call trace:
>>>    gs_read_complete+0x58/0x240
>>>    usb_gadget_giveback_request+0x40/0x160
>>>    dwc3_remove_requests+0x170/0x484
>>>    dwc3_ep0_out_start+0xb0/0x1d4
>>>    __dwc3_gadget_start+0x25c/0x720
>>>    kretprobe_trampoline.cfi_jt+0x0/0x8
>>>    kretprobe_trampoline.cfi_jt+0x0/0x8
>>>    udc_bind_to_driver+0x1d8/0x300
>>>    usb_gadget_probe_driver+0xa8/0x1dc
>>>    gadget_dev_desc_UDC_store+0x13c/0x188
>>>    configfs_write_iter+0x160/0x1f4
>>>    vfs_write+0x2d0/0x40c
>>>    ksys_write+0x7c/0xf0
>>>    __arm64_sys_write+0x20/0x30
>>>    invoke_syscall+0x60/0x150
>>>    el0_svc_common+0x8c/0xf8
>>>    do_el0_svc+0x28/0xa0
>>>    el0_svc+0x24/0x84
>>>
>>> Fixes: c1dca562be8a ("usb gadget: split out serial core")
>>> Cc: stable@vger.kernel.org
>>> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>> Signed-off-by: Lianqin Hu <hulianqin@vivo.com>
>>> ---
>>>
>>> Changes in v3:
>>>    - Add --- line above the version tag information
>>>    - Remove extra blank lines in commit messages
>>>    - Version tag information from v2 to changes in v2
>>>    - Link to v2: https://lore.kernel.org/all/TYUPR06MB6217DAA095A9863D4B58D57CD23B2@TYUPR06MB6217.apcprd06.prod.outlook.com/
>>>
>>> Changes in v2:
>>>    - Remove some address information from patch descriptions
>>>    - Link to v1: https://lore.kernel.org/all/TYUPR06MB621763AB815989161F4033AFD2762@TYUPR06MB6217.apcprd06.prod.outlook.com/
>>>    - Link to suggestions: https://lore.kernel.org/all/TYUPR06MB6217DE28012FFEC5E808DD64D2962@TYUPR06MB6217.apcprd06.prod.outlook.com/
>>>
>>>    drivers/usb/gadget/function/u_serial.c | 8 ++++----
>>>    1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
>>> index 53d9fc41acc5..bc143a86c2dd 100644
>>> --- a/drivers/usb/gadget/function/u_serial.c
>>> +++ b/drivers/usb/gadget/function/u_serial.c
>>> @@ -1420,6 +1420,10 @@ void gserial_disconnect(struct gserial *gser)
>>>    	/* REVISIT as above: how best to track this? */
>>>    	port->port_line_coding = gser->port_line_coding;
>>> +	/* disable endpoints, aborting down any active I/O */
>>> +	usb_ep_disable(gser->out);
>>> +	usb_ep_disable(gser->in);
>>> +
>>>    	port->port_usb = NULL;
>>>    	gser->ioport = NULL;
>>>    	if (port->port.count > 0) {
>>> @@ -1431,10 +1435,6 @@ void gserial_disconnect(struct gserial *gser)
>>>    	spin_unlock(&port->port_lock);
>>>    	spin_unlock_irqrestore(&serial_port_lock, flags);
>>> -	/* disable endpoints, aborting down any active I/O */
>>> -	usb_ep_disable(gser->out);
>>> -	usb_ep_disable(gser->in);
>>> -
>>>    	/* finally, free any unused/unusable I/O buffers */
>>>    	spin_lock_irqsave(&port->port_lock, flags);
>>>    	if (port->port.count == 0)
>>
>>
>> We have observed a reboot regression on Tegra234 (I have not tried other
>> boards) and bisect is pointing to this commit. Reverting this on top of
>> mainline is fixing the problem.
>>
>> With this change, when the board reboots we see ...
>>
>> [   59.918177] tegra-xudc 3550000.usb: ep 3 disabled
>> [   59.923097] tegra-xudc 3550000.usb: ep 2 disabled
>> [   59.927955] tegra-xudc 3550000.usb: ep 5 disabled
>> [   80.911432] rcu: INFO: rcu_preempt self-detected stall on CPU
>> [   80.917354] rcu:     6-....: (5248 ticks this GP) idle=ec24/1/0x4000000000000000 softirq=1213/1213 fqs=2623
>> [   80.927146] rcu:     (t=5253 jiffies g=3781 q=1490 ncpus=12)
>> [   80.932704] Sending NMI from CPU 6 to CPUs 2:
>> [   90.981555] CPU: 6 UID: 0 PID: 18 Comm: rcu_exp_gp_kthr Not tainted 6.13.0-rc7-00043-g619f0b6fad52 #1
>> [   90.981558] Hardware name: NVIDIA NVIDIA Jetson AGX Orin Developer Kit/Jetson, BIOS 00.0.0-dev-main_92e5ae_88fd1_296de 12/16/2024
>> [   90.981559] pstate: 80400009 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> [   90.981562] pc : smp_call_function_single+0xdc/0x1a0
>> [   90.981574] lr : __sync_rcu_exp_select_node_cpus+0x228/0x3c0
>> [   90.981578] sp : ffff800082eb3cd0
>> [   90.981579] x29: ffff800082eb3cd0 x28: 0000000000000010 x27: ffff0000802933c0
>> [   90.981582] x26: ffff0007a8a1d700 x25: ffff800082895500 x24: ffff800080132018
>> [   90.981584] x23: 0000000000000014 x22: ffff800081fb7700 x21: ffff80008280d970
>> [   90.981586] x20: 0000000000000feb x19: ffff800082eb3d00 x18: 0000000000000000
>> [   90.981588] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
>> [   90.981590] x14: ffff000080293440 x13: 0000000000000001 x12: 0000000000000000
>> [   90.981591] x11: ffff800081fb2388 x10: ffff0000802933c0 x9 : 0000000000000001
>> [   90.981593] x8 : 0000000000000040 x7 : 0000000000017068 x6 : ffff800080132018
>> [   90.981595] x5 : 0000000000000000 x4 : ffff0007a8a4f9c8 x3 : 0000000000000001
>> [   90.981597] x2 : 0000000000000000 x1 : ffff0007a8a4f9c0 x0 : 0000000000000004
>> [   90.981599] Call trace:
>> [   90.981601]  smp_call_function_single+0xdc/0x1a0 (P)
>> [   90.981605]  __sync_rcu_exp_select_node_cpus+0x228/0x3c0
>> [   90.981607]  sync_rcu_exp_select_cpus+0x13c/0x2a0
>> [   90.981609]  wait_rcu_exp_gp+0x18/0x30
>> [   90.981611]  kthread_worker_fn+0xd0/0x188
>> [   90.981614]  kthread+0x118/0x11c
>> [   90.981619]  ret_from_fork+0x10/0x20
>> [  101.416347] sched: DL replenish lagged too much
>>
> 
> Odd, you have a usb-serial gadget device in this system that is
> disconnecting somehow?  That oops doesn't point to anything in the usb
> gadget codebase, "all" we have done is move the call to shutdown the
> endpoints to earlier in the disconnect function.

Yes the board starts usb-serial and usb-ethernet gadget and on reboot 
when tearing it down I am seeing the above. As soon as it disables the 
tegra-xudc endpoints (as seen above) the board appears to stall.

> I'm glad to revert this, but it feels really odd that this is causing
> you an rcu stall issue.

Thanks. I can't say I understand it either, but I am certain it is 
caused by this change.

Happy to run any tests to narrow this down a bit.

Jon

-- 
nvpublic

