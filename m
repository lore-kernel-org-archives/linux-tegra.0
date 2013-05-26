From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/6] gpu: host1x: Fix syncpoint wait return value
Date: Sun, 26 May 2013 12:12:44 +0200
Message-ID: <20130526101243.GB1652@mithrandir>
References: <1368791388-31441-1-git-send-email-amerilainen@nvidia.com>
 <1368791388-31441-3-git-send-email-amerilainen@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="K8nIJk4ghYZn606h"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1368791388-31441-3-git-send-email-amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: airlied-cv59FeDIM0c@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--K8nIJk4ghYZn606h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 17, 2013 at 02:49:44PM +0300, Arto Merilainen wrote:
> Syncpoint wait returned EAGAIN if it was called with zero timeout.
> This patch modifies the function to return ETIMEDOUT.

This description is a bit redundant, because it repeats in prose what
the code does. I'd rather see a description of why the change is
necessary.

Thinking about it, maybe it would be good to have two separate error
codes. Keeping -EAGAIN for the case where a zero timeout was passed
doesn't sound too bad to differentiate it from the case where a non-
zero timeout was passed and it actually timed out. What do you think?

Thierry

--K8nIJk4ghYZn606h
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJRoeAbAAoJEN0jrNd/PrOhkaYQAKztP0yRn93EaycGhtSuAeRU
9Lg3QSQi4sDFcx8ZsYm7eFNg3QWkgrhFTK2cUzhemhrtfeerBVsCclKb8zf/mG/c
J0hgNhKYihzoJtRwwI4ODNs7revMXcXhWlAb4Yo1K8lIfC9cXtuabBKGQaFIcX8n
3L/1Snwb9fUcwJ2pPPRzdmR9KtcXJuZaPKjO44+YGWRhTeWVwlTDZLDZDsh0+3Bm
8JW7RUGh4is6AueFPDHGKEjfaSMRyj3vmloXPTMw3ao6+frZPtMLlVVFk3AZ8zqS
/fSkn1r/N2u0BbunY2doXNdEjm3gtR+0m39LdvyZAu+8+0IljgWFzm04XlmQZa7N
XSk5AxnqreUVZa+xc8Mq2Iwh5SdYiMMi4swoKIe3ZCvPVCMtBbQF/btgcSsRAQEd
BVQUbqtTlfWuMHkE9AkVI/n5YYQLmx8A/W0yN8Qn4qbEUvuPfnHHnuuDwLsANsHn
axXgDJhf7bNYyMTH6xIXgkxfWqkAQ/y/kXyl9ygYdDHv7GGNdftJPoFRceWTysbd
CzR7bvW67VB8tfDcQB1lzH2aowxn6AYbWw5b4wW52FESO9A/7epFf1JgCK12uYRg
yaIQ7DTihUu3ahHjsETiKGdvzgx1SPSFzi8vmeKRAjq14ENhmaBO3+v+kqcqWxn4
j4mCE6Yalj+FrSRJTxzd
=laJR
-----END PGP SIGNATURE-----

--K8nIJk4ghYZn606h--
