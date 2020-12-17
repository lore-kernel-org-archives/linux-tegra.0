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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93927C4361B
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Dec 2020 13:41:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 585CB238EF
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Dec 2020 13:41:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727385AbgLQNlV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Dec 2020 08:41:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727354AbgLQNlU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Dec 2020 08:41:20 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3162CC061794;
        Thu, 17 Dec 2020 05:40:40 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id x22so5582610wmc.5;
        Thu, 17 Dec 2020 05:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/xEt0wXdZL7ADBlF9vEh+tffl4oQx1au7xXjBQxF3OA=;
        b=qVVYf0/5qfDxl0QYXURpha42E9l2jVz9UilHHIX//iYcVxpw7+R9seGuvwbdJGOr0q
         zrH2fyS2QUpiNjh6vhKFpx/GLwrgejSGB1VOtOYV62krufKhDfe9nO4s5i1j3JbHo3Ep
         b78EVoWywFQUF5BSzImktjUuPHLBObOP8qo035QUQyqMQG5J2obwVJ9QmGUcc5FC+u48
         /JKc4oo3At6WPqwtHQNiqIw5FbemJCY+j8g0T24b/dQuUl+8g1ik+C13vdFoA+VMhTv4
         k9zgZaGMOggGdZFcw61cHiMXGuCVppmv/O1t4IpAqZnvJEtxUArcJWVG+OVECqbGUeo2
         G6+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/xEt0wXdZL7ADBlF9vEh+tffl4oQx1au7xXjBQxF3OA=;
        b=ExHzHlxNPok2eNVSZ5T9m99/na0Hyv6zC0zu6QaI8uiiOJxs1YxWUIbDMOlRlCRwzI
         Lh6ridokEAht79bWymwGm6+ubxs+EG225EvtEVFTDFPNkW/yANUBuGbUyYUVE7TwxoZi
         f0NIiE5NiihXlrkYpt2pDSrhhdiB66gXcVxbiB1dgzTLeGI1liPeHPOnb6QeVpNJdUNf
         FBjtIf+VOaWKdPKw31GqjSrbqzCdAn6ZJTXMUdbgB3fM0Qyj+N/eWCTTRlStb27GEbPD
         AeHiABHo9RlCP91K0U9ZXB+yQkXuo7leBQf/tUaMFJdrWqLYDUg7cD4BDG8DPNusHi9f
         57EQ==
X-Gm-Message-State: AOAM530sjcazPXZeOIROOySjrdqE6Uji/RXM0lvdPqKn/4DtXilLnnkE
        Ks2OrTMXCl81a2ADo7ycT9A=
X-Google-Smtp-Source: ABdhPJw8WnkEANXergOYbF/Xpo2OL4+IJooyL6tb8eAwRdFjI8Lm0fBCRWx60MEWgmF8s2OdkJQntA==
X-Received: by 2002:a1c:2182:: with SMTP id h124mr8626434wmh.25.1608212438975;
        Thu, 17 Dec 2020 05:40:38 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id e17sm8660868wrw.84.2020.12.17.05.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 05:40:37 -0800 (PST)
Date:   Thu, 17 Dec 2020 14:40:36 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Chen <Peter.Chen@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Felipe Balbi <balbi@kernel.org>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Ion Agorria <ion@agorria.com>, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/8] usb: chipidea: tegra: Support host mode
Message-ID: <X9tf1MzyUTCvfvBn@ulmo>
References: <20201217094007.19336-1-digetx@gmail.com>
 <20201217094007.19336-6-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7iCBPi+CNmxV7TSd"
Content-Disposition: inline
In-Reply-To: <20201217094007.19336-6-digetx@gmail.com>
User-Agent: Mutt/2.0.3 (a51f058f) (2020-12-04)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--7iCBPi+CNmxV7TSd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 17, 2020 at 12:40:04PM +0300, Dmitry Osipenko wrote:
> From: Peter Geis <pgwipeout@gmail.com>
>=20
> Add USB host mode to the Tegra HDRC driver. This allows us to benefit from
> support provided by the generic ChipIdea driver instead of duplicating the
> effort in a separate ehci-tegra driver.
>=20
> Tested-by: Matt Merhar <mattmerhar@protonmail.com>
> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
> Tested-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/usb/chipidea/Kconfig         |   1 -
>  drivers/usb/chipidea/ci_hdrc_tegra.c | 243 ++++++++++++++++++++++++++-
>  drivers/usb/chipidea/core.c          |  10 +-
>  drivers/usb/chipidea/host.c          | 104 +++++++++++-
>  include/linux/usb/chipidea.h         |   6 +
>  5 files changed, 356 insertions(+), 8 deletions(-)

Looks good:

Acked-by: Thierry Reding <treding@nvidia.com>

--7iCBPi+CNmxV7TSd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl/bX9QACgkQ3SOs138+
s6EcQw/9F3ruq/wHzXzARXjYo1L/SG55dJe/VK6Qei7WNOWR47PnS5PvUv0dR4rs
mjvbDJ4tpU91LvnrAytX1aQOtifDNnjY5dqKDLgPde/iiHoh97rjwiBPgYtnQM5k
1bWVi+A0pHY4H2FtB35HZtP/fLPo3sDJzax8s7/SIFyfXiu+cgbSVZjGypjhBHJY
RYXLLZzFfxMeJFpDvxb5cYbQy1+06bPPQIZePlE3WMFrh/oanjQraseMc2PdSA3K
5ufgyHtVInNS3gFERDQyvDQ3/JjNBvZbTQCNmDfPd9HdNgiP6SDUoLQxlZ/vNnWt
0aJ/uUSTRhid7PvngYOaoPS+LjiELrTuSq3ubdVRJ0wM5uMJQQQ2xBjAlfTMawQP
7K3xdnZ6GEx7+VyieqD2JC7c2eqdJm2WAqI3aHJTo5oYfWHmxWmp4Xd7FzkxYuVi
PLWjkEKFxHl54BWV559t3oEayqRXLTr1k0JOVXaqA5anY5FodjGE4xov99qCjoXp
NBs7q5dHuhMLcdYpS1JYLmdzzURDPiZnG7QgimybQ3m9uzCLHKMXu6+5SmCz5cRF
0GsFyzY6XPgq8xZnzpARSVhDT/8E9tYE4KozE/j/Ca+pTkRwPKxxhJGD/l6931EM
YfSTtZOyvZojLbUeptQ48zb26wDSZCEDyPqN3jnmsEABZbSjqzM=
=G5vX
-----END PGP SIGNATURE-----

--7iCBPi+CNmxV7TSd--
