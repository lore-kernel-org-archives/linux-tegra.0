Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7229DC001E0
	for <linux-tegra@archiver.kernel.org>; Thu, 27 Jul 2023 07:56:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232185AbjG0H4S (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 27 Jul 2023 03:56:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233542AbjG0H4E (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 27 Jul 2023 03:56:04 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BE2F421E;
        Thu, 27 Jul 2023 00:52:17 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2FEDF4A9;
        Thu, 27 Jul 2023 09:51:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1690444276;
        bh=hLYS7QNXgw79aP9ZeDf0oH24DQ1yvOeoY44cgIG36to=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Xo0m6d/4sKt30bXOaOQ9157Rxbwm4gi0gF5CcRfrxPcBQYLZN2HIwCYDp9Eb+nDDc
         HwmqVm2nDOuQDyXN/Q97JN8RYJogM7E0qtVLZuXTvGJDC+Gn5sSK+b4acQS2nZaqrw
         IyeWs60FVNjpURgjLXtpv6LSK/hZ8h1UH6yfjDQU=
Date:   Thu, 27 Jul 2023 10:52:20 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Neil Armstrong <neil.armstrong@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: display: panel: Move HannStar
 HSD101PWW2 to LVDS
Message-ID: <20230727075220.GB25174@pendragon.ideasonboard.com>
References: <20230726184857.2294570-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230726184857.2294570-1-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Thierry,

Thank you for the patch.

On Wed, Jul 26, 2023 at 08:48:55PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The HannStar HSD101PWW2 is an LVDS panel, so move it to the correct
> bindings file.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  Documentation/devicetree/bindings/display/panel/panel-lvds.yaml | 2 ++
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 --
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> index 929fe046d1e7..344e5df40c2f 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> @@ -40,6 +40,8 @@ properties:
>      items:
>        - enum:
>            - auo,b101ew05
> +          # HannStar Display Corp. HSD101PWW2 10.1" WXGA (1280x800) LVDS panel
> +          - hannstar,hsd101pww2
>            - tbs,a711-panel
>  
>        - const: panel-lvds
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index df1cec8fd21b..f4d9da4afefd 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -168,8 +168,6 @@ properties:
>        - hannstar,hsd070pww1
>          # HannStar Display Corp. HSD100PXN1 10.1" XGA LVDS panel
>        - hannstar,hsd100pxn1

I'm wondering if it would make sense to move them all in one go ?
Regardless, this patch is OK, so

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> -        # HannStar Display Corp. HSD101PWW2 10.1" WXGA (1280x800) LVDS panel
> -      - hannstar,hsd101pww2
>          # Hitachi Ltd. Corporation 9" WVGA (800x480) TFT LCD panel
>        - hit,tx23d38vm0caa
>          # InfoVision Optoelectronics M133NWF4 R0 13.3" FHD (1920x1080) TFT LCD panel

-- 
Regards,

Laurent Pinchart
