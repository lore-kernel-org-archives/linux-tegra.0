Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013068.outbound.protection.outlook.com [40.93.196.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E8722D9E9;
	Thu,  6 Nov 2025 14:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762438487; cv=fail; b=EU1JW+69jjiqIqrys4pOt4F9HNGVMusVsp8eecd4e5za3woE2aN/b89vZf4zVUZEp/D5kxL+8cTzHW42qOC2g/rezgT1Abj1ZJwO9WyT+UQGCzLod072SMs9++rCOAYTuKwCXribGXjwPtM9cwHV2FgyAkD6ApEOM8hctBBW9EE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762438487; c=relaxed/simple;
	bh=qFR1Ynpqvs2lZBzjvNbXmS3iG0vzVxReLp5Te97cLGg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Y11PWCa0va6Nx5Oz6GPTeSuHyVdAaDOCE5diCPKzehx7FhqZpbo0R4/5Kq6cZBd9Lh22jN0LxeIkeIZ7Jd4TKvXgCPM8KuoD7XTjqVYy7KyWTReqCrDZgG4AW+iAI/SUa+8YanrI2880AV1NBXgTNE7pJe8puLzSJEd8As3t84k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mkG20Q9e; arc=fail smtp.client-ip=40.93.196.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mkG20Q9e"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nB8PsKlX5r8sBYYNrUbCBdlRsQNrFwjKxob70vP+1+vWHuTQDjDK2Y8fB6GHXfCMa20+rEdUzsMbNekLqG76y0xER6ckoznh28UbNm9Y7M8TBDCyhDMFOX0DygHsAPAqZ/9T2RsbQsHnBUJ4vuZrYoVlD3vWnzPLGWFHVsmSiQHsfVKnRlzOT5MVYQDi3eML1Ja28qAXTsKzeO/LvLEI+MMueKPn0GZ1Zyj/mFMTS1qBYwsE2MCZ9nOnG9ix/BdY68TZaHf/vLjZNzJYfFszENYBmv2RidMF7bL7y2+ezxp9TM2gze12r/e40bILCnrMKvxlsY+4J7XoAI21i0dwjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tFUs7Ota9L4cwc79Oi3PPZkPmDN/FQtnSA5mYZ1rR7c=;
 b=s8Evr5QBOJAwt0I3dLI6nnNdCcG9SOTY/WXeO2GfJhz9A6tAiRprx/gJ361EBMxih8Kq9BXzM2desmfhyMDSlQBwviPmTL9m8i4yhtGItAMSAgmJqtC6lHHbN1/zTdYBMf0+6cfWNagh9CTtSTQJttCDryqU1fcZg/lB5jsw3BLu316WvIvo8YdPn3vzwXrrkfGiSeXDJcEFrcZELbAMU0/Hd9YMU9K1sEEkOXUvbVsRujDcTD7IXR9M/g7sRQKM5/QPd9KrgxPVz6fSAF6Znc0OW/cYmH5ZNbAVrDhmSfwPm4S+MHNHW7wuAkOVXR/usmZohMw6LoGg85ROj7woZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tFUs7Ota9L4cwc79Oi3PPZkPmDN/FQtnSA5mYZ1rR7c=;
 b=mkG20Q9e2YJ7V7m4MLRaH1/G3M5M7k/wfcaDylc0VxPP150N4i7zhXnuTN1zfpprF67bqqzIsMUBLVIPpucvZh31MhfDEUJgCFpYqE5ODm1WAMe8iiWSmC5MELu58BlhyH/O3QsFKkpQIaAtOGEtmPP/Vzfyk495Q666Uu8muefXg6+Z4SgGi13y+liSRz0hcq5qMxQVDlfdVBh6iSBDUg6xX6okC/fSxdvZht9ESBRMU6RVOoWWqIjNIFsNpDc0sC69XRNiGDGyIwZXfKla9v1Lt9vKz5jF4DhFLXUOOXbTTZOGdAS6dhhUTzrwI9fBYhPZ5aF8aWabgLj99N6GHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by SA5PPF8ECEC29A9.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8d5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 14:14:42 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 14:14:42 +0000
Message-ID: <69e8bac6-a02b-4949-a36e-4be2d882440f@nvidia.com>
Date: Thu, 6 Nov 2025 14:14:37 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/13] memory: tegra186-emc: Simplify and handle
 deferred probe with dev_err_probe()
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 Aaron Kling <webgeek1234@gmail.com>
References: <20250911-memory-tegra-cleanup-v2-0-d08022ff2f85@linaro.org>
 <20250911-memory-tegra-cleanup-v2-8-d08022ff2f85@linaro.org>
 <4ba8a1ec-fa17-4564-a174-0b8e8eada061@nvidia.com>
 <1db683cc-ffce-48da-ad2f-e25ed901ce00@kernel.org>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <1db683cc-ffce-48da-ad2f-e25ed901ce00@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0039.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::19) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|SA5PPF8ECEC29A9:EE_
X-MS-Office365-Filtering-Correlation-Id: e9c7aa30-a597-4f50-9019-08de1d3ed477
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RzJmTko0OEZ6R2NwUGxHaHNnUXR3QnR0U3VtbXpHOFBOcVc1MS9TK1JmNTZS?=
 =?utf-8?B?YjJLQlBSRmxMZGdpOUYwZFFFOHRSeUd4eWdmY3I1UmdTRDJTb3N5TmV5UUor?=
 =?utf-8?B?YTVRYTNEOXlWUEZpN2tlSmZKRnR5b2M5a3hnQWk2cG1zZ2FML00vMXBEZmVs?=
 =?utf-8?B?OGJGNWR5clI2bXltdTJxTXFLbWNrMUY2SzJ5T1ZML2dvOUNPT2E0SlIrSVF5?=
 =?utf-8?B?ZkF5dXZqYnRLQXRyTWt6ODcvZ2RqVGhsbDV4blFNeGZueTc2WC83R05GUGpr?=
 =?utf-8?B?dkgxR2I5WXlocjlMWDEwMFR4a0VSZGM4bis0UElzU2ZjQ2prRlhYY0grVGNV?=
 =?utf-8?B?L1JzU2VzVEJXL1lqREFDQlpDOWpsZFk2ZDdsNVErNG9UNGh4OU1MS1oyVXNR?=
 =?utf-8?B?bjRmOUJvaS9Jdk9RRE1peXdaN05XS1NHV1pMRVEyeEdQKzMvdHJyNWduQUha?=
 =?utf-8?B?T0prU1NMd29Ja20yVWpZanVFWDZUa0Z6S0h3VFpMbzl2OEx0d1BSRm1XWXND?=
 =?utf-8?B?ZzVGWW1Ec08xU3R3VzU5YWdTbmdPcE5pQWtXZmdZa0lkZURKSFlNL3kxWm5O?=
 =?utf-8?B?TWNuanFoYkY0aEEvdG1jN2I0T0w5emZEMkw2NWRLMTZTTkE1TVAzb2JYTWNu?=
 =?utf-8?B?cmFYQXlGVVptcTFCMUNWYTVRNjJwS004dmg0WFhNbklUVjVMcmxHb0c5Um13?=
 =?utf-8?B?SU5jc3dtNnpjUDdSYXo1cHpFVnVqQnJwMVg2dEdMVlQzYk9uVlJYMThEcWsy?=
 =?utf-8?B?R3FOdDNYYkJucGdHUTJhM2hpUFZrVThrdTJtbFFFbFlNNFgyTmdYZi9xRG5V?=
 =?utf-8?B?Vk40Vm9DSTZkV1Fjb05tNHNoaDJQWjBZRno5bkEra0tnMmR1SGtWRzZtekU2?=
 =?utf-8?B?RkVxYjAwSkxrRkxqWWhpT1hhZUxhOEtEeTQxdDdHM01wZ2haZC9aL0ZGenhT?=
 =?utf-8?B?VVN1VXlSRkpnUDRCU29iR2h5QktQb3BQK2tLeXdmSDJmdHV0UmJhWXJJSDNr?=
 =?utf-8?B?Q2pEN21LNmlRajA0T0JRR1BZYmhvWjhFYUQxWjlUcWt3eFk5bHlqUTVLN2J6?=
 =?utf-8?B?aFdRN2JwMElaTFdTNkxxNHI5NUpISUxNVlRBMGZzaFRnUm9mWU4rY3duak1F?=
 =?utf-8?B?Y2FUVEd1OWxKRmp3dDZpdElJSXovT1krVWtTeEdaT1Y2ejhRdXFRRXhFZExT?=
 =?utf-8?B?T0o3WVE5MVovdWpCMGVnYnYvSFhaOHZKaWNwd0tiRm9na3JyUURlSDIzU2N0?=
 =?utf-8?B?T0pmWlVJTzl3TElBaUpmL2REWXFTL2o3UG05bkxEb2hza3I4d2w3clFna3NY?=
 =?utf-8?B?aW1pNTZyS3RFWm5BdzVxd3ZkWjNQaG4zTEgrNFlOYWtLcnYxZ3RGdXkvZThu?=
 =?utf-8?B?cHFNaDdCSWVYMm5TOGk4aDFObTdPUnN6eHFidm01U3dPU0d2bWpBZCtjRGRk?=
 =?utf-8?B?cnEvMS80YVBZWUg4TjRYTDNxdXc4MFJob2RVQXRHWEJyWklRdld5akdYa2gz?=
 =?utf-8?B?c3hQbVJTMzdaT3hTbUJzUFRvV2Q3ekJDdzZ5WVJUcjlRNm9kUCsySzNzWkNM?=
 =?utf-8?B?aE5GUUl1NTNoZjRZSUhjeDZWV0JJTHlNMjBRdjg1aVVBc3YweVpDellpUnp5?=
 =?utf-8?B?WGxZeVRwWnFYNXJscmR2bGNmMFZuS05SMTdhQlpub01Qb1ZtdHBLZDB1N0lV?=
 =?utf-8?B?TEs4R1JwUFFhT3lKdFZDSXFHR3ZVR0hHOVBmK3hlcWZacEs1ZlIxOFcycDdM?=
 =?utf-8?B?Q3NDU2VmeVRFTVU2eW1GSDJvTFFEeCtDMHdkdnRyT0lOLzlXL2k4dnp6TFFx?=
 =?utf-8?B?QWVXdlZZK1RhSlBoVTFMcS9ubE9mNGU4Nm9tNnM0T3NhZkt6dFdic3hxcUR4?=
 =?utf-8?B?NmcxeHUxNTltdGdiNFB6aHNKQmI3c3p2ZWJ1MDBxVjVMNis5QnpYVS9vZlBM?=
 =?utf-8?Q?EibQkCE4Js3Ok1t0w9QRp0FUpEShFGin?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MndpRVZmbVl2TC8xZVdmM1gzc1k1bDNHN3lxMTJ3eVdLbGVqRlJQVGZqb1BN?=
 =?utf-8?B?aE90WGFIL29Pd0hlS0JRdGdFd0l3MC80K1dsSElNY1Q0ZVZNeGtUVm84blRz?=
 =?utf-8?B?aGduWVh1TG5UYzdGZjZpTFRiUmxYa0FrR3VZU054R2xGSjlFWFhIeGtJRTl5?=
 =?utf-8?B?ZUVETS9jN0dJakFQSkNyZTd0VUhpRlFvb3ArWFBDcjZlaSt5UGM5ZzFNN0E2?=
 =?utf-8?B?c2JQUXcrNFdabzkwRXhRMnZ4WmlwcDdWRDhxZ1o3SjB2NGpkb0tENXdQL1du?=
 =?utf-8?B?Z0xpd2RwSThQbUNqOTZHTm43SSszMHMwblg1SWczR3F0ZWo5dExyOGlXOTdw?=
 =?utf-8?B?ZHFyb0pwOUxBcGRzZW0vdlJIcnhaY29vOURvZUhPbDY5Qk42cm8wTnNtSFpQ?=
 =?utf-8?B?MVAra2ZFeXJXWkxZN0FBTlBsRWg2c2JpSThIc3BZMUJYY1hhVGNNK1N0b0lQ?=
 =?utf-8?B?dEhwSlVDZVg2Ymdhc3pmVnFoUVVFWXVZYmZlS05GQ3h5MUlUSXp5TTBXL1dP?=
 =?utf-8?B?dEV0OHdtUStEMmU5WTVRZmNHV1orN04rQUUwZ2dvSURZTnlzOHQ2MHdCMmZ4?=
 =?utf-8?B?c1Fpc1BIeWY1U2ZnbVFnNXpVYnMvNVAvbWYwMkgyTUo3RVZIMUl4ekpPTTNa?=
 =?utf-8?B?TFdSbHVzNFJCbS9nQU85c29DeUtjeXVHWC9GemNYUkNtQnlqRmY2V3BDKy9V?=
 =?utf-8?B?dUpwN3NRcVdMdEUxS0R5OENSd3FpNkVkT3lDOWF1dk8wQ2VLK3FFNjdmSk94?=
 =?utf-8?B?bkE3aVNtdmU1eDMvMURDL3NwVjBPNDFJUXJtbS9KMDFSV1JyK3NlMU0yeU5O?=
 =?utf-8?B?Q3AzYzZHNlorb0dkSWVHaXVoTGdUcXdnSHRNTUhnSmVxdTBJR1BxVWdMVXk5?=
 =?utf-8?B?VkpDeEZDKzlqcWtyMWxmYVdOZnNPSDIzYWpzZ3NVdndyb1RhbTVjaDNnRjI0?=
 =?utf-8?B?WXRaRVBmaHpFTUVzbU9pYUJocmkwYTYzSk9xUEtGbmxncXpaYXRnYnYvS0g1?=
 =?utf-8?B?Y3VOcDJBajJUUFlpcmZNOWhOWW9ORkdpOG55SFlidVJVR1VuL1Q0TkRPRTJq?=
 =?utf-8?B?RlBpSThnM2sraGhDa2VoaHIxU3VlVTZYU1lMSnBrRmFmMzQvVGdiaFMvU3FO?=
 =?utf-8?B?N09GeU9yL2loN1RyQm5CaklISWVSUGJ2emJPNlA0LzlHVVVmU0VmSEN1MFBW?=
 =?utf-8?B?OHdWaHcyc29KbWNLRGxFQSt0VEZud2NIdVpTN3lKZEhtcXhVWWJkYitvTW9K?=
 =?utf-8?B?RzNuV2JjeDBiQWdhZTVSS3lsSHM2dHJXcW9iUno5YXpDS05ybmlJeHZjY1pn?=
 =?utf-8?B?RFdvTDlSMzQ3NVhNSHNidFdOWWZNaFN2UmNyUlVlTVlmYUFlRURyT3BnbGlr?=
 =?utf-8?B?cCtBQ01sUEpBcmRSNERZbUF2ZWRiR2FmUFhIMUVGU1FZU2EzbVZUYzZxMkEv?=
 =?utf-8?B?QUFjbGxITURMdkxLWk50TGszYm1YbFlNRjhGR2d3dmtvcHBZb2lER3FVNVpL?=
 =?utf-8?B?MGY5RVFELzBnSmdZS0t0bHl1Sk1PK0RHWlRCZmY0WVhHSU5ZRDMxSWYvTUFW?=
 =?utf-8?B?eExKa09hRWxSbGJyQjBiZ1F3ZSswSDJWckVBL3pPYjZFTVpyK0xaQWZRVFRV?=
 =?utf-8?B?cnB4dmNSelNMazYvNVBZejJpN3BuR3h3MkNERVFEUjErZ3IycmRoRllJWVh3?=
 =?utf-8?B?RXlsTkl1ekJGbFUzS2dQTHhIQWF2dXE3b2tMd3ZsWkFlWUYyWitZMVZnL2tn?=
 =?utf-8?B?dnVvbHJNSWVnaGZTVHRsSDVaMVhJR0pOa0x1ay9FYmZJelZOMlJweWQ2S3l6?=
 =?utf-8?B?a2JQRFAwMDRSM2FuMlQwcTZjL0F6c2xFZ0IzVjdpSi9Pamh1T2k5VkFpV0JB?=
 =?utf-8?B?Z3pMNkZGQ21oSndWM0dadGRtOTJkM0I2bU42azJGSVBmRWlBY0NHRklPN2lX?=
 =?utf-8?B?YW9MWG5lOWxvSzBybHRqSEpiSVhsMGlIcDgyMlJuMHpkMEtiTHpyeUJXdHJW?=
 =?utf-8?B?M1JXQisrbVcxL3YwZ2F1UVlXNWlSNGpXMmRjdVdadUl1aVArY2VrempvOVcx?=
 =?utf-8?B?T0JZa05qMjArSTdRaUpGbHhaVVFuUGZISlVGSUFuZVJjSkc3Mkp5SkYxNk5D?=
 =?utf-8?B?ZDVZWHRCV0Q1bktZOFBockk3Z3k3NHlpd2NqaGM4V3E2ZlBSYmRrSHFkcUpZ?=
 =?utf-8?Q?iIqlWZeRl+R+NCWSDIZaN4AJp3Ucrs2y4DZrDIkLV9zm?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9c7aa30-a597-4f50-9019-08de1d3ed477
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 14:14:42.5255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nBbiWsGnWOX5Zgzjw4kL2wwODs+1p83ccjAAGcE9vlpBTzpQBU2xv/NEQJTEG0ib8I89ezaN8psXCKk74jUTlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF8ECEC29A9


On 06/11/2025 12:13, Krzysztof Kozlowski wrote:
> On 06/11/2025 13:04, Jon Hunter wrote:
>>> @@ -319,14 +318,13 @@ static int tegra186_emc_probe(struct platform_device *pdev)
>>>    
>>>    	emc->bpmp = tegra_bpmp_get(&pdev->dev);
>>>    	if (IS_ERR(emc->bpmp))
>>> -		return dev_err_probe(&pdev->dev, PTR_ERR(emc->bpmp), "failed to get BPMP\n");
>>> +		return dev_err_probe(&pdev->dev, PTR_ERR(emc->bpmp),
>>> +				     "failed to get BPMP\n");
>>>    
>>>    	emc->clk = devm_clk_get(&pdev->dev, "emc");
>>> -	if (IS_ERR(emc->clk)) {
>>> -		err = PTR_ERR(emc->clk);
>>> -		dev_err(&pdev->dev, "failed to get EMC clock: %d\n", err);
>>> -		goto put_bpmp;
>>> -	}
>>> +	if (IS_ERR(emc->clk))
>>> +		return dev_err_probe(&pdev->dev, PTR_ERR(emc->clk),
>>> +				     "failed to get EMC clock\n");
>>
>> I see now that we dropped a 'put_bpmp' here and we should not have. I
>> see this is in -next, do you want fix up or I can send a patch?
> 
> 
> Indeed, thanks for noticing this. Please send a patch with Fixes tag.
> Will you also take a look at other patches from this patchset, if I did
> not make same mistake?

Yes I will send a patch. All the others look good.

Thanks
Jon

-- 
nvpublic

