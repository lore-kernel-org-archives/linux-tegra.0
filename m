Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2085.outbound.protection.outlook.com [40.107.102.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49521198E60;
	Tue,  6 May 2025 10:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746527439; cv=fail; b=XtWgVyq1WeoSXVIqQ27wbV5Qa2suhJ85oKpfWA4Ey07RYRpKIULQnATMv7ZYDzTE3qvhw9FO2lClmp+i+28x2lagoETlRz13OdIzegZIQZ2cB3CDIfApqxOSmHDqzrlyaLoLwFAPQ+1MkVNKA265NVpn9VBcmKy1Z4CPjFz2pAQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746527439; c=relaxed/simple;
	bh=2JukRnY3Og8YXDiH2FHdVHHNmTLi3lrWx5+vo8Ykzjo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bLbcu8EOpIn8V1EUDwRssLUt2M9MZVtkOAoIkZ4FTlm+habqD9jP8H4AlMHovUZuui5BtplCpBMJBBj4rnR7VctWGzXGr6c/DIuMztcNyA/exkrITzVKcNagNSX8yrxJkg3Wc9IDbi9rtB11Zy4WbwIzFyVuYbZanLvyV9TURcw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Jg8+p3XQ; arc=fail smtp.client-ip=40.107.102.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Jg8+p3XQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uvRtaxu3Cp/wRGNpaNbdTea/UbUqNKlDvzYI5rYkRObO9ZH6tpFgJjsliGG6zCZ1lmS3NbAw5qJ7ZKKqCRdfbFEa3vm0mf3rQM5lQ+R5BM3KtLruOm32kllRIo8E5MW3c/v2oTHaXy+IYcX1OePPu/+6e+esMntLn2jN1RKiZPYjOXQVGlpSXcbp295agjZbaYZCj9J6GvJq+EHSARSPvfAR+HYV56f99XkgHoGYnaQ30LkXPUvLjhlPUdvf8yOKjri0wKvOM69+1/zmWibxFzgo4FaMKpV8hVU3GPL+8haa+jCss5m0ixK3qw6l5XXRcI9j0LGd50eENlCe6D8nGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ll5opPRdMTI6t9N3iHOIBbnvWPaKdDnNm5e02bD+LnE=;
 b=IBGSzbPCjv5K/sdVF8FVyWHh5QqW7z7/fUgYgPfBvshBUbnPhsatmgwR/PDgoEr948ePlU111VH50R3CKb/88sqVljwQiQGjSsVI7DKMsTyURlchm4Gu+y8CPMvHfaipeeDFC6axE9c/dujIp1fFf+sxWgD+jSrAvwCMs35L7ZuySLJ0pgj6UWS68Is3p86dBgXweH4U3mtYiOwpxnu6hIJG+pJ1LzmOog94n10WS4xzOJmmn4X0TR43BV/62Tv1FWITnMPZTv417F1+qZuPqfeeraxtnLUMi0NpV08jdbfmUN1qeKz5ghB7OcUaClulZp9VYaeqlnRAi43zL10pvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ll5opPRdMTI6t9N3iHOIBbnvWPaKdDnNm5e02bD+LnE=;
 b=Jg8+p3XQdN1ZWtnSZI1s+i/CeuWUE/CslojMTJoQcpJYlrmOKuNcbEpEQGo7SGf1rZ2tPjidEM+WmrpCrOUs/L8oXP0vSQ8xDT9Gjjf+zCQgVahwkD76+7qCzc7NI+e8ngc0mUT50ROVgAY1RmFLgf+y5OoTE3kDRmXj5SphhkPEx5PKKLGRbH0II5Us7B/Zy/Ye4OH82+p3apGYycI0uG5/q03oGrb3F/wtjcF9VwvJ3pBpwp/etup8H+jW2H/Sx5gyJ8xXP8/TNXiu5G4Spab1IueesX32MafFBINypVCBZQQ8Py+yVz0i+b1A2FSePRnw/cRgWYDylbZYViX3fQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by IA1PR12MB6211.namprd12.prod.outlook.com (2603:10b6:208:3e5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Tue, 6 May
 2025 10:30:31 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%3]) with mapi id 15.20.8699.022; Tue, 6 May 2025
 10:30:30 +0000
Message-ID: <b96ab3b0-3afb-4918-8db8-f6cab45576fd@nvidia.com>
Date: Tue, 6 May 2025 11:30:24 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: tegra: xusb: Default otg mode to peripheral
To: Aaron Kling <webgeek1234@gmail.com>
Cc: JC Kuo <jckuo@nvidia.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-phy@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250404-xusb-peripheral-v1-1-99c184b9bf5f@gmail.com>
 <CALHNRZ_QUY7NPH87RYqFWEy4PkTgV5uZVZ6hh3sbe=U_8ga2jQ@mail.gmail.com>
 <CALHNRZ9s5EdL3vapyJS4TdT=v5v_QG-=n8ABNJDLU4B-7w+wRw@mail.gmail.com>
 <CALHNRZ96Cs8+gyyb=_jTpvCq--uF3P1s8_m7t25nN_vPx0ELXA@mail.gmail.com>
 <66776953-ef1d-40ac-9d4b-a35a6ebae20c@nvidia.com>
 <CALHNRZ8uXZQObwQBC-sLudUdtprM24qU5yYdb4D3FEP2AQVkmQ@mail.gmail.com>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <CALHNRZ8uXZQObwQBC-sLudUdtprM24qU5yYdb4D3FEP2AQVkmQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0337.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::18) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|IA1PR12MB6211:EE_
X-MS-Office365-Filtering-Correlation-Id: 42c70951-24ed-44a4-1bb3-08dd8c89066c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z3Y3OHY1aWVhTzY5SU9ONnRjcEZWRFZzMHh4UXBPS3FpMWZYMHRDWlpMMHE2?=
 =?utf-8?B?TDVNeHNOSEp1Nnp5QTV2VzF1emRpYjF0VWE5K3U2RXVkZzAvV1cwbUJWK2Rr?=
 =?utf-8?B?MXBoRFU5OHRoaUdpQU1ZbXdqSVcyUnlybHN2Q2dOejN4c3hNdEwybXhORm1n?=
 =?utf-8?B?aTZudm5xNFh1ckFGd292dkpDdUE0TzlkTGJRUkNPUUJBTWtBdmovaU5IOUln?=
 =?utf-8?B?NlFkZGlCZHk5Ym11c3NKZWdNVHp6cVRjaEltY3dLVzRQWVhMR2Vkd200dW1J?=
 =?utf-8?B?QS8reTI4QVN5bFdRY0RkM1VTbXIwQ2xKNGhsQkRxcFVta01lMldJdkZsN3RP?=
 =?utf-8?B?c3UzbFdrb0x2dS9iMWhZNXphMWhxbm43eWI3dEN2ZG01akRveUt0WmhSaVd3?=
 =?utf-8?B?TnJIRlJDaWNtMkFrb2ltc1ZDRXZnWWd5cysxZHJjQTg3OHltVmlkM29mb1FC?=
 =?utf-8?B?a1F4b0M1bTYxT0dwdWR4WStOTVNiaG1BQlRuUW1ubE1nckdDN0FNMFNuM2dh?=
 =?utf-8?B?MEZsOGdzMEdKZHdCbU1jUmd2RHpkQ1JVOUE0VVVwVmR6MnYwaHJtU1huaEE5?=
 =?utf-8?B?cVB1L2tZZEViZEZWYVJVU0RwdldMMVl5OXZiaHV4Q3pmY0hUdDVKVWwwN2hr?=
 =?utf-8?B?YVJFcmZ0bVhvUER1QmRuRjRsbHMxdmRiMlN3Vm1jaC9lTk1PUkRqd1ZXZDZN?=
 =?utf-8?B?MkpkakxpZmdHdmg3TnJGWHhKWWFObmpZdWZvci9hYXVydzZkTThva3ZWQjha?=
 =?utf-8?B?RXI4ODBrZ1plUkFveXlBZWUvUGZkZHozWEVhaVRlSjYzdXoyNHFFelkrOG9t?=
 =?utf-8?B?M1pRV0lTa291VTE0dFZTdGkvWnNYcWtqWWJmcStUWU1XZVFzYVBKbUl4dmZ4?=
 =?utf-8?B?RW52L0tuQjlTSnFCcXd0eGV4ZkNReEZpSXhLTXBGbEpnbEZGaXBXL29rODZq?=
 =?utf-8?B?b0wvNXJxSHVlWXF6NEl0eThyejIvOWVIRXJaV3VDZ3N0QU80c2Z4ZzMzS2hm?=
 =?utf-8?B?V0M2NXQ2UGlRcjNwT2lDSUZGb3R6dmJUME0xUy9uR3A5emNBSlBwT29tZzE1?=
 =?utf-8?B?TEVtNG5rdDcyaWpHRDRzTkIwK2xYczJWRmsxTEc2UTgvT3h6a0FvRTdEUUZi?=
 =?utf-8?B?UnAvOXRYQ2wyMkprdEgzZnYvSzl1UzFwaU9FU0UrU3QyMGFiSzZ3eldIM2Q0?=
 =?utf-8?B?dzRRNHRQZEhPMGlTUUZpQjhKSG56dGp0amNtc0YweHlpWkd3dDNiejBRdFlP?=
 =?utf-8?B?NVZIWCt6KzFFUzdWRG42eDVHK1Z2U3ZSV3J6ZTRjSnFNWDRoSXVYcHBnN3Bs?=
 =?utf-8?B?Rkl4K0pCRllhd21aWXhjMDJZSFpoU2JVd2xFK1lqcHd3TWFnczdnaEQ5UWw2?=
 =?utf-8?B?amxISVppek5JcXVHL0F0dHlFaTAyVGNtR2tjQ1IzYXdWK1ZZSWMxemMzWlB5?=
 =?utf-8?B?K09EVE02UlJSUVJXMGNFREpoOC9YRWdMNy9sYzRLVFZhVENsOUFSTVBlQ0x2?=
 =?utf-8?B?RzZYdU0vMlkxdWdRNHgzU0hxUU1yL2hiQStBY3pJSGRjKy9Gbmg4Sk9aa1Jx?=
 =?utf-8?B?T3FKOTZpS3pKWURxa290Mkx4cE9ERXBMN0R6b21kaExHQXpkT1NvYzVNWTMw?=
 =?utf-8?B?RHUrN2ptZURjMHZRYVAwWFMwRVJkOGdmS0hXTndOVENBazFxWEJxNzZ0Z3Nh?=
 =?utf-8?B?aGpPcGpjT3lBWjd0UUNHOUlrNUlYSkQrNXU1alFwa01qY1M4bUdQdmdFZUZr?=
 =?utf-8?B?MTllT2N5SEJoelNkQ2x3bzBhZSsrcWZGaFdhcW4yOHZQWDc3VmhHaVpHOVVz?=
 =?utf-8?B?QXpld3ZHWWNIbU4wZVgvR0loRmNDMVJoeDN5Z2lKL0doeDF3V3NHMklXZCtR?=
 =?utf-8?B?T0xNNnJaSE9KUnMxaFNjK01zOE9sQWNrUmJpeXJ4UGd3ekZzMnV2bHVtL3Fr?=
 =?utf-8?Q?r2p8zZs6e8o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?akYxWDRVMnFwTkQvaWs4aGRlcUVQZmh2dVJWZ2ZWakd2alNhaFRiejJrV3RD?=
 =?utf-8?B?RVVTZmJsekt1V1hFZGl2blpRcmFOYzc5YVRoR3J2YUhsN2h1clh5N1NlM0ZW?=
 =?utf-8?B?cU44Z3I4b1ZSU2hxQ3J5c0E5ZElwRGhLSW56MDdzQ1ZXTzk3bHY1MytWY0Mx?=
 =?utf-8?B?US9zWEpxZzFwTW1kNk9IalRzRDROamxWOGZydHh5Rm5zQ05HVWVhRHMwcWZZ?=
 =?utf-8?B?ZExDbDlsaHdwallZQWlaeU1DdXZlVDVYOFJYNGJGMU1xdU9TU2M4ZnAyT2Jv?=
 =?utf-8?B?QzVISmVkTktMM01VbTlLQ1lGcGtuSVBWK3ljSG5lQy9OL3QwOWVEVXg5dm1h?=
 =?utf-8?B?SzFKMmxYK09qVjVpR3JFallYdnZPbXloUjl2YVFqN3BkYkNHWUNwZGcvR3Fu?=
 =?utf-8?B?QlFCZmdWR2IrWkRjbUh5Z1NjNjN2TmRIV3FndjVESDJQa0ZvcTJOa0ZrWVRT?=
 =?utf-8?B?d3RSVHVFRXNWS2w1S2NSVlVjVmpXQ3NsN1N2L3RVTzhDVHFIZmsrZ2o5Vmxt?=
 =?utf-8?B?OVVjb3ZKZmtNZDhkby90SGd2ekduc1JyRmw0eXJWVk1idzgwYnBwdm5iR0tO?=
 =?utf-8?B?ekZGOG5WUm55ejdMWlIxN2JKUjdsMzltYzd0SmhndjVjYjRmVlNTV1ZYdFdh?=
 =?utf-8?B?QkFNdlYxMFFZZTFUamhCblBYMG9EZ2h0WEFWQlBhWmFFL0tXdnRYKzNwRkQx?=
 =?utf-8?B?d001RDV3NGJhNnpuWjdBUVZPelFWd1ppZStCUFV2TkZNZk9zK0Q2aHBQSDA4?=
 =?utf-8?B?OFFIb3gxMUo2anpCNXN1MnFFOUYwdzNyMWIvOWw1NHNZV0RqcWNOWFJoUzIy?=
 =?utf-8?B?eTJ4aS9BQ3A4TDROeFlUa05McGRsTm1WZHZLOG5tdEU1S1pxK29zOVdTM01w?=
 =?utf-8?B?b3pPNWJVK3MrUWhiVk9Vc1ArdjhtYzI5VStzdENPT0twQzkvN1B4RjhuY1c5?=
 =?utf-8?B?R0x5VkJpeDlPNUVjTThCTmxiVVlVR3N5WHdNM2VLV0JCa0dhT2t6OFpQbjZ0?=
 =?utf-8?B?RzNCYWMrMjlIYzkzK0R0SEsrZzMwUTVmZkc0amVRNVo2U21lZFVEK3poUFdQ?=
 =?utf-8?B?VnhTd3hHd2Ixbis0NjdBU2FxUytwdnEzTzdzL1hDdGQ3NDErSTdwbk5jcUpY?=
 =?utf-8?B?cGJqazhGN2VFdFBIQmhwMUZ2MXFVSk1VT0g3T1dQVXliY3NrZUZ0cjV3Ymhj?=
 =?utf-8?B?d2lvb3E4UVdIWXdza2l2RFpieWYxSDlKZnJxVUNrbEJkeUc4VzcyYUNqZURv?=
 =?utf-8?B?bzFBd2NTT3A4NlppbjdmY1RwdmZjOGtiNUtGbmlsOFRyMDdPS2dRbThGMS9T?=
 =?utf-8?B?NnFkdFNoRDJadnM1d1d2bzV2N0tHbXUxdlV0aWdueWZXemhia2VZWnlhcnZ0?=
 =?utf-8?B?QVJoK3hpWUUrK0FRemd3RVp1NmVnalhxRnlFOUZScStpV2EwQk0vR1B4N28y?=
 =?utf-8?B?WFBUN3gra1NZemNUME45Zmh2NVYrNWFhWWtyMFdneVQzUmppSi9vWjRmcS91?=
 =?utf-8?B?QldNanZmVnZIUlFrUTc4dnNTcWlCM0NibVBkWWtMOE54bTE1ZGd3Q2lteFNm?=
 =?utf-8?B?R3VVUkZCRk00SVhNSWFoM013Ynl3UndyeWE0OUJTZ05YaE02c3IwNTk3Qk50?=
 =?utf-8?B?WWFBUjNacTJVdmIxQXJyRnJoT3ZNd1hSRUtqMXU2SUZ4cWhTU1ZuVzlxRk9D?=
 =?utf-8?B?N2Y2TWJIeDFSZjFmWW5TWEZGL0JJMHJZemZYTWU2cG9aNjhSNU1hc1J6VHQ5?=
 =?utf-8?B?TEFBdmVHNWdHdStWVC9FcHdNeUxnYzNJZ3Uya1VCeWVnM2J4VVhsQ1F4SkRB?=
 =?utf-8?B?WEMxZ2hqVjRoTC9EbmpCT1FYekFTdkMxWk9zTHhLU2ZjQWc2RlVlN2pscHFD?=
 =?utf-8?B?Wm5ZdGxSTjNVaDJYb3hZMFY1djJuS1NUKy92MGVVSnkrcFBVMHZ4b2Rvd1h1?=
 =?utf-8?B?QTZadGx5YlpNelNvUjZtMXRWcHdGWDNodkk3eUlVMklQcHc0SWlvSGtnSlRu?=
 =?utf-8?B?NmlQMmErM2NMWHhkTUlKVzVib3g5SjZCSkcwUDFkZFU3WVR6V050clMzQXE5?=
 =?utf-8?B?M1RFSEo2WWhWeHROMWRwY3hYWEgrUnBWS2lTTVFTdnBZSzFSck1kRHJsU0pB?=
 =?utf-8?B?d0ZDNXR0UzNVcHV1NWpFMkJidk9ZQVdiU2tvOW9zWkhoWlRBcElEeExieUxD?=
 =?utf-8?Q?e8YeVAUXR7nrqZ+/lyJBKz88tmg7M5mlqINkujr1cJnA?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42c70951-24ed-44a4-1bb3-08dd8c89066c
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 10:30:30.5404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hhxcCsPJgNwZ70jHqjsg2a30sEc+LJgQfU/RZTk/KDawwAmWxDD/ZzYtbYTGPTbJ6IxYEESioyiR0TNtYc8P9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6211


On 06/05/2025 11:03, Aaron Kling wrote:

...

>> Sorry for the delay. I have had a look at this patch and I am not sure
>> about this. The function you are changing is called
>> 'tegra_xusb_parse_usb_role_default_mode' and it is doing precisely what
>> it was intended to do. In other words, parse device-tree and set the
>> mode accordingly. So forcing the mode in this function does not feel
>> correct.
>>
>> Also from the description it is not 100% clear to me the exact scenario
>> where this is really a problem.
> 
> My specific use case is booting AOSP/Android on Tegra devices using
> mainline support. Android debug bridge is configured to use xudc on
> the otg ports. As mainline is currently set up, the default usb role
> is 'none'. So if I boot a unit with a usb cable already plugged into
> the debug port, I cannot access adb.
> 
> I originally fixed this by setting role-switch-default-mode in the
> device tree for every device I'm targeting. Then I looked at just
> defaulting to peripheral mode in code. And as mentioned in the commit
> message, other usb drivers already default to peripheral mode instead
> of none. I'm open to other solutions, but requiring every device tree
> to set a default role doesn't seem like a good solution either.

Thanks for the background. I see that the
Documentation/devicetree/bindings/usb/usb-drd.yaml states that ...

   role-switch-default-mode:
     description:
       Indicates if usb-role-switch is enabled, the device default operation
       mode of controller while usb role is USB_ROLE_NONE.
     $ref: /schemas/types.yaml#/definitions/string
     enum: [host, peripheral]
     default: peripheral

Rather than reference 'synopsys dwc3' which is not related to the Tegra,
it would be better to update the binding doc for Tegra XUSB padctl device
to list this property and define the default mode.

Jon

-- 
nvpublic

