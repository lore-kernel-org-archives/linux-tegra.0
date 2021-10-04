Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC956C433F5
	for <linux-tegra@archiver.kernel.org>; Mon,  4 Oct 2021 19:23:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BD9D461354
	for <linux-tegra@archiver.kernel.org>; Mon,  4 Oct 2021 19:23:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238798AbhJDTZZ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 4 Oct 2021 15:25:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238621AbhJDTZT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 4 Oct 2021 15:25:19 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E330C061745;
        Mon,  4 Oct 2021 12:23:29 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id g193-20020a1c20ca000000b0030d55f1d984so312271wmg.3;
        Mon, 04 Oct 2021 12:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=uMjCccuv8K3FthyMvW3umSTS3TXEzXjJZC770iFNXMw=;
        b=T2U/nE7hnQSuiIVNXx59ef/KVGvClvaES83NC0R+C/3AWB+l1vO8a+jvJe+dsF+Au2
         iBDZVJ8ZpaBDFHU/BtxgDphiSZpuFUjU64E6txDvtN4d24igRZNmXkoLz1PuhIP2IHEK
         CAQWThnaBlUeIrnqxTjYF8wt6lPkNXgIuPY1XTHb/D9T+E5NNROAhJW0cbUHtpHmChYR
         gX+hXU6gsU1dNpnzDOpqnAsOBV0I4es4WLQHD6JO/6OwpezrLJcrN2XquUZ0oDAJEXQr
         kY7NkOW7FblGAPzGsbIFeWsTDK++aRYDd3dYpGjOhSmyecNOtDbJJ0MidhsSkXa6hFNO
         ZgBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=uMjCccuv8K3FthyMvW3umSTS3TXEzXjJZC770iFNXMw=;
        b=78VmxLZQPZWNaIc7KrXO1JQ7o+eg1yTCKtYO1oGiUYxOGxJngx8nuNVxOV4tS4TIpl
         3cgrgE/MbhKaK/GnGTBI1oB3KN4ZFE3Pi9r9G4yxx1AVjcYMVxVAC579A6g6N9mEsGmP
         xux7+c3W1x6CfmZibfm/j6QA9hhvnvm1vyPLZ9dXYqbTaok5hzR6+yCyh+3IaLW4M4qI
         dfJ5/Wk/9PDcvrDdTKylLD4GMrkzhb894SBA9EN9DApKWTO8SU/d8JnoUSLjF1qTI8GV
         z/WG5VvjtczOzTJ8A20taPVlzFdj/QhzlXUQY0HNL1h06T8FcUnZD5gGOJoqOxJn8lsF
         lPFA==
X-Gm-Message-State: AOAM531GZPh5+WdpPADXGKdRb3SV3atXRWcAz/UoGzUiWCJ44KqkxEt6
        hjIlUyPWNQLs48z4WJG0yPw=
X-Google-Smtp-Source: ABdhPJyjwD/LH2q95MXnuxOh2nx+sB81p6fg9bLtYYJr1TQ6uyeixQlpw5qjfZ9c4yBIQ6sqSZlgoA==
X-Received: by 2002:a1c:f31a:: with SMTP id q26mr19823190wmq.159.1633375407907;
        Mon, 04 Oct 2021 12:23:27 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id h18sm18108229wmq.23.2021.10.04.12.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 12:23:26 -0700 (PDT)
Date:   Mon, 4 Oct 2021 21:23:25 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>, devicetree@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 0/5] iommu: Support identity mappings of
 reserved-memory regions
Message-ID: <YVtUrTdI9kUSScui@orome.fritz.box>
References: <20210423163234.3651547-1-thierry.reding@gmail.com>
 <95e4c23e-4700-ef7e-d8ae-17693b65e121@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="348p5nA0ximYPP+C"
Content-Disposition: inline
In-Reply-To: <95e4c23e-4700-ef7e-d8ae-17693b65e121@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--348p5nA0ximYPP+C
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 03, 2021 at 04:09:56AM +0300, Dmitry Osipenko wrote:
> 23.04.2021 19:32, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > I've made corresponding changes in the proprietary bootloader, added a
> > compatibility shim in U-Boot (which forwards information created by the
> > proprietary bootloader to the kernel) and the attached patches to test
> > this on Jetson TX1, Jetson TX2 and Jetson AGX Xavier.
>=20
> Could you please tell what downstream kernel does for coping with the
> identity mappings in conjunction with the original proprietary bootloader?
>=20
> If there is some other method of passing mappings to kernel, could it be
> supported by upstream? Putting burden on users to upgrade bootloader
> feels a bit inconvenient.

It depends on the chip generation. As far as I know there have been
several iterations. The earliest was to pass this information via a
command-line option, but more recent versions use device tree to pass
this information in a similar way as described here. However, these
use non-standard DT bindings, so I don't think we can just implement
them as-is.

Thierry

--348p5nA0ximYPP+C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmFbVKsACgkQ3SOs138+
s6GKyQ//V2saEEzeX3U0wiG5Q2qsyu91r79CCduNGpAEgJwyoZfObKu07BhPXBUw
lCxgiRVS84aoOcEl7llqB01B8UzRAaB4c3jXW5SvRyYF+J0MUjcwXENJpWE1Ojho
PuIcOZPRJt0jCcAv2O0hK8azDyFdaf+xpCeLEOMwA3oDp1MadfGzhP9K3Nj/la6f
KKldVqTYxbSaErW/jZ/S1Rdhe7M0iWW/90f+NdBU2hdFvChd0WkQW7WSbTRDitu9
GorqdupEe9fwsm5xh43kk3jrST3tJccjJkeAuK+JqVnfaesNChgiiyAvXtva1bBh
fqwp+Ey5YjcgoRUO5PBwCOg86+LrCifhpoVkGSSV3+GO9VPg1A6r90A665fFR6ti
H9QWJCt0NgdEQeCmkeKZ4JIQ1ICm9OYSRe8JjJpTV/ppGAcyP3nyXfye7cru0hc3
lh5BgGcksPz6kgawyxeIZNrEWOg9T6qb9uV29myqNHGt2yXgTAIC1IxoqYD/SBD6
ghGS/qDBo2jGiUC97GmEOoY2/2JK7EgRpjmPKWdRjy8xmqSgIr87+Lxg5ZmpFvmw
Z6JWzqUjbD2E3La+r10q6B19BQd/9vK7j4k19Umz5WTnbHMAZwi91b8Rbs8C0D0p
oDdx7kjHeSKdqsh68zNTx0RDwEsl5jgIb5hxtdTJOWKOOgVNGfU=
=Unww
-----END PGP SIGNATURE-----

--348p5nA0ximYPP+C--
