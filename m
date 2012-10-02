From: Thierry Reding <thierry.reding@avionic-design.de>
Subject: Re: [PATCH 1/2] ARM: tegra: fix invalid unit-address in tegra*.dtsi
Date: Tue, 2 Oct 2012 22:03:11 +0200
Message-ID: <20121002200311.GB31363@avionic-0098.mockup.avionic-design.de>
References: <1349205048-22228-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2887652278998058312=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1349205048-22228-1-git-send-email-swarren@wwwdotorg.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-tegra@vger.kernel.org, arm@kernel.org, Stephen Warren <swarren@nvidia.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============2887652278998058312==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GID0FwUMdk1T2AWN"
Content-Disposition: inline


--GID0FwUMdk1T2AWN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 02, 2012 at 01:10:47PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren@nvidia.com>
>=20
> Unit addresses, whilst written in hex, don't contain a 0x prefix.
>=20
> Signed-off-by: Stephen Warren <swarren@nvidia.com>
> ---
> A couple of small cleanups/tweaks for 3.7 if possible.
>=20
>  arch/arm/boot/dts/tegra20-seaboard.dts |    2 +-
>  arch/arm/boot/dts/tegra20.dtsi         |    4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Both patches,

Reviewed-by: Thierry Reding <thierry.reding@avionic-design.de>

--GID0FwUMdk1T2AWN
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQa0h/AAoJEN0jrNd/PrOhpo8P/3Mdo4C27uLQVgfp0TJK7Wa0
SMYG7DESb8UtszRiUOv1UIPZrRxaK7VGtOJ8lDWRLcCb5CZ+buMdIainLtHSp3+F
H4HmS+vBudA+fZzAVcbqTNFV2x6cpVb3rhG0zt0hP1WlgW3mIJMXMbO3gJINiQoK
OYYijAlfHi7K8dr3Y5QkqT8IN9dWGt1AK78LNPEXqB43wCl+keBi70CrNih03Bid
L0XNGdwzWrWHiK+p8bez6EbEMWVFIwt8ziFyuvptHOG1owh/e6SgEm+EEc+OoweO
pyvE7QDi49PyGfbVPkjxCWC0OXLx+fY7ppxu+x3gp/HpKMLCntA8kqFRcNGTcTRa
S832KR7idx2KzYkm4ctFVeYiNIlteKtO27lAU8zu5hBueypITSC/bbl3u+fTtS08
wDvgYIes6W8AQ6WsejjjP9uWlFM7zD4TYapajqYulisRvKbDqMfYCvyIZk+8gtO4
J7r0OtGZMcddwFcMhYAi70a4wKlq7bsR06CUzJf5Udyg96QYmLQuL3/34fP4Skui
rtL2e345ZHDkHTCPchx1JK4hJlOVLrm0CVYxsg5ya8UX0dgUWkoVlmfESYr35KjI
A5tPuEJFRWQka4v6SSFtqoZXIQGTLlIxsQleYleSRkbk8nOffY8+H/8IgcSYV6jL
sZNx5SnzCir82NdQQ0Vy
=WKt9
-----END PGP SIGNATURE-----

--GID0FwUMdk1T2AWN--


--===============2887652278998058312==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2887652278998058312==--
