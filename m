From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] clk: tegra: Fix bypassing of PLLs
Date: Wed, 25 Nov 2015 16:11:00 +0100
Message-ID: <20151125151100.GA31492@ulmo.nvidia.com>
References: <1448032264-29622-1-git-send-email-jonathanh@nvidia.com>
 <CANMBJr7vYb+kuUBzsC8i4b=b6DRVsbqnf5OrVtj6kVS2RMNgfQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="J/dobhs11T7y2rNN"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CANMBJr7vYb+kuUBzsC8i4b=b6DRVsbqnf5OrVtj6kVS2RMNgfQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tyler Baker <tyler.baker@linaro.org>
Cc: Jon Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rhyland Klein <rklein@nvidia.com>, Kevin's boot bot <khilman@kernel.org>
List-Id: linux-tegra@vger.kernel.org


--J/dobhs11T7y2rNN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2015 at 03:18:59PM -0800, Tyler Baker wrote:
> Hi Jon,
>=20
> On 20 November 2015 at 07:11, Jon Hunter <jonathanh@nvidia.com> wrote:
> > The _clk_disable_pll() function will attempt to place a PLL into bypass
> > if the TEGRA_PLL_BYPASS is specified for the PLL and then disable the P=
LL
> > by clearing the enable bit. To place the PLL into bypass, the bypass bit
> > needs to be set and not cleared. Fix this by setting the bypass bit and
> > not clearing it.
> >
> > Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>=20
> The kernelci.org bot recently detected a jetson-tk1 boot failure[1][2]
> in the tegra tree. This boot failure has only been observed when
> booting with a multi_v7_defconfig kernel variant. The bot bisected[3]
> this boot failure to this commit, and I confirmed reverting it on top
> of the tegra for-next branch resolves the issue. The ramdisk[4] used
> for booting is loaded with the modules from the build. It appears to
> me that as the modules are being loaded in userspace by eudev the
> jetson-tk1 locks up. I've sifted through the console logs a bit, and
> found this splat to be most interesting[5].  Can you confirm this
> issue on your end?

Just to close the loop on this: we've discussed this on IRC and came to
the conclusion that not using the bypass mode is safer (switching into
and out of bypass can glitch). I've dropped this patch for now and Jon
will be looking into a second revision of the patch which, in addition
to fixing bypass (the fix is legit, it just happens to break because of
the glitch, most likely), will also remove the BYPASS flag setting so
that bypass will not be used.

Thierry

--J/dobhs11T7y2rNN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWVc+EAAoJEN0jrNd/PrOhkWUP/AmnuVSCyL5xK0fb5lqCYVAb
/iG/OpI1hGBhzHQFvFTSP/7cL/fmkWfJ5Huq/PYlVviO8NCx7E0S1MbhYGV+asbq
XJ5zDSf1f3cYVN58wqtx7MqPT+bxAbTxr4kbqvgHzSK8XVXIRgS7E7qu6YZHylbj
TPSKrny40KeYRCg4f6lZHO0LrekC5dq2lzbL7gleWt3cs7FYdKH9m75Ph38ajbgW
SpXFhqETrvoym4zaNdOMdHDwa8HFDDMtxaTLWSVwbTYguhDRWrDwiR19RRZwjhn/
K0HlEGD+2sf6Ve8UN1EK+M52GKwPLeeFF5n+vsOWTtGA7gw29mIFXDyi8W/8tmXy
ULwD7S/rn4wizHqwfEPzTmiAPBlUf38hIL5b2QXlkLxfbrYnasFkcpOSJQ5kGZOy
Do0nlHB+NdtvDoYkWMw1c9c5bEt4XyOX/5QLhWW7WecD+kpUv5OhoDsDR+f/aHZU
/ppFDVkxXoZePGREGx8rJtktBX6oU/x4ABipjdpFhITPJOGLLnI3rXhRgoxFnq6Y
o2+Hx0vxVAh9AidZZEohd3lPqV3ubqhL2wk4dyXCnN0UbUmkR0/3rGkT9peHOooN
ylD7RMLQcCX68LojOW7MHqIqjT/9bum1JJkXv4V/E8KNRpo/NqX4FaTXIbz6tB2L
aYtVCuaujLi7cA56gsjL
=iJcY
-----END PGP SIGNATURE-----

--J/dobhs11T7y2rNN--
