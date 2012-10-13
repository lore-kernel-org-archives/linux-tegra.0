From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: Tegra DRM with HDMI support (\o/)
Date: Sat, 13 Oct 2012 22:42:23 +0200
Message-ID: <20121013204223.GA24354@avionic-0098.mockup.avionic-design.de>
References: <20121011200705.GB27599@avionic-0098.mockup.avionic-design.de>
 <50775803.1010209@wwwdotorg.org>
 <20121012050957.GA29881@avionic-0098.mockup.avionic-design.de>
 <507888D0.1090103@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8t9RHnE3ZwKMSgU+"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <507888D0.1090103-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 12, 2012 at 03:17:04PM -0600, Stephen Warren wrote:
> On 10/11/2012 11:09 PM, Thierry Reding wrote:
> > On Thu, Oct 11, 2012 at 05:36:35PM -0600, Stephen Warren wrote:
[...]
> >> The code in clock.c uses lots of clk_get_sys() calls with
> >> hard-coded clock names. We really should be using the common
> >> clock DT bindings for this instead of hard-coding names. This is
> >> especially true since the names differ on different SoCs, so
> >> there's a ton of of_device_is_compatible(output->dev->of_node,
> >> "nvidia,tegra30-hdmi") in this code.
> >=20
> > I don't quite see how that is supposed to work. Wouldn't that mean
> > that we needed to setup various entries in the clock tables to be
> > able to look the clocks up by generic names? Like pll_d would need
> > to be the "parent" clock of "tegra-hdmi" or similar. In that case
> > we could call clk_get(hdmi->dev, "parent") instead. Is that what
> > you had in mind?
>=20
> There are two ways this could work:
>=20
> 1)
>=20
> All clocks needed could be represented in the node of that device (or
> perhaps in the DC node?) For example, perhaps hdmi might contain:
>=20
> clocks =3D <&car TEGRA_CLK_PLL_D>
>          <&car TEGRA_CLK_PLL_D_OUT_0>
>          <&car TEGRA_CLK_HDMI>
>          ...;
> clock-names =3D "pll_d", "pll_d_out_0", "hdmi", ...;
>=20
> That should work (I think) with pretty much no modification to the
> current code, other than calling clk_get(dev, "hdmi") rather than
> clk_get_sys(NULL, "hdmi").

I thought DT support didn't work for Tegra yet. If that works we should
probably get rid of the DRM related entries in the clock tables and put
the information in the DT regardless of which of the alternatives is
implemented.

> However, I'm not sure this is the best way or not; this still requires
> the HDMI driver to implement all the clocking policy (e.g. is the HDMI
> clock a child of PLL_D, PLL_C, PLL_P, ... and what rate should the
> parent PLL be set to, etc.)

Yes, it's pretty ugly and as you mentioned before it requires many
special cases to be handled depending on the SoC. I'm presuming that
future Tegra generations will be supported by the same driver and the
number of special cases will only increase.

> For example, what if the clock frequency HDMI needs can be generated
> by PLL_C, so we make PLL_C the parent of HDMI (so as to save power by
> not running PLL_D, or to use PLL_D for a second display head), then
> something else comes along and /has/ to use PLL_C. If the two childs'
> frequency requirements are the same, everything is fine. If the two
> child's frequency requirements are not compatible, we might need to
> spin up PLL_D and reparent HDMI onto it. More complex scenarios are
> possible where PLL_C needs to be reprogrammed, yet can be in a way
> that supports both HDMI and some other requirement, so we only need to
> temporarily move HDMI onto PLL_D, then reprogram PLL_C, then move HDMI
> back to it and spin PLL_D down. All these decisions should be made
> centrally in the Tegra clock driver, or at least some kind of
> centralized policy management point, and not by the HDMI driver:

That does sound awfully complex. However given that it would allow us to
use only a single clock and program it in whatever way we need in the
drivers is a very strong point in favour of this alternative.

Furthermore, given the above scenarios, it won't be possible to do that
without a central implementation because all clock usage information
needs to be available to make the right decisions.

> 2)
>=20
> The HDMI device node only knows about the clocks used directly by the
> HDMI module:
>=20
> clocks =3D <&car TEGRA_CLK_HDMI>;
> clock-names =3D "hdmi";
>=20
> (note: that's just an example; I don't know off the top of my head
> exactly which clocks that module consumes directly)
>=20
> Then, the HDMI driver will simply perform a single clk =3D clk_get(dev,
> "hdmi"), and later call clk_set_rate(clk, rate) as appropriate. All
> the policy decisions then get made internally to the Tegra clock
> driver (since it's a central nexus for all clock outputs from the
> Clock And Reset controller (CAR).

=46rom an abstraction or design point of view, the CAR indeed seems the
best place to implement this kind of policy. User drivers shouldn't have
to worry or know about any of these details. The big win here being that
most of the special casing could be removed, therefore making the driver
a whole lot simpler and easier to maintain.

> A similar question exists for audio too. Currently, our audio drivers
> do something similar to what tegra-drm is doing; (1) above. However, I
> have a feeling we may want to convert audio over to model (2) above too.
>=20
> Oh, and the cpufreq driver has a similar for centralized policy, since
> at 216MHz the CPU clocks are derived from one PLL, but for anything
> faster we use PLL_X to generate them. Right now, this is implemented
> in the cpufreq driver, but again should really be centrally managed.

After reading all of the above I'm definitely in favour of alternative
2). If you think we can pull it off I'd say let's go for it. I'm willing
to spend some time on helping with this, but I must admit I'm not overly
familiar with the clock framework. Maybe Prashant would be better suited
to have a shot at it.

Thierry

--8t9RHnE3ZwKMSgU+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQedIvAAoJEN0jrNd/PrOhy/gQAIPWRLKRAMYI91HfYYb0WehV
V87K5y1i3Eq2wWYoZfrTBIjJLdOjG5KIXgLDy1gjS9g86Kz+i6pyCRyBNVTbczjD
slZycvpSjSDZMPeMvtLk3W9Rlw2Ggkelsq9hEy69HnaO3XHxoVlPOIoUqx4Q0+Tv
sjwk6B65w9hCzsNO3KxsdIdMGRHJia7V9BsJ5ikdzq1UC7sJhZWvdGc0+zYKUr9n
hknlNzG+0w/eUM+aNrHnc04bFSTrcvOV0ZWJNsYoKX/opmYyRznAmoMCpLj3NqyQ
t209Ea3+CeQN9hYViB+3wnRF6jR36idrmdX1gsfYW5P/6yDJApZcFJ6lK+FAKx4x
8TVmhbmzP474Oo74fnlJDgdJa6HJhYsmpPma/JwGh15/8cFmjN1zY9f7FLjFIt19
dRQ1ktheFzjLFRmnTYxWkomDtliJqXgFh7QJWcsQwxyQwUT2UTpAgdlVJxUbvQTi
WQT3MsY6REy8BhhZE3I/IQ4tHUpJYst+0s01+rwRyi9dV+QyCge8av14MdSMDN0d
2LSLDqGAUpNkhFd3xHwBaNydd4mLN2cHqIx8Vjz53U1PS7PKPS/ajRf9ZZONf4PX
udMqqZADVjsQaN7TURyL1QTcoXfBp/i4BXuIqao88L7Z4FQo3c1xroJL4mEIMssn
5J2bdBHUYnnxIcKI7CDb
=P0sd
-----END PGP SIGNATURE-----

--8t9RHnE3ZwKMSgU+--
