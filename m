Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10655C433EF
	for <linux-tegra@archiver.kernel.org>; Thu,  4 Nov 2021 08:29:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EDC40610A8
	for <linux-tegra@archiver.kernel.org>; Thu,  4 Nov 2021 08:29:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230152AbhKDIcV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 4 Nov 2021 04:32:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230084AbhKDIcV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 4 Nov 2021 04:32:21 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E404C061714;
        Thu,  4 Nov 2021 01:29:43 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id b12so7359409wrh.4;
        Thu, 04 Nov 2021 01:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=pcwd8GDYliHD4EuN9qh2enVI/ZU5CIFHUNJvQUBYilI=;
        b=dGUbbax9kMiAJm1Pwhzjm3VGm1knzly+h1/Fephby+5bqqt/Mz30E5nEmcI7IvpB+B
         1zb44ty9JLoyAnBs+DN9Gr8pkW7lHwmJdcUmptUo3MNcK7kmoVzGeSD1uZtVBHW661sY
         kGuWRij3/l5fQQ5nY8b/XbRMHUdRwxNa4cCqWFdTXK6gb1lDSyzcM97Gjk1JAUHrjfjU
         CJfaOgncKZfgsy5khYD5YZcrLtWOmMrUEmrVNlrt/gK59gge9568416eaeUBfLdRXq40
         YErhxvGgcSFLTH06z+eYOHaO7A9pZZ9sHrpXlWGZydQjBnLGUhOS2eR9i8Sdb9rsVK01
         X0Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pcwd8GDYliHD4EuN9qh2enVI/ZU5CIFHUNJvQUBYilI=;
        b=Qd8zezkBeU6WfW57TaEG47dj5BRIlB6lf6d7IXTRPTD/lbeUy4PeZnDDV/F0SH4IkV
         le5p16OuIOzlZtWb+MztE9xksosueZYQTZlqw2GhTKodqrMxwXqLFLZyX1y92lbLQBg/
         aENSIY0Xf/0S8WLDHN+caRteQlBkQe7HjYIMHoBKNdskzlFukFPS1bUk2fH1/PKOth8w
         ff14M6jMcnozl4wob+coqitB2lihOZAfg5lH/TT1Gqa1LBlpcLX6xGYP+1jFIcfY8zvd
         dbhPx4OV0JETpSls9xU6hDsyZAqGCFTvdWjuBRvWFPtEKBOu10gcvjHKrLHMJWIaL/qo
         DIJA==
X-Gm-Message-State: AOAM533DpsihJ2ecUn5UxQHxV00F6o38EpuAJGHiWdWO1CTYn7l1AULl
        soUdz2v0E/JMi526+rv1EaE=
X-Google-Smtp-Source: ABdhPJwDLiXTSPiambILjtqwczoTMpJV8US3YrI7+PEySnF9sH1GZDt1S0qfQU+l3YSZ3lAZr5uj+w==
X-Received: by 2002:adf:f551:: with SMTP id j17mr61148688wrp.392.1636014581916;
        Thu, 04 Nov 2021 01:29:41 -0700 (PDT)
Received: from orome.fritz.box ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id e3sm4242898wrp.8.2021.11.04.01.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Nov 2021 01:29:41 -0700 (PDT)
Date:   Thu, 4 Nov 2021 09:29:38 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        JC Kuo <jckuo@nvidia.com>, Nicolas Chauvet <kwizart@gmail.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2] usb: xhci: tegra: Check padctrl interrupt presence in
 device tree
Message-ID: <YYOZ8sYB94hZlncn@orome.fritz.box>
References: <20211102184801.7229-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Qycldy+Ti1hSw7yP"
Content-Disposition: inline
In-Reply-To: <20211102184801.7229-1-digetx@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--Qycldy+Ti1hSw7yP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 02, 2021 at 09:48:01PM +0300, Dmitry Osipenko wrote:
> Older device-trees don't specify padctrl interrupt and xhci-tegra driver
> now fails to probe with -EINVAL using those device-trees. Check interrupt
> presence and keep runtime PM disabled if it's missing to fix the trouble.
>=20
> Fixes: 971ee247060d ("usb: xhci: tegra: Enable ELPG for runtime/system PM=
")
> Cc: <stable@vger.kernel.org> # 5.14+
> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
> Reported-by: Nicolas Chauvet <kwizart@gmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>=20
> Changelog:
>=20
> v2: - Use of_irq_parse_one() to check interrupt presence status in device=
-tree,
>       instead of checking interrupt properties directly.
>=20
>     - USB wakeup and runtime PM are kept disabled if interrupt is missing,
>       instead of returning -EOPNOTSUPP from RPM-suspend callback.
>=20
>     - Added debug message, telling about the missing interrupt.
>=20
>  drivers/usb/host/xhci-tegra.c | 40 ++++++++++++++++++++++++-----------
>  1 file changed, 28 insertions(+), 12 deletions(-)

I like this version much better. Two minor nits:

>=20
> diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
> index 1bf494b649bd..0a7ab596be85 100644
> --- a/drivers/usb/host/xhci-tegra.c
> +++ b/drivers/usb/host/xhci-tegra.c
> @@ -1400,6 +1400,7 @@ static void tegra_xusb_deinit_usb_phy(struct tegra_=
xusb *tegra)
> =20
>  static int tegra_xusb_probe(struct platform_device *pdev)
>  {
> +	struct of_phandle_args irq_arg;

Could've been just "args". There's no other "arg" variable here, so no
need for an irq_ prefix to differentiate.

>  	struct tegra_xusb *tegra;
>  	struct device_node *np;
>  	struct resource *regs;
> @@ -1454,10 +1455,16 @@ static int tegra_xusb_probe(struct platform_devic=
e *pdev)
>  		goto put_padctl;
>  	}
> =20
> -	tegra->padctl_irq =3D of_irq_get(np, 0);
> -	if (tegra->padctl_irq <=3D 0) {
> -		err =3D (tegra->padctl_irq =3D=3D 0) ? -ENODEV : tegra->padctl_irq;
> -		goto put_padctl;
> +	/* Older device-trees don't have padctrl interrupt */
> +	err =3D of_irq_parse_one(np, 0, &irq_arg);
> +	if (!err) {
> +		tegra->padctl_irq =3D of_irq_get(np, 0);
> +		if (tegra->padctl_irq <=3D 0) {
> +			err =3D (tegra->padctl_irq =3D=3D 0) ? -ENODEV : tegra->padctl_irq;
> +			goto put_padctl;
> +		}
> +	} else {
> +		dev_dbg(&pdev->dev, "%pOF doesn't have interrupt\n", np);

This seems a bit vague. I think it'd be better to include information
about the consequence of this interrupt being missing and/or some hint
about what should be done about it. Perhaps something like:

		dev_dbg(&pdev->dev, "%pOF is missing an interrupt, disabling PM support\n=
", np);

With that fixed:

Acked-by: Thierry Reding <treding@nvidia.com>


I've also run this through our GVS test farm, and didn't spot any
regressions, so:

Tested-by: Thierry Reding <treding@nvidia.com>

Thierry

>  	}
> =20
>  	tegra->host_clk =3D devm_clk_get(&pdev->dev, "xusb_host");
> @@ -1696,11 +1703,15 @@ static int tegra_xusb_probe(struct platform_devic=
e *pdev)
>  		goto remove_usb3;
>  	}
> =20
> -	err =3D devm_request_threaded_irq(&pdev->dev, tegra->padctl_irq, NULL, =
tegra_xusb_padctl_irq,
> -					IRQF_ONESHOT, dev_name(&pdev->dev), tegra);
> -	if (err < 0) {
> -		dev_err(&pdev->dev, "failed to request padctl IRQ: %d\n", err);
> -		goto remove_usb3;
> +	if (tegra->padctl_irq) {
> +		err =3D devm_request_threaded_irq(&pdev->dev, tegra->padctl_irq,
> +						NULL, tegra_xusb_padctl_irq,
> +						IRQF_ONESHOT, dev_name(&pdev->dev),
> +						tegra);
> +		if (err < 0) {
> +			dev_err(&pdev->dev, "failed to request padctl IRQ: %d\n", err);
> +			goto remove_usb3;
> +		}
>  	}
> =20
>  	err =3D tegra_xusb_enable_firmware_messages(tegra);
> @@ -1718,13 +1729,16 @@ static int tegra_xusb_probe(struct platform_devic=
e *pdev)
>  	/* Enable wake for both USB 2.0 and USB 3.0 roothubs */
>  	device_init_wakeup(&tegra->hcd->self.root_hub->dev, true);
>  	device_init_wakeup(&xhci->shared_hcd->self.root_hub->dev, true);
> -	device_init_wakeup(tegra->dev, true);
> =20
>  	pm_runtime_use_autosuspend(tegra->dev);
>  	pm_runtime_set_autosuspend_delay(tegra->dev, 2000);
>  	pm_runtime_mark_last_busy(tegra->dev);
>  	pm_runtime_set_active(tegra->dev);
> -	pm_runtime_enable(tegra->dev);
> +
> +	if (tegra->padctl_irq) {
> +		device_init_wakeup(tegra->dev, true);
> +		pm_runtime_enable(tegra->dev);
> +	}
> =20
>  	return 0;
> =20
> @@ -1772,7 +1786,9 @@ static int tegra_xusb_remove(struct platform_device=
 *pdev)
>  	dma_free_coherent(&pdev->dev, tegra->fw.size, tegra->fw.virt,
>  			  tegra->fw.phys);
> =20
> -	pm_runtime_disable(&pdev->dev);
> +	if (tegra->padctl_irq)
> +		pm_runtime_disable(&pdev->dev);
> +
>  	pm_runtime_put(&pdev->dev);
> =20
>  	tegra_xusb_powergate_partitions(tegra);
> --=20
> 2.33.1
>=20

--Qycldy+Ti1hSw7yP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmGDme8ACgkQ3SOs138+
s6GevxAAvkTTp7npOtsuFJy7thXLlayo+hsSGRMPEEatIEM8UPncC9OM4ljiBVWY
3nCRClCxbxrr+FS6ChXsDwh1QOKZuYJdLQk5Hwny3prfp2mH7Ibzgp+vU4RXQlKw
zByURJ4FdwFUk+avxtT/N20jzgkEy0gaVPm7aLajInXeRXcmZ9wQZY0TmTadcB5p
cRj1czJDa7tWmkIEvSjLUHb1X+yyMiEq151VUxI8/NzWcXSQmnCN16hV6d0D6MZ9
eK89pk3/RiBoRDK2yfv33I1tIwdRLvXi9gOQuN/4tSbf1Y94a8+Zq2FuRKfWGSB4
XSasfrDxdpUchELjlapcHjV8JEF5EyGhaVCOByv6k2QtBjG/SU+S+LpDQPY4KwzO
mJqRJdvgSSJDRp0A6629p/ciyiey30CJN24WIMMnTXpjefn53/stQVlSlfT3vnq3
4hsCm3l508oAqqohdnFaThWjF5KqM5wWAO7FQqBLi2xPW5LvHeve6METUlQA+SFm
nSwafHVqrbtoPGWBBUAZZaQjpLdVWIC5mXfsVfvtAj3po7gwf7z7tAuUEHpEjfrS
pR+UD/qtgedI8VTKo2eaO0eIqnzI+ZCA2hL0iDB+F+2q5iXOPqdI5Wji9FDwMD5d
SXK60cUYla7TUnCsXwLHzL4Es4CQv1aXPgdSBQVMc5BMmOJdIlk=
=NQzK
-----END PGP SIGNATURE-----

--Qycldy+Ti1hSw7yP--
