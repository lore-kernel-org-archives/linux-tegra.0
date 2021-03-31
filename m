Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94DB7C433B4
	for <linux-tegra@archiver.kernel.org>; Wed, 31 Mar 2021 16:36:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 68A096100B
	for <linux-tegra@archiver.kernel.org>; Wed, 31 Mar 2021 16:36:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234380AbhCaQgH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 31 Mar 2021 12:36:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233816AbhCaQgB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 31 Mar 2021 12:36:01 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9965CC061574;
        Wed, 31 Mar 2021 09:36:00 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id l18so23073504edc.9;
        Wed, 31 Mar 2021 09:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6nHxMXGirVVZGY9b7vdftDmREv2drYnk0NA80veHIUk=;
        b=fzyv0B9SsRcyyStEnpS2VyZFOhN6WtLdtFCYHeVq7NgFtBnBZo7Pttl2NgpTME1Uxn
         vcxHLYgutCOJ4ocRWWNn38b0a/JLnzzX3iIoQ2D48i5+ej/+jdv49th2OVNs/UtAt22x
         NyOwRVmCGMbqYSsSufM8xFMcIqkWzHo5YCryOGAhFaZ3UDS74F/hws2Azuttd6nNCeUy
         ZfzYWnIJBp5hOe5Ob7HBxokG4tTQ9JJL0ZDLIqUwhjDiZSb+f3q8+apAF6Z8M8z54zG1
         c3Nt6Ovmv3ZpdutY5vC3H8kT4skA3W2t7laXgJQBRCvVvgMnWwM7w1Be5NJ50y8zVprW
         wIPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6nHxMXGirVVZGY9b7vdftDmREv2drYnk0NA80veHIUk=;
        b=CtaqP9mD7uNMT4kAfr/ECZK5ZLbHxdwSIwQvfYXzYF0OwDPyonYIrGmx4+Y4gb5yau
         E8zGuWf25kLO8tudMPgJLKO+pU2fyxzRsFAVmtiFScr6GWUjPhzFhZePwjcBQSQG7X57
         CoATs0UanmLBfLANNVy32iaZy/x4xQGfVzr715IZm9jAZor91hC/NJIMZOrktgM6l8HQ
         nU3bUk5sRx5EAn9vI4coOOdvrCzzncLyk7zWvJn/ZIJTqERaVn7zSo7y+HWD2BpTxFun
         cXPwGGo9XqztgDFGFTGBa2Xlx+SIGorde0EMDgKfpifQmMMzKiPwb/xf2+Fxx79QH1G3
         ufeg==
X-Gm-Message-State: AOAM5316AhkbfNafjQAIKmYWm47twQprx3WA2ebOsgvoV3OmbxOjuroB
        0INsNZ0OdFV3iZxDaGyNykY=
X-Google-Smtp-Source: ABdhPJxWO99NjgjIfS9Qm2dtjbPyQHhJKtxYAv/jtAbhyy9YzNmTkKK9yAtgXtqy2ZaT8LFxzbVMGA==
X-Received: by 2002:a05:6402:2cd:: with SMTP id b13mr4854792edx.55.1617208559411;
        Wed, 31 Mar 2021 09:35:59 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id q16sm1527820ejd.15.2021.03.31.09.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 09:35:57 -0700 (PDT)
Date:   Wed, 31 Mar 2021 18:36:24 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        JC Kuo <jckuo@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v8 05/13] phy: tegra: xusb: Add Tegra210 lane_iddq
 operation
Message-ID: <YGSlCKCcQ1rGLT/Y@orome.fritz.box>
References: <20210325164057.793954-1-thierry.reding@gmail.com>
 <20210325164057.793954-6-thierry.reding@gmail.com>
 <YGMz/IgGxBlBBqzM@vkoul-mobl.Dlink>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="1nkCcQX9So4jDDnZ"
Content-Disposition: inline
In-Reply-To: <YGMz/IgGxBlBBqzM@vkoul-mobl.Dlink>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--1nkCcQX9So4jDDnZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 30, 2021 at 07:51:48PM +0530, Vinod Koul wrote:
> On 25-03-21, 17:40, Thierry Reding wrote:
>=20
> > +#define XUSB_PADCTL_UPHY_MISC_PAD_PX_CTL2(x) (0x464 + (x) * 0x40)
> > +#define XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_IDDQ BIT(0)
> > +#define XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_IDDQ_OVRD BIT(1)
> > +#define XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_SLEEP_MASK (0x3 << 4)
> > +#define XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_SLEEP_VAL (0x3 << 4)
> > +#define XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_PWR_OVRD BIT(24)
> > +#define XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_IDDQ BIT(8)
> > +#define XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_IDDQ_OVRD BIT(9)
> > +#define XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_SLEEP_MASK (0x3 << 12)
> > +#define XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_SLEEP_VAL (0x3 << 12)
>=20
> GENMASK() for these please
>=20
> With that fixed:
>=20
> Acked-By: Vinod Koul <vkoul@kernel.org>

Done, thanks!

Thierry

--1nkCcQX9So4jDDnZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBkpQgACgkQ3SOs138+
s6HOKw//R4CYL9ajdGjtcZbxQooMD3A3dzdxD9LNZf0pSQeGJAAJqYvBk30RWU2Y
VOizF3VaITILUOQrBaQz0g5JUwtF432X5a5Kc6hRCXyf+aJ4WHYnWlMXVYR/5J48
zntikhmi3Mw6G1uHPDOMR9doZbw03SsPObFKNoFZ8CKrf3nNVGB7zjewiDOt8HHF
ObHs3pxPxKQ6rBiultLKv9CEFpktoFUsgdmj82eRYPmEXbK4ZHYvXPzkS2ACCHX/
bKTGRZfWM41yFBAHDPz3ePqqBVqtXsZShHV+ID/gZbA2OgzCLFsMxupN9GCtzVxf
Q8z8VUG6RwWEXrjKTwn5JefzCK94cXZJsSzk+OnQXQi743xxT4yn1ydewOZ0zdWv
KLk0d0vVB2uRZlmHSIl8hDvy4tcnn33hlrqIvwkxIELsSp34vm74RRq23MnSmJ2A
SoftwtvJBJ0UkL+X8qOx2D0IUPjjgulgGsUbetGns0hM5ChmPZ85w/ml3TlaSwnn
yuHJjhPOsSxacHtN80QaKW9R/izdwyE+0Mzly9dKRI9oeq1yRjAqo40awp5jFgNJ
pEfS0kzlnFWvmpX9xxCAi6al8do6RHMx2ys/Oee/Np1qKvwzQXhBYH0bhyGEPdmt
ap/phUd7pA2VzW7rSwLxL+2e76Ojnc/YFLNdjL1Kt9sO6Uk0fuQ=
=sqQz
-----END PGP SIGNATURE-----

--1nkCcQX9So4jDDnZ--
