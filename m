Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013034.outbound.protection.outlook.com [40.93.196.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8CC302CA3;
	Tue, 11 Nov 2025 14:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762871761; cv=fail; b=l3a3+nZP0js9v5aeVHZ0lgXi+1Iy+Uh7t3Q9foFhHvw+hthV3aJxLkRzI54/2ooEtlLSJrAfbq1qdwUAHx1j7y3sJotA+joUIq9DPANl9Fc8j7rZQLqvZ6xZpdK3x/yVw9EJVrsV90lHClrfPiWyFqWIrIu1sG13ZeN5qxB8oPE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762871761; c=relaxed/simple;
	bh=M/vj+WmyNOY/8OwyZapCE+3Y5QuOAB52fxmTGrFYRSg=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iCfeQuDU7FY5O/90H/AEvjqBiMCi5KC0NX9PZBNx3L0LmM5aSpJzRQO33mqIPrtwxt0omXvWHoEZ4hlhh8q3hq/617YsJ+rAhA4p4F89oRfozEtNHuqKiLoEU3OEWb2N/NWBg43WrdADQYzZQp1nV8H62GbJymIttt1H5ytLq18=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TJzs9z0c; arc=fail smtp.client-ip=40.93.196.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TJzs9z0c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZDdtUyuD7eu1eWzLKkPqbE8dg1eKu/xOwQReGNHuZnZwnurjcA7ukt7NymaD1473nyfaTwaoStiIuU2xRp9ZxyjjhQygubt0jSf+TLD354FqPk5yFhED2+42lzgUEDO+foyMGUbXshIrtQm5Uh3JdgkOm6AN6qoSijWs1/oMN9NU4sK7n4k4efwyaMLi7Baesp6zcAOmIp36+bmxbBFPQyc0j1k8djpwj9w+Ejzuk0QIY3GZSVEnVtQIyOsw/hACzLni617qT3qdy+LS52s5W8V+JvEoYLpgdmmMzt+CuVxal3261057YAwC88XHIK7WB52IqOd/H7FCUz9326zi9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UAR9yCO9b3l0faiLTCKMyV06QRd+xCc8pfhaw1gBAJY=;
 b=tzKkGAA9hkgoTDsAWRqzfjhZv5RCpsRt1F30TVx22bA86nQ9RhN/ltmsOYt6jK8JcGd4gsU0zJGdzWuGKf43mGk3fL9nymRfXsLHtFmxGyeZ6jZToDvyQCbjqcWOPE3AwwRSu182Rwfy2X4/vY3JVbaBa6HW2Fytg5dD9s3hFO5KKnI/sm8sU/aG7F1s7RSJ+p7fhInA7WX6GFKtsyToyn3Ig3AK0OW0mR9iKhKth+FEoOdHUAr3VJnaqmUWvGgyhSH1BtuO7zwVy59FDyHI1/0kyDQ45BWQc4FqiryfV/FltGD6w29Q/aP+qEbCUywLjI5DOY8958rCtGvsW5CrRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UAR9yCO9b3l0faiLTCKMyV06QRd+xCc8pfhaw1gBAJY=;
 b=TJzs9z0cEni1rGkHzbZlZFbCYmtdXK68K/Y6grS/itJlk+S3k/vYVoArYlw+6z1bw0QCxUPKpvFf1ffX2AiodP+K7lAOji8rjZAkJ3XDgt7tOtu259oQHSPJO3KaYXT+tmwCec0blAvJ3QAlIoXZwmVLeex6Rk6+Gj26tMzrdksFw8wSTHnuUTXfV4UdB7bY5j/CJBJi6LrurNiuwkWa+/ieNlUh+av90snQvey52gND2W+CioZ8nDBS6x5Gxp+BlQW/SgnTodQ8cQxpOyUHRvBY7O/6ukz6qimmT2DZAmDsFtodmVwQdVyFbd+sj87/LJzjvJ35ESYhfWq9I2Xlng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by SJ2PR12MB9113.namprd12.prod.outlook.com (2603:10b6:a03:560::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 14:35:55 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 14:35:53 +0000
Message-ID: <d5d23eb5-f43c-4e4b-9926-3fba6ffd3acf@nvidia.com>
Date: Tue, 11 Nov 2025 14:35:48 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] memory: tegra186-emc: Support non-bpmp icc scaling
From: Jon Hunter <jonathanh@nvidia.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Aaron Kling <webgeek1234@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20251027-tegra186-icc-p2-v4-0-e4e4f57e2103@gmail.com>
 <20251027-tegra186-icc-p2-v4-3-e4e4f57e2103@gmail.com>
 <82c8dda8-6fcb-48f9-bdaa-f3d1431e41ae@nvidia.com>
 <CALHNRZ8nCojreFCMXfbBBhWAMtmWN-04XtuW8fEsVD9bw+-AzA@mail.gmail.com>
 <CALHNRZ-CO5i9jeLkEG2cmHxcW1bcLhxcBSxjmL2euHfQy8yr-w@mail.gmail.com>
 <e6ce190e-6df7-4c36-abca-f09df3cc80e7@nvidia.com>
 <99ca4992-5736-417d-854e-379542549bee@kernel.org>
 <7f3dad08-cff5-40c2-8e7f-f6441a3d6b91@nvidia.com>
Content-Language: en-US
In-Reply-To: <7f3dad08-cff5-40c2-8e7f-f6441a3d6b91@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0306.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::30) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|SJ2PR12MB9113:EE_
X-MS-Office365-Filtering-Correlation-Id: df89046d-7ef3-4bb9-2834-08de212f9e23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WWd5d3UrUmdMTFIxeDB0ME9iciszdE9JRTh5bmNmTjRrVTlJZ3E3L1NsQ1U2?=
 =?utf-8?B?QU5aWHJhblJkR2F5SThoc2ZvOTlQZzhZeGFUUmNmd0JLY3VTd1R5VFVtcEpa?=
 =?utf-8?B?T0VzMlp2RkNLV0k3YUs3SHdrVk5URU0zRmlzRlkxbzVTMmF6WjlRYjk5YmdT?=
 =?utf-8?B?S2t2UllaVTJ5WjAyQllZcjlCV1dReTFiNjlFZGNuN1BVT3B5RVFLOEJyQjk1?=
 =?utf-8?B?UVAxaVNzT2t1c3hIVVBVdkhiRlkwVXhCbWtrcGpweGRMRGZkaFZrSTBRMENn?=
 =?utf-8?B?NUpCSklkcFN0MkI5ak1JNHljVWxoY0ZZbFF0TFk1UFBmMWVqT0tpSkNNS2xw?=
 =?utf-8?B?d1Y2WHpIMTlERHJueTVSdDk4NkNpODVPeGN2cmFHTUY4MHFhVGFoTWsvVnJw?=
 =?utf-8?B?RmxsUWs2MnA4bUdlN1RLN3RObElBQTc0a1lIYmZSVTB0ZUtGaS9TYkM1Y3V2?=
 =?utf-8?B?OVYrd0ZzQ3JhTUI1U283c3I4TTFsT1p2dWd0bjYzUjRTcW9WU05SOHJHODBk?=
 =?utf-8?B?WkkwUjViakN2emNxSVBqZW9KRDd5Y3RqUnpuajIzem8zV1QxdE80elhxbUJF?=
 =?utf-8?B?dzU2Q2orWnVQUkw4TzdBTnZCR0VXWFdYNWlnYXRCUThxMzhFVGM5TjRCbUx4?=
 =?utf-8?B?Um9QTUwzMXFiTm5SRWNOdDcrcVlSMU81bG8yQ2V0b0Z3NmFkNmpLOGhMK3BN?=
 =?utf-8?B?S0ZOUzh4dFEyM1k2YU1PQTZ4UTBDY01mYjllZG9BeUVpcGQ1QTM0TlUyTUNL?=
 =?utf-8?B?VXV4SU5aaDRFaTA4QzdKTDdLV201Wlp3eS9ON0RmeitTV2VxdldsdllhOEx3?=
 =?utf-8?B?MzlQT0NYdFJTMTF1K2tadE0vbnBGb1BSc1hCNTcwWjhKZFYwa0tXZ3Q5TFNC?=
 =?utf-8?B?ZE9BWXZKaXMwREJCLzBpblVpN0NlVzZ1c0NPVDZ3T3E3U2k0Z05XNngrOFJT?=
 =?utf-8?B?M2hSWUU3MkRQZVllbmdUMG5KVkVCd0R1ckUxRC9UYzV6bkNXRG0yOGVWaDZX?=
 =?utf-8?B?MVJhQXJLeWFiUFpRQ2JlVy9SMGlaTmtOb21YT2JCTk5vSytvZm03UnJrN2da?=
 =?utf-8?B?YittY3BqZ1lQMEF1V2xZa3dTa0V6bDl4ZzgvQW9EMkNUSGFJNVN0U1hnODE3?=
 =?utf-8?B?WnpQY2pBR0IyRENZTjhOdTRpaFJRbWpHYStydjNweEw0UlpSbVJ6Yzd6Zks4?=
 =?utf-8?B?MzRFUUlLb1o1QmpNTlhVdVh3V3lNZHpnTlpHK3cwbE5Fd1MwdkhhN2JtL2Rz?=
 =?utf-8?B?Nlpxb0QvQlNPY3Aya0RNNnJsZVJ2S3F6c09ENVo0Y0l6ZlRqTnN5dmpmTnUx?=
 =?utf-8?B?YkFjUTQzaGwySG9UZHR6YkRLdzJIUUhOZXVaZGczTGVSa29ZSGpPc0JEZHhz?=
 =?utf-8?B?VENqcmF4MXBNMVlrMU5NOS9uUGMrQ3ZuclRDeDRKSVBBSzE1OFFxMzBIMzg0?=
 =?utf-8?B?Rk5XRU9QN0VLYUtLdnNGeHpOa2xIRFl2OGZnbWIzZTZGRnJBdkxoQmdPbFJ5?=
 =?utf-8?B?Sjl1dndMcTNOWE43MTErREZxWEhmVkJOYTRRR003SVYwU3JVNnlpRlVhblNV?=
 =?utf-8?B?NkFOZXRsV0VEQ0xxMGFVMStvcWVKNWgxcGtJNURHVTVYSkozemZkWmg2SlVR?=
 =?utf-8?B?ZGQ1UWVEb1NQVXkvK2lGNmcvbVNoa0pLTTN6ZFFqWnd3a3EwRmxMMm1ycktT?=
 =?utf-8?B?YmViSG1BVDBYTmZ3WTBKWGFXaUszMDAwcGxiYXJwTkRnOUcvNHY4NDVhMXlN?=
 =?utf-8?B?LzVYRm1tL0xrVWxQOWNvTURNWnRudXR3RERvbW1DcFlua1VLc1FFT1pvcTBS?=
 =?utf-8?B?SHdCR1Brd3Z1THNCY2FUMUt1anVCYkwyeEQyVjlWOEdGODVacE5zWjJDZHd3?=
 =?utf-8?B?ZHFOdGl4N3h1cE1sMmtEWFVOOEFwS1cwb1gvaCtvUll0VmRnWFhTTVJKU2M4?=
 =?utf-8?Q?33wu8TVgDnmTtDMjqJh5BK9UXfo+eB5H?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cTd0V3QwZXBCbUxSeTEyMUw4Q0g1VHRJSVZxNEg5NWJRY3o4ZG5qVzFubHFF?=
 =?utf-8?B?Rm9KUHhEMWNVSTYzSG4xR3hxVTZpVW1kbTEyNzdYbWJLbnF3YUVuT3gwRk9H?=
 =?utf-8?B?UGlmeUk2YU1NTWRIaldVbVpBV0NsVzhJVGZQVUlOYXpXeEpuVlcrd3pPR21V?=
 =?utf-8?B?b3lZQy90dFFrcEJ2ZDB1QTROemJMT0s0cUErazRxd3NMSzJUa2trYzFjeVJs?=
 =?utf-8?B?bkk0U213SDNjMlpYc1Q0TUx4djlPNzJTSlV2cW5sVStrbThDSXZKS3BWTVBG?=
 =?utf-8?B?MjhqejdENUQzSU1Ua1RVOFBicjZRSXhyVzY5bnFUQXM4Wkd4MTEzZEdhaTI0?=
 =?utf-8?B?LzFlZDNybk0rRjdCZ3JmSnhxalhLcG55UjF4SWZZTnI0WmFqQzI1YThDbU5s?=
 =?utf-8?B?d25YTm45TTl1Q3RZUWRXWmxwQlFnbmhKS1RJUG9kNHRMQ3VsMUtOK0h5dDFp?=
 =?utf-8?B?YTYrU3Z2RzBuSHBpaU5FaFVwNFJaUmdyeUZRQjlGNmZnUkJZUFRRejV4MXA3?=
 =?utf-8?B?elpGb3pTR29PQjdpQlJnaUhBdWU1bUdtaFQ5SktCNC9IbTl6WkhYcXJHaldk?=
 =?utf-8?B?bURnTjh4OEpmUmhnRXh4UGNHTUxjY1ZnY3M3TEVxc0hSNW9iQ1dPU1JIVHRK?=
 =?utf-8?B?OTU0eHh4c3NBdXhwVE5PbFU3azVCVThHYXJ5OS9lSzB0dGxkcXRNUnR1TUxn?=
 =?utf-8?B?d3hHaEFJZEltRGZnTjRsbkVjWlpyb0NJOEVmam5SQzh1OHgzWlhkdEFWT0Mv?=
 =?utf-8?B?UzhQZGgxSDNxenJJSXc1RmxLRWZLRVpFRE5GT2lmZDFnZytqQm5YV1liYmVu?=
 =?utf-8?B?ZTVHMGlVREh1bjYyUjdtcnpwZFhGeENiQ2hqQTBYeE82OVZEQzNCRDUxb3A1?=
 =?utf-8?B?dlRQdDBMZ1o1cTVvOGJHUlJkQlBoVVNnak8vOUVsOHpGRmM3T0kwSHlnK0ti?=
 =?utf-8?B?YkE3OFBPMmtTaFNtMEhQVWFtM21Beko1Q2o4QVBNelNVYkl1a1F0bm9OSDgw?=
 =?utf-8?B?VDh0QmZUWXJscDB0SW9QTEVHZHVtaVhOVjhxQ1hhemNnSlJjaDJROEMxUXpv?=
 =?utf-8?B?N0syTTV0T2w1cXU3OU8yWk5uSHltNzRRbmtqcjVZTjBnQ0tzNWdZTGZnVEx2?=
 =?utf-8?B?WmhjWDg4MVJ2U1JicDh3RXlOVkxvVSt0alV1ZFhFenpWUGNsS3NZYUVpeExU?=
 =?utf-8?B?UVZFblBSTzZ5SjBSbWJ2UE5rU2szdm9Vb1F0cUR5bnBaMFIwT08xOHhYNlNj?=
 =?utf-8?B?ZmZSZUp4bWNJQThwQVpDYnY5Y3pJZkR4eVY0a2oxYy9qb1RxWlJBS1E2cEpv?=
 =?utf-8?B?UTAyb2doVlRJLzNsSnFYZGhaaXYyYjlIUkVvM0szTlJKMFJNeFFyOEx4dkNa?=
 =?utf-8?B?N2FWUWJNNGZsSEh4Q1RrY01SeHdnOWgremU2UjBRNU5FeVVzQmlQWlVTQ3R3?=
 =?utf-8?B?WUxpMWVtV1FMczROTFhZRGlhSDQ5ckpDR1o1RG5TWTlubG5hMWlBdmhWb2ll?=
 =?utf-8?B?ZDh2TzNicTl0eFU4T01VeGpoTmx1RGtmSWJpSUhkTEIrSjlINTV5RG9ZaTNI?=
 =?utf-8?B?RStxY09tTGRJN0dyMDBQNllPeDZQQ1d0SXRFTnVISUk5MkFHbzA0UEVvV1Zw?=
 =?utf-8?B?TkREWmk0QXlqNlVQK1ZOVnQvWUd2VjBWS080d0loVVQzaXhkUkIvbSsrUFRN?=
 =?utf-8?B?MSthZWxqQnZSa0lxdXNvU2k3bDMvNzIxelFpcUdwVTdaZjZSZ1RkS0hMd2RZ?=
 =?utf-8?B?NkRFWUhBaXZ3M085VzdURy9idUkvWVdoaTM0ZUMzQXpaNVFBYUtuWEIwR3FY?=
 =?utf-8?B?My9FRHJQYkNvcGlvZHV2YUkxK09BYjRKKzBKK3BLYzhtVzVXbVE1YTBmKys5?=
 =?utf-8?B?dVZtVWVtdE5FWmJOY3l1d3RTK2pZemp3bnQ5OVpEdCtQdFcrZGhIUkd0VXNM?=
 =?utf-8?B?Qm1JejVLaHdIc0tMZmdDYVVFTU5UTmFnOHdHRFlPdS9jNTlMQjRSRmMxUFMv?=
 =?utf-8?B?Zy96T3FKVmI3VStWV2pVNGNsSXJSdXF4dytoMzZnV3c1bmhpa2JSRndnNlcr?=
 =?utf-8?B?ak92Z0F0ODlZMkVtbW40NGJEWC9vVnUrWlA5d2MrcUt5cTJhbHVScFVkd1pk?=
 =?utf-8?Q?iWsgDMI0kkFH49jAeHN1OghYC?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df89046d-7ef3-4bb9-2834-08de212f9e23
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 14:35:53.5169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vsDSLmnGu2v3XfLam+0WXG67jnyDcMLKwM1cwVlKPGp6TrYbsL3O0coKX6tim2rXvhN9YhyfY88tfu5WyOlHkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9113


On 11/11/2025 12:05, Jon Hunter wrote:

...

>>> Thanks for testing. Something is not right because our boards are
>>> failing. So may be we are doing/testing something different. However,
>>> this should not break. So there is a problem here.
>>
>>
>> Did you meant: "So there is NO problem here"?
> 
> Nope. I mean that this is a problem here.
> 
>> I kept these for 10 days in linux-next and yesterday sent them in pull
>> request. If some patches are needed on top, they can still fit coming
>> merge window if sent soon.
> 
> Looking back I see it started failing with next-20251103. next-20251031 
> was fine. Reverting this commit on top of next-20251110 fixes the issue.
> 
> There may be a difference in the firmware being used. Our testing is 
> based upon an older NVIDIA L4T r32.5.1 release but nonetheless, we 
> should not break that.


OK, so I see what is happening here. The boot test that we are running 
has a 2 minute timeout and the board is now failing to boot within that 
time.

Adding some debug prints, I can see that initially the EMC clock 
frequency is 1600MHz and now after this change, on boot the EMC clock 
get set to 250MHz. Hence, the booting is now taking significantly longer 
and the test times out.

We definitely don't want to increase the timeout of the test. Any thoughts?

Jon

-- 
nvpublic

