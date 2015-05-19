From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] pinctrl: tegra-xusb: Fix allocation of pins
Date: Tue, 19 May 2015 16:30:42 +0200
Message-ID: <20150519143041.GD26748@ulmo.nvidia.com>
References: <1432044863-2035-1-git-send-email-jonathanh@nvidia.com>
 <1432044863-2035-3-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Q0rSlbzrZN6k9QnT"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1432044863-2035-3-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--Q0rSlbzrZN6k9QnT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 19, 2015 at 03:14:22PM +0100, Jon Hunter wrote:
> Commit e5b3b2d9ed20 ("pinctrl: allows not to define the get_group_pins
> operation") allows pin controllers not to register the get_group_pins()
> function. However, a side-effect of not registering this function is
> that pins are not allocated and potentially multiple devices could
> attempt to configure the same pins [1]. Although this problem exists in
> the pinctrl core, because only a few devices are impacted by this, fix
> this for tegra-xusb by adding the get_group_pins() function.

If I understand correctly this effectively makes get_group_pins()
mandatory, doesn't it? In that case, shouldn't commit e5b3b2d9ed20 be
reverted?

> Please note that in addition to adding the get_group_pins() functions
> the pins/lanes for the tegra-xusb also need to be registered when
> calling pinctrl_register(). This also allows the current pinmux state
> to be viewed by the debugfs node "pinmux-pins" for the tegra-xusb pad
> controller.

This sounds like a logically separate change and hence could warrant a
separate patch. I'll defer to Linus on this, though, so:

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--Q0rSlbzrZN6k9QnT
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVW0kRAAoJEN0jrNd/PrOhZV0QAKVwczreDAtmoAbyMdy9tlUA
SRBfKebrjEQvbZAa/R/8Y2B6IiGcOrjeTAYHAIp9zyaSmxjdhatluh+kHPp1axKa
uZpbyG06Ykrtw53eWKl3auqim1kbW2oFeSsQEVkFPPDRrQVAX9UW+I8Sp8PWpIJj
EFLpdyj26Ubi2/qkNmQenORYsjcIH5EOFQ3TJG6bSFfv2sDecnovaZvy9D9A6mR1
juTq3/ob49hOjgLBTgdsS3mOV1Yc4AE7F2jq7tTOjFlcV71gPi0haj+JCKhbq0Gj
TkNcPUFg9iSc+y5lgykl42Y+EAr1tTLTsHTG1xT/x2Ff/UES0oGBYzpor12y+A2V
Y6AITDfp4B4zDBjsRI0Ab+ybGrixM24v8hfRQ3TetINAix7fyTqTB91h3u0JgGZ3
PUctme0xO2EpnCDw/SldTMP+U56odQIdF9uf8yFriaXqQgVun5EvbRtPlobfgCuW
Ybu2IEvhsiO5X0ToZ4QhI2o3A8y+oEwi9dtd36erYuitbE0uxJ7zCdgmYbAhNAuk
iA3M0YzwghGVBQTuI0/l5bRBtB1dOUlugoSdRo7RijXWr4xVIZyqafxICwi3TGbb
WNR+E135w1fNbqe7FvxH3u++Mx3qBDCgRRfisGPCxbxy4dHbi5QTNrmtLLxpvelX
nT2TWlGF76g6zEA0ceUB
=dO8L
-----END PGP SIGNATURE-----

--Q0rSlbzrZN6k9QnT--
