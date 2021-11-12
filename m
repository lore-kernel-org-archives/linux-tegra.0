Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B0BAC433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 10:39:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3641F60F8F
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 10:39:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233441AbhKLKmT (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Nov 2021 05:42:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233189AbhKLKmT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Nov 2021 05:42:19 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3040C061766
        for <linux-tegra@vger.kernel.org>; Fri, 12 Nov 2021 02:39:28 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id s13so14720459wrb.3
        for <linux-tegra@vger.kernel.org>; Fri, 12 Nov 2021 02:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/tA4etxuhyZBgW9hixmUCCrsSg6AvdasJmoLdAaIxQE=;
        b=EdAdow6Os4lIv6e3u3TttIhB1XB0+uMDKb6eoD58JhAxKwJeRoWozD00Z5qM/iUBxt
         2hlBwSMZa+2UXkAU5tZkTFCFm5O1Z/G0pFcp/WXucu6Vx9QJf8lOGqBt515CgDZXqnl3
         UUNPAE8CI2KBwfOp5UXM3nYdqI8mPCZH86I3X08WbLHYCCfuJ+SmnGhjAWfxO5xRdECh
         k0hinCoIh9EyJ1IWmjFp9WIeyc1c0VcWIo3nHWrBiZ1RK5yE+Rni9NzPyK0KmUpqIHYJ
         W0Zh8gJhHiuLuMa0I22+ujwQv7C4rJItjJgPQbtA3He0HWWT8n4POCuKPNyqNLh0oyAL
         Gdkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/tA4etxuhyZBgW9hixmUCCrsSg6AvdasJmoLdAaIxQE=;
        b=2vvvdhaXC7TuFq7m7RiNsaI+mgHnaNYr4VbUzlZpn/qVj9Fbn93PXLnzdijR72D3EI
         8j84xPBhf0BPm9xjEIFznzm4MO8herfgbfWUU0VRqWzLgU4K1kwQHJ26/wvp1lxP3FR4
         u0skW4Ir6ciwCceBQB5z1E+Zhpr8SYFCeP0JgLF4x8d1rJ5b0lLuUNUsnbM2QfeiprjF
         HgptguBqFSLjIxzOhuFzHwx5Ax328DPEN073A1LQrCRnMc/Fy1minwG4aCzijCAAm4mG
         uSMTQWz/ATCEsDCmHNA5DfttwQlk4dEKz+PxDvMLgEpppC1M4dDKYR3Ni+t/HaFd8wSM
         06gA==
X-Gm-Message-State: AOAM532spRhfha6oy8ff3Byn+lqfgv93Myr13J/7BW4/Y6ppWlNur31q
        h4BX+tjZ8TISqxEOfCv2zmk=
X-Google-Smtp-Source: ABdhPJzD9b36/vyCl7zzuYTxH7IlwYQNh3wC3vx69x0dRHzwbgOGgweC2PFs479G/M8675bUXnWqzw==
X-Received: by 2002:a5d:47aa:: with SMTP id 10mr17957650wrb.50.1636713567440;
        Fri, 12 Nov 2021 02:39:27 -0800 (PST)
Received: from orome.fritz.box ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id n13sm5421483wrt.44.2021.11.12.02.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 02:39:26 -0800 (PST)
Date:   Fri, 12 Nov 2021 11:39:23 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [GIT PULL] drm/tegra: Changes for v5.16-rc1
Message-ID: <YY5EWyMaGcZjdmvQ@orome.fritz.box>
References: <20211008202334.1679411-1-thierry.reding@gmail.com>
 <YYTybH9cEcmJUaVc@orome.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kmATN04C7Jh6sTdw"
Content-Disposition: inline
In-Reply-To: <YYTybH9cEcmJUaVc@orome.fritz.box>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--kmATN04C7Jh6sTdw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 05, 2021 at 09:59:24AM +0100, Thierry Reding wrote:
> On Fri, Oct 08, 2021 at 10:23:34PM +0200, Thierry Reding wrote:
> > Hi Dave, Daniel,
> >=20
> > The following changes since commit c3dbfb9c49eef7d07904e5fd5e158dd6688b=
bab3:
> >=20
> >   gpu: host1x: Plug potential memory leak (2021-09-16 18:06:52 +0200)
> >=20
> > are available in the Git repository at:
> >=20
> >   ssh://git.freedesktop.org/git/tegra/linux.git tags/drm/tegra/for-5.16=
-rc1
> >=20
> > for you to fetch changes up to 5dccbc9de8f0071eb731b4de81d0638ea6c06a53:
> >=20
> >   drm/tegra: dc: rgb: Allow changing PLLD rate on Tegra30+ (2021-10-08 =
21:17:38 +0200)
> >=20
> > This is based on the drm/tegra/for-5.15-rc3 tag that you pulled a couple
> > of weeks ago. As mentioned last time already, the userspace for the new
> > NVDEC driver can be found here:
> >=20
> >   https://github.com/cyndis/vaapi-tegra-driver
> >=20
> > I'm sending this a week earlier than usual because I'm out of office
> > next week.
>=20
> Hi guys,
>=20
> I haven't seen this show up in drm-next yet. Did this fall through the
> cracks or was there something that you wanted to see addressed?

Dave, Daniel,

v5.16-rc1 is due in a couple of days, but I still don't see this in
drm/next. I'm assuming it's too late now, but is there anything I can do
to avoid this in the future?

Thierry

--kmATN04C7Jh6sTdw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmGORFsACgkQ3SOs138+
s6GhIw/+KFsP6gkqMlksVuM3Hwhuxb527bTc92IQ3KwYgjV1SAK5OVVFTagU6Y/T
Cg40hp/C1vPcihHG84AOj2mnAqyLd74JaNEgIR7Z49Yf0YWZcz+OZQ41d9Pb+XnZ
9X4VYJGJ9HPzQENLvFQUBfvwSAfxP6559t53f0yrRyCRh2grhKSMYKOwxRc3sjf0
oOqdVLZvomPaGDKHR+hmr2D3jCYyfKfGua5H2BYAduu14I765ELte/DRBc68XQ8w
lzfXEi4ifvUjgI87oHGi6vQBlY3BPfAElP5hA+Y/hKT2qDz0KeydHUn95D4PxFno
i09+/77nIGV8S9e2clPu64tdn1gnasf9/6PvxR6JHMqyP6zm27OocXpOb/moHdDm
v14iv/y0xlmb8d6aBD9Fl8cp0I6r9EV04Oys4A0WfNZzSgpK1R6dL86FneVi0f1O
tA4s7pdD+FyhmpuPYM3pp7WVc1tccXn7bE+CskHbC2QFbxfi9SghRBKMop/Z2KGp
F6HOjyVfI7hI7cd468/cprs+s5eP7kfUFlHrFxk/G9F20e7/J6DbFNKFcgYZwBxh
+7+cBRD35kRAWW755cJNhEwiHPIeOOHUsowHsxI0jky/dMYMXyrsxC7Rjy43kXrm
iTv9LmqWT13ylK2qPqB+nX3N+yjauzRhWSFl/uh2iODmHAWxAFU=
=8pZQ
-----END PGP SIGNATURE-----

--kmATN04C7Jh6sTdw--
