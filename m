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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9231C433DB
	for <linux-tegra@archiver.kernel.org>; Mon, 29 Mar 2021 07:26:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B52526193A
	for <linux-tegra@archiver.kernel.org>; Mon, 29 Mar 2021 07:26:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230450AbhC2H0C (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 29 Mar 2021 03:26:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231167AbhC2HZm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Mar 2021 03:25:42 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C410C061574;
        Mon, 29 Mar 2021 00:25:42 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id u9so17818731ejj.7;
        Mon, 29 Mar 2021 00:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2HsxoO5OOCRDiy9d5jLFpws46spRCGRa1MKFXTt9FFM=;
        b=qrnCacltnyPo4rT2C0pe5zTMy8L8TZjPuuLY5V80632eYFpm6uA/40Q672Lp10OY+5
         HwPvcidrMeiiIAXo0zkL/Yt0yZ5vbB+iys5OH/esgEd9Wl4H/PvzZETvPxUAsrf2+pTZ
         jQOR/UwzN1M2J0KFIZntZtnJm+tR0eSvtcKlxs0f1o9XDpsbUXmaVS5PU0Cj71C4Z5ag
         qjws+MsmPy0spsQvmzP5hxw+3l1m7Hgl4x5AIAw8hEsvNUBw34OmKyNXetkr99jFvJmS
         iCkA9evG/MGduV+So3N7yJptcbPNfbg/MU2m/T8eV+OJ1lGj9sO97rCVdMVBv12idap2
         3DmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2HsxoO5OOCRDiy9d5jLFpws46spRCGRa1MKFXTt9FFM=;
        b=Idn1JLihq+oWJtqcIRWg67ssY3HaSA6h4+4TFEMMlZLL1FKXxxVfcvPdByiSGeIVDu
         CeMfuwJO2gZPef1naOg0M44pAC20pnF9Ux/wMdLf77kyh1wpgvP8S4rJcyO0tAKyY8tn
         s82myi54pdSI36H0Lyc+CNO1OPT/cwc2yiNKzaR7+xfcs3mViKPijwi9EicMrJp33BTW
         zK+884r5NPFFuyAdtjWzJIx0Jj/Wx7k7gzor1ny1aisQi+V/sCtyAg0iHLNdHutYl97c
         q7aTvd7d4fcQ64VHs4MTBGzH4PAyjnXBfAoty9i6Njh42eV53cdwXRtkh8uVPDnbI1Ba
         sP/w==
X-Gm-Message-State: AOAM532W6iM/qBfDfEoYmvnTAoiPb9z176qBM+hPi8ZBOBvYLvZwd3Vz
        zpdxFnGZ3UwLNXuuKp/m+28=
X-Google-Smtp-Source: ABdhPJzVxlIZYzWp0GS19yC4AHGGmVvjsJ6vj1Rvr+xf+Y+LUX01dEA8alX6NqXbQHQN6kU3NTzoeA==
X-Received: by 2002:a17:906:e84:: with SMTP id p4mr26996018ejf.248.1617002740829;
        Mon, 29 Mar 2021 00:25:40 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id gr16sm7736387ejb.44.2021.03.29.00.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 00:25:39 -0700 (PDT)
Date:   Mon, 29 Mar 2021 09:26:05 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: serial: tegra-tcu: Document "reg"
 property
Message-ID: <YGGBDRtGiziF+Kj+@orome.fritz.box>
References: <20210326174641.1612738-1-thierry.reding@gmail.com>
 <20210326174641.1612738-3-thierry.reding@gmail.com>
 <20210327184925.GA367052@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ZXFD0XUUFURAyx6e"
Content-Disposition: inline
In-Reply-To: <20210327184925.GA367052@robh.at.kernel.org>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--ZXFD0XUUFURAyx6e
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
>=20
> >=20
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

After looking at this again, I think I may add a comment here to clarify
the restrictions of this property.

Thierry

--ZXFD0XUUFURAyx6e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBhgQ0ACgkQ3SOs138+
s6E4qA/+KRy3n1toeZm+vOePuYxYEybMLCSUpwb5WvwLslfjMAyiKEwsviz509Ya
auDKF3Q+MlOU8f4VdlMu42oaBxAlGZqjpKcB5ag+PnCUUN3cirDXGsNBkYN/GT8I
2NcsRi0k2pSB9TiL60aFr99Mm+zA89QFo19X4B1/sWRUEpw2TtpGOHHOmpQZFhA2
vDG+ClxX6XsQVcJyLwVTfetBKzY2RL3/zVFoTnfdDjSaKk0O3Q+K4HpJdLjvbdY6
t5+hfpmGiidvHICKg3dvb8admLop8m9a4FSJj3zSwKtk+UNV0Upllet2PB2j/iui
8w76t6AOGbxys3kbU2bQIkPpRgdHn3Qx/8+260hNeHU889J4LPLv321UhSXxzbyf
orgP8NoI98xyOCY8xmajUXSpURvI2oAMnPbEb/wNvwOH60gToHHnLhHDe9FrQmmQ
jIIzHCaUkqrYN9vFyRdNj+uMkAgCQ0r4izq4qU85qJrEct1OtD/RNOAE73j47BHO
ZPH6JlmJYfu3tW2bgoRTNGIJ+0LbJrAtCGKQUDMOsuxydhFmQtf/PRbC93OcmMh9
cVhNbXlGOZTpt259GApu86ejS4/wIBi47hP6RvAHuV0Rz+qOB8hGRMtrXOyBzreC
23FAA+Cnx/LGh0jULjQDnflhWb4hrI8Da8fG6AejM0/wEGrKa+0=
=oGkQ
-----END PGP SIGNATURE-----

--ZXFD0XUUFURAyx6e--
