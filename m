From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 2/6] clocksource: tegra: add Tegra210 timer driver
Date: Tue, 29 Jan 2019 11:29:12 +0100
Message-ID: <20190129102912.GC28850@ulmo>
References: <20190128091815.7040-1-josephl@nvidia.com>
 <20190128091815.7040-3-josephl@nvidia.com>
 <20190128150908.GB31317@ulmo>
 <20190129084155.GX7714@pdeschrijver-desktop.Nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="i7F3eY7HS/tUJxUd"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190129084155.GX7714@pdeschrijver-desktop.Nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Joseph Lo <josephl@nvidia.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--i7F3eY7HS/tUJxUd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 29, 2019 at 10:41:55AM +0200, Peter De Schrijver wrote:
> On Mon, Jan 28, 2019 at 04:09:08PM +0100, Thierry Reding wrote:
>=20
> ...
>=20
> >=20
> > Up to here this is a duplicate of timer-tegra20.c. And a lot of
> > tegra210_timer_init() is the same as tegra20_timer_init() as well. Can't
> > we unify the two drivers instead?
> >=20
> > The power cycle restrictions of the architected timer, do they not apply
> > to chips earlier than Tegra210 either? So don't we need all of these
> > additional features on the timer-tegra20.c driver as well? If so that
>=20
> No. Chips prior to Tegra114 do not have an arch timer and the arch timer
> does work correctly on Cortex-A15 so Tegra114 and Tegra124 can use it.
> It's broken on Cortex-A57 though, so we can't use it as a wakeup source
> on Tegra210.

If chips prior to Tegra114 don't have an architected timer, then we
can't remove the timer-tegra20 driver, because we still need it on
Tegra20 and Tegra30, right?

Thierry

--i7F3eY7HS/tUJxUd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxQKvMACgkQ3SOs138+
s6ESkxAAmPafbK79nW+LhXKQ7nIGVNRT3TZ2CgSuShtFP7bYxtDA2MmTMQu4/VfD
G6v4td8renRj+3RaGbmukoVGeHlp7ILdkUb3+RLf5rJVXe46rvGuoSXwj3t92wNC
UXxLUQNrqpR7C13sCufdjbAoy4xurzf1arsKJLjfmPF0EW5Wfcs8D8+fMkd1ZrHf
NTWeeOQLi+hhvNU2RQSF7OH8pkXpTICbLCdQ3hvSrTJaQ6dcJnLkG6h5I0uYCpr4
MHt9WButS8LHlxEcpXH/THOoFQ0Hk7+yLG+XIEKWwRBojXTN3b5eA39y4U0zqWkZ
P8YyHYP+0fSeUurbP/8MLxKOQHRY8Ost2ONs4KgyenTPF7NkWNq+jHmNAzfkZ8Ta
2D2cSi79xOXb7eSZ1g09o+z3hTzmqqBP5Mj1Y9XjQQaNDmjb9eM08EQJz176awTq
fggDH3rR/BSQ13D93F6ghDFP0yFDbFl8q3NIN6IC9c2jS/GB/xqVS2/dMImW3DL7
gDkIEnI7K2EC3fiUtKK+SGDQLK0c7+QlkZ+fzD86cULLiatvm8TsFwJFW5rxQqKs
ZgIi5FnD/CXugk3QsqFnaZeQvpb4U8l8TLIg4ZAYUGEwiH/KDCU3BEoSGwmro7Zf
5BSPZwp505/YvejxBl7LWrw27SLA0pDbsJNmArubNjrTv4dZKj4=
=tJel
-----END PGP SIGNATURE-----

--i7F3eY7HS/tUJxUd--
