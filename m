Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDE57C433E0
	for <linux-tegra@archiver.kernel.org>; Tue,  2 Feb 2021 15:57:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7A61864E2B
	for <linux-tegra@archiver.kernel.org>; Tue,  2 Feb 2021 15:57:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235807AbhBBP4v (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 2 Feb 2021 10:56:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235795AbhBBPyv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 2 Feb 2021 10:54:51 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D6AFC06174A;
        Tue,  2 Feb 2021 07:54:10 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id m22so17100023ljj.4;
        Tue, 02 Feb 2021 07:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8enBlEOKm9It/cKHLJMBWzbNRlOst59aHzd+yoHUl1g=;
        b=iULnQ2RFjb9qH8isdKYaNhZLY+tfsIUPGJL7ERo/5cHGdhSvGFRrLujvZlcYvaj+Yv
         wYrSQGYxiqDJVGGro4J/DiVfelriL3AzGpQYJn4tQZ1xCFRAO5EAc98/w7XRBaESJDdp
         jSuAkCJCnRsGFQ9cdoBvvN1o86ciiTXcAEehuumro4KFC6C/A9JxbiE20UOqwDGVJwZr
         Ipcn1yYXG3HmdP60XczQ6aDM8f3W6x/zTmjkJGnWBzb3QEvJMC9uEHzqVVfF3hz9BTWz
         A5FxlEOYDdu0CVt7zN9sYfQyToQLo7JQe9AamJoIPD6GVNPnyRUz4LIyJPVYvezOeVf+
         36ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8enBlEOKm9It/cKHLJMBWzbNRlOst59aHzd+yoHUl1g=;
        b=UID8WkXKzD+uDx4UVmnJMUR9uIc41lrOpcEJz643JQJGVaxUAvrU/Bj2lVY6LBmpXq
         nB66BnAhuXqY8FciGi6ML8iW9bq6QYDQyrJA25f9LmfhyU48jsaqynrg0kmfs3C+Oy/d
         3BuRBq6l0ZgXxLMOMSGHGekNUQ8sDLWaimaNgULn0nww2QtGDkmlLyM1CNPObKGmle/V
         Rw4y8OVxPeexCOe0Dq/zXyAB0nzOsUHKCNAD0wx8tHQdGSDK6Q7q5il4lUrepowVM6ts
         NIp0ifYg8lxELqEtEGvxkJpNgXqI2szl6DS42tr1rDn7q4XRVpapibRyJeY/FxJ4pQjD
         GlKw==
X-Gm-Message-State: AOAM533u34zkj4diRY0lGgyI3iGkze/0drVSppGgpyuNVSgs4azysH9I
        iJ2mOyjW9k9qRo3mwyRCRwn5nfwaIvE=
X-Google-Smtp-Source: ABdhPJyu2R9ua7UAwzHH793ECSpeoTE0qAJCKeo7jAGHit4l626oPtuP30Wcm13/wg7vHyy4b4JvEw==
X-Received: by 2002:a2e:9115:: with SMTP id m21mr13877035ljg.62.1612281246415;
        Tue, 02 Feb 2021 07:54:06 -0800 (PST)
Received: from ?IPv6:2a00:1370:814d:ea25:a10:76ff:fe69:21b6? ([2a00:1370:814d:ea25:a10:76ff:fe69:21b6])
        by smtp.googlemail.com with ESMTPSA id y21sm3347792lfg.282.2021.02.02.07.54.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Feb 2021 07:54:05 -0800 (PST)
Subject: Re: [PATCH v1 2/2] ASoC: tegra: Add RT5631 machine driver
To:     Ion Agorria <AG0RRIA@yahoo.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Stephen Warren <swarren@nvidia.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Rob Herring <robh+dt@kernel.org>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Ion Agorria <ion@agorria.com>
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210131184101.651486-1-AG0RRIA@yahoo.com>
 <20210131184101.651486-3-AG0RRIA@yahoo.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <5ee67a6b-ebe0-8565-5315-bc823ece32f2@gmail.com>
Date:   Tue, 2 Feb 2021 18:54:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20210131184101.651486-3-AG0RRIA@yahoo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

31.01.2021 21:41, Ion Agorria пишет:
> +	np_codec = of_parse_phandle(pdev->dev.of_node, "nvidia,audio-codec", 0);
> +	if (!np_codec) {
> +		dev_err(&pdev->dev,
> +			"Property 'nvidia,audio-codec' missing or invalid\n");
> +		return -EINVAL;
> +	}
> +
> +	np_i2s = of_parse_phandle(pdev->dev.of_node, "nvidia,i2s-controller", 0);
> +	if (!np_i2s) {
> +		dev_err(&pdev->dev,
> +			"Property 'nvidia,i2s-controller' missing or invalid\n");
> +		return -EINVAL;
> +	}

We missed that the np_codec and np_i2s should be put when driver is released.

https://elixir.bootlin.com/linux/v5.11-rc6/source/drivers/of/base.c#L1429

We could fix it with a devm helper in v2.

diff --git a/sound/soc/tegra/tegra_rt5631.c b/sound/soc/tegra/tegra_rt5631.c
index 9034f48bcb26..84f23915bd95 100644
--- a/sound/soc/tegra/tegra_rt5631.c
+++ b/sound/soc/tegra/tegra_rt5631.c
@@ -172,6 +172,30 @@ static struct snd_soc_card snd_soc_tegra_rt5631 = {
 	.fully_routed = true,
 };
 
+static void tegra_rt5631_node_release(void *of_node)
+{
+	of_node_put(of_node);
+}
+
+static struct device_node *
+tegra_rt5631_parse_phandle(struct device *dev, const char *name)
+{
+	struct device_node *np;
+	int err;
+
+	np = of_parse_phandle(dev->of_node, name, 0);
+	if (!np) {
+		dev_err(dev, "Property '%s' missing or invalid\n", name);
+		return ERR_PTR(-EINVAL);
+	}
+
+	err = devm_add_action_or_reset(dev, tegra_rt5631_node_release, np);
+	if (err)
+		return ERR_PTR(err);
+
+	return np;
+}
+
 static int tegra_rt5631_probe(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = &snd_soc_tegra_rt5631;
@@ -209,19 +233,13 @@ static int tegra_rt5631_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	np_codec = of_parse_phandle(pdev->dev.of_node, "nvidia,audio-codec", 0);
-	if (!np_codec) {
-		dev_err(&pdev->dev,
-			"Property 'nvidia,audio-codec' missing or invalid\n");
-		return -EINVAL;
-	}
+	np_codec = tegra_rt5631_parse_phandle(&pdev->dev, "nvidia,audio-codec");
+	if (IS_ERR(np_codec))
+		return PTR_ERR(np_codec);
 
-	np_i2s = of_parse_phandle(pdev->dev.of_node, "nvidia,i2s-controller", 0);
-	if (!np_i2s) {
-		dev_err(&pdev->dev,
-			"Property 'nvidia,i2s-controller' missing or invalid\n");
-		return -EINVAL;
-	}
+	np_i2s = tegra_rt5631_parse_phandle(&pdev->dev, "nvidia,i2s-controller");
+	if (!np_i2s)
+		return PTR_ERR(np_i2s);
 
 	tegra_rt5631_dai.cpus->of_node = np_i2s;
 	tegra_rt5631_dai.codecs->of_node = np_codec;
