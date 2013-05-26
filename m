From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/6] gpu: host1x: Fixes to host1x firewall
Date: Sun, 26 May 2013 12:02:41 +0200
Message-ID: <20130526100240.GA1652@mithrandir>
References: <1368791388-31441-1-git-send-email-amerilainen@nvidia.com>
 <1368791388-31441-2-git-send-email-amerilainen@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="17pEHd4RhPHOinZp"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1368791388-31441-2-git-send-email-amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: airlied-cv59FeDIM0c@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--17pEHd4RhPHOinZp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 17, 2013 at 02:49:43PM +0300, Arto Merilainen wrote:
> From: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> This patch adds several fixes to host1x firewall:
> - Host1x firewall does not survive if it expects a reloc, but user
>   space didn't pass any relocs. Also it reset the reloc table for
>   each gather, whereas they should be reset only per submit. Also
>   class does not need to be reset for each class - once per submit
>   is enough.
> - For INCR opcode the check was not working properly at all.
> - The firewall verified gather buffers before copying them. This
>   allowed a malicious application to rewrite the buffer content by
>   timing the rewrite carefully. This patch makes the buffer
>   validation occur after copying the buffers.

Can these be split into separate patches, please? It's not only always
good to split logical changes into separate patches but it also makes
reviewing a lot more pleasant. It's hard to tell from this combined
patch which changes belong together.

I have a few additional comments inline.

> diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
> index f665d67..4f3c004 100644
> --- a/drivers/gpu/host1x/job.c
> +++ b/drivers/gpu/host1x/job.c
> @@ -228,17 +228,15 @@ static unsigned int do_relocs(struct host1x_job *jo=
b, struct host1x_bo *cmdbuf)
>  	void *cmdbuf_page_addr =3D NULL;
> =20
>  	/* pin & patch the relocs for one gather */
> -	while (i < job->num_relocs) {
> +	for (i =3D 0; i < job->num_relocs; ++i) {

Nit: I prefer post-increment where possible. For consistency.

> @@ -268,15 +263,15 @@ static unsigned int do_relocs(struct host1x_job *jo=
b, struct host1x_bo *cmdbuf)
>  	return 0;
>  }
> =20
> -static int check_reloc(struct host1x_reloc *reloc, struct host1x_bo *cmd=
buf,
> -		       unsigned int offset)
> +static bool check_reloc(struct host1x_reloc *reloc, struct host1x_bo *cm=
dbuf,
> +			unsigned int offset)
>  {
>  	offset *=3D sizeof(u32);
> =20
> -	if (reloc->cmdbuf !=3D cmdbuf || reloc->cmdbuf_offset !=3D offset)
> -		return -EINVAL;
> +	if (!reloc || reloc->cmdbuf !=3D cmdbuf || reloc->cmdbuf_offset !=3D of=
fset)

Is the additional !reloc check really necessary? Looking at the callers,
they always pass in fw->relocarray, which in turn is only NULL if no
buffers are to be relocated.

> +		return true;
> =20
> -	return 0;
> +	return false;
>  }

I wonder whether we should be changing the logic here and have the
check_reloc() function return true if the relocation is good. I find
that to be more intuitive.

> @@ -376,69 +371,58 @@ static int check_nonincr(struct host1x_firewall *fw)
>  	return 0;
>  }
> =20
> -static int validate(struct host1x_job *job, struct device *dev,
> -		    struct host1x_job_gather *g)
> +static int validate_gather(struct host1x_firewall *fw,
> +			   struct host1x_job_gather *g)

I don't think we necessarily need to rename the function. However since
you modify each line that the rename touches anyway it's okay.

> @@ -508,6 +502,7 @@ int host1x_job_pin(struct host1x_job *job, struct dev=
ice *dev)
>  	int err;
>  	unsigned int i, j;
>  	struct host1x *host =3D dev_get_drvdata(dev->parent);
> +
>  	DECLARE_BITMAP(waitchk_mask, host1x_syncpt_nb_pts(host));

This is an unnecessary whitespace change.

Thierry

--17pEHd4RhPHOinZp
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJRod2/AAoJEN0jrNd/PrOh7CQP/jjAjChtNnGFQykWms4o0laW
k4yUTZvC5BxGERohx57ssx+bA7pQVTcX9r+YMGi6D+MfocP0yp0BMI5rw8KnymPI
ub5V6WoikyRrgLnwhZUKpDpe+qNSqgsyVFiYV4d2quvtBjMcf48d/p4rd6qD0TpS
kcRgn5U0wN+2N7Rgi7+c78tOgHyjMTE3ai7FwhVuJubkpsTUAb/FCQToSJO2FnLo
b572mKuBZHDWRY3C6/ZKwF+52GgSOeFGAOpowVC59wCDO9c3/n/MM1CI23i5jWRr
GptGVvHHTbu9/nJAd4B+batdCZsC9jHVFvQZW8ssL6nrp593dQTmYMs8OCvo5LfQ
cH3ga+n6Pe0aSp2L+D4+rL9juVq5UAzPVlq1pgusDaJTVHbi23OjXLV0lUXDX8MP
avhrga05xUD0QTOEaCqoGzTcuBJvmRtTCaH7wg2+OqrgM2p+3sZJ32ZU/XxrNHSg
WoznBwAs2mkdqBP1QN21cy6bXdCkQaLKSXS9W4/fRk96ziMk61XYuCTJTiRCQpJc
ptWtIVLFz9+eMQTci4M7eD7oA5ctdq5BeHyz57/LqnXHDQS+yDh0L3UD/YXEEulv
7/GHpV8bCtuSbazxsR5KSqLLFihiMnoqFxEVLVkGUyhb50aoPWJs4etaPdJHYaDr
ixG4R+PHRjHi22+r+MYc
=vwd0
-----END PGP SIGNATURE-----

--17pEHd4RhPHOinZp--
