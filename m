Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3B90C388F7
	for <linux-tegra@archiver.kernel.org>; Tue, 10 Nov 2020 17:58:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7416520797
	for <linux-tegra@archiver.kernel.org>; Tue, 10 Nov 2020 17:58:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hmnKmPnz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730504AbgKJR6l (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 10 Nov 2020 12:58:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726152AbgKJR6k (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 10 Nov 2020 12:58:40 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BD29C0613CF
        for <linux-tegra@vger.kernel.org>; Tue, 10 Nov 2020 09:58:40 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id a65so3986394wme.1
        for <linux-tegra@vger.kernel.org>; Tue, 10 Nov 2020 09:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=JQY6R1ElIsTafLLi2mFqPWbFHRtmr4ipw/FCjpAryLI=;
        b=hmnKmPnzV65p6kFXsWm5T6LHZAgSAZuvMFROS3E3FRPa7MOObj35FBH4L2puAO6M/X
         c4Zz/tP60RmuO5eRmDBpSIzRFfTvv5Rg1wkltXsMzPQUgpbgBp5KFo2YxZoyC+fUCiXZ
         0WlGfHcf0PAYECKpnwiVPumXcv9otlFCZOurLkvIC9W1TLtf0Oo25fljIcRyG4snu2SH
         v1jYqnDwJ6PNcKWfwAWmUraJx2BDteR9aoSQrG4Fen+YGxwysty4hsw5jKrpThoylh1g
         Un5PFRFJi7SqLd3PhdLGjMhnF0ojkW1XNvS0ia8JiKfMN5ox/hxBqP5wt7FvEC/84TFQ
         P7hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JQY6R1ElIsTafLLi2mFqPWbFHRtmr4ipw/FCjpAryLI=;
        b=XRT/cl96esf0cdBdN5+fJskcl4xRufoLrKVenYlOjRg+fwYRI449g5lsg1My2SRDLV
         2SdksjAs0InvhJXF1YipTtpoIfo6fIlT+PcLLDT1pin8qHCjfEBgUpgq12O2YRL1Q9JN
         mRo/85yQiCNyC/fTXv7q2UCuvlR6NY6RgHT5oc8wS2qQ1DVr9gbp7iw6NmaQlpKn76FA
         AUv15z+hP6+cR5/Vy8rPkUP9CWqiR/lZTaSEjMBnhpPeM/syx35It//Ujl3ynScvTw0M
         Rbl9Y/J4+oKNd0g/5Wv2FCU4CW4Ygq3SgW1uhxDHnmyQ2b6K1aeptDXj7n47brCzTRsV
         rSCw==
X-Gm-Message-State: AOAM530bbrhrIGQcd2JLhsH2pB8YCiNLUZWDy39z8AITpUbCY7EcIY8H
        2u3SerKfAoRafu+y6JK9px4=
X-Google-Smtp-Source: ABdhPJzVGHf2zzFTzvHYoF8VWZvMfVcXdP9tFKh9HJyWbf84S5sMgVYblR3YzBJaXazDTjq68jOXqw==
X-Received: by 2002:a1c:7301:: with SMTP id d1mr247962wmb.141.1605031119423;
        Tue, 10 Nov 2020 09:58:39 -0800 (PST)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id r18sm19362074wrj.50.2020.11.10.09.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 09:58:38 -0800 (PST)
Date:   Tue, 10 Nov 2020 18:58:36 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 7/8] ARM: tegra: nexus7: Set video decoder clock rate
 to 408MHz
Message-ID: <20201110175836.GG2297135@ulmo>
References: <20201104141251.25834-1-digetx@gmail.com>
 <20201104141251.25834-8-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="E69HUUNAyIJqGpVn"
Content-Disposition: inline
In-Reply-To: <20201104141251.25834-8-digetx@gmail.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--E69HUUNAyIJqGpVn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 04, 2020 at 05:12:50PM +0300, Dmitry Osipenko wrote:
> The default 600MHz is technically unsupported on Nexus 7. Assign VDE clock
> to 408MHz, which is supported by all hardware versions.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi | 3 +++
>  1 file changed, 3 insertions(+)

This doesn't seem to apply. Is there another patch that this depends on?

Thierry

--E69HUUNAyIJqGpVn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+q1MoACgkQ3SOs138+
s6EVDA/9FMz2OC4nE3rn0xkTNQZAuWYIy6GQDHqgiZvRBq/7GY4DYFP2KxTRyYIW
DeOgDyEYSKrS73w8AIppR5K/QATuU1spJ4HSR2LcYpHUEN1kS56VYzSqLPuL3K4f
FnhILFWCFFo1f6excYZaurfNdgoGoZarDd7eGWgcKdNvTuXcYVOR8l/0hqToAwYD
3bCYmpKbc63u1NgKv7lXzWWzo1ljUGZn3Q9IZV3HE8XUgTRMggMZW3aDCGOUrRFG
zF8Acds/Tc1XVfRj7Qdcn2WsJDR1GGDCegW17SvUZ0/D60J+j317o7mKpKGw/VZZ
apvsSr+YuQqJD7KAehITO7eoCuqOCgcm7NpD6jpz6lK78YzbxQ9+m3LapYXWVSjH
TxmAa5GylyBBW4kZhcs1k4VYBASFTAYuJjkc4ZOi00Kkk9mynic9ItOSmmcmakrU
ZBa1ias6FJmV3D10RClzFsmCHmVvA6aTscLthwbWqrkPinWr0ro3r8NjmUBTZr+7
SQXCizy1PYoXlj+xzkUr65bs9M+6TT2MJhrKUdvEuhYX/KdQTcEEr726R4R00egT
Z8e0TURvH5nJmbPv+5PtwNmAHA3hfckIYecKPwszvs6NtY/rFP/S7uf1E6vjW5pj
PJ2nL3OGhfmvdn2/5gJbFq94rYl2W+QjZwvpVyaeOPwnYurXW7o=
=+ctb
-----END PGP SIGNATURE-----

--E69HUUNAyIJqGpVn--
