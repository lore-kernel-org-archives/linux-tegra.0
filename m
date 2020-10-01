Return-Path: <SRS0=WsFM=DI=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9C34C4727C
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Oct 2020 08:00:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 692572176B
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Oct 2020 08:00:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mEWWAXxy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731541AbgJAIAD (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 1 Oct 2020 04:00:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731539AbgJAIAD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 1 Oct 2020 04:00:03 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4182C0613D0;
        Thu,  1 Oct 2020 01:00:02 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id c8so4633413edv.5;
        Thu, 01 Oct 2020 01:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kJDll8669MgwGkGlatIF8vY03H/D/9DxkpS4HR8psz0=;
        b=mEWWAXxyBizecMRZilDRasV4hyuAjJCc3TEa7CNG5P+0EUX0/qpkD0U0sDer0i/frK
         58ijdsTThYNUFvgAhSJnI4I8I92FrBQodvuOHLJGtDna6DrLRp0089kJSXTGVEJ5+ob4
         yyaTlpOXHNvU5+dQEhWbjdjhdO5zE/3AeJjEouHsL91WqdFDxb0tDBKGw3qGNVVblWri
         6aytBAy065XQfrdtAteH1cDyx9Et2wbSl2MAMGZJKD/6RR4ELMO/5k512H1Zmd/4S2Xf
         WUIR3uhFwfSEFWmNMSVauf0uNqvXgwKx0CzSsB3vaqAwaFNaYKfJqJB063cCba23kZnK
         7dig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kJDll8669MgwGkGlatIF8vY03H/D/9DxkpS4HR8psz0=;
        b=lBcuo5pi8x1YMZw4XJncP2PzceC48YENzz60WCBnROTo/uZi/lgEBfnlcxDrrLZgB1
         k9BnlKyX21RIFoQkvblNcaS8CGzpdUYvKz5H1G7vCnLa1sQYmHk0CmIsUEQ6k0gcaf7p
         9yHC/X+T3HEoucI4NS4FIdqVCB4E2ESm9UAmSl6g4FaYkW8jXsSeGFXXGzJrWAyUObuJ
         G7qIdx/dcmGhzwuzgdLWP1gNUFVn/PLRWZsNRIivDuZ730Gm9E8OCvz9XGF8xsx1j1Rg
         jtL1S17BvzzAwSC5RML3HdDFebQ8vZVFreZEFzrhqpJEeT6upEtbB51zk/SsYRPcKoNa
         dxww==
X-Gm-Message-State: AOAM531VFAfbECIwTQs8vMEEdWfLnSC5iCSbE8Jzt9PsuL12N5HMt+QH
        Jjh3rAH9wAWdD+jDI+rdFAM=
X-Google-Smtp-Source: ABdhPJzhr4TJ1Eipm/gKkHKCZgtc6Id22KJDdtB+FTrQfwP5iA5E8tm55OszIG11/sEletKyVEZS7w==
X-Received: by 2002:aa7:c1c3:: with SMTP id d3mr6962876edp.228.1601539201381;
        Thu, 01 Oct 2020 01:00:01 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id t18sm1230119ejg.76.2020.10.01.00.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 01:00:00 -0700 (PDT)
Date:   Thu, 1 Oct 2020 09:59:58 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Nicolin Chen <nicoleotsuka@gmail.com>, joro@8bytes.org,
        krzk@kernel.org, vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] iommu/tegra-smmu: Rework .probe_device and
 .attach_dev
Message-ID: <20201001075958.GB3919720@ulmo>
References: <20200930084258.25493-1-nicoleotsuka@gmail.com>
 <20200930084258.25493-3-nicoleotsuka@gmail.com>
 <20200930153131.GB3833404@ulmo>
 <ece615ad-8d6b-96ae-d8b4-9667aef17281@gmail.com>
 <20200930161033.GE3833404@ulmo>
 <36946786-38c5-54d4-07f5-2407c39aa01c@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Y7xTucakfITjPcLV"
Content-Disposition: inline
In-Reply-To: <36946786-38c5-54d4-07f5-2407c39aa01c@gmail.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--Y7xTucakfITjPcLV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2020 at 07:29:12PM +0300, Dmitry Osipenko wrote:
> ...
> >> Secondly, I'm already about to use the new tegra_get_memory_controller=
()
> >> API for all the T20/30/124/210 EMC and devfreq drivers.
> >=20
> > Also, this really proves the point I was trying to make about how this
> > is going to proliferate...
>=20
> Sorry, I'm probably totally missing yours point.. "what" exactly will
> proliferate?

Making use of this lookup-by-compatible mechanism. If you provide a
function to make that easy, then people are going to use it, without
even thinking about whether or not it is a good idea.

Thierry

--Y7xTucakfITjPcLV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl91jH4ACgkQ3SOs138+
s6HvIQ/+JbyTifAB7AT15uE5vSsP5C4aDS4Zf+b3yMzEClBY7F2gR7gZNz0tKeJ5
3j2SNVw4pxFJiyxSIHP+YCwCmVEOoEBOuDhARo76U1nWKNSMlIxXFyi/xOso1OaG
HNhILPmvmk4Y41LQ96VzKpHtf4NvafW4oQ244t1E15ZlT2nR5+OQzFKN6xDYhujR
LkXGrv5EdRYL9QkAoZ/cTxfb1hsqmviebkVXWJTBPS2cErsg+HtVRXChFLAlZgNL
RXVMivkZ7FdCHqMSpaypAaUDGKLWI16DjPu1woUeXjHh9CjbL+YRa5eC78YgLye9
B5uXXzLBCE8SrxR7xjTSnDd+ZBAKQ2Z7N+cz1EzbxBI79bZ9lFqwONt1Cjr3+3pW
Im1mGMr0hjveQK4JPdgT4bGyLKXKf7Jfau5bTLTI+UxZyHXCUfqsuP+yU0aHNRiP
dp9X8+rMuapK+jG9NKEXj0a/qgLvr3DXV5pN2cCjFHBM7MRHO+oPsAE22rd8gkaP
EsNbJ9o5Fpxn2nqyKX5GOzzpyPmhaPM+xLoKVl+YYJdaueMvAw5wGq+sZsdbrT5n
KqLTZicexxYUhofOLI0hZJJikHWY4y0UB9IbJDOuhrit61cD57UqGtvPmfIcT4gP
2rO0fNqtBsHuXrWhjk4fqQL9PATsQLENdxB0TMX+0zIVyfJTuTA=
=wRou
-----END PGP SIGNATURE-----

--Y7xTucakfITjPcLV--
