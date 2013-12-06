From: Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH 4/4] pinctrl: tegra: add pinmux controller driver for
 Tegra124
Date: Fri, 6 Dec 2013 10:58:19 +0100
Message-ID: <20131206095819.GB29035@ulmo.nvidia.com>
References: <1386241070-4350-1-git-send-email-ldewangan@nvidia.com>
 <1386241070-4350-5-git-send-email-ldewangan@nvidia.com>
 <52A10C7B.8070406@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="H1spWtNR+x+ondvy"
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <52A10C7B.8070406@wwwdotorg.org>
Content-Disposition: inline
Sender: linux-doc-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Ashwini Ghuge <aghuge@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

--H1spWtNR+x+ondvy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 06, 2013 at 12:30:03AM +0100, Stephen Warren wrote:
> On 12/05/2013 03:57 AM, Laxman Dewangan wrote:
> > From: Ashwini Ghuge <aghuge@nvidia.com>
> >=20
> > This adds a driver for the Tegra124 pinmux, and required
> > parameterization data for Tegra124.
> >=20
> > The driver uses the common Tegra pincontrol driver utility
> > functions to implement the majority of the driver.
> >=20
> > This driver is not compatible with the earlier NVIDIA's SoCs,
> > hence add new compatibile as "nvidia,tegra124-pinmux".
> >=20
> > Originally written by Ashwini Gguhe.
> > ldewangan:
> >         - cleanup the patches,
> >         - Fix address issue.
>=20
> IIRC, Thierry mentioned he had some fixes in his local branch for this
> driver. Thierry, can you please confirm/deny this?

I'll try to get this version tested today and report back if any changes
are still required.

Thierry

--H1spWtNR+x+ondvy
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSoZ+7AAoJEN0jrNd/PrOhgLAP/35p42XYm/W4T0mOqjTrCk/s
4+QHkSkhQc4RCspUUerOBIHXQbKnq9l8PTUtOmWpbIruWqZIZX/50IYarg0lf9E0
Yitg+G/7iQ/eUm1+giXRLfSxWyG9T2TekTjObKMz8ble/tw+kokCGZlPYEMbOiL2
AgYr/yTvOSpJcxKFmEj6dYS2oGEMMXlJG3lueDnZPfW+8VyZbHNALDN+2ySY5mae
uU42smMB0eFL4266oir2b3unZjozyhp5rJxXTURoIUvx5jZEcXEkU5nJHZZY8TQM
FLoBUUtv7kmsRMspTBCqaqxzIBEFMUiu/70wNBkhu/ZCYUtdTkivhcVtN5cS5kJy
WXr7q3WLLPcXDpQilKqoP5k++HWtl9IF7ZsrWBuWq2dtBQbW0nujP8JwYP+p4vdK
voM3kuX8/me8K0vfVW6lJiXLyRmWJltfgb6pD59zsuqj2+XxA/HT4Gq+DBvbnEV8
1Vwpg5Kq0o4T2Wfey1mhGE4KkXTtEFdG+4McY9YcQrH8PvlMUijxrYKhzQKzZgvO
GB97ljJvDWxFrEswkoguALMN9oTE24GUXgMv43J2aY6Mj1k8RMc4BT3fch3V/xkV
zxZqQHvk1tcUZcDMB6X9Q6OS60alTc/GHXUENRuf/Cddxcxmg3vL1rtL1foT1Soh
7twGGWBrZ/VX8mJ1GXkg
=NZS0
-----END PGP SIGNATURE-----

--H1spWtNR+x+ondvy--
