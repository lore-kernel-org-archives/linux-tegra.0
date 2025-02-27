Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2053.outbound.protection.outlook.com [40.107.236.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257651EFF9C;
	Thu, 27 Feb 2025 18:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740680027; cv=fail; b=ZfLq6CXNJ5eVIluv69UdbyfsKEWkgG2CQYr1kBcMRKRq375/lNolBT7Ed2BfQRR93AYpropvL5LLoP/UOTS+BflLwI40dR81qLjqZiQ5B2ZGMeL2ZwA0EKe+q4Mb2oFvyvw9xP1+Cm2/oM6mz3mxu6MIfP3ocorMAav21xGcz5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740680027; c=relaxed/simple;
	bh=RsLNKxRuc/8QMdF9146+5Fy1hNQDxGTcxfxY99mWQcc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=N8Iqa/RW8jNul6gqkKWKP2YiB93hNZqemQVyCmkoodTSCAYk1gIe+E/4YFjCqdvdUnzARgJbLFGjmfxfEtgOh5vwOfnib5YiSNgtfHnIiv3tyB17MM2y4/Q9FdiKfaOYwXSNwj0aSHqM/MVdjLVPhHgC2Mm/U0Ow18kBFhTAd+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tSQDkpR7; arc=fail smtp.client-ip=40.107.236.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tSQDkpR7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=juclEHdhLh3QsSfgCZhIf/nGEcoGOnka9HO4BK85VdqVpcVXl4cwg+PsKmwIrwFhqX/Z+0ObFzW2cJp9Q1mkdFMdkK+k2G31TuNgsLGNYQlQsxBbs/wlmw9oUaHZyffH19Gk0RS3hSuOi247Ma93TX4ob9R8iFX519G7kMHvhhhCbpMGdWuuipXyfh6T48xlwRrybjY6pCsaUugRA3qb8Hr2tC474aAh6QhnXiTcE2byoWa9dfdSJauWAVokQsndKWLZjgl//ddIbqeOFswR3VqZMpaTnxtYhgc9ldvO5fCL+4Qu3i2M/TZ3IEqrJSztMnG0hQVvIvoE14JyeClqPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BDcZ5ygK5qGJBDgDkwwxdKb3VnffTG1NqZ/9uwtu2wI=;
 b=IrzrGGOxDzHmXKzqmgOkPso6/WNz0IsJEZ+ATftFI97ef90Ek98/dOzEVYR8C9OKCdreomXNPdFG9pviA2nhxi74ljAfg3lrijoKQBXfOCU2VS7ixCeJGNrIdIkn6Y05U7Ldm1O44m6pDRBT6SxnpgVkCzJ+Oxkn5N8LW9lHUthnyABjyXjMLME4dM2DSRtpwvvoNd7VJ8KyFampwY3WGN+x8eEgoVeHsr1mahuBoa1Vr2KXaxxLTFR76BhgJLdJQk3AyjA9ZCVlxoWucUj3k3h2VJOTov0T7hDkp9hZrrpbpT4cUeQlnXtlWYHAtHcdfseiHW3GeHkHMzhq7wT0dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BDcZ5ygK5qGJBDgDkwwxdKb3VnffTG1NqZ/9uwtu2wI=;
 b=tSQDkpR7bMAfcmJMgc4zGRAwZSMDeb9NiYW7BIQ/EqOrman6zRWuy9Q7sOcH/B67Z/p/CZsXf2j9hzxusSr0l9tND+1fkUZaB1Hxh+xFQFypiQkEHh7VwkPib+ujKmDr0SPC7EA9KxT7o22VkkZb2hOU3G4Js1ajAJfcbeZpWeBa/8QxeHraS50yeJnrzPaANFj5PADxygkNgAgNrGuDsrpMAjfVL3h4vbJgSyYIViMNDtdoHsGIT6osSMpwQt0ZnIxx7LSB0HScSdVyam0WpKqqK+J3KotZYbQDw8jvTwvqCvBScQQGGT4uD7afO/FunOhbBRHrIIknq4vNCwZvGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by SA3PR12MB8438.namprd12.prod.outlook.com (2603:10b6:806:2f6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Thu, 27 Feb
 2025 18:13:43 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%6]) with mapi id 15.20.8466.016; Thu, 27 Feb 2025
 18:13:43 +0000
Message-ID: <4bfb33c7-5d12-4862-bad3-495ce5fd70ed@nvidia.com>
Date: Thu, 27 Feb 2025 18:13:36 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mailbox: tegra-hsp: Define dimensioning masks in soc data
To: Thierry Reding <thierry.reding@gmail.com>,
 Kartik Rajput <kkartik@nvidia.com>
Cc: jassisinghbrar@gmail.com, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250123124632.9061-1-kkartik@nvidia.com>
 <hgvxugls732nt5yfoqygvxn52x73ioh4qpbbmu6swwmafsrmm7@w2gcbjinmujj>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <hgvxugls732nt5yfoqygvxn52x73ioh4qpbbmu6swwmafsrmm7@w2gcbjinmujj>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0225.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::10) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|SA3PR12MB8438:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c9c084e-2649-440d-7b88-08dd575a77f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UU1kVEMxdkVOVmJiRkFjZHFUaXBmYTZNUTJwV2NOeVhlSWp4ajhUMXVpTDNW?=
 =?utf-8?B?dmFrOVdpTWdiS1Z5Zzl5cm5vNjJqd3dSd0NXVzROTDIydDZrWEZwa2RPWTFX?=
 =?utf-8?B?cFNWNm5pUzBaZXVjbXd3Mngwa0dOeFlxY0ZEa2Z6OVRhSnkzaUdDL3hWTkRs?=
 =?utf-8?B?QlhZTFV3OU9sWUNYWlVNWHcxQzFXR3BkQzcyTWpJQk1LdE41UnpOSTlxbXRp?=
 =?utf-8?B?LzRJNHFSczNLVjZkNnE4ZzVEUE4wVkJTdGk3NjdJMHAwVTBKdkMzazVmUm85?=
 =?utf-8?B?bnYyRFJwN0RqVHpIQ1ZQZ0lxUUdJZW9TMDVoT3ZwdkZWVXE5ZWhHSUVWbHUx?=
 =?utf-8?B?V0h2UzB6RWoybnp2SHFtcHFVQmJuNkdVQlRSRElnSHliQ0tuRXdCcG9pTFpz?=
 =?utf-8?B?Mk5lOXY0K2hkR1B4N2JuRTR1ZUJ4RVowOFJZbFMyTnRxYm5zbXNPakZWcC8x?=
 =?utf-8?B?YnFGbFRiNW9GdWRoZHlDdm9VTEU2RHBhN2M2RmhhZmxFQkFFZzV5dFU1S2Ns?=
 =?utf-8?B?emNDS3JzcFBZUGxjQWRwZ1Y2azc3a1hJS2hxYWFKUmZnQ1lCZ3I0aXJlVWh3?=
 =?utf-8?B?RUZEUXluMVpsdWdqaXZMeFJFekY1VG16YjNWL0ZiZWlCTmNJME9KK1BsbW50?=
 =?utf-8?B?bVdyeTEyRWZVQVNYSnR2VzkxekpKYXNOSUVxRmRsL1JrWkQ3MHBtVnZQVWxT?=
 =?utf-8?B?N2s1aGEyM3dIZlVaRmdTZHV3ODc1cDhjWnNtdy9NWWkxeTRmTU40alhTUVR3?=
 =?utf-8?B?aVg5dXg0L2tTSXNZVC93OTJuREkyU0NqSWw4NUMxSTQrVkdyUWlwbXNsRWFI?=
 =?utf-8?B?R1FSOXlsWThXYzJYa08zN3RuRTVTNmRQb0YzcmtTblh4eFgzK0dCcGJ5eWxO?=
 =?utf-8?B?NVVnS2pPU3hLL0dUTXFTYnR3RWxtSDVBdFY1dXRnbWtFV2sxT1NSTlRrN1JE?=
 =?utf-8?B?RGdoaHA5Qk9ITkRWbVhMUWd4bHhmenRnSHhiSUhxWFZ6anBxTWo4S1VQSk1C?=
 =?utf-8?B?RG1aR0Y0T3Rxam1RRWJZMTJVZHhqSit0YTJUN2k4UCsralkyOVVFTTcrV1E3?=
 =?utf-8?B?WjZWQnBBamN4TDdEbVJ3TmppdTNXWXNmelZFSVlkWHVFSDhsT21zclRRM2w4?=
 =?utf-8?B?TjlhYXJBRmZWV09lcUNrNHFhN1djZm1ITEZHZHA3RDh3MVZ4SW9WbnZPZnM3?=
 =?utf-8?B?NGNGMnY5WWhuYkNRKzB4ZGt4Q3VjejF6a2xaQ0l5SUFWSlYweG1WcnJaZjBw?=
 =?utf-8?B?dk14Q0RGakNQRnVIcVRrVGZCVHlDWnJ4cW1FSWRXcnpTTzFqL3huWm16SVhS?=
 =?utf-8?B?b0EvOGVVVkZ6VnpURjJiNXQ2TFJFblU3TzMxV1BCUjNZNnZuRzZKWktlN2Rp?=
 =?utf-8?B?aFdvcFVKY0h3K3VjZ0szRUVlWFVFKy9NVDkwS2xsbE11N1JEU3BXdUNEalZl?=
 =?utf-8?B?a0JhU0hGbUdVdHg2OHVISEx0UU5Fa3pKcTFQMGFOR2xwejFuOFN1Um9QZXQy?=
 =?utf-8?B?QjZnVU9IclMvODVhQXdaY1ZRYjB2UmlrMVVONC8yOUxxYXB5eDFDZUg2VVo2?=
 =?utf-8?B?SjlCNWVWUlB4YkF2VWhDSkhtaHBzRFZEMW83TUkzbTF2ZFBRL2RZekxVSmQ5?=
 =?utf-8?B?bU9YWVpuMnpvVXhpb3NwbDRvSmpJemZMUElKMEptSlE4NUhPNzhaYXVReW5r?=
 =?utf-8?B?amIzMllQMExYMWw5TUtSNzR1YXdGSzBNb0hxOW1aUnhVR0NWWUM3NFVjZGFL?=
 =?utf-8?B?ZkxadUh5TU1NWGJiOUVtK3M5dXRtWURLcmNrUmtpbm5Kc0xOb2EvTnR2WVdw?=
 =?utf-8?B?WVZuSGVvd3MzSFV5TjZ5MHhiNVBKaVFSUWZ0M3dma3FoSDJnV3c5QmdqRDZq?=
 =?utf-8?Q?haTLRu0/TbuoA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y0lacHVwUjBnWUYraXJsM2NHbk9FT2xlcEpjYTBJVjI1cGw2Y3l2ZGNySzYy?=
 =?utf-8?B?WGw1aGFvZGJkaWN3Y2dXYWZmbVdhdG1lVWowV0R0RENTUEhhMk00TmJ0OGdL?=
 =?utf-8?B?Zi91VGx0OFd5QXZKSyt0VjRSOHZNNHdicGh1czF2bm1IR2t2N3JDYkUybEdS?=
 =?utf-8?B?RjJGSlQvc3pYOEtyakQxb1A0SmcwU0xLcjQ3dGhxM0RZeHpMcXVab2Ryekl3?=
 =?utf-8?B?QVFHR2R6UGlEZ2xzSlFvZTBTREx0YzRRTmpNZmVsUkJDa3c4NWRZdjh3dmhM?=
 =?utf-8?B?SjBnLzU5ZnZsc0gycnJ1QVJGZzNDYmVOc01QYWJIQ0M1bHBNcmZoeTgrZEVC?=
 =?utf-8?B?UHBDcko3Zzg1Rjg1YTNnaStoVnNBSURhbDZVVXhtQlBnUzNMa2lteHVYOWJr?=
 =?utf-8?B?dGJ2YTk3WEhud2dTMHBUZ3VUN2xIYnhFZFd1ZDAzd3d4QWt3SXVPSW9mM2pq?=
 =?utf-8?B?L2tsaGF3TFMzWXpCODVxTHNvRFZKeEx0OU9VeC83RGg3NUs5clV6b0VodVN3?=
 =?utf-8?B?TnVuc0E5YlJ1R3hFT1BicGNOcW5RaUpZVy9iM0RIM3pUMktKY2g3ejBYMWlF?=
 =?utf-8?B?a2hheDROeVhPU3RGc0Nkem91d2FGUTVnSEpTMXVXL0YvWEJXU0d0ZjFXZjY1?=
 =?utf-8?B?NzFuWWxxbnpPVGZQL3VYeGNQLzJ2SUJlSzJuTTNuNS9iWDdRZUdtT1BEUEc1?=
 =?utf-8?B?bkFGV2RYRVc4dDNZSDAza0hXTGROZlI4NGJPWCsxQ3NscXJna3l5R3F0SHkv?=
 =?utf-8?B?d3RETHZjQ1YwdnZEUDhSV0lDVGVaaXAxNVN1MTN3SnB6VnBqR1grQ2QrMlNU?=
 =?utf-8?B?NGd3bjJlbXdzUGkyZjRtMHlJdlp4U2JJMW45TXdjb1NYT0xGbGFnTFhQZ0Jq?=
 =?utf-8?B?YVZOTmtjcDUwanNON0VkejZ1Q0pWZ1B4RWVQNFZja09vT3hJOEZ2VFZYdmtC?=
 =?utf-8?B?NERUcTQyNVZGL2ptNjIwVDBoVHRQLzFUcUhRZmQ0ZCthaU9PUW1ETGtPTGl5?=
 =?utf-8?B?ZFJvblZrbWczUm5kNFgwNzFocm9aZzNJZFB2OW1mNStHb0JRMGxPNkY1SkpJ?=
 =?utf-8?B?aGgzUFZiYTVFdFFHVWxnSkczWGUzbDdIL0Q1R1VsYittRlJDZnBzWmdWYXVl?=
 =?utf-8?B?anNHVFZlZmh5NWZYUFd3TCtiWW5XckJ4d0pZT2RvdER5M2t5SGxlcHJYT3lT?=
 =?utf-8?B?WDlaN05qalRlN1U1UjY2ZmNBQm1zVzgrSUJQMWJ2WkJlQzI0SzI5VG9jd0ZE?=
 =?utf-8?B?OVdRUGZnaDN1amF1cDFlUjRteTVFRUJjSUlpWFlFdE4xbkNNd0J5TVdBWG1L?=
 =?utf-8?B?akx3N2grQ1I1NUc4QjJJVXdZWVd0cUZXNW9uQUZUMHRyRm93T0hFZnJxbDdN?=
 =?utf-8?B?NUQ2K1dBTDhMWGw5QjlGdHFSOVZZWW5Fem94eWVjUXl6d0o0N3dIV0FqT3Nw?=
 =?utf-8?B?OG5GYmFOQWZodHlFOUVwdGl2MHFOcWpXKzU3d3Zmc2YzVzNKVUx5U25weEh2?=
 =?utf-8?B?TmFMTW5yWDRsRlJoVk1tbjlHbytWdkNtUUVmV0RVeGpHM0g4VUd6RFBMVHQ1?=
 =?utf-8?B?Z2RzYm5DYTlMVE53bUNFN2FWcGlkT2g0UzdPZDRpcjdudlFmaFJTNVlTNTJV?=
 =?utf-8?B?bUpmQ0dZeU5xN2w4SFhuL3VqbkEzWlI1TFN3eUtmYndGUExtQWhIdlVEdG9o?=
 =?utf-8?B?L1BydFlYSGJhZndBRVR3cDA4blgzZjByaS9aNGF0bjFMcWh6aEl6V1g3Ry8y?=
 =?utf-8?B?QkJCVG1HNlVlSk1wdGVHSlNKbFFVZ20zNWpKV0ZzSUJjYzVnME1mVFhhSFds?=
 =?utf-8?B?b1dRQVFmemtXTjU2NlJPZFdLdUdUeUVuWHc0dGc3UnRINzRhOTM1eHllK0E3?=
 =?utf-8?B?YUFLT0xmQkx3dGNiOHRGTVRqZnV5U1FWN09jc3pzT1ZzVjRja0ZkZ1c0S0pi?=
 =?utf-8?B?ZmtPbDNUandqL3AvT3lOcEVEUGordnlFeW1jU3JMQzdXdTJvWWJuUm5QcDM4?=
 =?utf-8?B?QTR0NXNGZXlscmdCVjA3UFFlcGgxZEgxVWxXVy9ocmFpTVJyUGVZNzg5bzhk?=
 =?utf-8?B?RXNrWUhSYmliM0dyOFBoRU5HaWMxUS9LZFhUUXAyVDAvbVMrNHdSU1BGTmIv?=
 =?utf-8?B?UjNWRmV4SVNWT3hWaGtvVCtDaHdabXlWblN1SmpqeFU0ZlM0VFE3ZkVqTnhJ?=
 =?utf-8?B?MEE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c9c084e-2649-440d-7b88-08dd575a77f5
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 18:13:43.1117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5PRKbaaHB2+rf7OVyxsN1oiiAwH9I+GP0FHsT4hLeJY75wpBG7Q8+9uAcVly1bTbR5p3MuoDhLRHN4JkommFwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8438


On 27/02/2025 10:35, Thierry Reding wrote:
> On Thu, Jan 23, 2025 at 06:16:32PM +0530, Kartik Rajput wrote:
>> Tegra264 has updated HSP_INT_DIMENSIONING register as follows:
>> 	* nSI is now BIT17:BIT21.
>> 	* nDB is now BIT12:BIT16.
>>
>> Currently, we are using a static macro HSP_nINT_MASK to get the values
>> from HSP_INT_DIMENSIONING register. This results in wrong values for nSI
>> for HSP instances that supports 16 shared interrupts.
>>
>> Define dimensioning masks in soc data and use them to parse nSI, nDB,
>> nAS, nSS & nSM values.
>>
>> Fixes: 602dbbacc3ef ("mailbox: tegra: add support for Tegra264")
>> Cc: stable@vger.kernel.org
>>
>> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> 
> Maybe remove the blank line between the Cc: and S-o-b: tags. Also, "soc"
> -> "SoC" in the subject and commit message. With that:
> 
> Acked-by: Thierry Reding <treding@nvidia.com>


FWIW ...

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

-- 
nvpublic

