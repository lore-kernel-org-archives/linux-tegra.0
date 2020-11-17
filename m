Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BAE1C64EBC
	for <linux-tegra@archiver.kernel.org>; Tue, 17 Nov 2020 13:53:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DCFC9208B8
	for <linux-tegra@archiver.kernel.org>; Tue, 17 Nov 2020 13:53:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LnUVFJQu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731831AbgKQN2O (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 17 Nov 2020 08:28:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731287AbgKQN2N (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 17 Nov 2020 08:28:13 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86256C0613CF;
        Tue, 17 Nov 2020 05:28:13 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id h2so3263359wmm.0;
        Tue, 17 Nov 2020 05:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=z5nRMWqZ/QN9od2roRxZfjfshzdwEOeik0u1h7RtLqk=;
        b=LnUVFJQudTGPlJLNQZt7o64p1he3iEd7YJ3J7L8W3PbzVfyvvRAf/x7q3jBC//Vg3T
         ZvN0qwGSJuBC8FKB9onCNPhrylSwWKmtNc73E8eumXOVwQzxzssSMuvlHF3loy9AoGnf
         /+gA68keY+49yUb62QkdLRxS8E6eXeZIiL4Yg/hhvDDuiCdtqs6RhOc1cza/85lVEL26
         MBxM0WjtvSnpijicIuRgO9LdJZXABaXbqKl94cx4u0fihizDeWNIoCnfLVkrj+saCkBh
         SdvAlqsPcH5fx4uEiXjDYcrMkXByv9vawkXhSyorOnQvNTaRa1IpzDtWQ77IzV2W0uKW
         VfsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=z5nRMWqZ/QN9od2roRxZfjfshzdwEOeik0u1h7RtLqk=;
        b=TfIGTUxQ2aiYA7/6ORviJBQ4r/q3X+Iv8SZX/BZfvZOnncdwZNMkRIahRvV5fWpYA+
         lw0rG35nHo84F4tgfktlAJc5BJjOsZgV8dJJlvqQSZgLy8kJ7rKANYy6VTNYJCWMgEwH
         7xldgsRubfAoV+fSzq0X2QTYJON8hr8AYFeIgath2Cf8yR0dTANweJu57tlTUShyhIpw
         3Dki6qcnBLMywUzDe7+U7i8aGK0Kc0mHuOzRY1qNv+CNSWxjLeabFgKVBcvGfKxTJU7W
         cxcAYFESKD46JSDQvnoIWB0Z1Uh7SM3ICGUGb5KmHDjO2JEBd9R6X56iFeVSgc85kRR8
         pzrA==
X-Gm-Message-State: AOAM531musz9z3pl3oBlWpZJxgZjj0w657ktiELrH6gwE8ne4tCsEimV
        +6RMHQCmlgDS1r1sUtFmMzgLgYwtpGI=
X-Google-Smtp-Source: ABdhPJwxZd5OKOFCfzdN5THixhJIOUQljAUuFfJBmIWkACqNW8fk7frok9BvJUtCzHC7pWUyx7mB9A==
X-Received: by 2002:a7b:c24b:: with SMTP id b11mr4222312wmj.109.1605619692243;
        Tue, 17 Nov 2020 05:28:12 -0800 (PST)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id r8sm27375773wrq.14.2020.11.17.05.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 05:28:10 -0800 (PST)
Date:   Tue, 17 Nov 2020 14:28:09 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     kernel test robot <lkp@intel.com>
Cc:     Tiezhu Yang <yangtiezhu@loongson.cn>, kbuild-all@lists.01.org,
        linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH] phy: fix ptr_ret.cocci warnings
Message-ID: <20201117132809.GA2589875@ulmo>
References: <202011170710.Dsd9lxrR-lkp@intel.com>
 <20201116230032.GA34534@8312513de428>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ReaqsoxgOBHFXBhH"
Content-Disposition: inline
In-Reply-To: <20201116230032.GA34534@8312513de428>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2020 at 07:00:32AM +0800, kernel test robot wrote:
> From: kernel test robot <lkp@intel.com>
>=20
> drivers/phy/tegra/phy-tegra194-p2u.c:95:1-3: WARNING: PTR_ERR_OR_ZERO can=
 be used
>=20
>=20
>  Use PTR_ERR_OR_ZERO rather than if(IS_ERR(...)) + PTR_ERR
>=20
> Generated by: scripts/coccinelle/api/ptr_ret.cocci
>=20
> Fixes: 133552bf03ed ("phy: Remove CONFIG_ARCH_* check for related subdir =
in Makefile")
> CC: Tiezhu Yang <yangtiezhu@loongson.cn>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: kernel test robot <lkp@intel.com>
> ---
>=20
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   09162bc32c880a791c6c0668ce0745cf7958f576
> commit: 133552bf03edbe3892767a4b64c56e3bed746374 phy: Remove CONFIG_ARCH_=
* check for related subdir in Makefile
>=20
>  phy-tegra194-p2u.c |    5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

A similar patch was recently sent out against the pci-tegra driver. That
was perhaps the third time or so that it happened and both the Bjorn
(the PCI maintainer) and I have agreed multiple times in the past that
this isn't an actual improvement.

There are two reasons why I think this is actually worse than the
original: 1) this doesn't look like regular error handling and therefore
becomes more difficult to read and 2) if we ever need to add code
between the devm_of_phy_provider_register() and the final successful
return, we need to go and effectively revert this patch again.

I wonder if there's enough consensus that PTR_ERR_OR_ZERO() is really
that useful.

Thierry

>=20
> --- a/drivers/phy/tegra/phy-tegra194-p2u.c
> +++ b/drivers/phy/tegra/phy-tegra194-p2u.c
> @@ -92,10 +92,7 @@ static int tegra_p2u_probe(struct platfo
>  	phy_set_drvdata(generic_phy, phy);
> =20
>  	phy_provider =3D devm_of_phy_provider_register(dev, of_phy_simple_xlate=
);
> -	if (IS_ERR(phy_provider))
> -		return PTR_ERR(phy_provider);
> -
> -	return 0;
> +	return PTR_ERR_OR_ZERO(phy_provider);
>  }
> =20
>  static const struct of_device_id tegra_p2u_id_table[] =3D {

--ReaqsoxgOBHFXBhH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+zz+YACgkQ3SOs138+
s6H3qA//T55kxtKknEYR7KaVhn2x64lQhioo/LzvB8cgfUaUNm6MC4jCRLLKWjAD
V0T2XG3qn50sZBZVqbhKJ4T0ULQGB1GHUJquUBhh/VPIQTsJXt3pI7kqLJU5n8oQ
D8KQJQAWMPuPr3vbsTnMxM7YAzDB+FCZjazVByZ/T0wEhdCZqHYT6XkJ4nhA79cN
LV9GnpxDKsHHjEae50TT7VVvvhaTmlOT30wVLpYqqrAu+kY7as6KbxgsSgpEbJz7
/OH8PHVvvsHs8Lmz8kVP1mbZmQxeZeyf422btsA9sANdxXHyUS/hUK93tAD7h3dN
lqrRCG1tDK9NUR9u5/fIdLIIhjahrzmtPsGGDDDF9+Wz84SQ/0nK1ZhksIDYVm4X
g4BUtmoNlrdsr5yRAw5ke52qZbm3FANRpnkF/727duD8d+rXxf5TOurvhNqqJqre
Kk+OJ2Gy8BFNBbZFp+cLdYSrrudyFG8bfczafUjnxeSAlInWMpFjIT+eAV9h0sUU
KrZl5lrcVVN0+p0CGFCWwawsUcMrGDGxaJGIhz0iJ4EVEcSThPEEXABVezq9VTDE
3stXCZjQgVrMfDyxHcTKaXU09WFwOwQPdXANN++73ksp0WwPvzzDWwXdOqDGbjUc
VZi4wjF1SkyglN4DokQoL8OxojozJP1o2XDmJT91V2PUvRKPZEw=
=vWPq
-----END PGP SIGNATURE-----

--ReaqsoxgOBHFXBhH--
