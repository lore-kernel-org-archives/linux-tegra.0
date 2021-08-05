Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3F62C432BE
	for <linux-tegra@archiver.kernel.org>; Thu,  5 Aug 2021 06:30:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 89A7860F0F
	for <linux-tegra@archiver.kernel.org>; Thu,  5 Aug 2021 06:30:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237185AbhHEGad (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 5 Aug 2021 02:30:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237175AbhHEGa2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 5 Aug 2021 02:30:28 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA3F9C0613C1;
        Wed,  4 Aug 2021 23:30:14 -0700 (PDT)
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2356451D;
        Thu,  5 Aug 2021 08:30:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1628145012;
        bh=CRrZ8VyjuDTAN9FDBm5o5NHrzfW1DfDQmst2R7yK6BA=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=oAIxeZXY61Mkdnn86oK0d8j+ts2KLL1M1gF9ls1DbQACtONM6RGcdOCK35osM1qVi
         zozqSC75mjoqrEiZdxqJnXNuiKIn3ErxdR/qwtsr5oFwYV3v2PLQCshho4wKe+R+eA
         fmXKXE0sLdVpBVdG26FhHou7fCf9o+fYxuVrEV+Q=
Subject: Re: [PATCH v2 5/9] drm/omap: Enable COMPILE_TEST on all architectures
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc:     Sascha Hauer <s.hauer@pengutronix.de>,
        Jyri Sarha <jyri.sarha@iki.fi>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-renesas-soc@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>, linux-imx@nxp.com,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        linux-tegra@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
        Alain VOLMAT-SCND-01 <alain.volmat@foss.st.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
References: <20210731013954.11926-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210731013954.11926-6-laurent.pinchart+renesas@ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <ed900028-f1cd-56e8-f73f-5a17f932c0bf@ideasonboard.com>
Date:   Thu, 5 Aug 2021 09:30:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210731013954.11926-6-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 31/07/2021 04:39, Laurent Pinchart wrote:
> To extend test coverage, relax the dependency on ARCH_OMAP2PLUS or
> ARCH_MULTIPLATFORM to also enable compilation with COMPILE_TEST.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
> Changes since v1:
> 
> - Enable COMPILE_TEST on all architectures
> ---
>   drivers/gpu/drm/omapdrm/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/Kconfig b/drivers/gpu/drm/omapdrm/Kconfig
> index e7281da5bc6a..560d0cdd6156 100644
> --- a/drivers/gpu/drm/omapdrm/Kconfig
> +++ b/drivers/gpu/drm/omapdrm/Kconfig
> @@ -2,7 +2,7 @@
>   config DRM_OMAP
>   	tristate "OMAP DRM"
>   	depends on DRM
> -	depends on ARCH_OMAP2PLUS || ARCH_MULTIPLATFORM
> +	depends on ARCH_OMAP2PLUS || ARCH_MULTIPLATFORM || COMPILE_TEST
>   	select OMAP2_DSS
>   	select DRM_KMS_HELPER
>   	select VIDEOMODE_HELPERS
> 

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi
