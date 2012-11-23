From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 3/6] gpu: drm: tegra: Remove redundant host1x
Date: Sat, 24 Nov 2012 00:19:27 +0100
Message-ID: <20121123231927.GC21555@avionic-0098.adnet.avionic-design.de>
References: <1353577684-7896-1-git-send-email-tbergstrom@nvidia.com>
 <1353577684-7896-4-git-send-email-tbergstrom@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eRtJSFbw+EEWtPj3"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1353577684-7896-4-git-send-email-tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--eRtJSFbw+EEWtPj3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 22, 2012 at 11:48:01AM +0200, Terje Bergstrom wrote:
> From: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> This patch removes the redundant host1x driver from tegradrm and
> makes necessary bindings to the separate host driver.

I'd rather keep the host1x driver where it is for now. There aren't any
users external to DRM yet, so I don't see a reason for moving it out.
Instead we can use DRM as a playground, see what we really need and once
external users start to appear we can think about moving the host1x code
somewhere else.

> This modification introduces a regression: Because there is no
> general framework for attaching separate devices into the
> same address space, this patch removes the ability to use IOMMU
> in tegradrm.

So the IOMMU support was up for discussion anyway and I wasn't going to
submit it for inclusion anytime soon either. No harm done.

Aside from ripping out the existing host1x code, the remainder of this
patch is mostly renaming from host1x_client to tegra_drm_client, so I
won't comment on it.

Thierry

--eRtJSFbw+EEWtPj3
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQsAR/AAoJEN0jrNd/PrOh5GcQAJmvQvZOTmJxzVtTTzoOnh62
k2X8RqtCDECBh9MaZUy0zpT54jbEvNvRxAQrCvrETXdOocLG0Mu0CknQGeYToimM
7nSvpkUamKUvUsul/o212VzYPfXJ/DXo0ZTsWJglc1Zgh3GNTSk3SxgBh1+cW5Q/
IdOWnI1VCYaCcgkfxkQz7CMVZNejfItU/U2KXlbEN67UGEc3ZoabVkTTKgoLlge8
YHItv2Ss8lPppqxvoQhyIJz3LGN9IaCtBYnY2n88BG9hZNspPepPVs2m/pF4X24W
rig0Oc9C5wGZYl5MyL1SgBSZk766PiNFdh9TiqFA2GhmiXA7p5grXzHDrQAA0qht
aQZf+DY52PvnF20vCLpdks0Xn1yUN9uXFJUOJJvZD75YNaqiJBZ7GhGPfzEF8KP4
qAtFmOzxEU/stALwlICY4ucz770okFC7bNYPLFDkIlBnaZYCjXIMh8i+cadkOXub
ZPhyLKO5ESwzLLRWBkHidzL7cOzTw9lyqKw5Der5vtHYCafitCMSObV+zflgGjLg
lDSEhapyooZue6TKKMbuno9wZymcTHne20NsJ1poRu4SqdUJ63E7KuJi2nLJ6POS
KIDvm/bBRXUXZQT0j3NfIiuULIueh9cYxkZFx4op1LdpG4sKj5XuGfgfjlghyWiz
gCD7bVKQhomComcRRGVe
=NHDk
-----END PGP SIGNATURE-----

--eRtJSFbw+EEWtPj3--
