Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3388FCCA47C
	for <linux-tegra@archiver.kernel.org>; Tue,  7 Jun 2022 09:34:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232941AbiFGJeM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 7 Jun 2022 05:34:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239663AbiFGJeJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 7 Jun 2022 05:34:09 -0400
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 850971A836
        for <linux-tegra@vger.kernel.org>; Tue,  7 Jun 2022 02:34:05 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2579Wc0I091949;
        Tue, 7 Jun 2022 04:32:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1654594358;
        bh=4gEuMclZBhRQsDp0tvKaU3YrWccQZAGJURM8nh1W4Dc=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=k3vx5fmY3w2g9Kjy9vS3FS56toxZSl4jg/ajU1hdRRImusYUUI39kNg2qhLfeXCDd
         F7OzJAHN5T4gAJh/8Fu9mAhSWZ+FGGvj2oIwfhncphIoKXvPIxSBH/WdWhJW7XynOc
         YBUg7FOlGe/94JgUoQ+dgpWXspuXRavwoYOd/Kzs=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2579WcaD112036
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 7 Jun 2022 04:32:38 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 7
 Jun 2022 04:32:37 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 7 Jun 2022 04:32:37 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2579WbvB057541;
        Tue, 7 Jun 2022 04:32:37 -0500
Date:   Tue, 7 Jun 2022 15:02:36 +0530
From:   Pratyush Yadav <p.yadav@ti.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
CC:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
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
Message-ID: <20220607093236.67txulke76mi6t75@ti.com>
References: <20220603210758.148493-1-u.kleine-koenig@pengutronix.de>
 <20220606151841.682a5939@xps-13>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220606151841.682a5939@xps-13>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Miquel,

On 06/06/22 03:18PM, Miquel Raynal wrote:
> Hi Folks,
> 
> u.kleine-koenig@pengutronix.de wrote on Fri,  3 Jun 2022 23:07:44 +0200:
> 
> > Hello,
> > 
> > this series prepares to make platform remove callbacks return void.
> > Therefor first update them to always return 0. The rationale is that the
> > Linux device model doesn't handle failures on remove and if a remove
> > callback returns an error, it just emits a quite generic error message
> > and still removes the device.
> 
> Tudor, Pratyush, Richard, Vignesh,
> 
> The series looks good to me (besides the atmel patch), I think it's
> best to take it directly through mtd/next instead of going through all
> the different internal branches, please let me know if you disagree
> with the idea.

Patch 2 does not look good to me. It modifies the aspeed-smc driver in 
drivers/mtd/spi-nor/controllers/ but the driver has been moved to 
drivers/spi/ in Mark's next branch [0]. The patch would likely conflict 
with that.

[0] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit?id=9c63b846e6df43e5b3d31263f7db545f32deeda3

> 
> Cheers,
> Miquèl
> 
> > 
> > Best regards
> > Uwe
> > 
> > Uwe Kleine-König (14):
> >   mtd: hyperbus: Make hyperbus_unregister_device() return void
> >   mtd: spi-nor: aspeed-smc: Make aspeed_smc_unregister() return void
> >   mtd: powernv_flash: Warn about failure to unregister mtd device
> >   mtd: st-spi_fsm: Warn about failure to unregister mtd device
> >   mtd: lpddr2_nvm: Warn about failure to unregister mtd device
> >   mtd: spear_smi: Don't skip cleanup after mtd_device_unregister()
> >     failed
> >   mtd: spear_smi: Drop if with an always false condition
> >   mtd: rawnand: atmel: Warn about failure to unregister mtd device
> >   mtd: rawnand: omap2: Suppress error message after WARN in .remove()
> >   mtd: rawnand: tegra: Don't skip cleanup after mtd_device_unregister()
> >     failed
> >   mtd: rawnand: meson: Don't skip cleanup after mtd_device_unregister()
> >     failed
> >   mtd: rawnand: meson: Drop cleaning platform data in .remove()
> >   mtd: physmap: Don't skip cleanup after mtd_device_unregister() failed
> >   mtd: physmap: Drop if with an always false condition
> > 
> >  drivers/mtd/devices/powernv_flash.c          |  4 +++-
> >  drivers/mtd/devices/spear_smi.c              | 10 ++--------
> >  drivers/mtd/devices/st_spi_fsm.c             |  4 +++-
> >  drivers/mtd/hyperbus/hbmc-am654.c            |  6 +++---
> >  drivers/mtd/hyperbus/hyperbus-core.c         |  8 ++------
> >  drivers/mtd/hyperbus/rpc-if.c                |  5 +++--
> >  drivers/mtd/lpddr/lpddr2_nvm.c               |  4 +++-
> >  drivers/mtd/maps/physmap-core.c              | 13 +++----------
> >  drivers/mtd/nand/raw/atmel/nand-controller.c |  5 ++++-
> >  drivers/mtd/nand/raw/meson_nand.c            | 16 +++-------------
> >  drivers/mtd/nand/raw/omap2.c                 |  6 ++----
> >  drivers/mtd/nand/raw/tegra_nand.c            |  5 +----
> >  drivers/mtd/spi-nor/controllers/aspeed-smc.c |  8 ++++----
> >  include/linux/mtd/hyperbus.h                 |  4 +---
> >  14 files changed, 37 insertions(+), 61 deletions(-)
> > 
> > base-commit: 4b0986a3613c92f4ec1bdc7f60ec66fea135991f
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.
