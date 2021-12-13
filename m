Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35F5DC433F5
	for <linux-tegra@archiver.kernel.org>; Mon, 13 Dec 2021 06:23:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232157AbhLMGXC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 13 Dec 2021 01:23:02 -0500
Received: from mail-eopbgr10066.outbound.protection.outlook.com ([40.107.1.66]:31747
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232177AbhLMGXB (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 13 Dec 2021 01:23:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f14cMUiaAK5RBHf8c1/4CgOJLu0+sToni5SeOJSrbla2ZUJzn0JJPP1p9+VLLFm/em+vMdPBNmoJn5MGiiIvl+l7aoKA4MziotRyIdTz36QzGK2e6gohjU6VIqGhpck1FwH7xkj8tvC9EO9uaOEFqhqlk2UxwPR4G+JXxoT0NkIiDeEN0f8BkpRRwMvLjRP8SM5xjhc45WzQTzcdgx+luOtKaUHwlVxikRcgthVRFuQLJ4gfnqI0/7P9/GBoQkpo7OlPdFzQIY10zGkHLh7l08VbpT1RdtdEMFVeOvacCLz3LHojPi4Ezdsf+A195lt0uXxfoIMY4JOgc/Opnn0fTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mH9BJXdATG7cH7wMO65gLyDy8U7mBPOk/vKBI9mh0yI=;
 b=iZq6GJgKQTbKBLSC+dRhQEmId2PKiq0fkFYYaZTnp679l671qgMF9M6F4gZncabrWTcKdUQCfa6hSquztORMDg09WS7HsLTANU0ZHJ3iebC/HNVw8qLkx6zBTBsREetoYtNnCu7QRYCF8uG2p3W2o2QtCYtG0vQfZtntZZIPf9fqodzu082FwuslFZOKjRF3ipuWmxC/EFR4PcfjmL5w+EKczUpEFyXN3IFBbTo2jY+fRGG62V88kdVTwSnAfIwvDytBYndLlds2Aqt3YVy8JCyZaPn6iGAVtpVDlm0gW4UIzZLUixjNjistn1fLp/LCsBvaiUMAiJiKShh6HpoROw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mH9BJXdATG7cH7wMO65gLyDy8U7mBPOk/vKBI9mh0yI=;
 b=Ecw4zf1fszXhEhjSWgIxLESaz3Zr8FS3Jq+RBFN9cuaDBCHkfdrBnKz770Zupv295j7+cVlG8HtDM74STwTB3Z+BTtA2Zjjok2AQmWJH4+In/uYrmt8IusWMAjZ13ITmEwui4gl8N82PMrm1qgEcUa6EhO98huAV9pVvuQCMz5c=
Received: from DB8PR04MB6795.eurprd04.prod.outlook.com (2603:10a6:10:fa::15)
 by DB9PR04MB8202.eurprd04.prod.outlook.com (2603:10a6:10:24f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Mon, 13 Dec
 2021 06:22:56 +0000
Received: from DB8PR04MB6795.eurprd04.prod.outlook.com
 ([fe80::c005:8cdc:9d35:4079]) by DB8PR04MB6795.eurprd04.prod.outlook.com
 ([fe80::c005:8cdc:9d35:4079%5]) with mapi id 15.20.4778.017; Mon, 13 Dec 2021
 06:22:52 +0000
From:   Joakim Zhang <qiangqing.zhang@nxp.com>
To:     Xiaoliang Yang <xiaoliang.yang_1@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Xiaoliang Yang <xiaoliang.yang_1@nxp.com>
Subject: RE: [PATCH v2] arm64: dts: imx8mp-evk: configure multiple queues on
 eqos
Thread-Topic: [PATCH v2] arm64: dts: imx8mp-evk: configure multiple queues on
 eqos
Thread-Index: AQHX79qumLTPhBwpzEyFfhzQR6YRPawv89EQ
Date:   Mon, 13 Dec 2021 06:22:52 +0000
Message-ID: <DB8PR04MB679557768B59DC4EC77DC8A1E6749@DB8PR04MB6795.eurprd04.prod.outlook.com>
References: <20211213044546.9903-1-xiaoliang.yang_1@nxp.com>
In-Reply-To: <20211213044546.9903-1-xiaoliang.yang_1@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 759f5674-d9df-47df-4e43-08d9be00fe58
x-ms-traffictypediagnostic: DB9PR04MB8202:EE_
x-microsoft-antispam-prvs: <DB9PR04MB820237CD2B8E207086D48A82E6749@DB9PR04MB8202.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3C9EPPdT3Az20Rkxu+lxOqBRPMviO7LszSaDKQO8Ay6RiCnEue5npY6HFclfVwprTB9BPJC3QK2n+E215nH50ovbMrXUWOPAQ0cUKC+ORTMvGprvXbbqkO02bxZ5sUJFXEPclZOT32vcph+p/0sG/GiWFv2W3JbLcS/w+ZcD6RUbxD+CEHdXuUT6FiaYn50+oM8Cyr1uVrdisTRvEkp+wuMst0r0NJdjNDu95G2M0EOlpRY1z24hY4c/kiEUdJL1LRf4oTO8F8TRYqzHd+puVziUzRaEpmBUPXx7iqYJFS/NL9sD9YOzn5/g3XxsQswhPBz4PISqy0PjECjssijxlDHoB5L415KvjtQJjbRWgG+otLFPmu/Yf+fBJBb3q5oh9QbAGX/d4Fje5GxroUBkvsjqJs7UJciv61Qae4u83ecOUPZ8hUd20ClFHyxB9xnHSGkpRlHWCLWTzFRvGlPYz2ilf/g8NqTl4TlR5zaZDiV79TVqJdJ5NCxim2wZKQtP6oZJV54Hm1P/cHo3uBUPuv41AslNrayXmctFYbYZ0RFfsvK+qbALh3TxJZ2Sg+zHfFETe5JokrHAYHexKW1915u+twR655WE6jGEJPHTYXIzGfq0piNpyLhkGxFEWui/QulVn+HmVO6adq4IrIGEc/XYipgzQgrb0P1tMBpudCeBd9KZ9eO2FwumM1oRwTsaghXkpGV11X2RJZe3IODSGUPN7TGhYr+fwb/lGWMk1vs=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6795.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(122000001)(5660300002)(508600001)(7696005)(6506007)(186003)(86362001)(53546011)(71200400001)(83380400001)(8676002)(38100700002)(26005)(38070700005)(54906003)(2906002)(55016003)(110136005)(66446008)(33656002)(316002)(4326008)(64756008)(9686003)(52536014)(66556008)(66476007)(76116006)(66946007)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?TzJZdVBZL2JENkZ1c05KZ1FiTkhyU21YOFY0QnhzSWcrSDE5M3NkRWZ6ZWlr?=
 =?gb2312?B?bitCK2hsQUYwSFZBRzBJL3Q1U3lRS0lSM2VpRXM3T3BhelFhRW9LaGphSWZY?=
 =?gb2312?B?RllxMG5qRXRMQVFjc3owN1p6WU1FcTcxZGxyOVF1L3VkSGN3ajhqSno1Zzhn?=
 =?gb2312?B?eEhPcGVpR3E0UzVoRktVWEpCSmkzMTZJY2wyNVZzeFl4R2E1NFZxU1o0NUVp?=
 =?gb2312?B?aTRXbWwveTEyblVYOFMxRzRMbktXK3d6VXJJS3NVUkN5bk1JSmlEajFkb0FX?=
 =?gb2312?B?OUJtYkdiWEtlSFJ4R0tNS21XRm9OaFpIZzBYSEVzY0hBUmhGL2htRkVWSUkz?=
 =?gb2312?B?ZTNCOENZT3hqOG5PZGJMTlNlTWhGN21KUVQyVjZKK3h1V3ltdDNMQmtHOEEy?=
 =?gb2312?B?MnZhNU9hRk9TMnpWZytBS1VqUnNIcVR6UlNVd1Azb1dWSTNlcUtGZWtyM0tB?=
 =?gb2312?B?ZWVZYXlWQnhBMGNKZ3ZNc2tuWTFuR3E3WlNwSFJVVTJPMElPY0sxdXpiZU9q?=
 =?gb2312?B?RU1ZS3hVZWwwUzRWN3hOeGxjSmtSSDBUSkdZQ2Y5UlQxNTVCcGtJeG5GL3Uz?=
 =?gb2312?B?b3lJLzFFUWFZN2hMOWx5N05KODE4YU1wekdjU1ZmMVB1SEhnTTlxZzVtWVhH?=
 =?gb2312?B?Rm1LTThjZG83Skwwcm5GNThLRU8vQkwza3NQcHNIZzR1QWoySG91ek96YnJT?=
 =?gb2312?B?eUNIRjdOVW96eG93NEx6V0IwVElxSVdsNlpuWHNLQmhraGpST3Z4ZjBEV3lj?=
 =?gb2312?B?dlNBRmdhRDhLaTU4a3ZzeU4xQjBrOStlaS9jMi9JVFJBQWoxbEZvQnY1QmNZ?=
 =?gb2312?B?dXBOTVRsdnhtbndqa3ozdGJYQTBMK3orZzFqTk1DWURMTk1QclpwU0tQQUo1?=
 =?gb2312?B?QVRBQmhFcEROazBibERncEkrVWp2WkIzeGdXUWdhbXVTSzVsTHNPd1NsVURa?=
 =?gb2312?B?dFJhMlZmSlFhK1hQMVUrV2NVTnI4ZDllOGpVM1UwOSt1WTNyZFlwakNhVHky?=
 =?gb2312?B?MFNYVGtBemxoVUlacWs0dmNnR2F1cFcwT3B0ZjN6c05wbXFsbDFkeW5JNUFQ?=
 =?gb2312?B?RHp1Vy9qRE9aZjFVaWE2aEJQYlA4YVVoMDJYZkhxODJrWkxTUWI4ZGF1SzhC?=
 =?gb2312?B?bVl6WHFSVE5nTVQvN0ZHdFVlSHpveWg0aFFnQ00vZXQrd2hpZDRScWExVXlt?=
 =?gb2312?B?WFdIQ2dlaWlVQWpJeTZtRDBZRjNBSTdJQWc4RURWT1REbWtPcWxlbUhQSXpV?=
 =?gb2312?B?T1JRM1hMQ0drU01iempkYjVXN0tBS2pJWjdrQnRuUDVGdDhXRlB6NjlEMlJB?=
 =?gb2312?B?OFRyNEl0ZjJGM0xlYnRuRHRETXNMOHNLclJlbytraDlOanZkRzNtTDYwcFps?=
 =?gb2312?B?d3JZZ0ZobnVFcmFrMkRIQ3ZFaU5LR1hIRkNpb0hDTnpzbWpadXJDQjE5ZWlO?=
 =?gb2312?B?aU8wdFUybzVSN2FGRFl4Wmx2QXN0Y2UvSlVUdzdoYUFXQ2g0SCtCSEFoTzZI?=
 =?gb2312?B?UG1scExUektTRW9MRXFMYVdHd20vV1hDOHQrY1ZRYUljUkVPVUtjOWFBU1Bi?=
 =?gb2312?B?UWdWVGJ3RkovY3R2K1BJK2ZtZWtKZURPSG1jK0V0SDVPTWkyTGFNbW1TbkF0?=
 =?gb2312?B?a09nMjZmbWQ0OTRHRkoyeEY4RVpzclZ1SUZqOFdQdlJwN0plR1NteDdxTTVY?=
 =?gb2312?B?RUl1ODVvRkdPOFhUSkNQTVJ3cTZQQzIwOExCWHBkeTJ6WHY1TlpDcVhSS2Yw?=
 =?gb2312?B?Zm9aVDdiUEFCdUxPUDBRZGN5bnVkUkRxV05IT3J2bTB4QTIxUVV4Vkc2aDN6?=
 =?gb2312?B?elNZdEQzYndtektWV25lSDd1b1gwNm0xa1NiM1hVd1JKb0F5dnVjSFRPQ214?=
 =?gb2312?B?SEpKUWhTM2NkQlFnc0w3aEsrcmpkYXA5RlBwL3p1cUZUVkdpZHorL0k4cW84?=
 =?gb2312?B?c09taWI2bmtibndnVkNYaGtuaTExNk04dS8zS3FuMDV1Y29tbGJIM3NKVUJ1?=
 =?gb2312?B?WHBoVW5EL0VjNUpqWmRhTG8wa05ic09tNXA2WTMyQXZUVFlRd2paMmQrN0tZ?=
 =?gb2312?B?YXBlSHR2NDNwb0lMY2tyYVBDODhxczRPUXJhVjN5dWtpS00xV24vY3AwOTcv?=
 =?gb2312?B?aFhCTTRjM3pKRVFoakdnMVZkaWNqeFY4UHNBU2k0UVdKWEFuMkxtYnh5cHZ2?=
 =?gb2312?B?Mnc9PQ==?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6795.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 759f5674-d9df-47df-4e43-08d9be00fe58
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2021 06:22:52.4580
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EoO1Kezq4DpmoB0Cj9AuDwBx1O8adMGMYi2pyDr5fd13SYuKRriYW92xpvSEV5Escji4iL+uQMHrjj+kwOy7Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8202
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFhpYW9saWFuZyBZYW5nIDx4
aWFvbGlhbmcueWFuZ18xQG54cC5jb20+DQo+IFNlbnQ6IDIwMjHE6jEy1MIxM8jVIDEyOjQ2DQo+
IFRvOiByb2JoK2R0QGtlcm5lbC5vcmc7IHNoYXduZ3VvQGtlcm5lbC5vcmc7IHMuaGF1ZXJAcGVu
Z3V0cm9uaXguZGU7DQo+IGZlc3RldmFtQGdtYWlsLmNvbQ0KPiBDYzogbGludXgtYXJtLWtlcm5l
bEBsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eC10ZWdyYUB2Z2VyLmtlcm5lbC5vcmc7DQo+IGRs
LWxpbnV4LWlteCA8bGludXgtaW14QG54cC5jb20+OyBrZXJuZWxAcGVuZ3V0cm9uaXguZGU7DQo+
IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBKb2FraW0gWmhhbmcgPHFpYW5ncWluZy56aGFu
Z0BueHAuY29tPjsNCj4gWGlhb2xpYW5nIFlhbmcgPHhpYW9saWFuZy55YW5nXzFAbnhwLmNvbT4N
Cj4gU3ViamVjdDogW1BBVENIIHYyXSBhcm02NDogZHRzOiBpbXg4bXAtZXZrOiBjb25maWd1cmUg
bXVsdGlwbGUgcXVldWVzIG9uDQo+IGVxb3MNCj4gDQo+IEVxb3MgZXRoZXJuZXQgc3VwcG9ydCBm
aXZlIHF1ZXVlcyBvbiBoYXJkd2FyZSwgZW5hYmxlIHRoZXNlIHF1ZXVlcyBhbmQNCj4gY29uZmln
dXJlIHRoZSBwcmlvcml0eSBvZiBlYWNoIHF1ZXVlLiBVc2VzIFN0cmljdCBQcmlvcml0eSBhcyBz
Y2hlZHVsaW5nDQo+IGFsZ29yaXRobXMgdG8gZW5zdXJlIHRoYXQgdGhlIFRTTiBmdW5jdGlvbiB3
b3Jrcy4NCj4gDQo+IFRoZSBwcmlvcml0eSBvZiBlYWNoIHF1ZXVlIGlzIGEgYml0bWFzayB2YWx1
ZSB0aGF0IG1hcHMgVkxBTiB0YWcgcHJpb3JpdHkgdG8NCj4gdGhlIHF1ZXVlLiBTaW5jZSB0aGUg
aGFyZHdhcmUgb25seSBzdXBwb3J0cyBmaXZlIHF1ZXVlcywgdGhpcyBwYXRjaCBtYXBzDQo+IHBy
aW9yaXR5IDAtNCB0byBxdWV1ZXMgb25lIGJ5IG9uZSwgYW5kIHByaW9yaXR5IDUtNyB0byBxdWV1
ZSA0Lg0KPiANCj4gVGhlIHRvdGFsIGZpZm8gc2l6ZSBvZiA1IHF1ZXVlcyBpcyA4MTkyIGJ5dGVz
LCBpZiBlbmFibGUgNSBxdWV1ZXMgd2l0aA0KPiBzdG9yZS1hbmQtZm9yd2FyZCBtb2RlLCBpdCdz
IG5vdCBlbm91Z2ggZm9yIGxhcmdlIHBhY2tldHMsIHdoaWNoIHdvdWxkDQo+IHRyaWdnZXIgZmlm
byBvdmVyZmxvdyBmcmVxdWVudGx5LiBUaGlzIHBhdGNoIHNldCBETUEgdG8gdGhyZXNoIG1vZGUg
dG8NCj4gZW5hYmxlIGFsbCA1IHF1ZXVlcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFhpYW9saWFu
ZyBZYW5nIDx4aWFvbGlhbmcueWFuZ18xQG54cC5jb20+DQo+IC0tLQ0KDQpSZXZpZXdlZC1ieTog
Sm9ha2ltIFpoYW5nIDxxaWFuZ3FpbmcuemhhbmdAbnhwLmNvbT4NCg0KQmVzdCBSZWdhcmRzLA0K
Sm9ha2ltIFpoYW5nDQo+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4bXAtZXZr
LmR0cyB8IDU3DQo+ICsrKysrKysrKysrKysrKysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgNTcg
aW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJl
ZXNjYWxlL2lteDhtcC1ldmsuZHRzDQo+IGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUv
aW14OG1wLWV2ay5kdHMNCj4gaW5kZXggN2I5OWZhZDZlNGQ2Li5lNGM2OTU5NGYwNjcgMTAwNjQ0
DQo+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhtcC1ldmsuZHRzDQo+
ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhtcC1ldmsuZHRzDQo+IEBA
IC04Niw2ICs4Niw5IEBADQo+ICAJcGluY3RybC0wID0gPCZwaW5jdHJsX2Vxb3M+Ow0KPiAgCXBo
eS1tb2RlID0gInJnbWlpLWlkIjsNCj4gIAlwaHktaGFuZGxlID0gPCZldGhwaHkwPjsNCj4gKwlz
bnBzLGZvcmNlX3RocmVzaF9kbWFfbW9kZTsNCj4gKwlzbnBzLG10bC10eC1jb25maWcgPSA8Jm10
bF90eF9zZXR1cD47DQo+ICsJc25wcyxtdGwtcngtY29uZmlnID0gPCZtdGxfcnhfc2V0dXA+Ow0K
PiAgCXN0YXR1cyA9ICJva2F5IjsNCj4gDQo+ICAJbWRpbyB7DQo+IEBAIC05OSw2ICsxMDIsNjAg
QEANCj4gIAkJCWVlZS1icm9rZW4tMTAwMHQ7DQo+ICAJCX07DQo+ICAJfTsNCj4gKw0KPiArCW10
bF90eF9zZXR1cDogdHgtcXVldWVzLWNvbmZpZyB7DQo+ICsJCXNucHMsdHgtcXVldWVzLXRvLXVz
ZSA9IDw1PjsNCj4gKwkJc25wcyx0eC1zY2hlZC1zcDsNCj4gKwkJcXVldWUwIHsNCj4gKwkJCXNu
cHMsZGNiLWFsZ29yaXRobTsNCj4gKwkJCXNucHMscHJpb3JpdHkgPSA8MHgxPjsNCj4gKwkJfTsN
Cj4gKwkJcXVldWUxIHsNCj4gKwkJCXNucHMsZGNiLWFsZ29yaXRobTsNCj4gKwkJCXNucHMscHJp
b3JpdHkgPSA8MHgyPjsNCj4gKwkJfTsNCj4gKwkJcXVldWUyIHsNCj4gKwkJCXNucHMsZGNiLWFs
Z29yaXRobTsNCj4gKwkJCXNucHMscHJpb3JpdHkgPSA8MHg0PjsNCj4gKwkJfTsNCj4gKwkJcXVl
dWUzIHsNCj4gKwkJCXNucHMsZGNiLWFsZ29yaXRobTsNCj4gKwkJCXNucHMscHJpb3JpdHkgPSA8
MHg4PjsNCj4gKwkJfTsNCj4gKwkJcXVldWU0IHsNCj4gKwkJCXNucHMsZGNiLWFsZ29yaXRobTsN
Cj4gKwkJCXNucHMscHJpb3JpdHkgPSA8MHhmMD47DQo+ICsJCX07DQo+ICsJfTsNCj4gKwltdGxf
cnhfc2V0dXA6IHJ4LXF1ZXVlcy1jb25maWcgew0KPiArCQlzbnBzLHJ4LXF1ZXVlcy10by11c2Ug
PSA8NT47DQo+ICsJCXNucHMscngtc2NoZWQtc3A7DQo+ICsJCXF1ZXVlMCB7DQo+ICsJCQlzbnBz
LGRjYi1hbGdvcml0aG07DQo+ICsJCQlzbnBzLHByaW9yaXR5ID0gPDB4MT47DQo+ICsJCQlzbnBz
LG1hcC10by1kbWEtY2hhbm5lbCA9IDwwPjsNCj4gKwkJfTsNCj4gKwkJcXVldWUxIHsNCj4gKwkJ
CXNucHMsZGNiLWFsZ29yaXRobTsNCj4gKwkJCXNucHMscHJpb3JpdHkgPSA8MHgyPjsNCj4gKwkJ
CXNucHMsbWFwLXRvLWRtYS1jaGFubmVsID0gPDE+Ow0KPiArCQl9Ow0KPiArCQlxdWV1ZTIgew0K
PiArCQkJc25wcyxkY2ItYWxnb3JpdGhtOw0KPiArCQkJc25wcyxwcmlvcml0eSA9IDwweDQ+Ow0K
PiArCQkJc25wcyxtYXAtdG8tZG1hLWNoYW5uZWwgPSA8Mj47DQo+ICsJCX07DQo+ICsJCXF1ZXVl
MyB7DQo+ICsJCQlzbnBzLGRjYi1hbGdvcml0aG07DQo+ICsJCQlzbnBzLHByaW9yaXR5ID0gPDB4
OD47DQo+ICsJCQlzbnBzLG1hcC10by1kbWEtY2hhbm5lbCA9IDwzPjsNCj4gKwkJfTsNCj4gKwkJ
cXVldWU0IHsNCj4gKwkJCXNucHMsZGNiLWFsZ29yaXRobTsNCj4gKwkJCXNucHMscHJpb3JpdHkg
PSA8MHhmMD47DQo+ICsJCQlzbnBzLG1hcC10by1kbWEtY2hhbm5lbCA9IDw0PjsNCj4gKwkJfTsN
Cj4gKwl9Ow0KPiAgfTsNCj4gDQo+ICAmZmVjIHsNCj4gLS0NCj4gMi4xNy4xDQoNCg==
