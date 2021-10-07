Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D988C433EF
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Oct 2021 18:11:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 74ED061248
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Oct 2021 18:11:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243383AbhJGSNC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 7 Oct 2021 14:13:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233744AbhJGSNB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 7 Oct 2021 14:13:01 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A68C1C061570;
        Thu,  7 Oct 2021 11:11:07 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id r7so21690926wrc.10;
        Thu, 07 Oct 2021 11:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YPZq4i99ojwjfO9gnkVbzD1NE+2L9d6HDaRaRqoOA60=;
        b=l4X2A6bdvlXqXqGsL51RtHKJlKxkK650e63yhqHJ+8BftF/IahE5bJKxnYur2lRnfZ
         InVfucfDt1eFGEAex23+SkLFkgSTU6TWNyO6WQ/qZfRDS0DYm9t3oE0sMeXtXSLCu7tk
         9vrbdUyzGPe03pVixKxRKSZ9HmOJNQ8FnWFOdH4eH2Dqdw1XiYcAna8PVf6W5Zo3GB1Y
         u3RKCsuFuPYC22xNm+tl4eWMI2uHk3Mgg7S3Xpw3FhOqgOqh0p2/fvd2NbCk08JzSb9I
         2PQd2eRoNgkM6IdE9Vdy7RMUhM4Cx+aquucWqlJvgFBrUlZI6tyIEKJmJmskvTeBtOt0
         Ek2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YPZq4i99ojwjfO9gnkVbzD1NE+2L9d6HDaRaRqoOA60=;
        b=Bm2DHCsCFyOz1Lj9OD3Kli2rcKfz95fVHNpwptvH1Hx/zzbCml7XuTfYA2DemKZxg4
         Igr6uz215YqAuZGM0zU/lgVJTxImjRtG8wnlG92nlgeRf+F1rrXkNgD8zWZmu2t+zcZG
         g/KpjHJiQcBnI1BxU+PiYeBsSHABtrHlQAJJ7EIna6sUhQpW/YpRy9kUTH00gnEOv2LV
         2JNpvUhJsDwnbV1rD8EaM4JvQLYCkjRazoDd9hOIjkKC5I5SI+uVUKy6G7wO1yH7Ilxl
         seKk5D4Nrr1xuGSboQohU0AhPi4TSVa++yZS/oRx7DHJcrfqOa3Za5SvjQXNlPIAmn2f
         Nh4Q==
X-Gm-Message-State: AOAM530mqudcBNOZLIDZNIIir7wVKyR13xTawrGAh5ukmM+lZkKLvf3p
        kmLjSW1TvD26Yinf+ng/CyU=
X-Google-Smtp-Source: ABdhPJxTaw99Pcyo1wUbpcD6t5CQ5JGzfZ+gNpdPOj7EutfxObHAezxbZ8YfqDRYBKx1LQgf0fi7BQ==
X-Received: by 2002:adf:8b5d:: with SMTP id v29mr7309833wra.175.1633630266283;
        Thu, 07 Oct 2021 11:11:06 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id x21sm9591051wmc.14.2021.10.07.11.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 11:11:05 -0700 (PDT)
Date:   Thu, 7 Oct 2021 20:11:04 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [RESEND] firmware: tegra: reduce stack usage
Message-ID: <YV84OJWGqd3zGSfJ@orome.fritz.box>
References: <20210927124148.1415359-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="/mk16A4DaXmSFqJJ"
Content-Disposition: inline
In-Reply-To: <20210927124148.1415359-1-arnd@kernel.org>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--/mk16A4DaXmSFqJJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 27, 2021 at 02:41:40PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> Building the bpmp-debugfs driver for Arm results in a warning for stack u=
sage:
>=20
> drivers/firmware/tegra/bpmp-debugfs.c:321:16: error: stack frame size of =
1224 bytes in function 'bpmp_debug_store' [-Werror,-Wframe-larger-than=3D]
> static ssize_t bpmp_debug_store(struct file *file, const char __user *buf,
>=20
> It should be possible to rearrange the code to not require two separate
> buffers for the file name, but the easiest workaround is to use dynamic
> allocation.
>=20
> Fixes: 5e37b9c137ee ("firmware: tegra: Add support for in-band debug")
> Link: https://lore.kernel.org/all/20201204193714.3134651-1-arnd@kernel.or=
g/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> I sent this one in 2020 but got no reply. It still appears to be
> required, please have a look.
> ---
>  drivers/firmware/tegra/bpmp-debugfs.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)

If this is not a problem on 64-bit ARM, then perhaps we should add that
as a dependency. BPMP is only available in Tegra210 and later, all of
which are 64-bit.

But dynamic allocation also doesn't sound that bad. This is debugfs
support, after all, so shouldn't be in any fast path.

>=20
> diff --git a/drivers/firmware/tegra/bpmp-debugfs.c b/drivers/firmware/teg=
ra/bpmp-debugfs.c
> index 3e9fa4b54358..f6888cee83ee 100644
> --- a/drivers/firmware/tegra/bpmp-debugfs.c
> +++ b/drivers/firmware/tegra/bpmp-debugfs.c
> @@ -74,28 +74,34 @@ static void seqbuf_seek(struct seqbuf *seqbuf, ssize_=
t offset)
>  static const char *get_filename(struct tegra_bpmp *bpmp,
>  				const struct file *file, char *buf, int size)
>  {
> -	char root_path_buf[512];
> +	char *root_path_buf;
>  	const char *root_path;
> -	const char *filename;
> +	const char *filename =3D NULL;
>  	size_t root_len;
> =20
> +	root_path_buf =3D kzalloc(512, GFP_KERNEL);
> +	if (!root_path_buf)
> +		goto out;
> +
>  	root_path =3D dentry_path(bpmp->debugfs_mirror, root_path_buf,
>  				sizeof(root_path_buf));
>  	if (IS_ERR(root_path))
> -		return NULL;
> +		goto out;
> =20
>  	root_len =3D strlen(root_path);
> =20
>  	filename =3D dentry_path(file->f_path.dentry, buf, size);
>  	if (IS_ERR(filename))
> -		return NULL;
> +		goto out;

Shouldn't this and...

>  	if (strlen(filename) < root_len ||
>  			strncmp(filename, root_path, root_len))
> -		return NULL;
> +		goto out;

this reset filename to NULL? All callers check for !filename as their
error condition.

I can fix that up as I apply this, but perhaps shout if you did this on
purpose and it needs to stay this way.

Thierry

--/mk16A4DaXmSFqJJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmFfODgACgkQ3SOs138+
s6EZDRAAo555V1mx0TXgRL8QQPqosTymslLGW1QKkqdd1SGmSE58HRhBytmSZzIt
QLQjLC3RgP5hglidqCkdu5kPv2tx0KqJHK4BLryAJPWcJoQCgmnenR06dEF4Sq6C
keMMyJNllIUYSX5eIeezjdUiSKxcOoqzLCStLURRuhNpXbWUi+xlnHUnNfxxzZrj
az6I1dzDnD9HFeWDUDc/SJenAbrkOjir6r1dGurNTW23z4CWmxL49z1/Qw/r8dUe
nyE8yK06W9M7iRx1x3kmp9tscgyYWNEPiHMiZT0y65qyYi21UBoAPn/wjsSZXuDs
cNvOJIDM8uIPYImq+hfeHk31x0RKXsG82jclelKNuBYE8EAEellW86zxz+68lBsE
2nebtLVY66JrPAQ9VLcHPXEbrIrydoldjKjL8zHVHrCGelzEchaIx9COveDlBOCF
F3pP75vDb0i3H+dkmspRDJI8nfrSvfr+swGR03Zx8DNuPdsgz7HWuTRRRQ8nnzUQ
VeDzXPV3akygh8MoDQV56kEZE8JMBNp2TEYTxLOsJGMwpmMpvuSjAEyy72CEXQMM
HsZnX1w3Tw480IrJctUeJQ+kRn5liw6LGOfQDoLib0rpbhUvbIh0BRJyO2lw1pUp
iPk16P99O3ulzqyBIeZ2ffYakKAbQ9c4JibzZMQxnAK77xg6HDY=
=iDPK
-----END PGP SIGNATURE-----

--/mk16A4DaXmSFqJJ--
