Return-Path: <SRS0=0tg+=DF=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 634FAC2D0A8
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Sep 2020 14:07:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1E20B21924
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Sep 2020 14:07:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OVAG3tfR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726424AbgI1OG7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 28 Sep 2020 10:06:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726291AbgI1OG7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 28 Sep 2020 10:06:59 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0838CC061755;
        Mon, 28 Sep 2020 07:06:59 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id z1so1515027wrt.3;
        Mon, 28 Sep 2020 07:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WfJczYERUFdenR05uGVZr/+UQWZo6E3KWcw73dbx8xM=;
        b=OVAG3tfRnVO4B91UkFjR+7WYJqkELHiarMMp3PY6hV+bBupz6+vAcNn1oBz9H8aa9P
         aO5OzLuQSvWI+LiK5LtxNB3gJ4Am2mVLcwqE5/k3A5TTYNCdWfGwSC17ZJbkIfM03RJk
         hvaBHbuq8OBcAeUWE/5SDacrET0I2vv73woA9EUN/i9/o1c3xHW4tQfNDnopMIxs8z++
         2QMv9VK6s3nYpioVqctmu0zh7WOnf5YNE7jx0vA2eMMQDOhATzM5styAGJsy/hMTjqqB
         B6fGIg95y1YYxs3PfvrFt5iOqVm1A52ZIHcBSVJhRndXCPNpXBDaUO+/kPEw2bhths2e
         tsYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WfJczYERUFdenR05uGVZr/+UQWZo6E3KWcw73dbx8xM=;
        b=cN/heeAIDvUIeSX/FKhAsa1V8XM6Gutau96N3mRrIZttu920EB6ycI66FqdrvLIr6f
         0fESUY10rRxOu78BLfpe4CIVfh6S5K5xqNtWscUgpzGTmyszbbHJQM0WPxNd/sAb5Kbj
         cwpK6/XSozJ9WBhF5X5xuKholdefyAjKc72LgmhD0Yxnu0T2x9LgiSskGs1DZhrZC/9q
         GbVER/OYTHGAcB5l92A4EQKYkgUk2GXRKr++WytqMQMV0fPNfyH7ZxZ7In4i5DEQJpv8
         zQGvGdaiEdq22580xdyFgp95ZK7m3J0lT9j6uHFhpKzbAaRQ/MVvsMic09uNjKFyWOVH
         OfwA==
X-Gm-Message-State: AOAM5310XTlqmtjx2/siX5NeypWB2Yi9Gm0DYjZJwO4tuhTEYAjH5f+U
        JphSx6+frdNxwZ4eZJuOjLA=
X-Google-Smtp-Source: ABdhPJxjgeLkp529yuNNLZkTZ3ZmCkL3ww1KtD6lM5r8Qf7H/qMDhc+D1VnkkY5kPHg2hVcRukxd8A==
X-Received: by 2002:a5d:4a4b:: with SMTP id v11mr1965571wrs.36.1601302017616;
        Mon, 28 Sep 2020 07:06:57 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id k5sm1496343wmb.19.2020.09.28.07.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 07:06:56 -0700 (PDT)
Date:   Mon, 28 Sep 2020 16:06:53 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     JC Kuo <jckuo@nvidia.com>
Cc:     gregkh@linuxfoundation.org, robh@kernel.org, jonathanh@nvidia.com,
        kishon@ti.com, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, nkristam@nvidia.com
Subject: Re: [PATCH v3 15/15] xhci: tegra: Enable ELPG for runtime/system PM
Message-ID: <20200928140653.GO3065790@ulmo>
References: <20200909081041.3190157-1-jckuo@nvidia.com>
 <20200909081041.3190157-16-jckuo@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="BuBclajtnfx5hylj"
Content-Disposition: inline
In-Reply-To: <20200909081041.3190157-16-jckuo@nvidia.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--BuBclajtnfx5hylj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 04:10:41PM +0800, JC Kuo wrote:
> This commit implements the complete programming sequence for ELPG
> entry and exit.
>=20
>  1. At ELPG entry, invokes tegra_xusb_padctl_enable_phy_sleepwalk()
>     and tegra_xusb_padctl_enable_phy_wake() to configure XUSB PADCTL
>     sleepwalk and wake detection circuits to maintain USB lines level
>     and respond to wake events (wake-on-connect, wake-on-disconnect,
>     device-initiated-wake).
>=20
>  2. At ELPG exit, invokes tegra_xusb_padctl_disable_phy_sleepwalk()
>     and tegra_xusb_padctl_disable_phy_wake() to disarm sleepwalk and
>     wake detection circuits.
>=20
> At runtime suspend, XUSB host controller can enter ELPG to reduce
> power consumption. When XUSB PADCTL wake detection circuit detects
> a wake event, an interrupt will be raised. xhci-tegra driver then
> will invoke pm_runtime_resume() for xhci-tegra.
>=20
> Runtime resume could also be triggered by protocol drivers, this is
> the host-initiated-wake event. At runtime resume, xhci-tegra driver
> brings XUSB host controller out of ELPG to handle the wake events.
>=20
> The same ELPG enter/exit procedure will be performed for system
> suspend/resume path so USB devices can remain connected across SC7.
>=20
> Signed-off-by: JC Kuo <jckuo@nvidia.com>
> ---
> v3:
>    use 'unsigned int' for PHY index
>    remove unnecessary 'else'
>    drop IRQF_TRIGGER_HIGH when invokes devm_request_threaded_irq()
>   =20
>  drivers/usb/host/xhci-tegra.c | 389 +++++++++++++++++++++++++++++++---
>  1 file changed, 360 insertions(+), 29 deletions(-)
>=20
> diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
> index aabff8ee0bb3..ba3f40e78171 100644
> --- a/drivers/usb/host/xhci-tegra.c
> +++ b/drivers/usb/host/xhci-tegra.c
> @@ -15,9 +15,11 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
> +#include <linux/of_irq.h>
>  #include <linux/phy/phy.h>
>  #include <linux/phy/tegra/xusb.h>
>  #include <linux/platform_device.h>
> +#include <linux/usb/ch9.h>
>  #include <linux/pm.h>
>  #include <linux/pm_domain.h>
>  #include <linux/pm_runtime.h>
> @@ -224,6 +226,7 @@ struct tegra_xusb {
> =20
>  	int xhci_irq;
>  	int mbox_irq;
> +	int padctl_irq;
> =20
>  	void __iomem *ipfs_base;
>  	void __iomem *fpci_base;
> @@ -269,10 +272,13 @@ struct tegra_xusb {
>  		dma_addr_t phys;
>  	} fw;
> =20
> +	bool suspended;
>  	struct tegra_xusb_context context;
>  };
> =20
>  static struct hc_driver __read_mostly tegra_xhci_hc_driver;
> +static int tegra_xusb_exit_elpg(struct tegra_xusb *tegra, bool runtime);
> +static int tegra_xusb_enter_elpg(struct tegra_xusb *tegra, bool runtime);

Can we reshuffle the code to avoid these predeclarations? Looks like
they're only used in tegra_xusb_runtime_{suspend,resume}(), so perhaps
move the implementations right before those?

Thierry

--BuBclajtnfx5hylj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9x7fsACgkQ3SOs138+
s6GviA//bArY95N26kWGSQkCddCGbNVfmaKT8ob441Ff3cYz0E84EhyFK4NbKXiW
SnK9nz92bD36pEOq4zHqrt3Fr/oxawBu7nUKn9EhQzabPUNT8u85MH9W5CopwhU4
tJrLWmfiyJbX390CXU2jUW3rRs6sIZ6q7Cg8duX3J5cDZtijcJ6yZ5GFlqtEmwMq
YwRlrVxm2yYo/jYvkmnYUDxwK/DT5KvX6cblQ69eh20DPL5e7J57uBEPNnum2n88
5hFkNFjBjfy0lb1MhGq6mpSjXNzqWOUxS6CPNbi6VYahaIZjYbLqQljGobuuKQXQ
J9Ri0zGLO46+4T3Rog6o4Rpm123Kuxl9EkyO/6WOQpMpIrw3KwJsZWmd3xMLBqNx
WshobHLSIKXRaIm/Mng3QTFyOe2EqXbnItNlLlzCV68z3hF25GUUpmelSLfK+ltW
Ywrh3xDEgUz/vVduW6AxYwpF1fKCNEtPS41VLn8vzwJ5C+Sy5AMhJWH/qoilFLZi
aGt+jovRHfXaltxhUU8djloEjHIe57nflEcNnqTfzCHDP9oqhI3krU2QIt2t5xGB
lxXOj/ZXC6DVDdcyHEfOxOk5siGvkf4vM871deQACPRthyb84UYqGVz91ztdz6+l
sJnOIxr5fxqxSr8tz4COZFEr+LwrmWAhDC8ZriUo8GjvAW5DTp0=
=ieLj
-----END PGP SIGNATURE-----

--BuBclajtnfx5hylj--
