Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013046.outbound.protection.outlook.com [40.93.201.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D39337B95;
	Fri, 23 Jan 2026 06:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769151119; cv=fail; b=ewf/ClC+aoDcEy4tu2WIMaluscJcaHgMwYSv5m4nXOf5AQbd19EY1XVz9aoA8UBg3d0T6VImmE5QMPJL++xVdWUPUrwKSvLvFDmTUzIkMqwKLbDolTeeZpLwFjdu+ztCLPgKcyOFFHBDBYbjQ+/YAQj+0SvZ6qHan0DrKVmus10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769151119; c=relaxed/simple;
	bh=uBtZWoExAlUcj7ZWu5vavAFFIDE+F6EIvOMrqAoxv8M=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cSBtw/psIA65RpgT8bFkZJKIv0JRNkld50u9kSehvsGM3NlPFqBuBYAp8MLCSNzKuzSIiBFdV8kWQ/4NPaVI9Tm6ESBxWGICeYPC8MGjjefWVY1LF00Ct/2tNh+BfQF+leAeOwnAFtmuEMsdlANfzHU7blet2qvV2q57qAnBA9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tptKXkDX; arc=fail smtp.client-ip=40.93.201.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tptKXkDX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N8IjMqxAXAD1gblW1HRuYQ5L9IvM+UvKfdpIFOTX2xQysD5DlxNWtfj+wy5astnAJQKZRRYMmhkpd6LgWSFWVQiqKP5djrkdvcfYoB8uGzssazgbj8m3GEUInQyybKDxqpJu6Tpuqg8fur66AgWLZoNJCaj8kHSTdiQMixwKDBg3Syz+PbSD2w+hhm8BwVN1mRRsK1VIEzAdyEVpBCNe0FG2spek3b4DJqQiMJor6/XQ4p21yrKJCj3JmHtEIxuLGnRwEfkNOufnpN7cWmYehPCfKXK29A+5I+zIK2v/gyQn+RBx4Oxte44r4BNeCGUyMzI/do2aawPFowHsHNNdXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=peTmihulOX0Trhu7Z7eKPr6/HNlEmAakz05VBq3BnIQ=;
 b=Qg9NpDS+EnY3RLyUrJRn1UAi3Mi2UCgZhi10LHn+19IPUeVgYG6AeP18zt4nfu4BL83zc8AGmkuoI6lg7S/vScSDHnP1u1+u8gwcbDPM/Ms2IERhIGAot6j405k50g4bO0zxnMaQ8DDCFKeiinxt7UiXxGg3yJ7hgQ1edJWSkGuFHGH2YUsr8/zm9o1eEX2xosyYmsSb0oVUPtJsrn7thZzhe4KiH1KP7lnauTIXZLSP55zJad6BgL+5jRn9630pnRdD61TlxAbrH1hwita3W+29vVuTVXC5ksw7bgia/fcfY8UPLFpkv5OPNdFc0XMia70SSGNboaN1wNP8k/MVrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=peTmihulOX0Trhu7Z7eKPr6/HNlEmAakz05VBq3BnIQ=;
 b=tptKXkDX1itKhm9Lv4jCrEuo1PIOa87PfnMzkt59aWO+f8Cr8Wp+Dt7ewlQ/ZbMHbNYglH5cafILYuPG4uksUwU7tMk5q/tTz69xl163T4Q096C5xu/3Y9dl93DDpAe00c2IVQJ09H+tJ3MuccUVamky61+gCuGqwM4A90AMv9qnC90YRWx38kUn+8AW6iRKc4PlETaZkL1hTKACjgA1KU5971Gku7lyY91sebvs8TQWZo/b6WQs21JyxJwfvpz0cvD0k9xTwfBpFmFAr5ji9c1uFAITcEihFSWbBc/ZB63hVdzdHehuZIvKwiYdLyOmoTfNA3TXirO1RnbDF5UzPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5716.namprd12.prod.outlook.com (2603:10b6:208:373::14)
 by DS0PR12MB6533.namprd12.prod.outlook.com (2603:10b6:8:c2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 06:51:51 +0000
Received: from MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::bac8:2b43:2a64:4c76]) by MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::bac8:2b43:2a64:4c76%6]) with mapi id 15.20.9542.008; Fri, 23 Jan 2026
 06:51:50 +0000
Message-ID: <f6718c48-e953-4e30-bd22-8e06f4fb157d@nvidia.com>
Date: Fri, 23 Jan 2026 12:21:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc/tegra: pmc: Add PMC support for Tegra410
To: Jon Hunter <jonathanh@nvidia.com>, thierry.reding@gmail.com,
 jirislaby@kernel.org, pshete@nvidia.com, chleroy@kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260122110805.97899-1-kkartik@nvidia.com>
 <80ed9e52-9173-4e7b-8df9-aefe7294904d@nvidia.com>
Content-Language: en-US
From: Kartik Rajput <kkartik@nvidia.com>
In-Reply-To: <80ed9e52-9173-4e7b-8df9-aefe7294904d@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4P287CA0018.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:269::8) To MN0PR12MB5716.namprd12.prod.outlook.com
 (2603:10b6:208:373::14)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB5716:EE_|DS0PR12MB6533:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cd37425-7087-4d21-80ac-08de5a4be2b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YWQ2ck81emt5QkdaSENkdDR2Y1RUc29jWHRmcTYzVCtWWk1LVTk0UnRsQzNs?=
 =?utf-8?B?K2tmQzNHMmtOVnFwejhmd1R5Q1FPSzgzOGM1V1FqYUVYb2JVSVVIZ0R2WHZp?=
 =?utf-8?B?REtZK3BBY2lyK1ovUEtiUnEzRFZOZnN3T2RHMmFBZDVkYWIxVnlPZ0toTUl3?=
 =?utf-8?B?Wm44cHN2SmN5SkVRNG9FZzNBY3RUZmdVelBRemI3YlFaS1d5RktiVFR1TnUz?=
 =?utf-8?B?VTFoK2d6Y2JsWHRQaU0wUmxueGVIaWN0S1lEaXNuREQxNys3eENtOGIwTCs1?=
 =?utf-8?B?YlRrVkJJMzN5amROSFR4akJkTnVDUmE4UkhOaGpkQXdaRlkxbDhuWG5pdmdU?=
 =?utf-8?B?dEl1ejVxUWVsYmRTaGhWQitIeXBIeG51Tmw0UTI1Q1BKeWpRSWQ0LzF1SUpo?=
 =?utf-8?B?bVcrMVM2TTYwczR2RFlUQjg5Y0w2aTJiSUl5RkpCc0ZZTytoVmZ4OE9HT0pS?=
 =?utf-8?B?V0ZYam9mLzI0VGJ6dVd1emFWSVN5SzBoRUNnSzgxUEN1VzBtOGltaUg5ZGRK?=
 =?utf-8?B?cmRMVjRUOVdqaTFmenh5Vk5nUzl1aW0zK01BOEZvRXZmaTdHcEgvRHpxelZ4?=
 =?utf-8?B?b2QrSWMvbjFCbU5lZUQzS01xWnArcTZEKzNlZDE1NStZa2lPaGV0Ykw0eGtm?=
 =?utf-8?B?anlvbXZIN2xQYXV1OXh0a3hyQnhMTVhOUmJuS3RiSm4vZCswc0N2UWE0Um5L?=
 =?utf-8?B?b3ZhQlhiVmRSRXFUK3hjSUp0Y2t4OEVaL3NSMFFpKy8yY2dqN0Q4LzV6NHNI?=
 =?utf-8?B?YUxOcngzVnp2YUtlb0M4QlBicXhwWURiM2J6UWFZYVpscmVzZFJRdE5yVTMw?=
 =?utf-8?B?U21jQ3FaaTdwZjNqalI4LzdaMnN6eDhhU0hhSmUzZTZZNlN2T1QzS0RQYzlt?=
 =?utf-8?B?WThWU3lIbEtSZnhMWVZ6YzhHUHdLdEpTcTkwRmV0c01ITTVJMVJxajRSR2V5?=
 =?utf-8?B?eEV0d0JyTHI1RTArTHZvek96b1pHUHZhaVdhaU9PbzF5T3czYnNJV2psbm5Q?=
 =?utf-8?B?MTFnYXZjQ0RBWXQ3b0xpc0JydXN2SFlnUDh0S2p1WExnWW5lQ1JEenRpRllm?=
 =?utf-8?B?aU5QUllRU051RUMzK1llSThOeXMwMG9BRlNFS3hSeHJyNVJnVzUvelR6dksx?=
 =?utf-8?B?QVRMMTIwTFlWcWZ2cUk2KzQvbDBjV0Ftb0htaTBkbnN2MUt6YVMwaHBWUkJG?=
 =?utf-8?B?ODNCZ0FFaXVoZDhBeDJ3L3p3Ky91Qmo1cGhOUythdE90eXFIUzJLTlFjZmxV?=
 =?utf-8?B?Z3o0Y2lzcDJsbmJtTWxWUk53d21QQXhGSStoSk16YXZNdXpaSUtFbktzb0FY?=
 =?utf-8?B?QnZSLzkwQi82QUJKcWZPN2FmNlJteWRpRjFDNU02L21IS2NIOG5JN0Y3d2JY?=
 =?utf-8?B?SmlsRThXYXpoalBGZ0pYYVA1Z0I0a2NqSHg3M01iK0dlVzljdGhOVTRBUWVU?=
 =?utf-8?B?cFRQRnpIbzN0eDB0MDY0UFllV2FBaEw4S29jU2wzREphNkQ4b0pxdG0vbUpJ?=
 =?utf-8?B?Q3p4WDAxTnV6SHBUN1dpRUlTVEdDVkZBQ0htODUwQ3cra09tSnZBR1VvWTNM?=
 =?utf-8?B?bXVaSFc5S0dRVUpFaWFqTFU3c29COEgrbkFKYVF1Sm1yWkNtK1doUGxQaytH?=
 =?utf-8?B?c2NoMWZyYU8zNWZKTGVSbXdLaU1DZERMS3h5TnhhYWFNVTh6WSsxQ1l5YUl0?=
 =?utf-8?B?NmF5eXd6NTN3K3IvZDJTTXRWZlRmU1ZxRUw5K2NTM25wb1NZR2NJVnlrUGJ1?=
 =?utf-8?B?eUdkV3RIVkNicGtSZHhJS25oNXJDc1NucjdvV0VScWY5UG83WWVoeWNpM1RK?=
 =?utf-8?B?dk1xL3V1Vll4Nk1Ka0JVRExBcmRMdnlxMDVqNDdUU3NLcFdBZGlMVXcvb1Zt?=
 =?utf-8?B?U0JKTm9Dc3pXSzE5allRMCs0d0lManF5STJqSlUwcS9TVWNZbmVDUjYzYkN1?=
 =?utf-8?B?aWprbE1kS0J2VE0ya3Z4OEhSRFVLQ0hybjh4MzVqa1hsZEd2Y0pPYUhUd040?=
 =?utf-8?B?cWNpVzBBL0pJTVlNUVRUS2orUE1lQXorNnM1Q2RacFdMUEUvQjdueUxBQW5F?=
 =?utf-8?B?b3o4b1owQTdWa24yM3Zmb2lwWnAwWCtsZ3AxZTdGdmQ1RmdidGExaHVnVkZr?=
 =?utf-8?Q?s72c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5716.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UDFlcGhDaTk4Tk56ZGFqMDBTbnc5UjBTNHNtc1R4YTJOOXh6U3I5Zm14ZzhW?=
 =?utf-8?B?R0lUSmoxMnhVNDY3bnAvemoxVkx3M1pWUVJmbmJleElZd1lxeE1ramNhQklI?=
 =?utf-8?B?ZWwzL05lQVh5SGRnSnJabWFEaDRWQzFnWGplWU5ZQVpGQU5aV1BkOHUva3Yy?=
 =?utf-8?B?aDBxUzRNYitrYm5LaUVTUGdycVhERHlyclUvcDVpRDhDcm8wa2R4NzR3V1JL?=
 =?utf-8?B?Z2FZbWNZZ1d2T2VmSGNBdnhTbE5yVENWRFF2QlNSTFJ4VkFxUkg2TUtEVjhz?=
 =?utf-8?B?TEoyNXZNblNvMWhWd1V2UU1pQW93UzJVYzVlUXc2OXdCbG9sM29TbE00cGR1?=
 =?utf-8?B?bkx4bVQwMStvc28wTVpKYm9OK1JoYzFMaEV6YmhoaUJXU21zUElkTlFLWWhD?=
 =?utf-8?B?Vy9JRnIzWUEybUhBL0dHekdxZjF1V1FMeWJhSGMrcnlkMEliU2IweUZPZjND?=
 =?utf-8?B?bUZXbW1vc01uNzhOZmtKMVFrVnpuZ0tqbklJOG92eGNRWE0vNC96dThNd1BG?=
 =?utf-8?B?RzFoWUNaNk9VWXNFK3VpOVZBRy9MTnNueCszbmh2Y2hkQUpOVW9ybHBHUGFi?=
 =?utf-8?B?dDNJREo0ZjFhdm1IRmJBUC9JaFhQTFhFY2tTRWtlWjl5SGxyenJtQnNieEZ3?=
 =?utf-8?B?K3NvSDlyYTlodmxwY3JWbHVpZDd0MDY5cXNGejM1TlhEUWpEYWt4WVB5bXZu?=
 =?utf-8?B?RWt4Nm5ZajdoYXdGbmg4L3d4NzhSSEV0dnY4ekRaRzl1UTlxWlorVWJONHRY?=
 =?utf-8?B?ZjcvaXM2RjdTSk1sU3plRGF6WVhFY1hvNW11Z1lOVm9uK3ZnbkttR1FPMlNQ?=
 =?utf-8?B?eHhlWGlEbWU0S3ZMbkxrRDBGa1NqMU5wRlJxcjYrNjN5UU5YMHJEeEpEVTVQ?=
 =?utf-8?B?NFAwTkVqSDJPUkF3UVNvanJTZmc4OSt2Y2ZnL3ZkQVU4L0NDS3ZnaG9LMllL?=
 =?utf-8?B?VGJNQklGcVdoZ05lRUgxY0c0dE0vODl0MHEwalVEMHVlblFHT0hNc1NwaXFI?=
 =?utf-8?B?ZGs0R1ovWHB4QzRkVkFZaXpDVjdXK2JYcDhjaFhreHVuKzR1Ymk0ZVpzazZX?=
 =?utf-8?B?cTRkR0xqd0VXMTJnM3A2bmtKczliUzZXT05idjZ5cjd3QVpIamE5Qno1QUwx?=
 =?utf-8?B?b2JQVkEzZHBLZkFoS2ZRRTBmVGY1YWlJTW95SjRmcVN0aCtlc1pIb0NWR1pm?=
 =?utf-8?B?RW1KUnIyQnpTQmxqU1JkTE9pSkF4aDZHQnRrSzFRNTlBSWxIUHAycXo4Qkpo?=
 =?utf-8?B?eDEwN2xSTzZsZVU5WUV6c2p4U3NYVWkyb1dEZXJHY1JjRjM5TUlaWGJCT045?=
 =?utf-8?B?V1RQbU80c3NtZUo4eEZjRnJiQjJaM1hzUUFTdVNvdXRaUUttU1FxSTYwbFhE?=
 =?utf-8?B?STdQSlI0cG9aWVphcS9EdFFUOXJuK3V2QjNweEdxUUNHV2dhblFnSFlhNXUx?=
 =?utf-8?B?ZTFUVEVxVVBoS2RJTnFPMTZ3clhDcWdwcTQvUXlhbFd0SVY1YStZVHBndXlp?=
 =?utf-8?B?TEd0Ukp4WXc5eWZWdGM1ZGU5ZFJaL1IxMkw1aW9TZ0JOKzlkWUJYSDFTTHAw?=
 =?utf-8?B?QjdkRGpabG1DQWRoSXRzNyt6NjhvVE4zQ2svQmw0R3NBVSt5TEE3UFpvN1lI?=
 =?utf-8?B?cEFHYllsVFhqdEtsR0x3SWc4MHcxNm9pK3NsRzRaZldKUXlEOEU2UUU0L2pU?=
 =?utf-8?B?dWV6Wm9IWjVYYUlvZEpTcjM1aThoeVlWd0ZaaGxwdHlIY3BrNnJKTFpBTjd1?=
 =?utf-8?B?dHVaZE1wVEhQZzF2Z1NKSys2NmhDWTVUaUJJZzZKT1Bqd3RRRW5ZcmhYQTlL?=
 =?utf-8?B?NHhOQVZQK1J5Q0xRbWUrYXZvVGZ2K1lNWmxzcE1PeUJHQ2hDK0tpZW80Rkdm?=
 =?utf-8?B?QVQ0OEUrcVNQL3JOV003KzIrSkY2bmN6bDVVb3dWRlBBTVNhNmRhUXBXUXFF?=
 =?utf-8?B?ZWd5aFEzQ2dXKzR0TGg1aG44UEQyWEtJZWxDZ0c5bVBEMGlXaDlNS1lwWVNL?=
 =?utf-8?B?Vks1RFo5K0Jnc1hjQzNWd2ZsMjdhT01GUEd5NjJBUkNqcXFzZFNvYzQ2dWt3?=
 =?utf-8?B?eDdJUXA0dlhDWSt5c28ybGlXVXVEV01BTURuWW5HZjlDQ2gzdUJoQnNBNVlQ?=
 =?utf-8?B?ZjdzV2UvTVpSY1ZWQWJEL2NIMjdPNkFMb0poWTBSb25LanVDbzM0YWxIaUxN?=
 =?utf-8?B?Ylpza2tDQ3NPd2MySkVXRkxpUlZncDNJcndqZEZOL1p5RUNNSy9iKzdGdWlX?=
 =?utf-8?B?KzhzdWNlY3hXS2pMVHlaanFoZXE5TlVETlhNVXh5dXRmSEZ3cStmUmZvOG5r?=
 =?utf-8?B?YVFRbHZSU1ZLalJZVW1nUEJMVlh6ZUdHa2wrMWMzaEsvb0VFSFJDdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cd37425-7087-4d21-80ac-08de5a4be2b0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5716.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 06:51:50.9012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cMSVkJJoxr4bi7FbV3ElxF1gN8mB/82BOhiMywMfZZdEd4kmcqNVIOYuF63zdPEnXiLaCPB3APiocT0yuOkL+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6533

Hi Jon,

On 22/01/26 17:40, Jon Hunter wrote:
> 
> On 22/01/2026 11:08, Kartik Rajput wrote:
>> Tegra410 uses PMC driver only to retrieve system reset reason using PMC
>> sysfs. Tegra410 uses ACPI to probe PMC, unlike device-tree boot it does
>> not use the early initialisation sequence.
>>
>> Add PMC support for Tegra410.
> 
> Maybe ...
> 
> "Add PMC support for Tegra410 which uses the PMC driver ..."
> 
> 

Ack.

...

>> +static int tegra_pmc_acpi_probe(struct platform_device *pdev)
>> +{
>> +    pmc->soc = device_get_match_data(&pdev->dev);
>> +    pmc->dev = &pdev->dev;
>> +
>> +    pmc->base = devm_platform_ioremap_resource(pdev, 0);
>> +    if (IS_ERR(pmc->base))
>> +        return PTR_ERR(pmc->base);
>> +
>> +    tegra_pmc_reset_sysfs_init(pmc);
>> +    platform_set_drvdata(pdev, pmc);
>> +
>> +    return 0;
>> +}
> 
> Should we just define a tegra_pmc_probe_common() that is used for both DT and ACPI? The above is not specific to ACPI.
> 
  Do you mean something like?

	tegra_pmc_probe() {
		void __iomem *base;

		tegra_pmc_probe_common(dev, &base);

		if (is_acpi_node()) {
			pmc->base = base;
			return 0;
		}

		...

		// Continue DT specific initialisation.

		...

		// Clean-up early pmc->base mapping once the probe is successful.
	
		unmap(pmc->base)
		pmc->base = base;
	}

We can do this, but this will introduce some churn in the probe.
Having a separate tegra_pmc_acpi_probe() avoids this and keeps things neat.

Thanks,
Kartik
