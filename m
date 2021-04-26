Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01620C433B4
	for <linux-tegra@archiver.kernel.org>; Mon, 26 Apr 2021 12:20:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B9ED4610FA
	for <linux-tegra@archiver.kernel.org>; Mon, 26 Apr 2021 12:20:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233218AbhDZMUw (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 26 Apr 2021 08:20:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233212AbhDZMUv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 26 Apr 2021 08:20:51 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E776EC061574
        for <linux-tegra@vger.kernel.org>; Mon, 26 Apr 2021 05:20:07 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id x7so55619642wrw.10
        for <linux-tegra@vger.kernel.org>; Mon, 26 Apr 2021 05:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tpH+QQEkbZc6+vtMNeOllqTuD3uDWkTb+lWH8HNjCTs=;
        b=QSDEI20mzX1NnoNCWr08mq8SOEaY1vu6Paox4yhODe+p9Vk4c/WbJuSkwucgHtrqn+
         JYN/hTK+Ted76ldmtSxQSYyEMRz89/ApAToWbgY8mU15k+/ekhB3gcKVZSSVCO0DrGWf
         iLzg+ju/21RrjGp8FzDTyvfoqOysebrPqgGokz4sWNZHO0W7fqjTea08mtgJr69s97LP
         hGtVOGRiIR30SykPHgG/RLCM0F9io7Nr/ZBlRajUZPDOm6sJuHETNSl58XuIfqkxt3UD
         790INAQfiKqQ4lTFsbbrshGdVpkyw+G+g2z6y83S19LH7Xmog+iAR2FcEmdevjvN3XYr
         iO/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tpH+QQEkbZc6+vtMNeOllqTuD3uDWkTb+lWH8HNjCTs=;
        b=F6l2aHTszbLH2oB67kIbI/t1/acWQMwXuKoX/0uQKEXStsJiIeIjI0jTqwXb77GcJW
         5GX2Y0xfrQO4v7wuiCr5gNXTmUV3EyW95PjepIQGBwArn9RElnJGCQ0DRniiQSAzEynI
         kwB7zfRJVC3wyNcOxohFq6/CbW33ozVZ4tuit9C0sJqqlbX79jUFhfuCmyUkiP/YChHF
         Bnm61bI3tFGGcuwcBLr8IGVLV3E1NCt5etk8JyM37ShXsuG5/rcqwOVhHj2WC7pOyMsY
         cvw8hTiFObvalkbx3mmm9EGczVfS+uEh0K5V/iYqB4qS/6GHOR/3eBKMwnbURLOwTTuu
         3Itw==
X-Gm-Message-State: AOAM533fW48YDba9UWcONNQiojJ3ZRlHMtpiZnKOpX2N3QjdSLZ18bzk
        J3Tm0a8lGFryFFV5N4Fv+10=
X-Google-Smtp-Source: ABdhPJzmgju8kLtqMK9vbZukR6yA680YTwi+CYecPgmEhe2wJpBt7xaf9+QjA03ehGAFvSVYJ00D8w==
X-Received: by 2002:a05:6000:10f:: with SMTP id o15mr23256702wrx.98.1619439606750;
        Mon, 26 Apr 2021 05:20:06 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id j7sm4062410wmi.21.2021.04.26.05.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Apr 2021 05:20:05 -0700 (PDT)
Date:   Mon, 26 Apr 2021 14:20:58 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 05/10] memory: tegra: Extract setup code into callback
Message-ID: <YIawKoKFohRC2nfK@orome.fritz.box>
References: <20210420165237.3523732-1-thierry.reding@gmail.com>
 <20210420165237.3523732-6-thierry.reding@gmail.com>
 <25ea4721-f9d3-ae4e-6310-73182ad43d8f@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="RmJ7DJaEJuep+6vi"
Content-Disposition: inline
In-Reply-To: <25ea4721-f9d3-ae4e-6310-73182ad43d8f@canonical.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--RmJ7DJaEJuep+6vi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 26, 2021 at 10:58:27AM +0200, Krzysztof Kozlowski wrote:
> On 20/04/2021 18:52, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Separate the setup code for Tegra30 and later into a ->setup() callback
> > and set it for all applicable chips.
>=20
> I assume the code is functionally equivalent - the same
> tegra_mc_setup_latency_allowance() will be executed on all these SoCs?

Yes, that's what was previously the case and this holds true after the
patch. Really the only thing that this patch does is move that code into
a separate callback in tegra_mc_ops so that it can be changed for later
chips.

Thierry

--RmJ7DJaEJuep+6vi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmCGsCoACgkQ3SOs138+
s6F7UhAApiDpsLHbeR93j7puRDYR1iR+i+Vp/3pSNod9gTINo8CWny4Nl7dujlUa
9IiKQHze0Aj0rpeppnuZU6DYhGQAiwwDgSB1PDMEymS7mTb6CZfDO+zH2zANPQzp
t0L4PO45otYWNTO0kPEMSH92Q7tyEm8slUY2DvzNksv6B3deuWPvVYQZris9qOdy
93oGDoQNIMcctD2Q0t5nw8qqJIjjP9d0nZEhUiDKLga3+k6lJNIIQlI3fXQkhsNb
cxPK+dInWTPtVT6CvLoiuvKwx5TRz/owBWY/sZndsm2OL0qBJoa4MR+CTee5K9Ki
u43L/qhogHyaV+H/2uywQWiZQUlGvHIhLB/Vk8VxkQrAC1gsH+153uMK5U9eIv0K
dzch+hCWxeTCoe1FujdjDLpv6mybGAeuB38bydWOQaKbFDWBVKAFIj01LpVVto+W
wV2rFnUJgmWJ6CCDgria9wIgVcwZeootfBKPMcjqH7ilpbuLW5zspmcaTcVU5zMY
uVSlrtxLjWMrSlFJBF7weXuFxhCkUkOXhlsVyG4WDRgYw3h12Bkzs6PvUlDZ2Gig
UJ6N3hLnyO0/OM9I+0PLf9oUcIPzsysCvO24Lq0Ky3nX6hAh3bCAWuWF9AkiIEVq
xZ3eqVbTWx1taUWMVHFpvdITaosCHLxqxfQP1tCTLIsrNmCdQqw=
=66RF
-----END PGP SIGNATURE-----

--RmJ7DJaEJuep+6vi--
