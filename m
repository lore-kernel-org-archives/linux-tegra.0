Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A50F8EB64DC
	for <linux-tegra@archiver.kernel.org>; Fri, 21 Jul 2023 15:22:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231325AbjGUPWE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 21 Jul 2023 11:22:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231843AbjGUPVv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 21 Jul 2023 11:21:51 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CCF23AB4;
        Fri, 21 Jul 2023 08:21:24 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-51e28b299adso2879050a12.2;
        Fri, 21 Jul 2023 08:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689952870; x=1690557670;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dv+nTyzKY9Nr6YYCLMrrXJ4Q8EaGmwjNsegtGuczxNs=;
        b=j15MfJ6CJRvxe0lSktT1YbioUzf94aOi37zGq+GKy4jNBvntFY25LeGR5c67VQ373T
         1Et+nJQdubw2luX4xAFyat38Tg38kRNQBLNeL2+jRQVawVOmGE73I2kMTCULsqk5Ntns
         o7a65lopB1Nsd0ATjKsculbbRqZB8FAXVNtJtI26S3R/ajiQFiGKk2LxY+C9LQ+DEiRP
         uNJZcdy8SkvpZjyeF77mFcWRqLKjHQO6RWNQNwutvkKLp+IKdaa/QJBkABbD5g6KxOa2
         EBrdfTDLnI+OtbX5CPgbs8MffnruzAxN4zLNJOKmbs2ChJ7PJIF3t4W9FGX81c1RGbmR
         +bRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689952870; x=1690557670;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dv+nTyzKY9Nr6YYCLMrrXJ4Q8EaGmwjNsegtGuczxNs=;
        b=dyAyaxWYcdfQ6OKz4wYCkLZC8wcXW7vRNM907fDguCWrvFZ1AlrV/RabcHpnZJ2LvN
         nNEMMmrzjVk5b4ynsJgLcKq2PTHeEnHTszHsrMBqgA+NsoJEIhlxMaeZo1GHDht+qxr1
         vefAejpMwV6KzAkW8Cb7+oM467wcBqrXws036/7KmE02QkyTKCL7cnzB2TwDEtP/QDlz
         feNyuTarQO+WCIK3ODGumSBJKIAU4sEc/GdZfycLYb4ArU9NjMqKqPn3m+DtsP1a64ys
         +O4hw4HCM+ahRHITPzsJi/2SP8enBb361pUhl0MUYZ0Rxijoflzu7WTle102u+sV67Hf
         FFLQ==
X-Gm-Message-State: ABy/qLYnYweLrbnSIk2c/m8s8aMLyLxx7KKaSt5wAKBllPHot6bHLoSv
        JSrGooMZDW9tfOGCgWvbLPU=
X-Google-Smtp-Source: APBJJlEzbjz5hpNrBSTNnh219YW288jx4lknOPTl4+SWlo5mRLL2Jq8WLrUU8G1fBUKGoy40zqD8Ew==
X-Received: by 2002:aa7:d9d7:0:b0:51e:17d:a1c3 with SMTP id v23-20020aa7d9d7000000b0051e017da1c3mr1716020eds.32.1689952870441;
        Fri, 21 Jul 2023 08:21:10 -0700 (PDT)
Received: from orome (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id n1-20020a05640204c100b0051e0f21c43fsm2222451edw.31.2023.07.21.08.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 08:21:10 -0700 (PDT)
Date:   Fri, 21 Jul 2023 17:21:08 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jonathanh@nvidia.com, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Shubhi Garg <shgarg@nvidia.com>
Subject: Re: [PATCH] arm64: tegra: Add PCIe and DP 3.3V supplies
Message-ID: <ZLqiZHSivgiujFGE@orome>
References: <20230531085052.3082394-1-shgarg@nvidia.com>
 <168995275289.3655268.14541352228230086583.b4-ty@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jg6moWSObjW1gEvL"
Content-Disposition: inline
In-Reply-To: <168995275289.3655268.14541352228230086583.b4-ty@nvidia.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--jg6moWSObjW1gEvL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 21, 2023 at 05:19:18PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
>=20
> On Wed, 31 May 2023 08:50:52 +0000, Shubhi Garg wrote:
> > Add the 3.3V supplies for PCIe C1 controller and Display Port controller
> > for the NVIDIA IGX Orin platform.
> >=20
> >=20
>=20
> Applied, thanks!
>=20
> [1/1] arm64: tegra: Add PCIe and DP 3.3V supplies
>       commit: 84ea422262387d050ed46e896371da79fc31e7f9

Note that I've renamed these for consistency with other regulators'
regulator-name property. Let me know if for some reason that doesn't
work.

Thierry

--jg6moWSObjW1gEvL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmS6omQACgkQ3SOs138+
s6HPFw/9HXG5ppN8Na3R9E2nwBWSluSqJNowV2yw/GelVdnZODSbGflWfPn1/60o
3wIrqga+c5/mrM2hhhjLa5HMuru9MMJ0ingmaK42l2ysUX6oE1rnmhayIY0ptHJd
Mt83sIDk71HiB7xHGy91WYT67Af/2PkszRQYtbkQZuyoDSVv6oFfddttlFoK6Zy1
MoFUeXY1gymTtxKqRb3RiTwcA5UhzAePaRkKpPuYJB4XlqTuKE3PGHz4LY4F6+V7
e+YmmGAdq1O0r5nTCf9s9ruh3tlSjIqFrgejZKw5cjlN8Kua7nir1vXu7ncH7JyT
RIewjwr//xLgVUdFeo/rhCL5uja/smIdc9bJkCUP8kMQkMFZlPLvk+Xi/Is6K0ha
MY9blttavSBfQST82sJO1uZZlAErPGx7Mzw0OSJKARhOHWHERXO0HFyKXoTA1dck
fCN6B5ybh/V9RKgUYrgldxJ4j8d9BNfn2I1dmB5DjPhD2bIeES6e2uWfMiTM0iah
Hnb1OvjEFKR5mAT3mIJYJhalH8k1/QFovvJPNUjMd4HtqkG2VR6tPhnZenBJNPSE
YN84Ij3Ox9FPahqDBHE/Joh1MwdXifd35bqwQlOz1X0JzANvQ8wM26FhxdBukzYw
fv+LKZTQwRJ7u3hDJ2aVHbD1CxLiEFyhUlI7xUGTUja6iDGi13A=
=gWmU
-----END PGP SIGNATURE-----

--jg6moWSObjW1gEvL--
