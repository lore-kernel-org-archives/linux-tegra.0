From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v2 1/4] ARM: tegra: Add Avionic Design Tamonten support
Date: Tue, 18 Sep 2012 14:06:47 +0200
Message-ID: <20120918120647.GA24672@avionic-0098.mockup.avionic-design.de>
References: <1347959220-20166-1-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PEIAKu/WMn1b1Hv9"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1347959220-20166-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 18, 2012 at 11:06:57AM +0200, Thierry Reding wrote:
> The Tamonten is an NVIDIA Tegra2 based system-on-module (SOM) that is
> designed to cover a broad range of applications.
>=20
> Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> ---
>  arch/arm/boot/dts/tegra20-tamonten.dtsi | 421 ++++++++++++++++++++++++++=
++++++
>  1 file changed, 421 insertions(+)
>  create mode 100644 arch/arm/boot/dts/tegra20-tamonten.dtsi

Please ignore. The board DTS files are broken. They need to explicitly
list "nvidia,tegra20" in their compatible property in order to match
Tegra20 support. I've resent.

Thierry

--PEIAKu/WMn1b1Hv9
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQWGPXAAoJEN0jrNd/PrOhvqoQAL8xY/0UQ9FAPFwd9zo//nsE
dFwr783mDB95MeDmVMHcEdKuppfRiMWE/HvcZ272v9nEeKLSmXZ6kGbu7grodfvC
BkyoqZrSccZ1RkIjXUjDtzdKpZxoFKMCTRF72cvElNWCQ0L/4+42t/PCrnzyMckT
+ILyv2cv5rAGGieExro8d70E0OcxDRx1LI4/9tLYOJx85s2un+BMRO21p2PM8KGc
C8/Jz2AnXpPSEDxmzxz26HPtaO1r1u1Y8jKpe8f9xMyJqAg3pY35wQPteFleKqn5
//58Msvwke8qE8+QtdudyEE7FH7aAFdsh/8HMEGihX/PCPPmsnc4vVpStEhAG0qH
nff4b/1DhfWQzf/QeAT0HDYIn26xef/GH2NufyehslH22fnb+8reWlzCneBttvNi
aFFNfRKOZpyaUgIalVpJhokT/VDeP2ULV73AH3ZVH39c3zHaOX9DhNsZv1sxvqUB
16jniIvkpfqRYfl7AT4RvD0mJZxTaIYLfzb7p6XcnGyvp4TetAIHej9yLA+xjSOx
PgnR8fRDeSCzDjF+0YfG/EdKgT8p0VGY+6IgWdc7ipXxLUZIhh40fRf/1QpPkYDm
LEmlfm9cU8oH3GFxyQNAQB+KW6hog0F2JUJpoqnyQ5Kjj6TOSykTU9lNjlU9+sYd
Q7OncTPuzw8hH10tqlJW
=2A4M
-----END PGP SIGNATURE-----

--PEIAKu/WMn1b1Hv9--
