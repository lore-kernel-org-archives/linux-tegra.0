From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: Tegra DRM with HDMI support (\o/)
Date: Fri, 12 Oct 2012 07:09:57 +0200
Message-ID: <20121012050957.GA29881@avionic-0098.mockup.avionic-design.de>
References: <20121011200705.GB27599@avionic-0098.mockup.avionic-design.de>
 <50775803.1010209@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7JfCtLOvnd9MIVvH"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50775803.1010209-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 11, 2012 at 05:36:35PM -0600, Stephen Warren wrote:
> On 10/11/2012 02:07 PM, Thierry Reding wrote:
> > Hi,
> >=20
> > I've finally managed to get HDMI working on Tegra20. Unfortunately
> > the xf86-video-modesetting driver doesn't work on top of it yet,
> > but I think that's a different error somewhere else and I'm still
> > trying to figure out what exactly is going wrong. However, a
> > framebuffer console can be run on top of it, as does a small test
> > program that I've written for testing.
>=20
> I should start out by saying that this is all very excellent news!
> Thanks so much for your hard work on tegra-drm.
>=20
> I have managed to get Harmony HDMI working, mostly just by copying the
> obvious device tree entries from tegra20-trimslice.dts. This didn't
> quite work immediately though, and while debugging this I found a few
> issues...
>=20
> (most files I mention below are in drivers/gpu/drm/tegra/)
>=20
> 1)
>=20
> clock.c:tegra_clock_setup() calls clk_set_rate() on the PLL. However,
> there is no error-checking, so any failure is completely silent and
> simply results in the display not working without much clue as to why.
> In my case, my monitor's preferred mode was 1920x1080 with a 154MHz
> pixel clock, which required a 616MHz clock for pll_d. However,
> mach-tegra/tegra20_clocks_data.c didn't have an entry for that rate,
> so clk_set_rate() failed.

I'm not entirely happy with how this is currently implemented. One thing
I was going to experiment with now that I have a working reference is to
move clock setup into the respective outputs in order to get rid of the
various if branches. This may turn out to not be much better, but it
will allow the clock setup to be more closely located to the actual user
of the code and therefore increase maintainability.

Even if that doesn't work out, error checking is still a must.

> For reference, the following entry in tegra_pll_d_freq_table[] solves
> this for me:
>=20
> 	{ 12000000, 616000000, 616, 12, 1, 8},
>=20
> (although I have no idea if the "cpcon" field there is correct)
>=20
> I imagine that output.c:tegra_connector_mode_valid() should be
> querying the clock API to determine whether the desired mode clock is
> actually possible, and rejecting the mode if not. In my case, I assume
> that would have caused the code to fall back to some other mode, and
> hopefully found one that did (my monitor apparently lists 51 modes in
> the EDID after all).

Yes, that's definitely something we should cleanup. If the output can
determine that the clock can't be set to the rate required by the mode
it should mark the mode as invalide.

> 2)
>=20
> The code in clock.c uses lots of clk_get_sys() calls with hard-coded
> clock names. We really should be using the common clock DT bindings
> for this instead of hard-coding names. This is especially true since
> the names differ on different SoCs, so there's a ton of
> of_device_is_compatible(output->dev->of_node, "nvidia,tegra30-hdmi")
> in this code.

I don't quite see how that is supposed to work. Wouldn't that mean that
we needed to setup various entries in the clock tables to be able to
look the clocks up by generic names? Like pll_d would need to be the
"parent" clock of "tegra-hdmi" or similar. In that case we could call
clk_get(hdmi->dev, "parent") instead. Is that what you had in mind?

> 3)
>=20
> It sucks that our clock driver can't just calculate the PLL m and n
> values; without this, we will end up with an almost infinitely large
> tegra_pll_d_freq_table[]. I'll try and find out whether this can be fixed.

If this can be calculated it is definitely the preferred way.

Thierry

--7JfCtLOvnd9MIVvH
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQd6YlAAoJEN0jrNd/PrOhMeoQAL0QrPfU7PK7l5YRBbwnNf3b
9aXNXpLjhc73UmI+nxuqYV2dsdbegqeajoQ9BNaHlDbEcu/nbzoFonWcqqMq1JSL
SpuJKYp7mEgfNvOd9+c8JS2WaxSBSfhAYpvm6YSK7LEkO6/o7flQrIGUltGWZ1gZ
cVpHHoTZtg6d40N3pemlcYzl+6R/3TUiQx2/dtKThSs1dMg7Nk2uYfEcrW0wLWnJ
HFp7Mo0XHsEzOY4904AyvIdubrQrHIF3AVsg1FmTQQ9aBWFclpNtFOTR+YvME8AT
r+6GOxR+CwA1M8wmPp0CcDvsdwM6ywLM9/3TweJpWRJCQP1ie2Dgd48UdO4UZPmI
Xs6ZICQK1vsmpSJfjkgoLsAdf5ihR2n0P5xqrOywalAsJtjGM7ptJGk6M2KB7Q6o
PjOf5yCebD5XiBiZ5lnRg1Xrr3Nj66mPg23dLGam2u7MpP2m5tXvMfy0if4G8eIx
ww7cfeXqzguoItvpeO967Shyxa/qqHpPggiFhNBgV/DebGJQowpxl/o3HFLblKPY
YoLLE9r9CrrjgYDE9Xh8QzE6L8zG7NScIJoQQvk/v1i4Unhhwlnq+gkKm8JUr608
ZybCbxQqMe2gV4D0MZdtYfWTSm512c3x0tWjNbr8tAAAMv/PkqE0XyUOuTqP8M/O
+0rVyHR02TCi1MpUuUa+
=kDXv
-----END PGP SIGNATURE-----

--7JfCtLOvnd9MIVvH--
