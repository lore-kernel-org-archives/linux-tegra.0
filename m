Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE131EC874B
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Sep 2023 19:07:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230336AbjIGTHJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 7 Sep 2023 15:07:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229946AbjIGTHJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 7 Sep 2023 15:07:09 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3D9692
        for <linux-tegra@vger.kernel.org>; Thu,  7 Sep 2023 12:07:04 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-501ce655fcbso2086323e87.2
        for <linux-tegra@vger.kernel.org>; Thu, 07 Sep 2023 12:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694113623; x=1694718423; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LdrBt+8aQObU0UW8vEDcheXPo1lzDtvpAMZKrhFMy/A=;
        b=jpwy70yK5FkM6YbActw6DkI22QveG5ES0A36exa3AwRcXrUob5xb8iI6afxxbn8PPB
         SwlyiRZBt7NvE1B6aGU45tSck42d9h68KnoWOKL4M0ffR1b6x2vU1yJLTw09B65zv6Np
         64AIhSyAGJNRlp4R8CTPj4/L8KJnXlUTVTOSv/ckDUgwkRdAE6TsAAbe7EU0cGLtE3BT
         lUIdiMrkPt0+rPud6Hl+e4qAiRCI5AsKLZUuH7+1g83JS7sMJXfwnm5Bj2XZ+jr6D+kz
         3uNGlR+h7vWzZ4iCtJOfjSX9cpGsddeQenELIB9z+HYeITHV8EXdFe/n6uwNEDScHbtW
         Yi9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694113623; x=1694718423;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LdrBt+8aQObU0UW8vEDcheXPo1lzDtvpAMZKrhFMy/A=;
        b=pppcuaaI+BEPmS9HFkvN2vUBWmPR2+cHN9PgYJXP+lHv/ih+bNx5Oi0qlS9re3T+tK
         WNLJ9YeylpKW2zq/oLtAKGpu261dmnXFUSQSdvJRD4SYy/JnoK4cxLyR3+wXWmmtLZxW
         LCWiNNTeNaAW9SsD0VyXJ8kvM4v6saixsnR3QvEcq9PYD72tbdiC6Z8DA05ruDOE9zot
         fAKoXpR9W3Mgx4NEwg8NveF8Qhf7wbBeNoALuFZsrRwlV4WePGvgxmPoW/fpF5F9af4c
         eaSJCTiCeMAYw4aG7Un7bPJBgDpNVlcdl34DI0Age16QUFWA38giY9BzENCdvb7hBFG9
         URgw==
X-Gm-Message-State: AOJu0YwSlu2LNYi2w6QCmRgKFa8eVHANAzufUGIWaOVck0QYE144JJAZ
        gwv+t4sCOMXOhvm0xSidHZK+W5xkePU=
X-Google-Smtp-Source: AGHT+IEkRzksilKdQ7gFmX4nQ2wvO2/bbxx70TqLTkU87HW5xShhVme79FHjXWo2eI6Wm69R5tWL9Q==
X-Received: by 2002:a17:906:31d4:b0:9a5:e441:4cf2 with SMTP id f20-20020a17090631d400b009a5e4414cf2mr3852222ejf.58.1694073473357;
        Thu, 07 Sep 2023 00:57:53 -0700 (PDT)
Received: from orome (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id tk26-20020a170907c29a00b009a1082f423esm9896610ejc.88.2023.09.07.00.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 00:57:52 -0700 (PDT)
Date:   Thu, 7 Sep 2023 09:57:51 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Javier Martinez Canillas <javierm@redhat.com>
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] drm/tegra: Remove existing framebuffer only if we
 support display
Message-ID: <ZPmCf4892gI88ZNc@orome>
References: <20230825132229.1109445-1-thierry.reding@gmail.com>
 <87y1htawi7.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Tr27j8db5IUnXR5L"
Content-Disposition: inline
In-Reply-To: <87y1htawi7.fsf@minerva.mail-host-address-is-not-set>
User-Agent: Mutt/2.2.10 (2023-03-25)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--Tr27j8db5IUnXR5L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 30, 2023 at 08:13:04AM +0200, Javier Martinez Canillas wrote:
> Thierry Reding <thierry.reding@gmail.com> writes:
>=20
> Hello Thierry,
>=20
> > From: Thierry Reding <treding@nvidia.com>
> >
> > Tegra DRM doesn't support display on Tegra234 and later, so make sure
> > not to remove any existing framebuffers in that case.
> >
>=20
> I see, this makes sense to me.
>=20
> Acked-by: Javier Martinez Canillas <javierm@redhat.com>
>=20
> A couple of comments below though:
>=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/gpu/drm/tegra/drm.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> > index b1e1a78e30c6..7a38dadbc264 100644
> > --- a/drivers/gpu/drm/tegra/drm.c
> > +++ b/drivers/gpu/drm/tegra/drm.c
> > @@ -1220,9 +1220,11 @@ static int host1x_drm_probe(struct host1x_device=
 *dev)
> > =20
> >  	drm_mode_config_reset(drm);
> > =20
> > -	err =3D drm_aperture_remove_framebuffers(&tegra_drm_driver);
> > -	if (err < 0)
> > -		goto hub;
> > +	if (drm->mode_config.num_crtc > 0) {
>=20
> Maybe you can add a comment here explaining why the check is needed?

Sure, will do.

> I also wonder if is worth to move the drm_num_crtcs() function from
> drivers/gpu/drm/drm_crtc.c to include/drm/drm_crtc.h and use that helper
> instead?

I've been looking at this, there's a few things that come to mind. It
seems like we have a couple of different ways to get the number of CRTCs
for a device. We have struct drm_device's num_crtcs, which is set during
drm_vblank_init(), then we have struct drm_mode_config's num_crtc, which
is incremented every time a new CRTC is added (and decremented when a
CRTC is removed), and finally we've got the drm_num_crtcs() which
"computes" the number of CRTCs registered by iterating over all CRTCs
that have been registered.

Are there any cases where these three can yield different values? Would
it not make sense to consolidate these into a single variable?

Thierry

--Tr27j8db5IUnXR5L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmT5gn0ACgkQ3SOs138+
s6Ei5BAAov/LMb/gDpLLWtMHY6FEJt3V0SUmGqufj3np9TwcXadMefIi4twbGGMx
Km4lBk9aiy6oREpk8o/WBF3txUMJ63dV+nX5nh30r/mhif6uZEP3Qxe8DwRzoXwy
x4TyNWAW7ca3cgmdOGIJeXtFbNnWgdTRkh7ucD8YB70ca3n7Xz1GTS90IMo4esfx
T3XF3sH8B9FCx7SDLdPESDGEElbDfxOrEd5037y5FroSGWos87iWtlFi9+QIikIW
TksOBWwKg28Z0uPie4LxJ9JgGPRCYlm1B3Kr8mFZh3cuhN4UKlPWzPax5Wz/8Lt7
7EUAk35ncIOst/Poa4LWeABYaemx5OAS0bgvtGqNl1ldAVKD76RK+fncHz+xvWaX
cSgyyWnASOb7Qa8+QWBKu8YPsfe3E3FJues8MmJsnApQX0LhXLd/mVfDPB2VU+cT
5vEw0ogQk30izeq5omYbKwPus8JOQ7Gia7WmfJhlG9QrJG9NVZ7/1cMXX7mgVUjS
XMjOGQh33+AYFLXO/dGhYq08o5Kog4/P00MKFEAk6h9kbJ1/0xTDm4HnaqMlPhxH
m5Yzk8dKPeOjgyQFoja4hwuIVVNuArAOSOJtBNNItydwsN4DEI8BHBarr+xTOsia
yoUzLnWQ379UjcD22bSdX+tAYeHWA9rHh4dCcxeyUEYlLNIeeAw=
=9Usp
-----END PGP SIGNATURE-----

--Tr27j8db5IUnXR5L--
