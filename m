Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010030.outbound.protection.outlook.com [52.101.193.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B644432693B;
	Tue, 11 Nov 2025 21:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762896596; cv=fail; b=B37uwooPd/u7WFzmYGla8OBJI4qxfFdnQsAKeZXWqTgNYCxqlTxRyOK6KHNxLRk5VdsVHq1k3MbLdVHhGhHidiruDVAmMMLV73ocChimM3EbdT2qUNerBzV87eoXUZsh5E1Hu2px+CA4H71QvllJEPcJ3UV9519nKQTa5SftMXM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762896596; c=relaxed/simple;
	bh=nvGoMe1CaT5uQC5iW59NtizaM8g8Y8pau68E7fEU3kA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=j6uQX0ARr+0MziswfX0treC3faGtQAV28JGKiq76K/tfKTZC9Xm3pY6exXWWIvyZ8La+MotwUkAzRXKqE97WNKDgHnue8OK1J0BO++AXmFPmK7ontE8bWvXoPLuiZ7vtdDUnltME107b6SdWSb3leJflnxe9tfwdrLFmIA5gOnw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WNTFg9xc; arc=fail smtp.client-ip=52.101.193.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WNTFg9xc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IzrHiHTPabHumlb0jFAWoPsYxybGCzsKrXXAOqBqH9EFrGPL/n9NljVXoWUCk6/SH+r5b+bRM/1Tg7zSAjifeVfbepWfI8j/6imqygKP6wXMzW9LUAOe3u76uESPBZUqCybS6iV3QfMf0fjzvsaSe7vN3hH2hVVLQjwBsIie50WUEI+1WdJRU7Wyw8CCxdzuGlbw9IopUumn7tjfPrjmnEhGlM2i+SraytQ2kNbB0MsgwWLKd3LH5tIdA+N3LlXKpaCvWdKRejubmcUamkKsW3ZKyhyJww+eXN5zbFpKbGPlyHaIlEkWGlQ/oz/QC6D58sR8pB35fT9Ilz4s4o6NDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4mUIlalwd2FDglyzFa+KL65fgXO37crcR8V9WRAFWQg=;
 b=u0acExXHgwYBxuZeOGHtmxWkN2wBD2ktRuozSf7wR5f5+cQD1hw/VAngIdcd6DXTNKTPXuYfy89mY+AhxeURNQ9m4ozatPnVXIBY9sdlUuLSo0X4Bu7ztoA9Oaq4IxNDOis7A+3X3eZjP/t9q91u5ihK1bcO9EELXr+6PN/5AD6LBTCj9cnJTDlGICUdl6nypi0QFEUAS3vt0JYfXUeSiwOb0IB8qOxgvVQES0uTtQ1FUj6SptL79mIXpDiZpyiNdVG8/ZGz4i/5fPVsHOu3Esf+BfqrlidWNTAguGpNlBtST8ZEueHVYL44X1oMT6JTDyF6Bu+kDFgJ8hgmpNgL8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4mUIlalwd2FDglyzFa+KL65fgXO37crcR8V9WRAFWQg=;
 b=WNTFg9xcagz/RAvwE9k+j3EKTo679RYBGrRA84/k8qoGR+7r6AE1nXs64A+IPyzxSmCXkKoPu5pN4up4xh7tLOoRBOFH9lcCMmnNd6Py6eWKwM8dk4RUpJvZGwdgJKMcE2uhUCxNkLh7aRqh6IPxwVWR9OIeKsK7Blazv7huyO/DI9Xm4Lcq3OmJHsq3h+W/HFy/Q15zJ1HAgrdiqGMx9L8H06G/4FWnlcMX9xpBKeuIvmO5n51J3maD/hnLtEA8pmyb2QBGICu9NVj2mPhLg5RmjJoORGPJJUCEbaPZYIrcYLp5wHtwalGJR7m3ZIuC48iYPknioyDQXs2jzkWE7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by DS7PR12MB6071.namprd12.prod.outlook.com (2603:10b6:8:9d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 21:29:50 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 21:29:50 +0000
Message-ID: <249bbe7e-e2da-4493-bdd5-8f4b17aff8fe@nvidia.com>
Date: Tue, 11 Nov 2025 21:29:45 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] memory: tegra186-emc: Support non-bpmp icc scaling
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20251027-tegra186-icc-p2-v4-0-e4e4f57e2103@gmail.com>
 <20251027-tegra186-icc-p2-v4-3-e4e4f57e2103@gmail.com>
 <82c8dda8-6fcb-48f9-bdaa-f3d1431e41ae@nvidia.com>
 <CALHNRZ8nCojreFCMXfbBBhWAMtmWN-04XtuW8fEsVD9bw+-AzA@mail.gmail.com>
 <CALHNRZ-CO5i9jeLkEG2cmHxcW1bcLhxcBSxjmL2euHfQy8yr-w@mail.gmail.com>
 <e6ce190e-6df7-4c36-abca-f09df3cc80e7@nvidia.com>
 <99ca4992-5736-417d-854e-379542549bee@kernel.org>
 <7f3dad08-cff5-40c2-8e7f-f6441a3d6b91@nvidia.com>
 <d5d23eb5-f43c-4e4b-9926-3fba6ffd3acf@nvidia.com>
 <CALHNRZ8vFJyfFXbxFehWA9TGkdrEUy9Wsm-DxEOT=tVbYTcU5Q@mail.gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <CALHNRZ8vFJyfFXbxFehWA9TGkdrEUy9Wsm-DxEOT=tVbYTcU5Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0047.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::14) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|DS7PR12MB6071:EE_
X-MS-Office365-Filtering-Correlation-Id: ff98fb67-5c2f-4465-5f7d-08de21697228
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YmFDdlFkTHZaMExsM0VSaTB0WjR0VjhqQzhTdXYrWDcvZG9lZ0U0cHhVUUlB?=
 =?utf-8?B?c084OXFGSkc4c0VrTEZWaUJ3b1lwM3F1WW5MRmsxdkxVOTlBcnNNeHRQdy9G?=
 =?utf-8?B?aytvU1dQYUE2ckt5ai8zWVhkbDRyVDFTejVieDBoOTZkdTdvQ3FFSVlZMmNE?=
 =?utf-8?B?WWt3THplMkJkcEZNcHM1RmV0L2kzdlVPak02TDBRSjRlcjEwZUREdENPT2lv?=
 =?utf-8?B?RzdOOVBtdXhlRUdtWjNlRkc4NmMxRjZIOFhqZFhCdm9NdktCK293NEZrQnBR?=
 =?utf-8?B?UVlEOHdRWXliOHcwa0RsckZ6czZFNkw1WkJQNUFwNnpXVDFhRk5KNWZkczl6?=
 =?utf-8?B?cWpKR0ZUcFFEYW1nd1UzSmhmVWNVemdXc0J4ejFXLzllQm5WNWZueEpVRDJ3?=
 =?utf-8?B?WDJxckJXQVNRWWdNNXBWOUlROStKcXJydE5USXpFdVo0ZWkzNkcrZThHMUFy?=
 =?utf-8?B?cDI1c0pIaXVpT2h1eCtQbUJ1aGtRcVZDNHR3WjhMR3RKYUFnbDlYM0xUR25J?=
 =?utf-8?B?WW5rOTZ6UGdmZHM2Y2FTam9TZ2hFVVgxUThDMGU2cXhnVDdBWkFHOTBhV0gw?=
 =?utf-8?B?TWw0b2xpZWEwMCtNWmRZR2NBUWw4RzNTMUE3S0NuZWhjV2EzdEtHam1vbGUy?=
 =?utf-8?B?cnlyT2IxVUVERUhLTHNlc3pEeVdoUk9yLzRXb0ZPaXgwTmhEUmh6cG1la1pJ?=
 =?utf-8?B?M0JRTGxqQnI4RVRyMDh0cTY1N1VyNWpIbm1EcTh0VHlvcmZ2RzEvVnpPMVpw?=
 =?utf-8?B?bHhOak4zekhRSmRwQXJ2M3BRdklPTnRWYVNJdTlML1ZTcE9MTENPemdGNlJp?=
 =?utf-8?B?bFF5S0dZNWVzU29YOUdzbExMRUtOS0R2MlZncFFSNmwvQlJmOG5MSGxrQ0dH?=
 =?utf-8?B?QTJ2Um1sV01PQjRtWjVqc2NPejlEUkxBMHhiMHFaZGZTZDFQZHNESFdoalFH?=
 =?utf-8?B?dmhST3VXZFVjQmJ4Zm5HOUxFdkVyaEQ3R0lkUzN0Nk5ROGJVUWdKczZuVTZi?=
 =?utf-8?B?M2JOYUlITVRCcEd3RDArZjRaSGZUamYrL3BMN0p0aHdCellRcjlMRnZDYkxT?=
 =?utf-8?B?dmZWSTJleU1WUW5keG92Q1o2bUVHNXlmMklsK0pXSUlDaTlhNEdLQzR1TFdk?=
 =?utf-8?B?VkxhUi9YSWJFQi9vMk1JVnpndjB4dzlnRXltVU5uNGZ4c3VQOUt5RjRncVBa?=
 =?utf-8?B?elc4OGJxaFoxZSt4Q2hmYjhwVVk3QkFXNHNVRkR4d0NFeWF4MUdmRkwxNTlU?=
 =?utf-8?B?YmIydTVYU3ZoRGZTTFRrMUhOQlRFdGZpTnN4MkZrN1RIQUNmcFJxUkozS0dK?=
 =?utf-8?B?TnlBdlY0c2RSeHdLQzFvbDlUTnhRZ3FSWllIU0JDQ3JieGo5QU5IUWxTVVkx?=
 =?utf-8?B?SzlvcEZuQnNoTmFaMCtQenBFQ2QyeGkzcDM4N1dPOWlGWmhsOE5UeURuMWR6?=
 =?utf-8?B?eS9VbFE3OXlZdzhTOTgycWNtcjJtbVI5aWVKUHFDT0RhZ2RzNG1xSHFKNXpC?=
 =?utf-8?B?L3E2NzZFQkRocHlURWVpZUZjM08rQmFMTGtCaUIyQ1FiMXg1cVkzYnhhc1Qw?=
 =?utf-8?B?Sm5IYjhtY25OdVJqRjRETjFlOWJodDkwRyt1WFFSSEVvRkhoTW1kMHczVWJa?=
 =?utf-8?B?NWZ0WS8wSTF6YUFWZk5XWCtPL3RRQ0ZxazVGK3dtb0lsQk5nemZlT2VWY3FS?=
 =?utf-8?B?bkdzRWZJZnBsWUc3RnlKSERZQXp4ZWNseHZQTVJWbmpEaGdmaVRTMWNmeCtV?=
 =?utf-8?B?MkYrR1lIMzFlLzY5dyt3QUtONUp0blRVaDh3Ylk4TVJMeE9uZGF6Yk9MZVRV?=
 =?utf-8?B?U3BVY1h4UFZEVHJaYkNxV2NsaHp1aXhaSm44Sis1bUxORi9BK1V2N0VvbXZW?=
 =?utf-8?B?VmgxdVZKNWpNdHRaaVhtQzlodjc2RzRwZ3ZQeXV0Y0p2b0tLNnpoS2M0dVZO?=
 =?utf-8?Q?Khe+Aw+G0AblnBSJKxGi1zZ+lmb/Nu/z?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YzR4YXRpTHU0ZlFKcnExdWkrbmtDRkxzWmtIdkZRWEtyYjNBVmpSS0R3OUJK?=
 =?utf-8?B?VEF1bnFhTzVQZENVeitjWVRCUDZ6eVhFKzBLYUNaRjRlNXBlSUN4a2Z5WmRF?=
 =?utf-8?B?djlYdHVhYjNKZjIwQXNWT0V1ekw0QjNndE1DMVp3YS96WHczZGpoMU53cTRl?=
 =?utf-8?B?SWxtMHlUVHNxVTl3UkNXaVNVamRmVkhEWm82YkN6Zm1lME1iUEJRMU1LYTBi?=
 =?utf-8?B?cEJlN3U4UGhpZjNUclQ5U3ltOUVScUxhdFkzcUhDMG1YS245QWx6M1R4amVi?=
 =?utf-8?B?aFVZVVc2SEg2R01MbEU0OXJoZnJqa1h5N1RxMUJPaklScDFER2RNZzIycisz?=
 =?utf-8?B?YnVkdm5hdnRrMml3ckxqNmd1ejYyUi96WUlpME5ITU5hanJFWEdsQ0tWTnlD?=
 =?utf-8?B?K3ZjOWczOVQwWkdKL3RpYjRFRmNWQTFheWFlU1lONHJ1elNOZ0ZRdnVKWW0r?=
 =?utf-8?B?STZISHgwOWR0ajZFMllIL2k0SDhzZ2NMNjB6aU1URlYrV3NpdklpeEFCZHBT?=
 =?utf-8?B?UTJOQmkzRlRRWDUySFZJeHErTGpsc1NaVVFiTllNZHo3R3V1WFE4aFFidFJG?=
 =?utf-8?B?emN5cDA2Mk9EaUxFdTIyVExQQlJycnhjWEV2RHlEU3JzM3FEdVk4ODc0eUd4?=
 =?utf-8?B?Tm04dTJZcHM4LzY2cTJrWm84bUJJNmJtbUdrSUhTZkVZdElkQ3BMMGRPZHlw?=
 =?utf-8?B?NW01ZFBqU2U1OGt3VERGRWI3dEErNEtTazFaaU1TbDZkT1NqY2UzWkplVVdW?=
 =?utf-8?B?R3BOd1dtMUJuYmk3UDRqNjZhT0JNTFVGMllqRm9abVVoWWh2R2s4SmtaT3JS?=
 =?utf-8?B?U3ZNVGV6TlpxQXhIUDVnYVFZR0wxZERxOU5yNjBpQmxlV3AxeG1wK212bmJC?=
 =?utf-8?B?c0tIc0RKSVBjWmxnWHgvclpXUEVFV1kxVXIyRWpuWkFob2lMaXZpKyt2c3Ey?=
 =?utf-8?B?OHNKNUFuKzJsaWNQVSt5QkltaWszOEd5VG9ac2ZFVk1JQ0pRYzRRSjU5d2ZC?=
 =?utf-8?B?bEJxMFA4Y3g1MldQSGt2RXNmZkVVblNZZllzRW52ODIxVzllamZRcEV4Y2pu?=
 =?utf-8?B?dHhCUWllUmxIa3lwRkpJbjlGUEdTelZUdU9sRnVJQlNSVi9GZ0prYThBbHBJ?=
 =?utf-8?B?LzNmdDNHbDdRVmlCQ0hpVlY1OHBrOTVXeWVHdXNwNVg5SUVhaUMxU3FpTTc3?=
 =?utf-8?B?N0M4a2Q5VW9FbUczb1p2S2gvOVpRb0lGdWJGT3dLMVBpUGZsem5YUWkvakQ4?=
 =?utf-8?B?NEl2aW9ibzNmYVlNa3Era2UwakQyN0RFMHBnZFROSnA0SmxEdlNwcHlJWEd0?=
 =?utf-8?B?c0lBSXBrd2tsSWtiOGN2VjN6L3htaU14dnJhRVRwcnVycW40TVVDTlNhYTA2?=
 =?utf-8?B?UXY1eVNTT3pwbjB4TGRJSzk0TjFRRlJIc0NsUW9uWHZzOUZkVFhaRDkyb3BM?=
 =?utf-8?B?OTd3dFVtSXYyalNIYVYxZXdqVWNrWlg2QWh1UUpJdVBwMGlqNHZlZ1pVS2dr?=
 =?utf-8?B?RHVLMitqa1diWGRSZ215eG5PQ0dpWVFJT2dqUWNoSjFkc3poZEZocWpac0RC?=
 =?utf-8?B?ZlIzVy9WcHNteVVGWHNxT21FVTN6bUpPanc3bW9lb1BBdUlGZUZyb09SWlh5?=
 =?utf-8?B?TXk0bmx6YlMvMFZpYTEyWGZFeXQ5aXZXMGl6eDlRYUdJU0xoZlJpY2VNb2Jk?=
 =?utf-8?B?K2VneUZacmpnbDFSdDFWN0ttWG9NVDlqQ25RNE9uWlFKWnA1NS9CQ211aXR2?=
 =?utf-8?B?dUtMVkxnRnA2a0VyNmdGTUdIZUpPNDdmTmZFRTdnZjRHM0ZYeVlnT055SFpt?=
 =?utf-8?B?aS9XSURKZm9VV3RWQlFiZ2JtQWlxUVA2ZjBPcFhEYTJJd284bVQrYzh1THJW?=
 =?utf-8?B?cU5XVkdwQUlYcmVGK0Y5TWhxdXBQMGI3VHRaU1o1dTYycUIxWXZURDNIWHpY?=
 =?utf-8?B?c0lVV1dWa2dqekp3dWJSeXJDdW1HU2dDVU9YenBPTDJnRHZxMTBqeE9nVkVN?=
 =?utf-8?B?VnNLL3RzL3dIRXVCd1VIcktvRUUxT29EcXdXVGQyYXU2dXVKV0o0UmNXU2NT?=
 =?utf-8?B?bUc4a2hNRkRoVmJWSnk4OXhwcldIeVlZUTI3OTNHblJFc0E4dXVReTBZbndD?=
 =?utf-8?B?S2RrenZTS1k5cHdxU3pyQnYvYTlGYXFKWXpJYjljYkd3TVhLbi8wUWtxODBQ?=
 =?utf-8?Q?gneTq/mjNjhSD5Pp4Jc/NuFYDkAkAgHGAqUCWmGLx/et?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff98fb67-5c2f-4465-5f7d-08de21697228
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 21:29:50.6882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rtH6/R0pRESMdpYGeX4cmcA8oNemnpVSCwcrOu/mDO40+BDR1mIKQ6MNmDSmuVp2ZgVg5klP8ZIyYtJlWE17Rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6071


On 11/11/2025 17:04, Aaron Kling wrote:

...

> My setup uses the boot stack from L4T r32.7.6, though cboot is source
> built and has had changes over time to support newer Android versions.
> There shouldn't be anything there that would affect emc clock, though.
> 
> I'm seeing the emc clock stay at the boot value, namely 1600MHz. Per
> both debugfs clk/emc/clk_rate and bpmp/debug/clk/emc/rate. I don't
> even see 250MHz as an option. Debugfs emc/available_rates lists 204MHz
> as the closest entry.
> 
> I'm trying to think what could cause a drop in the selected clock
> rate. This patch should only dynamically change the rate if the opp
> tables exist, enabling the cpufreq based scaling via icc. But those
> tables don't exist on linux-next right now. My test ramdisk does
> nothing except set up sysfs/procfs/etc just enough to run a busybox
> shell for debugging. Do the Nvidia regression testing boot scripts do
> anything to sysfs or debugfs that would affect emc?

So this is definitely coming from ICC. On boot I see a request for
250MHz coming from the PCIe driver ...

[   13.861227] tegra186_emc_icc_set_bw-356: rate 250000000
[   13.861350] CPU: 1 UID: 0 PID: 68 Comm: kworker/u32:1 Not tainted 6.18.0-rc4-next-20251110-00001-gfc12493c80fb-dirty #9 PREEMPT
[   13.861362] Hardware name: NVIDIA Jetson AGX Xavier Developer Kit (DT)
[   13.861370] Workqueue: events_unbound deferred_probe_work_func
[   13.861388] Call trace:
[   13.861393]  show_stack+0x18/0x24 (C)
[   13.861407]  dump_stack_lvl+0x74/0x8c
[   13.861419]  dump_stack+0x18/0x24
[   13.861426]  tegra186_emc_icc_set_bw+0xc8/0x14c
[   13.861438]  apply_constraints+0x70/0xb0
[   13.861451]  icc_set_bw+0x88/0x128
[   13.861461]  tegra_pcie_icc_set+0x7c/0x10c [pcie_tegra194]
[   13.861499]  tegra_pcie_dw_start_link+0x178/0x2b0 [pcie_tegra194]
[   13.861510]  dw_pcie_host_init+0x664/0x6e0
[   13.861523]  tegra_pcie_dw_probe+0x6d4/0xbfc [pcie_tegra194]
[   13.861534]  platform_probe+0x5c/0x98
[   13.861547]  really_probe+0xbc/0x2a8
[   13.861555]  __driver_probe_device+0x78/0x12c
[   13.861563]  driver_probe_device+0x3c/0x15c
[   13.861572]  __device_attach_driver+0xb8/0x134
[   13.861580]  bus_for_each_drv+0x84/0xe0
[   13.861588]  __device_attach+0x9c/0x188
[   13.861596]  device_initial_probe+0x14/0x20
[   13.861610]  bus_probe_device+0xac/0xb0
[   13.861619]  deferred_probe_work_func+0x88/0xc0
[   13.861627]  process_one_work+0x148/0x28c
[   13.861640]  worker_thread+0x2d0/0x3d8
[   13.861648]  kthread+0x128/0x200
[   13.861659]  ret_from_fork+0x10/0x20

The actual rate that is set is 408MHz if I read the rate after
it is set ...

[   13.912099] tegra186_emc_icc_set_bw-362: rate 408000000

This is a simple boot test and so nothing we are doing via
debugfs/sysfs to influence this.

Jon

-- 
nvpublic

