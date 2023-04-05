Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68DD7C76188
	for <linux-tegra@archiver.kernel.org>; Wed,  5 Apr 2023 13:49:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237446AbjDENtB (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 5 Apr 2023 09:49:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237148AbjDENtB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Apr 2023 09:49:01 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C46A8A7
        for <linux-tegra@vger.kernel.org>; Wed,  5 Apr 2023 06:48:59 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id eg48so141134343edb.13
        for <linux-tegra@vger.kernel.org>; Wed, 05 Apr 2023 06:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680702538;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l/Umafb0VsadB7LBmGQfUpqJMFJB5Tp5XINs8dKY6dU=;
        b=IE5lUgCeNcH6x0Ap6dru/IFKVgqoIUmg0kGqoQYrEX/3Ve7yaFR4Iw7Dcyp85FWrKO
         +OE97s5xNaBbMs4YFxtqWlL27iePq8nJ9Yvunx2MPL2tx9G6AY3e+Vggu+eAiOQwX+tZ
         tO6V5GzUTFLyemTCYmGHe/QzoshJiOF/cWQ3x5BnSo89/oNh3Tjptff3RwBZX6hOcxN4
         jMXAQNdwomPONR3SmvH38afhe3pz84UmkSMp+RrsrNlS2DbAtRhyrY824FlUNQ7i/DMX
         QLSqSTS4Emk2pruZY3GRBacmT+ya9/8y2zcThrZBkDY//trDrWfroz8IT5PfYwibTfyE
         /U2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680702538;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l/Umafb0VsadB7LBmGQfUpqJMFJB5Tp5XINs8dKY6dU=;
        b=X48PVJEZzz2RNNs7+0U5MCT4iMskMF4fE3g/vQ6O88a4QxYIu5tykPBPXAs6vqdsQb
         /dVPLFQeiS/4fn8HYPLX1ePWfxZSEWoI8262C7SoNoJU9wQHvBHug9U3C4nqyHOFdxKl
         r/s+KDy9Iy9CQDPEsEaVtyJJnompgUyCywUZXWgzHjmB1+pEQfp+68dqyYy8HqUhTkP4
         JH2SLKq84/y4RumSxzk5ANT+wTHcff7M6Kn1Odm2KcwOGWDH5KkE5nV6spYZkhSLrOwT
         VNCjTVHdL/E6B1zFfh+kHzwL6INDRuL/fPtOeicPYSD0qncv+uILlvTcJjhjoe97jWyn
         NAqg==
X-Gm-Message-State: AAQBX9dJFT/nAUyhQl8fl+oxEVBZrwKGRgFG4rCxR3h9F8Gau+HO7RCj
        zXVW3m40NFimpSixnl2vccDjR/YlLmQ=
X-Google-Smtp-Source: AKy350Z8EVu8L8MfIcEncFBN8/saa6qbYjSs2Y9dfGALdWVjH+NxOrqpTOIUQnXyWfMbRi6gqZTMmQ==
X-Received: by 2002:a17:906:350e:b0:93d:78e:d21d with SMTP id r14-20020a170906350e00b0093d078ed21dmr2926529eja.64.1680702538148;
        Wed, 05 Apr 2023 06:48:58 -0700 (PDT)
Received: from orome (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id km26-20020a1709079a9a00b009497509fda3sm708051ejc.40.2023.04.05.06.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 06:48:57 -0700 (PDT)
Date:   Wed, 5 Apr 2023 15:48:56 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>
Cc:     treding@nvidia.com, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] drm/tegra: fix another missing include
Message-ID: <ZC18SN3CNImmXWPd@orome>
References: <20230405114443.113834-1-christian.koenig@amd.com>
 <ZC1kFMgpXlqVErTi@orome>
 <e4ab3d50-f286-3858-5ab4-867e9a5cca2f@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="nEHmjFLn4o2OIlfp"
Content-Disposition: inline
In-Reply-To: <e4ab3d50-f286-3858-5ab4-867e9a5cca2f@gmail.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--nEHmjFLn4o2OIlfp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 05, 2023 at 02:14:45PM +0200, Christian K=C3=B6nig wrote:
> Am 05.04.23 um 14:05 schrieb Thierry Reding:
> > On Wed, Apr 05, 2023 at 01:44:43PM +0200, Christian K=C3=B6nig wrote:
> > > Since tegra now compile tests on other platforms the kernel test robot
> > > started to complain that this here is not pulled in under all
> > > conditions.
> > >=20
> > > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Link: https://lore.kernel.org/oe-kbuild-all/202304050946.yGGTKkcr-lkp=
@intel.com/
> > > ---
> > >   drivers/gpu/drm/tegra/fb.c | 1 +
> > >   1 file changed, 1 insertion(+)
> > I had meant to bring this up in response to the other patch that you had
> > sent but then forgot. One of the sanity scripts I run complains that you
> > have different email addresses in the author and Signed-off-by: fields.
> > I already fixed that up for the original patch (I used the Signed-off-by
> > email for the author as well). Let me know if that's not how you want to
> > handle this.
> >=20
> > May also be worth fixing up your setup so it doesn't generate these
> > conflicting entries.
>=20
> Yeah, that's a well known issue.
>=20
> The AMD mail servers are notoriously unreliable and mangle patches during
> sendout.
>=20
> Because of this I've switched to using gmail for sending patches, but keep
> the author and Signed-of-by line with my AMD mail.

I've had to do the same for years as well. There's a trick you can do to
make git send-email add a From: header containing the author info of the
commit. git will then use this second From: header when applying patches
to keep the authorship information correct, even if you send from an
email address that doesn't match the author email.

I /think/ all you need to do is something like:

	$ git config sendemail.from "Christian K=C3=B6nig <ckoenig.leichtzumerken@=
gmail.com>"

Or adjust accordingly if you use different send-email accounts. git will
then notice that this doesn't match the authorship and fix it up.

Thierry

--nEHmjFLn4o2OIlfp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmQtfEgACgkQ3SOs138+
s6G3DA//d2cXOVRRw9n8XdrQjFJ62YeluGOrKfYUlcBSwWsiHaGGVFPr4UoYUXta
A7GhDKgi6uEPDwpYr25yGyItVyQy2Na3BzKkzN7Hsayb6868EmVeNExi8GrVsF9e
K2vlMgiL6XlfjaAupPFPf4Sce4gruR/ICAyY8KNT9Z6Yi+eqN/nRCEUVfAiArZhD
dQQTlPC+BYlXWPbIHnfolddL2Rni+EO9NXcxoGh4PtoS3IGCRkfWcTZPcWy+YGZP
H8NeIkhcd1h31Jwl3ixpv5pdNZEToyO+ds+cE9LI/BU4jrslVLBTDZXHWAXF2vG1
zxMmDGyNAvaIL7shURSt6QKk2xYBzvTCBXAoeoYCED1E0pjxxEibdk5OjraXSWOG
06D8EonBehlBKgp2iEQlvK4JPzLtJvBKOwnHvV5VgMsOXUMg4uUhX6scZrz6DD3G
SJoxpYdN118DwAlRE6+IjKJafyZ1fiWqfysyZixN/wJKX1gFE8xN/fgY8HWLKiJE
TB9jWExvB7VVVND8sTSCrD49cMTkqJiWBvj6tCBF7vlgRM2xBidm8121SdtVH87V
lT09PEg14V4XxLuVGFuWAdCn2okp0xgOx4EPYnGwL8wWYpiJw1q+mEREdFFXZwen
rCUKXsqgt8qvBp56ajVn6Aro1Uo3lfD+I6lMBkGwqKjGOFgiDcY=
=ryaV
-----END PGP SIGNATURE-----

--nEHmjFLn4o2OIlfp--
