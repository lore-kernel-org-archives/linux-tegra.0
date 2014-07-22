From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/4] ARM: tegra: roth: add display DT node
Date: Tue, 22 Jul 2014 10:45:48 +0100
Message-ID: <20140722094548.GP17528@sirena.org.uk>
References: <1404303560-32209-1-git-send-email-acourbot@nvidia.com>
 <1404303560-32209-5-git-send-email-acourbot@nvidia.com>
 <53B42B60.1000600@wwwdotorg.org>
 <53B4C9C0.4000605@nvidia.com>
 <53CD333F.2070805@wwwdotorg.org>
 <20140721211630.GA12076@mithrandir>
 <20140721225153.GJ17528@sirena.org.uk>
 <CAAVeFuKtVYNP5LFXGCEpkUtCCrK6AP+9WEVPDPs45RwAPvKKRg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aRuUY7KzmetiZjaI"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAAVeFuKtVYNP5LFXGCEpkUtCCrK6AP+9WEVPDPs45RwAPvKKRg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--aRuUY7KzmetiZjaI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 22, 2014 at 01:39:51PM +0900, Alexandre Courbot wrote:

> I also don't think that would do it - for many displays the power-on
> sequence is not as simple as "switch all the regulators on".

> Maybe what we would want is to have panel-simple allow panels to
> provide a "probe" callback so they can request and manage any extra
> resource they need. This would of course imply that custom
> enable/disable and suspend/resume callbacks. Then the driver might not
> be "simple" anymore, but IMHO it would not be that bad.

This is starting to mirror the discussion about MMC/SDIO devices where
the talk was of having a property on the device saying which power up
scheme to use - added Ulf for that.

--aRuUY7KzmetiZjaI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTzjLJAAoJELSic+t+oim9rIgP/3htcCCFA2hpukO16XqiGrqC
huwFO2DCA5zohaX3MsZxwIcdz65tzq+bjdjVUdyJgQNQIFmGwklrv/pU37lyeo31
NhHtj7gNXrF21RUkLQsEmlZy0hkDLL5AhPRGN5ISJzyhFCx8sEm3gNR8NonB/mDX
swqh+9HxBTET0QFSO/qtTO/H29zeBExwvA6fF9anJUJlCmjXuWdE3f7oTbg+GOvP
4Pj8i8F/gA+e4evSidtdtsWgBjQS4ECDaxAN1+X/uNi51MFcvZSQRus7Hnh6Qc/Y
vOfB/GGZdYXRON7ha2zzpGzsB7urCN4QgHyaPWEmqhpjrw54RDUZRc/CRx1h/tcZ
JfhVGfpriPJlS2mRqDsVvMD8suPGfo8kOsfgEajMSK4zuHZ49Eatkf8SwZG/Ow8b
BaKLy1XGSU0NaZO+P7qvfu7Dp5HwvMKNIRjwJsMZGOzBEkyVK4Ms1EjfKO+Or2/3
jKPEG54V822ahzvQe7+TlNZXoCyOey+SKQSsF+iYurXdkKyMG/PlwaedUTIO/Zgo
+fUOSngmeTd7BQAfqw1TVsRr/oDrEBckdIS8ZJdtVLvJLjQMCMhlUHmYI9VePrP1
rxMN75rcVSwgzQcLGNPfBZe2QxZ3ZDziMn3ntXwhruFUeKILDRJ8vx6X+DVGF0X/
3C/nbZq29Uhx8O1WIwoR
=lpi1
-----END PGP SIGNATURE-----

--aRuUY7KzmetiZjaI--
