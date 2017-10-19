From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2] clk: tegra: Use readl_relaxed_poll_timeout_atomic in
 tegra210_clock_init
Date: Thu, 19 Oct 2017 11:44:22 +0200
Message-ID: <20171019094422.GI9005@ulmo>
References: <1505502613-11801-1-git-send-email-nicoleotsuka@gmail.com>
 <20171019092919.GA7252@Asurada>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="o7gdRJTuwFmWapyH"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171019092919.GA7252@Asurada>
Sender: linux-clk-owner@vger.kernel.org
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: sboyd@codeaurora.org, pdeschrijver@nvidia.com, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, jonathanh@nvidia.com, mturquette@baylibre.com, pgaikwad@nvidia.com
List-Id: linux-tegra@vger.kernel.org


--o7gdRJTuwFmWapyH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 19, 2017 at 02:29:20AM -0700, Nicolin Chen wrote:
> On Fri, Sep 15, 2017 at 12:10:13PM -0700, Nicolin Chen wrote:
> > Below is the call trace of tegra210_init_pllu() function:
> >   start_kernel()
> >   -> time_init()
> >   --> of_clk_init()
> >   ---> tegra210_clock_init()
> >   ----> tegra210_pll_init()
> >   -----> tegra210_init_pllu()
> >=20
> > Because the preemption is disabled in the start_kernel before calling
> > time_init, tegra210_init_pllu is actually in an atomic context while
> > it includes a readl_relaxed_poll_timeout that might sleep.
> >=20
> > So this patch just changes this readl_relaxed_poll_timeout() to its
> > atomic version.
> >=20
> > Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> > Acked-By: Peter De Schrijver <pdeschrijver@nvidia.com>
>=20
> Thierry, can you also take a look at this one? I sent a month ago. Thanks.

I'm wondering why we're not seeing a splat for this. Usually the kernel
will warn if you sleep during atomic context. Does this mean we're just
not hitting that case? readx_poll_timeout() has a might_sleep_if(), and
therefore it should always cause the splat.

Any ideas why this has gone unnoticed for all this time?

Thierry

--o7gdRJTuwFmWapyH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlnoc/YACgkQ3SOs138+
s6GYBBAArS9B7UkWWtCLw/lv625C3fklYG8Cuk5tyXtd6APNjl9mXewlWUqYDshp
LkdpAfFKeVcFSBVhi0pZISbv9lQxNXil7daZm57qil2G/LZZfAL5rsnPV2g0nvtR
WWjIcmXPIVuTaQlfFuSFkt/xJtnB9I2K9HPmDeiKrmADld25ZaFnydNXr9uTmAzh
jHAQz3yslxDP2thOuZrXxRAxdJb263fi3JdAoNF0GI4foAEdoaz+VxCnBBc4wSP1
ye+HWhKoQEPEGoZGkvTN26wV9tkaTXagPi9Khgh9R18mA/WbWttFgTXc3xLq9SeU
JFkp45aTv0oHPpSACbeErlMVMKCGKX+yPNjev+gj0MHePAZf8/y/dI7EDghz9Efu
osbLC713zUGH6f/zFmlarr0OL1ItMn8KxteMRAonQzDoj7rXplmKba32qiTUyFX7
p4ZH8ofDk7gu4sbXqzJpWJ1OBniyb3G7IBpYip5umf1HiEZ0cpcztleTVTQfJw1j
SLDCCMgjdELoYH7UE51crw5x6znYSrkxMvV0h+uudrFpm/6P2CwkLrEA8x2emeYk
UzUkfknbKVqEtbwOfrUlg39xmyUZKrgGtWs0gyUVPthsGIld/N6lWK+K+E+vWQjP
9wGuBXdjJl35vZui5QrJhMzjlE8etROtJgFuK7dG2ZynFy3ptvw=
=xRkw
-----END PGP SIGNATURE-----

--o7gdRJTuwFmWapyH--
