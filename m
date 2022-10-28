Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FC1FC38A02
	for <linux-tegra@archiver.kernel.org>; Fri, 28 Oct 2022 11:15:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229902AbiJ1LPj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 28 Oct 2022 07:15:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbiJ1LPi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 28 Oct 2022 07:15:38 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67D75CBFC2;
        Fri, 28 Oct 2022 04:15:36 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id t25so12159222ejb.8;
        Fri, 28 Oct 2022 04:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IrG5Yy0mtICCHCtyV13EZbkBCdiVs4aFzn78b29qyO8=;
        b=W79ur8kVPuW4nhCYHWAMi3Xjx6nRf+hHKAu/dmpEb4XMdYo62PAqomETWVimCu4i0m
         lcahcVjvs2NNxZZnmhq6Acv3NtnFNc5pV5yr+Yba+Pv2wmBWvh1GXpcA+Iv8TfmWZ/fa
         5i4+8Qa9MnoD6DS/8f5jZCX4WFRYJDFy48TnmpJXCvi2AJDH2RPV/ARMqbrFcTvtp9KW
         RfvxvgRKI/JLGDNtlXcvxCP0eZqKywvWZNWiK9m18sDdR+z2YQ8QZAYKALGf2EWLzTDc
         44ObPyHs6VOPs0J17giR98yDptcLLRsb1J9F9TfBAjd2aSnfi5cwq35peQSZUzuM5I+q
         fZSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IrG5Yy0mtICCHCtyV13EZbkBCdiVs4aFzn78b29qyO8=;
        b=zXK0TPgwdBG5616OM5IPPABE2DNZxB85YIdrTjkFw5w2cWZI+68t6J6fs1mrWTMcty
         zuYPTpmkAQvdiWDnDUnf3ORTpk5biwoDCop8NX5YIaxM8JUMcjRSnO5JXJQ67lCNqvhT
         Iv/exbcS90I8XwRLL7+IByLBdFQ+EyLUkY//QEZVpe3M6Jav9DIRcd6/XhSShFUMWHta
         dPaLAEmjFgCx/6lpLt7qOFpwnlO554os6yCbl2cgDR0VIgXvUns9orAEXRn2oaLMm2ic
         YU77+o/6pBUM3PkWz+J1HLsjc1T1wM77RMIupNAK4UGO5basDB0WvXn5mmtpGhZfIebQ
         86aw==
X-Gm-Message-State: ACrzQf2OSmGmZYZfJBbgxQoGqwHcsSdegKlH176yBv3korvh6RdUjelr
        u5eUjBiDnGAmphUQS7Pc9Tg=
X-Google-Smtp-Source: AMsMyM7a/wMdeWAbh6SIRah9diFbHsmXfA9PapE+3JnyGzXQ+DlRHpOSkOYzsY1tGKh1u0C87Yg5LQ==
X-Received: by 2002:a17:907:7627:b0:78d:b6f5:9f15 with SMTP id jy7-20020a170907762700b0078db6f59f15mr47322903ejc.149.1666955734890;
        Fri, 28 Oct 2022 04:15:34 -0700 (PDT)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id h8-20020aa7cdc8000000b00459012e5145sm2470476edw.70.2022.10.28.04.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 04:15:33 -0700 (PDT)
Date:   Fri, 28 Oct 2022 13:15:32 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Peter De Schrijver <pdeschrijver@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     treding@nvidia.com, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 1/2] firmware: tegra: Update BPMP ABI
Message-ID: <Y1u51EiIc3LEGgV1@orome>
References: <20221027121354.1481945-1-pdeschrijver@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="CoSjcxlpEQkmT3vo"
Content-Disposition: inline
In-Reply-To: <20221027121354.1481945-1-pdeschrijver@nvidia.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--CoSjcxlpEQkmT3vo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 27, 2022 at 03:13:53PM +0300, Peter De Schrijver wrote:
> Update the BPMP ABI to align with the the latest version.
>=20
> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> ---
>  include/soc/tegra/bpmp-abi.h | 1802 +++++++++++++++++++++++++---------
>  1 file changed, 1357 insertions(+), 445 deletions(-)

Looks good to me.

Mike, Stephen, do you have any objections if I pick these two patches up
into the Tegra tree to manage the dependencies? There's another patch
that will need some of the BPMP ABI additions added here which we may
get ready in time for v6.2, so it'd be good to have this in a shared
branch.

I don't think it'll be necessary for me to pick any other clock driver
changes, though, as long as they don't conflict with these BPMP clock
driver changes. But if you prefer, I can collect others as well and send
them all your way later on in the release cycle.

If not it might be simpler for you guys to ack just patch 2 here so that
I can take it through ARM SoC.

Just let me know what works best for you.

Thierry

--CoSjcxlpEQkmT3vo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmNbudQACgkQ3SOs138+
s6FBvQ//b3bk8rFmGqKz2VK3z6bNMDW3l1aVp6j21CESMsaPCDBd37SsKyCbeL2y
gDt7RBKZevp7AdslvGi0r4H7gIDmYKY42TicYMZz6x+DLX3fr62b0Oylfb4JyidS
Glszxni3t/4NW9MpR0e/k1EMyj0FMWsxOrsoysrRLO7b3qDUG2w0SevxkOu1rUrO
+3lwkhOc+gvzbLzcfFFwqkwntRpeJPrhocQjuX5DGkO7NpdlXs3vVwnCeupiXmuU
9eeECqNPLyKe08JOaZGYCzuJy/MqrH7FVj1Z3GuwfmLio1DKbTeV32tbyZgaYI6R
B8Gq7Jv3AQNT45YkElfF6fgY3YupKAsLzKtcC6ztkpa9KiHHFrv5ni7+xGGXYj/8
pi9a96jqaGvAjelEJSk5g0g33OoEKiJsheOCs0MPjvN7TeFeBU3Sg5t0zbGWLIYL
qM7eY/9S6XN8IDcE/etwN2k4ePvCKQ4pMWyk/YqZRCY5VMd0I1WSj+J2Y+jb61OY
HhjJ+JcrYNDTld9Xsq/WzfTPR8GiAr0h/LJ9JdqMV22Gn0pFLL7It0Ms5qeYh/vf
Kdy83sQz9kHuaqhkKCV9P610yT0u0ZoHNACqjKLua1QyQkkB+SHZq3d37MGvLFXx
9mhWxdVFLIBrBRZf4t/I0Q3ubvvBln6nczgTNiNZz9V206ae6D0=
=9Qaq
-----END PGP SIGNATURE-----

--CoSjcxlpEQkmT3vo--
