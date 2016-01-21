From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V3 00/11] Add T210 support in Tegra soctherm
Date: Thu, 21 Jan 2016 15:56:57 +0100
Message-ID: <20160121145657.GF32301@ulmo>
References: <1453111356-12298-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xaMk4Io5JJdpkLEb"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1453111356-12298-1-git-send-email-wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, MLongnecker-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, mikko.perttunen-/1wQRMveznE@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--xaMk4Io5JJdpkLEb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 18, 2016 at 06:02:25PM +0800, Wei Ni wrote:
> This patchset adds following functions for tegra_soctherm driver:
> 1. add T210 support.
> 2. export debugfs to show some registers.
> 3. add thermtrip funciton.
> 4. add suspend/resume function.
>=20
> The V1 serial is in:
> http://www.spinics.net/lists/linux-tegra/msg24808.html
> The V2 serial is in:
> http://www.spinics.net/lists/linux-tegra/msg24901.html
>=20
> Main changes from V2:
> 1. Fix build error in patch [1/11].
> 2. Use of_get_child_by_name instead of of_find_node_by_name in patch [8/1=
1].
> 3. Use debugfs_remove_recursive to remove debugfs in patch [6/11].
>=20
> Main changes from V1:
> 1. Use the new type to handl different Tegra chips in one driver,
> which suggested by Thierry.
> 2. Changes per Thieery's other comments.
>=20
> Wei Ni (11):
>   thermal: tegra: move tegra thermal files into tegra directory
>   thermal: tegra: combine sensor group-related data
>   thermal: tegra: get rid of PDIV/HOTSPOT hack
>   thermal: tegra: split tegra_soctherm driver
>   thermal: tegra: add T210-specific SOC_THERM driver
>   thermal: tegra: add a debugfs to show registers
>   of: Add bindings of hw-trips for soctherm
>   thermal: tegra: add thermtrip function
>   thermal: tegra: add PM support
>   arm64: tegra: add soctherm node for Tegra210
>   ARM: tegra: set hw trips for Tegra124

Hi Wei,

This series looks mostly good to me. I've commented on a couple of minor
things as replies to the individual patches.

On a higher level, what's the test procedure that we can use to validate
that this code works?

Thierry

--xaMk4Io5JJdpkLEb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWoPG5AAoJEN0jrNd/PrOhx3IP/1CLNjmq6G1K/Sc8jfms8Zgs
fQfWtiBWIpkfKh4H4twd/S4c3j+QbtGPsXscoTiX1eqH/6kEtB13cjxyddWvaZ2A
Pqtn2As0XZsp6PUi/WX/+F9OKUSPSwAYFohddCLzK5DB85/1DtHZ8yNhT2Lv5CQM
N9Y7ehcrNgxiJB+UWW6NKQP9GdnUfMsr8uUjVkEPVetRU3NShs0ErCJXGAj8lqIj
CtRfTOgxaGjLmaD9bHIypHbeLbPoxRm/h3GQkgeDBLNgnZ53tQLf64F6xhSjaYP5
sTyjZs46vtx0Hm2d/MunmKZFeKTgX48hRd4daMuwauBKXq0mfqeKznxWRUvGfHc8
9b3yCAxBvNkeIhba+AVNkMOX+iRY3THplWCwFsq48FjoWdlV1eZLSguC/T4Jc79w
1/VfkCBfw5Cu74bg1cEtA7B4RnAdn6LtkneOrVq1C1l9yMQe1rZlW4ziVUicw7P2
hhPUWivEH8QQ4rVo0HKwz3r+fbopDwfylPYymylSNSyjfKlYXjoLVw8lwmfOk9la
x5fq4MPASSWDG8HO75PHHpYKhFGrj+b7NhTXdN9ta3P0bzkmboJ07gA4jOX+WXq+
9LvoE5/lXiNGsqu+wUiRJbBcxYY6eVu6qLJP+TlPeO1264XIRJubbYJXR/13jyDz
MV8bLvrLSFUYDWWXrs9E
=PH4m
-----END PGP SIGNATURE-----

--xaMk4Io5JJdpkLEb--
