From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/4] ARM: tegra: add APB DMA controller to Tegra124 DT
Date: Fri, 29 Nov 2013 16:59:59 +0100
Message-ID: <20131129155958.GR9712@ulmo.nvidia.com>
References: <1385419160-11511-1-git-send-email-swarren@wwwdotorg.org>
 <1385419160-11511-2-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JKGvNdIvrY8Ovf7Z"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1385419160-11511-2-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--JKGvNdIvrY8Ovf7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 25, 2013 at 03:39:18PM -0700, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Instantiate the APB DMA controller in the Tegra124 DT, and add all
> DMA-related properties to other DT nodes that rely on (reference) the
> DMA controller's node.
>=20
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/tegra124.dtsi | 51 +++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 51 insertions(+)

Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--JKGvNdIvrY8Ovf7Z
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSmLn+AAoJEN0jrNd/PrOhGMoP/0pHA6M3hZkh31NxP8fyddKM
EzEcxQuvXp+4QQsSgqaDmcKchvrXynWpgL85VGcO3mP43XKTkGzG+O8zyjMr3l4S
RN5GI233fEO36uJt6ukgBAyc0l51hw053jWV5kRaZ0OlVqo8M0pm/NA3H5uc1pER
WvD7NHtDuwgRwwQb4BR0coAb+9MK5c+qoIxFK6cujHzejNWiwGGQD5gfw1p7/WD3
LVL42Wi1a+QBuj7b7jKgr1SYmoGUXuIytsPqBjEtRYuZu4QChr66rSGJZAgsYJC/
NUM8xIkfrnwUEN2+0mOBR9YkyNiH8kbmCKKfSan4dlTy5bggEUAlF3EPfrtFujzn
0kcDGuLJ4I/QorVv8vpHzqkwhAREC7fbNILIqWvxq4fWn73IG9R985zLTho7mHMI
sqlJnKS1guVP8HTtnjyNE8LOjrTxKC+l1caBeG8qTu7DQak55pB340zPKYB39B72
AG9PCGCPGszxQUxrxMOaJQD/5yD+7T2sgTGNB0HT1fzZf/tADWlkU+h7go7pekgB
Ei5vmV8D0Kl++M+WPmWhWVLJhlJeaXSEGxyJPIN1dq6xOCNNnd2TgJ1XTwp+wLwG
tLEMXl/+9umlbH9hQVjE8/5io7GVaUfhIc0z1lFwmnvFK0UrOab+QC0f0Der5i7T
UYn2mL+7xx0gHonMPiHr
=/NSw
-----END PGP SIGNATURE-----

--JKGvNdIvrY8Ovf7Z--
