Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA0C1C433EF
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Oct 2021 14:01:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B0EC5611F2
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Oct 2021 14:01:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230123AbhJUODv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 21 Oct 2021 10:03:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231408AbhJUODv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 21 Oct 2021 10:03:51 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FC26C0613B9;
        Thu, 21 Oct 2021 07:01:35 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id d198-20020a1c1dcf000000b00322f53b9b89so849340wmd.0;
        Thu, 21 Oct 2021 07:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Jenu2GqZVZH+2Ih+CmGTNLbryuPvJisikb5F8so+Md8=;
        b=QWSC6GSDIZfelegRe+qktS7pst+13f5KiQaRSA6AAtuWLSCtTEV5mGNBzFAmKDTrG0
         9gS9D9zjGu8sypPKOmOa+XoFObQ12l5rj30/Os8AuOzRshAtJEwXTcJ+eF9fAXNqYZKX
         vAgQXPCLzNpDTGJOkbivzPlybXHrjjsugfs56sDxqRFsMnZfrc7Skb9FPJcpleKUV83R
         /y+0MqEF5RSfql+pCkWvZZj2Ls0/hAGMNdw+BheDMmRxMZZNJTKk0vabwUrFPC03WVGs
         bPZWUPVoqf618VKNJ18fqnvm9zr5Q6tOSOhdHB2SznuE5CKyCJu2vYS2NpAvuAhJ12Oo
         0YQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Jenu2GqZVZH+2Ih+CmGTNLbryuPvJisikb5F8so+Md8=;
        b=nNzn3mycuumdFXZ/ezKsBZIV373LxLe5IzQxAarbMYAtQkiL7frl73AD5XxHSxsaEN
         3xp+3JgDsLFl8cYsXL9LJ2RPOizOqsp7q75XMeQ+srroBWirg2bYgXV7ddCqG7i3CjZs
         l0pMSY380njPNRAbuwwj/ySDmS1NoskYxgfPcsb7Om/+awsaIrfTYHaLlWuCAD9TF/db
         XR1o4QkZcmIh5Gx/okP5bxP0wXdSgcnL1hdsMuPTy0hMhxVmGyXSn0aToRiy1iyze3WL
         mNuNomvDKaMvzSovJPvmkoZO2l9gYUT9cKdS+8KXGBGaMRXFfa4AYm+tDxL+qJDrt71F
         9M5A==
X-Gm-Message-State: AOAM5306qwsGjSNbq1KRH9fY7ryIu92BSCTrsYKpEiDa+BCJ45PcHr+u
        y2yMDWNRjM4HTAwAwOiEbSc=
X-Google-Smtp-Source: ABdhPJxA1TcIDABdAyaJZxx55EXa7MqrEnUHayHNllPzq4tjSTcDstRy1qKXr1axV4RwmPFYv0VoNg==
X-Received: by 2002:a1c:f615:: with SMTP id w21mr6742465wmc.16.1634824893583;
        Thu, 21 Oct 2021 07:01:33 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id y8sm660786wrq.39.2021.10.21.07.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 07:01:32 -0700 (PDT)
Date:   Thu, 21 Oct 2021 16:01:31 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        JC Kuo <jckuo@nvidia.com>, Nicolas Chauvet <kwizart@gmail.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1] usb: xhci: tegra: Check padctrl interrupt presence in
 device tree
Message-ID: <YXFyu+Q5ifG8Au9w@orome.fritz.box>
References: <20211021115501.14932-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="BOA8n6/bNvmkjro8"
Content-Disposition: inline
In-Reply-To: <20211021115501.14932-1-digetx@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--BOA8n6/bNvmkjro8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 21, 2021 at 02:55:01PM +0300, Dmitry Osipenko wrote:
> Older device-trees don't specify padctrl interrupt and xhci-tegra driver
> now fails to probe with -EINVAL using those device-trees. Check interrupt
> presence and disallow runtime PM suspension if it's missing to fix the
> trouble.
>=20
> Fixes: 971ee247060d ("usb: xhci: tegra: Enable ELPG for runtime/system PM=
")
> Reported-by: Nicolas Chauvet <kwizart@gmail.com>
> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/usb/host/xhci-tegra.c | 32 +++++++++++++++++++++-----------
>  1 file changed, 21 insertions(+), 11 deletions(-)

Thanks for typing this up. A couple of minor comments below.

> diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
> index 1bf494b649bd..47927a1df3dc 100644
> --- a/drivers/usb/host/xhci-tegra.c
> +++ b/drivers/usb/host/xhci-tegra.c
> @@ -1454,10 +1454,13 @@ static int tegra_xusb_probe(struct platform_devic=
e *pdev)
>  		goto put_padctl;
>  	}
> =20
> -	tegra->padctl_irq =3D of_irq_get(np, 0);
> -	if (tegra->padctl_irq <=3D 0) {
> -		err =3D (tegra->padctl_irq =3D=3D 0) ? -ENODEV : tegra->padctl_irq;
> -		goto put_padctl;
> +	/* Older device-trees don't specify padctrl interrupt */
> +	if (of_property_read_bool(np, "interrupts")) {

Can't we just rely on the return value from of_irq_get() instead of
explicitly checking for the presence of the "interrupts" property? All
we really want is to make this interrupt optional. As far as I can tell,
of_irq_get() will return -EINVAL (via of_irq_parse_one() and then
of_property_read_u32_index()) if the property doesn't exist, so I'd
think it should be possible to turn this into something like this:

	tegra->padctl_irq =3D of_irq_get(np, 0);
	if (tegra->padctl_irq =3D=3D -EINVAL)
		tegra->padctl_irq =3D 0;

> +		tegra->padctl_irq =3D of_irq_get(np, 0);
> +		if (tegra->padctl_irq <=3D 0) {
> +			err =3D (tegra->padctl_irq =3D=3D 0) ? -ENODEV : tegra->padctl_irq;
> +			goto put_padctl;
> +		}
>  	}
> =20
>  	tegra->host_clk =3D devm_clk_get(&pdev->dev, "xusb_host");
> @@ -1696,11 +1699,15 @@ static int tegra_xusb_probe(struct platform_devic=
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
> @@ -2132,7 +2139,7 @@ static __maybe_unused int tegra_xusb_suspend(struct=
 device *dev)
>  		tegra->suspended =3D true;
>  		pm_runtime_disable(dev);
> =20
> -		if (device_may_wakeup(dev)) {
> +		if (device_may_wakeup(dev) && tegra->padctl_irq) {

I wondered if perhaps there was a way to make device_may_wakeup() return
false if we don't have that IRQ. Intuitively I would've thought that the
calls to device_wakeup_enable() and device_init_wakeup() set this all up
but after looking at the code I'm not sure if omitting them would
actually cause device_may_wakeup() to return false. That would certainly
be nicer than these double checks.

>  			if (enable_irq_wake(tegra->padctl_irq))
>  				dev_err(dev, "failed to enable padctl wakes\n");
>  		}
> @@ -2161,7 +2168,7 @@ static __maybe_unused int tegra_xusb_resume(struct =
device *dev)
>  		return err;
>  	}
> =20
> -	if (device_may_wakeup(dev)) {
> +	if (device_may_wakeup(dev) && tegra->padctl_irq) {
>  		if (disable_irq_wake(tegra->padctl_irq))
>  			dev_err(dev, "failed to disable padctl wakes\n");
>  	}
> @@ -2179,6 +2186,9 @@ static __maybe_unused int tegra_xusb_runtime_suspen=
d(struct device *dev)
>  	struct tegra_xusb *tegra =3D dev_get_drvdata(dev);
>  	int ret;
> =20
> +	if (!tegra->padctl_irq)
> +		return -EOPNOTSUPP;
> +

Similarly, couldn't we enable all that runtime PM stuff conditionally so
that these functions would only ever get called when runtime PM is
actually available? That seems a bit nicer than having this return
-EOPNOTSUPP.

Thierry

--BOA8n6/bNvmkjro8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmFxcrgACgkQ3SOs138+
s6HvVQ/+Myd2kXFOTgsuH0PDcev44JhEZW5yiTo9q5pVPayqCqOju+hD3MpegGXs
5ZwTUmuP0gKunLoommLnUUReM81gD9yJmMojPzeXHqVXMH6NKzCuTyqHUlVKT+6L
zz4O7GGD6Iq/a9+iGNRd0nTv5VrEnkut/KKtWRPWE+YVxlIT6IGak3vDUQaPAbjK
+9va7kAFk+DhfyC1P8ELComqXWj6HUx2d8Gxumv5J0WGesdPvJw9hwLzMUkOHJkc
VRUMctSKUefE1F63Ly/N7w5bgIM/dQ2WTSenC70q4uVC6aUoC8DhhkfsRZ6i1Xxu
VrZqvM8VuK5PrBaOk9MH6idg51yTw5//1X5jfAa1BMXGX+JmjMPlmOE10d9xTo9U
cC8YQu1H6RmPgcek1iSCpPG5Yfnw4GW8nqtl8PgibO+2dDY0m8gu8KhSPrte8WhF
9IavcRg44lnVxOx/qzNvRGhA9Pm/owuSV52f615EIy5ZMXEngA2QFuVuMFeEaahE
mhB1Geqro8+tpWL4OO9fzcMukImI6fgUmcIHX1xZ327JVr3ngNx4r83R4SpDm2rf
c9FUdXuCrcmtbe7MaK6cjthPDXUnZh6SI1ff2BbxOjLlmkc+KdyWDw1AOWX1xBjB
v/+k8SssaWcQ+4+KcTxDF2+D1JXVNpqaueJhsvfRl6l0LiPTMrU=
=ZYNf
-----END PGP SIGNATURE-----

--BOA8n6/bNvmkjro8--
