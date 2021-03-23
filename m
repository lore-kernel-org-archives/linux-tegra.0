Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0C3CC433C1
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 18:40:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A8935619B8
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 18:40:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231955AbhCWSjj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 23 Mar 2021 14:39:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231995AbhCWSjS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 23 Mar 2021 14:39:18 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCCF6C061574
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 11:39:15 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id e7so24566394edu.10
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 11:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ebGUw8pp9xxmsor31OE1Ify1rN0/BQ0qjN5mq1caPv8=;
        b=bxnd1rhc77oy3roO+0VrOhSSSSX6RNqwUmgIxk1yRDX/GaPGK+yr4n9VmVmLxCUOHv
         17TtQ2c79kkMHLPp4VY/2nbYzuu7L4HsJiXHtjw8P7bI8o1i4FSQXFUmBxZddJTJHKIg
         Nh3lr0lMZVjOtTpAB0X5AashzUVm/SB7ZOFHV9mup2QqDvo5dWzFrHxGoQCEKTCkp0eG
         4TInhBCKFF23aBFqXfLMCfon+gNrolcr1gPeYAn/uXi2z1qwtxB0ijlSjcZh2cTP6+1d
         48Agc83LfVm8dOXU2zhahZhAIX0MU+wS16gpP8GAGq0B5PEdLUMXSRp9jAwCes6gH+IW
         s6Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ebGUw8pp9xxmsor31OE1Ify1rN0/BQ0qjN5mq1caPv8=;
        b=tnlyHYdAooEdmkEBYPfcWN/qGAqRBet4aqqeVj0qtfjWV2VMSNNkPpRfb2bCGZAZSQ
         AQPdfdR13c7ACtzUo22IouwUiR+GczoUCGjSH9nNURcjyT2MA1Ce4Ay+9Sl6JIvfU7lj
         cd8uPtChKeFzFxnstbKG5qt+1Cq5oYPIJDic17yEPcFmPo2PSbteVtjpFibdxZB7lxTN
         HGJtRFJCTiWJ1wBci6Fb94ZWllSUNkf+r2NTOhvck5MIxZb+X7BbNvprusicJBas8f9d
         bYBtV/2Plq7M61OWhQQZfnOa03FwhGH6CApE/nIgiCc6lGyAnvYVQmp3Oc8zsLuYcyG7
         +Fyg==
X-Gm-Message-State: AOAM530ONxQhNZAaCYHgHG2GFhjUJ+epKfsdr5xITwMpfytoIVU9SgUI
        pwXRYQ752RJPWz5eKCu1b0k=
X-Google-Smtp-Source: ABdhPJwGEsRE8UkVG3Cq1p7kkbPjT3q7vEiv+DO4WIPcA3EJUFPgBQ5av04u5o1kfAq6UIZYaYEsGA==
X-Received: by 2002:aa7:d4d6:: with SMTP id t22mr6100943edr.376.1616524754320;
        Tue, 23 Mar 2021 11:39:14 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id g20sm12997276edb.7.2021.03.23.11.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 11:39:13 -0700 (PDT)
Date:   Tue, 23 Mar 2021 19:39:34 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] arm64: tegra: Add unit-address for ACONNECT on Tegra186
Message-ID: <YFo15lPLUMFpXXss@orome.fritz.box>
References: <20210312125808.659431-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yIwQMGlbsNINDvUD"
Content-Disposition: inline
In-Reply-To: <20210312125808.659431-1-thierry.reding@gmail.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--yIwQMGlbsNINDvUD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 12, 2021 at 01:58:08PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> The ACONNECT device tree node has a unit-address on all other SoC
> generations and there's really no reason not to have it on Tegra186.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 2 +-
>  arch/arm64/boot/dts/nvidia/tegra186.dtsi           | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

Thierry

--yIwQMGlbsNINDvUD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBaNeYACgkQ3SOs138+
s6Hmhg/9G8i2C4dOB2zW5gAhw3ko+uJxvRpZ9X1BTRj8D78eUCqwNlSy/4X6LU45
ZIZqIlvcSjgCjaGDZBYiV7uY6gP0Rb0SkLQPgaoBu7QARnKy1I5R1+q+fI8YjcWg
aYIQMNiixyUX/oCNAqHmGeH/ihylccajRudOkI9GjmMJ7eCTKYi871tjgqt2yLhC
8NwnHNz+qZ05otLUzJcWey2bizrl9ySioYNh912r8OzmRZqCH9FtkQ2VL5nkWJnd
4NBkbPoDoH/r3p3AgQih4ogvoxQ1D1dzemmpOsvpf/p4r10HCYYDucGJmliWlo8v
IdUV6HAghTFcJEamwfZtDQ1zdGJBtPB+6BitArnVuZ211vFVjM7XSvSZE9bIIfJA
DREhELe4nJAmstGXTgzNhM7FRywZrhU/1sFPlMdZWps6eGXqQLDUPKFHnoHDvTgO
+4E49hw6fnkxBgyeJS/c87mczp3wIwFiqB9zQ8ZDwgXvtE2GuFGbCbx+5QQGJqGO
gpv66OtrZb6RBl+1Ns12kkIiJ/d5BE184HfzCAca23lhY+2pt5tSxlDtS1j0oJgS
A4S2Cdb3lkaYISiOOWKPg8oGVuyWqysIpzqoVq/2uTRAQ4j+mWbvxcHe7b4qNxfu
g3yrFcmTo81iVvkaJWnw5oPV4bJYYeKPkGcEwMUVDWIjdLWJG/k=
=foPo
-----END PGP SIGNATURE-----

--yIwQMGlbsNINDvUD--
