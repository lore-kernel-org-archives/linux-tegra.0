Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98F98C433F5
	for <linux-tegra@archiver.kernel.org>; Mon,  4 Oct 2021 21:22:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 67C1461452
	for <linux-tegra@archiver.kernel.org>; Mon,  4 Oct 2021 21:22:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235081AbhJDVYm (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 4 Oct 2021 17:24:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234470AbhJDVYl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 4 Oct 2021 17:24:41 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6898C061745;
        Mon,  4 Oct 2021 14:22:51 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id s198-20020a1ca9cf000000b0030d6986ea9fso1101457wme.1;
        Mon, 04 Oct 2021 14:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=aOu68f1QX/jrntnkf3FLWDymhn5DKxTIXT6hPkHKG/E=;
        b=JOCEBXc3Pur4iBa/if9OTl/NcjM3JZyhbhclin4q8kkgiXjnXA9upibdyXhgBrR1/u
         Vb5Nl5lBTWJk/xFkJwsl/pc0Waa+Kj6+9w+ADF9lWML6+h3bX8McCWbp+SOkJF+L0gHA
         Dj+idttGAd2FwBjk0tMmOtD42a43lIvFpN7NNhjlvKAqd+OwoMHGeAq3gyDl+GS+4Yk5
         cTNRkMkbp5p76utJZGidEghbBbd5Ta34YXAcESlhjGHe6vcM0/TUdcSssSV8i3ZArs5V
         SGFbbr1417miyUqBm+pepsvf02Nc4YD8nZUmSo8+MVRts1BbcLT3UwkB++Wz5j0fyfa4
         gTCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=aOu68f1QX/jrntnkf3FLWDymhn5DKxTIXT6hPkHKG/E=;
        b=IV/lH7+89lMzKIPhco4syn7zWfaCoWwQLArV/34+BxOxpdOA4hnDGJWrHGNpf9+evA
         pB5e4/r4hQ1vsDVvrrOwZIBmR0n9uc8hrI+Mo1PhhJSeIcdk/cgumc69zO/zkdwVf2Wd
         XqZigyCKZQ4xvSHniVWgN4ITog3qAdSiPNoqDCSgEPfwmRjjxG9+uEsyoSQ9P8koTyfL
         y4BaknWaGmRwp7Eg4iobr3cYoGwFeGGrK5NcGWl+TP1s3jYUyO4QB9MCgysmjAhlWmuB
         zWZdHie3HZ3V9AjBAjssrW07D++CMMsDst5oRcDukKHFWC0XxZLcyQcF+8jpa12mNtAh
         9dtg==
X-Gm-Message-State: AOAM531EwXOF0dPuJUX4bi8UWjwSsCQN/J8jX2PbMugck/ZOMXzNh4br
        +txxvkq69c3+Rgo502jO/jE=
X-Google-Smtp-Source: ABdhPJwdrjF/1DreMzVejMUrvBvcozcZvb0/EC7Hp99yU6JocUFjFK5jopJTrqjQ+Ok0sUi4x2Kdiw==
X-Received: by 2002:a7b:c1d2:: with SMTP id a18mr9728030wmj.194.1633382570544;
        Mon, 04 Oct 2021 14:22:50 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id g12sm2070863wme.3.2021.10.04.14.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 14:22:49 -0700 (PDT)
Date:   Mon, 4 Oct 2021 23:22:48 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, Peter Chen <peter.chen@kernel.org>,
        David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH v7 4/7] usb: phy: tegra: Support OTG mode programming
Message-ID: <YVtwqLlG8+S9cooU@orome.fritz.box>
References: <20210912181718.1328-1-digetx@gmail.com>
 <20210912181718.1328-5-digetx@gmail.com>
 <29ae631d-cc8d-663e-3ce2-db00f3470365@gmail.com>
 <YVtslrGXStvdO2IS@orome.fritz.box>
 <94949858-6089-06df-1226-f7974a3ae6bf@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="QrHWM9Xgt4I+yCs7"
Content-Disposition: inline
In-Reply-To: <94949858-6089-06df-1226-f7974a3ae6bf@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--QrHWM9Xgt4I+yCs7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 05, 2021 at 12:13:48AM +0300, Dmitry Osipenko wrote:
> 05.10.2021 00:05, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Mon, Sep 27, 2021 at 07:36:52PM +0300, Dmitry Osipenko wrote:
> >> 12.09.2021 21:17, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> Support programming USB PHY into OTG mode.
> >>>
> >>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> >>> ---
> >>>  drivers/usb/phy/phy-tegra-usb.c   | 198 ++++++++++++++++++++++++++++=
+-
> >>>  include/linux/usb/tegra_usb_phy.h |   5 +
> >>>  2 files changed, 198 insertions(+), 5 deletions(-)
> >>
> >> Greg / Felipe, could you please ack this patch to allow Thierry to take
> >> this series via the Tegra tree? It depends on the soc/tegra patch of
> >> this patchset.
> >=20
> > Looking at the series, I don't think this necessarily needs to go
> > through the Tegra tree. Given that you have backwards-compatibility with
> > older device trees, applying this separately to the USB tree should work
> > fine. Once the soc/tegra and DT bits and the USB bits get combined they
> > should enable the new functionality, but nothing should break if things
> > are applied separately.
> >=20
> > If so, I can just pick up the rest and let Felipe or Greg pick this one
> > up.
> >=20
> > Dmitry, can you confirm that this patch should be applicable separately?
> > If so:
> >=20
> > Acked-by: Thierry Reding <treding@nvidia.com>
> >=20
>=20
> This PHY patch has this hunk:
>=20
> +	phy->pmc_regmap =3D dev_get_regmap(&pmc_pdev->dev, "usb_sleepwalk");
> +	if (!phy->pmc_regmap)
> +		return -EINVAL;
>=20
> If this patch and the DT patches will be applied before the soc/tegra
> patch, then USB PHY driver will fail to probe.

I had missed that. I was assuming that this other hunk took care of the
backwards-compatibility:

+       /* older device-trees don't have PMC regmap */
+       if (!phy->pmc_regmap)
+               return 0;

but that's rather pointless given your check above, right? Why not just
return 0 instead and let the remaining code skip sleepwalk configuration
if the regmap doesn't exist?

Thierry

--QrHWM9Xgt4I+yCs7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmFbcKgACgkQ3SOs138+
s6EHIw//dsUnageoG8jJ29+4mn23IGoiXdvVW3fJy6EbavvX1KknsIq9kcmL+dph
dkfa95/iIC8ohjB6u6zuMdRLs2TLdZoDRJ+xjSkwlAssvo+adGLjKnEeWAWAf29f
cMqK55oIyczW1Ti4udHz8WikuIZSFIex8pu/u7O3bOqmpjKCLv2U/vRqaFOg5JlY
JOdtLWl+OW4DJGGuqFM+pxra/xxGRuyMgjrSHLhDDZIQ88xzecmA62aE5H7CxTa4
aX7AAeAK59xN7u/dY2tG+qyZuDPGl0DtEAI/EuETc6/yfJ9SytYnhlvh4DUEGKrw
fChIvFPVbK8mJLjLNSq29V3QmheFuLeuU+aK0t8L+FARY50M7LA/bjDxPClWvtsw
7SjxZCxy8iWybNtJi35dW/nKMTzqrGo630GGI7qN3mK0dgF4P2JrDtzZG3YRDotH
RZe6vnssAkxoPcrQi+kiBzmhgBTVekeTJYINqeKNhrdoJXcEJ39Mo0W+WVvogvqn
3HxFP8G5u5BRmEqAKpwWzcOPOgss7kbgFFn6Mg8EqJAMoS7AC/dSkCzuDSLQ9gzY
F371DZW4O9kwriPohZkC3HNcSf9GuLO8s0uRB4Ne+LtmC9yEKwo5jtTxH2HiHTwp
D57XYWwQcOkxByfmLavfInlWUUK72LFMRxNhG+c4JHLKTC7K+6c=
=XcKw
-----END PGP SIGNATURE-----

--QrHWM9Xgt4I+yCs7--
