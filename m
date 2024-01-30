Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2058.outbound.protection.outlook.com [40.107.243.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0477E6773D
	for <linux-tegra@vger.kernel.org>; Tue, 30 Jan 2024 11:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706614818; cv=fail; b=tvZybWHKIfYoDeXG60Q9vlw+fEnlMyFtzWVCgnzuKZgN+EsaRa5qc1sVKpDt0JlEfwH03VpM4NgRWHpAhcyhDxFqMSO2gmie/PR5zvRtZla6IRbhdDgQ9LUH6JZPL+rHIyz8sigjlSK2VCb2PkMEffJv4hUjQp28G7+YwHlkbDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706614818; c=relaxed/simple;
	bh=lD6VonUboF69n7YVcfWPhuQn2uhODiIFoZn0s/GPLZs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SRI3224HRKjMQ+MCICuH1wIP/OQLZsldk3G/Xi6Nz+kQ0V5k9gvEQHSs/0a5aijAY6KK/lPYdHVp+0xOkd1SlBCYU2rrmkNic7y5uM7w4jZEZo6qWI4jeWDeubQvrjdWrs+X3GC/KuTnuXTOJf7TaqzGbwzJgMXU2WhVePBB2nE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EocajA4S; arc=fail smtp.client-ip=40.107.243.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EocajA4S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ehx9OKyr/vfp6IfVN5rCXVHZJAtyHpTDEtebrsNQOWnmXUEL2a1s3GS/yUDKTZneVm+qFCQXLZt3Xqzu1JJBW1V6xIpo1ZDdU4MgiPWn0LLuzhfBXAv8+TVIY4tqgR2XXNchUD5MxZ+td8Blme+QtYJzX19G3PKEKpVbUCZigsTXaEkQdqt4GIU2a/Qm9oMCLHom0dtTxvrtuKlt6+frKzZil9nchDCMZuLdrLzcfV/IdxRaVpYqX3/c5fvjKSHKAWQsyclfxod4h6//NpKtsAKAioxxH1xd9Sd6moWFex3S5I8nBzN5nbnkouGBfOGEIqjutNWl7wc7qtOJIRYwRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lD6VonUboF69n7YVcfWPhuQn2uhODiIFoZn0s/GPLZs=;
 b=HDCh1tpKCJtZhvlreIqUQI9apugYL4+4r/aL1XR5s94AYwESxE+LJ6LOW2LiCV6ePrOVz4Acx22TKwXASDYOyaMZW0zvttih4QPLfB7xj2hajDwbK2vZW7245wCs++YeAwfHWYfrOIgIZ8UYWspw6PwfbmCR3mZgZwJFokxifklKY2t8v+x8Sjc6Yyxqe0sE9mae7bEQjeE4PtzgtV8WtfMTx1A9BrYaA6YX8eWd5IRqp4xF7X6x+8c8peDwDgXH5Z3rreBQq7OBclEK6Mzw8aCDgQvo0tinaYCNl/JitO7wP3zLs2ceF3vu0RX2Lj6zDCsulymXXneu9ZjXIMZVnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lD6VonUboF69n7YVcfWPhuQn2uhODiIFoZn0s/GPLZs=;
 b=EocajA4SWrYb08rW28xdc4SAs3ZfzIEX26sWCNzJyplUuh/8ip6g2s8V+m1Cu1ePQJxaucnTNDIBE+GSWwqs2l+84SIUOWbl85irLvdvYV5SoPoAuUa9nHMGsMzeNXNXWj+y7km0h/eLT6bA4tF3+0U0fK1XWltIKujBJCQ3hkdI42FhjuuFj0JHf48bb1LjDyosnYwZMYrQJAMLJWCzmbIZ9fjN4lG2hK0wuBVK1xu0JsdHGt6vNxQON3etFT7MNJzuc2k2ea7rFGQtwSu7sS8M+9Tuzlhd8x8aa9Y2sg/je/AmeddgDNiBJjBEYUul3i5MVQYw+Y7A4n851ANB8g==
Received: from MN0PR12MB5716.namprd12.prod.outlook.com (2603:10b6:208:373::14)
 by CY8PR12MB8214.namprd12.prod.outlook.com (2603:10b6:930:76::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Tue, 30 Jan
 2024 11:40:14 +0000
Received: from MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::e10:209b:3076:a557]) by MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::e10:209b:3076:a557%6]) with mapi id 15.20.7228.029; Tue, 30 Jan 2024
 11:40:14 +0000
From: Kartik Rajput <kkartik@nvidia.com>
To: Jonathan Hunter <jonathanh@nvidia.com>, "thierry.reding@gmail.com"
	<thierry.reding@gmail.com>
CC: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH V2] soc/tegra: fuse: Fix crash in tegra_fuse_readl()
Thread-Topic: [PATCH V2] soc/tegra: fuse: Fix crash in tegra_fuse_readl()
Thread-Index: AQHaUrmulQLJeb1JxUCokB1yphPsZrDxUxYA
Date: Tue, 30 Jan 2024 11:40:13 +0000
Message-ID: <cbc30c9d723ac92ca91b6236299a5e945c9c5120.camel@nvidia.com>
References: <20240129134659.21266-1-jonathanh@nvidia.com>
In-Reply-To: <20240129134659.21266-1-jonathanh@nvidia.com>
Reply-To: Kartik Rajput <kkartik@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB5716:EE_|CY8PR12MB8214:EE_
x-ms-office365-filtering-correlation-id: 485b2154-bae3-4103-3989-08dc21883942
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 oYV64X+xh3x7h+yUB2tGG7ZnORS76hLhKv2AQG5uwp5MJA+UdUKuXW9bGhOR9JKNMfTgHQKeomY5BpoPi+WOvqmrk+BqywJ9z8UW0z13YVkQ7PXsqIHJ0nMjd8AARn1vGnH2bIuvqeKnBxQ6G7gCtM89nEwROPhgYfwmXHLhMf23/No1rurTot8+86DCNGyE654/JxKC/FW3QhU6UrXexZJTCzI3n8ggQ/AlT3A9GiYGPOOWvb6SBndKAQ0SyGOJpcaJUufJV1wRyGzsNoP3ncKIAGhufR2poigzyySxCEaP/GsJ4tClQXIVm+OgjoIRpN1c8BFKtXyFMqstLuM5gNY3AgmVEmrvT1j7G/cF8n9CBI3MHd9DTSc/Qsj82gKQiOqU0U/UPss72SpniLeLDImjZ+JS6fj6dudXVH+0O3CgOw9WPGrn1gzAz+nnnGjCa/6yH5PWdaQNNAqEK80PINv06W0ICS6aVTeBT3EoH+QsIghjkeHdDrKHmFBwvCmW2rcl9WJkIzaOy0De0Uq8cOLzBdKqEWxOPz8ZkZFJC+FMopzWbBv3RS/PyZECXLkSQ8nMIl4eWfnIgw+ou9f032A0rqv7jtY/eO3UcCFD5wH1Z+Kbd74LknnNghrj9FX5
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5716.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(396003)(39860400002)(136003)(376002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(4326008)(5660300002)(110136005)(122000001)(36756003)(86362001)(38100700002)(41300700001)(6486002)(478600001)(83380400001)(8936002)(64756008)(45080400002)(316002)(66446008)(6506007)(66556008)(66476007)(76116006)(3450700001)(6512007)(71200400001)(66946007)(8676002)(26005)(91956017)(2906002)(2616005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Y0VOYzUxRGwyTkIydDFIa0Y4VWJMRHBOQ0NOTW9mSy9UeWwvbzhSb3dneFRm?=
 =?utf-8?B?R0M5OTZVZy9scCtUUW9ZSm15M1RUa3hUcW9ieWFseG9iTG1nMW1iR3JVeUJ3?=
 =?utf-8?B?eS8xRi8yVGF1cTVCWUNqQUNCVVg0aTZGNEJYaWhkODNqWm9ESFNoSTdlVGVw?=
 =?utf-8?B?bXgzNFF1UWpJS3VVeWhGZlRMbmpKL3kxc0F5QW1SaGY4UHM2aGJGc21NRVh6?=
 =?utf-8?B?bzZhTXdZQktJWjNBem4xNWRmWDA4RFFiVW5pbUlwZFNIZ1ZaTEMwVCtHbzQ3?=
 =?utf-8?B?SUtCbjl3WGExVVpoMTlxNXc3S1hpY1dhSEJQbVQ1U1MwWFpVNjBUL000Vk5G?=
 =?utf-8?B?THlZcGpmQnpQbmJpOU5rbWROWEJiUHhXSE9jNDgxeVRzZXhyZ2kvaUsya2JC?=
 =?utf-8?B?azVXV1dzcXBWWmF2MEJxS0ZuNlFXY1E0Mm9iVUh1RkZvSmZQMHZ3V0VYU3BD?=
 =?utf-8?B?WkVqOWMvS2R2RENZY0gwdW50T1pTK3Vyak9PUkJZNE5ZVEh3NjI4T1VlZ2hN?=
 =?utf-8?B?RkxwK0MwWWZJc05WM3lodXNtWmJFdmwvRnNkT2hNcEF3YVJsL2QweUlUdmZk?=
 =?utf-8?B?dER1dFZuYnZPZWVFN3hQazdWT3BPTGZzSklmMTJVeTI2a3ZKbG1tWkpJTVJO?=
 =?utf-8?B?L0xPYTg5eEZMSFcyVU9VZjd3T3YzTTNoRC9tM0JuTjl1RWc0QmZUeUIwb1Bj?=
 =?utf-8?B?bUphMyswUm92Q0R2aUFQYThrWXMzRXBGcXhBMEpBQ1B0NHltb0dROHFvd3Rs?=
 =?utf-8?B?K2xma1ZnaEkwYy9PNGlFNUV5MnhrUE5nZlBXekxJT0xGWXloZmFwWTBxU3Jh?=
 =?utf-8?B?d2dhYTRBOURLSHFzTUVmdmFiVXc2NnhWdGp5YkhsZ0dSd1R5T2FRcVJ0emNJ?=
 =?utf-8?B?SUlUOHNUVG04OTBManorZDUydXBEUmk4K2ZLeStQa3NLamQ4dTlZY0Zsa0RU?=
 =?utf-8?B?cHN4a25sZ3E2N0dtU1ZKd29RcVoyL2JZc1dUNjI3SmxHNVk0azV0ZWE5d1Ex?=
 =?utf-8?B?UnVwZUt2cVNDaXljemhKUFZ1cjVmU0VLVFVUdXlVRkMvdWNFLzF6STJTSnJO?=
 =?utf-8?B?RUJhRkJFMFI0OWUzdUZjb3NrTnJsSWYyVnFaUUYzc3VZUStOZ1N1Mjh5UUh5?=
 =?utf-8?B?RnIreXRhbkVvaUp1amNmdFg0RTR6ZUNKMXZTVXFpRWFhbkZIeGN3Yk1OaFlP?=
 =?utf-8?B?bWw0MTZPRTNxUHpTNGdyWU5Hd1orRUNtajlMaFpuakcwQ3ZGbjhqUjRNYjNa?=
 =?utf-8?B?VDBRYitZU2I4SUUzTUlMUnFQbm51WldsVTNpN3Fsb3VYblhFVVlYbVNCY2JY?=
 =?utf-8?B?aHVlbkR1RzNLdXlORzRuNWFrZ2R2REg4TVZ6UTR2U1E4OUszTm5CUUNjZyth?=
 =?utf-8?B?cWd6NWlCK2EwRFNzWG1sU1hieFd2QnFDSjh3NjFveWZ0K1VVYWhaaHFxTmM4?=
 =?utf-8?B?cUYwcldsRUM5dlR5L1JIYVZQbUEvRDdsaDd5YmltdVZ2eCtNMUhocmtYSi9q?=
 =?utf-8?B?MHdPcSsrbjV0WmpsKzZBQ1NaM3dId1daL0JaTlBrektBb0hRcmtWMmY2eHB2?=
 =?utf-8?B?Wno5bXVxSWJQRUkySWptVitTcm1SYUI4bGhEcVpUcC9qYmU4T2JIM3haSVh5?=
 =?utf-8?B?d1c2RTRzczZ3ejNEbHVZUDU1ZmN5NmNDMGtZSjU5UjJiMnBNd3VaZ01CTHpt?=
 =?utf-8?B?Qy92WURPazAzbDFpem1paEZTTFlDaTI0UWNIeXhGMWptSVlGSkhnS2dxSlJ6?=
 =?utf-8?B?SWQwd0MydDZuTkQ5ZnowUXJyanEzYmhoTmczZUlZMFNhYU5veTFQYlI5OXpI?=
 =?utf-8?B?dlJTakpXMFU4bDQ1TDltN0dlckF0UDA5VUlnUWZEVGFidnliSjF4Y3JhVGpp?=
 =?utf-8?B?cjRHS1lMeW0zcklYTUFEVUYzSG0zdjJlUW9rdXhraUk5RFM1Z016NnBGdk4y?=
 =?utf-8?B?WDB2NEVqN0sxd2NzT1k0eE5oYlF3YU5iWnJHSWVZQyt0OHFBOVJBRTcvV0la?=
 =?utf-8?B?QmpmV0tkOGhBT3ZTZ3Yxc2NzOVRQRWNYN09HTTlabnVzQzEyR1E4OWloM2l4?=
 =?utf-8?B?ZXh5YW1ONjNGK0d3dXJYeGhKODVlaEoxdkVBV0FPbXo2YktPL0FXOWFCZjFu?=
 =?utf-8?Q?oqcNCWCacVAxBiIV1XRKMGAxL?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4D91BA32B041BA48A8DCEC96FF7B81DF@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5716.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 485b2154-bae3-4103-3989-08dc21883942
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2024 11:40:13.9387
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bm6wys7N/UunYQtbUgGtVQ8B4NCuvZ1HyqLpd0IrwJhW+0BVYRSF+hiGfkLhS6uq2MuXv1yelyysdkn48zgoZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8214

T24gTW9uLCAyMDI0LTAxLTI5IGF0IDEzOjQ2ICswMDAwLCBKb24gSHVudGVyIHdyb3RlOg0KPiBD
b21taXQgYzViMmQ0M2U2N2JiICgic29jL3RlZ3JhOiBmdXNlOiBBZGQgQUNQSSBzdXBwb3J0IGZv
ciBUZWdyYTE5NA0KPiBhbmQNCj4gVGVncmEyMzQiKSB1cGRhdGVkIHRoZSBUZWdyYSBmdXNlIGRy
aXZlciB0byBhZGQgQUNQSSBzdXBwb3J0IGFuZA0KPiBhZGRlZCBhDQo+IHRlc3QgdG8gdGhlIHRl
Z3JhX2Z1c2VfcmVhZGwoKSBmdW5jdGlvbiB0byBjaGVjayBpZiB0aGUgZGV2aWNlIGlzDQo+IGJv
b3Rpbmcgd2l0aCBkZXZpY2UtdHJlZS4gVGhpcyB0ZXN0IHBhc3NlcyAnZnVzZS0+ZGV2JyB2YXJp
YWJsZSB0bw0KPiBkZXZfZndub2RlKCkgYnV0IGRvZXMgbm90IGNoZWNrIGZpcnN0IGlzICdmdXNl
LT5kZXYnIGlzIHZhbGlkLiBUaGlzDQo+IGlzDQo+IGNhdXNpbmcgYSBjcmFzaCB0byBvY2N1ciBp
biBUZWdyYSBYVVNCIFBIWSBkcml2ZXIgdGhhdCBjYWxscyB0aGUNCj4gdGVncmFfZnVzZV9yZWFk
bCgpIGZ1bmN0aW9uIGJlZm9yZSAnZnVzZS0+ZGV2JyB2YXJpYWJsZSBoYXMgYmVlbg0KPiBpbml0
aWFsaXNlZCAuLi4NCj4gDQo+IMKgVW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgTlVMTCBwb2ludGVy
IGRlcmVmZXJlbmNlIGF0IHZpcnR1YWwgYWRkcmVzcw0KPiAwMDAwMDAwMDAwMDAwMjkwDQo+IMKg
TWVtIGFib3J0IGluZm86DQo+IMKgwqAgRVNSID0gMHgwMDAwMDAwMDk2MDAwMDA0DQo+IMKgwqAg
RUMgPSAweDI1OiBEQUJUIChjdXJyZW50IEVMKSwgSUwgPSAzMiBiaXRzDQo+IMKgwqAgU0VUID0g
MCwgRm5WID0gMA0KPiDCoMKgIEVBID0gMCwgUzFQVFcgPSAwDQo+IMKgwqAgRlNDID0gMHgwNDog
bGV2ZWwgMCB0cmFuc2xhdGlvbiBmYXVsdA0KPiDCoERhdGEgYWJvcnQgaW5mbzoNCj4gwqDCoCBJ
U1YgPSAwLCBJU1MgPSAweDAwMDAwMDA0LCBJU1MyID0gMHgwMDAwMDAwMA0KPiDCoMKgIENNID0g
MCwgV25SID0gMCwgVG5EID0gMCwgVGFnQWNjZXNzID0gMA0KPiDCoMKgIEdDUyA9IDAsIE92ZXJs
YXkgPSAwLCBEaXJ0eUJpdCA9IDAsIFhzID0gMA0KPiDCoFswMDAwMDAwMDAwMDAwMjkwXSB1c2Vy
IGFkZHJlc3MgYnV0IGFjdGl2ZV9tbSBpcyBzd2FwcGVyDQo+IMKgSW50ZXJuYWwgZXJyb3I6IE9v
cHM6IDAwMDAwMDAwOTYwMDAwMDQgWyMxXSBQUkVFTVBUIFNNUA0KPiDCoE1vZHVsZXMgbGlua2Vk
IGluOg0KPiDCoENQVTogNyBQSUQ6IDcwIENvbW06IGt3b3JrZXIvdTE2OjQgTm90IHRhaW50ZWQg
Ni44LjAtcmMxLW5leHQtDQo+IDIwMjQwMTI5LTAyODI1LWc1OTY3NjQxODNiZTggIzENCj4gwqBI
YXJkd2FyZSBuYW1lOiBOVklESUEgSmV0c29uIEFHWCBYYXZpZXIgRGV2ZWxvcGVyIEtpdCAoRFQp
DQo+IMKgV29ya3F1ZXVlOiBldmVudHNfdW5ib3VuZCBkZWZlcnJlZF9wcm9iZV93b3JrX2Z1bmMN
Cj4gwqBwc3RhdGU6IDYwNDAwMDA5IChuWkN2IGRhaWYgK1BBTiAtVUFPIC1UQ08gLURJVCAtU1NC
UyBCVFlQRT0tLSkNCj4gwqBwYyA6IF9fZGV2X2Z3bm9kZSsweDAvMHgxOA0KPiDCoGxyIDogdGVn
cmFfZnVzZV9yZWFkbCsweDI0LzB4OTgNCj4gwqBzcCA6IGZmZmY4MDAwODM5M2JhMTANCj4gwqB4
Mjk6IGZmZmY4MDAwODM5M2JhMTAgeDI4OiAwMDAwMDAwMDAwMDAwMDAwIHgyNzogZmZmZjgwMDA4
MTIzM2MxMA0KPiDCoHgyNjogMDAwMDAwMDAwMDAwMDFjOCB4MjU6IGZmZmYwMDAwODBiN2JjMTAg
eDI0OiBmZmZmMDAwMDgyZGYzYjAwDQo+IMKgeDIzOiBmZmZmZmZmZmZmZmZmZmY0IHgyMjogMDAw
MDAwMDAwMDAwMDAwNCB4MjE6IGZmZmY4MDAwODM5M2JhODQNCj4gwqB4MjA6IDAwMDAwMDAwMDAw
MDAwZjAgeDE5OiBmZmZmODAwMDgyZjFlMDAwIHgxODogZmZmZjgwMDA4MWQ3MjAwMA0KPiDCoHgx
NzogMDAwMDAwMDAwMDAwMDAwMSB4MTY6IDAwMDAwMDAwMDAwMDAwMDEgeDE1OiBmZmZmODAwMDgy
ZmNkZmZmDQo+IMKgeDE0OiAwMDAwMDAwMDAwMDAwMDAwIHgxMzogMDAwMDAwMDAwMzU0MTAwMCB4
MTI6IDAwMDAwMDAwMDAwMDAwMjANCj4gwqB4MTE6IDAxNDAwMDAwMDAwMDAwMDAgeDEwOiBmZmZm
ODAwMDgwMDAwMDAwIHg5IDogMDAwMDAwMDAwMDAwMDAwMA0KPiDCoHg4IDogZmZmZjAwMDA4MmRm
M2I0MCB4NyA6IDAwMDAwMDAwMDAwMDAwMDAgeDYgOiAwMDAwMDAwMDAwMDAwMDNmDQo+IMKgeDUg
OiAwMDAwMDAwMGZmZmZmZmZmIHg0IDogMDAwMDAwMDAwMDAwMGRjMCB4MyA6IDAwMDAwMDAwMDAw
MDAwYzANCj4gwqB4MiA6IDAwMDAwMDAwMDAwMDAwMDEgeDEgOiBmZmZmODAwMDgzOTNiYTg0IHgw
IDogMDAwMDAwMDAwMDAwMDAwMA0KPiDCoENhbGwgdHJhY2U6DQo+IMKgIF9fZGV2X2Z3bm9kZSsw
eDAvMHgxOA0KPiDCoCB0ZWdyYTE4Nl94dXNiX3BhZGN0bF9wcm9iZSsweGIwLzB4MWE4DQo+IMKg
IHRlZ3JhX3h1c2JfcGFkY3RsX3Byb2JlKzB4N2MvMHhlYmMNCj4gwqAgcGxhdGZvcm1fcHJvYmUr
MHg5MC8weGQ4DQo+IMKgIHJlYWxseV9wcm9iZSsweDEzYy8weDI5Yw0KPiDCoCBfX2RyaXZlcl9w
cm9iZV9kZXZpY2UrMHg3Yy8weDEyNA0KPiDCoCBkcml2ZXJfcHJvYmVfZGV2aWNlKzB4MzgvMHgx
MWMNCj4gwqAgX19kZXZpY2VfYXR0YWNoX2RyaXZlcisweDkwLzB4ZGMNCj4gwqAgYnVzX2Zvcl9l
YWNoX2RydisweDc4LzB4ZGMNCj4gwqAgX19kZXZpY2VfYXR0YWNoKzB4ZmMvMHgxODgNCj4gwqAg
ZGV2aWNlX2luaXRpYWxfcHJvYmUrMHgxMC8weDE4DQo+IMKgIGJ1c19wcm9iZV9kZXZpY2UrMHhh
NC8weGE4DQo+IMKgIGRlZmVycmVkX3Byb2JlX3dvcmtfZnVuYysweDgwLzB4YjQNCj4gwqAgcHJv
Y2Vzc19zY2hlZHVsZWRfd29ya3MrMHgxNzgvMHgzZTANCj4gwqAgd29ya2VyX3RocmVhZCsweDE2
NC8weDJlOA0KPiDCoCBrdGhyZWFkKzB4ZmMvMHgxMWMNCj4gwqAgcmV0X2Zyb21fZm9yaysweDEw
LzB4MjANCj4gwqBDb2RlOiBhOGMyN2JmZCBkNjVmMDNjMCAxMjgwMDJhMCBkNjVmMDNjMCAoZjk0
MTQ4MDEpDQo+IMKgLS0tWyBlbmQgdHJhY2UgMDAwMDAwMDAwMDAwMDAwMCBdLS0tDQo+IA0KPiBG
aXggdGhpcyBieSB2ZXJpZnlpbmcgdGhhdCAnZnVzZS0+ZGV2JyBpcyB2YWxpZCBiZWZvcmUgcGFz
c2luZyB0bw0KPiBkZXZfZndub2RlKCkuDQo+IA0KPiBGaXhlczogYzViMmQ0M2U2N2JiICgic29j
L3RlZ3JhOiBmdXNlOiBBZGQgQUNQSSBzdXBwb3J0IGZvciBUZWdyYTE5NA0KPiBhbmQgVGVncmEy
MzQiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBKb24gSHVudGVyIDxqb25hdGhhbmhAbnZpZGlhLmNvbT4N
Cj4gLS0tDQo+IENoYW5nZXMgc2luY2UgVjE6DQo+IC0gUmV2ZXJ0ZWQgY2hhbmdlIHRvIG1vdmUg
dGVzdGluZyBvZiAnZnVzZS0+Y2xrJy4NCj4gDQo+IMKgZHJpdmVycy9zb2MvdGVncmEvZnVzZS9m
dXNlLXRlZ3JhLmMgfCAzICsrKw0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykN
Cj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NvYy90ZWdyYS9mdXNlL2Z1c2UtdGVncmEuYw0K
PiBiL2RyaXZlcnMvc29jL3RlZ3JhL2Z1c2UvZnVzZS10ZWdyYS5jDQo+IGluZGV4IGMzNGVmYTVi
ZjQ0Yy4uYjZiZmQ2NzI5ZGYzIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3NvYy90ZWdyYS9mdXNl
L2Z1c2UtdGVncmEuYw0KPiArKysgYi9kcml2ZXJzL3NvYy90ZWdyYS9mdXNlL2Z1c2UtdGVncmEu
Yw0KPiBAQCAtMzQ1LDYgKzM0NSw5IEBAIHUzMiBfX2luaXQgdGVncmFfZnVzZV9yZWFkX2Vhcmx5
KHVuc2lnbmVkIGludA0KPiBvZmZzZXQpDQo+IMKgDQo+IMKgaW50IHRlZ3JhX2Z1c2VfcmVhZGwo
dW5zaWduZWQgbG9uZyBvZmZzZXQsIHUzMiAqdmFsdWUpDQo+IMKgew0KPiArwqDCoMKgwqDCoMKg
wqBpZiAoIWZ1c2UtPmRldikNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVy
biAtRVBST0JFX0RFRkVSOw0KPiArDQo+IMKgwqDCoMKgwqDCoMKgwqAvKg0KPiDCoMKgwqDCoMKg
wqDCoMKgICogV2FpdCBmb3IgZnVzZS0+Y2xrIHRvIGJlIGluaXRpYWxpemVkIGlmIGRldmljZS10
cmVlIGJvb3QNCj4gaXMgdXNlZC4NCj4gwqDCoMKgwqDCoMKgwqDCoCAqLw0KDQpSZXZpZXdlZC1i
eTogS2FydGlrIDxra2FydGlrQG52aWRpYS5jb20+DQoNClRoYW5rcywNCkthcnRpaw0KDQo=
