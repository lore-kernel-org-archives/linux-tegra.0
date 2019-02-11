From: Thierry Reding <treding@nvidia.com>
Subject: Re: [REGRESSION] tegra124: nyan-big: LPAE not working
Date: Mon, 11 Feb 2019 11:48:26 +0100
Message-ID: <20190211104826.GA4927@ulmo>
References: <20190211093829.GA3725@ulmo>
 <20190211100437.Horde.N5S1UaNJsgMKD0ev6Zb_ckb@_>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3153027946708333471=="
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <20190211100437.Horde.N5S1UaNJsgMKD0ev6Zb_ckb@_>
List-Unsubscribe: <https://lists.denx.de/options/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot/>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <https://lists.denx.de/listinfo/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=subscribe>
Errors-To: u-boot-bounces@lists.denx.de
Sender: "U-Boot" <u-boot-bounces@lists.denx.de>
To: Tristan Bastian <tristan-c.bastian@gmx.de>
Cc: gnurou@gmail.com, swarren@nvidia.com, jonathanh@nvidia.com, u-boot@lists.denx.de, Tom Warren <twarren@nvidia.com>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

--===============3153027946708333471==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Q68bSM7Ycu6FN28Q"
Content-Disposition: inline

--Q68bSM7Ycu6FN28Q
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 11, 2019 at 10:04:37AM +0000, Tristan Bastian wrote:
>=20
>=20
>=20
> Thierry Reding =E2=80=93 Mon, 11. February 2019 10:38
> > On Mon, Feb 11, 2019 at 09:20:33AM +0000, Tristan Bastian wrote:
> > >=20
> > > Thierry Reding =E2=80=93 Mon, 11. February 2019 9:52
> > > > On Sun, Feb 10, 2019 at 08:53:11PM +0100, Tristan Bastian wrote:
> > > > > Thierry, do you have any news on this?
> > > > >=20
> > > > > I don't think, that google is going to push an updated version of
> > coreboot
> > > > > to each nyan-big device..
> > > > > So reverting this patch at least for the nyan devices would be th=
e best
> > I
> > > > > think..
> > > >=20
> > > > Yes, I agree. I had a brief chat with Rob Herring about this and he=
 too
> > > > agrees that we should revert it for now. I'll make it a manual reve=
rt
> > > > and add a comment to the device tree node that will hopefully avoid=
 any
> > > > future janitorial "cleanups" of this sort.
> > >=20
> > > great news! :)
> > >=20
> > > > > BTW: I'm now running u-boot natively and it seems like u-boot alw=
ays has
> > a
> > > > > problem with the memory..
> > > > > If u-boot is used chainloaded to coreboot it is only getting 2GB =
of
> > memory
> > > > > and running u-boot natively also just gives me 2GB..
> > > > > I've tested that with a kernel with "ARM: tegra: Fix unit_address=
_vs_reg
> > DTC
> > > > > warnings for /memory" reverted and also on a kernel, before this =
patch
> > was
> > > > > applied..
> > > >=20
> > > > It's possible that U-Boot doesn't support LPAE and therefore may no=
t be
> > > > able to use more than the 2 GiB of memory.
> > >=20
> > > So I at least enabled LPAE in u-boot with "CONFIG_ARMV7_LPAE=3Dy" and
> > > this was for some reason also needed to get some output on the
> > > display..
> > > I'm not sure why LPAE needs to activated in u-boot for display output
> > > on the nyan-big..
> > > Without LPAE enabled u-boot was still working, and booted linux, but
> > > u-boot didn't display anything on screen, linux then did..
> >=20
> > Yeah, that's surprising. Perhaps without LPAE U-Boot thinks there's not
> > enough memory for the framebuffer? There should be plenty, so maybe
> > there is something else going on here.
> >=20
> > > > However, U-Boot should be
> > > > able to tell the kernel exactly how much memory the system has and =
pass
> > > > that on via device tree. That still does work, right?
> > >=20
> > > It seems like this is not working..
> > > And this seems to be the case with both, u-boot chainloaded and
> > > running u-boot natively..
> > >=20
> > > I've used these scripts for flashing:
> > > github.com/NVIDIA/tegra-uboot-flasher-scripts
> > > And used the norrin device since it seems like it is the nyan-big dev
> > > board?
> > > But going with the norrin device config should not be the issue here
> > > since the problem also exists when chainloading u-boot, right?
> >=20
> > It could be a problem. The memory bank configuration is stored in what's
> > called a BCT along with a bunch of other parameters that define what the
> > memory controller needs to access the given memory chips. So if you've
> > flashed a BCT that's for a board with only 2 GiB of memory you would end
> > up with a system that can't address any more than that. It's somewhat
> > surprising that memory accesses work at all with a BCT that's for
> > different memory chips, but sometimes you can get lucky.
> >=20
> > You may want to try reflashing with the right BCT. The simplest would
> > probably be to duplicate the cbootimage configuration for Norrin and
> > substitute the relevant bits by what you have from the Chromebook flash
> > utilities. Looks like the BCT in really the only thing you can replace
> > there. Make sure to replace it with the one that matches your Chromebook
> > and it should give you the right memory bank configuration.
>=20
> Is there a way to check if the correct bct for my 4GB model was used?
> What I tried was to edit the existing bct config file of norrin from here:
> https://github.com/NVIDIA/cbootimage-configs/blob/master/tegra124/nvidia/=
norrin/PM370_Hynix_2GB_H5TC4G63AFR_PBA_924MHz_01212014.bct.cfg
> by replacing all entries for each memory bank with the entries from here:
> https://github.com/coreboot/coreboot/blob/master/src/mainboard/google/nya=
n_big/bct/sdram-hynix-4GB-792.inc
>=20
> I also added the SDRAM[0], SDRAM[1], SDRAM[2], SDRAM[3] each time in fron=
t of each line..
> This also booted for me, but also just leaves me with only 2Gb of my 4GB..
>=20
> And since this problem also occurs, when chainloading u-boot, this must b=
e a problem with u-boot, I think..

Not necessarily. U-Boot reads the memory size from EMC registers and
those EMC registers are programmed based on the contents of the BCT. So
if the BCT is wrong, then it's going to be wrong irrespective of what
bootloader you use.

That said, I does indeed look as if U-Boot only supports 2 GiB of memory
on 32-bit Tegra. arch/arm/mach-tegra/board.c contains the relevant code.
If you look at dram_init() it uses query_sdram_size() to get the size of
RAM. That will allow to convey up to 4 GiB of RAM, but then the code in
board2.c (see dram_init_banksize()) only uses a single bank on 32-bit
Tegra (CONFIG_PHYS_64BIT is only set for 64-bit Tegra).

According to the comments for dram_init_bank_size() we can't store the
second bank because the .start field is 32 bits wide and therefore can't
store the 0x100000000 start address for the bank.

It sounds to me like ARMV7_LPAE should perhaps select PHYS_64BIT to make
sure all the appropriate variables can store addresses beyond the 32-bit
boundary. It's one thing to not support > 2 GiB of memory in U-Boot, but
it's an entirely different story if we can't even pass > GiB of memory
to the kernel if they exist.

Stephen, do you remember if there was anything preventing us from going
64-bit for phys_addr_t and phys_size_t on LPAE enabled systems?

Cc Tom for visibility and U-Boot since this is a U-Boot bug.

Thierry

> Tristan
>=20
> > > Simon Glass used his servo board to enter the tegrarcm mode:
> > > patchwork.ozlabs.org/patch/1019003/
> > >=20
> > > I had to erase the internal SPI flash in order to boot into the
> > > tegrarcm mode..=20
> > > Do you have some instructions or internal documentation to tell me, if
> > > some of the unpopulated buttons on the nyan-big mainboard can be used
> > > to enter the tegrarcm state?
> >=20
> > You should be able to boot into recovery mode with the "enterrcm"
> > command in U-Boot. I'm not aware of any buttons on the mainboard that
> > can be used for this, unfortunately.
> >=20
> > Thierry

--Q68bSM7Ycu6FN28Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxhUvcACgkQ3SOs138+
s6H1qxAAkTj1JAsGWFpsuQLEx1XowxalGEuCObxOXAwrFlZEh8dzHLnOIJoluOCR
34stjXNeWLJEKiFjiLw8eNGPVAPc+siai5lC4zwl0FiyJPe6UbQ1uydt9YlQPPqy
eWSXHBwucOKcTsNIF2OD/oRJubXQ8fYizaXLql9/wC956qA9nGKiChfSwz4GCPOL
7SHTynu/zfeALA8nxUyD/vubTAoBedBYAw//UUkE433SsQhzdO/NHqOnPffuIqt1
8hOQAuV5ZVcSxKdRJmg+3lByJTUbfedvoJCXcG9eMcvfyNglbmBhzjq/PqX+dLbF
zFrgGzjz8Po2Z5dcDniuTJk4kVI9yhUX2SBeKvaqKsJj7exuUXBxm1PDTb5IlhaP
jD1hO1Gkry/lLKVaGnBtuRqvP9lLkwb5IU0ge6COK90i25VfCM8iK62wWUbBbPNL
xNmWbhudBLINJ4mDF1KrSiRVAlznSAFVKwQsHMtgDCfwxenfE0tAmM4gsd/HYg/W
0Lq+pk684IBZr/bvgHEq+eQQ2sLQ3gF/hEFMZo2R+WpCyrLsNjTU9QRAHn1nmjeH
zbrUH9fxE9Y8jq92ASqYWlcLc0WjM/Las0STq+LyQDZ+0Yhuyef6tr9q6F8rbwiR
2CsfY23iCyKSX0LOy77+cHe6V6JJFwddVCqZvr7hbxcZpboVYng=
=0e+Q
-----END PGP SIGNATURE-----

--Q68bSM7Ycu6FN28Q--

--===============3153027946708333471==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVS1Cb290IG1h
aWxpbmcgbGlzdApVLUJvb3RAbGlzdHMuZGVueC5kZQpodHRwczovL2xpc3RzLmRlbnguZGUvbGlz
dGluZm8vdS1ib290Cg==

--===============3153027946708333471==--
