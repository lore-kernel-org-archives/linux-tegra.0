Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 760E7C001B0
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Aug 2023 13:38:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237052AbjHONhv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 15 Aug 2023 09:37:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237462AbjHONho (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 15 Aug 2023 09:37:44 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2054.outbound.protection.outlook.com [40.107.94.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 291B31737;
        Tue, 15 Aug 2023 06:37:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OgcljbZqTIhhu/8rpfkIKHNTPuqyyOBHk7PRhC/AdWst5/6ArgCfrQW28ZIqG+BoMeYJr1tboaQeecxdOoA4ut+GTMLQ+tRTK4/ynXRR1BIw0F4bHb7xpxVe6mM5OWNHjy111E8zsulPNPhCLHKJEDi8kIu7TRAgV839bkGCFCOLDoZDswMQEd7ey4ejVHOqchdY7SmjO1E0o/FnlQBIxnmvWvTZ7+BColYzP8PKPYgY8QUrRQvh4RfHGARr4V2ny8qeyxExk+60wtA0n4hqS69hHYJO4k4cFc9iWv1gN7UE3rxwWtr0Ara8BEnPhFkouxB/Nq49UtpKRQLpkM98Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S351MRFnYqOhqVMbiIzi4WV0tzN+nrOtAPWW6MBeqHw=;
 b=EMDpgM8v23kiDQIjfEPqtnfyAlzWC8wtUJtmX/Rr0uhnCUrDxQlIiB4T2a1mrAXuxh9ImRxrlWvB/FcP1hBndNP1RiBo8nMdiZh1TQSTYxv68LoekZadD8iVsL+VCOXNfxE5OlIln24z5Dp3LnwQXIpDmbiqynO0el2kZQ2V3fmGjFasTIUJkDLL+GLUKTo0xB1w8JVVxH8GiFV+9PC3Fv21joQB664AvDrP9VYk3MWvrbXhlfId/1NSqNmRHjCN7L7vh0o3syima67k+TWJDVXuc37murfN99hpKJkepzeWWSBku0h2E1rhK5EztAxTQTB7yXkI3NdUOxhcXvb5Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S351MRFnYqOhqVMbiIzi4WV0tzN+nrOtAPWW6MBeqHw=;
 b=Cvjp9nwMSJCr/7TWD6+WYFCOfFNXo/h8Qtvi5hi5pP5OrvOm8zj+cE2r0INueH16DaX7cUqG0EFUojjgOIZSGFME+56docJd4NSWushskpmadGrm0n63lwCRADUi6/YYllblOqE63QnZcedMMWty+mFhH+nZZYyMLGKOf2IK+r+iDsYH+s+PF+OQeEy9XtY592w7U70bElh3CZQsq6WcIwDZDWPen5Dc8Lbe+XCtwosygriIw5G9AekMW9Q9WTZCC3MypP0uDE7Zw2xaopeRsNhiznQIw02vSrlqNJt6MSrygzAxbwwCEE5zUWF9gT1CYwmFiJqXIVrgKxGl51D7Fw==
Received: from CH2PR12MB4278.namprd12.prod.outlook.com (2603:10b6:610:ab::17)
 by SA1PR12MB6798.namprd12.prod.outlook.com (2603:10b6:806:25a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 15 Aug
 2023 13:37:41 +0000
Received: from CH2PR12MB4278.namprd12.prod.outlook.com
 ([fe80::2742:341d:5f8:493e]) by CH2PR12MB4278.namprd12.prod.outlook.com
 ([fe80::2742:341d:5f8:493e%6]) with mapi id 15.20.6678.025; Tue, 15 Aug 2023
 13:37:40 +0000
From:   Brad Griffis <bgriffis@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: RE: [PATCH 1/2] arm64: tegra: fix p3767 card detect polarity
Thread-Topic: [PATCH 1/2] arm64: tegra: fix p3767 card detect polarity
Thread-Index: AQHZqFlkujkbBanyJESL2az59RSO2q/D5ooAgCe/5VA=
Date:   Tue, 15 Aug 2023 13:37:40 +0000
Message-ID: <CH2PR12MB42783D51FD5FD9327C8EBE43AC14A@CH2PR12MB4278.namprd12.prod.outlook.com>
References: <20230626180920.318774-1-bgriffis@nvidia.com>
 <ZLoj-JgLqL619m70@orome>
In-Reply-To: <ZLoj-JgLqL619m70@orome>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB4278:EE_|SA1PR12MB6798:EE_
x-ms-office365-filtering-correlation-id: 16092553-0f27-47b0-5816-08db9d94cc25
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gGHg68Zz2ch1YVpSrYrWwMiSDLk6TD2/uDhA7tR1SDyM/a9FtVHXfaaaW6vITGJS2JLCZLu2h6IPZ9RKOYMAj6Frk+3zTu0VKvhFlGfq/fLwRrwTEmitPVwF6ka4pqETWiev3Y6lBuCFR0PR6z3ixwfd5aBR6Y964kOpmOoCQhc83fKy1f0TVmJhG9LVCNFcXe/vokcmfCcSnoWMJp+jrah3DyhUZrpFsoiW7vcvVwouAZ4XWfER+osC1GGCvV06NhlciMp2+saCXsWKzdWQwWqi5f0XcIrm9w1ePuoMCGgSEc1jxU7JMbg26wNUR60TDyPJK4bARn3iuLyvzBnb8BKGPSlSvnAsyafBwJ/oplyO0qgEnYA3vCgKFOzcg3AOBHETWy5Yh6L1SGhctomvoFZPt4QQ3/v7gU1/SJZOBYU7UUsV5PPdxpehPGSm1VNmBpVPjbk2ojZQ7Z04lKOyQ0xSLQg4G+UIx280Q/bF28OOWy28QaLiqM35llxyPgUT//BVHEKMqn/ADSMTWJTn7Yxz2PqslGhaiQVhIOZavkTh6SQAjXGY9IMnJHVWVI1dBqTHoIOOpp8714/BFxjQMLYGkvVT5dXOvd/XyrXstLtg/dMcTy7sJEzzl6GTpLC1
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4278.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(136003)(39860400002)(396003)(451199024)(1800799009)(186009)(478600001)(71200400001)(38100700002)(86362001)(76116006)(55016003)(38070700005)(6506007)(66476007)(66556008)(66946007)(6916009)(316002)(5660300002)(41300700001)(4744005)(26005)(53546011)(9686003)(122000001)(33656002)(83380400001)(54906003)(64756008)(7696005)(66446008)(4326008)(2906002)(8676002)(8936002)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UclHFbLXqpP/120/K6+5rbH4agtPDPblXyosLxH33imfG4kICK9LCBqL4B8g?=
 =?us-ascii?Q?EKIOsYrD9Gcyk4g3AyJnaUBBokMqkUln1zjksrxcGHTrJ01gndus9Eb0rGxV?=
 =?us-ascii?Q?zpdF0HkhCtC4nlnoipFikbHBmlczhUucCZTT7pihtTeUiGUyQ+SstpABjQrz?=
 =?us-ascii?Q?4xi4jJYX5ATPgqj+60tNNWDwydK/BBNaTB0Q5rC4xc/CBCKYP4Qjar70+ik4?=
 =?us-ascii?Q?J08ekwhVCSS5qare/LPW9+qW+bItGYsMvqByDwsEI3SLEnwSKB9xJCI/UhZ+?=
 =?us-ascii?Q?2hRfikhc8URsguqPIgzOnxm3MZt8u4yooc6xJXMyDRRCCyTciawp9qUZihjc?=
 =?us-ascii?Q?CewaAhG+N0RnEDgP7a/NysNoo+iGxHgoeZiTu/Ncm54CKUMPdusDPuMZJ0H8?=
 =?us-ascii?Q?BBD8psiO7fqfIfAg0T5VyEvQrJif5VrLr17RqlfVQRypFldq2rhSiSIw1J9x?=
 =?us-ascii?Q?Gs37KCgxCSc4P+Hh0yz/UG6QVAB6TN+NXTVRggqcAQxtLw76nUaZ2KO5gLHl?=
 =?us-ascii?Q?vwhlXgiukCd26c55c3FrxZyWu/hCb9mMgSD8ncCMRHvs5eMgoI+jbAdqwREl?=
 =?us-ascii?Q?Y26ryhHqqVCixqV1cmktpAUR5Zl3knCctY63F/+R13ZNkYCKLyPbggQHn6oX?=
 =?us-ascii?Q?Exh7op+iiLYrh37+AAVpHHL7E75YlCdwp4EiQ7z5VTLpB1vJeSjWb7YHatVg?=
 =?us-ascii?Q?PvXnX+gT1Vtie4n7/2InzX2033VQnAxgdpjGt34asnFHJCWGJRqy0T6OX2C9?=
 =?us-ascii?Q?SNLlvckEWA6xxaKlvwScfHSFpS0kVENtYAEE6RETjleCK/9Mozw0JXfPJEIM?=
 =?us-ascii?Q?ONancjm21uG0AKwCcM7eqQ/65HB1c+62jCobAaf4wY7oMN1QjTPf6K2Vnr90?=
 =?us-ascii?Q?40YkRE/A6+8SWjhxFO1a5O7Kgxt7Qx4kRHEqe69danRzLFqdRrmSpPTVDjkQ?=
 =?us-ascii?Q?yANF0GKtFPKAgl0eTiptt/z5vvOc4r2jfh+7AIazvZCsF2eZqzsdbXUYQfe7?=
 =?us-ascii?Q?kcHR7WQIteYGfbACripOCV0aPvy/U4CsguQEBPMJimUy9xMAczkeFyU8bW7Q?=
 =?us-ascii?Q?N+rsfg8s7V0JHDh+lFXBZzH8TOiIN+/RHTCMQwTw9tJmQGzYoYFZ9LiOy9Ub?=
 =?us-ascii?Q?7c2ixti9+LIXKHFLWXLhRyYekwnlYSA8LpxfYMbPgOUYjBTLgmcCkO5vd6WV?=
 =?us-ascii?Q?c5XpSAgRTxXNwiYfsWxXIzIFvEukeMKbqoWjTiK6PiisrGR0AwhuEqXfJJSe?=
 =?us-ascii?Q?kmYT0srhdPxkezhKqiMJaYLBQQR2MJEU2Ct9uR+6rg19RsfSf8w++gIg52Z9?=
 =?us-ascii?Q?/zf3nXYA3baIXC02uiRhD23Hi8zVqXU7dYXrrSHChAJjueNYNDzu9Iwis8Vm?=
 =?us-ascii?Q?T5V9LL0w7MKF9FrCV7NUDystLKPgz7V4kDhcxskPMGV/bd8mN4P0LYDvT/oQ?=
 =?us-ascii?Q?6IXU1nlAEorlNWbeXMLG+2bqkbPAtxIVdy1NylCTka2nSH8wHb4mybiI6Ajm?=
 =?us-ascii?Q?3835HlM1LcoNI/xmdeHbjymkihPea6BUZ+6g+znqvraV2oO9QH4ROHrZkFrP?=
 =?us-ascii?Q?5mHWZMkK6EPHYnl7MJppwX7j2iN77bKmLNdxjd8p?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4278.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16092553-0f27-47b0-5816-08db9d94cc25
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2023 13:37:40.8461
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qbTii7oZUdczMXiRcDixBz9IChB+pPyptdx69VRQmR+VNiKMGC4OL8aQ+YWilKEHxq5GV2KXVSYL2tNt+HPFdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6798
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Jul 21, 2023 at 6:22 AM +0000, Thierry Reding wrote:
> On Mon, Jun 26, 2023 at 06:09:19PM +0000, Brad Griffis wrote:
> > The card detect pin on Orin Nano SKU5 (p3767-0005) is active-low.
> >
> > Fixes: 13b0aca303e9 ("arm64: tegra: Support Jetson Orin NX")
> > Signed-off-by: Brad Griffis <bgriffis@nvidia.com>
> > ---
> >  arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> This DTS include is also used by Jetson Orin NX, but I assume that the sa=
me
> polarity applies to that as well?

The polarity is the same for all Orin NX/Nano modules that have SD card.

> Actually, looking at the Orin NX, I don't see an SD card slot and judging=
 by the
> documentation that I was able to find it's not documented for Orin Nano
> either. Or is it only certain variants that were equipped with the SD slo=
t?

UEFI dynamically disables this mmc instance on SKUs that do not support it.
