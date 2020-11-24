Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7337C56201
	for <linux-tegra@archiver.kernel.org>; Tue, 24 Nov 2020 11:15:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6C6472075A
	for <linux-tegra@archiver.kernel.org>; Tue, 24 Nov 2020 11:15:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="XG9pgoR2";
	dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="oFIMMs9Q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732335AbgKXLO7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 24 Nov 2020 06:14:59 -0500
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:43743 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726623AbgKXLO6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 24 Nov 2020 06:14:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1606216498; x=1637752498;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ud7BbGCHUYw/WA3fbvMFuxL9KYW4WSVPRwqGANE2hko=;
  b=XG9pgoR2Tjf7kauHHt3tYvXb6hFcwQVpl9uh5d7sWTtzdVYMC2LqfASV
   9tSDmXuaDlt1gApf5PNQXYo47uyQN4plEnIsT9DuXCvyOY3jK1IFFGI9j
   HGvooRPvLJcdU6y/4JsfX36CVrrnRAdbzEAAjNEZ5jB/6MwuxTJGw9FMs
   qVsJnqPr669sUSe3eTgADdWgQMmaUJyWiAqiwMp9MqWYOR/RuWK0TBfm1
   x5oI32sUr4XCHXTx3jJuk+NYrMQyYneQLmwUVXapZM92zTOkCOH3AnWMY
   kPTXdhCWAedz+e1PIaFzdVQLlyVaa7M5kcN3OFvTEhQQh9FqxxUvHCYeF
   A==;
IronPort-SDR: TtueyKk0AIRSTr+1upHeImUW6Wljk58jeCAbP4olpHNDDid5sNjuZC9Lrz2yUj/9LrrtHy8bAc
 BohCEJrXBhvC+NIDH8IL42YO+t7P7Ejan+bhMle1T7AKZ2etnxXHVWwsfUmIaKqqYqjW0yKi+G
 j7xBg7tfLYUaFBD7KhkhK5rZQNuOYJXadOfzYn0/JkvQkM7ojCMTFgRgNz+sTPcnKTiDESyWgA
 Ng1tNtQNkGQUjGbdtHY30dVJwKinvKpISaIXbslW2TEU3voqfeguep4RzvT8EaYHMO+3OYMDdT
 FiE=
X-IronPort-AV: E=Sophos;i="5.78,366,1599548400"; 
   d="scan'208";a="100178942"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Nov 2020 04:14:57 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 24 Nov 2020 04:14:56 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Tue, 24 Nov 2020 04:14:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gD5E1uJLGLS/6XXRkCfnBsZVK4/jHXa+Q7O+rKepjpKzYiunqnXKh6OGBDbCkkb0T6O1zCRJZUmy7Jh4IWkwBZZZ38dEdjjZ0LMMX6fermFEpDJoKQr12/GADssRgK6rswZpvZNgqJHMmCv3HQhh3CGfGLyFZEhxqHuhTPe/x7wEre/Qcm4jEqTCywOC03ndNLLADpiV3xi6Hz+XDLpS5wzQnkrTxdboeGu3y0nOr0PVwMcqxJKgQ1r0S2PBi5ADfhquiUlkvyuDUsz0XoLQTFTQ28oLb72e/TCV/epFJ9Vo3U7DOUPXMZu7k5wkaAidQUTI80FVGFL8oSbyTp7OJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ud7BbGCHUYw/WA3fbvMFuxL9KYW4WSVPRwqGANE2hko=;
 b=kvaBQqfwBsM4/DKKsvok9SFFC8smEa6H4gfrINUkuhthtWMRiqtFtUlEQL5Za2xTA9GbTU0RUEx3/4U5rZuYaMh4LghGvrB6U/XfJ6a4s6OO/fR3Sb0l1swdMEdU+ZluEM1ngtUbjztUnwuib4DXTADDUKEgUkn5KfJpU6YcgW09DxFYrdEG3lpI/VURMkFzqCtu1d1GUmbHDsMt2k2uepUJDUOc0C0XFGU2WNo6+Q0QAo/Ewz5NQf5ID59Nq3e49a5BneRGeQNh+ZzeTlFm3vmv7RK76FFfGOOgYHfDn3GtGYPrVfS6+GC3hFDb6nDpN+LyuWBdy+zUpjuUB+szJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ud7BbGCHUYw/WA3fbvMFuxL9KYW4WSVPRwqGANE2hko=;
 b=oFIMMs9QwwfSxKCF44dRM+4uGuUyG+yU6otHOz3MkiwbJti8oZi8GYX1H3GmyhuHVamob48mtkKdsCFzbBdBf62gNBQ9l5TzPx7XXUJI6S3pgwnSPRFn9BDQoRQbNnzA12GsipWXo4H7aRvu6E9f7tiTZPWPzo2k8J5vi45Ni5w=
Received: from DM6PR11MB3420.namprd11.prod.outlook.com (2603:10b6:5:69::31) by
 DM5PR11MB1482.namprd11.prod.outlook.com (2603:10b6:4:4::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.22; Tue, 24 Nov 2020 11:14:54 +0000
Received: from DM6PR11MB3420.namprd11.prod.outlook.com
 ([fe80::f983:dc6d:ad81:9e18]) by DM6PR11MB3420.namprd11.prod.outlook.com
 ([fe80::f983:dc6d:ad81:9e18%7]) with mapi id 15.20.3589.029; Tue, 24 Nov 2020
 11:14:54 +0000
From:   <Claudiu.Beznea@microchip.com>
To:     <jonathanh@nvidia.com>, <lgirdwood@gmail.com>, <broonie@kernel.org>
CC:     <s.hauer@pengutronix.de>, <ttynkkynen@nvidia.com>,
        <linus.walleij@linaro.org>, <axel.lin@ingics.com>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v3 1/6] regulator: core: validate selector against
 linear_min_sel
Thread-Topic: [PATCH v3 1/6] regulator: core: validate selector against
 linear_min_sel
Thread-Index: AQHWwlMIp2zi533iyEyk6v8vg9adng==
Date:   Tue, 24 Nov 2020 11:14:54 +0000
Message-ID: <f06c90ca-11c8-961d-1461-a9486933a1a3@microchip.com>
References: <1605280870-32432-1-git-send-email-claudiu.beznea@microchip.com>
 <1605280870-32432-2-git-send-email-claudiu.beznea@microchip.com>
 <cb096dc5-3757-d72f-41a9-c99007c84b40@nvidia.com>
In-Reply-To: <cb096dc5-3757-d72f-41a9-c99007c84b40@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [86.124.22.247]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cb4bec50-0edb-4d3c-a74d-08d8906a2b99
x-ms-traffictypediagnostic: DM5PR11MB1482:
x-microsoft-antispam-prvs: <DM5PR11MB148273F5E46D5B2EA00F06C887FB0@DM5PR11MB1482.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7gkFcR4+2Id8LFEaRKLSWv9Ccx3VdjlqL9kH0nofxTLdqSXCGDgMLb2DDIS42xZPzvrHheFnCMsGnsPQ6k3R3s140DpRqaHVwbvt3Uobq2VRbVS8rSOECwEx9JE6xEM8eyKlKRpCeL3Thu2sQHf/7/BH2GscariQ52gJz2uDK7X+B+ieNs5P6OWQ6atO/wYKJNk6jSZtnuyn8ggbyJIX/1EeaEG3JlcDna67WFOs97WcgqeL3tiLJUkRjB3bUCt0B2m6gGiHPql5FBTfVo+kI6/fNPUR4RoXPUJt3Y6O1zN6qkyXqWG50Hl4uRYR6OAyYblMQnUAVfg+Z/D3Sqr1wIOMBc7NzUWTLPVbaqmxXIE0NDynsjS/R8oRhqHmIvSZ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3420.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39850400004)(376002)(346002)(366004)(136003)(316002)(66476007)(8936002)(76116006)(83380400001)(31686004)(64756008)(6512007)(31696002)(66446008)(66946007)(91956017)(478600001)(15650500001)(66556008)(2616005)(54906003)(86362001)(5660300002)(26005)(110136005)(186003)(36756003)(53546011)(8676002)(7416002)(4326008)(2906002)(6486002)(6506007)(71200400001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: rPT4cQlWaK9Q+uco21mq0Wjz6yondSVEi2Ls/qds/d2QN8L7tXdEsIfdBYdqr6q1sz6En39GtOMm7hTUhjBRDR7AzX1oMakdG1PzqIf7JUpVTH7yOKMtBQzHdlYJ0dJ0lnO98Of14BZt9KNDaIvu8LusNXX5t2BXk74k/655l+nzuACF1AqxfKP53qRC33KykyEnXMklHpWYvkez75qF2IJeTaAiqncrzGogZoZomKcXihJg6/sZF1UYdOqA0sXSsyPYWVnXEtOVKNUH6fz8pLFVvxYFx8fyYkb+hHX2rh8f4Az/cWtompjmTD1aXamJ32O+hacf4XhoGvgklqZCQH5W8x50N3fVXfpKOsrXBLYM7cGldpxJzw1dOllJEjjRUJMfF3oGkcECAsYDEuff3UfGevRR+BimNGcMbiKkGrTdSvj/6zQmwJaIy4NstQM+LBt7O879gK7KsIjtaGKXsb28zoHxDXik+FXTj6nbqAAqJ2Fam89OY3c8CuKsvQAVxTSyVUI3hodv5hJRyj6P8APQlrEUl8wBGXuO/nLjT5Ym5HSjTEndVSGGyXQk4z1s4/JNApvwLC4bZkvrwSGA6sCOVSOiTAhLFD3PZvHafG/6yT93/jxqu8LpBIzJf/2cefAdhcxFtbVZLIYTUAOmg1oXLL+2bbP4mT0raHv691gi1nlMChEho7I/wspvlxtNmttegAArZ+pEHws/1560OGpHoOh6Uewypinp/yz8Dp1VtDkeAPA+bgS1M1uLff2OowjOBcvuGkHDzs2bRuxkxMUk1RgvXbrS12QbET0/OP1BB38FGn3+dEE0N6pEINDXf2Dj1c8Ju7E5bKdi7RA2QGodTcW5AUV2NUcl8Z5EL8rjWepjjWg6XWNM0fmVk7g6imZUiyhTrRDUeBzjWeeNuA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <DD9C2F394F02F543AFADEB42D363A745@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3420.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb4bec50-0edb-4d3c-a74d-08d8906a2b99
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2020 11:14:54.4738
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f16N8nKSg7qFTLKWY3MhAj3PGQT3+/j/Fb2THtwp5UJqlvVjgc2U20X6etUjdykexQ0mxYv5kDCgw3LBAQ+enZ3gitYQdZ1DvJYYUSWGOS4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1482
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

SGkgSm9uLA0KDQpPbiAyNC4xMS4yMDIwIDExOjM2LCBKb24gSHVudGVyIHdyb3RlOg0KPiBFWFRF
Uk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNz
IHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IE9uIDEzLzExLzIwMjAgMTU6MjEs
IENsYXVkaXUgQmV6bmVhIHdyb3RlOg0KPj4gVGhlcmUgYXJlIHJlZ3VsYXRvcnMgd2hvJ3MgbWlu
IHNlbGVjdG9yIGlzIG5vdCB6ZXJvLiBTZWxlY3RvcnMgbG9vcHMNCj4+IChsb29waW5nIGIvdyB6
ZXJvIGFuZCByZWd1bGF0b3I6OmRlc2M6Om5fdm9sdGFnZXMpIG1pZ2h0IHRocm93IGVycm9ycw0K
Pj4gYmVjYXVzZSBpbnZhbGlkIHNlbGVjdG9ycyBhcmUgdXNlZCAobG93ZXIgdGhhbg0KPj4gcmVn
dWxhdG9yOjpkZXNjOjpsaW5lYXJfbWluX3NlbCkuIEZvciB0aGlzIHNpdHVhdGlvbnMgdmFsaWRh
dGUgc2VsZWN0b3JzDQo+PiBhZ2FpbnN0IHJlZ3VsYXRvcjo6ZGVzYzo6bGluZWFyX21pbl9zZWwu
DQo+IA0KPiANCj4gQWZ0ZXIgdGhpcyBjb21taXQgd2FzIG1lcmdlZCwgSSBub3RpY2VkIGEgcmVn
cmVzc2lvbiBpbiB0aGUgREZMTCAoQ1BVDQo+IGNsb2NrIHNvdXJjZSkgb24gVGVncmExMjQuIFRo
ZSBERkxMIGRyaXZlcg0KPiAoZHJpdmVycy9jbGsvdGVncmEvY2xrLWRmbGwuYykgY2FsbHMgcmVn
dWxhdG9yX2xpc3Rfdm9sdGFnZSgpIGluIGEgbG9vcA0KPiB0byBkZXRlcm1pbmUgdGhlIHNlbGVj
dG9yIGZvciBhIGdpdmVuIHZvbHRhZ2UgKHNlZSBmdW5jdGlvbg0KPiBmaW5kX3ZkZF9tYXBfZW50
cnlfZXhhY3QoKSkuDQo+IA0KPiBDdXJyZW50bHksIHRoZSBERkxMIGRyaXZlciBxdWVyaWVzIHRo
ZSBudW1iZXIgb2Ygdm9sdGFnZXMgcHJvdmlkZWQgYnkNCj4gdGhlIHJlZ3VsYXRvciBieSBjYWxs
aW5nIHJlZ3VsYXRvcl9jb3VudF92b2x0YWdlcygpIGFuZCB0aGVuIHN0YXJ0aW5nDQo+IGZyb20g
MCwgaXRlcmF0ZXMgdGhyb3VnaCB0aGUgbnVtYmVyIG9mIHZvbHRhZ2VzIHRvIGZpbmQgdGhlIHNl
bGVjdG9yDQo+IHZhbHVlIGZvciB0aGUgdm9sdGFnZSBpdCBpcyBsb29raW5nIGZvciBieSBjYWxs
aW5nDQo+IHJlZ3VsYXRvcl9saXN0X3ZvbHRhZ2UoKS4gSXQgYXNzdW1lcyB0aGF0IGFueSBuZWdh
dGl2ZSB2YWx1ZSByZXR1cm5lZCBieQ0KPiBjYWxsaW5nIHJlZ3VsYXRvcl9saXN0X3ZvbHRhZ2Uo
KSBpcyBhbiBlcnJvciBhbmQgdGhpcyB3aWxsIGNhdXNlIHRoZQ0KPiBsb29wIHVwIHRvIHRlcm1p
bmF0ZS4NCj4gDQo+IEluIHRoaXMgY2FzZSB0aGUgcmVndWxhdG9yIGluIHF1ZXN0aW9uIGlzIHRo
ZSBhczM3MjIgYW5kIHRoZQ0KPiBsaW5lYXJfbWluX3NlbCBmb3IgdGhpcyByZWd1bGF0b3IgaXMg
MSBhbmQgc28gd2hlbiB0aGUgREZMTCBkcml2ZXIgY2FsbHMNCj4gcmVndWxhdG9yX2xpc3Rfdm9s
dGFnZSgpIHdpdGggYSBzZWxlY3RvciB2YWx1ZSBvZiAwIGl0IG5vdyByZXR1cm5zIGENCj4gbmVn
YXRpdmUgZXJyb3IgY29kZSwgYXMgZXhwZWN0ZWQgYnkgdGhpcyBjaGFuZ2UsIGFuZCB0aGlzIHRl
cm1pbmF0ZXMgdGhlDQo+IGxvb3AgdXAgaW4gdGhlIERGTEwgZHJpdmVyLiBTbyBJIGNhbiBjbGVh
cmx5IHNlZSB3aHkgdGhpcyBpcyBoYXBwZW5pbmcNCj4gYW5kIEkgY291bGQgZml4IHVwIHRoZSBE
RkxMIGRyaXZlciB0byBhdm9pZCB0aGlzLg0KPiANCj4gQmVmb3JlIGRvaW5nIHNvLCBJIHdhbnRl
ZCB0byBhc2sgaWYgdGhhdCBpcyB0aGUgY29ycmVjdCBmaXggaGVyZSwNCj4gYmVjYXVzZSBpdCBz
ZWVtcyBhIGJpdCBvZGQgdGhhdCByZWd1bGF0b3JfY291bnRfdm9sdGFnZXMoKSByZXR1cm5zIE4N
Cj4gdm9sdGFnZXMsIGJ1dCBpZiB0aGUgbWluIHNlbGVjdG9yIHZhbHVlIGlzIGdyZWF0ZXIgdGhh
biAwLCB0aGVuIGFjdHVhbGx5DQo+IHRoZXJlIGFyZSBsZXNzIHRoYW4gTi4gSG93ZXZlciwgY2hh
bmdpbmcgdGhlIG51bWJlciBvZiB2b2x0YWdlcw0KPiBzdXBwb3J0ZWQgYnkgdGhlIHJlZ3VsYXRv
ciB0byBiZSBOIC0gbGluZWFyX21pbl9zZWwgZG9lcyBub3QgbWFrZSBzZW5zZQ0KPiBlaXRoZXIg
YmVjYXVzZSB0aGVuIHdlIG5lZWQgdG8ga25vdyB0aGUgbGluZWFyX21pbl9zZWwgaW4gb3JkZXIg
dG8NCj4gZGV0ZXJtaW5lIHRoZSBmaXJzdCB2YWxpZCB2b2x0YWdlLg0KPiANCj4gSW4gY2FzZSBv
ZiB0aGUgYXMzNzIyLCB0aGUgdmFsdWUgMCBtZWFucyB0aGF0IHRoZSByZWd1bGF0b3IgaXMgcG93
ZXJlZA0KPiBkb3duLiBTbyBpdCBpcyBhIHZhbGlkIHNldHRpbmcgYW5kIGVxdWF0ZXMgdG8gMCB2
b2x0cyBhdCB0aGUgb3V0cHV0IEFGQUlDVC4NCj4gDQo+IFBsZWFzZSBsZXQgbWUga25vdyB5b3Vy
IHRob3VnaHRzIGFyZSB0aGUgY29ycmVjdCB3YXkgdG8gZml4IHRoaXMgdXAuDQoNCkkgd291bGQg
c2F5IHRoYXQgYSBzb2x1dGlvbiB3b3VsZCBiZSB0byBoYXZlIGEgbmV3IGhlbHBlciB0byByZXRy
aWV2ZSB0aGUNCmxpbmVhcl9taW5fc2VsIChlLmcuIHJlZ3VsYXRvcl9taW5fc2VsKCkpIGFuZCB1
c2UgdGhpcyBmb3IgYWxsIHRoZQ0KY29uc3VtZXJzIG9mIHJlZ3VsYXRvcl9saXN0X3ZvbHRhZ2Uo
KSBhbmQgdGhlIG90aGVyIEFQSXMgdGhhdCBwYXRjaA0KInJlZ3VsYXRvcjogY29yZTogdmFsaWRh
dGUgc2VsZWN0b3IgYWdhaW5zdCBsaW5lYXJfbWluX3NlbCIgaGFzIGNoYW5nZWQNCihyZWd1bGF0
b3JfbGlzdF92b2x0YWdlX3RhYmxlKCksIHJlZ3VsYXRvcl9zZXRfdm9sdGFnZV90aW1lKCkpLiBX
aXRoIHRoaXMNCmNoYW5nZSB0aGUgbG9vcCBpbiBmaW5kX3ZkZF9tYXBfZW50cnlfZXhhY3QoKSBz
aG91bGQgYmUgYi93DQpyZWd1bGF0b3JfbWluX3NlbCgpIGFuZCByZWd1bGF0b3JfY291bnRfdm9s
dGFnZXMoKS4NCg0KTWF5YmUgTWFyayBoYXMgYSBiZXR0ZXIgc29sdXRpb24gZm9yIHRoaXMuDQoN
ClRoYW5rIHlvdSwNCkNsYXVkaXUNCg0KPiANCj4gVGhhbmtzDQo+IEpvbg0KPiANCj4gLS0NCj4g
bnZwdWJsaWMNCj4g
