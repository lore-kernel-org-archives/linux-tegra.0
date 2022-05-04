Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 272BCC433FE
	for <linux-tegra@archiver.kernel.org>; Wed,  4 May 2022 09:24:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240115AbiEDJ2N (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 4 May 2022 05:28:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343552AbiEDJ2J (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 4 May 2022 05:28:09 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63F0025298
        for <linux-tegra@vger.kernel.org>; Wed,  4 May 2022 02:24:33 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id v12so1142180wrv.10
        for <linux-tegra@vger.kernel.org>; Wed, 04 May 2022 02:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wjb9wnHlFnoE3/J770rxh0ogf2Kfc+bYsguxRWpf3Pg=;
        b=d67nqMMZWBLHmslh3/PhOqEo9K6qvyI/Rn/lCu8PA3t3vPGNf7THTmf4G7FMKgvFDx
         yNe4urVJRNhRSfuSfklZhjADNfvns+jhzteQGxonGZicgQhI2BCkFMkRnPfVbnaQhO8s
         uN99zar7pw9gDsQ9f11mR0uyumwSYj8OiTH9WNyDNEPDqbROPoKFcW/vjh2sGf7+TrI7
         sP+bFOCaMr9wShrsw3FCta4lX51hvPhq2LKHl33weSNrb25xy2DopU03oV4Od4NqeGR2
         BGmXf11yX4X25i/D8pYUDAWorIqnBMNwtdxLwuCrs3a762chFrfCECqhk+vssXzPPjfi
         9ncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wjb9wnHlFnoE3/J770rxh0ogf2Kfc+bYsguxRWpf3Pg=;
        b=yZmKCllvvVXOVIpjw6Ts05IQiNTiSJu/F89yr75CyNJ/iERtdMa4j2aVABAVSSiTjo
         HNwrO3qy39AdVRihOWZZ6Fsq84pcfkgFistebUX+EHBklSxfXscsa6gFIobz8n5JPMrO
         4BiVuX+jeVjUuZ+/xmEX3LWXtYlrnxx1XfZIQyRf+JKoSOsKJ06Z0Zrp1u99RR4yBbOK
         Ob8w+TeGo3+dNY5xmjhOG8MBO/sWJuYORS5TNrIJ4AuN/ArFvYSgWx40z7IdB2X0HMJg
         ERW47NPyp8kPIsCn/4lsYSK0dGUphgPuUgSFghSAyUXj2rqms8BgQMmPp5/1AzyN9Bjy
         8l2w==
X-Gm-Message-State: AOAM5307Nt59i6TScIjobMZCkajfVdC/5WqEyYENMnZAQ128Yi9K6D/T
        T/Ac+GPK8u7FZ9jpOSUy5QQBcogPdAI=
X-Google-Smtp-Source: ABdhPJxxzg0//G+HHtdNE+5jq6J8eSX8tYLEhJO+mSbraAQv4WhyyTxZ2tUNTsmmqk0lUcFZTRrU1Q==
X-Received: by 2002:adf:ba8f:0:b0:1e9:4afb:179b with SMTP id p15-20020adfba8f000000b001e94afb179bmr15577050wrg.57.1651656271818;
        Wed, 04 May 2022 02:24:31 -0700 (PDT)
Received: from orome ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id v26-20020adf8b5a000000b0020c5253d901sm11233915wra.77.2022.05.04.02.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 02:24:31 -0700 (PDT)
Date:   Wed, 4 May 2022 11:24:29 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc:     dmitry.osipenko@collabora.com, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2] clk: tegra: Add missing reset deassertion
Message-ID: <YnJGTVQTrkoQvcMp@orome>
References: <20220429125843.neqitcrxc7ntjclk@diogo-laptop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ECkDmYR5SmfykUCv"
Content-Disposition: inline
In-Reply-To: <20220429125843.neqitcrxc7ntjclk@diogo-laptop>
User-Agent: Mutt/2.2.1 (c8109e14) (2022-02-19)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--ECkDmYR5SmfykUCv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 29, 2022 at 01:58:43PM +0100, Diogo Ivo wrote:
> Commit 4782c0a5dd88e3797426e08c5c437e95a3156631 ("clk: tegra: Don't
> deassert reset on enabling clocks") removed deassertion of reset lines
> when enabling peripheral clocks. This breaks the initialization of the
> DFLL driver which relied on this behaviour.
>=20
> Fix this problem by adding explicit deassert/assert requests to the
> driver and the corresponding reset to the DT. Tested on Google Pixel C.
>=20
> Cc: stable@vger.kernel.org
> Fixes: 4782c0a5dd88 ("clk: tegra: Don't deassert reset on enabling clocks=
")
> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> ---
> Changes in v2:
>  - Changed reset getter to the optional variant
>=20
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi |  5 +++--
>  drivers/clk/tegra/clk-dfll.c             | 12 ++++++++++++
>  2 files changed, 15 insertions(+), 2 deletions(-)

I've applied this, but in the process split it up into two: one patch
for the clock driver and another for the device tree changes. For future
patches, please keep in mind that driver and device tree changes should
always be separate.

Thanks,
Thierry

--ECkDmYR5SmfykUCv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmJyRkoACgkQ3SOs138+
s6FVKA/+LxMdxSlAtCinAHUl1V4XNkQLcWcESDdSTPCYlE3W/+7cPdGTNqAQ0jcn
mfxEbfzezG2BjwNLjjtwtyngpy3IQZPg3zrAkHr4z2WudKt5Zj9hYjkTFtxGxFBL
DcybPzKbj3yIhGC7jKjcTiV13wasyZlYXy67PHdHSIA0F7/cW059VwGvK6u4IctY
mLj1MB1bPmGjFN/dxWEag+Xbtas1OQ1w4BdW5yU3bSGZpn4qExgnbK8lTIodHA6d
p6she4zPhTBhLrbT9aaH4uOX/NxruJmjaopwuustFA9X7uvt7E46ZvKHzK33HSOr
sxCAgQRicp129DaKk74pEo9QV7CALoMdAjSoo4c1N1Qn4bxMyQLfZtThWmnYaK7T
MJUurID4ShtxsEyl3WPRYgQ0Kqyysew/h0CeKcBwRNPHDy6AOfPuOs4kqrSTFNxG
oKoVsn+/xpicgdXukfyn2pcv6gr/0lNtWPJIoBKxGCezS8fT+mTYNFm0f+LgxaF9
L4tO+3j5YhgFxNo6IaISMbk4rDUiiPfnuTqHP2dXMde3MtzpLT9+z3q1Sc3OK3dp
MqxHRfRPuW3pj1Yh5t6qhpWNPROqIR95VYFbwksK/PNGF9HUmFp8hti2vSUnNwtA
iB6bvDk6Tdb4S+m++FDxIAISSyP2JlfhAtU/GojcBMzuKtfqU4g=
=XYvj
-----END PGP SIGNATURE-----

--ECkDmYR5SmfykUCv--
