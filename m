Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FDA3C433E6
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Jan 2021 19:11:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BF661221E7
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Jan 2021 19:11:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726218AbhAUTKY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 21 Jan 2021 14:10:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726942AbhAUTJz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 21 Jan 2021 14:09:55 -0500
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62C8FC06178B;
        Thu, 21 Jan 2021 10:59:37 -0800 (PST)
Received: by mail-qk1-x72b.google.com with SMTP id z11so2724533qkj.7;
        Thu, 21 Jan 2021 10:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RDTUmyi6TX1dMW73o3akqz8xuDPvL4pb5fyygLXF4I8=;
        b=qhXcdVQsNa91XXCzLVDPU/KqxOxUQZkfZtbeQrwUU4IlsbysGk6QJ+Q3vOXbR9dmGl
         r9jKgAaSXICozJbVVlFl0Qye8z7BCSKijeJM1ijBLLjv0vcbalesCtsDnUwoFXf90rPq
         6+jgC6lftZJ2ESX97wnAn+KAARFJbSNugo9OHNnkP7rIaAscP84QXuvGsYe1G6eEM8XZ
         DEDEql0vKSNM5ktuSfDfROgZbzSax7OQnCbuctNmmYeTZOy0KDyfVOC7PMrESzXHEdM/
         1rtpIVkXx3jhDr+pSt4jN3gnXS+SwLQSEScht/y+OnRi3jqfmH1VjqVllnE4glJZeCIz
         jiPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RDTUmyi6TX1dMW73o3akqz8xuDPvL4pb5fyygLXF4I8=;
        b=AfbOfDoK7aNb4gc6wzSdwXu4xAfJ7KGUNXfo3+izhJ8iT+iEYLSc3Bq2G1jqdGQgva
         7Lkq+2S5317Mcp8ZENare8anhguQPese4LQSZEINDFj1WzKIWnDmCOzKToXFSAeXWiys
         dO+aRylsgm09UuSBuMYdtc8c9gCdFWx2lul2taaXdOx85rDKXJYBEQfMsYF566vUEajO
         ZLNiYtFDeD1Ijns2P1ZwB2gCUNZCXO1zxOKb8FC4wBaOUUNyI1G3ZsK7/qSWLZ/7+1Oe
         CcfYRP5a2/tQcGfnNueIW91xD6vluMoixG8I8FcTyhgWllulOoMK5N5GSy97wsz70zzN
         WexQ==
X-Gm-Message-State: AOAM530Q5vCg3hEx5CsxvdZeyiZkG8pBoP4qtzePtCGekEJD+ouZ6BeP
        L07xAiOfKOKCvCcbjX5uKf8=
X-Google-Smtp-Source: ABdhPJwohk2DIFAJlac5ohtlYAVxOFCDRj/GRbEUUa3RQ01XDV7/9jInryHqvORzkYAcKk6YUf52KA==
X-Received: by 2002:a05:620a:1206:: with SMTP id u6mr1183789qkj.209.1611255576713;
        Thu, 21 Jan 2021 10:59:36 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id 196sm2961883qkl.4.2021.01.21.10.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 10:59:35 -0800 (PST)
Date:   Thu, 21 Jan 2021 19:59:33 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Sameer Pujar <spujar@nvidia.com>
Cc:     broonie@kernel.org, robh+dt@kernel.org, jonathanh@nvidia.com,
        kuninori.morimoto.gx@renesas.com, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, sharadg@nvidia.com
Subject: Re: [RESEND PATCH v6 4/6] arm64: defconfig: Enable Tegra audio graph
 card driver
Message-ID: <YAnPFV6WBDmJR7uU@ulmo>
References: <1611048496-24650-1-git-send-email-spujar@nvidia.com>
 <1611048496-24650-5-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="UNXIJuGPFxobgmD3"
Content-Disposition: inline
In-Reply-To: <1611048496-24650-5-git-send-email-spujar@nvidia.com>
User-Agent: Mutt/2.0.4 (26f41dd1) (2020-12-30)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--UNXIJuGPFxobgmD3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 19, 2021 at 02:58:14PM +0530, Sameer Pujar wrote:
> This commit enables Tegra audio graph card driver which is based on
> the generic audio-graph card driver. This is intended to be used
> on platforms based on Tegra210 and later chips.
>=20
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Thierry

--UNXIJuGPFxobgmD3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmAJzxUACgkQ3SOs138+
s6HJ3Q/+L0jCt+mm47rX9vykjTeqtyF8JyoUyIhqNIhYPtlqgW/Em7qfuq/lZ2M2
dZysuBm51BUIZXN1mVZwBVXpvv7lbITPA2lbBaIA85hFvVThA2/wKrEC6GlEIiCx
boRAWs3lDqFzU6sha+t6BIizmePN3rWMkvuJeuLCK6F4xov819o1NGRlG/uJJ4B4
d6Q4CpGVvJDCU0h3raq+bXKRoXgzOUUX9xuCT6ZLzmQ2hRzuLi5M7pKm6TGGTxTw
2ySGWiOaOouDqKErnq7KqOBEKHAdjfeelmU0gHMCBziO4fKG/Tcj1mv+8P/pg/HS
TZSQRY7ExONu2W7UQB5SHxvFU/TLpnS15UF1+r426KkdPueCqQRdeDc5se8YzVuc
VadOQGvEaOArxddyyyFSeWL7NFFVLG7ZB9B11hvsx71XGOFMJ3BNBEP8kwrr+thl
azMw+U0JAu8Hikbd9UoqTl8xoRg3ihKJKmS1ilXPmnsx7ztHx1BhGojMW2bv8S4l
Lf3VzmI9yGu/AbQ4wCB1WZShVr5nx36TpbZzorg72cBJx7zXjkNFadGpjfdRYnwb
SXFuwnQIXngaAoRVlFH5MGRcY2klZRHU1DPdnm2FxH1F8DewCK6AfF0aWHGmrXHp
RgsS7NHpckY8lQ3acKsx53I0B9XV8nYxNhtB291SLwkTP9Y5Je0=
=n94E
-----END PGP SIGNATURE-----

--UNXIJuGPFxobgmD3--
