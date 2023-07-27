Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01AF9C04FE0
	for <linux-tegra@archiver.kernel.org>; Thu, 27 Jul 2023 07:56:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233288AbjG0H4f (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 27 Jul 2023 03:56:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232820AbjG0H4M (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 27 Jul 2023 03:56:12 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BF89132;
        Thu, 27 Jul 2023 00:53:35 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3C3DC4A9;
        Thu, 27 Jul 2023 09:52:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1690444354;
        bh=q2DYtbFmbhJ6XFDL3PRzs1vfmLvBbkXV5QWg7q2GMuw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=N5qT3rDxLY3QGBYiyHghxiw+8HqoFRi3rxuUgqm6h4OmVwQIfkW3x9q5Lv4jIsAyk
         ja3wqm6kIgPSnEdXVsoWN/JFRRPqivq1ZSg7kRBCQ7XBh0XXkkHBPm9yHXo43VUYq6
         /VdTVxkKEYlQ9S5mpsIsDTYvPSlirhUSVuKTT0wQ=
Date:   Thu, 27 Jul 2023 10:53:39 +0300
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
Subject: Re: [PATCH 2/3] dt-bindings: display: panel: Document Hydis
 HV070WX2-1E0
Message-ID: <20230727075339.GD25174@pendragon.ideasonboard.com>
References: <20230726185010.2294709-1-thierry.reding@gmail.com>
 <20230726185010.2294709-2-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230726185010.2294709-2-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Thierry,

Thank you for the patch.

On Wed, Jul 26, 2023 at 08:50:09PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The Hydis HV070WX2-1E0 is a 7" WXGA (800x1280) TFT LCD LVDS panel that
> is one of the variants used on Google Nexus 7.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  Documentation/devicetree/bindings/display/panel/panel-lvds.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> index dbbf32a8be87..9f1016551e0b 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> @@ -44,6 +44,8 @@ properties:
>            - chunghwa,claa070wp03xg
>            # HannStar Display Corp. HSD101PWW2 10.1" WXGA (1280x800) LVDS panel
>            - hannstar,hsd101pww2
> +          # Hydis Technologies 7" WXGA (800x1280) TFT LCD LVDS panel
> +          - hydis,hv070wx2-1e0
>            - tbs,a711-panel
>  
>        - const: panel-lvds

-- 
Regards,

Laurent Pinchart
