Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEA4FC433E0
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Feb 2021 10:01:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A38AC64F74
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Feb 2021 10:01:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233581AbhBCKBn (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 3 Feb 2021 05:01:43 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:2016 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233357AbhBCKBh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 3 Feb 2021 05:01:37 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B601a74530003>; Wed, 03 Feb 2021 02:00:51 -0800
Received: from [10.26.73.224] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 3 Feb
 2021 10:00:48 +0000
Subject: Re: [PATCH v2 5/9] arm64: defconfig: Enable RT5659
To:     Sameer Pujar <spujar@nvidia.com>, <thierry.reding@gmail.com>,
        <broonie@kernel.org>, <robh+dt@kernel.org>, <lgirdwood@gmail.com>
CC:     <kuninori.morimoto.gx@renesas.com>, <linux-tegra@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
        <sharadg@nvidia.com>, Oder Chiou <oder_chiou@realtek.com>,
        Bard Liao <bardliao@realtek.com>
References: <1611944866-29373-1-git-send-email-spujar@nvidia.com>
 <1611944866-29373-6-git-send-email-spujar@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <3d0aa7e4-9c9e-38a0-7cff-d86009b9266b@nvidia.com>
Date:   Wed, 3 Feb 2021 10:00:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1611944866-29373-6-git-send-email-spujar@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1612346451; bh=Zm6eAFzmy5jCUF8zdukXzNtqTTnjEePWswJsRjm9IPg=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Language:
         Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
        b=QRFtyKBWB9Jqwvm2v8PbDaYUm7fs3hNnYaMFwt1GUk0en/9nJgrESDwqV8hJYWLQ/
         gOvOefAkfpp1WBRL2agcSHkcqdbvQQucDQeb/iZqhzWkAmY6vcdMxm7IIoj4oS8JZo
         76dPFpXwPVXLNjvISSh704k2yUamtyRygmAFO4MwYlo+m/uB9XahkKuWs8z/Tg04om
         4zesNHGTLUpHFrgjtOgnNmot18L4pzi2Xu2w0sYIcu5ONnvOOOqNa5wN7BP8xvRU4y
         2jx4v3AZR+vY+BxFNi0Dbsu90ZTqkUl5In9T0a5uKumb+nxUN9j5timObv5ypSObfL
         MEpWu4cFi2JEQ==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 29/01/2021 18:27, Sameer Pujar wrote:
> Enable the RT5659 audio codec driver.

We could add that the Jetson AGX Xavier uses this codec and so we want
to enable this for testing purposes. Otherwise ...

> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> Cc: Oder Chiou <oder_chiou@realtek.com>
> Cc: Bard Liao <bardliao@realtek.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index ec377f7..ea279e8 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -754,6 +754,7 @@ CONFIG_SND_SOC_ES7134=m
>  CONFIG_SND_SOC_ES7241=m
>  CONFIG_SND_SOC_GTM601=m
>  CONFIG_SND_SOC_PCM3168A_I2C=m
> +CONFIG_SND_SOC_RT5659=m
>  CONFIG_SND_SOC_SIMPLE_AMPLIFIER=m
>  CONFIG_SND_SOC_TAS571X=m
>  CONFIG_SND_SOC_WCD934X=m
> 

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
