Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8B6463B88;
	Fri, 28 Aug 2026 14:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787927328; cv=none; b=YjmXIOJE5HDAtMdKyyxTuTnezS22vu0Zkl1tDw2fQklMhbrBHfLMjKrWgrx3VlgzQlDq5TTj14XQ5C7efU5ilxVzQDndKC3TSuVJqU0JuUt9A/Exqocrg42ye4DZowL5HUHYoDfqwf6p3UniO0nk/NHP8hSzburGnriJ6euWFaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787927328; c=relaxed/simple;
	bh=dMyO/dwFQp0jDdsKRJHWOcAAACKHtpA9N9uG+Acvc3c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OVC9v4n+QTTNMaldAGC0Ivxpl77j4iWz1LYBmxkpOytfM0gDQrL6aLPGk5WLU1NiWBnIX8ZCtmc14I+v/9javJ5uNYgz7f7aOEky/+Zit/0eNbHQ7N9i8laB0CQlqYmyouOvxH660G6dnz1Pv+OY5bBDNTtrb9M0fJOyv3+ONSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qnh5nz8l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qnh5nz8l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C7E11F000E9;
	Fri, 28 Aug 2026 14:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787927323;
	bh=KZ8XAQGacoubOuhBaux8Mku0h7yhem+s57E22ICJx0g=;
	h=Date:From:To:Cc:Subject;
	b=Qnh5nz8lbsCsDD2KaZu4WEspylsWx40/Ec78t2XoehWKoLGf9kj0u4uSRb82TtJtS
	 XvBqS4xJvCVMdzVLao3tnANRtV54PimdI232XZNOqJS5tv8CmmLUsxybEuA89w4E2k
	 xNgDHJBq+zZlT9CcirBymN0LQL38E+TjaNs5EdwgIrAw6SdHm7PNlob9bIVWk5LKTP
	 7dlvLx8iV3tbF4cpIMj4+1quIuf38AEJDeNhzCgBgsvJTXjR9hjhnmfhEd8KsXOoEq
	 Ozchz1m7rOJrW/nLNoeGxp5XHZfdOW/h5rWx7+LGn4lJCe+VbvWh1vtVaqnveB2TWn
	 vGbbxn7yLetuw==
Date: Fri, 28 Aug 2026 16:28:41 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: linux-next@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: linux-next: Add Tegra fixes branch
Message-ID: <apGZ3emy2duQxLri@orome>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zrxspts3ju6p24bg"
Content-Disposition: inline


--zrxspts3ju6p24bg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: linux-next: Add Tegra fixes branch
MIME-Version: 1.0

Hi Mark,

So far I've been carrying fixes patches as part of the regular for-next
branch, but I'm thinking of changing the process a little bit and having
a separate fixes branch that feeds into linux-next would be cleaner to
separate things.

Can you add this branch:

  https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git#fixes

to linux-next, please?

Thanks,
Thierry

--zrxspts3ju6p24bg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmqRmxUACgkQ3SOs138+
s6G/ww/+MK0xJefjTRt2TyVZDftTeYA9BUri6OhgnPjCsSi3JNwf4yd5ir3rT0Sy
ZoYq8XcJ7Sj/6VnjHrXYZfJxXMADvChMBK8+cHc+qEehDR8NdVbcZSPNmc9Yqzn7
UBE3N+Y3iCeT6fffqzMP9Q6uuiYkFruCOA6Y3IteJqVVwIZW3AcuzwrcUnaauDiP
uzSphjgryiE+T0brewjH/BSLHqr29IH9VI6VqanCGgTas1/UxJl9O+JMf7ME1wmH
G5xHKvzIsJL/WFBQPC/qLnxemzcDU+7yxJmrhcVHZmRvN7wmorjbgObZ2ToafSz5
ybf0k9cdoUA/67T3oHGOrKJmoH61341pJBCG/A4glE/FwObfUlQsAqtTy2l4A8TX
0XnYQ3/chrALKzHixqcn8PFHJt74fDpD7cnHw3KoXOU4RMwMpHo0cJ7/trIVo2ht
nYmX6UXQhVQyF7k5rnd/IpfaozSJcdRflCP/jEMhSZUpwbY674Wm9XTATL8YIW1h
tn97V8S6BeEXl8vRck9x+DTvDPMbIKPxhYLVhY7BbQUvbRSCtWExEqWpmzXLMuW4
YOgKlHQDarpXaBRCk2PmbjUVLvTPBRgG/rzP3Lij+yH0YvEkZtPG7S28afpQKnph
uFOe1914HViof4m1WZDXnJ8vG3y+9BcxXv0bgzbsluJDwAzdh6M=
=euWY
-----END PGP SIGNATURE-----

--zrxspts3ju6p24bg--
