Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012033.outbound.protection.outlook.com [52.101.53.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E8822425E;
	Thu, 18 Sep 2025 01:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758160516; cv=fail; b=owFTvxmfKyj3UMuaPMe56NmEsuB6uZRVN7OsSpjqvKOy59LvSSopLoP7mvf8VOpyPXX3ZOAYYLYbqlMTn4H9Fhweol9bJJ45JaYpo6L2J5mYZY2AEEj6ClI0wbcMB9rbY2L/17kW3PZ8s3nE23yyQKzQld2Gtu9+TJpL7DXIf90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758160516; c=relaxed/simple;
	bh=kRlgTbSMCo+F4RDQgyBS1oxb9jF4TCS5lr9P7Cwlw5I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=n/J9LOmTQp5Eca7EiLGYiu+ljFi0HRBGZSnpiOcoAf6aEkv+QM0e57g+c4XQAQHdvB20tqkV7Kcb7WfbQVh5Fd5UR8EA+imMyN+tior+aeA5Ois/N43pkdgCO/QM+tsre5pDvOtFDdr3sWZvIK5A6d5UMGPCmdkeSF5qyHYaicw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CJMEyMS2; arc=fail smtp.client-ip=52.101.53.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CJMEyMS2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bEwzJXaiHn5CmWNet+lNLqTaNe3mv9PH7XUDn+oneW2UhbU3Cgspeo1Sv+UHoFAXTbIH4Tc56T21XRdgOwE9Zgr9adJXTo8v/3V8Bv19fXtqeHdDcKLlxiAbLtQWkoNRzMMc5iFoZyaR+Jk5sYIEELFS+Y8816Vi60gDL8TS0uKcWyFWJHgsEcU6MfCyiSqZMa9b9dO5akOB8ObwpDUDccUI7QwPP4d0KalCgNiVRXN0KKQVmi24jPKo2KL0C8SQ2PvbgCoErwZT5DoFNmm1dsce8cRwf2Hfw/MtjpFU3xIlmGspT6zaU7RjoE/1pbYGzET8m+sG7TYasMtFtwd3Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5/qtc28wxta/NA6AfNUPvjwdyHHGtxmpQCurcPCCW6E=;
 b=NvXHI5eJxfwXxum28DCNYwM0BUHGPBpHXcaqtjbJ7F7+MjjZchMNHfbgZszfzSNO4BZiR3JqQ4fVVLbYYOqaHkgzfi8ANtZQxYDlCLzIKbTsXvnBIsIuW3dF71I0ad0kt6d5lm1al1n5dhH8ztONuYSyQrx2PO9TQTocZZbkO1lwQe+Hemi49H9Ah9VecVgviFyPaD2vYHhDJh5fKz1Kkl0Pedd1K8Vywhi6aNcQ6P+Kvw2GhEXv2GmyD+KE/tL4XHS69elpLNVB2X20z3MejsizevGBcfDcoue/oXCMhPBHKDD6cNvKx212zb9vSI/HvLzAs8Rd2kSzmZRP5oIYVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5/qtc28wxta/NA6AfNUPvjwdyHHGtxmpQCurcPCCW6E=;
 b=CJMEyMS2x1yY+L7bAnXdQ5PyW7klUve2evvjbh8XpskXN7NqshR9EA0zMxz2+CkTaHo519sAflKqF4H8lFU66OAMx16n0JcgtcTiU5hEEQ5UASGwQv7hhSPhNuu9HbEnFQ7pjT0Q7erKlPXn5w7CVawq1WtobofufE+pQpFPdq9mzRM8quv57kI1sWp0JEYkRN7QMM45X3cJPYk1nfVIsmMYA9F94iDEpmftZ1L+LLyK5l5ybtW0gB97RItRQs7ae0le2PU2WUENxv8ikUjZFzjoat7Id2S/mvC4BdWEwHIHsZ8Z3d1JigCfZUwx2t4pMdSvBRRev3cEdJcNqugcFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 MW5PR12MB5681.namprd12.prod.outlook.com (2603:10b6:303:19e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Thu, 18 Sep
 2025 01:55:11 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9115.018; Thu, 18 Sep 2025
 01:55:11 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: sboyd@kernel.org, thierry.reding@gmail.com, linux-clk@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 Pei Xiao <xiaopei01@kylinos.cn>
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject:
 Re: [PATCH] clk: tegra: super: Fix error handling and resolve unsigned
 compare warning
Date: Thu, 18 Sep 2025 10:55:08 +0900
Message-ID: <3841056.aeNJFYEL58@senjougahara>
In-Reply-To:
 <03d0c47832c7a0fdc19733d15077197ad2c54946.1756430095.git.xiaopei01@kylinos.cn>
References:
 <03d0c47832c7a0fdc19733d15077197ad2c54946.1756430095.git.xiaopei01@kylinos.cn>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0235.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::13) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|MW5PR12MB5681:EE_
X-MS-Office365-Filtering-Correlation-Id: cc4d81f1-3873-44e8-204f-08ddf6566739
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QW1UWVFtWUY0bmVvbmRETHhjbHlCRzh6VVhKYWQwb0xJK002bUlBUEMwOW8r?=
 =?utf-8?B?SHp1bk5WR0IxbCsvMElUc3V0NVpzd21aWGFTSTdlS2t5SkdRdysrZ3p6eHht?=
 =?utf-8?B?aFdDdVBXZmp3TEUyWElvQlh4MFV1NUVIMk95bFJGRGpoS1h3eUFGY0R6T09R?=
 =?utf-8?B?NUNsNSsyRmNzWCtEOGMzM1ppL3pLS3lWb0hva0w1dkY4U0RjcWI5cTRYREtF?=
 =?utf-8?B?QTlTMk5NTlFVNEV2WUtiYVFGQXpUdFhreThDMTFqVVJBSEdvOFlNeVlpNWsx?=
 =?utf-8?B?SDg0SEgrd01ocnJHbFJtbDZJQ3lMWGN4Yk1yNGY3a1hXbDJxMU9FdUVQTkRu?=
 =?utf-8?B?NTlwVjRreUV4WU9jWDNmaWlZQXY2OU9UK3RnM0JNOXZXVzZCY3NsV1hEZ3Jr?=
 =?utf-8?B?bGVGV2ZFaGxSa3RENGpMaGhjSFNOcWpmSStURzdVMXdxQWRmclFWTWJ4aGdu?=
 =?utf-8?B?S3RlYUZHR0MzNU9BVFZ2WDNnVTdHWTlBT3Z3VTdkNlRHNDliUmVnOU5yOHcv?=
 =?utf-8?B?TEZOdzZxT2NRYWlCMFhiNTBhaCtKMXpmRkpjOW14QThLdUhoSTJ6THdRZFFW?=
 =?utf-8?B?YmVEaWZIclAvMUFQd0JHemxCN3l4QnU0MDcxVDBTaDlTMzRoMkFDdkNoZnRF?=
 =?utf-8?B?cFFwQnpzUkxlNjRNUW5heWNYZ0dMekJkUlJBbXgvL05mRkpYREFkK3RqK0N2?=
 =?utf-8?B?STRVOEFOL0FrcjBjRmtIMENtRHRHYUVIcURNM1Fyb3c5bm5mRm11Y2pDa1Q5?=
 =?utf-8?B?OUFEMlZ0cnFvbDgzbmdlVmhYWEo1TURxU2lFL3czaGx0elFzYk9tVDVNQy9k?=
 =?utf-8?B?K25FN3Radk05ek1WSGdYQktXOFNMTzh2L3dJR0ticTdRYktYTVJYYmtPdHJp?=
 =?utf-8?B?bUJKczdnbFpXWmZ3dlJrc08zeUhob0FwVjBSZ2FOSnZBdXFvSXRlL0tIUzh1?=
 =?utf-8?B?N294UVBBSU1VQ2FxZ0tvK3BZd3JRSTRxbjA0MUpiWnIzdm01eDhhcmF0ZlQ5?=
 =?utf-8?B?b1haRXlvOG9jZkdOUFFweUU2RTRuUm93WVhUR2hjeWE4VVMyS3lhbFQ5WStM?=
 =?utf-8?B?NzRrcWt4ZHB0YW1wUmkrLzBzVzZKOTVDL3NpeWlKdVFJcUZ5cnY0U1F5WjBr?=
 =?utf-8?B?ZjRtNXVWTEtxbHlOcDM2R2s5R1V5Y0h5ZEJ6ZXREME85T01yek1jMXU5T21p?=
 =?utf-8?B?ZjhMcGRpNTlXWmZCK2JIU3VLSElMSzlqRlRWdzNGR2NXODNFek42MmVScFBN?=
 =?utf-8?B?MVBsa2tkbm4zTlowelppS0JaWG1CbERvbDVlZisyb3Z2bjFIMzhteFAzY2pS?=
 =?utf-8?B?YXpjN1AwT0ZFSjEyVzduVmVIWjZZOGtxckVCVGk2VkplL3p1ZkhHdXovWXJw?=
 =?utf-8?B?WUE5SCtsanJRSytHZXFTY1N0WlNpUzR2N20vYlh2M0d3NVBiUFUzeXJMOWxq?=
 =?utf-8?B?eW82OGVMd2NKTnV1RGVnMVR5UW4rV2hJK1Nsc1hsSE9Qa00vOTNCeGVPSXdE?=
 =?utf-8?B?bG5xR3lRbHZzVkFDZGxNUFdLRTBRODg0OHB0OUhmVHYyUDc0UnFOQUhObWg3?=
 =?utf-8?B?V2FraUlLU0luOTBCaGkvZlBRemlhN1RGb29PVlFKREdKVnNCblhpUGJnUFVu?=
 =?utf-8?B?S2FPS1RJL1E5QzU1cFV2c09PYmlBYmZrU05ubDNHWE9aV3dCcE55Y0dYenVm?=
 =?utf-8?B?SEVHWnJqY09XTGVDSkUzZGZPZFR4S1ZQTkREWFhUOVB6RkFpQ1BiVlRDY3NC?=
 =?utf-8?B?MDQ4ekhPZGx3MjR0TXQxNjV6SS9ldGhoL3hKeFJvNzEzTE1CR0dKa1JVa2VK?=
 =?utf-8?B?bjRGditjdEIyTjlBcCt6SzBxRlgyMFZ4d1d6b3djT2Izd2xYZ3BSbHhxSTNQ?=
 =?utf-8?B?bE5MTzVYSlNXVi9NcGJYRmZxZzNPRjRVaWNXUDNEUnhtRHpPYlBIK0xKZkNI?=
 =?utf-8?Q?CaM8fvkYH9Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6494.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bVUrcndER2dzVVBaRnVOcTErRmV0aDIvWllNTStDbWRReUtuazdiSzhKOVlH?=
 =?utf-8?B?eDRjakp6UlVrR1JKV0dCZFRzUk1FZDI2T25pMDlWZHFvUGRhcmJkbGpwQVlY?=
 =?utf-8?B?MkMzaGoyRng4ZG9FZnlOaHh4Ujg4VTRtdEpTRERSVk1idnhlckkrZWRFQUsx?=
 =?utf-8?B?eWlxMHlrR0s3NmdvQVhhWThlYktZc1l2NUszY2hEMmttSERjYlhRVlJPOU1m?=
 =?utf-8?B?clpRWmt2bU9ZanpHcVVvdWZhd3VzT1Y2bDdUVng0eG9NQ1BOTitQRmQ1bTMy?=
 =?utf-8?B?Q09ERXZaV2NWNmVRMFBEQ0tGOUdnUm1BVVNXWkNWYXU1Y0tXMEoyaUlGMWNa?=
 =?utf-8?B?RTdrMG55d3JsZTRQNnZsUTIvR01ibzBvRGYyOXFLOWlHWmREZ2ZLeEhwZzJj?=
 =?utf-8?B?Wmx5R25zb2VucnFQOFZJZEFEQnhIQWFrVTZtTGo5NGJJeThVRFR1NmlVa2Zx?=
 =?utf-8?B?OVZsRkJDYXFFYWl3SWNQY2dkbWovdVdiOE54SE1iNEhjMWx4Q05HMTBDL0Yy?=
 =?utf-8?B?UDBXVUlYVWRtOGhVdkJpUFE4ejE2RVhmdjBRVUhTQzQxUGVndzVrU2ROOWpY?=
 =?utf-8?B?RTRjcWtUM2dEVlpaLzZWTDZ4ZG9zYVRtWmJhQmJYNHhEVXAwV1krYXREQXhM?=
 =?utf-8?B?M3NtRUY0WmQ3WFV4ZTRiMzMzNFZ5Uk9pamI5cEppNzMrVmtObGxSd2dxa2hp?=
 =?utf-8?B?dTJpalBYRU5ObVJTMmttWnhmVW1GNHJCdUF5VmI5cmhGWlAxRm5BL21FbEFQ?=
 =?utf-8?B?aVdONVREOXNqSkpLUzVVZllwY3VQeXhXaDI0aVcycTlSeVJIa3pqUnVDVmQ4?=
 =?utf-8?B?eitjckZVdndmVHZGYnptcTRqNHdqb0xKL3Jvd3FKZzFZSU9Ob3c5MXJiOHF6?=
 =?utf-8?B?UjNrYTBrVytPVVp0UkFtdjZDbnJtMy9ka25aeXJjd3I1NU1aWE9SeHpHaGZ3?=
 =?utf-8?B?TG40NCtYbnMrczNWc2E4YnkvMnlQcDJMUnUxU3VtZmkySXZoS0VnMHJlR2hY?=
 =?utf-8?B?V0VWdCtXUFB1VGFlYkk0RjAzb1BUWmkvNUhSSy92cE1abTNua1VUSUN4ekkz?=
 =?utf-8?B?NWk2Y1JLNjR4a2U1bGRhTFN4dURRVmU4WFdlZXc4eHp6cWJUQVZ2OThzRzhY?=
 =?utf-8?B?MURVb0hDKy9UbU5BUW1uN044b2lJaVN6SlVCeXFuUDBIc1Jpak5yQkxlbzll?=
 =?utf-8?B?ekdkVWh2aWlpRm1UUHEyL0lUU01pbXh2K2d3TGRNbk91WUQ4cFE2TDIrY2Mx?=
 =?utf-8?B?MEx1d2huNkdlM29jejVPZHZ0WVhqbUp6aENLRGF5bE1CbXJsVk1LMEtRb3Rw?=
 =?utf-8?B?R2dnTHJJOTAwdlhQcm5sbStsQnRKOWNJRzBhUlN3MjJRS01uQVRGZW1lMWpu?=
 =?utf-8?B?dWRpRjNGcVYrVkV2ZzJOMGVPSXQ5TWdMVzZNaTJUMEduaU9ZbzhGKzBUeUFK?=
 =?utf-8?B?VWFzREovTEUrOXI4SmdiUDE5MDBqNVBvRGtCT1J5SXJPR1VVckcxcnRsN3l4?=
 =?utf-8?B?RWVOTHpLaEFlVW45L2pmSG1FNDJmNm1wZTFYMDF4S0RaTjVoa3ZxT05ydGNC?=
 =?utf-8?B?c3VleCtyVExrZlFwNUlZd1dFMjdNWUlDODBlY256Qkp3OEY4NlMzKzdOQ0gr?=
 =?utf-8?B?UGZnMHVtR1RWY2hwd3VxWUxEekVjVjlsek9hQ0p0amkzaC9tY0Zyak5YMWhT?=
 =?utf-8?B?cmt5cVpCSkR1QUVQQTFaWTBxa0Q0dytpVUhWdUxoZXFxVndpalI1RStpMS84?=
 =?utf-8?B?bEIrM0JzaGJVMWVUMG1icWhaaWhEZzZaUURDVUZsc0JOYm9FcjQwNDhlZFI1?=
 =?utf-8?B?N1YzU3JaUWV0cmxFUlEwRjcrSW80RVNqT2diOTB3bzRHcnFIcFVzZW5iaGJo?=
 =?utf-8?B?cGRFVGVIanpXMUFRQlowalRGL0ZZc3FjU2V5TVlvWnZaQnhKalp1aFlyZk5V?=
 =?utf-8?B?MXZtRE0vQ3dNQnlZYTJLMFhJcmFBKzdFeXZ2dFBJQmFySWxHcTNVWFlZbnp6?=
 =?utf-8?B?UjMrUHBvZkg5ZE43U3BBZTA0OUlaUTB6MGxrb09CYWNhMFZ0ZTc4eFExTGZY?=
 =?utf-8?B?TEJnTHFWZ3VUZUx2WENqTjhtOE00UkNhdHBTeXdPSTRFaUFKWUptZS9ab2pk?=
 =?utf-8?B?dTA1aEIxR0tKNkFBMW0vbC9zVlVvR0FmWWlSemZsd2xxc05xaHQrUkUrSUdu?=
 =?utf-8?B?OFhHbEo3UWQrRHY0ZnRrSjdocmRjVUNqV0l0UXYrRmRJVGhvNFVVbTR5WUFG?=
 =?utf-8?B?TFF6QWlDV1VKdHNlNXNONFAzcVZRPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc4d81f1-3873-44e8-204f-08ddf6566739
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 01:55:11.7356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: En7NfsW7YDnwMiSckGkXPJKtSsfl9NmUKjLT7iMdmYXFBii/l+LlVp/z2apv5l5KI8yd7D3KMo7O9nn4XsAVbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5681

On Friday, August 29, 2025 10:16=E2=80=AFAM Pei Xiao wrote:
> ./drivers/clk/tegra/clk-super.c:156:5-9: WARNING:
>         Unsigned expression compared with zero: rate < 0
>=20
> The unsigned long 'rate' variable caused:
> - Incorrect handling of negative errors
> - Compile warning: "Unsigned expression compared with zero"
>=20
> Fix by changing to long type and adding req->rate cast.
>=20
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
> ---
>  drivers/clk/tegra/clk-super.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/tegra/clk-super.c b/drivers/clk/tegra/clk-super.=
c
> index 7ec47942720c..643b3cb83cd0 100644
> --- a/drivers/clk/tegra/clk-super.c
> +++ b/drivers/clk/tegra/clk-super.c
> @@ -147,7 +147,7 @@ static int clk_super_determine_rate(struct clk_hw *hw=
,
>  {
>  	struct tegra_clk_super_mux *super =3D to_clk_super_mux(hw);
>  	struct clk_hw *div_hw =3D &super->frac_div.hw;
> -	unsigned long rate;
> +	long rate;
> =20
>  	__clk_hw_set_clk(div_hw, hw);
> =20
> @@ -156,7 +156,7 @@ static int clk_super_determine_rate(struct clk_hw *hw=
,
>  	if (rate < 0)
>  		return rate;
> =20
> -	req->rate =3D rate;
> +	req->rate =3D (unsigned long)rate;
>  	return 0;
>  }
> =20
>=20

The proper fix for this would be to implement and call div_ops->determine_r=
ate instead of round_rate. With the cast-to-long approach, rates above 2147=
MHz will incorrectly show as errors. While for this clock in particular I d=
on't think we can reach those rates, I don't think this improves the situat=
ion either, as the round_rate implementation invoked here never returns err=
ors.

Mikko


