Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76798C433FE
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Oct 2021 17:54:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 611FC61263
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Oct 2021 17:54:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243332AbhJGR4M (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 7 Oct 2021 13:56:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243210AbhJGR4K (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 7 Oct 2021 13:56:10 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE11FC061570;
        Thu,  7 Oct 2021 10:54:16 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id t2so21562517wrb.8;
        Thu, 07 Oct 2021 10:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=y0CnQd2HCIxGAJu3+t3GupP9Sx380Ne/syaD1dzuvr0=;
        b=BGUOhQJ0M3dyYmGPUE4jPyxdtkzpWEtLckZJfG/gzBRu7iY+tMBs/eKLTgZAPiunf/
         HD91DbCkdwXJnd7l9eu4onuQBPaSqTbZ3M/WJNxWHJqOtMXzZvVBroYGMwdWJhd56olX
         wkwiZpvpkq+YYXXZ/gRLhZSa98kUUckG58MK2U5pIGWugB3HRDoUlm4J4yyLaTtifTmL
         pm6lgUJDIYX6ibIPtukK2Pg25IVgud7NhK3Eg3loi6yY/vboSwr2aDUk1JJLfOvGsqUv
         1bz9act6+x+KFD2FWUz+lJmA2/mQZut9UqAuuxym8RpbVCfnXbOwpPmqwxFUQlF8+QOD
         Rl5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=y0CnQd2HCIxGAJu3+t3GupP9Sx380Ne/syaD1dzuvr0=;
        b=qvgFk4rZN0Is5b7syAxY22ZPWBVpTjry58gPrvcUpujkqVSPn02fmsWnWlBvo/FJeq
         R+JhDHcYLfzYjXIMdO7UgkeRP7ZjbnI7l1ygLvW3BUg+q+BwvNE0OZ+i+WYXXpe2IMEr
         hSGYcoQSW4dC1qrs5zffYNBob0dEp9o5mFncqtjD9/yoJJzXffWKXyilInWCV52KQyiC
         ON+5fAvfHDjvLc58zU68wEFEBUo7WWRBO5qezRCCnAvw5kxBgV930tIZXddI5/H3fet1
         +MA5W6EW+SumB++TVdN29BtvCGK/r7CL7kxEIGhCAxZrjTZadOtyaCfw0mEGGbtKV1QV
         PNYA==
X-Gm-Message-State: AOAM530tCoXOKHV8dSA854vcFUof7q18Vx07XtXnYrzlqxW9UqmndEnZ
        k8tCXy39yef+6b3ywtmFQ+U=
X-Google-Smtp-Source: ABdhPJyroXUHPBqSTS5mhoiuCQCKq1FvUldCKxdU/9H5QDEAwDKlpb4ZS6fyrXkPbIxghAioBUti9Q==
X-Received: by 2002:a05:600c:4f4e:: with SMTP id m14mr17958228wmq.5.1633629255347;
        Thu, 07 Oct 2021 10:54:15 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id g12sm10009547wme.3.2021.10.07.10.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 10:54:14 -0700 (PDT)
Date:   Thu, 7 Oct 2021 19:54:13 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Kai Song <songkai01@inspur.com>
Cc:     krzysztof.kozlowski@canonical.com, jonathanh@nvidia.com,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] memory: tegra210-emc: replace DEFINE_SIMPLE_ATTRIBUTE
 with
Message-ID: <YV80RYFinoLoCbsT@orome.fritz.box>
References: <20211005043514.9650-1-songkai01@inspur.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="uZhdcJpppN1F+5Uq"
Content-Disposition: inline
In-Reply-To: <20211005043514.9650-1-songkai01@inspur.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--uZhdcJpppN1F+5Uq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 05, 2021 at 12:35:14PM +0800, Kai Song wrote:
> fix debugfs_simple_attr.cocci warning:
> drivers/memory/tegra/tegra210-emc-core.c:1665:0-23: WARNING:tegra210_emc_=
debug_min_rate_fops=20
> should be defined with DEFINE_DEBUGFS_ATTRIBUTE
>=20
> Fixes: 6fc5f1adf5a1 ("memory: tegra210-emc: replace DEFINE_SIMPLE_ATTRIBU=
TE=20
> with DEFINE_DEBUGFS_ATTRIBUTE"):It reports the same warning, but didn't=
=20
> fix all matches in this file at once.
>=20
> Signed-off-by: Kai Song <songkai01@inspur.com>
> ---
>  drivers/memory/tegra/tegra210-emc-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--uZhdcJpppN1F+5Uq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmFfNEUACgkQ3SOs138+
s6Et7hAAwNmWXwpszQDVIHvcN47mS0I2hF1lzFw6WmTFno9uTLWIwivYov/QyZhC
ULKrZ+9nbXclBpFXnqFEeupTF1/Z0WO9lYVKLBq1JeWNUX81k8yMwXS1ZLrhoACl
nUnVqzr6Nl7hDFKx+NB3Rq4zZNjuvz7vpVSVMnrj7RQpG3uQfzpe4dPvGfVnBSm+
Mevc6eOG012CGErz3fZ5ori/z8jC6VCJdlB/0x9YimIQphrDZIhLvTlafsORClNJ
LZBTOXv5tF/n6oMPkW0FD82Du/tQMFKaN26JoWWBv0IeNsR17t3qDcA28qpJYeOP
bGVjuMQXFsx2KFoZHUZv8/vV1cYit2C91oawW3aJ9IeOHbIIQTVbbuSzDXtV/3Xx
oSrycs/Lh477DhK8s5uCeL3Em/qXhtfZDVadxz5A/KpOlh7f5tOpcprFCHZYeiOT
G9Z4WHrUI1ZvZa41xqpGZCGCd2tWs3Y9triWQeEeqDkND+hN4qBw+UY1+sR9ENJe
sbG84GiRhAHmeM0G2u9ry3WHKTCOgsuX7C0vm9wwxVF8pZy611fmYyOsA80/a4bn
PQ6LtWm7bc9ZNPSHi8T96f3giKCIhgBFIPzfEgcBnEBpCQp3dhJkOCVuR/LMzn0N
wMqYThWVqXURAGaFE0FLUfkLhZkQsNuHsWq+V3paYEhCtU38KrI=
=00PI
-----END PGP SIGNATURE-----

--uZhdcJpppN1F+5Uq--
