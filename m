Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013038.outbound.protection.outlook.com [40.93.201.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE40327215
	for <linux-tegra@vger.kernel.org>; Tue,  4 Nov 2025 13:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762263288; cv=fail; b=Zfr6dkK2wSBAXLjFPnryimbxJSrU5He+JDgEQh6mmgjxpQvSx9RAxECoebn25NNPOnGp93CcXahvpUi7vPpF9iGCJm/LmAfE9VMEm9/RUIDBedE4rWLa3KlpMw/E/FoqrCSiuLiUvIrs8Y/kXafTzmgudYz9kVYSoApffA4Yrkw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762263288; c=relaxed/simple;
	bh=XOidHk3tTF+SS3TLO7x1uzRz4BS+OwMF0ryqQosoh88=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ku1q9MN72P03o3dfbSJAOoYyHs1rq+BKP//J2UcVspgI2uz6zZCH1kH7YghGd2ahxy1Yb/bIMmvq5iORdPEHnsRKp/HH5pzm4sgDEGBJQld5sVoeWnFTfj6nM8YieqLChojuE7ftMTkEugkbbjzjnUl2jZoInFy4gJvK55sZlGk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Kv6oS0Lp; arc=fail smtp.client-ip=40.93.201.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Kv6oS0Lp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iXaiqnqI1ML2q+bDtlIWQLxwWw2ntPXZxPEs1WMa364GPtYjze2gFJ5bC/gjyUAbpZarPhNVvovjPxy5kojn6hPPOd/OH9/agGWqYHMk38p2IKsgVPBoyxbk2vtyF7JPZaS3FzHAdBLbr7NkOlaZLvEAdEk5CDEsFFweT/kxGpKquF5KbnSvY/lD643F7BM2IK3BCUIxXAczqRQuYH87hvgjn3BE7ByFxazq9sf72j2u+k+yC+vj22YJgpUdVqDFF8K5Zr53Jzq57qdez4aQlOle6HK1A/ciSbXA2UCR+Au28EJNR7ElyAcCWW8x/SBNHeNuKPUP8o6fL1nynKCjfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7eJr3EXtVWDcM9typOwP64VEuv8iTYDK55SPM/b9mpQ=;
 b=bjFK/LMUHk+bF4iwPpK0Co8Z1LRe0SCEVglzg2Mh8p0ilunwdiO98Ki/vId5012p+k4B55F2Uw7dwVevA/BNey73N/5BibLJVIyRtuAgvJ44xnoiKRuXZlFJiH+NNLZUnNmyumDdsYonqbAZ7lrjyx/lvZR2HqQ7WENApbYt6npaoPy2auXnA5sATNV7eAnpXE6xZC+u6uQa4l8SmfvMmodUdGq9ViB3bFcSEpeSl3vw/RuCG6H8GBAhn7o1QsLYxhfJCFTKpN/8M4GJMDqRSRj5KtQfNwIYHBSe/9i0hGtmGe/h9BjfV6V7PDpAMpVQ5PbWHOQ4OAXhbPilk1uKVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7eJr3EXtVWDcM9typOwP64VEuv8iTYDK55SPM/b9mpQ=;
 b=Kv6oS0LpkxOwlw6Xd+9oEtxDwCNpFxw6OIY14dqIlvDtc1RdxjfziYVHXnkDQZf/avYKrOcvuDJF51rmvHC/u4/l4tEu6LRO7pKeIZOg9n9WoWdm0tYgXGM9ZeNffQjmX7rdo92vj0iIs4O3VMWj8CUqtxSSnC/n9knnLPuvIhtQsRGtIOtENq8IF7fqHoWKDJcvLu4ljsfzld3mjOtb3X2n99/VAG0dL04nyyLtkjZUUsK3MhCfTHzPsHy0X1sjnrn0WmUtuP2Lqhig9mfuRbE82gsLtxyosmdelzFNoXcUqj3rYR1KFZvAgk6ZX52S8Az097BVnXN8RhuIh8p/oA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by CH8PR12MB9839.namprd12.prod.outlook.com (2603:10b6:610:274::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Tue, 4 Nov
 2025 13:34:43 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 13:34:43 +0000
Message-ID: <bb48fea6-de95-46d4-890c-acaabb1d588c@nvidia.com>
Date: Tue, 4 Nov 2025 13:34:38 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: tegra: Move HDA into the correct bus
To: Thierry Reding <thierry.reding@gmail.com>
Cc: sheetal <sheetal@nvidia.com>, linux-tegra@vger.kernel.org
References: <20251104132345.1689397-1-thierry.reding@gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20251104132345.1689397-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO3P123CA0031.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::10) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|CH8PR12MB9839:EE_
X-MS-Office365-Filtering-Correlation-Id: f0e7f653-c6bd-4149-d1a2-08de1ba6e96b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Wks4QnExbDEvK2t6RWova0E3TVJOTjJ1UDF3aVpEVFdLOFk2M09JRnV5bnRM?=
 =?utf-8?B?VzVEbzBUTjBEVkhtbk9vOUc0SzZRVkpLSlN0TmlYTzQvS1Q2aCt3M0xNQmJi?=
 =?utf-8?B?b2kzNzgzWWM4d3hIclNWQTF1dWVaK1E1ZEtmZEk5dm1icEg5Y1lHcDVXeGhl?=
 =?utf-8?B?SXl0K2FVNlVyczBOaVlVQ3EyRk9MVVVWS1cxdmhwLzN2UTR4U0J1YUZkRUcz?=
 =?utf-8?B?OElrRThCNGQ4Q3JOTDlPRHBHanlCMWRPUU9CeTRZczdhbEZqamo1MFJ6OXph?=
 =?utf-8?B?MWcrcFdQMjJaeGp6Umwzck1OUDdYNWJhNTYvMzh3YjFhTG9zZFp5MmpUMVNH?=
 =?utf-8?B?YWV1Vm9JeDdqQlEzM2pOWTJoOGNDdDhEdXpTQUdzMFBGTG5MdWdEam8zU1lE?=
 =?utf-8?B?K1dFMDVVc2kzUENoaEEva0Nhb0VvblQ0Q3JzNXZxOG82bk4zc0NLOEFNWElX?=
 =?utf-8?B?K1VmUnNMblRaRCt4cFhRSXZuV3FwU0JVUVV5a1hYaldNaVN0QzlUYUZaT3dx?=
 =?utf-8?B?Vzlra0VzQXR4cmVpOUUxNUFveCs0TTZaVkRReHh1aGRBMkxzRDRocVBPTnZ3?=
 =?utf-8?B?eVR6cFc1ZC8wdnNtRE80NnBzbVY5REpSL1E4dTFWWkdVREx4YXpVaE5xckxl?=
 =?utf-8?B?YmZtTnVhYzhTMjF3SVV0UUxnV3RVMlhPY3JrY25oSHNnSTRrS01raS92TEZs?=
 =?utf-8?B?VlVPNklraHdYZTFZa1BFcS9Jd3dRZU5yTW1rc3JDNXA4VU1XRktaL0NzVXY4?=
 =?utf-8?B?c0dQak5tUUtwMlh5QmNpUWY1WVdkRUxRR25qbjc2QmI5MGh0VTdKMm5qaEpt?=
 =?utf-8?B?a0dGSlVYL0hOS0wwL2FVZUNTWE1XdGVwSTlWZXJnTHd2MTlaMlhVTTNoZW5R?=
 =?utf-8?B?ZC9KNUpXdDZtR1ErUHVkbzFGWE82UFV4ODhkZHpkL0hmdFJ2R2RqNHMybkVJ?=
 =?utf-8?B?bDJIMGRidWdJVVo2bll1bk5Gdms1UkRJSlV4dWVHcW94MTltcXR5Ky8wRFB6?=
 =?utf-8?B?a0JMOFczKzhBdDdKM0J6SDRVbkg2ZkFwd0x1dDgyeUxIL01kc1J3dFp2d0t1?=
 =?utf-8?B?MVdGem45Y1hMd0pxWVpRUmhLUTdlbHlVVTM0VUdmUzh3U0ozdUtPNUkxd240?=
 =?utf-8?B?blZtcXNjYkNSbk5JSTJQRFYxUk5Sb05zNVBKbXhqN0FFOU85YVMwb3NBUkVt?=
 =?utf-8?B?aWdjdHZmblRsZ2Z5QkhGcWltMjdwZlIwd1dKV1hJUU54aVZmYW5FMVhSejNh?=
 =?utf-8?B?eTA2dktPT00zNHZXMGV4bGdqN242V2JaeUZTcElUWFVuZEIxNWlxTWZmUngr?=
 =?utf-8?B?ZFJuN1NtdTFYQ1FDUitiVWVyN2lrSmVRSEhkMlRMSU5qRTdmQnRDaXArR2FX?=
 =?utf-8?B?N1hYU2dhbnBVS3Y4eFh6Z05yd3RKV21UVUVkYTFoZGU5bnBTSlNBSktjbmt0?=
 =?utf-8?B?NXlGdG1lT2EwVC9rZllzR3ZjYUJHL2tOY0JBSHNDbkNzQzRaSG9tQ0hWalZu?=
 =?utf-8?B?YU14VFVEaDkxTktPbEphNzFGaHJsc3JCTGNQTkVlZTNKQ1J4N1NPanRqVU5Q?=
 =?utf-8?B?eVZUb29NSlp0Sk92T2MxSC85d0syMUJNVTNndmpneGFROUxjOXJyQk8waTRL?=
 =?utf-8?B?T1o3aGhNOTIrUWZjcVdiQ2MyS1dBQ2xSR2xEdVhib3Y1Y1VrZEpSMHJDeVpm?=
 =?utf-8?B?QnI1RlJ0V1crU2R3dXNHUlE5UzAzL2RKdUFuNmpGYkdMZ2xNdlRsZlN4aWtN?=
 =?utf-8?B?ZXJTWmRsRmVXd2RxMzl2V2s4OFlhNFMzOFE5aTM4MlNmV2trMnFUYWliZDVY?=
 =?utf-8?B?clhVTlg1bjNBRTJTRGJwc3NBUmdXU3pkQlFMQkY2YThHb2tRbzA5MXdlSXoy?=
 =?utf-8?B?SGpPMlB3YWlUNXphQnJ5R2JxcTJPN3VYM0p6WGhMU25GWWhDQThFVnk5TzBm?=
 =?utf-8?Q?HLG8Gg534mI6rcCw6+oD16zIQ2qrZ7WM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVBtcjdSSUpvY3Z1eEV2YUhTaXlYUDBiRzVUeGFmWmE3OEFhYVZDRVVIODVD?=
 =?utf-8?B?NFE0YS85Zk1lZGJhcnU5YjFmRXF0Q2kwOS9WNHppMVNzYWZZajdIMm1sdTFJ?=
 =?utf-8?B?b1lXN3ZVSWQyN1ZUelBmVFVLMGVhSGUvRWFzdUlRL2QyNEZKNEdScnBkcC9S?=
 =?utf-8?B?VTVVdW5tYk9hZE9ocGZLbmdEZUIxZWdIUlVkM3JDVWtXcXc1OWk0STV6Rkgy?=
 =?utf-8?B?R0c2WEdZaExucUZKUFpadGJtOEhUQmNra3FwS1diU0M3RTV0Y05uRUtHcWNt?=
 =?utf-8?B?Wk9rekQzbDRoR2wydzRRNVp0d2JSYnJ3WFhUTWMvQzB4ZjBQSktHaGJQY2ta?=
 =?utf-8?B?YlVncW5YUjhGS1h5UHNLbFFuUTVmTWx5L0dCT3YzdG9qUjVlUXNlR1BkYitP?=
 =?utf-8?B?dlVFWkZWNGRQeThrVHEycWJjUEhWb08zejJlY21LQm5EUlZJaDJkbmtra2tk?=
 =?utf-8?B?Qlh2ZUdVL0VWOTdJdnRndk5BVm00dExWaXVvdGFYM3Z3Q2FXdGhBUUtnSWNY?=
 =?utf-8?B?T0N1cUdjT2V4akwvS0pGMGQ4Z2V6YXZ1SEVScndnTzJjTWN2aGNHQmNYVmUx?=
 =?utf-8?B?OUZIUHVSSVlHVDVXc2Z6RHVqTmxabE9Mb1cwZExBK09oTHRzR3RXd0V0eUZv?=
 =?utf-8?B?QlUxNDVRazl2SmRjTnEvOFEzb3BwaHRIbVlZRHNyUkFBVjVsb3pvNXFhVXZi?=
 =?utf-8?B?dFJKNE9pZVVsLzJFRzZmWHdXbFJXZVY4VGVwWExESU9yTXJsbkozOXJiV1d4?=
 =?utf-8?B?MjJVaUJZY2hYUVJ4ZjNJalFDVFRaVUpZWHUvejhnQ0VmZlpMaWF3WnorWTNv?=
 =?utf-8?B?WHhrTUZBZUJCa0gvT0pOQnhwQVg0d0RSdjVUcmE2eDl5THgyUStMWHpGWTdw?=
 =?utf-8?B?V25VM2FNUVVxMnRHSXBqT3lhdjdHNHd0RE1rU25pMHNZd3pBc05uMEZNRFNw?=
 =?utf-8?B?SFRyNnNIMTlBKzJ4RDFMbHhRZE9TMGFZZ3BhWi9ML2YwOHNJZHl3ZFYwSkNC?=
 =?utf-8?B?VEpXWkQxYmt6RFpqTm41dVpKTG1jMUpYU1JsdWNNUmlrc2FZOCtrUHRsUGRk?=
 =?utf-8?B?dEM3aEpsa3Yyb1hPVXJTRTZPemZmUkdhN1FrWmQ2WitIMS83b1pFQWhITFRy?=
 =?utf-8?B?MmU3VTJJQXJpUGNPM040NEZER2E4c1k5QUNXT2pNaGRxbElScVVBTmppbGJW?=
 =?utf-8?B?c0xEckVlVGpKM3I1bWhoUmJsemdBNDIzYWdmT251aTNzTkZxYnprUUJidHBv?=
 =?utf-8?B?K3FmUFBxd3VXc2Y1Mm9qcHZSQlRGKzdZY1R3dDFwbURQQ0JFcWFYUXc0emc5?=
 =?utf-8?B?M0dycWcxZWVJUGFHYU52RUdSenVxeHZMWnBYVWRiQURORUZ3bEVNbDBKclVs?=
 =?utf-8?B?S012U0VQVmxvb1NHditsdFkxbmZVZzBwSEVTYmt3Y3FBaTEyUjlZcHFhbThr?=
 =?utf-8?B?M2UveEtNU0hJdkt2TXRGMThmNWFwb09wa2diUlZ4UUlkdnVSWGloZVU1Zm1z?=
 =?utf-8?B?bnhWOFJXS2ZYRjk3RFhhQzloVUNzODdocXJYdlpRa2V6aGt1QVJzYmZvZVBY?=
 =?utf-8?B?MHkydUpGbzlYZDFyTUF6NnZPOXNSQnJOVjNxWWFHN1JuTGJYUzBjajB4VUw3?=
 =?utf-8?B?UWZwcTNqbWl5ZEpIWGJ6YlYrdzhpd2NUeWFCVjlyQ0dwSG9HaGhkLzE0Wk5o?=
 =?utf-8?B?NXhJRUpFRVpIUTU5WkpYZzhJKzdRTUdKaUxzMHhZZTh6M05BVXgvTFpOd00w?=
 =?utf-8?B?b2xkTGtPZTYvelBUUHJRMEVNck0xaGk0ZC9OdlZWa3kxbG1pK2x0aHVQL2Zv?=
 =?utf-8?B?ajFSSkd5aFFtSjdOK0tta1dDQ2lybTcxNmM4ZFhjL0lsQzgyTVppMFVnTFRs?=
 =?utf-8?B?Zml3ZmVYVy80aFp2WmdnVFVXZzdldHFPNEFmS2V0aWRjZUcvNWJtY2w3M1A1?=
 =?utf-8?B?R0hJYWhaTFVuTVJiVThYQ1U2SGRQRzB0RGllN0U0Tk1nVjZTdUNhRFpBdndI?=
 =?utf-8?B?c25TaDdnWGRtVjNrbGNtREFiNkh3dGI1NDFCdFA5ZTBIMnNUNlM0ZE1PdTZq?=
 =?utf-8?B?NXFaSkdXY0pIcEZxRVQ3UXp6L0VCRXNaSXE1MzR2cnVuTHdpWDUyZUR1WmZv?=
 =?utf-8?B?djMxNy9CMUtwOUdNaGVhYmxMaExQTGJqTW9iVnZUZ1VzdmRndCtLT2J3ajdK?=
 =?utf-8?Q?A+I2Bbfh5EeInL+zdKdoabA28Me/k7jpGvAZDiMFiOlD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0e7f653-c6bd-4149-d1a2-08de1ba6e96b
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 13:34:43.0338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e+3VKCZjbKnNoOaUktMXaIKCMnSFnoNdyf6dpM1qIDa2/mvHAjQ3Tu7+WzrI9xTbwcuYs+j6IaPAsCd+sTsBWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9839



On 04/11/2025 13:23, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> HDA is part of the DISP_USB bus, so move it into that and drop the
> address prefix accordingly.
> 

Is there a fixes-tag we need for this?

Otherwise ...

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Jon

> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>   .../arm64/boot/dts/nvidia/tegra264-p3971.dtsi |  4 ++-
>   arch/arm64/boot/dts/nvidia/tegra264.dtsi      | 32 +++++++++----------
>   2 files changed, 19 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra264-p3971.dtsi b/arch/arm64/boot/dts/nvidia/tegra264-p3971.dtsi
> index 1fcfac2066ae..b1bd4ee7aee3 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra264-p3971.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra264-p3971.dtsi
> @@ -29,8 +29,10 @@ interrupt-controller@9960000 {
>   				status = "okay";
>   			};
>   		};
> +	};
>   
> -		hda@88090b0000 {
> +	bus@8800000000 {
> +		hda@90b0000 {
>   			nvidia,model = "NVIDIA Jetson Thor AGX HDA";
>   			status = "okay";
>   		};
> diff --git a/arch/arm64/boot/dts/nvidia/tegra264.dtsi b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
> index c66ea12ef5a3..f137565da804 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra264.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
> @@ -3347,22 +3347,6 @@ pmc: pmc@c800000 {
>   			#interrupt-cells = <2>;
>   			interrupt-controller;
>   		};
> -
> -		hda@88090b0000 {
> -			compatible = "nvidia,tegra264-hda";
> -			reg = <0x88 0x90b0000 0x0 0x10000>;
> -			interrupts = <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&bpmp TEGRA264_CLK_AZA_2XBIT>;
> -			clock-names = "hda";
> -			resets = <&bpmp TEGRA264_RESET_HDA>,
> -				 <&bpmp TEGRA264_RESET_HDACODEC>;
> -			reset-names = "hda", "hda2codec_2x";
> -			interconnects = <&mc TEGRA264_MEMORY_CLIENT_HDAR &emc>,
> -					<&mc TEGRA264_MEMORY_CLIENT_HDAW &emc>;
> -			interconnect-names = "dma-mem", "write";
> -			iommus = <&smmu3 TEGRA264_SID_HDA>;
> -			status = "disabled";
> -		};
>   	};
>   
>   	/* TOP_MMIO */
> @@ -3716,6 +3700,22 @@ smmu3: iommu@6000000 {
>   			#iommu-cells = <1>;
>   			dma-coherent;
>   		};
> +
> +		hda@90b0000 {
> +			compatible = "nvidia,tegra264-hda";
> +			reg = <0x0 0x90b0000 0x0 0x10000>;
> +			interrupts = <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&bpmp TEGRA264_CLK_AZA_2XBIT>;
> +			clock-names = "hda";
> +			resets = <&bpmp TEGRA264_RESET_HDA>,
> +				 <&bpmp TEGRA264_RESET_HDACODEC>;
> +			reset-names = "hda", "hda2codec_2x";
> +			interconnects = <&mc TEGRA264_MEMORY_CLIENT_HDAR &emc>,
> +					<&mc TEGRA264_MEMORY_CLIENT_HDAW &emc>;
> +			interconnect-names = "dma-mem", "write";
> +			iommus = <&smmu3 TEGRA264_SID_HDA>;
> +			status = "disabled";
> +		};
>   	};
>   
>   	/* UPHY MMIO */

-- 
nvpublic

