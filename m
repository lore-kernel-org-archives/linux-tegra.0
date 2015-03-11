From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra20: Store CPU "resettable" status in IRAM
Date: Wed, 11 Mar 2015 11:29:59 +0100
Message-ID: <20150311102957.GM19577@ulmo.nvidia.com>
References: <1421319545-23920-1-git-send-email-digetx@gmail.com>
 <1421319545-23920-2-git-send-email-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pFpMklMRdxwSC3Yi"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1421319545-23920-2-git-send-email-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--pFpMklMRdxwSC3Yi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2015 at 01:58:57PM +0300, Dmitry Osipenko wrote:
> Commit 7232398abc6a ("ARM: tegra: Convert PMC to a driver") changed tegra=
_resume()
> location storing from late to early and, as a result, broke suspend on Te=
gra20.
> PMC scratch register 41 is used by tegra LP1 resume code for retrieving s=
tored
> physical memory address of common resume function and in the same time us=
ed by
> tegra20_cpu_shutdown() (shared by Tegra20 cpuidle driver and platform SMP=
 code),
> which is storing CPU1 "resettable" status. It implies strict order of scr=
atch
> register usage, otherwise resume function address is lost on Tegra20 after
> disabling non-boot CPU's on suspend. Fix it by storing "resettable" statu=
s in
> IRAM instead of PMC scratch register.
>=20
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Fixes: 7232398abc6a (ARM: tegra: Convert PMC to a driver)
> Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> # v3.17+
> ---
>  arch/arm/mach-tegra/cpuidle-tegra20.c |  5 ++---
>  arch/arm/mach-tegra/reset-handler.S   | 10 +++++++---
>  arch/arm/mach-tegra/reset.h           |  4 ++++
>  arch/arm/mach-tegra/sleep-tegra20.S   | 37 ++++++++++++++++++++---------=
------
>  arch/arm/mach-tegra/sleep.h           |  4 ++++
>  5 files changed, 38 insertions(+), 22 deletions(-)

Sorry for the long delay, but I've applied this now to the Tegra tree.

Thierry

--pFpMklMRdxwSC3Yi
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVABkjAAoJEN0jrNd/PrOhgjoP/ig9gYC+mCShDr09MK1b9T/S
kt/CEJNpI6oedQGYyTnpfltYZRlLtyAJ3yme1oB052Lrt+kLbUyDLjqrrv27FsY2
dTn961cEQ96UnLxByu8ladjBcQsoz4AfYSvrm9xz+H1auqc9n+LAfdJXeKXKjTFi
dKvYWYwMDDPvLL25aoFsruvi+niBS2WuTNK7QCynFp/iJzIgpr55pvSIBThowO3q
57AGFm4mn6wMBuok3G1ZOA9w/UwnMRnuvJjVwwRRVc8GVi3X2oWNzRYfJcaI+9db
ItxIHpJKY7iiEkuwwFa5t6tkvODONu7XeV1tkinbE/8Z9g6orB5UAVpsP27bXvGM
x1h7V73LGrVDXpQK3GBzhZ4JrbKYLvHjVu3lR67bGfa5Ryy1wGGvC+KUKogwiCoJ
auffh5cVx24TephXH8AMlUYC3zPayZf75QfaliH1w3BFXui7tAp6LO7t4EHQ1ml5
rXbrAWLantCHmJUEe6D7smaH+eha/1C70Z9pKDlDgEBluYdzLZ6Jgo/1pvFWFiRo
2NAGytAep2wu5CmnwHQUhOQQAVD6t5xh2Yl9Xkd2xPwexZdME98CaIAtMND+YnPR
5ZWlwiM/osqjm+YLU9XjmR6EMbv0qhpILKJ9X+8rnkpk7uuzdEyGPXUGawJJVnGb
CgCEypws2sEnTOGXQ1c0
=ZE57
-----END PGP SIGNATURE-----

--pFpMklMRdxwSC3Yi--
