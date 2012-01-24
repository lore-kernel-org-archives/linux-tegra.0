From: Stephen Warren <swarren@nvidia.com>
Subject: RE: [PATCH 1/4] pinctrl: add a driver for NVIDIA Tegra
Date: Tue, 24 Jan 2012 15:09:19 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF178CB81F06@HQMAIL01.nvidia.com>
References: <1327083746-31430-1-git-send-email-swarren@nvidia.com>
 <CACRpkdZvakueQGYX0wyTFWmpC6wiixj2g1PTuKM4CgEzqJbmig@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZvakueQGYX0wyTFWmpC6wiixj2g1PTuKM4CgEzqJbmig@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Olof Johansson <olof@lixom.net>, Colin Cross <ccross@android.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

Linus Walleij wrote at Tuesday, January 24, 2012 3:34 PM:
> On Fri, Jan 20, 2012 at 7:22 PM, Stephen Warren <swarren@nvidia.com> =
wrote:
>=20
> > This adds a driver for the Tegra pinmux, and required parameterizat=
ion
> > data for Tegra20 and Tegra30.
>=20
> Very appetizing - the only scary thing is the size. Some
> comments, if noone else yells after these are addressed I might
> just merge it (or I find more things to complain about...)
>=20
> > +static int tegra_pinconf_reg(struct tegra_pmx *pmx,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0const stru=
ct tegra_pingroup *g,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0enum tegra=
_pinconf_param param,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0s8 *bank, =
s16 *reg, s8 *bit, s8 *width)
>=20
> Why are the four last parameters signed?
>=20
> Or, rather as it seems to be a consequence of this:

Yes, exactly...

> > +struct tegra_pingroup {
> > + =A0 =A0 =A0 const char *name;
> > + =A0 =A0 =A0 const unsigned *pins;
> > + =A0 =A0 =A0 unsigned npins;
> > + =A0 =A0 =A0 int funcs[4];
> > + =A0 =A0 =A0 int func_safe;
> > + =A0 =A0 =A0 s16 mux_reg; =A0 =A0 =A0 =A0 =A0 =A0/* Mux register o=
ffset */
> > + =A0 =A0 =A0 s8 mux_bank; =A0 =A0 =A0 =A0 =A0 =A0/* Mux register b=
ank */
> > + =A0 =A0 =A0 s8 mux_bit; =A0 =A0 =A0 =A0 =A0 =A0 /* Mux register b=
it */
> > + =A0 =A0 =A0 s16 pupd_reg; =A0 =A0 =A0 =A0 =A0 /* Pull-up/down reg=
ister offset */
> > + =A0 =A0 =A0 s8 pupd_bank; =A0 =A0 =A0 =A0 =A0 /* Pull-up/down reg=
ister bank */
> > + =A0 =A0 =A0 s8 pupd_bit; =A0 =A0 =A0 =A0 =A0 =A0/* Pull-up/down r=
egister bit */
> > + =A0 =A0 =A0 s16 tri_reg; =A0 =A0 =A0 =A0 =A0 =A0/* Tri-state regi=
ster offset */
> > + =A0 =A0 =A0 s8 tri_bank; =A0 =A0 =A0 =A0 =A0 =A0/* Tri-state regi=
ster bank */
> > + =A0 =A0 =A0 s8 tri_bit; =A0 =A0 =A0 =A0 =A0 =A0 /* Tri-state regi=
ster bit */
> > + =A0 =A0 =A0 s16 einput_reg; =A0 =A0 =A0 =A0 /* Enable-input regis=
ter offset */
> > + =A0 =A0 =A0 s8 einput_bank; =A0 =A0 =A0 =A0 /* Enable-input regis=
ter bank */
> > + =A0 =A0 =A0 s8 einput_bit; =A0 =A0 =A0 =A0 =A0/* Enable-input reg=
ister bit */
> > + =A0 =A0 =A0 s16 odrain_reg; =A0 =A0 =A0 =A0 /* Open-drain registe=
r offset */
> > + =A0 =A0 =A0 s8 odrain_bank; =A0 =A0 =A0 =A0 /* Open-drain registe=
r bank */
> > + =A0 =A0 =A0 s8 odrain_bit; =A0 =A0 =A0 =A0 =A0/* Open-drain regis=
ter bit */
> > + =A0 =A0 =A0 s16 lock_reg; =A0 =A0 =A0 =A0 =A0 /* Lock register of=
fset */
> > + =A0 =A0 =A0 s8 lock_bank; =A0 =A0 =A0 =A0 =A0 /* Lock register ba=
nk */
> > + =A0 =A0 =A0 s8 lock_bit; =A0 =A0 =A0 =A0 =A0 =A0/* Lock register =
bit */
> > + =A0 =A0 =A0 s16 ioreset_reg; =A0 =A0 =A0 =A0/* IO reset register =
offset */
> > + =A0 =A0 =A0 s8 ioreset_bank; =A0 =A0 =A0 =A0/* IO reset register =
bank */
> > + =A0 =A0 =A0 s8 ioreset_bit; =A0 =A0 =A0 =A0 /* IO reset register =
bit */
> > + =A0 =A0 =A0 s16 drv_reg; =A0 =A0 =A0 =A0 =A0 =A0/* Drive fields r=
egister offset */
> > + =A0 =A0 =A0 s8 drv_bank; =A0 =A0 =A0 =A0 =A0 =A0/* Drive fields r=
egister bank */
> > + =A0 =A0 =A0 s8 hsm_bit; =A0 =A0 =A0 =A0 =A0 =A0 /* High Speed Mod=
e register bit */
> > + =A0 =A0 =A0 s8 schmitt_bit; =A0 =A0 =A0 =A0 /* Scmitt register bi=
t */
> > + =A0 =A0 =A0 s8 lpmd_bit; =A0 =A0 =A0 =A0 =A0 =A0/* Low Power Mode=
 register bit */
> > + =A0 =A0 =A0 s8 drvdn_bit; =A0 =A0 =A0 =A0 =A0 /* Drive Down regis=
ter bit */
> > + =A0 =A0 =A0 s8 drvdn_width; =A0 =A0 =A0 =A0 /* Drive Down field w=
idth */
> > + =A0 =A0 =A0 s8 drvup_bit; =A0 =A0 =A0 =A0 =A0 /* Drive Up registe=
r bit */
> > + =A0 =A0 =A0 s8 drvup_width; =A0 =A0 =A0 =A0 /* Drive Up field wid=
th */
> > + =A0 =A0 =A0 s8 slwr_bit; =A0 =A0 =A0 =A0 =A0 =A0/* Slew Rising re=
gister bit */
> > + =A0 =A0 =A0 s8 slwr_width; =A0 =A0 =A0 =A0 =A0/* Slew Rising fiel=
d width */
> > + =A0 =A0 =A0 s8 slwf_bit; =A0 =A0 =A0 =A0 =A0 =A0/* Slew Falling r=
egister bit */
> > + =A0 =A0 =A0 s8 slwf_width; =A0 =A0 =A0 =A0 =A0/* Slew Falling fie=
ld width */
> > +};
>=20
> Why are all of these things (reg bank bit ets) signed?

The basic issue is that all of these features are optional for any
given pin group. I used -1 to indicate an unsupported feature. More
details at the end of the email.

I guess an alternative is to add a field "u32 foo_supported:1" for each
feature, and change everything else to u32 too.

> Especially since a lot of them appear to translate into
> readl() writel() calls in the end, and these are unsigned.
>=20
> Also, things named  *_bit are a bit (no pun intended) binary,
> are they containing a single bit? In that case say

They're the bit number/shift within a register. Range 0..31

> u8 foo:1
>=20
> To mark that it's only one bit wide, or u8 foo:4 for four bits
> etc.

I guess I could be explicit about the max range for each value. It migh=
t
save up to about 8 bytes per pin group, perhaps less based on how well
things pack to u32 boundaries.

> func_safe doesn't look like an int either when I look at
> the code. It's something else, u8?

It's a "enum tegra_mux", which IIRC is technically an int, but unsigned
is more consistent with the rest of pinctrl.

> Second, please move out the inline comment to kerneldoc
> above the struct.

Sure.


More details on pin group features:

Tegra's pin controller supports many features for pins/groups:
* Mux function selection
* Pull-up/down
* Tri-state
* Drive strength
* ...

On Tegra20, each of these features is configured at a pin group level;
there is a single register field that affects multiple pins at once.
The groups for each feature may not exactly intersect; one register
field may set the mux function for pins A, B, C, whereas a different
register field may set the drive strength for pins C, X, Y. Some pins
may not have a mux function selector. Others may not support enabling
high speed mode or Schmitt trigger.

In order to represent this sanely, I've define a pin group for each
unique set of pins affected by some register field(s). Obviously, each
pin group supports a subset of all possible configuration parameters,
and hence the need to indicate "there is no register/bit" for this
parameter on this pin group.

Tegra30 is somewhat simpler; each pin can be mux'd separately, and
some additional parameters may be set per pin. Some of the parameters
still aren't supported on all pins though. Equally, some advanced
drive-strength-related parameters are still configured at a pin-group
level not a per-pin level, and again not all groups support every
parameter.

--=20
nvpublic
