Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2079.outbound.protection.outlook.com [40.107.95.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516BFA92F;
	Thu,  3 Oct 2024 10:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727951132; cv=fail; b=M5MGWVSvw3lCsGIBXkJ+r11fOItuJd8eWgmY0Jlnnm9004U9oJQq+BimGz9FnGT+3rvKHBt5fZeeqvwygw0TqR/UTfHO9tUNRf9EIE9vMkmY+T/9NFQ2BdgR1rgqmawj2W36A1yzBVXFCxtQkUc9GOkF1+6UaJdSWYks7eKJGfY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727951132; c=relaxed/simple;
	bh=IiYZqFscoWtb/ktfJFKFPWguMtpAlqeuBKENIZedQeA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cnhTy1Yvbw1cjkzLAvgXC9AZ4GH3wUQfKio5CZloA2lxiG1RaUIpaNekUOpKf/d7f4OnYZa4oyo1EkVPP7Z/9vdfB/+X4P4ROy2r4R+UOTtQd5Zq31SEafyEKMviMsWRkm/a7lXSE/8AkTjEQZwWOvvnwxyP10UQMIqUUmdtamw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sydKAEtQ; arc=fail smtp.client-ip=40.107.95.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sydKAEtQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OWC0tyfsUpvNtcYOMYeJEVETxk0klLgyLv8FhEKAAKcFMUmitZw7RQgVGNsUU31gSwJ1wBHlz7tLEyP6unv7BafIgPyIh3LmfoOTghMjOINyf0cSVS3yWVXIhgH3Qy/I/cBLgHXSyvz03Cv0eZvb0luHwx2GociAvMd6lwU79aRo1OxXkQdSZz2Le++Qr/MY7fmflV8Ononvn4uftLm8O0XcPttAVtZB0MZyxmx8XDOXIp5Mbf874DsPt76CBDtj5WaXbmGLt3DQHpKh5T+8U0U6jYpkI1apaRGMzW7Mj/LDICR0MgObh0Xx3veaqCQV4veFBTaoDve+YAnJYZM2Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gDowydLLQsJyFI/HYKBWwlbbaxuXPYJ3vrgG7XbE4Mk=;
 b=Kmud3fuy5bFJBp7QB7L3+sPb6pOMzCgRYDL4PWOj9K1nRJWHpPto02H+lNNXVTZmiqKykfKy7z53esER+CnOD6jheoFxnkIEq1Aq2iaLLRU3TSt7lXX8UzPizzPIhlLPwKYuPrhuH1aDRWaOFeEcYvOoV/PO4yo7EB68ubDJm/MDfAwR09FX9IZgID3osiQKWY28ykG3dOt7CsvU+Gwh8e1EyPw0DZJ5+3rCglwDqmpm8nb78NArvg7sF3EpqD4zIJ5aowoU6tP1k77nwhUoaWy7a1XunsmyS7gwI3TeQkX8SQ5Y9bAVrOlDbA/s/GByncSWpyJJrD+FkY8XQv6PaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gDowydLLQsJyFI/HYKBWwlbbaxuXPYJ3vrgG7XbE4Mk=;
 b=sydKAEtQpR35Hyfe9zIGxGNBbDsrKdgZxbGgergrrGsMbHU29Xneutyu14LmS/BmNllFHXwUM6JVIiBzQwdwckZQVHvteP/hqdhN1OIvzxER9yDdTzh8Ke3xsr3qUIXzFUsQxeCcboyr+KrSF0+sCshiAWJ/CJ5pMU6h509nYG5K2tQRmBW8RryGsQgs+hMkhAAZoIPf2lzdkqXDZNC3/LpLtPjfbdnQ2yoMFB0wU2NfXg/FTcRX0babQvaH+q3EYFflDjjIinvE5kybprRpvg874HF5RQholwQlsYmTlnsw+lQVdSCRbpotmIkLFBZ8Z+b2wplizSQsflsFmWGmaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by CY5PR12MB6370.namprd12.prod.outlook.com (2603:10b6:930:20::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 10:25:27 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%5]) with mapi id 15.20.8026.017; Thu, 3 Oct 2024
 10:25:27 +0000
Message-ID: <2c42677c-5e8e-4805-b6a5-0a5baa3e55b5@nvidia.com>
Date: Thu, 3 Oct 2024 11:25:22 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] driver core: Don't try to create links if they are not
 needed
To: Saravana Kannan <saravanak@google.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20240910130019.35081-1-jonathanh@nvidia.com>
 <2024091152-impound-salt-c748@gregkh>
 <d89c89f8-0036-44a4-8ffa-ea89ed576a9f@nvidia.com>
 <2024091627-online-favored-7a9f@gregkh>
 <b1b67db0-3b9c-4d96-a119-fe3fcf51b6e3@nvidia.com>
 <CAGETcx8E9FddpwMO4+oqeEc0RVMLbUOs2m+=B900xzrLvEkSXw@mail.gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <CAGETcx8E9FddpwMO4+oqeEc0RVMLbUOs2m+=B900xzrLvEkSXw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0017.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::29) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|CY5PR12MB6370:EE_
X-MS-Office365-Filtering-Correlation-Id: f9ad436b-ae4d-4c74-796f-08dce395b2fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Ni90NUxUeHNCYVI1K3ptci9TOXREZFZsRzUrTEY1NkQra2JQdWZVaG54RXZs?=
 =?utf-8?B?djc4M3RWbitSOFZOc0dGa3pHa0JuamlhMEVydkx3VVdUZGxWZTZPcExuOFVZ?=
 =?utf-8?B?U2hhZTBTYzY4TFpndXZ6VWx4UDZTUDRoVm41WFIwRWRKMlo5dG54dnpaQ0ZZ?=
 =?utf-8?B?Z3cvVWFHN0N1TjFXbFl3ZzRlMlRpNUQzcUFXOUdNRlVGK1Z3Z3cxSTAwVklu?=
 =?utf-8?B?R1VBamVHMHVXZmNQZDhCNlJjakRONCtVcU9rWmNwTU5naGRNMGF4V2U2ZUo0?=
 =?utf-8?B?U1hjOHY2V0VlUkdMaSttRngwYVlabS82cjVWeXZDSEc3UHM5dDQ1ckFjdVMy?=
 =?utf-8?B?R0R0K3RoUkozWmZkazJRT2FYMlBscW9tTlJVL2VaYTg3TTFJNVVram12TFdZ?=
 =?utf-8?B?WjFLelBsNnNnVGVTNXA3WlV1UDZYT2lPV092dm5DeUpSWE1hNEt0VldEbkx6?=
 =?utf-8?B?RlV3Sk5qNU92YkRBMmU2c0s3Z3h6U1RDYzU5eEpZb3p3amRFSU1ZK0J1VDIw?=
 =?utf-8?B?VndWbHMybDQ3U0g2ejVBUmtlSjRlNWY3cnA4N0RNY2dBRWpFb2s1R1VwTVNQ?=
 =?utf-8?B?T0dieWthWXV4VFZmUGl2dDUwWkZSU2Y5N3FlaXRvTEZOdHg5TVYyVTZ5N3Rx?=
 =?utf-8?B?ZWhDSEU2U2t4NlFkVzVVTE9Ham95a2pSSWlXNEZzRkY1REpIaiswQlJpN2Rw?=
 =?utf-8?B?a3Z6RCtsNTBxaHI3ZWxUVmhFTTVWVzBwL2lXMm1IZE56dkVRSzNLakl0ZTVE?=
 =?utf-8?B?RG1rbmdxRlFNL0JTR3FhQmQ4eWQ3cHRFcUxSR0Jna0JCaDg5b2kyWDY2VmpC?=
 =?utf-8?B?d0ptN2h0TlJxeU9Uck0yNVM1dW9YYnA1dCt4VHJPaUVvaXJocU9jYU9UWE9D?=
 =?utf-8?B?RUdqQi9ZZjBONzN3YVdRL3FOdEJ2THpOR1JBN2xBNmxRRkMyYWFvM1h5VE84?=
 =?utf-8?B?QWRYL1U5dlozdjNoVlZMMGZEVmJJamtXSnpRVGFhR3ZaRmQ0dDlUdUlmRkxP?=
 =?utf-8?B?MW80ZEp0S3BZUk9HNFY4c3dVNGxhaFR5N255SnI3QjJ2VzFjYnRsSU5BY1No?=
 =?utf-8?B?bEZIaFhQYkZ0R2F2eGJFSXI4REFQa3JhZnpVZWp3YjkvM25TanhXcGd0VGZL?=
 =?utf-8?B?SlFGWTNYTytjOVVjRnRnMlFmU1NRM28zV3E2Z042eDFYaWZTR0p1MCtIaUVh?=
 =?utf-8?B?VEp3NUgvV2daVkJJQ2l2UzZrWHArQkpPM2M1eW9Rc29KR21BNlkxcU13Q3BO?=
 =?utf-8?B?LzA2MzhRMER1RU5sb0VaeEhtTFVzNVZmUU5NckVMRzFRcEFHWXlJaEdrazdR?=
 =?utf-8?B?eGM1aHFya1ZxNytaWGw1V0dyVElkMHIrL3hWSzFhTm53b2ozbUJKQVlxaUpF?=
 =?utf-8?B?aEpMT2U5UXpYNGZ2RFd1OGJqK045ZUh4SnpGMmtNRDNqYnIyNmRmeGhudDlr?=
 =?utf-8?B?U08reE5ER291YjRnRE9VbDdwQ3RlcE5nK0x5ZzRGa1d6NUxRSDYvY3RQRGFu?=
 =?utf-8?B?dEI1aDEyYWFScWlsOGNuWk5oZlJESERrWGp2TjlVTDhFWXlpN2h0TS9qd2tB?=
 =?utf-8?B?MHhmMUFBUWdDSi9zNHFZLzRsMHd5UWhqQXFCYllNWnh4VVlvZGFLV1VlYmVv?=
 =?utf-8?B?YVF1cDZiYTdkSkZxVE82bjNEbU05QjJLTmpFdmNQWWZjdThPbjdXV0ZMZ3Qw?=
 =?utf-8?B?TTRqSmZGaG53N1hYeU45b0Yxa1l1M1ErcUxpSDR1U0hTN25rZU5iNCtRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bExLWTBIYTViem9zdnU4YXNYZmZMNFBZZU9rQTEvZkpjREl5VUExSnZ5U3J2?=
 =?utf-8?B?em9hZUxHd2U1Z3hibCtETjltNXZ6MFhWZVRXVER3a0xMTmZQa0RleVJTbkRK?=
 =?utf-8?B?ak5DUnpFZXlja3RPNFc4UHhwZCs5QkdNQTVBS29kUVRXMllVRVpGT0NTQWFE?=
 =?utf-8?B?SVhBdUc1R3pJK0JTYURmZUtSeHBNaUNwaStEVTVGMHRaVjVXMGZFZlhoL2R6?=
 =?utf-8?B?citqVlJRb2hQNTd4YVFxc2hSbkFQZmVEWHZDVjc0Z3g5cFNvd3J3QldrSDFz?=
 =?utf-8?B?Y215M0pXYm1oT2dYeVdxMFFYdDhUQVk5V1BXZWFRMFVTbDhjVStkSE4vd2pE?=
 =?utf-8?B?UEdCRE5wOXNPYko0NXJRTFIzSEkvZzh3cnhSM3RCNFNZb0x6ZjlqQjlCSGpD?=
 =?utf-8?B?LzBFWmhhWkp2azF0OU5FMCtqSUdZY0oxa0xYZ2QrbkN3bWdrdWJmSkhWSG12?=
 =?utf-8?B?QkV6czlHbzRWQ0hYVzZxdnE5ZTUyMkV1TTc0a3U2UDBDVnJLNkpENEZXRkpN?=
 =?utf-8?B?bUpqeUpzQm5JcC82NE5OcWxkM1l2QUFCMVNRckRsVFJkSlRwVENlckxhdmhj?=
 =?utf-8?B?bU5oZEtISGRPUHI3ZWt4Tjh1d3M4TzlRbnZYK1h1YTgzWTBBb0haL0k2Yk4z?=
 =?utf-8?B?bExnbFNTL0U2dVkvdVA4VWJtSnJTYmVkTVJFOFlMaFVsY0JQcWNJM0NmL1U4?=
 =?utf-8?B?bnArWlFuSFBOenh3N0V1cEVxU1dWN2xZUHFhUmVJTGk4cXdNWE1NdUp0SjRK?=
 =?utf-8?B?cXZKeUl3clhnV1dLa3UwaTBPVExwWVhiYTRlQ3Q3TEF0am82MkVzYUNHZVlv?=
 =?utf-8?B?U0dyNFVvTW1BUFh0NHVhTWRZT3pIcVFWSDRBMGNPMXA3aWtvWnQzaVJHdHF1?=
 =?utf-8?B?M0I1QVNTaVUwREVCMUQ1NUd1VncyZkJETzJmMmFicmRETTdQMkp2Q2VWMzVK?=
 =?utf-8?B?MXNZM2ZVVkdoQ2dVbitOUW9BcEJ4bVhPSE1DZ2dFcTFxK25SNThRTU44azVN?=
 =?utf-8?B?dC9TYkhkWmloeGlRR3E3bzZKMnJDeWJRQmVZMGZ5SnZHdlgydStRUTJIRitU?=
 =?utf-8?B?aHgxRlFCaklURU9yd1QrcTZLelkrRm1scUptNjV5WTZ6ZkVkWlRYM0F0VEdq?=
 =?utf-8?B?ZWZsMWkwSEVyaGRBSXdhUXpmSEEyNDRjek1mZ1FMTnowWDFsa1dUK3gvWTJ3?=
 =?utf-8?B?c2ZuRHBYK3J3MkJud2VabkN3MVIxY29ISFVRdDM2VnpGYU1ZTldsUnNCV1h1?=
 =?utf-8?B?Qzd4N2FVSERCWUVsSDdld013UHkxLzI3d1dwRlBuZDZCaHZvRW9jVWZQUmZr?=
 =?utf-8?B?Q25ueWdSK0lHZElIMnRYTDFoRjVaTXc4RmNRMVhXNDc0U05UUDJ5Y3NhUHVX?=
 =?utf-8?B?RzlLUDl0aVhzcndrRGt6dTlDTlF1anZOU3JTTXpwOEJvZi9FOXUzQS9nSFk4?=
 =?utf-8?B?cGRycVhoQU45S0J4bVg2Tm4vNHlqaG53bTFZbk0zakdrVFhBUmp4TWxZVkFE?=
 =?utf-8?B?cTlwaFJzUGJrL1dzdTU4bXpGeS9EYjAxSkRiM0pIVElwVEVNczJsa1M2eTd4?=
 =?utf-8?B?VGtiZVpvQXd2SFpGOUhEbWQ5cnVCbVhlZWRnaFNSeExSUkVXVlY3YXd3cm14?=
 =?utf-8?B?ZWZkY3RNc3REdnlEd05TZzNxY2NvK05ZN2ZkWmkvRkN5ZVVaY00rMGNlb0tQ?=
 =?utf-8?B?ZXQ2dU1icDlqamVJaVptdmtJTjVNb2J3dDB4MnpzdmhsZ0tpQk5RejBRNkVv?=
 =?utf-8?B?Yjk5RSthVnl6K2FUYXNZamhUR0I2dGZvRmh6bUpoaVdlSXp2MFpGdEUrUVlu?=
 =?utf-8?B?WU9tTzlERzRYbU1iUmZOcjI5ZVRMUStWaERwYUE2TTFjZ1RUaHZBazhod2xR?=
 =?utf-8?B?aUltS2YrYit4OU9xdzVSN2s5SktIMm04ajFpT1VPcTJCNWJXbGJKYmtwNHUw?=
 =?utf-8?B?TzRvVzVVRmJkaXdQQXNuQ05vNTBCVkh2Uk9Yemh6SkNlemhmMGl6WUdsRFBh?=
 =?utf-8?B?WHpRaDBPdkt2WmhiSVgzWVR6bmNPNTNvUm9KeEJodVEybHRqSUQ5b09vWjEv?=
 =?utf-8?B?d0M5Z1ZWNWpVY0dxemdmMU11MVQyRU5hMm1TUEYwdDBmM3lqQ2pTcGpxNjNQ?=
 =?utf-8?B?VUhVUlZYeWtIc1Q1SVg4UFpXa0E0M1UzNHZHSWp1TEN3cWd5TjJLVk9UQnAr?=
 =?utf-8?B?OWQ0UUt5bG5QZWM1MkZHeWN6a0dGQ1FvYWF6TlA3MEw5bnZQeUVyU3haN09J?=
 =?utf-8?B?UEpKK0NOTFUweFlNZmFhTDBpNTVnPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9ad436b-ae4d-4c74-796f-08dce395b2fe
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 10:25:27.4581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TbmdCBzOFaGon4aux9t9HZFPoTmD8oCIKtH6bTtghitaYPzVeYss7zNkroYbyFXdNYfSMbgOFT9Xgf7zdWVdHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6370


On 02/10/2024 21:38, Saravana Kannan wrote:
> On Wed, Oct 2, 2024 at 11:30 AM Jon Hunter <jonathanh@nvidia.com> wrote:
>>
>> Hi Greg,
>>
>> On 16/09/2024 18:49, Greg Kroah-Hartman wrote:
>>> On Mon, Sep 16, 2024 at 03:50:34PM +0100, Jon Hunter wrote:
>>>>
>>>> On 11/09/2024 15:32, Greg Kroah-Hartman wrote:
>>>>> On Tue, Sep 10, 2024 at 02:00:19PM +0100, Jon Hunter wrote:
>>>>>> The following error messages are observed on boot with the Tegra234
>>>>>> Jetson AGX Orin board ...
>>>>>>
>>>>>>     tegra-xusb-padctl 3520000.padctl: Failed to create device link (0x180)
>>>>>>       with 1-0008
>>>>>>     tegra-xusb-padctl 3520000.padctl: Failed to create device link (0x180)
>>>>>>       with 1-0008
>>>>>>     tegra-xusb-padctl 3520000.padctl: Failed to create device link (0x180)
>>>>>>       with 1-0008
>>>>>>
>>>>>> In the above case, device_link_add() intentionally returns NULL because
>>>>>> these are SYNC_STATE_ONLY links and the device is already probed.
>>>>>> Therefore, the above messages are not actually errors. Fix this by
>>>>>> replicating the test from device_link_add() in the function
>>>>>> fw_devlink_create_devlink() and don't call device_link_add() if there
>>>>>> are no links to create.
>>>>>>
>>>>>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>>>>>
>>>>> What commit id does this fix?
>>>>
>>>>
>>>> Hard to say exactly. The above error message was first added with commit
>>>> 3fb16866b51d ("driver core: fw_devlink: Make cycle detection more robust")
>>>> but at this time we did not have the support in place for Tegra234 USB. I am
>>>> guessing we first started seeing this when I enabled support for the type-c
>>>> controller in commit 16744314ee57 ("arm64: tegra: Populate USB Type-C
>>>> Controller for Jetson AGX Orin"). I can confirm if that is helpful?
>>>>
>>>
>>> That helps, I'll look at this after -rc1 is out, thanks!
>>
>>
>> Let me know if there is anything else I can answer on this one.
> 
> Hi Jon,
> 
> See this.
> https://lore.kernel.org/all/c622df86-0372-450e-b3dd-ab93cd051d6f@notapiano/
> 
> Ignore my point 1. My point 2 still stands. I got busy and forgot to
> reply to Nícolas.
> 
> I'm fine with either one of your patches as long as we define a
> "useless link" function and use it in all the places.


Thanks! Yes I am also fine with Nicolas' fix too. I quite like the 
dev_dbg() in Nicolas' version. I was wondering if we should define a 
function for this check too.

Nicolas do you want to update your patch with a 'useless link' function? 
I will be happy to test on my side. Looks like you identified the exact 
patch that introduced this and have the appropriate fixes tag too.

Thanks
Jon

-- 
nvpublic
