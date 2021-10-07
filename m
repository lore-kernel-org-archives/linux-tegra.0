Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4B3EC433EF
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Oct 2021 18:37:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AA5A76109F
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Oct 2021 18:37:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243725AbhJGSjk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 7 Oct 2021 14:39:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243737AbhJGSjk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 7 Oct 2021 14:39:40 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5066BC061760;
        Thu,  7 Oct 2021 11:37:46 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id m22so22051070wrb.0;
        Thu, 07 Oct 2021 11:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9c0I8cRx8jK0W8d7jKTwNFVW6wL8kZltQMKSstF2Znk=;
        b=OSjlVb8wT2q7EdDA+g/0wSgQgoOt5re93pmDF5glyO7HsFfOrMlncFLM+9YEX0WnJZ
         iouKTodqJ0ZS7WC9HGDbtLxLgjGx7DlmVhSOKxEfut2G4AZzBDEciiNandMHvF1LcLNE
         4wIMz+nYMfC0pvBEOP/5+wXHyxHppDobzxG9q8Ob1loNzC8bryLTj3FwoRUkfPtbYQSU
         TKvjIJXZ2vNVQqL6BBDomIV/6gL8udDv7RoB1v624IbfQzTKuPfhlQNDSfp6DkVMltLz
         AxsieB0bz1x1Bw45w8AyLBHa45xw4KBgwKlC9zSWuIzhQmcDWcL+JVUJy386t2Y7QTDH
         Rxqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9c0I8cRx8jK0W8d7jKTwNFVW6wL8kZltQMKSstF2Znk=;
        b=R8+/X3mSHB3SPxzPolbmc79bOzfakhME3moi7GEaujzBafEXBvF05wfMK8ES6shGE4
         PvFdxqzN+qQMOr9Q37UzDC7Mbn4AKCBkkHZMzux5IJVCBHNTgK5X7fkWLNqLRW0bk/u3
         Qt2qIIODYTyGO6CynGkUnXusNvU15aEW2tBnalE29unpK5UFG1ChJZ7aLCx78tJMCyy+
         NMqK5tw2zqOiFSQRK8hzYYb3kSLxBvxOvfQniD40js6WwGhx0TVBRuOII5N7fNi8isDE
         Co1wqemoZazrELPId1w8+PdHLlbr2FA2k95niyl4G6WSZV0SJ79ksEwlG6JIIJVgVX62
         IcTg==
X-Gm-Message-State: AOAM5318wArHcSFJABeEfOaqunkz3VJPTqXFLehjDvznJ0tRtjn0uA4/
        1+LC4qZ2u70XT8KDX1gLLjA=
X-Google-Smtp-Source: ABdhPJw+3k8i+aDhy2Kyv88+w4QaP6p/hfjawdFZXl6Uwv2lSIx3xNm2xp19D+hW745LO+3phBIcDQ==
X-Received: by 2002:adf:9796:: with SMTP id s22mr7151096wrb.224.1633631864980;
        Thu, 07 Oct 2021 11:37:44 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id l12sm134044wro.14.2021.10.07.11.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 11:37:43 -0700 (PDT)
Date:   Thu, 7 Oct 2021 20:37:41 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Sameer Pujar <spujar@nvidia.com>
Cc:     broonie@kernel.org, lgirdwood@gmail.com, robh+dt@kernel.org,
        jonathanh@nvidia.com, catalin.marinas@arm.com, will@kernel.org,
        perex@perex.cz, tiwai@suse.com, kuninori.morimoto.gx@renesas.com,
        sharadg@nvidia.com, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 12/13] arm64: tegra: Add few AHUB devices for Tegra210
 and later
Message-ID: <YV8+dWihAa2MbYlf@orome.fritz.box>
References: <1631551342-25469-1-git-send-email-spujar@nvidia.com>
 <1631551342-25469-13-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="1/J06XLWWnwIzgIm"
Content-Disposition: inline
In-Reply-To: <1631551342-25469-13-git-send-email-spujar@nvidia.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--1/J06XLWWnwIzgIm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 13, 2021 at 10:12:20PM +0530, Sameer Pujar wrote:
> Add DT nodes for following AHUB devices:
>  * SFC (Sampling Frequency Converter)
>  * MVC (Master Volume Control)
>  * AMX (Audio Multiplexer)
>  * ADX (Audio Demultiplexer)
>  * Mixer
>=20
> Above devices are added for Tegra210, Tegra186 and Tegra194 generations
> of Tegra SoC.
>=20
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra186.dtsi | 120 +++++++++++++++++++++++++=
++++++
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 116 +++++++++++++++++++++++++=
+++++
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi |  77 ++++++++++++++++++++
>  3 files changed, 313 insertions(+)

Applied, thanks.

Thierry

--1/J06XLWWnwIzgIm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmFfPnUACgkQ3SOs138+
s6HFtg//cQtQS7tW5Hkq8Mssis9LrXKdxK4iYsVCb5jl1gJmkv3eDs/1/hvt4L5h
mZIneAD2028ADaXM6DE7TAZVW+7lp/DQhwZhre3wgmM8RD4YqN4dvcMFz0+zFEYI
qUGxzkTw37x4RYyiTH508dGP5CkelyoSAbxSU3YcyK9A3P4l1T2s7dDkeXBm60Su
uiWe8GmH4ae67cgNNY19VqNL/PHDRugEZvwIxcmaa6J5DtUgbmgdFEnUYXF4S6CV
WOGxmlSCzgZrqjmYvZRa8ZHeVd2de25LeqWRBUXQpb3EXIvvOQCSPCVzaxknORCL
hAECHXrjwgXa7kdjdygapNLLGXZ0sc9fpOHQ+QpqdWb6+QG5iFTC7EX7io7rGHCl
AtYvUQJfXHiApKhLeAYgqXV7x1ZH6gKACm/Fn6nAqnWJapxYzD1HoIdJ524wEyt0
Z3zYBFh1ZTXAOAR4wX/3EmkjzUCJJI1uqvEqDD0d8JiIXtqLnbGejODFZGMCzu7q
Hy1XyaUxL1/dvHDX/3lpBOWHEnP8oe7c8XF53mxRggm4hDB2pYi/2+7VK+KDkJC1
2EQlVoZ5t+QEQzX85tknfJNVm7q+crNpj72q3+sZKnPP+B9Rz/zIDp5MLhHhkyEc
FGZBUvgim28vzruDIRDTczut1/ntkyQSlOusEKRTWfLWHfhDXlk=
=J7vV
-----END PGP SIGNATURE-----

--1/J06XLWWnwIzgIm--
