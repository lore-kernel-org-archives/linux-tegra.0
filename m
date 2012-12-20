From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 7/7] ASoC: tegra: add machine driver using wm9712 codec
Date: Thu, 20 Dec 2012 20:16:13 +0000
Message-ID: <20121220201613.GA26183@opensource.wolfsonmicro.com>
References: <1355959056-6009-1-git-send-email-dev@lynxeye.de>
 <1355959056-6009-7-git-send-email-dev@lynxeye.de>
 <50D36D3B.7080309@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50D36D3B.7080309-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 20, 2012 at 12:55:39PM -0700, Stephen Warren wrote:
> On 12/19/2012 04:17 PM, Lucas Stach wrote:

> > +	snd_soc_dapm_force_enable_pin(dapm, "Mic Bias");

> Hmm. I guess that potentially ties this driver to whichever CODECs
> actually expose a widget with that exact name...

Yes, embedded AC'97 systems are often but not always generic - another
thing you can do is have a PLL in the CODEC rather than having a MCLK at
the right frequency, and there's things like external components.

--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQ03HhAAoJELSic+t+oim96lEP/iy39dwGsDe7w5wagJFYId/T
98IvPO+O7b4xsBKGJJy9Euvvr0xLufVSHHV93MBBwEb98WUE/D5wussfkU7hkfmp
wfaMbRbeyI6o3uhjuubKx8lQhmXPp8N7di69nJAPVPdhQzobonJFd6azFcOromfG
E4JUy9OrjYFas7BFxY2MClQ36q6N8Lj3zGd31YcOQavmow2O8AHx+Ke3MnysC8FD
uxQMNfYPJQ0WfxCnGXiXSDXHMMTg7sJLPsabgafNtdY6bfd8jU7ZXusbSMXEKp3F
khPlAYhmAtQvpiM0+1T+5BYqEWymPj5S7pzzv/xT4lCEATPPfbo51kemWgDGO4Aq
O0ZUfQqhX1/xK7Q38ECKUiYjxO5AuBnwZGeO20rbf/T9Rs+QYxARdYQcZOf+6gUU
WoqcEgvsSssZmpy9CqfwpYnImRjUgeVqqd3z9BxwDkLVp5HTFCQZb9UC/FtsyHz3
4Fn9oaB8UtGbgay8yWGCHT2GmKYfWGUsxY1QedZlAGdqX1ykhuQ0SuPgc/fp89Aw
0pHv/g5hPsGo/yezIOLvVeQ5wq5Dn6291L/uh2BtpBC61Q8EtW1/epdw9MgJDKy0
dopTY+L+gLpKYI7mRyRTR8B7P0lZzNTqulkjR/vU+y2CiG6FNsJHhTRjT3NY/DoJ
55f8OHC5GJIyWFmCc2Ml
=CTuJ
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--
