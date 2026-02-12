Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9994C92;
	Thu, 12 Feb 2026 14:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770907892; cv=none; b=KYOejBOijWzGXnIpky0fAgMP20eePesH+6XAAtSCnxNyzfuefdIFsTIs/dwIw2NzTuq+Bv4JgvIp8l3Dgt8wh6lHiYEX1fxT8iOha/0WW3A5BFVPkYdsAiNG+THtaalJGyVSCjNMu7WKn261O5jGHgdq8Yy15Q02xzWbXa5hNlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770907892; c=relaxed/simple;
	bh=pM+ZBj8nZh9g0uFqM8SzCpSYe+CFpO7ZaK1fqC0vN2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u6i3/+zxJUn97DFaxvXzxCuoeqW1O2edAU+WOAepUlb7XERgsD+uWTR8xHfMD11oKDXf1+ATza4/2w0OGJFC4DA+vjOs2+NW6Oj/VmT4hAFupWtv51gRS2jfyzlwWDQgBsYu6p9xGO6VzkfeWFMjDDtW0GYnyUUEo2XSfu236nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SsZRt9FG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SsZRt9FG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7322EC4CEF7;
	Thu, 12 Feb 2026 14:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770907891;
	bh=pM+ZBj8nZh9g0uFqM8SzCpSYe+CFpO7ZaK1fqC0vN2g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SsZRt9FGKIJy9cJ1wQWyR/28uRX1LANQWaZcQKBt7mk9BoRmGOMSuDWEyHEfbBbkA
	 NAg+s4IfzaIR/3yhHXy8/UUfmXcM+1j/HAVcgzU8WK57T8Aq869RnfbkudOvbMpJCb
	 h7PfzKfnF7TDSVbKHKCEZgKN7jQwXlHCdLyLzSfk1OioajwXZ2dJJVCAx/kljcxam4
	 qnmwQ++/Qm+yWyZanGeYtadTfgf55lCsylxDmLH4nAblqXNMcVwtZacqp9GpPSXLm8
	 hR1jVWwZ8O8Dvjg1UEydj6WvqCodQTzNW0FGr3Ccydfm+P5sVl2HrwCYzSsow/EyKH
	 Jvvs8MoxtAySA==
Date: Thu, 12 Feb 2026 15:51:29 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Maxime Ripard <mripard@redhat.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, 
	Mike Rapoport <rppt@kernel.org>, Sumit Garg <sumit.garg@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 07/10] arm64: tegra: Add VPR placeholder node on
 Tegra234
Message-ID: <aY3oyMhkbxhgMbfi@orome>
References: <20260122161009.3865888-1-thierry.reding@kernel.org>
 <20260122161009.3865888-8-thierry.reding@kernel.org>
 <20260123-slim-seal-of-luxury-bdb58b@houat>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="m5e6dmw2rrzidhli"
Content-Disposition: inline
In-Reply-To: <20260123-slim-seal-of-luxury-bdb58b@houat>


--m5e6dmw2rrzidhli
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 07/10] arm64: tegra: Add VPR placeholder node on
 Tegra234
MIME-Version: 1.0

On Fri, Jan 23, 2026 at 02:28:50PM +0100, Maxime Ripard wrote:
> On Thu, Jan 22, 2026 at 05:10:06PM +0100, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > This node contains two sets of properties, one for the case where the
> > VPR is resizable (in which case the VPR region will be dynamically
> > allocated at boot time) and another case where the VPR is fixed in size
> > and initialized by early firmware.
> >=20
> > The firmware running on the device is responsible for updating the node
> > with the real physical address for the fixed VPR case and remove the
> > properties needed only for resizable VPR. Similarly, if the VPR is
> > resizable, the firmware should remove the "reg" property since it is no
> > longer needed.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  arch/arm64/boot/dts/nvidia/tegra234.dtsi | 34 ++++++++++++++++++++++++
> >  1 file changed, 34 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot=
/dts/nvidia/tegra234.dtsi
> > index 850c473235e3..62a5dfde9e38 100644
> > --- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> > +++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> > @@ -29,6 +29,40 @@ aliases {
> >  		i2c8 =3D &dp_aux_ch3_i2c;
> >  	};
> > =20
> > +	reserved-memory {
> > +		#address-cells =3D <2>;
> > +		#size-cells =3D <2>;
> > +		ranges;
> > +
> > +		vpr: video-protection-region@0 {
> > +			compatible =3D "nvidia,tegra-video-protection-region";
>=20
> The heap name doesn't follow the documented convention, see
> https://docs.kernel.org/userspace-api/dma-buf-heaps.html#naming-convention

I could change this to protected@0, which would make the name of the
exported heap "protected".

Thierry

--m5e6dmw2rrzidhli
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmmN6PEACgkQ3SOs138+
s6E1XxAAmwl7hhPeCdqx1mcrn7uzeLWV1oZBmlvYPVr+MM8LEkJAxxK4xle8BSau
c4DKNkwInqzqBz1HcZZ8CnubRENXfhhCQNsoJmGAnkt2fzjrkN5kJoUwMjxS8/jF
5c/J+g5k7X+JFnTW1IjI0bVFTlmYd+0rA2Vxfk3KwQI/mmEuReTC4UikaeMSvGS3
a08c0pw5Hd7018tbuPxVNFEfj5xnhJLycb/ZHwwSYGlmP1iZf3lzponRBpx2V5hI
BHbs8EFDYfnHNT6sK4zcXVDhD2+3gX+7J5xP/HUV2XQjWjAyqAcse4BGCt7tixKK
4id8MbZ8315lGMpXEzg0G3Rd2E0p9+qvhIFhd3HbinTPBZtV56c8fhgQNfUF6sfc
0w+FofsSyBVJuO37FYSKHq3iY7sGJ9zCG3txXcQsdmOqQhBFDU1ap3T0FXoq7OVA
jGlq/wkUoyH/2HtZbz7wGer7RqDuaFPosR32jB2SmfNY9P8OBF8IlWaH0SLFS9gE
oH9HoR3ZgA8ND6Jrr0M+kUYhFsX5VYkuwA8/9MW6yngJtEEQh3/lvXoBdEEzPMK4
6rAi57CPu0ulNpkvjbiXOSR9vwZnlnIPnOK1ch0ikb/2JmyLZQZ62djjYggjBF5s
VYE0AphNbLhGg0crZ9y0O+yPxMU0gBQ8vlD1ZYvr2wi2SgKr494=
=aSiq
-----END PGP SIGNATURE-----

--m5e6dmw2rrzidhli--
