Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2055.outbound.protection.outlook.com [40.107.93.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9125E25F7BD
	for <linux-tegra@vger.kernel.org>; Fri,  9 May 2025 21:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746825980; cv=fail; b=tQV9XhsuZpxiTlobtiaFaCYeaGLiA9883m0rl58VhPjEp5d1fh433gHI44ZXmepuDGUnNCJR+mTrcAC88oe4Ud7lCk/wMYV72/ZbvbO0HHyQVRPcVYNUOLiXEKPbtNC1um4SoASmuqTH6mNS1sxHi6qqKjqobi+ICHcsyC1xXyk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746825980; c=relaxed/simple;
	bh=EqqNpVWX1IcLhv4BEmte6H5YalilWOoYOgqhk7jnXb8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gGo+EYNJ9NMsClEQOvNAA/ZXKdbA6SNVzww2j1WzsTJrFagLFYL8CDmj/MLA+0OQ1SCFK6gtQy5MC++TWQ76ey2OQTx5RaDVD1zqGCXS644GMSZwjWjlKMNV2MZUzP0Yxfby6FIXktbPG2D5m2pAEqs+MiPKSObAbbJM7/6ZkR0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Bvc6vMrn; arc=fail smtp.client-ip=40.107.93.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Bvc6vMrn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bFh8Fkb5u3cgw7mAowL+zN54u/FNLe1914spdtssRVdjqZNOfvdBJMwpakwJ4EpuKWggkCXQR9zlsjPLY+Vpu5x5OAviRoeMqGrjLaOABIHOYiwhDcl70WSgXXSbUabKvb5WymapAfsz/fVT6uVbeVwq18BGVGNXUsC6HLLhJypL88vjL4biDfYOxMf5xTF0BhsoOUPYHwtYvqMgRMlGfCpa1aozEUu3zvULf/ZtXYn8RKqcXymaphPYDq7CT6L7hNhR1DoXC7ZLlmn/vf4KtrMexzEd3V00fqMN3yzb6Pdkv72EOVJ5eAN1HEMWZDVMk/FcaK4zwtEY0jQlp5Rprw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=siSoePbiUOm1c6JLvac5qpdltfnosR8bFWOAVnlA8Ug=;
 b=YDoROgpOJoV4eZDcSlNvFTIpSwHdBBP/IdRmSf32hmQj00RkhYAjqYiq6lxKi2r5RH3EVjR+1WpluwrPIpRhs4O+X+UL7JHTM0CEi2oiSL/b5+mD2Ga3nyOJFy91p8uFGjCVaxfPj32B1WtwqBHrUH3k8GnfZIvo9A1TPIVuc6FhpdqR6J/GYCrvfzxjURCWGOOTn4p2zqxp+cDI4KpjM/XxuW7CqVSvUnESpx/wVWGO2SFCYHmdT48AOlxCLD7080HgKVSXi60U4VLzPriFlkBC2RJErx+1fjK1anKzb5q+4RYu8Xnv5M1aYJodwFgZbHE14QSIM6MFwmrHyGEpIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=siSoePbiUOm1c6JLvac5qpdltfnosR8bFWOAVnlA8Ug=;
 b=Bvc6vMrngvCUFFnX7p/R9xUn36ESDIggSZ4+C1axEHo2vyLxBSRoihVAhxZabrwxfhIBQp5p9r6AJYAI2DngEVUVM8zzfimkkuryaW0p7zz+KOtkyERltsF8bXBf3QlGE277EJ4C0ziTjFMpaxtqGQrNJ/G3Z21G10nn5BpYM4hzesmSorHfInDuO5yOLMuxE2G+V5ZMEarsAplzOAJ+JpjgzkXRCFV12NpkbbXxISKOeluwFG/oeRX3dtGUaLAkhQ7pr43Fv2uaaoHnlvbx3cHvwk1oGHUmfKHJaCNhoKyzuMCUhZIQplpbKKyYqss6OJaW/KZdQ19vhcf1dpFyfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB8317.namprd12.prod.outlook.com (2603:10b6:8:f4::10) by
 SA0PR12MB7002.namprd12.prod.outlook.com (2603:10b6:806:2c0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Fri, 9 May
 2025 21:26:15 +0000
Received: from DS0PR12MB8317.namprd12.prod.outlook.com
 ([fe80::8ca4:5dd7:f617:f15c]) by DS0PR12MB8317.namprd12.prod.outlook.com
 ([fe80::8ca4:5dd7:f617:f15c%4]) with mapi id 15.20.8722.018; Fri, 9 May 2025
 21:26:15 +0000
From: Thierry Reding <treding@nvidia.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/3] arm64: tegra: Device tree changes for v6.16-rc1
Date: Fri,  9 May 2025 23:26:02 +0200
Message-ID: <20250509212604.2849901-3-treding@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250509212604.2849901-1-treding@nvidia.com>
References: <20250509212604.2849901-1-treding@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0379.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::11) To DS0PR12MB8317.namprd12.prod.outlook.com
 (2603:10b6:8:f4::10)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB8317:EE_|SA0PR12MB7002:EE_
X-MS-Office365-Filtering-Correlation-Id: 5817dd9b-6b01-4e90-3815-08dd8f4020dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|10070799003|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N0lUTm5jNDBYSEpvOVJCa01tamdBRkJsWlhaUFBCeGZWemRTYTNDd1k5RGNF?=
 =?utf-8?B?TjN2NHU2VzYvQXdnQ2x6M25xcEkwZlMxakdSbjFWTzVxMWt3bjhpUGNJczFZ?=
 =?utf-8?B?UkRQaWk4UFRLalZaRVBhWHdhdzlTMFdlRkFRUTJtZHE0NFo3RTgva2VvdW9l?=
 =?utf-8?B?TnJYWXR4c2xXUENGZ2puYU9xRElYbEM0VmFheGZZZWhwdFM1N3Q0U1F1M0cr?=
 =?utf-8?B?ZzUzUzUzTGlCaDg5dVc2WHJJejlndS9WUXdzVW1ZZXRwNTJTUmpoLzBWeU1k?=
 =?utf-8?B?RE5KT1EyVlFlL0ltV1NWYVRGZTdhT3cvZFJsY2UwNEVCNVUzSzF4azdXNWYz?=
 =?utf-8?B?REFLSzludHpXMFpYRFV5ekdEZnBVZTlzN1A4dS81K2ozenFBblRFRnBJV2pB?=
 =?utf-8?B?ajFyWmJyUS9Qc3o0NHJac1NidTJXbms1UHFoa052bTc2RUJHMmJ1Z2FhbTBs?=
 =?utf-8?B?N3pvNU9VTlF5Y1NKTlZTZ1pnQzJBUnNyT20vQ0FvQWwwRXk3aldFMkJYOHAv?=
 =?utf-8?B?cldvUC9FWVBIL3JWOVJ0bEZaeEpaWnRsM0QwYTNvaXZLWHFyNEFkQkgzWEtT?=
 =?utf-8?B?a21QQjNiZWowUG9VaUY3NG84dlNYNURBZ2dGUmVZTE1lSU16MFhqSjZXc1Y1?=
 =?utf-8?B?cU5xeURGL25lS01tM1lqM2Q1TnoyR2UyK0JVMmhjWjJYeU55WE9Ldm9ORVND?=
 =?utf-8?B?UUJ2SUY0VG4wUGM3bnlPb3NLWkp3SzF2ZWE3aWIyOCthbi9QR05xOUVWUjUy?=
 =?utf-8?B?Q1ZlWk1wbGwvaFBITXM0RlJVbmRNbmtpMTVNSkorcDRLc24rOHAzSWhGVEhN?=
 =?utf-8?B?TnIraDQzRHptelkyT1BSQnZvWE1JWUpoM0Vkb3BqcksyRmRsZW5jdk5FaTNQ?=
 =?utf-8?B?bTd1RVU3WTJmRWdYSU41UHNPWFlYdEk2OFJ1WXdlRVRoM29MUXFJVGNKb3hz?=
 =?utf-8?B?SEZtc3ZiVE9EZkFHNDFlR0FXYlFhWVRXeU5hZktNL3lWeUxIRkUxTkV0Qmpp?=
 =?utf-8?B?bFN2TEZ6Z25YeDh2SWl2ZjRHaHZxZnp5SDMyenVodTEvVkpwWHlRdGh5TVBy?=
 =?utf-8?B?bDlJL3VCSUovbloySDlZU3VQOUJYUG1VRlJYUU9IZGErbHZON1o5WmlndnlM?=
 =?utf-8?B?a3V6Z1FuWUlIU2xzNExKZnpTZXdCNm9FZzJvSWxRVjRQQVJtQk1uNloyRXht?=
 =?utf-8?B?Q0hLQStYY1RpZUNhZFlVMS91SFFSZGlkVWJqZFlXT0taZnhOQWF6N2U2OW1r?=
 =?utf-8?B?bTUyUkVsK2Q0MjBheDdkU0RoVFpEdGRkSWZvNDlGSHRFb0k5RE9HS2xKazNy?=
 =?utf-8?B?OS85UVdsRml6Nmd2Qlkva0QxcDVMVFRNbmYxTmdQczRMM09KcjVtMUx2ck9P?=
 =?utf-8?B?K3c2OHBGMU82YnozbG5yMk1nM0ZudWtuU2VFSVFQOHFmMnJrMEsxMCs5MlhS?=
 =?utf-8?B?THl2RDRVN3VLa1FUckFKNUdtMTlQcXdyZTlaRm9yVzdSQlQwT2JXVTlRcUMv?=
 =?utf-8?B?WldueHpDeXI1V3BvQWtFY25XemVUa2RDa0ZJaHJwRE5wRE4rVnlZaEowT1pm?=
 =?utf-8?B?U1hWRis1WThkQlVFYklLRVdDbC9MOXcyWm9nYXQ4enJaOFFQalN0OHFnaGtM?=
 =?utf-8?B?L205OXJZdXIvY25tdTZXVytuTEkyOEtRYWd1eDRoZUJhaGw1YUpacW5aR3k4?=
 =?utf-8?B?T0dPV3VINXVFYXlrRWFkUGpma2xrb2U1QTJCSVRnK2tvK0t1QXlmRW9uRGk0?=
 =?utf-8?B?TWo1eWxQSklkMjhQVVFxZHhpWFFTc3kzYnRqcElzVUVCakNNUWhNZ1NxSUFh?=
 =?utf-8?B?TTlJaGxYYlUxeXRwYjNNdGJXMjl6amlwbHhySXl5NkRheHNWbWQ3a1ZMNjN6?=
 =?utf-8?B?K0dMRXNyNjhaKytNMUFFV2gvTHZuM09tUTR6Z1dlMWowRjgyWnRLMkN6Nkgz?=
 =?utf-8?Q?NjgGoFg2h7E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB8317.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFNuWVd2VklVaGk3VEppdmRtMk92NnRxUE9BTGxWRWh1VHF4U3dNVzQ0LzBx?=
 =?utf-8?B?WCtaT3Z3aWQ2ck40S1h1NXlBTFhEM3hVd0cycEFMcmsxNzVnZFA5U0ovSGxl?=
 =?utf-8?B?WDJsVEU4emxiaE5HdS9Iam5JQ1gyN0tjeWUzdGdZb0RyQ2txRXUxYWJYR1Jl?=
 =?utf-8?B?T0U0aEEzT2p3aG11dXBjQ2V5bC9wbE1oOGp3NlAwNnVkeE1jM0JnMzgwanpF?=
 =?utf-8?B?WVlJdklSaDVNalpETVRWRFdyNmpZbjZQa2tTN1lpeS9YcWVJenZMWmNUeldi?=
 =?utf-8?B?QVZPQ1VJTzMyV2IzaG1zMFBEN09CTlF3K0FJZFA5SWR3TnlDaTZSUTdmbHNR?=
 =?utf-8?B?Z0g4djBaQVZJc0duLzBrbEVDSXhRb2t6dWdYYmNIN1FqbEIzeE4vWUFVWkdZ?=
 =?utf-8?B?VjNhWW42bUsya2o4dnVvaEE0cjJDVjVudDlEcUJlRkNaRXFNY011aE5ydFB5?=
 =?utf-8?B?NHVrU0tFM0VqMC9Sc3lMd2NCdlZjYk5zTXg5dXRtb3orYlhlaVlEdVZldVVO?=
 =?utf-8?B?Y0hqU0FldGlpdEJjcW04RlJyOWNQTzh0UlhKNU9qOER2Y0lPZk1EV2NMMk5Q?=
 =?utf-8?B?RGtodlBidmtvYWRSY0Y2aStPRmgxZVE3bEZZUW5NbGRHaFd5aUY2dVF2a25J?=
 =?utf-8?B?VGdMeXc4TnY4Z0ZuOTV2eWtTZkNDSkNNRTUzcVNWWlN0S0V5d0NyYUJwYWgr?=
 =?utf-8?B?TkNaNkozMzllVjdUeWg3MW5mNC9WNHlYWHRGUU8rdnZoNEdCeFdoVEhqY3k2?=
 =?utf-8?B?SWw4TGx5L1E1eFZhNkVDM04xQUMxQXFBb2VvWHdCcTA3bUVpVnJSZjlCQ2pt?=
 =?utf-8?B?RzcxOHphUndoT3RCNGR2WklXdW9Mck9RdUxCOUFoendhOTVtRUdDZXNrVWVj?=
 =?utf-8?B?UUhHei9Od2k2NHQ2SW14T2FoN2x6YjBjV1BldXJTWXZrR2ptTnMzYURtYmMx?=
 =?utf-8?B?YnlRV0Q1eERmK0JrU2dFYWtuS2xiN1h0UUlxczlISFkxN0cwUmhsK3hHKzht?=
 =?utf-8?B?K3Z6UkdGRXp4OGkxRksyT016MDJMZjQ1NERURER1cUhMN2RhUGlkUTZmRktx?=
 =?utf-8?B?ZXp0eE81SlQ2aGZWdEVJdy9aRHpqSmx1UzRBNmw5UURuVkRDNUdDcHdiR292?=
 =?utf-8?B?UytWNG9ZVEdoWmt3SHdjamxlWFVLZlh0b1V5b01SL053V1lHdW5hZzZSc1c5?=
 =?utf-8?B?Rnh3cnJKRDQ5WVMwZ2Roc0lTaThpcVBYcFpVZ20yUjFISVFzZkRqUXNrKy95?=
 =?utf-8?B?SERrVy8xWDB5Um9IVFUxSC81cXlkT3QrRXBOcTlPVjdqWWg0NXZaSlJ5Q01C?=
 =?utf-8?B?ZW9LSTZQeFBtcHZEYlJNejhTWVNzOXdwR2Rid1RhditYNjliRFowQmNwWG1w?=
 =?utf-8?B?dEg5c2ZrOWJza0FSUTJibjN6Y3VBQXl2c3ppSXd1STVWRFhYeGtMczFqOG1k?=
 =?utf-8?B?U1VNU0ZKYVRxeS96NU5iLzZtSUs5OGRMQVdBRmVhUFRrakh0dHdxRUszOG1l?=
 =?utf-8?B?WVo2d3pYLzAyRFE1MFFpMjZzQU1JRFViZUdPTGN3aTF5dC95S0hTRzByZkFS?=
 =?utf-8?B?NnN0cTZKV2pXR2tmK2o2MmlPRTBjMUVJMkxIVnl6ZjdYQmh2b1p2QzlaN2RY?=
 =?utf-8?B?SkU5ODVlYkNyQng1UDBhN0VDYXF6NEhLNVR4R3IrTmthQWtEaFVMcXROUFRz?=
 =?utf-8?B?emxxTmRNUG53VU1CT1dhbzZ5VTV0S2szMHJjdnNoZzZ1cWd5dnl1TytTRHFP?=
 =?utf-8?B?OWJEVEt0RTNhbVNFYU9rT3plSVA1bHlxdzRaTytpS29iTFNqemx1MXZSc1Vy?=
 =?utf-8?B?ZStHMVYyUEJocDJRNXRjcjN0UlRMbGEzdFcydXM3ZzlnaHNjQnJNUXVNcGJX?=
 =?utf-8?B?d3hVK0UyWW5ZTWNzUVZqU1VTaDVDSVpESWNVbDJjRnptK3p1THZjZEgySlUz?=
 =?utf-8?B?b1Jidjl6cDlIcEF0bUJGcXM4S2tlSDVBU2RRNnhiT2NvMmdzZWF0Vkp3WWds?=
 =?utf-8?B?SlcyTVRkL3FwZjlvRjdmWCt2bngyS3F0UXdGTCtnbFkrOXloWURoZjhZMEUr?=
 =?utf-8?B?TVVWTVVISGQwWjJIbnpkREVaY1hzQllVeFJ3UEI3NHhuNXQ1NTJON1AwdEtV?=
 =?utf-8?B?Y2c1c2dvZWJYY2l3WVYzNkxnWWNnUm1XSjUvaENrSEdaMzlCSnpPNUQvSGo2?=
 =?utf-8?Q?hh/M0M/lOxRySGf2jMaTy/DZXb5zSnHb5FUlvnoGYcZx?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5817dd9b-6b01-4e90-3815-08dd8f4020dc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB8317.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 21:26:14.9551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q16Ucs+9Rj9R4bfSrrTyYiZViS82R0FK2mUD+Nke6/GQb2lNxGaFBcQNqOiSYK3hIk7EdwjazmWCvfz0IJJ5UA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7002

From: Thierry Reding <thierry.reding@gmail.com>

Hi ARM SoC maintainers,

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.16-arm64-dt

for you to fetch changes up to 20440c7f9015a140e090c625d98b7fb086e7b63c:

  arm64: tegra: Wire up CEC to devkits (2025-05-08 23:59:43 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v6.16-rc1

Enable IOMMU support for the internal DMA controller of the QSPI
controller, add aliases for the I2C controllers on Tegra234 to match
hardware block names as well as the UART-D alias on Jetson TX1, and
enable PWM fans on Jetson TX1 and TX2.

Clean up serial port device tree nodes, add missing DMA properties,
enable the GPU on Jetson TX1 and Jetson TX2. Use an extended number of
address- and size-cells on Tegra186 to mirror what is done on other chip
generations.

Enable CEC on developer kit devices.

----------------------------------------------------------------
Aaron Kling (11):
      arm64: tegra: Enable PWM fan on the Jetson TX1 Devkit
      arm64: tegra: Enable PWM fan on the Jetson TX2 Devkit
      arm64: tegra: Drop remaining serial clock-names and reset-names
      arm64: tegra: Add DMA properties for Tegra186 and Tegra194 UARTs
      arm64: tegra: p3310: Explicitly enable GPU
      arm64: tegra: p2180: Explicitly enable GPU
      arm64: tegra: Bump #address-cells and #size-cells on Tegra186
      arm64: tegra: Add uartd serial alias for Jetson TX1 module
      arm64: tegra: Add fallback CEC compatibles
      arm64: tegra: Add CEC controller on Tegra210
      arm64: tegra: Wire up CEC to devkits

Akhil R (1):
      arm64: tegra: Add I2C aliases for Tegra234

Vishwaroop A (1):
      arm64: tegra: Configure QSPI clocks and add DMA

 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 115 +++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi     |   6 +
 .../dts/nvidia/tegra186-p3509-0000+p3636-0001.dts  |   8 +
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           | 162 +++++++++++----------
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi     |   2 +
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts |   6 +
 .../arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi |   6 +
 arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi     |   2 +
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           |  30 ++--
 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi     |   2 +
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts |   6 +
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     |  75 ++++++++++
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts |   6 +
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |   9 ++
 arch/arm64/boot/dts/nvidia/tegra234.dtsi           |  22 +++
 15 files changed, 364 insertions(+), 93 deletions(-)
