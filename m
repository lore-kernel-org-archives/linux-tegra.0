Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFBF3A7F44
	for <linux-tegra@vger.kernel.org>; Mon,  9 Mar 2026 11:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773056442; cv=none; b=aIrdpNN3zkC6aXXnpIm3s6V99cI6RpGVo8eN65+U/sQCAgJETCxWJEMojVoAdJ1d+QGsdnrr7jbLzto5c30Y0+8AtZdFG2W1NZevjIeLlzd37D77fb5TQpmlkAFCfMBvFa9uP/jQ0dCvXHrFagdhEHnysA6CGKDymBjkktd0iIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773056442; c=relaxed/simple;
	bh=xC8SfweL7ryzpgO3KWD2W2s8wIB+Yz650LsyKxFl6TY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GkBJg/4/jbjA9qzSLZubOU4xhuWeXShpETEffaUG+8kg7GxbLXGTtIBB+uM4bZSK+jPERf4EYip2TTdvhIelTvovVeefxBbLNMpgSDKPhopahpFlpQf61bEwXAW660jkAbI64jsOY78kxbYgDkriLAlbdaJ1P4oIuQyprf3iSas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=mcLWt7J0; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="mcLWt7J0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=QR/l
	HRJN6QTS54oLeSIVIW7MqrbPoHcfkNxU/qstUjg=; b=mcLWt7J0KeOKEgRV35ko
	F8eGhLlwVU4YH3L/N2VAYNI0SNBZkujFjndL+gVtdcv9Z2MeiFuAeyE8mDldV3Kp
	OgpYp94DVIxdCWDqMbzIEDIdooaL6kxuNrD0oDBenQuJVmHS9NjOMpImyQPC/riV
	9rL9gVtO55FgClT5w6W/PevfORwI2wg21GeFJKXCIciuAUH9G0fRpZzx0G5QrcCK
	RVKOv9L1OaHXWYZsfzRHMJuURSp3dTYYMLnstYKPbSC7uDA+JajqPwntsUl5iTJr
	NB43VzGxsUzjpfVWWGYngydyrGpwCqRJ62Azkjv++catAKtflaVJcSG03HUwuPYo
	3Q==
Received: (qmail 2755381 invoked from network); 9 Mar 2026 12:40:35 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Mar 2026 12:40:35 +0100
X-UD-Smtp-Session: l3s3148p1@Qyn73pVMVpggAwDPXzF+ANZpdrMKUeLI
Date: Mon, 9 Mar 2026 12:40:34 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Andreas Kemnade <andreas@kemnade.info>, Johan Hovold <johan@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>, Frank Li <Frank.Li@nxp.com>,
	Linus Walleij <linusw@kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Kalle Niemi <kaleposti@gmail.com>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH] i2c: i2c-core-base: fix devicetree alias handling
Message-ID: <aa6xslY4hP1WRDzf@shikoro>
References: <20260302-i2cfix-v1-1-a95418e9217e@kemnade.info>
 <9b3c0190-7996-40a3-8306-5038f42b2b15@nvidia.com>
 <20260307182610.48cae8b4@kemnade.info>
 <CAMRc=MfrXZY5k-b6eUWUov=MLnXojAenPwiM-eeOpjKZrBHeSA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NeraYF8T9JTPZ9TB"
Content-Disposition: inline
In-Reply-To: <CAMRc=MfrXZY5k-b6eUWUov=MLnXojAenPwiM-eeOpjKZrBHeSA@mail.gmail.com>


--NeraYF8T9JTPZ9TB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Bart,

> Wolfram: do you want to drop these patches from your v7.1 queue then?

Yes, I think this makes sense. Let's see how Johan's approach goes?

Happy hacking,

   Wolfram


--NeraYF8T9JTPZ9TB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmmusa8ACgkQFA3kzBSg
KbZVKg//WTepQmm8TdWDdDb2fZW/8Su47poQd9aNBJ61z64iVu8LCd9UU4jJxzzd
tYmWQl9qTwFIwhp2uS+8mUiQdKSnBgT/inBnbs0mPXi6zp/hfgXDA/aehfiNOPp3
af5F3+sSDvXSJPxsRlIOmWMVYpZKBxCjU+LHwVPp1CIE53hEk2BTa3ZEzeONKVIu
yjDxFgJ07NipNvlD941P/S0YqjMIaU5hIaLpicBTd5PCKYqmHJHbLo4Q6iyVMqMq
RX1Q9uXNaviyh8i4ykfCcaudEy9xfldvHhDY/34havFH1l++zyBDOvtGVe+Ob2mp
d7excBSF11WBD3/g0cLAZXX2TZh5XfjSAbKMqy31gK/nA/j+0kdUHXzGOOLwxW/y
sfvIenQhTjepQTyK7mHzO5elPanfQqxO1ueyEsTGdr/M3Fhdwd/e309JXOwxVZL5
8zdD9jcHgcHN/CfV9JYUB0nSTnQKjttPocD9c2iNf9ZyqbjxwaDB961bChf0iOXV
lF14XUuElo3reUnd55KfAInBLLP1BNbl2zR5SZwBGwB7Bh7WX/J9kywv6q3GuED4
Her6/VAwBXAX4kYbMLMzJT0C/bzbOv4s87w3wR9l1qraiBXIH3UH6yvjGuWq6N6P
GgF1OGfWei1T++2ItWAfTexI4eJZ3M4oPCCK5KOX9xPyqrA270I=
=9gE3
-----END PGP SIGNATURE-----

--NeraYF8T9JTPZ9TB--
