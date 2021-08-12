Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAE42C4338F
	for <linux-tegra@archiver.kernel.org>; Thu, 12 Aug 2021 11:53:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B89FF60F00
	for <linux-tegra@archiver.kernel.org>; Thu, 12 Aug 2021 11:53:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235563AbhHLLyE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 12 Aug 2021 07:54:04 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:59600 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S236390AbhHLLyD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 12 Aug 2021 07:54:03 -0400
X-UUID: 43321bd03e89406cb9c625ba1db4694e-20210812
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=9X+d9ipaC4DI3imyMU0YeXUjpU8joI8VjZd+ChOXIoA=;
        b=MMy8MiXcaniLPUzoCFCh8LQY+J0uE7vNU2w4WeR8ugyiMVG1nqwRErZPZ3/1ZbV8M9pxMDEsGcS04/YbfNx0YK2k+1GGCgrfgU+eSloY6J9W1OEGzYBkN6EjzDLdZ6Xczv7P6viYourfPRmdtzkkmmNoVI1lhMBtYKNKPor2DWo=;
X-UUID: 43321bd03e89406cb9c625ba1db4694e-20210812
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 885576350; Thu, 12 Aug 2021 19:53:35 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 Aug 2021 19:53:33 +0800
Received: from APC01-PU1-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 12 Aug 2021 19:53:33 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VGK3rRpDdywzy3RhsTh5OemC4fLp/Wmw3TqjgfRtMSuFWmNx/zffVn01ubCTxZCN5c6XwpOZV52cYlNQ1/1yum8rBaQOgpiHhfR5QJx/45wushHpgwegvG84MhEHrU72F9kIuYw1go8Akju9LF5i/nuwlGNssnqTOa/QfWWAnXkPlnFUsWfchT6XYFLo8R6DrXsafm4qe4JeTYCFE1xY0VosX9v0xEc/mbZTPF1wOCcKY+c1ckruXn2w3eaSmR9s/afIG14zTR20mh0P9nN2dLxgeBDKU7X2oS24Lu3tbS7oQJDNaC3steCUEiWp03HhZfwNy6HLdzjvXZB3BMnJdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9X+d9ipaC4DI3imyMU0YeXUjpU8joI8VjZd+ChOXIoA=;
 b=d4i+G0iruXaslYSktuFaLiPpliXQbQ00A/szIEoPUKrxtYz1r1TCi4e7EEAJgy6Badi2b12JkkfIgwSmvKimOOeo+fZOlmxOtIspzDOAPeZ8rc0a4kUSdMK7b1bw5Xo9r3on8Ap5ugmqXVbIr+4VQrK6VpmOTBat/l51K0VSAmtPWj2DqgyhA06IxGEDOPHPjaoc8zMNQrIIiwuyc86I1q302yTv0IQomq6nbUipgj8uM1gj2ewpLBIkcUDUdtwrVfEdjoiU9DBzJALJlnbAnCEsCwhbZgzCKrNm3gaVFivWVH1w5D6TtTyyb4arTpkzG5HjpeNmU6hkiFY6WvoHYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9X+d9ipaC4DI3imyMU0YeXUjpU8joI8VjZd+ChOXIoA=;
 b=R2sjvZpZhgEYi9e6Dgj2pl091bOpttKfpiipnA/ykXqmpY9tgXcngrJH4KczFfzi8eb7782ZFjZAq7ZmLNlPTRlDrlZO1T7ZMGBmQP+nXhppAH0AMqxCsoWwxAR0hlhHgQByPndxq+UY2rklxG3UNQDF1MGY2CBP1ZGjJUn9VqM=
Received: from KL1PR03MB5062.apcprd03.prod.outlook.com (2603:1096:820:1a::22)
 by KL1PR03MB6227.apcprd03.prod.outlook.com (2603:1096:820:8d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.9; Thu, 12 Aug
 2021 11:53:22 +0000
Received: from KL1PR03MB5062.apcprd03.prod.outlook.com
 ([fe80::3ce4:e30e:bb67:c608]) by KL1PR03MB5062.apcprd03.prod.outlook.com
 ([fe80::3ce4:e30e:bb67:c608%7]) with mapi id 15.20.4415.017; Thu, 12 Aug 2021
 11:53:22 +0000
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
Subject: Re: [PATCH 3/6] usb: cdnsp: fix the wrong mult value for HS isoc or
 intr
Thread-Topic: [PATCH 3/6] usb: cdnsp: fix the wrong mult value for HS isoc or
 intr
Thread-Index: AQHXjyrdXjsluDJx2U2joaBrEorD3qtvbn+AgABUdwA=
Date:   Thu, 12 Aug 2021 11:53:22 +0000
Message-ID: <65f6dfdf98632bc93ad0d1a894c479d5067695bb.camel@mediatek.com>
References: <1628739182-30089-1-git-send-email-chunfeng.yun@mediatek.com>
         <1628739182-30089-3-git-send-email-chunfeng.yun@mediatek.com>
         <87mtpnyx3g.fsf@kernel.org>
In-Reply-To: <87mtpnyx3g.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d96a48e2-e07b-48c0-0280-08d95d87c8f1
x-ms-traffictypediagnostic: KL1PR03MB6227:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <KL1PR03MB62276018A00DF5A56E25F657FDF99@KL1PR03MB6227.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2JdEQbmGdJ/39JsGJfoepDQwcg5ReHGNgZoPg+MmoG5bcA4gtmz6tCxPM8gcw2G0/Vq7lW3SiWASK0L3eXcNuU86BgJ0GYai86tTVKmRxI2gDA5PK9iJzy+iwS8orJAXwpQ03DGv0xb1WpA4HyVKZGSj2G+5Q4L0XNPjyEF2Ji0U+gdbP/dsiR7x08Y7JlIsgmnwIW3RLDdiG+s+REe13a6UQKNOGtqnjvjeX5TKisLY00XlH17NcbPwQnV46uM7yAC8hPKVnYlPbCPUk11pFyh6daql9RF5Y4hkgExGNsbV5lY6SIa/pecMqC7YtZ2bvJXuefqEc4McssXl/b6Ko8SG0jCRYWb9PJoWek9O+qCuF362TB6HhxsqTX8Ddm9ulAgcAN5Z+ZLeTeeArRvi4uDuyNrSBd/S3FicEbPSkodyCDoUWgH1gNySkExGgLCM8iYw/Cwj7BLm3JxSUs6lNVswXb61ljvR86bM2b4VCzqWf6iKxpMRwXvAZWcdAPKL8kKGrt62GszU5/GFlvSvAe3/Z1m5CY4BR7KQiv/ZzzGtQMWo9jJsrBuWRRJybFiP/8RapsvelswlNIdKXiYjRQUNPt3PphXJIzSOSMdZCsP2B4IeX4eDkUsgtJwn602/LXKCCDpkBYnVhb9palgVaX0igf/Q2+Xs+OY0zOBstG+rjMFiydprsgrzFg0V06VeGSDqsJMevzuTA66I9OhXIA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5062.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(76116006)(86362001)(66946007)(85182001)(7416002)(6486002)(4326008)(2616005)(6512007)(316002)(26005)(36756003)(83380400001)(6916009)(91956017)(66446008)(54906003)(5660300002)(6506007)(71200400001)(38070700005)(66476007)(64756008)(186003)(66556008)(38100700002)(8936002)(508600001)(8676002)(2906002)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RSs2L04yT3JranU5d3ZJMWdrSVg5Z2s1RVlYZ0hEcWEwNFZpQ3BmVDYvTzZ3?=
 =?utf-8?B?R0ZHanhhRjN1NFZhYXdCdzJRbU5nakZzeDVMdXF2b1gyM0I2NC95c2FWbHpk?=
 =?utf-8?B?VVNlYkZNcm1XU2s3bERIOUtGMXQ4SzgvYzlZSkM4d2RVenZycVUvRFJZdndy?=
 =?utf-8?B?SDd2a0tSL0ZYZ3BiUnZwNDhnZDJzYjUrOGtvNEduWVFmK0NyaktnNHV3TVdN?=
 =?utf-8?B?TXJDWVh6dllLYnhqNWwrdUxScEVUSjVBSUo3WGM5ZjJaQll6L0FFeEgxMCtr?=
 =?utf-8?B?U2ZXZXpCc21xREFuS0VKTUlxYWNGU0h4eUxHcXhaS3FXajFOdGN2UE1qTzBY?=
 =?utf-8?B?M2hqbXFWLzlIN2FpcVE2WWR0ejRCMG5Cc2JKZ2V4SzlpN01KMno0ZkV2L2pP?=
 =?utf-8?B?VitJQmFweTBLN0NMb0w2RUl6SEwveTlKZE9yVFZpdTh6RWtFbExPamZaODZz?=
 =?utf-8?B?aHhYNWRYMER1WUM3UnM0bml6aEFLcUNSclgyMkNPY201Sk9KeWxQeWhGaEZh?=
 =?utf-8?B?Y01NeG15R0x1QmNISGtuMTdkUjYyT1pmdVB1cWh1dENNRjhHZXpHekxhb1Rs?=
 =?utf-8?B?MkI0SkZqV1VRaFNkN3UxeFlDdkF0azZxd0RheStxUFE0NnY3NU9GaXRmSkxY?=
 =?utf-8?B?NGQrMHVZWXhZL2FUOFRZT3o3VnVRaEVOZWVQMVZDTVBrTmdVSGFmRDJNV2M1?=
 =?utf-8?B?TXVnUFR2VnpyWS96YThGa2V0UnJ1cThFejN3bTRzOGYyWW10a3ZlS0R4b3pJ?=
 =?utf-8?B?b3psSUUyc080QUJNWGVJVU9NYmFaVHYza3VwalFPR01rZHZ4UkFXcjBkRC9l?=
 =?utf-8?B?bzZ5U0xjZ3pVSWx4d0x4RFdTQ2VhZ3VkdE5hSEhtQnVkYmFJZUpFT2pOVGRR?=
 =?utf-8?B?VEJQU2w2S2gvTFZyWVFEeFFwRzJubXNUejRBY3YwZzBqaEVoVXZqcTZ0YVp1?=
 =?utf-8?B?MTZUeTZ4WlBhMldLWUVzOHNydGx6VmcwZmNWUkZGd2Vod21yUlpJQ1BSYndB?=
 =?utf-8?B?NktsWU44dmdXU3N4ckFnZ1grYmNGcG83U1hySDVBZDNBTEljdlYzNUJqS1lm?=
 =?utf-8?B?Q2JOdE5ZTEUyRmg4WTJXUVB5YTM0dFRiMzNkeEViSnpkNmp1eEhBTzhuTC8v?=
 =?utf-8?B?QUkxMTY2OW9peGVOdC9RbEtLSkFYNFpBWEhSTGZZd2VoU2gxTjlNVG54dWVK?=
 =?utf-8?B?WlF3UENqMFlaUHJjaVNybUh0RFVtYmJVdDJwTkU3UC9zMGxIVkpUdy82S3dC?=
 =?utf-8?B?cjA4bEVGUGxQdTFadmJrODdPRlgxUGpmK3VDVHVDVFBEaHlPay9lQjNlSXlK?=
 =?utf-8?B?RkdYVTFYRysrb0thdEtUWkpXVzV6RnNqMnZvbWY4Q2RnUUdIZWZSYjBLYjZO?=
 =?utf-8?B?VFNTSzJZLzQ2WWxiSXBsNGNPcWFDcVZFeGhPVHNDeHg5eFpuQTBYUEt0Q1NM?=
 =?utf-8?B?OVR4K2NoM1RsUzFmRSt3UTBDZUtMbkFCd2s4KzNJSlA1OTVhcW5KNGRLeFpm?=
 =?utf-8?B?VU8zdXV4VDd3S2RGRHkvdHVnUEVIMndscEVhaDhURVBIRVNXMDBTakJmRC9O?=
 =?utf-8?B?ckU1K3orNVlnVWdUbFpLVEVSLzZQYUZGS25scHU1UmJUdk1UcTlZRXV3WU9B?=
 =?utf-8?B?SUxOL0pyWk1lcE10WUNmdDRUSTQwb3k5WHkvdVB4M1NwR0lVMmJaNHZWTXY3?=
 =?utf-8?B?QSt4N3VxM1Y2blpMeGMyeUphY0xxYitQMjRxUkEwRDhQanc1NUVFbVVLVUxi?=
 =?utf-8?Q?rYLdH2GA81xJHEmrAdX88JDaY4FNiwanOo5T7N2?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D9607A41FA773547ACA80757D6A5CEEB@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5062.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d96a48e2-e07b-48c0-0280-08d95d87c8f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2021 11:53:22.0823
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y6+oqgyu74UM7jsd1vcBctwucsmtuT7UBBn5at/SR3MuBnBHNjvqU02tb8BMD9F+fEUrmKy7nM7gijUI6rnER4p7j11DfMySBi4HarF8CAU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB6227
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

T24gVGh1LCAyMDIxLTA4LTEyIGF0IDA5OjUxICswMzAwLCBGZWxpcGUgQmFsYmkgd3JvdGU6DQo+
IENodW5mZW5nIFl1biA8Y2h1bmZlbmcueXVuQG1lZGlhdGVrLmNvbT4gd3JpdGVzOg0KPiANCj4g
PiB1c2JfZW5kcG9pbnRfbWF4cCgpIG9ubHkgcmV0dXJucyB0aGUgYml0WzEwOjBdIG9mIHdNYXhQ
YWNrZXRTaXplDQo+ID4gb2YgZW5kcG9pbnQgZGVzY3JpcHRvciwgbm90IGluY2x1ZGUgYml0WzEy
OjExXSBhbnltb3JlLCBzbyB1c2UNCj4gPiB1c2JfZW5kcG9pbnRfbWF4cF9tdWx0KCkgaW5zdGVh
ZC4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBDaHVuZmVuZyBZdW4gPGNodW5mZW5nLnl1bkBt
ZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvdXNiL2NkbnMzL2NkbnNwLW1lbS5j
IHwgMiArLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvY2RuczMvY2Ruc3AtbWVtLmMN
Cj4gPiBiL2RyaXZlcnMvdXNiL2NkbnMzL2NkbnNwLW1lbS5jDQo+ID4gaW5kZXggYTQ3OTQ4YTE2
MjNmLi5hZDlhZWUzZjFlMzkgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy91c2IvY2RuczMvY2Ru
c3AtbWVtLmMNCj4gPiArKysgYi9kcml2ZXJzL3VzYi9jZG5zMy9jZG5zcC1tZW0uYw0KPiA+IEBA
IC04ODIsNyArODgyLDcgQEAgc3RhdGljIHUzMiBjZG5zcF9nZXRfZW5kcG9pbnRfbWF4X2J1cnN0
KHN0cnVjdA0KPiA+IHVzYl9nYWRnZXQgKmcsDQo+ID4gIAlpZiAoZy0+c3BlZWQgPT0gVVNCX1NQ
RUVEX0hJR0ggJiYNCj4gPiAgCSAgICAodXNiX2VuZHBvaW50X3hmZXJfaXNvYyhwZXAtPmVuZHBv
aW50LmRlc2MpIHx8DQo+ID4gIAkgICAgIHVzYl9lbmRwb2ludF94ZmVyX2ludChwZXAtPmVuZHBv
aW50LmRlc2MpKSkNCj4gPiAtCQlyZXR1cm4gKHVzYl9lbmRwb2ludF9tYXhwKHBlcC0+ZW5kcG9p
bnQuZGVzYykgJiAweDE4MDApDQo+ID4gPj4gMTE7DQo+ID4gKwkJcmV0dXJuIHVzYl9lbmRwb2lu
dF9tYXhwX211bHQocGVwLT5lbmRwb2ludC5kZXNjKSAtIDE7DQo+IA0KPiB0aGlzIGxvb2tzIGxp
a2UgYSBidWdmaXguIERvIHdlIG5lZWQgdG8gQ2Mgc3RhYmxlIGhlcmU/DQpJdCdzIGJldHRlciB0
byBDYyBzdGFibGUsIHdpbGwgZG8gaXQsIHRoYW5rcw0KDQo+IA0KPiBJbiBhbnkgY2FzZToNCj4g
DQo+IEFja2VkLWJ5OiBGZWxpcGUgQmFsYmkgPGJhbGJpQGtlcm5lbC5vcmc+DQo+IA0K
