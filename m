Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20573D1CC1;
	Wed, 25 Mar 2026 12:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774443512; cv=none; b=IaQp9xroNjbREykYk+md/hZsooy4ldDryHnIymywFrJtg/IYEHOyt+PrK47DMB3ibeQpvuO9Jjdv5cV+5uUamJogVlzUAJtyAGIBNba9WlABFA5A4oXJh7k8a2aZdCxw6533m0KaE3qFXVWAP3oh+lGzgR7mwZcFXKc0yJxxrGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774443512; c=relaxed/simple;
	bh=hD3wT6tjlm0FZ6f+/aByElhT2FOrNCcYidkpV2qsHBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E+NlKeZ/mUeM1S4LvD01amlbH/RpC3NpCALJOu5wSwv63fjFrDwz97eEXSpaSkhAOlTdpnIsaB9hGa5S3bkD5c1tSMzvyQiFBR7AfMAyGkgcKO0jPGBQ+DDfytnORrb5lxCEj1AwgGRWKOTamw9wK5j4cUhb3zcWtylngn1FWww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KQxlz/Ib; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KQxlz/Ib"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB66CC4CEF7;
	Wed, 25 Mar 2026 12:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774443511;
	bh=hD3wT6tjlm0FZ6f+/aByElhT2FOrNCcYidkpV2qsHBs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KQxlz/IbSNGwOhT3DzvNOsfSEQt1Trr9V3reVh+TiD37vnf2gsPnZRxjc2v9djimX
	 zMU/LDQbbDkjDlL6qlKPNDIpTVEWajhaKCtaaMMez7kvqueQMyFYqilRbGQNHKB92p
	 Fd7K1J5qCCKVIe6YoJWQXn52wFXY48TaxohXvkWJXvWKIp3tsqvytiHiIqpX+lBj5F
	 MNoqJFEtdc8Dy7VPxv+EHxlAy107SwOuVc0DolAaLp8AlE7A5qhSCc+G8+i/d55t/x
	 9dCdhpHlqW3zUNrXl1yb5bexHRAYRLUUkF1pGxT1tcWij9kpZxIDZAsIlPvTGL38kh
	 /vgu7BTL2ZPAQ==
Date: Wed, 25 Mar 2026 13:58:29 +0100
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
Message-ID: <acPX-clIX4UfBNdM@orome>
References: <20260319-nano-manatee-of-vastness-fbafa1@quoll>
 <20260319170929.14543-1-akhilrajeev@nvidia.com>
 <67165a1f-9fa3-4853-b530-b1f9d6e4c2cf@kernel.org>
 <acO4NKPDUayny-I4@orome>
 <6342b6fd-9802-49d9-a269-ecb3b70b4604@kernel.org>
 <ed3828b9-fd2d-46c1-b486-c5172f61eafa@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hzpx7zw374bolivb"
Content-Disposition: inline
In-Reply-To: <ed3828b9-fd2d-46c1-b486-c5172f61eafa@kernel.org>


--hzpx7zw374bolivb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 12/12] arm64: defconfig: Enable I3C and SPD5118 hwmon
MIME-Version: 1.0

On Wed, Mar 25, 2026 at 12:03:37PM +0100, Krzysztof Kozlowski wrote:
> On 25/03/2026 11:59, Krzysztof Kozlowski wrote:
> > On 25/03/2026 11:31, Thierry Reding wrote:
> >> On Thu, Mar 19, 2026 at 06:15:14PM +0100, Krzysztof Kozlowski wrote:
> >>> On 19/03/2026 18:09, Akhil R wrote:
> >>>> On Thu, 19 Mar 2026 10:40:34 +0100, Krzysztof Kozlowski wrote:
> >>>>> On Wed, Mar 18, 2026 at 10:57:25PM +0530, Akhil R wrote:
> >>>>>> Add I3C subsystem support, DesignWare I3C master controller, and
> >>>>>> SPD5118 hwmon sensor as modules to the defconfig.
> >>>>>
> >>>>> Why? If there is no user of that, why would we want it? Your commit=
 msg
> >>>>> should explain that.
> >>>>
> >>>> Ack. This is for Tegra410 which has a DesignWare I3C host controller.
> >>>> I will add this in the commit message.
> >>>
> >>> Board or products. Not SoCs.
> >>
> >> Is this a new requirement? I see a bit of both in defconfig changes.
> >=20
> > Almost every review from me has it for 2-3 years... And it is a known
>=20
> And I already explained this to *you* 3 years ago:
>=20
> https://lore.kernel.org/all/ac8f30a7-fc72-9a44-74b3-a69001bfdaaf@linaro.o=
rg/
>=20
> So how this could be a new requirement *now* if three years ago we had
> exactly same discussion.
>=20
> I understand question for the first time, but why this being brought up
> as "why is this a new thing" again?

I have to admit I did not remember what we discussed, so I had to go
read that exchange again. It sounds to me like we were not discussing
the specific issue of a missing description as to which particular
product needed this, but you were instead rejecting the idea of
enabling drivers that were not strictly necessary like those for PCI
devices because they were making your life more difficult by building
drivers by default that you were not interested in.

Here you're arguing that you want proof that this is going to be used
by some upstream-supported device, which are two different things,
because they might very well be drivers that you're not interested in
but end up building if documented properly.

So I find it a little hard to keep track of what is acceptable to you
and what isn't. Are you objecting to this on the grounds of it bloating
the kernel build or because you want documentation for what platforms a
driver is being used on?

Our action items will be different depending on what your answer is: if
you want documentation about what device this will be used for, we'll
get you that information. If your concern is that it bloats the build we
drop the patch and will have to ask users to build their own
configurations.

Maybe to avoid these kinds of discussions in the past you can write down
your rules about what should go into defconfig and what should not. And
maybe we can eventually find consensus and find something that people
can use as a reference.

Thierry

--hzpx7zw374bolivb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmnD2/EACgkQ3SOs138+
s6HyxhAAgO3a+brFWZ1VdK5cf0wxZ0BcT69+soJxbRUx0kW51Bpa+Rf32/sKJPyK
z5HNnVdrhbNVdh55vGKUfhGBbfckEIp3CimQG+thFA234k/0i+GuIVnNpYxUhupV
49TA0Oim0rIIXT+WE3YHwx00T6CGaAmTOard+7V3EmYPs2rIPuIHZrEMTKKUSoGd
jQzCMJjT0kcesHUFxkLmjU3ApA2jF3wBHqdnOcz8kheAM8LBfo1jlDKXrURntbP9
hLt5tYwnbcLJDYafFZvR69oW90oOCDaqUiwuA3ecuQb//S0TqVMXscZ2GMqJu8PQ
ydtsjoDdnu44/+40JG17MPZx3ecMbSEZWjii4wa8t9Hcg3IP9sk/JfZFBEer1pM4
ey5dm/EutJw5b5/R0qmIvpGtV4aOVkun90bXls7w6FiIcGdwLrEj/y6LGsTwxs8L
PuZfYe6xgyUYHfAyotPrsg0DM5JqMjr3q9qU87GOJYEMdua3Cx7U13nhfnnjiHKu
3cveaUieh8WWMmrcIzvHuheaihR/l3i7DieFK54bMtsI6EZc3qqIZtyyNN8cDzQL
p1b7fTASVX+HWr6UPqckgecKBW4mnhOA5gdyeOkwpHwdxJ8v0C+Mq3hdru1joH75
s9braB6OkIoSzucV628+rkPmpuqEVrsgwCMLGmJOkUMKg/wLZhE=
=M6Zu
-----END PGP SIGNATURE-----

--hzpx7zw374bolivb--
