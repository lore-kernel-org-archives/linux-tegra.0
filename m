Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012063.outbound.protection.outlook.com [52.101.43.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941CA2FFDDE;
	Tue, 18 Nov 2025 11:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763464333; cv=fail; b=bd6fGptysWxbd3mAPQcWgCocliveAFjWmho/DKKJQp0naot7WqJAV/K7YNYM+97WxozKyjZDFrSKxS5RKsu/4lco5lRvUGC3KTrH7BzkH4j6kms8zyuFqGXie0Cta2qNLu3A6saaThyCueWySorY/ERsp+bb3aX5dWsoQ9VbQu4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763464333; c=relaxed/simple;
	bh=DFd5u5AwaxgPNTlqIQjuU8r07xalS6ASpx3SWSosJXE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=B6Tla3M63Q2Q66SubxQ5sXXuAZNLNRpwgkfMbVTm0ihhQ5CN4O71u/YkiBXT1QZbFXdZBvOUhau3vvhuF2TpclWL0vwQEqTOh+vdauQHLwJj/7JR6DOoVIeZrJGuLn6MFqgX1wKpY+4+xkDsKoxyzoFK2QQNzhOnaaAaQgUYsRw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ReCoU7uX; arc=fail smtp.client-ip=52.101.43.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ReCoU7uX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MZIAqb/jh1BY8wd2JKWJtHyfREYpScnwHjTxTVJRDbbi9fbpclTCb/rEEarbBqaJSUa5OoJXU7ezoYUdrvAdguOMoZ4mttS7adLnt6IXIC47Q2bp2/pUuCxqM0IYMOl46wYZrq0FxeW01a6ITbCDzm0q/pvmIN4iMnci5qvTgFyBFA8Vi8Wwh840eQTfuLkzOwFQrQCjq5o8YR/G591ByiSPwbGh9Gh/+Jl/BT3+NGt1W1CEamX7wN0RmvTJxmxwXs3vZfx3sBtzIAJarOULwgAJ6rquThy8Mq2BWafI4UWtKRz9SMugN1xkbUG2TMUom/jEAhagfDDp0Nj7TCRI5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zf+8w8oaVEOGiW2NAn00MfRo4Qm2y2sI8Ri4t+s96KM=;
 b=Ac7WL5qNUkTAu38wldQ1lDJmvKNbnelkEaKRY4t5U4nfNBJCabQ5stb9XAy92vHi4Q+2agbpS00Y7Dzcl0gRNMgH/UYX/hmFbM27wxNiNVIAVnGKdOgu18yOF6oQKF+hHOJXpfRm6vaNcehA19dDuNCsuXJbb2+8My+ZKypqc4JViBL+/mk3VKUcXTRMfcvgHfhg+Hr9HvcsVaveqq4lBdH5RsweMdZ4ZZMaPFqTihGZfmF5WVbjRn8L48kQTNrBxUtLNrSAgu0ZQ9wZP9f+o33bLfvzh0D77nrcQIPUDK0tmy746RavKN4mXZyi+biW+jFS8UllVCQwpqxmxbSsOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zf+8w8oaVEOGiW2NAn00MfRo4Qm2y2sI8Ri4t+s96KM=;
 b=ReCoU7uXf7c99ouoP/qyRAeRICajKKs25ZK53Y9QBPXxgX2uO0sCxwwQ+7bIZI7d6A567w1QP0UsNi36HaJrrap2f1ho4dRaGBiVt2daI3m5NOx32sanSFhb4igqaWD/GvB0B423NleqwDBauIAefHJUHoberE+Cw+4P8ZeXFOXkofIzR1Qz8+7xRQgoIh++cjE1btfxwElBDoTSj0MBL9hcGP1Loz0QOAgC/RXWrAZwnpfOlYdiMNqzSrBJlrxB5SBaU1uEdOvaLdrGP0jZbXEb0uKoST7FfT4Xxxdn1esnbNoqaibQHbt9H3N8Jgr5FPZG1r8xVWfbXBI6IBhxWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by SA1PR12MB9247.namprd12.prod.outlook.com (2603:10b6:806:3af::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Tue, 18 Nov
 2025 11:12:04 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 11:12:04 +0000
Message-ID: <9e88368b-2bcd-4f38-abcb-00b8ff6845ea@nvidia.com>
Date: Tue, 18 Nov 2025 11:11:58 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: tegra: pmc: Update aotag as an optional
 aperture
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, Prathamesh Shete <pshete@nvidia.com>
References: <20251114161711.2655355-1-jonathanh@nvidia.com>
 <20251115-accurate-fair-salmon-64eca9@kuoka>
 <77b9e0cd-2597-4d52-a352-dd029ccb6a42@nvidia.com>
 <e39fcaeb-b516-41f1-89a4-fa3328c07deb@kernel.org>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <e39fcaeb-b516-41f1-89a4-fa3328c07deb@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0471.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::8) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|SA1PR12MB9247:EE_
X-MS-Office365-Filtering-Correlation-Id: 6583331f-8815-43a9-5b4d-08de26934da2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NEVaejAxQ0UvVGh4ZElsWjY4OThmV1g4L0w5c01xMmxpUitFVUlkQmw4MVZJ?=
 =?utf-8?B?NFh1eDhvYzA1L2ZkMWx0RkthbEFRQjc1RmRRUDh1V3BQaWYxS1hCak9VRit6?=
 =?utf-8?B?a0NtWG5SQUFkVUUvYms3aUZ2VThwNWNIb2hDM000cjRUSlJHcVpuelFXcG1q?=
 =?utf-8?B?UklvSjBlcWZZbXBnYVJEWXI5bEdCWVVyUHJjam0wVEtiY0x2dERhR0pHOWhG?=
 =?utf-8?B?QllVL21SZnI0Y2xqRzhNaFNmSWUweU5lRlhXa0N5aFBHNmtVUTRUVmVtbjhB?=
 =?utf-8?B?NFN5Mm1mUjFldzBkdHhkbFB2dzZXODI3NTN0VHJXdXJGNEwwVGlXeVptSS9w?=
 =?utf-8?B?SUI3d1BUL0ZZVDJhOXc4cFR5WnBOc25ZdkowNjdsZVpBRk03SDAzOW5lb0pD?=
 =?utf-8?B?Y1Y3aGFONjR5cFd6SHpBeE9hTGNzVTRxZmlaYXFkaEEyZm9jZ0JYQXFJVFp4?=
 =?utf-8?B?SlFOUW5ORnJIWmlKaEFEWGF6bVRCbVU0OFRuMVp0WUo0TkpDQVBmekYwMURK?=
 =?utf-8?B?enVxOUNrYmdoVm5nOElLZjJMelRkeVhmYXJtd3R1VVdmWGVSb0pqYVZhcUlD?=
 =?utf-8?B?VnVzcEw2TU5Gc2g4cEo1Ukt6QnhFZzJjTUtKdEVwQ0Y5UlZxTy82RFN6ZnhW?=
 =?utf-8?B?Sm9uQnhiK0ZxRmFRcEhCeDBzMVd1S3hGYzVGWkVuV3RQQWkvR3Q4dVpCblFY?=
 =?utf-8?B?Yml0VlVwVzdRNkpDeDJuM2NITWtFVVVEeTMySExGY2JOODc4L2U0WGRUNFJF?=
 =?utf-8?B?eWhKRkZGZGVEa2RHNDBPS1BURlVUUVZNTlBKTDVvRlErWVRBRXNQNWhNVVUv?=
 =?utf-8?B?R3I2YVJLaVFQY2VqL1NqMi9WSXU1azVqcnZMN055bEljOUt2U2N1cUg1ZmEr?=
 =?utf-8?B?ZUJ3ZHhQVE9nTDV5VXhLRFpnd0Z0emNkMlFjMmNWWHgyKzZpQ0UyMkdIWElr?=
 =?utf-8?B?RUthc1JoZ0pHZk1hR29vb250Q1Z4NDh2M2dvVE9TUm5Ea3BlTHh1ODJ5U3V6?=
 =?utf-8?B?TG85QUltK0pQYXFYeU5xNFhyT2kvSEhsZ1R6WXRycTZOMnZvcWhxaU92bXVC?=
 =?utf-8?B?NDRSQWhOSDBDWGVDQWNJM09jdlR3bTkrcVZjcVIzUkcyL2liVzB0OWQ5WlN1?=
 =?utf-8?B?RzYrc1FnNFhoT2ZPVHoyNlFncW5naGtyWnRRSzBtSjVMQllpZUFXQkVQS2xJ?=
 =?utf-8?B?RWNjRDZWdDNWbHg5aFA0NjFSa2E0a0RLdWxCaFBtUnpJejZZd28yTlUzdDlQ?=
 =?utf-8?B?aGp3QURwUHYrODZQVDdEcXhzdXQrWEVKdUZpTXBpSm16azdBdjEwR3FZOTY4?=
 =?utf-8?B?SFdLUkhpWlFaNUlZMWptRUR1eXRoYzVPNGhaSzhZTnZoZXNCakR1S1RDdmpC?=
 =?utf-8?B?bExKTmR1elp4SGltRUQ4azVLNVdxOVZRS244eDkyM1VUSDVCOW5CMGc4K3hh?=
 =?utf-8?B?NlN3UVY0MDBCNElCRlNOUDRyQWlEcTFDSDJhZkpybXBZK3RrQ3BXU2NsMnht?=
 =?utf-8?B?QU9qTnY2OHorMFUrQVdSMmc1QThIYmo1MjJXeW5FZzU5bERYODAzeTRBZ1Ay?=
 =?utf-8?B?d3VnaTJRQUE5bzk3RFQyNlh4N1JHRDNTUnFtN1ZzZjluUStqRnRDMWJtbmFS?=
 =?utf-8?B?YUp6Q09FNXJ1WThNRmNjb3VGdHVWL0xhTTYraVRDSjgxUjBMZWg4dG1HQkdK?=
 =?utf-8?B?RDJmVVNPVWlhLzNPUURaSFpWclg2bWFyRDMxQk0vU3VCelc3SGx5ZkdEOEZi?=
 =?utf-8?B?Q0FUM01QRWU3UmJVN3JmaW42WTlYNjJRK3EzK1dZWUhlYkg0ZlNYbUFrYkJi?=
 =?utf-8?B?RXR1MUZsajFIUTZQTm1JcVZJZ3FPMCtlbmx3QWwyeXpDU1YyRytsQnNBRWhD?=
 =?utf-8?B?TVpGWGQzam5pUi9RTWc3YjVvclJrOTQwczVUcG8wb055SU9Tbi82ZWxXUk5o?=
 =?utf-8?Q?yXJuRJGKHXqyTxvSVy4ybDB6+4TiqKPF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2N1Um9JV09OVXpzZGt2ODlpZG5ieVlaYmhrREVWNGFwejlsWFRJOVc1ZUdn?=
 =?utf-8?B?M0EyeVUxbitIRE92SEpROUl1aFhoeFg1OHFldVBjcm95MHJRbUcwK2IrTllG?=
 =?utf-8?B?UUs4WDRwc296UVFFdVJQMDlpcjFRQ0xEUEp5aTkzYVc0SDlUT25reHE0c0tU?=
 =?utf-8?B?S2tjeUhNTnBzQStKQXFhTE11dVhGWWFKUktGdHdQRXJDaGNXTDZyR0NiVWlp?=
 =?utf-8?B?U2ZJbHpWZlZ1TWt2Mlh2WW4zdEdnYmZjOEp6blJDOGszYWdwaHVQb0U5WnV4?=
 =?utf-8?B?SVdES21XZnB1MlJWOTNjWHliSWljV01kTis5cVQ3RkFhUUg2T2MxcUh4N3FV?=
 =?utf-8?B?ajc2NXBKNWhUTDJXVGFuVE0zUU5vcjVySlo5TUJ3RHBJMXg2eUxBNFo5M2ll?=
 =?utf-8?B?T2xjY1AxTURsSHlpWUsxbmQrUEl6Y3FtY2pkUFZqaVFNVFJtRFhCbHJFQ2J0?=
 =?utf-8?B?OVdKQzV1Tmpqc2d0VytrOTFFYTBPVWFUSkg2em1tK0xvNExWOThlYy83SFlB?=
 =?utf-8?B?QU9hNnVEd1c1MXlYRmRSb0FwUUkwRGxQdmdKSnBhZmczVjBDUFB0TXhac0FU?=
 =?utf-8?B?M09HNEVhcXptc2Mrd0VQZ2dGYWx2WVkyQ3l4Qm1NOVc5cmZ0a2NIZzFickFN?=
 =?utf-8?B?dU54c3o3SEV3d09lc3dMUFZpVit2SVk5bnJOcUUrSkwvSm9qK1M5dTBlQy9m?=
 =?utf-8?B?bnRvQVNYak1GYTBWT3hTL2ZkUFFtc1MwSG92L2pxMVdkQ2FpanlBNlhFdkhO?=
 =?utf-8?B?cXZteWxJc0RpZVo1UVR1KzhwdTkwMVhxdEpQY1lxRTFwckJTK1FMSGZSTEk4?=
 =?utf-8?B?OWtBbDd4NENLaHc2RXdYTnpadThGNDlvSHlNNjJSU1lpR0tTZFg4RVBrbmNE?=
 =?utf-8?B?NnRlL0s4Q1dLQmYzWWV6VllpRWhobVJHZUZlajRPMytMcW1OQTlpay9RTkVz?=
 =?utf-8?B?eWdEZlA2aXlSVVdocWVQRnZTSFZJTjhXNkdVUlJUZ0hhVkx3eExFNjRNK200?=
 =?utf-8?B?cmtzYVFGVDRWZVVBMmJ6cGxCVndyamR3ZTlNdVNWVjhrd3FwTGlMWmpRUFhJ?=
 =?utf-8?B?L3JHZ2gvRlRnSVlmUWc4aE9ITFhucEY5Q2xYbGpJVEFvaVcwdG01VzhCcHMx?=
 =?utf-8?B?RnRweEMzY0pyVTZHbms3NG9SU2c5VjJnS0VvTS9TeE9sWXhscUFZMWJDV1V0?=
 =?utf-8?B?TDVpNHo5MlVvaFFKNlhxTWV0dy9wT0tIOTdocHh3d3dKNFVhcDduWnNhZlhl?=
 =?utf-8?B?QjhVTEJ6RGFHTElDNnQ2UlFDSnVMajg3Y1hIVDZQbnY5VytMSWYrcDVhSFUz?=
 =?utf-8?B?ZjRTZXB6a2UvSFR6ZDBleVJwWXlUbUt4VSt2VWd1TDA4MTNMNUVDSmliYXJX?=
 =?utf-8?B?NzBkOFVwSWRwRkhHSlcxaEtuWTViL0I0cVdheTZUYktYNHlnK25SQm5kNi8w?=
 =?utf-8?B?cW5IUTg4aWllWVNPZDY3M3BVRndpZi9iQmZCNnhaSVE0clo3aWRFbzBORGRH?=
 =?utf-8?B?NXdJeDZtMVNldlpVbk03OG42TEZBR1RYaVVQLy85NUV4U056d0QwSlp4ekhz?=
 =?utf-8?B?MFZrdDh0L0R5YWNUT0JkN0RhMy9yRFdFNnNJUExrZk1PbnJGclN3a0twVkti?=
 =?utf-8?B?M0JuY2VMSFFHdXhwVUtjcDd6cGFOVWJpRTlieVY0QWpsVDhLVElyeDVuaGRh?=
 =?utf-8?B?d2FYYXZTb2MwZjZqVUZkWHJhdk9xeEgrU0pwWEYwZi9leU5ETEVUS2FkM1dR?=
 =?utf-8?B?R1JlTDYvK2h1NnlqYzliUTNyY2pkNG9ieEkxblBvN1d0cTlQelBVMytPWDl1?=
 =?utf-8?B?QnpFRXFlMmwrbTViS3Zmc21JYXlNVXpyMWJnbU9Ia3hHZjZ0MUVPbmFMTita?=
 =?utf-8?B?VytwMVJnZHliaFgvalltc1FYUDBVK0k1YjN2a3U2TmJPd2V4ajBwdFJpbUpU?=
 =?utf-8?B?RHVHKzJFMVhoQWJSeG0zcmpSUlpDcDJ6blNKREFVSlVFY2thZjZRWnNMcFl6?=
 =?utf-8?B?OU0yaE5BR05pMDhXRlRoc01mTnVOSnJhUnpVdEpWd0VBMjlzWktXOTNpWmVV?=
 =?utf-8?B?d1Y1VzlBWDJyV0J3c2VBRGNPalFkaXJDSzNtQTA3MDN6UVdIZ1orVzVEb01V?=
 =?utf-8?Q?wqgGQK4lxUEriI5yHeM1ipliy?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6583331f-8815-43a9-5b4d-08de26934da2
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 11:12:04.0948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B+iCR5WtsH1Qpk++9H0fMaKYA3bo3a+1UMIswaCWt4/BuVnI32WFmHInojNFDqEtlbiQ4AbMJV3eUbwi4+ugRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9247


On 18/11/2025 10:38, Krzysztof Kozlowski wrote:
> On 18/11/2025 11:08, Jon Hunter wrote:
>>
>> On 15/11/2025 12:25, Krzysztof Kozlowski wrote:
>>> On Fri, Nov 14, 2025 at 04:17:10PM +0000, Jon Hunter wrote:
>>>> Not all Tegra SoCs or all versions of a particular Tegra SoC may include
>>>> the AOTAG aperture. This change makes "aotag" as an optional aperture for
>>>> Tegra234 and Tegra264.
>>>>
>>>> Co-developed-by: Prathamesh Shete <pshete@nvidia.com>
>>>> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
>>>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>>>> ---
>>>> Admittedly I don't know if there is a better way to handle this,
>>>> but if there is please let me know!
>>>>
>>>>    .../arm/tegra/nvidia,tegra186-pmc.yaml        | 57 ++++++++++++-------
>>>>    1 file changed, 38 insertions(+), 19 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml
>>>> index be70819020c5..defd9000eed2 100644
>>>> --- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml
>>>> +++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml
>>>> @@ -19,17 +19,12 @@ properties:
>>>>          - nvidia,tegra264-pmc
>>>>    
>>>>      reg:
>>>> -    minItems: 4
>>>> +    minItems: 3
>>>>        maxItems: 5
>>>>    
>>>>      reg-names:
>>>> -    minItems: 4
>>>> -    items:
>>>> -      - const: pmc
>>>> -      - const: wake
>>>> -      - const: aotag
>>>> -      - enum: [ scratch, misc ]
>>>> -      - const: misc
>>>> +    minItems: 3
>>>> +    maxItems: 5
>>>
>>>     minItems: 3
>>>     items:
>>>       - const: pmc
>>>       - const: wake
>>>       - enum: [ aotag, cratch, misc ]
>>>       - enum: [ scratch, misc ]
>>>       - const: misc
>>>
>>> Should work, no?
>>
>> I was thinking about that, but with the above, and if I am understanding
>> you correctly, it would permit someone to make the following mistake ...
>>
>>    reg-names = "pmc", "wake", "scratch", "scratch", "misc";
>>
>> Hence, I thought that I need to be more explicit and list out all the
>> combinations that are supported for a given device. Let me know if I am
>> misunderstanding you here.
> 
> It won't be allowed, test it.

So this is what I tried to test this ...

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml
index be70819020c5..78bd579cad75 100644
--- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml
@@ -19,15 +19,15 @@ properties:
        - nvidia,tegra264-pmc
  
    reg:
-    minItems: 4
+    minItems: 3
      maxItems: 5
  
    reg-names:
-    minItems: 4
+    minItems: 3
      items:
        - const: pmc
        - const: wake
-      - const: aotag
+      - enum: [ aotag, scratch, misc ]
        - enum: [ scratch, misc ]
        - const: misc
  
@@ -51,6 +51,7 @@ allOf:
      then:
        properties:
          reg:
+          minItems: 4
            maxItems: 4
          reg-names:
            maxItems: 4
@@ -73,7 +74,9 @@ allOf:
        properties:
          compatible:
            contains:
-            const: nvidia,tegra234-pmc
+            enum:
+              - nvidia,tegra234-pmc
+              - nvidia,tegra264-pmc
      then:
        properties:
          reg-names:
@@ -184,7 +187,7 @@ examples:
                <0x0c370000 0x10000>,
                <0x0c380000 0x10000>,
                <0x0c390000 0x10000>;
-        reg-names = "pmc", "wake", "aotag", "scratch";
+        reg-names = "pmc", "wake", "scratch", "scratch";
          nvidia,invert-interrupt;
  
          sdmmc1_3v3: sdmmc1-3v3 {


The above did not trigger any errors even though I introduced
an error in the example. Anything I am missing?

Jon

-- 
nvpublic

