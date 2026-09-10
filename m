Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010026.outbound.protection.outlook.com [40.93.198.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349D63B52EF;
	Thu, 10 Sep 2026 04:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789015110; cv=fail; b=AZlHWV+RRecPcBNIgKHbe2Hu/3HV0fk94m/Nzgj+kUQ3eoal+6hoCBnVlzxByLYIy5DeysOLcO5B76z9sv9xYQQsCSkXe9nkgQ5A8yWCZsPBnIpXoyaRgSTb5R+c4sqXw6TTXmr7JXAsCcD2gk4sw0bJEG85Is6zPacCV8Baz8A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789015110; c=relaxed/simple;
	bh=6pEKbmh8GQ8jKPq73kYyl0IwcqE9jMqG3BZQxmKnkXg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OAPxbhPHUZc8Oorv8Z+bDFiF1jO4oQASUAH6iWajQAo1SI/fn2P0c8Hm52xcK30KY+jc35YNKGBa9vSE1UFc2uiF7EqZJsJBaRSXnZzICgQlHkHDKOKPVBYqViftmEvKBhUwMuMOkD3mOkkf/rHwsP3Eg2Hq9ygvm6SUS8XDXt0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=L2ByhT/a; arc=fail smtp.client-ip=40.93.198.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="L2ByhT/a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FggLrpQvPJJPJuGP0bbRjNRpx4L8Y4BV+j31C51p7fzV8kJW/CoTQwb4sAquFm4XZi11lFwHKW9UpWIJOHRGd4v+8zJ5dGi27kGXhuYvbHMNgmq2VeuNJCptMbjmoEU3Z9EWz42VOvR+PNGlXuf6SyTeg/ByNZkKAxbWSX4p9802e1qsPxBSE4EUdSusF1q3ujGji/UeaTTDA7SmvaQFfQGh+kbz4eHcNGJPG6DLBtm7ZSoDyir48DRKvX4emaxZn6S4fCeYRjf/rHqkEwiGWeahp70jwp2FqQYafODi/L/Vq7Tsi1t5h9iQP0wE1FwO3gloWhPIDi7MEZ382Ik6rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4avYTOybJcphXh+dSShvT7IkPONnC3MAzVpxKuyAUIA=;
 b=phAgrFM2UaRjWiN+g2ELLFmxoRCzjamZ+iQxgqOVCHl6sg8KDDqja9Fwh+pMy3jG+/uPOpEd7I1PXY8EvSoGbXIuJGu+26keFmgUjhcWWJULIHbdvBjf+e9kPkOntGi9p4HOc8MoE4pQ+3OLSAHkIR74OGQVsasI0tARDU26hGHK6Czx3GHjRaEbO/WZN8mZw/xoQCmprLezOCEhUr6mNXzxV9K6+1Nyg3FUS5zbHpJmmoSb/8odqz/CmloKr1n+uWySVGpQ6dCrrYBxKJ0gSl7AvD+S/2lWbGD6T3ueJTMayfDGWKWolh0JyPMBnpbQJNuHFkNAnAI8OihLu1p4BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4avYTOybJcphXh+dSShvT7IkPONnC3MAzVpxKuyAUIA=;
 b=L2ByhT/a8E1GNplgDWy1+HFG8QumkZj9XBULy9Gj2Up0k/dKr/vzU2BongAGq3u6BIie1VfSfgQwsdmhXAVFJ07JSo1QqoAZ726nNqo3FcFjKXWVUg89mKfFwBHRxtYRMImH9htEmeS0FZm5Hu22weVUqTC72ydvjeGc4DnENZi6CfZJv4N0jFoiSPaJWGRgnPbjGX1SI05A+F1rIJ5zVoFbW2XfOmR2AQ9cS+oMDERikfnhQop7HYeS1RofPXMOi5hV1upusANcN6VqAMrqQmn+bn76j0qUVRNQcuFyFEznBK5O3+HAOyZGvQ8UY1AjCiOZDuCFzpkP8uobX1QRTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ1PR12MB6051.namprd12.prod.outlook.com (2603:10b6:a03:48a::18)
 by SA1PR12MB8968.namprd12.prod.outlook.com (2603:10b6:806:388::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Thu, 10 Sep
 2026 04:38:08 +0000
Received: from SJ1PR12MB6051.namprd12.prod.outlook.com
 ([fe80::96e1:b300:7b78:d3a9]) by SJ1PR12MB6051.namprd12.prod.outlook.com
 ([fe80::96e1:b300:7b78:d3a9%6]) with mapi id 15.21.0382.014; Thu, 10 Sep 2026
 04:38:08 +0000
Message-ID: <b78b8e6a-2fab-489f-aa1b-a2ab23051794@nvidia.com>
Date: Thu, 10 Sep 2026 05:38:01 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/25] mtd: spi-nor: Refactor Read Status/Write Status
 support
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Takahiro Kuwano <takahiro.kuwano@infineon.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: Steam Lin <STLin2@winbond.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20260904-winbond-v7-1-spi-nor-rv-addition-v5-0-2909a45fe4fa@bootlin.com>
 <20260904-winbond-v7-1-spi-nor-rv-addition-v5-3-2909a45fe4fa@bootlin.com>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20260904-winbond-v7-1-spi-nor-rv-addition-v5-3-2909a45fe4fa@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P195CA0023.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d6::14) To SJ1PR12MB6051.namprd12.prod.outlook.com
 (2603:10b6:a03:48a::18)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR12MB6051:EE_|SA1PR12MB8968:EE_
X-MS-Office365-Filtering-Correlation-Id: 99bcb86d-52a7-475d-ae6a-08df0ef55002
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|10070799003|23010399003|366016|921020|6133799003|3023799007|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	S1HI7Nkdoko/UKaBcqLQVCZqXTLngbxUBRih2HsLKd6cFAw7szBVQnOlzTn7vdY04hL+EC9O4e2pFLF0mQQqZjDdzRJ7m5K4fAutQG2rfkIf92K/ELAi5el3BUNNGREcfG7xsALI8044IqvEofcruy/4i7hWwf2jx/RVfRvI6A3OrfXVXLhRB91tUWp2bQijzYyXLUxRitepMjH3ERI3iQQK0quFhsoWODBsTyrORiU1tzMFI9GxRKGA4GeTT55eL49oGTt87BKhHL3LRtCuVHJEaRp3nTWqBQBptDn2ttdiExxY6bw8/8dMlI6wSXdutJBUM2GQcxsKejTwqA4Rb55maFdnZXRbxJKSjEReqhWm+saFZ3bLkghLdBEADDK8uOs0edKrNFxSqbkWiBSwdtObKkA53ayEbr0fKMK+F7aB1hgP5TH27KVYnyvh7i/GpkfuPtQO2McVjbeVhdIXbx4LHSHgIuN1PA9L+wz9/Hl5G54ogv67j7pWfRbQM3vnp87+m1CUxXaGNDFNKaUKivuAWBFlCUA2CM6P3H6CQmixFb6GFClS0k8Kqz0uRraHwXmlwN8Mc4+2d2nQOj+kWBeQJxH/UcDVJIpnLCzav9aD/thYLLRpPAwyozxKWNPr6UW6Yk04aaXiP81S7p3tQ2ha4iPctlutaOkC3HHNYaxqyaUVfSqVPA/JDlVvWxHHELnH7RI7VK42wpkl3qJn0A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR12MB6051.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(10070799003)(23010399003)(366016)(921020)(6133799003)(3023799007)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFdHYUhvSzQ1ajE2Q1haVjVIRXJ3UUx6bTZ5TEEvY2N1VEhsbWRFNjF1cEs1?=
 =?utf-8?B?RnFtZzQzenVPTGluUE96aGtlQ1pVS1VoM0VTWUQrd2I2YmZNeVBMNGx3UjFm?=
 =?utf-8?B?eHNJdnhMSFZyT1BRZzN2OG1qRitNNjlMVC9tb0hYNTlDNkF3bjVFaHNoOU5O?=
 =?utf-8?B?Z0FyT0dBM2lLeU5kbHEvbmVwMVNnVGFVSzJHdDZjNXJvc3NVcDcrWStxOHFo?=
 =?utf-8?B?UDI4a2pybEhlbGNEbk1sMUE0bkVFbkM2Qm5FNUhaUXB1cnIwaVc2ZTlNVUt0?=
 =?utf-8?B?SEcyWEpzNVpuU3RZK0Z6MXlOMnJMRHBGc25JRTM1NFVoSXpneFZvTjc0dWRP?=
 =?utf-8?B?eXRlb0VrRU9ZQXpiM2VMcG9pRFVwVTRDSGRISWFFV0tXZmh5SUFSVUVTYlN0?=
 =?utf-8?B?MFdqOWQ3Qk5laURZQU5DOXpRN0FvcGtwOGNqNTI5d0dzcmh1Z0xEbEV1Tmxp?=
 =?utf-8?B?T1pDSTFJNXVickE2YVczRDJEZEVtd3hIYlJUTE5oQmZUMnA3akNzNkZYSk9X?=
 =?utf-8?B?UTQ2elJhUXpxZFFCQ2Y1Z0xVNyt5OTh5UE5VMFBZdktQZlJDZ3FXOGI3dDlU?=
 =?utf-8?B?dDFUcTZDcEt4b09mUjR3cm9NVlpSajNGRzFLTzhTNTVrTGpENTJEUmVhZHpC?=
 =?utf-8?B?U1ZxSFJkZmdqRVV2Z3BJK0ZnemVlbXg1K0t1R042U3NwVXBoZ1NBbTZaWWNl?=
 =?utf-8?B?Y1pzaDQrcW11Vk1LdU45bTRMa2hvQkJYekR6UU9CZ3hPSFV3VGtQTkJjeWlK?=
 =?utf-8?B?Z010NEh3SzNSVUNRQWNlaXRUYUVvY2RKUCtDSzI0UjdkZnJVeEN5WUxzNmk2?=
 =?utf-8?B?Nm0weWtYTWZzRW1ZS0lZTUdZeXkrS1VxcWZNZEVvcFFhbkFTTkNwK3JFRXQ0?=
 =?utf-8?B?RkwveHliWnprS0pQWnJFa1V2R21nOVFqb1oxNmg0S1NZMXB2WVR6Sm5OY0dV?=
 =?utf-8?B?Y3M2U1NJQUJ5OTg3b1NsRDZ3K1N5bUhPWjYrZHhYNklESlBMZjk5a0swM21L?=
 =?utf-8?B?Zk1CcURZV3ZJTng2UWxaU25jdnU2amZSalRtVVk2cWM2eTFzMGhpUXdRdFhH?=
 =?utf-8?B?U3RLY3FYRHJVSVRpRkhTTTVWM1loMFg0c1U2MnlNQ2t4a28wWWJ6RFlTQlcr?=
 =?utf-8?B?M29Mb21rc3o4MHFHNzE5TzZJN3FaQVY3Q3BnN1ZZcVdwd1dWWHlVTEk0c2Vp?=
 =?utf-8?B?aUZyWnNoeTFFakNsbVdzSlFpMWlJcGptbkVZaDd4Tk5PdnJmdURjSDJ6QmZT?=
 =?utf-8?B?amxWV3I5U1phMTFpK2VVc1JURWRBc1g3OSttT2dBMFh2SzFkV2tySEM1bG1t?=
 =?utf-8?B?dnlkR1UydWlzejlUc3Yyc1lqZkRaS1daeUlCcEc0SUtGT29LYXduOTY3WVhW?=
 =?utf-8?B?YUFzRkhLM0dhb3h5RFBjTTlXeUdjSklmZFZrU0VqTncrN0JaOWc3RDEvWlhJ?=
 =?utf-8?B?QWJkUnNuT1pLTVJUVlpvUUZsWFNUMldHWkdYWDc5QkR2SDhicmU3VFo1VWpH?=
 =?utf-8?B?S1B1OGtmYTVKMDNmVlFKYUVYSmZHQTVYTXVnWlYrSXMzSWdVb3VEWnNsd2FZ?=
 =?utf-8?B?YmtOU0ZrTGFHbDFSVDdKSFlTblNZdUtzTk9Xc3lKSDJiTE5JUG5ObkZLSE41?=
 =?utf-8?B?RGdESmxXbHFpUkN2TUpmVTllQXR5d3VPQWovNnltOWlLYkNOTUtXclZib3Mx?=
 =?utf-8?B?OThDSDZPeUg0aitPa0xOUUFWdjd1Tnp0NFduN2ZCeXl3bFJyWlM5UGEzZ1J5?=
 =?utf-8?B?TjVyeFd0a1ZUSlFObWNiL2o1eWg4MnFlVk85RzlEZkpnSjlnbVo0dXFnWmtk?=
 =?utf-8?B?Yi9DQ1NBSzk2L0xVUlhJWW5lV1pQVitYRnQ4bUhncDB6a25mdENucGRKOE5I?=
 =?utf-8?B?VHF3V3lZdGpGQW5ZcW43QXVielhjcjNyd3JpSHB5NG1wRzE0WXh5dEJHekZM?=
 =?utf-8?B?OEdUdnBjSExxREc4TXR1akxSUlJzV1k2a3JXTWRGOHNzckJxVFdPZkVpOVIy?=
 =?utf-8?B?OU1EdmdzcDlLbnl5aGw2a3JUMlgwaEZwaU9rL210dW0yQUlGQW9JWnBRZFJq?=
 =?utf-8?B?OW44L2hQZjRDSUx5WUlPWDhyajBGdEhycTlBWE90QTc0T0pBNnpJS2Zwb0lZ?=
 =?utf-8?B?Zm1HTnhzemEwVTlsRXlZczFTUGExdFE3T3h0K3k2d24zZlIvc0IxaFRZRGVz?=
 =?utf-8?B?QVJibXBHNnUrcU1IRGs1Vk9seVM3L2lKWCthUTlHVHdlWkQydkp3VENpY3Fo?=
 =?utf-8?B?S240QnZSUTROVzJmRzVwYkt2MnU1Z3lSMjQvWDNJRjJhcmJYOFBiMjNLY1Zw?=
 =?utf-8?B?NWQ3bG9TNWtwSEpGb1cvZE5ZQU4vYUZmQmNjTHd3RjdJeUdHZHBqRlhDcFlC?=
 =?utf-8?Q?gXTBqS0qI8RKyl+VxRd5JEaVCSZQojxTGa2L0mGYXXqmj?=
X-MS-Exchange-AntiSpam-MessageData-1: 0UPG8OkRCKJDTw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99bcb86d-52a7-475d-ae6a-08df0ef55002
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR12MB6051.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 04:38:08.6133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +v4UATILjxhlu4VhQg6rUF8vfdwu4+0Skyk3rewkboq6oV3ZkzMa575omK20SPuY7psUs07k6BrdqDOkF2yzyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8968

Hi Miguel,

On 04/09/2026 19:12, Miquel Raynal wrote:

...

> This is a really hard to review patch, it is big, full of changes
> everywhere, but I cannot really split it further. The commit log is
> really important, it tries to explain the steps I went through when
> trying to refactor the whole QE/SR handling for which I received
> feedback from Michael, Tudor and Sashiko.
> 
> Ideally we could expect test coverage of each case:
> - BFPT_DWORD15_QER_NONE: Probably not needed
> - BFPT_DWORD15_QER_SR2_BIT1_BUGGY: Expected from Hsin-Yi (flag is being
>    renamed _NO_1B_WR)
> - BFPT_DWORD15_QER_SR2_BIT1_NO_RD: Tested with a chip re-enabling RDCR
>    in a fixup
> - BFPT_DWORD15_QER_SR1_BIT6: TBD
> - BFPT_DWORD15_QER_SR2_BIT7: TBD
> - BFPT_DWORD15_QER_SR2_BIT1: TBD
> - BFPT_DWORD15_QER_SR2_BIT1_1B: Done.
> There will probably be breakages on older chips. These cannot be
> guessed because they are not properly listed in manufacturer
> fixups (yet). If we want a cleanup/simplification, we will have to cope
> with this risk.
> 
> I hope the diff stats will motivate people to have a look and report
> their testing.
> 
> I will also eagerly monitor Sashiko's output which will probably be
> very useful to catch niche weird cases where these changes might break.


Since this landed in -next I am seeing a flash/boot issue on one of our
Jetson boards. This board, Tegra234 Jetson Orin Nano
(tegra234-p3768-0000+p3767-0005.dts), uses a QSPI flash device and the
kernel is used to flash this device. Following this commit, on boot I
now see ...

spi-nor spi0.0: probe with driver spi-nor failed with error -22

Some quick AI analysis states ...

"The commit contains a probe-blocking regression in its new generic
  quad-enable path.

   ### Finding: -EINVAL from an unavailable SR2 read

   For BFPT_DWORD15_QER_SR1_BIT6 flashes, commit 63489002d397
   configures:

   params->opcodes.read_sr2 = 0;
   params->opcodes.write_sr1_and_sr2 = 0;
   params->qe_mask[0] = BIT(6);

   That correctly describes Macronix-style parts whose QE bit lives
   in SR1. However, spi_nor_generic_quad_enable() then unconditionally
   calls:

   spi_nor_read_sr1_and_sr2(nor, sr);

   That helper always calls spi_nor_read_sr2(), which does:

   if (!params->opcodes.read_sr2)
           return -EINVAL;

   The resulting probe path is:

   spi_nor_scan()
     → spi_nor_setup() selects quad I/O
     → spi_nor_init()
     → spi_nor_quad_enable()
     → spi_nor_generic_quad_enable()
     → spi_nor_read_sr1_and_sr2()
     → spi_nor_read_sr2()
     → -EINVAL

   This exactly explains:

   spi-nor spi0.0: probe with driver spi-nor failed with error -22"


I added a dump_stack() in spi_nor_read_sr2() and this does appear to
correlate with the above.

Let me know if you any any further inputs.

Thanks
Jon

-- 
nvpublic

