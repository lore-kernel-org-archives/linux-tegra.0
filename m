Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56CD6C432BE
	for <linux-tegra@archiver.kernel.org>; Thu, 12 Aug 2021 11:54:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 49C3C60FC4
	for <linux-tegra@archiver.kernel.org>; Thu, 12 Aug 2021 11:54:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236409AbhHLLyx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 12 Aug 2021 07:54:53 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:60548 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S235145AbhHLLyw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 12 Aug 2021 07:54:52 -0400
X-UUID: 527c6c3bb6c5479bab5d62d04a82474f-20210812
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=a+gtmF6VAC0QQ/CZxptP+CU4mhlqEANKVwnZgLMy4qg=;
        b=eyeXVVWRoAaQ+RPBlFY0v6Tmr9u1Fs96HuXbDcdyaWHL06gb15yXHHCAJzOaxZC12f/98TUusyWBaA+5Dq+MPdVWgC98SgbYQnUPzIMezic9m8efV3snNSEftgDTm0uygFs5gnpyOBXfyS2zutnNkmyw2HR2rOVsjmpSUmREGDk=;
X-UUID: 527c6c3bb6c5479bab5d62d04a82474f-20210812
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 6766439; Thu, 12 Aug 2021 19:54:23 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 Aug 2021 19:54:21 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 12 Aug 2021 19:54:22 +0800
Received: from APC01-PU1-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Thu, 12 Aug 2021 19:54:21 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VdeLR6EeBQoUMzwrhox4FAm5S+WIH49pBpAI0El6uDuZc43GcEEbsDJRP5SrGv9DDHC3lmOiLgmZgNVR0QOJAcX8Lb3YG0Qv0FSYziWmu07u2KNyAJkTQ9irHBJiSiVN6tyLfcSJdnl1pN8ldGfKwBS5HgGMwhyfi1BCapIq17IUbvAJ12ZZYWoaOfpNz8upfICaQ0AifQ6rvNi/oPVdNG+5pMIJXDgZTbHM86HY5izKQJYI9gh7b1frSkeZw2TruecKQ5NsuNgQ5tRhA3QshjXZxfLuQJ08Rg3jfPDe/Yd2rq92tvBQBt15x1oEOGflRIL6n+VBQgqLnSsgD3kGHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a+gtmF6VAC0QQ/CZxptP+CU4mhlqEANKVwnZgLMy4qg=;
 b=QX7W3tvqNtmu28LgqV1X0r9V2XlcS0pg6Hc+pZCxbOoJ7BWDUOw+/JCkoh2x0AgdRn91Aexn8Y5VmUgd2Whv9b4ilvys/ZCqFKEDPkaaWCvAlI1zortMQPH23A2fbVSnT4lAUn4uLZX6NsJzDtNEuh+grxwiCLeERIY5Q13A0FfRlLYcYhGIi4goa/7yNh1YxAzCUO6o0Z9uZt44adVscWbKRa9odnNLRwy5uG+lp93kMH1hvIQmdEZ3CZGYwvg8ghhRyJpsnhf/ta65xO5N4WwgA+LWZEHrVXyj1ONV3pPNuaQQh8dzJxiwu1eW53eVH00pQdiCn9efamaPdyWRfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a+gtmF6VAC0QQ/CZxptP+CU4mhlqEANKVwnZgLMy4qg=;
 b=hp4oWRECO1CT/N24CgB7BjA2VMwbTbHNongpprQXlpELr9ZERALZo2SoR+M0zL7XmB0n1j0EcSniCiGU91qgjkpVsukEaVBF7NK+P309g+kmEyGXJvEoTllOncMKFwT8zIM0gV8hhstkepdAvIKFKleiJUGrC86MID2HLfc8djA=
Received: from KL1PR03MB5062.apcprd03.prod.outlook.com (2603:1096:820:1a::22)
 by KL1PR03MB6227.apcprd03.prod.outlook.com (2603:1096:820:8d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.9; Thu, 12 Aug
 2021 11:54:10 +0000
Received: from KL1PR03MB5062.apcprd03.prod.outlook.com
 ([fe80::3ce4:e30e:bb67:c608]) by KL1PR03MB5062.apcprd03.prod.outlook.com
 ([fe80::3ce4:e30e:bb67:c608%7]) with mapi id 15.20.4415.017; Thu, 12 Aug 2021
 11:54:10 +0000
From:   =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= 
        <Chunfeng.Yun@mediatek.com>
To:     "balbi@kernel.org" <balbi@kernel.org>
CC:     "rikard.falkeborn@gmail.com" <rikard.falkeborn@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        =?utf-8?B?RWRkaWUgSHVuZyAo5rSq5q2j6ZGrKQ==?= 
        <Eddie.Hung@mediatek.com>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        "alcooperx@gmail.com" <alcooperx@gmail.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "christophe.jaillet@wanadoo.fr" <christophe.jaillet@wanadoo.fr>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "yangyingliang@huawei.com" <yangyingliang@huawei.com>,
        "pawell@cadence.com" <pawell@cadence.com>
Subject: Re: [PATCH 4/6] usb: gadget: tegra-xudc: fix the wrong mult value for
 HS isoc or intr
Thread-Topic: [PATCH 4/6] usb: gadget: tegra-xudc: fix the wrong mult value
 for HS isoc or intr
Thread-Index: AQHXjysOXsLcMpIuLUizB6dZot6aSatvbrkAgABUdgA=
Date:   Thu, 12 Aug 2021 11:54:10 +0000
Message-ID: <3dbf2c4f28e29b7adcef94e2322d0dc773cc9d91.camel@mediatek.com>
References: <1628739182-30089-1-git-send-email-chunfeng.yun@mediatek.com>
         <1628739182-30089-4-git-send-email-chunfeng.yun@mediatek.com>
         <87k0kryx20.fsf@kernel.org>
In-Reply-To: <87k0kryx20.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2deb7eab-ade1-4fac-728c-08d95d87e59d
x-ms-traffictypediagnostic: KL1PR03MB6227:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <KL1PR03MB62279453695D589B5AE7FE8FFDF99@KL1PR03MB6227.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uwQIL6vOvoQ5iiUhienUX5wHZjJaREW2Ps7DpqhIBi/+Hzchgc8RVb97mEHNmlmAONSDKj8pNNKtZcAmYKCd7wckeauO5X0yojYcEtSGWPtvrpso0FYH520vTN6rfWUYtm199ovNplv5T9c8T7oay6xfm+IUo0tCXngke8GJ3wv/XhIINxBT+O6hQzFmjZ/lU1J9fazrOPcVBGh+IbMaUQnWYzWXXbPdEH2aD9zfQEaetQATNDNG/4e8LEzDivqzIFJbrZLWcBAFWcw3Wz/2KXo6A45SBhtKOR6SGm5ELTpiCxCOPMiY+HBddYwMS+2JFbH4cq589ejh3iiQ7opPDOajWopVGwysaDJ83qyfJ9ueOoZtIhJGnkCfTtnWHZ7jkHYSIGuWQDBgNxr0d1fHNt/M2HZ/qsA3U62KTc9KYakHh3r7iG1kltZpMOYJIpL1VFIlvSnJymTKsYZoSbs6atkTSu4bLNct9Q/9LjkLSC1D94kZlornWsinHApWf7qIB5eVSWLKraOMJhSgwY0N6oJGsV1xzwfi4IL1S2dxUfutc5DaBWOit6+IrZeqPJka6q1DAfKR4nwZezWBbI8w2jZyNn5l2kDhSx/5rWarl+7wqavJfoj1Ch7RUHNYpqxCsQ2NASii04Fa7BpzeJMEv5DESyQ9IRJbiacpiZCX0C/d+yVuUoUgsIaK4rN9BmSM9RDheYO2E/I0WZg/3z1h3g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5062.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(76116006)(86362001)(66946007)(85182001)(7416002)(6486002)(4326008)(2616005)(6512007)(316002)(26005)(36756003)(83380400001)(6916009)(91956017)(66446008)(54906003)(5660300002)(6506007)(71200400001)(38070700005)(66476007)(64756008)(186003)(66556008)(38100700002)(8936002)(508600001)(8676002)(2906002)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N3dMMEhPd2FsWm5NRFJRbDRpWkowRFNUM2tzQlQra0pHMU9DUjZHMkhGTzNx?=
 =?utf-8?B?SGI3NXFpNzNWVnJ3VytEbzNaSXI1bkVtbTRXc1hWanAxUStkdEJicmMwNkJ4?=
 =?utf-8?B?ODBPNk5HaUlpNTU4MFNzM3MxZHpPekRSSnhSdjZ3djk3L3d1eU0vVFBqdzNC?=
 =?utf-8?B?N2RLVXBxK1FXMmR3dTI2UW96TUJwcmFnQWZhelVMWE4yWE5ZcTJpcksxN21E?=
 =?utf-8?B?U1V1cTNuUGdRNDRmcDE4djhpa2tZbXBRMlBCQlozZzBpaDZxVktZVzVjdmND?=
 =?utf-8?B?anVSQ1BYYS84Z1dKM0w0U1NINVlrMGFsdzFyQUptNm5SRjlaWWg4OVUzOVBG?=
 =?utf-8?B?NVZRZG9NZHVlbkZLTWszQzV1TEpCTmhYYjR1MytYcmN0SS9oRzB0WTNUeXlw?=
 =?utf-8?B?cFFCdTlvQlJQNG56RWx4alVsanVFbEZRSDJwSDB2S1hlL2RGTVlzTmUzOU5Z?=
 =?utf-8?B?TExTZlNnbGZ1T2wwbDFsNVluS1BnOEVtRWdCVzQyNmRmSThlTFJKQnByWUhT?=
 =?utf-8?B?clJCbmw1Y3dSeG1Ya0RFMm9Gai9CUWYvbkFMQW55YURGNG90bVZ2TWh3cWdC?=
 =?utf-8?B?SE1kenhhR01jL0ZESEVxZWl0K3hrN0g4czVZaWgwTU5KOFN6VHZzU0EzT0cz?=
 =?utf-8?B?MGtyVEtUbFJIWnh1TjN5ZlkwZy8zUGdORmFPU2M5MmQrMHJmVFBEVkpvWnBD?=
 =?utf-8?B?YjRxYnAvV3E0Q2R4OWdEMkdTUXRqLzJxemxXUXFWWFR6U3N4Sk9RcEYwYXRm?=
 =?utf-8?B?Q1dQTnB2RVlabmUvektOUkVkaWRYMXp1OUJuZ2tBYTBZbThGV1E0OWMySW0z?=
 =?utf-8?B?T1V2SHFHRUxqelZmUjBsTUVBdDcxV3ZGVHh0RTdBMHRPVHRJYmZLejgxYTVl?=
 =?utf-8?B?eDYrWk92UUFSWHJYaXQ4a3Brd1pKNUErOFJDL1phTWRiRzhoMDJ1SlMxb3Uy?=
 =?utf-8?B?YUVEVDdTZ3RpdHprTUtVRFB2ak14cnBQNkFvVmw2c2c1T090UGsxREF0TnpW?=
 =?utf-8?B?aGd4bGd0QmViQk04ZEZMTXJ4NmFJdXdja3VwM25UeFV6R1I0MnFkOUZJekJq?=
 =?utf-8?B?R25QN21ER2ZxeW5OVWRYVEtnb1FBOERvNmJIZmFZUmM2NU9QZktWRVl5TEpK?=
 =?utf-8?B?bmNxeUg5N0xWOVlseXpJUXVSa3l1MkloQXJsMHdYeXUwa2JvcmdwL3UzRVov?=
 =?utf-8?B?S1RNRkpmTGQ5YmpMMG1rS0N4VXl1cWxnZTUxL3ZtVXRXdUIyVlhLbjhhT2NG?=
 =?utf-8?B?bXhmcGNyZy9JcDFtQkpJRHdYaVBKWXVQZExvS2REZUxKMEVzZWo2bXpOYnJK?=
 =?utf-8?B?cFRyTWY2aS96bDJhOHBLS2g1TE1VbFNKbFlkd1oxbTZvSWhyUXdRbHBOK3pW?=
 =?utf-8?B?Wkt3RWxEYU5aWHVOZmhHZ3czVVJhMHNuQythOFp2Y1dNMUhJSmR2Yi9JbHFH?=
 =?utf-8?B?NXVwczR6Y3hUNUNwKzdIMkthcjRmUVVnWVByQjRpZzMwcVEvcHFydENPUElv?=
 =?utf-8?B?NWNWOFBadkJ4bVZncGE1a3I5Rmp0cHRwbTZNMzYrdVRtdW4xNE9rS0NaT2h5?=
 =?utf-8?B?QzZhUnBROFlhUUF0RzBEamJWYzNTaWpDSGNSMlVLZlM1ZTVUM2JUeXIyMUND?=
 =?utf-8?B?ZkVjNC94dFB6UzhhRXczQUVFb0Q0VkdpOFRIQTQ4Sll0dkVBNVJSQjVUaTNj?=
 =?utf-8?B?QTg5emhQWkIwZ2lpVngvUXdnV2FKNVRTQnRVcjZkdWcyZ25nYUVndkFabXR4?=
 =?utf-8?Q?Hr2qttDysQIbonOsXFg5fAVOhXY8INVDj3r9Lsq?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E4FE8E85C4E7B4499E92D3109BF61DE7@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5062.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2deb7eab-ade1-4fac-728c-08d95d87e59d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2021 11:54:10.1326
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7EpC/bLFNFmH/B3fOoFl1GhdWHAvv913a3NCh5E0oAkjnCJ8xipTA9M0OBNp8pD0YhuWSIe8qe2kkMJnbCNGE/buKFcMrS6wqIPHzgFyc8o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB6227
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

T24gVGh1LCAyMDIxLTA4LTEyIGF0IDA5OjUxICswMzAwLCBGZWxpcGUgQmFsYmkgd3JvdGU6DQo+
IENodW5mZW5nIFl1biA8Y2h1bmZlbmcueXVuQG1lZGlhdGVrLmNvbT4gd3JpdGVzOg0KPiANCj4g
PiB1c2JfZW5kcG9pbnRfbWF4cCgpIG9ubHkgcmV0dXJucyB0aGUgYml0WzEwOjBdIG9mIHdNYXhQ
YWNrZXRTaXplDQo+ID4gb2YgZW5kcG9pbnQgZGVzY3JpcHRvciwgbm90IGluY2x1ZGVzIGJpdFsx
MjoxMV0gYW55bW9yZSwgc28gdXNlDQo+ID4gdXNiX2VuZHBvaW50X21heHBfbXVsdCgpIGluc3Rl
YWQuDQo+ID4gTWVhbndoaWxlIG5vIG5lZWQgQU5EIDB4N2ZmIHdoZW4gZ2V0IG1heHAsIHJlbW92
ZSBpdC4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBDaHVuZmVuZyBZdW4gPGNodW5mZW5nLnl1
bkBtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvdXNiL2dhZGdldC91ZGMvdGVn
cmEteHVkYy5jIHwgNCArKy0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2dhZGdl
dC91ZGMvdGVncmEteHVkYy5jDQo+ID4gYi9kcml2ZXJzL3VzYi9nYWRnZXQvdWRjL3RlZ3JhLXh1
ZGMuYw0KPiA+IGluZGV4IGE1NGQxY2VmMTdkYi4uNDBhNzQxN2U3YWU0IDEwMDY0NA0KPiA+IC0t
LSBhL2RyaXZlcnMvdXNiL2dhZGdldC91ZGMvdGVncmEteHVkYy5jDQo+ID4gKysrIGIvZHJpdmVy
cy91c2IvZ2FkZ2V0L3VkYy90ZWdyYS14dWRjLmMNCj4gPiBAQCAtMTYxMCw3ICsxNjEwLDcgQEAg
c3RhdGljIHZvaWQNCj4gPiB0ZWdyYV94dWRjX2VwX2NvbnRleHRfc2V0dXAoc3RydWN0IHRlZ3Jh
X3h1ZGNfZXAgKmVwKQ0KPiA+ICAJdTE2IG1heHBhY2tldCwgbWF4YnVyc3QgPSAwLCBlc2l0ID0g
MDsNCj4gPiAgCXUzMiB2YWw7DQo+ID4gIA0KPiA+IC0JbWF4cGFja2V0ID0gdXNiX2VuZHBvaW50
X21heHAoZGVzYykgJiAweDdmZjsNCj4gPiArCW1heHBhY2tldCA9IHVzYl9lbmRwb2ludF9tYXhw
KGRlc2MpOw0KPiA+ICAJaWYgKHh1ZGMtPmdhZGdldC5zcGVlZCA9PSBVU0JfU1BFRURfU1VQRVIp
IHsNCj4gPiAgCQlpZiAoIXVzYl9lbmRwb2ludF94ZmVyX2NvbnRyb2woZGVzYykpDQo+ID4gIAkJ
CW1heGJ1cnN0ID0gY29tcF9kZXNjLT5iTWF4QnVyc3Q7DQo+ID4gQEAgLTE2MjEsNyArMTYyMSw3
IEBAIHN0YXRpYyB2b2lkDQo+ID4gdGVncmFfeHVkY19lcF9jb250ZXh0X3NldHVwKHN0cnVjdCB0
ZWdyYV94dWRjX2VwICplcCkNCj4gPiAgCQkgICAodXNiX2VuZHBvaW50X3hmZXJfaW50KGRlc2Mp
IHx8DQo+ID4gIAkJICAgIHVzYl9lbmRwb2ludF94ZmVyX2lzb2MoZGVzYykpKSB7DQo+ID4gIAkJ
aWYgKHh1ZGMtPmdhZGdldC5zcGVlZCA9PSBVU0JfU1BFRURfSElHSCkgew0KPiA+IC0JCQltYXhi
dXJzdCA9ICh1c2JfZW5kcG9pbnRfbWF4cChkZXNjKSA+PiAxMSkgJg0KPiA+IDB4MzsNCj4gPiAr
CQkJbWF4YnVyc3QgPSB1c2JfZW5kcG9pbnRfbWF4cF9tdWx0KGRlc2MpIC0gMTsNCj4gDQo+IHRo
aXMgbG9va3MgbGlrZSBhIGJ1ZyBmaXguIEJlZm9yZSB0aGlzIGNoYW5nZSwgbWF4YnVyc3Qgd2Fz
IGFsd2F5cyAwLA0KPiByaWdodD8NClllcw0KPiANCj4gSW4gYW55IGNhc2U6DQo+IA0KPiBBY2tl
ZC1ieTogRmVsaXBlIEJhbGJpIDxiYWxiaUBrZXJuZWwub3JnPg0KPiANCg==
