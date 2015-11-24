From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] clk: tegra: Fix bypassing of PLLs
Date: Tue, 24 Nov 2015 16:10:56 +0100
Message-ID: <20151124151056.GA21037@ulmo.nvidia.com>
References: <1448032264-29622-1-git-send-email-jonathanh@nvidia.com>
 <CANMBJr7vYb+kuUBzsC8i4b=b6DRVsbqnf5OrVtj6kVS2RMNgfQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9amGYk9869ThD9tj"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CANMBJr7vYb+kuUBzsC8i4b=b6DRVsbqnf5OrVtj6kVS2RMNgfQ@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Tyler Baker <tyler.baker@linaro.org>
Cc: Jon Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rhyland Klein <rklein@nvidia.com>, Kevin's boot bot <khilman@kernel.org>
List-Id: linux-tegra@vger.kernel.org


--9amGYk9869ThD9tj
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

Let me quote one of your logs for ease of commenting. I've trimmed it
somewhat because it got fragmented in the middle and not everything is
relevant:

[    9.809636] tegra-emc 7001b000.emc: no timing for rate 4294967295
[    9.834995] Unable to handle kernel paging request at virtual address 00=
270300
=2E..
[    9.836808] [] (__irq_svc) from [] (console_unlock+0x3ec/0x47c)
[    9.836854] [] (console_unlock) from [] (vprintk_emit+0x1bf/0x348)
[    9.836905] [] (vprintk_emit) from [] (dev_vprintk_emit+0x9f/0x124)
[    9.836951] [] (dev_vprintk_emit) from [] (dev_printk_emit+0x15/0x20)
[    9.836995] [] (dev_printk_emit) from [] (__dev_printk+0x29/0x48)
[    9.837036] [] (__dev_printk) from [] (dev_err+0x25/0x30)
[    9.837083] [] (dev_err) from [] (tegra_emc_find_timing+0x3d/0x4c)
[    9.837125] [] (tegra_emc_find_timing) from [] (tegra_emc_complete_timin=
g_change+0x9/0x130)
[    9.837162] [] (tegra_emc_complete_timing_change) from [] (emc_set_timin=
g+0xc3/0x158)
[    9.837190] [] (emc_set_timing) from [] (emc_set_rate+0xdb/0x150)
[    9.837221] [] (emc_set_rate) from [] (gpmc_calc_timings+0xb5/0x51c)
[    9.837261] [] (gpmc_calc_timings) from [] (clk_set_rate+0x15/0x20)
[    9.837307] [] (clk_set_rate) from [] (tegra_devfreq_target+0x40/0x58 [t=
egra_devfreq])
[    9.837350] [] (tegra_devfreq_target [tegra_devfreq]) from [] (update_de=
vfreq+0x4b/0x9c)
[    9.837386] [] (update_devfreq) from [] (actmon_thread_isr+0x12/0x20 [te=
gra_devfreq])
[    9.837424] [] (actmon_thread_isr [tegra_devfreq]) from [] (irq_thread_d=
tor+0x77/0x78)
[    9.837456] [] (irq_thread_dtor) from [] (irq_thread+0xcf/0x16c)
[    9.837496] [] (irq_thread) from [] (kthread+0x93/0xac)
[    9.837541] [] (kthread) from [] (ret_from_fork+0x11/0x20)
[    9.837563] Code: bad PC value
[    9.837582] ---[ end trace 586d537b3212336d ]---

The part that's really weird in the above is the call to
gpmc_calc_timings(), because that function is from OMAP:

	$ git grep -n gpmc_calc_timings
	arch/arm/mach-omap2/gpmc-onenand.c:89:  gpmc_calc_timings(t, &onenand_asyn=
c, &dev_t);
	arch/arm/mach-omap2/gpmc-onenand.c:266: gpmc_calc_timings(t, &onenand_sync=
, &dev_t);
	arch/arm/mach-omap2/usb-tusb6010.c:72:  gpmc_calc_timings(&t, &tusb_async,=
 &dev_t);
	arch/arm/mach-omap2/usb-tusb6010.c:99:  gpmc_calc_timings(&t, &tusb_sync, =
&dev_t);
	drivers/memory/omap-gpmc.c:1539:int gpmc_calc_timings(struct gpmc_timings =
*gpmc_t,
	include/linux/omap-gpmc.h:152:extern int gpmc_calc_timings(struct gpmc_tim=
ings *gpmc_t,

So I'm not at all surprised that this breaks. While that seems unrelated
it's quite possible that there's some memory corruption going on which
would also explain the hang. It doesn't even have to be memory
corruption, but we've seen similar problems in the past where some
platform was unconditionally registering drivers that it shouldn't have
been registering and which then executed on a device where the device
wasn't there. That could be the case here as well.

Unfortunately I can't come up with any good explanation of why
gpmc_calc_timings() shows up in the call trace above. It's only ever
called as a result of USB or NAND operation, so why it would be called
=66rom clk_set_rate() is beyond me.

Thierry

--9amGYk9869ThD9tj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWVH38AAoJEN0jrNd/PrOhhy0P/1Ri8bRZCPGFLwxhtUKGfhho
K4GE2HuPmjXHkl1XZRjTU9KYmOjJqyaWL76ouMtn49jXhOJL12ZjqcIWG2DChfpy
d30qAPtyNoHB/2B2kNTpbxYWMo8wReifBAIAm0GDn2REzHS7XGS1mrxkH17p3IeH
EA5MvKH9nkPX9Z2rHzPmAgBnW9Xlw8iRcGlwrirggWtZq3KzTjeNOSHrS5ewa5CB
nERHmlEHJYmxYhJ2PiCwJWB9m/G8RxegurRCRktrz0/poZEGTj5TnnobHGZoHPm8
0qEe0bBtIDmcy+vFiyUuRKPu/p7l0faypBpDgta423aYwPp9lypWncE7pErmPLAH
aQGdS71uta9JmL2ZO4589/47I2YEDcVC+R3fVgZZLljUZUYvFcfApS3+lDUzLGuI
VUq2Q7IlOPIDtLYB5RN6xkbpbLuek20FTL23X/uA4E9moagFCdmMFokVWDgG4wy5
kJf/Vn63nGM8RHPysuV5dUJK+4I3xYtLS8gRk+SMiNjD78PzlS5jcDLpYqrhn/sr
ZpkM6i9oU+GOqlBmCbAM0p+CkAn+5tMtXIQ+A8g88vhN5P6ipTG0EZXaPUQNV2zQ
yPAbo/wVuoF62l+Aa/cfp4nWPUt6typD+V8/rDeEUg/Ht8i8FV8ixOGku2MKxMy6
7n1WRSg/JcQbh20bhAQo
=AGtk
-----END PGP SIGNATURE-----

--9amGYk9869ThD9tj--
