Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27B0CC04FE4
	for <linux-tegra@archiver.kernel.org>; Mon, 26 Apr 2021 07:44:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E46EE60D07
	for <linux-tegra@archiver.kernel.org>; Mon, 26 Apr 2021 07:44:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232828AbhDZHpZ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 26 Apr 2021 03:45:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232959AbhDZHn4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 26 Apr 2021 03:43:56 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20336C061756;
        Mon, 26 Apr 2021 00:41:34 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id u3so4259279eja.12;
        Mon, 26 Apr 2021 00:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=c1vBPck8JU0pwgwWsq/snACpybxqrhklsB99FqhjoPI=;
        b=btKhBB/tFIdFQPgrpPpl6N2mY5cxZFwqPqUxdsGBx0wugCltKIgoZqNWemwLRzgn67
         XUBVcPTHxLGLYObb4I2rb5wpvfnA0eFEJTdsdUvrkheQyp/h4Q5sz9YT9cHnVLGPkX9d
         Nh09oHnBnL0EYqayiSih9K7q7UtSXotDlmfEUjeaGEx9mo2XZvS51H8KuePo4zoc9WV6
         I/s8zOAgoMPQ4UXlwFA1sC1tUmBiFfvq8ruQ6T/HSlBLEwpxkNBlWEwp0FPVQWEwTuPC
         hCyRmKntWEx0JzG0yFTnUAfDOmVRnhoUNgKAaWdz8oZUWpg7rBly/txd7ozzKO5etZkQ
         v92w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=c1vBPck8JU0pwgwWsq/snACpybxqrhklsB99FqhjoPI=;
        b=iyg1wbAOD3flO8t7IX1uy8rZy7rAepkKxG6N2UNIOFSK2SzYtiVGuRV3w1vYW4ousV
         eWqKfGyzqgnDEsgYAnBzItgoOT4Z3RQaCthdHJNllSnWQGiVhiAidEAEeiPOXRsVp+Cv
         kax4HyMENaWKkVA7UeRpFUfFlYwbLRMzoOcZj1D0p2Fd67MbNIXqd4F9jf0d79kE3jWI
         9ZWRqYhumlflugyuXSOPqI/40QpKktwu91Y29ddREcKOrtub7nPIZuOe/kSLjdHKJoNG
         Gv84YP2fqHhqsoQWARN7cWZsr69DLPZIIEQUklTPNwxKi4VvBmAlLuAs/qLTgqlWqIr6
         /sKQ==
X-Gm-Message-State: AOAM531YMl2IPqhG8+n+Bn5GbbtWcl5FeEaSyADHAmeKuhMkbOhUnhIr
        /kOxrYKBYerF0z48QrYNNOskM/EVllk=
X-Google-Smtp-Source: ABdhPJxUjB9yH2Enni4Q3e63AZXAGAWmsaB5WN2KunBgTRUHiE0T+mMvnnHhosoIzZ83Pa89llj2OQ==
X-Received: by 2002:a17:906:524f:: with SMTP id y15mr16985419ejm.65.1619422892867;
        Mon, 26 Apr 2021 00:41:32 -0700 (PDT)
Received: from localhost (p2e5be10e.dip0.t-ipconnect.de. [46.91.225.14])
        by smtp.gmail.com with ESMTPSA id c19sm13506940edu.20.2021.04.26.00.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Apr 2021 00:41:31 -0700 (PDT)
Date:   Mon, 26 Apr 2021 09:42:24 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Lyude Paul <lyude@redhat.com>
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Thierry Reding <treding@nvidia.com>,
        Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] drm/tegra: Get ref for DP AUX channel, not its ddc
 adapter
Message-ID: <YIZu4PD6BmlGYXuc@orome.fritz.box>
References: <20210423182146.185633-1-lyude@redhat.com>
 <20210423182146.185633-2-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cyYgln7x2rIbz3eF"
Content-Disposition: inline
In-Reply-To: <20210423182146.185633-2-lyude@redhat.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--cyYgln7x2rIbz3eF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 23, 2021 at 02:21:45PM -0400, Lyude Paul wrote:
> While we're taking a reference of the DDC adapter for a DP AUX channel in
> tegra_sor_probe() because we're going to be using that adapter with the
> SOR, now that we've moved where AUX registration happens the actual device
> structure for the DDC adapter isn't initialized yet. Which means that we
> can't really take a reference from it to try to keep it around anymore.
>=20
> This should be fine though, because we can just take a reference of its
> parent instead.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Fixes: 39c17ae60ea9 ("drm/tegra: Don't register DP AUX channels before co=
nnectors")
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-tegra@vger.kernel.org
> ---
>  drivers/gpu/drm/tegra/sor.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
> index 7b88261f57bb..4e0e3a63e586 100644
> --- a/drivers/gpu/drm/tegra/sor.c
> +++ b/drivers/gpu/drm/tegra/sor.c
> @@ -3739,11 +3739,11 @@ static int tegra_sor_probe(struct platform_device=
 *pdev)
>  		if (!sor->aux)
>  			return -EPROBE_DEFER;
> =20
> -		if (get_device(&sor->aux->ddc.dev)) {
> -			if (try_module_get(sor->aux->ddc.owner))
> +		if (get_device(sor->aux->dev)) {
> +			if (try_module_get(sor->aux->dev->driver->owner))
>  				sor->output.ddc =3D &sor->aux->ddc;
>  			else
> -				put_device(&sor->aux->ddc.dev);
> +				put_device(sor->aux->dev);
>  		}
>  	}

Unfortunately, I think it's a bit more subtle than that. The reason for
this get_device()/try_module_get() dance was to mirror the behaviour of
of_get_i2c_adapter_by_node() so that when we call i2c_put_adapter() in
tegra_output_remove() we correctly decrease the reference count.

The above will increase the reference on the I2C adapter's parent while
i2c_put_adapter() will then only decrease the reference on the I2C
adapter, so I think effectively we'd be leaking a reference to the I2C
adapter's parent.

Also, since we didn't take a reference on the I2C adapter explicitly,
releasing that reference in tegra_output_remove() might free the I2C
adapter too early.

I wonder if perhaps it'd be easier to get rid of the struct tegra_output
abstraction altogether and push this down into the individual drivers,
even if that means a bit more code duplication. That's not the kind of
quick fix to resolve this current situation, so perhaps as a stop-gap we
just need to sprinkle a few more conditionals throughout tegra_output
code. We could, for example, avoid calling i2c_put_adapter() in
tegra_output_remove() for the DisplayPort cases and instead manually
release the reference to the I2C adapter's parent in tegra_sor_remove().
On top of your patch above that /should/ fix things properly for now.

Thierry

--cyYgln7x2rIbz3eF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmCGbtgACgkQ3SOs138+
s6GwRg/9Fz0mMHegO0rimUIpYL7RJ0L1F7bH0RxDPapEknjZ3xf3NxdDOZT1Z92l
5ZhInuo9EkAwfUm7MyFoatuRV2hc/Xk3ZXAcNaMHjuzhhZ/ixfAWllpOsk1lY5X6
7NsXyALSj7U0FP+/gZaPsztz5xomCojRdmW0EsBKxGJNCP3ttcPUimx6zPr9ASkJ
LHFVV3isrxA9cGIiM6qAPNLE/Gwp17++aME0sdjboqzXHINXCjgk7n55DJp8Ou2x
LOJFq62NGbZqLYkKDuQq3A0hF08xpVMMvcONwtlJkgO0dIwH5LaDbhyC7Xaxv/zU
TuBEcYDVijaLZxH7deQdVqSFeS8U/NWebN6hO4MWzZuVy8vVIzYXyH4ordrsUITQ
N6x0c1tx2O+vEGJiNzVn35J9gxGIc2NjfH5JBVddszwNBLeZSs4ReAejpVa2E0Sk
S55SnjSm/1B9UpPxmaic3p2cMRz0nS/GvdJ8i5uRDyC1fIRDLujPuoDA/p52AKNd
pLCzK/4OFOd6akh4mhm0cjfB8SWwVqxvWqsGLsjeZNZSu74hz9xMaP4yPdzGsmJ7
W94YOpvqEfLw5uFK1b8NdXlPEe5VVjj9yzQLocvbtobws9N6j1ydRh3zTtisd0RU
y7DBKuFNGtaYWslW0zUhwGQbIbfv3vW8EeJ796x1iF+MFdAwV+4=
=wpO5
-----END PGP SIGNATURE-----

--cyYgln7x2rIbz3eF--
