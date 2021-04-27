Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AF64C433ED
	for <linux-tegra@archiver.kernel.org>; Tue, 27 Apr 2021 18:30:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 19C1A613ED
	for <linux-tegra@archiver.kernel.org>; Tue, 27 Apr 2021 18:30:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236836AbhD0Sb1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 27 Apr 2021 14:31:27 -0400
Received: from mail-bn7nam10on2063.outbound.protection.outlook.com ([40.107.92.63]:59137
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236571AbhD0Sb0 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 27 Apr 2021 14:31:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EiieLmn1jV7MtzqL3fN2y0FRcHEtiE7obQmlEvlU8GbB/2oTRm+wvQR5J1xC4WOecUA9KZbcI9cYVY2XHFkS3WYeMa1KPcLSEpZXr78/eeeOphKrASd19fgLzRyKXAGB05UFDmlOtdxlAXL6K5jjCXH84AP695Ej2GIxOibe2mSle7lsipDHB15ePk14IR/kXhNt5VxeWtnE30AjKqgWd82ldMwsL7XW6ASG+qw5EWxsI7vHq0PbbodBtamzUEX/NVUoyy6r8oXmhuCY0M8T0dZWRutuKeq217VZ+dVyelqxrqlmAf8mcfYIk9s/rPoBPQqf4guPm5hvxOJMxxpnww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EABQkPW4qwnr2VQbreEakWMf1hvDLWsqi2IIXQng00s=;
 b=eivZtU6U9X6nQaAyD6PNBvPIjMoivTGU+CeioBfgd/IHnSC33+NlRJROHNIU6ExUXyZLYVSofVJLmWND+0k4rhLLRnrlGC75vz1+ibW1w4KPRNvMba8S2AzAn/9A0qdbXm6IElwjndBMCZsK6d3Qx9fWAlu8vSh5/bEVLtVuwKkMkOcn6d69DdBX8ZkRk7ZXkgq3r/jvSgA7hxDPeDQ8gFD09kVRyp1Wi9xIlgHFIjvfxOH7WYynDNFfpoh5BjoqQzjEC3RsAq6JT2kj+Czcck2TxRbMSEdUGo//bkPxcwY0s9SDKjahcI2JnxOl6RQ3b+Pc2JnlYDsn6yFef8hYDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EABQkPW4qwnr2VQbreEakWMf1hvDLWsqi2IIXQng00s=;
 b=NURgn5CbcB4pyXnqv3slXzVtOkugEPmVhec7s1YGRPEnAmV2Yw4rwU6kDbIqeV4xl2MG0rUDYcVLENacykayGMPC/Ty665VapQHevoWMX5zfMXkKdzzneDswygtofq2XW10zdaKvce20/C2af4B/jt5V2Z1+O/r5a8OyTWXPIvaaz61gmWPHqmA8EFhMToiW0RNmZhRK+vtz1bCfJ/wLbp2zOSdniRYXIAVygacWkutsz8eHpJzz93yR5YuYeJztSWBHvZYf1kpWCGodm4ZBd92XyEEyrjHe93qp27XbtTa02VFWgZd1JDiBLscQUcyVEZd3pMW0Pd3dLYcwwsYWDQ==
Received: from BY5PR12MB3764.namprd12.prod.outlook.com (2603:10b6:a03:1ac::17)
 by BYAPR12MB4613.namprd12.prod.outlook.com (2603:10b6:a03:a4::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Tue, 27 Apr
 2021 18:30:41 +0000
Received: from BY5PR12MB3764.namprd12.prod.outlook.com
 ([fe80::d05:4bca:ea51:15af]) by BY5PR12MB3764.namprd12.prod.outlook.com
 ([fe80::d05:4bca:ea51:15af%6]) with mapi id 15.20.4065.026; Tue, 27 Apr 2021
 18:30:40 +0000
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
Thread-Index: AQHXOF4qB/GkhG0T5ESzLET/7zFLw6rDRYEAgAVgmoA=
Date:   Tue, 27 Apr 2021 18:30:40 +0000
Message-ID: <BY5PR12MB3764DFDEA8125650799DC76CB3419@BY5PR12MB3764.namprd12.prod.outlook.com>
References: <20210423163234.3651547-1-thierry.reding@gmail.com>
 <869ec3a2-26df-2ce8-bd21-b681d6ef3985@gmail.com>
In-Reply-To: <869ec3a2-26df-2ce8-bd21-b681d6ef3985@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [216.228.112.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3b10e2db-019c-45fb-b0ea-08d909aa8fa0
x-ms-traffictypediagnostic: BYAPR12MB4613:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB4613FB83D12E15174E14B57CB3419@BYAPR12MB4613.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1e5PzJgPiTfmj/wXKw4P8alLySdHTZDrHyLFsiAH8aqZoUlv/VH32u4ayGzvUiIsy0P/Kjqx5bMzhvx7QzfJQRbSQIbPNhSxkLy//4YxxqZ+qYW5dk5nDJXTkYCSvJfvnkLA2J4+QqNMsLIg3G2mL1YfSFzhBeZWuonoZhsNZa3nyOHnFZvtAU6ol2CMe+PbDle+UfYbRN9ati1zUdlLj7WVuqxj9SKIAB7PUSmZvHQ9JeGG1HgRx8E0Zjq3T86wyUPlcIZhxhOamwnrxDabRTQNjIsAnJXLieobFRMrr22IWEo3KexoqiTszEIkMMK01eud74wTuMo8y0UNet8G30ryWzhQqbM+Sm06E4Gz0ypYO2wR7WD3R4u5ghYM2kB+TgbT+oXEwVNLS/zsfGJK9Hc0UrxLNyDzm+ctMBN+Hz/gBj/lFzSx0vPeB0wIRX9VKewNvnTjTiTRx5SgBCWw+56imydhone7TcYkJ2Yv1cRIXNd8gVCregZtMh6UUlUOWxQYf3HFWBB8EjCz8JwuZpo/o8s8hcHMQAcc73MhwoiBjsdm37geO6ieTogOA/QOlNGJDwV0+1UUliOXu/ltn7yGSQXtq5wwv0QdkTb9Vqc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB3764.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(396003)(376002)(136003)(366004)(66446008)(316002)(71200400001)(186003)(26005)(38100700002)(66946007)(5660300002)(64756008)(122000001)(83380400001)(66556008)(86362001)(6506007)(478600001)(7696005)(55016002)(9686003)(54906003)(76116006)(110136005)(4744005)(8676002)(66476007)(8936002)(4326008)(33656002)(2906002)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?STZuWjRoTUtKNU5oMDRHZVB5QWtoMHd6U3lya2VGeElURkZqR09VTURVRFN4?=
 =?utf-8?B?WlZPYjRBcCtQK3FYa0RtSWhObEVkK2dTNXEvaGZad0h1VEJJbEQ4cTRhaEtW?=
 =?utf-8?B?bklEYldXaFdoWXBLYkZnUXFDUm9wc0tycGhKS2VNcTdweTUybi9DTVBiSTJW?=
 =?utf-8?B?bCtzOGNUdFgyWHUyUjhwTmVTdWxoeFMwcGlHdkpDbXJxZm8xYm9RelAwd3Rx?=
 =?utf-8?B?eUtNYkg5WUJCVzdwNWhUaEc2MHBUTG9OZ3NrT3VZVVVWTk1IUDJ4VHFKeldt?=
 =?utf-8?B?WXFRc3krR2ZWT0NRL0ZPcG5UdVVocGlKZEVhdnIyMEpMQUtiYXErNEFYWGU3?=
 =?utf-8?B?MUFoUHBMOTV6Z1dneVdiMWdxcmhEeHRrRXp0enVMUGZWc0NXZ3hrbUdHOEVa?=
 =?utf-8?B?azg4U1E4c1o2QnFCVHhIMEdWZitqNDhRWVlDUkVKV2cxYVExN1ZUSjg3VUtP?=
 =?utf-8?B?RnRGMm9sRy9GL20zWnRWREcwRzNJcDQ4clZPS1MyMXVVTFhvS0l2QmdkOHVC?=
 =?utf-8?B?bUgxNXdmRUdRWmwySHhwUWlWZkRvNlljaEtXQTJ4eUs4MFAxQzM5V3E4ZlBV?=
 =?utf-8?B?L1puajZicnJjRlBzSmF6WmdrbWFxYlJwQy9iZVpva0dmd1hnMkl0WWxkZVZn?=
 =?utf-8?B?a3FDazFzWUtWb1dhMjRISFU3VEFZYml2RjYzWnVjb0diNWNCUHBpeWptK2dn?=
 =?utf-8?B?VWpCZnZlanREcFpCZ0Y2RDkxYTZHYXVxSFhxRzdublRiT0J3UFRCZTRrb0dD?=
 =?utf-8?B?SnZTM255bnQ2S255SUtUVVRyc2Nxc3VnNWxqclBhTnBTOEE4NWEyVXBqei9x?=
 =?utf-8?B?eVhUU01BQUozYkgweGplMnVmVURBbmRmTFoyTWhYWUF5THozbzA1V0orQ2h2?=
 =?utf-8?B?YlErMVZrZloweXRoTml4UGlxSWJ3cmtMY3RHbndEcWZUazQveitCaVlDMFlu?=
 =?utf-8?B?Ull2ZG1ML0F4eE5UYVZzZjdmYitiNVVyMEY3YjMzRDlNT0p1alZKNWJOYXhK?=
 =?utf-8?B?eDNtakNMMldRN29QQ0dKdVZ2OEttTktnS28rdUhrNml4eGJYNEVVc1hBelJs?=
 =?utf-8?B?NFdFOUhrMkl2QUdCM3M0ejFydDgrVlhONkp2WnRvSzQ3dTlKUTk2OG1FSE0w?=
 =?utf-8?B?M0loQTA2VWprZUQyOTg3b0VWVTcxYllYMzY4bzlKRjkrNkJNd3lkTmx1bjEv?=
 =?utf-8?B?bTZsdHVZL2VDNzJCTXluTS83S0RDNWEwZFBIR1lDU3FGS3c1REZibW9iYXhD?=
 =?utf-8?B?SGF0ZzIxQW1vWkhlWkczejIyRFpRTGFrSk1OY2lKN2ltRWFIbmd4RklvdmRP?=
 =?utf-8?B?QjJoSVVuSFVvdEFvaE9XRDNpd0Q0bHNWMEFvc21PeUJOckZSL1duSFR6V2pV?=
 =?utf-8?B?ekwwTUIxbWdYVlh5V21jV3ZJcVN1cllCRTF5QTFhOHBrZWJpeXF1UlJINGVT?=
 =?utf-8?B?a1FGSkpDR2cvWUdPTDFpem9jVGplMExUUDhMdWlnN2hlR0xMR01zQktwYVhO?=
 =?utf-8?B?bzFDYXpUbEs2bUhQSWtmZVhJelNvdG1UR0FlKzdJNndwdE5kSGdEYzN5Q0cr?=
 =?utf-8?B?OWQ1NDlZbWkzVHErbGwrUTZ4UngwRmFMaGtYR0U1Z0h5Yk1uR1RIQnFyK2VC?=
 =?utf-8?B?OERDeW10VXVwNTB3UDFJRWM0NHlDeW52NkVtVUZ3NUx2RFl3RnNab2hId25L?=
 =?utf-8?B?dlhMNll4NmMxZFJxWEp4UVFyVkxXWWtUMmVsYjBSaUVibUsvRDFxODdVL0s5?=
 =?utf-8?Q?6lOINrsDvQKcazTd1qTF8GQ8Rq/ClE5O4lWgzuN?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3764.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b10e2db-019c-45fb-b0ea-08d909aa8fa0
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2021 18:30:40.6090
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iU2kOevKSKzaFD6f1FJG/J2LoELlz07Wk058IvV/hnvGn5MQPXOtTUDaObqA9MPXly4i/WG4VjwGf7JKnn8qKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB4613
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

PiBJcyBpdCBhbHdheXMgc2FmZSB0byBlbmFibGUgU01NVSBBU0lEIGluIGEgbWlkZGxlIG9mIGEg
RE1BIHJlcXVlc3QgbWFkZSBieSBhDQo+IG1lbW9yeSBjbGllbnQ/DQoNCkZyb20gTUMgcG9pbnQg
b2YgdmlldywgSXQgaXMgc2FmZSB0byBlbmFibGUgYW5kIGhhcyBiZWVuIHRoaXMgd2F5IGZyb20g
bWFueSB5ZWFycyBpbiBkb3duc3RyZWFtIGNvZGUgZm9yIGRpc3BsYXkgZW5naW5lLg0KSXQgZG9l
c24ndCBpbXBhY3QgdGhlIHRyYW5zYWN0aW9ucyB0aGF0IGhhdmUgYWxyZWFkeSBieXBhc3NlZCBT
TU1VIGJlZm9yZSBlbmFibGluZyBTTU1VIEFTSUQuIA0KVHJhbnNhY3Rpb25zIHRoYXQgYXJlIHll
dCB0byBwYXNzIFNNTVUgc3RhZ2Ugd291bGQgZ28gdGhyb3VnaCBTTU1VIG9uY2UgU01NVSBBU0lE
IGlzIGVuYWJsZWQgYW5kIHZpc2libGUuDQoNCi1LUg0KDQo=
