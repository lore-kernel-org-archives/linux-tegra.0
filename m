From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4] clk: tegra: Add BPMP clock driver
Date: Thu, 17 Nov 2016 16:57:24 +0100
Message-ID: <20161117155724.GA29604@ulmo.ba.sec>
References: <20161115161129.29722-1-thierry.reding@gmail.com>
 <20161117011915.GN25626@codeaurora.org>
 <20161117095840.GA9843@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="T4sUOijqQbZv57TR"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161117095840.GA9843-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--T4sUOijqQbZv57TR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 17, 2016 at 10:58:40AM +0100, Thierry Reding wrote:
> On Wed, Nov 16, 2016 at 05:19:15PM -0800, Stephen Boyd wrote:
> > On 11/15, Thierry Reding wrote:
[...]
> > > +static int
> > > +__tegra_bpmp_clk_transfer_atomic(struct tegra_bpmp *bpmp,
> > > +				 struct tegra_bpmp_message *msg)
> > > +{
> > > +	unsigned long flags;
> > > +	int err;
> > > +
> > > +	local_irq_save(flags);
> > > +	err =3D tegra_bpmp_transfer_atomic(bpmp, msg);
> > > +	local_irq_restore(flags);
> >=20
> > Why do we need to disable irqs? Seems like an odd thing for the
> > caller to decide given that there aren't any interrupt handlers
> > in this driver.
>=20
> This is there to allow clock operations to succeed very early in boot
> when some of the infrastructure to execute the non-atomic equivalents
> hasn't been brought up yet.
>=20
> That said, I'm not sure we actually need it. I'll run some tests and can
> drop this if we don't need it.

Turns out that we don't need this anymore. The need for this must have
gone away somewhere during restructuring of the code.

> > > +static int tegra_bpmp_clk_enable(struct clk_hw *hw)
> >=20
> > Maybe this should be called tegra_bpmp_clk_prepare() so as to not
> > confuse the reader.
>=20
> Well, the function does implement an enable of the clock. The reason why
> it is later assigned to the ->prepare() operation is merely because that
> is what the CCF requires, given that this may sleep.
>=20
> Bus if you prefer I can change this and also...
>=20
> > > +{
> > > +	struct tegra_bpmp_clk *clk =3D to_tegra_bpmp_clk(hw);
> > > +	struct tegra_bpmp_clk_message msg;
> > > +
> > > +	memset(&msg, 0, sizeof(msg));
> > > +	msg.cmd =3D CMD_CLK_ENABLE;
> > > +	msg.clk =3D clk->id;
> > > +
> > > +	return tegra_bpmp_clk_transfer(clk->bpmp, &msg);
> > > +}
> > > +
> > > +static void tegra_bpmp_clk_disable(struct clk_hw *hw)
>=20
> ... this to tegra_bpmp_clk_unprepare().
>=20
> > > +{
> > > +	struct tegra_bpmp_clk *clk =3D to_tegra_bpmp_clk(hw);
> > > +	struct tegra_bpmp_clk_message msg;
> > > +	int err;
> > > +
> > > +	memset(&msg, 0, sizeof(msg));
> > > +	msg.cmd =3D CMD_CLK_DISABLE;
> > > +	msg.clk =3D clk->id;
> > > +
> > > +	err =3D tegra_bpmp_clk_transfer(clk->bpmp, &msg);
> > > +	if (err < 0)
> > > +		dev_err(clk->bpmp->dev, "failed to disable clock %s: %d\n",
> > > +			clk_hw_get_name(hw), err);
> > > +}
> > > +
> > > +static int tegra_bpmp_clk_is_enabled(struct clk_hw *hw)
> >=20
> > Why not *_is_prepared()?
>=20
> Yes, given the above that makes sense.
>=20
> > > +{
> > > +	struct tegra_bpmp_clk *clk =3D to_tegra_bpmp_clk(hw);
> > > +	struct cmd_clk_is_enabled_response response;
> > > +	struct tegra_bpmp_clk_message msg;
> > > +	int err;
> > > +
> > > +	memset(&msg, 0, sizeof(msg));
> > > +	msg.cmd =3D CMD_CLK_IS_ENABLED;
> > > +	msg.clk =3D clk->id;
> > > +	msg.rx.data =3D &response;
> > > +	msg.rx.size =3D sizeof(response);
> > > +
> > > +	err =3D tegra_bpmp_clk_transfer_atomic(clk->bpmp, &msg);
> >=20
> > And then I presume this wouldn't need to worry about being called
> > in atomic situations.
>=20
> I'll go test if that works. If it does, I agree that this would be
> preferable.

Turns out this works out fine. This sent me on a wild goose chase for a
while because after the conversion the kernel would simply hang at some
point. This turned out to be caused by the UART's clock getting
unprepared because it wasn't properly wired up in the DT. With the
original code I wasn't seeing this because the mix of ->is_enabled()
with ->prepare() and ->unprepared() would cause all of the unused clocks
to remain on across clk_disable_unused().

Perhaps this would be worth sanity checking somewhere during clock
registration? Specifically, providing ->is_enabled() but not ->enable()
or ->disable() or ->is_prepared() but not ->prepare() or ->unprepare()
seems like a bad idea.

> > > +static struct clk_hw *tegra_bpmp_clk_of_xlate(struct of_phandle_args=
 *clkspec,
> > > +					      void *data)
> > > +{
> > > +	unsigned int id =3D clkspec->args[0], i;
> > > +	struct tegra_bpmp *bpmp =3D data;
> > > +	struct tegra_bpmp_clk *clk;
> > > +
> > > +	for (i =3D 0; i < bpmp->num_clocks; i++) {
> > > +		clk =3D to_tegra_bpmp_clk(bpmp->clocks[i]);
> > > +		if (clk->id =3D=3D id)
> > > +			return bpmp->clocks[i];
> > > +	}
> >=20
> >  	for (i =3D 0; i < bpmp->num_clocks; i++) {
> > 		hw =3D bpmp->clocks[i];
> > 		clk =3D to_tegra_bpmp_clk(hw);
> > 		if (clk->id =3D=3D id)
> > 			return hw;
> > 	}
> >=20
> > Uses another local variable but is much clearer.
>=20
> Really? I think it's pretty clear in the original that we upcast,
> compare and return the original pointer. Even if bpmp->clocks[i] is a
> little longer than hw, the two occurrences are close enough together to
> make this immediately obvious.
>=20
> Maybe yet another alternative would be to make bpmp->clocks an array to
> struct tegra_bpmp_clk instead of struct clk_hw. That way the ->xlate()
> becomes simpler to handle at the expense of a slightly more complicated
> implementation for tegra_bpmp_unregister_clocks(). Given that
> unregistering clocks is a one-time operation but ->xlate() may be called
> very often, this might be advantageous.

So I implemented this alternative and it ends up looking better than
either of the options above, at least in my opinion.

I've sent a v2, let me know what you think.

Thierry

--T4sUOijqQbZv57TR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYLdNhAAoJEN0jrNd/PrOhwgoP/A03yR7u6ICJau0UwByLo6AY
9MF2m6G0bNhNd+UWUVWu5Z6DqtZ8EouXBP7MjEuybF5ZbLaMH/wSgVj9baGsnJ8T
u0vIQnF9xiJSbdww6Y8mW/QOw00iQGiZfSq8Lzz7Tmsnnam3e6EDHaXEu5+sDruD
W6u0HXxY3L6cWQvc4O/fIp647Jqq7D1mvmbdQLZeQ2Np2L6CrptkkHyuNwUPOJH/
gmxBcCuO75SnV8MwHPJNZHHMdq2gn6zpNzs7hKdMllXocbk0SukIhdgw7osFb096
NZ+7xKU8uPBZyb3BCuT3TJJa7jnKz/KgOXp1sw88HKq57OumXU1kYbsXe/Rtb8Wm
kjgzl5Xct/syammXfYWcTBDQI7QGWaaQKdWOxvUdFBU20VT/1qNomAAS1lyxneKp
UbktBL6QcKhgJ7/8MreJHvnTR8lkokeX/GGP2L4jBHJG9qguUAgOqxiBy9uyWODN
n8vPZmB22xdAJI1knKGpm9VH3Fa3IHwLx2u5reab0RYb5KjF3gtt8Rhq6eCi4aXD
DIC4FCKcB7evDB+lIDF18zoJ1BWMiCNf5uR8PLA9GDoGxVxaMW0OcbTeY0jrA9SY
v+B8Cf8KQbwFlKi/TKhCrvS3xNCR6nGuChXxeKB++YcYXTHaT3Dm96uJ86wcHa03
ukbEj+hPHfynkgPD7XAA
=gQki
-----END PGP SIGNATURE-----

--T4sUOijqQbZv57TR--
