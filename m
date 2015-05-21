From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] ARM: v7 setup function should invalidate L1 cache
Date: Thu, 21 May 2015 10:30:47 +0200
Message-ID: <20150521083046.GA30323@ulmo.nvidia.com>
References: <E1Yuk8W-0001tC-IK@rmk-PC.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SUOF0GtieIMvvwua"
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <E1Yuk8W-0001tC-IK@rmk-PC.arm.linux.org.uk>
Sender: linux-sh-owner@vger.kernel.org
To: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-sh@vger.kernel.org, linux-tegra@vger.kernel.org, Christian Daudt <bcm@fixthebug.org>, Florian Fainelli <f.fainelli@gmail.com>, Marc Carino <marc.ceeeee@gmail.com>, Brian Norris <computersforpeace@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Wei Xu <xuwei5@hisilicon.com>, Shawn Guo <shawn.guo@linaro.org>, Sascha Hauer <kernel@pengutronix.de>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, Barry Song <baohua@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Dinh Nguyen <dinguyen@opensource.altera.com>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Micha
List-Id: linux-tegra@vger.kernel.org


--SUOF0GtieIMvvwua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2015 at 05:12:56PM +0100, Russell King wrote:
> All ARMv5 and older CPUs invalidate their caches in the early assembly
> setup function, prior to enabling the MMU.  This is because the L1
> cache should not contain any data relevant to the execution of the
> kernel at this point; all data should have been flushed out to memory.
>=20
> This requirement should also be true for ARMv6 and ARMv7 CPUs - indeed,
> these typically do not search their caches when caching is disabled (as
> it needs to be when the MMU is disabled) so this change should be safe.
>=20
> ARMv7 allows there to be CPUs which search their caches while caching is
> disabled, and it's permitted that the cache is uninitialised at boot;
> for these, the architecture reference manual requires that an
> implementation specific code sequence is used immediately after reset
> to ensure that the cache is placed into a sane state.  Such
> functionality is definitely outside the remit of the Linux kernel, and
> must be done by the SoC's firmware before _any_ CPU gets to the Linux
> kernel.
>=20
> Changing the data cache clean+invalidate to a mere invalidate allows us
> to get rid of a lot of platform specific hacks around this issue for
> their secondary CPU bringup paths - some of which were buggy.
>=20
> Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
> ---
[...]
>  arch/arm/mach-tegra/Makefile          |  2 +-
>  arch/arm/mach-tegra/headsmp.S         | 12 ------------
>  arch/arm/mach-tegra/reset.c           |  2 +-
>  arch/arm/mach-tegra/reset.h           |  1 -
[...]

Russell,

I saw a couple of conflicts trying to apply this to v4.1-rc1..v4.1-rc4
or any of recent linux-next versions. I ended up applying this on top of
your for-next branch and tested using that. The conflicts seem very
minor and a test merge of Tegra's for-next branch resolved this fine. A
test merge of next-20150520 shows one conflict in mach-socfpga/core.h,
but it's a trivial one to resolve.

Anyway, the patch seems to work fine on TrimSlice (Tegra20), Beaver
(Tegra30), Dalmore (Tegra114) and Jetson TK1 (Tegra124). Tested on
Paul's boot farm:

Tested-by: Thierry Reding <treding@nvidia.com>
Acked-by: Thierry Reding <treding@nvidia.com>

Paul, thanks for setting up the boot test infrastructure, this saved me
a lot of time.

Thierry

--SUOF0GtieIMvvwua
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVXZezAAoJEN0jrNd/PrOhrC8P/jcVDadjbdH/cg5TWx+x1CaM
38tjlw2ECg+7dLvqq+6fnzi36SvCxYcpT9RorPzzZKuWV4Yb0453aeb4luIYO/3Y
J6m0QStCDx1FnXmuH+gIcBnKIYRo+T5KgnuwBs54XMD25idryzfod3959YbgtTxF
ttaVxops35MN/nK+wJLaC7TFcPtFVuPZ9atqDPDHBdTGlxt6x+D+WhiYhIsuquE9
l8pQK/HXGKNiSoUFeQlBQ36qnT9LATWoz2D5xhl8/tA4W8q4oPXF271x1NGLIlw1
vGdZqpslQFAeSrs0erSfUbDc1yXGs+LfGwsdeWpfo8xBZNd4Orb8dF/qfwq2Bi3E
U0F4Mlj4bz/wGYPBqpzmXKpL155p7AbN1NyTpYLFm1Wjdyb8sn1AEgQ3bs1F8ISj
UD//iDfbEUb97a1Zt2FZ9LqOYrzE+kJXendxY/AtKm15SYsG7aZtM4aVuZKonIw1
YXZ7t7N3BdyLKAd8XZICtT5awLO+WZvAdxC01iVUQqYTX0yfTMYNDxCgd4kPJmdr
vKlua0DoZC4IwV6IssGqrxprRVhDNg9ojwmTn9zMH3xRWGTOJT+AzWqG8HLYjvfn
XQxuG6Q1/v5Hg2rsLbRxX4F9Cud5nwXENSqQWV952FzvG+MfXNAeRmI2QlfOshOU
ryX0P6XmHdivmJdtucsb
=BRGw
-----END PGP SIGNATURE-----

--SUOF0GtieIMvvwua--
