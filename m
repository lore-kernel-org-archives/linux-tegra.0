Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 432EFC433E0
	for <linux-tegra@archiver.kernel.org>; Mon, 29 Mar 2021 07:24:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1D9AA61935
	for <linux-tegra@archiver.kernel.org>; Mon, 29 Mar 2021 07:24:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230247AbhC2HXs (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 29 Mar 2021 03:23:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229706AbhC2HXh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Mar 2021 03:23:37 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5036EC061574;
        Mon, 29 Mar 2021 00:23:36 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id b16so13061434eds.7;
        Mon, 29 Mar 2021 00:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1Xvj0eUA1KXbEVieSy4g0HlmPkmDXLqZJIcBvbfkNsY=;
        b=k47YWG+XexeAv9yr0lEnlqE79poNeyKapBt2Ca5nXcnp/gEuTCjxn77NwIUDxo9X+a
         XlBe7MMZF9/kmc/mJyJuM2riIXMVfRM1Aw4wya/T4bnqesbYAkdehx4LB+FQcjkdp14d
         1nP0DTzgntbBlGqhwEHYWZNlZQKItsFbG28KneJy+BOEBhLVGhyWx/0WYhcIlk8UIIux
         smpWJfjP4brXWWK9bZWevFaHIUqyiXcVsOu7cIbRQN1MaIu+nBmoHtN5yLcLMj6qOB/+
         u9Rtr8PTiwCCtpMceNETXXw+17PN56NgtWlQsX5wl3F4Bmyd0w5WTF4EKII4AMdiRM72
         0m5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1Xvj0eUA1KXbEVieSy4g0HlmPkmDXLqZJIcBvbfkNsY=;
        b=pGeUwQEVuD+EaaKCVz6lJQyMWzbRQRObaGL/PsVr1Sdh8OEglzNwXwIGvqzaqBS6dQ
         nE3rCEgvE2pdoCJioTtIQd54Ty42/09FaSlPT+JQjmhXFznnt7Q7PYgbybK8OYskGTSE
         OU3UZ+3WbXUU6raL+2QVoYWGWcB0vl71e9goDWeDVwiVdz+h7sOdYiBwDmdg09JdRY78
         VUsRvFvj/NkmFLN++T9/uKcwCYldIsqYdB1IqGb0Q0T8/GRavJ41DiUzlEzcUkm51uCz
         Lk2QU1zmQ9tcUkm4E5f+Vn4keM702i0skb/zmofWKGd0nsVr0qaBK/nzVDueol9hR2CP
         NuhQ==
X-Gm-Message-State: AOAM530m75I4AVcvTQn5Cm/Tj3MAPbC7K+sLL9AoETqYSqe8fx4kads/
        dvYxRMZGPj6CMwjYqEAq580=
X-Google-Smtp-Source: ABdhPJzjzC0+iQ1RLsj3MkkvxEwhXnRe7YVCnrbhN26NOHqxISq5v2xzdXnl1bWyARhjv3XMHqeMpw==
X-Received: by 2002:a05:6402:704:: with SMTP id w4mr28178809edx.175.1617002615060;
        Mon, 29 Mar 2021 00:23:35 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id m7sm8340064edp.81.2021.03.29.00.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 00:23:33 -0700 (PDT)
Date:   Mon, 29 Mar 2021 09:23:59 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: serial: tegra-tcu: Document "reg"
 property
Message-ID: <YGGAj0ClZejBN/gy@orome.fritz.box>
References: <20210326174641.1612738-1-thierry.reding@gmail.com>
 <20210326174641.1612738-3-thierry.reding@gmail.com>
 <20210327184925.GA367052@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="NFLLyS/wnn39dysz"
Content-Disposition: inline
In-Reply-To: <20210327184925.GA367052@robh.at.kernel.org>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--NFLLyS/wnn39dysz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 27, 2021 at 12:49:25PM -0600, Rob Herring wrote:
> On Fri, Mar 26, 2021 at 06:46:40PM +0100, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > In order to support early console support with the Tegra TCU, add an
> > optional "reg" property that points to the TX mailbox.
>=20
> This will mean the same address in in DT twice which we try to avoid,=20
> right? I guess it's fine, we could drop it if we ever enforce that. I'm=
=20
> sure there's worse abuses with duplicates than this.

It doesn't end up being the exact same address, but it'll be an address
that is part of the I/O memory region defined by the HSP block that
provides the mailbox. In practice this isn't going to cause a problem
because by the time the mailbox address is being used, the early console
will have been replaced by the proper TCU console. But yeah, I'm not
particularly thrilled by this, either.

I had spent a bit of time trying to code up a setup function that would
parse the necessary information from DT, but this unfortunately required
a bunch of ->setup() callbacks to be changed because we don't currently
pass in the FDT node offset, which we'd need in order for this to work.
An additional negative side-effect is that we'd need to duplicate a
bunch of logic to determine the offset to add onto the HSP base address
and that's something that depends on the particular configuration of the
HSP instance, which means lots of hard-coded conditionals.

All of that added up and at some point this slight abuse seemed like the
lesser evil.

> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  .../devicetree/bindings/serial/nvidia,tegra194-tcu.yaml     | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/serial/nvidia,tegra194-t=
cu.yaml b/Documentation/devicetree/bindings/serial/nvidia,tegra194-tcu.yaml
> > index 0a321658ccb5..8c9ed7cfaa52 100644
> > --- a/Documentation/devicetree/bindings/serial/nvidia,tegra194-tcu.yaml
> > +++ b/Documentation/devicetree/bindings/serial/nvidia,tegra194-tcu.yaml
> > @@ -24,6 +24,9 @@ properties:
> >    compatible:
> >      const: nvidia,tegra194-tcu
> > =20
> > +  reg:
> > +    maxItems: 1
> > +
> >    mbox-names:
> >      items:
> >        - const: rx
> > @@ -48,8 +51,9 @@ examples:
> >    - |
> >      #include <dt-bindings/mailbox/tegra186-hsp.h>
> > =20
> > -    tcu: tcu {
> > +    tcu: tcu@c168000 {
>=20
> While you're here:
>=20
> serial@...

Okay, will do. It's not a very traditional serial port, so that might
perhaps be confusing, but we're using it like a serial port, so for all
intents and purposes this really is a serial port, so renaming makes
sense, I think.

Thierry

--NFLLyS/wnn39dysz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBhgI8ACgkQ3SOs138+
s6GwrA//aOMst6kB/Jnqi75HtUI4AU/O+QiPzPRDdLmyiSQ9rNDKcLnNQGR7dIL4
ahbYl5MSoEBnjXiL3jf3ULib6LT/IqEIqrdCdMH5ooQz8v3rZrSNjODDgPrX2I1I
PIZNT0OZBdQQcdW/BZ3ls6S0gBgbKGX8QQYH++hriNoIQILco1kL0FiW3V1EPM0b
uxX1LwDcTAz4MRbR0qro+iJCStVNOFkjRAorErtCSgJGx/S+rRuxasduAovVEX9h
v5oDWMHFrxUG/qe55L7d7dZrdPQ9jJsCwPRV/38mS4Ny19EN3w7JEpus0vs0TNnL
7pNaez0UEuvVi+VTr1q8q5GP7AL9u6BBCFBMEtlseB1ml4nuwlB1BWjWmibS7oJx
P4/9Qud1bcPyESfrDxGMQAiyQOGPq8pWVgo8mN9KJhB6T3NOxEUeckypRvU8DzUs
cMWs3xrWMU61X5v2diyvzi6rtB0KyYnuRpp/YTATRMv2uy16mPIK0hckoHT5v1+r
gMVefm1TLNoU2sXvgqdd9fQO+9DXNjECidbGdRDy6DNmRBW1eQOnlhHCwfKHf6nx
JYYmiNdLVmvvO62dpZO98tyhfvCa2RNmojFQValEm7Frz/KARc5Puc7E6MNn5FbU
o1JujWTdiGcf03cv2pRhvnPw+kcI7RHIZNIQuTHpn8UiTq0ZYLI=
=sXWp
-----END PGP SIGNATURE-----

--NFLLyS/wnn39dysz--
