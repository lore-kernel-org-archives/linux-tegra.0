Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDC7BC56202
	for <linux-tegra@archiver.kernel.org>; Wed, 25 Nov 2020 10:47:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4A8BA20857
	for <linux-tegra@archiver.kernel.org>; Wed, 25 Nov 2020 10:47:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="mNpUt25p";
	dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="ddHrZ9t3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728127AbgKYKqz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 25 Nov 2020 05:46:55 -0500
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:62796 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728006AbgKYKqz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 25 Nov 2020 05:46:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1606301213; x=1637837213;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=9X3eeKIqxG6ahJGRh/uRmgtZ9xLJhmljKsdyGZshgjE=;
  b=mNpUt25p4fJxeNOb0nmpDJ2NM8Up4I76dE6bLTMXgwW8GdOKpG1HL/BV
   2B23S9E4x4aCVtZQHJ3McJxtQL+/8l26f8T4O1DiCJ2XlOzNrV5YFFeeb
   fUudG/rO1qIqpwy6JWq27pp5Dc89vF+uK7hhhPoC6EXEHEs50NC9GAm5z
   O8qmz5RXesxC4oM+UizV/+F7hvzpDTgNhUz1BouwwvoP1ZqUSewU1W6g2
   mF+ybte6qmztr51mYprEsayBkeucV9T+V/goKhdsM4ql7RfYQt7ZiC6hX
   ptYipLKOwXZG93pHHm9YbiG0QIlbQlehl3nkYOQYKqpPD4qcMOC2DPIgY
   w==;
IronPort-SDR: 9hACOp6PWvXO98w329kuU15bMSGGix5PjehcKJfplWn/USEYb9uF3KvUCT63ahWQpksybRkN0m
 d7nBih4P8bgJNg4UbDem4jBgJWJrA6SfPz3KoY/LZSXsbkQgdhSU3YVihB/NbFOSGe4gHPJePW
 CnV0iEJGIyrg5Ru/mZYrejrLRbzm+dJbLYORGEmRhpd6fl6tdEhlmTGyApBhpVcw3YF523PKMO
 mLYScwGtBBmAuDXehyA2zCdgwpqThirc7jKUn56K3HC9xw10AVVFXXyR7DkNwZv4LP7IrBknv4
 7/c=
X-IronPort-AV: E=Sophos;i="5.78,368,1599548400"; 
   d="scan'208";a="94838860"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Nov 2020 03:46:52 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 25 Nov 2020 03:46:50 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Wed, 25 Nov 2020 03:46:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LucGQ2ZnEv6laHQ+CwoHE6+WOYDRBkkjh58GmFVymlZww+PdP7RwCQWX01MrZ3PpS4nDIITMCtkWQWIPNAjTTUD2zN2TCT5ucnL1ZudW+YkJmJ7wIEx5V7YaWhB1eh3FWnD98j9uePwAzxd7okhTeN0PNV/wMjw1Kejhs6M9nqBTelpXP0xr6FybZ9dkOQ03h5J+6d9/yoWkfeXT5OV1xJhktOFCJgY3Gtal3Ll/0tRk3YwAC8aNHPFwA8NoJzEDc1Vy5iCmcFmvoFZbh2Laa7a/3g4UU90pzvgjsMX1KwIAiljbrXXkurs4GfBYLgBwCDYaKmHC793acZc232L7NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9X3eeKIqxG6ahJGRh/uRmgtZ9xLJhmljKsdyGZshgjE=;
 b=QeHSFTU4LhXu3sUml6K0aA5pKkxbIQJZwR5OSutzGILZ9wY0y2ETa8voMXEEWeWAbIeVqbMWhsLISKOQ/Bn2+E7NGUzH48MNVSroikFF47PssxBwG8rs2tMwL9193omqbtKDjxU6CEk+7nXzePZ55QFAZMwuGcI25EPc701ptgNVdntsX13xMck61dyyCuJA+BBDG6Bih7XiVI/BhTLr4C6fmDrNGlU0aD3VAwQaxSkmxofTKcj+oLgK5QsXzJlcDlm1tvjLw+Ff1bTrTV+iu9QjbpcBDK6utSMI8wusZTFz28ni2aeDxa6obd36udcguIXls/QGMGyLucoAVsj3OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9X3eeKIqxG6ahJGRh/uRmgtZ9xLJhmljKsdyGZshgjE=;
 b=ddHrZ9t3kS/ol98dHMuu2WUvAkTX59VMBzMrIC7O6T6OMYlK6bRZpcn12GMHvjk5BFzIpBxpglufp3OZyl+NVqLhnT124B9h/UKfNCeLRPWJuqpsF6ULeVfVMZJH3dAwjQ8K0/Tah54yEPe7STTkFqQzH8JKAGUPNfhe6NKobcM=
Received: from DM6PR11MB3420.namprd11.prod.outlook.com (2603:10b6:5:69::31) by
 DM5PR11MB1691.namprd11.prod.outlook.com (2603:10b6:3:b::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.22; Wed, 25 Nov 2020 10:46:48 +0000
Received: from DM6PR11MB3420.namprd11.prod.outlook.com
 ([fe80::f983:dc6d:ad81:9e18]) by DM6PR11MB3420.namprd11.prod.outlook.com
 ([fe80::f983:dc6d:ad81:9e18%7]) with mapi id 15.20.3589.029; Wed, 25 Nov 2020
 10:46:48 +0000
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
Date:   Wed, 25 Nov 2020 10:46:48 +0000
Message-ID: <756a43cf-b7b5-d8a2-ae5c-89bdc3eb26ba@microchip.com>
References: <1605280870-32432-1-git-send-email-claudiu.beznea@microchip.com>
 <1605280870-32432-2-git-send-email-claudiu.beznea@microchip.com>
 <cb096dc5-3757-d72f-41a9-c99007c84b40@nvidia.com>
 <f06c90ca-11c8-961d-1461-a9486933a1a3@microchip.com>
 <37ae7275-3c85-e94e-4ed1-95b6b901c2ed@nvidia.com>
In-Reply-To: <37ae7275-3c85-e94e-4ed1-95b6b901c2ed@nvidia.com>
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
x-ms-office365-filtering-correlation-id: 54f53090-86ff-4104-c4e2-08d8912f68f3
x-ms-traffictypediagnostic: DM5PR11MB1691:
x-microsoft-antispam-prvs: <DM5PR11MB1691A0FBBD56713BC88417C887FA0@DM5PR11MB1691.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 90izSc+KV+I9ThquvSObmwhlTxMXC5Pk4hSjQOlV674ncoWsPdICvzlMkoI9l09Cm3I5Qy7wcLyrQ0wVbdwTwrkvV4eEBIbH6ncJfRQRq8KCbFoDWhQJSumV55MXVeC48dRMopxD+Bb63df6NxPrtAjyN1IRGdbYtdr6EKFfCUKa4MjkVf+2ndv6NGZXIDISV11/CeV3Gzmw4ZfJXnoUwpG49c1XS1NvPHpb0BKFsCE9b47PbkrTnWTEafPs7AOcns12b4L0bWkQkVAD10wmQvC2LOsQvRiXbL2pDFYR3V2lIOQYJrhsR91hua5nFAbO1qfbm9UfxApFY8PLaX94b+Z5xK9ZS3ViUePqrgb4tBGRiElsJ1baNnaO/Sf8FeUiOLQB56q7OObdpfiHqSa+AHHNtc4hYZ5eRNr/xas9yz3GSKTp06rKT3qRx3VaLtrQnlw5rCf7V2n+xFqNam1YaQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3420.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(346002)(376002)(136003)(396003)(366004)(53546011)(66556008)(83380400001)(6506007)(64756008)(91956017)(15650500001)(76116006)(66446008)(8676002)(316002)(66946007)(66476007)(186003)(26005)(36756003)(2616005)(7416002)(110136005)(8936002)(2906002)(31696002)(86362001)(5660300002)(71200400001)(4326008)(966005)(6512007)(6486002)(54906003)(31686004)(478600001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?dG5jYi9QaXprQ3ZnbTAzYUJTZ1VnU0dBS05iRHBPQzkyL0ZyUTU1cC9DMnc3?=
 =?utf-8?B?TzZOU2lUOFZJM0hHVHRQTm1DeHVSMzNvcVFwMEQxS3Vid0xwaGNhdnIzTjA4?=
 =?utf-8?B?YWdhY2ROVTFDZVlMQzFlaXNxOE1NaW1nTFQrcWkxNURGSEdtNWdnZWZkSVlm?=
 =?utf-8?B?bGNLRFVlWlJBN1N1N01DVUsrT0pMYUpqTnZwUHNGMG8yZ3VPN0NBUjA4SnVI?=
 =?utf-8?B?M1RBZkhNYnZVMFBBcU5HeE1VNmJQdkM5MnZMTkhUR3lIY2pGMjBWOWVhZ09G?=
 =?utf-8?B?alRGWVdFdlI2UFp1dUhTN3FxVFJORG1pWkFQRm9QSHlpVFVHV2dIZWg5UjBO?=
 =?utf-8?B?cHdwVVdOOW1BTXB4U1R6UFphQUJha1ZWTlJ5c1dXcUYyemkwejFEVno4T0Fm?=
 =?utf-8?B?OXdZWEdNQ0dlRGN6SjU3ZnUwUXNFei9yVllHMVlVV2lZejl5SG9QUU93aVYv?=
 =?utf-8?B?RnUwVjh4UENHdVdiaFROTWQ1ZG1BeUFnSVFYaGtQUldmZHRPZE1uRDNSSzlI?=
 =?utf-8?B?QWErbCtBdk96WkZkVDg3SGZnQlN4S0xIOG8wVDhRM0VBenRuUjluWUUyTlU2?=
 =?utf-8?B?MzNyQ0gyWTZpb2wrNDBQQ3VJc0xTMUdmcGdKSjhUTEw0azlQMlhwNE0waEVp?=
 =?utf-8?B?am5MTGM5WVlhTnZsRDlieWdqNzd0bG5GM2Z1UVI3Z1BSSDJLbGs1UVhNOFRa?=
 =?utf-8?B?R21vNElNV1FDeWpNWHo2aUw2MzNuL3locXJMeC9BZ241T1dqbmZSM21CdFBu?=
 =?utf-8?B?bVhhSk9TaHF4T0hES3kvRURUaVMwa2JTbVVsVU1Zc20vdFJhbW9RQTJhbGVQ?=
 =?utf-8?B?QnM4bzlhUDJOZUx2eFY2U3FZcDNxbmxyYWh2VVZvdWpRSHBKc05XMjg3VjdY?=
 =?utf-8?B?WmRLL1MwdkxndU93WkVHTjZabkw0elFnenlXRERhNVRsRXg4V0RLN2pGS1U2?=
 =?utf-8?B?VE1CdkNnOWFkRUZUWU8ra1RpSFdGMjNPOFl2OENBRmFVNkdTQ05NVDg1RVFK?=
 =?utf-8?B?Wk5xT00yckVVaVl6TUNMSEc4SE80Q0ltbmx3VW5rNjhDQ2kwOEhXSC8xVlVj?=
 =?utf-8?B?RGpuNjFCY2JTSU1NdTZQZ1piK25wSDNtZUxRalluWndDUVNHSzNtZDljK28v?=
 =?utf-8?B?Qi9CWVQ2cmVmQkx0TCtXTU4va0VjQ2M3UzZwZ3p2YUdGdjk3Rms4ZnZrdkgr?=
 =?utf-8?B?L3dGUDl0RG4xbTNraE5yWHF0eWJqMUFiblV2THl6WjZMbTNuTlEyQmd2MThY?=
 =?utf-8?B?dFFwb0ZFK1ZSMXdqZUNOYnFWZVZtUitscHhiTWQ4YW12cjBRQzVRbzNJeG8r?=
 =?utf-8?Q?LYrnuDirnhLNsDU66ULVDM7umdDbzB2w7t?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <072C7BE6C45DD341A187FC961F3FF31A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3420.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54f53090-86ff-4104-c4e2-08d8912f68f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2020 10:46:48.2532
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: afg8lxAuezYRd3CXG8s9Pe9mTKil+6AaGR3VbA/Ghzm01umIZ1tFYFSH3k3CZ1L/WN2nuOpUxtZwBJcMUVoYKq0sTOPg5GSAL1LalB4KdOQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1691
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

DQoNCk9uIDI0LjExLjIwMjAgMTU6NDEsIEpvbiBIdW50ZXIgd3JvdGU6DQo+IEVYVEVSTkFMIEVN
QUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtu
b3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gT24gMjQvMTEvMjAyMCAxMToxNCwgQ2xhdWRp
dS5CZXpuZWFAbWljcm9jaGlwLmNvbSB3cm90ZToNCj4gDQo+IC4uLg0KPiANCj4+IEkgd291bGQg
c2F5IHRoYXQgYSBzb2x1dGlvbiB3b3VsZCBiZSB0byBoYXZlIGEgbmV3IGhlbHBlciB0byByZXRy
aWV2ZSB0aGUNCj4+IGxpbmVhcl9taW5fc2VsIChlLmcuIHJlZ3VsYXRvcl9taW5fc2VsKCkpIGFu
ZCB1c2UgdGhpcyBmb3IgYWxsIHRoZQ0KPj4gY29uc3VtZXJzIG9mIHJlZ3VsYXRvcl9saXN0X3Zv
bHRhZ2UoKSBhbmQgdGhlIG90aGVyIEFQSXMgdGhhdCBwYXRjaA0KPj4gInJlZ3VsYXRvcjogY29y
ZTogdmFsaWRhdGUgc2VsZWN0b3IgYWdhaW5zdCBsaW5lYXJfbWluX3NlbCIgaGFzIGNoYW5nZWQN
Cj4+IChyZWd1bGF0b3JfbGlzdF92b2x0YWdlX3RhYmxlKCksIHJlZ3VsYXRvcl9zZXRfdm9sdGFn
ZV90aW1lKCkpLiBXaXRoIHRoaXMNCj4+IGNoYW5nZSB0aGUgbG9vcCBpbiBmaW5kX3ZkZF9tYXBf
ZW50cnlfZXhhY3QoKSBzaG91bGQgYmUgYi93DQo+PiByZWd1bGF0b3JfbWluX3NlbCgpIGFuZCBy
ZWd1bGF0b3JfY291bnRfdm9sdGFnZXMoKS4NCj4+DQo+PiBNYXliZSBNYXJrIGhhcyBhIGJldHRl
ciBzb2x1dGlvbiBmb3IgdGhpcy4NCj4gDQo+IA0KPiBCeSB0aGUgd2F5LCBJIGRvbid0IHRoaW5r
IHRoYXQgVGVncmEgaXMgYWxvbmUgaGVyZS4gSSBzZWUgc29tZSBvdGhlcg0KPiBkcml2ZXJzIGRv
aW5nIHNvbWUgc2ltaWxhciB0aGluZ3MgWzBdWzFdWzJdIGFuZCBzbyBJIGFtIHdvbmRlcmluZyBp
Zg0KPiB0aGlzIGlzIGdvaW5nIHRvIGJlIGEgcHJvYmxlbSBmb3IgYSBmZXcgZHJpdmVycy4NCj4g
DQoNCkFzIGZhciBhcyBJIGNhbiB0ZWxsIG1vc3Qgb2YgdGhlIHJlZ3VsYXRvcl9saXN0X3ZvbHRh
Z2UoKSBjb25zdW1lcnMgYXJlDQpjaGVja2luZyB0aGUgcmV0dXJuIHZhbHVlIGFnYWluc3QgYSBb
bWluX3VWLCBtYXhfdVZdIHJhbmdlIG9yIGlmIHRoZSByZXR1cm4NCnZhbHVlIGlzIGEgbmVnYXRp
dmUgZXJyb3IgY29kZSBvciB6ZXJvLiBUaGUgY29uc3VtZXJzIGFyZSBsb29raW5nIGENCnNlbGVj
dG9yIHRoYXQgcmVzcGVjdCB0aGUgYWJvdmUgcnVsZSBmb3IgdGhlIGVudGlyZSBbMCwNCnJlZ3Vs
YXRvcl9jb3VudF92b2x0YWdlcygpXSByYW5nZSAoSSBoYXZlIHRvIGRvdWJsZSBjaGVjayBmb3Ig
dGhlIHJlc3Qgb2YNCmZ1bmN0aW9ucyBtb2RpZmllZCBieSBteSBwYXRjaCkuIEluIGNhc2Ugb2Yg
Y2xrLWRmbGwuYyB0aGUNCmZpbmRfdmRkX21hcF9lbnRyeV9leGFjdCgpIHJldHVybnMgaWYgaXQg
ZmluZHMgdGhlIDFzdCBpbnZhbGlkIHNlbGVjdG9yOg0KDQoJbl92b2x0YWdlcyA9IHJlZ3VsYXRv
cl9jb3VudF92b2x0YWdlcyh0ZC0+dmRkX3JlZyk7DQoJZm9yIChpID0gMDsgaSA8IG5fdm9sdGFn
ZXM7IGkrKykgew0KCQlyZWdfdVYgPSByZWd1bGF0b3JfbGlzdF92b2x0YWdlKHRkLT52ZGRfcmVn
LCBpKTsNCgkJaWYgKHJlZ191ViA8IDApDQoJCQlicmVhazsNCg0KCQlyZWdfdm9sdF9pZCA9IHJl
Z191ViAvIHRkLT5zb2MtPmFsaWdubWVudC5zdGVwX3V2Ow0KDQoJCWlmIChhbGlnbl9zdGVwID09
IHJlZ192b2x0X2lkKQ0KCQkJcmV0dXJuIGk7DQoJfQ0KDQpNYXliZSBpdCB3b3VsZCBiZSBiZXR0
ZXIgaWYgdGhlIGxvb3AgY29udGludWVzIGluIGNhc2UgcmVnX3VWIGlzIG5lZ2F0aXZlDQpvciB6
ZXJvPyAodGhlIHplcm8gY2FzZSBpcyBnb29kIGZvciB0aGlzIGZ1bmN0aW9uIGFzIGl0IHdpbGwg
bWFrZSB0aGUNCihhbGlnbl9zdGVwID09IHJlZ192b2x0X2lkKSB0byBiZSBmYWxzZSkuIEJ1dCBh
cyBNYXJrIHNhaWQgaW4gdGhlIHByZXZpb3VzDQplbWFpbCwgdGhlcmUgY291bGQgYmUgcmVndWxh
dG9ycyB3aXRoIGdhcHMgaW4gYmV0d2VlbiBtaW5fc2VsIGFuZCBuX3ZvbHRhZ2VzLg0KDQpXaXRo
IHRoZSBwcmV2aW91cyBjb2RlIGl0IHNlZW1zIGl0IHdvcmtlZCBiZWNhdXNlIHRoZQ0KcmVndWxh
dG9yX2xpc3Rfdm9sdGFnZSgpIGNhbGxzIHRoZSBhczM3MjIncyBsaXN0X3ZvbHRhZ2Ugd2hpY2gg
aXMNCnJlZ3VsYXRvcl9saXN0X3ZvbHRhZ2VfbGluZWFyKCkgd2hpY2ggY2hlY2tzIHRoZSBzZWxl
Y3RvciBhZ2FpbnN0DQptaW5fc2VsZWN0b3IgYW5kIHJldHVybnMgemVybyBpbiBjYXNlIHRoZSBz
ZWxlY3RvciBpcyBsb3dlciB0aGFuIHRoZQ0KbWluX3NlbGVjdG9yLiBQbGVhc2UgY29ycmVjdCBt
ZSBpZiBJJ20gd3JvbmcuDQoNCkFueXdheSwgSSB3aWxsIHByZXBhcmUgYSBmaXggZm9yIG15IHBy
ZXZpb3VzIHBhdGNoIHRvIHJldHVybiB6ZXJvIGluIGNhc2UNCnRoZSByZWd1bGF0b3JfY291bnRf
dm9sdGFnZXMoKSByZWNlaXZlcyBhbiBpbnZhbGlkIHNlbGVjdG9yLiBUaGF0IHNob3VsZA0KYWxz
byBmaXggdGhlIGNhc2Ugd2l0aCB0aGlzIGRyaXZlci4NCg0KVGhhbmsgeW91LA0KQ2xhdWRpdQ0K
DQo+IEpvbg0KPiANCj4gWzBdDQo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51
eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL2RyaXZlcnMvbW1jL2NvcmUvcmVn
dWxhdG9yLmMjbjYxDQo+IFsxXQ0KPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGlu
dXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9kcml2ZXJzL2NwdWZyZXEvczNj
MjQxNi1jcHVmcmVxLmMjbjI2Mw0KPiBbMl0NCj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIv
c2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvZHJpdmVycy9sZWRz
L2xlZHMtcmVndWxhdG9yLmMjbjI5DQo+IA0KPiAtLQ0KPiBudnB1YmxpYw0KPiA=
