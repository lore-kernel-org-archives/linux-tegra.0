From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [tegrarcm PATCH 0/2] Add T132 support
Date: Wed, 11 Mar 2015 11:34:20 +0100
Message-ID: <20150311103418.GN19577@ulmo.nvidia.com>
References: <1421194802-28198-1-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BjavXC7V3ilNTWHC"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1421194802-28198-1-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--BjavXC7V3ilNTWHC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 13, 2015 at 04:20:00PM -0800, Jimmy Zhang wrote:
> Allen originally started T132 supporting patches under branch dev/amartin=
/t132-dev.
> Recently I added more changes on top of his works. Since Allen is tied wi=
th other
> project, I was assigned to update and upstream all Allen's patches as wel=
l as my
> changes.
>=20
> Allen Martin (2):
>   tegrarcm: Add Tegra132 support
>   tegrarcm: Add support for loading MTS

I think this is an unnatural ordering of the patches. MTS is required to
make Tegra132 work, so I think patch 2 should go first.

Thierry

--BjavXC7V3ilNTWHC
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVABoqAAoJEN0jrNd/PrOhvxcQAJ73usOnqFKHQcxauNiNQAB7
tqxc/jJUJiOeY5vMLgeIinD42BShzW4jH0V7Jp5SKiT9xqZX/jaA02905crWG+XG
R6nCebIiNRHy3I08l9kiGYfrkqE9aeza06z5np8zc9orpf5Hcuz0adj8ROOwMJYW
HZmepQ/gIUXPmHfnTGr2i0lWSRXYAMK/g1eaiDLMk/DHtzoshtZs5vlQozRCWu8X
CHHjhGeb41eL+TTfmfMG7Z2x3Ytxf348dO0Ep/0zYJ8RMmAN7A/hazlysz/pRh+5
zTwQ2vZfO3hneRcM5GUfIAQoNX+k+BMDemoLrzrU8CuwK/WakzJfdl02D8LDOW5A
cJAQL3zmyMxijvdxjbgSv93SAD3KnfCqHgm3p8yczA2eEFgIm52vr6mLWQimzL4y
yQcP/tRh7CFHnDPY5h4aPvCIWBHtErUoqz7CE5rEECExbWGwqv/OuWhccYJ/JPNE
DCnuG0qNDIWXqES/wElNySMsuhYjGr0dCjJy696eVSoASTKtvPjPE3tn9/nDopk3
Drk16+0Yclr/O7uLlET+GYBGpB2C4epebtJPiUC0nGX5efIzv6oNbeY//1oQyGsg
ii2LZnF6m/+c2gKaQwPgC3fVgjsN/U/yObGTHLnPk03no0UQeF76D525FYyCgTSM
EcRfuEDnD6hykHisPZs1
=k7D8
-----END PGP SIGNATURE-----

--BjavXC7V3ilNTWHC--
