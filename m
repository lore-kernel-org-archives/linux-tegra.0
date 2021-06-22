Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75932C2B9F4
	for <linux-tegra@archiver.kernel.org>; Tue, 22 Jun 2021 14:06:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 56DD361369
	for <linux-tegra@archiver.kernel.org>; Tue, 22 Jun 2021 14:06:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231410AbhFVOJJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 22 Jun 2021 10:09:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231597AbhFVOJI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 22 Jun 2021 10:09:08 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C20AC061574;
        Tue, 22 Jun 2021 07:06:52 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id hz1so12179186ejc.1;
        Tue, 22 Jun 2021 07:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lp53Y0gTyDe3jcN5tHsholxiEow8xex6nP+9fTMsVuw=;
        b=TPe5aCgDJqRdLqihIk7FWGHy+EQ0p8K06/88hnNL5HjOXaw+W3Wt5hm/d327/bEFW3
         pH2lZF8M0YgCtDKuN4XLUaWCRlbhFf6qVqv/gGObrmMCcXXTYOcpwF3aYb1ZPQNzdZF9
         zYDIhcfDv5wMpT37ZW9ySP+ZVtQ33yHfaeoA8/w69v/twpJsErvQ9lkKqZ4jAPd3Otxn
         so9rsFNZCR6jP2sPAEpfb5vBxOwe1NaGEXPMq26z2fBeSqp8Vi09ODrKlGLTjArub4W+
         PxWFaEV5fzLiBQI6LuS1VnjgHEg6d0xN6+gj+wcb2CQ38UuiaRY1wWKs2ayclQKOJiQe
         AtZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lp53Y0gTyDe3jcN5tHsholxiEow8xex6nP+9fTMsVuw=;
        b=AjPAyzDJwm+hzw1zeM1oucgAtp5axFK5RfaYiUhUbyX10I99R7sCwib5zYUHeZLHaw
         EGB2HXs+fcyooK5CLTxwFt/CfbMx80akTAecSZgL/6UmyuOujngyFvfI2Lj3OMSg/IzQ
         HuelD/vODONec5cXdESj4BKDdxatPRu1R8cwMSLrBubGdGga8aNaZOUm8qEuD3unkJpX
         mow+8AGxVtkd4eaNimNPfP9kplKlWRjP9JntJYfAWZHLVVjutFyTaQ6L8/mGlImwQR5W
         QUySIdDSMWiUp0naFvFJ4ue8FqhHbrKa6FYhqOCa1+HDRQpFPCGqLp1+TJrqz7ZH1Iu9
         0pAQ==
X-Gm-Message-State: AOAM5305FFTzKTQsKezazWdcmaVFL9ZRNoBU98I7ujkIK+XeTyPRbFTR
        +y4CuzVzGYO30JPfQl91iFY=
X-Google-Smtp-Source: ABdhPJwv8yq6Ze0RcRPGoACjstEosenX/SS5aFRiXKeQh+SdY0jGjk70OiXGvqJO1PsBz1I1zsuiKw==
X-Received: by 2002:a17:906:498b:: with SMTP id p11mr4264067eju.295.1624370810644;
        Tue, 22 Jun 2021 07:06:50 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id a2sm6164232ejp.1.2021.06.22.07.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 07:06:49 -0700 (PDT)
Date:   Tue, 22 Jun 2021 16:08:48 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jiajun Cao <jjcao20@fudan.edu.cn>
Cc:     yuanxzhang@fudan.edu.cn, Xin Tan <tanxin.ctf@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Mohan Kumar <mkumard@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>, alsa-devel@alsa-project.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pci: hda: Add IRQ check for platform_get_irq()
Message-ID: <YNHu8GxbzYStfj4W@orome.fritz.box>
References: <20210622131947.94346-1-jjcao20@fudan.edu.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="h2zYJyMj+3v5Om+m"
Content-Disposition: inline
In-Reply-To: <20210622131947.94346-1-jjcao20@fudan.edu.cn>
User-Agent: Mutt/2.0.7 (481f3800) (2021-05-04)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--h2zYJyMj+3v5Om+m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 22, 2021 at 09:19:42PM +0800, Jiajun Cao wrote:
> The function hda_tegra_first_init() neglects to check the return
> value after executing platform_get_irq().
>=20
> hda_tegra_first_init() should check the return value (if negative
> error number) for errors so as to not pass a negative value to
> the devm_request_irq().
>=20
> Fix it by adding a check for the return value irq_id.
>=20
> Signed-off-by: Jiajun Cao <jjcao20@fudan.edu.cn>
> Signed-off-by: Xin Tan <tanxin.ctf@gmail.com>
> ---
>  sound/pci/hda/hda_tegra.c | 3 +++
>  1 file changed, 3 insertions(+)

The original code is probably harmless because it looks like the call to
request_irq() would return -EINVAL if irq_id was a negative error code.

But checking the return value is still a good idea, so:

Reviewed-by: Thierry Reding <treding@nvidia.com>

--h2zYJyMj+3v5Om+m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmDR7vAACgkQ3SOs138+
s6EXFg/9GSl5j8r97IeAHv15Y7wlUZPx43jh/E8tpLotlfxlkQkYJAwI/4JKfU7l
4/AHaUQN3nJfx1ShlhMRSozHp5d/gTwmKOFYihWe7up8uUkVFtZgv1YxyGdW5JL9
rR31Mgf3GYYz+w0HN4KxMd29qosCeCWWPLv62LTn5vh2KkMOxlawTNn4ArNAc6iz
qKv1QAg/HSmHuX0a0g3udOB93avUJkoM53aDhxi7pp7GeR4abWgBUzzV37cD1Y3p
HbjOZScoye0gKVifvHtIwiMuMadXTApO1dByN76hxLVYSo13DQWIsjYFQPXoTwZ9
aqkojGAyFYpYpvuxzOy+qUK6ENAKcKKIm7agsMRWUEGR1mJfFlQciwsUXw7aaLmP
7q5/eLiMydGyfbfG4aNTty13Wu8XNjzNTWs7f+UFbToSJZ7FxYVQIqTc+tzDeowz
fqcduM7ECuQhCq0/RNYVtD4gAK9W9LuRutv69qifi6iUXFC/TDOZ5wg41r66BGxc
5eB821Ttk2Qkc+aHupdOqfWiPZoUmdhXseGdWAwQ878gy8k9l9mvZhj8vrEh4NzI
m/OdiDKd0pJkzqNH/1AtlpFD3zoq6QKXuivtyM4BtQJeoJqUqbVD60gx5fmyaBU7
PV7QNRerp8KRGfOxOiqo3DjEeOFzpSCCnAbkVJzlwppwSKJbGyE=
=1SPN
-----END PGP SIGNATURE-----

--h2zYJyMj+3v5Om+m--
