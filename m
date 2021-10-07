Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84B49C433F5
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Oct 2021 18:36:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 66B6B61039
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Oct 2021 18:36:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243725AbhJGSik (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 7 Oct 2021 14:38:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243545AbhJGSik (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 7 Oct 2021 14:38:40 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DAEAC061570;
        Thu,  7 Oct 2021 11:36:46 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id v25so21876056wra.2;
        Thu, 07 Oct 2021 11:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zLaZpWdOA9YGgfI6hvca3fqu9BEMyK7TxqjLBX/WmtY=;
        b=j/RzlXQP+c93v98nZ12jYj5ppyjG9BB/ibRL1SJFxncDtU9ZDCLq9cwNCCZkUvJ7E2
         rEd2/qsC4xqgSSEQkO3sf7lyuX3NgnPVlVQ/2i8GtnUdC1nhmnJ8pQohznDp6RgjhgCT
         diDX0UP7U91QIuQcdpy+eEJ/sj/1MznM0Ewg7t0tNhXgXpwNb2WpMGu2RY0HbaQlrbpX
         /3LhN2sLdiqUqxe7sMbNZZx0SC9GmLdSRON73Xi8dNl84BY7i0iFhK8soeBnbOteKo3b
         nS1PPGOsoc98rJHN2RVD2Wboy6a9YnOLKDxe6bVFIKnXjqfKPYS1RGIpGhQ6Pk9fFyvi
         vMBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zLaZpWdOA9YGgfI6hvca3fqu9BEMyK7TxqjLBX/WmtY=;
        b=xiFK60zWCuUaZtuDg9zeeSX2iOa3ajuMA5d/9l8z3lDrJdg8o5iRM86yRV36hjwsNZ
         cqIfw50KIbl8gn/vu5WHA5UwLrHvz1DUWpfVPHQrpjSmyEGudY67VRqkpo8q6JQ+9uPT
         skQnyTL4F0wciYbLird8uR6RekkOXpvA774vZkJdRkW8MLNNpSPdz+KPi4Sx/8erpYMT
         KWgsyxIl8B4L8aro1N8+bk2HDkNlxiZ1l4xu+EkM4/pQNjlOGcvoiCjC2QqQWtbg7QRJ
         u7r346VlgXZGZFJhYloxtBXWPHtWyXqSTL9MgPjdsgMURN5oaP46oqXLqaGiKoupfOYC
         MCLw==
X-Gm-Message-State: AOAM531CkTvdY+0RzYOlRPc9XluSzKt5K/OpjmhVhRK2LDParuK8DfAq
        VfuS8nom57g5tgXJA8X3S6I=
X-Google-Smtp-Source: ABdhPJyCexqGuOLaGmhwluMn+iXTu/n+h1tUydyY1DGlVBytxYcf/LKginmzQMflIBApP+LeVAi/8A==
X-Received: by 2002:adf:fe0b:: with SMTP id n11mr7492271wrr.371.1633631804783;
        Thu, 07 Oct 2021 11:36:44 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id z18sm127209wro.25.2021.10.07.11.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 11:36:43 -0700 (PDT)
Date:   Thu, 7 Oct 2021 20:36:42 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Sameer Pujar <spujar@nvidia.com>
Cc:     broonie@kernel.org, lgirdwood@gmail.com, robh+dt@kernel.org,
        jonathanh@nvidia.com, catalin.marinas@arm.com, will@kernel.org,
        perex@perex.cz, tiwai@suse.com, kuninori.morimoto.gx@renesas.com,
        sharadg@nvidia.com, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 11/13] arm64: defconfig: Enable few Tegra210 based
 AHUB drivers
Message-ID: <YV8+OvZnc2ETJeWZ@orome.fritz.box>
References: <1631551342-25469-1-git-send-email-spujar@nvidia.com>
 <1631551342-25469-12-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="GcftIXBv14+oi/Q/"
Content-Disposition: inline
In-Reply-To: <1631551342-25469-12-git-send-email-spujar@nvidia.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--GcftIXBv14+oi/Q/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 13, 2021 at 10:12:19PM +0530, Sameer Pujar wrote:
> Enable configs for following modules:
>  * SFC (Sampling Frequency Converter)
>  * MVC (Master Volume Control)
>  * AMX (Audio Multiplexer)
>  * ADX (Audio Demultiplexer)
>  * Mixer
>=20
> These configs are used on Tegra186 and later SoCs as well.
>=20
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---
>  arch/arm64/configs/defconfig | 5 +++++
>  1 file changed, 5 insertions(+)

Applied, thanks.

Thierry

--GcftIXBv14+oi/Q/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmFfPjoACgkQ3SOs138+
s6Fw0A/+OZPfwytdhahHCcLZoQcMgkys3XyM5prhnNzTZBVmRY4INEcDvLcBNzfg
kFpK+xMdOtCPL8HGmiH31RnAblZdh6PgiQ7rZJM+0ozWmUr4+/7Uapf6ArY20TAd
WoHDetEDyGN7sF+fnnv+ZRztfGnmCB/laBIC9TwHjYaCPG6RBfMbktsHhVgKhX9m
pE5BDUll+ZblB1dOrjdnuu5odCqcxbrprcy5oAnC0w/POpflB6CxCoiPFrBDvOr2
7hdcMuyybXLAto0pIxLATVP3/BASUsyqedDpUfeKK66Ar6DyvVrf3nxMxkmAjtTk
AlMMjUvtd63ER2ARC1/DLZgl4lWWxffituU1FXCe2i6kNw8UFV7ImEzPdO/qwEEC
Jv8g25pGK1NCqd+IIufM3JihpCSZSUzgWV09rQQwrQvsfFmyc/4KUtSQVaJ8XFM5
s0jUYYzzT6l3nNfgnYQYxhNeUO7a0qg+KP59WIm/V+JpDuXUA4dqXYnAHgDeG/DA
T52U62eZFV2k8+yFbOGy2i6WmI22+J2OKAYX55D9Q6FPUSZoByExkGj2wMsR5IVQ
mDd45Z288zADqhlmXjL2wGBQ9JLWZD+dkV6r9fAARNjbA3Hf9Zva8D82m2Kre4vk
HYOBy+7fJmZDBUeHNQwIPKdHZQ4mSMdY103jRF4K0rbO4LepXNo=
=iDmU
-----END PGP SIGNATURE-----

--GcftIXBv14+oi/Q/--
