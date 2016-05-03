From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] usb: host: ehci-tegra: Avoid getting the same reset twice
Date: Tue, 3 May 2016 20:20:20 +0200
Message-ID: <20160503182020.GA11457@ulmo.ba.sec>
References: <1462298755-20857-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="C7zPtVaVf+AK4Oqc"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1462298755-20857-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 03, 2016 at 08:05:55PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
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
>=20
> Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/usb/host/ehci-tegra.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)

Looks like I sent this too quickly. It doesn't seem to get rid of the
warning in all cases, so I'll need to investigate further.

Sorry for the noise.

Thierry

--C7zPtVaVf+AK4Oqc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXKOvhAAoJEN0jrNd/PrOhwpMP/0n+KeZ+IeOIcVj/ZXLYQNhd
tl7brbh9gisWEDOHf2EV/BrwQv7wEe0b2XDVqwEMw3XGPuIQdaeOJ1mZnnXRtBqG
fW9z6dzXYUDAJNYtyGQsViW4hOr2M0LMLISYfYEYvvgBTLxaaottqw3tz/ejllEA
IrjYo6y+PqHyfxRAKSel4ydKWCEjjUf73c2Pa80wMNubvtEstUNZkkdAM8f+Zmxj
LZYM6CADWjFhTl1lLREpW3ePCNV/Ehnk6HyFDjuZV/2+zlDap/Qta8kIiyAxSRyy
Lm4Y4ghmEIHY5Kkr8/boE5eK+p7JzTRj2EFghujAxOeVodT3pNEhUwkEv0qBc7c6
pvtjP90umujYYJZCXVmxP9dLGiaT4JL6Sobb1CNfe3oT+6WERWKeAPWgou3SGmTg
eiZZZweq4hDwCfVl0Q1PD6E1DxLrx+YFKUpz+XdqRPepkEUElPsPMA8DqRN9aH0z
QADWSc49OSJ8x6B75THDfvlkqOfn421OTPdbkwiRHQ/rCoT/bcVCmU73x1/dxiY5
ShN+VgsSu2VTDkpEwpSvAdpyAUcIMAb6IfBSZgSMovmxwe7HDed/nHDINM7wKenj
Ocf54SexWsqgiN8zBw5zi+DxIzf1/ZWcFk23xOLhGdDPOz9gfIftOtFc+C7lsDI5
0xvmbUW+s9GbJZ5f6WkH
=dZN/
-----END PGP SIGNATURE-----

--C7zPtVaVf+AK4Oqc--
