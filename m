From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/4] pinctrl: add a driver for NVIDIA Tegra
Date: Tue, 24 Jan 2012 23:33:43 +0100
Message-ID: <CACRpkdZvakueQGYX0wyTFWmpC6wiixj2g1PTuKM4CgEzqJbmig@mail.gmail.com>
References: <1327083746-31430-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1327083746-31430-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Jan 20, 2012 at 7:22 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wr=
ote:

> This adds a driver for the Tegra pinmux, and required parameterizatio=
n
> data for Tegra20 and Tegra30.

Very appetizing - the only scary thing is the size. Some
comments, if noone else yells after these are addressed I might
just merge it (or I find more things to complain about...)

> +static int tegra_pinconf_reg(struct tegra_pmx *pmx,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0const struct=
 tegra_pingroup *g,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0enum tegra_p=
inconf_param param,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0s8 *bank, s1=
6 *reg, s8 *bit, s8 *width)

Why are the four last parameters signed?

Or, rather as it seems to be a consequence of this:

> +struct tegra_pingroup {
> + =A0 =A0 =A0 const char *name;
> + =A0 =A0 =A0 const unsigned *pins;
> + =A0 =A0 =A0 unsigned npins;
> + =A0 =A0 =A0 int funcs[4];
> + =A0 =A0 =A0 int func_safe;
> + =A0 =A0 =A0 s16 mux_reg; =A0 =A0 =A0 =A0 =A0 =A0/* Mux register off=
set */
> + =A0 =A0 =A0 s8 mux_bank; =A0 =A0 =A0 =A0 =A0 =A0/* Mux register ban=
k */
> + =A0 =A0 =A0 s8 mux_bit; =A0 =A0 =A0 =A0 =A0 =A0 /* Mux register bit=
 */
> + =A0 =A0 =A0 s16 pupd_reg; =A0 =A0 =A0 =A0 =A0 /* Pull-up/down regis=
ter offset */
> + =A0 =A0 =A0 s8 pupd_bank; =A0 =A0 =A0 =A0 =A0 /* Pull-up/down regis=
ter bank */
> + =A0 =A0 =A0 s8 pupd_bit; =A0 =A0 =A0 =A0 =A0 =A0/* Pull-up/down reg=
ister bit */
> + =A0 =A0 =A0 s16 tri_reg; =A0 =A0 =A0 =A0 =A0 =A0/* Tri-state regist=
er offset */
> + =A0 =A0 =A0 s8 tri_bank; =A0 =A0 =A0 =A0 =A0 =A0/* Tri-state regist=
er bank */
> + =A0 =A0 =A0 s8 tri_bit; =A0 =A0 =A0 =A0 =A0 =A0 /* Tri-state regist=
er bit */
> + =A0 =A0 =A0 s16 einput_reg; =A0 =A0 =A0 =A0 /* Enable-input registe=
r offset */
> + =A0 =A0 =A0 s8 einput_bank; =A0 =A0 =A0 =A0 /* Enable-input registe=
r bank */
> + =A0 =A0 =A0 s8 einput_bit; =A0 =A0 =A0 =A0 =A0/* Enable-input regis=
ter bit */
> + =A0 =A0 =A0 s16 odrain_reg; =A0 =A0 =A0 =A0 /* Open-drain register =
offset */
> + =A0 =A0 =A0 s8 odrain_bank; =A0 =A0 =A0 =A0 /* Open-drain register =
bank */
> + =A0 =A0 =A0 s8 odrain_bit; =A0 =A0 =A0 =A0 =A0/* Open-drain registe=
r bit */
> + =A0 =A0 =A0 s16 lock_reg; =A0 =A0 =A0 =A0 =A0 /* Lock register offs=
et */
> + =A0 =A0 =A0 s8 lock_bank; =A0 =A0 =A0 =A0 =A0 /* Lock register bank=
 */
> + =A0 =A0 =A0 s8 lock_bit; =A0 =A0 =A0 =A0 =A0 =A0/* Lock register bi=
t */
> + =A0 =A0 =A0 s16 ioreset_reg; =A0 =A0 =A0 =A0/* IO reset register of=
fset */
> + =A0 =A0 =A0 s8 ioreset_bank; =A0 =A0 =A0 =A0/* IO reset register ba=
nk */
> + =A0 =A0 =A0 s8 ioreset_bit; =A0 =A0 =A0 =A0 /* IO reset register bi=
t */
> + =A0 =A0 =A0 s16 drv_reg; =A0 =A0 =A0 =A0 =A0 =A0/* Drive fields reg=
ister offset */
> + =A0 =A0 =A0 s8 drv_bank; =A0 =A0 =A0 =A0 =A0 =A0/* Drive fields reg=
ister bank */
> + =A0 =A0 =A0 s8 hsm_bit; =A0 =A0 =A0 =A0 =A0 =A0 /* High Speed Mode =
register bit */
> + =A0 =A0 =A0 s8 schmitt_bit; =A0 =A0 =A0 =A0 /* Scmitt register bit =
*/
> + =A0 =A0 =A0 s8 lpmd_bit; =A0 =A0 =A0 =A0 =A0 =A0/* Low Power Mode r=
egister bit */
> + =A0 =A0 =A0 s8 drvdn_bit; =A0 =A0 =A0 =A0 =A0 /* Drive Down registe=
r bit */
> + =A0 =A0 =A0 s8 drvdn_width; =A0 =A0 =A0 =A0 /* Drive Down field wid=
th */
> + =A0 =A0 =A0 s8 drvup_bit; =A0 =A0 =A0 =A0 =A0 /* Drive Up register =
bit */
> + =A0 =A0 =A0 s8 drvup_width; =A0 =A0 =A0 =A0 /* Drive Up field width=
 */
> + =A0 =A0 =A0 s8 slwr_bit; =A0 =A0 =A0 =A0 =A0 =A0/* Slew Rising regi=
ster bit */
> + =A0 =A0 =A0 s8 slwr_width; =A0 =A0 =A0 =A0 =A0/* Slew Rising field =
width */
> + =A0 =A0 =A0 s8 slwf_bit; =A0 =A0 =A0 =A0 =A0 =A0/* Slew Falling reg=
ister bit */
> + =A0 =A0 =A0 s8 slwf_width; =A0 =A0 =A0 =A0 =A0/* Slew Falling field=
 width */
> +};

Why are all of these things (reg bank bit ets) signed?
Especially since a lot of them appear to translate into
readl() writel() calls in the end, and these are unsigned.

Also, things named  *_bit are a bit (no pun intended) binary,
are they containing a single bit? In that case say

u8 foo:1

To mark that it's only one bit wide, or u8 foo:4 for four bits
etc.

Looking from the use of them in this manner:

val &=3D ~(0x3 << g->mux_bit);

It looks like mux_bit should be

u8 mux_bit:2;

And so on.

func_safe doesn't look like an int either when I look at
the code. It's something else, u8?

Second, please move out the inline comment to kerneldoc
above the struct.

The rest is pretty straight forward I think.

Yours,
Linus Wallleij
