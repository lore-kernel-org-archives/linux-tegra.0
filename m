From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 1/2] drm: Add NVIDIA Tegra20 support
Date: Sat, 10 Nov 2012 10:11:21 +0100
Message-ID: <20121110091121.GA17319@avionic-0098.mockup.avionic-design.de>
References: <1352469579-3337-1-git-send-email-thierry.reding@avionic-design.de>
 <1352469579-3337-2-git-send-email-thierry.reding@avionic-design.de>
 <509D9B4F.6060003@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gBBFr7Ir9EOA20Yy"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <509D9B4F.6060003-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--gBBFr7Ir9EOA20Yy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 09, 2012 at 05:09:51PM -0700, Stephen Warren wrote:
> On 11/09/2012 06:59 AM, Thierry Reding wrote:
> > This commit adds a KMS driver for the Tegra20 SoC. This includes basic
> > support for host1x and the two display controllers found on the Tegra20
> > SoC. Each display controller can drive a separate RGB/LVDS output.
>=20
> I applied these two patches and the two arch/arm/mach-tegra patches you
> posted, directly on top of next-20121109, and I see the following build
> failure:
>=20
> > drivers/gpu/drm/tegra/output.c: In function 'tegra_output_init':
> > drivers/gpu/drm/tegra/output.c:166:9: error: 'struct tegra_output' has =
no member named 'display'
> > drivers/gpu/drm/tegra/output.c:166:3: error: implicit declaration of fu=
nction 'of_get_display'
> > drivers/gpu/drm/tegra/output.c:167:20: error: 'struct tegra_output' has=
 no member named 'display'
> > drivers/gpu/drm/tegra/output.c:168:25: error: 'struct tegra_output' has=
 no member named 'display'
> > drivers/gpu/drm/tegra/output.c:179:13: error: 'struct tegra_output' has=
 no member named 'display'
> > drivers/gpu/drm/tegra/output.c:180:3: error: implicit declaration of fu=
nction 'display_put'
> > drivers/gpu/drm/tegra/output.c:180:21: error: 'struct tegra_output' has=
 no member named 'display'
> > drivers/gpu/drm/tegra/output.c:257:20: error: 'struct tegra_output' has=
 no member named 'display'
> > drivers/gpu/drm/tegra/output.c: In function 'tegra_output_exit':
> > drivers/gpu/drm/tegra/output.c:272:20: error: 'struct tegra_output' has=
 no member named 'display'
>=20
> Does this depend on something not in linux-next?

It looks like I missed some changes when I split the patches up and then
forgot to check that the patches actually still build. I'll make sure to
fix that in the next round. Sorry for the inconvenience.

Thierry

--gBBFr7Ir9EOA20Yy
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQnho5AAoJEN0jrNd/PrOhRnwP/igeV7l4OF0hcJQbtwkSPsED
pFfb5z9EqYz2xNH752ZAek4HLvfaIol6nrwlMoPWCORQ9hpeGCl1Lw8llIDl0dfW
IMKe0/UMHwEOXQ4hllwADgQ99E88PZz3HeKLit4mxCiLlGAwWQtAeR0HUDAbidFt
TVft5A9nk+aSJXoOQBRu+IarL7AIKwU6yVCAGk+nIsWFEbLJdcFyZEZYWyzrBYKc
6lrDqrSYx1t2ZGrgsJCzDdhxS+S8/B008o5AkSUWBsQBJWbRuApsQDDMcU/aYNG0
ijGis2l0BcBR0r3sMtnD7mEVRjoUwuPmjpxx8eiyHSKPCAqfVYluURF+Ikpl5px3
Td42u7joeKnx9JMK+ah0wVqomoT6Xezeeks2Er1U0epSvZuvFQUTPTubH5MPcqLt
xcMDduFpNX0GfUyr4+h2BvmifQZbepeiraLvhf/ltmrXaKl62TNSRRLJL51ewdsa
Dgdoyjt29uaWqFuJOFYmoeKDHaPSMDVmhIcIskdl7kWG3QrUHWX+K1JP9sEypr9r
zFls0RKSPY6iZ80xSXoAHN31XAynzhjjpNPKSj2zlLPr297544cLTQa3AlyTvrSs
9hTs3f7uWGQV1Ng85vNsmy+Al8Qp2vuktaxwH1W7JajVj3Ub89yZ3fwCMAVXMbQe
DAm0ojy+YljI6XfSmxLu
=CbSM
-----END PGP SIGNATURE-----

--gBBFr7Ir9EOA20Yy--
