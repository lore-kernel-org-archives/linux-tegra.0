Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011040.outbound.protection.outlook.com [52.101.62.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23DB3161B5;
	Wed, 21 Jan 2026 09:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768986730; cv=fail; b=bQinb++TM4qOS2NB+JRHtLbZxVj5XGxUkP9PfCxOkifAL8+LmeHUUH0x/9HHtsr3jP6Nu2XDuWIGYRlcIZl3zLozm29o1v+bP9UUBGJOXTsp1FUJ6hPVvUM0chtuBIq5YRql/65uFRop/72px8WlBDUcFKPRLJx6tN0vVhPZ+xw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768986730; c=relaxed/simple;
	bh=9Qf7V5dPIZdZ3yD/FSIVSERLf3A1uV61XwZsKLi++cE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qcf9kaGv/IgAMqROKny6CUglfVHNy2mQfwd9tp7r/mFhvdn7/EML6vAE1eSwsmGAApQxJFP7Yvn+FhE0xQ3HBcn6fjomsJalHsSKbY9zhGgRkfbsEwSZsj3Y3dZwGniW0PTTkXOnnOgI3gSKoLpaPMcZIkTyj5CDrqJB1sR204g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=D/fTh6l0; arc=fail smtp.client-ip=52.101.62.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="D/fTh6l0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yOR1/+U+K+GAawCjtFD0bNuTCxq2I12hzVvjEGXSYHtE3RdF4fa6CMLSeToj/jaWCbfuwz5GKzsWD/3337/iY3MAiHy9+YZtEt6Xu3rYqxHAYdcu7fK/J73kJROaVHV/CCy8tHJ0DmWVONEEnLjJu2g+lfy4hKnQM+l3S0sb9MntprBKP6BaF0vn63tujhKYzeyKZmCYfO/xwCt87ZXxTjUFP9D8FMRHuK4VlWQ9s+WwRox24JVnYPIGQMYLtYdOw/SJJfuvxVcGSxdmsu4L9CmDZCSVKYV/fpOh2xoMwcF3yHpQ2nKHYsqFEhOD2PnoJwt7B00b4pBSfPvEpRHW+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DcfGOizMwbHNxYC7u8k31Hhy79clvYyJ+oq9WbDoy+0=;
 b=yfQ+lcBiJ+uBB/2bL0NDTKINEpgTDuadXPr3mLoThFB+tTGm5wB4mH4SIC25fMi70UI5pe4drdqyus1YTCjOf6UZeVOjz0zcbef6l2dJ9spxZThcToFabHKrCYlLx7zanYrM+ab80UWGfmziPkfXjy/oqd8hJlw7767Wu5nhq8sh1ucMpbqURboFtO/rLDwR2A3vh7GNt+oXM9iKPlErMYXqHCDe2gz8ZrRREjl2pZuZn117XfyzNTqE1PymCNs13Lhx3gb/3rokmkXOedNXRQWcaeffjJuEwS2dux12AM0YNK6yjZy9x9fMn+4tjFAisT84fSY7xhPOK2/AuJNSeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DcfGOizMwbHNxYC7u8k31Hhy79clvYyJ+oq9WbDoy+0=;
 b=D/fTh6l0pCcrP69SM+R3Qvu+UdVK0jT/GtrNu5lQPY+DQDgp+H14crvNTxHmX9L6Jc0vUlKqyqf3UUbFO8tejnbW8HFbB+hyT9fVIhrteQljc3iIm2IQyLnX+MOz3vNqfgQqK9PfecMbDicpGd4JzevTIb59g7Q7VoQYSVtptodUvdfIv0X1Pxk4s9FOuHXOf/AM4nwKpTGKfrYL8Bp3eRd4ubLhI5AhwVPSGLHGnJ1r2IStxIxI2GlD/n4z1Cws0J9hjmUnOl8BZylgz3+OQhnr3uvoCGkmx6M/YSqQwQ5SlNRzakM4BeNXFFHX78td+7scy3dDoTzS2+w6Ba2RcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5716.namprd12.prod.outlook.com (2603:10b6:208:373::14)
 by SA1PR12MB9248.namprd12.prod.outlook.com (2603:10b6:806:3a3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 09:12:05 +0000
Received: from MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::bac8:2b43:2a64:4c76]) by MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::bac8:2b43:2a64:4c76%6]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 09:12:05 +0000
Message-ID: <c3cdece5-1bf6-46eb-a668-2ee2a4358a88@nvidia.com>
Date: Wed, 21 Jan 2026 14:41:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/4] i2c: tegra: Introduce tegra_i2c_variant to
 identify DVC and VI
To: Andi Shyti <andi.shyti@kernel.org>
Cc: ldewangan@nvidia.com, digetx@gmail.com, thierry.reding@gmail.com,
 jonathanh@nvidia.com, akhilrajeev@nvidia.com, smangipudi@nvidia.com,
 linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260113165929.43888-1-kkartik@nvidia.com>
 <20260113165929.43888-2-kkartik@nvidia.com>
 <aXCVSqvkK5PW55t9@zenone.zhora.eu>
Content-Language: en-US
From: Kartik Rajput <kkartik@nvidia.com>
In-Reply-To: <aXCVSqvkK5PW55t9@zenone.zhora.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0127.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b1::7) To MN0PR12MB5716.namprd12.prod.outlook.com
 (2603:10b6:208:373::14)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB5716:EE_|SA1PR12MB9248:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e0574eb-3696-49be-1b9a-08de58cd250c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NTdNV3RneXA3NElteWpMam9KTERhZjhaUFlURzRwREhBK3V4YVRwSzBGYkl4?=
 =?utf-8?B?azUzaDEvVGE2WFgzZ0ZzREhlMWRXcWhscEpjWE1RNW8vS3pmaTBDbW8ySjdu?=
 =?utf-8?B?MmxUK0VNSk4wVm45eDZQOVJRWkVkT0R6TGVXK1ExTWs2YlpSeW00cWFudTRl?=
 =?utf-8?B?VGRFeDZPbnI2aUcrR2ZVZFBrRWZLaHRDNk9ZODcxbjBXL0tTandWTmQwSVIz?=
 =?utf-8?B?SEV0UU1SbmZmVXAzdU5LbWxqNGQ5TEZabE52Z0pieFNCVzd1alBQMW9Eb1F1?=
 =?utf-8?B?UTk1Unp5Q0lUUU4xays5NXM4cjdpRFdSQ0k4TWFpeCsrVzN2ZkgvMDZqRFVz?=
 =?utf-8?B?M0FCNHRUR0svbEMxWFd0SW1VTkhveHBTN2hLVklzWk03TUF5WitiVUJzRldl?=
 =?utf-8?B?d1dWeXl1Zk9VVjdYc3NqV2p1VnQ0NUlHcjF5blZKR05vS05WaHZxdEhvU3Jj?=
 =?utf-8?B?VFVObVF4N3ByK3UySE9XamNsZ3JTRW4vYkV3SEhYdWpkWng3ZEpvaEZ2RUwz?=
 =?utf-8?B?UGZoTGhVTUVLaHREakdZTjRwRDFzNzh3a0VZTDlJRjc0L3Q5ajRHdC9Cc3gv?=
 =?utf-8?B?dFJidWRjZUhoK3VUZnBwMDFreUtEMlVadDZyVmZ4dXFaOWMwajY2dm9sSW92?=
 =?utf-8?B?R1piRlZhRDdaNS9pT3Z3RlZNUDlNTjVvZ3dMYzV5amtzRzZrNzF1UmtsZVNI?=
 =?utf-8?B?R20vVGVoNk1PRDhIL1EvZlVvcXB1dWVYY2ZmQWdML0pFcHVyNVZUMGdMVDB3?=
 =?utf-8?B?T29MeGRiWXF1UC8zakk2cnpZK2YveE1Hd0srSHh1a29aa1UvUzBBZzBQNjdM?=
 =?utf-8?B?V0VadTlaNURuZGltSWRxMFpiNDNrL01rcmgvbExkSGxzajZqVXdDQ1dKczZI?=
 =?utf-8?B?NnFTUkxNSndPVnNFM0dvaytRTDlxUVJwRE00STVGU1VTUkFWZTRKQkxiTVpl?=
 =?utf-8?B?R3dkbkwxRGgzdnNsM3RnMFVlOFpLWGh2dytOYXZNVjFpQ3ZqYURjS0F5MmF6?=
 =?utf-8?B?am9Vb2xkUTd3eDNxNFc5SVpQejJyeVpnY2RkTVIyOGU2SXhzYzIzT0NKQ2x1?=
 =?utf-8?B?aktsWWgwbFdJdWEzclJYSDlDSXZFdGIyREx5anljSjFVWDRwakRUVXIzd3JW?=
 =?utf-8?B?MjViRVFHMGN0c21QM091b01qbm5HV2hHSDJKR2J1K3d0ZDdobkZ0QXA4VFBy?=
 =?utf-8?B?S0F0OVdncGJGaEJJMVFCUjhGU2t3MkpmanBjOUpKcDBlMWg1QmpETWNiSWY2?=
 =?utf-8?B?V1BQSTljN0dOK2tha3JzMVRsS2FEZ2ljWXdzbGtyY3lqZW1PMDlCbTV3S3R1?=
 =?utf-8?B?Z05ZeGZEODlPQmk5NmtKa0FZNFFxeHVmS0lzYnFJZEdYeTVrZEh4SHI5c2VZ?=
 =?utf-8?B?dkVoZnFjU0xJMDhUdTREVklNSHo5emRES0Rkd3BpakRSdDBnOFczOFBsSHNz?=
 =?utf-8?B?SWNORXRsL1cvS1dlZ1VIbVZWSWZmVS9yRTlRTkg1N1dLWUV0dlB4WEJrVk1o?=
 =?utf-8?B?NFk5WXN1N3Y5STBCUXY4QjlMY0J4SVkwckhMNUc2WlBGRXhXZlRDZEFzL1ZO?=
 =?utf-8?B?aEhEeTR1eGt2UDczcG9udFJydUhYM0lvVXd2d2QveTU1ejV2aVkwbzArNE12?=
 =?utf-8?B?VlFhcWJYRXRxT2EwK0Q3RStJSkt2czlMMit0bklOTFBvK1Y4eTQxMmlxQm5O?=
 =?utf-8?B?MS9LZCtHc2JtQ1FaTHk2Rk80QkZVRzlscE9KbEJwaWFmRWp4RGQ5RkgzWHBq?=
 =?utf-8?B?Qm4zYlFRREwzNzNuanJjMlhkNHNHU0ltTlgxNEhRR1RKakRxVm96NTJpcTB1?=
 =?utf-8?B?QU05dTBNM3NJNlVPaWR3bnNKQ1FCem82cjRkemxvTzg2SStXckdySCttazE0?=
 =?utf-8?B?bitPQ1h3U0NxZDFDR09BTnl2SDl3akp1RjczUnZ6Si85SUpMWVZxUFc1eW1V?=
 =?utf-8?B?Q2pNUzhEQ1ZIenJWMldQT0NDbzE1TmE1T2VlKzBYTmpnU2NidFp6M2ZNUDM4?=
 =?utf-8?B?cVRtZWVTZnlLaTM5RVhKM2o3WlhLbTV6aFF4bVNXWk1QQkhReWF5Vk4wdjJy?=
 =?utf-8?B?TTEwbFFyeTBRcUhHSEhua2pHcU5BZThHL2xqVHJQK3M2QXBNT29HRjRsdmFI?=
 =?utf-8?Q?2il4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5716.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkhSc2VPbndxY2tVYTlvN2Z3MkFPQXAxUkkxS0tjY21SZ1p4eWFpNzVIczV0?=
 =?utf-8?B?Rkd6MjRPSlNpUnlUM0RBS2lzR0hHOXFFdzJjaUh0MUpxV1JucSt3eXlnU2kr?=
 =?utf-8?B?TEs4Y2RkbWM0blI0djNaWnh6RklZMXRWZCtQR0J3bmtsZ2Y3TG1HdFE4aFFM?=
 =?utf-8?B?Sno5ZGQ4VnVHUk5tZTM1T2w2QndiVU5lcjRvdzI0UnJNWHVQRUludGxjT21v?=
 =?utf-8?B?Q1BCZGt3QjQzRnkxdGhtbXlFazlHc0czK1F0dllRZ3ZCMmhSVDFoOVpoazJQ?=
 =?utf-8?B?M0EyMDVuSmhVTFdPUXFZWmJpZVJoZFVGcFFBemZ1QXRjZUlvQ3FvY0xiemhJ?=
 =?utf-8?B?TnB4UnVOVTlCR0txWk9KKzB0WGJPcjdpQTJOK0Roc1ZsazQwWXlNazh0cC82?=
 =?utf-8?B?UDQ4RWw5Q3pZbHZUaGZZSmRnNGdnUHdIVzNEVktnZ3FNSEhDbjFoRHdKbzY0?=
 =?utf-8?B?amNHdllxRng3d2tZaGRrbThjUHlhMDB5M3RaQksybnVKUUFJbjl0TDhmUGU3?=
 =?utf-8?B?SGdxaEdFN1JnQzNsTGljc1FQZDVqVWJMbEhON0U5M0lFSUIrYzFhaURnU3dv?=
 =?utf-8?B?VlFNNWxkdFJudmZrdldhTXJqdlFoUHJ6K0hvRTgvWnNFNm4xT1RrU3NwOUJK?=
 =?utf-8?B?YzB4Y3pndDlGQkg4ZnExbnVYN1A5VUVqMTlQbytRdlBnNlRQTkp2S1c5ZE9V?=
 =?utf-8?B?Rk9ES2EvWVMxSzl6Ky9MSU95R21jZlhxLzl1aW5rWE1vOEhRbS9RQWVuclZV?=
 =?utf-8?B?T0YrWjVGd2ZDUnF1MXRBanI1aEhHbXByYVpqRW9GNWplQW1WTElPS0VBckVQ?=
 =?utf-8?B?ZFJTdFBHMHJCYXRxUE1BUERlVWJaR1lXaHJqNk1IUXliaHhOK05wbVRGdXh4?=
 =?utf-8?B?YlNPQUdMdHJWb2kvSlR6Tm9OV1JJQlBLc0YvcmR1S0x6TkxtTkI4UXNWMWdj?=
 =?utf-8?B?S3BocU9vTTVRK0RrKzlyckZYZVI1VXpJZGpvdTNkRkpXTS8wS0M1RndJTVBF?=
 =?utf-8?B?QU95bnFvQkN5WVRLRThXUEUvM3dwSWt2UzEzcTNqQ1dubE5qc2c3bEN5TXEz?=
 =?utf-8?B?c1AvZ0FGK2UvSXBDQytTbU5NcDlzbGFZdCsreHhRdmZRMWtiQThCREQrenlF?=
 =?utf-8?B?YUxFOFFGSTRxQVJvMUk2cEhHWm1TWXZDL2lxQTZKZkkzaEtSTXlQS2UvSUNG?=
 =?utf-8?B?WVdZdlZyK0NKRS9xMUR6a0hnNUN4eW04QlhsLzdXa3VLL0RTU1dWME5SNDJS?=
 =?utf-8?B?NVg2MmhsdXVqQlZYSE5WZEZpblU4QmpabXNLN3ZOL1ZzTlhMZFdmUXpCQVJW?=
 =?utf-8?B?OHdFNTJrNU9yc1d3UndDZklNRG1iUmZDWHc1NytxQWN1dWdwakhpK2V0STBW?=
 =?utf-8?B?WFpISm1Kb04rZHFKeTd6bUJKVGJRdXd1SFZod1VXRCtGeXRyc1Voa2JOdldi?=
 =?utf-8?B?R0pVWkZpd0RXUmZ0OVk4akFlN2RIRGcrdVoxcjdTVHlVRHc1aVRCaFJJK2RB?=
 =?utf-8?B?WW1KekJCaXJORENHOVhRY0RxNjkwbWNMSEJjbzNMWUx2WGJXc2cwdFVWVU9T?=
 =?utf-8?B?L1NkL01xaHJMcVJvVlloUDRNVjZpSUVRaGNDUWN6MFlFUTVPcmY5TlpYdTRh?=
 =?utf-8?B?S2dZYVVaaUlBWC9pNXB4ZTNEL25PU3Z0ZzZKTW9DQnUrRkgwNmJQcXRpcTdx?=
 =?utf-8?B?TGdCN3h3TTVnQmFOTTZUejlRQWxIU2Z5b01nZTNtb3FBS1EzZThoZDQwZWMy?=
 =?utf-8?B?aTZ2NExkR20yYURtR043dFMxTlc5RTU1bVpRS21rK0JTL3pxWUNLYTNvTnlm?=
 =?utf-8?B?dC9sU0Y3SHpNRGhPU1ZaWEZJWiswdDYyVUhlcE1kZVlGYVpnSlIvenFhMkxy?=
 =?utf-8?B?Qk9ZRkNZd1ljQ1NPbHlNKzJKMzY0cnVObG5pZEp5aDcrbEZlWmppNitIbTQz?=
 =?utf-8?B?Tmt2L2lSeTRqWW1FRTlvNVpaR3BtRkpheVl6eGl0WnRPeE5rZHIrMzE0ZDZ3?=
 =?utf-8?B?eWFnM0cwb3lic3pjSHh3NFUwVCswOHd5Q3NIVGFPaVgxeGFoVTdVb0RkU2Z3?=
 =?utf-8?B?a0s5Q0J0Vkp1Rm5EbzhSdm9VbHlTZ0JsWTQ4V3Q4ZkRpZlpVQkw4L3FadnRX?=
 =?utf-8?B?b08yWlBodmZyaFNqazA5eTJqdkRsdEliRnh4V0JiTU1qTTlOcDkxbzZFRDZk?=
 =?utf-8?B?OHZ0eEx5OUpYbDkyeG5KMFU4dHZMbkM0QWl1QVpxK2lTclVxbjZIam9YTlRY?=
 =?utf-8?B?NjVaMGpmemt0SWRtTWs2dEJESjJsT0doR0kzYjRRNnNGM25EbG5WL014WUh2?=
 =?utf-8?B?OUFYUmZFdzkySWVqSHBkdHZaSDFhSnAraldHZ3ZDVlluZUIwNGhuUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e0574eb-3696-49be-1b9a-08de58cd250c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5716.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 09:12:04.9897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YMEH3q+vj02dDqpR7J/1I220PrN70B1FKsglrZJqDTlbJ2SVSvGDLlThYxLUjWQkjzN9ruSvbo4lrWlBSNSprA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9248

Hi Andi,

Thanks for reviewing the patch!

On 21/01/26 14:30, Andi Shyti wrote:
> External email: Use caution opening links or attachments
> 
> 
> Hi Kartik,
> 
> ...
> 
>> @@ -323,12 +334,13 @@ struct tegra_i2c_dev {
>>        bool atomic_mode;
>>        bool dma_mode;
>>        bool msg_read;
>> -     bool is_dvc;
>> -     bool is_vi;
>> +     enum tegra_i2c_variant variant;
> 
> why do we need this extra step in this patch and we don't add
> "variant" directly in tegra_i2c_dev->hw?
> 
Since we are also introducing match data for DVC and VI variant, I
decided to split this into two patches.

If you prefer, I can squash following into a single patch:
  * "i2c: tegra: Introduce tegra_i2c_variant to identify DVC and VI"
  * "i2c: tegra: Move variant to tegra_i2c_hw_feature"

Thanks,
Kartik
