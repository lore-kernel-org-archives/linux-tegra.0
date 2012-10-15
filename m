From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH REPOST] usb: phy: tegra remove include of <mach/iomap.h>
Date: Mon, 15 Oct 2012 22:22:40 +0300
Message-ID: <20121015192240.GB373@arwen.pp.htv.fi>
References: <1350324996-30838-1-git-send-email-swarren@wwwdotorg.org>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wq9mPyueHGvFACwf"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1350324996-30838-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

--wq9mPyueHGvFACwf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

hi,

On Mon, Oct 15, 2012 at 12:16:36PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Almost nothing from this file is used, and the file will hopefully be
> deleted soon. Copy the tiny portions that are used directly into
> tegra_usb_phy.c. I believe that Venu Byravarasu is working on cleaning up
> our USB driver, and those cleanups will remove the need for these
> constants.
>=20
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Acked-by: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Felipe, Greg,
>=20
> This patch is needed in the Tegra branch, since it's a dependency for
> cleanup required to support single zImage.
>=20
> However, I suspect/hope there will be significant improvements to the Teg=
ra
> USB driver in 3.8, and this change may merge-conflict with those. It may =
be
> simplest if this patch can /also/ be taken through the USB tree and so act
> as a baseline for any Tegra USB work.
>=20
> As such, may I please request this patch be merged into a separate branch=
/tag
> in the USB tree, which is then merged into both the Tegra and USB trees.

I can take this through my transceiver branch, but I would really like
to see v3.8 having a real (platform_)driver ready. The current state of
that code is quite bad IMHO and needs some love.

cheers

ps: will leave this in the mailing list for a few more days before
applying.

--=20
balbi

--wq9mPyueHGvFACwf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQfGKAAAoJEIaOsuA1yqREQa8P/31es0Z17PAGjSdzH5VPNluw
DLl3ERTEueX5at2A76xWvpaB5EHDsa02kE2jUBWwcb1/JQkFb1wc5obPqTb42UUf
tBQ8Sx53FgLMkNRzJ4dxXsXHtw9FTKiwZei9pi5RqVl0W3b+d/OyvYXJL1RD44Uz
Udkx+HOQWj1OroAHo5CoriPr1XVOxx/SaM7wrYDjfEWDY3ZxI27sXFpH4wbBsxem
ejtZFCtZsF2yNRo7QHhFbBHlf1PG+H6gGhFfV/Qiqk8FKYnpwMxUpPsqxr2CygHR
s3NrdLWon99cS3jIlibMsoh+MgVupiQIjwiZoJN/RtdfzpECvlU4A5S2hG+E1a6M
ylhcPC34F7f36NOiUGULJAmcapgCizhFYZD0qTJ6Gsz6Ie9b4gzlvFMyoKqK9lfG
a+bPPEZKrxHj1p6kHwAnFsFY1Fngb1dfnjWOB4Zbs6ZLsn81OtzwluwcFLx5xg+y
uYaz+dITI2hV7DxQudXSRaD4Flsf7W1fx1hLEgOZfBENFsKdHgIOs30kbL1xDxqW
NA4YHP1hhL2Ur0DY2bNuQ2g1iJNuApaPlOj3tYJK15Yy5a64u7gxt5vid4Zb9rwY
4m0d4p3xFx+oxN01+hW4+qFXzmCng2CSrfl2AlyF0sUw3nYL+ldm6V+9UTzKH4Cf
hxfXHgNY/4Ii2CFm7kEQ
=aXbN
-----END PGP SIGNATURE-----

--wq9mPyueHGvFACwf--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
