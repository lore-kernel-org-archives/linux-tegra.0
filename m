Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2065.outbound.protection.outlook.com [40.107.243.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9335222D4E9;
	Wed, 16 Apr 2025 07:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744789453; cv=fail; b=NLZvActyWOnJEePBARhWseiRUI4fu8Q/PQ8aE2hH0msq7Y1w3ddL99vEFLwKV7fTQxX8BoKDLeQMGIsiYB005oSKD6jhHXzykJlHxUAYzkC4zs0L/mB/yCKn4wP8Ws9fhoY7gnZqKaUjjkOcm91hNRRoyh/p55AyJ9dcZ8y7zsw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744789453; c=relaxed/simple;
	bh=VaBayRSedRYv/TY9w8Sk5ROiqF9Z9Krnnzeu+C49Oo0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Qz12Tgz8TlBT9T7wrSKmeauUP7fqWpKG3wwIPUSenYU+yjy3m7CUDjZhe0DUUvUs7GUlpcxgce+QEFCmiXDit2oh/83lr79twv+ulbd/Il2JUwhauXCI7ttfEpwnHI52RctX+0oW06kd6v7MEVjo/p+7Hfy9kfjbnZz3hzKpdCM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FRv4Znk2; arc=fail smtp.client-ip=40.107.243.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FRv4Znk2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=onM9Ex08RZhLfsYy/BOJZjZia3/bQo7K7It/9tYyiC/qkqpWI3+0In9ClI069uI7KF3dPu9oeQwQ0moaKAclkFSsnNaSH+MD7rm14jPKPD0ik/NSbW7SAOlNcydQHmFvsBET6UerMzXdwULP2TCamPa7OIqUQX6JD31IN8GmcL6a5dFUAPcvh35P4rJU/EyYWQKmGdbtQbbArlCi0hEfMmEc3vRgOVdt8Rmdfj+MUhYZ50sPS5+006NsSO5AcHZyK1v1UExm7kS9eejeSHzq+PQmVqOj2k/O9jbEiN4UckQiUke7aGDDhPCY6eiMUJYqcAD/UN5tC2vArpU6nrC8RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WyzzNN2SIU1t+cmRHbgMegaaLUCI3yCDmfc3NMNCq3M=;
 b=fU7Ec8QAwniZZdlvk3rg0ZbMsOLVfZ5MDretAc+o+9Zmy1cy1q24bewT4CwBnm92z6TCdg4Seno+AZT4kZSliwmegm7XakrqTsPCITiWJyxFMum6g31EqMin39slrGCcXA2f9kWwE/8E9R6ZxvLiFdunEE6ruHZpGUaWj5MIsxvH7uzhT4E81xskZvQQXCztBaSH2+SqsCbZXyNECJmOwyHMrvs9I3zLu78JiskiuIynm4dHywkFC4NsXwav53cRqm6o3WQ9Rh1LPk5iN0tX/40gviLFT3km+lJ50/OtTuy2RImUZ+jbP/4Qa8m3E8GD/R1tZpBMUO427/6u1ENF4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WyzzNN2SIU1t+cmRHbgMegaaLUCI3yCDmfc3NMNCq3M=;
 b=FRv4Znk2zWgHLCOZT0FsZFZsHAFq3kghclkLQL9cNhw/gtRW0VN0wnyZf/6H1blQwQt5sNm07DFFcczFCDYKzCbrvB2ubHKsbLxZRWQUdV9kwbcmsyWTo5mynU6YTMUgTRtPdRSUFMGEl1N00VTpitu0KimDspsTq444VDILhX3o/HZlJWNVGSZrbTM+x7oF6r+wQGRAgjo3vSJ1Zo51RErBifpXznB6aFJEjMYoMP92cwX1pPGgH4Opk96xnQNrZGvCom7q+qLGbqaM4CqXuru4HYUoVA+KagjGgsQ4QuPZ6s/ERUKPTp7cs2H77b55YhWNejU01rVMwswd3cGd6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by CY8PR12MB7634.namprd12.prod.outlook.com (2603:10b6:930:9d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Wed, 16 Apr
 2025 07:44:04 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%3]) with mapi id 15.20.8655.022; Wed, 16 Apr 2025
 07:44:03 +0000
Message-ID: <79265b11-c23a-4e4e-b7c3-6cf5b89b9977@nvidia.com>
Date: Wed, 16 Apr 2025 08:43:58 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: tegra-xudc: check ep->desc before dereferencing
To: "Alexey V. Vissarionov" <gremlin@altlinux.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Felipe Balbi <felipe.balbi@linux.intel.com>,
 Nagarjuna Kristam <nkristam@nvidia.com>, linux-usb@vger.kernel.org,
 linux-tegra@vger.kernel.org, lvc-project@linuxtesting.org
References: <20250415174204.GB6814@altlinux.org>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20250415174204.GB6814@altlinux.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0466.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::22) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|CY8PR12MB7634:EE_
X-MS-Office365-Filtering-Correlation-Id: bd17995d-5502-48cb-54e3-08dd7cba756c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dGMwTWRaY2hkSGl3bnI1UVVOc0pVUnQrdTJDK1VzdjFGSGtqK0lzbnVMRlNw?=
 =?utf-8?B?WXNKNjYvdDBNYWh4SXd1UUFDWG1hYjFMdGZ1bXQ3TkVtakVISStiTS9zYmxv?=
 =?utf-8?B?MDl4SGsrcFd5WCtpTlVaY08yRG85bmdRY1RsWDVnMXE2K3BBRENtd25NRGtT?=
 =?utf-8?B?NVdaR2lVaTFBbFltVzkzcG9uaWdoZ0poNTdNQ1NObUtvVEVLbFBRbVQrQ1Jv?=
 =?utf-8?B?d3BScWFkMDNNdW9CNFU5cmNMekFvS0h6MUFIZDlKbnIvdW5uaTVkU3dLRFo5?=
 =?utf-8?B?enQzWmx0L2xXMWhKNi9XMzB1eHBrd0wrbnpycGZYUEZ4MlFEYzdmWFNreEsy?=
 =?utf-8?B?MzVidkxKdll4dnZhSXRtdEZncUFab1E3Z2pSSUZubjhLWjZyYjJQdlM5cVhq?=
 =?utf-8?B?bXJYT3IzM1pDSjlibWRFbUJBd25OWTVSQks5THlWWVdYamNYWVdIVk1nTEZk?=
 =?utf-8?B?Y2JDWUYwUTNxWFRnL1ovUWRQQUs2RDNna0RaMTN2WkZiVDY2aHJiekVIYjdN?=
 =?utf-8?B?ZlM0Y2cydXllNTh5ZHA5QmkyOEVPc2xXNEdHQWdETlh1a0JnSFFSRmFhQnho?=
 =?utf-8?B?ZFc5WFRtUXY1Z3hrQWdBUjNaL29ITFBxdjJ0QkpRd1NUb0R0dktMbVNXdGJN?=
 =?utf-8?B?QmRBY1lQbjhXZm9Ib1N3N2prVHRoRWNPeTZITEp1UzNJTit6c1RXaGt1TWFv?=
 =?utf-8?B?dmlBVTA3YjVvNjc1ME9RZkdxOVppZnc3S2MzMGhuSjJSRVVZaklIMlRrdVoy?=
 =?utf-8?B?bHlybm1HbDZDV3c1VWRQUFJxSXlQaTM0ckgrYUhHMFpGUG9pY1o2WVpCLzBY?=
 =?utf-8?B?TVFGdFo4Q1Yza3JZaTAvajRpZ3RBT3pZc2J4dUZjTENta280c2h2TkhycXRi?=
 =?utf-8?B?NDNJK0VRL3BSQ05sWGxLNzNvdFpBaHErOHRuQ2NsVldaaWs1WG05b0xudGxY?=
 =?utf-8?B?aEJhNWc2NmQxNkl4OFFyQTY2TlVydXd2WGk2Qkc3Qnhadlc5VlpyOTlrYWht?=
 =?utf-8?B?ODRNVlJzcTNqL2pIb3loQm9ab2F1NVVCbFh1VG81R2prcnRJbWZjbVh1REND?=
 =?utf-8?B?K2MrOFBJTzNjd2tka3JnY3daRFdaRHBFNDN1RXloa1MxcTA1L1NhWDZMQUxl?=
 =?utf-8?B?UVBPTTh4emN3R1d5MUtmRWJiSEEyWjhTTzY0OGxhMTd6WEgwdSt5OTZqQ3hB?=
 =?utf-8?B?Lyt5cEgvTnMvOWdzZDBlbk9heXpNNEI5L2RpZGdRcFluWnpxSHRuZERLclFm?=
 =?utf-8?B?ZndZdmlMVWpETkk5VGlOTkVkVEZzZzlBUWJXb1lwY1lhS0VvT2RKUU80Ti9E?=
 =?utf-8?B?aHphWm5lRHphZlhMNm5NZndrYU5FdThYQkxoZitoNWEzeVVJSlpHdG84dDhv?=
 =?utf-8?B?dHh5eE1LaHF4OTVNdy9sc0NSY0RFcFBabHNPMlp0MkdzOVpXYlFOd1ZjdnF5?=
 =?utf-8?B?ME1jVjY0QTZLR0VKM08vWEJ6R0NZMDVEQm5tVk9rbWlpaFRSQzR3SlFqbHVu?=
 =?utf-8?B?SFdjNjV2amtLVlNSdnpSWFVQTkJxMmlvNVd2b0YvK1lWZy8zZi9iOVR5aktk?=
 =?utf-8?B?aDJ0UVE0SzdlN2FhdktrQVFzRXdXU0FGekNUREZ1VzRUTVVzVnV4czUyTG1h?=
 =?utf-8?B?T1pwRVJCWTRYWnpoeVAydDdDY05XWklVVzZ1Snd1THFpYmRKZWRoWHFndWFl?=
 =?utf-8?B?RXV1eEJDYjBUeExYVlJFRXdHZGZ3SjBUS09Vek8wQlB1aktvYW5zeHZQNmNL?=
 =?utf-8?B?SGRPazhTSnQ3TEp6UTR1TmdOSjZvdDFRVXZPSUdiaGVrZ2IybWlNbDBHL2JK?=
 =?utf-8?B?NDg5UnZNYnh1bXc1enRqYURJNjU3cTVoQjhFNjNOaWVIanU0V2Z6bXZyR09u?=
 =?utf-8?B?Wjl1TmVpZW1aZU1lUVEvMm9RYnJhL1dGWmJFc01aYlBoYW1OVkpQek9xNkN4?=
 =?utf-8?Q?+l2nyCwfzCQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SExMSmVWZkx0V3dRU0ZEbUJFYThhWkNZSFgrZERmcVZyN0JXMHd4a0VYVFk3?=
 =?utf-8?B?QnNXaFlIQlMwU1RVWlFDZlI0YzdiUVBsTlNZK1RSUjNndS9TOTZkN3I5OVpG?=
 =?utf-8?B?THdqZlNHL3l4WmZFL0dORk9iVG95ZTBzYnBDQW5ROHpESk9mQ0dUZFpIMVI1?=
 =?utf-8?B?Wk1qR3RUTDJwRkQxaXowMThERmkyT0ZvNjVvZVFJWGRhNVNicG43ZUsrRVFJ?=
 =?utf-8?B?QVd1Z0t5TGNLazdXcnZDVTIzTE1TMGFtRkhwVUhZdkhxaVJyUDZJelFIWGV6?=
 =?utf-8?B?SFNoa3hFWU9xWkFzK05HcEJ1V1dadEdhaEZOQjYyTFYzdG1sakdFSGZqK1M1?=
 =?utf-8?B?dEVUNTZwRTVHOFJ2Ykh2MjZ4clhWM1E3RGpMVE5aalhPb1FSNTBtMjVreC95?=
 =?utf-8?B?NkJWS0tSMitXMG0xbzdLNWIrYkFSZlBMdnlSdnZoay9oK1llWFJlelMyc1du?=
 =?utf-8?B?dXgvRnNaRUUzMVBWSXhtcTR2L0I0bmc0NnVuQ2JuRDNTV0EreTJXZ2htTFJ6?=
 =?utf-8?B?R3Q2OFVCWitXKzJpY3krc2tvVlNkWHBpendOSkxGemJCZ2tTdGM2aUE5L0Ix?=
 =?utf-8?B?WC94TXdNRTdudkx3cUJvRGFaTmVkdnpGTElUeXQzdDRuVC92alM5UHV2eU12?=
 =?utf-8?B?VnVuYi9Gejhid1dFRXpvaHBNL2pQSXBZZnhHeGcwSFRKcGNkalRUc2NlRGoy?=
 =?utf-8?B?Q1NuKzVHcFQ2WnBDWFhyRGxib2MvSk5CNjFjakF3RUoxRkQ0Nm9kUGpNR0E4?=
 =?utf-8?B?S3I3WU1RTFdZb1JvSW5sZ0RvNUNNcTRXNEkwbEljTE1jZlFIRm9MSjk4amNz?=
 =?utf-8?B?aXlycnJ0QXdpVW5uVHVrVW9yTjJQN05KREs0SEJwblk3VzBicnpBK3B0c09D?=
 =?utf-8?B?c1NNNmxvM3FBcjJ2d1JGYUNnVHJVZnVnSkRJT2JWRzcvbnd1b2ZYWXFNU2Qw?=
 =?utf-8?B?cFRiaWVHVDM0SkRGVXF0a3BoUVVsWjU2RVZleDJvRGdMNVNOVkpRV3I0Tjhu?=
 =?utf-8?B?TzhzbnhIUHpTckRvWFpDZFZHMi9VcS9QamlXRE9oWERuS1RBN1E5bno4WWRr?=
 =?utf-8?B?bldJREJNRXg4dVFSSCtDVnB5cWp6OWw5S3NuNUFDTytVOC9PajdFK1FQbjgy?=
 =?utf-8?B?RVZROEo2WWc1ZUNQUnE1VzUzOUlrcmhIVXFNbUV4QldqdmJGUzZzaWhVQ0Jq?=
 =?utf-8?B?U1FudDJRL3ArVTluTFdIK1N4dnY1QU8rNi9MV08zWS94TzVTN2QzblR6eVRF?=
 =?utf-8?B?MTJUMUtsbEtlSlNzYnhRdmFzaVNqYm9KekxtcmhmK1RsZjcyL0lmTUlkNFBK?=
 =?utf-8?B?WWIyRnM1eDlrVG9hYzZJL1ppTFYyMDVHelBHYUF3V1Y0WEcwdHNCcjRwOHpW?=
 =?utf-8?B?Mm1veU5OQUtkaGxVK1BXR25mTmlhZTJGTmdSOU0zMW5pV1RhbUxRK29Sem1k?=
 =?utf-8?B?bzBuRHh2T3RpYlhidmt3V1ZlbEJFYUsxZGpGZEVMU2U1dVo1TnAvZ1V4WGlq?=
 =?utf-8?B?dTVjdktRSk02RUpNNmJJNHdsc2xsMEgreGZFWkMvZWFmWXplWVBhRkgzZkE3?=
 =?utf-8?B?MVJrR0lscTBnWFJDL2tkTytzYnR6ZVVDUXdSRlJhZ216S0h6NWtvMmtVcEtG?=
 =?utf-8?B?aDJFNjNYTzRSK2xvb20zeE15K210dlNiRjdxc1AxSmZyNGFDVm5ZcTNPU3Zi?=
 =?utf-8?B?V1hSUTAyTG1xd2Y0MmNLcDd0R0F5bEcyS3ZXVVROaUUvR29SNDZwWUhyUThR?=
 =?utf-8?B?TEZvUGpaV29Tbzc1UVdHbjNUZSticlhTdnpWei9DaVFrVzdKWEQrNHpKYkEz?=
 =?utf-8?B?OVJLbUptT0hEZjVjU3lSbVAwbndxRWlocXZYUGE5OGcyQ0Z5dE9vL2pPZmR0?=
 =?utf-8?B?eUlTL2MxNm0xWnBrL1NSQ1dvZkJnTDJLemlUTVlLRW5vd29nU2czdi9GeXps?=
 =?utf-8?B?WnlrWXplL0t2WDhZNm82UjQzZlVUak9oNlZ0Yk9RbWg2NTFGZ3EvbDhPTkpr?=
 =?utf-8?B?S212K1VlcjhlNDR1SmZrWkQ5UDRkZEJ4ZnRrZjFibDZ3M2tvNWNaeTMwWEQ4?=
 =?utf-8?B?RVF4QXZOamFGTUJSeVVrOGdYVk8wRExmZTRqUXFPQmhlQnc0cWRaVUp5L3oy?=
 =?utf-8?B?Skd4QkJud01vWFFBcXpRUVdPMHBoZlNTcXl0azZqTFFVYmFUelNXbjVZOFRs?=
 =?utf-8?Q?IoyBp7X0kDR6z4qN5yFAob14uj02rzoWZeN2fb6uhiPS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd17995d-5502-48cb-54e3-08dd7cba756c
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 07:44:03.5948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tRZQKbUNQZNSEjQ2JZQKskXT5t+Tw1/JeaMchvd4BAZPQmUzch8UEBDBLMTN8xNWsgLjc0uAIHrd08DcL4VdtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7634



On 15/04/2025 18:42, Alexey V. Vissarionov wrote:
> Check ep->desc before dereferencing it in tegra_xudc_req_done() call
> and later in this function tegra_xudc_handle_transfer_completion()
> 
> Found by ALT Linux Team (altlinux.org) and Linux Verification Center
> (linuxtesting.org)
> 
> Fixes: 49db427232fe ("usb: gadget: Add UDC driver for tegra XUSB device mode controller")
> Signed-off-by: Alexey V. Vissarionov <gremlin@altlinux.org>
> ---
>   drivers/usb/gadget/udc/tegra-xudc.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
> index c7fdbc55fb0b97ed..0322e984e2c6fd91 100644
> --- a/drivers/usb/gadget/udc/tegra-xudc.c
> +++ b/drivers/usb/gadget/udc/tegra-xudc.c
> @@ -2661,6 +2661,10 @@ static void tegra_xudc_handle_transfer_completion(struct tegra_xudc *xudc,
>   	trb = trb_phys_to_virt(ep, trb_read_data_ptr(event));
>   	req = trb_to_request(ep, trb);
>   
> +	/* tegra_xudc_req_done() dereferences ep->desc; check it here */
> +	if (!ep || !ep->desc)
> +		return;
> +

Looking at the code, it would seem that we should check !ep at the start 
of the function, because it has already been used at this point. Also
!ep is worthy of an error message because that should never happen.

Cheers
Jon

-- 
nvpublic

