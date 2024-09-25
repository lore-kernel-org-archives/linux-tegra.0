Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE1818A6D8
	for <linux-tegra@vger.kernel.org>; Wed, 25 Sep 2024 12:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727269136; cv=none; b=bZH/CbnUCsL52eAb3trcBJqJCWjWDnCFKTZVEv1Z18FnzSVD3y+9RWcWGvPDcTCBnDqGmlK1KHEU0/VNo2U2XGA+9nvCh0ujUpAzFOltmpCn6LBTBtZlc28EA4UyYl26CF4aNHERuXS/SboARf3IWyyC48+RawwU6AYWycCWVsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727269136; c=relaxed/simple;
	bh=Et3bGI/ree6+B+IAQ+5tE7CmYmu4J1O5gHoURDYz6NI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E+xEwh3r+3AOMKzlJNHjxM71eEPYLToiUa8iEWC90dHXYd56H3+lBB2noqjMl1pE/wbfRJxLZMV5eOJQcMnddPqdLP38ZfY0OMIqgl9X2J2KUOoi2Jk/XhRq7rHOAKZFIQ5VQbQuY9NhxjXoKwW4xFHfWNt5JXpTpQ9en9yy7yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cPs0bkKf; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cPs0bkKf"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3780c8d689aso4518473f8f.0
        for <linux-tegra@vger.kernel.org>; Wed, 25 Sep 2024 05:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727269133; x=1727873933; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J1XJnhqq2OIsxXJzV7ym7OJSz2cacK1ZAV5wGYiQpu0=;
        b=cPs0bkKfoMwE5pkncuonEwB/5/KG959GpKAPeTLo7WvmUNqcy5iQFhmoJGIOdAHVh1
         6f7topjokST/IK7zgWoCmWYDXwrM7NHyfWEx6Ic3aLd0NV0+3tbGGWBnG+rSAgtOo2W9
         dUMIAtJkwC+H4c6+MBzctwnI+v43FgLFlFqW+lXkTKK+guUaBxsbxG/BzfE5eLijzz8r
         +MH73EDRNw2dxJ6HHPmMDNMEn3BUWUHS5D9w/ezQXdHcZi4c0LizkTZ03tUIlm3xwKOV
         fImNKOpdB2NHUJSUtGPWMf/FqPsd/KfJcHQ9FNCkUxm0VgcEFW5X5vw2CZxEn4I9M0M1
         vmzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727269133; x=1727873933;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J1XJnhqq2OIsxXJzV7ym7OJSz2cacK1ZAV5wGYiQpu0=;
        b=PSMUD1ABSdHq/JnvvHuaZQTUGH/sB1TTpYAfpeOOwDdIQqvmuNFZW4ais/aIVmimx7
         Fq4yb7dEmuOOtJ/OQ+P0fFHrrY7KY6iQACfCFa94FCFyjKE2cXeXnlM/2Y6mCkcLvVzW
         dq2O+jxTAvNQ/yU69loJTZv+R8+PEI9tGvb8x73BqfggdwBSeuDHzaxYvt1kJlSwjFQU
         3fbHGYk1cHFv9amMkd0e6fkOH8FFF5bkaxH/yn3FXYEog/BWEl5bz7lfLh4mp7T5VVXy
         QI1UILaVcQtr0eFVax04DTxaJ+Yi5P3z3TxJ8z3UOHh7YsH0MYLUou+R3zzVo9RBudbU
         WLhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNwPCMp9mTDwdDp3OTCFsSnIt8nAXeECrraDSD6TEO+M5xUJUJfVJ2wX8QkC7tpTrfi0O99yUGSda2dg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcy0UVXob8KDt4lUds/vRlGY0G0kBD1YoiyAXPu1M7eABFogZ+
	hDxxSQzcNpTNta8Ct9r5L/CLgV3cUB3848Eb9BLolVMTPrLX+Xjl
X-Google-Smtp-Source: AGHT+IHRHm8+liHKXUKRB0InXsm5LIUqNcGUyVFyJw6CMr61V79XcSVCKGwlzWTJOGOgcMO7kThCKQ==
X-Received: by 2002:a5d:5f85:0:b0:374:c92e:f69f with SMTP id ffacd0b85a97d-37cc2468e66mr2384982f8f.16.1727269132552;
        Wed, 25 Sep 2024 05:58:52 -0700 (PDT)
Received: from orome (p200300e41f147300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f14:7300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cbc2a8c1csm3998501f8f.11.2024.09.25.05.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 05:58:51 -0700 (PDT)
Date: Wed, 25 Sep 2024 14:58:50 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Mikko Perttunen <cyndis@kapsi.fi>, 
	Mikko Perttunen <mperttunen@nvidia.com>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] gpu: host1x: Request syncpoint IRQs only during probe
Message-ID: <tsq6hbbeyxu5uqasx6jijijvxfomnxj4c2qakf7lmd2eut2zbk@z72tkzlzlfu6>
References: <20240531070719.2138-1-cyndis@kapsi.fi>
 <f0720898-aadc-4e98-9369-05ec5821414f@nvidia.com>
 <18b6c018-618d-42e6-81f4-48bfb4eba206@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4vblk4xct4vaq62s"
Content-Disposition: inline
In-Reply-To: <18b6c018-618d-42e6-81f4-48bfb4eba206@nvidia.com>


--4vblk4xct4vaq62s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 24, 2024 at 07:33:05PM GMT, Jon Hunter wrote:
>=20
> On 06/09/2024 09:38, Jon Hunter wrote:
> > Hi Mikko,
> >=20
> > On 31/05/2024 08:07, Mikko Perttunen wrote:
> > > From: Mikko Perttunen <mperttunen@nvidia.com>
> > >=20
> > > Syncpoint IRQs are currently requested in a code path that runs
> > > during resume. Due to this, we get multiple overlapping registered
> > > interrupt handlers as host1x is suspended and resumed.
> > >=20
> > > Rearrange interrupt code to only request IRQs during initialization.
> > >=20
> > > Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>=20
> ...
>=20
> > This change is causing a boot regression on Tegra186 with the latest
> > -next. I have reverted this to confirm that this fixes the problem. I
> > don't see any crash log but the board appears to just hang.
>=20
>=20
> I had a look at this and I was able to fix this by moving where
> we initialise the interrupts to after the PM runtime enable ...
>=20
> diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
> index b62e4f0e8130..ff98d4903cac 100644
> --- a/drivers/gpu/host1x/dev.c
> +++ b/drivers/gpu/host1x/dev.c
> @@ -625,12 +625,6 @@ static int host1x_probe(struct platform_device *pdev)
>                 goto free_contexts;
>         }
> -       err =3D host1x_intr_init(host);
> -       if (err) {
> -               dev_err(&pdev->dev, "failed to initialize interrupts\n");
> -               goto deinit_syncpt;
> -       }
> -
>         pm_runtime_enable(&pdev->dev);
>         err =3D devm_tegra_core_dev_init_opp_table_common(&pdev->dev);
> @@ -642,6 +636,12 @@ static int host1x_probe(struct platform_device *pdev)
>         if (err)
>                 goto pm_disable;
> +       err =3D host1x_intr_init(host);
> +       if (err) {
> +               dev_err(&pdev->dev, "failed to initialize interrupts\n");
> +               goto pm_put;
> +       }
> +

I think the reason why this might fail now is because host1x_intr_init()
ends up writing some registers during the call to the
host1x_hw_intr_disable_all_syncpt_intrs() function, which would hang or
crash if the device isn't on (which in turn happens during
pm_runtime_resume_and_get()).

Not sure exactly why this used to work because prior to Mikko's patch
because the sequence was the same before.

>         host1x_debug_init(host);
>         err =3D host1x_register(host);
> @@ -658,14 +658,11 @@ static int host1x_probe(struct platform_device *pde=
v)
>         host1x_unregister(host);
>  deinit_debugfs:
>         host1x_debug_deinit(host);
> -
> +       host1x_intr_deinit(host);
> +pm_put:
>         pm_runtime_put_sync_suspend(&pdev->dev);
>  pm_disable:
>         pm_runtime_disable(&pdev->dev);
> -
> -       host1x_intr_deinit(host);
> -deinit_syncpt:
> -       host1x_syncpt_deinit(host);
>  free_contexts:
>         host1x_memory_context_list_free(&host->context_list);
>  free_channels:
>=20
>=20
> Thierry, do you want to me to send a fix for the above or do you
> want to squash with the original (assuming that OK with Mikko)?

In any case, this looks like a good fix, so please send a proper patch.
This is merged through drm-misc, so squashing this into the original
patch is not an option any longer.

Thanks,
Thierry

--4vblk4xct4vaq62s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmb0CQcACgkQ3SOs138+
s6F4kw/8CFaMLKgI88knlMkHLGoEl3VY7lPbJEDoeHEsS2AIvBdDxtmoAMqGpc6A
/Ezs//MV/In2c/Ri5XF6WnK2+axWL2SypmiuGEypul4fD7LToyYtcllRFIpQ+Hnz
jbuD8UIPvLf/Um78X6uqmQQUm6R2O7mgMfheVdhv6bR5IxCn3r2iGRMxeukn3kbo
htBrnraFNtcEZ8V+qIi3WMZdgFb+QndL6RL9MvDXWNMog5TwBl4nvanS+gfgv93u
CxJkZMaecM67kPxmE4/T1bc2VZ8WijI0D7UyANV+jH3NCmZJtr0mNOFaChkXzY/e
gfzoraIp01qXSluOz3oilwZ/B4A/21X3J/9XKw7zQMOb0Dv72hgCR1Z5qbOKXHoe
bE7kt2Zmcx+cqNvmE7zJ/jaBPld1kP1grE7lW1/tztKyl/NHnOBTe4Cr/ilgzseI
cqR74D9AOLvtaDPbTsmPTS6GxNH/iTJwvHzAJvnaqUNYGh2hzcf+Pj/hNveUMPKQ
eZ4Au8RhRNYfq9v48IjpFF422mpc5lNGIyj0yaFjLj4aAoPiqZiYMMfThGOebd+y
jnh2gFp/vI++TAiaY6IxcrmMOALQTx03t3mmQIFVMlNwBb4u4BKEIXJdncT32Yuq
CqBChZv5ktN2IE7SScebB54ElUc+ieh+97hjWMeNJYay+9vmKuw=
=drRG
-----END PGP SIGNATURE-----

--4vblk4xct4vaq62s--
