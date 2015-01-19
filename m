From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra20: Store CPU "resettable" status in IRAM
Date: Mon, 19 Jan 2015 15:12:26 +0100
Message-ID: <20150119141224.GF23778@ulmo.nvidia.com>
References: <1421319545-23920-1-git-send-email-digetx@gmail.com>
 <1421319545-23920-2-git-send-email-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mrJd9p1Ce66CJMxE"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1421319545-23920-2-git-send-email-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--mrJd9p1Ce66CJMxE
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

I'm leaning towards applying this. Stephen, Alex, Peter: any objections?

Thierry

--mrJd9p1Ce66CJMxE
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUvRDIAAoJEN0jrNd/PrOhQI0P/0UiH/0lmXvhrbH7ldOTHQdJ
lCqbMCqZPelKJ3ck0wZnhNqvunK9EmOdQPXDUKdkHG7m6kofOXyn0JyYJ3ypfQho
K8wobRCUJd5gTVEp3+noiOQbuRsusavDYP6818Vd+BEtG8thB2oxKOMcJBqqPOAT
a0mF2+cEnOJsp7t+zut4Pp+Za0WJmD58LtOJMt3bh1l17kC20rfvrSKEyq5rORnw
uKv6SBAm9ml9tOdPlEQbHV5/pZaH0wOgam4oL1uqMs3CXWPS61G3bJw7t+UKkA7U
0Jsd7PrDwhWk93od/iJN2YR/NrRFrATxsL9RaGRrjWRslx4jJibfEE5YiQ3snxZy
FYNpZG8de+uhd6w60Cog+zjcxIIh1xWGHjElsgOSUQURDbQmDOxtpFAgwhX2YZYy
CnefEzmJmI+uZCQ37SNRLac7ULv3PfiOnKDt6vd44bIPLwRPEXXNim7nKmjUZVS9
6vqMHdppua2kWSHOjMSI0xjaRzUQmXroDDmu+Pdli2U1qwK4Dg0KbshsnVYUSit5
Pu0x2+T+pWGQXhfmZkL48cfEcWyE+FYYcs/xqXdTkuECIffvSgBuXvKfqNqII1Pv
raAAfA4dn4iavODZWbE0yxcbmflVWGfJuKSpOqeAx5H7J6gAWIXbqL3snetGCrZn
iJj618yi25S0h5bepkEz
=UTNB
-----END PGP SIGNATURE-----

--mrJd9p1Ce66CJMxE--
