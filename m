Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010011.outbound.protection.outlook.com [40.93.198.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB036247291;
	Fri, 19 Sep 2025 09:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758275736; cv=fail; b=DdEh4EViqSpSARMuzc6cyX9mKUS+bAcwvVzpyyMCtDp5eixlmb+/A2ebR6N6blA/L7TOTEi0BJT45A8qfC6Z7KkNC7dDcmg3410IBdO9wSZUqNvn+FRIbHNGQ/NHZS3W6uVJ6x/VF1lw0OGkNGc3lq+ldgY7VJH5XNUiGN15JbE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758275736; c=relaxed/simple;
	bh=KVrhsykySaoloGfRNkHeAhrJcewcnMBEw+Dwc8XHtHw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=L9AHCJ7Bh22PVNUBbuZtkE345H/ZAd29GQc8ER+7a1HmbTMP9Tk1Ky6J/1UU/xbRThrfVdhG0SQmGKuTF9Wk5kSsA0ImRAKbeVBXwpGuPZ88SE9DcQ1OZiiDDi14LEStaVj7lQ6PyMg0RI3P78I2rJdn+dStpYSJmnZVK7gIihU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Apg7GKJq; arc=fail smtp.client-ip=40.93.198.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Apg7GKJq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UIXAQLJ9VOFMCIHQCXSYfUl2FzFMxwgyFysvs4AUlvItKwbtt2cPbFHETc9i/7FEnAUePVs5gOAv/oeYqKDDgUKXncKkOkz/JW0uaegIYQeRdckbACTuknPcJjP28PZgYdLwhxDmcOAbVmIA8eL7qbzX3pqQGJ8wLLrWd7aAdSwTJ1eVxy2EjFbVDgozNl4H8zoi8Ml5jn45059cdL7EBrEVS7JcTCyGgYPeSjw2/69klWzlOt3Gqdl3zfhyI5TFv00g980v6TlVrZqctG2TiCD4X9i3gEv6zHnEnpRuj4bmjmPZyticgftAoQyo3SPU2CQcc4Bkf8DS2N/6wdYSAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=byefv6U1Khkj8BWxLQGIeOkAgVxn8QMVX8Km78sTiNY=;
 b=KTBLXc0/vLc+qbCIOzN6kaYsiOP6e7q+qPsxcec4+/C2WTgP3bu6CQgrkSOz2y2RT/6AJ9arXmPBtNQXBKkX7JqVXjIyqFSCxnnVmiuXWZaxEE8WSKyhxeii5gE+G3qrSjRl0kLZyBb4OBD5zSB8qA20x01lkZejWkDQJtgx2gyYm6lErO8VfCQU4jgtv8+5xsjjvhxhUg3iAWr9S1DPSIhJ52nVNL8vyO6I6/fcCQ4K8egZKIKOPDk9oIGargqeZDAJjVd5ohjhMP+c1d39h5trHdVHv3o5gZBrPF2rJFlO3DDTJw2fsnzL8jfI8445UeRlwtV7RIrTmnie0kXSpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=byefv6U1Khkj8BWxLQGIeOkAgVxn8QMVX8Km78sTiNY=;
 b=Apg7GKJqVc6gsMSYzL1s/Wyw5t/n1UpHAGUOJbVHe2XwUBC5h8g+JAuHE78PlOrswgUbdcqm9K3E6c05pSK/fPgplVlaHmwpHVkP+W75ODWfwC8dU7QJYWuYrEojX2J4D4CtCwMEGmFt+fg/MiXkxMTuMc9JEx2EDwXTqL26rmfzFss9CuPGw1+fyHI66t9hWWCGZWTR+iDYML6KGC2X4a6TBRFxPwogSzNv7IMoZovuHAhc8WVXsVG675PZ7mLGYJuX/lr2hNyDz5qq4X+kTmo0AdIvYNQqBCzMDyef186sedP++Az9tk4hQvB9EsyCKVO6kWZ5lbKVl4oOMidslw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by DM6PR12MB4315.namprd12.prod.outlook.com (2603:10b6:5:223::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.17; Fri, 19 Sep
 2025 09:55:30 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%5]) with mapi id 15.20.9137.012; Fri, 19 Sep 2025
 09:55:29 +0000
Message-ID: <5e1b09f0-7f4a-421c-b09f-4f95c1c6ec3b@nvidia.com>
Date: Fri, 19 Sep 2025 10:55:24 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] soc: tegra: fuse: speedo-tegra210: Update speedo ids
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Joseph Lo
 <josephl@nvidia.com>, Stephen Boyd <sboyd@kernel.org>,
 Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250903-tegra210-speedo-v3-1-73e09e0fbb36@gmail.com>
 <2334a545-9a06-42d9-8282-674b94fdcb2f@nvidia.com>
 <CALHNRZ_gNzCEOzcYBY4o5Hz-efS5b52K4uZqmw5ps5zEfKoOEw@mail.gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <CALHNRZ_gNzCEOzcYBY4o5Hz-efS5b52K4uZqmw5ps5zEfKoOEw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P302CA0030.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::16) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|DM6PR12MB4315:EE_
X-MS-Office365-Filtering-Correlation-Id: 38ee377f-cfd1-43b8-e0ed-08ddf762aa16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T1lNQW5vRzQrZmE2dHNvWVVzZkVUWExKWi9aWGdSckVhMmxQNTRneERtazEr?=
 =?utf-8?B?N0cyNmxrY3NYSTBiZWk3Tld4ZytrUU1SWHU2b2pVdWx0cmFBSTVUanBvcUhU?=
 =?utf-8?B?RjhjTnpmYkFudm9XM1dwYXR2TEdLcnpqZkwvRHBUdHp6dys4UzNUaXFzS1Ur?=
 =?utf-8?B?WVRRU0J3eWR0djdMbm9nWmNoNHUxaFNkcXpDakdOOXJQa1ROLzZtcWF0bzB0?=
 =?utf-8?B?OGx4ck9uRjZMclFBNGhnSzFDMTY0QVQ4d2xjbllQcWxpYzNtQjF3clMxK255?=
 =?utf-8?B?dkhIV1FPY3NGVnZFRVB6N2xoeWxPUHdFa1hzSzBHU29ySDB6MG9sRTBCRGww?=
 =?utf-8?B?eDJBWFM0RjZvTndtS0phNlFpVFhQN3ZUUFRYenVIbjkzbWI4ZVNQU24rbXRV?=
 =?utf-8?B?ZGdYVnd6aHJPdVI5QUhZT2p2Nks5ODlhWGV4bjk2SWxwTStjcHhjbWk0dkcv?=
 =?utf-8?B?K0xzN2tBclNQR0hpOEl0SXNJQWQ2dXFzYVVwczk0WlVsc0FTMlpmSm1EaFpv?=
 =?utf-8?B?cUJBdDBrbUZkZTFhREVVR3NRd3NBT2VSVyt0THo0OFRMRE95MmdYcCtKZm5J?=
 =?utf-8?B?bGVRZ0IyVjdqd2pmMjBiRmRyano2eE9tVDZpYW9LZzZ2ZDBEeTZqcWk0Tytj?=
 =?utf-8?B?N3FaS1FYL09NZkhheFlzN1V4S2tJbVV6QzNJSGw5MENEMjUycXNhbUM2TGxw?=
 =?utf-8?B?OC9WS09aVFJnS2ZNdXIxYTZ2T2tobVpJR0pOaVB2UW5wdUZzOWtLQzc1TGJM?=
 =?utf-8?B?aDZwalgwQ1Z1S1lXeEpqcFZXUENMOGNiUFV1QnYwVEFEQUhuRDBHdVo4b3NT?=
 =?utf-8?B?L2JKaEZYRjJtTGJpRGtEb205QkkwTVlrYzBNYk1NMDIxMU9acExtaEV3OFhw?=
 =?utf-8?B?OTNNNEpsT0E1QnRiOWsyOHJBRGV5Um92TFY2Yk1PSGJOeGhCVURDYkpkb2xh?=
 =?utf-8?B?MWVibWNsbVVsTnFBeFF4OHpxbXBOWWhtWDlVd3NTVklBbmNOT3BsOHgvTDZz?=
 =?utf-8?B?RjR5LzZUa3AwbFZKV3NmbmxyYUlJR3hrU0JVcmJRaUU3Mm80eW14MTYveTJU?=
 =?utf-8?B?NmJjSWk1aGFYZjJOME14cVhVRUVoY1ZXcm0vbHhSaEtqaUZFK051cFFiS2pU?=
 =?utf-8?B?Z3d2cHVRb1dxVjQ1U1YvaktGM21OQVVWZkZxZDVRK2VqR1lMbDFZTzNDWlNW?=
 =?utf-8?B?RzdQeXdBTThmQWdYR2IxL0ZERUxGR2FkQVZ5SVg0QVJSSG81MklLeTJFUG1w?=
 =?utf-8?B?MklGeWs4K1RwS1VQb0sxZFU1aTBlOHluNTFxaVFvTUNRQVp3ZWZNRGFpYTQ3?=
 =?utf-8?B?Z2pKTlJ2RnpRNW5td0NTRWJrUkZZbllUQkxZb1BSYitCcllqSnZSd0NLNkZC?=
 =?utf-8?B?aHdKYlo2ZUx2THhkbnlKT21HNHhXaGp3WUhjeVdMc0JZL0llRGt0ajBlY01K?=
 =?utf-8?B?Zkg4bHpoeFRYcnJ6cE0yZTZJVjRRUXlHZG55UlMvd0lZNTNUWFhSbGczN2dD?=
 =?utf-8?B?QjVrYnFDV1FHV2FWZjc0dHhhWkVsQ1NhaDdJa3k3OE5xOWROMzJucm1WdFlL?=
 =?utf-8?B?eWc0c1F6N2lKQWVqVm9IVGUwSjRXekR2TS9vcm45NWFrS1ZSckt0WkpFd2dO?=
 =?utf-8?B?M3psUXlTMjBLWk12K1prQlphNzFwWW4zNXN4aEh2OEJCNnhQMzFPQ09YS0do?=
 =?utf-8?B?VVJVYlhoZ0RyQlJxeGpId1VRbkNCeUM4U3RmeFREZld3Ui9NWGFOU2xyMUtV?=
 =?utf-8?B?T0xwZk5WNUs4NDdjSE16M2x3c29ZQnpSZXhkUExwTkJMUU9odTVZVFAvWW1h?=
 =?utf-8?B?UHl5dlNBc0RGblluTzNBUFRaV1NQWGdLTzFYd011SFhnTGpIb3Yyb0R4aDNq?=
 =?utf-8?B?RVR5Z1NDM1Q5MkRXcUNzS1YvSEpSMkkvOHhwd1lGbU5CZVhiU2ZYRU01ZnYw?=
 =?utf-8?Q?to2X6lWkqPA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V05EN2dsNGVuL1JBbWp6a0ZBS1VMT09IVVh0MDZ0eURUbERnRmpVcldZR21i?=
 =?utf-8?B?SXB5bHJHMlRIa1k4YlhndkpVNmFGYzFyVDN1RnQ4Qm1XbFk2enYydXR1OTF4?=
 =?utf-8?B?MEdseFJiaGlWUnZzTUNvMFBnWmFENUZLcU41MVJNVHhpVm9KajQrOHZZeFE2?=
 =?utf-8?B?UmlQVThyMFE5UXZNdWRSUGhvWlArZkJsd3QyOVY3dW0rd3JhOTBJaFhGNk9p?=
 =?utf-8?B?c1hzVUEzc3UySTJuc0NDZ29pc2dNQWY2RzVCVUdQWFl1VllqTFk1cS9ETC9i?=
 =?utf-8?B?cHNoOU5HZVFXUDRKV2ZNazMxTm9OM3I2bnhnSU51cmo5WDVXbGtOczd1bUpn?=
 =?utf-8?B?SmZLSVFnOTFGQUtwYW93ZzJxMEpJWWJKYUdwSk9XdEhtbVVZeFRWVldNM2Jo?=
 =?utf-8?B?WGsxWUwrVjBFRkNpcGJYeUVxejdXUFd4b2picW9kaHRlY1VDM0lQa1dPWmVo?=
 =?utf-8?B?UDFhZ2lHOU9CeXk4c1EzdzYvekNyN05RalF3VnpkTklsWHZ2KzhoVk5jQ1I5?=
 =?utf-8?B?V1ZhaWJKZWtoSmt2bFFnMGszWjl5ekk5c2JGS0IxUnYrTE5BR082L0l5TFor?=
 =?utf-8?B?QWJ2ZHp2N01QaTNwVTQyN0FNTWdtN3NoOHZNVElWVTRrV3Zqa0xKTjJ6NFNH?=
 =?utf-8?B?M2g0RVI2Q3pkSndYQnBqMGZ1T2o4bFcrY0RUZWZxdm54MmNkTzRmVkJ2VVVP?=
 =?utf-8?B?Y1EzVDZwc1ptVm40Vk83ZFM4cEJTdGV6elpZTGpDM3ljRkVpWFp6N2ZJczFW?=
 =?utf-8?B?U1JnYkFnWmVkTXBWTVJpMkNyRitONFFYSXNXckg0KzQrejJ4TWs2bnkxc0VZ?=
 =?utf-8?B?NU5qTFhRK21meGZsdXIrWW5EUDhVbkpKVjRwdnlWTWlBaXdwYTdJbVVNUERB?=
 =?utf-8?B?TG1lVDhZOHpML3VOVHp4ZFdsMVVKZk5HZndRSm1pOWtlaTdUcmdieU1KS1Fl?=
 =?utf-8?B?R01PSHluQkp1RkRraC81SC9GZy9YZ0p2N24rTXpaR3RMMlF1OVdXNU5oS1pS?=
 =?utf-8?B?bW1QbVN2KzYxZVFsWnN0djRjaU5PQTNMcTBTVnpjUjdUY2NNL1NURjNXWXVy?=
 =?utf-8?B?TGdMNnFPbytXZlAvdG5tdHFUR0x0N3RFcjZGNEg5WlBuOTAwMXlOdHZ3S2Zk?=
 =?utf-8?B?bUlGNFUyVUlCMFVNNmFNakFaUTVxLzNVS3pxTmVkK2kwMnczK1pQbUd2d1lJ?=
 =?utf-8?B?M2dRZXV5NTVwMnFVWXAwOHpDVFVMbFIyUzk3YmwvY3lrLzhYZ0d2S29LOHhL?=
 =?utf-8?B?NGpsWG1VRmtoenlOUkc3TkFQR2hoSUcremJnOU04ZWtYTlluQnBWTFoyZjlI?=
 =?utf-8?B?aE1oeThxQkg3amNVM3gwcUcxckJaUForTlBNbFpWVHFPTkJlMkxjMk1DVHB1?=
 =?utf-8?B?ZFZyeS9LWk5taFVPUlV6TUozUm84dnlVNGhzS1Zyc1pyNTllbTlzN0xBRjFw?=
 =?utf-8?B?ZzB5czREWG0xbnpTaHdKU2RLTFpjRTBVaU4vakhBSkw4M3lYaGhlR0JDeDhL?=
 =?utf-8?B?V1BuYURHNnRQYXVMeEg3RzBzRmJ6RnY1b1RQTTBBMzV2bnJZOE12TUdLdFRm?=
 =?utf-8?B?RitpM3RqUGVtTWZNRnp3SDRVZ2dSNCtta3BTa2lYN0Q5eXVxSi9yNGZVUFZU?=
 =?utf-8?B?RkUwekFwR0FYUHIra0I4T2NpbFAxYzY3UUV1dzBKbXd5MHViOVhXWTd6YlJQ?=
 =?utf-8?B?bEtCUHhVKzZmRGp6OEVoRmI2RVFMODVTQ3RobGhMVHBGeXBTL0wyTDdXdXcr?=
 =?utf-8?B?SUpjWGpiUm5hWUs5KzBNN1loQ0VhV0JFOEYwMlpqUTlpRUI0UnVNZFVsaTBC?=
 =?utf-8?B?N1A2aHByVG5DR2wyZkxwNkYzQytRRVB3dmJtQW9ZZjdoMmpNYzBkZzVFTko5?=
 =?utf-8?B?bllIQSsyY1JKYUlBOURKRXZxdWc1d2liYWJKVS9tVVBXQi93Mks3Y2JrTGx4?=
 =?utf-8?B?U2d3RnZmODNSVGRhdzRFNFkvbzdjNm93aG5hZDhrWE1LYkwyTUlnVTNZNkdO?=
 =?utf-8?B?UWpSV291cGJIc20rK3M1N3hJcUxDa1d6cThZTlpKUGpVb2dqOVVGWUJOa3FT?=
 =?utf-8?B?WVVGOEFHT254MXV4Y2V6WDVhWkFNVElMZkJLWHlVR0x4bC82RVNOYkhmS2VD?=
 =?utf-8?B?bGtscytjWWJoNGt3cldpYlhSNDZwQzFlbHg2c1JtWTFoTUdBUms3dTdDaUpK?=
 =?utf-8?Q?Yfg5fyQhw7HC+e9kND/uNy1q6rDVZpjTay9XsteNLu/f?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38ee377f-cfd1-43b8-e0ed-08ddf762aa16
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 09:55:29.1692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CUjKNblibgfs8+N+KwMXP4l4wX+CFJgnBJptOQw6qgysFSWy97hBp8Yen2E8f/GkCt42a/3MmWtS6ELNxoDwbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4315


On 18/09/2025 18:19, Aaron Kling wrote:
> On Thu, Sep 18, 2025 at 4:45 AM Jon Hunter <jonathanh@nvidia.com> wrote:
>>
>>
>> On 04/09/2025 02:58, Aaron Kling via B4 Relay wrote:
>>> From: Aaron Kling <webgeek1234@gmail.com>
>>>
>>> Existing code only sets cpu and gpu speedo ids 0 and 1. The cpu dvfs
>>> code supports 11 ids and nouveau supports 5. This aligns with what the
>>> downstream vendor kernel supports. Align skus with the downstream list.
>>
>> Do you have a reference for the downstream kernel change you are
>> referring to? I have found this change [0]. However, this does not quite
>> align with what you have in this patch.
> 
> This is based on L4T r32.7.6 [0], which builds up the list over
> several commits, so I can't link to just one. The first revision only
> added sku's that I had specifically verified. Mikko suggested to just
> import everything from downstream and to simplify the conditionals.
> And that's this revision.

...

> [0] https://nv-tegra.nvidia.com/r/plugins/gitiles/linux-4.9/+/refs/tags/tegra-l4t-r32.7.6_good/drivers/soc/tegra/fuse/speedo-tegra210.c#72


Thanks! I saw Mikko's comments on V2 and that makes sense. The problem I 
have is that comparing this with the above, it is not clear that these 
are equivalent. The above is using the 'a02' chip version for setting 
the speedo IDs but this is using the speedo revision. Now it might turn 
out this is equivalent, but it is not obvious to me. Ideally we would 
end up with something similar to the above.

Jon

-- 
nvpublic

