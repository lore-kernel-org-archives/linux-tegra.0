Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 003E3C433F5
	for <linux-tegra@archiver.kernel.org>; Tue, 21 Dec 2021 16:17:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239619AbhLUQRd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 21 Dec 2021 11:17:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232032AbhLUQRd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 21 Dec 2021 11:17:33 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD66FC061574
        for <linux-tegra@vger.kernel.org>; Tue, 21 Dec 2021 08:17:32 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id s1so28055571wrg.1
        for <linux-tegra@vger.kernel.org>; Tue, 21 Dec 2021 08:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7IewRmp53obWZA8iAP6xaJB2w/BWeImTIAsfcfYpv8g=;
        b=AEASgYXdrbl5I7eAGu/C4OY3yC4JrWwtu07kmByhbnH9sa8Y8zcJNh99kFTJglj8iq
         MswqN6waZg95LQ+i4phaMjH/5KLqhaz53Y4e5mCpJCqWxRsE7zFarSGIOQVuap9A3r47
         NAPTb03t1Az95yRFYmPyjgdCgoVHDeZo8iJGDxW5l0Dzz7VXtUBfBNdiztHJzD5PQ6Jf
         NfD6ct1ztK1J154aeWcu0yGqfVDZq6zGShmedGYG6t7iBfxvAK46WxylmtBf9hhdC+6L
         9sF5wQR0OMA15csonRkwBspr8/RalDXq++QFAtIeOt2W/k/Bm1rpc6o3d/35UcGVZRu0
         1vyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7IewRmp53obWZA8iAP6xaJB2w/BWeImTIAsfcfYpv8g=;
        b=uvSvnbkbh8hcS7bpmYji+HddDTPnThAJw5oUYujsnMUsWW2zEuinnGpeqw0b/a67eH
         FKF9jA2zc06lAbChRsj1OwG5Duf5qC1VKQrOFoP7P4UZEasmW7aDXpi60RUwLB4ZiSsU
         udsqj6/wUzwDxSTpyLLspqEIfD63EKzY9jFaCazLdMTRJ9gLOtNvYTQghWtAR6aI/5NF
         p5qy2cxgiwbOtgfpmVMoPJZg9N/SIdRxJnPXhz0M8F958hOZ5zHb/+8OFv6sCHTQfoJa
         XeXL2vjAcwE4LiuMO7BW2Siyvz1iE9sIheIrCXl71inh/2d2xP9EuZWnzTCu/QgAU1aD
         SiBQ==
X-Gm-Message-State: AOAM531ThGyFjM4PrnCXSuXU3AjZysCJXtScPaOZi+Jfx/PBh8LNzRwS
        d90D6qDCDBrqAYJUNqf54GE=
X-Google-Smtp-Source: ABdhPJxngmVd4FHdBfUzeGW1NnGbzDP69JK+k042IQfNoYnfCVLJGVApuoeQu0W8UWfxddLI04p8RQ==
X-Received: by 2002:adf:eb52:: with SMTP id u18mr3155117wrn.90.1640103450872;
        Tue, 21 Dec 2021 08:17:30 -0800 (PST)
Received: from orome ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id g12sm1982532wrd.71.2021.12.21.08.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 08:17:29 -0800 (PST)
Date:   Tue, 21 Dec 2021 17:17:27 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thomas Graichen <thomas.graichen@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 0/2] drm/tegra: Fix panel support on Venice 2 and Nyan
Message-ID: <YcH+Fw9sCzCIzFIx@orome>
References: <20211220104855.428290-1-thierry.reding@gmail.com>
 <dd7a2f23-00d6-9160-1e09-1d4ea5b1f5e1@gmail.com>
 <YcCg/xktJ2uShFRf@orome>
 <e27bd5e0-51d2-875b-aa41-f198230880ac@gmail.com>
 <YcGzO0A/iWzhFjvE@orome>
 <c2d2e5a1-7f44-a190-2ab1-84125fbe9f65@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zNj/pFIeYgZazjXy"
Content-Disposition: inline
In-Reply-To: <c2d2e5a1-7f44-a190-2ab1-84125fbe9f65@gmail.com>
User-Agent: Mutt/2.1.4 (93ef06ae) (2021-12-11)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--zNj/pFIeYgZazjXy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 21, 2021 at 06:47:31PM +0300, Dmitry Osipenko wrote:
> 21.12.2021 13:58, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ..
> >>>> The panel->ddc isn't used by the new panel-edp driver unless panel is
> >>>> compatible with "edp-panel". Hence the generic_edp_panel_probe() sho=
uld
> >>>> either fail or crash for a such "edp-panel" since panel->ddc isn't f=
ully
> >>>> instantiated, AFAICS.
> >>>
> >>> I've tested this and it works fine on Venice 2. Since that was the
> >>> reference design for Nyan, I suspect that Nyan's will also work.
> >>>
> >>> It'd be great if Thomas or anyone else with access to a Nyan could
> >>> test this to verify that.
> >>
> >> There is no panel-edp driver in the v5.15. The EOL of v5.15 is Oct,
> >> 2023, hence we need to either use:
> >=20
> > All the (at least relevant) functionality that is in panel-edp was in
> > panel-simple before it was moved to panel-edp. I've backported this set
> > of patches to v5.15 and it works just fine there.
>=20
> Will we be able to add patch to bypass the panel's DT ddc-i2c-bus on
> Nyan to keep the older DTBs working?

I don't see why we would want to do that. It's quite clear that the DTB
is buggy in this case and we have a more accurate way to describe what's
really there in hardware. In addition that more accurate representation
also gets rid of a bug. Obviously because the bug is caused by the
previous representation that was not accurate.

Given that we can easily replace the DTBs on these devices there's no
reason to make this any more complicated than it has to be.

Thierry

--zNj/pFIeYgZazjXy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmHB/hQACgkQ3SOs138+
s6E8gxAAp5vXAjYM/y42lfK/x7apM+FhGL+7LJFqEx3w5fSUwEsfMgiD8t7KhxVf
s1+a7ap/eV2nl32K/hl0K+n8DmFiujH6P5/ugRDyCGG1dX8Z49QG4QlIhgIXqYRo
V2gbCSOmGggSpiBu8wcd1ZI8U1S/JOU6np0T8bnnwuGdkoZv3h8POPQbQ5CfTp3b
kTPmPMsiFobUSzdRZgOoBicKfbP18E7SzdDb4NEdPoP9QjZp/ITppMS7dEdGOBp6
OnF1sVU03uKcMYyTOTRcanvnSgmPKWWy3JTXzOrsuMbbxGt7/IQVvLylskcmJ8Ns
FM3vW7RkB2Bj43TYW/YYIjslTt6YYJHd64C7oFXoZLGDV2CvXIvXoI/GC5+UljEX
Y94DljOetL/wAkSNWWWkvUpCTDfXdhIUiB9IHmeE5CUgdB3LkxebIsNGQ08ZB/o4
KR5c0TtqhDqKNiR4MOtudDDtE19WrQjDoIVt75v6tsXK0Xm5p05TQ8SKv3dwxpAI
tqaqDEX1H98jMIoI+B1vB/6ZtdlVHz5GvS7QpCiwPxd5Y3L7v2U5G6GkrzQEUL0H
n0rCvFVNmEfBeyW0wLd8uyzPiOsVpoJGK2o5lZVGe2tmvLMZQ38TbMTeAXLY3RNz
Unn4dALuFwowU/H7R3eXsDFoLje4A2xK3d31bI95VNbCN9jvhS0=
=mKlq
-----END PGP SIGNATURE-----

--zNj/pFIeYgZazjXy--
