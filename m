Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012004.outbound.protection.outlook.com [40.93.195.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E829A15E8B;
	Tue, 11 Nov 2025 07:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762847904; cv=fail; b=un4XlhoVc/POrv/MlpAyoFH4pezdUZzPsNW0VCNO20YjuelstI5QvjQX8y5eZUG0eZQ3aGQSWNIEN2clqOYxdrvknYVUiJqoCOcDqOQIEUehnGJs4ZThCEJAKvYj7ltUAjuyoRbV4og806bwdavddjes+uVrLYr9tZcX0Jmsybk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762847904; c=relaxed/simple;
	bh=wqodZCyRApjusVsj0RyKwKkwQFAyyB+NT3LuJ4E/W8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hWIvJi9dzw7cHnmPUlO+SG7Hxk1por+ZQgYxkd+jzUBAFe1JfvcW6itOVGNK4sz/AUyaQCAyp8sFt2+SLhwffMMVeSYj1pgkuYpQZO9DqR2X3xxsMiBa+gl8DncGIbfUCWavO6WMArCfq6dMsEpUfhLxKdE7FX6yZvhZKRD3M4k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WXimfxTc; arc=fail smtp.client-ip=40.93.195.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WXimfxTc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KnQCbMXbIZr32kWbMnA67MXwXuHvycP17Q4fThXorIpN96jPJ6sog7lElaCqTuBHHWrLYc36R2HHPG4fg4+6ewA0tGfW4AYS9vAJK79WuPVkseTtP8JioRlosxjrj379RHr8PjQdhETQuASuIjyalT6Skdfmb1+Cx9MsI0IsJR1qD3DQvrXtEdXwrNK+j6avVDXnsQcxlVkar63pj6YhG+oZsGGoPfYhi1KGDDctVLUHEE7h8n4DmqJh+uKzpNaCywpDiarEKTehIIdTOjoynZaMxJLURhEGwvavOqfxT2KfFW9HAiHFogPlipUxCWMyUEdkfAt6rP6m5okffkytrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6zTYLWjkEkK0nUk9zQtfK4uE0zQ7ATy1Kky8Npx/f7s=;
 b=jkpkJDF2Fvfm4WciSFJrOimdLMkweAiFQYlrdiUDHGuf1uDjbCmi+o/vXMOBCLaxUSVxh4EIJOMDi9DmGHiI3Z7NtjBtvBeSjWhE9XiFfcM0ZM2HZQ0y3AszbGc+dKEuq6XuvGtHZW25ec8SJFILefIAu396Ak5BqzKrD2rcUXojgJ7z0Ea0GqgnCA/78tXT2+Dcp9vDEJnHXO51b8zqSaMckvd6MKcoZ/IxwYzCNAxKdxCv+PnEtb4BVe+7660SKMehjrvF4CmTO+9oa46TVGotPuVAhzh0zVwxFp913Zrs+hgfr1Ys/MSqXtR6XNFnQjFeu5S6G/djw+zxOkZboA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6zTYLWjkEkK0nUk9zQtfK4uE0zQ7ATy1Kky8Npx/f7s=;
 b=WXimfxTcToIBQ8Yty0spLxxgoGGippy/yfBhE213a6ZcZNKYngJPI0rHNqkTpUmBInwk4ayu7mqMpBXBOf1eN6VmDSo7wz/u91TdI1jSKpvlp+fobBAUhC2WaRPn4IHRmZn9JrBG0Bm5Ny158DDVdhslnzwniDRa5jopuPBd72zREOHxFAN3CmtYRtVGYJghs8Go+hh1lQj3EfGGsS/M5vHwwCr7o0ESvFt37TU0PoLOFmTZfPSYgk6YozYxLpL+D1XTBhZhdq6T+F52cdV1T9lsxDUcUk173LtZHmncX/do1c4t4RN0KoaAyEw1ScN4iyUC7zjILLPjUIEKXjSFKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 CY8PR12MB7122.namprd12.prod.outlook.com (2603:10b6:930:61::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.16; Tue, 11 Nov 2025 07:58:19 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 07:58:19 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mturquette@baylibre.com,
 sboyd@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com,
 Alex Tran <alex.t.tran@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alex Tran <alex.t.tran@gmail.com>
Subject:
 Re: [PATCH v1] clk: tegra: clk-dfll: scale force_val with coefficient
 according to whether cg_scale is set
Date: Tue, 11 Nov 2025 16:58:05 +0900
Message-ID: <2464252.ElGaqSPkdT@senjougahara>
In-Reply-To: <20251026231859.823231-1-alex.t.tran@gmail.com>
References: <20251026231859.823231-1-alex.t.tran@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TY4P286CA0025.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b0::7) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|CY8PR12MB7122:EE_
X-MS-Office365-Filtering-Correlation-Id: cdf99b25-52a0-458f-1e6d-08de20f813f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|10070799003|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VTNadVd1MkxmMUZ3d1BUMFJhRnVmaGxVQzByS0ZJYUFFN3JXdTdTdW5UNGxp?=
 =?utf-8?B?TmduVDlJZUplUUNRbENLSE42eWdudmpaODVvWDE3dFhxQ1NPekErbU5qQ2Fo?=
 =?utf-8?B?UTJiZTY2c0ljb3FjY1hFb0lWR21iVmsxM2oxZXpQZVNYZkhlTjhORUI5M3BB?=
 =?utf-8?B?LzhLSVc1cEVmNDVhb0ZibmI5akxtOHZ2cHFhQzhtOTI3R3BBZVVRRjNpVzNQ?=
 =?utf-8?B?L0IvSkpTVlFqRFNNNUowSGttZnJmRTZWWUlDOEdiMkxnK3o2TzVtWXVyYVdS?=
 =?utf-8?B?MEUrUEpDdFJuV1k5WTdsNm1mZ0ZhdXNkcGM1L01tOWxRZUJ6bzZ5Y2JZYmhH?=
 =?utf-8?B?NkpJcFYyTFl4OGVWaE9uNnQydUFTM2x1d25ubSt5dFJCa0VoYkx3aWtMdktY?=
 =?utf-8?B?Q0pZaVVSSWN6K1hyVTZHdlB5eWQydXB4eU1XSERiMU1Bb25tVUlaSk84QWtO?=
 =?utf-8?B?dmVJZUtoQ3lFemRTaGdGdVlSQkk1aUJzdTY4OG53eXdWTnBCNmt0RkNpMnk3?=
 =?utf-8?B?MStDa3JNUnVyelV1RnBwZTJJbkg2Q2FSMStaMDlLMFluVnlXYXBUZE8vWURa?=
 =?utf-8?B?bTFFaVQxckFRWDh3Tm1oN2V1Rk5OMFdGRnRWNUdSK1lJeGJXazVTbjBOcDlV?=
 =?utf-8?B?d2ZxTWpDWkoreHoyMzVUeWNSV29HWTN5d2Z5UGJxekhGU2JLUURNeXF0bmUv?=
 =?utf-8?B?dkZ5TjBJS2hjWWJuWE5wS2ExYWNneEtFNVNHY01vNUp6S1NUaXM1cUN0NEhN?=
 =?utf-8?B?NWlCTXpyRS81V3BNYmM5QVRuWTVxRWdFZFJkZ2ExMDU1SEI0Z0hHRkNzZkE0?=
 =?utf-8?B?K1hzVENLNXhkN2IyNTlQL1NVWnFqSXBkSEJkM01HeE4wK3hEcTFjWVg5eGY2?=
 =?utf-8?B?ZDZKdk53c1ZGd0VoaitXUGJNeG0vRkpOaUJUamQyUkx6bzRDUEpaRVpMcExD?=
 =?utf-8?B?U2Y0YktIaVJCem9CNk1WalM5c1MvWU84UlNQTThlNWFWaHFsK3RiY2VyU01z?=
 =?utf-8?B?T1RoQlIxdERjdkdhbE5xUWdIdy95QTl3RmcyeXlIT2lHM2xnb1VXZWdOM2pv?=
 =?utf-8?B?aDhCZnI2TVJVN2cyZ2Z5OThGQ3BKTk9IQkthRGJLZ25wMnJ2OFkvbkJtbVNP?=
 =?utf-8?B?aHVYTGkyMjBJSHUzaHVySFVrSFJrTVoxMFA3dVFtQUp3QlhYcU9razZtN2Z5?=
 =?utf-8?B?TjV2MXNvNU1aSFFCMkQ0S1pEOG54bkVJWXhvcE11enlDWG5sQ0VJZkRvU2tp?=
 =?utf-8?B?MzlleVZ6UUsyTlozWGNXUXFtcXhBbncwTTRabVBTamZJVzFBT1llNmhET05T?=
 =?utf-8?B?WDFqbU5IaE1UN3JUaEtJbFRvQ1pQd0lGL2dsU1h4RkNIR2JUR1lKMVF5dEkx?=
 =?utf-8?B?UitMMFk4Mlp1QWJENGtjTE8xZ2p0TmF6eUpDNERONlg3UWRMelJJWHdIMXFP?=
 =?utf-8?B?YmR2cmVXeVJuc1lKdEFzUjhlNWtFcVhoWVV1TDBUU2JYSHFoU3pxTE0zaGVQ?=
 =?utf-8?B?ZTd0eVRlNDlGRUZqMFF1VTJsVEpGU3V6MVpkTUxDdXZuZVppMGZCOWVEUGt3?=
 =?utf-8?B?U0FqWC9iNFFEVFYwQTVHSVE4cFFvL3FWbmlPMTFaR0hNRHRpQ3cvOTZSNk1C?=
 =?utf-8?B?VnMyMmdYNTF6WllrQ3BYaGFmbERYRWFORG8xM215TFQwWVVxZS8vRTJUdzBz?=
 =?utf-8?B?QmsrZlRaTXBzQk0xOUdpQ1dGSFlNWVNmWml3em5oY1J2NjdYWStsSjg0eUE4?=
 =?utf-8?B?YWpmb0dJVys2aitHcEhac0Z3NWxESVFJNmFnVW5HcnpZZGVFcHdsWEJ1NFQz?=
 =?utf-8?B?L1ltblg2TGVTMjd1Sk5Rd3U3b1NwOEpSL3RnTnFKc2wxVDJnbDhJV01JbWZO?=
 =?utf-8?B?MTN3cUtwV1RCcFJYWTJKSWR6Y0FkemVhTVVSZ3MraTZTWW5sUDVRVEZNNkg3?=
 =?utf-8?Q?HKonsAsGb0lr5y6vuWGnDAOb5L613IAw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6494.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SjdacDBiYzY3NmU5NDF1Ly9NVDJDSW5WYi9jRFpoQlE1VTlQc0xrU3BoWXMx?=
 =?utf-8?B?OHlhZUszdnpmTXdpVFUyQWZObVYwYy90MzB3QVp5T0xUdmJIbnhpZlM2SjhQ?=
 =?utf-8?B?ZnJiNmxpc29kMWkrL2hhVitrWmJBS0dqbGVSSElaQjhHRUQ3WWZBekY4U3JE?=
 =?utf-8?B?MGhhd2F3UVM4ZTZzMmZxWU1VQUlDZE5LZ1RFVWtvMnVXN2ZHUGs4elN2UThT?=
 =?utf-8?B?alhKUWtyQnJycXVXLytKZjFEai90WU8rNnp0N1FTSnUzUzFCdVFndXRHYzFK?=
 =?utf-8?B?WE5wVUhTQXFCeHI2YjI4ZmtQQ240bjNXU0FGU2VRN1h6aTY4cnZSKy90STht?=
 =?utf-8?B?Qy9IcEtVdUhOYncxbTBLRThGdDZiVTJweTJNUnJKS053TGc5aWtoMjZzd3BE?=
 =?utf-8?B?UmYvQy9LNGh2OFFuME5ndnBEVTJrU0dXK1pST2trL0EvbG5mQThjLys3dU02?=
 =?utf-8?B?cVJUMUFlTzNWRXlLVEZhMzZRa2RMdXNiY2d4cm9jTEZabjVMS1FOS092eFRy?=
 =?utf-8?B?UzFtNE1UWVQ5VnV5UUdzSVI2d2NzT2h6a1BpTXpTLzV4VGVjUFZodnoyNDBu?=
 =?utf-8?B?NEx5emhMMlpIalNJK3dhdEtBcnFYTmFLMjRPcCt1cGpCQU1yQWlSR2JTbk9o?=
 =?utf-8?B?ZlJ0K2dacWxwZ1VYM0prb21JdzlSRVRJNCtsRjNWMGtxa3NBM0o0ZXVDc2Fm?=
 =?utf-8?B?U2NnTHFzR0xrT2I4cmpFYjBTKy9wYURaYnlJb2FXNjVvZjdPSnVET1BrakVB?=
 =?utf-8?B?Zm5MMm5PTnp6WmlXZ0tuZGppNXdYS2R3Y3N5cXFrM255eXViY1EvSDR0SmM3?=
 =?utf-8?B?d1U5Tm4wcVpHdVFrdHJERVYxTUo1Mm9UT1NXSGFVV2RtaVFLbWUxYnljcit4?=
 =?utf-8?B?c0J2MG9xSkNVL2VmT0E4dTExSExZTjJmbXByN1dpR21PV2JlTTdzM1JKUUtk?=
 =?utf-8?B?TGFobnNzM2J5RVFtUnhXZ3UwbjBnSWQwZlpYUHVmWXdyYmttb0F1a3ZZMmMw?=
 =?utf-8?B?Rk9UaWN1aW8zZnNsS281bzdYTGhqM3BlN2tKOW5TVXpBZStYSzJWYklaNURT?=
 =?utf-8?B?TVdZSHA2Qk93VXpJRHlqblVjb0JRWGZManBXZ3BBdHlVczhCMDlHVElNbXlT?=
 =?utf-8?B?dytNVklUQm5vSWlKZm0zOTdmTk9iS3NNUEJXamtnbVpYM2RkdlF5VjRwV2ta?=
 =?utf-8?B?QjdoOHNlTlY1NE81NDNzYlFEb2l5Tkx5LzdXMzdtanlCOE9nNS9GRWp1S21G?=
 =?utf-8?B?VkUxSzF2SGJSUUtORHdNSEZFYWJKaE9QaUowamU2YllSUVRVejRwblJKeEMr?=
 =?utf-8?B?TzNFK3VQRzRaQlVGNmhzbHhQWUx0NmN6UU5UQjNoeDNmS1REQWcvWE9OTjRN?=
 =?utf-8?B?TjBqWHhZcHNlUzA0WXg0OGhDOEpFOG9OVUp6RWZIUnZhbnhzaGg0L1JsMVlJ?=
 =?utf-8?B?clg1VE8vaVFyb3JTVnQvRG9UbGlFZ1FXRW9sMzBhbjI4N2JXbGsrRzBUUjVP?=
 =?utf-8?B?RXZlMTBpUkQ5VDRmVi80U3N4S0J4RWVDcXNqMHBObEhSeEc4YnNhbldWYS82?=
 =?utf-8?B?ZnlMODlhOTlwNTd5clk2blZ5Q3ZDZEgrNDkwYXpWYXE1ZmpIUWhLT2c1SG9K?=
 =?utf-8?B?OStkVXBLZmc3anVvYlpjWTcydW1idzRwcU0zb2lFNmlqSzkvWXM5ZzBZeHNM?=
 =?utf-8?B?VVgxeHFhV2RINEFsVnhEY09FQWFkdG16RGhqVmhiWkdiV05QdTIrbFlnSUdr?=
 =?utf-8?B?S01LMDV4bWp1OTBiL3drajNwNUlEVzNadkdPQ2hCczdCaGlkaEdsb0NTR05X?=
 =?utf-8?B?ZzhNQkJ0aFd6YWFoOHpsMDlRL0RUMjVJVG9Ma1BNSStxWWxhdDZ6eU1Sd0ps?=
 =?utf-8?B?ZG5pZ2VwQ0dFcDFrRldabUN4M3lrS25NL2xhZTlFVDZ2MFJqSWlGdDVGdU1N?=
 =?utf-8?B?OGVwOFo0YUxaRTk4WU1tUTkvSGRJUmt0WXVWRVJLM2s4ZUZhR3pYdzVYaXU2?=
 =?utf-8?B?U211S3BmQ3AzbFprcEIxWEw3dmdQcGNaMXVYcThiZlVBMXFtRVVpQUkrRU5G?=
 =?utf-8?B?RTRSNVpTOGwyR3kya2FxeHVpRkpIRzJvNVFHYWRaVTdKK21NMkgxZzllcUhm?=
 =?utf-8?B?MmU2UzN6em1rVWV5YUFiMXRjQTZ1WXp5NmFpK0JiOE1nQXFyd2FsSWpPZTVQ?=
 =?utf-8?B?MXZnTzdBRFBoY2ljVE1peEpicEM1bnl6Ni9hZlRvSU9SWU1sZWM1VklPc21W?=
 =?utf-8?B?M2FHcm9Md0xicXRJcWJJV1NrdlVRPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdf99b25-52a0-458f-1e6d-08de20f813f9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 07:58:19.4238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cu/0nidkTr+tzhhU6SIpDftinq9FI+0Arkgeipc1ICmolASEoZMyDU2Bw7IwrELKy32596S8h0gHDoRFJv1A7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7122

On Monday, October 27, 2025 8:18=E2=80=AFAM Alex Tran wrote:
> force_val was hard coded to use a coefficient of 128,
> regardless of the cg_scale configuration. This should instead match the
> DFLL_PARAMS_CG_SCALE bit, use a coefficient of 128 when
> cg_scale is set, or 1 when not set.
>=20
> Signed-off-by: Alex Tran <alex.t.tran@gmail.com>
> ---
>  drivers/clk/tegra/clk-dfll.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-dfll.c
> index 22dc29432eff..3362983eedcf 100644
> --- a/drivers/clk/tegra/clk-dfll.c
> +++ b/drivers/clk/tegra/clk-dfll.c
> @@ -882,7 +882,7 @@ static void dfll_set_frequency_request(struct tegra_d=
fll *td,
>  {
>  	u32 val =3D 0;
>  	int force_val;
> -	int coef =3D 128; /* FIXME: td->cg_scale? */
> +	int coef =3D td->cg_scale ? 128 : 1;
> =20
>  	force_val =3D (req->lut_index - td->lut_safe) * coef / td->cg;
>  	force_val =3D clamp(force_val, FORCE_MIN, FORCE_MAX);
>=20

Are you seeing some concrete issue that this is fixing? While the current c=
ode indeed doesn't look correct, it matches what the downstream kernels do.=
 A quick grep doesn't find any device trees that set 'nvidia,cg-scale', so =
this patch would change the behavior from 128 to 1, and no longer be aligne=
d with downstream releases.

Mikko



