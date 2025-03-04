Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBEB1F55ED;
	Tue,  4 Mar 2025 08:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741075495; cv=none; b=Kx5wzJ1mcOauMiMZUaCHeo0yYVuopk6HNlV8IdTtWLH8eonHvIEtZEQLjKnkSpoB6yc/Ibfs/RKG/URdW2wq+8si8FOePDBq9pxlOau+SIs0uhMGtSen3VpuFiytmiM/atHQglbjQSpnpNerK9V4CVT+IRv01157h6WlncjCniA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741075495; c=relaxed/simple;
	bh=vIjLPcUzgSKENXMFoyq8MSR3rL6XCeonIPvrarBTHfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B3U28mQepnDeUKBZ3n6NMOTj1oq13K3Ud7oOpW42XburH4dZohnZurfBb24PF2hIqk3KcLpSJpsARfjv8Uq0j0wDklZMadRDHcbwIBaIV+cTjwdWnR9jpKda7Fz9W+yXl5p/GZw/YVpUpIwHCcHe3LN3VSeuo2p7w3BGDx6jYKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MTMooLPO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MTMooLPO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DCBEC4CEE5;
	Tue,  4 Mar 2025 08:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741075492;
	bh=vIjLPcUzgSKENXMFoyq8MSR3rL6XCeonIPvrarBTHfI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MTMooLPO8Bbb2GKqdM1BuZCtLRVMLpPUiZewyqhTUOANTZEdA7zKLpNVpc2b4+pde
	 qLxD1GPfTrr2crKHjmFBRkbsQhLcZE/wIdMSn7xP+K7vJd7ZRJEAH9qDQUxuZcs5kx
	 PTy2NgT0nWNSVjrgvdi0A9uofQ0NxTbml1X58f1jrN3deGiad5mCcW/u5Oh/f1kNxH
	 WkgVk5ns/TvPqpAEbTVtWOTQmUYqzcBtq42vbowT/RyyDgHhCJdC0cKAvbzxnmEotI
	 4k4ylvc9gwaqMoZC+TRzV16b9VRVTbQY41zF+zC/l+py0e6GMwaWsk+QqwNP9zvG1O
	 WP0yWgzyy+/YA==
Date: Tue, 4 Mar 2025 09:04:50 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
	Joel Stanley <joel@jms.id.au>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
	Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>, 
	Xinwei Kong <kong.kongxinwei@hisilicon.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Marek Vasut <marex@denx.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Raphael Gallais-Pou <rgallaispou@gmail.com>, 
	Yannick Fertre <yannick.fertre@foss.st.com>, Philippe Cornu <philippe.cornu@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Alexey Brodkin <abrodkin@synopsys.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Jonathan Corbet <corbet@lwn.net>, linux-aspeed@lists.ozlabs.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH RESEND 07/12] drm/sti: move to
 devm_platform_ioremap_resource() usage
Message-ID: <20250304-astute-curvy-ladybug-f9ff15@houat>
References: <20250225-memory-drm-misc-next-v1-0-9d0e8761107a@redhat.com>
 <20250225-memory-drm-misc-next-v1-7-9d0e8761107a@redhat.com>
 <24958ae8-6153-4798-abeb-e770d66ca8e4@foss.st.com>
 <CAN9Xe3Q8=_Tz51i6gxNM6445p-rhNiK7B5Ljcga8g_Nn676dCQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="3cvx2hh6lak7gb3g"
Content-Disposition: inline
In-Reply-To: <CAN9Xe3Q8=_Tz51i6gxNM6445p-rhNiK7B5Ljcga8g_Nn676dCQ@mail.gmail.com>


--3cvx2hh6lak7gb3g
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RESEND 07/12] drm/sti: move to
 devm_platform_ioremap_resource() usage
MIME-Version: 1.0

On Mon, Mar 03, 2025 at 12:29:19PM -0500, Anusha Srivatsa wrote:
> On Wed, Feb 26, 2025 at 5:19=E2=80=AFAM Raphael Gallais-Pou <
> raphael.gallais-pou@foss.st.com> wrote:
>=20
> >
> > On 2/25/25 23:20, Anusha Srivatsa wrote:
> > > Replace platform_get_resource/_byname + devm_ioremap
> > > with just devm_platform_ioremap_resource()
> > >
> > > Used Coccinelle to do this change. SmPl patch:
> > >
> > > @rule@
> > > identifier res;
> > > expression ioremap;
> > > identifier pdev;
> > > constant mem;
> > > expression name;
> > > @@
> > > -struct resource *res;
> > > ...
> > > -res =3D platform_get_resource_byname(pdev,mem,name);
> > > <...
> > > -if (!res) {
> > > -...
> > > -}
> > > ...>
> > > -ioremap =3D devm_ioremap(...);
> > > +ioremap =3D devm_platform_ioremap_resource_byname(pdev,name);
> > >
> > > and
> > > @rule_2@
> > > identifier res;
> > > expression ioremap;
> > > identifier pdev;
> > > @@
> > > -struct resource *res;
> > > ...
> > > -res =3D platform_get_resource(pdev,...);
> > > <...
> > > -if (!res) {
> > > -...
> > > -}
> > > ...>
> > > -ioremap =3D devm_ioremap(...);
> > > +ioremap =3D devm_platform_ioremap_resource(pdev,0);
> > >
> > > v2: Fix compilation error.
> >
> >
> > Hi Anusha,
> >
> >
> > You did not take into account my comment regarding the changelog. :-)
> >
> > https://www.kernel.org/doc/html/latest/process/submitting-patches.html#=
commentary
> >
> > While the commit summary do not specify the version, this changelog
> > suggests
> > that the version of your series as been incremented.
> > If this is a v2, then a version descriptor should be applied to the
> > patchset.
> >
> > https://www.kernel.org/doc/html/latest/process/submitting-patches.html#=
subject-line
> >
> > Hi  Raphael,
>=20
> That is correct. While this patch is a v2, there is another patch or two =
in
> the same series that is on v4 when it got acked and reviewed. Having
> patches belonging to the same series with different version prefixes seem=
ed
> odd when I sent the series. Hence added what exactly changed in the commit
> log.

This breaks a lot of tools though. If your series changes, you need to
increase the version number, no matter how small or insignificant it
changed compared to the previous one. resend is only meant to be used
when you send the exact same series.

Maxime

--3cvx2hh6lak7gb3g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ8a0GwAKCRAnX84Zoj2+
dvPAAX0T6CB5j6he9IlacsjKLYZXt0M1IhAKVugJHAC1WHuswlCAJSgEyELEpzS1
ddcuQ7kBf3wXscEAe3lhr3vk0F2KVEj4r8JtBnUwxNM0o1E63auMQV7dNPG5Z5Ku
4gxKbq/wJQ==
=hPVI
-----END PGP SIGNATURE-----

--3cvx2hh6lak7gb3g--
