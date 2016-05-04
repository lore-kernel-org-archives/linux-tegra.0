From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 2/2] usb: host: ehci-tegra: Avoid getting the same
 reset twice
Date: Wed, 4 May 2016 16:30:59 +0200
Message-ID: <20160504143059.GB30512@ulmo.ba.sec>
References: <1462371722-30435-1-git-send-email-thierry.reding@gmail.com>
 <1462371722-30435-2-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="V0207lvV8h4k8FAm"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1462371722-30435-2-git-send-email-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, Hans de Goede <hdegoede@redhat.com>
List-Id: linux-tegra@vger.kernel.org


--V0207lvV8h4k8FAm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 04, 2016 at 04:22:02PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> Starting with commit 0b52297f2288 ("reset: Add support for shared reset
> controls") there is a reference count for reset control assertions. The
> goal is to allow resets to be shared by multiple devices and an assert
> will take effect only when all instances have asserted the reset.
>=20
> In order to preserve backwards-compatibility, all reset controls become
> exclusive by default. This is to ensure that reset_control_assert() can
> immediately assert in hardware.
>=20
> However, this new behaviour triggers the following warning in the EHCI
> driver for Tegra:
>=20
> [    3.365019] ------------[ cut here ]------------
> [    3.369639] WARNING: CPU: 0 PID: 1 at drivers/reset/core.c:187 __of_re=
set_control_get+0x16c/0x23c
> [    3.382151] Modules linked in:
> [    3.385214] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.6.0-rc6-next-2=
0160503 #140
> [    3.392769] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
> [    3.399046] [<c010fa50>] (unwind_backtrace) from [<c010b120>] (show_st=
ack+0x10/0x14)
> [    3.406787] [<c010b120>] (show_stack) from [<c0347dcc>] (dump_stack+0x=
90/0xa4)
> [    3.414007] [<c0347dcc>] (dump_stack) from [<c011f4fc>] (__warn+0xe8/0=
x100)
> [    3.420964] [<c011f4fc>] (__warn) from [<c011f5c4>] (warn_slowpath_nul=
l+0x20/0x28)
> [    3.428525] [<c011f5c4>] (warn_slowpath_null) from [<c03cc8cc>] (__of_=
reset_control_get+0x16c/0x23c)
> [    3.437648] [<c03cc8cc>] (__of_reset_control_get) from [<c0526858>] (t=
egra_ehci_probe+0x394/0x518)
> [    3.446600] [<c0526858>] (tegra_ehci_probe) from [<c04516d8>] (platfor=
m_drv_probe+0x4c/0xb0)
> [    3.455029] [<c04516d8>] (platform_drv_probe) from [<c044fe78>] (drive=
r_probe_device+0x1ec/0x330)
> [    3.463892] [<c044fe78>] (driver_probe_device) from [<c0450074>] (__dr=
iver_attach+0xb8/0xbc)
> [    3.472320] [<c0450074>] (__driver_attach) from [<c044e1ec>] (bus_for_=
each_dev+0x68/0x9c)
> [    3.480489] [<c044e1ec>] (bus_for_each_dev) from [<c044f338>] (bus_add=
_driver+0x1a0/0x218)
> [    3.488743] [<c044f338>] (bus_add_driver) from [<c0450768>] (driver_re=
gister+0x78/0xf8)
> [    3.496738] [<c0450768>] (driver_register) from [<c010178c>] (do_one_i=
nitcall+0x40/0x170)
> [    3.504909] [<c010178c>] (do_one_initcall) from [<c0c00ddc>] (kernel_i=
nit_freeable+0x158/0x1f8)
> [    3.513600] [<c0c00ddc>] (kernel_init_freeable) from [<c0810784>] (ker=
nel_init+0x8/0x114)
> [    3.521770] [<c0810784>] (kernel_init) from [<c0107778>] (ret_from_for=
k+0x14/0x3c)
> [    3.529361] ---[ end trace 4bda87dbe4ecef8a ]---
>=20
> The reason is that the EHCI implements three ports, each with a separate
> reset line. However the first port's reset also serves as a means to
> reset the UTMI pad for all ports. There is special code in the driver to
> assert and deassert this shared reset at probe time. It needs to do this
> regardless of which port is probed first. Unfortunately this means that
> if the first port is probed first, it will request its own reset line
> and subsequently request the same reset line again (temporarily) to
> perform the reset. This used to work fine before the above-mentioned
> commit, but now triggers the new WARN.
>=20
> Work around this by making sure we reuse the port's reset if it happens
> to be the same as the UTMI pad reset.

After having written the commit message for patch 1/2 I now realize that
the above isn't very accurate. I'll try to reword and send v3. Sorry, it
seems like I need to get more sleep.

Thierry

--V0207lvV8h4k8FAm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXKgejAAoJEN0jrNd/PrOh2N4P/2BAjzwGkXreJacbnhesTh/n
k9qz/iSY9vjqvF4ttk4h6QAh/melrIJa2861r0I1jSYz/tlAeIxdeYKbLG7fPztq
ZAk1h5FVF5IwKT/Rl/aFS7wU8y3rJnZsl/1ulW4bg++gDdYNSVewDmImvnndCDWV
FAHtLKk7NoZ5L9fLtod7GbxLcbMOZAHyjZrS1vQuFwGWnT36BVVpY4JB6XkOy9L2
c+pe/ZxJLFidDUVWIfL/rNw5MapBf7OUfSPsz8REF2RQebAbJkcdpNewZJkG3GBO
UxHVS7ux8rTXhKANGxVxrVMe/MV5vgUjx1szsF5epku/KR1f9L176TP/uZ0rklOD
qhH7vssEtpb3/q+7rYUVECtXqSRGj/kJ0bvcl0yfMDBtp7sqbRsW6R4mCHuAyPO2
FhymZgbJEEJWEMRwVpMhDs5QNThGdNX7z2CwDbiejDi0tVRGxjMmco3+AhFG2pEB
snL9DqZ64T8rKlC4M5ma+wUAyvhPoz09K076YI32B/7LRcGMwUaZwR8l0NK3IJ7X
yPq5E0k8gSAQ86sEeLUuQVveeYPZ3F5FHvsO3TPUyN9JhIUyk3wI/PK4VX0qcX2I
Xd510XG2C9YpGEARPYDqqO/YXSTM4sSZnYgkkNhI0etyqSGkhmFQwcQ/WMQGdfHm
wirMcjk2/uE3BSjmdwmp
=68NK
-----END PGP SIGNATURE-----

--V0207lvV8h4k8FAm--
