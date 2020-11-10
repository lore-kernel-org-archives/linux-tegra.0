Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 383F8C388F7
	for <linux-tegra@archiver.kernel.org>; Tue, 10 Nov 2020 19:39:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B5E0F20781
	for <linux-tegra@archiver.kernel.org>; Tue, 10 Nov 2020 19:39:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ws9vEe1p"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726467AbgKJTjU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 10 Nov 2020 14:39:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726307AbgKJTjU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 10 Nov 2020 14:39:20 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2669C0613D1;
        Tue, 10 Nov 2020 11:39:19 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id p8so13225985wrx.5;
        Tue, 10 Nov 2020 11:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5J5uwu3m7GcHarRgVyJ/Oom4GJKz9eUsOShnoN96sOA=;
        b=Ws9vEe1pav/1QAaDxARWbnFxJb4bkcQ6VixB2a1JX3NhYf3y2/BOJxTwZkip9cbUln
         yiQAi8PrtjC3eKW0dxms1L319RYr/Fv1u3v0TLGfetPGSj8XfU/WbtUGN55OUtFMIZwN
         doIGJAzNEPdhCx485szJseRMRiCOc+fs0SKN7iqpzn0TrLKVBVDBbixeXMVlH3NA6+bb
         5xYufwR2aAfzPySItgb732M+uNwoSfFF6f9Yx47jdyWrrMOfgSCIGmujnUPAzWs83VGI
         P5n6lco7+RkMMlNY4JOWf35UiwmeYhbblB7OECSX0sBRVHfte86tQ6XX32+8Nyb5hy6l
         VNpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5J5uwu3m7GcHarRgVyJ/Oom4GJKz9eUsOShnoN96sOA=;
        b=SqObCSSh2YBeKv4QJsMCGiPsYQKlaOxBLVflMWpvhWXcg+dZPUqhIqafbnK1rnvJvK
         fB/JXczTGuqf+oZlodAsaCy/LLWS5DHW80H5mvUDWSRunhwKG0AX4hMcN7kdls6rNF59
         sd4OJrL10PQngqWtMn4iuIjYejO+CHHFOLiELdu++ggRPLyKGMjF8XZ+ygYz1HhOdacs
         OOfxM7Bc+v4dUtPVAL6U4aYZmoeaoW3VDHm7dz9YADNYp5A3UqnMM0MjT15iPaX7MDHR
         KI+jpE8qeN8gaZu6/JpHtZ/orTAERFiJ5iBR+bnRLECK+eogkxDM1k2jJEmRr1ceLgrA
         n8lQ==
X-Gm-Message-State: AOAM531U7NKuOEoD+yqk+M/q2MzT7+riTLlOMcjq/xKV2OTFWhisO90n
        AinJ7Kfr8LKH204A+rMiIS8=
X-Google-Smtp-Source: ABdhPJxi9RfDjVoCqexR48y0z3UEQn7ohhiDzBSL1Zo4eBf0BeryLvHjraIWu1JFlKOJZcamnV27+Q==
X-Received: by 2002:a5d:50d1:: with SMTP id f17mr22801048wrt.264.1605037158703;
        Tue, 10 Nov 2020 11:39:18 -0800 (PST)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id g17sm18260050wrw.37.2020.11.10.11.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 11:39:17 -0800 (PST)
Date:   Tue, 10 Nov 2020 20:39:16 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 13/25] soc: tegra: fuse: speedo-tegra124: Remove some set
 but unused variables
Message-ID: <20201110193916.GA2375022@ulmo>
References: <20201103152838.1290217-1-lee.jones@linaro.org>
 <20201103152838.1290217-14-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Content-Disposition: inline
In-Reply-To: <20201103152838.1290217-14-lee.jones@linaro.org>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 03, 2020 at 03:28:26PM +0000, Lee Jones wrote:
> Fixes the following W=3D1 kernel build warning(s):
>=20
>  drivers/soc/tegra/fuse/speedo-tegra124.c: In function =E2=80=98tegra124_=
init_speedo_data=E2=80=99:
>  drivers/soc/tegra/fuse/speedo-tegra124.c:105:38: warning: variable =E2=
=80=98soc_iddq_value=E2=80=99 set but not used [-Wunused-but-set-variable]
>  drivers/soc/tegra/fuse/speedo-tegra124.c:105:22: warning: variable =E2=
=80=98gpu_iddq_value=E2=80=99 set but not used [-Wunused-but-set-variable]
>  drivers/soc/tegra/fuse/speedo-tegra124.c:105:6: warning: variable =E2=80=
=98cpu_iddq_value=E2=80=99 set but not used [-Wunused-but-set-variable]
>=20
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: linux-tegra@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/soc/tegra/fuse/speedo-tegra124.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

Applied and cleaned up a bit more since moste of these register reads
are completely unnecessary.

Thanks,
Thierry

--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+q7GQACgkQ3SOs138+
s6GtJA//WSsmtdFCLCKnbOCIv0/CXzBrCr6hjeBx1h68CH1/QPPmJ0crgMxSMTfd
gnQpeENCI/p1CB0o4Y4HFhtm55QEIuHwAFJENzCGLLJEeB4gpxGo+MRxgt606h7N
3C1jRI1n6eFl+f/P9i3oxDViQNjgGo4bN+OPltQgTPRmXEhZe9BocWHpoYFnMnAB
sual83j6HzerZJaDnV2WMRoM1L5f3L0BdxTKDJvO4k1Z94fLoPtU6qD3J98Wf/Ie
BX3WOxnDqa9cwikOUFcgrMxxfo2kOWbxrIdrnzjFTlUIUjAxjyCz2sGdTxfsxBqW
AYpl9kZyPqdnqz8ZOPxCaEc+mBBClGe6XhHv5FIIC/v9UDeaP/y8G6rOZCPdO/wy
j61VksBRIL9xgFNeSPPBTnkLTTRvVn5ns5Bm9OjrauUVa9QwN7J/gAmcoG4cBETv
ngFaTZhAOaNY2ATmvTpub1DOOI/BcEr0HaugMPG3kvFwDqLJtVnA/5kJ/CZlicwT
sH2A5lCdM45spnIoUqQRq52PYtYYIqI6B2+9EZ/7AkNSNRq/ehdykEgnJ/m4zhiv
3aS9vCfRG5dnw5cEX8p4CkqVlNmUBHgWXaMWtebUyhUpqAgScf1nlZ1+IFzia90g
PKUdJFvRSPi9qrIH6714IAH/HH3UC5Lb/pIVxrRpzFDjrNYhdpE=
=05XB
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--
