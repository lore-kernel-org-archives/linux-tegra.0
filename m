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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C8A1C4332E
	for <linux-tegra@archiver.kernel.org>; Wed, 27 Jan 2021 18:26:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D3EF964DAD
	for <linux-tegra@archiver.kernel.org>; Wed, 27 Jan 2021 18:26:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343904AbhA0S0k (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 27 Jan 2021 13:26:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235521AbhA0S0g (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 27 Jan 2021 13:26:36 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27723C0613D6;
        Wed, 27 Jan 2021 10:25:56 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id p15so2919793wrq.8;
        Wed, 27 Jan 2021 10:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wfbs4iSRg8iNP2G1dda5JNu43JBws/KvWqOZEbT6AgY=;
        b=Ss3zt9TmGWWBhKJXLZ4VqnPNnsO4bA0jalIGTxJlKoUyNVOWMO/fH1ULp/lY7V873i
         ttSjNrokCCdP/qyMkNuCo0sUgaygKF3UvNek8A4gXXQP/8XfoKmmN3N8mxu3HyNIHsCV
         DvPerdiOsD8df6n1g0FPtZuQQRSTZl+bS863yaLfCBuUnv1B98hlEuFme9ntHARwjMI9
         FW3prndU3fXkM+raBtU038E63B4Puu0F+gQfo+uBdsmozeTltJiRzr5gtg8c1l/etffU
         9qSxa9Rx655pHTlPmbsArv3sCQ940B2KLaifQCnfC5mr8lrprdvzTwK+Z27ILBRdFbII
         Ifug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wfbs4iSRg8iNP2G1dda5JNu43JBws/KvWqOZEbT6AgY=;
        b=DcWdcgqqWrPuWhlyrJ7J8ERNn2Q+C13EZVy60umPsImrb0P9YcT1WctR858HZtI2aa
         WSDXDo9cqJV8hNU/QvePwEzFmIRYHWaVGxT8Y+U1fZHKsebqDYTy6KFzkyKQcLrX9qaC
         y7sVdvVlQcKl3ujcGE5DoMUp95OBOGpUvBP4rd8h5/X0waVPaQUqD+10q5RDNpx69hCi
         2xIa0QNcccdiKhg/pg1rnx0XhPGgkQ1+HRnCv5u+Wzp/aeMs5bKMJcUUyru0h2bniiLS
         KNNK1OEnZDdbh8frV16MnLVuwUfl/ujxQ/egceZ7jAOTk+XMkOA1cgdObOPOTuhukQ9V
         m4KA==
X-Gm-Message-State: AOAM530URzFuGfO2GWWDxpM1nbd5SpVd1+8FZAlNvPSTwozhGZPNnAkK
        md+Mph4Xwvf70GEj1ZgPqQI=
X-Google-Smtp-Source: ABdhPJysdlcrICBH/5R6Tsek3qPHCrARsOj0GLqKCCCOjaWCfbgcfQMqHJQsbHxspcmnqsSRx+kmKg==
X-Received: by 2002:adf:e809:: with SMTP id o9mr12566014wrm.284.1611771954887;
        Wed, 27 Jan 2021 10:25:54 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id r15sm3947044wrq.1.2021.01.27.10.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 10:25:53 -0800 (PST)
Date:   Wed, 27 Jan 2021 19:25:52 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Peter De Schrijver <pdeschrijver@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH] clk: tegra: clk-dfll: Verify regulator vsel values are
 valid
Message-ID: <YBGwMBxNeSlaPjuB@ulmo>
References: <20210127171121.322765-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="a3kHhsQD0TXk8T9m"
Content-Disposition: inline
In-Reply-To: <20210127171121.322765-1-jonathanh@nvidia.com>
User-Agent: Mutt/2.0.4 (26f41dd1) (2020-12-30)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--a3kHhsQD0TXk8T9m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 27, 2021 at 05:11:21PM +0000, Jon Hunter wrote:
> The regulator function, regulator_list_hardware_vsel(), may return an
> negative error code on failure. The Tegra DFLL driver does not check to
> see if the value returned by this function is an error. Fix this by
> updating the DFLL driver to check if the value returned by
> regulator_list_hardware_vsel() is an error and if an error does occur
> propagate the error.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/clk/tegra/clk-dfll.c | 32 ++++++++++++++++++++++++--------
>  1 file changed, 24 insertions(+), 8 deletions(-)

Does this fix any particular issue? Do we want a Fixes: line for this?

In either case, this looks like a correct fix, so:

Acked-by: Thierry Reding <treding@nvidia.com>

--a3kHhsQD0TXk8T9m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmARsCsACgkQ3SOs138+
s6Hl6A/9HEReh3EC/W3+8MmQYbcv9KjB/26uw7UBVhax94bmYhE2U8SgVRGWOn5x
dIMS2+S6lepElU4N/dwh59EuUWLLRfwJIcexIs78qu7+XF6TifDsDjPo5bLDZJ0b
i71rutvumG3MibvE4u+WSmDXU4Zl8YgCqE0FlfcPXEqZliCLc6Rwk1hMTB6ibgHX
OXkTFvatFt41dBkP+Oly5sXrjwbfBVkV/Nrlg52pFkru7Lin6AXPXG+hc5JU7MvM
X5aq8E79AtldFp1PpqM8GfW8bymoXYzmRgFUOzCEKrRFVtbZT6Zkd9NafWn4yimn
CswQc81FcxI/A0KKdq0n7J3V8KnVD6RcVr2KxNEP6NPgzHwApjpNsNHkiu+jOAlq
lW03mINIK+/MCMTgEhHurJ/Zx+qNhtxmJ9GqqtBzXODWdqlrfT+V7JEcmHP2FnBK
3AfwENL52TDG10h2vrLbmaQaoNqt8ebNSRIFeQuSYUeb2/GJuCeaQkVR/YwF171V
dM5UvSTy74gW6kmgykErjxFCHXfCobAU4CxZCeAbomNHJ/ukDiyuTOOaU2Z52mqm
YT87twe3P7SJgtvhkUyH1kl00TbTVYelS+egmYidYlQZl57ypIzF49QvlrW8SOGk
CVZkncWjLNtsv2PQXJmY0vQrm03A2hyx9l4yhxYlopN0a035xQo=
=kRcF
-----END PGP SIGNATURE-----

--a3kHhsQD0TXk8T9m--
