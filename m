Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12718C4332F
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Oct 2021 17:55:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EC65B61263
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Oct 2021 17:55:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242862AbhJGR5Q (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 7 Oct 2021 13:57:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233768AbhJGR5P (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 7 Oct 2021 13:57:15 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E180C061570;
        Thu,  7 Oct 2021 10:55:21 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id r7so21558673wrc.10;
        Thu, 07 Oct 2021 10:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=GN5gadcVxRW0/dWf5obdZrMuIIY/mSpFCL/VLq2PcMI=;
        b=ATkzJ5suTLby93G+Jf5ECZ4Kse4d6Tt+RI50oiT7elfe8GtVDdJzUT6PKp/2Xjw9LK
         D+B8bLKl1SVZTcFbkLuBi8HkA6t9vKK1h7OBpt+KNzNb36ONYynwJ6HsUb2xbDvw9QfP
         us8kcQRqmYK6SqLgs6J3BZ5Amq6inlB6SYe3KbnkjawFjrKH/jmDtgUQ9gAMFA0IgyKJ
         UBTG1ZDGmjXfO76njwBzoK7/QWAFr3LDdpK1optVB0+4Hz4AMVsn96IY4yRQFu3M1TdQ
         BmXnm1Yp1BOnUeoLEdPsSjJTrC9hbY7VkIut1JA1YfLGfYtslkTuzu/KM78STz0a4FOE
         rF6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GN5gadcVxRW0/dWf5obdZrMuIIY/mSpFCL/VLq2PcMI=;
        b=4tgT7NIQhiPA2gFkphg8+qomz1Lz0E7hRNy+NH5rrz2ZpEkkdA5J2L2Okxyb9ozmQ5
         QZ0zYFnLNzw1XZ4+s6EUANGN2AyoGTWr/b/Rk18ImC7kgiQ58HbHTto6beuny4gq3TKr
         LrfnF3z60N5TNDnt+4bMcss1oYpkhW7LDx+2qN47989XDlDrlRmidBxh4lsPFhcY8KDE
         4+1qcLpIyzYCc4OaHN5GGKLG03fYUo9KUPIAF10m7b1GdLgsvzHO2isZEUUrdGchiMk9
         WkNPlQG51uz3LWEFHgjIZiHfmvwUEOg+eDvb+V9ZJYl/nJ+THwlNxto7QCz7dwv90J2c
         x1hg==
X-Gm-Message-State: AOAM532LFLy8zp8VOMSKwefqUDmGZ7//mGYAOXaXuoCumTP0OHdg1oyt
        QOEiKX5cnq0Jr2eDaVIPi2s=
X-Google-Smtp-Source: ABdhPJzrLInW4LCr55YGxgpVjG1U/ZqbR0mqwqupL9iDTS5inXXiGRBukzjvoIK+upKaPaXvbCJBEw==
X-Received: by 2002:adf:b302:: with SMTP id j2mr7213302wrd.285.1633629320177;
        Thu, 07 Oct 2021 10:55:20 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id v10sm46856wri.29.2021.10.07.10.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 10:55:19 -0700 (PDT)
Date:   Thu, 7 Oct 2021 19:55:18 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, JC Kuo <jckuo@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Yang Yingliang <yangyingliang@huawei.com>,
        linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [v3] usb: xhci: tegra: mark PM functions as
 __maybe_unused
Message-ID: <YV80ht6e7rfK0cfx@orome.fritz.box>
References: <20211005112057.2700888-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qXkdwZl/QpLWXbMS"
Content-Disposition: inline
In-Reply-To: <20211005112057.2700888-1-arnd@kernel.org>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--qXkdwZl/QpLWXbMS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 05, 2021 at 01:20:28PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> The added #ifdefs in the PM rework were almost correct, but still
> cause warnings in some randconfig builds:
>=20
> drivers/usb/host/xhci-tegra.c:2147:12: error: 'tegra_xusb_resume' defined=
 but not used [-Werror=3Dunused-function]
>  2147 | static int tegra_xusb_resume(struct device *dev)
>       |            ^~~~~~~~~~~~~~~~~
> drivers/usb/host/xhci-tegra.c:2105:12: error: 'tegra_xusb_suspend' define=
d but not used [-Werror=3Dunused-function]
>  2105 | static int tegra_xusb_suspend(struct device *dev)
>=20
> Replace the #ifdef checks with simpler __maybe_unused annotations to
> reliably shut up these warnings.
>=20
> Fixes: 971ee247060d ("usb: xhci: tegra: Enable ELPG for runtime/system PM=
")
> Reviewed-by: JC Kuo <jckuo@nvidia.com>
> Link: https://lore.kernel.org/all/20210421135613.3560777-2-arnd@kernel.or=
g/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v3: fix reference to original commit.
> ---
>  drivers/usb/host/xhci-tegra.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--qXkdwZl/QpLWXbMS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmFfNIYACgkQ3SOs138+
s6EOIg/+Nbts8TwWrF20o18n0rSfockwRF9SwRwHLNHe8XPLpW/Dzd3wbgITfpAa
XI/1pOKTxUyaYgIrPE23HZhlYzKsfrMZf9KRR70Etd7SrcBqONchh3DvhigBVYyg
HbeNPmIpQgB/Fno2ZJcsuIFWoLBry51InCpsGlz5NgxvOddBreTrQro2RaC92N7Y
xoW0qZarfCp7iEgJzAc88rR7Ra38HZFHYFjsvd/WqRzhektBi++bqi7QhTxYScEE
rrYNZQbKE5EFR8K7eYiaHOHcin3TszwxD7nOkdRl4/1O+OV7Wf8tTEz+TB9FOS4j
dbfGigDC9SPA1QV0uRtUv81m6qVvePX8TDVvZhNNEYY2l3Y1C1huOwAj9UFWOLuV
Vy/y8XPubaK9r+VuiUjKDOUkGTeyi8p+QEPlAg9ARmLZfBFUpTUgNoOkYVhO9T26
H46URITsxO4lIkaCP2T/lhrcfktkEkW5z+jPYOsxut5SdbPqWV9pwAqz0OmvhG4b
uy1tIzA+8rF3SsJ/xxZULd3iYDhmhepsabhw/XX3x0ZmlEC4Ki20mPfLD29x63Gl
W8WXwpmOF5SSSIEV1BK2SI1rcx0GG4CK8GZUfPK6UwwfHROfeo/O3TNoD67YnNr/
Kj1/dq7whDUQvrl7KYD6VMIrKvnApeQi9FjFfOmZdUuhllL+Lu4=
=/who
-----END PGP SIGNATURE-----

--qXkdwZl/QpLWXbMS--
