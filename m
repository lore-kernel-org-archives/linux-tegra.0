Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9D0BC433E9
	for <linux-tegra@archiver.kernel.org>; Tue,  2 Feb 2021 13:24:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 76CC164F5D
	for <linux-tegra@archiver.kernel.org>; Tue,  2 Feb 2021 13:24:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230184AbhBBNY3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 2 Feb 2021 08:24:29 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:14625 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232367AbhBBNYU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 2 Feb 2021 08:24:20 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B601952590001>; Tue, 02 Feb 2021 05:23:40 -0800
Received: from [10.26.73.224] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 2 Feb
 2021 13:23:33 +0000
Subject: Re: [PATCH v1 0/2] ASoC: tegra: Add RT5631 machine driver
To:     Ion Agorria <AG0RRIA@yahoo.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Stephen Warren <swarren@nvidia.com>,
        "Liam Girdwood" <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Rob Herring <robh+dt@kernel.org>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Ion Agorria <ion@agorria.com>,
        Dmitry Osipenko <digetx@gmail.com>
CC:     <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20210131184101.651486-1-AG0RRIA.ref@yahoo.com>
 <20210131184101.651486-1-AG0RRIA@yahoo.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <82a3375e-6105-875c-3332-33fcf2c0f785@nvidia.com>
Date:   Tue, 2 Feb 2021 13:23:30 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210131184101.651486-1-AG0RRIA@yahoo.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1612272220; bh=JyikfCz92yVxYA1vOLWUM2dzdGU1IyM4ZHB619+pRO0=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Language:
         Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
        b=rTpIJ/g2VXPd3nMwrYy0HW85u5vFpktSaNiXq7yTpUMKl4wrPtV2PlwXgnHHNqrNc
         UYYYdfBH2gzCGkBwKPMNkE5w4kZBbqfVXWOOEy2C9BIEHdhhb+u3AO0uV5hCWzQE0K
         eqwV5HZGToPMGLHjX3pPeCXFw5gSyVPHgbTNfLD0iGSu3lrfpHhgU5ukYBAhjvb0i3
         Y0v25eJ4onjXonF0ABo6aUqktZye5+z6YPxSLkgsSaJc/sl+lq33Hr+s69uVN6iaoK
         EQAXpeZVhub2Didns7ImYnwoMG28lV0u/Of5SwlTek4k8MmBV0qEeQcLdZVvXcHfd7
         juLI4hxRI0/mw==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 31/01/2021 18:40, Ion Agorria wrote:
> From: Ion Agorria <ion@agorria.com>
> 
> Adds support for Tegra SoC devices with RT5631 sound codec.
> Playback to speakers, headphones and internal mic recording works.
> 
> This driver is used for ASUS Transformer TF201, TF700T and others
> Tegra based devices containing RT5631.
> 
> Svyatoslav Ryhel (2):
>   ASoC: dt-bindings: tegra: Add binding for RT5631
>   ASoC: tegra: Add RT5631 machine driver
> 
>  .../sound/nvidia,tegra-audio-rt5631.yaml      | 134 +++++++++
>  sound/soc/tegra/Kconfig                       |   8 +
>  sound/soc/tegra/Makefile                      |   2 +
>  sound/soc/tegra/tegra_rt5631.c                | 261 ++++++++++++++++++
>  4 files changed, 405 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5631.yaml
>  create mode 100644 sound/soc/tegra/tegra_rt5631.c


I don't see any user of this driver included. Any reason why?

Jon

-- 
nvpublic
