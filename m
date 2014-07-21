From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: tegra: Convert PMC to a driver
Date: Mon, 21 Jul 2014 23:35:09 +0200
Message-ID: <20140721213508.GC12076@mithrandir>
References: <1404742610-4951-1-git-send-email-thierry.reding@gmail.com>
 <1404742610-4951-3-git-send-email-thierry.reding@gmail.com>
 <53CD8161.2030204@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="raC6veAxrt5nqIoY"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53CD8161.2030204-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--raC6veAxrt5nqIoY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 21, 2014 at 03:08:49PM -0600, Stephen Warren wrote:
> On 07/07/2014 08:16 AM, Thierry Reding wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > This commit converts the PMC support code to a platform driver. Because
> > the boot process needs to call into this driver very early, set up a
> > minimalistic environment via an early initcall.
>=20
> Can we do this without using standalone initcalls? There's no way to
> ensure ordering with initcalls, which seems like it'll be problematic
> once we start converting more stuff.

This driver uses an early_initcall to setup the basic environment
required for SMP. That basic environment will stay intact until the
proper driver takes over the resources sometime at device_initcall
time.

Obviously this type of ordering should only be used for this type of
low-level code that has no other dependencies.

> Instead, can we have some "driver" that binds to the top-level DT node,
> does all the low-/chip-level init, then continues processing the DT? I
> suspect that Pawel's "platform: Make platform_bus device a platform
> device" will help out here. He just posted it today:
>=20
> http://www.spinics.net/lists/arm-kernel/msg349328.html

I'm not entirely convinced that this is really necessary. Ideally the
early code should be fairly limited. Given that the ARM64 maintainers
prefer to have SMP handled using a firmware interface this whole
discussion may become moot anyway.

Handling this in firmware is going to create a whole new set of
problems, though, I guess. For instance on Tegra we need to program the
PMC to bring up CPUs. The operations that toggle the power partition
state aren't atomic, so there's always the possibility that firmware
will try to power-up/down a CPU while some other driver is trying to
power-up/down some other partition. How are firmware and kernel supposed
to serialize register accesses?

> > While at it, also move the driver out to drivers/power so that it can be
> > shared with 64-bit SoCs.
>=20
> >  arch/arm/mach-tegra/pmc.c       | 402 -----------------
> >  arch/arm/mach-tegra/powergate.c | 503 ---------------------
>=20
> >  drivers/power/tegra-pmc.c       | 948 ++++++++++++++++++++++++++++++++=
++++++++
>=20
> It's a bit hard to review this patch because two files at the source
> were merged into one at the destination, and so "git diff -M" couldn't
> detect/represent any changes that happened during the move and highlight
> just those. I assume this just cut/pastes the whole of pmc.c and
> powergate.c into the new tegra-pmc.c without actually changing anything
> much?

Yes, it's simply a cut-and-paste job. Well, there's a slight difference
in what functions are being built. The old code didn't conditionally
build the CONFIG_PM_SLEEP and CONFIG_SMP functions in the driver (though
the prototypes were conditionalized). The new driver restores
consistency. That was to fix randconfig build errors that Arnd reported.

> I wonder if putting the file into drivers/power/ directly makes sense?
> We have "class"-specific sub-directories drivers/power/supply (after
> this series) and drives/power/{avs,reset}/ before. Should we have a
> drivers/power/domain or drivers/power/soc/? instead?

Yeah, moving the code into a subdirectory should be fine. It seemed a
little pointless since there was only one, but if drivers/power
maintainers ever agree to this restructuring I'll happily create another
subdirectory for power domain or SoC power drivers.

> That said, drivers/soc/tegra still feels fine to me for this code...

I agree. At this point in time it's unlikely that we'll be able to come
up with a generic framework to accomodate this driver. Until that time I
don't think it makes sense to move this anywhere else.

But if people insist there shouldn't be a problem to move this out again
since the difficult part of untangling the dependencies is done now, so
it should simply be a matter of doing a git mv and adjusting the Kconfig
and/or Makefile.

Thierry

--raC6veAxrt5nqIoY
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTzYeMAAoJEN0jrNd/PrOhGEUP/RIGPFH169UMEd8Ep7FXn6CN
K6istcs5lyYTSc6hLGv+t6bVD6AeD7zvTFAzpyXIYGmo4r5bd/n2AkxuYc2k5AKI
D28KMiwq8VMGJBPy5H7N640Zyu6lr09E8Wu6yhCmP+nD8brz4mrx4rHrS+hDuQiD
enGesKbZp61UTqfTng5q5r5dpTrmfnfwpEgqowTocgTY0HUoV2lSiqhKRtcSLOBI
d84WiqiW1OBaD1DKimum3fgQrMJsNAwpqDRniIaK53m1uZRXuekBvJ7O2sl+5dC/
K/Ia84bcxpzZUho9zAJyXpboibTS4GG45uz8+dAzsAbxPyLsfual648jx4LSBo05
cKUYj9F4cd1Cn8fNsCiWCY9fKYduB/j6kut9015Ei53nLV3k26dgMus0GIZvBOtD
NQPm/yriMuzptbOcoo6+5YMr/Xh/IEyczbLUVU0hrz7Q7mOR/JfRrSgdrarCyJY7
RfuuA9LlRFN7qrKkaoc2JPbzCockoLEsBJ3EEShyfSS6+HDYS+Bcp1BvbpxbbE/L
ye7iKe5y+bovOjBwcigk/WWwGoeCkM9ROsbxxs2uCDL4ncLJLzingVxbTNys3pU+
XIgX7Y0gbtQqJcRKCsnv7pojZY8wWkOmyQssacEopohKDzBkRrDcs6vnrempI1Q8
wyuJjHUghCtsyC14g9r+
=AyYl
-----END PGP SIGNATURE-----

--raC6veAxrt5nqIoY--
