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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B9EEC433B4
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Apr 2021 11:32:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6A7106113A
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Apr 2021 11:32:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233028AbhDILcO (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 9 Apr 2021 07:32:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231599AbhDILcO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Apr 2021 07:32:14 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28CD2C061760;
        Fri,  9 Apr 2021 04:32:01 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id e34so797997wmp.0;
        Fri, 09 Apr 2021 04:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OEe6YFfe/Jx9/mKOq9o87zYJfICMbLoDqKrtcURwasI=;
        b=Fh1lg/uRnalLCCr33soqPo1Q0j0NEuOetXw4MI3EsYdb3SzqSsJDbZY2la+9cmm5+Z
         0lr7GuLSJNz/FdIXSa0GLxggvKPPJy4dIBIzESbAoQznwkIs0V1AGV7aZxHYdYKmF7zQ
         4uPUQhlN5HdQcfI8dTcmNklqzyFjhQWR51LLj0FFaIAVcppbz8enltWhxVFWZ2rroyvv
         LChvClJD8W/t7evnMeWUw0iZLLa+eF8WM936p5nUg9aTNVj7XUziKGV1dbh87s2VhMkk
         XYRaiuFqS1GTvaw27dBSY7vul7ZY4Jmt9dV1jsya42FgMrJ8w4fHO7QX/i+/47FnIIOp
         JHhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OEe6YFfe/Jx9/mKOq9o87zYJfICMbLoDqKrtcURwasI=;
        b=GtgqLSPjQvZzjH/JgzR4Jo9xBDgtnr+RpDlW58t4mwtdB+tTXbFFFFkNeIlrDVz8Ic
         cyaqJIjRU3r341xfqDhfrVFA5DHD7aM1J0JXwuuCCG54ETxStvH5I0vHchF5rd5jSUDw
         M83f543r81F9+htR6dS38zluEe5BOdgOzPr+8CQshD0S8p39KEFh/UDdW6gI3Ng1GEbC
         c+KmVjJoWFRLOI4YQOFO2LXLTKRTZQLJIPBpp73GRrfOTnQMb6b/6mrnvsK2nbGp3VMx
         /G9+jNqfJW910yndpp2bUCltPI+OXsPXyuwEUnzjBZtncys4DdfdeiN5etEmwIcvJRFK
         1bRg==
X-Gm-Message-State: AOAM532AEb5m+cN8RdK8WuSIW4gDI1XfmH3RxPQa/bFIzR0kfcY447ny
        ue7jJUSLC6SBMfQ+rAkrSLo=
X-Google-Smtp-Source: ABdhPJyY4ZqOfyxwZZsVlKMEtJfWHAWIstLoj2pdQrewzW6QAaBGadqRekNu5NuxiFFGgpZG6hoGhg==
X-Received: by 2002:a05:600c:1457:: with SMTP id h23mr13470302wmi.118.1617967919927;
        Fri, 09 Apr 2021 04:31:59 -0700 (PDT)
Received: from localhost (pd9e51abe.dip0.t-ipconnect.de. [217.229.26.190])
        by smtp.gmail.com with ESMTPSA id w11sm3470311wmb.35.2021.04.09.04.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 04:31:58 -0700 (PDT)
Date:   Fri, 9 Apr 2021 13:32:34 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        jonathanh@nvidia.com
Subject: Re: [PATCH -next] soc/tegra: fuse: add missing iounmap() on error in
 tegra_init_fuse()
Message-ID: <YHA7UtJ4o1BNHc1K@orome.fritz.box>
References: <20210409044903.663632-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="JEhcvQN4vxPMMub6"
Content-Disposition: inline
In-Reply-To: <20210409044903.663632-1-yangyingliang@huawei.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--JEhcvQN4vxPMMub6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 09, 2021 at 12:49:03PM +0800, Yang Yingliang wrote:
> Add the missing iounmap() before return from tegra_init_fuse()
> in the error handling case.
>=20
> Fixes: 9f94fadd75d3 ("soc/tegra: fuse: Register cell lookups for compatib=
ility")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/soc/tegra/fuse/fuse-tegra.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse=
/fuse-tegra.c
> index 94b60a692b51..bc8d70e6a676 100644
> --- a/drivers/soc/tegra/fuse/fuse-tegra.c
> +++ b/drivers/soc/tegra/fuse/fuse-tegra.c
> @@ -489,8 +489,10 @@ static int __init tegra_init_fuse(void)
>  		size_t size =3D sizeof(*fuse->lookups) * fuse->soc->num_lookups;
> =20
>  		fuse->lookups =3D kmemdup(fuse->soc->lookups, size, GFP_KERNEL);
> -		if (!fuse->lookups)
> +		if (!fuse->lookups) {
> +			iounmap(fuse->base);
>  			return -ENOMEM;
> +		}
> =20
>  		nvmem_add_cell_lookups(fuse->lookups, fuse->soc->num_lookups);
>  	}

I don't think that's a good idea. Given that this is an early_initcall,
the failure doesn't actually prevent the driver from loading. There are
other functions that rely on fuse->base staying around to access some of
the registers in that I/O memory region.

I suppose we could remove the -ENOMEM return there and instead just skip
registering the nvmem cell lookups, perhaps that would make this less
confusing.

Thierry

--JEhcvQN4vxPMMub6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBwO1IACgkQ3SOs138+
s6HxyQ//fisnmhmU+khbPxMFa1WltzGymagZoEzPoW3Nctn24xJpXCcjPMTm13Jf
z+Ftc6geKqMYBy7cNMcMx3Esq7eb/ioBxwbAPME5kwSe+/95YTjRl+0lgCcrhKAa
xJPFrhXmlMlc/GOdgP4Ahjv7hI74lVm7QZ8zfBqaZm73+9QsyFE4muXjjzVgRWyf
QSTKa9lZxk191b7HtzcMskfr4bakwJP5DTOr9FEv6gLxUkv5O13uJ2nd5XHbyi2+
VKS+KUl+hf9VSXoDau3WflSzH5yR+aK9GQpiEORiynnB/gbSvg/qiY9IetfHYWxb
EZcSNnr7WqB8skjDKsA8CwkTujCVUVSuFWj37Opm3U8pOwYnV2AAvNGklklrC+AK
Be8jFh2UI3SXxQWWCMSPwp6OKnrvGcHyoXkEDhyRyFbT3+7T7TdUydXzJmnp/i61
GUoh98YfAPLBh76tYp7NyuQWlzqZjNb9B4J6CRdlOZQY7kJT+0eOKFU/8a0vxP9U
pF29vQBmU2bRx1vCso0PR4k1uzuhx6ppNGXnFT580oU8U5a9E1xdBJp94EtQKPIr
FRWlpijEiH7LxvCccRRft5I9V/2dczSQuzsVNxSZxLLWrB6k70cE1BCmfcvh+K+c
02l5Sf2AkMRWXkJ5RMMkuwT1B9SiO5S1736QKJ3Yxu+3dwSiILk=
=wVmr
-----END PGP SIGNATURE-----

--JEhcvQN4vxPMMub6--
