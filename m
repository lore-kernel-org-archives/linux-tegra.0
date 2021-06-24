Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22C8FC49EA6
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Jun 2021 11:55:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EEEB6613D3
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Jun 2021 11:55:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229464AbhFXL53 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 24 Jun 2021 07:57:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbhFXL52 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Jun 2021 07:57:28 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AE4BC061574;
        Thu, 24 Jun 2021 04:55:08 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id o22so2822794wms.0;
        Thu, 24 Jun 2021 04:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ov87txLLPKBcVSaKi1tXGVFfU7Yw0MTcr3n1xBWv5QU=;
        b=PtO8mROf0cWz6vnK6i9B5TpXnvp5M/Glnnf+RIvxAjSrhBHd91nDZWudB5Rrgn0Q3t
         t2tg2p3xbDbuHtcJJ+UpDM+BpG/A+j2qubksSKuVaWN4wlIcg9eASAa/xgVYygbk7foF
         wOokKxv8UDH6yobCgoOLUa1MO/tcq9mTOiHF35wkAD2gPwKDMGft0Q1RM9hnQJAoVQQW
         o971B0v45Fpzn1FZVQ9JsudbrNvhqohrlt93eDXBf3w53w2F34bgZaaAPYlK65KF+qw1
         ukvqDwo5Kr2R527/mx9mHBxcYjf99Z0VEDv8BwfVUKVdQ1alMvmiY733wM2pknzV5UOe
         Ughg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ov87txLLPKBcVSaKi1tXGVFfU7Yw0MTcr3n1xBWv5QU=;
        b=gKwMwxddJgkp1hUieArOnlPtmDFuYFFztWooWRvpw6AuM0XvFiWosmQlUDpxq48otz
         q8usILrtqo97q4umJzbaDizGxQtPl+tLZ92lY/bOlm3RGfTDXWVtSMmhiAiwTnWXbyLO
         CvqwzyMUPn2OydiA0F04RLx1s4J6c6oOJcx2HqXCo2LLk2C0l0ilr/kjRM5aptooLKmn
         QXPCcb9i4opB/dcClf37D/iF1UHckPXWN5u4HrchxRsPguqRhbIgy+3PD5B78y1U8oWz
         Xpe+nryR0YQingyFTu+oebLyfIm+HlWRjcyRuxRwryBzABxkmYE/PmfeR049JLhozPzI
         ZHlg==
X-Gm-Message-State: AOAM532yF7G0xHp0Ow1WQAWslIafZg1HZoSe96YBglPFZY4FZ/HXzFCw
        PS7jlmv4x4WB1vItxOYlKr0=
X-Google-Smtp-Source: ABdhPJxdBizv6B7YqhY+iDAq7iSkUoLlcw/ptjvrNmPud8AjUfRC0q0VOrI+asgb3/NeSoTXwFttPA==
X-Received: by 2002:a1c:9ac6:: with SMTP id c189mr3817236wme.149.1624535706831;
        Thu, 24 Jun 2021 04:55:06 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id b5sm2662810wmj.7.2021.06.24.04.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 04:55:05 -0700 (PDT)
Date:   Thu, 24 Jun 2021 13:57:08 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Alexandru Ardelean <aardelean@deviqon.com>,
        mturquette@baylibre.com, sboyd@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, pdeschrijver@nvidia.com,
        pgaikwad@nvidia.com, jonathanh@nvidia.com
Subject: Re: [PATCH] clk: tegra: clk-tegra124-dfll-fcpu: don't use devm
 functions for regulator
Message-ID: <YNRzFOIKtUZfnsu7@orome.fritz.box>
References: <20210624084737.42336-1-aardelean@deviqon.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="22riLA28tUthpble"
Content-Disposition: inline
In-Reply-To: <20210624084737.42336-1-aardelean@deviqon.com>
User-Agent: Mutt/2.0.7 (481f3800) (2021-05-04)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--22riLA28tUthpble
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 24, 2021 at 11:47:37AM +0300, Alexandru Ardelean wrote:
> The purpose of the device-managed functions is to bind the life-time of an
> object to that of a parent device object.
>=20
> This is not the case for the 'vdd-cpu' regulator in this driver. A
> reference is obtained via devm_regulator_get() and immediately released
> with devm_regulator_put().
>=20
> In this case, the usage of devm_ functions is slightly excessive, as the
> un-managed versions of these functions is a little cleaner (and slightly
> more economical in terms of allocation).
>=20
> This change converts the devm_regulator_{get,put}() to
> regulator_{get,put}() in the get_alignment_from_regulator() function of
> this driver.
>=20
> Signed-off-by: Alexandru Ardelean <aardelean@deviqon.com>
> ---
>  drivers/clk/tegra/clk-tegra124-dfll-fcpu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Indeed, this seems unnecessary:

Reviewed-by: Thierry Reding <treding@nvidia.com>

Mike, Stephen: do you want to pick this up directly or would you prefer
if I collected this into a clk branch for the next cycle?

Thierry

--22riLA28tUthpble
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmDUcxEACgkQ3SOs138+
s6EqABAAiQkLJjAriym9y44MQS68pcuSdVQ8PiFo+v+2lQzGd9TyrtjtTEw1gGdf
6ogwZ1LF/Mep6JzgsekdsnMnRJ1ScyPDMbqc8qAn7euirWEXV+lLBL9yj8gKWx02
LS1pRzUhw/NAMzMZIDy65j/S4tkSmMXoeN8owAFqd2x/9uGirinRJFZ5ZdNPVnIn
WoC3KIUJ12UWYzLTAkaZMpMM83vA+0gDMCw5g2aJamopN3iKlsvimyFyC4uNVNI7
lyY1U26Q08wkSAVwA+zL5K9cwt6tx98sC8BYmqWdrTYV3V69UnUJRcH334az87ty
ssmLmozW35uP6Falfn1GODFGQh3LP4wK1ZjbHcgIGWIhwCih0JZq3pRnsuPEKbrU
wajq2BgqoaXISp0viJP4o2b5pHI6jNFxuw6//UfY58lSqasEwvXnY7Y/1dXF9QLY
hbY5vJZiUDNlXxa435aUny6jXgbN/E7vvAFna2ekd64LYjWHeEkXUYPu6mlZtHPr
oV6e9ETSpC0FP0zNuqWewiLnObJV2QmSWREHb6GkzMH/zLE8Sys0UVMlPBCf0ug9
/VzooyML8vbqINpUAeB26aYvMQMAm7Xep27QgGYUeFzbw2EPcqPDeODy8M5v7nea
pFnk+ml9Ii5DwFtxdZ1LJDOmaWjlpGpqU1iOCw8037nB0loxYeQ=
=LBAr
-----END PGP SIGNATURE-----

--22riLA28tUthpble--
