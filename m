Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010022.outbound.protection.outlook.com [40.93.198.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9065D3FE35A;
	Thu,  3 Sep 2026 07:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788419478; cv=fail; b=vGPOGfr1nLPg9OeQNBigPtkyaeL6snvzG9MaTmF9/4sYoUcB3mU0wPmf3XuQdS8t7WmH65Pl85H8oVPEDfdSBBSaFmhnQ+8idDy3NStU9xFZhmdbS/cbcE+jlDFX/EsyYd5Toke59u9rn1YSSte1/CHOOuSEk/IwlwxgRAwurJM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788419478; c=relaxed/simple;
	bh=oEiKRIEN4yRg1vZhPUdmSWyKa+o9dGB7E1CeuzoLOTc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QrDcWzpmTDITejnGzjpkUtZcTPtOjpfeUEP54dlz5Xmew2NYtNrm+dw4QznlsNnpoXfFu+WLF3t0KWt4ykvlW5gcZUoktiZi6EARcgeSmeNj4wTzZ7HHXFt6nT/cnX7J66wSLPOqv7alIg08YIf9xa8kX7jnXizbcyLYBPBeBrI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BePgXKq7; arc=fail smtp.client-ip=40.93.198.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BePgXKq7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B7TF4kA94aZQrLKY8XgjXevCZmWS0dcPR8sjqZYvHZ0UldEPPocoIq2wLe1VJ+7oVJ1QYDNAQ/Rw8Tl0Ubec2GNKohEAblkwtanEtlrYP/87QqKc7R0YDC8AhTvOxwWV9zFtH61Klin+ILU6GBvbUOu9Y1gFQPDA1FKXldKbU5f6EiX+jYZ7RSUR7LLoppwpZhLRldFM2xiFXF6myxqoxjSRso6S6q/U+uzPtaKANoLifOV604YJbXhcpbeuUHVwm6ynof4ZcRijdFYCET8C1peK4wFvWKyXy4cpIvlN5ODcLQXKNnoDYppH8OxGPeZ1z5QpuUsiArGH56+rUK3gLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oEiKRIEN4yRg1vZhPUdmSWyKa+o9dGB7E1CeuzoLOTc=;
 b=MqfWHKph7tsz/ZmFKXF3jL+lSiybQz8SzrCoOVuLPriZtC+xa/dWeQcXfvRC9Z+yn/7NpeOCqVHk2bNvquK4ThG0FirbPSNLsgQG4kBd4MQbc3KjjGQWCmU2fo7MUe9gPxRXvuwrgtwxLyCNIlUM0l1zTembyOp6DIPlPh+CO3pjL4xCfsxXXwtbs55r0awiw3OzBRaIwBMBSaO5afXp+pkN+SPNplMQfqnLmhbZC6aoYoodrRmRPnTEHEijnQ1TiwuMNFRwtY5HfNa2LkF5H3Bz+XmZ2LXfbXnyt/0wBjVwR0C8ULsyHqX4BsMlkYXqP0tzADiE7j8cX+eMi86JCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oEiKRIEN4yRg1vZhPUdmSWyKa+o9dGB7E1CeuzoLOTc=;
 b=BePgXKq7EsEwz8vU9PNDLxZwsLgv+9+QbcCh/hOX5AzG03lvZGxl1H3SBLkX9e/VQyGOsr7XqrU/IxCF67stZEvz9NTXniH5rfHGK38Po+bb4/1voTsjQ1iZuc14YpENqVLBfV5VivL4+29Jd9L8WdPN+M82pifTnTZeL03Yt6aa1QC0x/pBj9hYIgNiD2Fo3rHxHpMXSJ3Lm+wS+JYdIlqhr/tey75f+coHkJHGCpA8qeysSRybhUW9P4yj6XMU/yFEFQ9muPpcl4PGeGPut7H8d18Fa5yNqO0gC5KJSnfEd9m4Vr/WYjZF58vN3cxBuc+oxkOiCvCJL/OoSmZzDA==
Received: from DS0PR12MB7512.namprd12.prod.outlook.com (2603:10b6:8:13a::5) by
 CY8PR12MB7492.namprd12.prod.outlook.com (2603:10b6:930:93::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Thu, 3 Sep 2026 07:11:05 +0000
Received: from DS0PR12MB7512.namprd12.prod.outlook.com
 ([fe80::2b77:2cc3:d751:6b75]) by DS0PR12MB7512.namprd12.prod.outlook.com
 ([fe80::2b77:2cc3:d751:6b75%5]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 07:11:05 +0000
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
Thread-Index: AQHdOXrYCVy0Hewxx0ybB+fZ7PfAOLa5gUEAgALyjoA=
Date: Thu, 3 Sep 2026 07:11:05 +0000
Message-ID: <babe3a6d-987a-4a27-9270-dac214b7b701@nvidia.com>
References: <20260831185835.3732707-1-waynec@nvidia.com>
 <20260831185835.3732707-3-waynec@nvidia.com>
 <20260901-solid-uber-coati-381d2d@quoll>
In-Reply-To: <20260901-solid-uber-coati-381d2d@quoll>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR12MB7512:EE_|CY8PR12MB7492:EE_
x-ms-office365-filtering-correlation-id: 444017da-7a47-49b6-b87a-08df098a8542
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|22082099003|56012099006|10067099003|5023799004|11063799006|4143699003|3023799007|18002099003|38070700021;
x-microsoft-antispam-message-info:
 sQEcrTaf7/lqCYtrVd0E/TpaocY/68DGlJAVGR4xItSpLz5w1k7mpstGw55HGSLd8DNQ4Lsjji2wScqdrhYFqUwoJStJE3MfdPKy9gaR+cJaRAj9Nc0n5xEecupk4mdFYlCBAa7/uzZUXKyo5xCLIhGFTcJiwgB+L3cLQ6dH/yuOTU7/Vvp7sJIlSh2e3+Oag3XLxDNHiQxUXFZ+cS0oXwzgnPIPay7W/S7wCZhS1oGgYQ4PiopaEpzm8bVZjCzo5vfdejR5r8+bmf4VQAc49q+k1kRGGVoXDWBPMjP3xqTgfzLDoxo2kY2uHAOx+GGECekhxvCb7CDjIibUwq5cqNDMB65g+1WtovMH0+4z+KtkcwaRDQ6h+LICdVeHcxDXWotlpfOtGkchzFTSGni5nLLjVeuOzHTur4ixqrQI8Er16CMFYidrzVsErHf3vhx5lA1e/bMChRJMnKUJqyUP42wRV20ZKQRzX8K6XVOOfA5o3BBz+0/0ntG6Hroo9ZRCvePAoC8eVWopieyZYkZH5CawmZlpQDWXTPBp+XhcdSisbs2LIU45KjOc5KWtAy/h3Hn3zJ8QK+BsyMfR9FPhxN66st0ajinXpDaEBbhmEZ41sWqJiP+nO3aUc6bjxTZB445L2Sh/ADFhSwP9Etpa76BPZv9cXzu9NTphcs94ZlTCN/DNzCUBupYe9ptY7wlDlVMSPZemGgXzjGFlwELzEn10p4A7jhsXNpzv5hZ4n+E=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7512.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(22082099003)(56012099006)(10067099003)(5023799004)(11063799006)(4143699003)(3023799007)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SUlzbkVBWEYreUFIUkZDakczeG9uNEwzcklsWHhTcnpEcHBTVGVyR3pXZHJy?=
 =?utf-8?B?OTZIOEZBVnlCSjgrUi9raFd0bmU1ZWhrMUxhQnVYQ0hOejcyVWZDVTU2REtq?=
 =?utf-8?B?RWVkazZXY0hlRllYKzBIbU5GemV5RXAvcVZPR254YXFGZlF5UVBETDNYR2tx?=
 =?utf-8?B?cnMraDRpYnBaS250ME13QUR5cVFyNmlTRjRlZlpGVE1Ndi9pcCtaMjM0Nzky?=
 =?utf-8?B?eEpBUGJkYW0yWWtQRWdaQTMzSGtxYjhnZnV3L3VkTklHOTB1bEZFaGhwZ1No?=
 =?utf-8?B?NFRNcW5GbGJGdHFQWVJocjB2SGtJdUxLcis5aktKKzVLUEdzSUdmcFlvMVBx?=
 =?utf-8?B?TXdkRmxJU2dQZzF3Tk02cnd4NUorcDEvVkNFdUF1WitPeEVoU1NFcXM0ak5a?=
 =?utf-8?B?b29hVlEzajZURHF2bGlZaWZMQytsVmRzYTkxWGZUU0xGZ0hvdU9zSVFjMTJJ?=
 =?utf-8?B?b0tRMDZYZ04yc3p6R053QTlld1kwL2M0UlZxVzhUbllCTHE5Y01YKzJXS21t?=
 =?utf-8?B?Zi9BYzdtdTc5NFFSYzgxTGVUQjg1V3RJam8vNk5jSC9yUlZuZGQ0SzlPZkFL?=
 =?utf-8?B?OVRQQ2hhck5UTDdFR0lCMWVBdCtNdmM0U0d2STl0K0VZWmV2QWMwaE9pUFYy?=
 =?utf-8?B?dWR1NEFya1ZuVzVwNUphMWltNC9YRWFIRU5CWERxNTI5QjNvYnZET0NQY0tu?=
 =?utf-8?B?UUp3Mnl2aUdFN1NIUUQ3c0NJcXhYb2M1M2xkbUJrVVEyeUxpYnNYU0R4TDBi?=
 =?utf-8?B?c2w2YjlZbDVDWFJzZlNOcTVUajdMa3FOc0lGS1VMbW1QNEY1eVJiQyt4UlF5?=
 =?utf-8?B?L1VFTmt5VThNek41RjNDT3dGVWk1QWRCUzVkdW9PVVJyZW1oOTJaUHJEZlZC?=
 =?utf-8?B?RkxtRlNmNUdNWDhsdC9vbCtKTmQ0ajhVWXIzNmZJSHFHK2ZiSkFiZkk5c2dE?=
 =?utf-8?B?Q1pJRFZ0U3ZwdGR3TjhwajQxckNuTFFRSXUxRXljSDVYVlZIYUNXWnhydXFo?=
 =?utf-8?B?L056Y0p2dmVnNjBab0ZtWEtxZERRTWUvWW9vdmplNnRIeWxRS2Q1YTljVTU3?=
 =?utf-8?B?bm9ad3h1YzhsdlVSOVMwbkMxMnUvcGs5c2R4YXpxVGZSYWNYYllQZGE0bW1K?=
 =?utf-8?B?aVlXVCtEdC92VEdod3ZzZ2t6UE1Lbys1M2xFaDM5QmlKZGtONi9lL0xDdWw2?=
 =?utf-8?B?V09uUXRHUlppdm5RcTRQQ09GK212VkJTYVh2RW9yeVUzOGpvajBNSmZyTDlJ?=
 =?utf-8?B?NlNvTnYwdW04RldxenVNd0lSRlNPR1lUVVM5K3FrS0lLdkxGQUFoMmRnVVVn?=
 =?utf-8?B?eXFGTUl4ZVYzUDNPbmJ1QkxqTk9HcU8xRERtdElFa0dXL0duZVJqZFRDYXlL?=
 =?utf-8?B?c3RnU0liUGVQS3NtbUxESDIyV1FSNjFPUlh2NTk0R3krNFhlOFU0QUhiN3Iy?=
 =?utf-8?B?OGtZNHFBUmhPMVo0Mmk5b1E0dCtoRDRpRzBoN3c2dG1seTJuclp4bzJrY2tR?=
 =?utf-8?B?cTNCUUVyeUJTdkZjM293OGpjK2VxLzNTQmlXTFplT0pTeEJEYms5T3cvN1FR?=
 =?utf-8?B?RkFaT3k5NnlwT2xxSmU3Tnh4VzF5U1E3UWZvV1pscXYrbUVGM1RITlBLY25u?=
 =?utf-8?B?K1ZWN21vb1BzQkM2N0dUM3ZpaGRhWlpHMFZ1bVdEMUpjdHJ1OVp4N05OTUxs?=
 =?utf-8?B?N0J2eVhPTEVnWEhpeVQ0d1F3WDJSTG1XNGRtZG5KdzVXYkpsVlJ4QmdmaGln?=
 =?utf-8?B?c0owTkcyU3pYMERLcjJVRnY2TkV3RDl2Z2I2aERKeE93SDViZ0xSbVJFalJC?=
 =?utf-8?B?UVAzOWlyRnhUZmV0dlFnbjEvYXJqSXd4Q3pOdHA1ZmF4N1p1NkZOeDArVW0v?=
 =?utf-8?B?YnFUQ1owVmZEbnBEK0F4QlA3YUxWSzNDQU5tUFBPb09HQml3MFNKS1ljL0I0?=
 =?utf-8?B?dDc5MjlBS0E5dk1QaGVUY29hSXlhSGI4VVE5OGx1U0I3OXpOeHFIZURvWDV0?=
 =?utf-8?B?SHNmaW03SmNlb2d6dHFIVlRsejhDTVBpdk1iNnFKeVB4eDhyZkVPTFRWeEww?=
 =?utf-8?B?TlpFMTBzT1ZtS2kzWVZ2M2ZZTCtncVZkUEl2aVU0WGN3dmpSZFloZm8wM0R6?=
 =?utf-8?B?ODEybzRBNnlERExxSFovczYxK05UbFhtbmVDQklmTXBVYnlKN0swcnFKNHRR?=
 =?utf-8?B?WmNnVVhWYVNzU1NGaVBjRldIanN3VzY4NExwejcxQzdzV3c3Rml4YjVuTXhn?=
 =?utf-8?B?ZGRwM0pWSWw2TUtsd01KbWxKT2Q1dXBpNmg4RjNtSlJaRHFYZnpGVnVqZlFC?=
 =?utf-8?B?eHArZ2R3RFdLRHBnUkYzZnhNdTJyMnJLZUpjNEppaU03SDNKOWtZQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <365B6222BABF3E4382C2523700BDE079@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 444017da-7a47-49b6-b87a-08df098a8542
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2026 07:11:05.4669
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TTO/tI815dPHUWS5B4AMI64UOwB+5pVsndnLGO3GJGrFAGdxprJiZwQ0ZnCPztannXdmf4NJOnsIxz3BLQ+BHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7492

SGkgS3J6eXN6dG9mLA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcuIEknbGwgc3BsaXQgdGhlIGNo
YW5nZXMgaW50byB0aHJlZSBwYXJ0cyBhbmQgDQphZGRyZXNzIGFsbCB0aGUgY29tbWVudHMuDQot
IHBoeTogdGVncmE6IHh1c2I6IGR0LWJpbmRpbmdzL3BoeSArIGRyaXZlcnMvcGh5L3RlZ3JhDQot
IHVzYjogaG9zdDogeGhjaS10ZWdyYSArIGl0cyBkdC1iaW5kaW5ncy91c2INCi0gYXJtNjQ6IERU
UyBlbmFibGVtZW50DQoNCnRoYW5rcywNCldheW5lLg0KDQpPbiA5LzEvMjYgMTg6MTAsIEtyenlz
enRvZiBLb3psb3dza2kgd3JvdGU6DQo+IEV4dGVybmFsIGVtYWlsOiBVc2UgY2F1dGlvbiBvcGVu
aW5nIGxpbmtzIG9yIGF0dGFjaG1lbnRzDQo+DQo+DQo+IE9uIFR1ZSwgU2VwIDAxLCAyMDI2IGF0
IDAyOjU4OjI5QU0gKzA4MDAsIFdheW5lIENoYW5nIHdyb3RlOg0KPj4gRXh0ZW5kIHRoZSBUZWdy
YTIzNCBYVVNCIGhvc3QgYmluZGluZyB0byBjb3ZlciBUZWdyYTI2NDoNCj4+DQo+PiAtIEFkZCBu
dmlkaWEsdGVncmEyNjQteHVzYiBjb21wYXRpYmxlIHN0cmluZw0KPj4gLSBEb2N1bWVudCBvcHRp
b25hbCBVU0Igd2FrZSBpbnRlcnJ1cHRzIGZvciBUZWdyYTI2NA0KPj4gLSBEb2N1bWVudCBUZWdy
YTI2NCBQTUMgd2FrZSBldmVudCB0byBwb3J0IG1hcHBpbmcNCj4+IC0gQWxsb3cgdXAgdG8gZml2
ZSBJT01NVSBzcGVjaWZpZXJzIGZvciB0aGUgYWRkaXRpb25hbCBYVVNCIGhvc3QNCj4+ICAgIHN0
cmVhbSBJRHMNCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBXYXluZSBDaGFuZyA8d2F5bmVjQG52aWRp
YS5jb20+DQo+IFdoeSBhcmUgVVNCIHBhdGNoZXMgbWl4ZWQgd2l0aCBEVFMgYW5kIHBoeSBvbmVz
PyBUaGF0J3MgbGlrZSB0aHJlZQ0KPiBzZXBhcmF0ZSBzdWJzeXN0ZW1zLCBvZiB3aGljaCBHcmVn
IGV4cGxpY2l0bHkgc2FpZCBtYW55LCBtYW55IHRpbWVzIGhlDQo+IHRha2VzIGV2ZXJ5dGhpbmcg
b3Igbm90aGluZy4gUGxlYXNlIHJlYWQgc3VibWl0dGluZyBwYXRjaGVzIGluIERULg0KPg0KPg0K
Pg0KPj4gLS0tDQo+PiBWMSAtPiBWMjogUHJvcGVydHkgZGVmaW5pdGlvbnMgYXJlIGJhY2sgYXQg
dGhlIHRvcCBsZXZlbCB3aXRoIHRoZSB3aWRlc3QNCj4+IGNvbnN0cmFpbnRzLCBUaGUgYWxsT2Yg
Y29uZGl0aW9uYWwgb25seSB0aWdodGVucyBUZWdyYTIzNCB0byBpbnRlcnJ1cHRzDQo+PiBtYXhJ
dGVtcyA5IGFuZCBpb21tdXMgbWF4SXRlbXMgMS4NCj4+DQo+PiAgIC4uLi9iaW5kaW5ncy91c2Iv
bnZpZGlhLHRlZ3JhMjM0LXh1c2IueWFtbCAgICB8IDM1ICsrKysrKysrKysrKysrKystLS0NCj4+
ICAgMSBmaWxlIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+Pg0K
Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvbnZp
ZGlhLHRlZ3JhMjM0LXh1c2IueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy91c2IvbnZpZGlhLHRlZ3JhMjM0LXh1c2IueWFtbA0KPj4gaW5kZXggZWMwOTkzNDk3ZmJiLi5k
NjNmMGRiNDIyNGMgMTAwNjQ0DQo+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvdXNiL252aWRpYSx0ZWdyYTIzNC14dXNiLnlhbWwNCj4+ICsrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvbnZpZGlhLHRlZ3JhMjM0LXh1c2IueWFtbA0KPj4g
QEAgLTE3LDcgKzE3LDkgQEAgZGVzY3JpcHRpb246IHwNCj4+DQo+PiAgIHByb3BlcnRpZXM6DQo+
PiAgICAgY29tcGF0aWJsZToNCj4+IC0gICAgY29uc3Q6IG52aWRpYSx0ZWdyYTIzNC14dXNiDQo+
PiArICAgIGVudW06DQo+PiArICAgICAgLSBudmlkaWEsdGVncmEyMzQteHVzYg0KPj4gKyAgICAg
IC0gbnZpZGlhLHRlZ3JhMjY0LXh1c2INCj4+DQo+PiAgICAgcmVnOg0KPj4gICAgICAgaXRlbXM6
DQo+PiBAQCAtNDMsNiArNDUsNyBAQCBwcm9wZXJ0aWVzOg0KPj4gICAgICAgICAtIGRlc2NyaXB0
aW9uOiBVU0Igd2FrZSBldmVudCA0DQo+PiAgICAgICAgIC0gZGVzY3JpcHRpb246IFVTQiB3YWtl
IGV2ZW50IDUNCj4+ICAgICAgICAgLSBkZXNjcmlwdGlvbjogVVNCIHdha2UgZXZlbnQgNg0KPj4g
KyAgICAgIC0gZGVzY3JpcHRpb246IFVTQiB3YWtlIGV2ZW50IDcNCj4+ICAgICAgIGRlc2NyaXB0
aW9uOiB8DQo+PiAgICAgICAgIFRoZSBmaXJzdCB0d28gaW50ZXJydXB0cyBhcmUgcmVxdWlyZWQg
Zm9yIHRoZSBVU0IgaG9zdCBjb250cm9sbGVyLiBUaGUNCj4+ICAgICAgICAgcmVtYWluaW5nIFVT
QiB3YWtlIGV2ZW50IGludGVycnVwdHMgYXJlIG9wdGlvbmFsLiBFYWNoIFVTQiB3YWtlIGV2ZW50
IGlzDQo+PiBAQCAtNTAsMTAgKzUzLDkgQEAgcHJvcGVydGllczoNCj4+ICAgICAgICAgcGxhdGZv
cm0uIFRoZSBVU0IgaG9zdCBjb250cm9sbGVyIGNhbiBmdW5jdGlvbiBldmVuIGlmIG5vIHdha2Ut
dXAgZXZlbnRzDQo+PiAgICAgICAgIGFyZSBkZWZpbmVkLiBUaGUgVVNCIHdha2UgZXZlbnQgaW50
ZXJydXB0cyBhcmUgaGFuZGxlZCBieSB0aGUgVGVncmEgUE1DOw0KPj4gICAgICAgICBoZW5jZSwg
dGhlIGludGVycnVwdCBjb250cm9sbGVyIGZvciB0aGVzZSBpcyB0aGUgUE1DIGFuZCB0aGUgaW50
ZXJydXB0DQo+PiAtICAgICAgSURzIGNvcnJlc3BvbmQgdG8gdGhlIFBNQyB3YWtlIGV2ZW50IElE
cy4gQSBjb21wbGV0ZSBsaXN0IG9mIHdha2UgZXZlbnQNCj4+IC0gICAgICBJRHMgaXMgcHJvdmlk
ZWQgYmVsb3csIGFuZCB0aGlzIGluZm9ybWF0aW9uIGlzIGFsc28gcHJlc2VudCBpbiB0aGUgVGVn
cmENCj4+IC0gICAgICBUUk0gZG9jdW1lbnQuDQo+PiArICAgICAgSURzIGNvcnJlc3BvbmQgdG8g
dGhlIFBNQyB3YWtlIGV2ZW50IElEcy4NCj4+DQo+PiArICAgICAgVGVncmEyMzQgUE1DIHdha2Ug
ZXZlbnRzOg0KPj4gICAgICAgICAgIFBNQyB3YWtlLXVwIDc2IGZvciBVU0IzIHBvcnQgMCB3YWtl
dXANCj4+ICAgICAgICAgICBQTUMgd2FrZS11cCA3NyBmb3IgVVNCMyBwb3J0IDEgd2FrZXVwDQo+
PiAgICAgICAgICAgUE1DIHdha2UtdXAgNzggZm9yIFVTQjMgcG9ydCAyIGFuZCBwb3J0IDMgd2Fr
ZXVwDQo+PiBAQCAtNjIsNiArNjQsMTYgQEAgcHJvcGVydGllczoNCj4+ICAgICAgICAgICBQTUMg
d2FrZS11cCA4MSBmb3IgVVNCMiBwb3J0IDIgd2FrZXVwDQo+PiAgICAgICAgICAgUE1DIHdha2Ut
dXAgODIgZm9yIFVTQjIgcG9ydCAzIHdha2V1cA0KPj4NCj4+ICsgICAgICBUZWdyYTI2NCBQTUMg
d2FrZSBldmVudHM6DQo+PiArICAgICAgICBQTUMgd2FrZS11cCA3OSBmb3IgVVNCMyBwb3J0IDAg
d2FrZXVwDQo+PiArICAgICAgICBQTUMgd2FrZS11cCA4MCBmb3IgVVNCMyBwb3J0IDEgd2FrZXVw
DQo+PiArICAgICAgICBQTUMgd2FrZS11cCA4MSBmb3IgVVNCMyBwb3J0IDIgd2FrZXVwDQo+PiAr
ICAgICAgICBQTUMgd2FrZS11cCA4MiBmb3IgVVNCMyBwb3J0IDMgd2FrZXVwDQo+PiArICAgICAg
ICBQTUMgd2FrZS11cCA4MyBmb3IgVVNCMiBwb3J0IDAgd2FrZXVwDQo+PiArICAgICAgICBQTUMg
d2FrZS11cCA4NCBmb3IgVVNCMiBwb3J0IDEgd2FrZXVwDQo+PiArICAgICAgICBQTUMgd2FrZS11
cCA4NSBmb3IgVVNCMiBwb3J0IDIgd2FrZXVwDQo+PiArICAgICAgICBQTUMgd2FrZS11cCA4NiBm
b3IgVVNCMiBwb3J0IDMgd2FrZXVwDQo+PiArDQo+PiAgICAgY2xvY2tzOg0KPj4gICAgICAgaXRl
bXM6DQo+PiAgICAgICAgIC0gZGVzY3JpcHRpb246IFhVU0IgaG9zdCBjbG9jaw0KPj4gQEAgLTk3
LDcgKzEwOSw4IEBAIHByb3BlcnRpZXM6DQo+PiAgICAgICAgIC0gY29uc3Q6IHdyaXRlDQo+Pg0K
Pj4gICAgIGlvbW11czoNCj4+IC0gICAgbWF4SXRlbXM6IDENCj4+ICsgICAgbWluSXRlbXM6IDEN
Cj4+ICsgICAgbWF4SXRlbXM6IDUNCj4gWW91IHNob3VsZCBsaXN0IHRoZSBpdGVtcyBpbnN0ZWFk
LiBGbGV4aWJsZSBhcnJheSBtZWFucyBub3cgdGhlIG9yZGVyDQo+IGhhdmUgYSBtZWFuaW5nLg0K
Pg0KPj4gICAgIG52aWRpYSx4dXNiLXBhZGN0bDoNCj4+ICAgICAgICRyZWY6IC9zY2hlbWFzL3R5
cGVzLnlhbWwjL2RlZmluaXRpb25zL3BoYW5kbGUNCj4+IEBAIC0xMzcsNiArMTUwLDE4IEBAIHBy
b3BlcnRpZXM6DQo+PiAgIGFsbE9mOg0KPj4gICAgIC0gJHJlZjogdXNiLXhoY2kueWFtbA0KPj4N
Cj4+ICsgIC0gaWY6DQo+PiArICAgICAgcHJvcGVydGllczoNCj4+ICsgICAgICAgIGNvbXBhdGli
bGU6DQo+PiArICAgICAgICAgIGNvbnRhaW5zOg0KPj4gKyAgICAgICAgICAgIGNvbnN0OiBudmlk
aWEsdGVncmEyMzQteHVzYg0KPj4gKyAgICB0aGVuOg0KPj4gKyAgICAgIHByb3BlcnRpZXM6DQo+
PiArICAgICAgICBpbnRlcnJ1cHRzOg0KPj4gKyAgICAgICAgICBtYXhJdGVtczogOQ0KPj4gKyAg
ICAgICAgaW9tbXVzOg0KPj4gKyAgICAgICAgICBtYXhJdGVtczogMQ0KPiBBbmQgdGhlIG5ldyBk
ZXZpY2UgaGFzIGZsZXhpYmxlIGludGVycnB0cyBhbmQgaW9tbXVzPw0KPg0KPiBCZXN0IHJlZ2Fy
ZHMsDQo+IEtyenlzenRvZg0KPg0KPg0KDQo=
