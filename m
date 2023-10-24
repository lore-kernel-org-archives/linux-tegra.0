Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B471DC00A8F
	for <linux-tegra@archiver.kernel.org>; Tue, 24 Oct 2023 13:57:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234924AbjJXN5H (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 24 Oct 2023 09:57:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234576AbjJXN45 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 24 Oct 2023 09:56:57 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBC22C1
        for <linux-tegra@vger.kernel.org>; Tue, 24 Oct 2023 06:55:09 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B571C433C8;
        Tue, 24 Oct 2023 13:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698155709;
        bh=cZbYI/PBQsT9LNq45eFs68cYG4oY4r/yIQ/LLW2m7RE=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=oNxsO5a8CMTvXpm1/o/piO8VDoB+uC2HKz4aC1VSOLtcKSLe7zJjF62UZ1UdQOHiJ
         lq1w2fiw7OJuKB9nVvJzokKdR8slxwZ8MEFaK08Wq1V8LYKG1qtpdRaa+4QZwoYVCI
         dbDYf7fX5SsfGJDj50CZ0lIoy85orJHuOlftSEeEHvbUMh2kWC2JoTgP8wB3DSEVR0
         qniPwOSKhe2zIcR8zflVLjQxdEZW8shUh4XfjGInVzNxFd89NeeDPiyybyShybjRip
         rjIJYAj9R8F1jlhwOZ2tNNovxUNjqjdbsGipx+XvMsjOO9rQbPMJ4YpV8tsWfXeo37
         SaomGAu4q3Z1A==
From:   Mark Brown <broonie@kernel.org>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Heiko Stuebner <heiko@sntech.de>,
        linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
        James Schulman <james.schulman@cirrus.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        patches@opensource.cirrus.com,
        Hal Feng <hal.feng@starfivetech.com>,
        Xingyu Wu <xingyu.wu@starfivetech.com>,
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
        Herve Codina <herve.codina@bootlin.com>,
        Sameer Pujar <spujar@nvidia.com>, linux-tegra@vger.kernel.org,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-amlogic@lists.infradead.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>
In-Reply-To: <20231013221945.1489203-9-u.kleine-koenig@pengutronix.de>
References: <20231013221945.1489203-9-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 0/7] ASoc: Another series to convert to struct
 platform_driver:remove_new()
Message-Id: <169815569778.69390.11911007930896172841.b4-ty@kernel.org>
Date:   Tue, 24 Oct 2023 14:54:57 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-0438c
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sat, 14 Oct 2023 00:19:46 +0200, Uwe Kleine-König wrote:
> this is another series to convert ASoC drivers to use struct
> platform_driver:remove_new(). The rockchip one was already send before
> but with a wrong subject prefix, the cs42l43 driver is newer than the
> last series. The remaining five patches are for driver combos that my
> coccinelle patch failed to detect before.
> 
> Best regards
> Uwe
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: rockchip: i2s_tdm: Convert to platform remove callback returning void
      commit: 46dd58bef32dea55b663141858ca1659a85a1505
[2/7] ASoC: cs42l43: Convert to platform remove callback returning void
      commit: 491a1132f5cb77c8f1abb44d9928f8f184fc3df7
[3/7] ASoC: starfive/jh7110-pwmdac: Convert to platform remove callback returning void
      commit: 6b02f5a6f1853c6d5f73b000afbc177f5ee59d9e
[4/7] ASoC: simple-card-utils: Make simple_util_remove() return void
      commit: 393df6f321c757d164fa412b7eae527a8e2acb75
[5/7] ASoC: meson: Make meson_card_remove() return void
      commit: 8210f496c3e12410fa240c7fbc63f71ef78e253f
[6/7] ASoC: qcom: lpass: Make asoc_qcom_lpass_cpu_platform_remove() return void
      commit: d0cc676c426d1958989fac2a0d45179fb9992f0a
[7/7] ASoC: uniphier: Make uniphier_aio_remove() return void
      commit: 7242265213893e053457240f833d06ecd75b7ab3

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

