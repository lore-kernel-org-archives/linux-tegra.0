Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A75B0C43461
	for <linux-tegra@archiver.kernel.org>; Wed, 31 Mar 2021 16:32:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 845CA6102A
	for <linux-tegra@archiver.kernel.org>; Wed, 31 Mar 2021 16:32:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233816AbhCaQbw (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 31 Mar 2021 12:31:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234126AbhCaQbj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 31 Mar 2021 12:31:39 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8448BC061574;
        Wed, 31 Mar 2021 09:31:38 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id kt15so30950784ejb.12;
        Wed, 31 Mar 2021 09:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WYLc7tpXXlAdzQcAM50oPpnT2QvCfzZa3KC3TsmrTA0=;
        b=DbLfIr+jCyhFpfkmEFPvn55IdcfEfDzRQQRKPGfJN5f7C6SJN7gpJYe/XCypcsjo0O
         4IC4DeELTRvs246b2L/g+V08C0140ZGwHLcBwRC7qn1N2YgIlvQRx3tfqIMtv6VLCFVX
         8cPtyOFSyBKpaD8H8+cxgRE2PcQXpMtDf4WMflX506JBnWhcHYuk+O0r7zc4JSZ3Avwu
         ia/40l+WZjNCTezR+4rl2XNYcHdwSTMGgMMgdb/3zBiwQyzENUOJa9S2B4hBQ5q3a++Q
         8eAFictjjETBkEKvf5A5drl7pRTZy8b8/lOg3gQAYNBV0fnF07hGeZaxthU5CHEW1uJV
         ekwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WYLc7tpXXlAdzQcAM50oPpnT2QvCfzZa3KC3TsmrTA0=;
        b=h4UiOjkRGErTZGCp4JvkNcgIccOMyDRHlQw61XTqibxlibvGwtkhAOxkn7QeHdSFZO
         Frtxyv8Tl1BBMkJkA2hGPfjkEpKOFdXiTBou2Wpydd8B6KuzPOHmXkhKzma2GPWP3rIH
         w1SIOPdlVRI1u+Nm56caCfuHoglPNJ+2k60eAjAJ0r0h6v3gdXYytS904NDbssFKHIu7
         OS6uetRWFB2jorE1l3hfli2pGWW9i5xADJAdYv2SxNqd+5MEoySTlAW+44UvOs8FLFWt
         29ll5J5Kr1oc2gSpsieU+gClQ9gzNS5HUMBH8d4v9592MKfUVT44mtrdBUJ/Dq9T/t/I
         RmTQ==
X-Gm-Message-State: AOAM533Ls3KIj4UDI141QEGykYggnnYR32Q9H1rzUeoxfAgMRHhw71Bj
        fc7xNCMfiLvjCGWslzJ419I=
X-Google-Smtp-Source: ABdhPJywJZ0p2Osdd/88+UOBzGYvSL2LLonJcD3VhQAXpMV7ZNhD9VK0KfC5Fzpn3KiPxA/cyvtfVQ==
X-Received: by 2002:a17:906:4c56:: with SMTP id d22mr4615970ejw.426.1617208297305;
        Wed, 31 Mar 2021 09:31:37 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id v24sm1534193ejw.17.2021.03.31.09.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 09:31:35 -0700 (PDT)
Date:   Wed, 31 Mar 2021 18:32:01 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        JC Kuo <jckuo@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v8 03/13] phy: tegra: xusb: Move usb3 port init for
 Tegra210
Message-ID: <YGSkAcRLByY8zNnu@orome.fritz.box>
References: <20210325164057.793954-1-thierry.reding@gmail.com>
 <20210325164057.793954-4-thierry.reding@gmail.com>
 <YGMx5cLmX+d48XKO@vkoul-mobl.Dlink>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cJELGr4MZm8FUmtf"
Content-Disposition: inline
In-Reply-To: <YGMx5cLmX+d48XKO@vkoul-mobl.Dlink>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--cJELGr4MZm8FUmtf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 30, 2021 at 07:42:53PM +0530, Vinod Koul wrote:
> Hi Thierry,
>=20
> On 25-03-21, 17:40, Thierry Reding wrote:
>=20
> > +static struct tegra_xusb_usb3_port *
> > +tegra210_lane_to_usb3_port(struct tegra_xusb_lane *lane)
> > +{
> > +	int port;
> > +
> > +	if (!lane || !lane->pad || !lane->pad->padctl)
> > +		return NULL;
>=20
> This looks problematic to me, so if lane is NULL, it will still go ahead
> and check lane->pad which would result in NULL pointer dereference.

No, this isn't going to result in a NULL pointer dereference because the
compiler will short-circuit this if the first expression is true. If the
lane parameter is NULL, then the entire expression is going to be true
no matter what lane->pad and lane->pad->padctl evaluate to (because of
the logical OR) and hence the compiler knows that it can skip the rest.

This is a fairly common construct in kernel code.

Thierry

--cJELGr4MZm8FUmtf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBko/4ACgkQ3SOs138+
s6FiNxAAi2R7ZrHKx1o63uc5yjc36lI4yojCCgztYi1WzRo1mQZjlGWhhtrA88rK
LipD2lMrK2Acm9ZxURPgWhFet0MtptgZ0fbBbfGjOXwdMKE/9nGsHvpMqFAeHdmC
UgMhyAavacUnP9WnlwjQpoIooc8VPAS/IzuKmcNUZH6v9k3ncjv1Rm9Cc1cdoOBK
dP5KLQWH2/LFLfTzPfyJF1XayW5U4QZ7Z40qbubcs0xE96oam++LLfk9NgMsCoIR
M1W4xtgQNPIkM2LFjHhGR7Vx539mxD/eKOYBtGM5oiIUThWmmgrSTyweOl63tkOP
a/Z8E7ypZWC5G7kpTXreDZ1mp3cS/VKOXRzKMDiNZ9CHoAx+yWtrSA0dvL9VYXpA
UrBfypQO36bwR/XMhNB04s3q80Wmp7FygbmBKsVE6u/inmdYLaeKHmsSfZuVk7IY
LVJgOPwWxHErqakmTCro2Ja+vv6UctvLQ0e0IRZiuJ4rqu7tp0CMGrYv2p2p4dKK
wsEakXE8kq4nerNsTL1io6ISBvnA8Nqesu6YSWhxDNilZtYg6jr9dbBDFL56XB8F
alej1rDjL9KLKZmxW5unXLVv623xbgYtVnrr9xbuHCGbI9+knev4JsSRekk0cfxB
kSRNU+fgjJB2MmsTTioUzvnSjAvlsYC6np0ASaaSBebZf2oex6g=
=AgrR
-----END PGP SIGNATURE-----

--cJELGr4MZm8FUmtf--
