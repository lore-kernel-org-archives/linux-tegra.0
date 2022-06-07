Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 887ACC433EF
	for <linux-tegra@archiver.kernel.org>; Tue,  7 Jun 2022 10:49:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241858AbiFGKta (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 7 Jun 2022 06:49:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242016AbiFGKtO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 7 Jun 2022 06:49:14 -0400
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D55453B73
        for <linux-tegra@vger.kernel.org>; Tue,  7 Jun 2022 03:47:55 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 8AE33C0005;
        Tue,  7 Jun 2022 10:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1654598874;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Wq5/ssyPN5Y2d5mBYNCD8f8OJkz94AbXsY62iwSKIwk=;
        b=dvnmUkdNBgtcS2a46ed2tT2ngs19//jK3OYvXoJqzMjQ82TTe4fDkUNPnbINTFVZ9ntR03
        6mFmDyJ8H+yeQ4SYlEkluHLVJIUEV41V2AoxNv6REcRquM86cAt1d1s0Md1le6vMfO+2Z9
        kGyiACWguhKIT/NKA25XobYB8QTAi59XEjzZqqiqFhBLzzHuZM/jw++6plY2lpf5XvHDdp
        ElhYpXuRt62LVHSheq9LJ32GKQbTydvJxgwYwaVNXklcN3KO9cvB47IPBZLvI0/3UxdWRi
        ddcVEexyDY7gxd5IvFeEXJ8gueKYWoIk0nSfnbF23xUQmr4N/r5RYFPPenFdlA==
Date:   Tue, 7 Jun 2022 12:47:46 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Pratyush Yadav <p.yadav@ti.com>
Cc:     Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= 
        <u.kleine-koenig@pengutronix.de>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Richard Weinberger <richard@nod.at>,
        Tudor Ambarus <tudor.ambarus@microchip.com>,
        Joel Stanley <joel@jms.id.au>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Liang Yang <liang.yang@amlogic.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>, <kernel@pengutronix.de>,
        <linux-mtd@lists.infradead.org>, Michael Walle <michael@walle.cc>,
        Andrew Jeffery <andrew@aj.id.au>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        <linuxppc-dev@lists.ozlabs.org>, <linux-tegra@vger.kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        <linux-amlogic@lists.infradead.org>
Subject: Re: [PATCH 00/14] mtd: Fix platform remove callbacks to always
 return 0
Message-ID: <20220607124746.20a2eaf0@xps-13>
In-Reply-To: <20220607093236.67txulke76mi6t75@ti.com>
References: <20220603210758.148493-1-u.kleine-koenig@pengutronix.de>
        <20220606151841.682a5939@xps-13>
        <20220607093236.67txulke76mi6t75@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Pratyush, Uwe,

p.yadav@ti.com wrote on Tue, 7 Jun 2022 15:02:36 +0530:

> Hi Miquel,
>=20
> On 06/06/22 03:18PM, Miquel Raynal wrote:
> > Hi Folks,
> >=20
> > u.kleine-koenig@pengutronix.de wrote on Fri,  3 Jun 2022 23:07:44 +0200:
> >  =20
> > > Hello,
> > >=20
> > > this series prepares to make platform remove callbacks return void.
> > > Therefor first update them to always return 0. The rationale is that =
the
> > > Linux device model doesn't handle failures on remove and if a remove
> > > callback returns an error, it just emits a quite generic error message
> > > and still removes the device. =20
> >=20
> > Tudor, Pratyush, Richard, Vignesh,
> >=20
> > The series looks good to me (besides the atmel patch), I think it's
> > best to take it directly through mtd/next instead of going through all
> > the different internal branches, please let me know if you disagree
> > with the idea. =20
>=20
> Patch 2 does not look good to me. It modifies the aspeed-smc driver in=20
> drivers/mtd/spi-nor/controllers/ but the driver has been moved to=20
> drivers/spi/ in Mark's next branch [0]. The patch would likely conflict=20
> with that.
>=20
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/c=
ommit?id=3D9c63b846e6df43e5b3d31263f7db545f32deeda3

Right, I believe Uwe is sending per-subsystems series so now that he is
aware we can safely drop patch 2.

Thanks,
Miqu=C3=A8l
