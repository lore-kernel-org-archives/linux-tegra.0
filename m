From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 5/6] gpu: host1x: Rework CPU syncpoint increment
Date: Sun, 26 May 2013 12:24:09 +0200
Message-ID: <20130526102408.GE1652@mithrandir>
References: <1368791388-31441-1-git-send-email-amerilainen@nvidia.com>
 <1368791388-31441-6-git-send-email-amerilainen@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RpqchZ26BWispMcB"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1368791388-31441-6-git-send-email-amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: airlied-cv59FeDIM0c@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--RpqchZ26BWispMcB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 17, 2013 at 02:49:47PM +0300, Arto Merilainen wrote:
> This patch merges host1x_syncpt_cpu_incr to host1x_syncpt_incr() as
> they are in practise doing the same thing. host1x_syncpt_incr() is also
> modified to return error codes.
>=20
> Signed-off-by: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/host1x/dev.h          |    8 ++++----
>  drivers/gpu/host1x/hw/cdma_hw.c   |    2 +-
>  drivers/gpu/host1x/hw/syncpt_hw.c |   12 +++++-------
>  drivers/gpu/host1x/syncpt.c       |   15 ++-------------
>  drivers/gpu/host1x/syncpt.h       |    7 ++-----
>  5 files changed, 14 insertions(+), 30 deletions(-)

Looks good. Can you carry this over to v2 as well so I can apply all of
them in one go?

Thierry

--RpqchZ26BWispMcB
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJRoeLIAAoJEN0jrNd/PrOhFFIP/RuXV8B3Eda0cYwo+aiol93v
RlocIFyQG8n5SERrU2p6DZzGixMDca7qZT4y3KwlTPNshD+OpETAq8ppfH0RJ4zt
MA+xGSi/gCLzPYQYbxaPEYHxNCNe3pVHzXEryYEsUaGc+10ki12LfEuxILkw/lDg
Fc3BB7U8xpDhRHf/Zn+g07TKeYJYwEabjs0tLLyisLr11R0QqT36bbUJAM8FJpM2
VaActZ3K/7Eg47686n0hYMqFfin9T4YvRXMIYNOE93wV3GJjLbb33uoXJ8MJBJ/Q
DlvM9yCTes9DfC+l7fBFiJ/U8aUFIxzU/H5g2/86p2IoU86LUFqsJzZKCA723JMz
8YBNoD4UKD6wdQUZPR62dUatRW+/8W8hLc2fBNP9mRy+krXgkGL871yFmiIooviu
f4aGOaFpqHLBJgRuBuGksT2rjb6rE12kyM/k/EvQnSc8VocrAVqD3hay18mVW2ra
kjLbDVjbgpQSytUFzEhdR+qI7u4Za9USRt2Xt97rRS32dmYBMaVf4MC5+06ZYCOM
yXyfQZS2R6AIcAH8FZLjkY4bzVOVQZRmOQxzXyiSHQDJ99G4F1gQYqraSqLAhKew
trnkSw524UmaQnAicjoxYwDJ1TceYkMhJNcoKOPbmKvyCOC5qcZ4QcWaA867yQit
+gO08ubmv7sHHAdyqGZm
=JtZb
-----END PGP SIGNATURE-----

--RpqchZ26BWispMcB--
