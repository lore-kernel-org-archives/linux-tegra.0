Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B034C433DB
	for <linux-tegra@archiver.kernel.org>; Tue, 29 Dec 2020 05:17:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5A40D208BA
	for <linux-tegra@archiver.kernel.org>; Tue, 29 Dec 2020 05:17:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726185AbgL2FRg (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 29 Dec 2020 00:17:36 -0500
Received: from mail-am6eur05on2056.outbound.protection.outlook.com ([40.107.22.56]:33568
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725866AbgL2FRf (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 29 Dec 2020 00:17:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fbx35AzN8uQKLWX6tGjcV7Kqfx3qVRtoJqKCkOvue2oGuDiGZ7oUZPAWIneNXIKecgfgGHPkDenRS7vYUho2UAkzLARWYefE1zTnT4NaAtFFzvCPDnRxmoAMiQE1YvRxeNEY4/y5DDAqUYNVc4XO8GVCRH3CXwMlAA3fmXfcbpO5KR4a/i2jUdWSfBwTPAo7P/XQc6PElcfVKq30O/ccFa0CVDqaYoPgFi9vx5FLCNE6dHq+osAuxr1nQJSlpTBIgPt5W//7f+kKDDsdsu0V9VgtAn4lNDXBfeVD+FqCFVdTy661kn1noX6dA2M3U4RYywyT8kcXAtWiMsflou3LzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NPnjpOjxLfbAFftLt1zzfyigcfZkvTfHF+x2cZAJCHA=;
 b=WCIc34HYoGldOaKyBUJqHPWrtmkJ4ZSgnQjFfMU9L9NdsZv4WfmfKsGrRPfHAhlfFEEexrNC6CyjCswgHZoepw/6GNeWTKl+Ar+1186NHDQ0fvZMB0he+kBtItrhhhExFEjXjuKCbejw4Nkgs3g7S1thCnarVj/QIXoeEs6Z5DVtKxE6jYV5gsvRQrGaoSNhEajDv9KhnkNYrK98fknv3iKP7/i5d6oZVeOsuG3qEZOux1BZRDD9Vl2etL9Hp0qbFPpR+H00xXLchEs7nV4K6eVPk940uNp7CI8YbbUsEuVoIjYvr5paib8vaLEfuuPC2kj/HXDBtNgwVZI9pXwCuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NPnjpOjxLfbAFftLt1zzfyigcfZkvTfHF+x2cZAJCHA=;
 b=HBBCT/NiCQygCDogGOToJ8ou9kSRmzrjkPEB33FMHDwDlDwzcQ6tDhFz8vhWQE9eTQAEmd1RlMgWJKj+OBk0+OP+Ul7tzZ00SQ9oLSIOGQUVIAWUV6PQrt5dhAINDDt7Ko3kxTLENVWifaGTcU9FLvXxRYFN15DUmv5SKLjhx7w=
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com (2603:10a6:10:1ec::9)
 by DB7PR04MB5244.eurprd04.prod.outlook.com (2603:10a6:10:21::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Tue, 29 Dec
 2020 05:16:45 +0000
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::89de:bd7c:7245:f139]) by DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::89de:bd7c:7245:f139%5]) with mapi id 15.20.3700.031; Tue, 29 Dec 2020
 05:16:45 +0000
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
        Ion Agorria <ion@agorria.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 0/9] Support Runtime PM and host mode by Tegra ChipIdea
 USB driver
Thread-Topic: [PATCH v3 0/9] Support Runtime PM and host mode by Tegra
 ChipIdea USB driver
Thread-Index: AQHW1TbraK9TsKqDbEm74yxl8uIQhqoNmQiA
Date:   Tue, 29 Dec 2020 05:16:45 +0000
Message-ID: <20201229051615.GA5823@b29397-desktop>
References: <20201218120246.7759-1-digetx@gmail.com>
In-Reply-To: <20201218120246.7759-1-digetx@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.9.4 (2018-02-28)
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e968d650-7ba8-4e27-e44b-08d8abb8ef78
x-ms-traffictypediagnostic: DB7PR04MB5244:
x-microsoft-antispam-prvs: <DB7PR04MB52448D418B534F73B638AB0E8BD80@DB7PR04MB5244.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LE0GnTnwfFqjzJCuzvH1Z+mHrNUN1QOkp12yR/fa2l1rAEZ+4jL7Fxh6UKDStj4jAEfBEE1q7mCNlKKiV7wtjVHDIwOHlHy9aogCy/zKLmGzaPyLAk5aX6K9zEmUbU8uW7+UAp6twV9nUv8ZN0Ic+tApjSWPS83K4bdlhbLSXFlepp8Bi3v8ViMvp7x/MwDe7bNMwZRgeqDfoo+76M2i0NssRJlqXMtL7yYWTGxrHrqVoxDNBDjY52CSOTyWwVtHvSSAc8BnqZ6mizSyh4B9kykZr/J0RuEN9Cq0+mOoZm796yQrPO+ca32IKfdP3GCJtTSguZhbj4gFG46bw+mJ5fExOLdjHZ+Wl1tAdp//0E7jty6q2bryGDegqjp6zvIedM4f6cci7tb7+vOxWjuWnQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7979.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(346002)(376002)(136003)(39860400002)(396003)(5660300002)(8936002)(6506007)(9686003)(186003)(6916009)(66476007)(478600001)(1076003)(66446008)(66556008)(66946007)(91956017)(26005)(4326008)(33656002)(64756008)(76116006)(8676002)(7416002)(2906002)(83380400001)(86362001)(6512007)(54906003)(316002)(33716001)(53546011)(71200400001)(44832011)(6486002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?BvlQ/2WylqvWVCerGj69DCesVdHtBUO/HWaLjOrw38vJAZOlj/TmY+Hlf69Z?=
 =?us-ascii?Q?OHJxk6Sne3JweITK63lSahv6CqRh+1VWVYA5SyOFHlnCjgk1HqVPw5mSKqE7?=
 =?us-ascii?Q?8kqoqWDAXrjSPHRMPWK+wH9FemvkONig8JvjMx/dUeexDb9EVRsJLQ5Ihm7g?=
 =?us-ascii?Q?MNg6iHS1MGtch3oTBvAUiWxe+MhEnOsedVUXdYmQUmgdMyMcM/NAuOyNXGJJ?=
 =?us-ascii?Q?w3lquoQuM3hMPGgcnrDqOuzrH9sxmURL3JTAkIiumcSKCnVbAeGB6PqqurCD?=
 =?us-ascii?Q?28A26dlWvwc29//c9OvDVWNyN87jOIhvpF+zJw6e39BdG7KQbId5boWGNSc4?=
 =?us-ascii?Q?jLyaVoZraOzeRdTlUel/gjppf4ZnM4SE5wDh2ocNpC1lR2zyoVV7XLJ3Txnz?=
 =?us-ascii?Q?JRMMLFpKd1sw6Pjow/5xHS4Ch3J4WENUkh3ZWeUGnyHMrWsYQeOfCZg3vKur?=
 =?us-ascii?Q?5ZmBDRahQbcZGjR+bPeUUYQHSKbGY0Ak41DEJhXehKhXZLcFVuR6TObSQwCB?=
 =?us-ascii?Q?4ewW7NB4IT6F70xWWNt5gp5iXXU5Hk5FCB9GS/bwz8CVKWWVCstr5EAzJf81?=
 =?us-ascii?Q?b1xuc/+Anb+nuOw8Z7F5JLODxtEcGrIa539ZnfAALfIjqNZJgrnk0Xnnydzh?=
 =?us-ascii?Q?V4u8oueNSS+9fBFxZrtJ/sAvsXJVz8fCErd407sX3Mu2S6bx8kRR1nO4RhPE?=
 =?us-ascii?Q?MJdH+KQ9lNQJVIHC5dtJOvsGBeWy+wpNCKjAvVukXTTKaVNV/eGZ9Cseg2mA?=
 =?us-ascii?Q?0LeeCnqnF6Gl/vui1gKg+mx+puUYxKDuGhSHMqdSosljEoCoRYtziSG4hcUK?=
 =?us-ascii?Q?fH3OZBre+cuIfF54AryDe8yJnGRfZzTGOu2SGPDfdGrva9+wIDpVXXgNOVNw?=
 =?us-ascii?Q?KAZAh8CrLDngeovK9l4moND9++ckEDSmYqW63TbEz2wbwdggKHgZfCuMJ7ww?=
 =?us-ascii?Q?mQyUCeoZrrca2EyaQLg0veaZAJfMCID6PVHd9BpJ31YFus00ly6yYc/yoXjv?=
 =?us-ascii?Q?edKM?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <32935ABF9418A34DB48E6E9CAB9C79BF@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7979.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e968d650-7ba8-4e27-e44b-08d8abb8ef78
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Dec 2020 05:16:45.1431
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AFXm6bTI8vVUu1CNyFy7RV/gWnwSJ/eong1BdZm0ISTp35naSlCrYizro+950G9f6u3JnZxlgifJMPNlm2ElXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5244
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 20-12-18 15:02:37, Dmitry Osipenko wrote:
> This series implements Runtime PM support for the Tegra ChipIdea USB driv=
er.
> It also squashes the older ehci-tegra driver into the ChipIdea driver, he=
nce
> the RPM is supported by both UDC and host controllers, secondly this open=
s
> opportunity for implementing OTG support in the future.
>=20
> Patchset was tested on various Tegra20, Tegra30 and Tegra124 devices.
> Thanks to Peter Geis, Matt Merhar, Nicolas Chauvet and Ion Agorria for
> helping with the extensive and productive testing!
>=20
> Changelog:
>=20
> v3: - Replaced "goto" with if-statements as was suggested by Thierry Redi=
ng.
>=20
>     - Improved wording of the deprecated Kconfig entry as was suggested
>       by Alan Stern.
>=20
>     - Added ACKs from Thierry Reding and Alan Stern.
>=20
>     - Added a new minor patch "Specify TX FIFO threshold in UDC SoC info"
>       just for completeness, since we can now switch OTG to host mode in
>       the ChipIdea driver. Although, OTG support remains a work-in-progre=
ss
>       for now.
>=20
> v2: - Improved comments in the code as it was suggested by Peter Chen and
>       Sergei Shtylyov for v1.
>=20
>     - Replaced mdelay() with fsleep() and made ci->hdc to reset to NULL i=
n
>       a error code path, like it was suggested by Peter Chen.
>=20
>     - Redirected deprecated USB_EHCI_TEGRA Kconfig entry to USB_CHIPIDEA_=
TEGRA
>       as was suggested by Alan Stern.
>=20
>     - Improved commit message and added ACK from Thierry Reding to the pa=
tch
>       that removes MODULE_ALIAS.
>=20
>     - Fixed UDC PHY waking up on ASUS TF201 tablet device by utilizing
>       additional VBUS sensor. This was reported and tested by Ion Agorria=
.
>=20
>     - Added t-b from Ion Agorria.
>=20
> Dmitry Osipenko (8):
>   usb: phy: tegra: Add delay after power up
>   usb: phy: tegra: Support waking up from a low power mode
>   usb: chipidea: tegra: Remove MODULE_ALIAS
>   usb: chipidea: tegra: Rename UDC to USB
>   usb: chipidea: tegra: Support runtime PM
>   usb: chipidea: tegra: Specify TX FIFO threshold in UDC SoC info
>   usb: host: ehci-tegra: Remove the driver
>   ARM: tegra_defconfig: Enable USB_CHIPIDEA_HOST and remove
>     USB_EHCI_TEGRA
>=20
> Peter Geis (1):
>   usb: chipidea: tegra: Support host mode

Chipidea related (patch 3-7) are applied, thanks.

Peter
>=20
>  arch/arm/configs/tegra_defconfig     |   3 +-
>  drivers/usb/chipidea/Kconfig         |   3 +-
>  drivers/usb/chipidea/ci_hdrc_tegra.c | 344 ++++++++++++---
>  drivers/usb/chipidea/core.c          |  10 +-
>  drivers/usb/chipidea/host.c          | 104 ++++-
>  drivers/usb/host/Kconfig             |  10 +-
>  drivers/usb/host/Makefile            |   1 -
>  drivers/usb/host/ehci-tegra.c        | 604 ---------------------------
>  drivers/usb/phy/phy-tegra-usb.c      | 103 ++++-
>  include/linux/usb/chipidea.h         |   6 +
>  include/linux/usb/tegra_usb_phy.h    |   2 +
>  11 files changed, 518 insertions(+), 672 deletions(-)
>  delete mode 100644 drivers/usb/host/ehci-tegra.c
>=20
> --=20
> 2.29.2
>=20

--=20

Thanks,
Peter Chen=
