Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA2722F388;
	Fri, 18 Sep 2026 12:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789736014; cv=none; b=cMxWjEBB0EUpeM0PgDTTt5A+D8Y0Ekbc8P6xl2GiGaR/ZwVV1jAz9yGIbymISxDXcR/Exm0zRBJ3FJNyyIT4Vw2yTr3YsQYyptvm0icp8gkHM8Qpa5GocCHk4SIMy0+VP78z9Yn2nKpwXTdQSq7e7nY4Nt2pJle4o2eM94w9eL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789736014; c=relaxed/simple;
	bh=risxQsuL9nkqij81NcHDlswXGlnLKNCpTz0RmPokCBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lMZ3S2CMLm4p35LABNC0UAu/GrI3ablSNZMsLmSHthuxH2yfNwz/zn6XIXA+qFnwcr1njX57EgHQ0BHUBZdeEvr55yB/Q1ojL2d8wtTmDUj+oyQQQVH54RWV5/govP+kKq+fPuDHp4FXkPF++R7iFN/mJZ4Kp11Ny68A1PkgG24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CuplAGqV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CuplAGqV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EE3A1F000FF;
	Fri, 18 Sep 2026 12:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789736013;
	bh=AhbCvqkLOCxtGzOowJm4ZGkHasZqPYRgd2nxTv+Iq1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CuplAGqVtJZdmud8CyZGNsl/qs2GWmdR6czxDZ2jw0vwGg/ayErIbymm+Ry13KAGo
	 suIRlrFmSSVNQeqx2BA1psr5xa6dWq6tksDkglD0i5/iGbQbZHLrQOvqLYK9S/lsGq
	 d9N9Lx84bgL9Vt3Hi1NeWyot0F/mXX1NjyALsHvud7ls2nGbgbn9K086rBHa1E3QUz
	 xGbn0i6EvsZPan0Sta2UfkhAL70x+h6mPv/24+mQ38z+w8HznjIB/Xt/4OZsU01on5
	 e5E8GuePKMouhslFmufgVyKMyN1SdL85j56/5ZSM6ULl/J9cTte8sy8ZvPNqymOSTi
	 bz5HAbXOQwIog==
Date: Fri, 18 Sep 2026 14:53:31 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jacopo Mondi <jacopo@jmondi.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Jimmy Su <jimmy.su@intel.com>, 
	Matthias Fend <matthias.fend@emfend.at>, Mikhail Rudenko <mike.rudenko@gmail.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Michael Riesch <michael.riesch@collabora.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Paul Elder <paul.elder@ideasonboard.com>, Martin Kepplinger <martin.kepplinger@puri.sm>, 
	Quentin Schulz <quentin.schulz@theobroma-systems.com>, Tommaso Merciai <tomm.merciai@gmail.com>, 
	Svyatoslav Ryhel <clamor95@gmail.com>, Richard Acayan <mailingradian@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux@ew.tq-group.com, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH v6 2/6] arm64: dts: qcom: Convert to new media
 orientation definitions
Message-ID: <aq00O6B6a97-U1zq@orome>
References: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com>
 <20260918-kbingham-orientation-v6-2-5e8b1f01be29@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ubntogsuc7im7b3l"
Content-Disposition: inline
In-Reply-To: <20260918-kbingham-orientation-v6-2-5e8b1f01be29@ideasonboard.com>


--ubntogsuc7im7b3l
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 2/6] arm64: dts: qcom: Convert to new media
 orientation definitions
MIME-Version: 1.0

On Fri, Sep 18, 2026 at 11:44:14AM +0100, Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>=20
> The orientation property for video interface devices now has definitions
> to prevent hardcoded integer values for the enum options.
>=20
> Update the users throughout the qualcomm device trees to use the new
> definitions.
>=20
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts         | 3 ++-
>  arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 3 ++-
>  arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi         | 3 ++-
>  3 files changed, 6 insertions(+), 3 deletions(-)

With or without the extra hunk:

Reviewed-by: Thierry Reding <treding@nvidia.com>

--ubntogsuc7im7b3l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmqtNEoACgkQ3SOs138+
s6GLNA//fHK7Y+AcCJBPVlFMVGbPQEPy6hKVsG38sPnye/va/IBn/nm0LH7cp9t/
ba0iH5ljhyqOnElNahajerFyiCYFTF4Ec8ZUMb9rmM8aHeBNzNRxIGZjUhh58HOi
MPftYh+LbMdliAuPfCEaa5ncdmF2K/DbD4MQmYq0J+YULJoQ8dC7IuXBBd8E3gdE
KrfpxbVQVDSr3Sc8e9D8UFnA4Wt1GyE6UKthfdH3o8H5/CTRkBonBAz55bkEYIlK
KrKP3g0f8490YgANlSTDWvEz1DIz2oXhmMnoQRQy5M8zAubwj3GeIy1NeiM9liGp
bGUmtparCp1u9Cn9hrTA2AlXztOhWyGuPyVX5LMJH8cHX/Nuv4eKB3gBfapTr3bG
jcKZQggT/itoT8CYm9YEynf/7+yxi8GZjA760Ok9b1Ffqc2gzbGjb/0rm1312wM3
m402Ewgs7caQZMTfLkN+m4okE9lXyrspzRtEqEdhg2tI/Dw19vMPclLnH649xlBi
+IlEQf1iE8GN8/rKps49s8IQg5H01w8YnZLl+/E3/ZdZUu/wvBQLka05RkAEARq1
RkiwqQFUSd0meo+yni1Knh4nwCB4JPSHVNRs0IOCg5lv1hK16zh/NbeWySRW+hQK
kzdyL4SbmI18Gj82ytYE7DgqdfogX3H+zmf8gSTdgqeT3xLOoIY=
=czZS
-----END PGP SIGNATURE-----

--ubntogsuc7im7b3l--
