From: Stephen Warren <swarren@nvidia.com>
Subject: RE: [PATCH 1/4] pinctrl: add a driver for NVIDIA Tegra
Date: Tue, 24 Jan 2012 15:36:06 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF178CB81F1A@HQMAIL01.nvidia.com>
References: <1327083746-31430-1-git-send-email-swarren@nvidia.com>
	<CACRpkdZvakueQGYX0wyTFWmpC6wiixj2g1PTuKM4CgEzqJbmig@mail.gmail.com>
	<74CDBE0F657A3D45AFBB94109FB122FF178CB81F06@HQMAIL01.nvidia.com>
 <CACRpkdb5eu+5k98XKkZXA0m0FHEP4XjVGwD9F=Ezm5gVP5WrQQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdb5eu+5k98XKkZXA0m0FHEP4XjVGwD9F=Ezm5gVP5WrQQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Olof Johansson <olof@lixom.net>, Colin Cross <ccross@android.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

Linus Walleij wrote at Tuesday, January 24, 2012 4:28 PM:
> On Wed, Jan 25, 2012 at 12:09 AM, Stephen Warren <swarren@nvidia.com>=
 wrote:
> > [Me]
> >> Why are all of these things (reg bank bit ets) signed?
> >
> > The basic issue is that all of these features are optional for any
> > given pin group. I used -1 to indicate an unsupported feature.
>=20
> Ahyeah. Makes sense. Well do it any way that makes sense
> to you. Plus note in the kerneldoc that this is the reason these
> are signed.
>=20
> >> Also, things named =A0*_bit are a bit (no pun intended) binary,
> >> are they containing a single bit? In that case say
> >
> > They're the bit number/shift within a register. Range 0..31
>=20
> Can that thing really be negative then?
> Or is it really: u8 foo_bit:5 ?

Only reg needs to be signed/negative; the rest I just did for consisten=
cy
in the struct definition; I think an old version of the code wrote -1 t=
o
foo_reg, foo_bank and foo_bit too.

> >> u8 foo:1
> >>
> >> To mark that it's only one bit wide, or u8 foo:4 for four bits
> >> etc.
> >
> > I guess I could be explicit about the max range for each value. It =
might
> > save up to about 8 bytes per pin group, perhaps less based on how w=
ell
> > things pack to u32 boundaries.
>=20
> Nah I think you would have to pack the struct with #pragmas for that
> and I don't even know if it'd pack below byte limits. Probably not.

u32 x:4;
u32 y:5;
u32 z:4;

should pack them all together, and adjacent u32s in the struct would be
packed into the struct without padding.

=2E..
> >> func_safe doesn't look like an int either when I look at
> >> the code. It's something else, u8?
> >
> > It's a "enum tegra_mux", which IIRC is technically an int, but unsi=
gned
> > is more consistent with the rest of pinctrl.
>=20
> Hm "enum tegra_mux foo" should work fine too then,
> what am I missing here...

Good point. It's because each chip has a different set definition of
enum tegra_mux, and pinctrl-tegra.h is shared across both chips.

--=20
nvpublic
