Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1A8CC433C1
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 18:25:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5DBF36148E
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 18:25:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230378AbhCWSYz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 23 Mar 2021 14:24:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231383AbhCWSYg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 23 Mar 2021 14:24:36 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ABA3C061574
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 11:24:35 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id l18so16398285edc.9
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 11:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=DUKPGqPelr6tSzZ7Q2lwzMEmrFjU0t9jqA2NIFQX6cY=;
        b=FsgHyLgwlMVV6JvPqSqqsM7mSoWNMFpLmihx1HNbNoCNwu0x+FPKBVzFgkn0y/Q35r
         PvjntJwcDF4owFD1CaJZ7eXAfA79aaVSHsBd2VhnUBt1RJXv0e6uxsw6yQ19RqFMoL3Z
         ThofH4DDOh0VkzsAfS2H9rIfLA4XxlEc0Z+I6/xAnkL0U9QaLinp1qOR4AiRWjxF6cCT
         7cpYpgpm60U5fI42q9hwFPbnQsH9FGSjgjR21IkGWfd4mcdWuUJ9wj8usCvNSkpJIO9g
         268sZdjtVwn7zOQszewiyIqHVrxPDg5ZFqLXKm9JLZz98cO7bZUC+E5ZT/YTZ/kmtaAH
         JMVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DUKPGqPelr6tSzZ7Q2lwzMEmrFjU0t9jqA2NIFQX6cY=;
        b=YLgZZqwpPPzj4oAlOAu2drDvXle+Gy1ju1IcGbWzH7o7y0RRhwk/QfrTvIijYOBU7P
         xf6d4FUDvYamivvgJl8tlBNZbbVASNvgkMsVkJ8PLChwE+pru4AYU/S5zVqUUqcMHlTT
         SBn0uPGi6HutmmepLTTzCxW7BGEQ0wuLu1PqmQfh6Maps5KANJEthDNr9I29qnJ3YD2n
         pqKZ5/MqNwOQJzK0lzTKxciG9490x3vbGSilOhv+6hZ7BTE/wYJZtmzjiwUfBSuTflnJ
         aGM3AET18Q4y+dAG6PvmPbiVweSCB3bDbXkVhaWJMAfhM289eNUYQhmSjN5ksdnOhEId
         yqMw==
X-Gm-Message-State: AOAM533zSwm43uWdc0mMe/hASaK/Z5p/nwPbA/gpUh+ORWurI24xrerX
        s+QQX0bmdsYy422454m1C4k=
X-Google-Smtp-Source: ABdhPJxr1ce9LXBtbs6Bdy96FQGd0gI+bM7cWoJDp/A7uLBBqHisT3Tq2gLoth3moAG5vv67AWgF2Q==
X-Received: by 2002:aa7:ca04:: with SMTP id y4mr5800890eds.339.1616523874028;
        Tue, 23 Mar 2021 11:24:34 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id yk8sm11557291ejb.123.2021.03.23.11.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 11:24:30 -0700 (PDT)
Date:   Tue, 23 Mar 2021 19:24:51 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     David Airlie <airlied@linux.ie>, James Jones <jajones@nvidia.com>,
        dri-devel@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 4/9] drm/tegra: dc: Implement hardware cursor on Tegra186
 and later
Message-ID: <YFoyc5mdYe/5/Cjn@orome.fritz.box>
References: <20210323155437.513497-1-thierry.reding@gmail.com>
 <20210323155437.513497-5-thierry.reding@gmail.com>
 <454aea05-ee94-5789-2cab-513342cf7614@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="b4npARoslvSwQEhi"
Content-Disposition: inline
In-Reply-To: <454aea05-ee94-5789-2cab-513342cf7614@gmail.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--b4npARoslvSwQEhi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 23, 2021 at 08:57:42PM +0300, Dmitry Osipenko wrote:
> 23.03.2021 18:54, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > @@ -920,15 +934,42 @@ static void tegra_cursor_atomic_update(struct drm=
_plane *plane,
> >  	value =3D tegra_dc_readl(dc, DC_DISP_BLEND_CURSOR_CONTROL);
> >  	value &=3D ~CURSOR_DST_BLEND_MASK;
> >  	value &=3D ~CURSOR_SRC_BLEND_MASK;
> > -	value |=3D CURSOR_MODE_NORMAL;
> > +
> > +	if (dc->soc->has_nvdisplay)
> > +		value &=3D ~CURSOR_COMPOSITION_MODE_XOR;
> > +	else
> > +		value |=3D CURSOR_MODE_NORMAL;
> > +
> >  	value |=3D CURSOR_DST_BLEND_NEG_K1_TIMES_SRC;
> >  	value |=3D CURSOR_SRC_BLEND_K1_TIMES_SRC;
> >  	value |=3D CURSOR_ALPHA;
> >  	tegra_dc_writel(dc, value, DC_DISP_BLEND_CURSOR_CONTROL);
> > =20
> > +	/* nvdisplay relies on software for clipping */
> > +	if (dc->soc->has_nvdisplay) {
>=20
> But coordinates already should be clipped by
> drm_atomic_helper_check_plane_state().

Yes, and the driver goes on to use the clipped coordinates later on in
this function.

Thierry

--b4npARoslvSwQEhi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBaMnMACgkQ3SOs138+
s6G4lQ//WySL1iNIPfIelEBP0S0+fcEcfH7fnVfQC102GZB/J0oHiwyBYGVb/Z/h
mrwdqbP8mxTn5HB1L5JfglWTzGF36ultVNZl+ysW7JxAPRey1C9ngQ/KLrNSvt8p
mCi3Bn1qYIZRrXUsx6fPf8mN6CDLJmsi218aK6XdACG5KgLw6lMfShHnN1+zOJeD
5tFa/6A9BizX7+4F/5WsaIqpCcPVY2/aYwBY4ZF59KewPDuEJtGsYRb7vbjeICRe
oowflqGECdhkMH2z+0vXsLFpr7fQ3QRdmuMQWuj8vGAYWPVOBOUC3MYhQ9bZlzv1
jhHOvie+tmllCOc3oZwvmWUU6eEetTeL+gDFeIPji/L3PfPXs6zQuO0IHtk7h7p1
O6+Ddrp0LDj+L7YjIdy1SL2j0Vqk7ch4Lp6Qb0/TRGvk6EhOKYT9BsvkcHBLiaca
0dTyGgqp7kbp2Knb9LNoISCl7sPrPRL4gKyb28DeN1c6IxAGqXm1iKMMcNoxmp6Q
7FlypJbwNNs6xzLsrU+gRytICdOXmMKwOHoJ6BgrpsIlX2wa6yEFXPsLtEjGkLIc
W4O/Stv+S2B1CEdqrI01m8IfIWBERFzE31xbGE/bHBWWbB+6nP1MUx6+KSYlwKsc
xiIn7sX+62DxuKXX6kUJYLFQU6J/vzlKzZGkKrZErqmQh2v6D0g=
=CiKo
-----END PGP SIGNATURE-----

--b4npARoslvSwQEhi--
