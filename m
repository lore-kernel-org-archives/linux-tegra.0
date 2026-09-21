Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7F148F001;
	Mon, 21 Sep 2026 11:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789989448; cv=none; b=ZJGntFafaxvzP+gj69Pu9R68knvLpyIzl2ELKH5lwiRZYTH9ZJUsPoNRB8R9nXy4ntDNgdoVQQ8QMGOfrMYw5De/VX46Ef8zp++02gqqg8aMneaJYuPSCBzoQbYCHdnPqF27Zr0eRbEubqC6jqG0nORqCJNJvfus5BhRyIo100g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789989448; c=relaxed/simple;
	bh=x16NKno05BT2zHHJEfQb8QZgs6VvyRc/Bo82uAB5hKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IMTp2UOy+wE7o8PCRfwE91K4oKrvLKsBV0G97yjckuTc6l2RInMm6il+9gIgfeh8sij33QaV1KKwVyydWIQjDYHsa9UGyptMNY3X0ziVttRqC4vw/w31Pqi0IrbU4dC1ij+nOesm75GSw+ytQVUjjED6kp6OUhK+zGOUxzhMFOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MLp2MZ+M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MLp2MZ+M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C8731F000FF;
	Mon, 21 Sep 2026 11:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789989446;
	bh=kl9oMLe8SDeeHamOhAttW5UionMDkMf7HMRbiNeRvac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MLp2MZ+MILWRvW9R/eS22d0Z0g7H8CaIm6P2C7sdFzfdkqRllu+FieG23RrZDJ8AZ
	 tIHocolyxYv74udgHnlvVQUl7O3MnZ80nDSXFWBAYc7idU9mENLYQOKAJN1wHMX7Fs
	 SYk42uHZqWQVp3vPihD9T9hCkQGNWi+NNyH6DwgK2oMXRRhl47zGcVJLdqQVeBY/Dc
	 i7eedgyNuHceK+/XYuI/oeETsoRK0WgJbp+8aVoU+YwlhlMAewNQtRJU7/Wa5Ix3Mp
	 RoKCratFlQNXsr9WvrYTAjhUDJ/LIswLY8h79T1wDSMkrVnPXwgOk+kHfVAdEc3NfD
	 amAc024zY3EKg==
Date: Mon, 21 Sep 2026 13:17:24 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: 0xSmash0th@gmail.com
Cc: Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: tegra: ivc: back off when a peer stalls the
 handshake
Message-ID: <arEQa6XbnKsePcaq@orome>
References: <20260917-ivc-resync-backoff-v1-1-dd41ef3a1390@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z35p4itbzvgd3yrg"
Content-Disposition: inline
In-Reply-To: <20260917-ivc-resync-backoff-v1-1-dd41ef3a1390@gmail.com>


--z35p4itbzvgd3yrg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] firmware: tegra: ivc: back off when a peer stalls the
 handshake
MIME-Version: 1.0

On Thu, Sep 17, 2026 at 05:20:24PM -0400, 0xSmash0th via B4 Relay wrote:
> From: 0xSmash0th <0xSmash0th@gmail.com>
>=20
> An untrusted peer can wedge a channel for ever: park its state word on
> SYNC and stop touching the ring.  No path in tegra_ivc_notified() can
> change the victim's rx word, so rx_state stays SYNC and the loop is
> absorbing rather than slow -- pass 7,651,085 is indistinguishable from
> pass 1.  Each pass rewrites the ACK already in tx.state, re-zeroes both
> counters, rings the doorbell and returns -EAGAIN.
>=20
> The only in-tree caller, tegra186_bpmp_channel_reset(), retries on that
> with no timeout, no iteration cap and no cpu_relax(), on both the probe
> and the resume path, so the victim burns a core at roughly 1.5M
> iterations per second for as long as the peer stays quiet.
>=20
> A peer is a service, not a VM: one untrusted guest can hold a channel to
> each of a rack of service partitions, and nothing here makes wedging the
> tenth harder than the first.
>=20
> This is not a new class of concern for ivc.c.  tegra_ivc_empty() already
> carries an over-full check "to prevent denial of service attacks", and
> calls that condition "an invalid case caused by a potentially malicious
> peer".  That defence covers the counters; the handshake has none.
>=20
> Apply geometric backoff to calls that make no progress, modelled on
> xen_irq_lateeoi_locked(): a saturating count, a doubling delay, a hard
> cap, and a reset the moment the peer moves.  Progress is detected by
> reading tx.state back rather than by tracking which branch ran, so the
> states from which no branch can escape are covered too.  The wait is a
> bounded busy-wait by default because tegra_bpmp_transfer_atomic() reaches
> this with interrupts disabled, and it uses local_clock() because the
> resume path can run with timekeeping suspended.
>=20
> This is a floor, not a fix.  The return value is unchanged, the caller
> still retries for ever and probe or resume still never completes -- the
> spin just stops costing what other channels have to share.  Bounding the
> loop belongs in the caller.
>=20
> Assisted-by: LLM

I'm not going to bother even reading all of this. There is no such thing
as a hostile IVC peer. The one peer that currently uses this IVC in the
Linux kernel is the BPMP and if that is somehow compromised, wedging the
channel is probably the most harmless thing it can do.

> Signed-off-by: 0xSmash0th <0xSmash0th@gmail.com>

Please use your full name when submitting patches to Linux.

Thierry

--z35p4itbzvgd3yrg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmqxEkAACgkQ3SOs138+
s6H7XQ/+PoZUKRpSJzcyPQm0IjtIiEtP3M4Tb8PpScfsEmmzefZp3xHq511w4hqK
EN69XaSlE0yIVwdM85hvpfvAKLnmdi3u817Lovs7ZVgt8jditQuoiU3VgBZONZUu
z7HvFgPg+Qe9T8bF5X6KP4R0w7q3RJWBwFihdPuS3wBvCPwK8luxLEnNGFcJMq9N
57PBTw5A3ahekOsgPSI3Nb/q9NY0DwK9t6Ecg/jW1RL+R+AUs9swnLxPINzebgIK
YQOEmvwI6CXLv3rmhRy7Gdz8snlDcvE7XJPzbN9VHISzMHt6Nx9KpLlz/Sxeckkj
UwIIOWttsurrWeJNpqOrY5X/g+W46g3gYFMvoV0f1h5Mgx7CwZo7i6vckbUs5fMZ
nBYeE2D7GcsaIcxa5uRHM6NUWkAoh8ryggLEqlvBcZS8Dxq1spawEpKgqT+v7r9Z
CR2UrBmK/YEdKNzcYjlk8X2SyhbaEPATdKEUvzZ/9nkpekmkLlywToq0c3dQwyFo
Hv0YLr0ILia6FV34dnaUi6D/p+fObKU1kq4RvFOmjM7frS9jkNuiAsxPZt8kU1bB
GCoWssnYkspTlfbulGMUblxn0WcigdR8RiAe6J6gpkbAdm5QHc+3E62omw/yrwGd
pMDHGiirM4Grn9Vs7N8I+RPexJdtaYs/DKpRUQmt4XWZpVMKlec=
=mY5Y
-----END PGP SIGNATURE-----

--z35p4itbzvgd3yrg--
