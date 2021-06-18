Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8AF8C48BDF
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Jun 2021 12:02:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A1D6A613D5
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Jun 2021 12:02:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231536AbhFRMER (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 18 Jun 2021 08:04:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231345AbhFRMEQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Jun 2021 08:04:16 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D058C061574
        for <linux-tegra@vger.kernel.org>; Fri, 18 Jun 2021 05:02:07 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id z12so8343119edc.1
        for <linux-tegra@vger.kernel.org>; Fri, 18 Jun 2021 05:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=CRne1Obv6bfpFN2zwH0E1iSytqwftTUZyuSgOuNDck8=;
        b=cRjUFpDd0ezPpaaShv29KJL3M2ml3fYDoOx8CA86QVlvJ6oSw6ty7AEqC/rwIE8Q41
         QMlcF/GHEuGHJDNoy6l29qXcoUbqTWXYLpWqY8Yma+db3dB9JgrZWsQrA0pPzRvht/IN
         JTl6YOfyGcnqWVCD6QnLd0cPlWxl0GxIGx5H37GcWvNmg+jfPF0lBE855qGNxJg24dcE
         jqlsM92/5LdjaX6bLfn2yEkusLRGF3geIRk0hQPQPBHQpE1KXqLqcBSVTtLKtwtlQpEY
         0FrgEqB73XHSQUOvDE1ntLcZHy8Cw3KT/qo+hJjKvYppPDUYYCNrsnKlZi/uZpMxwmom
         3Oqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CRne1Obv6bfpFN2zwH0E1iSytqwftTUZyuSgOuNDck8=;
        b=g4quyyL3ZSE3jzB/voqYaDM9vQz7ECNfTROzH5NkEeR0h2KmK425jpLF336QLt9qJb
         IKvXj/gWqyj8Y1Fkye3Oat9xiOIf4QLGmDJNVxw8hrdimOGQc6W4lPi38dg02k9zYhls
         ekTk+4MaDupIvXGdVLBPRcVfjdzzD1i+cePf5u0ZjjA4gAwYaR3pwIEK3lReigtEBZo3
         zf0MDBgIuakL4LbsXzrxOuN19Zu9v1+ky9jnhKGQRnoc4By0E5u3FlKRwALUMepkvwcw
         /ukrIyh4XyRZYul10LyTjxTipKX2j5FHALj0OjE9IKrQsE0O0Lq02raqHCbTXz/OKmUK
         eP0Q==
X-Gm-Message-State: AOAM530r1ONmwsdg/z7r95ezqKL6WCUFjfjcfI0tkHtz0SfkoQtVr4+y
        9hbHgcZ49PHOmEMoiDTVCPg=
X-Google-Smtp-Source: ABdhPJz3K1LWFlqJDgSjo825niKdSkm2FjQCwq47GZQp1aOaKU7hDTD0A44QHMyNFXsdef9Dz2lYQQ==
X-Received: by 2002:a05:6402:26c2:: with SMTP id x2mr4551069edd.124.1624017725993;
        Fri, 18 Jun 2021 05:02:05 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id f20sm6065049edq.64.2021.06.18.05.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 05:02:04 -0700 (PDT)
Date:   Fri, 18 Jun 2021 14:03:54 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Mikko Perttunen <mperttunen@nvidia.com>
Cc:     jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] soc: tegra: Add Tegra186 ARI driver
Message-ID: <YMyLqnbwOAyvXMPU@orome.fritz.box>
References: <20210617121307.792386-1-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="dkyho8UKE4IjX4xx"
Content-Disposition: inline
In-Reply-To: <20210617121307.792386-1-mperttunen@nvidia.com>
User-Agent: Mutt/2.0.7 (481f3800) (2021-05-04)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--dkyho8UKE4IjX4xx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 17, 2021 at 03:13:07PM +0300, Mikko Perttunen wrote:
> Add a driver to hook into panic notifiers and print machine check
> status for debugging. Status information is retrieved via SMC. This
> is supported by upstream ARM Trusted Firmware.
>=20
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
> v2:
> * Changed to use panic notifier instead of serror hook
> ---
>  drivers/soc/tegra/Makefile       |  1 +
>  drivers/soc/tegra/ari-tegra186.c | 80 ++++++++++++++++++++++++++++++++
>  2 files changed, 81 insertions(+)
>  create mode 100644 drivers/soc/tegra/ari-tegra186.c
>=20
> diff --git a/drivers/soc/tegra/Makefile b/drivers/soc/tegra/Makefile
> index 9c809c1814bd..054e862b63d8 100644
> --- a/drivers/soc/tegra/Makefile
> +++ b/drivers/soc/tegra/Makefile
> @@ -7,3 +7,4 @@ obj-$(CONFIG_SOC_TEGRA_PMC) +=3D pmc.o
>  obj-$(CONFIG_SOC_TEGRA_POWERGATE_BPMP) +=3D powergate-bpmp.o
>  obj-$(CONFIG_SOC_TEGRA20_VOLTAGE_COUPLER) +=3D regulators-tegra20.o
>  obj-$(CONFIG_SOC_TEGRA30_VOLTAGE_COUPLER) +=3D regulators-tegra30.o
> +obj-$(CONFIG_ARCH_TEGRA_186_SOC) +=3D ari-tegra186.o
> diff --git a/drivers/soc/tegra/ari-tegra186.c b/drivers/soc/tegra/ari-teg=
ra186.c
> new file mode 100644
> index 000000000000..02577853ec49
> --- /dev/null
> +++ b/drivers/soc/tegra/ari-tegra186.c
> @@ -0,0 +1,80 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2021, NVIDIA CORPORATION.  All rights reserved.
> + */
> +
> +#include <linux/arm-smccc.h>
> +#include <linux/kernel.h>
> +#include <linux/of.h>
> +#include <linux/panic_notifier.h>
> +
> +#define SMC_SIP_INVOKE_MCE			0xc2ffff00
> +#define MCE_SMC_READ_MCA			12
> +
> +#define MCA_ARI_CMD_RD_SERR			1
> +
> +#define MCA_ARI_RW_SUBIDX_STAT			1
> +#define SERR_STATUS_VAL				BIT_ULL(63)
> +
> +#define MCA_ARI_RW_SUBIDX_ADDR			2
> +#define MCA_ARI_RW_SUBIDX_MSC1			3
> +#define MCA_ARI_RW_SUBIDX_MSC2			4
> +
> +static const char * const bank_names[] =3D {
> +	"SYS:DPMU", "ROC:IOB", "ROC:MCB", "ROC:CCE", "ROC:CQX", "ROC:CTU",
> +};
> +
> +static void read_uncore_mca(u8 cmd, u8 idx, u8 subidx, u8 inst, u64 *dat=
a)
> +{
> +	struct arm_smccc_res res;
> +
> +	arm_smccc_smc(SMC_SIP_INVOKE_MCE | MCE_SMC_READ_MCA,
> +		      ((u64)inst << 24) | ((u64)idx << 16) |
> +			      ((u64)subidx << 8) | ((u64)cmd << 0),
> +		      0, 0, 0, 0, 0, 0, &res);
> +
> +	*data =3D res.a2;
> +}
> +
> +static int tegra186_ari_panic_handler(struct notifier_block *nb,
> +				      unsigned long code, void *unused)
> +{
> +	u64 status;
> +	int i;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(bank_names); i++) {
> +		read_uncore_mca(MCA_ARI_CMD_RD_SERR, i, MCA_ARI_RW_SUBIDX_STAT,
> +				0, &status);
> +
> +		if (status & SERR_STATUS_VAL) {
> +			u64 addr, misc1, misc2;
> +
> +			read_uncore_mca(MCA_ARI_CMD_RD_SERR, i,
> +					MCA_ARI_RW_SUBIDX_ADDR, 0, &addr);
> +			read_uncore_mca(MCA_ARI_CMD_RD_SERR, i,
> +					MCA_ARI_RW_SUBIDX_MSC1, 0, &misc1);
> +			read_uncore_mca(MCA_ARI_CMD_RD_SERR, i,
> +					MCA_ARI_RW_SUBIDX_MSC2, 0, &misc2);
> +
> +			pr_crit("Machine Check Error in %s\n"
> +				"  status=3D0x%llx addr=3D0x%llx\n"
> +				"  msc1=3D0x%llx msc2=3D0x%llx\n",
> +				bank_names[i], status, addr, misc1, misc2);

This still looks rather cryptic to me. Is there some way to further
decode things like the status and MSC registers? Or is this something
that people are supposed to know how to intepret?

Also, I'm not sure it's evident what those various banks are. Is there
some way we can provide a description for these?

Additional information doesn't necessarily have to go into code, but
it'd be nice if at least there was some sort of comment somewhere that
goes into a bit more detail so that people know how to use this. Or
perhaps this is documented in the TRM? If so, perhaps provide a
reference to that so that people know where to find the information.

Thierry

--dkyho8UKE4IjX4xx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmDMi6gACgkQ3SOs138+
s6FdLw/+LfTzpDzPJa2KyjpaFkhqSby4d/BMqjiu5FoQxTWEkdDIVPX350MO2lIn
P4MYYWikEC1bMVo6nrxLVZoqxt3tLk+FIFJeKJTJArsqK3YhVyYzs2mgZiAfmmij
VyTdI20+iQm5DMa5xkmwA5pYZxhNj2hgUp9nXfD6mCyzHHO84iQPsbwUlNMsWw/h
S3O0W6bOX7JQ2OieXZiuwEhC+PD9sOKEwI/v/042IhjuK7KL3g3bHeglkPfD88pa
jS5zOWJ41z8JM8laf4QjTQj7mR6ahI6hPrtd4G9/wTuTxZLdeo+nmHyigirbf039
/IMYg/4GWscf8m6CN3IWLimtzxOhTC5KFX3YAA4tPlmAflwSgiLtw+tP8Q5fScs3
W60T+y5XgzUoRk3bQuH/5VIAhQuNtc1mkPdfMinXnnWqR+fDPlA6CCvyaJt2yacr
eUx/ik+wu1eXhxwCYZiKlM/yYYs/0qjavxO6T+Osou4mAl5yZGslO5h/e/jUIvXf
t5hdkr37ujydnbZndMbEAMKl0N8uGxUy/fCGPLjsLA3zCCyFY6SgXOXn7KH4g+dy
FSNBIBi1qJZCBxA2yoCFT2sfojQ/7KU8VYogDKR5SXASUDQu0w7oI5fVnd0gmPZF
Np3MVGgCWjJN8NvB3Fh2HZ7pSVOQl/7fUNDPPQyxzRwZDglAUVE=
=Haux
-----END PGP SIGNATURE-----

--dkyho8UKE4IjX4xx--
