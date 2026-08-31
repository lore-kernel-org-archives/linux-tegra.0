Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013038.outbound.protection.outlook.com [40.93.201.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51192DEA95;
	Mon, 31 Aug 2026 18:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788200891; cv=fail; b=V7wQxKVgzIBCP898QiuuOlZGTY1/eu7l3rh55vHV56n4IWKVHa9Pr+FazSu30LKGAo81vakanw8jUhv4IzNpBM0ccfmMYWXUt/iDPdcZq9gL/aXxlJxNaYvGkXY2WfvXJ0wd1VdZvefchf5kVNyb7n+HMH81hoqFEblYrvPWsOw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788200891; c=relaxed/simple;
	bh=Y1mx0yYoGZcfljU05b3k/OE3qPhfoOx76dAMSoV3+po=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IEb++fyRIhao2cajX/RA/NXY6lF/jmWUJ1j46nvI/lGr/Lp9aQiS5HVHxMw7XiLOlLj+ioawH9QxVvFKvwALStFpi6ZsXQPIEw+cg7hr7aYpsH37goW7QJvM1dQoqh48sjTixQUEKL/fk6BUmxusDnA7iyA8MAbfr0u0nY02jlg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uAYHX5aF; arc=fail smtp.client-ip=40.93.201.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uAYHX5aF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IPdc67kotDaYlgTeE30BUe3Zb8zsplCmpDMdkcyqN4Vq5Dq+heNESBuBbShKJUPvqQ9/EFRdGmNXdG+fUKGTWoL3eu05fz5OZkrQJk6+RPv1uSu45XphymsYvUO3R+6fg6bd93FmvKOoPXPaRlY2Jzf9BqrjEZv1z8f6EH076go5/M+b4qtI7OKuMdZSglK4MKZIYk+9BBJWsDd9EVQPsT0UCstdSjmMYZ4IXjmMr2AjYQUTcN8xjLjpXoZVJ4Gy6sM5MjWig7Nee0un4QIx0mXIBJGpQ22BmX7Vsa4+CD05mySkuBLDO2TqBO2oCKIsNgIXVBeRUsUyrdKlaFOtnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y1mx0yYoGZcfljU05b3k/OE3qPhfoOx76dAMSoV3+po=;
 b=psbV3SNhGKot7D7/DZAb+VmyU4+oleviY/3gAlIIgeGZhNR4DZZRiLHxF2VmUllOx+U49/QXiCXtXTcWP5a62tJDGHuK0bYY/sRrwEC+mVSa2+Cq0dML6cOKE+79DwYll+3vUj4NVZdH84uTC8knspKAOcQK4QUXOGT2H+zDDJ3IiB6esFvl0R3plDifNSJKC5s7efiTKFVV141rNLhgA5p6ADn+Oc7n2R459wvbqOlYE8JwOMOozdXXqbZnfzJkkCRz22L9jHb/ts3DzCtiUXEz2CBQcw+L59BNoMmm5DjZP3ohKYquVwSpz7pHZDh2goKo3GfeKReapFeWkbQSOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y1mx0yYoGZcfljU05b3k/OE3qPhfoOx76dAMSoV3+po=;
 b=uAYHX5aFba1lZpDiosnbwp1tOJ2Vxw3oeeL4+ikrOB62IhMcjnH71k0LbjmLYpBhAWuyWSJYOwd3muf7/zp5nuH7KVbhIazty0Vwfc/wWQnqWZ9ahgVFED+tHRr1MsNCXcbQT3x695e0W8O3vKlxaLsv7m/Okvgd65TxwFRP/il0a99pY8ucghI49wPB4XZ7fUW6jsL0pZ6xGRoub8TEv1QxC23sTkZi4FLV94OClQ72Xes2rGQFfenDSv2N+eZNuuswIishPVgcePodJ8oaseLza7i7sJmlx8po+cOeTMiH/+1JgGG2cvGNjtNNQVaa2Bv+to9y6OQ/1VPsiE/eyA==
Received: from DS0PR12MB7512.namprd12.prod.outlook.com (2603:10b6:8:13a::5) by
 BY1PR12MB8445.namprd12.prod.outlook.com (2603:10b6:a03:523::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.10; Mon, 31 Aug 2026 18:28:02 +0000
Received: from DS0PR12MB7512.namprd12.prod.outlook.com
 ([fe80::2b77:2cc3:d751:6b75]) by DS0PR12MB7512.namprd12.prod.outlook.com
 ([fe80::2b77:2cc3:d751:6b75%5]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 18:28:01 +0000
From: Wayne Chang <waynec@nvidia.com>
To: Conor Dooley <conor@kernel.org>
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
Subject: Re: [PATCH 1/8] dt-bindings: phy: tegra-xusb: Add support for
 Tegra264
Thread-Topic: [PATCH 1/8] dt-bindings: phy: tegra-xusb: Add support for
 Tegra264
Thread-Index: AQHdB6qBWEacjEQ+cECDCasNXKpGMLZVpeyAgGM3p4A=
Date: Mon, 31 Aug 2026 18:28:01 +0000
Message-ID: <56187858-3096-4db9-8d1a-6fb7e72f2eb3@nvidia.com>
References: <20260629093406.1118594-1-waynec@nvidia.com>
 <20260629093406.1118594-2-waynec@nvidia.com>
 <20260629-baffling-gag-05e20c9d925b@spud>
In-Reply-To: <20260629-baffling-gag-05e20c9d925b@spud>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR12MB7512:EE_|BY1PR12MB8445:EE_
x-ms-office365-filtering-correlation-id: 004e6e16-4bfc-4f05-df70-08df078d973b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|38070700021|3023799007|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003;
x-microsoft-antispam-message-info:
 Wor9LNnOhBhNMzntJweike3uTkgLBxyPxF2k6pzRjgKxoYm4nsoU2fjNyy+QY9wPjE3E+wpJJviFYid5+HJ2B/RV71Ml1uzWueF6ShhUwB4FZ1Drf+/76lUPtgglzjBcsOZXil2We6gn0fSSTfyFheQyx9b0nCCtrkEon4UNJHIWnPPPWJMog981S1eWzE/z7rq3t4/PIZoYDgRuX7ol/p04edZHwQnLiqmJl7BBj3IJVsSBxwAv94FtO23ewKl8/qpJ6Bn0E7nE+82ZKqvbK4oAUJPE4yAL4P9H/88RL4JUV52m+5q6UF81KjJTrnYROjIJbXXnoHSZVIImrVIgiHdLLMJ85Q0RrjkYY1rI8EAXYrY7gqGr0cvhARD6tQ+HSxV+1d5t6cQep/Sy+zAjRjTfmXO9jfvl+oMTZy/q1ZgoW6sVoUD54zEXKJLPTSYpROSRNILsZUUbESD/PewMUPYps7iqTQISR+sm3bQ1tK+kMi4XAb3zsmReQOyuOr73ft4gMWwMe1yx2uJo8qsJoBfoNmZkvac1rYfG+yADEQkcYbvT94YfNzS2020IFUXcKiHrwIKX7P2dxf6WZaEqcTChdjohY6QmV1v9PPIgfQ57z/m2T/AB2g7r7P513qkAVa669aOoIQCOVXLJR0RGRUVKf0s1dOdPVLB6h7RnM3ObbbyCYZ703YxU+t3Dod7AtiVp7xmPExTt02htEOHSQrIIL+9e4qOfITVz43V12A0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7512.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(38070700021)(3023799007)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dWRyaUZ1RmhOUlJuWktmZExVUFBxSURuZG1nRUNRVG9RaWxtRDg2a1h3b1VS?=
 =?utf-8?B?VDd5SjVtVENnVHR2bVVJamtUNTJQazdrM05XQkE2ckhTNXBzcWEvOHQ0bVRL?=
 =?utf-8?B?RG0zRVJheDBjSXRNd0l4K0QzdDR0QXViK3VuVklKS3RjQ1U4eTZjWGlEL2FZ?=
 =?utf-8?B?OTlFNDRhS3BOa293WXcybFhkWkFOMGw5cDhyclMzaXNhdWg4b3JkOVlZaW45?=
 =?utf-8?B?a0JmWnBwUmpqZVUxN3VJVUxKTnJnRmxDSDBDM1Q4b3Bvb0ZoV1NzbXdKU1BE?=
 =?utf-8?B?aTl2YWVTM0lXdmo2RGdJbVZCdkJ6N2NJZUF3T2hBOGE4V1dGZXR2SnRDekdJ?=
 =?utf-8?B?a2JrM2VEQXBEYUdLRGorM1IwOXNjK1FIek45OC9oZ2ZMSGQ5YSt6blc4ODVH?=
 =?utf-8?B?cVlCdldmY3g3S0xqQXM0UjZId3JoVDlzT1FObCt3SUwwSEhmSzltV2FKdTJE?=
 =?utf-8?B?eHJtUGRuajh1eGdLMEVZNEluSzVHYW00bWhDNEV4V1BaVFh1dXhTVm1nYUZ3?=
 =?utf-8?B?b3VYRjJhNE0vd1pWR21PM2RNdW5PMmRqbEhpek5EL1QremJVVGthRWxjK2hs?=
 =?utf-8?B?dnhlY1RPdjZubTYrQi9CYTFuUXFGZ0pqcW9mNVFmYnBtblRrSExFdkI0UGk4?=
 =?utf-8?B?WnRsUk9MaDI1Z282U2NDSTcxZmhHT1FXT0w1SThPMTdjK2RUN2dhd1Qwc2xa?=
 =?utf-8?B?SnVacGhCaWdNOHZGNE4ySlZVMG1Fem1LV3NrS2JIVnpLVVA1T1ozRFE0cHdS?=
 =?utf-8?B?cWlYNFg5ZHFCUXovS1BpWTh6UEJQYmlWdE5tWDl0UXZIQ3YwRmtGczF3aUY5?=
 =?utf-8?B?QWNuTkc3ODJ4eUxhV2kyeVJOcE40N1VUd2FxQVVXY1Z5YkM0SVEwSXdEL3F2?=
 =?utf-8?B?VmxVam5pbi9mbFpzQ3ZJVEdXby9ObmJJb3pkaTRmTFNWVkVkTWNVNUZDQ1Zt?=
 =?utf-8?B?MTBFZ2I2ZU54QjBRdTdEaHB2MU8wTTQyYlhTd2hpUHhjQ01zVHliS1hWYW15?=
 =?utf-8?B?czlJL0hrWkh5WnFVTzJYY2YyMDlMVnJ5eUdoQXh5RWlLQytxbkZuNXc3dysz?=
 =?utf-8?B?SERSVTJoQjdyTkhUSUdvaE5SL3lSNUFSZnExU3lWeWswTFpVMlRqOHpSUzBW?=
 =?utf-8?B?T25ubmVwQWhCT0lRb3M1RjlFcjBPUWlLZ3RSK2hBM0s5aWEvLzlDYTBUZmNq?=
 =?utf-8?B?b2dlTldEc2lLbDRvcUVBWmRXanI1ME53bTlRK2h4NFNEWFlOY3VSSmtEeSsx?=
 =?utf-8?B?UVN6anQxU0lyUGlwZXVwY0U1UmkyOHBJQjRvSk9JNWVpdXNxdWxnV2ozOGlR?=
 =?utf-8?B?cGdUeGNrTzlvdmtRS2dvK0RyQ0dDWmZhQW80cm5FT3VGK3Fjby8xQ2E5NDVO?=
 =?utf-8?B?VytVTzZWS0pFOFVwV0ZPazhPQ0hZcTNoQjRRcDk5cEEwMGZnRGllVzBUY2Np?=
 =?utf-8?B?eVNMeGhPZWZkRXR1alVGeXRucW9KbVM1RlJDVFdoNkh6bnBsdGphT3U5cjdU?=
 =?utf-8?B?Y0NMTmh6aEk4NmZyUEF6WmpVNk5SWDJjelQ0aUpHMTJlSWJQRnJReURZTWVF?=
 =?utf-8?B?d29tbHVBUjNNdFdIRTJ4NUpiSWVJUWxBVGJOOHdHNVdCOUcxTHdLdG9IMXFN?=
 =?utf-8?B?VGpCbTJkWWZNUmdzN3pINCtoRnp1OHROZGh4YjVMZDBoZ2VqOXo1Y1pCakhu?=
 =?utf-8?B?ekVqNTIrTEFKeWdlY1NlY3BoNUhFNmV4WU90bWxSSjBkZFUwK0lKRmFDcFpt?=
 =?utf-8?B?TXE1ZnRMS2RYOVExMnlsRjJXTUFqSDNCWk5sYnFtN2psMHdMSjRwVkJTOGNq?=
 =?utf-8?B?cFNiUzk5SXJUQVd2emdHVktRTlRvd3dlMWczVlgxSXpMZkQ0eVlJc1JsZFJK?=
 =?utf-8?B?MTVzM3dOSU5ubHZWeVhFcisvdEcvTkdQOUsyNU1oVDRLVStrL1h6eUhOYlF1?=
 =?utf-8?B?U3FCaEhMSkY3a0lLWmFocm1DVlRWUXQ2SUcvWWhsMEFEZ3l6dEZMZHFmZXp0?=
 =?utf-8?B?cjROUjVMbXVZUHhxYUJHVkwvSVlMNCtrTEgvalBIWUUzR3Bxb2UreXI1bTB4?=
 =?utf-8?B?NjdiZUVpL1pNcDFJS3B0ay9yZFNhQks5Y0lhak5xRUpFMHJWMS9tdGtySWQ5?=
 =?utf-8?B?bDMyblBiRU5lb3FmWlZNNWp2bjduWWtVNTFhdUxNSDEvb3dXQldFV254ckZ2?=
 =?utf-8?B?bURUVzFBMFE4L3FmY293UG9iSVRRV2JmNFI4Y29VN3BtNVpXYXczQmlvR0NU?=
 =?utf-8?B?SmM4aSswNG1FV3l6aGRTTnlzTldHWGh2NDBRSERvWmRqQ2s5Y3pQWDgvcGNt?=
 =?utf-8?B?N0hPa0ZiR0x2QlJJV1UxWmphVjdBRVVvNzI2UjltR05ES1pqSExjQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EAD2C19A2BD5214FAA941F338050A463@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 004e6e16-4bfc-4f05-df70-08df078d973b
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2026 18:28:01.8350
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +cYXrtIQnZ70PbDDqN7b5cUbWs/gza1jd5Sn7ptUsWD/YrntMT3ic4Vj7mDbTVg2qbOlKnPQ3BPIym7Z8aWF1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR12MB8445

SGkgQ29ub3IsDQoNClRoYW5rcyBmb3IgdGhlIHJldmlldyBhbmQgc29ycnkgZm9yIHRoZSBsYXRl
IHJlcGx5Lg0KDQpBIGZhbGxiYWNrIGlzIG5vdCBzdWl0YWJsZSBoZXJlIGJlY2F1c2UgVGVncmEy
NjQgWFVTQiBwYWRjdGwgaXMgbm90DQpwcm9ncmFtbWluZy1jb21wYXRpYmxlIHdpdGggVGVncmEy
MzQgKG9yIFRlZ3JhMTk0KSwgZXZlbiB0aG91Z2ggdGhlDQpEVCBwcm9wZXJ0eSBzZXQgaXMgdGhl
IHNhbWUuDQoNClRoZSBkcml2ZXIgc2VsZWN0cyBwZXItU29DIGRhdGEgZnJvbSB0aGUgY29tcGF0
aWJsZSBzdHJpbmcuIFRlZ3JhMjY0DQpkaWZmZXJzIGZyb20gVGVncmEyMzQgaW4gYXQgbGVhc3Q6
DQoNCi0gVGVncmEyNjQgdXNlcyBoYXJkd2FyZSB0cmFja2luZyBtb2RlICh0cmtfaHdfbW9kZSks
IHdoaWxlIFRlZ3JhMjM0IA0KZGlzYWJsZXMgaXQuDQotIE9uIFRlZ3JhMjM0LCBDWUFfVFJLX0NP
REVfVVBEQVRFX09OX0lETEUgbmVlZHMgdG8gYmUgY2xlYXJlZCBzbyB0aGF0IA0KdGhlIGNhbGli
cmF0aW9uDQp2YWx1ZXMgY2FuIGJlIGNhcHR1cmVkIHdoaWxlIHRoZSBjb250cm9sbGVyIGlzIHN0
aWxsIGluIHJlc2V0LiBUaGlzIGlzIA0Kbm90IHJlcXVpcmVkIG9uDQpUZWdyYTI2NCwgd2hlcmUg
dGhlIGNvcnJlc3BvbmRpbmcgaGFuZGxpbmcgaXMgbm90IGV2ZW4gcHJlc2VudC4NCg0KQSBmYWxs
YmFjayBvZiAibnZpZGlhLHRlZ3JhMjM0LXh1c2ItcGFkY3RsIiB3b3VsZCBsZXQgYW4gT1MgdGhh
dCBvbmx5DQprbm93cyBUZWdyYTIzNCBwcm9iZSBUZWdyYTI2NCB3aXRoIHRoZSB3cm9uZyBwcm9n
cmFtbWluZyBzZXF1ZW5jZS4NCg0KVGhhdCBpcyBhbHNvIHdoeSBUZWdyYTIzNCBkaWQgbm90IGZh
bGwgYmFjayB0byBUZWdyYTE5NCBpbiB0aGlzIHNhbWUNCmJpbmRpbmc6IHRoZSBEVCBzY2hlbWEg
aXMgc2hhcmVkLCBidXQgZWFjaCBnZW5lcmF0aW9uIG5lZWRzIGl0cyBvd24NCmNvbXBhdGlibGUu
DQoNClRoYW5rcywNCldheW5lDQoNCg0KT24gNi8yOS8yNiAyMzoxOSwgQ29ub3IgRG9vbGV5IHdy
b3RlOg0KPiBPbiBNb24sIEp1biAyOSwgMjAyNiBhdCAwNTozMzo1OVBNICswODAwLCBXYXluZSBD
aGFuZyB3cm90ZToNCj4+IEFkZCB0aGUgY29tcGF0aWJsZSBzdHJpbmcgZm9yIHRoZSBUZWdyYTI2
NCBYVVNCIFBIWS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBXYXluZSBDaGFuZzx3YXluZWNAbnZp
ZGlhLmNvbT4NCj4gV2h5IGlzIGEgZmFsbGJhY2sgY29tcGF0aWJsZSBub3Qgc3VpdGFibGUgaGVy
ZT8NCj4NCj4NCj4gVGhhbmtzLA0KPiBDb25vci4NCj4NCj4+IC0tLQ0KPj4gICAuLi4vZGV2aWNl
dHJlZS9iaW5kaW5ncy9waHkvbnZpZGlhLHRlZ3JhMTk0LXh1c2ItcGFkY3RsLnlhbWwgICAgIHwg
MSArDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPj4NCj4+IGRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L252aWRpYSx0ZWdyYTE5
NC14dXNiLXBhZGN0bC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bo
eS9udmlkaWEsdGVncmExOTQteHVzYi1wYWRjdGwueWFtbA0KPj4gaW5kZXggZDhkZTkwMGE0ZmNl
Li5mNmZlM2M5MGI1YjAgMTAwNjQ0DQo+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvcGh5L252aWRpYSx0ZWdyYTE5NC14dXNiLXBhZGN0bC55YW1sDQo+PiArKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L252aWRpYSx0ZWdyYTE5NC14dXNi
LXBhZGN0bC55YW1sDQo+PiBAQCAtNDUsNiArNDUsNyBAQCBwcm9wZXJ0aWVzOg0KPj4gICAgICAg
ZW51bToNCj4+ICAgICAgICAgLSBudmlkaWEsdGVncmExOTQteHVzYi1wYWRjdGwNCj4+ICAgICAg
ICAgLSBudmlkaWEsdGVncmEyMzQteHVzYi1wYWRjdGwNCj4+ICsgICAgICAtIG52aWRpYSx0ZWdy
YTI2NC14dXNiLXBhZGN0bA0KPj4gICANCj4+ICAgICByZWc6DQo+PiAgICAgICBpdGVtczoNCj4+
IC0tIA0KPj4gMi4yNS4xDQo+Pg0KDQo=
