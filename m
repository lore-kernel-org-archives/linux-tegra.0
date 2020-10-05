Return-Path: <SRS0=kAmo=DM=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84E27C4363A
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 11:33:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F36F20774
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 11:33:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NlzCH3xt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725934AbgJELdk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Oct 2020 07:33:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725932AbgJELdj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Oct 2020 07:33:39 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66D7FC0613CE;
        Mon,  5 Oct 2020 04:33:39 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id c8so8912847edv.5;
        Mon, 05 Oct 2020 04:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vb+TwOIgac5MoVAF3GUMOQDHMZpS4X5tXF1cJJQ1nCY=;
        b=NlzCH3xtoWaf6qZygPGXybA7Frl4WxD8hLDjKfIg4Lyu/rjNlsCA7fgYmHsmooUEsC
         9ABypkalhbvsLnS2I8peWMH4pVuiuJawiJWxlZvV5B8eGUIXzTJRRVBF/Y06ceNloMkE
         iICYR8oWsqERrZSE0EogTct18xuavv5gtqbHv42IgdWHy/RviLK8uTdXRYIKSJuC3QlA
         kxjm5w+jVJ/f1A3n2bmCL4MroEq5IQX/zZ35zEmmcnjNcjS4Wka7AsGMACKl7bib96Ln
         ruelEN/2wIqtJej1kXAlsPo5W9+FfJorIayr4dmAb2l+80sEa1FrGnBKzoUUcCVixzTU
         wU2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vb+TwOIgac5MoVAF3GUMOQDHMZpS4X5tXF1cJJQ1nCY=;
        b=fLynHETNZSRpS9mF24yYUu79URkdInpvqetdIk/l2PQzMHSTHYbZkT0YVVhYHpelwX
         q6pgsBZuVEPXALWgtXZZ7EkJKrfMyn6CMSqdbP67iVSdgZUYin10QxGqRd88x+6DiKva
         hTkLGqd5jEHUmmQCpKlMm+RazKO47+oNiolYU5Kg9qALlpPgR55uwps9s2YghiO7+M6Z
         74D1tLs2/jjCCTp0h2JmEO5bFDszlQQ2dkhYwmDRJp2KK50+nxBdA+jhR+2Ruv1XZQW6
         p47veGoudZNnmx5zEysFxLbe0114FFDFfvu/7j10vDFKyu7cuMKDerWmLwlRyxq8W0EA
         iEEg==
X-Gm-Message-State: AOAM5317hby5Cj+NHSr9LMv4/YzpHz5coX3WBahxyj9Y9kLcwDL/QL4N
        EJPOlZeCLQGk5X/hPq6KUMY551rX0G0=
X-Google-Smtp-Source: ABdhPJxIcDVW0mVVP9Ods5blhc23tjadSvAerumNBOwtZbiN8dkbM63bVtiTf7G6JtjV2bVJNluOSg==
X-Received: by 2002:a05:6402:a42:: with SMTP id bt2mr16171053edb.193.1601897617963;
        Mon, 05 Oct 2020 04:33:37 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id v25sm8426608edr.29.2020.10.05.04.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 04:33:36 -0700 (PDT)
Date:   Mon, 5 Oct 2020 13:33:35 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Marc Zyngier <maz@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Venkat Reddy Talla <vreddytalla@nvidia.com>,
        Thomas Gleixner <tglx@linutronix.de>, kernel-team@android.com
Subject: Re: [PATCH 3/3] soc/tegra: pmc: Don't create fake interrupt
 hierarchy levels
Message-ID: <20201005113335.GT425362@ulmo>
References: <20201005111443.1390096-1-maz@kernel.org>
 <20201005111443.1390096-4-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="D5tFrmRBv7YOLFOK"
Content-Disposition: inline
In-Reply-To: <20201005111443.1390096-4-maz@kernel.org>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--D5tFrmRBv7YOLFOK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 05, 2020 at 12:14:43PM +0100, Marc Zyngier wrote:
> The Tegra PMC driver does ungodly things with the interrupt hierarchy,
> repeatedly corrupting it by pulling hwirq numbers out of thin air,
> overriding existing IRQ mappings and changing the handling flow
> of unsuspecting users.
>=20
> All of this is done in the name of preserving the interrupt hierarchy
> even when these levels do not exist in the HW. Together with the use
> of proper IRQs for IPIs, this leads to an unbootable system as the
> rescheduling IPI gets repeatedly repurposed for random drivers...
>=20
> Instead, let's allow the hierarchy to be trimmed to the level that
> actually makes sense for the HW, and not any deeper. This avoids
> having unnecessary callbacks, overriding mappings, and otherwise
> keeps the hierarchy sane.
>=20
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  drivers/soc/tegra/pmc.c | 79 +++++++++++++++--------------------------
>  1 file changed, 29 insertions(+), 50 deletions(-)
>=20
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index 9960f7c18431..4eea3134fb3e 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -1993,6 +1993,30 @@ static int tegra_pmc_irq_translate(struct irq_doma=
in *domain,
>  	return 0;
>  }
> =20
> +/* Trim the irq hierarchy from a particular irq domain */
> +static void trim_hierarchy(unsigned int virq, struct irq_domain *domain)
> +{
> +	struct irq_data *tail, *irq_data =3D irq_get_irq_data(virq);
> +
> +	/* The PMC doesn't generate any interrupt by itself */
> +	if (WARN_ON(!irq_data->parent_data))
> +		return;
> +
> +	/* Skip until we find the right domain */
> +	while (irq_data->parent_data && irq_data->parent_data->domain !=3D doma=
in)
> +		irq_data =3D irq_data->parent_data;
> +
> +	/* Sever the inner part of the hierarchy...  */
> +	tail =3D irq_data->parent_data;
> +	irq_data->parent_data =3D NULL;
> +
> +	/* ... and free it */
> +	for (irq_data =3D tail; irq_data; irq_data =3D tail) {
> +		tail =3D irq_data->parent_data;
> +		kfree(irq_data);
> +	};
> +}

That kind of looks like what I originally wanted to do and (naively)
thought that passing the (0, NULL, NULL) triplet would achieve.

Given that this is fairly low-level stuff that deals with the inner
workings of the IRQ infrastructure, should we eventually pull this out
of the driver and make it into a core helper? I don't seriously expect
this to be widely useful, but putting it into the core might help keep
it more maintainable.

I volunteer to do that work if you think it's a good idea.

Thierry

--D5tFrmRBv7YOLFOK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl97BI8ACgkQ3SOs138+
s6EuNhAApCC/Y3UxL04Yc45mEeylUQ9lbVX8t5YJdJfEEoWIl9a4nCmfszoDz6Jr
0EO3/atnQLyx3E5Lm61/yKshCOrvO6AQNTx//P++eEhIiRcz/HPQQ2dZ5RKCYP/g
/cRW8F6S92TdE1hlVuvhEi3cTR2fpdBbo5+y6sNvaHppg9U3mZEXttMB7vb9Ftv9
xFzCk9vIKXfrD5trhyhqgpN8P4rIcq68XWUkJYonv34qO8FmTHziUC6NtJgKesuN
RLdDOtyLHVQrJ0h+kU492Gqki5kX7hJRlqxu0EI9tYWWIqYFZT6hylJ4Ozn5v53h
zeMLezl3AF6PxQinW0Pg7wWcyJtWb3QSBD+HGW/6jXtzQOtdwqZSCRwJ7ylA+Axz
fb5lFkxvT5LcWSZEFk75yCns759w79jSqDgnYUSZJTiG/0FoamgAG5iMXTsTdwJn
DDuqiWVpIslq3AvO0IyYNSwwmzSmQBsQkr84mnvFEcPMhrrN/u46AeqAHJRsXUQ+
uZoiUmKL5Hbrpg3GQz6DRAB4nW1wollWyhF1PTiHkImmIhacYijzsb3Y32QJKRom
wysRz/m0L9OcXt9lH1KTGjDQbvZa+yAFG2QpPkFuGqstcyI8FJkiH9y3bQd0eJeS
YgSfnwxv2zC9kjD92FdFg6iofeY9OJglDyG0oPYr4zVwEhty7SM=
=GsHC
-----END PGP SIGNATURE-----

--D5tFrmRBv7YOLFOK--
