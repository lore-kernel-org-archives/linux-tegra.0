Return-Path: <SRS0=0tg+=DF=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69190C2D0A8
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Sep 2020 08:10:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0E74D20637
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Sep 2020 08:10:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PQeOiCWW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726458AbgI1IKa (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 28 Sep 2020 04:10:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726421AbgI1IKa (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 28 Sep 2020 04:10:30 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECF03C0613CE;
        Mon, 28 Sep 2020 01:10:29 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id x23so95065wmi.3;
        Mon, 28 Sep 2020 01:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=31AqBMRSXqhYTQQr8QkJaNcT3VWyt1DfR1wcfaGbJtY=;
        b=PQeOiCWWh5CYSpErnhIwtEUcaxq6IJE4FgWMDgnMJTdkBXfSB8gMVA7HNwkcAThxHM
         G6hVuXMKh7arr4dsk++A0CROg4x+3tCeAt3caK9vfd6UOM7sz26SIxPo7pcItQDScMx3
         hq7E6nUI0ckCL1McIx0G0+AwCZiuQCxh3LPBt0Tc2QND5FO19X4B/DKCfoQF2i0d2eji
         cRbpDRevPrXf9kORDjftSGj4UEXx2a5a5LhDqIqtmcBIY1IWO+0R747pPmouKg+Be/PS
         zO1jfRN8IInGlrvpKscRSbKPt8P2zibNHll57ULnnYngG+wD+P+P7hgRSID7wX1vq1Pm
         cGOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=31AqBMRSXqhYTQQr8QkJaNcT3VWyt1DfR1wcfaGbJtY=;
        b=YzWGBALmuutk6SnOEpzkLMGK0O36aM6NXkSnv6X1fRflSqCMqlsA+EsofO/bTo4hkP
         s9ZZJUyUbj5KMAnWVwC0wOQKy0Kyo2swKFrSoLlfx0flhrHT4lOcrZdFeInA/aH8LtJE
         mZ/ODTEU+EJxP1ugx7L+QfupQZnmLLDUyk5gkE5pFqaF4wYjhpcremu97PCHnykr6NTu
         shgZxJOGEz4Oee0F2pllW11lo7TzBVBI2gB8QB57OcmMtRrEcw8KNrk08x8YcCeQefzS
         gMm1BI4wcmQzqEzHrTa7xp9LmwkyOQfSzqvBWEff5oLE9aSPJ9qcbuiu6DSru06Grz7A
         UsSg==
X-Gm-Message-State: AOAM532lPl0HkRJOf61Zgil51hSj3PbGsgX9Sf0H6h3u2Uyaipttn4ZZ
        +D6aRfo2Xtc3sucXDH9odbo=
X-Google-Smtp-Source: ABdhPJzIGf+sM0Jx6w17pqYx3HRomoZAcOHNEnPqDg5mojC4p8yVRDu79/lEm46i8sqcgLQFk4MGOQ==
X-Received: by 2002:a1c:6555:: with SMTP id z82mr315524wmb.101.1601280628586;
        Mon, 28 Sep 2020 01:10:28 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id k8sm331939wrl.42.2020.09.28.01.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 01:10:27 -0700 (PDT)
Date:   Mon, 28 Sep 2020 10:10:26 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Stephen Warren <swarren@nvidia.com>,
        alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: tegra20-spdif: remove "default m"
Message-ID: <20200928081026.GH2837573@ulmo>
References: <ede103cf7f6914054a73cf8f1d9725ee13a7cf5d.1601149261.git.mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="SUk9VBj82R8Xhb8H"
Content-Disposition: inline
In-Reply-To: <ede103cf7f6914054a73cf8f1d9725ee13a7cf5d.1601149261.git.mirq-linux@rere.qmqm.pl>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--SUk9VBj82R8Xhb8H
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 26, 2020 at 09:42:40PM +0200, Micha=C5=82 Miros=C5=82aw wrote:
> Make tegra20-spdif default to N as all other drivers do.
>=20
> Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Fixes: 774fec338bfc ("ASoC: Tegra: Implement SPDIF CPU DAI")

I don't think this is warranted. This doesn't fix a bug or anything.
It's merely a change in the default configuration. The presence of a
Fixes: tag is typically used as a hint for people to pick this up into
stable releases, but I don't think this qualifies.

> ---
>  sound/soc/tegra/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
> index 3d91bd3e59cd..a62cc87551ac 100644
> --- a/sound/soc/tegra/Kconfig
> +++ b/sound/soc/tegra/Kconfig
> @@ -39,7 +39,6 @@ config SND_SOC_TEGRA20_I2S
>  config SND_SOC_TEGRA20_SPDIF
>  	tristate "Tegra20 SPDIF interface"
>  	depends on SND_SOC_TEGRA
> -	default m
>  	help
>  	  Say Y or M if you want to add support for the Tegra20 SPDIF interface.
>  	  You will also need to select the individual machine drivers to support

So now by default this driver will be disabled, which means that Linux
is going to regress for people that rely on this driver.

You need to at least follow this up with a patch that makes the
corresponding change in both tegra_defconfig and multi_v7_defconfig to
ensure that this driver is going to get built by default.

Given the above it's probably also a good idea to explain a bit more in
the commit message about what you're trying to achieve. Yes, "default n"
is usually the right thing to do and I'm honestly not sure why Stephen
chose to make this "default m" back in the day. Given that it depends on
SND_SOC_TEGRA, which itself is "default n", I think this makes some
sense, even if in retrospect it ended up being a bit inconsistent (you
could probably argue that all patches after this are the ones that were
inconsistent instead). This was merged over 9 years ago and a lot of
common practices have changed over that period of time.

Thierry

--SUk9VBj82R8Xhb8H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9xmm8ACgkQ3SOs138+
s6EzAw//csXks9215vvcBCKjXwZz3HXXMNsnJveUZK0fzDUjSr5oQeILZbN+gfxa
6pVNIU0ePDvtIh3814xSwzhSli5OlRq4Vo+y+zI2rer0L3BB6HpM80ekckhtKMJV
J8gKAxWtjmnzxizchU7LX+Lds/aeYS9xrqxEsninWvGZ7slMPbb7fxfGUyHvyG0n
ypjLyBsFyzDRfAo5ptW3LVW9W++aMoObYgcubxpdZ4EVThkf+/GUvUdWry69ZTYE
XmjwM2uq0B5edVuBYN9ezQflcoeDGIrD+ZR6yOtTeXViKxXqwZZuHir4dJ1i/upV
58cg3rYjAaAPyjxhMilJ35iOan0pGnVQJtjS64p9k9cCJBnADJs2fUcczzdXnP/O
tze1XSeQXbqr9XZKnODmNHwOajUoHVwLM6RN4bNwYdtMkpETN0afqQ9pX4X3WMD5
QJWXFSPc13LXeQwhOQNC+u5vfPaWYhne7/7WbLmd82IWiPABXeMwKINyzbv5ddUA
PWJo5TMOSpEopNzvDoWa8VYMN+QmPujxpiclBMK1aNkcWIa+hGGqWe+tyYun88e5
z7m9FSDqm0o2eizPl6zfNzUf35ihah/Q86k8eiULWQUR7kLNImS0n8fQGOR1s4dO
NLs6phyiJyLZOjYJ6GcCm0Vk/vCt2ifr+7DnT/okpWxlO9hDmAY=
=/ZoJ
-----END PGP SIGNATURE-----

--SUk9VBj82R8Xhb8H--
