Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25D3CC432BE
	for <linux-tegra@archiver.kernel.org>; Mon,  2 Aug 2021 16:21:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0A08060F9E
	for <linux-tegra@archiver.kernel.org>; Mon,  2 Aug 2021 16:21:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229780AbhHBQVj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 2 Aug 2021 12:21:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbhHBQVj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 2 Aug 2021 12:21:39 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0BABC06175F;
        Mon,  2 Aug 2021 09:21:28 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id c16so22109386wrp.13;
        Mon, 02 Aug 2021 09:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Eo/ko/cKXyffVXdy/1Hup8RlLilDw0wcG1gMwmDSxRA=;
        b=bWW29oBh9sAPntXWB3hWAVN29lWeSqsKPgOKpS9sl+GDTCWiWizvTBm1jbQFljO3d1
         I05t/uZVMo5kpEERlB4YppqlViue5NeWp1pN3++/uw6xHN27s8bRWe0dIGfrVFozl9Bl
         tG/8TLeM4EOED0mIDfwKFwZ9DxNFXNIeQwPD36vsg0712PCfssoX3g32hrrmnC+NcxY0
         YSMfYJ2fbSHGnXQoJb7pAPPAc6aKrS1C+r+TmzvVUiblEJNGY82DvxMrd6L3PDoYDC1W
         DxJQ6qQJnWUmmF4MxZV8NWmyRCc2Up0sRQ/z5H/PqkCI+brQAIn1fmDWqccgQbeLjTy+
         tgEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Eo/ko/cKXyffVXdy/1Hup8RlLilDw0wcG1gMwmDSxRA=;
        b=uXbBeYRRtYC0u3kmMx96OkNhJg/B203RxKXGsE1JMWQFRxeO4UQpe61j7m7jmnM6xv
         vXeNEDvYh9wc/CCNMTACsDyEPHYjlnaiObWMnx0U+ha3tcaLVBphamVZZfLDKspXk/78
         vZyzZPl9eu6u6Ba6lRXxaICT8fTYoC4ohjgZW9oNSJlMz9RX/aY9kZ+T/n44iHQxNjkQ
         P5mnbb0aAWHXS4P+I3wFDa88Fh1jFRuCwIPBE9TAQlHAoA+HPdBnAJ2uUF4l07izOVgw
         5rJ5h00uEXPfNsX63Ri2mh1vGnUbMfv6DqhKCiS2WxSWhONP7zNhItYqUxUO5sM9bY6m
         e0GA==
X-Gm-Message-State: AOAM532hUdn/PEcFS/7jvhFWkbANSiECvpnsdlsJrSXzNs34XPv8ZvVy
        6tmaF7EcfNLdhpFZkzNtOzg=
X-Google-Smtp-Source: ABdhPJwMlXJ/6C6206MZvjQ+7RCGAygddlBwfk70hYzOjyW81IkrpCsWmySfMg+Qh3JNDcX8yeYThw==
X-Received: by 2002:a5d:528d:: with SMTP id c13mr18746610wrv.343.1627921287427;
        Mon, 02 Aug 2021 09:21:27 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id c10sm4321264wml.44.2021.08.02.09.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 09:21:26 -0700 (PDT)
Date:   Mon, 2 Aug 2021 18:23:45 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, SoC Team <soc@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v2] soc/tegra: Make regulator couplers depend on
 CONFIG_REGULATOR
Message-ID: <YQgcEfv3DJy9jli1@orome.fritz.box>
References: <20210721232616.1935-1-digetx@gmail.com>
 <YQgC/POOrX4t9hUN@orome.fritz.box>
 <CAK8P3a1oVOqdyYUNBM8UiakEkznQ--SPEHVz4U0HQOMy4DiCbw@mail.gmail.com>
 <CAK8P3a1ycMhqZ-nvsxusPa5JijjL1hBOpBffhJ0okm5Kav0jzA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vf3CEbbqSz/G3rGB"
Content-Disposition: inline
In-Reply-To: <CAK8P3a1ycMhqZ-nvsxusPa5JijjL1hBOpBffhJ0okm5Kav0jzA@mail.gmail.com>
User-Agent: Mutt/2.1.1 (e2a89abc) (2021-07-12)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--vf3CEbbqSz/G3rGB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 02, 2021 at 05:05:01PM +0200, Arnd Bergmann wrote:
> On Mon, Aug 2, 2021 at 5:03 PM Arnd Bergmann <arnd@kernel.org> wrote:
> > On Mon, Aug 2, 2021 at 4:35 PM Thierry Reding <thierry.reding@gmail.com=
> wrote:
> >
> > If you have other fixes that are already in your fixes branch
> ... that you want to have in rc5, please send them soon, as I'm going
> to prepare that pull request in a few days.
>=20
> I'll probably do another one for -rc6 though.

Okay, will do. Thanks.

Thierry

--vf3CEbbqSz/G3rGB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmEIG7cACgkQ3SOs138+
s6EkZA//ZdnqjrQ338ZZNlhh150PojQ/JfLtFYHYRj3fDGKXPbAfQiRMdjRYQ/yE
Fd8sMWcT1rJ3r2+qkzt7BHyW9zkrRNGHWBRAI+zbMo1pME7ia/jAKDEEqan4aoA2
FNByG96WD2TxmuBPflRzBRjCsPD/cTFsbVaPjlEwdx3m5SYDzP6jCD5DnkcCbjI7
U/L2ihw0g7vqAkKvUrtr8RA2YcLccY/W2pimqdXmlQrAy1a87KEG447UtCk0PA2K
H3DevLVu8vYRlOujkGw9LgZyNRmqh/54sILk+0d8I1apMgxVTWtU393WOZx9p2oW
Kn17XRwaTD8vwZ4pyfLy9Q4PsqDJ6vri4sK07Dqwj7jGXtu/SHEk0LPNh3tiQV+2
3dGuHiGR8+P2qMnAvW7UP3yQ6lJIV9qLsbKgMKfE+6iSEKMDgaH/3ZJNSh+vJJ6F
P0NO4G8hrOn6kjNs2ehai4UMIr84NxYThop9QTvpU3Nc1yJ0d3GIYLsGqADPQGfQ
xBejqW3YmnsUO08/K714WhnOki+TGxs4auBUlZUIi+JDPq08/QzZgJNTkD/0i2qa
E59yyGqSWo4f8bjco+GH7l6I5PCNhykTuNTZhUjicKZFQ7tBnyvKgKZ4z5e+hNP1
akXPKEigG7hAuWqc54tCqg5vk0iabq93tWP/XLSjl0UzAkllybo=
=8TBq
-----END PGP SIGNATURE-----

--vf3CEbbqSz/G3rGB--
