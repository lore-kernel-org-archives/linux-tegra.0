Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2088.outbound.protection.outlook.com [40.107.236.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5190156F27
	for <linux-tegra@vger.kernel.org>; Thu, 27 Jun 2024 13:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719493798; cv=fail; b=KfvtHKuZdu6OEfAW3nm2uV2XrNBBUnDnnwHU6bwSL0A9XxJK0u3f1EZx7/NmsXyMrLHqDJX7JgiOc2BigTtxqj93B3osI/6BMTyNH4wc48z4giK7qBxvJDSCSToMs1w18wsi0ppAINweIsicdGDpOYeEZVio+dLyG/XAAOiK9ck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719493798; c=relaxed/simple;
	bh=xKpeat8UXwStkqE4ynNJdv02MxvfMkcBgJptMW7Uuis=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=n/Gnl/b1hPFLGYG6RUaX2hDg6X4HpeGobF0goNLrbhi0yMEgJ08k+WTLwh5wS4QX8Ld3hh1oY1I+gjIcUd3wG+59rR3bU7m7mAKPbXBg6I+q/hQ+abqx1Oa0cHEL4Vc28H2AvS1ynOiX3jz9CWthfayv01b6HIpp1rK+PxYPuvw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=aetkdXt9; arc=fail smtp.client-ip=40.107.236.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="aetkdXt9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WWqIwFAeqIAc+y5a4XbmHGPCeO6WgMIxtg7+T9ahqux84z/6OV8YZxYdGhWiXlKknxjBGLovzqQhDw4WadpV/fgW6H5De7T/Y3w+fKxvlXaCJw8btw26Cocu8t7et4cX+eMPwUXGjMUJkvz18/u43SJ0bi4QftBJ85s+yiFGrzLUFSZosdk7FGB/Idbo2ubwzLAR2I/Qdxe8fbkOkWKVWAHipF11X7wArPzn9D9Wjn1Yh4q0DOF+Y3syIKdLYsC9Pc9d7CNP8OWxpWx/UPxOqcdLKqBddoPqKe1Uikatt3cUImhLsPihNofkh8DEd1Q8l75hEpJIc/HvoyRcc8YsMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hc0hbiFjCDinfFifSE98jzte3nlJpkdBdFOGLgAAT3Y=;
 b=T9hBq6YshRrhMhFmwL2fSkmp7+RWw/1et7KrCUGGSvY1nRK9XFygOdhSQ5yb5ojFLPPf3BFQtrj0h6djV5iloqrPs1WAfQFO4UK3JI4F1ghZXlxtCBQJU/Ct6ZKeSyMlEoUsVdjobPFCyeXYVdwm8GEtAWrEauySBOFZfCkeklnbzgNhYSKZvhQd8M8nALku/9Vq2NqMw3FNtxDObshWzemgti9cuoEba4XtYff5YhArewHGR4iOCdl+YfXTi+0Oep7MNk5Q4yeT2UFvlc2J3Zuphs29XWLgZJcHr/OOPA+6B55eY1fWJEHK2joOdAAwGjpQG1uBl+gkPmQJ8hknKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hc0hbiFjCDinfFifSE98jzte3nlJpkdBdFOGLgAAT3Y=;
 b=aetkdXt92NB19gvBxZEsQkZjeIvhusjsQmTtiBR/IwglZkNiFaM8lLeSSVpaqG91MnvMwKWK2xuQuEwkiFYTGJJZUCbwP7s12nODjyHwv8JI6hLqxMHmOFJGgj9LdGxHQr+lWCywucDhQUoZ9ymR4yHRaITpb2RO3mYCcHJ7xrGGf4XxBQ1cDxyH5651HDQcEcveG8HVsAx/aED+m4N9B0QAl+hnwgWLewQqLPPN58JgdS5GDAD3TjdEMWjYmRnhUn7XT12JRsVwLcsvLaarQwqxxPqbpioMdlS7maH+sXlH9j4GjXRToF06pbTW28rVft/SPHG/WTupZ8W/lTDKeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 PH7PR12MB7017.namprd12.prod.outlook.com (2603:10b6:510:1b7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Thu, 27 Jun
 2024 13:09:52 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ae68:3461:c09b:e6e3]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ae68:3461:c09b:e6e3%6]) with mapi id 15.20.7719.022; Thu, 27 Jun 2024
 13:09:52 +0000
Message-ID: <0df2f214-0d0d-445b-96a5-03fd70da0dde@nvidia.com>
Date: Thu, 27 Jun 2024 14:09:47 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/17] mmc: pass queue_limits to blk_mq_alloc_disk
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Thierry Reding <thierry.reding@gmail.com>
References: <20240215070300.2200308-1-hch@lst.de>
 <20240215070300.2200308-18-hch@lst.de>
 <89164197-7218-4f24-bf24-0e67a1882c78@nvidia.com>
 <20240627094950.GA30655@lst.de>
 <23aa9894-f913-409d-a385-8813711e2898@nvidia.com>
 <20240627111941.GA4523@lst.de>
 <9cb2b062-1b37-4d1d-8731-da69c2fe7a74@nvidia.com>
 <20240627124420.GA11113@lst.de>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20240627124420.GA11113@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0449.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::29) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|PH7PR12MB7017:EE_
X-MS-Office365-Filtering-Correlation-Id: 00d9aaa2-2d0a-47c9-75e3-08dc96aa6e89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VDV4UGlrN3pKN2dKbzZBOVVHNkp6UTRFOFVVa2prQkZEZ2RaQlJXb09wNWxF?=
 =?utf-8?B?aVBDRXM0QVlmRURKNVpZN3hVeU5pQTVNL1JLYkZTNVF2eUp2dk41VFU1SDU3?=
 =?utf-8?B?UExNYzRxZnN0aWg5dWQrdjBCbGlxTG9YSkFDVjg0SFBwd2xubldGV05TM2Vi?=
 =?utf-8?B?aCs0ZEhqcTVNUHNJaTJhNmFtaFdsV0JmT082NTJGYTIrV1VGa01GWGl0aHpZ?=
 =?utf-8?B?d0tOdXdZTEh0ZWZ4OHRZTFJrenNOQUtZdW9obHpFZWpSOHF3b2Foa2Y0akxJ?=
 =?utf-8?B?enYxbVJmQUg4NThYY1h3a2RLMEk0ejFoSFcyVTFrc3g4dXUyYS9YeHhpa21x?=
 =?utf-8?B?alowb0MwNHhOdzFQa0dmcExKM1g4T1QycEp2UjBnU2dOV0o0Q0JWa0syRFlH?=
 =?utf-8?B?SUNLeDEwWjVJL3V0UkVqWGg4MHUyUXdHdWwrWjk0Sy8yZERiTm9nR1Jhck8r?=
 =?utf-8?B?di9QZ2tXUjkwMFM5dWhkU1BGUklPU0lWVWhaVkVVVllaUjYrQmVyKzQyQU1p?=
 =?utf-8?B?NGRkbWxFU1JadklJdURUTmJwVEZlTVJsT1V1K3liTGd1UkYxVk10cTc2Skp2?=
 =?utf-8?B?a0cvbW45N1puWmZySVJESUJaSXVFN3V1b0NtMFd4M3VhRDdMdUpyZW1GV1Fz?=
 =?utf-8?B?NDErYjBBRUM3ODNKdStnRWwyTUFUWHBDYkoxSW8wbUxDUDhYbXBYZUFOQVNS?=
 =?utf-8?B?SzlkSVBPbUxUS3pES3B1anRvZjlqdHVuSXhlSDY1VmRFY2VTKzVEaFVVQnVo?=
 =?utf-8?B?NnB4eEpBOXlzUDY5b09RUnR3MTQxYnp2dnU4QS9lbG9LSS9xWG55Q3czL1hT?=
 =?utf-8?B?dTNhQ2FGTHp6c2MyRVZvR09TQ0p4ZWtsZTV1MDZtWENCc3hBc3NGS2drNUNw?=
 =?utf-8?B?WksvOU13YzBsd3J4OGl1ODFKcUo1R0ZSZXduUFdjbmVNYUloM1FnQkM4L2Ny?=
 =?utf-8?B?RGtpSnd0djVlbllZSEhnSzIxOG1HYWxyOFdkWXo3cGovbVRqNVdxMDBaSW9t?=
 =?utf-8?B?QnByUGpFUTRCenpYQVFGcmZRTnhFVnpQNllBdFcrb0JCRXBwMU5FelVlbG4r?=
 =?utf-8?B?VHFzb3gvL0U4RjVLQ2pHMGllS25wdVE3RjduQzc2SklTa0drK2x4bzVKSmNN?=
 =?utf-8?B?QWF3UGpDbDh2V1BtdjVtNzczaWk1TWllYVI2b2J5Q3lOcWlzV09sZXVqU3dI?=
 =?utf-8?B?WkZkc09qSUVld21JWGVvS09XcGlXbGRQcHB5dVRMOVE4blk1cWJQa2JFVHJE?=
 =?utf-8?B?ZW1iK0kwdHdtejA4Um1ESE4va2U5bGE2dmJDVGhBN1pVdmdRNXZkRlVVMWdP?=
 =?utf-8?B?Z3ZMbzJObThyV1ZtVmpqUEREK1ZNS1RUVE5SSkZTNDJ3TGs1ckdId0FNMHpz?=
 =?utf-8?B?ZDIvVU0vYkJOM1lTVUJWdVQvSWFOaTE3RzdDRTRVemU4NDFwSi91MmdtcjMx?=
 =?utf-8?B?NzVBYU90b3J4Um83MTV3WWVIYjRoMEwwa01wVGthU0UyZmVhSU1OS05ENEhL?=
 =?utf-8?B?VjFiSEtVeHZ1RWQ3Ulp6bmpHckNMQjNISVdBK2ZYb1FwbDZtcDZjMnFpenY3?=
 =?utf-8?B?SnNPK2RielJBQ1RKRFg2T1V4U3VnRkVqanhDUm9IRGM1eEs5VERjc1hoTDEv?=
 =?utf-8?B?SlJVMXJ1WUVpbDFnSTZBZlNQOEZnZmlMenMxeVYxZ1h0b2FuNHpCRy83bmk3?=
 =?utf-8?B?TWpGUEZWeTdFNVJPbHBsQ0ZjV1BOS05aTmxIalN6MGZVV1paMWtwRk84NG1z?=
 =?utf-8?B?WEFzOWJGb1RPaU9Eb2I2NDNJVjNBZ2ZkZnVhVldFU1RoNDljbFdQRjNpbUhH?=
 =?utf-8?B?OXgvdnZnWjd0c3VWWUtKUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UlFWVkFGOVI3MTdYME93RGdZVG5kcEdPYjJTKzkrVVRNQnVXSjFMOGMycm9E?=
 =?utf-8?B?VVlJWFJOUks2UC9obFVGRGgwWjVqUE5KcllHWVlDY01ROWFSRWRacFNJeXht?=
 =?utf-8?B?bTk1aU9zbEtydDNZWlhQMjd6cjU1N1BuNW5mTXJ3c0ZtUGNmclJBZUVTUm5j?=
 =?utf-8?B?WVQrdmpUZ2dUdzVqckVTdXdqOE1HR0dlcm5lUGVBdmw5UHlpZ2h4cmQwdTQ2?=
 =?utf-8?B?UWpQYkhWSUJwb3Z4bm1uRFpDeFNwR2lVdTVmR3BKVWNDZ1RwMDAySDdOWHBn?=
 =?utf-8?B?UCtVQVIxNWo0ZTBKcW9jSE1mQTdhcDJoVWg4T1AyOFIrWlZ6eWVuN2ZuR1Mw?=
 =?utf-8?B?T2w4VTNYWkFDeFN0aEwwTktzazFVTC90dzE5NHZRZUdReEhKTyswa3p6Tjl1?=
 =?utf-8?B?Y29FWGlIR2xTditDOXg5MlBUNFBKVGkzZ1ZmWFZST3lUNWdUSEtrZUVKRDNZ?=
 =?utf-8?B?QzNiaSt1WUVsRXlncjV3eHlkUHh2UFhoZHMyc2U4cVNQLytGZjcxS2NNc1Fq?=
 =?utf-8?B?ZjNhWjdmcldzZjB5YUxLeTM5WE5lNjV0R2NDYmF1RFFRN0poQ1pzaFhYMDFl?=
 =?utf-8?B?S0JobytYbzVsenhmVks2OFJ0Yy85V3Z3dklhRjBWczdsSUlCd1dESUVaZmJG?=
 =?utf-8?B?ditid0g4eERtZXRmM3FUSmhiMVQ2bVJlNE1qQ1UxRHBPWFRvY0xHbVlicmZh?=
 =?utf-8?B?N3pvRUcyVTBKWm9VTWlCMjV5ZXB2UDVGZzFrcmErR2NDMTBUZDVNdndDSWZ2?=
 =?utf-8?B?TXE5UGFCay83VWJrajVVYlBoeHh4R2kvUkI4ZXVOWWs1WDNUWHBHd3gxanlt?=
 =?utf-8?B?K0NjVHRvYTM3WUpnc3B4YklsdlR6ZVFjcDFqWEdBRytUYmdVYWpQVitCNW92?=
 =?utf-8?B?SXdBNno0QlZFSHVRdnhxQnVRNDVvNDBDbDhCVG8raS9tM1kvSXRRTGNQcVk3?=
 =?utf-8?B?dHZOdzUrNWM4N1RhU2hxdHdPMGthZDhHUUMraEQvN29reG9YRzFWK2VVcWd4?=
 =?utf-8?B?bmw4THdoN1lJZWl5ZTY0RmluNk5DbE9pUktueFBUWWtENm5lOUtFVmNod2pN?=
 =?utf-8?B?eElZRnl0eXNJa1JtZGNuMUE5OWhpS1B6bW85SXVaUVo0OVE3V1VzeE1wRDFY?=
 =?utf-8?B?bVFEZEZ3ZmcvZWpCVzBPcTdKaldSV2RNNlg3djYyalB3WHdvNnUyT0hYa0ZF?=
 =?utf-8?B?MGxQQU5RTko2Y3RRbC9WZElETEdPdkpLelVGZnE1N3VUK0ZWL2M0dzlpUGQr?=
 =?utf-8?B?Rys3ODRjUGNTbEVlT1JXYVJVZ2NpZmdveWQ0bnVlKzhTUjlmVHdIMGppanMy?=
 =?utf-8?B?ckEyUSsrRyt6d21VZ1huRkR6WnlEUnh0RUxtQm5KTnlwUGVSTXhCQUpmSHRv?=
 =?utf-8?B?N1hYWm82eUpkdmp3M3ZWbVpRQlRFZ21nVGdrZDJXWmRWMFBaYXNTbCthdGFN?=
 =?utf-8?B?MC9oRHp5Wm00b21QQU5va040SFloRjVqUlNTYnNyTG8waTNUMENnbkhxazlB?=
 =?utf-8?B?aE9mc25mM2F2Zkk4aGk5eUZsN2VWQUJGQWVpaXBlemNGR2VvV3ZjYlR1UlpL?=
 =?utf-8?B?K3l2N21WZitvaHZmNFFtQlMvb0VEUHY2aFFsR2FsMVRJZGNRWXlGQzU3a09m?=
 =?utf-8?B?eVMyalVVczBya2VxRFZkelRYeFV4QmJyTmQ1TVpSeEdaYXdpWkRTZldHZGlp?=
 =?utf-8?B?cTNYZzhLcnJmdVZoMzBpQlN2QllxK3MvZEs1UUJYQUU0SlVRbDFPajBjM09F?=
 =?utf-8?B?dmYrVitvQmZqR1c1ZEVXcVJQN3poN2hXdmRxejZPMDYyenJUTmwrQ2FpQ2c1?=
 =?utf-8?B?cjJWTzN4dzR3NEJRa1lSMmxQRWVhWms1NDZ4TUdlcEtuTmxJeExUclZhUVFM?=
 =?utf-8?B?YnlNNThlSlY3R0xzYUlQNXkzMm13Skhwc2k2aHUxTkM4ak5WeWZCUFdDM3RP?=
 =?utf-8?B?aVJqZkhua2ZRdTVQUUZzTno0MGNWMDFJMW1wY3dQUnQwZHRONXNUOTVVLytl?=
 =?utf-8?B?d2NxVjZqMWN2UFFlYjNiUXhYQUU5TDRDZGhsQThYc0tiY1ZXT0dJWXFxaUJV?=
 =?utf-8?B?d3FEZlNldU9vTnZ4b3cwMTdjWUtRU0dmYTVFMVY5Uy9CK25XcnZHemlRcVpy?=
 =?utf-8?Q?J+W3K0EPiBBjbsVbiRNKcT0sx?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00d9aaa2-2d0a-47c9-75e3-08dc96aa6e89
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 13:09:52.4960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eYuIk5W3Afsrip64wungeuavS150OLB06KvlyEvsJHZmqPMxqNHfDNWnUdSXtcvMB5E9F+tpOAcYgDBvOyYlPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7017


On 27/06/2024 13:44, Christoph Hellwig wrote:
> On Thu, Jun 27, 2024 at 01:30:03PM +0100, Jon Hunter wrote:
>> I have been testing on both Tegra194 and Tegra234. Both of these set the
>> above quirk. This would explain why the max_segment_size is rounded down to
>> 65024 in the mmc_alloc_disk() function.
>>
>> We can check if this is needed but if it is needed then it is not clear
>> if/how this can be fixed?
> 
> The older kernels did this:
> 
> 	if (max_size < PAGE_CACHE_SIZE) {
> 		max_size = PAGE_CACHE_SIZE;
> 		printk(KERN_INFO "%s: set to minimum %d\n",
> 			__func__, max_size);
> 	}
> 
> 	q->limits.max_segment_size = max_size;
> 
> so when these kernels actually worked despite the above warning it
> must be ok(-ish) to just increase this value.  If that is best done
> by dropping the quirk, or changing the logic in sdhci.c is something
> the maintainers that understand the hardware need to decide.
> 
> The patch below gives you the pre-6.9 behavior just without the
> boot time warning, but it might not be what was intended by the
> quirk:
> 
> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
> index 746f4cf7ab0338..0dc3604ac6093a 100644
> --- a/drivers/mmc/host/sdhci.c
> +++ b/drivers/mmc/host/sdhci.c
> @@ -4721,12 +4721,9 @@ int sdhci_setup_host(struct sdhci_host *host)
>   	 * be larger than 64 KiB though.
>   	 */
>   	if (host->flags & SDHCI_USE_ADMA) {
> -		if (host->quirks & SDHCI_QUIRK_BROKEN_ADMA_ZEROLEN_DESC) {
> +		if (host->quirks & SDHCI_QUIRK_BROKEN_ADMA_ZEROLEN_DESC)
>   			host->max_adma = 65532; /* 32-bit alignment */
> -			mmc->max_seg_size = 65535;
> -		} else {
> -			mmc->max_seg_size = 65536;
> -		}
> +		mmc->max_seg_size = 65536;
>   	} else {
>   		mmc->max_seg_size = mmc->max_req_size;
>   	}


As a quick test I removed the quirk for Tegra194 and that did work, 
which achieves the same thing as the above.

I guess there are two open questions here ...

1. Do we need the quirk for all the current Tegra devices? Thierry and I
    can confirm this.
2. For devices that need that quirk and use 64kB pages, what is the
    appropriate way to handle this for sdhci controllers?

Jon

-- 
nvpublic
