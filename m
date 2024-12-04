Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1D620C024;
	Wed,  4 Dec 2024 16:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733328695; cv=none; b=O+9HPAHbakdU0sdjRuIOFBe+3HB/0I/HMjGf3GpNz5OOW+oze3r/E/JYex52tBTbRk6iWX/RkSvLErJKGvwItfKCu1gUgXigykiUW/d8c3UqblJ7PuDcmCUQw9LlFUPS+9EdtvCFTsRBObouhphStdl11EFSOd0e6oRyACLNIGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733328695; c=relaxed/simple;
	bh=DZWRdzw8jyjWGVtbAVewKcKsWqOSHE9gjFdgS3Q/roE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ohGESjzplDYbULKNWfgAPyUAaWhLb6F0NXTyjlElj8qLZd1Z5QpuWrQ7Nr+y/mK5pTy4QJcWJKFTolnokCkWnuzKF4vLwzGWQgvPjysLh9P2XVQO9F0FFNKXd5W/8QQq/KWW8uXEsJw476lXkTtuiQ6s/4n2XT+128OxgvJpQEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JLktXA8J; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JLktXA8J"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-434a83c6b01so61574475e9.0;
        Wed, 04 Dec 2024 08:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733328692; x=1733933492; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IuJJ0hUBWKWp9BXX8Y0BDsg1t+amhn0JgNxZiu+8PfQ=;
        b=JLktXA8JPHzFT0Cq/VHqR1rl/9e9+XQFlFTypjhVcqK9B7XzOts0Ab1uKpD/n0CwF9
         F5d1X2T53vo/73y2Bc6gp0zmuYWoS0BMWjQBM5JB3KY8Fe9uHZNsZ8TtJoffVbsZVahu
         fCzVXlZlDnzKSm20Of7hisKNLtaxwQHTlKqS6yr+Rvjlf/AQP/hFacSrYh8mwKPtWhhP
         1PYM2BonBqG/d0YPFoY5d75Ayq1Z23zbz5rjdDpZQwYNWg0jbAlBctO4k9cMRb4N9eCI
         2v1vUfizO4ol5db1xFYrERBcjtakMwIqFqJdKxPXkdJni4aCCxcfs+NT3DsGucnK68ES
         3+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733328692; x=1733933492;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IuJJ0hUBWKWp9BXX8Y0BDsg1t+amhn0JgNxZiu+8PfQ=;
        b=foMsxdaR/sXDC7khqbV4mICTLrABs4NpvBFWJSfYTErzpuH16G/8k1O8LvdgNu+GVu
         aO7MMXMaBdJXjWBoQelnQFiAUNfQYgy6tQ7xOxX/Ln4KfYwabVHWCSo/c2LL7Q6YvmSG
         /yf5CVRJC+E0bl183Cs4KG3UI3DGV9WRNnsam50oiIUkNSKuTQ8rwbXEozV7QVAd75iE
         +LiwLb1Ugc2jEXPpow+33a3Tt6lwjwLvydzCTUuGOic5m+5xidhiJoHwjjokVrPKM73V
         bB2APDYbCiM2Bq7euZuBXDtZe2o1fo4xY/aLYSFIyVuM5YnJEgnxzv/bzFwA2515btmP
         VIqQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1SysojDbj2nYqVqvO1lhxsBEgB3sRKH8GBx08XR073AgCVFA5IT57K+LmvAiwGwiGb32qll80PzaXmGg=@vger.kernel.org, AJvYcCWihgmsSow0DaJgJV08KpZxTCJpg5eZICH6deu4Hr8fQgc5QMqxgqVI82PVAAFuy5JEDw3aSvUZO01w0KY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDE2JhcVb1pgn3nj1iBfHGMUvdvTQz7pa8lvQyai/jIqy8w+4r
	egWwJRrCCtn6x2zNefuAHZKq/632/FcoTPjnNbjw7HLXiDDuaSIvzEL+PA==
X-Gm-Gg: ASbGncswuTC7+KFSIx18aV0NjIl+V3cHAw7wne+ZnMOSeJLxlsfh24ExamtU4HAZK5T
	EdQo4mMbrX0VaMvsp64Lzc9aaGE1LGo6yE/oAEU/aszdbTa9yvgCvEGjcCZJJos6KhnoDT0hmB8
	GlryiW3C8vhZShRBs8aygx40JMPZ2ybAHoTEvTNDUJJRUckbUHqy0e/qPhDlLHl4rP8M8fTIoWQ
	Zim6UAHdyjM38a1KHfkB7DUlavHe7xecGz6YKPj5UZvLSZncOrdC6VtFJUTQ5djUyCWGP5iNvLe
	UPflf0tkqWaV7FGphRyuMl1lU4lcPm6tV7Nd
X-Google-Smtp-Source: AGHT+IFxym9KcoMunoySrW5nM2E/VbDCqLN5DQUcuZwy3El1YdHmWZ69OUQgETNEfKOJ1Z/XgqqH3Q==
X-Received: by 2002:a05:600c:4ed2:b0:434:a7b6:10e0 with SMTP id 5b1f17b1804b1-434d09d00c5mr64623225e9.18.1733328692056;
        Wed, 04 Dec 2024 08:11:32 -0800 (PST)
Received: from orome (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385fa330ca0sm6473826f8f.11.2024.12.04.08.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 08:11:31 -0800 (PST)
Date: Wed, 4 Dec 2024 17:11:29 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Kartik Rajput <kkartik@nvidia.com>
Cc: jassisinghbrar@gmail.com, jonathanh@nvidia.com, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mailbox: tegra-hsp: Clear mailbox before using message
Message-ID: <zbs3ovttbpqqj66szg4ovjsmmx3qmthue2jatweonn4tfhd6yj@uujs2m4tvb7a>
References: <20241202100559.57984-1-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="i73rqf2hzwxkm3k4"
Content-Disposition: inline
In-Reply-To: <20241202100559.57984-1-kkartik@nvidia.com>


--i73rqf2hzwxkm3k4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3] mailbox: tegra-hsp: Clear mailbox before using message
MIME-Version: 1.0

On Mon, Dec 02, 2024 at 03:35:59PM +0530, Kartik Rajput wrote:
> From: Pekka Pessi <ppessi@nvidia.com>
>=20
> The Tegra RCE (Camera) driver expects the mailbox to be empty before
> processing the IVC messages. On RT kernel, the threads processing the
> IVC messages (which are invoked after `mbox_chan_received_data()` is
> called) may be on a different CPU or running with a higher priority
> than the HSP interrupt handler thread. This can cause it to act on the
> message before the mailbox gets cleared in the HSP interrupt handler
> resulting in a loss of IVC notification.
>=20
> Fix this by clearing the mailbox data register before calling
> `mbox_chan_received_data()`.
>=20
> Fixes: 8f585d14030d ("mailbox: tegra-hsp: Add tegra_hsp_sm_ops")
> Fixes: 74c20dd0f892 ("mailbox: tegra-hsp: Add 128-bit shared mailbox supp=
ort")
> Cc: stable@vger.kernel.org
> Signed-off-by: Pekka Pessi <ppessi@nvidia.com>
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> ---
> v2 -> v3:
> 	* Updated commit description.
> v1 -> v2:
> 	* Added "Fixes:" tag in the commit message.
> 	* Made similar change for 128-bit shared mailboxes.
> ---
>  drivers/mailbox/tegra-hsp.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--i73rqf2hzwxkm3k4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmdQfzEACgkQ3SOs138+
s6GUgBAAjKs5rZl/ePiIQdWYT8+K0W77LtI5yL80DQhzN2ZgkkEijXs5I212j15/
vnVIaZ5jtRyToD85WLvKptoofUa9gazOt8gu/Z5OPX3LMg1+QtQDRNTugJA/LSzf
gf0mFonV4cojn/cEl9PBfKw7DtovCHfcAQF6hUEDS2OOe9BcbKYj5mh3/jAajI8p
0vPcuDHMMP9ZwRW8iE4aVwEKYQJL/m5LNAn3pz9OScf5kuJT0ctexd9+A8LaQyzG
9MLXM+TMU5O2sl5YniWhrJIZ4LvZMuDlz7iv3gY8vTSKO6jLWSBhureCG2CkrA9e
vsoMM2fTKYr3mSFClKHnpmLcjYKhyfqT0uSpWvrzvZrqNovUcCgiRj1Hj8kz07hc
sWV6MjRnQsK/y4SoUBwHzx2xM0ZAjtpHi95yzQfSAJRUEtopAPXdj/1nGiWBPfGq
XwTM32RjKPxJ/N5nvffp3L+eKjNgYCMeaGUEno2fdYENVOwzmuJFsisOXFccddT4
UAxSPvpXq1w77LJK5hPmTUsT1qnOWOl6EaBmBSj//nkda+Mn4xTo7MGS5mm6mlNy
I9qFBDkhkyngWCZBM4nKtrMCtmlAkLRCD4IByJPBFRVVoqTFphxTduMdUtwNr3/s
xwqGlorgLhq1lN7QahW/hWK1wMtAGYWvf51kyuZUdAPRhN/AmJQ=
=eKR8
-----END PGP SIGNATURE-----

--i73rqf2hzwxkm3k4--
