Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2051.outbound.protection.outlook.com [40.107.236.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE811D5CE5;
	Fri, 17 Jan 2025 09:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737107437; cv=fail; b=GTQPpCOVxMZXaa9gPme2OlOAC7+mfaIKGsKi87H9YG09nNZtGuukEi+ywnop/0qYRu63L2xQEdtz3K1ke0sX6t0otJXshe+/ahYYNNpCiXz7GzsAr8LKjrCbltO2wBwYwvbu2kv3EAHLibEq0GfSJGrrOhtrUoeTmnWXeAEc6BU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737107437; c=relaxed/simple;
	bh=vtKp9E3ER1/2qRdTiv426Cwcn9OKONJs8OPtKBKX8XI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SX9mnOm2iKKMAAU+3JQWp0gKKBer2TP6oHjzqROuraUSmoRSlOW+PMvImjXyYQwBxLf1IffcvljAiRrpUHOksZ9hxM0ZicYUaQPt9HkFg3t7wB5NJe4pMQQhkDcx2ORdmv4sGLQSRX6gDsKE37qbi1bIGouNUfXCyZ3P4k9Ltjs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Kedjo2Ph; arc=fail smtp.client-ip=40.107.236.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Kedjo2Ph"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r02Yi4cTEXz2MH3uESiXY/JjgBQFh5F7+JlNAFs+RRweI5Zgo2Jj/Mku5kyiblG7oPqxkks0oKWOx/WUhWz87P2Hbaf1MRpwmGd8EvhNBzJkKpOCbetpKPMM1pl5IZWmuchEJ0aZat81Zfjx/yPDkyFAOJk+CGV9SfYCJKF8Q6h0Ef3N3mNUGT4QsdWjORd5ijJACaIHVpyzZLy5cJnGA1Jib7r9w5uk1Dw66jF32NsOD1xH5SR5zgD3AhvtnJKt0ZFK5TXHJzkwi9zKG9NNygLgzGLEE0Yjid0UfWuEdYqzpULLetVY0u3Qx7vWUinTroS1hxNSP5koCrjXUyE52A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ExLSc7m1Dmaz7O1RBP3scuT7SgHB33h8k4WAmWCtvPs=;
 b=YosTuLfpd0Em3ySbdNPpqx9ZVnBMs1nw/eKO8PFaKo8ubBYohGr6Xu/GbmCh1gLe/ukR/5gKFaJ3XKxh6vfEQxUzDavEi0JwbphnVEJrr4P6/b+2irPIOrbJ/y8Z4xfShi8Nhwv1PtbMCOaoe/O6RPZKRu+lYh3/Lq1c0neAjBwKpBg0BjD2Cl/0ASQr9MoUwT7wzU+umtINocAc5NdWxz39SXXH4f2/ra6CvW1qZrNR1HjpDDWUHWlpqSQH7HmLPIbQFB2F4KDl+qcB+1XJW/MTZA4yJxspju8/EPf6BQlGLg94YUQuYnI4EBOJ5estf25rHk4643sLgGwTRnx0qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ExLSc7m1Dmaz7O1RBP3scuT7SgHB33h8k4WAmWCtvPs=;
 b=Kedjo2PhCQnrOCRlvo/UUMoot9DItzyLxKpDdkY5+F+MBuc6l3uGmd5SCetJKmXK4PVXofmo7WEixSTI8609MupWrc3g1MHkgJTGgsJsnpY+c6q3VnExbNmdaFAsTCehz7gkpZhf3dYa+KtSteWlsLPM93Wjd3oi9yWaRuyO78fh55o9w2AtJ6OdPRcQksxiLrpAoJ9LWVs1z512tusyl2R7qWS+hCVX20sQGNVIF/nTVpyfL1biZn2NQOW/t2aQuapyvySSy3Epz1yA2k4fmEkqikrNGs38MuD1UYv2p3DiNDBQgY+2KehCSKcK5Kv722qkraNpmjiK73bH3eL4Fg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by DS7PR12MB8273.namprd12.prod.outlook.com (2603:10b6:8:ed::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Fri, 17 Jan
 2025 09:50:31 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.8356.010; Fri, 17 Jan 2025
 09:50:31 +0000
Message-ID: <53b2f7cc-5034-4a81-97a6-de9ce4421406@nvidia.com>
Date: Fri, 17 Jan 2025 09:48:12 +0000
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOetlOWkjTogW1BBVENIIHYzXSB1c2I6IGdhZGdldDogdV9zZXJp?=
 =?UTF-8?Q?al=3A_Disable_ep_before_setting_port_to_null_to_fix_the_crash_cau?=
 =?UTF-8?Q?sed_by_port_being_null?=
To: =?UTF-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Cc: Prashanth K <quic_prashk@quicinc.com>,
 "mwalle@kernel.org" <mwalle@kernel.org>,
 "quic_jjohnson@quicinc.com" <quic_jjohnson@quicinc.com>,
 David Brownell <dbrownell@users.sourceforge.net>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "opensource.kernel" <opensource.kernel@vivo.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Brad Griffis <bgriffis@nvidia.com>
References: <TYUPR06MB621733B5AC690DBDF80A0DCCD2042@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <1037c1ad-9230-4181-b9c3-167dbaa47644@nvidia.com>
 <2025011633-cavity-earthworm-2b5e@gregkh>
 <3d9db530-a0b7-4f18-9ad4-233356dfe68c@nvidia.com>
 <TYUPR06MB62175A4CC0559A1E4330C267D21B2@TYUPR06MB6217.apcprd06.prod.outlook.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <TYUPR06MB62175A4CC0559A1E4330C267D21B2@TYUPR06MB6217.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0082.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::22) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|DS7PR12MB8273:EE_
X-MS-Office365-Filtering-Correlation-Id: ab413f5b-aad9-45d0-3014-08dd36dc61b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|10070799003|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UVVTZE1KYUd5OFIxY3RjZG9FUityUlFMTFpuYUdrY0UyaGtPUTlaR0NqY0pm?=
 =?utf-8?B?Ui9sREVGQkEvcjU5WUsweHZWY2VieGxoQ0hPS1RVZmZqd2NFVmFRemRxYmZS?=
 =?utf-8?B?VGhUM0diMTZpMWxSb3JFeXFqREQ4cG5MVXBJWnd2VVpxWFlMRWEySUZhVThu?=
 =?utf-8?B?VjgxZzVseUNsK1drcndTZlZYaGxhMHlnTG5VWmIzT0w3Yk10MXBiVDF3Q1Z2?=
 =?utf-8?B?UFg0VG50Z2pjaDVra1dVU2RBSng3TDVycmFBT0JUUjQ5aFdpakVQZ3BLM0dM?=
 =?utf-8?B?ZXd3K0lmYnBKbm4rci9GTDZsLzZDT2F0c3NvRTIzMHhkWlJEQzFtRmlFUkhI?=
 =?utf-8?B?TFY4RHlTdjhqaE1tMXVqZ0VHb3d6WlZIZ0ZSRE5qRU5Mb0x3RitPUnE0ZDUw?=
 =?utf-8?B?UXE3aGlQVkluVEc4ZkJkYTkzNGw5RkpyNUpUTUhWZ1ZRZFI3Kys1OEYzSURO?=
 =?utf-8?B?WU5vVGUvLzlrVFZNMGNmSHpDcEVDZlRxcjVnRjNGQU93R1NhVXdRbHlKYzBM?=
 =?utf-8?B?aE5MUU5lekYzaWMzZzF3REdzV01HSHZ6ZjBJbXlEL2psaldYOXpYRlVkZlBR?=
 =?utf-8?B?Y045dUw1V1pjY2VubG00YWNuSUpxbWxSSUZCRzRUNVVIVExMd0hoelVaQ2lZ?=
 =?utf-8?B?TnE1STBiemFoYWpld25Edm0vYkI1WHhEQzQ4UDY2SXl3TUltWnh5STR4Mkpk?=
 =?utf-8?B?bW5NUVR0eUpoMDdBSzhCNDhKbmhSTkdvNzhtb0FGS1BDcXgrbjRySDBNUUtI?=
 =?utf-8?B?c21IQ1dkQm5vSDIyL3ZKK0dzMWNWUzBEQWNZazBiK3lPd1FncFVNeDNjYVhL?=
 =?utf-8?B?Rk1NdDQ3NlFkdTc2Y2JHOUxaMWZsa2pIUlF4MVRIcFkxTHJGRmthTFlrKy80?=
 =?utf-8?B?UHdNUWdSM1ozWG5hM2RiNjdQZ1dCWGQ1OG1jY0NIdTcyMWxsOE96TlRTQzE0?=
 =?utf-8?B?Tmx6OVRxNjBGSnU5bWw1eDBMQ0JhQnlYS2dmc3A2V0NpQnB1dWI1cHlKK0Y1?=
 =?utf-8?B?a1NEaEpodEIvMkp6OUk1YWZxaXRFbUtTL2tjUG5SVXlPZ2VRRlFUTWpaRDda?=
 =?utf-8?B?emdqY2p4UWYxNkMxMTNhcDcyNENCdUhOaWtMOWRrYS93WlNWUGJZcVpIdE9G?=
 =?utf-8?B?N0s4MmxtOC9GMnFoMnZGZmVnMkZSQXNHRitINHh2ZENVTlZtQmxkbk1mNEl4?=
 =?utf-8?B?MkJzbjd5Z1A1WlFPY28yc091MjBndTdXYXF6NXV3Y3BlZEhvMnYwRnJJa1Zm?=
 =?utf-8?B?RVRIeEdGRkFuVXNDZkkrb3UzWStoN0g3WitYUDFIMVk3MzFLS3FUUzlkR2lP?=
 =?utf-8?B?aUdFb3RsbVdmRTViMXRqTmlCNkhneFQxbWE0YlJHcUYyVmRHMFJoUlowM2py?=
 =?utf-8?B?SGJ3WnA5TUM1VldIa0dFcURjZ29zcGNZUFRVTHdGYm5wTGdRMEJBNmpiV3da?=
 =?utf-8?B?dnlGYkc4MlNjQU8xWDhvOHNHVVRiRmdXMGJkRWVFUWRqWE13YlBpT0NUbTN2?=
 =?utf-8?B?SEFTZjJVeVIrRE04OTNqSFJ0aHRvSnhFVStIZ2tlc1N4MUxnd1hENDFLbTlC?=
 =?utf-8?B?VnhGVFAwWmc1ZDZKWVNOUDlDVG4yM29JZW1Ia3pPZmw4R0xHSUd1MHRyVEt3?=
 =?utf-8?B?c0tYNGladktlVFp0K1B1a21ITi8rZDBWa2IwRkpwNk5EL0phUThVSmlXS2NO?=
 =?utf-8?B?ZDJCN0VEa0NJelh2K1VIOE1TOFFPU284MDQ3YWJSSUZEM1NuZGdDK25NQmh4?=
 =?utf-8?B?a2owZGFaNjAwclpJTG1zRlFHT1psM0tXWHVmdzhmOWdmVXJQZXQ1dGZvNXcw?=
 =?utf-8?B?MFZudFFsb00zY1oza3BUODFEaVpqUDhLaTRsV3lEZXRhbFpYRkxFOWNmYUF5?=
 =?utf-8?Q?E8KqbfKYVPCg8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(10070799003)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ulo1cUEwVHJSVG5xL0tjWC82Y0VTQmlra3FEejZxdG9HNml2Z2NqaXVRS2lv?=
 =?utf-8?B?TFpUUjRLVEhTQlJmNEJGM3ZVaHUxUnBRaHVqWkZiR0JIVjUrUDZ5VTBWOVM4?=
 =?utf-8?B?ZW4wenBUYjcrZDNwYVNhNWNPYTVzVlY0SlBjaXkxTTJQMXE4RWNGOEZqRjQ5?=
 =?utf-8?B?RURIdkVycGsxTlA2b1h3NEtZRXgrZlVMelRyazhSUTRCTDE2cERHTTlZeDdO?=
 =?utf-8?B?NXZ1TjQvVXpsaitzQVdxcGlDNzEvWTdYRjlJY3N5a0FHa0Fqc3RWNWlOQlBz?=
 =?utf-8?B?cE16dko5OEhVMlRJS2ZKc0xUSmo4Z2JTZmViTDFXbEFJd2NoU0dlZk9sdGp1?=
 =?utf-8?B?RjBxOFFBSDBBNyt0VThpaFVVaVNsVDNkUVRWRUVzUFA3WlNHaE5nODcxeTVx?=
 =?utf-8?B?cUV5RWJSYU9VVGFsY3QxQkpmNXZtbTFoNG1WMVlWZmZDTXI2ZktYRUN3aDRk?=
 =?utf-8?B?ZUF3R0JzYjVLZVk5bXVzSmQ1Y3dsUlkxNlBQLzBlREV2dXJ2bzZoaHFES1M1?=
 =?utf-8?B?VmZZcmw2S1ZocG5xblRHMnRWbFVjRzUwMStBYWdHQkRudVpNKzE2S2Z6UW5p?=
 =?utf-8?B?MExHUDh3QW1GMXgyMXFFcmF5WUFmMHdxQlpTa0N3UW1PU0phdk9oanRwQlNZ?=
 =?utf-8?B?ZlpEZUh2NHRyRnZjN3FHY0hHM3B5cml6RHMyUVdWU3hFUm85clluNy9IL0hV?=
 =?utf-8?B?OHVRVUNGV2s1TCtQRkhHSnpnbjkzYytRZEVQVDZVeXdoRjIzRmVIdGxFMDJo?=
 =?utf-8?B?bWR0WmYvSENObkYrOEF3SUZGUXJMcWZIZUVxazhRZFlkblZKd21MVHE2cVBx?=
 =?utf-8?B?WTNiN0RsNWtCWWpKdjM1cVlvMzFxL1dPeiszL1Btb21RMGUzYUFUTFoyczlY?=
 =?utf-8?B?bCt6bVpXSXA0SlgyREF1NDBKM2NRUi9tWDhjVmtWL0lFY3ZacVM4SGZjd0k3?=
 =?utf-8?B?Y3QzQ0VTbTBGR3ZDYVlwTFU0bjVVQU5aeGdBVmk1bjRzd0NuUXh4ZmNzam5Z?=
 =?utf-8?B?eE9DVXNGSUQzdXFmZWduWUxsQjVvVS9iZE51SEV5UlVGNGkxN0tLcWpFUzc5?=
 =?utf-8?B?WVhjZU52SEt1WGxCMTlmb0R5MStqRExNSERpS0JiZUtxc1VHeHpBRENxNHc1?=
 =?utf-8?B?Z3dqV1JnR2lKYVQrdncyN3MzUFV5WGJ3SEVBNVJIekp4SFpiSmhxaU11WUVE?=
 =?utf-8?B?M2hXdktBekl2T0VTb3lzdWJhdlJady9sSzVqK1JhUkN1Z1ZpZ0YvVHhHQ1NI?=
 =?utf-8?B?S0M0RldiV2R0MHlwZHUySHorbmlrRFNpcktlQnZGdGlhU21yQ3g5UlF1WDJX?=
 =?utf-8?B?KzRibjFxRnJsYVN6ckhnZGg1aHZ6Z1VjTVM5SjRHQU1TYmo4S2RUblBpMFZw?=
 =?utf-8?B?T25CejhOejJaOTVndmRCV2RQME5VNlVkV1B0TmNtOGpjVjZRczVJdkhlVytQ?=
 =?utf-8?B?aW9oTE54MlQwZGprakpZNmcvOSsrY24vVVExYkVqUTU1WWp5ZEhhMnUyR2lB?=
 =?utf-8?B?RUl0dDlSZVU4RDVWQkNuMDBseXk3UHhvdkJNUnVMY1pieVBEbVhacTB4VFNj?=
 =?utf-8?B?VEZvd1RudFdaNjh2SmJlOStydUtXZWk0Q1M2UWZwTlNFYkY2ZXRaV3hlcy9N?=
 =?utf-8?B?bkQ3d1ZkZzJpYk00L0xpSERIaVorWGlXZkJ4ZXRYQ2dmcm9qQ3kydnBTMHNP?=
 =?utf-8?B?V2JkVFJtOHFxL1doWEtXM05OSGdvZXhOeVJYMm9sT0ErWW50OHdRcGt0aC9L?=
 =?utf-8?B?M1BmWkpvS2grWXUrWTdNd2VlOVpvWFgxMWRVU0d6dUdLdW5kVEpaM0RaWXB5?=
 =?utf-8?B?RkNEQlo3TkRpVGVXcnFMd2hRMTY2d3lKREFjWjlqVVlKRHNCaHYxNDE1WUti?=
 =?utf-8?B?WXZ1b203dTdRT1JraUM0b0p0OTNLdS9aWlBLRUM4RXJZSVNxU085emVBZCtI?=
 =?utf-8?B?SlA5ZDBGNXhmdkFOc0ZqZExxRGVmaFErWUlNNXIvbDAwOVpYRTBab2t1clVh?=
 =?utf-8?B?WnlBc3MzMS9sMi9hUE9hcllMMkFxc2JycnVxRHVVdHVUVWdkUkhiZkdwajRE?=
 =?utf-8?B?U0lIOXpWeHpjejBDZTJoQmtJaHlHdTR4cFhWeXhLRnJLWHFkcjRvU0JsUEpB?=
 =?utf-8?B?b3lrTmVUancxbkpseXF5MFlDR1RsVEk0RlNUci9GcWg2Ym53TENnTmdUR2xm?=
 =?utf-8?B?NUhaZEtrYWhibmRtMmQwRi8vdjNZdmdJdW5hNjh5L25ld0dzcUtuU1VKd1Zr?=
 =?utf-8?B?Q3pTdUc1cDBiMjRvZVhDaFc5SmhBPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab413f5b-aad9-45d0-3014-08dd36dc61b5
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 09:50:31.7562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5CVykVzuRIbcELBdai3QN24PUc9BQFOoyzBz+BuKzxve1ezjgjwGYQHRAEWm5sLKlh+I/epSNvqOfI5qZYpRwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8273

Hi Lianqin,

On 17/01/2025 05:04, 胡连勤 wrote:
> Hi  Jon：
> 
>>>>> Considering that in some extreme cases, when performing the
>>>>> unbinding operation, gserial_disconnect has cleared gser->ioport,
>>>>> which triggers gadget reconfiguration, and then calls
>>>>> gs_read_complete, resulting in access to a null pointer. Therefore,
>>>>> ep is disabled before gserial_disconnect sets port to null to prevent this
>> from happening.
>>>>>
>>>>> Call trace:
>>>>>     gs_read_complete+0x58/0x240
>>>>>     usb_gadget_giveback_request+0x40/0x160
>>>>>     dwc3_remove_requests+0x170/0x484
>>>>>     dwc3_ep0_out_start+0xb0/0x1d4
>>>>>     __dwc3_gadget_start+0x25c/0x720
>>>>>     kretprobe_trampoline.cfi_jt+0x0/0x8
>>>>>     kretprobe_trampoline.cfi_jt+0x0/0x8
>>>>>     udc_bind_to_driver+0x1d8/0x300
>>>>>     usb_gadget_probe_driver+0xa8/0x1dc
>>>>>     gadget_dev_desc_UDC_store+0x13c/0x188
>>>>>     configfs_write_iter+0x160/0x1f4
>>>>>     vfs_write+0x2d0/0x40c
>>>>>     ksys_write+0x7c/0xf0
>>>>>     __arm64_sys_write+0x20/0x30
>>>>>     invoke_syscall+0x60/0x150
>>>>>     el0_svc_common+0x8c/0xf8
>>>>>     do_el0_svc+0x28/0xa0
>>>>>     el0_svc+0x24/0x84
>>>>>
>>>>> Fixes: c1dca562be8a ("usb gadget: split out serial core")
>>>>> Cc: stable@vger.kernel.org
>>>>> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>>>> Signed-off-by: Lianqin Hu <hulianqin@vivo.com>
>>>>> ---
>>>>>
>>>>> Changes in v3:
>>>>>     - Add --- line above the version tag information
>>>>>     - Remove extra blank lines in commit messages
>>>>>     - Version tag information from v2 to changes in v2
>>>>>     - Link to v2:
>>>>>
>> https://lo/
>>>>>
>> re.kernel.org%2Fall%2FTYUPR06MB6217DAA095A9863D4B58D57CD23B2%40T
>> YUPR
>>>>>
>> 06MB6217.apcprd06.prod.outlook.com%2F&data=05%7C02%7Chulianqin%40
>> viv
>>>>>
>> o.com%7Cc88bd260faf9470d244f08dd363eb8df%7C923e42dc48d54cbeb5821
>> a797
>>>>>
>> a6412ed%7C0%7C0%7C638726365197191059%7CUnknown%7CTWFpbGZsb3d
>> 8eyJFbXB
>>>>>
>> 0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFp
>> bCI
>>>>>
>> sIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=G4l0lGF093J44BuTeGpEYpYvC
>> MGiK3d
>>>>> TnR%2Fd2Zn8Q1U%3D&reserved=0
>>>>>
>>>>> Changes in v2:
>>>>>     - Remove some address information from patch descriptions
>>>>>     - Link to v1:
>> https://lore.k/
>> ernel.org%2Fall%2FTYUPR06MB621763AB815989161F4033AFD2762%40TYUPR
>> 06MB6217.apcprd06.prod.outlook.com%2F&data=05%7C02%7Chulianqin%40
>> vivo.com%7Cc88bd260faf9470d244f08dd363eb8df%7C923e42dc48d54cbeb58
>> 21a797a6412ed%7C0%7C0%7C638726365197206594%7CUnknown%7CTWFpb
>> GZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4z
>> MiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=6rGddQJ
>> L9K%2Bqyr98IXYkf6zM8AzxN6%2FaJZztGybx%2FUw%3D&reserved=0
>>>>>     - Link to suggestions:
>>>>>
>> https://lo/
>>>>>
>> re.kernel.org%2Fall%2FTYUPR06MB6217DE28012FFEC5E808DD64D2962%40TY
>> UPR
>>>>>
>> 06MB6217.apcprd06.prod.outlook.com%2F&data=05%7C02%7Chulianqin%40
>> viv
>>>>>
>> o.com%7Cc88bd260faf9470d244f08dd363eb8df%7C923e42dc48d54cbeb5821
>> a797
>>>>>
>> a6412ed%7C0%7C0%7C638726365197216620%7CUnknown%7CTWFpbGZsb3d
>> 8eyJFbXB
>>>>>
>> 0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFp
>> bCI
>>>>>
>> sIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=7EvOpENpZd8s6S8PR1D%2B2
>> HnQmBLPa
>>>>> UNotpV5UGSDiDE%3D&reserved=0
>>>>>
>>>>>     drivers/usb/gadget/function/u_serial.c | 8 ++++----
>>>>>     1 file changed, 4 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/drivers/usb/gadget/function/u_serial.c
>>>>> b/drivers/usb/gadget/function/u_serial.c
>>>>> index 53d9fc41acc5..bc143a86c2dd 100644
>>>>> --- a/drivers/usb/gadget/function/u_serial.c
>>>>> +++ b/drivers/usb/gadget/function/u_serial.c
>>>>> @@ -1420,6 +1420,10 @@ void gserial_disconnect(struct gserial *gser)
>>>>>      /* REVISIT as above: how best to track this? */
>>>>>      port->port_line_coding = gser->port_line_coding;
>>>>> +   /* disable endpoints, aborting down any active I/O */
>>>>> +   usb_ep_disable(gser->out);
>>>>> +   usb_ep_disable(gser->in);
>>>>> +
>>>>>      port->port_usb = NULL;
>>>>>      gser->ioport = NULL;
>>>>>      if (port->port.count > 0) {
>>>>> @@ -1431,10 +1435,6 @@ void gserial_disconnect(struct gserial *gser)
>>>>>      spin_unlock(&port->port_lock);
>>>>>      spin_unlock_irqrestore(&serial_port_lock, flags);
>>>>> -   /* disable endpoints, aborting down any active I/O */
>>>>> -   usb_ep_disable(gser->out);
>>>>> -   usb_ep_disable(gser->in);
>>>>> -
>>>>>      /* finally, free any unused/unusable I/O buffers */
>>>>>      spin_lock_irqsave(&port->port_lock, flags);
>>>>>      if (port->port.count == 0)
>>>>
>>>>
>>>> We have observed a reboot regression on Tegra234 (I have not tried
>>>> other
>>>> boards) and bisect is pointing to this commit. Reverting this on top
>>>> of mainline is fixing the problem.
>>>>
>>>> With this change, when the board reboots we see ...
>>>>
>>>> [   59.918177] tegra-xudc 3550000.usb: ep 3 disabled
>>>> [   59.923097] tegra-xudc 3550000.usb: ep 2 disabled
>>>> [   59.927955] tegra-xudc 3550000.usb: ep 5 disabled
>>>> [   80.911432] rcu: INFO: rcu_preempt self-detected stall on CPU
>>>> [   80.917354] rcu:     6-....: (5248 ticks this GP)
>> idle=ec24/1/0x4000000000000000 softirq=1213/1213 fqs=2623
>>>> [   80.927146] rcu:     (t=5253 jiffies g=3781 q=1490 ncpus=12)
>>>> [   80.932704] Sending NMI from CPU 6 to CPUs 2:
>>>> [   90.981555] CPU: 6 UID: 0 PID: 18 Comm: rcu_exp_gp_kthr Not tainted
>> 6.13.0-rc7-00043-g619f0b6fad52 #1
>>>> [   90.981558] Hardware name: NVIDIA NVIDIA Jetson AGX Orin Developer
>> Kit/Jetson, BIOS 00.0.0-dev-main_92e5ae_88fd1_296de 12/16/2024
>>>> [   90.981559] pstate: 80400009 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS
>> BTYPE=--)
>>>> [   90.981562] pc : smp_call_function_single+0xdc/0x1a0
>>>> [   90.981574] lr : __sync_rcu_exp_select_node_cpus+0x228/0x3c0
>>>> [   90.981578] sp : ffff800082eb3cd0
>>>> [   90.981579] x29: ffff800082eb3cd0 x28: 0000000000000010 x27:
>> ffff0000802933c0
>>>> [   90.981582] x26: ffff0007a8a1d700 x25: ffff800082895500 x24:
>> ffff800080132018
>>>> [   90.981584] x23: 0000000000000014 x22: ffff800081fb7700 x21:
>> ffff80008280d970
>>>> [   90.981586] x20: 0000000000000feb x19: ffff800082eb3d00 x18:
>> 0000000000000000
>>>> [   90.981588] x17: 0000000000000000 x16: 0000000000000000 x15:
>> 0000000000000000
>>>> [   90.981590] x14: ffff000080293440 x13: 0000000000000001 x12:
>> 0000000000000000
>>>> [   90.981591] x11: ffff800081fb2388 x10: ffff0000802933c0 x9 :
>> 0000000000000001
>>>> [   90.981593] x8 : 0000000000000040 x7 : 0000000000017068 x6 :
>> ffff800080132018
>>>> [   90.981595] x5 : 0000000000000000 x4 : ffff0007a8a4f9c8 x3 :
>> 0000000000000001
>>>> [   90.981597] x2 : 0000000000000000 x1 : ffff0007a8a4f9c0 x0 :
>> 0000000000000004
>>>> [   90.981599] Call trace:
>>>> [   90.981601]  smp_call_function_single+0xdc/0x1a0 (P)
>>>> [   90.981605]  __sync_rcu_exp_select_node_cpus+0x228/0x3c0
>>>> [   90.981607]  sync_rcu_exp_select_cpus+0x13c/0x2a0
>>>> [   90.981609]  wait_rcu_exp_gp+0x18/0x30
>>>> [   90.981611]  kthread_worker_fn+0xd0/0x188
>>>> [   90.981614]  kthread+0x118/0x11c
>>>> [   90.981619]  ret_from_fork+0x10/0x20
>>>> [  101.416347] sched: DL replenish lagged too much
>>>>
>>>
>>> Odd, you have a usb-serial gadget device in this system that is
>>> disconnecting somehow?  That oops doesn't point to anything in the usb
>>> gadget codebase, "all" we have done is move the call to shutdown the
>>> endpoints to earlier in the disconnect function.
>>
>> Yes the board starts usb-serial and usb-ethernet gadget and on reboot when
>> tearing it down I am seeing the above. As soon as it disables the tegra-xudc
>> endpoints (as seen above) the board appears to stall.
>>
>>> I'm glad to revert this, but it feels really odd that this is causing
>>> you an rcu stall issue.
>>
>> Thanks. I can't say I understand it either, but I am certain it is caused by this
>> change.
>>
>> Happy to run any tests to narrow this down a bit.
> 
> I'm really sorry. If we are sure that the problem is caused by this patch, we will roll it back first. In addition,
> what are the differences between the serial use of Tegra234 board and mobile phones?
> When we consider other solutions, we need to take this usage scenario of Tegra234 board into consideration.

Nothing specific that I am aware of. We just expose a serial and 
ethernet interface over USB for interfacing with the platform. I will 
see if I can narrow down the scenario a bit more.

Thanks
Jon
-- 
nvpublic

