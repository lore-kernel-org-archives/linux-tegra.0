From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv4 2/4] ARM: tegra: add CEC support to tegra124.dtsi
Date: Thu, 19 Oct 2017 11:23:15 +0200
Message-ID: <20171019092315.GE9005@ulmo>
References: <20170911122952.33980-1-hverkuil@xs4all.nl>
 <20170911122952.33980-3-hverkuil@xs4all.nl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4Epv4kl9IRBfg3rk"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170911122952.33980-3-hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--4Epv4kl9IRBfg3rk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 11, 2017 at 02:29:50PM +0200, Hans Verkuil wrote:
> From: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
>=20
> Add support for the Tegra CEC IP to tegra124.dtsi and enable it on the
> Jetson TK1.
>=20
> Signed-off-by: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/tegra124-jetson-tk1.dts |  4 ++++
>  arch/arm/boot/dts/tegra124.dtsi           | 12 +++++++++++-
>  2 files changed, 15 insertions(+), 1 deletion(-)

I prefer SoC and board changes to be split into separate patches. I've
done that with this patch while applying.

Thanks,
Thierry

--4Epv4kl9IRBfg3rk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlnobwMACgkQ3SOs138+
s6Hvkg/9E5EJQszegpVwxmrEQoSTR8EHfeMqz55S175h5g6oN3jxBP0cU4/hqyVV
01Q4i3UFR17OY8OKMzcogE3K7sWUZ8BkWibJcst2quy7/tR8pl/LbrKb+yRmmV+h
XEWuS8zcaErSspV10s5mgFkuadNwZ8y/mHhqXPB7StCwvgxqf3jy0hi59DOv2zeN
kYneC70IEEIiNVS/ETGLVU+3Ov4mi7wt/5f4acd6z30oeuWbj0vkLLMImFBnKcy2
tDtIh2jAWxk8O/E6uREQ3I6i8TiiBhvVHORf0xBexbLtyNL65ZnR1902iWZJly5u
Aq9NQ1EdvYprogKz3QZd9I4wNn/nwi0NbffkW60oWXMGqKc0CbxFWiKxnMGp5D6b
WVAUdjGFipsrxaMFoQm9PTcoXdqtF5a5iXv6zMuyTPAW/+SqiLShLWSYkDKe0w/O
JyYN45gYV/E0G+ZobBFJkUBU5JwQZjh3EAvPFrI/+ZOhNm6/fKvPVlQpGrjGoq2K
0YeVI2AA+umoTi08bIk5okUPskR+wJYveCFk9/H+Q1NjDTSqOITjNqrAMHl7rxdj
UMEwwGE4E/QI/SNJRVfVWLjPKiHUicW4kZ/ih6pDw0gxhM373fdxKSBr35zSuKQz
PQ1Fe+7CUMwkDbuWejXmyeruf1m3+nJB4TFgM0JiIA8sdczrS2U=
=7DH/
-----END PGP SIGNATURE-----

--4Epv4kl9IRBfg3rk--
