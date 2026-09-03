Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011034.outbound.protection.outlook.com [52.101.52.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B436A34D93B;
	Thu,  3 Sep 2026 07:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788419087; cv=fail; b=T5cwmzYKFq0ZRvWZD7N6LOWUY5CVLGHeFQaOi8ndwzqGGAIYEjUsGhlWoYqo51XyOETQqKgB3qqY911jpXM+bYGNjJk0QybCuGOeVStck+JyxJT5to2+shPwSxNRVkncP/Mdk6rd9hCVGaW5ukOpH335bOFjIPJ2Xq+lXgKBjM8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788419087; c=relaxed/simple;
	bh=B6wGewSjKX9PQb7Y3gxJKU8hG3GrVwJtWR0mzLAsdfs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TUa6aNpNolyGpCqNEG6H1N9QUB4s45K59EpOdiazRy6K5YyAmaVn9Zt11LZoXhTeYoeCfovzxaLWJKZN5TLpH507rjP9OK4qupi+GMsG2uMPR1SkCbgMOWHgz6dGGAb4gxVYSDcsQfP1w7vzLAeqfF3Q65un7T2AGx8DKpShtOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=O2SHiW1K; arc=fail smtp.client-ip=52.101.52.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="O2SHiW1K"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AaRCfQe9ZkAXkGoF40xKiGETuIlUW2ah43bV1hISLrFF2wR+WC5l8QlFggevNTxxr/xTYMg7KwTkpiXIyNWwKP0N84e78OBO4Yn2p5n8auRUbpJRncOuF0o+zQt3niwMZT+ov2AWuw+q4CUl4uZNrOCOdvJ4tVGtc/zmsDQskexrg9u+clf24JZ6ER/1vi3IvuXteSXuie5Q6Jw2oZrC3NDAONgBV2oYEfDD0fwlyIRyIiT5idOAWj/+cJcGfmm06FKEEEbs0UugY7sfSUbWn1dUwq1zF8Z2OPSiKkyX/PFFpvJxA+YB3NstJDHj0FaupzriPc1Y0Rmw5TY7UEexww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B6wGewSjKX9PQb7Y3gxJKU8hG3GrVwJtWR0mzLAsdfs=;
 b=HgpftqOAv+tw/Wjis4S1FfwrBfq4BIHMxK3JIGGOxioWm1fH8slrZ2222szpUEtVFpDNPKLdZgZJRdD5si5RU/mHaxi6Jz2/ce/c/BLlKi5frFNBnC1KqBxRF+EKp3RDRPvcVBPYTSzfmgX1NMF6QPlBHk2MNIC3kAXK47SEYDimXc4LAnSHc/kimDcHH5Cnga1LQy0YaUjt323fQzQkspIlIFA8c2qxoSNVSCU794LSxPMSys+LsKgxZiZNFj3435FRuEPwc6iQhsXdCyVPzcmZURiD/X4eGObrF7s2ka5wwtsRJlEUG4me90hNYn5oH4525m0L1dgs5mLQAvSmGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B6wGewSjKX9PQb7Y3gxJKU8hG3GrVwJtWR0mzLAsdfs=;
 b=O2SHiW1K/aJ4OcDR3B6VVIsMiFiHjfOsphZVNyHxt1+jXsOyXiMog/a1pcfI2txTVIFdFc7XjFqHm1FPSCtqKZPg5RM05FHIFiAOY7bsTBWbipFXET5W1fmvGMOL1aDPiZfFY10niVIY4+LYXFOMU25CNsBuFcznxKha2XxwzzYBzsCVUakky3+K/B+T3OaZFbkxxkYT8fAdncYoqcNGKMqUhypQeYCN1PmmcjiNcNpW+vrA5ej15v1WvLVdaQ+uTpnibW6ozaQII0q1Ui+3dQzR5Xk8UPG+jK4zd0nSNxIK7dVX0r+pZmRPpAh30nnd7TeU8BqcXdJjsSVUVX8OeQ==
Received: from DS0PR12MB7512.namprd12.prod.outlook.com (2603:10b6:8:13a::5) by
 IA1PR12MB6284.namprd12.prod.outlook.com (2603:10b6:208:3e4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 3 Sep
 2026 07:04:40 +0000
Received: from DS0PR12MB7512.namprd12.prod.outlook.com
 ([fe80::2b77:2cc3:d751:6b75]) by DS0PR12MB7512.namprd12.prod.outlook.com
 ([fe80::2b77:2cc3:d751:6b75%5]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 07:04:40 +0000
From: Wayne Chang <waynec@nvidia.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "mathias.nyman@intel.com" <mathias.nyman@intel.com>, "vkoul@kernel.org"
	<vkoul@kernel.org>, "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jon Hunter
	<jonathanh@nvidia.com>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH V2 1/8] dt-bindings: phy: tegra-xusb: Add support for
 Tegra264
Thread-Topic: [PATCH V2 1/8] dt-bindings: phy: tegra-xusb: Add support for
 Tegra264
Thread-Index: AQHdOXrTQx81fQnPiEOnFSCe78BW9La5gC0AgALx1oA=
Date: Thu, 3 Sep 2026 07:04:40 +0000
Message-ID: <108d90bc-7979-4d16-ae60-a2073da2b3fb@nvidia.com>
References: <20260831185835.3732707-1-waynec@nvidia.com>
 <20260831185835.3732707-2-waynec@nvidia.com>
 <20260901-heavy-sweet-pillbug-366318@quoll>
In-Reply-To: <20260901-heavy-sweet-pillbug-366318@quoll>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR12MB7512:EE_|IA1PR12MB6284:EE_
x-ms-office365-filtering-correlation-id: 47135bb4-b5c4-4fb4-38eb-08df09899fbf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|376014|23010399003|366016|38070700021|10067099003|11063799006|56012099006|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 QA5EUBkY3OW9nfTr4RQ2YnbzOP/Eve3H1CqkgLBRGR+HTMPLk0H7y/mlhn90A24uGAFHHcKcGEVeNo2DpaobgL5SnHRmoz0Qss2JipFTtFWajetkGigdgU8fBiAWuFJX0GGooJl8kxP1MjCqOAbmxvjXc1gndqKRmVOj7bA6S4QADqs4rHbogvQ9gctmJDUQVWyEZdDKS0UaRshiFa7p92Vko8WeyUGwLXqzCebRIi0w4vA/zsWthVPlwx1xNTJXoDhtlTWf9yDIFU2idF72Rlx6JuG1wFVv14AgqKR30YUyiuSdmREtZnjtEi5cVOctw84WCs7RG1w+To4Zfwin2FdbowcWukpm+vUTmlbQVUlcRLUXrBsWUW6K1w8r1b8k5JfFdnmp81MtLKRizBO0DNj5cMyYtl6YzKrrDMgZU2K3TIJVbuJlvt0W6GI959er1qp1sWKdG9VaPIXkXIGOHuTX8+LLEX0jR1pZDud+R5GqA7tAajIxyqW9V4yAjUr6DvCXG1VvswJ+79K88TunDw0k3Lm+aBbDjrIFuUBVwFL2jZuuBE2InaTkywHYlOfzku5KHMA/JJTkPBnsafLjSXArtT5Jdhcrhz3od0sUO1L51xiN/uoAJOOoVjP/pzLjRPLGnsYv/PyrZxzE51NV9LB4xmULJvvOMYZq0o4hvRpU40cIoilplwQY8JToBvZ/mv1EerqcFJzU5a3OWdoU5dO+xObBMYJtJFwkYbRdEpk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7512.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(23010399003)(366016)(38070700021)(10067099003)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RklQcWFSTTBSWStWK2s2MC9LZDFrdUVwa25kMXJGdGdRbE4yVDhQYmRjOXpv?=
 =?utf-8?B?akJyTG9wa2ZQSm5XRzY1VkJpNno5ZExxWXN0MDVnSktoMWdZMmREMWh0b0pE?=
 =?utf-8?B?YXlQTUh5bkY5Vkp3N3lVaXNqQ2dHV1gxUFEvL3RHKzBLR1BrN3VNL0g4cVJn?=
 =?utf-8?B?eXgrZjFvSjhnZ3BtT3VEQXZ5Wk9zc3ZkaHF2ZTJqZEZRWTZkVyt5aE5lNEsz?=
 =?utf-8?B?SUdvVnRMU1NnYWErSGRBa09TNG5aN2VZUEp1b3Uyd0d6N3p3Vlg0N3RxYUpQ?=
 =?utf-8?B?VkRjQ052WEMrUC9QdkZ6MXNWeWdBMXM2K29IV1lkNm9GdjFiUXFDZksraC83?=
 =?utf-8?B?dzZCQlhvK282M2F5QVUwWTFrT1dMYUlPMVBzVHhFRTJvSHBRN3BmN3RsMnU2?=
 =?utf-8?B?SVY3WXhQaE5rTmJXaEg4Q0RibnhHMkh0cnZSNDQyNy9uWnpsKzhhYXg4NEcr?=
 =?utf-8?B?VnVLbkVUcjJYRHdnVXBoVGNtVTAySU82L1lXRnZjU2tWM2JmRjZ3ZHpBd3VY?=
 =?utf-8?B?djF3bFdnTlVhVU84bk5HYml5TnMvUzVvQ3crTHFzN05LS2FhUnFNeThmUkkr?=
 =?utf-8?B?VW9IdVdjc04yKzBmdUpWQWNvcFFjNWUvVXgrcnJZRDJmcGZWWXZxZG5uTFIy?=
 =?utf-8?B?bkl6K0FyWXdMdzluK2RoYUF0NGNwRkJWZzhOODhJSUFsdGNTdDhOVklaVTZC?=
 =?utf-8?B?UHRwajNjYzRWS2lnWVI5aU5jUXJlODlxQXZJMk5EM0Zpb2RoRWgreVljcUVX?=
 =?utf-8?B?Y0NZTWl4R3pHT2xMbFk3Mml3MzRoaUFnV3c0TEtjbElDSEdmQ2ZTSmM2d1FE?=
 =?utf-8?B?N0xId3M5cS9HdDBpUmd2NUxzVlp3U3BqVG1ZMk1hUFF6a2YrNXpaNjhyTTZQ?=
 =?utf-8?B?R05mbC9pU2xTUFZUTnJROU9qV1IxV1lVNXQ0Z0wyRlpscHJtY0NKMzVkL1RE?=
 =?utf-8?B?VHk3R1QyaExhVEJ5eHFUd3NLUWJZQmJXL0hWdDJEYkpxOUxDL3F3WnhjU2po?=
 =?utf-8?B?TS9XOTEvbnI5MjdsRDVjVFBqR3N4OEpHaUpCcFoyS25iRWswMmpodUZ2V3Fo?=
 =?utf-8?B?QlJySjVtSVp3a1ZkNEJ6UU1wRUNrNzNsb0NqUVN2dDhudHFBb29Xa2ZJQVR3?=
 =?utf-8?B?WUJINkJvRnFRcU10Z2lMMDMvVnY5Z3BFTlZZQ0JRRjEvRXYxN3RCZ2FMb0s2?=
 =?utf-8?B?OVVQcmpDQXlpZ0ZkVmhTb0hHWjExbndSNTZWN1o3VDRvWUxUNis1SVg3dFU1?=
 =?utf-8?B?ZXRwQlFTWWVKcTVwczZyRWVXR1pBai96amhhdU5oUmoySjlRenJRK3BaSWZK?=
 =?utf-8?B?RDZ5S1RBV3ZRNjhiUjF6Z1E3R3l5UHJ5UWFjZDBQbFFXbHp5TFBwK1ZmalRH?=
 =?utf-8?B?WkdPcEJaZlRLYnM5TGlRWHFuNUU2aDYvcTd4NjBqaVJUb3YzZUhtZVE1VW1P?=
 =?utf-8?B?ZU1mNEk4VUk3Y1p2RjFIVE1Dc1J0NmZLVEZvMHZzZ3FFR01aQlgxQUVINzJ4?=
 =?utf-8?B?ZmhOWW81d2o0UlU4TkpvS1prSE5GSG9sUDZCdEdSN1NaWVZaUWs1OWJCRC9S?=
 =?utf-8?B?ODF5NjVLS05UV1ZveFhGZE04a1RVTFFXdThvV0pPaUEvZ0ZtQVBpcCtMdkJZ?=
 =?utf-8?B?Q3lIM2IyWkxLTWU1ZEhocDQ5TE40ZTYrdm5pdDB5bmhHOURrU1NhV3RHSnI1?=
 =?utf-8?B?emJ4SXFmRnRNR3paZmppeTJpU3ZvNTNid1ZKbEtKRDkxU2FKWWQrYXJxRjg1?=
 =?utf-8?B?WU5OUkd0cFpQQ0NaVWNJeTNyQzZINGZ5WU9JVzh2TWEwbkNoVUhDdUZLR1d1?=
 =?utf-8?B?MUN5aUVIcDJRUzM3N1hMR3pTajF3VlU1enpEYS9Pc1dJWWtZYWcvZ1p6ZHpL?=
 =?utf-8?B?dm1aQWpHcUlvTlR1UEN2dWVKNWlXbUFidEdrUjNOWE5CR2RLVEJqMVN5QmpT?=
 =?utf-8?B?TXh3bEVUQWN1U0RGYStoUkhuRXY1S2hTcm01QXcyeDVnUXNjdjBKV3dQYkxX?=
 =?utf-8?B?d0NYVjhpdkhCMnpYb041bnUybnBHRXFHb2RDeGFFVzVuNnBiSWJWM3gyMFgy?=
 =?utf-8?B?bUtENEZmblhkckZ4Z1FJR2xaZUxUZytqb2NjTWZtdmc3UnFSQlp1Vm9DZ010?=
 =?utf-8?B?WnB1dENhd0JoM2VBamJTUkxSdjFyVkJLYzB0dUs2eVlhOW5QQkY0VUpWUnNv?=
 =?utf-8?B?NFJsQ0dCS2p0RnFSUGFLdHc2NE5XM3FqU0l0cjdZR0JzaFRiSWQ0bUpIbW9T?=
 =?utf-8?B?YjFncGNQaDg2SG13NVBrRjRobjZGZWVIaU92VmFHRmdldUdGUlFyL3NqN29a?=
 =?utf-8?B?eEg4UWRlNk9STHVjYWJiZXVndDZsRHJ0dlpZcG9SelJqUGkvdnBjQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B1E1E3DF3A837E4FAF8C76EF0671C8C3@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7512.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47135bb4-b5c4-4fb4-38eb-08df09899fbf
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2026 07:04:40.5139
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KcMQF7vdkn+wvbtEEXIZqBfYaCgT3YtS32EHHX/l4r4tavtsOdciKDMUka0IZKOh3qe4O7YA9Ee2bRTsdO0g2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6284

T24gOS8xLzI2IDE4OjA2LCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOg0KPiBFeHRlcm5hbCBl
bWFpbDogVXNlIGNhdXRpb24gb3BlbmluZyBsaW5rcyBvciBhdHRhY2htZW50cw0KPg0KPg0KPiBP
biBUdWUsIFNlcCAwMSwgMjAyNiBhdCAwMjo1ODoyOEFNICswODAwLCBXYXluZSBDaGFuZyB3cm90
ZToNCj4+IEFkZCB0aGUgY29tcGF0aWJsZSBzdHJpbmcgZm9yIHRoZSBUZWdyYTI2NCBYVVNCIFBI
WS4NCj4gU2FtZSBxdWVzdGlvbnMgYXMgdjEuIFlvdSB3aWxsIGdldCBleGFjdGx5IHRoZSBzYW1l
IG9uZSBhdCB2MyBpZiBpdCBpcw0KPiBub3QgdW5hc3dlcmVkIGhlcmUuDQoNClRoYW5rcyBmb3Ig
dGhlIHJldmlldy4gSSdsbCBhZGQgdGhlIHJhdGlvbmFsZSB0byB0aGUgY29tbWl0IG1lc3NhZ2Uu
DQoNCnRoYW5rcywNCg0KV2F5bmUuDQoNCj4NCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YN
Cj4NCj4NCg0K
