Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB6B3EC8742
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Sep 2023 17:20:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243086AbjIGRUN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 7 Sep 2023 13:20:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243108AbjIGRTy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 7 Sep 2023 13:19:54 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E82E10E9
        for <linux-tegra@vger.kernel.org>; Thu,  7 Sep 2023 10:19:34 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-501bef6e0d3so2044353e87.1
        for <linux-tegra@vger.kernel.org>; Thu, 07 Sep 2023 10:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694107113; x=1694711913; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Trw2Io8ytInM/aE3aOtZqo+e5kg3I/wOc+oRENvPgFs=;
        b=l2DnPd/22BWi3B2oETTmNCGK+SkSHQbvidRHiJzbSwHBak22r+UkSopvkAmUbaWbbt
         4uiuXdyXDRpaJxApuvY5ehgOyCuL9RpXatblFqkf8fmDlraqShzE7YAgkXE98CF/mqNM
         fFY/WRkPgP1Qbu42IDlXCAlrSkQII2NlTzzbYw29p4+ItYjKCidcpDso6R9tuwzhUUah
         ggjmVHM/uRGys71a89aXTmcadT0oXL9j2suS/wkew6NQ0qR/eDzucGlt/hmt5HkfC2+D
         zcYpyRllEXIkvukfB3OdpdxQQ0Yk3mwMVt8Kz2g8V+zIQ8xXu2TXzzeOvPPF8zG3Z2Te
         wa8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694107113; x=1694711913;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Trw2Io8ytInM/aE3aOtZqo+e5kg3I/wOc+oRENvPgFs=;
        b=Kp7nhm0lVS8y8iHP+eWFtCM+7fyyTACUqNP/hWsxRWVmIdMNGdblxiUd4fjYgxlPh/
         uwfGXU2b+I76SFRHkKmWqOaibvL2A1rVVp5WZS2PGLfdaMbM81upIzuSTfCEr8mZX2PD
         II3XIZya/6BRLWy4JiOzyx81la5TxjITsWIAW4/mo8GFR+swFlYYC8Iv5HnysqWtTo/b
         OfQRwEcxkr5plU4pidCQypDenvX/GVjJQAXibab7ShRbhPr7YuS3g35iTkTEjFJl0wr4
         aCaQ3xxQzJZhK9nyFxx+4Vbg3xrcJU6sQEWQr+2itM3e1qUGnXqWjoN0YqPtL4zJZ/sK
         ZavA==
X-Gm-Message-State: AOJu0YzLHob7ooAyWdovmAL6qKo1JMqQwSlDm2RaJ71Mqab+VnirwcVO
        xSlTLRpQou5qr3gPZIn6rGEn/E1tGgU=
X-Google-Smtp-Source: AGHT+IH3qgpRCX7/aDqgLlEB/4Ih1/EFDrLeaDQWihqXMSYg2240AnNbJlLKWfYj9NYu/lINHqg10w==
X-Received: by 2002:aa7:cf09:0:b0:522:cb97:f196 with SMTP id a9-20020aa7cf09000000b00522cb97f196mr4191837edy.36.1694073831238;
        Thu, 07 Sep 2023 01:03:51 -0700 (PDT)
Received: from orome (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id r24-20020a50d698000000b0052e2aa1a0fcsm4932797edi.77.2023.09.07.01.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 01:03:50 -0700 (PDT)
Date:   Thu, 7 Sep 2023 10:03:49 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Mikko Perttunen <cyndis@kapsi.fi>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] drm/tegra: Remove existing framebuffer only if we
 support display
Message-ID: <ZPmD5WNZzz279qZ7@orome>
References: <20230825132229.1109445-1-thierry.reding@gmail.com>
 <f5ce7a77-ee3e-5186-dd8a-76c0bd794de0@suse.de>
 <5f1bca1b-8deb-e677-521d-87d3848e22df@kapsi.fi>
 <CAKMK7uFDn_R+c=YErf7gEHVW4pg+odYKVjrs0EofvpG544Po6Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="EqoqqfIR7OGuiZIB"
Content-Disposition: inline
In-Reply-To: <CAKMK7uFDn_R+c=YErf7gEHVW4pg+odYKVjrs0EofvpG544Po6Q@mail.gmail.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--EqoqqfIR7OGuiZIB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 31, 2023 at 10:04:29AM +0200, Daniel Vetter wrote:
> On Thu, 31 Aug 2023 at 08:33, Mikko Perttunen <cyndis@kapsi.fi> wrote:
> >
> > On 8/30/23 13:19, Thomas Zimmermann wrote:
> > > Hi
> > >
> > > Am 25.08.23 um 15:22 schrieb Thierry Reding:
> > >> From: Thierry Reding <treding@nvidia.com>
> > >>
> > >> Tegra DRM doesn't support display on Tegra234 and later, so make sure
> > >> not to remove any existing framebuffers in that case.
> > >>
> > >> Signed-off-by: Thierry Reding <treding@nvidia.com>
> > >> ---
> > >>   drivers/gpu/drm/tegra/drm.c | 8 +++++---
> > >>   1 file changed, 5 insertions(+), 3 deletions(-)
> > >>
> > >> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm=
=2Ec
> > >> index b1e1a78e30c6..7a38dadbc264 100644
> > >> --- a/drivers/gpu/drm/tegra/drm.c
> > >> +++ b/drivers/gpu/drm/tegra/drm.c
> > >> @@ -1220,9 +1220,11 @@ static int host1x_drm_probe(struct
> > >> host1x_device *dev)
> > >>       drm_mode_config_reset(drm);
> > >> -    err =3D drm_aperture_remove_framebuffers(&tegra_drm_driver);
> > >> -    if (err < 0)
> > >> -        goto hub;
> > >> +    if (drm->mode_config.num_crtc > 0) {
> > >
> > > If you don't support the hardware, wouldn't it be better to return
> > > -ENODEV if !num_crtc?
> >
> > While display is not supported through TegraDRM on Tegra234+, certain
> > multimedia accelerators are supported, so we need to finish probe for t=
hose.
>=20
> Ideally you also register the tegra driver without DRIVER_MODESET |
> DRIVER_ATOMIC in that case, to avoid unecessary userspace confusion.
> Most userspace can cope with a display driver without any crtc, but I
> think xorg-modesettting actually falls over. Or at least I've seen
> some hacks that the agx people added to make sure X doesn't
> accidentally open the wrong driver.

That's a good point. However I recall from earlier attempts at doing
something like this in Nouveau (although this is now very long ago) that
it's not very easy. The problem, as I recall, is that the driver is a
singleton, so we would essentially be supporting either modesetting or
not, for any device in the system.

Now, it's unlikely that we'd have a mix of one Tegra DRM driver with
display support and another without, but it's something that I recall
back at the time with Nouveau was problematic because you could have the
Tegra integrated graphics (without display support) and a PCI-connected
discrete GPU (with display support) within the same system.

I need to look into it a bit more to see if I can come up with something
good to account for this.

Thierry

--EqoqqfIR7OGuiZIB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmT5g+UACgkQ3SOs138+
s6FLmhAAmyaCx+NZ4CFNJnxq8gGz2x3VEtu+/0PYbo6Fw/Lx+HMoIpz9sN0sb6Dh
XvJ5gxTSMeNWwQXSuLDd/dkZLgrveqd1pi4kzaClq1B1PnuD4ltt2K85a0/riByP
dfRf8fs0i0DwcVM8WxrzpeLkE+HydCHkZJu/jisq8zGWrZvFr/PRUQvDYILKDEi2
GoqN/DKNNVgkbn2TMrAwl/U899ZqUla2+03EJqNq0N10/wMUbEmuIBSkuUx3Z4Ys
y5RAqxiQt5Q8l8m81+p5hdkkS5rlEnODzK1tYHN9p34hEq9miBfL94kYdV+6I303
poOV5TGn9rN1KvP0cFIi/kQXYFTr7Myk3kSifPLlSeCdzHMrt3nigPb9zoHWl5mI
2sxxYydmSnq3GiROvs2LnbuFw4lZfnUNkgTJTllPPL6hp3dnAJ5H/8hUVtVqLXQn
BaUEiY/awdFWHJPRrBgm30vs8IKOlWCV2+3T7LWrQ77X/+HYjVE9i5q36cOJ/kZb
TBw8PnO9DZtoAFzJ3EaUqyQetPJAbUzGvBvqdK5sz8aqMHJ4r0ti1fCF6tPR95G+
Skkhl2Bm3h/0R+VEOr2uDwRvPTpZTs4IIdJNTIoIjP5170SS0FGutvD8ZKSrvfI6
Qe0pZ/TzKEFYsZVV15YIWwukoQzgmsd34hTPT0H0RRJ7wz800uo=
=cMhM
-----END PGP SIGNATURE-----

--EqoqqfIR7OGuiZIB--
