From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/2] arm: dts: tegra124: Add APB_MISC_GP as a mipi pad
 control bank
Date: Fri, 7 Nov 2014 13:35:14 +0100
Message-ID: <20141107123511.GB11084@ulmo.nvidia.com>
References: <54088B53.6040802@wwwdotorg.org>
 <1410292726-9179-1-git-send-email-seanpaul@chromium.org>
 <1410292726-9179-2-git-send-email-seanpaul@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FkmkrVfFsRoUs1wW"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1410292726-9179-2-git-send-email-seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, davidriley-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--FkmkrVfFsRoUs1wW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 09, 2014 at 03:58:46PM -0400, Sean Paul wrote:
> This patch adds the APB_MISC_GP_MIPI_PAD_CTRL_0 as a pinctrl
> bank so the new mipi pad control group can be muxed between CSI
> and DSI_B.
>=20
> Signed-off-by: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
> Changes in v2:
> 	- Added patch
>=20
> Changes in v3:
> 	- Changed comment
>=20
>  arch/arm/boot/dts/tegra124.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to the for-3.19/dt branch.

Thierry

--FkmkrVfFsRoUs1wW
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUXLx/AAoJEN0jrNd/PrOhaE8P/3qPPFGvIGyXRcnRhdasnwPZ
5JjWcDAn/Wdlm5NALUut3MCuogF8xZwbFbggSTOfnfjMrMu/PFZB8yYVN5NcIvmS
uuFUg7v+Ch97o3MTEqEPOWHZjzk7K/V6vq3jhM6FXxW594RLtW1VwDd3inRdy7ex
Xw5+0iYC+taDMrPg8fQC3cZuFL72iGhjqGZCQXAHhJ0Jfi9aIG3LUAaTT+ABPtEr
XFxOgX7Choirj96MD+N7aEngHEUHca4PGsb+41yQDLqvjozBVhVDaKdK6JLsKefb
Mtyrh2R3bi1dVvMIB8LHHRQjqn6AO5/Fp0kQlYSTfUsUWA/7F8bmnphZJKAE4uT7
p4a4WA9YajXf+OaEj0IIKoauk8v2g+r32XSy8EvaSZgd81yFrgRZSj0HGQ9bLmfH
9UIe4NmVivQxiPYQfxw5QO3e2eulImzlXr5OFdtN/nagSrXPJaE8pRI58m5sLzcS
8KbPzV7N415Ob1vFdmzSuj+RsJSaPi4vLwIOxK7aHQX6gVM2qlZIb519flIUSxNV
7QokgjrBu1XuRt2XGtGiPK/kEZhThvUuIE1QW5Qn56dMay6UUDdfWTAZliRse/9S
GJunD0aRCBtzxe3C6l+NZ5JuNn+4tlesQL/1KOqjPE9xIux3hVS+2S3RRR1LykOH
JVigyqc/BrWWk7ScMliu
=jTX8
-----END PGP SIGNATURE-----

--FkmkrVfFsRoUs1wW--
