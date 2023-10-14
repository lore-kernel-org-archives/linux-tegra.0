Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A10F7CDB465
	for <linux-tegra@archiver.kernel.org>; Sat, 14 Oct 2023 12:23:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232994AbjJNMXd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 14 Oct 2023 08:23:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232957AbjJNMXb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 14 Oct 2023 08:23:31 -0400
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1EBFA2
        for <linux-tegra@vger.kernel.org>; Sat, 14 Oct 2023 05:23:27 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0E7B320009;
        Sat, 14 Oct 2023 12:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1697286206;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Y4PnKGHKrBZ0yORVg2xj3dm8E1SmEj+8SqdJOwV/d30=;
        b=paTNTZK2mut+6sDu5aatyQmlcUuWMcmPzzoKCIPkOobhAT1dsw9pzSW5K5KCErPmUVtn/S
        p5csf0+1CPC0pEhm3b8hhsGYv4BU1crcVY+wr7WVM0wo8b5d9FHXxRejumARvEVWp4aQtt
        BZwYjJdiusXuI4L6EyKtR3gctAqEKG8/PKwhd5d8ZMMJtY1XulYbptly3Y9B/uj+OYJCqP
        pl2/pbReP4hqNbR+UoFGrJ5wi7uv2cvOdgM+qf14mz/Wh5JxrVgNZO4+eWDgrZyo5/7bmv
        LgF+64Hi0ioNq6t6elDUe0kci//orZKn/SSn2luy1xSYrn2FOXSfsOlNo1ufdA==
Date:   Sat, 14 Oct 2023 14:23:22 +0200
From:   Herve Codina <herve.codina@bootlin.com>
To:     Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Rob Herring <robh@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Wang Yufen <wangyufen@huawei.com>,
        Aidan MacDonald <aidanmacdonald.0x0@gmail.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Astrid Rost <astrid.rost@axis.com>,
        Robert Hancock <robert.hancock@calian.com>,
        Sameer Pujar <spujar@nvidia.com>, alsa-devel@alsa-project.org,
        kernel@pengutronix.de, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 4/7] ASoC: simple-card-utils: Make simple_util_remove()
 return void
Message-ID: <20231014142322.30039db9@bootlin.com>
In-Reply-To: <20231013221945.1489203-13-u.kleine-koenig@pengutronix.de>
References: <20231013221945.1489203-9-u.kleine-koenig@pengutronix.de>
        <20231013221945.1489203-13-u.kleine-koenig@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sat, 14 Oct 2023 00:19:50 +0200
Uwe Kleine-König <u.kleine-koenig@pengutronix.de> wrote:

> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code.  However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> simple_util_remove() returned zero unconditionally. Make it return void
> instead and convert all users to struct platform_device::remove_new().
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé
