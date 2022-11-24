Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EA7FC43217
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Nov 2022 12:30:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229504AbiKXMaQ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 24 Nov 2022 07:30:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbiKXMaP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Nov 2022 07:30:15 -0500
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2060.outbound.protection.outlook.com [40.107.237.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 266EE3BF;
        Thu, 24 Nov 2022 04:30:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m7XnokNdYjcIM/3bj2ucfkFgxQG0p496ma5x5ewiqwGaAfWo8pyfQ8qtujOZcfPDFQx9HSzb4vVx0bTZf2mWfhS6XTKdfQCW5ybv2ZEZP1LUWey3isttY6tBh9OhcJCzHUiVWz1xqdHAtWH/V30r7Tr2493rh6U9qVhiLR0WxF+vSB9ftnPXdJcUefcCAZCQ/xynIbGgN6IIBa4RqmKO6yFDTMB8nEUa9996I9/K5jDsu9tmj/S0bjjdBEOE2MVW+1E5ZXhpLcJsxIW/NuHeu0L9nBUtpvRXpK+k1C7wKygCIYvMasDRZDIfnPFG++HNWPRmwCvVz149XBb0r+3iGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I1cmU79PhhnbKZRAJZCXGR/2SsPNlFogNPON2EBnG+M=;
 b=YclACNaaekK8igUZO7ZlHEVq8J6n4IO3z02XxYq45d4YdDbKLJB+W++ndMuNad/U5ugLvI+psdgQbY6MjXfgnCx94qu+0qO6KXFULOXEuq27KZ5QZp1B/h/wIwtC6wIEMMIOJfJJzDnBG2IS4R4pBYoW4zmEkhIfC3r8qggsWjJyh9cHslHFGUZXOI0GWmO+UrmyRd+iMi5rx089h7rg+W9zBaUrzgE9gBXDmp30S0z7v+1dM/5dmVo8Mp/i82viQVgE1UdIN+v0zv09ESop8VCryI7gxKgo535p8XfgwPkagIqvoA6x2OcSIuCmiq6Wj2Ht815p5kKu86+vF6xN5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I1cmU79PhhnbKZRAJZCXGR/2SsPNlFogNPON2EBnG+M=;
 b=qeKHhsm4GcwiNY0B+o3K4rl3gVWjfmWKuwCC34UOxCdm4dwHciF0JYnkg/mF/BaJjlxgrjFGJEAfqTNDVKL32/Gn6Abgv/7MtUlMLQlLJZqv4UHukY4xKhgLWkTuv1efb2HXFjHhmoQBcjBlzWO3aAnDUdeZWeYJyeb5/v4B+K/BnyVRWt4y5fS6legM8vT45HPsgZLgKIfohBMZ4Xwe1q4CFIZBmpxuJTBuowMIZsyDFI2+e2JnrdKDBb4I72ZsORL4Qndgtsa4qGGdkMg5mF95/f9NOmJN8BmKE9/48s+xp/EBw21hxIjyijJv3B4QK06rzcawvIwmtDQgHEtWDA==
Received: from PH0PR12MB5500.namprd12.prod.outlook.com (2603:10b6:510:ef::8)
 by CY8PR12MB7145.namprd12.prod.outlook.com (2603:10b6:930:5f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Thu, 24 Nov
 2022 12:30:13 +0000
Received: from PH0PR12MB5500.namprd12.prod.outlook.com
 ([fe80::f60d:e4a:f1ff:3cb1]) by PH0PR12MB5500.namprd12.prod.outlook.com
 ([fe80::f60d:e4a:f1ff:3cb1%6]) with mapi id 15.20.5857.019; Thu, 24 Nov 2022
 12:30:13 +0000
From:   Wayne Chang <waynec@nvidia.com>
To:     Jonathan Hunter <jonathanh@nvidia.com>,
        Greg KH <gregkh@linuxfoundation.org>
CC:     Mathias Nyman <mathias.nyman@intel.com>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        Thierry Reding <treding@nvidia.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        Sing-Han Chen <singhanc@nvidia.com>
Subject: Re: [PATCH V4 5/6] usb: host: xhci-tegra: Add Tegra234 XHCI support
Thread-Topic: [PATCH V4 5/6] usb: host: xhci-tegra: Add Tegra234 XHCI support
Thread-Index: AQHY+2QmPKphr7mgB0WJTAwK1bnwLq5LIlmAgAF0OgCAAXOjAA==
Date:   Thu, 24 Nov 2022 12:30:12 +0000
Message-ID: <7ea7739f-bade-985d-78eb-8129982eb138@nvidia.com>
References: <20221118154006.173082-1-jonathanh@nvidia.com>
 <20221118154006.173082-6-jonathanh@nvidia.com> <Y3zz1YHu1643ppuS@kroah.com>
 <4e621d81-929d-3fe5-ee8d-00751f157e5c@nvidia.com>
In-Reply-To: <4e621d81-929d-3fe5-ee8d-00751f157e5c@nvidia.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5500:EE_|CY8PR12MB7145:EE_
x-ms-office365-filtering-correlation-id: 3e9a325d-b13c-4e1f-5350-08dace17a25d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e4WpgnJha6Ga08LzIT6QX/Uo6RaAkr1NeZoEJXBOAiYnCR5Zm8GESglDkQYqXfwwm0qCbvMmlACS1ZAyInYgHMxdBHSdbxbmeOeDMzRnLZOo3/LkU63FH1FYTwOckHaQ0V+yMWa3pjLsv4KtjYqSAmYgItV2OeVqcsQYpCMvRcGUf7ZHJ2fKTcptsGmUVkIFYEDrAJxpY4Psn1OqUz7SARaTIOoUTy+ib1I8LpjoLYnj/e1srlj64Zrcolp4COBNR0aECel85F6WvVswKwIZeGnrnUGRIK9L1shTeVc2aoqpPzHda/arg77VwjIERlk4Vwvu+7p/eMlWQS97OU370wehNGUQrdrL8vsnoM9M2CA5DyLsBkhNPoF0OWbcC3/h2PUBso/Qs5XBdDdh2D7CCRSYw+YvHHc0abnp5jZWbLMblpKiU1xrNwWhXT0qbz2CV7PwF9Za3yU5zhwDaVpJXAya8JQlwFZ49epvV6N0G9BVUkqjVvXNTBT0yB11411oh+kC8v5EEBg8o2OMsHaRiJWvadk8PJ6rFe2zsGpdA5i57OT8kzbLmDEcSBZdR6FCrpgW9lDkGwa++wi9MjqFIBwiGoUrj0DZZ9a3smTuH5Pz/uNf/2qbFV2Nl4CpA8PJoXsVpLvUkfybt4UxZC7iciOS8j/zUslV9fO3cH2b2+KTEs7SFYueXmlZl1jemap0+yvMRZOdz1cVHaMtGuuS5Egbfd5a/jf/fpEgrhsvQrEi94NrsAAmBxHL2gE7VOqBugjIYvOkiqOETCaSMHgrRQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5500.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(346002)(396003)(39860400002)(366004)(451199015)(2906002)(31686004)(36756003)(83380400001)(91956017)(5660300002)(66476007)(41300700001)(76116006)(66946007)(66446008)(4326008)(86362001)(66556008)(8676002)(8936002)(6486002)(316002)(110136005)(53546011)(31696002)(38070700005)(54906003)(6512007)(26005)(6506007)(478600001)(71200400001)(64756008)(107886003)(122000001)(2616005)(38100700002)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?enRYQTYzeTMveHMrK2VtMjBHSmhoNUljd3g5MEREYlRTWmFOOUMxaFQvVTlm?=
 =?utf-8?B?MDlwVzJEMGh2b3Z2SzRtRm9ldjFUSUFIb0NmYlBaVm1WaERkelhHT3NKMG1Q?=
 =?utf-8?B?clZvRVRVYkhCQ2hnd0xZcUhHUnphclBEN2l0SkgydmFid1FGQkUxQ2hIRzdN?=
 =?utf-8?B?R21oL2IvZkl0eHVaQWNZZlgxUGdwaHdFR2tUSUh1UjNVTENkdy8xT3VmWXNW?=
 =?utf-8?B?cjV5c2VoU05MVUEyaS9WYlZHU3B4YnFvQWc3VENCekdSUTZRSmhUN2ZDZlRG?=
 =?utf-8?B?Z3lsVTZsaDdYMlRmYVduQ01YK2ROQlpxYnVKcHJkQjNmaGNVZ1V3Mk5zWGkz?=
 =?utf-8?B?NnpIYUVkODdBWjdjRExsMDEwQTNLeHJsdkV0cEhNUUFoRm5vcTdscndUNVAw?=
 =?utf-8?B?WUkzTHNsZVlkdDFKRnEwc0ZxTmNqUm5VcWpldk45bXQyRHlhK1F6NFpnNW1z?=
 =?utf-8?B?MUdaM0dFdnpwSStTR0dOaEhoM3hmcjlhNWtYQWRvR2tpeTZRZWJEZXN6VFRS?=
 =?utf-8?B?cHBZZ0lhYkRZRkpBQVZLb3JHTUdNbWdpYlVlMWVXbmc1ZXBXUS80dmlMQ3lB?=
 =?utf-8?B?amxLN0p1NVJiMEFCRldJV3Fta01pNStDWkJDWkNJVjVaaXUzWUVETkRoUExM?=
 =?utf-8?B?RUhLQnZZUFhFSVE2RU9neSsyMXZYVDBUSlphNTN2aGlSZnUvZVFOM3l6ZzBm?=
 =?utf-8?B?RVZlVGtSc1VmK1ZOVHJjems2VzBLZEdJTXM4TlBWSVFrUWs4ckZ3a0xJUXVS?=
 =?utf-8?B?ZzRYdmxQMHpzaEtvWVlwd0NYcHRoZitWaFRMd3QxNVU5MXl4NnpxMGlYMG1I?=
 =?utf-8?B?SE00bjZWYndXenV3aVpEdW1ORE91YnVldndzVStPdy8yekt0S0NtUFlJeGNk?=
 =?utf-8?B?Vkd3MEt2QXIyYlNMMWMrYWtsK1BJSHpVSWFydU0rTlFQR1VKbng0MVErcVhy?=
 =?utf-8?B?YzBjaWIvcDRzZ0pxSi9BYVUrcVR2eEVhZnV1TkNoMER1UVRhZ2xMQ3BiVnM2?=
 =?utf-8?B?OFVIMUI2a3I5MXl2enlvYklObTFyYTRPQzI3SWlOUFMwbHgwa1BkOWFiSEJ4?=
 =?utf-8?B?Z3MzYnFaaUgzMzdNMWZOaVU3SUtmWXhIT2xNVFBpdzdkVTBGY1NlOG5KNnhZ?=
 =?utf-8?B?WllSUlVYRkRtSXlKV2VMQTlSSVZ1RUV0bU4vaG4raExPUkt5WE9qOUs3aVg3?=
 =?utf-8?B?NWNZMjdtaHFodHV5ajFCeG1vQ2ExYnhIWWlVdzZnYXh2eS9CeVpvUDVaTkVo?=
 =?utf-8?B?cnRIY200WGdDQzlNWDZyQ3RmckhtaWRPb3kzaEhkRGJsUlN3S2RSL2s2eEg1?=
 =?utf-8?B?K3VabWRUaFpXU0ROalJvREl3RllrbDNieHNZRll5WFVHZ01YMk9vZ2JsQ0Uy?=
 =?utf-8?B?Tk5SblhJWTFqN0VPWWNkazJrTHNEY1crdGJVenlkLzErQTZQOEc2MnJ0TkRj?=
 =?utf-8?B?N0RHQlMxbkt3b1ErSmMyazArMmlYNHJ2SmlvTnp3dGJhRWJGMzBGcm9BNEts?=
 =?utf-8?B?bkpUb0x6WGNvZjJPN20vdEg1VTJBQXpmM1FFb0gxcUNVczkvWkx6T3NpdFZP?=
 =?utf-8?B?aDl0NzBIWjNsSTdtZE5QSURWOHVWRVRrdXZNZE1EbG1iUDRTWWRpb1lhQ3BI?=
 =?utf-8?B?MkFCbUFmakpCUVByaWtuV2lMWnRFSmRNREd0M1hiUDRCSmN4WFNXeHliSmdX?=
 =?utf-8?B?Q0JPejBtc0dsZTY2b0ZoUVlZckhHOXZBRXNJY29RZGlBYjRwdVpWRnFwSXdH?=
 =?utf-8?B?RVV4M1dIOEJnOVA1WnJDZzJkbXRYV3B0U25VWTVMREsvTzVKeDZqYmw5bW9t?=
 =?utf-8?B?a2FpU2MrMFVNZDd6TENHMk1Fdlo0Y3dXUFQ4MmZPdVJ0N2duem9selJmc3Fv?=
 =?utf-8?B?bWJFNmNEQkRGUUh0Y3VYRHJMQk8wbmMrYVlDOGtyNUNIeXRnazlIR1hxQ2dQ?=
 =?utf-8?B?YUxiUjRUeXpKOUowZlllY2hneVY1V1dER3Z4MGlmSGVRSE4zcGNRTnFGUUls?=
 =?utf-8?B?ZXJvS09rTWJBT280WklUWDZCVzcvTE1BT3RZZHFoMmZGQWkyMkRKaDZDcU5q?=
 =?utf-8?B?SHpHejJHS0p4M0kvNEZWQnFOMWhvVnRWa2Rmek82OFpKL0VvNzBwck12NTc4?=
 =?utf-8?Q?TFrNNZOc3jx4Viq0QMSz7ia4U?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <86BA3DD992EFD349B17CD1BA2ADB9F0B@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5500.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e9a325d-b13c-4e1f-5350-08dace17a25d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2022 12:30:12.9785
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A4BONsc7N09PdSNimfPXRdHuvmGOonHFRX9muEiHTvOGatF5E30rYyFH+ncimIrMticfoQpgzuOlxB+UsKT00w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7145
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

DQoNCk9uIDExLzIzLzIyIDIyOjIwLCBKb24gSHVudGVyIHdyb3RlOg0KPiANCj4gT24gMjIvMTEv
MjAyMiAxNjowNywgR3JlZyBLSCB3cm90ZToNCj4+IE9uIEZyaSwgTm92IDE4LCAyMDIyIGF0IDAz
OjQwOjA1UE0gKzAwMDAsIEpvbiBIdW50ZXIgd3JvdGU6DQo+Pj4gRnJvbTogU2luZy1IYW4gQ2hl
biA8c2luZ2hhbmNAbnZpZGlhLmNvbT4NCj4+Pg0KPj4+IFRoaXMgY2hhbmdlIGFkZHMgVGVncmEy
MzQgWFVTQiBob3N0IG1vZGUgY29udHJvbGxlciBzdXBwb3J0Lg0KPj4+DQo+Pj4gSW4gVGVncmEy
MzQsIHNvbWUgb2YgdGhlIHJlZ2lzdGVycyBoYXZlIG1vdmVkIHRvIGJhcjIgc3BhY2UuDQo+Pj4g
VGhlIG5ldyBzb2MgdmFyaWFibGUgaGFzX2JhcjIgaW5kaWNhdGVzIHRoZSBjaGlwIHdpdGggYmFy
Mg0KPj4+IGFyZWEuIFRoaXMgcGF0Y2ggYWRkcyBuZXcgcmVnIGhlbHBlciB0byBsZXQgdGhlIGRy
aXZlciByZXVzZQ0KPj4+IHRoZSBzYW1lIGNvZGUgZm9yIHRob3NlIGNoaXBzIHdpdGggYmFyMiBz
dXBwb3J0Lg0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogU2luZy1IYW4gQ2hlbiA8c2luZ2hhbmNA
bnZpZGlhLmNvbT4NCj4+PiBDby1kZXZlbG9wZWQtYnk6IFdheW5lIENoYW5nIDx3YXluZWNAbnZp
ZGlhLmNvbT4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBXYXluZSBDaGFuZyA8d2F5bmVjQG52aWRpYS5j
b20+DQo+Pj4gU2lnbmVkLW9mZi1ieTogSm9uIEh1bnRlciA8am9uYXRoYW5oQG52aWRpYS5jb20+
DQo+Pg0KPj4gVGhpcyBpcyBzaG91bGQgYmUgbXVjaCBzbG93ZXIgd2l0aCB0aGUgYWRkaXRpb25h
bCByZWRpcmVjdGlvbi7CoCBJcyBpdA0KPj4gbm90aWNhYmxlIG9uIHRoaXMgaGFyZHdhcmUgcGxh
dGZvcm0gd2l0aCwgYW5kIHdpdGhvdXQgdGhpcyBjaGFuZ2U/wqAgT3INCj4+IGlzIHRoZSBoYXJk
d2FyZSBzbG93IGVub3VnaCB0aGF0IGl0IGRvZXNuJ3QgZXZlbiBzaG93IHVwIGFzIGEgc3BlZWQN
Cj4+IGRlY3JlYXNlPw0KPiBXYXluZSwgZG8gd2UgaGF2ZSBhbnkgaW5wdXRzIG9uIHRoaXM/DQo+
IA0KPiBJIGtub3cgdGhhdCB3ZSBoYXZlIGJlZW4gdXNpbmcgdGhpcyBpbXBsZW1lbnRhdGlvbiBu
b3cgZm9yIHNvbWUgdGltZSBvbiANCj4gdGhlIGtlcm5lbHMgd2Ugc2hpcCBhbmQgdGhhdCB3b3Vs
ZCBiZSB0ZXN0ZWQgb24gVGVncmEyMTAsIFRlZ2FyMTg2LCANCj4gVGVncmExOTQgYW5kIFRlZ3Jh
MjM0LiBTbyBJIGFzc3VtZSB0aGF0IHRoZSBwZXJmb3JtYW5jZSB0aGVyZSBpcyBnb29kLCANCj4g
YnV0IG5vdCBzdXJlIGFib3V0IFRlZ3JhMTI0Lg0KPiANCg0KSGkgSm9uYXRoYW4gYW5kIEdyZWcs
DQoNClRoYW5rcyBmb3IgdGhlIHJldmlldy4NClRoZSBpbXBsZW1lbnRhdGlvbiBpcyBvdXQgb2Yg
dGhlIGRpZmZlcmVuY2UgaW4gaGFyZHdhcmUgaW1wbGVtZW50YXRpb24NCmJldHdlZW4gb2xkIGNo
aXBzIGFuZCB0ZWdyYTIzNC4NCg0KTW9zdCBvZiB0aGUgcmVhZC93cml0ZSBvcHMgYXJlIG9uZS10
aW1lIGNhbGxzIGR1cmluZyBpbml0aWFsaXphdGlvbi4NCkV2ZW4gdGhlIG1ib3ggbXNnIGFyZSBz
ZWxkb20gdXNlZCBhbmQgdGh1cyB0aGUgcmVkaXJlY3Rpb24gc2hvdWxkIG5vdA0KY2F1c2UgYW55
IG5vdGljZWFibGUgcGVyZm9ybWFuY2UgZHJvcC4NCg0KDQp0aGFua3MsDQpXYXluZS4NCg0KPiBK
b24NCj4g
