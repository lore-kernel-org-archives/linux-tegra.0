Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6196C4361B
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Dec 2020 09:33:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 45FA423102
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Dec 2020 09:33:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbgLPJdm (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 16 Dec 2020 04:33:42 -0500
Received: from mail-am6eur05on2075.outbound.protection.outlook.com ([40.107.22.75]:25312
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726274AbgLPJdm (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Dec 2020 04:33:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aBNKgAYahfKYlQxwUdrjtIH6vD9OEoYvyYNk4BBjojh8jTM/QlObZa/wh8D0t4iZAXMQjVaRUydP9dqUoio1BxrhzH6AQiGzVsToG9sVNEGf2WDgz/zUpbWBs1DEZWtx7KJKwSj1lF9xIDSYoIBocvMbvUotB2JtOLG6u8PgLuWMYZBS/MGQ+0CFc34UqwwTDpkefcdUqgBSfMCcBmta5EYT1QdQtGuBDe2pm1WcF001RbY2YkQ8y5iuc4jZROg32y1+T/17AWZW2EhlfLuhG//xKV06IhALfQyy3+kw+53BM9qy/QjgEPJVPlTiWQmKeZN7LcvT1jjGMELedUSKUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PV9Jo13SA7L/Fd0VZ2ExtSdnCry5qjRPx9D3ymtCXXs=;
 b=hDf5XpMhlZ1Opn7TofYRuTpPeA6zhSoBn5DZMYeoF4octkI2fcB1VvIKV+kDccIjmBbSnlaEM7Erj6xMCEkpRfPmkvU1OdDGVBMKa3bIxWeXD4hTINU69qyaAkNZx1tuMNV0gPD07sRRLH4ixyvvP59FtNImL2ptU0J6Q1XpPSimtHF+vOT1v6LtcIG107kC/akEvM+YIh/+UTezzdmJZ/QJwALiBUer419K4Mjnufl2cM4YrC6TXIoYTwxV6Ow02gNM1obzIrmP1G23x1T7ZT2/vTn2+m15EWWM8wG8z7pX1Uu3BCzg6WzlFVDwRy/pWw8j2mLy0cWja7fL8FmLxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PV9Jo13SA7L/Fd0VZ2ExtSdnCry5qjRPx9D3ymtCXXs=;
 b=Evg+K3yy9e1ZMwuZUWan5UnW+W/q67uV+2r+mJuRzUzGkPd8XGDmvUyk6r6TU6/UaSpWs9IWFLLtyrQQSoALupGcP3RWlJjOzcYdUR4ByyfRjfEJFz3fE189rmYUcxopw/1Eq1BTMeJJMqhDNMy/NC3HVwVPnyNP/8nORIkVMu8=
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com (2603:10a6:10:1ec::9)
 by DB6PR0402MB2935.eurprd04.prod.outlook.com (2603:10a6:4:9d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.21; Wed, 16 Dec
 2020 09:32:51 +0000
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c]) by DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c%5]) with mapi id 15.20.3654.026; Wed, 16 Dec 2020
 09:32:50 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Dmitry Osipenko <digetx@gmail.com>
CC:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Felipe Balbi <balbi@kernel.org>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Peter Geis <pgwipeout@gmail.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v1 5/8] usb: chipidea: tegra: Support host mode
Thread-Topic: [PATCH v1 5/8] usb: chipidea: tegra: Support host mode
Thread-Index: AQHW0x/sFW0mzdxsYU6mrtKY3m6gWan5PTsAgAAyVACAAAFnQA==
Date:   Wed, 16 Dec 2020 09:32:50 +0000
Message-ID: <DBBPR04MB79794F5CC440279AF94A48448BC50@DBBPR04MB7979.eurprd04.prod.outlook.com>
References: <20201215202113.30394-1-digetx@gmail.com>
 <20201215202113.30394-6-digetx@gmail.com>
 <20201216060732.GB5595@b29397-desktop>
 <bb617167-e6a4-221e-5e3b-c9d7a1b50c87@gmail.com>
In-Reply-To: <bb617167-e6a4-221e-5e3b-c9d7a1b50c87@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f53cc5dc-92f3-4eb0-3879-08d8a1a58e7c
x-ms-traffictypediagnostic: DB6PR0402MB2935:
x-microsoft-antispam-prvs: <DB6PR0402MB2935D0104AB3B26049FC9CC58BC50@DB6PR0402MB2935.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6+pktbeE8I6ZUzV+n4L96mqg+4CXODYiXfpC02vtws558ezbsd391Y5p7+HCjmC/tw1jmUiXpU//YXi3Rtd+0Wb7UEzCp11wFzXmXtlE0N2vdPjTxSPKQC9SvbCPQxRjlPSjekspO/Xe+f/R1cusG5n/0Huhe43Jr+c2r5zUbTmeheAMEkuc2t32mR/A1Yg9RX8HYHFB2TEpBhP2+Mcr/j9CvNgYoKYG4SCfzOU5I5je+RU31EA2Sc8QptHypUXrze9E1rbc/0ny1gw9fJAdKTPyPuDZjBOA7Ote6T0yfKWAu43YLAXtxVPuQNUkTg8faAEYtb1jMTUNOFn1e8n6OA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7979.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(396003)(39860400002)(366004)(376002)(64756008)(66556008)(6506007)(8676002)(86362001)(66446008)(8936002)(33656002)(66476007)(71200400001)(26005)(7416002)(52536014)(44832011)(76116006)(6916009)(5660300002)(9686003)(186003)(316002)(66946007)(83380400001)(55016002)(2906002)(7696005)(4326008)(54906003)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?NE5VTlRrR2VMc1FLTVlzS1BGbTF6NklMOXVYVXhzbzVPNWZVZVlmR210UWx0?=
 =?utf-8?B?V2Ewb3BBeXl2MEVRdW9TNjkxb2hVWVgzc3lyZ1pzZm44QWUvMklGRUJrMTVG?=
 =?utf-8?B?cVUrTkpwNk9adjJseXJ0dGZkL3paaS9FTVpNWDRXY2V2VEQ5MVVRV2txMmdt?=
 =?utf-8?B?N0lSeHBRK3FnU2pFMHdhU3VMeDFGczB6YUxPaTJJeHhUY2xQcFByMXMyK2VV?=
 =?utf-8?B?aEFMcjREZmJ3eTVlYVllZGk5d012RytQekxBd3B1ZkRtWDl4dkFzTXNDT0No?=
 =?utf-8?B?YXNibkczZVNSY1VLb2IvMWdORmV5YkFNQlAzcFF2Wk16R0NEMC9raFN0Yk1h?=
 =?utf-8?B?RWYvOXhsTTRtdXkyTTB3WGhnZXkrM0RNdUF4TnN2NXIvZFY0LzJyK3BZV2tq?=
 =?utf-8?B?Snk4bUNJU05EOTNGdGE3aGZibitpbFlTWTN0WTlJakNKK1dvMTRiRnRXWFZL?=
 =?utf-8?B?NnAvRFgxVmpoalhnNDhqVG5pMWpuV3lUSlJMZU5wNWpoTFFqS0tqU2duMzVo?=
 =?utf-8?B?OHRvQ3hUVlY1Q1Bqc3FHc2kyMUpZWC9PamFDcWgxVE5IblVhRm10SHVCVk9m?=
 =?utf-8?B?dTZ2ZEgvQ1htTWtHYUZWQ3dCM3VuYU1RY2gxaGtlTjdQVXc3WDYrVXFoMUFC?=
 =?utf-8?B?MStBRit1NHYwbEpPRXVBY3BKS3UrSXNjYTA4cVVDSThzaDNISTBjWmNSNTJk?=
 =?utf-8?B?Q1ZZTUwwV1RNZWcxUllTZWRkNHNkdVhBcjZBMENPalg3bVZIQ3hTV28xMUNN?=
 =?utf-8?B?ZnQvSjkzcjhBSktHRUl4ZVIxRXFrM0NOWldPRUZXRzhOVHZCTkNZZWhGaWhK?=
 =?utf-8?B?ZkVibkZXcFNBeDY1dXlsQXdKa3grdm95S1VSdVNmN3Y1bm0wMmlvWkpwT2dT?=
 =?utf-8?B?Z0IvcGRlUU1Na0drYUFFaWhtL2tIWi9pTkRBM210bVE2NWU2MDJvbDgwTkNC?=
 =?utf-8?B?RUI1N1ZqMlBxSUp2dmEybkl2RnpEQk1LQWhnc2d0TXgrR3llckowTkRPM3Yv?=
 =?utf-8?B?R1U1MDQwNXF1NTJQaWp6aFo4b3VZYnJscjdjRDRIRldQVFVsZXo4ZUJ5RGZ3?=
 =?utf-8?B?WXFLR2NCTmszY1I5VEZjUGFKQWwyblIvY3c4OVAxWDlRN1FxdVo1aEFwcGg1?=
 =?utf-8?B?YS9TaVVadTNES2xoRS9qRkpJS3dYK0JMQmpzd2JPbnNGbHpEekM4ekh5T3JG?=
 =?utf-8?B?NUMzcjJhMW5xOUdaUUxGUHBqWkN4Zmt6R0ZRcndmeFliaU9XZnhiaGRTWWxj?=
 =?utf-8?B?djVxc0JvRWxLWFRReWgwYzV4TDJYdXlWTFFPNTFSL0pCTlRobG9mTkpLUUtJ?=
 =?utf-8?Q?PTrsSKzDd6KQs=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7979.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f53cc5dc-92f3-4eb0-3879-08d8a1a58e7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2020 09:32:50.4091
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +uCAe9xvNpcTFhEdyEWsJEw4TIGL7ixLvOzNITMVwzlW3+fEoxLVWWvg8+1V/qkpuf/ZySv2Dqv+FN+1eKFtRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2935
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

IA0KPiA+Pg0KPiA+PiAgc3RydWN0IHRlZ3JhX3VzYl9zb2NfaW5mbyB7DQo+ID4+ICAJdW5zaWdu
ZWQgbG9uZyBmbGFnczsNCj4gPj4gKwl1bnNpZ25lZCBpbnQgdHhmaWZvdGhyZXNoOw0KPiA+PiAr
CWVudW0gdXNiX2RyX21vZGUgZHJfbW9kZTsNCj4gPj4gK307DQo+ID4+ICsNCj4gPj4gK3N0YXRp
YyBjb25zdCBzdHJ1Y3QgdGVncmFfdXNiX3NvY19pbmZvIHRlZ3JhMjBfZWhjaV9zb2NfaW5mbyA9
IHsNCj4gPj4gKwkuZmxhZ3MgPSBDSV9IRFJDX1JFUVVJUkVTX0FMSUdORURfRE1BIHwNCj4gPj4g
KwkJIENJX0hEUkNfT1ZFUlJJREVfUEhZX0NPTlRST0wsDQo+ID4+ICsJLmRyX21vZGUgPSBVU0Jf
RFJfTU9ERV9IT1NULA0KPiA+PiArCS50eGZpZm90aHJlc2ggPSAxMCwNCj4gPj4gK307DQo+ID4+
ICsNCj4gPj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgdGVncmFfdXNiX3NvY19pbmZvIHRlZ3JhMzBf
ZWhjaV9zb2NfaW5mbyA9IHsNCj4gPj4gKwkuZmxhZ3MgPSBDSV9IRFJDX1JFUVVJUkVTX0FMSUdO
RURfRE1BIHwNCj4gPj4gKwkJIENJX0hEUkNfT1ZFUlJJREVfUEhZX0NPTlRST0wNCj4gPj4gKwku
ZHJfbW9kZSA9IFVTQl9EUl9NT0RFX0hPU1QsDQo+ID4+ICsJLnR4Zmlmb3RocmVzaCA9IDE2LA0K
PiA+PiAgfTsNCj4gPj4NCj4gPj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdGVncmFfdXNiX3NvY19p
bmZvIHRlZ3JhX3VkY19zb2NfaW5mbyA9IHsNCj4gPj4gLQkuZmxhZ3MgPSBDSV9IRFJDX1JFUVVJ
UkVTX0FMSUdORURfRE1BLA0KPiA+PiArCS5mbGFncyA9IENJX0hEUkNfUkVRVUlSRVNfQUxJR05F
RF9ETUEgfA0KPiA+PiArCQkgQ0lfSERSQ19PVkVSUklERV9QSFlfQ09OVFJPTCwNCj4gPj4gKwku
ZHJfbW9kZSA9IFVTQl9EUl9NT0RFX1VOS05PV04sDQo+ID4+ICB9Ow0KPiA+DQo+ID4gV2hhdCdz
IHRoZSB1c2FnZSBmb3IgdGhpcyBkcl9tb2RlPyBEb2VzIHRoZXNlIHRocmVlIFNvQ3Mgb25seSBz
dXBwb3J0cw0KPiA+IHNpbmdsZSBtb2RlLCBpdCB1c3VhbGx5IHNldHMgZHJfbW9kZSBhdCBib2Fy
ZCBkdHMgZmlsZSB0byBpbmRpY2F0ZSBVU0INCj4gPiByb2xlIGZvciB0aGlzIGJvYXJkLg0KPiAN
Cj4gQWxsIFRlZ3JhIFNvQ3MgaGF2ZSB0aHJlZSBVU0IgY29udHJvbGxlcnMuICBPbmx5IG9uZSBv
ZiB0aGVzZSB0aHJlZSBjb250cm9sbGVycw0KPiBzdXBwb3J0cyBwZXJpcGhlcmFsIC8gT1RHIG1v
ZGVzLCB0aGUgb3RoZXIgdHdvIGNvbnRyb2xsZXJzIGFyZSBmaXhlZCB0byB0aGUNCj4gaG9zdCBt
b2RlIGFuZCBkZXZpY2UgdHJlZXMgZG8gbm90IHNwZWNpZnkgdGhlIGRyX21vZGUgZm9yIHRoZSBo
b3N0DQo+IGNvbnRyb2xsZXJzLg0KPiANCj4gSGVuY2Ugd2UgbmVlZCB0byBlbmZvcmNlIHRoZSBk
cl9tb2RlPWhvc3QgZm9yIHRoZSBob3N0LW1vZGUgY29udHJvbGxlcnMuDQo+IA0KPiBGb3IgVURD
IHRoZSBkZWZhdWx0IG1vZGUgaXMgInVua25vd24iIGJlY2F1c2UgYWN0dWFsIG1vZGUgY29tZXMg
ZnJvbSBhDQo+IGJvYXJkJ3MgZGV2aWNlIHRyZWUuDQo+IA0KDQpZb3UgY291bGQgYWRkIGRyX21v
ZGUgcHJvcGVydHkgYXQgdXNiIG5vZGUgb2Ygc29jLmR0c2kgdG8gZnVsZmlsbCB0aGF0Lg0KDQo+
ID4+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCB0ZWdyYV91c2Jfb2ZfbWF0Y2hb
XSA9IHsNCj4gPj4gIAl7DQo+ID4+ICsJCS5jb21wYXRpYmxlID0gIm52aWRpYSx0ZWdyYTIwLWVo
Y2kiLA0KPiA+PiArCQkuZGF0YSA9ICZ0ZWdyYTIwX2VoY2lfc29jX2luZm8sDQo+ID4+ICsJfSwg
ew0KPiA+PiArCQkuY29tcGF0aWJsZSA9ICJudmlkaWEsdGVncmEzMC1laGNpIiwNCj4gPj4gKwkJ
LmRhdGEgPSAmdGVncmEzMF9laGNpX3NvY19pbmZvLA0KPiA+PiArCX0sIHsNCj4gPj4gIAkJLmNv
bXBhdGlibGUgPSAibnZpZGlhLHRlZ3JhMjAtdWRjIiwNCj4gPj4gIAkJLmRhdGEgPSAmdGVncmFf
dWRjX3NvY19pbmZvLA0KPiA+DQo+ID4gWW91ciBjb21wYXRpYmxlIGluZGljYXRlcyB0aGlzIGNv
bnRyb2xsZXIgaXMgc2luZ2xlIFVTQiByb2xlLCBpcyBpdCBvbg0KPiA+IHB1cnBvc2U/DQo+IA0K
PiBZZXMsIHRoZSAidGVncmEyMC8zMC1laGNpIiBjb250cm9sbGVycyBhcmUgZml4ZWQgdG8gdGhl
IGhvc3QtbW9kZSBpbiBoYXJkd2FyZS4NCj4gDQo+IC4uLg0KPiA+PiArc3RhdGljIGludCB0ZWdy
YV91c2JfaW50ZXJuYWxfcG9ydF9yZXNldChzdHJ1Y3QgZWhjaV9oY2QgKmVoY2ksDQo+ID4+ICsJ
CQkJCSB1MzIgX19pb21lbSAqcG9ydHNjX3JlZywNCj4gPj4gKwkJCQkJIHVuc2lnbmVkIGxvbmcg
KmZsYWdzKQ0KPiA+PiArew0KPiA+PiArCXUzMiBzYXZlZF91c2JpbnRyLCB0ZW1wOw0KPiA+PiAr
CXVuc2lnbmVkIGludCBpLCB0cmllczsNCj4gPj4gKwlpbnQgcmV0dmFsID0gMDsNCj4gPj4gKw0K
PiA+PiArCXNhdmVkX3VzYmludHIgPSBlaGNpX3JlYWRsKGVoY2ksICZlaGNpLT5yZWdzLT5pbnRy
X2VuYWJsZSk7DQo+ID4+ICsJLyogZGlzYWJsZSBVU0IgaW50ZXJydXB0ICovDQo+ID4+ICsJZWhj
aV93cml0ZWwoZWhjaSwgMCwgJmVoY2ktPnJlZ3MtPmludHJfZW5hYmxlKTsNCj4gPj4gKwlzcGlu
X3VubG9ja19pcnFyZXN0b3JlKCZlaGNpLT5sb2NrLCAqZmxhZ3MpOw0KPiA+PiArDQo+ID4+ICsJ
LyoNCj4gPj4gKwkgKiBIZXJlIHdlIGhhdmUgdG8gZG8gUG9ydCBSZXNldCBhdCBtb3N0IHR3aWNl
IGZvcg0KPiA+PiArCSAqIFBvcnQgRW5hYmxlIGJpdCB0byBiZSBzZXQuDQo+ID4+ICsJICovDQo+
ID4+ICsJZm9yIChpID0gMDsgaSA8IDI7IGkrKykgew0KPiA+PiArCQl0ZW1wID0gZWhjaV9yZWFk
bChlaGNpLCBwb3J0c2NfcmVnKTsNCj4gPj4gKwkJdGVtcCB8PSBQT1JUX1JFU0VUOw0KPiA+PiAr
CQllaGNpX3dyaXRlbChlaGNpLCB0ZW1wLCBwb3J0c2NfcmVnKTsNCj4gPj4gKwkJbWRlbGF5KDEw
KTsNCj4gPg0KPiA+IE5lZWRzIGFjY3VyYXRlIGRlbGF5PyBIb3cgYWJvdXQgdXNsZWVwX3Jhbmdl
Pw0KPiANCj4gVG8gYmUgaG9uZXMgSSBkb24ndCBrbm93IGZvciBzdXJlIHdoZXRoZXIgaHViX2Nv
bnRyb2woKSBjb3VsZCBiZSB1c2VkIGZyb20NCj4gaW50ZXJydXB0IGNvbnRleHQuICBUaGlzIG1k
ZWxheSBpcyBib3Jyb3dlZCBmcm9tIHRoZSBvbGRlciBlaGNpLXRlZ3JhIGRyaXZlci4NCj4gDQo+
IEFyZSB5b3Ugc3VnZ2VzdGluZyB0aGF0IGl0IHNob3VsZCBiZSBzYWZlIHRvIHNsZWVwIGhlcmU/
DQo+IA0KDQpJIHNlZSBtc2xlZXAgaXMgY2FsbGVkIGF0IHRlZ3JhX2VoY2lfaHViX2NvbnRyb2wg
YXQgZWhjaS10ZWdyYS5jLg0KLmh1Yl9jb250cm9sIGlzIG5vdCBjYWxsZWQgYXQgaW50ZXJydXB0
IGNvbnRleHQuDQoNCj4gLi4uDQo+ID4+ICBzdGF0aWMgaW50IHRlZ3JhX3VzYl9wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KSAgew0KPiA+PiAgCWNvbnN0IHN0cnVjdCB0ZWdyYV91
c2Jfc29jX2luZm8gKnNvYzsgQEAgLTgzLDI0ICsyOTIsNDkgQEANCj4gc3RhdGljDQo+ID4+IGlu
dCB0ZWdyYV91c2JfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPj4gIAkJ
cmV0dXJuIGVycjsNCj4gPj4gIAl9DQo+ID4+DQo+ID4+ICsJaWYgKGRldmljZV9wcm9wZXJ0eV9w
cmVzZW50KCZwZGV2LT5kZXYsICJudmlkaWEsbmVlZHMtZG91YmxlLXJlc2V0IikpDQo+ID4+ICsJ
CXVzYi0+bmVlZHNfZG91YmxlX3Jlc2V0ID0gdHJ1ZTsNCj4gPj4gKw0KPiA+PiArCWVyciA9IHRl
Z3JhX3VzYl9yZXNldF9jb250cm9sbGVyKCZwZGV2LT5kZXYpOw0KPiA+PiArCWlmIChlcnIpIHsN
Cj4gPj4gKwkJZGV2X2VycigmcGRldi0+ZGV2LCAiZmFpbGVkIHRvIHJlc2V0IGNvbnRyb2xsZXI6
ICVkXG4iLCBlcnIpOw0KPiA+PiArCQlnb3RvIGZhaWxfcG93ZXJfb2ZmOw0KPiA+PiArCX0NCj4g
Pj4gKw0KPiA+PiArCS8qDQo+ID4+ICsJICogVVNCIGNvbnRyb2xsZXIgcmVnaXN0ZXJzIHNoYW4n
dCBiZSB0b3VjaGVkIGJlZm9yZSBQSFkgaXMNCj4gPg0KPiA+ICVzL3NoYW4ndC9zaG91bGRuJ3QN
Cj4gDQo+IG9rDQo+IA0KPiAuLi4NCj4gPj4gIHN0YXRpYyBpbnQgZWhjaV9jaV9wb3J0cG93ZXIo
c3RydWN0IHVzYl9oY2QgKmhjZCwgaW50IHBvcnRudW0sIGJvb2wNCj4gPj4gZW5hYmxlKSAgew0K
PiA+PiAgCXN0cnVjdCBlaGNpX2hjZCAqZWhjaSA9IGhjZF90b19laGNpKGhjZCk7IEBAIC0xNjAs
MTQgKzE2NiwxNCBAQA0KPiA+PiBzdGF0aWMgaW50IGhvc3Rfc3RhcnQoc3RydWN0IGNpX2hkcmMg
KmNpKQ0KPiA+PiAgCQlwaW5jdHJsX3NlbGVjdF9zdGF0ZShjaS0+cGxhdGRhdGEtPnBjdGwsDQo+
ID4+ICAJCQkJICAgICBjaS0+cGxhdGRhdGEtPnBpbnNfaG9zdCk7DQo+ID4+DQo+ID4+ICsJY2kt
PmhjZCA9IGhjZDsNCj4gPj4gKw0KPiA+PiAgCXJldCA9IHVzYl9hZGRfaGNkKGhjZCwgMCwgMCk7
DQo+ID4+ICAJaWYgKHJldCkgew0KPiA+PiAgCQlnb3RvIGRpc2FibGVfcmVnOw0KPiA+PiAgCX0g
ZWxzZSB7DQo+ID4+ICAJCXN0cnVjdCB1c2Jfb3RnICpvdGcgPSAmY2ktPm90ZzsNCj4gPj4NCj4g
Pj4gLQkJY2ktPmhjZCA9IGhjZDsNCj4gPj4gLQ0KPiA+DQo+ID4gV2h5IHRoaXMgY2hhbmdlZD8N
Cj4gDQo+IFRoZSBjaS0+aGNkIGlzIHVzZWQgYnkgdGVncmFfdXNiX25vdGlmeV9ldmVudCgpIHRv
IGhhbmRsZSByZXNldCBldmVudCBhbmQgdGhlDQo+IHJlc2V0IGhhcHBlbnMgb25jZSB1c2JfYWRk
X2hjZCgpIGlzIGludm9rZWQuICBIZW5jZSB3ZSBuZWVkIHRvIHByZS1hc3NpZ24NCj4gdGhlIGhj
ZCBwb2ludGVyLCBvdGhlcndpc2UgdGhlcmUgd2lsbCBiZSBhIE5VTEwgZGVyZWZlcmVuY2UuDQoN
CkdldCBpdCwgcGxlYXNlIHNldCBjaS0+aGNkIGFzIE5VTEwgYXQgZXJyb3IgcGF0aC4NCg0KUGV0
ZXINCg==
