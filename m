Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4598FC433EF
	for <linux-tegra@archiver.kernel.org>; Thu, 28 Apr 2022 19:23:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231750AbiD1T1J (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 28 Apr 2022 15:27:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbiD1T1I (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 28 Apr 2022 15:27:08 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39391B3DEE
        for <linux-tegra@vger.kernel.org>; Thu, 28 Apr 2022 12:23:53 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dmitry.osipenko)
        with ESMTPSA id 9DDB41F45BFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1651173831;
        bh=ckdtfDB9xRSc9e54iSpCwSOuSel09fuORkuQjR7dZ8E=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=VwWjoCY5SKwqk/jUrRxbusJNYUVghQp6e0tA29W4gdjkFPeu4PX3srBRd4NGqogBY
         VdAmCEP1RKFhObwPqXjuEPuAmaZrmIvuRd4eHJzDljqRCe6FsHbuuWd4rh5QlftMg1
         9MJ6IGRQp4NOhgf6XbUcT9UhmQ5cKnqxpUUFdqym6+eLLC/yzkeq+PRdLwLvgcE+Le
         rfezEWIWziWB/d0oeb1EyXNWq1pd5Cmuz4/d/nKseNoiYtSdZ/U7J6byuO9o0Xcw2V
         8NGqbhRyKOuUhS1sjhfrumyx71UD0JLxK/3NVkoFOv+3CbiTV8SwLM/mNZQkoyPL76
         rPNO3GT4CbDgw==
Message-ID: <ebbbb232-299a-1d20-50d7-efbf7f9015b0@collabora.com>
Date:   Thu, 28 Apr 2022 22:23:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] clk: tegra: Add missing reset deassertion
Content-Language: en-US
To:     Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, thierry.reding@gmail.com
Cc:     linux-tegra@vger.kernel.org
References: <20220426132343.777966-1-diogo.ivo@tecnico.ulisboa.pt>
From:   Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20220426132343.777966-1-diogo.ivo@tecnico.ulisboa.pt>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 4/26/22 16:23, Diogo Ivo wrote:
> Commit 4782c0a5dd88e3797426e08c5c437e95a3156631 ("clk: tegra: Don't
> deassert reset on enabling clocks") removed deassertion of reset lines
> when enabling peripheral clocks. This breaks the initialization of the
> DFLL driver which relied on this behaviour.
> 
> Fix this problem by adding explicit deassert/assert requests to the
> driver and the corresponding reset to the DT. Tested on Google Pixel C.
> 

Add these tags to the commit message:

Cc: stable@vger.kernel.org
Fixes: 4782c0a5dd88 ("clk: tegra: Don't deassert reset on enabling clocks")

> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi |  5 +++--
>  drivers/clk/tegra/clk-dfll.c             | 12 ++++++++++++
>  2 files changed, 15 insertions(+), 2 deletions(-)

...
> @@ -1951,6 +1956,12 @@ int tegra_dfll_register(struct platform_device *pdev,
>  
>  	td->soc = soc;
>  
> +	td->dfll_rst = devm_reset_control_get(td->dev, "dfll");

This will break devices that aren't affected by the problem of Pixel C.
Use devm_reset_control_get_optional().
