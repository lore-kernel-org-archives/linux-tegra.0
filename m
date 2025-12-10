Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010023.outbound.protection.outlook.com [52.101.201.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5956D288D2;
	Wed, 10 Dec 2025 04:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765339735; cv=fail; b=XXnpBelkNuTCv4E6HEHeUlIATkernes2ZDR1aoeLpJN8INYeagDhcCaOoAs97NAHVjtAxmjB+E4JQ31Ebkb4lHsCr4uRb7y8i4vVooMxprxzSq2b2ewzwFBMdKtlmoACuq54xQeYqlL2NUcbAoIBLCaycALpob8YXALqwj6ncF4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765339735; c=relaxed/simple;
	bh=q6vwR9H9liV6qYc/3gVrWIybJmNEUPQBoi4bBVeNajQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GvBoN02gA5pBsZ2YeNr9BSe+XXEtjCvJKyhUOq7R4V/nT3H+JceCoXTYmZ8FSTRcnfF+bR9m4dwTp/kIyOn13ZTFeMEsEGMUJiJQ/UcjV8XTkTk3EzzKlCVOJ2I8qBWhhEgAUe4XuJCE0EoEQdGM4hxDn1/btcInztCLnCzuonI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZuxMVDeN; arc=fail smtp.client-ip=52.101.201.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZuxMVDeN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yetB0srvbOWpoFfDMO2ILwbFfLvOi4S0YURMLbvaTT0VSL7Tg0hDoM5l5ismsgTAEdwLXe5ZqDdgdA0fsn6SSYLyIUWyzE/nhwtbOX6oMzEOMeHy00Cm1FXKwUUuYYd9mKR0uqwYEUQkBWcfTC/Fq4MS1gmTB+IE6v9WoJBsBRQv3tbrkJBMQJUbu711Tpb1v394QBD39u699T1mnniovDxAxINvqGF74lrFJgAa0SlDdiPnqegy6axHuSWZcnwVfkOJLSJ+vlzpnxPwx6r+hDQmDSdZ6Knc722CUrlCvq06gsFroNGwXPA2HuNgEpg/JTxbYHU6plMljAy8JplIuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xp96JkZM1aJ+W6uSYwl7Gpu1AxwOU4Yqi2R8LVck++8=;
 b=QuMApJy8sdCji+hD1GrsFA4IqqwGDE+GmTnS9tKAvJ/r8lobUbqWbw35XlCnDIOcxCl2k5hancHnhTvPbkHlJpiiOZa4abiInqaa2LkLY4kThGrWlCMeuEC7/TWA04/WEOhfBfcRbDHOvIMWyCSfYPpK+0cP9ncxEv/RR3d7Xd699qNNSE11pi0tebX7uNFdQXi+1W7S3j6BTeDuyweyCv1DnM60EiK0diLNxmUzvnPXzhMl0KwABoN2IF8anYaHf+EqGv0g4PZxRUFVrhIbigGDMCW09J5Vi/IlCN+n/CcCG34SE05niHwoDSYBVYdasNgxeRm5p2jGqiEmUIjLyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xp96JkZM1aJ+W6uSYwl7Gpu1AxwOU4Yqi2R8LVck++8=;
 b=ZuxMVDeNjTjiVIAIs6VfNH/GEUdESLsIrIoQk1m7J8sjUNXcxG+z3kJxiO3eeXl53DFaxStMCg3XufscezD6iOkZSXvZ0g9UaVgNkEQisH+5QyqhF4VBa9SOTOZRdwkKijz3trofIIhhgCP/Awn6bIPqD87+xvLacG+ZR/lFWh4+EQ0LgvgI8Vfl5ZZIcsxmPbPzGr1vIqsxDToYhXXBW+iwCWZ1bMt+YcZihZvQ9/WcJFHoVPANv20/xv4pjSTr3zpSfj3TWOZVXyc1Vb1S6slv3r4iizjfWucGG3pf7npsLXsIGYkaqHyG3Ywt9+09uTMtQqI2V3WVcf66F0OiTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by DM6PR12MB4041.namprd12.prod.outlook.com (2603:10b6:5:210::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Wed, 10 Dec
 2025 04:08:51 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%7]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 04:08:51 +0000
Message-ID: <7ffdd81b-927e-46f1-976c-91fe2fee4f07@nvidia.com>
Date: Wed, 10 Dec 2025 04:08:42 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] memory: tegra186-emc: Support non-bpmp icc scaling
To: Krzysztof Kozlowski <krzk@kernel.org>, Aaron Kling <webgeek1234@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20251027-tegra186-icc-p2-v4-0-e4e4f57e2103@gmail.com>
 <82c8dda8-6fcb-48f9-bdaa-f3d1431e41ae@nvidia.com>
 <CALHNRZ8nCojreFCMXfbBBhWAMtmWN-04XtuW8fEsVD9bw+-AzA@mail.gmail.com>
 <CALHNRZ-CO5i9jeLkEG2cmHxcW1bcLhxcBSxjmL2euHfQy8yr-w@mail.gmail.com>
 <e6ce190e-6df7-4c36-abca-f09df3cc80e7@nvidia.com>
 <99ca4992-5736-417d-854e-379542549bee@kernel.org>
 <7f3dad08-cff5-40c2-8e7f-f6441a3d6b91@nvidia.com>
 <d5d23eb5-f43c-4e4b-9926-3fba6ffd3acf@nvidia.com>
 <CALHNRZ8vFJyfFXbxFehWA9TGkdrEUy9Wsm-DxEOT=tVbYTcU5Q@mail.gmail.com>
 <249bbe7e-e2da-4493-bdd5-8f4b17aff8fe@nvidia.com>
 <CALHNRZ8uPaKqSpFWkmYZn==Xw=rxh95Xm0_6LPN1HDj20zofqw@mail.gmail.com>
 <d16803e5-7b6d-4472-b50c-aa324cf52736@nvidia.com>
 <CALHNRZ83Q2Ha8VYoWAnqoCZQ=Fd9rtVRVLwRFxAY68ePQ29GHw@mail.gmail.com>
 <29cf2c16-3a0e-42c5-a083-16f77ae5d09a@nvidia.com>
 <63be3373-1ab4-4aa4-aa7a-0175727aa9a3@kernel.org>
 <CALHNRZ83EcVnyBYADsuXtMu9omBd8WW+7reyb4GX8FfJ4sOcyw@mail.gmail.com>
 <83142b0c-0743-4a23-8846-e9f5e72a7677@kernel.org>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <83142b0c-0743-4a23-8846-e9f5e72a7677@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KU2P306CA0026.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:3b::10) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|DM6PR12MB4041:EE_
X-MS-Office365-Filtering-Correlation-Id: e9608a5d-1357-4954-8d73-08de37a1d397
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dVpmTmVPV2p5L0JxUGg3MTJGWFM2VXp6QitPR2o4eU1lS2d5SDJ0UTNDMjFF?=
 =?utf-8?B?U2dIdEJKWE5QcUpVRlZObXFOVGtURWZoWlNaTCtxMU14aGF2ZWlwRFY3Wmhv?=
 =?utf-8?B?TFFmVzFWT0FidjhrUVlXUEZCbHo5dHpBNmd3clVZRXVwWjZhZkxkM09FRGRO?=
 =?utf-8?B?ckV1MUN1aVVhbFJsSm80dXVPU2VOZ1liQjZLcU5NVjFqb2lhbGh3akEzcTlV?=
 =?utf-8?B?eCtUaXpycnYzYnZ0S2xxdWxFeHBkN3dFL3F2N3hQNElNdUs3WlRmeEt6THBB?=
 =?utf-8?B?QmsvN0NCbEd0bHBMdDR3d2lqRVlnY0Y2YU1CcWFjbWtuU3diT2pZMlBQcWda?=
 =?utf-8?B?R3lFd3hLN0hLcmdIVllTYURYNHI5S3FTK3ZSMXNTdUZQZDFZckZLY3VwYUFZ?=
 =?utf-8?B?WnVZUmJGNG14ZnUxb2hFQW9neTNOSmtVQllGWlNCcWVQWWlySnc0NXF1dld3?=
 =?utf-8?B?MVVYY2JRZ1FkSHh1VlhRL2dWN3hFanA2ZmFuM09WTUlBb3BndHQxYzdYSDEx?=
 =?utf-8?B?NVNjeEMxaHZEZUZBWUF1RnhoQm8zQW5jTW8yczJqM1F4WlB5M3dYdHZxWXZx?=
 =?utf-8?B?Q0pxbWdqaWc5cGJRKzBrcWRWSHgzYnVGWXJlTzZLbnduNEprcEVEWnE1enZt?=
 =?utf-8?B?MnpCeGhPdzVDWkJ5RXkraVdxK1Eya01Ca1N1NzBxaXAvbnd6UE1kV3FJcUs5?=
 =?utf-8?B?eW1zMFpkeXNtSVk1RndUY1JFVFdWNUg3NlBIMm9oSVc3NUVlMnhBSVFadklv?=
 =?utf-8?B?QTE5UytJS2VaNGoraTdrVHhGYkk4MVdQVnVMN3hxdFFXemZ3RGJoUkE2ZHVq?=
 =?utf-8?B?a0lLNU8xM08zSmdkS0RqS2xRRUdpOFdVd0NJT1JzeHkyVEhlOVBRVjMyMDdR?=
 =?utf-8?B?c01RWDR5L3BRMTZmK3BjdEExUkJOaUpRQ2k5MTRkRkRrNmZqcGhDeGNGdlpn?=
 =?utf-8?B?bk9XZmV6V29WR3BxZGFVYzIwYnJISytpRGNBeWQvQjlYRXFEcytUeGtnZHBy?=
 =?utf-8?B?UDNoVTRRbjlZTURRNXM3L2g0a0tDVW9CZ2dKOG4wV2lOUU1JWWFkMGdPMWo5?=
 =?utf-8?B?Wi9Deko0aVNiMC9mNnFFMTR4RFRlNlVHY0VwRVpMWHMxZUQyaWZObXlKNkpJ?=
 =?utf-8?B?cTlVVnlkNmlXandyWDc0V0RSUzg1S2pNK2FKMWMrRGpJLzlGWTVjNlRrOVpx?=
 =?utf-8?B?aDNGVlZETW44T3RoclRDeW91dXpzRnpFb0dJNUdCanRob2hGZkVDbEl0Ulp3?=
 =?utf-8?B?U0ZjeEI5bUlpN1Q2cmhwOHZuditnMnFSY3RqRFFsT3JYMG9qSVJmbWdLR2dm?=
 =?utf-8?B?dDdsSHZQNGhNZ1NFZVRCeGw1c2ZQTWVSOThvSUdrajlsZEFMR3c5bFBjbUc5?=
 =?utf-8?B?Y0kzRGdHUTEvcHJUUjlEam9adWhZemV1b3pqTFJKVUJqZ3M2TU44d0JKVy8y?=
 =?utf-8?B?bFJZNm80K3RQNU1ZZStrTTBkNTlwQzB2VVRjSXcyT1ZPYWgyVlVUWi9weDc3?=
 =?utf-8?B?SXNxaGVQRTJJVUw2d1I4VWorSlY5WTJaenNLOUxndUkvaVpDZkJyaHBWdy9J?=
 =?utf-8?B?QjMxd1NadS9CUHBRd3NadDhKeFlyR1Y3eGtZUGk3bjFMSEdFbGM3aDVtSFda?=
 =?utf-8?B?cHBzK2szR0ovWGllTjN0UkVpRmN4Qy9kUnozNTFCYnhIQ21keUE0S0ZpWkdR?=
 =?utf-8?B?VHFnUnpScXJEOXpWeE5iNWdDT1FSZ0sxMU94Q1RHbnM4MjE1aGZtcFdvRHYx?=
 =?utf-8?B?S3lLKzhSOEZCOG0wVFI0NngxN2czOXlxQzgwMCs3RG45dlkyOXZnc1R0dXFy?=
 =?utf-8?B?dWRnV01sTGNLQVZXT2dkSHZlSDZLVFM3b05tYURnOHo4cExIUGpCNjAybGVt?=
 =?utf-8?B?UDJMTlhUWFNZY1FrTVg5RmxzbC9lSng0ay9lYlJCNlVwSnlFbS9XVUoxMFdO?=
 =?utf-8?Q?uW4j8VR6dzvNT0l2gg2jaOJS/td4LfC5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NmdSeW5NV0psSzM3Wk93enlJWHlxdm1zMENYMjhvZjV0NHBjcWNqRGlwTXd3?=
 =?utf-8?B?VVZBaUt3VzJYSkU5MVdyVTFibDY0R3paQnNzSHRWWTlPYzJ1Zlg4ZlBMMHYy?=
 =?utf-8?B?TVRXTWhWM3RUV29uOXkvVEl5NmtCeEZDTkE2dzdIWW5NUE5iUlZWQ1pRVDlu?=
 =?utf-8?B?cS9sZFVIZWdzU2lDK1ZvOEY2aVhVZ1FqNDQ4N2xBdmUwWHBvYUkzRXZVa3hC?=
 =?utf-8?B?M1RtdDJENjV4V0szMHNtd2Fac3Z5c0dMYVZiTUJ2U3lvOUM0VGxMUkEydXBN?=
 =?utf-8?B?Q2d0VTVZTlRyUGxFZHAzMWpqTk93NTV2ZTVRNVRMNzgzMHFXWGp1ZHVzSGhR?=
 =?utf-8?B?ZWNPZHQxQkZhVTE4dWErU1Q5MHBCMEhZOW5aSTQ5MGlyeVRyRyt4T3BCSSt6?=
 =?utf-8?B?eUJTL3ZOSC9vNnBJZjRqN3VMdUREMUh0T2FldzEwQkxxUkdnNlRyQUtpeEpF?=
 =?utf-8?B?MVIxTEpXYUR3QmdIT21nUUFqcFFTdFNrRW1EZEVYeU1kNjFOVFA5WFh1Tk44?=
 =?utf-8?B?dWw5RzY1M2FxQ2JZU3pSaHIzWlFLSUF2NGkycjRXbWw3NnhkbFVDZnlRMnIy?=
 =?utf-8?B?dzRjbjE1QUtUMTlZRHpJU0xOamRIVGVMVGpxVS9TZUtaTVR3VkxheFc5RFVX?=
 =?utf-8?B?WXVTRGZvbDcyazk2RGV2dEhCNXB6TUI4R3JHZkpaRFErOWp5ZkNXdGNxWmtr?=
 =?utf-8?B?M0NXdHB2YlphekRqNEVQUnFRN0d3QUMxbVlFTDI3bzRla0dpZEY0MzlLczIw?=
 =?utf-8?B?U1ZBMElhOUw4bFI5VDZuWmpFRWxJbFI1alA5VG93Z2JzbGttWVpPdGNWZldU?=
 =?utf-8?B?a2NWL29nUGNlN3F2QUg2ZXYxZmRNcjgwMGQyclB2aHdmTEExT2QwZ3pIT2Ji?=
 =?utf-8?B?SGxrVXlMRXIrWlZvM0lrcDhqWGY5ZjRwckpzNmxJOUFaTCtOUnZQZnZjRkc2?=
 =?utf-8?B?VzRnSUF6L2RISWR0OWx4N0VqWUw0bU9KT201NnFub05iTnF1NHBja2hnR0Iw?=
 =?utf-8?B?MXEyd01kYm14b0ZWQkRadHhlUDZsWDFxcHFKTkE4L0llMldPejNVWm5ETk9z?=
 =?utf-8?B?bEtNbFZXL1NtbXVmUnY2MlZUMDBWQU4yL29xdU9ZSld4aFNXUjNnQkRleFFQ?=
 =?utf-8?B?VU4zeURIQlJTclB1OHpaQk1DSjlLajBnUWxXck9UeVF0NjZJT1JwUVZXTFZ2?=
 =?utf-8?B?UHRHLzBJTUdzVnJMY04xWlc0eWRQVjJYa1pZSVVnK08wWUw5K3A1cmVKbEt5?=
 =?utf-8?B?ZjF4eDRIcm9QSXQ0ZjNINnFDOVRpZ0xQeWF2RkIyQ0YzTmUxRlBuK2xaWGNk?=
 =?utf-8?B?MFRFWmNXK1NZa0c3UHZhbmVvMWs2eFIrYWtsYllMd2VwMVorQ3U5TDJUSjd4?=
 =?utf-8?B?YmU4SGlsT3NjeWhxWlRObmdDbU9PTm1XV0Q3WC96Y0hRN212bzBXY1BpOU9h?=
 =?utf-8?B?ZjZXQU44TmpNUDZNVVZTR3I2bjg3OGdjL3RMWlpBa05hOWxnaW9JU3lrNHMr?=
 =?utf-8?B?QVBlNVNDSlpjLzhCTnUvTnNJc0V0enNOR29KQ1c2MXA1MGQ0STBLZ1oxSVo0?=
 =?utf-8?B?czZOQWV0MDZBbHc3QU9CRENackFmZGFLay9KNWtycDRyelVRS3c2UWtmVTlZ?=
 =?utf-8?B?bkROcHdLc1oxRDh2REFFNnlPY3l3YzJ3cGMzZjVicDVWWUZwR2dqS2JPUmFN?=
 =?utf-8?B?VzZYbCtwK2dMbEFuSFFxRzBvWUV1aDNVbnpMNEZPcEEwS2EwRE8vUGI5SDBT?=
 =?utf-8?B?NUdHMXY0ZmtXdlBDRm5uUTlwSDVQMWM3T3dWN1dBdERhTkdjVFRSNko3cnlr?=
 =?utf-8?B?bXpJVlFiclVtZm5SOXNKWUt2c2FzUjlCdCtvTnAzRlRwM3AzQkZFMGlVWnVO?=
 =?utf-8?B?VXk1cWdFT21NME5qTE5CV3lCQ3NoQWRFZUNrUkFCUzVDL2xBeHdmVCthN1BI?=
 =?utf-8?B?OGhGb2Y1U0J6UnllWm8ySmtvdW5PeVFHdExvWkdGcG5lN0x1Q3BSd2RSMFNm?=
 =?utf-8?B?dGV3TEk0UlJRTkJ0Q1pGbkptSk1IaEV4c1VNRmJDUTNncjl4aXpKU2JTWEIv?=
 =?utf-8?B?K3NQN1YyanBjU2Z1YWNBNXErRlBIRUdpZ0ZkZVJsN245alprMyszRUpTd2xX?=
 =?utf-8?Q?/aVNVIAkK2OPTVVpEgLw2QMSM?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9608a5d-1357-4954-8d73-08de37a1d397
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 04:08:51.5702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sxmH/lwNMs9/Po6ArfoD5uoE+hJpvCOmQFR8DUwqqPXbyPcUWTkQR5uR0xnTJfhXWuROlMIQXnlUVRMWcDj8VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4041


On 09/12/2025 05:53, Krzysztof Kozlowski wrote:
> On 09/12/2025 05:26, Aaron Kling wrote:
>> On Sat, Nov 22, 2025 at 6:01 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>
>>> On 21/11/2025 12:21, Jon Hunter wrote:
>>>>
>>>> On 12/11/2025 07:21, Aaron Kling wrote:
>>>>> On Wed, Nov 12, 2025 at 12:18 AM Jon Hunter <jonathanh@nvidia.com> wrote:
>>>>>>
>>>>>>
>>>>>> On 11/11/2025 23:17, Aaron Kling wrote:
>>>>>>
>>>>>> ...
>>>>>>
>>>>>>> Alright, I think I've got the picture of what's going on now. The
>>>>>>> standard arm64 defconfig enables the t194 pcie driver as a module. And
>>>>>>> my simple busybox ramdisk that I use for mainline regression testing
>>>>>>> isn't loading any modules. If I set the pcie driver to built-in, I
>>>>>>> replicate the issue. And I don't see the issue on my normal use case,
>>>>>>> because I have the dt changes as well.
>>>>>>>
>>>>>>> So it appears that the pcie driver submits icc bandwidth. And without
>>>>>>> cpufreq submitting bandwidth as well, the emc driver gets a very low
>>>>>>> number and thus sets a very low emc freq. The question becomes... what
>>>>>>> to do about it? If the related dt changes were submitted to
>>>>>>> linux-next, everything should fall into place. And I'm not sure where
>>>>>>> this falls on the severity scale since it doesn't full out break boot
>>>>>>> or prevent operation.
>>>>>>
>>>>>> Where are the related DT changes? If we can get these into -next and
>>>>>> lined up to be merged for v6.19, then that is fine. However, we should
>>>>>> not merge this for v6.19 without the DT changes.
>>>>>
>>>>> The dt changes are here [0].
>>>>
>>>> To confirm, applying the DT changes do not fix this for me. Thierry is
>>>> having a look at this to see if there is a way to fix this.
>>>>
>>>> BTW, I have also noticed that Thierry's memory frequency test [0] is
>>>> also failing on Tegra186. The test simply tries to set the frequency via
>>>> the sysfs and this is now failing. I am seeing ..
>>
>> With this patch dropped from -next, what needs to happen to get it
>> requeued? I gave an analysis over two weeks ago and have seen no
>> response since.
> 
> Hm, I did not see the root cause identified, so maybe I missed something.
> 
> Anyway, I am waiting for the patchset to be retested and resent. And
> testing MUST include kernel development process rules, including how
> patches are taken - see maintainer soc profile. Any dependencies must be
> clearly marked.

Yes me too. I am happy to re-test any updates.

Jon

-- 
nvpublic

