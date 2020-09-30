Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49A5CC4727C
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 15:23:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 014A52071E
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 15:23:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HoIndwf/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729350AbgI3PXi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 11:23:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730892AbgI3PX0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 11:23:26 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 968FFC061755;
        Wed, 30 Sep 2020 08:23:24 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id g4so2318499edk.0;
        Wed, 30 Sep 2020 08:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2DHtrnIA8o4CB8S35Hwhaekafbny6oX0rWN4GwHpG0A=;
        b=HoIndwf/0dNx+FTzfoWU6WcSIuggJG/fuUnDvzeRU9NjlbJort3dAOW2CONbMSx6Hh
         yNmqpwApaXgnBrAkCat0e3fgeeghUAmf8YiBP7ZB3rX1b7Yzqy9444oWNkuaD7f+hfXa
         bI1vZKgbsthsKOFTu0WHNntubi8rJuqIFyr7J/xZ1YB4nhxb0HaoxQ5J4oZJ/uXqPNpH
         uDL5+DcrBofdhYBh+0WrIPpNp/3zomm6af1b1S2Wv99Ngz9ejbyhfjthhikzxetMlzyL
         +ADe2stFy+78pSV/L3yjsbvT4FqzR1jBiQmTyUE5xTYjl+GVljCJ6DvnvF5NfiLU7SkN
         mPNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2DHtrnIA8o4CB8S35Hwhaekafbny6oX0rWN4GwHpG0A=;
        b=IjMVR4MonaSvv/XMosycONYG9b7hWk4k39z7DteuSP6uiWzk1WbmWJ77pazbI0MB+L
         VNDUQo4mxQrBwzjiFRVJJA4qMz/lM7T+oMlPlvdg5yF2htNkF51awQ5qCd5ppO2sm3UT
         J2uSCIeUhqWkAVql5jQH9BZOcp/XST/3DbJOXGb+Z81hClQCt5iqxY+M+FH54eIrinRd
         uMtkHOMsCtLqIjtX0h4kOzauKTDSceHBidulL6/AoIVZy3ITzJ7GhouNtHopVqD8H8M5
         yu6x8xobthGNjrslrPzs3ZdOwVCocSh9Lpuo7D2tIV2EzgYSAyUPsljxRZFPsWsWISMr
         9+wQ==
X-Gm-Message-State: AOAM531OBne7FxSKKQ73sqd3/zpafjs8kSQWu+LayQoJHP4Msy5qozNo
        M0ynimfgC+KuIkxh/9A2eKc=
X-Google-Smtp-Source: ABdhPJySzwiEk88jyPnNbBg/HN8xcT9495DFNaDdUb7a/cLuHdBMGxr6hBjQ1M/WGZlXYGNrO7cy2g==
X-Received: by 2002:a50:dec9:: with SMTP id d9mr3328095edl.145.1601479403296;
        Wed, 30 Sep 2020 08:23:23 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id z17sm1819511edi.90.2020.09.30.08.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 08:23:21 -0700 (PDT)
Date:   Wed, 30 Sep 2020 17:23:20 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     joro@8bytes.org, krzk@kernel.org, digetx@gmail.com,
        vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] memory: tegra: Add
 devm_tegra_get_memory_controller()
Message-ID: <20200930152320.GA3833404@ulmo>
References: <20200930084258.25493-1-nicoleotsuka@gmail.com>
 <20200930084258.25493-2-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="/9DWx/yDrRhgMJTb"
Content-Disposition: inline
In-Reply-To: <20200930084258.25493-2-nicoleotsuka@gmail.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--/9DWx/yDrRhgMJTb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2020 at 01:42:56AM -0700, Nicolin Chen wrote:
> From: Dmitry Osipenko <digetx@gmail.com>
>=20
> Multiple Tegra drivers need to retrieve Memory Controller and hence there
> is quite some duplication of the retrieval code among the drivers. Let's
> add a new common helper for the retrieval of the MC.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
>=20
> Changelog
> v2->v3:
>  * Replaced with Dimtry's devm_tegra_get_memory_controller()
> v1->v2:
>  * N/A
>=20
>  drivers/memory/tegra/mc.c | 39 +++++++++++++++++++++++++++++++++++++++
>  include/soc/tegra/mc.h    | 17 +++++++++++++++++
>  2 files changed, 56 insertions(+)

Let's not add this helper, please. If a device needs a reference to the
memory controller, it should have a phandle to the memory controller in
device tree so that it can be looked up explicitly.

Adding this helper is officially sanctioning that it's okay not to have
that reference and that's a bad idea.

Thierry

--/9DWx/yDrRhgMJTb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl90ouUACgkQ3SOs138+
s6G0NA/+JtP7HDf54k4WLttD9PHeHmArpo9ZQ9Cih4NUP5xCKMD3bmzowtvSTGJ8
xPvIdl9O855MlxNNauh+7cXg3nDvn85BUCNaMKtAzVQ30BtXWB95H7QhFVG2Kbgd
+evbfXFPrpqaWBZ6egGauexDgTfefBKtOypZz7aof4auiUHpKGooSheje97iA9b5
+aof5Hr8iZUgr26RreE/zS0YzcqSG90mGMHt6gSOi1YYh53MIIjMz9wqWIar3CoI
Tf0K6GdsuYfEnNPaANj0QGyX56MIN/rxHS8t4pc3wa626ZDIr4Lbqbub2X2bqfph
VzqnbHp6pKJlF14Vl9kBMALzuozE2YQPzNGXPmx0atTx6D7CMemh1lDEgl9s6jOY
xLkGXaaXxeuAG7uRpjl5e/ZvKcZPAo/5h7e1rVI7YzqT8fOQFutSnIee7OtUJn1I
NofIhug9Nr2AACZedAO/ogsi6OzKpCGisFSA5u/QNf4oo+428a9kNgmgPUtye1AP
Bs63Kyo3FC45T8qOGbh3Fq/+PmutQ5jrxZ4GvlzkFrEvNi4jF92eIpPbqkw/g+SO
r/mfCXbnb9D3wnqhxP54A4HD+7vAN5idvQwx7WORs4bOMmH1+n/FazDn/Cc2uVqS
rV3XsDxoezc0DG8Rw+fsIY2ni4j23qLwTnyZGkSt/3gI9g9LM4M=
=56Ae
-----END PGP SIGNATURE-----

--/9DWx/yDrRhgMJTb--
