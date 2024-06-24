Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2088.outbound.protection.outlook.com [40.107.223.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CFF13DDC4;
	Mon, 24 Jun 2024 13:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719236556; cv=fail; b=k0kS9EtbyrW6jO5RpFiDqsW02oAhc8a08ymdZn9M5wZ1mYCifKhh7wHpbCD7vE3ey1nKLRcEjenS+UKuFNwtzkVbR4QivilFgHaUPqba5sOMd49CYWqOx5UXkeh24oKshD7hqnc8SifJ8J7yWtzjQYnRg2s/wiuoLlQnwTrDYIc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719236556; c=relaxed/simple;
	bh=epMlrGO5pMj55p42pnG5LtPtxk8auujfkjdECI2Ddg4=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AOUCrT3gwpwnhpRNRecp1qoxlTSl4XvG1mbjmSBd98UKq6cZ8JjJyVHVzLA/yrqaKYurs1FVGYUIM3fqDreOGFMCCemL5hwUl8AZsJY4GKEPs5N7wPXpOdVxF61oFS2aVyW5uRU7oQ+CpFMj7s0Ic8WgVYS+8ZT4HrL0tL6OdFY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=lVOETZ+w; arc=fail smtp.client-ip=40.107.223.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lVOETZ+w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M//hztKhlXnGj3rjn55nPULo/HnzaIaUrRxWs1GKahmrJhtvhh+YpHuvYk3qAoEZArO8PHklkUlisfBWIs58HC2dtP0iRvy3p/1ZfiH2I+YMw4QGoBhq/E1bOd1i/VfjKxM05mLQUazKAXPiedVr4Ks1ZWjURkfT9AvLaXSQQqs1x9UxByCkjUw9kIyStoER6zO7vYb5vNC/TneNB0WJ8FwniNZvVVJ0WD43vz9HdmfNnYzj8hQzN1kPodEpLcR2nf+nxDuQ43VdzuCtvcmvbB5qg1P9okF8HdtIgbj3ftwtBhrPPQjGOUnIiG6eKWkEwYF3br7BigiTjCkbf5Cr+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IeHnhUJwwmq5oPUJLdjdr7Ed21SYcKHoxPxSOg+T1I8=;
 b=LDp+nUwtUppRj8txnoFWxtliG7LP+zFlTcMynkTXRqgGNOQcRaT32N/pjn5lwhZCdkwz1HuHdO7yu2jij4EZYc8NihSaWF7Mafo1Ld6I9lDUbjGLR/ww1FAKB4Ap+S4bqd/p0ZFGqYe3JCTgej7r9rq4ZsVH646Si2O9/aoljPQ7arD8qJoD8ofd34BZu09JiLpwXGKHffJGiIB4CgwFWlRq4eQMZJYwipZtcVYO/xtqS/SerzuJTRY4njvkQpOeguHgxCmndX+zpJ/hcyKYvWGC9B3I47eKe4tQO+PXQh8k6s4KcFQBlA2fi9ohwSLF6zSQ0f//MpVMBYBzBpfA+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IeHnhUJwwmq5oPUJLdjdr7Ed21SYcKHoxPxSOg+T1I8=;
 b=lVOETZ+wIJ5QKUSerTVxQaaQ30IcfkD2yuaFFLy8xWQWXfUVsXVm0N6SuALBsuj0ql0um2exQ1sxyAdOsgJmC8svWITnbwDaTli0MI6CDvnsib7LsgSb2/Q6GbKcN7SpllIKS4abGLX9aGpjI6m0lnjeygS9rA/b7Kwkp4KW3WtW1CPP+jNxcdeB5dy9YsGCXKd3SpDKL6k7AmLKe2usLWHhUo47gdCku79jkGc1ZpiBuQrV/xyV/cPl532aLYF5t/NvEaNCIbuOthsIoKEcB86OiwVQ9GdEo9jdA/yfn7Kyxw1gdWmUOQHta+VKd0rx7AAqCaoC8k7w+QIV3Qdq4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 MW4PR12MB7141.namprd12.prod.outlook.com (2603:10b6:303:213::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.29; Mon, 24 Jun
 2024 13:42:28 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ae68:3461:c09b:e6e3]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ae68:3461:c09b:e6e3%6]) with mapi id 15.20.7698.025; Mon, 24 Jun 2024
 13:42:28 +0000
Message-ID: <7b46779f-3f44-45f4-8884-2f9f625485ae@nvidia.com>
Date: Mon, 24 Jun 2024 14:42:22 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] usb: typec: ucsi: Always set number of alternate
 modes
From: Jon Hunter <jonathanh@nvidia.com>
To: Jameson Thies <jthies@google.com>, heikki.krogerus@linux.intel.com,
 linux-usb@vger.kernel.org
Cc: pmalani@chromium.org, bleung@google.com, abhishekpandit@chromium.org,
 andersson@kernel.org, dmitry.baryshkov@linaro.org,
 fabrice.gasnier@foss.st.com, gregkh@linuxfoundation.org,
 hdegoede@redhat.com, neil.armstrong@linaro.org, rajaram.regupathy@intel.com,
 saranya.gopal@intel.com, linux-kernel@vger.kernel.org,
 Benson Leung <bleung@chromium.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20240510201244.2968152-1-jthies@google.com>
 <20240510201244.2968152-5-jthies@google.com>
 <21d4a05a-3f64-447a-b8e3-772b60ef8423@nvidia.com>
Content-Language: en-US
In-Reply-To: <21d4a05a-3f64-447a-b8e3-772b60ef8423@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0041.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::12) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|MW4PR12MB7141:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c63a972-cacc-4613-cba9-08dc94537d60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|7416011|1800799021;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a1IyTlAyZVJkWVZPV0M4TDNpb1N1clR6OWdUQm5TZWhXdUs5TWl4TWZ4aHN3?=
 =?utf-8?B?MTE2cmUzR2VCaS9ENkNoOUtDZWMydmtPcmVPZXNDcStmcXU4UVR5UTJZMFpP?=
 =?utf-8?B?YkhrNThVMXFaemFIMkIvUU9sd1IydlNuQ1RpakJyemxMMXBZd0FGSkx1WE52?=
 =?utf-8?B?dk1MWUxCaUl2SzU3Z1NIeVZnZk9seXQxUEtaYndSVFdvQVBISEZaWi8xbFV0?=
 =?utf-8?B?aFpJVVJyTDNVdkZBVFVUWDZvRU1zSUphNTh1WHlrODZTQ2RRd3V6QmsyTHpq?=
 =?utf-8?B?b29DK21pOXpuRkQyazhheEFNNVYxcm56ZDJreWVxdHZTK1pkQ3ExMmdkQVlH?=
 =?utf-8?B?dmJXQ2M5TDg0cHBIY0dWOHpEcUNDcTlzVjNjNDJDWHlDZnNFVXpqdnlXb3ph?=
 =?utf-8?B?LzVydUIydlpmTUNvZ3FoQUNqVjBIMVR2TGJwWDBHZXp0eEdaVkNkNXhSTFQ3?=
 =?utf-8?B?UnZHZGw1V0ZsY1JGeHZWMHNOMCtRckY4R0xWV3Rxc2V0RzJhTHh0MHJ5dEt0?=
 =?utf-8?B?bVdkN2NYalN4SHVidG9BcWhCd2RhV2YvMHowSzBsYkZoRFBINjJUVVZzaGN2?=
 =?utf-8?B?N1BubStyUm8rTWJoclppZFNOd3pNdXRobzgrR2JFVmdMQ1p1V2w3ZjVVY0R2?=
 =?utf-8?B?U3VYUzJ5S2cwT0pyanBxUlYvQUtrd1AwbWF1bUg5MEtLTzJjaFdlT0g5Lzlv?=
 =?utf-8?B?dGt0Z3JtUE85OHFhQjFMSzRJNUxiY0MvckROblhDTXZCM0RjR25EaGgxV0Q1?=
 =?utf-8?B?cFZkMDJrWWZPcm0vbVF4Z3BNblZVTWpYWjBDQjJvYy9YVzVHYTFVeEVmN2tp?=
 =?utf-8?B?aVBIbjFHcklOVmFtTkdqNmNtcXZ0V0kxMEZVRWl0SjArWEhLTjF1ZVB5eHRN?=
 =?utf-8?B?R2hWeUlJRmlYRnBxemI4Y0tvWEV6WDZOMEw5Y2c4SzhDRjdtQVg1RFhMdzdU?=
 =?utf-8?B?Q2pSblc3T3VOeTA3YjBRaEpUdzQ3eVl3NkdsVVVFZ0lQd0h4VElvSzU3MVR2?=
 =?utf-8?B?cFFtL1JGQnZzeGQ2UHc5Tk42a09oa0RISkFQN1EwY3JKVGdBek5hTmtuemxV?=
 =?utf-8?B?OE8yK1NCVzhpZHBJaVF2UEFrelBick5IU3NVR0RQeG9KcElleU9sTXI5Rzkw?=
 =?utf-8?B?Z1czZ3JVUk0zeWxhcWFFS1RLeDFzUnFKejlhOGNuTlkwWG5FbnI5QVdQQjlw?=
 =?utf-8?B?RUg3TnVLdDVKaEx2Y0tYS1JGLzdMc3NxOUFvVEs4REZweTVSZ0cvd1JyU3Fq?=
 =?utf-8?B?WDBsU0h6V2FybG0xQmFsdExybUMwRWhJQnBqa20zMDE4Yy9HQ2p2eENPOW1C?=
 =?utf-8?B?QjJhaG1WR1F2bStpd09oR1JCRmw4M1lvVmZTTlUwYXptSEtrVmpIaFF4bGVF?=
 =?utf-8?B?bktlTjd5RVJtQXVZZU04b0l6Ylc3Q24vTXFwMm1SeGtER21PL0pESkNTN2Jw?=
 =?utf-8?B?QkREdU1LNXVmZWRVVWxUdXlpeHNMSlFhcE00Y05JbC83OVNFbUVtcmVsR0hJ?=
 =?utf-8?B?QVdTS0ZsVWxzV093L2x3empVSGttRzVhMk54dmNvSWlpQ3JoejhlTmpCZHFN?=
 =?utf-8?B?RXZqQ3VLSFZNSS9HY3BoMm9MTEd3UTJ3NFZsTFFyYWphWXl2MFgyTDRZeE1a?=
 =?utf-8?B?ekNFRlAzMW9GU0VTNGlnSDJXeFlteERaaFMzQ2tlanUrU0pjQzNQMzFVQXhR?=
 =?utf-8?B?dStIeUk0MU1NbmN4cG5jdnFZa2dXYkIydVdRdVh2TlViMmp1ZnJYczA2TDho?=
 =?utf-8?Q?E11Y1wggK2HAS60nHUO2UCKWn6cBlrMN2FipPWy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(376011)(7416011)(1800799021);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SjVmRHE1ZW50aGpaNnBkNTlSc2F6a1ZJaS9nVDFyVFZtUytBVHpRVkd2dmtx?=
 =?utf-8?B?dHY4L1RtcEtuZUo4U0I1R2l6M3lxcXZONWxPbDcyaE1pVWVHZTFkd3FpeFVw?=
 =?utf-8?B?OS8zems4RjQyQ2ptdnFmNE1YT0lTQWt6NHAvZnFESkpjaGw0eUloMHBCL3pH?=
 =?utf-8?B?TUlZU2dnK1huQ1cxUW55SjBpTUdxYXoraEp0TjZWaHdac0I0SHpDeHdBaXBp?=
 =?utf-8?B?NUF6UFI0VFVsdmVWZnAyMVFJQTR6NW56VVptTkkwQWxkODZEQmJJVU5qZmVn?=
 =?utf-8?B?QysvQ1Uzd1c4cGZjSnlKNUhVNC9Rc3lWMjEyVmNROWwyUitUMzZ4TXhZMlVt?=
 =?utf-8?B?T0NaVWwzeW5LenlCRk5mU1kzaFd4cWRkZEYvT0ltWEZDNGZjejlSTWhVUmFB?=
 =?utf-8?B?NGUxUEpHbWtKSkRLVGlCemxyaCtnUUpMa2VZeHBuYmVhdGtnaW81TnQ0WkRk?=
 =?utf-8?B?V2VRWkNBYVhoTnplQXZmeUJ3TlVlSHpnR0VLRnBoQ1pRS1MwK3F1MjFMenZw?=
 =?utf-8?B?K0pYbzREU3ZZd0tmN3VHS0hEcHNPanp0d29GdGtnK2g2V0VMb2pqRzFVOFBr?=
 =?utf-8?B?U0htMkJKaDNkcDNWN2JhRDY1eElWWk9TcVBVeU1VaVljcnVMVjZlNVV1RUNy?=
 =?utf-8?B?KzJQbWJFblZZUGNXTFFXR3liSHVHcWJjNjlWMzd1TUJONS9NeUxndDZtWFVC?=
 =?utf-8?B?dGRJa3RyTzdZcHRTc2U3RXVBS0VGMk1RZ21ma0liQ3NXdGFyc2QyZ0FXY3Jr?=
 =?utf-8?B?emt1Q245VkF5dnhuVVc4ZzBQS2l1Mklab3hZTkVLWGZJQjJsSUVXUlhLWHRT?=
 =?utf-8?B?eDUxS1lhNG9QQ2duWktzSU9HcEthOVhrQ2dBQUVaeDN2Wk1BdEZyTWswUTk0?=
 =?utf-8?B?cVRkMjJWSk4wdkdsTDZucVVxV0tkWVI1U0VMcHdXNWtLV2hDeXFwajFzbk05?=
 =?utf-8?B?eUtYeHJ2dHFuVlhrQVA5L3EzLzdCUkhPUEk0ajNrQjhaMnBIZld6U3hnbWpw?=
 =?utf-8?B?aVA4dDQ2RitmUGxQTmFTZHN6d254aERBelN1SW9rdklYM0dIbDlMODZKeVRX?=
 =?utf-8?B?SzZ4TzB0SDYzd3RZLzdZUmpVNHl3c1FSR2VNS2NHeHBkbzZLMDg4V2xrSmZX?=
 =?utf-8?B?a3kvWHp3OWhYSFdnNHduc2N1eWJFTmd1eWF1OG5UdWhsTkdqM2hmck94dEM4?=
 =?utf-8?B?WkJSdHJNTmNiVXJKRU5pNVFwa2k2RHd0Rm5Ea1ZIQ0lxeTdKZG95MCtYc3Np?=
 =?utf-8?B?azRCYzQxL0FHZDNuMmF5Nmpwejcwem51OEdxcG5aMmkzMDhHanZTTEVjZHpS?=
 =?utf-8?B?WmdlUWwxNlZYckV1TnJRSEwwaVJBeUxGR0dReXVLZG16RVBqTTlNTGY3aEVs?=
 =?utf-8?B?clBDTUFZTXJ6bUVsekpnbEo4bS92RE9EbU9aZ2dPVVZmSHNBWTl1L0ZIYTVu?=
 =?utf-8?B?Tys3TU9XaG4yNEIyS2h5Y3dxOHp0cXBIYnErS3JNK0N3MXRKNTRzQkJiVDdN?=
 =?utf-8?B?YVVlUjAxeTlhWVFWTHQycFc2V1BWSUZhMlZ0WStlWitxbHl2dHJDU0J1VGNv?=
 =?utf-8?B?dVZHSFBmL1pyMFpaaE5UVWVyWHZXZllSYTNUeEZGTW9NdVRMbjhWOGloR3B4?=
 =?utf-8?B?NnRrYTBiVk1jQXRVdG52U3NNZGlXT29Cd2FCWmY2OHhUeTZZclM5aHUyOTY5?=
 =?utf-8?B?Z25PYUV2dlJqa2xSNFVhVmEyTVVHQUcwUXhBNTcxamhYVDFEdHhXQ3ZCRFA2?=
 =?utf-8?B?SmhCMlB1TUNPMXAvVWkwR0M2blpiWWgwTFV3ZTdqTEZHMURyK2dlQitaL0x4?=
 =?utf-8?B?UTQxclFtdTlLWWo2M2VyMHhhMitKMWwwdWlRRXkwbFJVZFc1VTZscUpMRDVs?=
 =?utf-8?B?eFRsQnZhaUVHQjBpTkxmODgzS0VkVTAvUzZWNGpkMWpxcWltRGxESFBsVnJa?=
 =?utf-8?B?T0hrUW45TkNCY01LZnFSaXNuUDZqWGE2L010R1M2YkdSdjJOWlluRFNtYjhi?=
 =?utf-8?B?RTFHYVVNYVBSTEN3Yk12UjQwVkxyazZYaU5QL3RabUhDOFh2R2k3WTJXdEU2?=
 =?utf-8?B?eTZxamlYRmp4VmNXMmluazVLcnFMZlBrUjI3TDM2blVRd2RsWkdRTTlVVEdj?=
 =?utf-8?B?THY0MjB3c1FXWS9VSWVLMk1haEt3QlpremQxUnNCUXVBK2VQYUQwVDFWRDdI?=
 =?utf-8?B?WEVkcUwxYkx0WUhxbjlXc0JDdGprekN0SzBDZWNaZjhLSlBjV1doTE9uUVNn?=
 =?utf-8?B?VW5GOHdDL3FLY3hyTEVzSS9rMVFRPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c63a972-cacc-4613-cba9-08dc94537d60
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2024 13:42:28.7647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ruTXDhY/XolSatPmqCWDmi3fSkzT6HzkftJaXggwGP83dQ6XJ+0GCK4cvKkrY8x9f2lqvdnZC8fXvbuGwh7UuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7141


On 24/06/2024 13:51, Jon Hunter wrote:
> Hi Jameson,
> 
> On 10/05/2024 21:12, Jameson Thies wrote:
>> Providing the number of known alternate modes allows user space to
>> determine when device registration has completed. Always register a
>> number of known alternate modes for the partner and cable plug, even
>> when the number of supported alternate modes is 0.
>>
>> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>> Reviewed-by: Benson Leung <bleung@chromium.org>
>> Signed-off-by: Jameson Thies <jthies@google.com>
>> ---
>> Changes in V5:
>> - None.
>>
>> Changes in V4:
>> - None.
>>
>> Changes in V3:
>> - None.
>>
>> Changes in V2:
>> - None.
>>
>>   drivers/usb/typec/ucsi/ucsi.c | 14 +++++++++++---
>>   1 file changed, 11 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/usb/typec/ucsi/ucsi.c 
>> b/drivers/usb/typec/ucsi/ucsi.c
>> index bb6e57064513d..52a14bfe4107e 100644
>> --- a/drivers/usb/typec/ucsi/ucsi.c
>> +++ b/drivers/usb/typec/ucsi/ucsi.c
>> @@ -812,10 +812,11 @@ static int ucsi_check_altmodes(struct 
>> ucsi_connector *con)
>>       /* Ignoring the errors in this case. */
>>       if (con->partner_altmode[0]) {
>>           num_partner_am = ucsi_get_num_altmode(con->partner_altmode);
>> -        if (num_partner_am > 0)
>> -            typec_partner_set_num_altmodes(con->partner, 
>> num_partner_am);
>> +        typec_partner_set_num_altmodes(con->partner, num_partner_am);
>>           ucsi_altmode_update_active(con);
>>           return 0;
>> +    } else {
>> +        typec_partner_set_num_altmodes(con->partner, 0);
>>       }
>>       return ret;
>> @@ -1138,7 +1139,7 @@ static int ucsi_check_connection(struct 
>> ucsi_connector *con)
>>   static int ucsi_check_cable(struct ucsi_connector *con)
>>   {
>>       u64 command;
>> -    int ret;
>> +    int ret, num_plug_am;
>>       if (con->cable)
>>           return 0;
>> @@ -1172,6 +1173,13 @@ static int ucsi_check_cable(struct 
>> ucsi_connector *con)
>>               return ret;
>>       }
>> +    if (con->plug_altmode[0]) {
>> +        num_plug_am = ucsi_get_num_altmode(con->plug_altmode);
>> +        typec_plug_set_num_altmodes(con->plug, num_plug_am);
>> +    } else {
>> +        typec_plug_set_num_altmodes(con->plug, 0);
>> +    }
>> +
>>       return 0;
>>   }
> 
> I am seeing the following panic on linux-next and bisect is pointing to
> this commit.
> 
> [   16.411135] Unable to handle kernel NULL pointer dereference at 
> virtual address 0000000000000310
> [   16.411716] Mem abort info:
> [   16.411806]   ESR = 0x0000000096000044
> [   16.412147]   EC = 0x25: DABT (current EL), IL = 32 bits
> [   16.412465]   SET = 0, FnV = 0
> [   16.412530]   EA = 0, S1PTW = 0
> [   16.412778]   FSC = 0x04: level 0 translation fault
> [   16.413084] Data abort info:
> [   16.413149]   ISV = 0, ISS = 0x00000044, ISS2 = 0x00000000
> [   16.413534]   CM = 0, WnR = 1, TnD = 0, TagAccess = 0
> [   16.414163]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [   16.414649] user pgtable: 4k pages, 48-bit VAs, pgdp=0000000101b2b000
> [   16.414784] [0000000000000310] pgd=0000000000000000, 
> p4d=0000000000000000
> [   16.414940] Internal error: Oops: 0000000096000044 [#1] PREEMPT SMP
> [   16.414946] Modules linked in: tegra210_adma(+) 
> snd_soc_tegra210_ahub(+) drm backlight snd_soc_tegra_audio_graph_card 
> snd_soc_audio_graph_card ucsi_ccg typec_ucsi crct10dif_ce 
> snd_soc_simple_card_utils typec pwm_fan snd_soc_rt5659(+) snd_soc_rl6231 
> ina3221 pwm_tegra tegra_aconnect phy_tegra194_p2u snd_hda_codec_hdmi 
> at24 snd_hda_tegra snd_hda_codec snd_hda_core lm90 tegra_xudc host1x 
> pcie_tegra194 tegra_bpmp_thermal ip_tables x_tables ipv6
> [   16.415056] CPU: 0 PID: 290 Comm: kworker/0:4 Not tainted 
> 6.10.0-rc4-next-20240617-g76db4c64526c #1
> [   16.415063] Hardware name: NVIDIA Jetson AGX Xavier Developer Kit (DT)
> [   16.415067] Workqueue: events_long ucsi_init_work [typec_ucsi]
> [   16.415082] pstate: 80400009 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS 
> BTYPE=--)
> [   16.415091] pc : typec_plug_set_num_altmodes+0x18/0x6c [typec]
> [   16.415112] lr : ucsi_check_cable.part.0+0x228/0x280 [typec_ucsi]
> [   16.415120] sp : ffff8000848bbca0
> [   16.415123] x29: ffff8000848bbca0 x28: ffff000080e66000 x27: 
> ffff80007adc96e8
> [   16.415140] x26: ffff80007adc96f8 x25: ffff0000834510c0 x24: 
> ffff000080e66010
> [   16.415150] x23: ffff000080e6638c x22: ffff000080e664c0 x21: 
> ffff000089c95800
> [   16.415160] x20: 0000000000000000 x19: 0000000000000000 x18: 
> ffffffffffffffff
> [   16.415170] x17: 1e00000001000000 x16: c203000000000000 x15: 
> 00656c6261632d30
> [   16.415180] x14: ffff800082c922d8 x13: 0000000000000040 x12: 
> 0000000000000228
> [   16.415191] x11: 0000000000000000 x10: 0000000000000000 x9 : 
> 0000000000000000
> [   16.415201] x8 : 3d45505954564544 x7 : 0063657079743d4d x6 : 
> 0000000000000000
> [   16.415212] x5 : ffff0000835ee780 x4 : ffff000080e66288 x3 : 
> 0000000000000000
> [   16.415223] x2 : 0000000000000000 x1 : 0000000000000000 x0 : 
> 0000000000000000
> [   16.415233] Call trace:
> [   16.415236]  typec_plug_set_num_altmodes+0x18/0x6c [typec]
> [   16.415255]  ucsi_check_cable.part.0+0x228/0x280 [typec_ucsi]
> [   16.415264]  ucsi_init_work+0x8b4/0x9b8 [typec_ucsi]
> [   16.415271]  process_one_work+0x150/0x294
> [   16.415282]  worker_thread+0x2f4/0x3fc
> [   16.415289]  kthread+0x118/0x11c
> [   16.415296]  ret_from_fork+0x10/0x20
> [   16.415310] Code: a9be7bfd 910003fd f9000bf3 aa0003f3 (b9031001)
> [   16.521018] ata1: SATA link down (SStatus 0 SControl 300)
> [   16.524401] ---[ end trace 0000000000000000 ]---
> 
> 
> I have not looked any further yet, but wanted to report this. If you have
> any thoughts let me know.


It is crashing because 'con->plug' is not initialised when 
typec_plug_set_num_altmodes() is called. Do we need to add a check to 
see if 'con->plug' is valid in ucsi_check_cable()?

Jon

-- 
nvpublic
