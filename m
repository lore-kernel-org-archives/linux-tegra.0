Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012038.outbound.protection.outlook.com [52.101.48.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BA027EFEE;
	Mon,  2 Feb 2026 08:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770019612; cv=fail; b=lrCgu4Y4xq1ab+v9qLEWBSeAadTDS4f3QYX/gcbUHysng8mve/9pYrVJ/y7cqrFJQxQzuZVXyrWopSSQlnHdgtTosFnjUDdNT9aCJpGo8HV80hbVajs+ZgBTojb091wZprhW/hdmS6JSri3z4lGlbxBejKnO4rlbynhuEXvcncc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770019612; c=relaxed/simple;
	bh=hxoKBB3ZvJELvWNr7/aqXG44lhf1OLfhQ/fEMYz93Fs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=G83KsZGtPjIrynyboab741SsTYlCvkTHCHBW+GxO+6TllSgD1ZVSzFtjewmQbHKddiDPbrFQoHWIzGgVNSI98EEt4SxoaLHBPr1kI7YTFunTL3fORP5089D3D/0oHBC9EBFKoE45OBdJ8Nc2C0xH4lMgOGm1uVFnZ6QjxkgW5Cg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cDdX7DdS; arc=fail smtp.client-ip=52.101.48.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cDdX7DdS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BMwpMClDUUqJpRsd38cVBRte2r6x38ZlGRZeSJ8hylFKMlZq9XFph9poo2zHeA01+a0ADpP83SqBIsR6Yj4q8wZyl+GcN65P11KSlxXB3uNM96W6spTP6N9JrOpfRVd4/keCQFavzK8+Ku2vktf7eLS2lN8GwUHlSyKmCDj43Goarg+fL4vamqMDL6Rxy6qblYAEYIpFozjWsHgBw2nMuasEzv8LxbH9oijHatIRICvuvCG6v9mzf2iktmHYsAnJNIPBwpAdFbE42+PxGctclHIv99va24ej4tkvZdEUiA9uwBum5Ic/eIdP40rzmh6ixRKLCM5pPXXRY9VwAKA/6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gkirIOkexh5ZkaRy6Z4l9g4LyFhxMl8yRQrJ4Kx34ek=;
 b=j3z0Mv4vq6O5Mze24jSu7609qAOXxzUyDF6z7RBBhINAwzhxXynJjslw0+UMNW+3GXfapSCu8tZXqA6A9kYUKEuuka96EZjGcK1tWVteo0TPHzS+rz3spFlF1hLVekCPhlrm19ezosKefACm/373Sk8+WIh9NWGlgnygqBzjCXep/FzVtVY9CrRt0qvkLJ4dY2w/k+zXqH3XQdjt3NvL+k3SJ8zD/gtOwQsZCZo69g99sa4/EF6FN5QvG0XjyHTFmKv8zLBNQG3KWN+TOBXhYT7Pt6h0wgG7etJZGcHO99DfLvcrvqUMvMumKKL57lv1jVv+AOAA25oB+bI9eliO/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gkirIOkexh5ZkaRy6Z4l9g4LyFhxMl8yRQrJ4Kx34ek=;
 b=cDdX7DdSHJ76kDKEScROqxOp8bGdW6ydFEt3fdkWjUp7ITsMtSBgHuE4PWGYWUp4jqmq8MHEi+DTjzM4ytt6aFt9Kg4ZORb31U2OYM79e4Q7LRGN9N6mIJfSsQc9kz1bZNfVmCpf+kjudYapREgJ7oYn9Esaa0Q3qxVhJncVNwcLjtuQo/2y7JgCb2/oMKZN1NHrBNVeUQQ/117k1sO1qFapB1CRKGcm63AEgvqnEnJgxBnjLviRHubPczywJDPggTg68Ut4crI3GKMpM/8gveDOg8vtvXbDEEXVNOUhgoP32+nEgFEBSjYdm+kDRJ/XTgu0vsuxAwt/TI3qITxGfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by SA1PR12MB8844.namprd12.prod.outlook.com (2603:10b6:806:378::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 08:06:45 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%4]) with mapi id 15.20.9564.007; Mon, 2 Feb 2026
 08:06:45 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Dmitry Osipenko <digetx@gmail.com>, linux-usb@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] usb: phy: tegra: add HSIC support
Date: Mon, 02 Feb 2026 17:06:41 +0900
Message-ID: <2051347.usQuhbGJ8B@senjougahara>
In-Reply-To:
 <CAPVz0n0Enr0SNoVXjPyROhj6s412OEczQp+bgY9TGiEekpjW7A@mail.gmail.com>
References:
 <20260122151125.7367-1-clamor95@gmail.com> <3677292.iIbC2pHGDl@senjougahara>
 <CAPVz0n0Enr0SNoVXjPyROhj6s412OEczQp+bgY9TGiEekpjW7A@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TY4PR01CA0078.jpnprd01.prod.outlook.com
 (2603:1096:405:36c::16) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|SA1PR12MB8844:EE_
X-MS-Office365-Filtering-Correlation-Id: 359c63fb-c414-4c7d-e490-08de6232017e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bmZRSkVYS3BiR0h4UURuUnFObG1UQlVSNC80NUtCQ2hrUXN2eWJYN2t1dmo1?=
 =?utf-8?B?UnJ3bHNJNVBTU241N1NIbnlhUkZkcWpTOVVQaEo5Q0dsVStjUzBVZ3pZczNr?=
 =?utf-8?B?S2dpVHRqdXpEU1VWbzBTa2pTTVZaeEhybmZGTWwveUlLd1hmZDhsaHNPaUVT?=
 =?utf-8?B?R2wwa3NmdWt0UFJYUHcvc3FLYzRNYmhhajlpN1orWTdkVmo0K2NKU2JDYWtp?=
 =?utf-8?B?WkVLSmk5WnJFTXdaMUNFNG9qM3NLRU81YTJUQWw0ODlWRWp0Rzc1QldnNEJm?=
 =?utf-8?B?bWtDR25sVWJWTmdxeElJcmVpWDFMbGdocjNrTzZNcjNGWjBKVmRJWldQd1h1?=
 =?utf-8?B?a3YrZThnQWpKTms0YzJQdGVWaW0zSkx3R1BTTkhuaXlNb2Mzc1VrdUpEOWVo?=
 =?utf-8?B?cldHNDJWV3JmY05JTEFucUdqeWxhVG1LelpITWpzNko3VHZUOUFMb21uTTEz?=
 =?utf-8?B?ZldML21RMnhLbGFubytydE5qT3owdFBLcStXZmFITVAzOURjNVkwNmVIOUtn?=
 =?utf-8?B?WGw1RGt6Q3NTam5KN1owSG9XQzRVb1kvOGdmOGVUSUZFcHR3dFNzSGxURkZ4?=
 =?utf-8?B?LytsTGh0bjY2MmVBS0Q1M2tnT2tkZXhmdlZSUjJ6TE1sb1VwWHJpOTJlNGsr?=
 =?utf-8?B?MDFDN3E0dmdCK1NXalBrVjJZVUNWL1cxUE5hUm5sWm9KSGQ2S3lzZTNwSjhh?=
 =?utf-8?B?b0Z5dlVKWXhmZG5MQWVTUExaUWRsU3dkd1B1K1JMcDBJUFhtKy9oNEthNjVq?=
 =?utf-8?B?bFRNbGhIWktFSk1rd2RTaFZlVFNORGVZc3pXcjJDVVBTZ1NxcWE0OWRHTGlk?=
 =?utf-8?B?ZnBqM3dRNlEwMHhhN1lTdzcxaWEyYjdaYUNtMjJRRjN3anJzcy9HYk5CYmlV?=
 =?utf-8?B?SU9XMmxQakpZWFRUcWszM3hiYTFjdE1DZlp1LzIwVnRUK1NRUkI1RjRobkVa?=
 =?utf-8?B?Rm52djlobXpSaWhUcnMwWE05STlQbmFSVHRmVWErbnNEdmIxUFpIaU5WNHNp?=
 =?utf-8?B?b2dPSExPQ3QxQ1lMak0vRy9ENlR1N1VRR3NFWEZMaU96ZUxlNzBYRit2cnRW?=
 =?utf-8?B?QlM4MHVEWldEWjVIK2xMZHVmQXVnRWkvQWIwQXJNNnhjWjA5NFpjQ2pRc0VR?=
 =?utf-8?B?TlQrOEtkRmVOVUJqYnpBYzJJTVd3bHcwWUcvTnhmZHQ2NWx5emhnR0Q1UTAx?=
 =?utf-8?B?ZEtpYnJPL1BxRmpscVNvOG9nR05ZajI3aXlzM0xPNytqVDQxZmYrU3pkRlRj?=
 =?utf-8?B?aFRUb2xnaFJnam1HUjBtZWFjd2FXelMvRHdWUDRrQmpnajJXMTlHaUhXUGM1?=
 =?utf-8?B?bTE5WkpmU2lxZDVEb2xGUXlGeTM5M3lnVjBmQ01uMDZVM2dnYXZRNUxDbmx3?=
 =?utf-8?B?ajlYR29iK3hQVmRFU3pYVTBRWGJWaVk4RVkrZFI3QWc1amhFYUlRSG10K1Y2?=
 =?utf-8?B?aFhKdkswK1lTclEvKzZVbXdOY2tVaEx5NEFkUk8zdFFvL0tnTE45bzM4Myt3?=
 =?utf-8?B?alpnTU5LUFU2U0phUHIwMmhVNDMrcWRXOVkrdE1paVlnUk8vZmdUOXZxQitu?=
 =?utf-8?B?ZmNxUzQ3UlhwbnNQN2Y5UXRtT2EyUWZnQ3J0T1pDUnozK2hnc3pqakZ0QWZL?=
 =?utf-8?B?YnpZMVZUTkhiczAvRVVLd2REUVRiS28xbjAvZ0pZcjlqS2FlL2NuNUVSbEdx?=
 =?utf-8?B?dUdMajZzWjlkcnFvbnZyQ3EybWJGSytZM012ZXlkOWxYbVBpSk84b2NpM0hS?=
 =?utf-8?B?QjRWTXpCbE1WYno4Zk9nSHFzMnR2SGdhWTVjbHdhVG9GVDJRUXpsVUUrNkEv?=
 =?utf-8?B?WWhUVElxSDdKd25qZTB4Q0VSRlRoT0hwZkpLc0Z1L1FYUFF6S3FPQmJaNFFW?=
 =?utf-8?B?dTI5aGpKMWxpRlpmSUZ2ZWFEbTBvdUFQUmttQXdhWGkzU2hyZTJPOEl1UVlH?=
 =?utf-8?B?a3JHb1BjOVVRemxRb2VNUnZrdG1YaGxxSnJzR1cxeGNPaGhETHhTM0ZnSHZl?=
 =?utf-8?B?c1hKd3dpS3Y1RjJEZEtXRTZJZUU0em9qNzBaN0psbWd1ckJiMkhUMzh2Z1pH?=
 =?utf-8?B?VTZYK0s4ZEVtNFFMWms3M2h5Mm41NEFaSVFHU2xGdDRVSXdUcXZ4ZWZicUl0?=
 =?utf-8?Q?GcyY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V253dnNLVFdaODR5UnlkN2lVS0x0K25kWmlxd1BzL0pzV0REb1pNZFdkWjc2?=
 =?utf-8?B?aDB6ak42QXkrUnJDZkRlTUdSaE5JeFBYU1NRRGw1WCtpa0dRNHpsZ2MrSDln?=
 =?utf-8?B?bnBNTU5QdG5HMStIWnlob1paL3VrK0RnN3FTMTRDOEtTYkNpdWJKNjA3YXdx?=
 =?utf-8?B?ZFdIQWtxTjQ5RFl4SGNYUWExMWlEeC8rRjhCcGR0ZWJpbUh3OTFUa3JiL1Qx?=
 =?utf-8?B?bWR4a1FDck5jSmRSaTEwWjFaRC9Wd0wxYWpDcU1JRU8yVG9USHh5SE9OS2Ru?=
 =?utf-8?B?ajdTS1ExbXNlODVpYngwdVd2Ti9wQTZPS3dwQTZmQU9pVlR2a0gwb2d4Sld0?=
 =?utf-8?B?eGxZbjAwMUlMc3RiT1J1UVlzcVlDSHZpV2MyRjdmaWdSSjZRU3Q0VjMvWnR1?=
 =?utf-8?B?aDdSN1h3QVduQUcvdTZxV3FHNC9WQkVpZEFhU1BkOCszUGRtdHZIRnUxMWpG?=
 =?utf-8?B?ZmlMT213WW1jaUhmbUkyaUg2Ym1nQ0ljczNnNnI5L0xSMmd0TFlaU2s1WlNX?=
 =?utf-8?B?MFBSbDJ2YURyS1hmeXpBZlFnOWI0ZnE4cmRBaDRyNFY0bUNqNU1TMHhIZDYy?=
 =?utf-8?B?WXJzaFhlVjlyWU9rYkpNUC9zcUJJdzdlYllHT2tIanVscTcrUTF2MTlwcEds?=
 =?utf-8?B?VG9CUEJjc3Z1TEN5elh2Qk9tQTd2Tk9ETU1ZUDZPZWRNU2V2ODNYYThNam9X?=
 =?utf-8?B?dTNZNTlWbHdKd3dpNUYxRjdpMVBrQzVpd1d1UFlodVhKVXFMYWl3eFM0R2Fz?=
 =?utf-8?B?YlNJU2VRS2phSkw5RFpoTE01R291NGdqVnhrcFEybkRaK0tqUURlVGJscmxp?=
 =?utf-8?B?T1lMMkxPVjB2aTlGRkJzUFdCT3FUZU40MnZNQzdyRFlITVdlNHFtNXUwUWJa?=
 =?utf-8?B?Q1NNbjR3UFZOSjFXWXhKREh5SEJwd1A5c3ZQQS90TG1JbXJWMWVQeElDcmQv?=
 =?utf-8?B?UC8zUXI2RFZkOGxLUDIvVmxYbUcxWERhbkpWdS9qOXlLVkNmdWV1QloxcGcv?=
 =?utf-8?B?R2p6K09kRjFIUm5CVEVXUE1DTUlwRVZmNVJLZHl3Nk5mRkJsUWRxUSt1a1Js?=
 =?utf-8?B?NHZOdm5Ca3ZGNzRKaDM3eDZlZ3NqNm9McFVEVXM1RGRPSkJCbVpha2tuRHdq?=
 =?utf-8?B?dE55bnpMamxYT1RvakdTQ0hwOENtTXllVkg0bndFNVlRL1lwTHprUjJ3dmIx?=
 =?utf-8?B?VmpLeXF4d3dhcWczSWVHLy96R2tiWEJ5Vi9qbkxDakRLNVlkMWovOHNSM1lu?=
 =?utf-8?B?S28zUk5JUjBqa3MxdDE0TjBCY1ZXT2IyUjdhbHN3dlFuNU9ZMFZpa1JLaUJl?=
 =?utf-8?B?d2FBMEhHSWtsWFhyOE0yTFZMeTUrVitsTTJnWlptdkV4WjZBWW1rNjJtdlNa?=
 =?utf-8?B?NmpSQWJjelJRS0tndjE3c3VLdnBQRWE3YlNuQ2VHaXAzbjJ6S2V4ZGJVd2xH?=
 =?utf-8?B?M0NoV1VUR2ZyRkJvcmhxV3NJTkNSTzk2Y0dEUlhKUUpHL0pUWXExOE02aTJ5?=
 =?utf-8?B?YmxFOGdZR0xHR1IxSDFLTlB3V2M2bVBwV2RhMlVUd1NKV3oya3RUbXJpdlNM?=
 =?utf-8?B?MHJqdDJuNVUwK214M3JxdjZHVG5TdlhBZWR6SURUbGJrWDJmcG5FaU1nV1pZ?=
 =?utf-8?B?Z1VYYnJXak54djErMDVDOWMwajltWWNvTGI4dXZRbzV6WEFuZnFrSmwxa2gy?=
 =?utf-8?B?cWdLcndVckc0RENyRkRPL2hoOHpYRjZaMW0xa0FjMzlLcjBraWR5Q3h4MGhJ?=
 =?utf-8?B?VFUzcUpyUnI5QlQ5Ym5YYVNiRGxvdmNIVy9GMnFFRVlPME5XM2k1SFlWcE1q?=
 =?utf-8?B?NUFDYWVJdVl5RE9sc3lrYkpsSmthSFhyNzl1NmtLRUU5Vm02SmRhNFJCbTBi?=
 =?utf-8?B?dUdIaW1RQkZ5bitjVWNrRWZzZDJhYU43WGc3SE56Z0pQelFMTTBHZlpyTG84?=
 =?utf-8?B?WWJMZDJ3Z2ZLYnFUTXo5ZnpKMTVYQUV0K3FkNEg5YXc1SllEWVVsbXZIazU1?=
 =?utf-8?B?eEpvVGx1aEduZHE0ZmZDb1BLS1VxblkzN1YrYlNSYTkrQkluUXJkTTVVSXFp?=
 =?utf-8?B?eEZSMDM1R0lub292S0hhMzk5QjNyR0o0TVZ5eUs0YXdDMXhTbzlQQ1BOWnhM?=
 =?utf-8?B?SExPVTl5bkN0Q2J2NHN6VVJsUGVvcVhsY0ttNFIzNmpWeVRhdngyUWcranFw?=
 =?utf-8?B?aHpYTGJ1LzBSd2ZaZ3M0TVpWTFJCMHUrODhVOXhlUHdLNlNhWHk4eHBBUW92?=
 =?utf-8?B?Mmg2dFV1Q1RleXhGZ3UzS0dlQXh6MERJRHpHaVQ1Wklpd2NxdDlkdmVDeFJB?=
 =?utf-8?B?OFVydm55ZWlFUFNnS1VNWTBaS3lKL05rWkZJLzZaSEJnL0FhOHlrb21MdGV3?=
 =?utf-8?Q?n9m7WAhNdYVeOSTfomJR++TE8DJnZKwVd4jUvad+va2l3?=
X-MS-Exchange-AntiSpam-MessageData-1: ZDpi6UVqkIz4oQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 359c63fb-c414-4c7d-e490-08de6232017e
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 08:06:44.9427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oIP/bjcqI4qOPZBELb1+SFXVyQ5QkhJYvJwemk8hIzhtFziXPi4XDUS1iTOBc5WI5I+4ttoU/wslSTkpedSKqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8844

On Monday, February 2, 2026 3:37=E2=80=AFPM Svyatoslav Ryhel wrote:
> =D0=BF=D0=BD, 2 =D0=BB=D1=8E=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 06:07 Mik=
ko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Friday, January 23, 2026 12:11=E2=80=AFAM Svyatoslav Ryhel wrote:
> > > Add support for HSIC USB mode, which can be set for second USB contro=
ller
> > > and PHY on Tegra SoC along with already supported UTMI or ULPI.
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >  drivers/usb/phy/phy-tegra-usb.c   | 249 ++++++++++++++++++++++++++++=
--
> > >  include/linux/usb/tegra_usb_phy.h |   5 +
> > >  2 files changed, 243 insertions(+), 11 deletions(-)
> > >
> > > diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-te=
gra-usb.c
> > > index afa5b5535f92..4f0fde33647e 100644
> > > --- a/drivers/usb/phy/phy-tegra-usb.c
> > > +++ b/drivers/usb/phy/phy-tegra-usb.c
> > > @@ -29,17 +29,26 @@
> > >  #include <linux/usb/tegra_usb_phy.h>
> > >  #include <linux/usb/ulpi.h>
> > >
> > > +#define USB_TXFILLTUNING                     0x154
> > > +#define USB_FIFO_TXFILL_THRES(x)             (((x) & 0x1f) << 16)
> > > +#define USB_FIFO_TXFILL_MASK                 0x1f0000
> > > +
> > >  #define ULPI_VIEWPORT                                0x170
> > >
> > >  /* PORTSC PTS/PHCD bits, Tegra20 only */
> > >  #define TEGRA_USB_PORTSC1                    0x184
> > > -#define TEGRA_USB_PORTSC1_PTS(x)             (((x) & 0x3) << 30)
> > > -#define TEGRA_USB_PORTSC1_PHCD                       BIT(23)
> > > +#define   TEGRA_USB_PORTSC1_PTS(x)           (((x) & 0x3) << 30)
> > > +#define   TEGRA_USB_PORTSC1_PHCD             BIT(23)
> > > +#define   TEGRA_USB_PORTSC1_WKOC             BIT(22)
> > > +#define   TEGRA_USB_PORTSC1_WKDS             BIT(21)
> > > +#define   TEGRA_USB_PORTSC1_WKCN             BIT(20)
> > >
> > >  /* HOSTPC1 PTS/PHCD bits, Tegra30 and above */
> > > +#define TEGRA30_USB_PORTSC1                  0x174
> > >  #define TEGRA_USB_HOSTPC1_DEVLC                      0x1b4
> > > -#define TEGRA_USB_HOSTPC1_DEVLC_PTS(x)               (((x) & 0x7) <<=
 29)
> > > -#define TEGRA_USB_HOSTPC1_DEVLC_PHCD         BIT(22)
> > > +#define   TEGRA_USB_HOSTPC1_DEVLC_PTS(x)     (((x) & 0x7) << 29)
> > > +#define   TEGRA_USB_HOSTPC1_DEVLC_PHCD               BIT(22)
> > > +#define   TEGRA_USB_HOSTPC1_DEVLC_PTS_HSIC   BIT(2)
> >
> > PTS is an enumeration, not a bitfield, so I would say '4' instead of 'B=
IT(2)'
> >
>=20
> Noted
>=20
> > >
> > >  /* Bits of PORTSC1, which will get cleared by writing 1 into them */
> > >  #define TEGRA_PORTSC1_RWC_BITS       (PORT_CSC | PORT_PEC | PORT_OCC=
)
> > > @@ -51,11 +60,12 @@
> > >  #define   USB_SUSP_CLR                               BIT(5)
> > >  #define   USB_PHY_CLK_VALID                  BIT(7)
> > >  #define   UTMIP_RESET                                BIT(11)
> > > -#define   UHSIC_RESET                                BIT(11)
> > >  #define   UTMIP_PHY_ENABLE                   BIT(12)
> > >  #define   ULPI_PHY_ENABLE                    BIT(13)
> > >  #define   USB_SUSP_SET                               BIT(14)
> > > +#define   UHSIC_RESET                                BIT(14)
> > >  #define   USB_WAKEUP_DEBOUNCE_COUNT(x)               (((x) & 0x7) <<=
 16)
> > > +#define   UHSIC_PHY_ENABLE                   BIT(19)
> > >
> > >  #define USB_PHY_VBUS_SENSORS                 0x404
> > >  #define   B_SESS_VLD_WAKEUP_EN                       BIT(14)
> > > @@ -156,6 +166,58 @@
> > >  #define UTMIP_BIAS_CFG1                              0x83c
> > >  #define   UTMIP_BIAS_PDTRK_COUNT(x)          (((x) & 0x1f) << 3)
> > >
> > > +/*
> > > + * Tegra20 has no UTMIP registers on PHY2 and UHSIC registers start =
from 0x800
> > > + * just where UTMIP registers should have been. This is the case onl=
y with Tegra20
> > > + * Tegra30+ have UTMIP registers at 0x800 and UHSIC registers shifte=
r by 0x400
> >
> > 'shift', or 'are shifted'
> >
>=20
> Noted
>=20
> > > + * to 0xc00, but register layout is preserved.
> > > + */
> > > +#define UHSIC_PLL_CFG1                               0x804
> > > +#define   UHSIC_XTAL_FREQ_COUNT(x)           (((x) & 0xfff) << 0)
> > > +#define   UHSIC_PLLU_ENABLE_DLY_COUNT(x)     (((x) & 0x1f) << 14)
> > > +
> > > +#define UHSIC_HSRX_CFG0                              0x808
> > > +#define   UHSIC_ELASTIC_UNDERRUN_LIMIT(x)    (((x) & 0x1f) << 2)
> > > +#define   UHSIC_ELASTIC_OVERRUN_LIMIT(x)     (((x) & 0x1f) << 8)
> > > +#define   UHSIC_IDLE_WAIT(x)                 (((x) & 0x1f) << 13)
> > > +
> > > +#define UHSIC_HSRX_CFG1                              0x80c
> > > +#define   UHSIC_HS_SYNC_START_DLY(x)         (((x) & 0x1f) << 1)
> > > +
> > > +#define UHSIC_TX_CFG0                                0x810
> > > +#define   UHSIC_HS_READY_WAIT_FOR_VALID              BIT(9)
> > > +
> > > +#define UHSIC_MISC_CFG0                              0x814
> > > +#define   UHSIC_SUSPEND_EXIT_ON_EDGE         BIT(7)
> > > +#define   UHSIC_DETECT_SHORT_CONNECT         BIT(8)
> > > +#define   UHSIC_FORCE_XCVR_MODE                      BIT(15)
> > > +#define   UHSIC_DISABLE_BUSRESET             BIT(20)
> > > +
> > > +#define UHSIC_MISC_CFG1                              0x818
> > > +#define   UHSIC_PLLU_STABLE_COUNT(x)         (((x) & 0xfff) << 2)
> > > +
> > > +#define UHSIC_PADS_CFG0                              0x81c
> > > +#define   UHSIC_TX_RTUNEN                    0xf000
> > > +#define   UHSIC_TX_RTUNE(x)                  (((x) & 0xf) << 12)
> > > +
> > > +#define UHSIC_PADS_CFG1                              0x820
> > > +#define   UHSIC_PD_BG                                BIT(2)
> > > +#define   UHSIC_PD_TX                                BIT(3)
> > > +#define   UHSIC_PD_TRK                               BIT(4)
> > > +#define   UHSIC_PD_RX                                BIT(5)
> > > +#define   UHSIC_PD_ZI                                BIT(6)
> > > +#define   UHSIC_RX_SEL                               BIT(7)
> > > +#define   UHSIC_RPD_DATA                     BIT(9)
> > > +#define   UHSIC_RPD_STROBE                   BIT(10)
> > > +#define   UHSIC_RPU_DATA                     BIT(11)
> > > +#define   UHSIC_RPU_STROBE                   BIT(12)
> > > +
> > > +#define UHSIC_CMD_CFG0                               0x824
> > > +#define   UHSIC_PRETEND_CONNECT_DETECT               BIT(5)
> > > +
> > > +#define UHSIC_STAT_CFG0                              0x828
> > > +#define   UHSIC_CONNECT_DETECT                       BIT(0)
> > > +
> > >  /* For Tegra30 and above only, the address is different in Tegra20 *=
/
> > >  #define USB_USBMODE                          0x1f8
> > >  #define   USB_USBMODE_MASK                   (3 << 0)
> > > @@ -174,7 +236,8 @@ struct tegra_xtal_freq {
> > >       u8 enable_delay;
> > >       u8 stable_count;
> > >       u8 active_delay;
> > > -     u8 xtal_freq_count;
> > > +     u8 utmi_xtal_freq_count;
> > > +     u16 hsic_xtal_freq_count;
> > >       u16 debounce;
> > >  };
> > >
> > > @@ -184,7 +247,8 @@ static const struct tegra_xtal_freq tegra_freq_ta=
ble[] =3D {
> > >               .enable_delay =3D 0x02,
> > >               .stable_count =3D 0x2F,
> > >               .active_delay =3D 0x04,
> > > -             .xtal_freq_count =3D 0x76,
> > > +             .utmi_xtal_freq_count =3D 0x76,
> > > +             .hsic_xtal_freq_count =3D 0x1CA,
> > >               .debounce =3D 0x7530,
> > >       },
> > >       {
> > > @@ -192,7 +256,8 @@ static const struct tegra_xtal_freq tegra_freq_ta=
ble[] =3D {
> > >               .enable_delay =3D 0x02,
> > >               .stable_count =3D 0x33,
> > >               .active_delay =3D 0x05,
> > > -             .xtal_freq_count =3D 0x7F,
> > > +             .utmi_xtal_freq_count =3D 0x7F,
> > > +             .hsic_xtal_freq_count =3D 0x1F0,
> > >               .debounce =3D 0x7EF4,
> > >       },
> > >       {
> > > @@ -200,7 +265,8 @@ static const struct tegra_xtal_freq tegra_freq_ta=
ble[] =3D {
> > >               .enable_delay =3D 0x03,
> > >               .stable_count =3D 0x4B,
> > >               .active_delay =3D 0x06,
> > > -             .xtal_freq_count =3D 0xBB,
> > > +             .utmi_xtal_freq_count =3D 0xBB,
> > > +             .hsic_xtal_freq_count =3D 0x2DD,
> > >               .debounce =3D 0xBB80,
> > >       },
> > >       {
> > > @@ -208,7 +274,8 @@ static const struct tegra_xtal_freq tegra_freq_ta=
ble[] =3D {
> > >               .enable_delay =3D 0x04,
> > >               .stable_count =3D 0x66,
> > >               .active_delay =3D 0x09,
> > > -             .xtal_freq_count =3D 0xFE,
> > > +             .utmi_xtal_freq_count =3D 0xFE,
> > > +             .hsic_xtal_freq_count =3D 0x3E0,
> > >               .debounce =3D 0xFDE8,
> > >       },
> > >  };
> > > @@ -541,7 +608,7 @@ static int utmi_phy_power_on(struct tegra_usb_phy=
 *phy)
> > >               val =3D readl_relaxed(base + UTMIP_PLL_CFG1);
> > >               val &=3D ~(UTMIP_XTAL_FREQ_COUNT(~0) |
> > >                       UTMIP_PLLU_ENABLE_DLY_COUNT(~0));
> > > -             val |=3D UTMIP_XTAL_FREQ_COUNT(phy->freq->xtal_freq_cou=
nt) |
> > > +             val |=3D UTMIP_XTAL_FREQ_COUNT(phy->freq->utmi_xtal_fre=
q_count) |
> > >                       UTMIP_PLLU_ENABLE_DLY_COUNT(phy->freq->enable_d=
elay);
> > >               writel_relaxed(val, base + UTMIP_PLL_CFG1);
> > >       }
> > > @@ -812,6 +879,153 @@ static int ulpi_phy_power_off(struct tegra_usb_=
phy *phy)
> > >       return 0;
> > >  }
> > >
> > > +static u32 tegra_hsic_readl(struct tegra_usb_phy *phy, u32 reg)
> > > +{
> > > +     void __iomem *base =3D phy->regs;
> > > +     u32 shift =3D phy->soc_config->uhsic_registers_shift;
> > > +
> > > +     return readl_relaxed(base + shift + reg);
> > > +}
> > > +
> > > +static void tegra_hsic_writel(struct tegra_usb_phy *phy, u32 reg, u3=
2 value)
> > > +{
> > > +     void __iomem *base =3D phy->regs;
> > > +     u32 shift =3D phy->soc_config->uhsic_registers_shift;
> > > +
> > > +     writel_relaxed(value, base + shift + reg);
> > > +}
> > > +
> > > +static int uhsic_phy_power_on(struct tegra_usb_phy *phy)
> > > +{
> > > +     struct tegra_utmip_config *config =3D phy->config;
> > > +     void __iomem *base =3D phy->regs;
> > > +     u32 val;
> > > +
> > > +     val =3D tegra_hsic_readl(phy, UHSIC_PADS_CFG1);
> > > +     val &=3D ~(UHSIC_PD_BG | UHSIC_PD_TX | UHSIC_PD_TRK | UHSIC_PD_=
RX |
> > > +              UHSIC_PD_ZI | UHSIC_RPD_DATA | UHSIC_RPD_STROBE);
> > > +     val |=3D UHSIC_RX_SEL;
> >
> > L4T r16 (Tegra30) keeps UHSIC_PD_TX set until after UHSIC_RESET has bee=
n cleared. Commit message says this avoids a signal glitch.
> >
>=20
> I did not notice any difference with this change and without. Since it
> does not affect detection of modem by my device I can apply it (is it
> worth applying at all?). Should it be applied globally or for Tegra30+
> only?

Downstream only has it for Tegra30, but that's probably just because it was=
 tested in the Tegra30 timeframe. If it's not causing any issue on Tegra20 =
I would apply it globally. Considering it's a signal glitch it might only h=
ave an effect in marginal signal situations.

>=20
> > > +     tegra_hsic_writel(phy, UHSIC_PADS_CFG1, val);
> > > +
> > > +     udelay(2);
> > > +
> > > +     val =3D readl_relaxed(base + USB_SUSP_CTRL);
> > > +     val |=3D UHSIC_RESET;
> > > +     writel_relaxed(val, base + USB_SUSP_CTRL);
> > > +
> > > +     udelay(30);
> > > +
> > > +     val =3D readl_relaxed(base + USB_SUSP_CTRL);
> > > +     val |=3D UHSIC_PHY_ENABLE;
> > > +     writel_relaxed(val, base + USB_SUSP_CTRL);
> > > +
> > > +     val =3D tegra_hsic_readl(phy, UHSIC_HSRX_CFG0);
> > > +     val &=3D ~(UHSIC_IDLE_WAIT(~0) |
> > > +              UHSIC_ELASTIC_UNDERRUN_LIMIT(~0) |
> > > +              UHSIC_ELASTIC_OVERRUN_LIMIT(~0));
> > > +     val |=3D UHSIC_IDLE_WAIT(config->idle_wait_delay) |
> > > +             UHSIC_ELASTIC_UNDERRUN_LIMIT(config->elastic_limit) |
> > > +             UHSIC_ELASTIC_OVERRUN_LIMIT(config->elastic_limit);
> > > +     tegra_hsic_writel(phy, UHSIC_HSRX_CFG0, val);
> > > +
> > > +     val =3D tegra_hsic_readl(phy, UHSIC_HSRX_CFG1);
> > > +     val &=3D ~UHSIC_HS_SYNC_START_DLY(~0);
> > > +     val |=3D UHSIC_HS_SYNC_START_DLY(config->hssync_start_delay);
> > > +     tegra_hsic_writel(phy, UHSIC_HSRX_CFG1, val);
> > > +
> >
> > L4T r16 (Tegra30) clears UHSIC_TX_CFG0.UHSIC_HS_READY_WAIT_FOR_VALID he=
re. According to commit message this fixes an intermittent failure to conne=
ct to HSIC modem. It also sets UHSIC_MISC_CFG0.UHSIC_DISABLE_BUSRESET  belo=
w due to same issue.
> >
>=20
> And this change causes my modem to fail entirely.
>=20
> [   10.145976] usb 1-1: new high-speed USB device number 2 using ci_hdrc
> [   10.295970] usb 1-1: device descriptor read/64, error -71
> [   10.545975] usb 1-1: device descriptor read/64, error -71
> [   10.795990] usb 1-1: new high-speed USB device number 3 using ci_hdrc
> [   10.935970] usb 1-1: device descriptor read/64, error -71
> [   11.185977] usb 1-1: device descriptor read/64, error -71
>=20
> I assume UHSIC_DISABLE_BUSRESET, UHSIC_HS_READY_WAIT_FOR_VALID and
> UHSIC_PD_TX workarounds are all consequences of how modem in
> downstream kernel is called. Instead of relaying on modem to lead the
> controller probe, downstream just brutally removes and reinits
> controller until modem probes. I have never observed modem not
> appearing without any of discussed patches.

The downstream commit says that without this workaround, the modem would so=
metimes not come up in stress tests. So I think it's possible there is stil=
l a rare hardware bug that this is working around, but perhaps we're missin=
g some other part and that's why it's not working. I think it's fine to dro=
p these changes.

>=20
>=20
> > > +     val =3D tegra_hsic_readl(phy, UHSIC_MISC_CFG0);
> > > +     val |=3D UHSIC_SUSPEND_EXIT_ON_EDGE;
> > > +     tegra_hsic_writel(phy, UHSIC_MISC_CFG0, val);
> > > +
> > > +     val =3D tegra_hsic_readl(phy, UHSIC_MISC_CFG1);
> > > +     val &=3D ~UHSIC_PLLU_STABLE_COUNT(~0);
> > > +     val |=3D UHSIC_PLLU_STABLE_COUNT(phy->freq->stable_count);
> > > +     tegra_hsic_writel(phy, UHSIC_MISC_CFG1, val);
> > > +
> > > +     val =3D tegra_hsic_readl(phy, UHSIC_PLL_CFG1);
> > > +     val &=3D ~(UHSIC_XTAL_FREQ_COUNT(~0) |
> > > +             UHSIC_PLLU_ENABLE_DLY_COUNT(~0));
> > > +     val |=3D UHSIC_XTAL_FREQ_COUNT(phy->freq->hsic_xtal_freq_count)=
 |
> > > +             UHSIC_PLLU_ENABLE_DLY_COUNT(phy->freq->enable_delay);
> > > +     tegra_hsic_writel(phy, UHSIC_PLL_CFG1, val);
> > > +
> > > +     val =3D readl_relaxed(base + USB_SUSP_CTRL);
> > > +     val &=3D ~UHSIC_RESET;
> > > +     writel_relaxed(val, base + USB_SUSP_CTRL);
> > > +
> > > +     udelay(2);
> > > +
> > > +     if (phy->soc_config->requires_usbmode_setup) {
> > > +             val =3D readl_relaxed(base + USB_USBMODE);
> > > +             val &=3D ~USB_USBMODE_MASK;
> > > +             if (phy->mode =3D=3D USB_DR_MODE_HOST)
> > > +                     val |=3D USB_USBMODE_HOST;
> > > +             else
> > > +                     val |=3D USB_USBMODE_DEVICE;
> > > +             writel_relaxed(val, base + USB_USBMODE);
> > > +     }
> > > +
> > > +     if (phy->soc_config->has_hostpc)
> > > +             set_pts(phy, TEGRA_USB_HOSTPC1_DEVLC_PTS_HSIC);
> > > +     else
> > > +             set_pts(phy, 0);
> >
> > This (and below) are abusing has_hostpc to detect Tegra30 vs Tegra20. W=
e should instead add soc_config fields hsic_pts_value and portsc1_offset.
> >
> > > +
> > > +     val =3D readl_relaxed(base + USB_TXFILLTUNING);
> > > +     if ((val & USB_FIFO_TXFILL_MASK) !=3D USB_FIFO_TXFILL_THRES(0x1=
0)) {
> > > +             val =3D USB_FIFO_TXFILL_THRES(0x10);
> > > +             writel_relaxed(val, base + USB_TXFILLTUNING);
> > > +     }
> > > +
> > > +     if (phy->soc_config->has_hostpc) {
> > > +             val =3D readl_relaxed(base + TEGRA30_USB_PORTSC1);
> > > +             val &=3D ~(TEGRA_USB_PORTSC1_WKOC | TEGRA_USB_PORTSC1_W=
KDS |
> > > +                      TEGRA_USB_PORTSC1_WKCN);
> > > +             writel_relaxed(val, base + TEGRA30_USB_PORTSC1);
> > > +     } else {
> > > +             val =3D readl_relaxed(base + TEGRA_USB_PORTSC1);
> > > +             val &=3D ~(TEGRA_USB_PORTSC1_WKOC | TEGRA_USB_PORTSC1_W=
KDS |
> > > +                      TEGRA_USB_PORTSC1_WKCN);
> > > +             writel_relaxed(val, base + TEGRA_USB_PORTSC1);
> > > +     }
> > > +
> > > +     val =3D tegra_hsic_readl(phy, UHSIC_PADS_CFG0);
> > > +     val &=3D ~UHSIC_TX_RTUNEN;
> > > +     val |=3D UHSIC_TX_RTUNE(phy->soc_config->uhsic_tx_rtune);
> > > +     tegra_hsic_writel(phy, UHSIC_PADS_CFG0, val);
> > > +
> > > +     if (utmi_wait_register(base + USB_SUSP_CTRL, USB_PHY_CLK_VALID,
> > > +                            USB_PHY_CLK_VALID))
> > > +             dev_err(phy->u_phy.dev,
> > > +                     "Timeout waiting for PHY to stabilize on enable=
 (HSIC)\n");
> >
> > Should return error (return value of utmi_wait_register) here?
> >
>=20
> Noted.
>=20
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static int uhsic_phy_power_off(struct tegra_usb_phy *phy)
> > > +{
> > > +     void __iomem *base =3D phy->regs;
> > > +     u32 val;
> > > +
> > > +     set_phcd(phy, true);
> > > +
> > > +     val =3D tegra_hsic_readl(phy, UHSIC_PADS_CFG1);
> > > +     val |=3D (UHSIC_PD_BG | UHSIC_PD_TX | UHSIC_PD_TRK | UHSIC_PD_R=
X |
> > > +             UHSIC_PD_ZI | UHSIC_RPD_DATA | UHSIC_RPD_STROBE);
> > > +     tegra_hsic_writel(phy, UHSIC_PADS_CFG1, val);
> > > +
> > > +     val =3D readl_relaxed(base + USB_SUSP_CTRL);
> > > +     val |=3D UHSIC_RESET;
> > > +     writel_relaxed(val, base + USB_SUSP_CTRL);
> > > +
> > > +     udelay(30);
> > > +
> > > +     val =3D readl_relaxed(base + USB_SUSP_CTRL);
> > > +     val &=3D ~UHSIC_PHY_ENABLE;
> > > +     writel_relaxed(val, base + USB_SUSP_CTRL);
> > > +
> > > +     return 0;
> > > +}
> > > +
> > >  static int tegra_usb_phy_power_on(struct tegra_usb_phy *phy)
> > >  {
> > >       int err =3D 0;
> > > @@ -828,6 +1042,10 @@ static int tegra_usb_phy_power_on(struct tegra_=
usb_phy *phy)
> > >               err =3D ulpi_phy_power_on(phy);
> > >               break;
> > >
> > > +     case USBPHY_INTERFACE_MODE_HSIC:
> > > +             err =3D uhsic_phy_power_on(phy);
> > > +             break;
> > > +
> > >       default:
> > >               break;
> > >       }
> > > @@ -859,6 +1077,10 @@ static int tegra_usb_phy_power_off(struct tegra=
_usb_phy *phy)
> > >               err =3D ulpi_phy_power_off(phy);
> > >               break;
> > >
> > > +     case USBPHY_INTERFACE_MODE_HSIC:
> > > +             err =3D uhsic_phy_power_off(phy);
> > > +             break;
> > > +
> > >       default:
> > >               break;
> > >       }
> > > @@ -1256,6 +1478,8 @@ static const struct tegra_phy_soc_config tegra2=
0_soc_config =3D {
> > >       .requires_usbmode_setup =3D false,
> > >       .requires_extra_tuning_parameters =3D false,
> > >       .requires_pmc_ao_power_up =3D false,
> > > +     .uhsic_registers_shift =3D 0,
> > > +     .uhsic_tx_rtune =3D 0, /* 40 ohm */
> > >  };
> > >
> > >  static const struct tegra_phy_soc_config tegra30_soc_config =3D {
> > > @@ -1264,6 +1488,8 @@ static const struct tegra_phy_soc_config tegra3=
0_soc_config =3D {
> > >       .requires_usbmode_setup =3D true,
> > >       .requires_extra_tuning_parameters =3D true,
> > >       .requires_pmc_ao_power_up =3D true,
> > > +     .uhsic_registers_shift =3D 0x400,
> > > +     .uhsic_tx_rtune =3D 8,  /* 50 ohm */
> > >  };
> > >
> > >  static const struct of_device_id tegra_usb_phy_id_table[] =3D {
> > > @@ -1360,6 +1586,7 @@ static int tegra_usb_phy_probe(struct platform_=
device *pdev)
> > >       tegra_phy->phy_type =3D of_usb_get_phy_mode(np);
> > >       switch (tegra_phy->phy_type) {
> > >       case USBPHY_INTERFACE_MODE_UTMI:
> > > +     case USBPHY_INTERFACE_MODE_HSIC:
> > >               err =3D utmi_phy_probe(tegra_phy, pdev);
> > >               if (err)
> > >                       return err;
> > > diff --git a/include/linux/usb/tegra_usb_phy.h b/include/linux/usb/te=
gra_usb_phy.h
> > > index e394f4880b7e..4e79f1c2173a 100644
> > > --- a/include/linux/usb/tegra_usb_phy.h
> > > +++ b/include/linux/usb/tegra_usb_phy.h
> > > @@ -24,6 +24,9 @@ struct gpio_desc;
> > >   * requires_extra_tuning_parameters: true if xcvr_hsslew, hssquelch_=
level
> > >   *      and hsdiscon_level should be set for adequate signal quality
> > >   * requires_pmc_ao_power_up: true if USB AO is powered down by defau=
lt
> > > + * uhsic_registers_shift: for Tegra30+ where HSIC registers were shi=
fted
> > > + *      comparing to Tegra20 by 0x400, since Tegra20 has no UTMIP on=
 PHY2
> > > + * uhsic_tx_rtune: fine tuned 50 Ohm termination resistor for NMOS/P=
MOS driver
> > >   */
> > >
> > >  struct tegra_phy_soc_config {
> > > @@ -32,6 +35,8 @@ struct tegra_phy_soc_config {
> > >       bool requires_usbmode_setup;
> > >       bool requires_extra_tuning_parameters;
> > >       bool requires_pmc_ao_power_up;
> > > +     u32 uhsic_registers_shift;
> >
> > I would rather call this 'uhsic_registers_offset'. Shift first brings t=
o mind bitshifts, and we often have fields in these config structs for bit =
shifts called '*_shift'.
> >
>=20
> Yes, offset seems more appropriate.
>=20
> > > +     u32 uhsic_tx_rtune;
> > >  };
> > >
> > >  struct tegra_utmip_config {
> > >
>=20
> Mikko, thank you for your review, since HSIC patches already were
> picked into linux/next I will prepare a few followup patches to
> address some of uncertainties.

Thank you!



