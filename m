From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 0/9] ARM: Initial support for Tegra 114 SoC.
Date: Thu, 3 Jan 2013 22:00:36 +0100
Message-ID: <20130103210036.GA4412@avionic-0098.adnet.avionic-design.de>
References: <1355996654-6579-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6034515590075495471=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1355996654-6579-1-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, John Stultz <johnstul-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--===============6034515590075495471==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WIyZ46R2i8wDzkSu"
Content-Disposition: inline


--WIyZ46R2i8wDzkSu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 20, 2012 at 11:43:58AM +0200, Hiroshi Doyu wrote:
> Hi,
>=20
> This patchset adds initial support for the NVIDIA's new Tegra 114
> SoC (T114) based on the ARM Cortex-A15 MP. It has the minimal support
> to allow the kernel to boot up into shell console. This can be used as
> a basis for adding other device drivers for this SoC. Currently there
> are 2 evaluation boards available, "Dalmore" and "Pluto".
>=20
> This patchset is against Stephen Warren's linux-next_common branch:
>=20
>   git://nv-tegra.nvidia.com/user/swarren/linux-2.6 linux-next_common
>=20
> For those who want to try:
>=20
>   $ make ARCH=3Darm tegra_defconfig
>   $ scripts/config -e ARCH_TEGRA_114_SOC -d DRM -d SUSPEND \
>     	-d PM_RUNTIME -d CPU_FREQ -d CPU_IDLE

I wonder, what's the reason for disabling DRM? And while on the topic,
are there any plans to release a Tegra114 TRM?

Thierry

--WIyZ46R2i8wDzkSu
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQ5fF0AAoJEN0jrNd/PrOhVt4P/jph/maNKN2enADPkeBS9Imp
oKy0eZ3iMg8OcMakaAc44EK8qaQP9FRrITd/PJkUH/oeu5WefAPTG+unbH0mGu/m
Rhq5IP+SiqikqAXXMmvpI3K7xjkqVeUrNBRgBg7j9to0NB5SGsnE+Qp/d/dASjju
iMIViGq1eARAzXpdbo4IoUHuaeDJAbccOa6NPCfIvWGvPnpDNIQnYwOdUH6en9QP
KLX1JleuCGJKnpILM89EoCnfG6CT0AxqDh9EIXho1ZYdhZmfJTm5dgW4RvEz24GN
uKRBwrYrWfnFof0EtKkcL+qkIoCR9+cbxJqatbrSygli0j7+6hMCvz0mejKksBnT
b2GVESytQgYrgdHyRhtYYnKD3VGQ2Bp/rTlgV/OqPaJrdwpw2yyBAUHHn85kxc8p
5hHUHppBGa0JPm0hUazNjvhhCLjezRBG8IsV3BLEmzGvUk3QxLzn64k8tPbxnGGq
9vdpsz7YxA1hOEOeokmvpQYMOuUDUXTQX3jJoGwaWO3oJiM9AI4QavtjsVsqkp6n
cm1Lwvc4vUtfmhIyRxFISCVe544PoZi1Ag4PptZnLWyKqXCebZR+Bgv0/xOlbU2Y
nr8nA5nOPSTT1NktldWDXgps9vhvUxr/1czrFDoR0c4M4qwGY0p+eSpAdJpkT8g+
UpyanWjTqBeC212fabfS
=psOq
-----END PGP SIGNATURE-----

--WIyZ46R2i8wDzkSu--

--===============6034515590075495471==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============6034515590075495471==--
