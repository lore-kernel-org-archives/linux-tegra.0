Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3670DC433B4
	for <linux-tegra@archiver.kernel.org>; Thu, 29 Apr 2021 05:51:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EFA45613B3
	for <linux-tegra@archiver.kernel.org>; Thu, 29 Apr 2021 05:51:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231405AbhD2Fv7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 29 Apr 2021 01:51:59 -0400
Received: from mail-mw2nam12on2057.outbound.protection.outlook.com ([40.107.244.57]:60448
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229814AbhD2Fv6 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 29 Apr 2021 01:51:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W2G/0HR97+GNoEFwH3S8t7jwNOLCrNT3Bz0d9dZLtmePx7DLwhXPSt2rGKJsPpvL8niIXCHlSpb2OJFoDWfL5mSeMnM5y0iG0p2+7oi4CD8YSz6qi8TUCxYlDJExIiu+VwGPOBEx2J2iFqJbgBkuI2Ntqdncd9HldsbXOf5+L2SxxWMZklwduP0eSsffF20ae3kby4CngD3QhbQltk4mQ56MxvgTnbAwt3OUO63WE3kDGxoBAJCSAHxElAdxjW0DgRbYelqUB/D/eSFEm3jmHmy0TzMJbbTgvizkhZNFYGSdsDFeJZ1vWLe0qOiWKWWrah6vAqTvSgWzPg3nI0/nCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fm7sDfRGhPpuTbCsyY5QpOp7bo1mF3Iu5poUu8QkNsU=;
 b=Yd8Cal+tWk88/i3nyeqjCadHgslJGCeM7C45uKCGv/TP8PrjxARQEhLDPng4dq8GaJPPemxa/Y8+BN4PrdQHHCFUiwfkcik1Cq2PHpqC86w8Itsj33j8RVUWUDRmwcW8y8Xp61+bMTVkjC/hgXO7MzWxvJHpiHwQvJv1mLmh3jCedoOC4arKWk9chiRuUDOBlRSVaScdhy4hzu0DHZxrjcgkXivkgMbM8/QjH6dzHCsFJERA36W0AWSzCivxIAVvFWWq32Ll/0m80ROwCI8/a5xuySkSCKc9Y5/fh+sIBkQkEaejRsZ4C7VRf5HJZ9Qdkb4gmUFhZWNMZ9sy6emxUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fm7sDfRGhPpuTbCsyY5QpOp7bo1mF3Iu5poUu8QkNsU=;
 b=XotlWKcbSA2EWgLk+1hVuDLjbyWqhBgv9fiHjcbZgh3HYZH5yhZ1pc4rZ952LPTxmjw9ej9neFmHervm8x14DekCtJ1VdRniPYIKAEhzZn3nPjaLs73+dUKxNQxGi1ynwWvoK5ZaCaBIk4K3krMQc2h402FCENjjnF5csMe9oZ80lnbfKSQKh6aDoRUAOQdW8fBLKwcB+abxxjWgDc51EToV5sHW3relIiGJ3vwq5xOZId8PEH85+Yv+1AO1Vxka3wNVMzjIHcioDntYjOMKHeBbmeXHGt9uvb/L6lO4EQ8rsQefBsOSkJVDByEGYGU9Kgv/ghAXWKFJrJgdcML9bQ==
Received: from BY5PR12MB3764.namprd12.prod.outlook.com (2603:10b6:a03:1ac::17)
 by BYAPR12MB2997.namprd12.prod.outlook.com (2603:10b6:a03:db::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.25; Thu, 29 Apr
 2021 05:51:04 +0000
Received: from BY5PR12MB3764.namprd12.prod.outlook.com
 ([fe80::d05:4bca:ea51:15af]) by BY5PR12MB3764.namprd12.prod.outlook.com
 ([fe80::d05:4bca:ea51:15af%6]) with mapi id 15.20.4065.026; Thu, 29 Apr 2021
 05:51:04 +0000
From:   Krishna Reddy <vdumpa@nvidia.com>
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: RE: [PATCH v2 0/5] iommu: Support identity mappings of
 reserved-memory regions
Thread-Topic: [PATCH v2 0/5] iommu: Support identity mappings of
 reserved-memory regions
Thread-Index: AQHXOF4qB/GkhG0T5ESzLET/7zFLw6rDRYEAgAVgmoCAAMw2gIAAywnQ
Date:   Thu, 29 Apr 2021 05:51:04 +0000
Message-ID: <BY5PR12MB3764DC583BC2AFE0CA674DDFB35F9@BY5PR12MB3764.namprd12.prod.outlook.com>
References: <20210423163234.3651547-1-thierry.reding@gmail.com>
 <869ec3a2-26df-2ce8-bd21-b681d6ef3985@gmail.com>
 <BY5PR12MB3764DFDEA8125650799DC76CB3419@BY5PR12MB3764.namprd12.prod.outlook.com>
 <bbcf6dbe-367b-38b2-91bf-9d5f4cd2c57c@gmail.com>
In-Reply-To: <bbcf6dbe-367b-38b2-91bf-9d5f4cd2c57c@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [216.228.112.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ad8acda4-644a-4ca7-938d-08d90ad2c705
x-ms-traffictypediagnostic: BYAPR12MB2997:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB299712CEA6CF425BBC7FEF9BB35F9@BYAPR12MB2997.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bZG7vzEQKwpkTX+6fYgKIT0bJYkTnaXWE7TkDVVLEqnPQNojaFuSPlZnd2mRHYPwyUW6w347YC3wMoaNCt1NXZkwpIY8s4BT1tw8GU6Py2goWU0crvdgKUmyVs050/72nqz7V/41Kj4u8ejW5kxWUk/S/+62JmRhFBY7RDY9qhewHMVTKHILPUDB89gx4yzvrl1RZOGDRJfSqZgDn0fWfY7nXPikAucFJ49RseXAJnvkBtCJXAWveiz4s1MFH29twYeeKfJiDYT5L9ObCfwd/S+LCZVxQfLJkEDmG7FclXrpLKv+rW9EpTGdgHUMdqCqnMlsAWmEoNgYyfvad3MFs+hGR3WdRZj/yOS8ue17XOKF7sjqdRM+s9E7IZvHsk4q2DLR6oTQGC/UEL8qlO1wMP1CoCHE2m29WlRjiC6qtewZd/MuEWvD9iaXXkIs8mVDv50ActCnnuOHOop+hXsBNqhQf4/f0MD1oBasPLeQpvO5dg9D46lO+GousbY/sO0v6y2fBBAj+aSPswajUtLBfhEacAQRea9To6Of/wnwX486BRQvF2kaDii8l3TfWOH+pHk4xYI8Lkc/iq0nl2xHiygYWJVsijCqj9GoSDkgs8w=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB3764.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(39860400002)(366004)(396003)(376002)(2906002)(52536014)(7696005)(86362001)(54906003)(38100700002)(64756008)(9686003)(8936002)(83380400001)(66476007)(66446008)(4326008)(66556008)(33656002)(6506007)(110136005)(186003)(55016002)(76116006)(71200400001)(5660300002)(8676002)(26005)(478600001)(122000001)(66946007)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?NDhacHdCOWpJcjJIeEhmS2RSY0RQTFk0bHBndWRFZW1MWEE1MXhzVUZLM0ZE?=
 =?utf-8?B?T3pnNWl0ZTJyVVJKRmk2ckRNYlRyMmZBOHMwMEllTFVSUUZ3M3VLZ3A5TkJo?=
 =?utf-8?B?SDZtUEpoWFpFWCtxejIya1F0Nyt3S0hnYzhNVmZnL0VqYWZIOVBWU05uYmNM?=
 =?utf-8?B?S1o0NGhEWmpVaXBTSUlQL2lINGtLRjVqQTA2dTNLRFNCSzhLNE9KMTlQL1ZK?=
 =?utf-8?B?Nmt5aDlNT003YkRpSmM0SUd6Q3dwb2k5RHdCQkhnMlh0QXVMM1phMXF4VDFo?=
 =?utf-8?B?cEtLN3BCT3ZCekNwU2h6c0pJTDUrdDZBeVMwU2NQUHUzaDBFeWhHdmJ1ZHA4?=
 =?utf-8?B?Njd1S2owZE9pUnlEOUxUc1BLQjFUT2pPODdhTVZLeVN1dGNjUk1xOEk0eGlu?=
 =?utf-8?B?Q1U3MTc4emlnKzEwWjNQYmM5NE84cmlFQmN0YzY4Qm5nSGkrSVJ1ZVRJdTRh?=
 =?utf-8?B?bDVzdmVEUFpBYkpQSEI3UzFlQWhBY2lqVmJ2eUZqTjNOQjNheTIrSWxibnJ6?=
 =?utf-8?B?M2R1V2liZXhuSkdCMDJiTDZGdEVTUWpmbDA1b3ZTYkF3VUgrRVFRSTdoS2dL?=
 =?utf-8?B?dGNIZkp3Y1ZTR2psQWV4OGVxVlZKTGNPNndZUitYQWtWRHlSQXBYdnY1YzRj?=
 =?utf-8?B?cmpTSGpvN2pXUWJtaXBwVFNQTWFVNGpwVlljd1lvdUJGUlVlV0lQMmc0N2p3?=
 =?utf-8?B?TEQ5YjRRRHhSMVBlbFk3cGtFQ1o2TjBydmlTZE1yem85ell5dFZEa09sS0FZ?=
 =?utf-8?B?M254SHVNRU1ySTBWbUFtMnFFb2VKeHZCemhhZGd3cXdIMlBhaktZOEFRMzhS?=
 =?utf-8?B?OEZSTG10N2ZQZnlBbE1id2Vzai9RYk1FdVhxaXdoZUhndzdQOTdmUXd6Ylpm?=
 =?utf-8?B?M21jOU1hTVA0cVBxbDdtVDZEaDdLY0Q4T1NBUnJKRGFkSzM5Z2xaZDVaMnpt?=
 =?utf-8?B?a3ljWGlhSlh3WUYzUnlISEdHSXVFL0dxTGo5OUZUZGVHYzlBQ1dvaHd1eHZX?=
 =?utf-8?B?TnpQQTg0Q1U4N1pBRXZtYW5MOXBXajRkeGNKRXV2UXUrdEpaaW5UclJoUzE5?=
 =?utf-8?B?eDFub01PMzhxRmZKWm9JYmRqMDl4bmdpUnN3cHZYSWUzbWdEYW9XMitnRkU4?=
 =?utf-8?B?N1R4a1R6NnN5SHpIWFZTMmMwRS9ybE41Um10Vk11eWc3L1R5dlVRUVZiK2g4?=
 =?utf-8?B?SXltcHdKTzh5cWlFVHVGQm5SeVFQNWVWa2tKa3Z4bUMzbnlyWTVYVzlNM21k?=
 =?utf-8?B?Q2tBWXJMMlA3Rk5lUFhqNTMzeU5ETGc2Nzk2VFovT3dkUmJPclB3Y0VEdnJu?=
 =?utf-8?B?a1l4MldUa25ybDNzWTVYalZQSDhMTDg4Zm0rSjMvU3dmaWZSdHpNSTdLeDNM?=
 =?utf-8?B?c0dEeUpOTU1EQ2dFR0Z1ZllkdTQ4VHRMdWp6TkllSEg4V1JjQk5ldTJqQ2hj?=
 =?utf-8?B?K2czRVpJeG5uNW9LQ3NWa2QrTkwzREk4TU1HQVFEVms0MVZuNnh4d1k1d0lG?=
 =?utf-8?B?TGZhT1RhQUtZUUlpcmYyb0ZzU0MvZGpJZmh4dVhrWU93Zkxucm9Ua3BBck1s?=
 =?utf-8?B?NFZZWXlLQzZyQnJzUi9SSUhleXpTcExjSm5VR2U2a0R0SE1NOEprK2J1dU5j?=
 =?utf-8?B?YlVNNkZtblRWRFA4a0s1UklsY0VtMlhZZnlQNVZkekVNaGZUU1A0OHBoSSty?=
 =?utf-8?B?dWpONWF3bmIzVE5jenNwMGY4dzFzWGNKUytFajkwZm9SQmNHYW9OazBXSGhM?=
 =?utf-8?Q?NMKgcLwpxcni7MvKU3sWcU9+vuCcpeuHCL9EYNf?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3764.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad8acda4-644a-4ca7-938d-08d90ad2c705
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2021 05:51:04.6578
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n2cU2LAypflEGc1pYIzqyqk8TDVB432aZ7eTMAn3QnsiK8fgx4HMM0A2ADvI49IeUUoXlERP9MDynHQTu/gCdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2997
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

SGkgRG1pdHJ5LA0KDQo+IFRoYW5rIHlvdSBmb3IgdGhlIGFuc3dlci4gQ291bGQgeW91IHBsZWFz
ZSBnaXZlIG1vcmUgaW5mb3JtYXRpb24gYWJvdXQ6DQo+IDEpIEFyZSB5b3Ugb24gc29mdHdhcmUg
b3IgaGFyZHdhcmUgdGVhbSwgb3IgYm90aD8NCg0KSSBhbSBpbiB0aGUgc29mdHdhcmUgdGVhbSBh
bmQgaGFzIGNvbnRyaWJ1dGVkIHRvIGluaXRpYWwgVGVncmEgU01NVSBkcml2ZXIgaW4gdGhlIGRv
d25zdHJlYW0gYWxvbmcgd2l0aCBlYXJsaWVyIHRlYW0gbWVtYmVyIEhpcm9zaGkgRG95dS4NCg0K
PiAyKSBJcyBTTU1VIGEgdGhpcmQgcGFydHkgSVAgb3IgZGV2ZWxvcGVkIGluLWhvdXNlPw0KDQpU
ZWdyYSBTTU1VIGlzIGRldmVsb3BlZCBpbi1ob3VzZS4gDQoNCj4gMykgRG8geW91IGhhdmUgYSBk
aXJlY3QgYWNjZXNzIHRvIEhETCBzb3VyY2VzPyBBcmUgeW91IDEwMCUgc3VyZSB0aGF0DQo+IGhh
cmR3YXJlIGRvZXMgd2hhdCB5b3Ugc2F5Pw0KDQpJdCB3YXMgZGlzY3Vzc2VkIHdpdGggSGFyZHdh
cmUgdGVhbSBiZWZvcmUgYW5kIGFnYWluIHRvZGF5IGFzIHdlbGwuDQpFbmFibGluZyBBU0lEIGZv
ciBkaXNwbGF5IGVuZ2luZSB3aGlsZSBpdCBjb250aW51ZXMgdG8gYWNjZXNzIHRoZSBidWZmZXIg
bWVtb3J5IGlzIGEgc2FmZSBvcGVyYXRpb24uDQpBcyBwZXIgSFcgdGVhbSwgVGhlIG9ubHkgc2lk
ZS1lZmZlY3QgdGhhdCBjYW4gaGFwcGVuIGlzIGFkZGl0aW9uYWwgbGF0ZW5jeSB0byB0cmFuc2Fj
dGlvbiBhcyBTTU1VIGNhY2hlcyBnZXQgd2FybWVkIHVwLg0KDQo+IDQpIFdoYXQgaGFwcGVucyB3
aGVuIENQVSB3cml0ZXMgdG8gQVNJRCByZWdpc3Rlcj8gRG9lcyBTTU1VIHN0YXRlIG1hY2hpbmUN
Cj4gbGF0Y2ggQVNJRCBzdGF0dXMgKG1ha2luZyBpdCB2aXNpYmxlKSBvbmx5IGF0IGEgc2luZ2xl
ICJzYWZlIiBwb2ludD8NCg0KTUMgbWFrZXMgYSBkZWNpc2lvbiBvbiByb3V0aW5nIHRyYW5zYWN0
aW9uIHRocm91Z2ggZWl0aGVyIFNNTVUgcGFnZSB0YWJsZXMgb3IgYnlwYXNzaW5nIGJhc2VkIG9u
IHRoZSBBU0lEIHJlZ2lzdGVyIHZhbHVlLiAgSXQNCmNoZWNrcyB0aGUgQVNJRCByZWdpc3RlciBv
bmx5IG9uY2UgcGVyIHRyYW5zYWN0aW9uIGluIHRoZSBwaXBlbGluZS4NCg0KLUtSDQo=
