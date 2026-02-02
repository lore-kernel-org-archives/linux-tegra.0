Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012012.outbound.protection.outlook.com [52.101.43.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B6A2222C8;
	Mon,  2 Feb 2026 16:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770049529; cv=fail; b=H19tU2AVPXaHV7kdzcgs4FxzxahqjjqpPxzY+aWAJCUVQdcUaip1TtPa0MXn+hO9oB9SX0QBylulNwEThL7Ntb3UbQ5nDZCcZKKGMzqsei/JFbDZY9R6B/91wfBM8suRey/v3p0YoaPq+EHgM5OGOUH5ghYCRk01ue4u4kQs0IU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770049529; c=relaxed/simple;
	bh=PATe7YaQJE/WLC2/WYXGK39V1Bt24+zG9PDCgAwmTaI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rDNQFvpa1PPC0m4xsD40S2BhUj3qa4U5bjtc6PMPpDmjRusb6p+TCSTzOJ72l7whogiVbzpthVjBPNaa+U9D8Hgq4Zw8uHluK9bRirsZstZwKbL0XWSephZ+D4zPmxtlE0leb9OQplbf9wwgnHaF6nRwHw4pYbK8LlSbBTYWrys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=aKjx85+3; arc=fail smtp.client-ip=52.101.43.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="aKjx85+3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L+dTqFhDp4dB02VlNn7pJFE3sQ0cBmE3aXMG1b4KxxbNzxDuzXdhXwLyoUvVtOMcs4RdWSrubVfnMpocydTeGP6cHHAqZpgw9hHpPqReizqaSx21LFkl0CWaWeKpXhXIxTDs4WFR7n6VNXhtMPfC/Y4Be+0dh0qdLi89wqc/ogXcUexcdeDAktEh/h83Ho4I95aCeJJytNe4CewLn7TYRfjQmd9WDswaVuT6aN5zB06IB6A9BBtiL7R6sEowEr0pO7t9GrRnHbBDEOC6Y+V6cyqwYmxMucSmTqOoig4hMOYx5y/w3EWIE66ot+uk78hox0gMcqPukTevV5/HZ31DEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4fD39iVWlB5MgbMNPA02gdF5mQnauF3VYzeJsTLYfFk=;
 b=wMS9R9ANixA91wlmtPx29yf+ltr01uIQxYNHPGY+teoyH/BPeQmzlG03JuauDA3N4dd7Ov83i+AaCb0PAQYte0cCb5pkDSgCARhnIWaApJr5JEL+nvvpLNjfAWdz4uWdMsECujnvFQWe4eov9EWXreg1M9tKhmsgGlmyN+iR3va44NsMinXb/hKXz8wtwnIlj3R0wRsc/kH66H5MYB4x7Ytow0Z7VxdHQShDJdz7MLq4Ph+twdb2BXSbqVu8tH1Ceuhe9BQizy65gahjiEONNmwRcmKqGd5hrD2N7ciAnpCPiAspif4K7dlpF0FuAG4IxujclFLoFUTDr22w7WK7VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4fD39iVWlB5MgbMNPA02gdF5mQnauF3VYzeJsTLYfFk=;
 b=aKjx85+3POyL+++tNxLflUvYtZu1Q10JCV/45hYdTcQDlTGV9/1YVEfkg0Ui634Mta1Ew9+QfXYzG5I5Zt7MtcVoksJFOc4GxpDIL+gcePRDczfDBu00FSF5JrX8dP72DkB8zd5K1vWy3JUOYmSVwdbNd0EZz3PMRjpHHXux3YF71ZSBwIDQwfuIPt346i+PtEWnT1Iu9MT4iEOnT6Z4k/vdwDPRWC83g2K9rAmUT/nWbvKq/qaZT+bZgUugSFRMR/98MG3oQhF1VSlCBAAFNYWQ2p3kS6jq+hRaB/dbS+WitIypvQaZp0aQwhAsQYddqi9JciUQLTNg79EF6kgIRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by SJ2PR12MB9190.namprd12.prod.outlook.com (2603:10b6:a03:554::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 16:25:19 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 16:25:19 +0000
Message-ID: <fa87cec4-1aa8-4e9b-9baa-8b543d2b7c6f@nvidia.com>
Date: Mon, 2 Feb 2026 16:25:15 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/4] memory: tegra: Add MC error logging support for
 Tegra264 SoC
To: Ketan Patil <ketanp@nvidia.com>, krzk@kernel.org, thierry.reding@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20260130173055.151255-1-ketanp@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260130173055.151255-1-ketanp@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0102.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::17) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|SJ2PR12MB9190:EE_
X-MS-Office365-Filtering-Correlation-Id: 43f31ef8-3bbd-4af5-f39b-08de6277a7cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|10070799003|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MFQ0VC9UdVRlWnpPM0laWUJheDVzb0k1TUNlMVlsSEF2SmNRVnN2QkZSbDV3?=
 =?utf-8?B?TmlxR0dkWlM5YmtpL1J5UWhySDlObjkzZGZtMVloVEtWcjIxRGV3am4wRm9V?=
 =?utf-8?B?WitKK09Bd001a0hIV1Y2NDFDY2pFTzdEWjZJaEM4L1RVM2pXMzRXamF6MlNa?=
 =?utf-8?B?V0VYc0ltQXlXVlBvZ2lRNkFxTmlUazVKM096V3RJcERmT2F0djF5TWtkcG1Y?=
 =?utf-8?B?OVpUOHoyZXE2RG9XV2dWdUpiQTEvMGU1UWdPRGtZV3hqUXF2MHVUSEd6RFd0?=
 =?utf-8?B?UjBMWTN1cmxQbkRIYkZOMjR1VWZONnZ4Vy9PYnhiNEFmUE9EdDJaSE1pTGhP?=
 =?utf-8?B?V3NSNmFIMmVtV05zQzVQTEdlWGdScks4RjdUVmdsRXVpb2I1TGRUb1RMOVJN?=
 =?utf-8?B?OVByVEtOMEtIU3JkTHFHZ0NGa25uZmVheUFTcDN2Q2lFZ3k1LysxWXRvZUE1?=
 =?utf-8?B?TlA3UGF5RXdkMTM5alN6aWUwUGo1UXZidm5VRmlhWTJuaUUzZ3Nna3hRRkVa?=
 =?utf-8?B?MHVNM0RheE8wR3VKVENKUVluSDIxWWd0akhDT1V2VUNNbHpUakhleHFta1hF?=
 =?utf-8?B?ZzdwTHNXOW5tQnA3clU5SHRzbXZVQ0w2Y08xMjlXeVNEdkZYSUxERzJ0OFoy?=
 =?utf-8?B?ckNiNjdVQUpyRXVISktkM1NtcG1RdDBqTjZxUTdNQzBKYWE5Zm5uOWEvZFA3?=
 =?utf-8?B?VVZSNVR4Y2xqSFVMaG1SY1VlcTFvV1Z2WFU1Wm5nVkRMWWc1d0JqdytuYjVP?=
 =?utf-8?B?QnlhbmJmWDhJMmZkVFlnNmUvc1prUWVqTWxHOWhXNFREdlcrVkthNFhqV3BI?=
 =?utf-8?B?WTEzbEI2Z2hETnNncllSdzljSFlvZjluanJ0YjU3QVplRTN2KysvSUZQRlZQ?=
 =?utf-8?B?WWUyU0w5eVBtZ3F4NUg3dkV0YTRRL1FFZElLMTdRMkpzdXVlc3BmUEtBdnhy?=
 =?utf-8?B?UWxZT2cxNm0zT2ZXd3A4aTgwdGNWVnFuRWIwL0ZsaEF4U1ljcm1TWWlWcHc0?=
 =?utf-8?B?TkdQdTZlNFJvdnNQZTVWMDBudlRYSGRkSDJ0QWI0MzQra2NvSUNFYTRISU9j?=
 =?utf-8?B?YURBZnRuMGR0akgySGpYTi8xSmFZc2xscHpNbWlBY1lDaGxTaEppV2hQOUxZ?=
 =?utf-8?B?VU5ocUhVbmF4aThJS3p5Ykl2NXJ3d1g5SXQrOVkvdGhYVXl4Z00xOTJQMXM4?=
 =?utf-8?B?eEFmU1p2c2NVK25sdWc2NmlTQVJmTGVvWW1ISXhrZmVzaFYvZmx0emdJa3pK?=
 =?utf-8?B?THdnRDJoWWtpSXNXU0FpSkhJaVlKZnFuMGFMVGIrR0NMczIvMmxrVDhoR29n?=
 =?utf-8?B?Ukd1Wk5Wb205bjVFRUx0U1FYUktSNnEwK085Ylh2TllDR2Y3eFV2ZGFFeTlt?=
 =?utf-8?B?WTJ2QXM0Ui9FUHFvMUpLdEkzaCsvMDE5WExYVXBhSFN3RXZleFdBeE42RktU?=
 =?utf-8?B?UVUvdXhOd25XalRHcDdsK1ZpYmx4eVdYZTFsRW5ETWhPaDlhTGw0WXVtZ1I3?=
 =?utf-8?B?eEhQMzByWHJrSGRhdTRmRVRoMmMrMGpROXVKOXNNM3piamlzK0srODlnQ2F5?=
 =?utf-8?B?eS80ZThGRVRlMlZvODlCbTUya3JlVlNHeDBrZWJEZDhxM0dPbkVXaWh4OWNS?=
 =?utf-8?B?Q1lmbThDWmdJNnJENi80RExCbWU4OURYTzc0NkE0ZXA2VjZRRjVwTFI4dm1n?=
 =?utf-8?B?TXM4eHR4Wlc3VHB3SitvMXg3RjR6MGtINXNDQ0ZBN2ZBTkU3a0srWE9EeFJG?=
 =?utf-8?B?di9WdStwOE9vcTBmZU9MU3ZsYXJ1Q1dmWk9CY2VzNjVxOEdXRlZTY3dWR2ZN?=
 =?utf-8?B?T2lYUFhtdnFEUTh0K3ZBb1ZrSDlHazFURE80SVpYR2xsWFd1OXpLYi9yeXJ3?=
 =?utf-8?B?MmMzcCtjZ3RMdDBuTWxtMVBwb1RlMloxUTQzcWpIWjFZUnlQZ2Y3bEUvWDl5?=
 =?utf-8?B?TFl6a2paTFF6REhmMk5ZRXJNcFVHRGxzOU9ONTV1cjlneDVHc01ZU1poYW95?=
 =?utf-8?B?MDgyTlJIbkFJNzIyU1ZnQnR3aU1UbnBhQzBrM0dnaHRKVUpFR3FkRWVKYVFn?=
 =?utf-8?B?TXkvbHlsRWxkT2JlQkFFdkhTTzF5UG43RFhFWFhZUHdZRnBaWnhIanFCaGo3?=
 =?utf-8?Q?oN6o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0FtSDFQZU9OaUlKRnUyZzBvSm85VW5MdGNYZU8xVnBhN1ROY2g5MU9CM0Nk?=
 =?utf-8?B?L05qa2k1ZG5vTTh3ekh6bmNRdDYzWEYxMXl2WkVZQU55Vk5vaVBUNlF0dmxH?=
 =?utf-8?B?cDZYaGhJODNkVStIR3RNaWYrWEwzZjFZVGVDNjRRMHA0Y1J5c0ZzYjVjYjJ4?=
 =?utf-8?B?N3RQMUJHbVhObTFjM3dmb3NaNWlEUE4wcFlZeVlEYWlUTkxiS3c0bitib0xM?=
 =?utf-8?B?YklJbkFORUpXQ2NXOGNCelIyYkx2aFRIWXk5VmpBV2FqZEI1ZHVmQVc1L1gw?=
 =?utf-8?B?blBpaU1idVY3RVY5Smhqdk1jdnI5OVZsRTVrQTlRM1lWYnNEMjczRWNETldw?=
 =?utf-8?B?djZMeHBGNzB5TEk0TWpIekxYbHNyb2w3Y1lQcEJVZHpLZzVTbVJOMkVwUExI?=
 =?utf-8?B?amtSNnJOcUdtVVRYQnhYeFBKN3QvVEZBMmJuM0JLRzJOc2tJcDZmZVhzL2lV?=
 =?utf-8?B?blFwbnhZOUlRV2hQZ1lLN2htSXFzaUdndzNBbEdrWDlMOVdGbXJOVUJ1UHJO?=
 =?utf-8?B?dnpwOS9TbVBSU09oNHhoQ1MvUC9EMUF1SHlVZzBtOFZDbnBzS3J2YVJWaElG?=
 =?utf-8?B?aDZ6bklmL1FDd0doenlKMlN4R2xJOGlzUDJTU3BFTUdhTGZYdWpSUWY2azZK?=
 =?utf-8?B?SVJPVVUvVG9DV2VhSldZM1FzcHlmSnVTcXVoL1VEcmZhZnlYeEVSSzc4TWpy?=
 =?utf-8?B?a1NxL2N5RmxQbERpNjFmNVg1Y3Jta2tCMStDOXRNaTltR29BMGg3dVVVekZB?=
 =?utf-8?B?aTdNeGxIOFo5NEZmSkJRWUU5SmlFTHlXelM1NnRhTmJsVE41QkVmb2VFbkw1?=
 =?utf-8?B?TW0yNklVT1JhSXZYM1NpcmZ0aU5SQjlXekRiWGMrYVZwdFFZSjNmSW10M2pP?=
 =?utf-8?B?V1BLZDZsNFRhbUVPQzA1TG9hOFU5UmdRY1ZBbkZDdHYrWE54NDdsVDVBUG1R?=
 =?utf-8?B?a2lUQW5ya3VyejE5WGZOU04vTU40eGxLZVdPOGFXVTJNUTk4a21VNWdzajZS?=
 =?utf-8?B?N2NoVVp0cjVXU2FkNW45U2dDZzdCeXhaWC9HU3R6ZWUvTkVodDgwZ2VXQ3Ra?=
 =?utf-8?B?c2w1cDI3SW5obTFMbmo4L1cxL3JDYzhubHM5aVFlTGlJeUJGOEJZbk95N0ZC?=
 =?utf-8?B?R1pwYnBNY1pPMDBFNkNJb0hIazRhY0lMeFcwa1RZT2tGZTU1cEdEVDVrVE8x?=
 =?utf-8?B?WkZESGZkTkpocm1TNVpnZXJFSjNva242TlkzVDNQc1FWc0VOMGpTcE5aNGNx?=
 =?utf-8?B?UnZ2RU9VNFJlanM3TWdPbi95ZGNNaTR3ZjIzV3I5K3VWWTJ4aFQ5UW1TeWpH?=
 =?utf-8?B?M1NmRXFpa0VlQzNsbDdTWEpEK2x3UVg4WHQ5M0pwMkZLRVV5b2hzREFuUUpO?=
 =?utf-8?B?eGozYVVWSi8wREVqa0JZTnZ3Ty85czE5N2t3SG9tbzUxb1dFYU1HMnp1MmFy?=
 =?utf-8?B?Z3M5VXVQUkNUbzU0SEYrUEc0TUFKOUFCZGNtZHpCRW9sQTRaMUREUU45T1ZL?=
 =?utf-8?B?VWoxWG9wM1AvTEZHK281eTVQRHVVLzFIeUZKbTV5azA1dVNqeE9XbG5CMUJV?=
 =?utf-8?B?K2dsZHR3VlBPTEdZS3BwSEI1QWRJQjk5MW5TdEU3Q0VYdEtuYTdqbTkrd0lZ?=
 =?utf-8?B?ME5ob3NuQ09sb2FzK2tJNnl2UytPZmwwM3ZHbU56NHd6bHM0ZG4zWHFnaE9a?=
 =?utf-8?B?WnBpTlBFMkxlMjZjN3hWU0J0dWRRaFpvRzJ3NjhCaUdjSTBsN2duMXVQaUJP?=
 =?utf-8?B?M1o5bGVoSGRpOUhkaU5DUXltY0FSK2h0TkxlOFdVMWloODJ6NkNMb3Z4bVhh?=
 =?utf-8?B?bHVlcEY0T2lYSGM1bDRObk0wd3dWWlVPRlBXYmdHczgzMWtyWlkwNzVGaWU4?=
 =?utf-8?B?RkJ2RGxyZitkT1BWMjYrR0RwZXR5YWJZdFJPWC9vaDNhWFZINFV4TENMVCs5?=
 =?utf-8?B?NjY1YzlLWUJTbEtaN1kvLzNzckhpcStBeGlZbitNSWxxS3FSd0RtQnNQdWts?=
 =?utf-8?B?SGtRMWxWSWNxckJLc1VyZkJMWnQ2bC9CME1XZ0c2bjNIQUlhRVE5ZXFZMUlj?=
 =?utf-8?B?UnZnZ09BZzBjNXdLTzlxSVZZM25JN1VaRFo0L2s2UmNJYnpQVnZMMFVCc3FD?=
 =?utf-8?B?TS9iMGZSbmFwVHkvN1NSbTZEeDBDQmNuTUFMRUhVeDRoVkswZ1Z5MEJDdlA4?=
 =?utf-8?B?RkY1Nmw5Uklsdlc3cXZCY01iQXlTbjNoQkRsZ3FSUFU0MmFkMFgxQ3hCQ3BT?=
 =?utf-8?B?SkY5SDFIT2R5R1FWRUpXMkZaZGpybTVLWTExalo0SkNESmsyVEJHcERkWnlS?=
 =?utf-8?B?MFd0YWIzQlRtZjZENDZRMUZpdVNncW1QdHNNMFRuSTg3R2RmVDBuUHZVVXQ5?=
 =?utf-8?Q?2rmZhEimTt780qgrOkW6moxRB3m4QqxaU03j8qEG8D3ck?=
X-MS-Exchange-AntiSpam-MessageData-1: y2I6fC/huFApmw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43f31ef8-3bbd-4af5-f39b-08de6277a7cd
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 16:25:19.0252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hV1qHh1WhUFGuNwA8Qs9gAARxPd/7gXnTFRKp9tMTTwQN9dMvmiksxvhG229b9Pkff9C4kIlhhZ2xNDWF6HakQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9190


On 30/01/2026 17:30, Ketan Patil wrote:
> In Tegra264, different components from memory subsystems like Memory
> Controller Fabric (MCF), HUB, HUB Common (HUBC), Side Band Shim (SBS)
> and MC Channels have different interrupt lines for receiving memory
> controller error interrupts. This patch set includes changes to add
> support and enable Memory Controller error logging for Tegra264.
> 
> Ketan Patil (4):
>    memory: tegra: Group error handling related registers
>    memory: tegra: Group register and fields
>    memory: tegra: Add support for multiple IRQs
>    memory: tegra: Add MC error logging support for Tegra264
> 


For the series ...

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Jon Hunter <jonathanh@nvidia.com>

Thanks
Jon

-- 
nvpublic

