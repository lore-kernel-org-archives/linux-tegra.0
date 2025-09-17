Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013064.outbound.protection.outlook.com [40.107.201.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5CF126BF7;
	Wed, 17 Sep 2025 13:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758115000; cv=fail; b=J+9heNIxbhUmr2CtHr6tC51876maiJyjwV9pk4gAN+RwzrEVQH1coioSIlDdjrmbF+Bp4jrQLyrqEdZ4Iup5GYuSHJ6+Y9rHL7YE990P0zMklY6jBOIQo14gxtHmwOifmog00btKzPUuJE0YvEN0T4YKpnJscF6b4X2obgy0L7c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758115000; c=relaxed/simple;
	bh=OIPP+HcCYhBLh2M92zF/4JR73iDITzxoStFX0sCt30Y=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SUTzjQPcY83jPMxbOgtifDFbMeUK5E3DmArBA1194J0rJ5Uz76dVt6huubYgdNtr5EqVqgj8UHUKY1hrnbrsF/KmrmccpBykO4pgy1KMIAxvSXlGwGZikRe39eke51mcLC6pvNUU2dudJxAGtqcj8dBq41O2aSmFyKIcMfGJ25A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Wg1r2Nqg; arc=fail smtp.client-ip=40.107.201.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Wg1r2Nqg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eL1+6HzyVC0nrgQtU+LGYxVkRzfdGUGlQkXDNxLs1+WUqkOBReTjjCnxDKF5pifrEITx+RQc+xzdSKb6yrPW4E3TZQ1jZuxTsCkuT/OmzDJNjAK972tlYxS3N25dTPNMMwvjiCbofcQnBnvVqTMycS7ctNFpvAUm3JzrAXMl4SijLWzBkEj4baSxRSaUva8/V2J+bBxHf52lKvvHoP69I6KCj6Is7T1Cdm0GPHybtoiWKYC5CM3sdSJEK6ioCg2Ko8laddKYoLUzmjdTfkT242YRPJRbuzwNFDPEJFlMlsqP1tNXFBEo/it+VISL1fBdRjP3y2YeUCndWcpeGC3mzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AG/1xOpQQ3Xx3nOljqsW0oo0QWMD54UwsZE/D0O5B4I=;
 b=nqBlGWXgFvCe1T2nglIwAy/hDVLQQoKX6MXk0k8j60RVQHCjXrGQBl2I+Y2ooY0T4RW4wyMkMdgA2eThNMylkrjaJyCULl0LVow7eDMCncBSq7SXG0FFMhwZZPPdTD5hc5/+1sb+aVxM5U9ve70t8A5d/sKibA/gFxlp1SSbkJRazpy+hUJssOIYvzKX7pBX1e62BhdiKD/OaNP8lwmWsE1hw5lJ44fSflwoWiIaGTHVwfxIgKtYA29pZNYm0I7SOMRzFKigVZh2LDCJBZRBFAMWHwVpFJ4NernJZ3yyZbn/Ic/+WahUSBh5RliUIAZV7WcFIL60p5IUEdgvoZt1nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AG/1xOpQQ3Xx3nOljqsW0oo0QWMD54UwsZE/D0O5B4I=;
 b=Wg1r2Nqg/5E2RriMcNN/qP1R4PFBPNzLpTC8HkdHLLtHttYP7g7wqxrzjTlvqeybWGazLkmwfd88CoNkb2Kwnrc+nk2jEvCuEtr0iS0aOs26kB/7KN/Up6Rh4z32KHxNraLfUnJ0Be0CM6QSM5POiKN+6SLglKfDFZdaGN9VN8WyOtJSCiF6+ayS0FnfNEFA0kTWIt6/3E5spphODAPoqlDbu1hCN/iHIqISSLApFSFtNQCBR4/hsByfBsy26IOe94PBRwNkt9lQo9wd7acJp5r8xnn8JuWXavJBYO+TXCTEy+aBAhoB6kePgSMj8l3I/tY8+ZtBqROB35ndGRbnow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by BL3PR12MB6404.namprd12.prod.outlook.com (2603:10b6:208:3b4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Wed, 17 Sep
 2025 13:16:30 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%5]) with mapi id 15.20.9115.022; Wed, 17 Sep 2025
 13:16:30 +0000
Message-ID: <c16477c8-95e9-4e07-9202-042b1070c76f@nvidia.com>
Date: Wed, 17 Sep 2025 14:16:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc/tegra: pmc: Ensure power-domains are in a known state
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250731121832.213671-1-jonathanh@nvidia.com>
 <CAPDyKFr+uVDYBMvsN+L9XPToaD+Wr9P=SnnXyKB6ucqQ7se=7A@mail.gmail.com>
 <sgsi4wia74nbvme4ik27waec2yuipbw7hfh7jyygxlbfhvsc5q@4onfx46nle56>
 <CAPDyKFpVohjP4bkSkxxOXiEsbWqWNa2GFRdDbQ7YC60NyC=c9A@mail.gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <CAPDyKFpVohjP4bkSkxxOXiEsbWqWNa2GFRdDbQ7YC60NyC=c9A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0037.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::6) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|BL3PR12MB6404:EE_
X-MS-Office365-Filtering-Correlation-Id: 20e25a84-ecaf-482e-c584-08ddf5ec6a44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WjFndkxXbXdEMFgyWkY1VkN4UlA3RFNWUlhqa3JiSlUzdWEzTHNVVWljUG5l?=
 =?utf-8?B?N2lwalVWTnlSdi9Jc2Y1bzNtSXFiekpYdjllZW40R1duMVd0Z1ZOcWhHTGw1?=
 =?utf-8?B?eW9vSG9YS0tRcldOV01uMTVmUkpkaUpiUDNyWTd3SjlJUzZYM1BQQkpydEdy?=
 =?utf-8?B?bU5JTUQzM1RVaUU0VXFFNFFNd0VKaVBGUzhTek5ZWThBWWg5ZmduSDBzTWNa?=
 =?utf-8?B?TW02YVBBNUlaaFZXSFN6d2M4ZGd3SERubGpvcHc0S0ZyTzZZQWdCMTVVM090?=
 =?utf-8?B?SFRRT2JyVkhNOVdNRnFhcnhHbk5nMW9FTVdKYTNPVDFnR213SHhMRE9aM2pJ?=
 =?utf-8?B?ZmZSSmpVTVcvaDdzVFJNOGVzaGZYY2o3cWtUMTVWU0N5cXdEL3psZWt1QnhR?=
 =?utf-8?B?SHJKSUMwKzZPNWo4M0VWbFFQL3hpSVNRb3o1Z2gzdGxQNnlQQ0dkekhhbUNI?=
 =?utf-8?B?emxuckZGVnJpQTRZZzhXM0VTTkdLS2lOelNrQzh1NnRTMVBiaGdaMWc4YzVW?=
 =?utf-8?B?aVF4aDVwM0FnY2p4cS9EZkxERmdseHY0SjdQbmpwRndIS0pLdm5TYkkzS3Zt?=
 =?utf-8?B?V0Y4cWdsSElzaUVBSnl6ZWZyVklGblJ1S1FwU2FlRmxtMC9GUnQ2STBaU25H?=
 =?utf-8?B?TUxwcEpOTTF1NEw5RGxybHlTb3graWNiS3hWcWdGODdLNWpOandUd0NZWFg3?=
 =?utf-8?B?TmJtSDVVeFgraTVzUTM5QUxCaE9OcHdISjU4OUJPZVhad2MvOURqVDg0VW9Z?=
 =?utf-8?B?NlJsZ1BRd2dBeHRteW9VcURwOEJ0Um42eTFyRVFabTdxN0FScjgrZk5LN1cy?=
 =?utf-8?B?alYzQjVTUGdLK3oxYlBkeUxYcnlVZWNTcGl1TVA4NXZKMXU0bVNNZVVEUWxl?=
 =?utf-8?B?Q1cxZ2dvU3pZcXE0Ny95SjBST1lyeUFzbGtXcllvejFldlRRVWVFOWVUbXE0?=
 =?utf-8?B?WW9TekxEUlJRNW1JUytEK1FjOE1YMUsreUZUdlNZb1RPTTd1ZW5mQnYvaXcx?=
 =?utf-8?B?K2xqNmE2dzBwcm5KQWV2UCthc2FkY0J4UStxWkFEL08xb0xVamVEbFRVcUtT?=
 =?utf-8?B?TDdiZlFudWNCOURnRDI5WHZZTDlSbjZZMW9xU3FDOTVwUnBwUXpwczNNOTRU?=
 =?utf-8?B?aGdSam10MEV4S0N2WWozZlpkcEtSdno5M2w3Y1RkbmlWeUpzMG9ISGhETFEy?=
 =?utf-8?B?RGc4cEZ2eFZmZHJ0NFhMdVhvU1pvL0ZVcnJrQnp4bkJCcjFiUXhHN0taUlNq?=
 =?utf-8?B?djA3MXh1QmJBckQxcFJsak5MUThYTmE2RXZKaWZuRUhUVzBUTWs5amdKdmtR?=
 =?utf-8?B?dHVZQk1FYWRVNmlPaU16a3ZaVTNvRDREVnZIQlZYVkRERHVDVnNmODZ3VWZT?=
 =?utf-8?B?Qmk1UjFqL0tzK0dkSGFId3Vkdnd3aXF1enRNT3g4MlNlZ0cvaDV4cG5lOW85?=
 =?utf-8?B?cVBSdzJkYWEyZDg3NGhiR3p3OXdHNzhURitLLy91UkRzWm5xMllTN0tFR3JJ?=
 =?utf-8?B?a1cxeVpjTFQ5SytlK1IxckRSLzE5S3RSTGdlbjkxSFJkS1lhY2NtSHFTNU9O?=
 =?utf-8?B?RlhuVG5KNHNFQ3dpQ1NvUHJHTEhyeHMxbTdwOUZOSG9QZTA4aU8wVXllTHdq?=
 =?utf-8?B?a3E3UUhQRTVINTZiZEVHM3lhaWRVQXBVQXV1anF3Y0VIODhuRUpEdmJaaytw?=
 =?utf-8?B?dzZhLzFHOGc4VGtJMUtCamlLeDZrWnZFRWd0SlN3Yzlxd0NsMFYyUWQzNFZQ?=
 =?utf-8?B?SnUxSlVVN2pYeFZPeWtycUNRWHpWZm5obUd4LytKdGw3dVl4YVlyU3Q5cGJQ?=
 =?utf-8?B?b3VGdG1Sb0dLUlRQR0NnTlk0bVN1aUpwWTB1UFowR1E1MlFSdFdhdnZ0Wnlv?=
 =?utf-8?B?UTdKdVREMWxmZFRuUUJQU09OQStNVFRta1dhbFlUZFUweCtxRVRLNEFoSmxS?=
 =?utf-8?Q?q3TgEHovDr0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TE9IN1BtNUZINm9IcDl4RXI5bGRobWwvd0xRRU5XU3B3VVZOQ01pS2QzN2RR?=
 =?utf-8?B?SW5LbWFIT3g3NTBSR1BPbXRYd1FVcHV2b0lENHliaXZvdEdBT1dCNEJlck5E?=
 =?utf-8?B?U0lHSEE4Q01uY3pjZEdjcFQybVVnb0hybmc1RFlNY1VGMW4xdDhWbzdkdVNp?=
 =?utf-8?B?REx6NU8yYmhTMis5NjhWeFhEWGZPQWtyVmhsOFUydm1zVDZ3K1BjNHlac3pl?=
 =?utf-8?B?T1JUUGlyZHI0QVowS1JzRUVOdU93dUpmdzMzNVJTRlF3UUd2SWRCU2tzQmZU?=
 =?utf-8?B?S212SlVOd1lXUCtqQ3dSZU1CRTY2OHl2RHNYalJuRjBTcVVwMzBqNjNSWUgr?=
 =?utf-8?B?b0tFVGRhczhNb0tWWGtXc1JnRGIxekY2V2hncWs0M0FrbVEwZzM1bWdybjk1?=
 =?utf-8?B?Q3k1YXlqL0k4Tk1kaTNXVHlNYTZqYTVpWi9GOWJyUUV3Uk1OenRDUDJzclgz?=
 =?utf-8?B?SkloWE1QZnlDWTZKWVUyNVAydEczcUJLODdDTGJHNlF5NElhZEh4VHVWZGNK?=
 =?utf-8?B?N0J2T1NiYTVZZ2lRTi9TU1JrUE92U2J2bXZqRWk4ZUlFWTNMMmxMVGw5dXRL?=
 =?utf-8?B?MFFBSi92MWNDb05vNy81THVLRDJWd1UzZytIUmp2TzlWbDlHYXY1bTAwNjU1?=
 =?utf-8?B?RnhpV1BOSzZTRm0rbHpUS0dYL0VZalVnRmMyc3BiQmlOVmFtcUJ6TVY2YzJM?=
 =?utf-8?B?NGd5L3FEV0ZoVzVGRkU5dml6aGYwSUo3QzdRQVBnVWYyTzQ0OGg1MFdEekE0?=
 =?utf-8?B?VnMvYmhUNFNaSmJCSFNBOVFYUlFWRWUvaGZqTjBGUUlmamh5Y1VnQys3SDI2?=
 =?utf-8?B?VWtkckFQQVo1cGxGWnFvSjBGQlhibklScTNyRzFONHp4TzVraUxOb3JPM3Fh?=
 =?utf-8?B?RUdzRDQrcmlSZWRxMVk2WkR2ZHJRYnFwekpLYnhTVVZpajJBcE5lc0IzRHUw?=
 =?utf-8?B?VmJnNGRGQWpVZ0tQcXgzVDk1bmVDY2ZkZnFhb3NxWlhBQUFPRFIwM213YnlF?=
 =?utf-8?B?b0ZMOVNrNGRLRHljWG1iL3YrTmVPVGd4dkFKZzVHckN6OENoMENFcnc4QjQx?=
 =?utf-8?B?T2NrVVZmTUZtTDBvSlNJSThPa3ZTcHRxS012ZGxwMXRrMUlKN2FIL3lkU1B2?=
 =?utf-8?B?aUNRRUxSUVRIdUowd0VuRW4rbCthWnhVNm9OZHBXdjVleTBsQ1gwbUl5dFdD?=
 =?utf-8?B?R3VKMGJ3QldEeXFFTEc5WllOeU1ESURKZzBKZjd3eXN5ZU1RajhiUkdPUDBn?=
 =?utf-8?B?clZRSFlSbGRkeHFjbk5vNzRmV1FlMUhvZXFWTlBGOWxuLzI1YzVQZGhDRlFz?=
 =?utf-8?B?L2lCQnd4V0UveDA4a2F2Zjl5SHY3cGk1UW1DSmdOSVVhTG1DbGZjMnlnczFQ?=
 =?utf-8?B?cHBwdEwvOXlZSWIrWk0rdkU0blJxZVl4U1p6SVp6S3d1VGtmcWlsS1pIZWJ2?=
 =?utf-8?B?dE9kZ21TQ2lTOVBtNkF2ZEU3dlJPNFV3RVJ0UFJPUkpIYnN5QWVSU0x5OWxY?=
 =?utf-8?B?UHE5Y253dmFSaThJZXMwWTE3UjN5ZEl2QjNuV2lMeGc5U1k5SXhmb1dJWUxW?=
 =?utf-8?B?Z2JndFBnVDNMWERhUUgzbll1cEhVNmZrV0gwVVdyOHdsejR6c0dDZTB3T1A5?=
 =?utf-8?B?TzB4eCtHQzg5UnN4ZjR4YzhadmdxZE9yZjdTUFNDeklLQXkzdisxVTI5R1Iv?=
 =?utf-8?B?Y2RFWTh6WVpXdzdZamoyNG84RkI1ZXg1aDBhOUVick8wMFhqVW54T0Q2Wmxl?=
 =?utf-8?B?UnRoZENrREIrMlY5NThOUW8wcGx1WjVrMXN0VHhYUTVacVpLV1BZTWd4WHl4?=
 =?utf-8?B?RzcvMTNEQloxT0ZVd2ptVzJaMnV2YXEvdmJUa2ZkSjhsM2dsc01OZERMM2cr?=
 =?utf-8?B?bHhJL1g4M0JRU2lhaEN3OHI1N0Nia25OT1BrU3F0d0tVR3VseVdud2dzNnB5?=
 =?utf-8?B?Q1ZQWUpVeUxXTnpkMUYzRkd0ZXMvUnJ2OE84OU5zQURKSGJrSnpwSXRTWWxV?=
 =?utf-8?B?RHlFUXF5dVU4VG5LZ1ZPSkFjN1lwUUJFalFrTEM2QXpHL0dyWVpibDh5YW1L?=
 =?utf-8?B?STA1UHd1ejVjckw3enFpTnB1ZXJPRmdlcUhsZVNmczdmaHhUL01SaGRHRzdW?=
 =?utf-8?B?S0ttREp4VXh0dWNLUEJKKzJ2N1MrbE9NRnpGYkRhL1cxNjlUUlZTcERYTzN4?=
 =?utf-8?Q?OMbp4L5pLzCLF7drlR/xgE9q1M7/oqcHyxgDFOS3wBd2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20e25a84-ecaf-482e-c584-08ddf5ec6a44
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 13:16:30.1751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LSBPykinK6Nfxbdws7vI8R3DIzXplEaxc1/y8gZ9iGs0RULkylo+Z75xIue5ORA134kqr+oRoacftbTqa7JbNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6404


On 12/09/2025 15:13, Ulf Hansson wrote:
> On Tue, 26 Aug 2025 at 17:29, Thierry Reding <thierry.reding@gmail.com> wrote:
>>
>> On Mon, Aug 11, 2025 at 12:37:25PM +0200, Ulf Hansson wrote:
>>> On Thu, 31 Jul 2025 at 14:18, Jon Hunter <jonathanh@nvidia.com> wrote:
>>>>
>>>> After commit 13a4b7fb6260 ("pmdomain: core: Leave powered-on genpds on
>>>> until late_initcall_sync") was applied, the Tegra210 Jetson TX1 board
>>>> failed to boot. Looking into this issue, before this commit was applied,
>>>> if any of the Tegra power-domains were in 'on' state when the kernel
>>>> booted, they were being turned off by the genpd core before any driver
>>>> had chance to request them. This was purely by luck and a consequence of
>>>> the power-domains being turned off earlier during boot. After this
>>>> commit was applied, any power-domains in the 'on' state are kept on for
>>>> longer during boot and therefore, may never transitioned to the off
>>>> state before they are requested/used. The hang on the Tegra210 Jetson
>>>> TX1 is caused because devices in some power-domains are accessed without
>>>> the power-domain being turned off and on, indicating that the
>>>> power-domain is not in a completely on state.
>>>>
>>>>  From reviewing the Tegra PMC driver code, if a power-domain is in the
>>>> 'on' state there is no guarantee that all the necessary clocks
>>>> associated with the power-domain are on and even if they are they would
>>>> not have been requested via the clock framework and so could be turned
>>>> off later. Some power-domains also have a 'clamping' register that needs
>>>> to be configured as well. In short, if a power-domain is already 'on' it
>>>> is difficult to know if it has been configured correctly. Given that the
>>>> power-domains happened to be switched off during boot previously, to
>>>> ensure that they are in a good known state on boot, fix this by
>>>> switching off any power-domains that are on initially when registering
>>>> the power-domains with the genpd framework.
>>>>
>>>> Note that commit 05cfb988a4d0 ("soc/tegra: pmc: Initialise resets
>>>> associated with a power partition") updated the
>>>> tegra_powergate_of_get_resets() function to pass the 'off' to ensure
>>>> that the resets for the power-domain are in the correct state on boot.
>>>> However, now that we may power off a domain on boot, if it is on, it is
>>>> better to move this logic into the tegra_powergate_add() function so
>>>> that there is a single place where we are handling the initial state of
>>>> the power-domain.
>>>>
>>>> Fixes: a38045121bf4 ("soc/tegra: pmc: Add generic PM domain support")
>>>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>>>
>>> Thanks for looking into this!
>>>
>>> I have picked this up via my pmdomain tree and applied it as a fix
>>> with a stable tag. Please let me know if you prefer to take this via
>>> your soc tree instead.
>>>
>>> That said, I guess we have some use-cases on Tegra where it actually
>>> would make sense to allow powered-on PM-domains to stay on during
>>> boot. Although, at this point, it seems better to deal with those on a
>>> case by case basis, as improvements on top.
>>
>> We're actually running into one of these cases right now. This happens
>> for display hardware where we have simple-framebuffer device tree nodes
>> that are meant to allow a seamless transition from the firmware's early
>> framebuffer to the Linux framebuffer. But since Jon's patch disables all
>> of the power domains, the seamless transition no longer works.
>>
>> I suppose we could argue that seamless display is less important than
>> systems booting, so I'm inclined to say we want to keep this patch to
>> fix the earlier regression and then apply a fix on top to address the
>> issue with the early display.
>>
>> Do you have any thoughts on how to deal with specific power domains that
>> should remain powered on during boot? Ideally it would be something
>> standard, but worst case we can also special-case in the Tegra PMC
>> driver.
> 
> Does it work to leave that particular PM domain for the display powered-on?
> 
> Genpd should deal with this then, by simply leaving the PM domain on,
> until the consumers of it have been probed.

I need to check that but that could be a good idea.

Thanks
Jon

-- 
nvpublic

