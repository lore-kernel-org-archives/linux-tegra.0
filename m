Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5386C25B48
	for <linux-tegra@archiver.kernel.org>; Tue, 24 Oct 2023 08:55:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234168AbjJXIzU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 24 Oct 2023 04:55:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234112AbjJXIzG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 24 Oct 2023 04:55:06 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D50B172A;
        Tue, 24 Oct 2023 01:54:43 -0700 (PDT)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 5BEDE6607331;
        Tue, 24 Oct 2023 09:54:41 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1698137682;
        bh=VI/Y25XEqSA3SbhcywY0RAYmG7kmKXN4kUFw9lzcX+k=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=j90A8ETr4geEi4CEGY63sExDY6LWoWzC9w34VLmFbz0Ax27274b3bX6FLA5Yla7Ye
         NrvHZFwdSWyZFEV1FV2AkxkUpE/uT/dcNVpASPz2NOgr+WmX53SHpee81XPUdzxx2T
         VQrE89O2dlVmhg74VaAI77C0/JKZytqyKv4VQx6T2O7VnWSvnBxTvNhJa1E9dwWeTq
         dwgAX6K71QVhXaU102he57qygE3ubL4CBtJIrP9dUER7mAYpixoOZotRZltP4yRR8X
         qzAC91kVbLPsz9qwuKOIR60Tec2gtPiWVDY8EgQtgbpDBHbWPazJHQ7YNTsAUiuzFq
         u+TOsYfNg1szA==
Message-ID: <72e5b30e-d65b-4530-ba6e-31082a059cb1@collabora.com>
Date:   Tue, 24 Oct 2023 10:54:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT PATCH 12/17] ASoC: mediatek: mt8183: Handle component name
 prefix
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Oder Chiou <oder_chiou@realtek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org
References: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
 <20231023095428.166563-13-krzysztof.kozlowski@linaro.org>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231023095428.166563-13-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Il 23/10/23 11:54, Krzysztof Kozlowski ha scritto:
> Use snd_soc_dapm_widget_name_cmp() helper when comparing widget names,
> to include also the component's name prefix.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


