Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B296FC636D7
	for <linux-tegra@archiver.kernel.org>; Wed,  1 Feb 2023 20:30:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbjBAUav (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 1 Feb 2023 15:30:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231572AbjBAUaJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 1 Feb 2023 15:30:09 -0500
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2063.outbound.protection.outlook.com [40.107.220.63])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 565FC113FD;
        Wed,  1 Feb 2023 12:30:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sw71N0Jko2CKLcQiVY+ioFTh21BgipmSEcMLA4UmKZqdLTApC9ZsNSvvZ0SyPWTDqJJPzSzUAoEFz39gJjLAuvuceydIC2vrFOrKv9Debq+kliZMCZ+xzo5PreB/FpqW4w3X93H3X81G6WuUwLhc6yeF5vpNxcPe7plnZvwg6iosXeYzr6ftZwDgkEK1QeLYdUEt3RAVJ9TqTzF97AE6c8hBD6AgnysBnWUeMZn0vS4jr6rPtryfBd42nlJvWhrgnr3KuwYQIV4HckpRC35RXuuHLQcUm0lwDoWKA3vQrni6V62l4ziafnY/980N4M3yJyoko41WDQkSwbGLgPO5ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vux3aEMLrRtBbWijIHuutHMrNcZtphTJr7fM48Z3OXE=;
 b=nULx5yZoqQ/CIVLM3EvdfLKPrWNZA95Jr5g727IrzUIqC5xeSVv/T8mz7xRa5zTWordFVjs9O0ekUVbAQZPXdoEO6uW80+f6oUB6mjuGp3r/tQ2W0FlcicYn5HjdrTSeXKv9YnFqV4ayObQWwOPlTWxs+rqGRKMFpoHJKOkb3Er2PyZiZTUXzG2GvvZc957CEFF6qcrfBLgUrlPTMuutUxf+lSjywcHgvDUqlpwcyDSTNfZ5E0WZBjUJ4w3T5x+tIVhSe/fPd+ChbisRjHM9QEZomhOdpOkW/RaovwXNKO+lRfLueyodlooLXzvsNi1eKdhgQOKkfskgdzRh1kgEsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vux3aEMLrRtBbWijIHuutHMrNcZtphTJr7fM48Z3OXE=;
 b=kgxR23wd6h/NyoAQd94RGuFOzFQ9X4TjVR4tmprBVlHgwNCeEceEPrd2soZndYlpQX3bcigOZWITtZbEpcCKBr2vukHOLoxIwPVuKWrwnX6KVjiFE3t6PZObsE7C4XE/AAvA9OArQs5C6ISaEWoFDhTHOsgihnN4qOiML6UPKPAWnm75XQ4i+IrOATHVKuJH0LS9AppJhL+38keSEby3YG5b52FYb1o6VCgu5RGkft91YSz6kigyqOCJzsyWAC8iVT4Sq9NaQBvnOeGFpibTANu+j5FKtyAlJqfSQqhA9JQLRzaKz9mHJIgAYPY/rIj6NrjYS9MtGVvrAGyiVWnnhg==
Received: from DM4PR12MB5770.namprd12.prod.outlook.com (2603:10b6:8:61::16) by
 MN2PR12MB4408.namprd12.prod.outlook.com (2603:10b6:208:26c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Wed, 1 Feb
 2023 20:30:05 +0000
Received: from DM4PR12MB5770.namprd12.prod.outlook.com
 ([fe80::ab3:828a:9adf:2be2]) by DM4PR12MB5770.namprd12.prod.outlook.com
 ([fe80::ab3:828a:9adf:2be2%3]) with mapi id 15.20.6064.024; Wed, 1 Feb 2023
 20:30:04 +0000
From:   Ajay Gupta <ajayg@nvidia.com>
To:     Jonathan Hunter <jonathanh@nvidia.com>,
        Wolfram Sang <wsa@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        Wayne Chang <waynec@nvidia.com>
Subject: RE: [PATCH V10 2/6] i2c: nvidia-gpu: Add ACPI property to align with
 device-tree
Thread-Topic: [PATCH V10 2/6] i2c: nvidia-gpu: Add ACPI property to align with
 device-tree
Thread-Index: AQHZNZ3JrXV+hyx3DEyrCbzyaO2qsa66QVKAgAAPpYCAADk2gIAAAbgQ
Date:   Wed, 1 Feb 2023 20:30:04 +0000
Message-ID: <DM4PR12MB5770C83B3ED79401558B15E6DCD19@DM4PR12MB5770.namprd12.prod.outlook.com>
References: <20230131175748.256423-1-jonathanh@nvidia.com>
 <20230131175748.256423-3-jonathanh@nvidia.com>
 <db53d28c-119b-90c5-de47-bf7a3561552b@nvidia.com> <Y9qZsTQK8G8gW6+h@ninjato>
 <b7576f93-45e5-7d5c-29e1-e95a2e58f118@nvidia.com>
In-Reply-To: <b7576f93-45e5-7d5c-29e1-e95a2e58f118@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5770:EE_|MN2PR12MB4408:EE_
x-ms-office365-filtering-correlation-id: 458e44c4-2fee-477c-d195-08db04931a1d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zgL8WHVTI7sq+DYrgOzkteWNzlTn3z/mw23LoZ5ZOP4Bvvxcve7kzGCi+c78DKumEDpOucEgy3HoQ8tCcXHjXogcysHMXI2ceIeQNXtLPPeJaRIB30LYHHH/CnT7+XvHGSmtBWFq0mrZ/Ef9uuyuxj30m6WJBUDQWskjB9QzTSWYFayu3RCYeQNU5G1y3g4ckW8d0pfxfND067cgWmc76hRyT+wUMnCnPVlAdpdWydzA3TKFeDJWvoXxTSJTxzgDgwpKnrH/aRS2CbhoXeSOVsed2fqJRGzq+7waiy6Ji/dkZ+2mK5Sxo6cu/jvyiXK19hhXhq4oPw3BKrMBXHPU5TK8n6AHvVdxMk5G8envRihDcxZUeRDvKX98MIAzTHG0PlXPK5uq7QW6FH/pawz7O1GBWbOE+42dJKHRdT+G7oc0Iz3WDBEzSRSRU6cHqDX5JMkdlL2aLx3umc1G8aDRMDJ8vF56kQaj0QcqtMNxpIFrGUeXf84B9G/fzl1ChzAiWnR0ckUtceDv/s9kYJwXKFwN2/uMNbKMQ9hEeBL4y+JU7g5smZv34gcta9MOSxFhEkDZ4grdzJlyWjN1rh7zlaDa8uklEELlokoESXv/GzN4s4QUg0yBu4mLS/9SjN0DH81FqJW3IBMyQoWLa5s0A0Wdel+kZxUjNTPHvpcko9R1yVsymookiXQbmA62a6JjZaqJPbRdwfjnG/KNcwgJEPu6iJaq7dn90IKfv/nAn4c=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5770.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(39860400002)(346002)(376002)(136003)(366004)(451199018)(316002)(6636002)(110136005)(921005)(8936002)(2906002)(55016003)(52536014)(4744005)(5660300002)(86362001)(38070700005)(33656002)(66556008)(38100700002)(8676002)(66446008)(66946007)(76116006)(122000001)(66476007)(83380400001)(64756008)(71200400001)(7696005)(9686003)(186003)(41300700001)(53546011)(26005)(478600001)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K2dNMTV5VFpleThkcEtBenRlQTF4aUhZVXZsMGcrMDBlVm41SFYzT1FYQ0tE?=
 =?utf-8?B?bUsrcitSbXlqU1lZbWsrTVVPMFdkYWNGSDBoaG8rSU1lNmthb0tYbFR0WGFT?=
 =?utf-8?B?V0hoaVhiSmJYWk1PK0kyYTNVL2o5QlBoN0JTZkNURHhZMG9IcE9aZUtYVUNP?=
 =?utf-8?B?ZTRDU0t3eUVnTk9KRUhtVlJ1SDdmdmdnVkxrT3lqY0xqcVB1OGxGR21iRUxi?=
 =?utf-8?B?cU5EUFNwaktsMFg5eGFieFdGWHpBR0NtR0ZHN3VFVkN1VkFKMFlNRnBFa09P?=
 =?utf-8?B?OHRHakJBMTUxMFppbnBqenY4ZjE1U0FiQXVWU3VpbU1XVFRVNlVMbnNsU3d4?=
 =?utf-8?B?Y1hObm5iUnhKLzVWWFgxc3FrSldXa3JWcGRZQlFqUlVBL2g5VmUrZlB0cEhv?=
 =?utf-8?B?UFlYZTZCVHBFY2M1RVNTYzgyaXgvQkJ3VHRIbDZGekFGU0hQb1plck1lUnl2?=
 =?utf-8?B?MUp1RVkrY1ZIaGNNV3BkUjBtRVk0MkkvZUVscWFYeUlMY1U5WXozOG1XYTcy?=
 =?utf-8?B?SGhwbjVQSXJsVVc4WmNQdVoyNlBDQzhrS1k5eUNjZDRZUlNmNjErMUh2bWx1?=
 =?utf-8?B?UThDQ1Z5cDNlYkMrN0wzWGorRU5sMzdvRUtUdWhQUjZvSjY2Q0hPUkliVGhE?=
 =?utf-8?B?U2Nnc21TMFA3b21RblNmaS92SFpFRTRrbnRFdnNwZitIeFlQRjRwanVCSUQ4?=
 =?utf-8?B?dSt5UVV4TlhYcnpNRlFlRkk1LzBNakgvK2IwZGE3anQxWVZFaUxIM0hEekJV?=
 =?utf-8?B?dy84UGwxYlQ1SDQyVzNmSW5JMWRoZU1aR3RiT3JJTEp2bnRqeDVXYUpwZlly?=
 =?utf-8?B?MGlDZHIzekV6bCtLbVRCaEJQVmdYZWpvYTMybGUyRUpsR25FN3pPSTEwZjBw?=
 =?utf-8?B?RHlEamNCRitEUitYTWZZd3pudjdIalp4Z3lFb2VRSTE5Z2ZBVURGcHZmbVl1?=
 =?utf-8?B?ak1hYzdFVFlxTTNsY01xbk1GMUg2VHRIZXVpdnZDUEM5UWREUDFEcVRESUNn?=
 =?utf-8?B?aUt2dktZcmhHUTJJVXZXZ0R2ZkRMTUM2UjB0SlRTSk9hK0JEbmg5ZThMQ0VQ?=
 =?utf-8?B?Z0RoNGRKY1QrSDVXVkJmRis2UVFpTGgzcWhIZjJlSzZtalhmR0NieDIzOEVs?=
 =?utf-8?B?QUorYVFsMy9Jb2puTlo2VUhldzlJTnlJT0tVV1c5M1hPek5zQXFNMnRGS1dL?=
 =?utf-8?B?em9uWkJ4Y084c0NZQVcyRXRYbGxBMzZrQW01K203R09wOWo1ckZwdFBFN004?=
 =?utf-8?B?cXBJZDJGOVhMdkNGSmU3bThqWDd3VnZwWUVMNEJrcjJoMmx5ZjhlTS9PM3cy?=
 =?utf-8?B?TnB1ZE9wQ2NmQ0t5TWd2UGhidnpVZXRHZVFOOS9obncrTGdmTDR4ajN1clJp?=
 =?utf-8?B?akpYSklPZjhEL2pCRWh2RWlOZjRuRG5LV21rN3B3QThSRTAveVJvTmE0ZVd5?=
 =?utf-8?B?d3lCRzNWUkhUY2p0Q0tmeE1INC9wbzV0ZGRNcVp3UmhKY1c3em5DUWxyQUQz?=
 =?utf-8?B?QXlOSTk5aWNVNWkyemxJVUZhNDRtSDlTWWR0VjZ5V0JoRExYUytwbEZqUHRB?=
 =?utf-8?B?bkMzSkNCS3NNYXNGU09OL1IwN3hBWnRaK1dyWktzeDVtbENwWkFyTy85N0xx?=
 =?utf-8?B?RDh3M1dZVXk0SWxOVGFITWZscGl1RXBwWG1SS3V3YkZoODVzRWwwY3dwbVlL?=
 =?utf-8?B?SVYxZDBmc1MrTkUvR1I3eUdGRWIzSTl6Wkk3ZkNOcWVtVWNKcE5pM2JmbkF6?=
 =?utf-8?B?VXYvRnR6ZDBBZUthVTZGR1lFSHRZM2dhNU5lbGVkL2dvbnl6eXNPVGRCMERh?=
 =?utf-8?B?SVVLSjArUktEQTJ5TVBYMUlWSUgvVElIa3BoUWdkZGV5SzI3ZENNRFZZdHVX?=
 =?utf-8?B?TEFNS1A5ZkdLYTdqU3RYSlEzUXUxMzZQbXkyNG42K1RBdWZjalFDMzlqMlJo?=
 =?utf-8?B?bXFZUlY2WEx4c2NmZEM4dDZkU3BTeHpaZkd3L1VZNU1oUEhuREozYXNjVmxG?=
 =?utf-8?B?aFBjZFFwNkRLekpZK3VtdmJJMXNJQXl1U081YS9mbU1NdFUzc0Vlc2JJR25U?=
 =?utf-8?B?MkFKV1FnT0xMRGxKbXAwa1BMTWxjQTNXZzJBUVNGSVkxSG5pV1ZFU2p5QkRt?=
 =?utf-8?Q?owudKgkyz4DCqiQpYb7y5ey9y?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5770.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 458e44c4-2fee-477c-d195-08db04931a1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2023 20:30:04.7298
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MzwGhrJyeCRicNhuyddxBwP1Z3QnE9WUgef08mn2nF+Yk2QXMu0X1h5k8jU0B0zvDisfujBNNbSshLVk3ShO0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4408
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

SGksDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEpvbmF0aGFuIEh1bnRl
ciA8am9uYXRoYW5oQG52aWRpYS5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgRmVicnVhcnkgMSwg
MjAyMyAxMjoyMSBQTQ0KPiBUbzogV29sZnJhbSBTYW5nIDx3c2FAa2VybmVsLm9yZz47IEhlaWtr
aSBLcm9nZXJ1cw0KPiA8aGVpa2tpLmtyb2dlcnVzQGxpbnV4LmludGVsLmNvbT47IEdyZWcgS3Jv
YWgtSGFydG1hbg0KPiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+OyBSb2IgSGVycmluZyA8
cm9iaCtkdEBrZXJuZWwub3JnPjsNCj4gS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtv
emxvd3NraStkdEBsaW5hcm8ub3JnPjsgVGhpZXJyeSBSZWRpbmcNCj4gPHRoaWVycnkucmVkaW5n
QGdtYWlsLmNvbT47IGxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmc7DQo+IGRldmljZXRyZWVAdmdl
ci5rZXJuZWwub3JnOyBsaW51eC10ZWdyYUB2Z2VyLmtlcm5lbC5vcmc7IFdheW5lIENoYW5nDQo+
IDx3YXluZWNAbnZpZGlhLmNvbT47IEFqYXkgR3VwdGEgPGFqYXlnQG52aWRpYS5jb20+DQo+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggVjEwIDIvNl0gaTJjOiBudmlkaWEtZ3B1OiBBZGQgQUNQSSBwcm9w
ZXJ0eSB0byBhbGlnbiB3aXRoDQo+IGRldmljZS10cmVlDQo+IA0KPiANCj4gT24gMDEvMDIvMjAy
MyAxNjo1NiwgV29sZnJhbSBTYW5nIHdyb3RlOg0KPiA+DQo+ID4+IEFwb2xvZ2llcywgYnV0IHdl
IGFwcGVhciB0byBiZSBtaXNzaW5nIHlvdSBvbiB0aGlzIHNlcmllcyBbMF0uDQo+ID4NCj4gPiBZ
dXAsIG1lLCB0aGUgaTJjLWxpc3QgYW5kIHRoZSBkZWRpY2F0ZWQgbWFpbnRhaW5lciBmb3IgdGhp
cyBkcml2ZXI6DQo+ID4NCj4gPiAkIHNjcmlwdHMvZ2V0X21haW50YWluZXIucGwgLWYgZHJpdmVy
cy9pMmMvYnVzc2VzL2kyYy1udmlkaWEtZ3B1LmMNCj4gPiBBamF5IEd1cHRhIDxhamF5Z0Budmlk
aWEuY29tPg0KPiA+IGxpbnV4LWkyY0B2Z2VyLmtlcm5lbC5vcmcNCj4gPiBsaW51eC1rZXJuZWxA
dmdlci5rZXJuZWwub3JnDQo+ID4NCj4gPiBJZiBBamF5IEd1cHRhIGlzIGhhcHB5LCB5b3UnbGwg
Z2V0IG15IGFjayBmb3IgZnJlZS4NCj4gDQo+IA0KPiBBZGRpbmcgQWpheS4NCkFja2VkLWJ5OiBB
amF5IEd1cHRhIDxhamF5Z0BudmlkaWEuY29tPg0KIA0KVGhhbmtzDQpudnB1YmxpYw0KPiBKb24N
Cj4gDQo+IC0tDQo+IG52cHVibGljDQo=
