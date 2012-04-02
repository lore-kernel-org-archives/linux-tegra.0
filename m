From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 14/17] ASoC: tegra: add tegra30-ahub driver
Date: Mon, 2 Apr 2012 23:04:33 +0100
Message-ID: <20120402220432.GH3160@opensource.wolfsonmicro.com>
References: <1333148852-17806-1-git-send-email-swarren@wwwdotorg.org>
 <1333148852-17806-15-git-send-email-swarren@wwwdotorg.org>
 <20120331201433.GL5012@opensource.wolfsonmicro.com>
 <4F77B7CA.3020803@wwwdotorg.org>
 <20120401103117.GD3153@opensource.wolfsonmicro.com>
 <4F79E198.1080606@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JI+G0+mN8WmwPnOn"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F79E198.1080606-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--JI+G0+mN8WmwPnOn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 02, 2012 at 11:27:52AM -0600, Stephen Warren wrote:
> On 04/01/2012 04:31 AM, Mark Brown wrote:

> > Yes, exactly - allocate the resources in the platform driver probes,
> > register with ASoC and then only touch the hardware when ASoC tells you
> > the whole card is ready.

> Thinking about this more, I guess the AHUB driver should be a bus
> driver; in HW, it implements a register bus and the I2S, SPDIF, and DAM
> devices' registers are accessed through that bus. That would solve the
> probing order issues in a way that's much more directly modeled on the
> hardware. Relying on the separate pdev and ASoC probes for the child
> devices seems a little bit like relying on an implementation detail.

> Does this sound like a good idea to you?

Yeah, I'd actually written "mfd" in one of the earlier drafts of my
original mail but then deleted it as I figured it'd already be that way
if it could be supported :/

> The thing that makes me shy away from this is when our downstream
> kernels want to pick up v3.5, and perhaps don't want to use DT
> exclusively yet, how would they do the same bus/child thing with
> platform devices in board files? Perhaps they don't need to, and can
> just register the AHUB pdev first, and child devices later, and ignore
> the bus' existence.

You can happily specify parent/child relationships with static
registrations, just set the parent pointers appropriately and ensure
things get registered in the right order.

--JI+G0+mN8WmwPnOn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPeiJbAAoJEBus8iNuMP3dZL0P/0DH2UxIVApoXDzQqwe3WoUp
wny4bjKH8TI2BCC9A1bB7bK5oakDUXkCQ2AIHs/kLXMDa+xcCU6TCoCiKzEh9XKh
SWpEcV2Wlo7zrQBSgcOcJPGKz5zu/Uvp2BfiMulX0tX9JMKUle6E86KadvZuHbJ/
Mbq6vIqPxB3bTJjEa/pXmeyziSye8MTk8H9QcXUG0JfKjB3u1qhx+3a98SzyhfZW
o48uuFRbiFmZ63/zrlLDWkiNYOjAlEd9EQJReCFTHUC5c7zqA+SwlegXB7v2/FwD
HSFwWRleb4D0jobyZJeSGaCDupQcbfIeAV+BGwXHR1BsmUqEbl0xpP1YJrx6AOMZ
i19yqOqDiWklw6lkC0ebRFZRMvHagfrInBbK85jchXU7jrvSifRVMToGozl8XvpY
Qy3ii3Ox62ECZxE+GywOZlbPs4o8oXv6AJxuRlSLdtadVdmWsIQ6XgSKRyeUiDLy
RAYktvhWc0e8pkWri33zyL/5tfjs94AQjrLzhpDIFzoKqNajQVKS+5G15VSYl1Vh
TONxsoNj2wuq70kyLAsnTWibMPbmsDj4O2Bu0ZxvfaYQUzo/kcR/LM998R989s+p
m/+vSEt0TQhT2CFt0cy0AYcCuAfID9Qhl8KoqqdCek1/DWtCuTjfc2J4CvGQ6x5l
KgwIMdGqjUjbwl0yvyP6
=zTyP
-----END PGP SIGNATURE-----

--JI+G0+mN8WmwPnOn--
