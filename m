Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47B40C433DB
	for <linux-tegra@archiver.kernel.org>; Fri, 15 Jan 2021 15:16:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 18CB62389B
	for <linux-tegra@archiver.kernel.org>; Fri, 15 Jan 2021 15:16:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726105AbhAOPPp (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 15 Jan 2021 10:15:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729116AbhAOPPp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 15 Jan 2021 10:15:45 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4525C061757;
        Fri, 15 Jan 2021 07:15:04 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id w5so9609624wrm.11;
        Fri, 15 Jan 2021 07:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=nlOMljgit56taVYqvlY9CU2O3lYwAtcadfyfCZg/8Hc=;
        b=m8o5tly1xYrXoBmnZHEIO03WW9Ulf9mgYYKDOWx33131Axd7RirvuPePOH1wHuzZG3
         FRDHlvSz10Y+F6Orbt7fTiuz78GZOvTyaSI5Pqq68t8f8lgSiKM4bXN1Sw4y9ZRHDKv3
         MlK1bKTG7yRNPe8t/zI8MPge07Y1BA70IcLKlA4GUBMbMtDPJnhgKiXheczoAIcXaugd
         ZkhjVN53q2LD2CU0sBNSiihwlMLESrxq7ElP/KVAfLF1hmK3Yc2kuO3OqTnVi+vpn6H8
         KeymDPPkeebVeqwyPM1fcv6zPV7ObYg0BfcCBHIB7LbFrOJBmpPBIvgbkuNq0NVdGmKj
         9ECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nlOMljgit56taVYqvlY9CU2O3lYwAtcadfyfCZg/8Hc=;
        b=HvEzkAJ/2wQdEEcHJ4bMHubiwG6fVVtFp7C8oMnjvrHE3M/F4VwOQZOPMb/r9jlymT
         6CZKbrSzm0MDjp7iXHK/1VijVqkPU+4hGZjLtar7Is4rg0kDngmYWiZCF6iTNvNCC6Y8
         U3DTE+wU+KXXOeFBc+8iRELrbaUx+3cakRq/YPblkH8G7i1kvSb5Aj2ZDL23K/aYNGan
         zKkoaTQalb8P1aXO5Ctx7WzV7cjtgph81atogkedDUIETTdOxOiywDA+PyNLo/kW3W6e
         XAw1BDUjAuzh/hR+xt4wrN0hEkzwdZ2vmS0GFNHHNuv5YF7qkmltg8yebPx5UD3jEwiV
         KI8w==
X-Gm-Message-State: AOAM533EXqHPJbzqz+jBKqvp64eFBGwx2iw7R9IJSfxreGQX/vYi2dJD
        zzGd4h7w6mNQJoqILdIXU+o=
X-Google-Smtp-Source: ABdhPJw6ZwebvBDytm0dFpmnLWx3OzO5+jVwI/5qDtK/cU581HPAUhkijo3LC3l38LL53/Nw3bWw9A==
X-Received: by 2002:a5d:47c3:: with SMTP id o3mr8598127wrc.175.1610723703523;
        Fri, 15 Jan 2021 07:15:03 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id l7sm8169771wmg.41.2021.01.15.07.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 07:15:02 -0800 (PST)
Date:   Fri, 15 Jan 2021 16:15:01 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] MAINTAINERS: Hand Tegra clk driver to Jon and
 Thierry
Message-ID: <YAGxdZK36eOFRWTO@ulmo>
References: <20210112122724.1712-1-digetx@gmail.com>
 <20210112122724.1712-6-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qsFUsfYm0p92/O92"
Content-Disposition: inline
In-Reply-To: <20210112122724.1712-6-digetx@gmail.com>
User-Agent: Mutt/2.0.4 (26f41dd1) (2020-12-30)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--qsFUsfYm0p92/O92
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2021 at 03:27:24PM +0300, Dmitry Osipenko wrote:
> Peter and Prashant aren't actively maintaining Tegra clock driver anymore.
> Jonathan and Thierry will pick up maintaining of the driver from now on.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  CREDITS     | 6 ++++++
>  MAINTAINERS | 4 ++--
>  2 files changed, 8 insertions(+), 2 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--qsFUsfYm0p92/O92
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmABsXUACgkQ3SOs138+
s6FoLA//Y3UfXmj0gPXKDnNdduLYlhVFsrTVdTI109AVqEh9R6V9lTJSOdH9p7++
47acghG/TCkS8NrqsqV6GHoLJWMwNSMW/DsBuZaT+0g5OfAMUOGuPFCVu1TdRPTA
DyXsN1acyt6fevsC4ETA7b5ZaKCDmkMDNKi6tjHZQ6QsM23m4x2SOePo9CYAEosi
1mYCceOzJgzJFC3oAlAA4kPM+ExS8QmPNcMllg3I9wjE8/b//iwZeeXhIzB52Xe9
67NKzaRJiaSbgg/6I6nf0K7x2KAuc3fdhBY/Ok2eS5g2SZe0D8CkmlidHcExUfHu
qf6vOv/YZakBm6BZIraM0ZpnWLHMTzCodffEeh9s2zQ5ADlKDqEts+n0gzf7jnvW
c4hDzH04USiTHoyywzJOi6KL44nihZkem1H801nKEJ9+6Si4B7IbHUHwiQHpTQBe
OF3Le3G9quJaeBpwzktTUHqyUtNE4i+N64JIe5BtCKc0xT5P/Bf+KIitlYkA/PtG
Hp5i88rdX+kBY5V6D+42dQDfaEWbXEqW7YzNYLoMVopnMSE6joCdmTqDJKBFVoQb
qQkA6V+60twBPfL9h5gtB+AsgTKBwupaEt+XBaqZZ0NWoV41tCo87BXzEc4AxRJH
H2d/wO/38QtpfKUXWFIV/Ej4jgDRTUMrs+kGzLlWgqu0wwyjHmY=
=kjpW
-----END PGP SIGNATURE-----

--qsFUsfYm0p92/O92--
