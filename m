Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 540E4C433EF
	for <linux-tegra@archiver.kernel.org>; Thu,  6 Jan 2022 01:02:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240033AbiAFBCa (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 5 Jan 2022 20:02:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240018AbiAFBCa (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Jan 2022 20:02:30 -0500
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDE76C061245
        for <linux-tegra@vger.kernel.org>; Wed,  5 Jan 2022 17:02:29 -0800 (PST)
Received: by mail-il1-x12d.google.com with SMTP id v10so891773ilj.3
        for <linux-tegra@vger.kernel.org>; Wed, 05 Jan 2022 17:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MIFRxmXWiEBCiGr15456Pgg06Y+aeSi4XJyFkvrjKcY=;
        b=YWi65CpZCs2GGkYUWUA+9oQ5itYVgpmPFXUHQhi8B3TMg6XhFy5U+fGdUq21oWo/dB
         TDI/nlySgRjRy/gbqtKKNYZXShZrx8VtLBM6nKht/ZaExjQIxD4ZpGOJs6D3s8DWreQq
         SAF/8uVSAr7OkGtIJlg90seeMXjq6K1dJhN9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MIFRxmXWiEBCiGr15456Pgg06Y+aeSi4XJyFkvrjKcY=;
        b=v6E3UA1qs2dSna846eaSF3QsXaANqMFjQzy6hg2Ekq6p+FHwMVUZZ1DijSaw7vNnhB
         f3Gwct733AZEqKLNS1pxT4xmtm2kltM7GaNtfMbX/fj1A/8r0+hFkPBtrmqwV+J6e+UI
         aZI/83wzyMoAjtTn4z2VtsTTCO8UUn8jYpYHZyR193rDTPibC+O45RGOgtdLyLyN8mHb
         x1lfb+84Aw6e0UkM2NCEqBae9atLFl/FgHT4q+pab113MklWty9PD2TM6GdwfrbtzNDO
         xCh083TkurvckQdJRdpD0wtPCbud2YAV01OG64V2fhFCkxlZH//5A2Le6KJVxYnsWprL
         SIfw==
X-Gm-Message-State: AOAM5328URDvtmHp5NK3cV39i/38m4u+Sxz4pwaDi7S0zeBhuxF1pprg
        f+TTt+hmqkZgQwtVoio9y9eTqyAhItK09A==
X-Google-Smtp-Source: ABdhPJwP6Bq1W9/94v0hMQUQc+HRvjb4KW/PQB6GZn7gNeoY2u7T19IF2GL+zWAMLuetIa3aDvqfWA==
X-Received: by 2002:a92:ca46:: with SMTP id q6mr29080224ilo.107.1641430948783;
        Wed, 05 Jan 2022 17:02:28 -0800 (PST)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com. [209.85.166.47])
        by smtp.gmail.com with ESMTPSA id c19sm310686ioi.15.2022.01.05.17.02.28
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jan 2022 17:02:28 -0800 (PST)
Received: by mail-io1-f47.google.com with SMTP id p65so1257625iof.3
        for <linux-tegra@vger.kernel.org>; Wed, 05 Jan 2022 17:02:28 -0800 (PST)
X-Received: by 2002:a02:294b:: with SMTP id p72mr21568959jap.263.1641430947664;
 Wed, 05 Jan 2022 17:02:27 -0800 (PST)
MIME-Version: 1.0
References: <20211220104855.428290-1-thierry.reding@gmail.com> <20211220104855.428290-3-thierry.reding@gmail.com>
In-Reply-To: <20211220104855.428290-3-thierry.reding@gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 5 Jan 2022 17:02:16 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WV2dsmRL0bVXz9jTgyy1zQpDjzrM=XDO=2rxsks=70rA@mail.gmail.com>
Message-ID: <CAD=FV=WV2dsmRL0bVXz9jTgyy1zQpDjzrM=XDO=2rxsks=70rA@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: tegra: Move panels to AUX bus
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Thomas Graichen <thomas.graichen@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi,

On Mon, Dec 20, 2021 at 2:49 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> From: Thierry Reding <treding@nvidia.com>
>
> Move the eDP panel on Venice 2 and Nyan boards into the corresponding
> AUX bus device tree node. This allows us to avoid a nasty circular
> dependency that would otherwise be created between the DPAUX and panel
> nodes via the DDC/I2C phandle.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm/boot/dts/tegra124-nyan-big.dts   | 15 +++++++++------
>  arch/arm/boot/dts/tegra124-nyan-blaze.dts | 15 +++++++++------
>  arch/arm/boot/dts/tegra124-venice2.dts    | 14 +++++++-------
>  3 files changed, 25 insertions(+), 19 deletions(-)
>
> diff --git a/arch/arm/boot/dts/tegra124-nyan-big.dts b/arch/arm/boot/dts/tegra124-nyan-big.dts
> index 1d2aac2cb6d0..fdc1d64dfff9 100644
> --- a/arch/arm/boot/dts/tegra124-nyan-big.dts
> +++ b/arch/arm/boot/dts/tegra124-nyan-big.dts
> @@ -13,12 +13,15 @@ / {
>                      "google,nyan-big-rev1", "google,nyan-big-rev0",
>                      "google,nyan-big", "google,nyan", "nvidia,tegra124";
>
> -       panel: panel {
> -               compatible = "auo,b133xtn01";
> -
> -               power-supply = <&vdd_3v3_panel>;

You remove the "power-supply" line here but don't add it below. Isn't
that a problem? power-supply for the panel is listed as "required" in
the panel dt bindings so I presume this will increase validation
warnings?


> -               backlight = <&backlight>;
> -               ddc-i2c-bus = <&dpaux>;
> +       host1x@50000000 {
> +               dpaux@545c0000 {

Optional nit: on other SoC dts files I've always had the policy to try
to avoid replicating hierarchies like this (host1x@50000000 =>
dpaux@545c0000). Instead I'd express this as:

&dpaux {
  aux-bux {
    panel: panel {
      ...
    };
  };
};


> +                       aux-bus {
> +                               panel: panel {
> +                                       compatible = "auo,b133xtn01";
> +                                       backlight = <&backlight>;

nit: In theory the "backlight" could go in tegra124-nyan.dtsi, right?
Then you just need to override the compatible...


-Doug
