Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B3E0C433F5
	for <linux-tegra@archiver.kernel.org>; Thu, 16 Dec 2021 10:54:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233634AbhLPKyq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 16 Dec 2021 05:54:46 -0500
Received: from mail-eopbgr80048.outbound.protection.outlook.com ([40.107.8.48]:53314
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233592AbhLPKyp (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 16 Dec 2021 05:54:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m3V/tUKPsCoNKXMuAwh6lQJcT+CGDLCUrL39K6AXOUMavN1gpiy6kq0tFC4ZpbEfpdTzw8mdybv4XVZoXEISkNo3CRsPXXBX6NG5zZTiU3/s13W5WZnyitKmJKdeCrcqe1wSb+GfmARgzt+bVE6kBLOTKJN/zH8ywl4CwRWmb5mRUnXUCz7Otd6Ac3DtevR+jDnA22h3JdMjsfHORru73C3mkjoz4kgY/pKWrhYf4269rSG0GzybOp8eyeLSrOTipTdhVLr+XXtZEmqzwl+FuumWYPJhdQlhlLGjs5TBWSLasAwT5Vvir0ko9iDiCM0rzrJCxkpHP/PkdPdKA4CHPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/H+xUGBT3IfLZQ0dZQ2QU9IQ/kn8AiT/G4IHwpopGWU=;
 b=Wmnh7ADV+kSs/CMzn8sIGTL7I+asBkf1Ugh+6T1F9vMDOB/yt0Fm7GC7b0ibdjxYKETu+aehE0RRLXuYHMi96gEwSANThCjIQALZTUxhSFV6FAOOQ/nV1aVAQChCeSvOgnGxSpXsqFxni5X9ptmBksYOrZ/f28z0bX6R6osB4U9rpJIEcbhkOFyLju9tUfskFh89Tobxme9TuDv5Jt5GqMISUpZXPdDssD/8PwvehDD5BWOKqRawL2eXF1fol5s8ujvMewF2RpJsW8WRYbFKZZKKzslQ4Fvc8Fd4Cs6C6j2Ny+qks0PjUrXm6mxFtg5ZDEv/YxhuSWcs2Ucw5xctkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/H+xUGBT3IfLZQ0dZQ2QU9IQ/kn8AiT/G4IHwpopGWU=;
 b=T5MO547OEN2JZOPESqDcAp1bkyUlC8Y6uhsjmrsS55IfxHqQr4/RZQR1F2jGJh9c8fXmFl24QUosy3y5Z+t4YvQN/nI8DF0AnEpvbj9unKktr+oSU7IkCpLIVhDSV61D18gqmqTo2Zcg9KZhwRXp6kWl/FG/J+X37ICfdHQSwqk=
Received: from DB8PR04MB5785.eurprd04.prod.outlook.com (2603:10a6:10:b0::22)
 by DB8PR04MB6972.eurprd04.prod.outlook.com (2603:10a6:10:11c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Thu, 16 Dec
 2021 10:54:43 +0000
Received: from DB8PR04MB5785.eurprd04.prod.outlook.com
 ([fe80::30f6:2b14:3433:c9bf]) by DB8PR04MB5785.eurprd04.prod.outlook.com
 ([fe80::30f6:2b14:3433:c9bf%5]) with mapi id 15.20.4778.018; Thu, 16 Dec 2021
 10:54:43 +0000
From:   Xiaoliang Yang <xiaoliang.yang_1@nxp.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
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
        Joakim Zhang <qiangqing.zhang@nxp.com>
Subject: RE: [EXT] Re: (EXT) [PATCH v3] arm64: dts: imx8mp-evk: configure
 multiple queues on eqos
Thread-Topic: [EXT] Re: (EXT) [PATCH v3] arm64: dts: imx8mp-evk: configure
 multiple queues on eqos
Thread-Index: AQHX8l0rYmdtkILFi0ubdlKVmDV1eaw06lqAgAACkgA=
Date:   Thu, 16 Dec 2021 10:54:43 +0000
Message-ID: <DB8PR04MB578511BD4D2FB93B32F87D9CF0779@DB8PR04MB5785.eurprd04.prod.outlook.com>
References: <20211216092448.35927-1-xiaoliang.yang_1@nxp.com>
 <edc76a76d0d65038ea1494004c7c4bba0068f88a.camel@ew.tq-group.com>
In-Reply-To: <edc76a76d0d65038ea1494004c7c4bba0068f88a.camel@ew.tq-group.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3a1c62b5-4524-4619-d5c1-08d9c0827795
x-ms-traffictypediagnostic: DB8PR04MB6972:EE_
x-microsoft-antispam-prvs: <DB8PR04MB6972F3417256D5952322F663F0779@DB8PR04MB6972.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QHlNSraQqHBsHzv50bLVdmQbTz+yWdko2ZQYZYYKwVDz02WrxFLSitZgL9zejtmPruTrEL/XffflGZjsfKyT4kHA0/D9mN6Y8cDxCka/U2K5zSQSp608AfZpyqux7Lsnbe5PBq3utkSLKAJjxZGNo0W/Gj/1/HXxeNOxjsZ+RaWjp+zxR4thbVZosggGLvgWTuhPPaGE2um+XopJfuzyN/laitavgpwMPK4pk3ujWXFeJxRz/+j2b/d3Aldt+l8/uVvF9etf5AvEst39nGSzG0K5mLe7wDNJzscZgZrUrmYnxoSEPaGIfkVx0zqM+tVnZ3PDC7L5ogdyOvg76WUR/7m6OW2vCHPi8mESQ6+ebGUmgrdmiCRF5CfVaS/tnXk5/pyjU4QdXmlHcju4K48OgddZ23dtdDXnqI1dUn5lExKxzt8x83xOLrEhv/CLSlS/vlKmosAGMHLGLG4IoqvhXTTSHSyiz4VVvYI/c4Vh4lVemLH2UzfBPymJqkTRFCTR2X3EJAYqwoPRak69UijfsNAIkqnpDLEZcfjbIO+XDI8Euu/Su9WGXzL0HoywpWM/QovGk70L+2sOCrK1/J0f94apUZKH81dPp0srwsHvGnheNbv03p6Gc/aJ9zr0dgOltpYuGmENi9oSCjVtmALcVhWM8qvXeOGh1YhUeSomFeGvsP9i7g4b+1IukVgPtiRHamlBNXt/N0Q2iP2LwNlmQnP4Ng/r5EacptarhPfgWJg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB5785.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66446008)(55016003)(71200400001)(66556008)(64756008)(54906003)(66476007)(508600001)(110136005)(5660300002)(66946007)(33656002)(7696005)(8676002)(316002)(122000001)(38100700002)(52536014)(76116006)(38070700005)(9686003)(186003)(2906002)(6506007)(86362001)(8936002)(4326008)(26005)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S0FmOVdsL1NBTUxJQ2REM0dRT1UrbmdBZ3VIdXR5QzBMd1FZTlhnRkNjM0NU?=
 =?utf-8?B?QTVZcXVkaFRtb2dRcFptN2dlU1Q2djQ1WGpKc0pkWHZWaVhxZnVFb1dESndG?=
 =?utf-8?B?ZDI3SUZMOTRBYnpDa0wvSVhDU293aVI1WnBtTkFXQ1dHYVV3M2lQNG84aFlR?=
 =?utf-8?B?V1hNOWl1U1BxVnV4a25oTjlqMEpUQjI0RExYYVl3dTAyTTZqQzZxRDZ2emtr?=
 =?utf-8?B?SkFLeFM0aW00WkVPbitJV2ZIaUJvdEhzdlJiODFWRkV1Zko5WFhiNVJwMVJo?=
 =?utf-8?B?MjhpS0EzUm96K01jT091MEhXVDd0RXl2Y0NKZFBVSXRBbUdDVWt4dnVUZWI3?=
 =?utf-8?B?Tmx0UTlwdHVySit0Um5sU2I5VjFzaE9pbkhLc1dvOVlJbGNyaGUxb1VlaEJw?=
 =?utf-8?B?M0t2OXJibTJ6MHUwQUJSOXkrdDc0a28rYVpxaEVTcEh1RnMxczZLU3dBWG55?=
 =?utf-8?B?MUtwVURISXF6b0p5cWI4RU1TMVBZUWYvcGVlUUNnWHVuamhVT09BbG40L2dF?=
 =?utf-8?B?eXh3ZHRIZzBDOXgzdTBPeTRsNmc5U3ROZFpwbUZXZEFvcWxFYzZDNU1scGJR?=
 =?utf-8?B?WjJaWGh6UEtrM2gzWWwxN01BY1RBTXRiUDBaOW4zL3F1UVlGNURzWkp1ZHNq?=
 =?utf-8?B?QndKOHVkSTkzOWRUZTdvUm5LR1lhYWk4bWNrSHEyR3ZPcEZVRkdlZXR1L1Qx?=
 =?utf-8?B?ZWZUT3gzZHV0ZkFsTFBDL2hlU1U3Z1RHMytCZE1IcmtIT21RbU5mYnpwK0xu?=
 =?utf-8?B?ZWJqaTlCSW5lOE5Jb2k2SytkbmRVYURpY3BCYWpZYVNKMmNQYUcweS8zVVlC?=
 =?utf-8?B?bTlCYTRZQjB2a29kaXZyQ3pJUE9UVkh2WksxUk9NQkdSdmJsdy9EM3dwNWlJ?=
 =?utf-8?B?OGM2QkU1UUVKYlowVUkyVVBHM1Z0dGNLR1pxZ1RKZTFteTFWUXN5dHZKVkNh?=
 =?utf-8?B?bDg0OTkwOHJNOUVkWkRvT1J6d1k1SGhTMUQyVzNtMjIvS3FCZmRFTGdjYzEw?=
 =?utf-8?B?eVZ2cE9xS0xBbFQ5VngrVTRBVjAraGcwbEhkSmpCWXMzYmlhQ3YvTDVrMXg2?=
 =?utf-8?B?Q1lUUUpkUFp4elJJR2NFNm5jMUVPZXpsMG5WSmZnMnNaVGJCTnZSVGcrdE1w?=
 =?utf-8?B?ckozSU15U1pvQ09lTkNldTdqZlJxWHR5TmVuMDdkcy8vanZvTm1iNTJlaFRR?=
 =?utf-8?B?QlFVYmxDcmJMdUxUR0pDU0l5Qmpsb0hua01FK0dQdHYzVXNRYlVibDh2MHBG?=
 =?utf-8?B?NmxPRGg4RGtTUGptcE5EWW1mck5DSUVyYlVTeThOOS82d3pVUlRRTkFWVEkx?=
 =?utf-8?B?Yk53WG4wdFBkQy9jci9LVEJ6RHQyZ0lvdW9DTWFjQWJlaXp1YnByWEJUMFEy?=
 =?utf-8?B?RFlnWm9yV3dYN3NmSXErZ0E5dUVLYXhFcUY3UW1xR1piMG1ReDdCS3BOR2xY?=
 =?utf-8?B?S0grYWo0UXZVeG9NMkJGUUlwaW1uTU9ZeG1IVUZKaTRPeUhHcnNIUE9pOXpS?=
 =?utf-8?B?QnZqQXFZUTJKUkhaM1JPZURMcFlXUkJHNWhLYzNISDdyeEZYQ3E1dFJ5ZWow?=
 =?utf-8?B?ZWk5QjBTMFdGbXlESk04ZTJ3bXB0S1QvVnRFaWlvcDlZNlBqWnd2Z1VvSmZB?=
 =?utf-8?B?aDJ5WERuSmpJbU00OUhUV1Yya2RacVlWUUNoNU5JTC9DUTkydW9kSG1HUVJK?=
 =?utf-8?B?UllRWHdXdUhIZWROVkovTGE5KzVVV002VHVSZWhwVEovNjVFNmRVQXBqa3pO?=
 =?utf-8?B?WUhDMjZ1RGxwUXpYSHl6eUxVRGd4ZHlnOHp0Um5aWjNFWHBycWN6bTFlcVBa?=
 =?utf-8?B?aTlTTHFaTi9uVGxhWkZ6Sktic3NUK1VGdmFNMnRWZHVoMzl0bXBEVzBmZG1V?=
 =?utf-8?B?Q3gxZE93TjlqL2Vvd21hdUsxZVZEaWo1TzNhWW4zSDVpcHBJdytsd1BDUVo0?=
 =?utf-8?B?MHpEZThBZVRmTWZMOXYyR3dGd1k5TzUzcmQvS2FLaXd1L0p0YWtqd3BwS0hZ?=
 =?utf-8?B?bE5BbXlTZlQ4VDVUZzg4Q0dNNnp1Nzh2bDV4ZXhCWWRHbFlndVhBc0ZQQ1VE?=
 =?utf-8?B?akc5RUJaTU9TKzFIZUpTb2pHNkI3eGw0QlhESFdvWDF5NVp4Y2VMeVRIMm9Z?=
 =?utf-8?B?c2djT3NkM29IWjV2akdrWTJFOFlkT2FPWm1COFhqb3dSZVF2SXhpS2hoYWxw?=
 =?utf-8?B?Nno4KzhRTjdMUThrQnBYdXJacEF2OHRVN3AwWDBIM2V4MTJKcjFpRFd1dzdD?=
 =?utf-8?B?ZmxiTGZOMFpVWXR4dkhkcGxzbWR3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB5785.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a1c62b5-4524-4619-d5c1-08d9c0827795
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2021 10:54:43.2406
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KqbFqsSWvIFJQuFxUJqhTjrCWm58QHDHFLdfPaFRgibIDL3WeXvh4k5Q1YplJ6OZNbcOo1UynvffIFiCstIjnmdlggi+psDhlr9FxAEV8UA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6972
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

DQpPbiBUaHUsIDE2IERlYyAyMDIxIDE4OjA3OjEzIEFsZXhhbmRlciBTdGVpbiB3cm90ZToNCj4g
PiBFcW9zIGV0aGVybmV0IHN1cHBvcnQgZml2ZSBxdWV1ZXMgb24gaGFyZHdhcmUsIGVuYWJsZSB0
aGVzZSBxdWV1ZXMgYW5kDQo+ID4gY29uZmlndXJlIHRoZSBwcmlvcml0eSBvZiBlYWNoIHF1ZXVl
LiBVc2VzIFN0cmljdCBQcmlvcml0eSBhcw0KPiA+IHNjaGVkdWxpbmcgYWxnb3JpdGhtcyB0byBl
bnN1cmUgdGhhdCB0aGUgVFNOIGZ1bmN0aW9uIHdvcmtzLg0KPiA+DQo+ID4gVGhlIHByaW9yaXR5
IG9mIGVhY2ggcXVldWUgaXMgYSBiaXRtYXNrIHZhbHVlIHRoYXQgbWFwcyBWTEFOIHRhZw0KPiA+
IHByaW9yaXR5IHRvIHRoZSBxdWV1ZS4gU2luY2UgdGhlIGhhcmR3YXJlIG9ubHkgc3VwcG9ydHMg
Zml2ZSBxdWV1ZXMsDQo+ID4gdGhpcyBwYXRjaCBtYXBzIHByaW9yaXR5IDAtNCB0byBxdWV1ZXMg
b25lIGJ5IG9uZSwgYW5kIHByaW9yaXR5IDUtNyB0bw0KPiA+IHF1ZXVlIDQuDQo+ID4NCj4gPiBU
aGUgdG90YWwgZmlmbyBzaXplIG9mIDUgcXVldWVzIGlzIDgxOTIgYnl0ZXMsIGlmIGVuYWJsZSA1
IHF1ZXVlcyB3aXRoDQo+ID4gc3RvcmUtYW5kLWZvcndhcmQgbW9kZSwgaXQncyBub3QgZW5vdWdo
IGZvciBsYXJnZSBwYWNrZXRzLCB3aGljaCB3b3VsZA0KPiA+IHRyaWdnZXIgZmlmbyBvdmVyZmxv
dyBmcmVxdWVudGx5LiBUaGlzIHBhdGNoIHNldCBETUEgdG8gdGhyZXNoIG1vZGUgdG8NCj4gPiBl
bmFibGUgYWxsIDUgcXVldWVzLg0KPiANCj4gSXMgdGhlcmUgYSBzcGVjaWZpYyByZWFzb24gdG8g
Y29uZmlndXJlIHRoaXMgb25seSBvbiBib2FyZC1sZXZlbCBidXQgbm90IGZvciBhbGwNCj4gaW14
OG1wIGluIGdlbmVyYWw/DQpIb3cgbWFueSBxdWV1ZXMgYXJlIGVuYWJsZWQgYW5kIHdoYXQgYXR0
cmlidXRlcyBhcmUgc2V0IHRvIGVxb3MgZGVwZW5kcyBvbiB0aGUgbmVlZHMgb2YgdXNlcnMuIERp
ZmZlcmVudCBib2FyZHMgbWF5IGhhdmUgZGlmZmVyZW50IHJlcXVpcmVtZW50cy4gRm9yIGV4YW1w
bGUsIHdlIHNldCB0aGUgdGhyZXNob2xkIG1vZGUgYW5kIDUgcXVldWVzIG9uIHRoZSBpbXg4bXAt
ZXZrIGJvYXJkLCBidXQgb3RoZXIgYm9hcmRzIG1heSBhbHNvIHJlcXVpcmUgU0YgbW9kZSBhbmQg
MyBxdWV1ZXMuIFdlIHNldCB1cCA1IHF1ZXVlcyBhbmQgU1Agc2NoZWR1bGluZyBtb2RlcyBvbiB0
aGUgaS5teDltcC1ldmsgYm9hcmQgdG8gYmV0dGVyIHVzZSB0aGUgVFNOIGZ1bmN0aW9uLg0KDQpU
aGFua3MsDQpYaWFvbGlhbmcNCg==
