Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 624CCCDB46E
	for <linux-tegra@archiver.kernel.org>; Thu, 12 Oct 2023 18:05:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347349AbjJLSFH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 12 Oct 2023 14:05:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344076AbjJLSFG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 12 Oct 2023 14:05:06 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C43FBE
        for <linux-tegra@vger.kernel.org>; Thu, 12 Oct 2023 11:05:04 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9b64b98656bso204899166b.0
        for <linux-tegra@vger.kernel.org>; Thu, 12 Oct 2023 11:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697133903; x=1697738703; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QfIb1D07nfI+0Ch1761SwKK3aO/nbsGIC751epSoaTc=;
        b=lhjSzRfa4+b4yVZ9f/VR2Ir3r4bjkhcUwnZUVTIK646RDNKe9MwzaqHCZ0Q/xPtQgN
         Pk/1DgAD7ON1X+ICGZb63PvhfL0m18TISGWyXc30YXa/L+6OjUmsDKT113Le/Ni9Ozx2
         FTNE/XmnCJ+tiZWmhLYjAkIO+3nGot11UQJw4SqXo+bVAcpSdXku2YiBsUwpXSpdKuXB
         7D0DtBJ1YE0d3OhvnBRP0LK63AUH4pRLbgnDqzWqICOodL/iAPLSm0KSZry87miYmPhc
         gSw0xoy5fMiMny5z1ApKBDTpGs49hGWe3OELX09zt/EOlMnGPAhxerQn3YnNMTDDfXKT
         58jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697133903; x=1697738703;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QfIb1D07nfI+0Ch1761SwKK3aO/nbsGIC751epSoaTc=;
        b=wzTKEf0ChN2YFBNfXYHwNrynmdpUA8svLs9YJRlu3QwdXsoPmpsZsIovcehVZm1Rda
         7RzE69Nq0KQJwjEks1PovQWqGHs7Zn1az/YSlYfKpzYhNSjt22oU8HUfy5Dx9GTiw+9j
         whGcpmCiPUWwXLCsrayPfpk/HCKxtyxXNxpPYw92BsQrkGK90SGywSGgwtnqi6aKFEiy
         +ge0U+1Q72ZnLnZrqNOQZbAICE/1MN7jr8PDXZYTmOeQsR0PsBw0eW98jfufqdovGatH
         DL+VfFUm01iZbFaGF1yaFeclPLBG4rclUcZI3ws2X7IGQCjoaJE1mgDNumnBrckPzTxi
         Walw==
X-Gm-Message-State: AOJu0Yw83dNtp5UYRIk3y2AhdZGbkriALc1rWpKSQWP868vLVpi6/TOM
        nP1qIcxNuEeWCBTuk6HKIe4=
X-Google-Smtp-Source: AGHT+IFdStcd3c2GGinYpRXye7AwYjUTLBoOWruKg6//W80bNpLA3+vpu34T9qw3GrF5BXwkZ696Ig==
X-Received: by 2002:a17:906:310b:b0:9ae:5765:c134 with SMTP id 11-20020a170906310b00b009ae5765c134mr22622471ejx.15.1697133902720;
        Thu, 12 Oct 2023 11:05:02 -0700 (PDT)
Received: from orome.fritz.box (p200300e41f3f4900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3f:4900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a24-20020a170906685800b009828e26e519sm11289137ejs.122.2023.10.12.11.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 11:05:02 -0700 (PDT)
Date:   Thu, 12 Oct 2023 20:05:00 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     broonie@kernel.org, robh@kernel.org, lgirdwood@gmail.com,
        jonathanh@nvidia.com, ndesaulniers@google.com, trix@redhat.com,
        alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        llvm@lists.linux.dev, patches@lists.linux.dev
Subject: Re: [PATCH] ASoC: tegra: Fix -Wuninitialized in
 tegra210_amx_platform_probe()
Message-ID: <ZSg1TEvIMu2qDzhm@orome.fritz.box>
References: <20231011-asoc-tegra-fix-uninit-soc_data-v1-1-0ef0ab44cf48@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="edj+BPVW5o8cXPI2"
Content-Disposition: inline
In-Reply-To: <20231011-asoc-tegra-fix-uninit-soc_data-v1-1-0ef0ab44cf48@kernel.org>
User-Agent: Mutt/2.2.12 (2023-09-09)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--edj+BPVW5o8cXPI2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 11, 2023 at 01:21:51PM -0700, Nathan Chancellor wrote:
> Clang warns (or errors with CONFIG_WERROR=3Dy):
>=20
>   sound/soc/tegra/tegra210_amx.c:553:10: error: variable 'soc_data' is un=
initialized when used here [-Werror,-Wuninitialized]
>     553 |                                             soc_data->regmap_co=
nf);
>         |                                             ^~~~~~~~
>=20
> A refactoring removed the initialization of this variable but its use
> was not updated. Use the soc_data value in the amx variable to resolve
> the warning and remove the soc_data variable, as it is now entirely
> unused.
>=20
> Closes: https://github.com/ClangBuiltLinux/linux/issues/1943
> Fixes: 9958d85968ed ("ASoC: Use device_get_match_data()")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  sound/soc/tegra/tegra210_amx.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

I see that Mark was quicker and this is already applied, but just for
the record, this fixes an OOPS that I started seeing recently but hadn't
gotten around to look at more closely, so I guess:

Tested-by: Thierry Reding <treding@nvidia.com>

And thanks!

Thierry

--edj+BPVW5o8cXPI2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmUoNUwACgkQ3SOs138+
s6FvjxAAsd5bwFFR8vGCLIUjLqquDW0xtQm0nZacYaJmO059dJTozlND+izhpVvt
wwh1GxcniMG5Qg55FmxG82icd4V+3JmtKvCjSx32DO0CsdlOUg/JHTwifRI8mr2d
9a45DaeInh8pCQpYiEf3EjPZ+vuoDH0YKivuJwL+UGcCTzWyuA4Aoh8NciHJASQw
4Bwc3uq4dmvS/Ax2DgUO3/9hY0nEHT6o0Ke9xyPeQ+ZlBi9m304dY7Y53jNi8IWG
p8BF62VBiLqDh3icmqFTVd7NuBdkhjDP3BFvv8WjKssC5dv/e+/3wZT6od4EBK3j
ru+ZTDwzkx7sOuaS+UZ01D49LjCRS9Jq64XJxe1vUo5w97w297KanCgCIMo5AFQA
brqk8n9t9EluL2hgSlT7PidybAvsFO59dfhh+IraBhKUIe0j1gmFLtqU6UIVGosb
PoMqiQyuW29sLUABzGQY3zus38U8XI64DQC+nqAsrsvpSkwk5KgRdDqJ5DYhqVE1
qbFzPC9ONgM21oDzSybEuN1hDG1fHhhrLg8vMjWTjyDQInsv0J+vpobpnzuAdhOX
qVxYan5FyZThbet9v2/s/fK50P5S1+a9ShKSLlNkpAw9MLTrepd/SP9w7cw2ZLF2
TGp2g902Pnle5sSbNPqTYrtbEx1+lnhCpJvee8+Uf3WwrTzZbAc=
=WcBW
-----END PGP SIGNATURE-----

--edj+BPVW5o8cXPI2--
