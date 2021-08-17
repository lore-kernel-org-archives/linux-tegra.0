Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13066C4338F
	for <linux-tegra@archiver.kernel.org>; Tue, 17 Aug 2021 07:10:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E9E8A60F5E
	for <linux-tegra@archiver.kernel.org>; Tue, 17 Aug 2021 07:10:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233688AbhHQHLX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 17 Aug 2021 03:11:23 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:43836 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S233996AbhHQHLW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 17 Aug 2021 03:11:22 -0400
X-UUID: 65f9be082f2f495589d39fe592f7a425-20210817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=Ou0zAugeHfzudfq6XHYTlkNJk6RN0RpjcNOmjEi6qqY=;
        b=o/bkngaSz/h/XtCKC34BXWQfUyEUtpWP1xYz+yTy37GDk25A9DozeqcsyjKKxbDXQLY0ZuLvfY0VY7i3KI70lYEIBX/REOOxoKpgcLHRqq2fHYMr66CM+2ooITmAHVyofyAIRiTgFrU4bpK78m1A6ycW+qUAk1+TOMKwjfxtkVw=;
X-UUID: 65f9be082f2f495589d39fe592f7a425-20210817
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 199127740; Tue, 17 Aug 2021 15:10:46 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 17 Aug 2021 15:10:46 +0800
Received: from APC01-HK2-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 17 Aug 2021 15:10:45 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kMEbRBGA7MAcnzCNAeQ8KAVOByyw7pM6rTOxV5eqHjFzJ5W9FcFEOzwBjSrmjFg+45ew5dT6gj0cygJ1X2Z5nqSfseyO2SgWBg1yUsPBpeIjwZpUgh6g0LUxAinvou2FfarIFW3RDQ3ooHsw9EF9Zc1Say+fTbW9anzuCAQObDQVlU3OyXVNVeMsCFf7cH+B/QEQKsk+ZTAuhIdbLPCL/mvYS9wiQuWM1+j0FtV1O40W7tKbTe/n6xCZic8M6dxL/iYKeucS6v0DzPqxvLhuz2Evu57V0gDlw6NxEqT6vUgInBZQEFpu90yljHiAnPGz8eWyZYOjP+6s6/IiAdvWTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ou0zAugeHfzudfq6XHYTlkNJk6RN0RpjcNOmjEi6qqY=;
 b=DAfyWfzBy+LZqErepnJeDOhZJcIxGTfYFYXlgRis0F8aSkxFpD3F7oBLq80pms+qbSlakz3Scr0D3LSw4vev4b3CUkF+h534JLG22l9wJGaEsNWnYaWMyESwiMYDNFBonvc9miGtx9n2M0SS1cH2gHqH/63gszNFtd6Gv+WoxxsMM22xCrod6ZDpgBstxrBtrUE0V3xO+i9n3CWNKo3llm0Y29lBhJFwlZwfz6A4HdYaglDEj1VFE/veIzKG+tyJxmtSpqh3dbmvFUDYsDEu0RTvPP8r0N8o3vVBO4bD4SAAQNhONf8grsshlDIKbOA2XcwlQQor6mdfZYZ05BczfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ou0zAugeHfzudfq6XHYTlkNJk6RN0RpjcNOmjEi6qqY=;
 b=S3fPzvbIcohW3Ljh8iP+X8b3nyoY+Rozkj8uB7Psi0J8ZaNhtruaKt24LMNdE7Sv35SVshmZOSQOk8rlb4cIln4gQbYamI70v1eYePTScP/BIg3YrCVaAO7BLdPDyego8uwInbJ7BqRYvTF/+pXM00b+ENPpIJB+Ru/a/pjYSGw=
Received: from KL1PR03MB5062.apcprd03.prod.outlook.com (2603:1096:820:1a::22)
 by KL1PR0302MB2629.apcprd03.prod.outlook.com (2603:1096:802:3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.12; Tue, 17 Aug
 2021 07:10:30 +0000
Received: from KL1PR03MB5062.apcprd03.prod.outlook.com
 ([fe80::3ce4:e30e:bb67:c608]) by KL1PR03MB5062.apcprd03.prod.outlook.com
 ([fe80::3ce4:e30e:bb67:c608%7]) with mapi id 15.20.4436.018; Tue, 17 Aug 2021
 07:10:29 +0000
From:   =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= 
        <Chunfeng.Yun@mediatek.com>
To:     "balbi@kernel.org" <balbi@kernel.org>,
        "pawell@cadence.com" <pawell@cadence.com>
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
        "yangyingliang@huawei.com" <yangyingliang@huawei.com>
Subject: Re: [PATCH 3/6] usb: cdnsp: fix the wrong mult value for HS isoc or
 intr
Thread-Topic: [PATCH 3/6] usb: cdnsp: fix the wrong mult value for HS isoc or
 intr
Thread-Index: AQHXjyrdXjsluDJx2U2joaBrEorD3qtvbn+AgAe+JgCAACLxAA==
Date:   Tue, 17 Aug 2021 07:10:29 +0000
Message-ID: <a929c84f97de35277d516b6bd157ec17a407008d.camel@mediatek.com>
References: <1628739182-30089-1-git-send-email-chunfeng.yun@mediatek.com>
         <1628739182-30089-3-git-send-email-chunfeng.yun@mediatek.com>
         <87mtpnyx3g.fsf@kernel.org>
         <BYAPR07MB53815317736C694887D51BE8DDFE9@BYAPR07MB5381.namprd07.prod.outlook.com>
In-Reply-To: <BYAPR07MB53815317736C694887D51BE8DDFE9@BYAPR07MB5381.namprd07.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f62dbab7-b88a-41dc-8168-08d9614e18b6
x-ms-traffictypediagnostic: KL1PR0302MB2629:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <KL1PR0302MB2629E2CE42A5035E7807DBB7FDFE9@KL1PR0302MB2629.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eOb2C58TF2Ux2ROY9V9O2MgyZvGQwzs04dQ0QH8V5dMPMaBlMV1k43/Y2CGVrtSMyQpR+aKsDmPJSJdkXuujkfpzb9d6yTf+HnmH1jAwRXiDPQy3W1r48iMBRgIKeXTIYO+QqewMs/uVu1Wfp7NUt5z21/vJHlRyyIzvjUxtDh0Eoh8YHt5PdLqEq8/yJou1rRb9IAcmBZIhDp4n7XlMH+QnTF0ci05OOzDHPBkT4aFPAWCF0hoSdn9wCNsEDgGI6OWTstZbMlbB/UUU/0q4uYFSUrbvNKitgHzblDQqwJgBHBTwBeNUtiZDyq0/10Tgd7zqi0blTZLaomtBVHVKZ2saBZEhRav6U581a29r+s87q/r/xYb96O5D/RejRzhuu+3KLeBaQgSRx4wqdMNzi9o+zOVcC0wJl19x3P2xbDtQrMA9kHXn6rn9YGWANsQ9yuXeiuNcgt2pLCjsuBM9DCFtsuSSZuaSQ35rXE/Cd6qS1AGKOgZf7q22xXDrVpdMDvqnkZ0VolDIouf0CUxjN7WD1DC/YHQlxXiUYbqFp/yROFIV3mbESgl+0cFXkidReII35YRGPAWAu7grMp2QKBnrx45PBLnUFu9kc1rVFNae1i3Yp722rnmSsQbCjJA9NgRpH+WR0UoGzfKXdqq4zTs9TM1VjTqXfw0NlWjFDhpLaJ6rPLuoadHIG2shHPq8WDp9YdNokTfKLtGRml9WQg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5062.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(39860400002)(366004)(396003)(478600001)(4326008)(7416002)(186003)(8936002)(2906002)(6506007)(36756003)(54906003)(110136005)(316002)(26005)(2616005)(122000001)(38100700002)(38070700005)(6486002)(85182001)(64756008)(66446008)(6512007)(66556008)(66476007)(91956017)(76116006)(71200400001)(66946007)(5660300002)(83380400001)(86362001)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b1dqazQ1RmE3ZWRlUXU3RU5HYkFIT01sbFMzdmQ1QlEzOWdiQmRsY20wb0N6?=
 =?utf-8?B?NjllaXN4YkFpemEzeEljcUFLRlI0TlpGZUNCelJmU3doSjU3RURVbkZ6VkZK?=
 =?utf-8?B?MmdjODdhdTA0dzYxcTFBZndpNDFVY3NKQ2ZzdTQxYWxWYytGY3ZaWDBrWUhY?=
 =?utf-8?B?M2dhYXc1eHp5VXBOMmJBTDhOQ29iazVFRVJlSks5NmppMzFNMm1SY1JyUS9O?=
 =?utf-8?B?dUh0a1dIZ2lFeVhWVld5ZGFvckhMaW43bzBCS2xGYnJ2dk85QjhpRXIxZjhn?=
 =?utf-8?B?WFBKMGtEbVBBVlVRVGhpM1VPRzFZRitFU3h0a0l3QlZGTjJDL1UwVlo4czZE?=
 =?utf-8?B?MU1uRXl1d3VSdXRTY1FCL1JQRjVFQWh2QXR5Z3VVRkx6OFN4cHlMMS83UWU0?=
 =?utf-8?B?ZjhsdEZJNUhGRFM1QWdMOWg1amwyMFhjOUl1ODE2QUlxdlZObmIvOEczaElP?=
 =?utf-8?B?VmpuZk9TeDF3WmdiK1BqTkJlbFIwWk5LczZzWmdFQ0VuRTEzbmRwdEVKNWpo?=
 =?utf-8?B?WFIxN2J6c1Z4K0pzRzcxdmtxVEZUVlFVOC9hWXRFajI0MWVmSjVOMGVjcDA0?=
 =?utf-8?B?bWtWQ09tcDlkL09EMU10QWRrcjMzSGFpaEFyQk8vaUtUcDlNc3VxWGRsRUJ5?=
 =?utf-8?B?YVdQQ1p6c0t6UytsTHJHOTNXWTNNSnVacE4xb2N3Qk9BTEdvTThxY29ZZnVT?=
 =?utf-8?B?K0lZeDJtT0JYdEd0R0d5SXlwdkFjckx0cnF3MzhCaURCbEFOOTFEcXpzQldM?=
 =?utf-8?B?aU52OHhsZmN6cHFMaEJOSGNkWWxTZlhEM0VYSGxJT01zRmxGR1d6ZjFmd2Zm?=
 =?utf-8?B?OHBFU0tPcHNhNE5NRFlqM2hrV1BIL1o3a05IWG5VVHBoaS9LNHYwWlFROGNw?=
 =?utf-8?B?QTY0cTV3aVdMZmRYUEJQQytaUlZYeHhBeFRXR0dqZDdBd2t5QlBCZ1Y1WTNu?=
 =?utf-8?B?S09mMHFNV2tCcjlKekdqdnZ3R015NUdHdlFaSk1WeHdVOUFKTGVPYkpQM2gz?=
 =?utf-8?B?V3pjcnJ0b2MxWUxUaEZLVG9sWHQxbHc2RWsyOHdzZDBLM29aV0ZHUUticnor?=
 =?utf-8?B?V2daSlp4aklhYm9DRE9vbStWeE56bURIcHA4bkswdmdBck41anAwbVdJaEhw?=
 =?utf-8?B?VjhVVHd0OWg4WURMVFBvZDZlbEN6aDRIV3JBZTBWUEh2QXFMdWxwZnJ2U0J6?=
 =?utf-8?B?UVdvZTdVVzU2R0xqbncyalJiRDVzbVh3dStxM1BSdllwZ3hSdUY5TUxZZVIr?=
 =?utf-8?B?cHhsSFk1K3IwZTNpWk5nWjlXMHBRL0NLMUxyUVpjd0kvdXhxZXY3QXNsY080?=
 =?utf-8?B?eWFaS212WjdNdy84YUx2YzR3aDhLdlQ0b3FGQzBtNlp6SDJURDMvanFkaWlP?=
 =?utf-8?B?bzI3cmFjUnVodUJ0Y2YzV1VMTVR1dCtDb2Q3OWRiQ29KMFpNR0VINSsrRW9O?=
 =?utf-8?B?NjJQT0dubkczY1lyUTM2aWswSWNWNlVxTk9aRXhlOGpsN1RUYnNpRW9KdnA3?=
 =?utf-8?B?R1dTQ0dkb1VSdHZ1VzRTakRsQkllZFdqNnRCQzB6ZlhiSCtvZzI0VGQ3M1hH?=
 =?utf-8?B?Sk96T0M1MW9xemllVjgrY3BuVlZtTHlKY1hLdHRTbW13aHNnWk1VdUVGTHFa?=
 =?utf-8?B?YUtYTDg5Q3FsQjA5YlMzbE9SbktZejY3SW9tSWZnUjF3VzlSNTFVMWdRNHg2?=
 =?utf-8?B?MjlCU3o5MVE3NjgxNUhnY0NMdkFDaXJXU0JOQjlYeC9mVzBiMFIyRGU3Zjl2?=
 =?utf-8?Q?FaT3EuCKl/O1rrQjP6mjlil/jpAPsXsoSAE7uVx?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <29A93A34252A9F4FB84EA87EADC422B8@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5062.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f62dbab7-b88a-41dc-8168-08d9614e18b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2021 07:10:29.8263
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yJxUNYC/bAveQCssxh9K0kNa78rsAOXNj+CQzfPtCq8em2PFCRLEyoXkwRxD5hBHnLl7FvuzqqLK/r3NlS7oR/+kIWX/I4+KaaIJ0kUylgI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0302MB2629
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

T24gVHVlLCAyMDIxLTA4LTE3IGF0IDA1OjA1ICswMDAwLCBQYXdlbCBMYXN6Y3phayB3cm90ZToN
Cj4gPiANCj4gPiBDaHVuZmVuZyBZdW4gPGNodW5mZW5nLnl1bkBtZWRpYXRlay5jb20+IHdyaXRl
czoNCj4gPiANCj4gPiA+IHVzYl9lbmRwb2ludF9tYXhwKCkgb25seSByZXR1cm5zIHRoZSBiaXRb
MTA6MF0gb2Ygd01heFBhY2tldFNpemUNCj4gPiA+IG9mIGVuZHBvaW50IGRlc2NyaXB0b3IsIG5v
dCBpbmNsdWRlIGJpdFsxMjoxMV0gYW55bW9yZSwgc28gdXNlDQo+ID4gPiB1c2JfZW5kcG9pbnRf
bWF4cF9tdWx0KCkgaW5zdGVhZC4NCj4gPiA+IA0KPiA+ID4gU2lnbmVkLW9mZi1ieTogQ2h1bmZl
bmcgWXVuIDxjaHVuZmVuZy55dW5AbWVkaWF0ZWsuY29tPg0KPiA+ID4gLS0tDQo+ID4gPiAgZHJp
dmVycy91c2IvY2RuczMvY2Ruc3AtbWVtLmMgfCAyICstDQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4gPiANCj4gPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3VzYi9jZG5zMy9jZG5zcC1tZW0uYw0KPiA+ID4gYi9kcml2ZXJzL3VzYi9jZG5z
My9jZG5zcC1tZW0uYw0KPiA+ID4gaW5kZXggYTQ3OTQ4YTE2MjNmLi5hZDlhZWUzZjFlMzkgMTAw
NjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL3VzYi9jZG5zMy9jZG5zcC1tZW0uYw0KPiA+ID4gKysr
IGIvZHJpdmVycy91c2IvY2RuczMvY2Ruc3AtbWVtLmMNCj4gPiA+IEBAIC04ODIsNyArODgyLDcg
QEAgc3RhdGljIHUzMg0KPiA+ID4gY2Ruc3BfZ2V0X2VuZHBvaW50X21heF9idXJzdChzdHJ1Y3Qg
dXNiX2dhZGdldCAqZywNCj4gPiA+ICAJaWYgKGctPnNwZWVkID09IFVTQl9TUEVFRF9ISUdIICYm
DQo+ID4gPiAgCSAgICAodXNiX2VuZHBvaW50X3hmZXJfaXNvYyhwZXAtPmVuZHBvaW50LmRlc2Mp
IHx8DQo+ID4gPiAgCSAgICAgdXNiX2VuZHBvaW50X3hmZXJfaW50KHBlcC0+ZW5kcG9pbnQuZGVz
YykpKQ0KPiA+ID4gLQkJcmV0dXJuICh1c2JfZW5kcG9pbnRfbWF4cChwZXAtPmVuZHBvaW50LmRl
c2MpICYgMHgxODAwKQ0KPiA+ID4gPj4gMTE7DQo+ID4gPiArCQlyZXR1cm4gdXNiX2VuZHBvaW50
X21heHBfbXVsdChwZXAtPmVuZHBvaW50LmRlc2MpIC0gMTsNCj4gPiANCj4gPiB0aGlzIGxvb2tz
IGxpa2UgYSBidWdmaXguIERvIHdlIG5lZWQgdG8gQ2Mgc3RhYmxlIGhlcmU/DQo+ID4gDQo+ID4g
SW4gYW55IGNhc2U6DQo+ID4gDQo+ID4gQWNrZWQtYnk6IEZlbGlwZSBCYWxiaSA8YmFsYmlAa2Vy
bmVsLm9yZz4NCj4gPiANCj4gDQo+IEl0J3Mgbm90IGEgYnVnZml4LiBUaGUgcmVzdWx0IGlzIHRo
ZSBzYW1lLg0KDQoiKHVzYl9lbmRwb2ludF9tYXhwKHBlcC0+ZW5kcG9pbnQuZGVzYykgJiAweDE4
MDApID4+IDExIiBpcyBhbHdheXMgemVybw0Kbm93IQ0KYnV0IG5vdCBmb3IgInVzYl9lbmRwb2lu
dF9tYXhwX211bHQocGVwLT5lbmRwb2ludC5kZXNjKSAtIDEiLg0KDQo+IA0KPiBBY2tlZC1ieTog
UGF3ZWwgTGFzemN6YWsgPHBhd2VsbEBjYWRlbmNlLmNvbT4NCj4gDQo+IC0tDQo+IA0KPiBUaGFu
a3MgDQo+IFBhd2VsIExhc3pjemFrDQo=
