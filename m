Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3978EB64DC
	for <linux-tegra@archiver.kernel.org>; Fri, 21 Jul 2023 10:23:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229890AbjGUKX6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 21 Jul 2023 06:23:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232120AbjGUKXC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 21 Jul 2023 06:23:02 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0247F269F;
        Fri, 21 Jul 2023 03:22:48 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-307d20548adso1395691f8f.0;
        Fri, 21 Jul 2023 03:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689934967; x=1690539767;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LQV2smbNrzQFDcHhhFzTBfVgq4bxasw/BYlbRhCNkjA=;
        b=n15e6E22gYiBhLREK+/4tG+5gtdUZMDiek584MyoxR5DvC4k6sAH/0bHnDyml4AUML
         u8NI4q4LJYkeU4p4WyKgqIind6DeYj2ZpPIhhXxdH+AV/IMLe0NSxuZrLv3DgfzUfr5E
         D/xiASI1ye+wzhHWgTLPbjxt9WA2BYyB4yqXpgu39rb12XwirQlxjx8jVSNfDSSsqlcK
         BGeV5xCxdopm0+x35MesVyGeORCID23Kx30Rlu3fa4HnkBsnIK6XhGclYd8g/+CKB50H
         rgvaAElOzUO4Ye/9HZ0+f8YFJYLoKF/W5ajcU3wsgK2S8a1XK6d/6hDGmrRrrP3AMUy5
         QK+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689934967; x=1690539767;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LQV2smbNrzQFDcHhhFzTBfVgq4bxasw/BYlbRhCNkjA=;
        b=ENR3gx0ICdJtQTlxSyavj5LSlNs8vnTAWiBaobK0APGIs03gTPKQpB+WeXdA7mnbtd
         1vRM+sy4SMg839YsvsUo3YTFJXNP3NLcfFjMDtevP7Sg+/XTO+yMszJMy/E4YXzOPsgs
         EpoX6MEoB/QKSVEUppZRdWvZxH1v7JnUzYz1Ks9b/xx9fXT93ErJv6hhr2Vwr3TjkIXu
         rKOJMjbmVm3uhVqnkrngeGkhhK1Jezx5Z33IGcn0LWT+0mi8sW2o2kLwhagxvhrK5ArH
         vwEdAyxLDjKXkATmvfhY676HbXZtn5RFRMOPUvmlykuZ3Cc0wmt4hIBDx6td6JyViFoG
         LhfQ==
X-Gm-Message-State: ABy/qLaE4UAJQYg7D7lcd/DISqiQXWDlv+Hd/HwA5owDGySbKbbpMSmi
        9uH1/179Nob+Y14oiwqvpfs=
X-Google-Smtp-Source: APBJJlFyryxa1uHJkw5w7d2VXGVUUkM+Cfx5daiFmZUYIQp/lPX+LKfbX2kzzHLBeIfXORIYUJSQuA==
X-Received: by 2002:adf:e7ca:0:b0:314:1494:fe28 with SMTP id e10-20020adfe7ca000000b003141494fe28mr1033893wrn.53.1689934967139;
        Fri, 21 Jul 2023 03:22:47 -0700 (PDT)
Received: from orome (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id r6-20020adff106000000b0031424950a99sm3793324wro.81.2023.07.21.03.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 03:22:46 -0700 (PDT)
Date:   Fri, 21 Jul 2023 12:22:45 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Frank Rowand <frowand.list@gmail.com>,
        linux-tegra@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 2/2] gpu: host1x: Stop open-coding of_device_uevent()
Message-ID: <ZLpcdYYMgJjycvLE@orome>
References: <20230622213214.3586530-1-miquel.raynal@bootlin.com>
 <20230622213214.3586530-3-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="dtWf7IRVx8KpQMZQ"
Content-Disposition: inline
In-Reply-To: <20230622213214.3586530-3-miquel.raynal@bootlin.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--dtWf7IRVx8KpQMZQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 22, 2023 at 11:32:14PM +0200, Miquel Raynal wrote:
> There is apparently no reasons to open-code of_device_uevent() besides:
> - The helper receives a struct device while we want to use the of_node
>   member of the struct device *parent*.
> - of_device_uevent() could not be called by modules because of a missing
>   EXPORT_SYMBOL*().
>=20
> In practice, the former point is not very constraining, just calling
> of_device_uevent(dev->parent, ...) would have made the trick.

Yeah, looks like that's correct. I guess I always thought this
information would get added to the sysfs node of the struct device *
that was passed in, while it actually gets passed to the environment
created for the struct device passed into the caller. In other words
what we pass to of_device_uevent() here is only ever used as a source of
information, so passing dev->parent works.

I've also verified this on Tegra30 Beaver just to make sure and it looks
like the generated uevent file is identical before and after this patch.

Applied to drm-misc, thanks.

Thierry

--dtWf7IRVx8KpQMZQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmS6XHQACgkQ3SOs138+
s6HoYQ//QZI4hsS1hsIAv5neWAT2cYurT0oKAB/0lYWOfY4uWBC9+3yVBkatirlf
k8iRuDMTqb7WagBicylKoGr79MvJmbqzxU9gKqIMuqFGplHmmRTFVCg6DZdEtt5j
HO/pXAaSBJWLu1u08C1Aa34uOiLcQs/qE22ufuyLJgTVW0Ol4vRIiy9bWf+VvmIr
OqwFfRPV3Wu7B5a8cMIyAIruU4NjaEjDELt8Ltlelc2q8UEkd0Wl2OSSsejuHbDX
8Cg2ZwRdBe54h+rBZEznQdup61MyT9uxyER9RWE5rn0NqlTkEPoAq4G16Q1TigYA
Lt/vabmiBkcfKXtCHD9lVaVpHlMtP9NGrjztJwN7Vn++o1/SWGX/rCqS7U4Lu8W5
De1aRUUcd5N+WSFsFIFKbQ8Op6d0LeZGgkh/sPxvBl01cwBd9cozVkNJInxNJoX7
dV1KPVBugRRRsQyQgyjP0dsh8ypFui0PrT50AFlUD4XFcw/zJ9p60hdZFyuuq65v
Fkq8bg7vJRjEfGAlLn35GLfmOtMK0KDO+35vv8tVqAngjDscu3ADXGYE2o0DcIi7
cIrcbi0S7BraIn7ta2MwVDfYMi0701GOol1WstmXlfbk23ym+VySTsLlpuZmeVzV
dxAHVPyfEAW/aiVQWpFLvhrfgiOx2T/SEexcsP5Rft+pNH3ZuaM=
=eWzi
-----END PGP SIGNATURE-----

--dtWf7IRVx8KpQMZQ--
