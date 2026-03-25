Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F113CC9F8;
	Wed, 25 Mar 2026 12:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774442484; cv=none; b=VgnkvUKkTWLJik1+gFzNpzmVVyjkZcTIMHjksue/dUNQP2+2enWOEL5IaE9QNxRTpH8raa1lw1r7axHnxbKWjrZRwSP8tw9dNvrm6bU3x9JWWx8ouTA6HV5l1e5yS7g+/5tGzFGwZeVJcNEQ3S7e60n+4+mH2RPecUy5T5GilBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774442484; c=relaxed/simple;
	bh=GFTUx3kdhgQgTWvb7Q2fjG3wR+lIHMZ/P3hX/zvDfV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kKZyAyieiEnD4H1nsmririOHgS1g1m8ib1xpEImbYskky2kuyZ+7Dt34EQclRzI/0aY87xtR9xNhd+08KsGZUQaZMeLRA8pWOnhpAzn6pz69mLuw885MbshrTR1ERke1xxpKWcOzvTR3T5H2whHVq87grXNlzCidU7yy4ZCmhFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f16WpEVQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f16WpEVQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 857BAC4CEF7;
	Wed, 25 Mar 2026 12:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774442484;
	bh=GFTUx3kdhgQgTWvb7Q2fjG3wR+lIHMZ/P3hX/zvDfV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f16WpEVQ60zjYzS+sVNF502WXxMyeiBgyt2Q9wXCYo9w09DS/KwlV8lV3Cf4xrFU+
	 u8uOaH2kdR8bZKl/0Rdghb4RBSMZRM8peRogRgbvew+wRQqtN0NDo5JJsZvWGpg3Jd
	 y/O1waNE3BsFE7ij3l3/vw6aRmuRgWH24gY07DhtfoPvyWbZHCDrF0Fk6nF1ZhpcOP
	 qf1X6IRQeDhdCt29bG480HRF0fNhOKSOBFPbhZwHPydtDMEKGcBTXPv6FiSgrHp5+H
	 j+F76UZXDXTekW3r7AqjV6rmrODczfx9ulxNartk6tdcj1W86RiFzB5GDWcdWscD7t
	 rEGL/gaG0612Q==
Date: Wed, 25 Mar 2026 13:41:21 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Akhil R <akhilrajeev@nvidia.com>, Frank.Li@nxp.com, 
	acpica-devel@lists.linux.dev, alexandre.belloni@bootlin.com, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, ebiggers@kernel.org, fredrik.markstrom@est.tech, 
	jonathanh@nvidia.com, krzk+dt@kernel.org, lenb@kernel.org, linux-acpi@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux@roeck-us.net, miquel.raynal@bootlin.com, 
	p.zabel@pengutronix.de, rafael@kernel.org, robert.moore@intel.com, robh@kernel.org, 
	smangipudi@nvidia.com
Subject: Re: [PATCH 12/12] arm64: defconfig: Enable I3C and SPD5118 hwmon
Message-ID: <acPWvjCJ426AyIQh@orome>
References: <20260319-nano-manatee-of-vastness-fbafa1@quoll>
 <20260319170929.14543-1-akhilrajeev@nvidia.com>
 <67165a1f-9fa3-4853-b530-b1f9d6e4c2cf@kernel.org>
 <acO4NKPDUayny-I4@orome>
 <6342b6fd-9802-49d9-a269-ecb3b70b4604@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qna5mk7v3eomnmx3"
Content-Disposition: inline
In-Reply-To: <6342b6fd-9802-49d9-a269-ecb3b70b4604@kernel.org>


--qna5mk7v3eomnmx3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 12/12] arm64: defconfig: Enable I3C and SPD5118 hwmon
MIME-Version: 1.0

On Wed, Mar 25, 2026 at 11:59:36AM +0100, Krzysztof Kozlowski wrote:
> On 25/03/2026 11:31, Thierry Reding wrote:
> > On Thu, Mar 19, 2026 at 06:15:14PM +0100, Krzysztof Kozlowski wrote:
> >> On 19/03/2026 18:09, Akhil R wrote:
> >>> On Thu, 19 Mar 2026 10:40:34 +0100, Krzysztof Kozlowski wrote:
> >>>> On Wed, Mar 18, 2026 at 10:57:25PM +0530, Akhil R wrote:
> >>>>> Add I3C subsystem support, DesignWare I3C master controller, and
> >>>>> SPD5118 hwmon sensor as modules to the defconfig.
> >>>>
> >>>> Why? If there is no user of that, why would we want it? Your commit =
msg
> >>>> should explain that.
> >>>
> >>> Ack. This is for Tegra410 which has a DesignWare I3C host controller.
> >>> I will add this in the commit message.
> >>
> >> Board or products. Not SoCs.
> >=20
> > Is this a new requirement? I see a bit of both in defconfig changes.
>=20
> Almost every review from me has it for 2-3 years... And it is a known
> thing since always in a bit different wording: we do not care about
> downstream things and downstream products. defconfig does not serve
> downstream at all, makes no sense outside of our (upstream) work.

I don't understand why you're turning this into a downstream vs.
upstream discussion. This is all code that is being submitted upstream,
because we want these new platforms with I3C support enabled upstream.
It's as simple as that.

> > Some mention specific products, other mention SoCs. Does this
> > requirement apply to DT platforms or also ACPI platforms?
>=20
> Just like kernel, applies to all platforms, regardless of firmware
> interface.

Hm... again, I don't think there's every been a rule to the effect of
needing to specify a particular platform or product when adding a new
defconfig change. There's plenty of things that we're enabling in the
defconfigs because we think they are generally useful.

But alright, we'll either add more details to the commit message, or
drop this patch entirely.

Thierry

--qna5mk7v3eomnmx3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmnD1+4ACgkQ3SOs138+
s6FDCg//TEr1ZBNYM0xe8kwbmPyZIx3Vx3e28JVg+qyEspS58LsOeq9esxtRuXxS
nbLyK6ZR2UMQSz8flsE3eTLe6uX2nS4M2ulMPPhiGmS68FWBMX87sjcgm838wRCY
81kws1U2fMSmqX/4cPJ1GX+t0v5h33bMZR6NZnfQnuZA4XAUMpX8tc/yR1N7WkUM
xx8snURBoY1HEyabSqye0F1kwIwBP4uD0Lp+BLb3WTcLnRlTShkmUiYN5XoIaZAr
qqgERKNeG48lK8XB07DSNEi/vZF0SxMUvlv5xKZlK+G0m+Wdd8QaNrMqfZPQfvzk
mT/ixvLEwmWhI6TjzbNeAh84MZoCNm6M1/khnUfiwECVZbiRubyO1f2MDwCC/Vej
D8mZm0IKzSS1Nni8cccKarGjtf7AtziB6cTwmihlqpBvYCDMMtF/Pkz8JVX4rCSR
F3F/dwnFWLHfzn9XIz0YFPQyeXYOjI8GpwdcCAYUv86M1c+b8hp6W2CDwdVhZrX6
wcSAxuep2zqjuQ9qDMD+l2DHSuC4raYwmHR4SwkumNAUGumrOP5tGHpwPvcfzdBv
W1vEzFjECkS6NxWfDxLtF3NbjKPbQ8WZHoKMmC8vQW8p5fd0WKHOfJjYSx9HSaET
3Tk9L+O4ChP4yfX+vwPicJqk8Vo9yZUmeGXIN9hKUBBfYHR+tLQ=
=TaJr
-----END PGP SIGNATURE-----

--qna5mk7v3eomnmx3--
