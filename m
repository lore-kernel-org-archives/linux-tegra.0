Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28E59C433DB
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 12:44:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DF172619B4
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 12:44:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229935AbhCZMoT (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 26 Mar 2021 08:44:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229779AbhCZMoC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Mar 2021 08:44:02 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0118CC0613AA;
        Fri, 26 Mar 2021 05:44:02 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id u9so8194313ejj.7;
        Fri, 26 Mar 2021 05:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zHs2rz0P64Y16pZ4KFsK15GuVu5q4UHDRiwzGtDX5Xk=;
        b=KEQHQzWz9TsC0TbmvPwkTSOndS4w/COOp9yZlcU36HPaJG6Ki6q4WIaH4qDYd/Mmf2
         xK2wT4QwPluTs+YCrvQlTEmuH4g2363RiJ6g8SQGu/t7d+lbcXbDHD0zDVWRoKdgueOb
         Iz2rF7NCdreolUAmmhX/AK2JU/HtM5suN5mG7cJHSlp4DjvfGGy0xqPoHa3oAXvEsodV
         K0A6hg37Y47Ir1A6kaYH7aTnSB06SaXc4A1v8ii4OE+MOZVM0jJ1x1fqURQA5vQ4RzUa
         Z7N7URJLvDENDNFDjOyS9AqpUepCj1AZgDg68R4u8paXTH0x0O130dfYVPt/fR90/KH1
         5V3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zHs2rz0P64Y16pZ4KFsK15GuVu5q4UHDRiwzGtDX5Xk=;
        b=PB1BffyK4P7NZezb5zcKCkG4t3WFjGMxc+NtpVu7l02qzxV1FUGFUNj1dj52BEEzTV
         T/SmyeIZmeFcb9GD5yQYjN6nDRm6Kc+VCQ30VZB/MuXbZ3kkdnWi+CPS0NsScDD1M8oJ
         Yz87O6dcgpTk5Mp+JefMTD8rWPhvWKaHF1tSgXc7lfmPaVER5AkHLrrn0N+7GeqSORhm
         8IYuw8eZSm2KmVq0DX6nflrET5R3FsYaVKL01KKOmRvBFdPEm5Q2FqwUb22kbiycuYtl
         bkAWvh16KdjZeKzu7Dhtt02O1bGAb1A/HBtKOvqf5bez/sioFp4s5NL1oxTAAahN1h2m
         ZhbQ==
X-Gm-Message-State: AOAM530izpB9x3IrlHIO/1hjRtQFMeTabYvhSoKIVgWLNEOs93tw8C80
        xRZFyI0QQFHte427r63qTz8=
X-Google-Smtp-Source: ABdhPJwEO9FcXpyM3blf4SD+DstxaqueR87M3PPzgmo5NhiszndF0ytGwkHBhmXsdrYBwNpI/sO7Sg==
X-Received: by 2002:a17:906:4055:: with SMTP id y21mr14904860ejj.507.1616762640686;
        Fri, 26 Mar 2021 05:44:00 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id gj26sm3752684ejb.67.2021.03.26.05.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 05:43:59 -0700 (PDT)
Date:   Fri, 26 Mar 2021 13:44:21 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        JC Kuo <jckuo@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH v8 09/13] phy: tegra: xusb: Add wake/sleepwalk for
 Tegra210
Message-ID: <YF3XJVD5PfGKxfxn@orome.fritz.box>
References: <20210325164057.793954-1-thierry.reding@gmail.com>
 <20210325164057.793954-10-thierry.reding@gmail.com>
 <20210325202616.xgjkdg7zev6apofe@archlinux-ax161>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="HPPmyzACOAwF/C+y"
Content-Disposition: inline
In-Reply-To: <20210325202616.xgjkdg7zev6apofe@archlinux-ax161>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--HPPmyzACOAwF/C+y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 25, 2021 at 01:26:16PM -0700, Nathan Chancellor wrote:
> On Thu, Mar 25, 2021 at 05:40:53PM +0100, Thierry Reding wrote:
[...]
> > @@ -2306,6 +3150,26 @@ tegra210_xusb_padctl_probe(struct device *dev,
> >  	if (err < 0)
> >  		return ERR_PTR(err);
> > =20
> > +	np =3D of_parse_phandle(dev->of_node, "nvidia,pmc", 0);
> > +	if (!np) {
> > +		dev_warn(dev, "nvidia,pmc property is missing\n");
> > +		goto out;
> > +	}
> > +
> > +	pdev =3D of_find_device_by_node(np);
> > +	if (!pdev) {
> > +		dev_warn(dev, "PMC device is not available\n");
> > +		goto out;
> > +	}
> > +
> > +	if (!device_is_bound(&pdev->dev))
>=20
> This breaks arm64 allmodconfig:
>=20
> ERROR: modpost: "device_is_bound" [drivers/phy/tegra/phy-tegra-xusb.ko] u=
ndefined!
>=20
> https://github.com/ClangBuiltLinux/continuous-integration2/runs/219610189=
2?check_suite_focus=3Dtrue

Good catch. I replaced this with:

	if (!platform_get_drvdata(pdev))

which will work fine and is equivalent, at least in this particular
case.

Thanks,
Thierry

--HPPmyzACOAwF/C+y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBd1yUACgkQ3SOs138+
s6HLmhAAg6VGGfAUPFpswBOLFB6vY4Imt5wexLqOOm2CVgQjoVAt25YGeBNljtdZ
bSduOlYIT+QG9IrKj4zSCjE6RI3y3i/SggxS4Xob7ecbHh3ZRpDeGIcrJY6+XHqd
Eh2yu3NElQWSI6e6yADhr5wjrma6bB7jA9OfXU5VdUZn/OvQnia3Z0d1CWh5eOKj
XhtJzeuVELoTwi/Z1STdTjXT9Rcw7ttaYCyI/Pu4rrE7u3Vcwmu/N2pDf+CjRlkP
WcZwEFg3WnqpG+zxBYgPsDvEcicJcmkre4ssDGhIztMcIyVmUpGHUlV5pgknskBQ
u1Mmbu7zdYJsyFdQ3PnoOInpjn0adIp/kMrpToVDULHD8UbploTho/qa2J7XaCoz
EFkXiTJnzNWLNkWBsD+SwqJ2joLLvbopTh5vfW7mWaDxGN/gwLVNNR/ueSuuWUeI
wDmwygansqDJ5A7z1eaHi9MHrBTxxwWR4HpCzEd/nH0v/twBVj+Uyhfvm2ZCvzT9
rWwrAg7bS6d5yQCQPEqVaS23PS4AVP0ddaXf489KdNYwMcCrWEQPlcByEg84APhY
OtzEb6pxI25jpm7XWZPVAOp8XpBT4Xl8iPx0DGSWv1YZXXm+riSa+RVMsJp8KsAU
mGsd/PLWctV+cZjMO8BBZx+kCjTZA2vqZEQva8h2O0vERObkYUE=
=zpPK
-----END PGP SIGNATURE-----

--HPPmyzACOAwF/C+y--
