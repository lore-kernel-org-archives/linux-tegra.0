Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FAC2C433EF
	for <linux-tegra@archiver.kernel.org>; Tue,  7 Dec 2021 16:14:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233630AbhLGQSU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 7 Dec 2021 11:18:20 -0500
Received: from mail-zr0che01on2130.outbound.protection.outlook.com ([40.107.24.130]:10336
        "EHLO CHE01-ZR0-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230101AbhLGQSU (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 7 Dec 2021 11:18:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JO/FPE0jPr3ahmyiOHQ51lufRkXX+MLijdJRhrn2OkdmnWodzwLn1M4c4yAIOqLj+A32PfmCh45Xiczk4a8zb1ke7bWqn4EuXiOC5iFTXh0gR785JlUc2ssMenOYRSgX64wpTVFGH5tyD+eps6/Ferro6+e0hJ6Ttb3Lm9BBvDJA+XeiHmIKSSlMueODJoKvCQHaRBwuVOQpLCnEUHg6s0jNDA+AyZ3AzfGvHEKCh7ExGHhpyQo4smrP7npxS7F9WCp8VKgWT9EQYJbWTphHwRUZ2GzQ0qPMmp79Z8TlxNp0Ovh+kf1lRYLYOuwrUzMGfVmCSzRwvoqO5mZGBoAiOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AIqYR7PC5s6z1SRj9zXi/fZnEh25PuqbGMUzr7bKaqI=;
 b=C74ZxN1F9FUK1A2gokbSRMFTyWAbQS8GuW3L595QnsVK4WavgGe4qQEDKg1aAiiw48zU625TXhoXX7sG8e90JOjSGTwpIwzRFc5BR6hcJM72w8Crp8U0+TkWmlO6Dbo3L7ySmUKO72YVrpf27kFyiNlR4q7G9qnYwz7f2gEMN7RIS1LrZm7DjSm9KbUtk4D1eOaCn9jiSs4ITIb0WJRSbV7lZXOPbRopBFU7kJgubfgzEbiojezt2ld8+cyji9b5AgKbHgGUe9NnqbROC2hgoeFgAIUE8NPDR0pi3+DscFYK76j0/qQiq1TC7jU4Pg7aExwKBvvlKgtNGn6Iq9tlpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toradex.com; dmarc=pass action=none header.from=toradex.com;
 dkim=pass header.d=toradex.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AIqYR7PC5s6z1SRj9zXi/fZnEh25PuqbGMUzr7bKaqI=;
 b=kAQsQgRRA/Sb2gaKuqmBNXWX6bslnCIv9fSEP9aP5+lq7UIBhDGYsZUaaqLfMTDPIfVTVSOrs5sTRdzt+ZUuSDoOqs+qiAqDLHmtXTDmz9wYrQ1TyT3HlE/WzPZh5T+pJzbZEuw2bVxd3HHbi6dKWMFTbcO0qXWGIqEd4IfXFKc=
Received: from ZR0P278MB0683.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:3b::9) by
 ZRAP278MB0446.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:2b::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.16; Tue, 7 Dec 2021 16:14:46 +0000
Received: from ZR0P278MB0683.CHEP278.PROD.OUTLOOK.COM
 ([fe80::2de2:ea03:cafb:56c1]) by ZR0P278MB0683.CHEP278.PROD.OUTLOOK.COM
 ([fe80::2de2:ea03:cafb:56c1%6]) with mapi id 15.20.4755.022; Tue, 7 Dec 2021
 16:14:46 +0000
From:   Marcel Ziswiler <marcel.ziswiler@toradex.com>
To:     "thierry.reding@gmail.com" <thierry.reding@gmail.com>
CC:     "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
        Philippe Schenker <philippe.schenker@toradex.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH] ARM: tegra: Add compatible string for built-in ASIX on
 Colibri boards
Thread-Topic: [PATCH] ARM: tegra: Add compatible string for built-in ASIX on
 Colibri boards
Thread-Index: AQHX62nmgtLW+wM1FUWrrlkBc0lQPqwnNEYA
Date:   Tue, 7 Dec 2021 16:14:46 +0000
Message-ID: <24d542c224be56742cc95af79d7e47ca6031976b.camel@toradex.com>
References: <20211207125643.400976-1-thierry.reding@gmail.com>
In-Reply-To: <20211207125643.400976-1-thierry.reding@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=toradex.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 34463999-414a-4952-95ba-08d9b99cb002
x-ms-traffictypediagnostic: ZRAP278MB0446:EE_
x-microsoft-antispam-prvs: <ZRAP278MB0446E5B2459B9B02AFF28E44FB6E9@ZRAP278MB0446.CHEP278.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7hg0jOSNAw2xzMQPWRZbNgIW9A+0+DQj3q3vdBVMym6xCkjEjW5LpaZwP0+APJM8xg6W6JLqHzzps3u7gSeTjmkr08UO5yjdegVRo+mhYQrnQ5ZBrErbELr5L0R6FaakL7fs5j9VshEo57BSdD4nR9hJinKxlscon6Qzqt4N3ynXct7TxpdBZiEGqisGi5w0vvlhqvwRrQrYNuMOkjfMantjIGJOE5VqAHCkdlJ98r8VYIS4ojWP2uXTMsByAC0EcKrvyx4wZf8xal4YtQLD/9UG720LVCsTnEXnD6TLCa/qKEmfnKebmvCxTyoPnCseigW962WJUcuRSXwBA0XwL2fMG5zEzSO4umvpqZaUo/rVY39aVwPEUxyd3xBIGqkhbkObsEttpFUjQF5PSWDjl77Y7eyf0vnVpSNuBmh+/9YYKyxQWT1Sk25q0TsAt6h//sR9hXDNK1clgfbL9Xx9CkZfDyTVtgbqmQBNO+lfzVFe4JZlGD72ynLkRtrN7pl4nOOiAvw2gLzKBOPq3Z8M1s75QgLCNDvd100fUt1A7vsnOgn4w6Mriy8JaFMD5VoLmcsAGGZhNEN7GRzdFISG0BcSZpVwfWq7LsvtrxlpGzVxX7u3/mwSy85HedxMk2841FJMvAvlDij/PfpIOo+Ha03AvHazy4xhqupH+7AwrJKK+INYvX98G6P0haSyfJlZIWeV5Hh9FoZiMP6gCxJXjA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR0P278MB0683.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(8936002)(91956017)(2906002)(66946007)(5660300002)(6512007)(86362001)(2616005)(66446008)(66476007)(71200400001)(64756008)(66556008)(76116006)(38100700002)(8676002)(26005)(6506007)(508600001)(54906003)(6486002)(83380400001)(44832011)(122000001)(36756003)(4326008)(38070700005)(6916009)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WFZ4VGw0QmIyVkN3aExLckx6S0kyOHRuY3lUa3FiZy9qWk9uYXp3ZDZ3bE8r?=
 =?utf-8?B?VmU2OFJISGw0N0xGanpkeSszeVhEZFFrNlhzeHh6NDdJN1Y2UzVaYnI1UU1V?=
 =?utf-8?B?b3YzdHVHbkl6dTY3dFFHZmJVbjZvWCsrLzlTOWFBS0FHQUhQR1dZMUhPQ0FC?=
 =?utf-8?B?em5pU09aMzBhLy81dzlIUkI1QmpRakl3bGhtZkl1SlIyVWpsUGh1WER4VGI0?=
 =?utf-8?B?VzNZMFpMZWFoa25GU1hUUy9MZDEra3JaQTM4Sk5FdU81R2xZMVc3M21tT2VE?=
 =?utf-8?B?SVcyWm9DZTFVRWpRTFIvcTJxMXBqdXpKeTJ4TS9hRVBnUXpUVkZ3MjJ5MVdJ?=
 =?utf-8?B?bjduTitjbWRyaGV2Q3VwdTg4b1VKTFNIM1d1TURncExTdElxQ0lFTytPZ1FG?=
 =?utf-8?B?K0wyNFc1MVY0RjlyOXIwQk9KOU84eWRCVGRUM1o5RHVha3oveFUxdENhbzM0?=
 =?utf-8?B?ZDh3NysvWVJ5VE03YW5qSlhoS3U2Wm01dTFiUnpKT0FsWEZaa2kyYXZoM3Ir?=
 =?utf-8?B?MjRhTkM3UTk2cEQybEpCeHJLdHdTSEdXSHpaRlhSUldrZmFiRWp2NFZ2Z1dm?=
 =?utf-8?B?Z3JnZHNhb0tEWUpWczRYQnhKWENrNTN5VGVuVzVCZzgybGlLVUVXbDZIb3c5?=
 =?utf-8?B?UGN6WXpyUSt1THRpL2FzeHZpVW9lcW5MczBKSGJCaUdCSFFqWkZXRkg2Wkc0?=
 =?utf-8?B?Vk0zYTNSczNwdWVCaGM0R2ZCY21TZE9mRVdCTGt6NWJYRXB2MDI2cVZDUEg5?=
 =?utf-8?B?a254emgrd1p3dlZLTlVYbDYreERjNFFsek44ZUxjclB2NlBJcVhSbXhRWW40?=
 =?utf-8?B?b0ZHbnozN09JbS9iaDdHRitrTDk3M1lHdjFNTjFXKzh3d2tlcGZZNWRXNFFw?=
 =?utf-8?B?cmgrNzRKMkcraTRnU2hnQzE0WU1XY21iMG80Q2xRNkkyZ3JPaEh4dXF2aUZp?=
 =?utf-8?B?L1QwSXUvejdpcDJMV1h3WE8reTB1czQ2b1M5VkhSNnFnTzZrQk0vWjFNM0Qz?=
 =?utf-8?B?NCtrZVplaVNoQ1AxQnRSQmpKMWZXRHVRbU5jZFNlNGZTdFJaV1pKWWFtREZi?=
 =?utf-8?B?Y0FxT2NOWmI5UEF1eWdjdmJhYTQyZjg5dklGUFdOU1pEUm9KdTR0cWtZL1Zp?=
 =?utf-8?B?VEhBaE5aVm9pTHBSNlRmcitpRG5Yd3JFYTBQUjYxVU03RHlqU3pnejRQTGNt?=
 =?utf-8?B?MG84SWxHU2xubVZyTkdOc2pqdXBPNHE3ek02TmJiWWRQWkljMk9QR0xMVW01?=
 =?utf-8?B?akNXcVdyZS96ZGNLUWNZMEtRS09uY3RpTVJnNldKS0pvU21oTEk3NGs5OFpL?=
 =?utf-8?B?MVlTeS8veDZTTEs5QzVEYTNJUSs4c05VYnBkNDgrRm5sQ3Y2N3FMM3M3aGlZ?=
 =?utf-8?B?Sm83TlBlY2dhb3NLVTBqTVB4R243UE1SeGxPay94RWFyY1RuM3BZUDY0STcv?=
 =?utf-8?B?WU1SbFFDYXpBMmYrM1Y2WmtpRm1XYVg5SjhUQm1ZTDJneDBudjdjRmxWdHNW?=
 =?utf-8?B?M1JnUFM4b1p5UDJJODNwdkUwUzhuR1NlTG5VZ1c2WTA4NG83T2hKTnVKcyt5?=
 =?utf-8?B?OHhEZkZZcFY0SEQ5OEJVLzZxZmVYSVBtN3RQQWVDSWVMbFFRUndRVkVrM09v?=
 =?utf-8?B?YVZZTDVYWk9Ia3lGVFJnd0JnalVPcEJiV0ZROHJ4TmU3TmlaNEs5clU1S25v?=
 =?utf-8?B?S3ZVSEUvOXNUS1R2MkVzV1orWkFCVnQzYTlzME5EQi9iUGRKN1ZLTTdDQkNM?=
 =?utf-8?B?ZllHQkJqQjRwWk1zbEduM3M4cGRxci9YY09SRWd4ajlWcnhqY00xeUM1TC96?=
 =?utf-8?B?ZlZUSVRud0I4MmdnWEVoa3k5Sk0yUkZZRmdYdnF6RW9OU0lFUTl4TUtKa01u?=
 =?utf-8?B?bFozRCtMbTVYMklPeVZ6RzdOekF5b2dmaElTWEIrQkR5blRkWDNtZ0dUbnox?=
 =?utf-8?B?UHNBSkFSM2s2bmFsa1dieUxDNG9oSlRoYVlsM0o3UlFjaWhPRTA3WTA5V0sv?=
 =?utf-8?B?Rk1seEVKelp6ZlN3b0hYZTd2L2VFdHBkWmcvbHFiK0ovaGtnWmZhb2YvaVcx?=
 =?utf-8?B?UEdEVnZadDZxVk9NQjB0eU0wblVZOFYwSDBCRkFEcGFUTkswUFNWK3FPdnQz?=
 =?utf-8?B?NkhYY2lRSFlFS0xhcFBLYm1MZ1VaQWd5VXEydHhrWXlPelhvckhJd0NoNVJs?=
 =?utf-8?B?cFZkZ2x5RFJlNHNRRlNMVzlpbHF6UnozWVRkNXQrQmdIWmVLdnkxRk42ejFI?=
 =?utf-8?Q?WmeQG9L/QxX5RSyRqFiwFEVW35VHJkiNoGBVR8qcq4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <272DF3C1AFDE024C8C7A16DDE5679715@CHEP278.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZR0P278MB0683.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 34463999-414a-4952-95ba-08d9b99cb002
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2021 16:14:46.6551
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4qGnyZBSJX+yfu7MmLuViHZVb9FinysT4IiJ2ZEEcVQ/q8uK7yurDghQTaDWnOji56evc4AMea1/91Sf5HcljY/jLt/GR3IiZhBH3YFGgDc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZRAP278MB0446
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

T24gVHVlLCAyMDIxLTEyLTA3IGF0IDEzOjU2ICswMTAwLCBUaGllcnJ5IFJlZGluZyB3cm90ZToN
Cj4gRnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4NCj4gDQo+IFRoZSBk
ZXZpY2UgdHJlZSBub2RlIGZvciB0aGUgYnVpbHQtaW4gQVNJWCBFdGhlcm5ldCBkZXZpY2Ugb24g
Q29saWJyaQ0KPiBib2FyZHMgbmVlZHMgYSBjb21wYXRpYmxlIHN0cmluZyBpbiBvcmRlciB0byBw
YXNzIERUIHNjaGVtYSB2YWxpZGF0aW9uLg0KPiBBZGQgdGhlIFVTQiBWSUQsUElEIGNvbXBhdGli
bGUgc3RyaW5nIGFzIHJlcXVpcmVkIGJ5IHRoZSBEVCBzY2hlbWEgZm9yDQo+IFVTQiBkZXZpY2Vz
Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNv
bT4NCg0KUmV2aWV3ZWQtYnk6IE1hcmNlbCBaaXN3aWxlciA8bWFyY2VsLnppc3dpbGVyQHRvcmFk
ZXguY29tPg0KVGVzdGVkLWJ5OiBNYXJjZWwgWmlzd2lsZXIgPG1hcmNlbC56aXN3aWxlckB0b3Jh
ZGV4LmNvbT4NCg0KPiAtLS0NCj4gTWFyY2VsLCBQaGlsaXBwZSwgSSd2ZSB1c2VkIHRoZSBVU0Ig
dmVuZG9yIGFuZCBkZXZpY2UgSURzIGZyb20gdGhlIEFTSVgNCj4gZHJpdmVyIG1hdGNoIGVudHJ5
IGZvciB0aGUgQVg4ODc3MkIgbW9kdWxlLCBidXQgZG8geW91IGhhdmUgYSBxdWljayB3YXkNCj4g
b2YgdmVyaWZ5aW5nIHRoYXQgdGhhdCdzIGluZGVlZCB0aGUgSUQgdGhhdCB0aGUgZGV2aWNlIHJl
cG9ydHMgaW4gdGhvc2UNCj4gc3lzdGVtcz8NCg0KWWVzLCB0aGF0IGxvb2tzIGZpbmU6DQoNCnJv
b3RAY29saWJyaS10MzA6fiMgdW5hbWUgLWENCkxpbnV4IGNvbGlicmktdDMwIDUuMTYuMC1yYzQt
bmV4dC0yMDIxMTIwNy0wMDAyNS1nMTIyZGE3YjBhOWQ0ICMyIFNNUCBQUkVFTVBUIFR1ZSBEZWMg
NyAxNjo1NDo0NiBDRVQgMjAyMQ0KYXJtdjdsIEdOVS9MaW51eA0Kcm9vdEBjb2xpYnJpLXQzMDp+
IyBsc3VzYg0KQnVzIDAwMyBEZXZpY2UgMDAyOiBJRCAwNDI0OjI1MTQgU3RhbmRhcmQgTWljcm9z
eXN0ZW1zIENvcnAuIFVTQiAyLjAgSHViDQpCdXMgMDAxIERldmljZSAwMDE6IElEIDFkNmI6MDAw
MiBMaW51eCBGb3VuZGF0aW9uIDIuMCByb290IGh1Yg0KQnVzIDAwMiBEZXZpY2UgMDAyOiBJRCAw
Yjk1Ojc3MmIgQVNJWCBFbGVjdHJvbmljcyBDb3JwLiBBWDg4NzcyQg0KQnVzIDAwMiBEZXZpY2Ug
MDAxOiBJRCAxZDZiOjAwMDIgTGludXggRm91bmRhdGlvbiAyLjAgcm9vdCBodWINCkJ1cyAwMDMg
RGV2aWNlIDAwMTogSUQgMWQ2YjowMDAyIExpbnV4IEZvdW5kYXRpb24gMi4wIHJvb3QgaHViDQoN
ClRoYW5rcywgVGhpZXJyeSENCg0KPiBSb2IsIEkgZG8gZ2V0IGEgY2hlY2twYXRjaC5wbCB3YXJu
aW5nIGZvciB0aGlzIG5ldyBjb21wYXRpYmxlIHN0cmluZywNCj4gYnV0IEknbSBub3Qgc3VyZSB0
aGVyZSdzIGFueXRoaW5nIGVhc3kgdGhhdCBjb3VsZCBiZSBkb25lIGFib3V0IHRoaXMsDQo+IG90
aGVyIHRoYW4gcGVyaGFwcyBtYWtpbmcgY2hlY2twYXRjaC5wbCBhd2FyZSBvZiB0aGUgc3BlY2lh
bCBVU0IgKGFuZA0KPiBwb3RlbnRpYWxseSBQQ0kpIGNvbXBhdGlibGUgc3RyaW5ncyBhcyB3ZWxs
Lg0KPiAtLS0NCj4gwqBhcmNoL2FybS9ib290L2R0cy90ZWdyYTIwLWNvbGlicmkuZHRzaSB8IDEg
Kw0KPiDCoGFyY2gvYXJtL2Jvb3QvZHRzL3RlZ3JhMzAtY29saWJyaS5kdHNpIHwgMSArDQo+IMKg
MiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNo
L2FybS9ib290L2R0cy90ZWdyYTIwLWNvbGlicmkuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL3Rl
Z3JhMjAtY29saWJyaS5kdHNpDQo+IGluZGV4IDIzNTBmZGEzYmU2YS4uYzVjNDAxZWRkMGJmIDEw
MDY0NA0KPiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy90ZWdyYTIwLWNvbGlicmkuZHRzaQ0KPiAr
KysgYi9hcmNoL2FybS9ib290L2R0cy90ZWdyYTIwLWNvbGlicmkuZHRzaQ0KPiBAQCAtNjg5LDYg
KzY4OSw3IEBAIHVzYkBjNTAwNDAwMCB7DQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgI3NpemUtY2VsbHMgPSA8MD47DQo+IMKgDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgYXNpeEAxIHsNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBjb21wYXRpYmxlID0gInVzYmI5NSw3NzJiIjsNCj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmVnID0gPDE+Ow0KPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBsb2NhbC1tYWMtYWRkcmVzcyA9IFsw
MCAwMCAwMCAwMCAwMCAwMF07DQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfTsN
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3RlZ3JhMzAtY29saWJyaS5kdHNpIGIv
YXJjaC9hcm0vYm9vdC9kdHMvdGVncmEzMC1jb2xpYnJpLmR0c2kNCj4gaW5kZXggZTg5YjRlNWEy
MzhkLi40MzYxYjkzZDA5MzQgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3RlZ3Jh
MzAtY29saWJyaS5kdHNpDQo+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3RlZ3JhMzAtY29saWJy
aS5kdHNpDQo+IEBAIC05NTAsNiArOTUwLDcgQEAgdXNiQDdkMDA0MDAwIHsNCj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAjc2l6ZS1jZWxscyA9IDwwPjsNCj4gwqANCj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBhc2l4QDEgew0KPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNvbXBhdGlibGUgPSAidXNiYjk1LDc3MmIiOw0K
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZWcgPSA8
MT47DQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGxv
Y2FsLW1hYy1hZGRyZXNzID0gWzAwIDAwIDAwIDAwIDAwIDAwXTsNCj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqB9Ow0K
