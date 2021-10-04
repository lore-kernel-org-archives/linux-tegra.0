Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEC84C433EF
	for <linux-tegra@archiver.kernel.org>; Mon,  4 Oct 2021 21:08:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A0DCF613A3
	for <linux-tegra@archiver.kernel.org>; Mon,  4 Oct 2021 21:08:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234384AbhJDVJv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 4 Oct 2021 17:09:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233578AbhJDVJu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 4 Oct 2021 17:09:50 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE2DFC061745;
        Mon,  4 Oct 2021 14:08:00 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id z2so14509742wmc.3;
        Mon, 04 Oct 2021 14:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gkG5lkfyMAFh+S+h1K8o037D6jAaU1QBUaAveSKN5bs=;
        b=SNBxzsRURHKo0A2CZj3RDkrwjTKxlpWTS7ji6rrgyun4z8PhZsaWYGkTxheP8ZDQG+
         2RTPd3SikVVVAgImnxrLrLP5CgRHUiMEYhLUGHBI/8cXzLHLg3loziYG9TN6A3cWMQme
         8IFQBBUnPNkbP7HXjID5qNxj6ZXNnCCWq8O2H1BxsPz6nnCopQWOoINW11HyR4/MUgkm
         IrciGrmzoZALBAeOTl1yNEa+lvxK24fWzspwsQGtpepDypIie0TPinxKeI1ZtywWngfH
         ySlFsSoZejuzoXtf1/Zk4JLy51t5gDWiQyjCzobUF1WkkPwRboC5qxEIwEqR8Wg3MWzV
         ae1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gkG5lkfyMAFh+S+h1K8o037D6jAaU1QBUaAveSKN5bs=;
        b=bYT/pvEAPlcML3tharcK7660Khx0tQnwZpzGQakeNIVrne/xvKuohR7eLS/yFKAgYl
         BSF+r3PQCpO+eAgo2LxegjKEXRC0+tfhoB6OhyMZbYvAiSctVv80j4D+V8d8e4SHYy06
         jhFBHki3we3ZXBkpm/RM3WGP46Lx2dHcOXGfxFzY+Ozih4FAQuifZMwNzeCbreEIFFMi
         Z88Ik7jd41JvmtYSbTjr1TvlmuYR8B5z6sduLWADoH/dzBb+kUk7nBZc8APAvg85+1PG
         pc90toFWbGc3I9nH71T6L3ME9uRORzKKS/dDJciFqh85xwJMR9s13FAVPBjQR5vom0eo
         NRng==
X-Gm-Message-State: AOAM532uUWv4IxC4ig2jaBadVMK3cJwDrtERAEQXH1W/kTp4mPDtXKh3
        vNZhjkFUaueFTJ/iUyyr6ZE=
X-Google-Smtp-Source: ABdhPJwAeFioX3usnMvqI88iLTHT/G/je5LTodzI+O/oQqIdOL15UVEMVGQr4DqZT9S+CE31usi7qg==
X-Received: by 2002:a7b:cde8:: with SMTP id p8mr20869439wmj.178.1633381679585;
        Mon, 04 Oct 2021 14:07:59 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id d1sm18343494wrr.72.2021.10.04.14.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 14:07:58 -0700 (PDT)
Date:   Mon, 4 Oct 2021 23:07:57 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
Cc:     Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Chen <peter.chen@kernel.org>,
        David Heidelberg <david@ixit.cz>, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v7 1/7] dt-bindings: phy: tegra20-usb-phy: Convert to
 schema
Message-ID: <YVttLY4cCtgh9Cuu@orome.fritz.box>
References: <20210912181718.1328-1-digetx@gmail.com>
 <20210912181718.1328-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="V4Ly941B1GA5pyQo"
Content-Disposition: inline
In-Reply-To: <20210912181718.1328-2-digetx@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--V4Ly941B1GA5pyQo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 12, 2021 at 09:17:12PM +0300, Dmitry Osipenko wrote:
> Convert NVIDIA Tegra20 USB PHY binding to schema.
>=20
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/phy/nvidia,tegra20-usb-phy.txt   |  74 ----
>  .../bindings/phy/nvidia,tegra20-usb-phy.yaml  | 357 ++++++++++++++++++
>  2 files changed, 357 insertions(+), 74 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/phy/nvidia,tegra20-=
usb-phy.txt
>  create mode 100644 Documentation/devicetree/bindings/phy/nvidia,tegra20-=
usb-phy.yaml

I'm assuming that Greg or Felipe will pick this (and patch 2) up along
with the USB PHY driver patch, in which case:

Acked-by: Thierry Reding <treding@nvidia.com>

Greg, Felipe, if you'd prefer me to take this through the Tegra tree
(and ultimately ARM SoC), let me know and I can pick it up as well.

Thierry

--V4Ly941B1GA5pyQo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmFbbS0ACgkQ3SOs138+
s6HhFA/+Ni5dhsw9WqEI/xwNijlIg6I1gFaikU668uT+ZNutI9MKyXqo6WOh4sxf
nuIk1cPMon//DjmNKARNtV+5NH/tn/0YmCvKQpdzpJtIfyTuiymO0V7YrHpvCGFV
2xWFAeryzq98xa/Ip1qrUclOO0lLvJXUOa/esQqd97xq3uJSjAnYbIRdLHRizckX
5emE1fNYwDLYn5n9Cyta/T01PPGn18Ot7Qqlb2P9uKVLbF9/r131G0nPIE8iKCpP
AigTekYP1RXZe7Z8+guTk6mnddehKjkoJ6WREL5Or7ElIC2ISP41lIXQSPJVi+X2
cJpsJkO1gGMKylT3vwC/AmG401R5KNCQ0BCIqQ+3DcgAvO+b05GhsQ3VCY5jhzwe
VODqZOE7laCvyT0Av+A0TTgkOBhv5tCpW5CNchmuHFGj9afyr31b+X5Pth3Cg8k2
H7Gn4t5ZfS211GMBrVkXt0hc3yQeUWddVHDBHi3rKjhFGN5RACDy6m7MSJmbbvZl
omsOiWq1RZVEhsizxv7SUxdDMj9/Q7QPX+bW3lUQXBDjQefyLV2qNY0KwISQY2/7
ENf/Udw0811CZkKEkCQiIRaR1OO9BkCAJeETFZiGPfQVyvAdGZlJFBSK5XfuySxt
ir2DDIWO9npId+kku2aBKYAfr6ZcDTew/16gpKHPj9/vVJLGFAg=
=CkiV
-----END PGP SIGNATURE-----

--V4Ly941B1GA5pyQo--
