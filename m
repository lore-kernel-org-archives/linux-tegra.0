Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B7A1C05027
	for <linux-tegra@archiver.kernel.org>; Wed,  1 Feb 2023 20:34:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbjBAUeE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 1 Feb 2023 15:34:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbjBAUeD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 1 Feb 2023 15:34:03 -0500
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2067.outbound.protection.outlook.com [40.107.237.67])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D34D728D4;
        Wed,  1 Feb 2023 12:34:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CyDaUiYZMweRL6GmXG4nLxqY8ogfz9L9V//Y1BanSVxnmjdrDwYQI1YkSHKNfjCCDydA61VEmQQLITLHN/LTDxLHCQN+0BF2SvIqdFPOq6dwKOpxnkUpXIXZshiqsjgRO/wXU59gLDNHtUNvVsKE5Zlbspz8sPVx3rBGyHF8fNUPJ/2VqnkQiDQBKzqKkqaZpEyj5/Jnid8kCHLjgwXGzZYDgAADTVasqGb0O1Ub6OhGy1Ca2NRM2K+NSm/8fIbG2V0zejmebC9EpAcQXz/Kshgxaad38lG+/hkjODiTtT0D4pbJ1aAoWsCGdnjK3oYjK4tGEtJ8C0zNjA3KV5UWKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AIEsiRk5is+d1lOW+OQpT5+9OY6MduVbwBG8lv2BhZ0=;
 b=Vkprbco7EUwYjcQJpR5JreCR21R0+t6MgmvQoku9HhhVe9OLuwFIFyiX0/PMEpypi4virg0Tvpcgo8E4Xp1SnDSJ4tI//jGKHldV2PvEpO/z9k3CeRo4BPyEQPcQnU6Fw5hw+PRH37BmPqIE2Dkp2ihySbu2FXDBQj287OG+KIaglgj2PuPruLQ9M3103WX+y8TiEZ54WYj9aaLVK5QRrERVGTNzJ+/P+xJzqULLFy/l0storOs1IqeGTvuKKYjzRF9OYG9BxSP4UiR9IPiE4HyXw33N+VzoLa0DEelWAO7PvBHtrYBWjVlhDKLMzNToFP4PFEUzH5/aeTzBsn5jMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AIEsiRk5is+d1lOW+OQpT5+9OY6MduVbwBG8lv2BhZ0=;
 b=qI/JqNkyiVcwKzZERodimKKj6MPDbq+ElkqZmPcQtUHacWNHNavQvJvrFyYVVkKZ2WQb2V54k2krSbr9RFxrnWTxH2RQzXrePj5ra9wjQPzaE1fshtuTRtMGV1ypD6yM8Zda2qdQzGxSVx2a+GmY57Wb1PdEQC0uw12+MDKt0epWOm7Ree+t7p/Sszl4EmA0LH0PyZLOhAQMndKeL1JQIqVuKMoEsaFuFUbOonZdCDwuqDooXXSbiIsTF63R0lwxEmsPg74e89tW9j0p5pWazrohiwLKg+bwH8G74EQ7mq0CCCxZQ9Z74doEjYPO/AwgJam+28YDmFcin5Nj3PDR5Q==
Received: from DM4PR12MB5770.namprd12.prod.outlook.com (2603:10b6:8:61::16) by
 DM6PR12MB4547.namprd12.prod.outlook.com (2603:10b6:5:2a9::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.22; Wed, 1 Feb 2023 20:33:59 +0000
Received: from DM4PR12MB5770.namprd12.prod.outlook.com
 ([fe80::ab3:828a:9adf:2be2]) by DM4PR12MB5770.namprd12.prod.outlook.com
 ([fe80::ab3:828a:9adf:2be2%3]) with mapi id 15.20.6064.024; Wed, 1 Feb 2023
 20:33:59 +0000
From:   Ajay Gupta <ajayg@nvidia.com>
To:     Jonathan Hunter <jonathanh@nvidia.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        Wayne Chang <waynec@nvidia.com>
Subject: RE: [PATCH V10 4/6] i2c: nvidia-gpu: Remove ccgx,firmware-build
 property
Thread-Topic: [PATCH V10 4/6] i2c: nvidia-gpu: Remove ccgx,firmware-build
 property
Thread-Index: AQHZNZ3JhH8p/mzhlUKZ8n8Pf8s+ga66QcuAgABJBgCAAAIqgA==
Date:   Wed, 1 Feb 2023 20:33:59 +0000
Message-ID: <DM4PR12MB577082ABC3CE4731E06E4963DCD19@DM4PR12MB5770.namprd12.prod.outlook.com>
References: <20230131175748.256423-1-jonathanh@nvidia.com>
 <20230131175748.256423-5-jonathanh@nvidia.com>
 <936488c6-f86d-3552-1a35-1039eca55c00@nvidia.com>
 <00059af2-dc99-0771-4d30-b7dd94ce1150@nvidia.com>
In-Reply-To: <00059af2-dc99-0771-4d30-b7dd94ce1150@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5770:EE_|DM6PR12MB4547:EE_
x-ms-office365-filtering-correlation-id: 1aaf8c7f-b6ff-4438-2032-08db0493a5c2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4T1kovQM2RoxdH3KVSgF6zJKJlo8Qs+X25K+0zc3vA0JYzs8AQq+C/Hsv1B+nILuAysQeOFjNA3UwHrSA1lUW5a/qYyP3yDZV5ZYw/Skzg977zCfUBZT59sF/qbv37vAIa5mkhnFS5rQGjX5Xt8p/4mdfdVi7CxxxY5AFSgvSSleySXD85q6cZU1YD3Ur5+eyMvRVhsZVl0mUOxF4TCrelTP+DZMpIDWvOG90EJFntqHkh6jh53WXz65KfOj+ZeLXdAmobXQO3Nzx85OPf8T+CtsdFHP/lTS4rpu+v4geY6/sNjqQlBmgCdoAtGvZHOzswI8vkiOFS8z8q+XwW0tqGBfi9/T3RQ1sjdeITWRA9azN3DfFLiEW5x5bX89W98p+qwYdOip9U5l2tbIgpgg0FZTbiztdFUUWPK1s3KMMXsVa6LR3hD8RgUr/iLvK/nCTedwUBf7bd9/ZeJWLjhRqdkcG6Rf913SSBPILge2X1eOSG+leQOacOonVtFiYqcaufWSsCNJHJqJevuGZCefzlJYmoybJw4nrBCE46MHlHdfP5lsg6iQBu/GSrNoZCXbGULwLJLvG+Xr0/zSW/f0jUix4qSMpkC/1oTNTd50ruph3sVpLD1Ykk9i+rix+xfLhECZodOLRCmljZ4KAGz+mDsAL/g2CtnixqSV0Cqye0N/L47ZXu5rLOz4jsTRLVM73QjozZOVoy3brDe6jUi0xA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5770.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(39860400002)(136003)(366004)(396003)(376002)(451199018)(33656002)(86362001)(38070700005)(38100700002)(122000001)(83380400001)(6506007)(107886003)(53546011)(9686003)(26005)(186003)(71200400001)(316002)(7696005)(66476007)(110136005)(8676002)(54906003)(478600001)(55016003)(2906002)(64756008)(5660300002)(66556008)(4326008)(66946007)(76116006)(52536014)(66446008)(8936002)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K3hBS0RZNjgyc20zUGdZOTRVY2N1UEZXYWJEdVB0TmFyWFVlcTlIZ3VjS0M5?=
 =?utf-8?B?NktHVlVRRDBjaDkrYlZBSzkyc2lnZUFYQ0t0aGZpbVVETmVnekFXekJmbUZj?=
 =?utf-8?B?U1NzWjBPRTRNdTloMWluYU9NZ3RJc1hTNTBBTDhrdDh0UHFYc2hzMGVJZWdq?=
 =?utf-8?B?TmQrb1lsanhlWVRhT3JjSUNGdDcvMTNRN0daUmxEbFZ0N2xBdG0ydStzM1Y5?=
 =?utf-8?B?RUlraXI5YzlGRkJONkM3ZHVzOEwyZXp4YTZabW81VVZRa1Y5YlFKOXVDVWlz?=
 =?utf-8?B?aUc0dVJTOXJkN3cxR2JIUTYwWFZjUWZucmlGOHVtZExsTkFYR1kwcXJVaUNh?=
 =?utf-8?B?Y1ZhZ011L2c4cTZIYUx1V2ZLTHhCN256VDQ3RFZtUlBCUndTV2VWVDlpVVdt?=
 =?utf-8?B?cU5qSTlXSURzaVptVGVQV3dHTCtTMHQ1em4yMktWU0p1b3JDZEI0Ky9yR0VN?=
 =?utf-8?B?dFlmRFc2L1o1Wkw5YnFPK1F1Vkk4MFRKdzgvMnpRN3hXMFM0ek8vaWtDOVgv?=
 =?utf-8?B?VUZLTHUxTW1rZ0k2RmpOeGU5dVY4ZjBLcDVKaDFhWEN6OElIbEs2VzRTbVVn?=
 =?utf-8?B?OXFqQVhITGJDbUxHUVBMSlNRWGs0amhrZitwYnFxdHBIZHRIV2themRKTHJF?=
 =?utf-8?B?YTdSRmVBcEdNUEhSdk1XakYwb3VKWGRDc2I3YlVPaTU2OWhGUnkzSHdvNks4?=
 =?utf-8?B?ZUU0ck9EWlkrc0xsN3dkSVZHMG90Z1JXanMvaldneDRqaEc4dmZIdjFkQXlo?=
 =?utf-8?B?UFk2MUVFUUcySVNIbVIvb2hJUnFSMjAvRzNvRFloNWgwaFd2VGkvM0drT0tm?=
 =?utf-8?B?VDhUVGhVK1FvZ3RodWdROW4reGJpMHMxdG56bnhPTmpURVFmTE00dnJxUXZl?=
 =?utf-8?B?YW1Jd25HcFUyUXZvMXRCZjZXWDBPK1hNQllWbVUzRHpFZUVsdHk5SFk2ajR3?=
 =?utf-8?B?b1g1OTFzR3hzdUZGQmlLNnl4L3JFb3pmWWcxenQ4eHpIeWVCRVNtNFFidlVr?=
 =?utf-8?B?L2VvQ290Qnkvc000cGtzWklaVCtRanhFcDU1dHRVeGFhL0M0YmFXYWlJRDQ1?=
 =?utf-8?B?TWV6VkFmV0NCa2dLTFRFS09PZ0s3OWNzTzlnSVFsNWF3STY4cTdHS2I0R1A0?=
 =?utf-8?B?TUdpVythMy9ZSDFpSWhqSnNBSHBFZFVhNU9SUzgyQ0xFelN3eTUyMXRqRTdk?=
 =?utf-8?B?UzZDRGZrRWZWZlBsQUVHZUowb1ltWk5aVzRYSldvK21IRGFUVk0wamdwdVYx?=
 =?utf-8?B?SVFCbjBDaDdTWFFZMU5ZWmtIOHFjRXdIeHBobFdxTSs3Zk16dXE1SmhQS0Nh?=
 =?utf-8?B?OHd3TjkyaDR1Z2JONW8xR2NXYlBuNG5SZmlKRFdwQWxkeUVUZ3FQNXpkMG05?=
 =?utf-8?B?YzZmT2dHcVE2a0pYNkRuR1h0c2FGbFdSY3dnK2xROFJQM0gyMmt5bFVHTW5l?=
 =?utf-8?B?WXYxSkFhZlZVU2RIbzFHY0J6Um1qbHI2R3dXTlFzcGRYSG14Q3BTMm9uRGFN?=
 =?utf-8?B?OGRiRjlmZ0hFUTFOQXJ5YVM0ZVE2czdDbGRITm56WGNjMUFVM2ozSzN6REc3?=
 =?utf-8?B?akd1Q0hvVjhIbDRTUVpMakJjS0FCWDFZSS9zbVgvVzRRRW9QMXVkem5KMFRX?=
 =?utf-8?B?cTN3MEV0S2hqRjBCMUJ6ZzdscXhaZ2tIZDFSZk9uQ0tvMXJkNm90SHp4R1Fr?=
 =?utf-8?B?dnhPTUx2VHNiMjBQV2xBL21MMkRBZWl5V3pocitoUFAwQm1NbExRWTE3MEVR?=
 =?utf-8?B?V1lTaUtVcWVEeWhtejA3WXpyUDJtUWdod2R3ZHIxZmZKeTBmUVA4bWpJOXBv?=
 =?utf-8?B?dFpnaHZ6NXNmOHcyakZPL211OWJMTis3OVhvb3g5SUp5ZnE4eTlrVnVNcVdk?=
 =?utf-8?B?b255dnd5dW52bGdDcU9TdERBQkRxZGtjY3V3bkttYXlzczMrMHFKa2JOM3d1?=
 =?utf-8?B?bFdDZXBOcWFlTFFpc0pGTXhpVkdmaWdQOHlHL2pJRzNheHIxeGZNY0dBbnBp?=
 =?utf-8?B?NWpUek9TSE9KTkVjK0Q0ckp3U2tMZEVDdnJaR0UvdlF2dG5QVnVsNHh2SFcz?=
 =?utf-8?B?RkJlTVR4YnN4TEJ0eEZRc3VRdTNWR3padWpZY1pMK2FaOENYOFl6VjM1ZDZk?=
 =?utf-8?Q?63Vmfq+o/HV8dGXDuRPmDsGuq?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5770.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aaf8c7f-b6ff-4438-2032-08db0493a5c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2023 20:33:59.0254
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kX5p/kj1/KC+5btMBITbDjxXuXnj3Lxp/OpxB01JSDjjVssLCbZiTKpCxgMq31BuvlXeIjR5LBq5zNAB4xsQqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4547
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

SGksDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEpvbmF0aGFuIEh1bnRl
ciA8am9uYXRoYW5oQG52aWRpYS5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgRmVicnVhcnkgMSwg
MjAyMyAxMjoyMyBQTQ0KPiBUbzogSGVpa2tpIEtyb2dlcnVzIDxoZWlra2kua3JvZ2VydXNAbGlu
dXguaW50ZWwuY29tPjsgR3JlZyBLcm9haC1IYXJ0bWFuDQo+IDxncmVna2hAbGludXhmb3VuZGF0
aW9uLm9yZz47IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+Ow0KPiBLcnp5c3p0b2Yg
S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpK2R0QGxpbmFyby5vcmc+OyBUaGllcnJ5IFJl
ZGluZw0KPiA8dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tPjsgV29sZnJhbSBTYW5nIDx3c2ErcmVu
ZXNhc0BzYW5nLQ0KPiBlbmdpbmVlcmluZy5jb20+OyBBamF5IEd1cHRhIDxhamF5Z0BudmlkaWEu
Y29tPg0KPiBDYzogbGludXgtdXNiQHZnZXIua2VybmVsLm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtl
cm5lbC5vcmc7IGxpbnV4LQ0KPiB0ZWdyYUB2Z2VyLmtlcm5lbC5vcmc7IFdheW5lIENoYW5nIDx3
YXluZWNAbnZpZGlhLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCBWMTAgNC82XSBpMmM6IG52
aWRpYS1ncHU6IFJlbW92ZSBjY2d4LGZpcm13YXJlLWJ1aWxkDQo+IHByb3BlcnR5DQo+IA0KPiBB
ZGRpbmcgQWpheSBhcyB3ZWxsLg0KPiANCj4gT24gMDEvMDIvMjAyMyAxNjowMSwgSm9uIEh1bnRl
ciB3cm90ZToNCj4gPiBBZGRpbmcgV29sZnJhbS4NCj4gPg0KPiA+IE9uIDMxLzAxLzIwMjMgMTc6
NTcsIEpvbiBIdW50ZXIgd3JvdGU6DQo+ID4+IEZyb206IFdheW5lIENoYW5nIDx3YXluZWNAbnZp
ZGlhLmNvbT4NCj4gPj4NCj4gPj4gTm93IHRoZSBDeXByZXNzIENDRyBkcml2ZXIgaGFzIGJlZW4g
dXBkYXRlZCB0byBzdXBwb3J0IHRoZQ0KPiA+PiAnZmlybXdhcmUtbmFtZScgcHJvcGVydHkgdG8g
YWxpZ24gd2l0aCBkZXZpY2UtdHJlZSwgcmVtb3ZlIHRoZQ0KPiA+PiAnY2NneCxmaXJtd2FyZS1i
dWlsZCcgcHJvcGVydHkgYXMgdGhpcyBpcyBubyBsb25nZXIgbmVlZGVkLg0KDQpBY2tlZC1ieTog
QWpheSBHdXB0YSA8YWpheWdAbnZpZGlhLmNvbT4NCg0KVGhhbmtzDQo+ID4+IG52cHVibGljDQo+
ID4+DQo+ID4+IFNpZ25lZC1vZmYtYnk6IFdheW5lIENoYW5nIDx3YXluZWNAbnZpZGlhLmNvbT4N
Cj4gPj4gU2lnbmVkLW9mZi1ieTogSm9uIEh1bnRlciA8am9uYXRoYW5oQG52aWRpYS5jb20+DQo+
ID4+IC0tLQ0KPiA+PiBWNiAtPiBWMTA6IG5vIGNoYW5nZXMNCj4gPj4gVjU6IEFkZGVkIHRoaXMg
cGF0Y2ggZnJvbSBWMw0KPiA+Pg0KPiA+PiDCoCBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLW52aWRp
YS1ncHUuYyB8IDMgKy0tDQo+ID4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MiBkZWxldGlvbnMoLSkNCj4gPj4NCj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2J1c3Nl
cy9pMmMtbnZpZGlhLWdwdS5jDQo+ID4+IGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1udmlkaWEt
Z3B1LmMNCj4gPj4gaW5kZXggNmQ4MWVhNTMwYTgzLi5hOGI5OWU3ZjYyNjIgMTAwNjQ0DQo+ID4+
IC0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbnZpZGlhLWdwdS5jDQo+ID4+ICsrKyBiL2Ry
aXZlcnMvaTJjL2J1c3Nlcy9pMmMtbnZpZGlhLWdwdS5jDQo+ID4+IEBAIC0yNTksOCArMjU5LDcg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkIGdwdV9pMmNfaWRzW10gPQ0KPiA+
PiB7DQo+ID4+IMKgIE1PRFVMRV9ERVZJQ0VfVEFCTEUocGNpLCBncHVfaTJjX2lkcyk7DQo+ID4+
IMKgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcHJvcGVydHlfZW50cnkgY2NneF9wcm9wc1tdID0gew0K
PiA+PiAtwqDCoMKgIC8qIFVzZSBGVyBidWlsdCBmb3IgTlZJRElBIChudikgb25seSAqLw0KPiA+
PiAtwqDCoMKgIFBST1BFUlRZX0VOVFJZX1UxNigiY2NneCxmaXJtd2FyZS1idWlsZCIsICgnbicg
PDwgOCkgfCAndicpLA0KPiA+PiArwqDCoMKgIC8qIFVzZSBGVyBidWlsdCBmb3IgTlZJRElBIEdQ
VSBvbmx5ICovDQo+ID4+IMKgwqDCoMKgwqAgUFJPUEVSVFlfRU5UUllfU1RSSU5HKCJmaXJtd2Fy
ZS1uYW1lIiwgIm52aWRpYSxncHUiKSwNCj4gPj4gwqDCoMKgwqDCoCB7IH0NCj4gPj4gwqAgfTsN
Cj4gPg0KPiANCj4gLS0NCj4gbnZwdWJsaWMNCg==
