Return-Path: <SRS0=WsFM=DI=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B202C4727E
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Oct 2020 20:57:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B4D4020754
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Oct 2020 20:57:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pB1zmEc6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727124AbgJAU5G (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 1 Oct 2020 16:57:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726515AbgJAU5G (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 1 Oct 2020 16:57:06 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1C26C0613D0;
        Thu,  1 Oct 2020 13:57:05 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id a15so44831ljk.2;
        Thu, 01 Oct 2020 13:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XflpFmvYU4ZauRyF/CvBEwazfjgIznjHbxbdFQln060=;
        b=pB1zmEc6F+GNDrYLg2UDm3+/iTPpyEZy82EwS6wWv6/OIbXMKTiu2yN//9Ac84AiNg
         gTXy52KKNB6js3gVl0ifMsGb85RSdIHM+Ln17kx1FCqgfg24pXWZlcP2s90nvmWrVM8g
         f4OTw3GEdfH48iFyfS1wUWfouG8Xb41rFGvMYH7uLW+gwoAZZ80Eb2es1GBX+QFqJuZT
         tIy/40aGUd+Ld5xjZecBZoiwey8WewTHJBUr7c98dsRf4z5orc937BsQ3dLa+8wtKxd4
         QUSLJjImPfuVBbG7KLdWIM9TQkD1nLXri/a2+ktop2U2v3DGIuYLL3XP/0jKV8XGblP9
         3mDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XflpFmvYU4ZauRyF/CvBEwazfjgIznjHbxbdFQln060=;
        b=dgvkX8HTXIcxTekCG5WC36lTtZXhA74wphi8REKg2Y4WiKSkPLo78IE+wzIqpl5txf
         leFUVxQte6hLqUpSr6vAf7hiPleF0oGte5RLzwIPKYh46ZpWWb+rK/IosorUXJj9kqjv
         JEO7/eN/3EGjTEPpQ5FFUE99AS7gabvBwD6aDGkmcWIhQAOdQ2x2rJ+J1AU3AamxggIO
         srJyVitZ58uiC+3P3eAxeTCgnZidmBRybuL70DINYN+pYeIniWr5yjU7RaKWJR1ppey2
         RA4zdlF8tCB9cJQOEX7bfDOLhXGRwpsnp8d/JY/CQ7ASP06Jm/SVVV7d6R4Tow91PSyG
         4Hzw==
X-Gm-Message-State: AOAM530ea+44BFctMpyMGS5IpReO8uHNvCxWe1kr3wSvMVkVlgOO5zHZ
        gXoTZTtifgKKPwi9YytAL0OC5w/Su04=
X-Google-Smtp-Source: ABdhPJzzGOQYtFDLJ0Uinx31Or+7BavRRvl4lQZJncQmtxUElVDfDWAHIwhVcDOYFMPCeoTTheo3UQ==
X-Received: by 2002:a2e:9d8a:: with SMTP id c10mr3146731ljj.83.1601585824206;
        Thu, 01 Oct 2020 13:57:04 -0700 (PDT)
Received: from [192.168.2.145] ([109.252.91.252])
        by smtp.googlemail.com with ESMTPSA id g23sm712844lfb.230.2020.10.01.13.57.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2020 13:57:03 -0700 (PDT)
Subject: Re: [PATCH v3 10/13] ASoC: tegra: Add audio graph based card driver
To:     Sameer Pujar <spujar@nvidia.com>, broonie@kernel.org,
        lgirdwood@gmail.com, robh+dt@kernel.org,
        kuninori.morimoto.gx@renesas.com,
        pierre-louis.bossart@linux.intel.com, perex@perex.cz,
        tiwai@suse.com, thierry.reding@gmail.com, jonathanh@nvidia.com
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        sharadg@nvidia.com, mkumard@nvidia.com, viswanathl@nvidia.com,
        rlokhande@nvidia.com, dramesh@nvidia.com, atalambedu@nvidia.com,
        nwartikar@nvidia.com, swarren@nvidia.com, nicoleotsuka@gmail.com
References: <1601573587-15288-1-git-send-email-spujar@nvidia.com>
 <1601573587-15288-11-git-send-email-spujar@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <98f01f9e-96f8-6867-1af3-475294e81a9d@gmail.com>
Date:   Thu, 1 Oct 2020 23:57:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1601573587-15288-11-git-send-email-spujar@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

01.10.2020 20:33, Sameer Pujar пишет:
> +/* Setup PLL clock as per the given sample rate */
> +static int tegra_audio_graph_update_pll(struct snd_pcm_substream *substream,
> +					struct snd_pcm_hw_params *params)
> +{
> +	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
> +	struct asoc_simple_priv *priv = snd_soc_card_get_drvdata(rtd->card);
> +	struct device *dev = rtd->card->dev;
> +	struct tegra_audio_graph_data *graph_data =
> +		(struct tegra_audio_graph_data *)priv->data;
> +	struct tegra_audio_chip_data *chip_data =
> +		(struct tegra_audio_chip_data *)of_device_get_match_data(dev);

void* doesn't need casting
