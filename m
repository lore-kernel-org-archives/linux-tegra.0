Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D314C76196
	for <linux-tegra@archiver.kernel.org>; Thu,  6 Apr 2023 08:06:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234102AbjDFIGK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 6 Apr 2023 04:06:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235526AbjDFIGJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 6 Apr 2023 04:06:09 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCCF4BA;
        Thu,  6 Apr 2023 01:06:07 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id er13so106288148edb.9;
        Thu, 06 Apr 2023 01:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680768366;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nyh23STbMTsNGPVLjcZccsARku2r3RX8RqgmMV58o00=;
        b=lxxxq4VawqIXHErBUfSkw1lflNWiIJEmda7krdqpyn4qZnHGWl/jB9Ps2BZ0aMqj46
         wmaNsr9Sp2H7+LsgyFJxUCCXNEqEm9BknG3bKG8WLZwgG9pPWCjQc0brFMP/mETDIPjx
         11U87MB4DXycENH8TKmU0dbmQEyeIifzbX0Ro7rSbYk63uEVGQwWsuMWFwyWQ4ImgkVz
         GJnAo1IiYvOi7io2V28NxA1MRDhLz3an6px3VfDw6QFt7WMpvOgXb897NCAnTs0nEZsI
         +U/IBPDElBPfl2twjngI2soEr9gxg89lVwmasCtbCkAkKS47XKpbUNIw6ueIi3uNUL5r
         WK0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680768366;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nyh23STbMTsNGPVLjcZccsARku2r3RX8RqgmMV58o00=;
        b=1W1RvEByD7aL3wl6E2Uoi0ObgNZvKiSfEQtrdj/bHM+Ay+gNxR6lyd+kzCb+Jamb/t
         XOPsTVBfPUq8Ykf8UGi9FvaQa+a+tnurJsLl39Fqzbh56jTiq185lvfL7cVEkhndRJg3
         aF15/iH4k+5B07B/X8M+wUC6Ko2IaKBsgc5OokU00jXRkiT1E4io7YBqFf+zDvO5QdIG
         EdE7lvK7X7fmvB2HpwJqcbZlSN/fF9cIbynS4cohNfk4DIhjSXTeaBObrM11EgrcLhOc
         MMFBvAndj0GY851wemne5EgKGuyn7v9AtGpwjkepmnyxg0L3ViyKrASz14w/LUKBZKu/
         vFAA==
X-Gm-Message-State: AAQBX9edTRSo6w0JgxJeeisPPUd0iQ6bI+vC+jk5dIPSnO3KS7aEL9ub
        Do/LvlUEVQWGfgO9cYjs0H4=
X-Google-Smtp-Source: AKy350ZFQc+veGUaswKN+Nx5KZKH8L4JplXX+KbP5tet6kdCdvJ88ScflQtO3IZ4VQDSyz9Ry+8edA==
X-Received: by 2002:a17:906:68c1:b0:947:fb7b:2fb5 with SMTP id y1-20020a17090668c100b00947fb7b2fb5mr5566783ejr.31.1680768366378;
        Thu, 06 Apr 2023 01:06:06 -0700 (PDT)
Received: from orome (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id k9-20020a170906970900b0092fdb0b2e5dsm470839ejx.93.2023.04.06.01.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 01:06:06 -0700 (PDT)
Date:   Thu, 6 Apr 2023 10:06:04 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: gadget: tegra-xudc: Remove unneeded return
 variable
Message-ID: <ZC59bNc1apQEN8Dg@orome>
References: <20230405181854.42355-1-jonathanh@nvidia.com>
 <20230405181854.42355-2-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="waEPF1kwct+nglpz"
Content-Disposition: inline
In-Reply-To: <20230405181854.42355-2-jonathanh@nvidia.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--waEPF1kwct+nglpz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 05, 2023 at 07:18:54PM +0100, Jon Hunter wrote:
> The 'ret' variable in the function tegra_xudc_gadget_vbus_draw() is not
> needed and so remove this variable.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/usb/gadget/udc/tegra-xudc.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--waEPF1kwct+nglpz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmQufWwACgkQ3SOs138+
s6FyIg//fXTec/hPerOBoQdOgHRqb+xf0H7iFJ8eiqHMXQRIQ6iS8WV3IX7Dz53Z
DAAPRh3OqSb/e8WhaJdP5d3K+m0VmWq5EGRVtagVO0sDeqWzdVgxJr9I+ZEBwkq9
rRSbRR5iCqRH/I7t/aXmdhYx2DM0I/33E18c1r2pjDdDsNGS5FYsIuwgjg3Trn9K
qMgQwctoNibe4WyCxvF+cdMZDkwyazDLKH7V2EE1eCq7rbc8Wa1YgY8wmRX/yF54
PTCh3ksHzapNszIppG1XNRsZyCxpkgocepzg/zSicMrbiMQqCR/vGvVdH7jWokHg
xfuuxuQJbtg4d0xS+Yk4iolaKw4pYqoTPzANtzX48hkWn4V6tQVgjdv7xtUR5Frb
UWn+gkby4N4HseSxKniK77pfV/1UjduBcFEuvmmgwb05zmOlRAH6RtqVEyXtyo0/
uZQcs+OhvqKPQTKlW05AbGd+bHs50z6wr68lVOJi05TBSzgJsPJDrU8R5cckFFZH
jUuXKKm6XOTwrDKmQJK1cOKjyggZ/d3YTeUxCjYToJADtvwvU5obRQ82/LRderVK
GP4sfgJnWL2CqX/uEbuE8M3QijR6M3pcxuSREV3CwkDN4vtj8ql2O/SSkyHAlTFo
LyJRi0pm7j/Kn89pItX3ajZraP3NjOnKuxUba6rE11B0aU2BOLc=
=/KYu
-----END PGP SIGNATURE-----

--waEPF1kwct+nglpz--
