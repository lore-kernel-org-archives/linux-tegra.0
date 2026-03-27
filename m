Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112A03DA7E0
	for <linux-tegra@vger.kernel.org>; Fri, 27 Mar 2026 14:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774620393; cv=none; b=OKVTbn9dK/dY2yjn4YMhxCHhbKZ6/wtY8T7P3pF5/0S0Uo83FlXzFaGOYOmtma+hPHSGgx/17LZ9VfTIrCqYybAX8QpOFwmw6HA1GDAWiIVREQGEG+svUZrn9mGjFzVncjWfl6hSKu2sC0976xnGuvQZ+DrPL0Qv9+FMP+lfUC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774620393; c=relaxed/simple;
	bh=YG4r2XuxApAYu6LKzoe/5SwvEPoyF1OnlWcoZM1u4mI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VS61hgfoQhcP7jFkVlHP/8ue2gdKbd70YfKEBCz1FtaZK31HCv7oSv/nNd38k64INAC83QkQGoXVDoeLeR5nqDyY/1xjvc0HATi69Ff6GL80g9SEjv40szAo+9s1PGvVaUAm/4V24fbzYNIZ68pf9r/QUQ44PxZyllyLscKx5bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XJUcqaIg; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XJUcqaIg"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43b5bded412so1571288f8f.0
        for <linux-tegra@vger.kernel.org>; Fri, 27 Mar 2026 07:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774620388; x=1775225188; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QSUpIlblw1Y8p0Flz+2ps8AGucj2y3pRw8IP0aJ+OJI=;
        b=XJUcqaIgL71hXD8t8lZL96lttY7Xmh42IwKc368lwUvYfz9XpYn8Jd5XpIJeKwnEFm
         e8eEcTukPFBgYursd0S1J82POhJmnJ07m/jPGknii0EALdeJQlpPYMXIfLBUfdubcFIj
         v4nhPm+AeCgHb3KWllGs2ESKnlm4tp179tr921TTeSCc5Hr9eH1DjvukiwNCzf51SLoW
         2MfPnhVEMpxMeVzt6APJbDIJZWCEvVK+wwNgO/1cEVZqpYH+ywjowG4JYq2Z2bxFnG7Z
         6+zTinJphliFafoczfxB7EX2oh7tPuziJouOa+myu0yHg/jtkwyYv4++V98M6PyOO+TI
         ywGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774620388; x=1775225188;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QSUpIlblw1Y8p0Flz+2ps8AGucj2y3pRw8IP0aJ+OJI=;
        b=AFRwhq4e6Xup7vBJCc6ZBZYSTDfdRgkg6dVcnsz+GYcPEejJn/qRBmw2R7ikyrD/kd
         t/YfJwtgaDepLdGMCCMlWYgXwPmH+bVWg3/c3Pe1biXJlOzMLm6cFBYfl6BGdrEP/ZVo
         F7ULE0QlKm6Bye6v4t2iN0WyKBADHPVEEXZNYvQdxA76+eLfVb1o2wZuufLQNv1loRLi
         UYzJZAY76ZxchlNdS4EenY+2lL6TF/FR8F+qqPVHuZhq+8vAS8jqqrxLIikH5e41A8nX
         eG7LAbLK8MpWb+m98HSZ2wczbinOk43M4XOtzU6dZIjmMNbW/YwYNGFx26kSsEfjFp6j
         SFCQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/jP/QFYXEhCHdEFVQHmz0kxHzuTcp9L1sTlksr5bjPE5gCXHJom3eVuqmqwv8jZq0A0LThzVNGwKoDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXfNbWDzqbklheJhbTlsmDJZ2PSseGXWnaJhF3Ynklqw3DM86K
	U11WjJboN8xaZX45jWem43uNx0Z0zzIk8CGtyuROmYTgr20+9DbcMuSn
X-Gm-Gg: ATEYQzxd5PXvZA3/KX/ImuEbyAt+tk0y/DDEex7W9owvk6L2tcTQ+fj0/qTmr77TdLO
	BNwHzLFVE0mv1aaM8dpeAfYfU0e2TViBHiuxxi5KKVHcUwxB+61b299/ZEj/CzOs9DRx3mfTWmh
	AhwfPx0ETiqKZbq7DFDRfR7u/cNrUa371Od1Wlc0RnGbmvQhMJi0oHXPCGI0uf3sTKex6ujIJlx
	oaYxIbKE8C2xk/cgqS1cmCPhBkPxSexUtf2EFclibQRmoCbmxeAVb0sX6WItwqO3i1ewGwEbu/Z
	c/EswPaRvlTiJjbPY8G5Uk7U0PhfTpJs2w4rMT0ZJCNV6zPY2hpk10GQIVk7EUFDQ5f8FvETqSc
	9oX4+tbbcU+1Ilk6sN599RlT+wbPu7c0xRCnYEZAAR0MF3zw8UGg+ASAc6dehK6J94rZVh43Ntp
	Wvyxdsm5x9w9DLjD1vc5Feb88EsCz3LTjCtiFVYoojlTMzsTsP9v0JMQ3UqKed+bylftLPnVHGB
	pNNStuvIBMLiA==
X-Received: by 2002:a05:6000:4212:b0:43b:95e9:413c with SMTP id ffacd0b85a97d-43b9ea6390fmr4110385f8f.44.1774620388098;
        Fri, 27 Mar 2026 07:06:28 -0700 (PDT)
Received: from orome (p200300e41f249a00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f24:9a00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e305sm16052576f8f.8.2026.03.27.07.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 07:06:26 -0700 (PDT)
Date: Fri, 27 Mar 2026 15:06:23 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: Thierry Reding <thierry.reding@kernel.org>, 
	Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, JC Kuo <jckuo@nvidia.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/6] usb: xhci: tegra: Remove redundant mutex when
 setting phy mode
Message-ID: <acaNBQkGgQ_N6Krh@orome>
References: <20260127-diogo-tegra_phy-v2-0-787b9eed3ed5@tecnico.ulisboa.pt>
 <20260127-diogo-tegra_phy-v2-2-787b9eed3ed5@tecnico.ulisboa.pt>
 <acJ50sQraVmy4zXs@orome>
 <00aeda7a-e5e5-4779-b212-6e56c2c5ec31@tecnico.ulisboa.pt>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ktw4w3vv6m4wgb3m"
Content-Disposition: inline
In-Reply-To: <00aeda7a-e5e5-4779-b212-6e56c2c5ec31@tecnico.ulisboa.pt>


--ktw4w3vv6m4wgb3m
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/6] usb: xhci: tegra: Remove redundant mutex when
 setting phy mode
MIME-Version: 1.0

On Thu, Mar 26, 2026 at 02:17:33PM +0000, Diogo Ivo wrote:
> Hello,
>=20
> On 3/24/26 11:48, Thierry Reding wrote:
> > On Tue, Jan 27, 2026 at 03:11:48PM +0000, Diogo Ivo wrote:
> > > As the PHY subsystem already synchronizes concurrent accesses to a PHY
> > > instance with a core-internal mutex remove the driver specific mutex
> > > synchronization.
> > >=20
> > > Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> > > ---
> > > v1->v2:
> > > - New patch
> > > ---
> > >   drivers/usb/host/xhci-tegra.c | 4 ----
> > >   1 file changed, 4 deletions(-)
> > >=20
> > > diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-te=
gra.c
> > > index 8b492871d21d..927861ca14f2 100644
> > > --- a/drivers/usb/host/xhci-tegra.c
> > > +++ b/drivers/usb/host/xhci-tegra.c
> > > @@ -1357,15 +1357,11 @@ static void tegra_xhci_id_work(struct work_st=
ruct *work)
> > >   	dev_dbg(tegra->dev, "host mode %s\n", str_on_off(tegra->host_mode)=
);
> > > -	mutex_lock(&tegra->lock);
> > > -
> > >   	if (tegra->host_mode)
> > >   		phy_set_mode_ext(phy, PHY_MODE_USB_OTG, USB_ROLE_HOST);
> > >   	else
> > >   		phy_set_mode_ext(phy, PHY_MODE_USB_OTG, USB_ROLE_NONE);
> > > -	mutex_unlock(&tegra->lock);
> > > -
> >=20
> > It looks to me like the mutex here is trying to protect against
> > tegra->host_mode changing while we're setting a different mode. That
> > doesn't seem to be taken care of by the PHY internal mutex.
>=20
> After taking another look at it I think I understand your point for the
> mutex, but in that case wouldn't it also need to be held in the writer
> of host_mode, tegra_xhci_id_notify()?

Yes, I think it probably would need to. I don't know how likely it is,
but I think the purpose of this is to protect against the ID notifier
firing quickly in succession. Although, given that this runs on a work
queue and work queue instances are non-reentrant to my knowledge, I
don't think we need the mutex here after all.

> This patch has been picked up as-is into usb-next so it would be nice to
> figure this out before it gets merged in the next merge window.

Given the above, I think it's fine. Maybe the commit message doesn't
give a correct reason for why we don't need the mutex, but the resulting
code looks like it should be fine regardless.

Thierry

--ktw4w3vv6m4wgb3m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmnGjtwACgkQ3SOs138+
s6Goig//SnPG7Rf8K0gKeOP5TZWyD90YKXfxg4roWTYyRNVHdUU2H14n31xJS1Oo
pMQvSFpK/kjChe09fFOUecq5vW68Rrfm2+Vi5rqfW+GHUlGo+5S70gJ8lbpV4wOh
Ee7fuEilJgSjIMVxxwQY6rupnrXIPufzsSHGwbtaSYy04ibP9vhDn2REJ0bkIuZc
AWzBBUQXf+aDMyKkliS5Ll15t54oQRdjZp/c02Zd1ffBX/6vx2/lx7hbSTBEm8mF
eTyQV9XU3so3X9+mmff5uYEOLkHOxEJgOOVdMW8XDrTTLqR+PgTJ44zoGcOnCrNk
2sOuA8ThjZBqgmjmVvi1zTasc0jHB7McIwHD8XLHmBS1SM1k8y7Lwjzm3VXXqYOl
aXaMCIEwzp+WeYuxLPDQp5Qj8HEbNmAqZMztnucMn0h6riFsFX1SICiQ7o8DXe3/
qTPjRWL7qvtiJSBCN068/hZF6l0m2hIfJqflvmF9CqDd4wzAfUqgSZiavmwpJpYt
refzB/wklao+yrD+cp895hPidxJVmG6omcleeczxJmVVKWm6pOYJP3LCLGezArVn
phgVYhRDOUvKWQk6sgtCqJbf6h0T1Nf1YvN/Cu1y6MAB1tgGiMUV6JEVuhaPN+kd
PnN3cFTF/8ATfGpMSArmO8l4VYoGHx5FxgE/LFRPED4LZgaGlZU=
=g7fB
-----END PGP SIGNATURE-----

--ktw4w3vv6m4wgb3m--
