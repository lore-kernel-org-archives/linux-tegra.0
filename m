From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCHv5 0/8] Support for Tegra 2D hardware
Date: Tue, 15 Jan 2013 12:33:48 +0100
Message-ID: <20130115113347.GC18119@avionic-0098.adnet.avionic-design.de>
References: <1358249182-17486-1-git-send-email-tbergstrom@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0lnxQi9hkpPO77W3"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1358249182-17486-1-git-send-email-tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--0lnxQi9hkpPO77W3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 15, 2013 at 01:26:14PM +0200, Terje Bergstrom wrote:
> This set of patches adds support for Tegra20 and Tegra30 host1x and
> 2D. It is based on linux-next-20130114.
>=20
> The fifth version merges DRM and host1x drivers into one driver. This
> allowed moving include/linux/host1x.h back into the driver and removed
> the need for a dummy platform device. This version also uses the code
> from tegradrm driver almost as is, so there are a lot less actual code
> changes.
>=20
> This patch set does not have the host1x allocator, but it uses CMA
> helpers for memory management.
>=20
> host1x is the driver that controls host1x hardware. It supports
> host1x command channels, synchronization, and memory management. It
> is sectioned into logical driver under drivers/gpu/host1x and
> physical driver under drivers/host1x/hw. The physical driver is
> compiled with the hardware headers of the particular host1x version.
>=20
> The hardware units are described (briefly) in the Tegra2 TRM. Wiki
> page https://gitorious.org/linux-tegra-drm/pages/Host1xIntroduction
> also contains a short description of the functionality.
>=20
> The patch set merges tegradrm into host1x and adds 2D driver, which
> uses host1x channels and sync points. The patch set also adds user
> space API to tegradrm for accessing host1x and 2D.
>=20
> Terje Bergstrom (8):
>   gpu: host1x: Add host1x driver
>   gpu: host1x: Add syncpoint wait and interrupts
>   gpu: host1x: Add channel support
>   gpu: host1x: Add debug support
>   drm: tegra: Move drm to live under host1x
>   gpu: host1x: Remove second host1x driver
>   ARM: tegra: Add board data and 2D clocks
>   drm: tegra: Add gr2d device

Hi Terje,

Just by a quick glance this looks like we're getting closer. To make
reviewing easier, would you mind resending patches formatted with -M so
that git actually detects that tegra-drm was moved. That should make it
easy to see what exactly needed to be changed besides the relocation.

Thierry

--0lnxQi9hkpPO77W3
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQ9T6bAAoJEN0jrNd/PrOh4sMP/iagyjiN5VvzYSeKAvDTYIok
is5r907S2NLLt2sLEXlyw/QLW9tzoLqpyv5sZxxP8R8Fzc6T2yjf832cvvpn4jps
lqsqBP2da3wjB3Tyy5lPIQB2LLuw3ak7OceJoTHl8+0h0LObXGoPPNXRVr+TRe+V
2Eg0hB1PVTkfAO64pi2wNDaz5od1scobexNLjGVrIsDMdsjsnTyUkcJYo3CK1Ydk
Hj2Pm0HegA5xvtZBb5vdsMkAnr5WLyZKmpKfa1HNBlSImwuviF8ohPdPj2HCydoV
tqbN4cuEoKZQkfEA1t4cMebVqnsoIxga5P3DcoLcA4PpBS8sChk4/r0Jh8PGtjfw
NZ8Ww2JbRJUCOOfWRJGid2qoZ3uCj8zQDCn5U8mKdYxAUcRWRe+orTkJ0CmsBBCr
3cS7d8/sj6MNl/QsO7ottp+2qocev7DpBkkKUo+hQ/7sqb232AIOU1F7JjxLx9nZ
U8RXnOp7z1BZ6ws9yTCvMFB+Phz4k9u3Px2ksE2eTJ5wRieOlR2dN7Ymiz1+BUtj
uHHcER6eUUKFzu84iQEvUn8sZ0p+zENhgtK8KzXwXCtnKJVc+ovgH8r80dGFbXfE
shG4ywcUX0i3lwTAU0JZv8bZnCI27KUT0XePeRYS2r1jfgY7u28FqlHKCd+Y2Lrh
runnrfwW3D2GL7euOwb5
=DsLU
-----END PGP SIGNATURE-----

--0lnxQi9hkpPO77W3--
