Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0F94D599;
	Thu, 27 Jun 2024 07:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719474717; cv=none; b=tFvd4xYrCgMHf9sbanxaAARAHElUBj5DdtmlRbBsBA1R1awOU96i1Iv2fxRitLPttQiy3XA217AO58NUlo86elrKLnhttOLcOTQRNX2+IoVOWGZ0gR8Iwmxg+i/BcDFUxxtRCvsw+HsWBqcHQmhc0nDYW+kcugbUCKFyDj4TCB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719474717; c=relaxed/simple;
	bh=ROk/aJkmGUASb3klzYJnyvP/GH2Dz+GTWC37DGRBecY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=oLTFoVhk7UhwerDtBx6VQ76eAEUbwGwnAFG93f1q0kKd+ou7OIcXa6BxEfcsWrCFCq8XkNkD7YFwsPVTQwTpogqcOdZmDSouCvhY7qzXCOZG9UloJQWIwlRRuqGaCQFy3UaCM0phYwoKNkkWiLo7GOWDrTZrQ/oSmtPOvc3ePXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SY3JoWNJ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SY3JoWNJ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-424720e73e1so61303725e9.1;
        Thu, 27 Jun 2024 00:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719474714; x=1720079514; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ROk/aJkmGUASb3klzYJnyvP/GH2Dz+GTWC37DGRBecY=;
        b=SY3JoWNJe4ZNfq/tNid/TMN3gEfsQUVsfvBEUu7YFbwITihzYlDQLTCaxQyK+GxBdF
         V5erVZWgDU3eyK7FhuRMNR4qRseLWX0mDLwyMO7Lj68YBpwe94afRGwbxO70PevYr+AB
         TypoJsbJoeV0Z1fVT0328HY2nps4YLyDSH3ZLzbYxQs+rqMIeyiuaKvDjvCwhDn53GIV
         /dZdZ7SETH1jgZw6SVjPoNLzIRmLydAYKWoVc8Rq/XFzPMFmzeGMZWgfYhdL3MNNDYen
         5u+nBKf8oBpnSYXyIHEIDP0Da5KR5r23vhPVKI+Xbynd30CCzPYBDeBA+D6/4aRQul/I
         dCbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719474714; x=1720079514;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ROk/aJkmGUASb3klzYJnyvP/GH2Dz+GTWC37DGRBecY=;
        b=YEt2avuxlw0uHdStzRW4nhiLoBn4cyKn50xhVNIMQa5KnowTEH65We+BlkFK/c3lC5
         XRwPll46BuTiWI54O82FIhX6P6QGgZPEybhlSdduhHFUVV2y4z5TXm8D8TdSMivvx0Bp
         is4Y3nF2CBkBTQLR+wboOsAWmWc+r0BoQfb/mvPj2moBv9ftHVjGhE+B9PG0PlmxvpDc
         65LNRZcW3E+DpvEy3Bf48qltGw8AMmQ9D+fQnl4CuiftuP3ufPxG5VXwxRYsU9gn5Fe8
         jp4mcsJfo4B/sS3Px2fS1D7TC3QocEKVDcSa15QDQQyu1EWez/RVsqXxW/kaEpTJYBPA
         Wlug==
X-Forwarded-Encrypted: i=1; AJvYcCUILmIgWMyh943Z50IfwrCL7uAql2doeoNRl1TLUVpHLt1KWQtzAxWKgK5yMkbd/pU/ysOV4hMJRLtcrF140gv3/YdB7lFpsWl/a8LpDDcoCjHoXlsL5mtz2/M5EUHl3LC0mmDVZUtMG8U=
X-Gm-Message-State: AOJu0YzDWLS6yDEhCGtXidZqztWVnr5qp0xna6Ia0yQIykSfMXPqm4oR
	EEt6QdTxzJgBSQQ7OklizS6AmyXRSlT44pQRsQRPf7K3GI1j/AUo
X-Google-Smtp-Source: AGHT+IGgKOinmDtHcLbWIaf7rpqzsOj4IbJCl17XQsknsweGY2b4FVYbzOf6xDbYyRi6TNAHX0EESw==
X-Received: by 2002:a05:600c:4d98:b0:424:a2d8:5fe9 with SMTP id 5b1f17b1804b1-424a2d8601cmr43300315e9.38.1719474713555;
        Thu, 27 Jun 2024 00:51:53 -0700 (PDT)
Received: from localhost (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42564b7b7a5sm13632205e9.24.2024.06.27.00.51.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jun 2024 00:51:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=4c86c22c78578bbaeae325e209d8920954343bc244ccdcf05116e315b3a6;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Thu, 27 Jun 2024 09:51:52 +0200
Message-Id: <D2AMWY1MS3UJ.2GTU7S0UQG8KZ@gmail.com>
Cc: <dri-devel@lists.freedesktop.org>, <linux-tegra@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <baijiaju1990@gmail.com>
Subject: Re: [PATCH V2] drm/tegra: fix a possible null pointer dereference
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Huai-Yuan Liu" <qq810974084@gmail.com>, <mperttunen@nvidia.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <jonathanh@nvidia.com>
X-Mailer: aerc 0.17.0-167-g7c5a1afbda60-dirty
References: <20240602084613.220931-1-qq810974084@gmail.com>
In-Reply-To: <20240602084613.220931-1-qq810974084@gmail.com>

--4c86c22c78578bbaeae325e209d8920954343bc244ccdcf05116e315b3a6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Sun Jun 2, 2024 at 10:46 AM CEST, Huai-Yuan Liu wrote:
> In malidp_tegra_crtc_reset, new memory is allocated with kzalloc, but
> no check is performed. Before calling __drm_atomic_helper_crtc_reset,
> mw_state should be checked to prevent possible null pointer dereference.

The commit message here still references variables that don't exist in
this driver. Looks like copy/paste leftovers from a similar patch?

Thierry

--4c86c22c78578bbaeae325e209d8920954343bc244ccdcf05116e315b3a6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmZ9GhkACgkQ3SOs138+
s6GdEw//Z4Dt/JJ9RugLNZqFmPjyu6cV9BTYNS8C+i+Z5qVSJKAlU17QXEtgao0v
9udOalpTa2st4fVsCXetfL1k2XJP5A1lzokPxst1Ln2YY1bb/sySoR9IMKHjsVPu
YWKM7gqd2gKfoQvxpeqswAKXcV+GB/EkwWOBFoKRvM62U4K/Vr6KGAYWr0eLxqP7
nZI2QPWEWrL/IB5Z/bNtSbwtkAa/kzQi29dnIgJJo6Hz6o7n84rHsQE5wtNkApL7
kr5UT9+yKv1dVA2OPeF+PjbZKDjhaBFRYeEgb5Ok0f0DAN2/ukX0UynpFxkAosi3
ESyDYi1aTwTUBUIvddzjtqs3HrhOM/g83gF3HSNXaqCh1OXjZ4OGJIDlAJhmBoTB
p/CfvfrbJdlz7zkEoi0I1DoM6tZb2QKoAaH7W7S9ckmsAUtuXQFCxJluLMP04+Lp
lylchxY7Fkxk7off5hcSzVW0VQ2uuO9IMLwG26/TPKT/P5krgd7KN+GuYSi1SbIv
qV5NysCmwWuXZh8cyEiuK1cV2FCZwYQyvHDtoSZECHCymzuYOPrnqJ2z/wkV6uJO
9T0uJh4MOJizJfwLtqRTuy9/416fN26QboFfpgvaWABHIlojULEbaA9AQ1Pa1Dss
NhNTU4lfgWY05qgthujOyYEGTFZnnw9ARRkXnsiPAWf47Ndx3W8=
=h1m7
-----END PGP SIGNATURE-----

--4c86c22c78578bbaeae325e209d8920954343bc244ccdcf05116e315b3a6--
