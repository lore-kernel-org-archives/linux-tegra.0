Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010055.outbound.protection.outlook.com [52.101.201.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F9E3164C5;
	Thu,  3 Sep 2026 08:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788423203; cv=fail; b=XF6jkNdskqDWC7CNRxGUKQHDDXyHFHAPmU7qyPelp1yC4yUsrihPKoVVnP055BnmKB/yIiVbhLOhAFKBFZL31c1xSVSKnN3wdJbe76AhOVRKfWWO5PukpjbBua1uZKQd0ntHdxDrbLwOoZJz0ssqVCcelDhaRlfIWiGBWBw/xJM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788423203; c=relaxed/simple;
	bh=tsW6NF/eBQfZN7+0/ORNgD39egZ3YChhuezlOZJDGlg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OKh9vcvnqzAruLHiEhn2Lmux4QsRnExAocqIG/MzEiEq9U3iXJinRyppsaFNiBikA36UkuyfwOOuhHZOVIT3rT/QevQk/56POx7ARHGlEof0HMLdXxsDaqOsVmuh35s2Qy5PoZnSydlnK0PVtGQ8k1qwahjaGfKtm9yRjJj8E/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HuQA4f3i; arc=fail smtp.client-ip=52.101.201.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HuQA4f3i"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ODQ9b7d6JI5NSfUbh1toPH4252fVrmNHeDtru7ObS8FNCMyaBugy0IygIExZlE3492/g6FzUU3zjYk9B9o8XE0UtBiDYvgyuk3hRnkWt+TOIXMPd+eeVssYHtOc25R9/PCq7h474NUO50/vtHJQ06Et3/aNVXder5QSRMmShWHzyjF9hzMVmKgfBQUk93810UZm3Gb1OwukSD+i9dReQWDeBDBr41TPvPiB5u6hnycLMaynUIqpUeyBQX9Ds3XZRoxX7m+sac6uUYqDRfPmDqAqduGC3uJmG8qERdOcG7yeCmXjDQewzPvMjJdlRRIoRgnEXMykb/9/s+KeMhuzxcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tsW6NF/eBQfZN7+0/ORNgD39egZ3YChhuezlOZJDGlg=;
 b=daQFdYEVh5QJUxaQfKSo7udhZs/5hgQeuo4psEnMCm6AaiiOaaWStyBxKLz9mgJWAJNH0z+qFAIJYfr0SJzu2ZstEK8eiDvLRYLp7YNil/PclYmtdxQNEhx4eTlIic/Z8adE858iHtNAMZYjMriB3m+/9cdcIqOO8p9z0nTHNUClg7/04o1ergSqWHZ0L6OSFShKx0IYfN61mcIBEvYh4cih5pk6A0ob6AxEB8TyjNDZ/fxbA1BnX96np3Vn+3T3XRIjMRGaDbpozDeIOSVqBsOAumwHYMFL4r/X1DGeTkTyc1KScKUdaYJ38unjgfjA75uATG5hIWw+04yE+Ip8Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tsW6NF/eBQfZN7+0/ORNgD39egZ3YChhuezlOZJDGlg=;
 b=HuQA4f3iLDbBqeIueRgZBUtqadC9r6cct/XsIPm5SDss36tBfNQzHZBiGIfp1Str4OQbDwKJLbQtCShz+K46/WYk8YRLlTbntiSJQiESa8zRtOcaSZ4Iqyrm2wdZsPv95pT9XUUk2fpQiMjDpWq0S8ueHjpKPIryJ+ifphvW4l24Kof6iLH+i0UjnopJkqv+UvcIclYXKXACdio4SfTuBN0xU7q5yQyBgl+QRbrbCGuGCDm3TJ/0rBTlUzxSp0KKMF9+DLgQmzjWCiVSbV6+se1/4ePeBkPUFH+vPXbf2MipJuc9w8z1zrDHGv3fIpefzVL36iTJ6ERvTbVUGWi3TA==
Received: from DS0PR12MB7512.namprd12.prod.outlook.com (2603:10b6:8:13a::5) by
 DM6PR12MB4187.namprd12.prod.outlook.com (2603:10b6:5:212::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Thu, 3 Sep 2026 08:13:17 +0000
Received: from DS0PR12MB7512.namprd12.prod.outlook.com
 ([fe80::2b77:2cc3:d751:6b75]) by DS0PR12MB7512.namprd12.prod.outlook.com
 ([fe80::2b77:2cc3:d751:6b75%5]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 08:13:16 +0000
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
Subject: Re: [PATCH V2 2/8] dt-bindings: usb: Add Tegra264 XUSB host support
Thread-Topic: [PATCH V2 2/8] dt-bindings: usb: Add Tegra264 XUSB host support
Thread-Index: AQHdOXrYCVy0Hewxx0ybB+fZ7PfAOLa5gUEAgALyjoCAAA+sgIAAAbMA
Date: Thu, 3 Sep 2026 08:13:16 +0000
Message-ID: <9ea82821-e992-4a96-bb12-d84a865fca84@nvidia.com>
References: <20260831185835.3732707-1-waynec@nvidia.com>
 <20260831185835.3732707-3-waynec@nvidia.com>
 <20260901-solid-uber-coati-381d2d@quoll>
 <babe3a6d-987a-4a27-9270-dac214b7b701@nvidia.com>
 <57dbc01b-6ac0-454f-976b-9ef92efd37a9@kernel.org>
In-Reply-To: <57dbc01b-6ac0-454f-976b-9ef92efd37a9@kernel.org>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR12MB7512:EE_|DM6PR12MB4187:EE_
x-ms-office365-filtering-correlation-id: 224061b2-9fdb-4fe9-cdc6-08df09933519
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|7416014|18002099003|22082099003|38070700021|10067099003|4143699003|11063799006|56012099006;
x-microsoft-antispam-message-info:
 wsy7CtKILrEJP2XhhgGj1HMLLT0tgPvilvfGttdUw4nH2FCz37DgpQleiVupTOk4I7xeZ/zKXYFqXNUEev9F6tfj/V53CQFMsceqhjSwsYGQq+WcmlQziq2RXs3AB5xcJ9k+R0SbC99mGIlSyg0+wljxq+zomI4XW6jgD7yfdr9laVyL3Gq3LHW4vut9vibor2L8sfD0GTJtTnau9FSvsiGz/BUnjRSurwXTA7nSBeWJI1p/9cZw+4Ch8MGollqVeLieMSameqD99IXuvMl654WmfuvRB+bf7YgIX5jcW63yPgbkPL+mIirGAQ7JRc+2HBtgUcJgJLYVjZvG4N41GVs7px3edrOZdvaGvPUpfRfozYOROcyCjQH36SQokkASMoTP8AmblwN8L+wynUzXPnthzQAp8626ZSwMwoSNz4SF/7SwxV4VliHJa9lhD8bxasoQkBSyV4dXzsXKsDxFeilRyIZ2cBQTfhi9aW8Gi294XFQXhxLmZfyBsGcOwQg9tJbxj1WJBPnk7gXsN5n4IUtldye2nNzZptFuH9EzqFYLTxjpIYJWtBOQ1fea2m3B5oxI/Vnjp51iQYMm6HeUJu7tKDJFgGZS7c9acmoDr9aLropQ/3Qxa7DjnXVA+9Qe5LMLOD2SiQIoW/rvGrSeD+82sz4o98LDXHxTzjrXiLQaArltabYiloAJm7iY7Ic4pDz9d7N/Ia/p6Ap6N6cnw62EN/2QxzerJkq3n8UZ9gg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7512.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(7416014)(18002099003)(22082099003)(38070700021)(10067099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eFZxQ1hVYzFFd2RvM2U2Y2tZdmJCWTFCZkc1ZlRxSjhtS0RHNDgxZnRGYzU5?=
 =?utf-8?B?L0wvV3h2YmVoRHBwaXhiTzRNOHBiK0RzNk1xZWdQakdZRmZvTUFkMHV1ckNE?=
 =?utf-8?B?SkU5ekk0L3p4bFdKNnh1VHA0eTlGTUtGZlBWcXJVNnpheVpFUGtVSmU5RURa?=
 =?utf-8?B?amZoelp2NEFEVWUzbFFjOE4yd1h6eE5iSWVhVVZTc1JOTlN5ZWs4WldHLzFE?=
 =?utf-8?B?ZHR5TnJyOVFaeGxQMkR3eVVjbFN3dE9jYmFVVzlzUHpDdk54TzZ3UzJobnBa?=
 =?utf-8?B?UDB1YWZoQTZPNndiWEpBVVVTK1BHcHFJUHU5cDdQV2g1dEhNeHFGakpOU1ZP?=
 =?utf-8?B?MUJmbzNCM05FVFArTnAyU1dQRmZLQUJmdzY2ZVdXYXRicjJkeGhiaVJ2RVJr?=
 =?utf-8?B?Qk54MDVJTURYckFqRTNUS1Rhek1CVHZZVURaSXdYS2liNG4yQmJndjZNMXl6?=
 =?utf-8?B?ZmR6UzZJbUVUUnZEdzlJK3pKMlUwa090ajdzRGVkQ1RValhHZXVVdmZCNmRl?=
 =?utf-8?B?NFhpT1FQMVcwOG8xbE9sM2FEWVM5ekpBdGhFQ2pmUUI4dWphVUY4TGFmaWx3?=
 =?utf-8?B?YkxqZG5xenNDNkNoeGlTOERDdUZseVVrdTdYTEZwTzErMHg0UmlweHFhNU9U?=
 =?utf-8?B?YmQ1SkNtc3BXM2laemtYKzlkOWZwa21lSlN3RS9lZjNNS1ltd2V6dzZNbG9k?=
 =?utf-8?B?MndFOUNFcGpZbzk1WkxaWUI0ajB0QllUY0w4WDJib2Z2WnIyYlNvQ01vOFcw?=
 =?utf-8?B?N0UyM0xTZjRPZXhjSWVLbkllOEZxeXRuUWF1ZVUxSW9aSXNUOVRpUGJ3OVhG?=
 =?utf-8?B?eVlQTG0rTXlpMjBsajZremFUUkFRZ011dHVwSEZHTHpZeXAwaVA3dmt0NmVr?=
 =?utf-8?B?ZjlJWUMxbWphNmduTFMybzNQdkttR3B5aU1oMTdwSGlGT2ZKai9NQ2tjYTBT?=
 =?utf-8?B?RFEycWJxTDZ3YWtUbWJZOE1YOTh6a0cyYXZpRnVkQ0d1dWYwbTI2UzlZQjRK?=
 =?utf-8?B?SnR0enR3S0J0NFNXN2lwS1E3bXhSbmNtMnd2NTFpdHl6T0sxc0tXTWNUNlVo?=
 =?utf-8?B?ZEdLd1k4VVcyR0w5NFpsQ0MrejVIemVxWVFMTVBudkNJa0I2UE11ZGdUdzd5?=
 =?utf-8?B?UDB1TmJybGNjVk5hOWZmR0ZCNmEwSGxzczd1b3NOalVZUm9nV1pVM0p6TXV5?=
 =?utf-8?B?MXp0SnpkTlF4ajUzNFhDV25kcWI2cGlKYmRUbGpmckIxUk5pOVlkZmpaQkZD?=
 =?utf-8?B?bjNHWDMwUHVrMHVqelNmWG5ML0pMa3VKYlBGTFAyb3JKdVVPSEdKa0xrQWtU?=
 =?utf-8?B?blNRUmlmOEV6WFQrellyRzA2UVNETmFXb2tzdldyUjRzOXlPR2RCTXQ4MGlq?=
 =?utf-8?B?bGJvelBSeUZQcFhOd0JOVHJ2c3BGekUxQ1hHZXhXUi94QUc1Y3FCeThDWXpY?=
 =?utf-8?B?bHErRzhHNnQ4NXZ1TUUxU0NML01zcU5yZ1ljT1pjNk5tTEc3TXJsQml2N010?=
 =?utf-8?B?WGVyZ2tSTmFNR21oZlFucnpKSXd0RGxUNnRWUmZNcTgremJWVW5uNjJCOUhE?=
 =?utf-8?B?TmxvcXBvZ2tMdFp5UUh1ZWpMb3pGbnVVN2pqVFlITVlzRkdweC9rOUF4eDgx?=
 =?utf-8?B?WG9TcFo0aUtyN3ozV0xFM01OM2xXTDBYcWd5aS83WkJ4aTV1TWl4dEF2V3h1?=
 =?utf-8?B?RjV6V0tOR0NDUEpZa1JTbjB0Njd1R0s1WGhnVGVKSm1GUzFBWU9CTElaUXI4?=
 =?utf-8?B?cHhSZnNYZzBkeU9QR1cvUnd0N1VtcGlwM05pOVBxc0tyS2JaVnZLU0ZRK2I5?=
 =?utf-8?B?TWRoeHNkS0N4b1MrTFNpVlprdXlkazBUWWczUC9DOEgvNFJIV2VDNmduUERE?=
 =?utf-8?B?KzB3enVXeE9ROUlHMmZ0c0s5ZXh6Q2E5eHgyYWRUR0w5ZFd4aTBNTU4zVzNm?=
 =?utf-8?B?YkVEemg1NUNERFNKS1U3VUhEZFJqQUh4M25xaHJPeXVUSXIvL3NBbDZxaTMy?=
 =?utf-8?B?cGRhWnJDbVdNT0UxT2I1RkU4YVZ1KzZSQ2QvVHY5UjJYYVAvRGVzZ2d1bmdR?=
 =?utf-8?B?QVd5VTFESGxrb1NPbWR5YjNqdUpwQUt4U0tsRGJKcE5nTElRTHBhTU8yOGpR?=
 =?utf-8?B?SW1mZFNXeVlyYWhORDBEc2h0MnZGOXYxYy96ZXpaK3Vyc0twdW01M3NXYVl0?=
 =?utf-8?B?NVZ4WkdQcCsvZng0TFY5NzJPTG1aR2JXQUpJcVlZc1JkK1dJVERINk1GSFJa?=
 =?utf-8?B?MFZpSW10NW93M3MzVkhRWW0vTnNhMk5oSUJFZ1I4eFpZV1RHWk0vZFI0ZC9m?=
 =?utf-8?B?Vm53NExsU015L1o4NE1EMTRGS05BbjRJZmtOYlNRTVh6UWp3Q3NWdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <36879B94A929444FAB60F047EA9305B9@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 224061b2-9fdb-4fe9-cdc6-08df09933519
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2026 08:13:16.5067
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w+tkHRILNw6w3AblGOsMVYEXHJDpsdTM+nPEXeuZJEji0nuXNfFgTW1xlJwOhnjcPWUy9CcTyJBQSprxIv9otw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4187

T24gOS8zLzI2IDE2OjA3LCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOg0KPiBFeHRlcm5hbCBl
bWFpbDogVXNlIGNhdXRpb24gb3BlbmluZyBsaW5rcyBvciBhdHRhY2htZW50cw0KPg0KPg0KPiBP
biAwMy8wOS8yMDI2IDA5OjExLCBXYXluZSBDaGFuZyB3cm90ZToNCj4+IEhpIEtyenlzenRvZiwN
Cj4+DQo+PiBUaGFua3MgZm9yIHRoZSByZXZpZXcuIEknbGwgc3BsaXQgdGhlIGNoYW5nZXMgaW50
byB0aHJlZSBwYXJ0cyBhbmQNCj4+IGFkZHJlc3MgYWxsIHRoZSBjb21tZW50cy4NCj4+IC0gcGh5
OiB0ZWdyYTogeHVzYjogZHQtYmluZGluZ3MvcGh5ICsgZHJpdmVycy9waHkvdGVncmENCj4+IC0g
dXNiOiBob3N0OiB4aGNpLXRlZ3JhICsgaXRzIGR0LWJpbmRpbmdzL3VzYg0KPj4gLSBhcm02NDog
RFRTIGVuYWJsZW1lbnQNCj4gV2h5IGFyZSB5b3UgdG9wLXBvc3Rpbmc/IERvZXMgdGhhdCBtZWFu
IHlvdSBpZ25vcmVkIHRoZSBjb21tZW50cyBpbmxpbmU/DQpTb3JyeSwgdGhhdCdzIG5vdCB3aGF0
IEkgbWVhbnQuIEkgYXBvbG9naXplIGlmIG15IHByZXZpb3VzIG1lc3NhZ2UgY2FtZSANCmFjcm9z
cyB0aGUgd3Jvbmcgd2F5Lg0KDQpJIGhhdmUgYWRkcmVzc2VkIGFsbCBvZiB5b3VyIHJldmlldyBj
b21tZW50cyBpbiB0aGUgbGF0ZXN0IHJldmlzaW9uLg0KDQpodHRwczovL2xvcmUua2VybmVsLm9y
Zy9saW51eC10ZWdyYS8yMDI2MDkwMzA3NDUzOS42MTMyMjAtMS13YXluZWNAbnZpZGlhLmNvbS8N
Cg0KVGhhbmtzIGFnYWluIGZvciB5b3VyIGRldGFpbGVkIGNvbW1lbnRzLiBJIHJlYWxseSBhcHBy
ZWNpYXRlIHlvdXIgcmV2aWV3IA0KYW5kIGZlZWRiYWNrLg0KDQoNCnRoYW5rcywNCg0KV2F5bmUu
DQoNCg0KPg0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KPg0KDQo=
