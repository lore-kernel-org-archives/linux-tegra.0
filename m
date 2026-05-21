Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AEC3839B9
	for <linux-tegra@vger.kernel.org>; Thu, 21 May 2026 08:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779350545; cv=none; b=WvW0MOsVfTgK3VE/Qq8yZek4m+oZQdfBsHCdMhn5ltVegLW+waCI8AQvVOvU2rVDimdEsW/gyLm0HjGfBsWwmwL/rik6sliikL1slh+UuYzmec/bXRO9oOugcYmHOOM3g/0Su222Ps7h5rzuV23+YyWVZkYNgJPxXIqgN6y4M5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779350545; c=relaxed/simple;
	bh=hbRDLYE2cbMKakevePB5wZhSMX5cMBexsypIIixVjPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ClOxPjJiro6cG62j4gA9Itq8yLg9MTFGiGGQlll9/KzPrWM1ykMbQRiqW0Pf/8/clOkNWCnLCJEmjDyjiCcohaffprPHTVK+w1nEa/1thzkJi1dnG8iV+T84Eq7SpAb1k4XFQ5vyUVUwPeWsLbPXIGThik2f5tqqYu54zkfSli8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qtJT95k+; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qtJT95k+"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-45e8a834cc2so2371804f8f.1
        for <linux-tegra@vger.kernel.org>; Thu, 21 May 2026 01:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779350542; x=1779955342; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hbRDLYE2cbMKakevePB5wZhSMX5cMBexsypIIixVjPk=;
        b=qtJT95k+ftIu51zVzStSaXJ3Bd+UtzIF5vNS1phG1gp1Q1W/MlIPZueEsz/QXWk1Io
         D6POK3Zzi3KVuJ+g2UArOkrnyAl0l0vFoiyxACzI1p7gLCRPFAOXLzt/3cLpS/j3KmLk
         StPmgikxnG6xF1+XUnNDM1IZifqHeOydntIk7D6+khVRZ4s9b0+zM4eS6S5dkj+UmOGg
         na5ZQnB42XkxTgTuGdyyGyErpkm7kphGvc5Xvgpqk4BEWIVWPtWrNp6gh4FrmLlENPYx
         1/L0H4o4SbEohAa5tuf2Z5kJwtnh+dz/qbReht1DyfBib03/G4sEuV6sRurz0sXMvlCw
         34Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779350542; x=1779955342;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hbRDLYE2cbMKakevePB5wZhSMX5cMBexsypIIixVjPk=;
        b=W2yNS+dmMbR3SNXVVJmzyAa8W9X/7GMwKDid0PYr5FoXUf1HROK2dbtW6JrFhBWA7s
         4zOOpEwd5GNePhFK2Zc81Wj48jTWVMIT3C+mRCSKB+8csfwMBFStBifK5ykT1h2bCQUv
         6NfcZgY1LXRSQX1UZvIfiV/UHnlhAabm6wrspCydbnqquYsyqQtL9MeJYt0TfhEGrD5W
         Q0DMyRSlidCLjX4t/L710LHVP29xyL9jSqGXkUeJsldW/9lCDRPS/SdO5gBvYQ0mgQbF
         v9sGC6hNe3s0w4WuzoX+97xXmkwgMYGf5/FIlbG+7EeY8jZeMzHy3xZoxMOnyyGOXhpt
         R9vw==
X-Forwarded-Encrypted: i=1; AFNElJ8tfaGfrF4BuuoMt4ehSwKd7FIg/j/a/aJR9WFqOWjqraCjcOUC/aZC9grxB/RalMv9IFwt29lKAoZXDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEwqgV0Lijs90sqmMOcSux6TUNL2y/M1UzXr45XTA0gnD1x6hm
	7WZRIavlbDqE+XP4JcmtVLK5JgY0GpKttUsRSgnc95Yn5hdhv0bZltuK9bioCA==
X-Gm-Gg: Acq92OE5gJDIqTDBvlUI2i/TCgrbLruBcfohr0mBtRayE+HkS0WP2eZxQk1AXSFGCpX
	Ln7ofjEmoXY4tfoeX+H/yOJcBZbkGmfWhCdiKE4LZ66gcD7GCtFXXV2Hef8U+5mKVyMkSyGNm87
	RHKxqH6Q1nZjUi8t1GKum2R7KEq2N8E5kG4hiDI1kkxuBjg1rDwOFSGeebh2IYltfY+VHht6Eru
	eJLBm4a/7sdEKqJgc83tJhXqgEhtpfzCQSw3aIo05UQsBqBzk27x/TubXmdIslMUD5AgVc7Jwqh
	IIm9G2xnnye046BkOYdDdqrfXRi5ca0BUo20lhALC1lqKh89C+Zq44Q5YFs/7sozq3KetepmxV1
	mT0U7B8JNxm6IKW3Zm2oChoSHWpVP7pHFXJRr0MYqNxbxzN/ovjuWBZ1t5DQcCvqcJy9dJ978aY
	3Gz9K/gYVTWkzrWW5X6qy2KXPIBQ5lIjdiEo+8LJqCwv9DPw3q0r6BT8FwCZqJ6KoNOAZEo3RqE
	9AphmmnG/pqhg==
X-Received: by 2002:a05:600c:1f89:b0:48a:52ee:5776 with SMTP id 5b1f17b1804b1-4903606b7f1mr20526055e9.11.1779350541494;
        Thu, 21 May 2026 01:02:21 -0700 (PDT)
Received: from orome (p200300e41f291e00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:1e00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa7d9daasm1044740f8f.11.2026.05.21.01.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:02:19 -0700 (PDT)
Date: Thu, 21 May 2026 10:02:17 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, 
	Artur Kowalski <arturkow2000@gmail.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH] gpu: host1x: trace: fix string fields in host1x traces
Message-ID: <ag67-LzzT6ZQTKlf@orome>
References: <20260519-host1x-tracing-v1-1-55afb8cbd186@gmail.com>
 <20260519141059.77435501@fedora>
 <ag2iF9bZJcBQ93lh@orome>
 <pQKtL-t0RKO7KsvRTAIQ_w@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5k33r6t7pdtm7qgm"
Content-Disposition: inline
In-Reply-To: <pQKtL-t0RKO7KsvRTAIQ_w@nvidia.com>


--5k33r6t7pdtm7qgm
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] gpu: host1x: trace: fix string fields in host1x traces
MIME-Version: 1.0

On Thu, May 21, 2026 at 01:33:24PM +0900, Mikko Perttunen wrote:
> On Wednesday, May 20, 2026 9:03=E2=80=AFPM Thierry Reding wrote:
> > On Tue, May 19, 2026 at 02:10:59PM -0400, Steven Rostedt wrote:
> > > On Tue, 19 May 2026 12:16:43 +0200
> > > Artur Kowalski <arturkow2000@gmail.com> wrote:
> > >=20
> > > > Use __assign_str and __get_str as required by tracing subsystem. Fi=
xes
> > > > string fields being rejected by the verifier and unreadable from
> > > > userspace.
> > >=20
> > > Does anyone use these tracepoints? The fact that they have been broken
> > > for 5 years and nobody noticed makes me think they are useless.
> > >=20
> > > I rather remove them than fix them, but if someone thinks that these
> > > are still useful then by all means apply this patch.
> > >=20
> > > Acked-by: Steven Rostedt <rostedt@goodmis.org>
> >=20
> > I know that Mikko used them a lot early on, but this driver is pretty
> > mature now, so we rarely need this low level of tracing. I'll defer to
> > Mikko on whether we still need these.
> >=20
> > Thierry
>=20
> Yeah, these have been quite useful in the past when debugging why a job
> is failing. Without the cdma traces it can be cumbersome to find out
> exactly what is being sent to the hardware in some cases.
>=20
> My preference is for keeping them for now.

Thanks, I'll pick this up then.

Thierry

--5k33r6t7pdtm7qgm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoOvAkACgkQ3SOs138+
s6Eaiw//axqMHw2aCBN/4prDAG+8/dWi3NTEhYUsoXdeqpwErHY035ErOee+dQ/J
UZhhYf6GPAWSiUycfr9sqpgdRLLBwaNZpAcwcWfUMRk5iCOrI11+gs8FtYK/jkcJ
Hjpu5d7IaywXKHq4j2yX03vT9Dm1XqHtc7JdHDxW/FINaqM23FXZyzE8u1FLjvSF
UllYcn6pWbPB1iF57OnrHMaNI79aBU9mHLmIHMvWZZKUfkkE0mVd8q7IVWlqCv4w
GvVf7aZI77rTWWzaCjqAQtzFTQ274x4B2BsNDw3aIc01BdCO+wXCkok+u7olVwNf
vq/El8n8PCSNJADGxiGeT2nVnF3lMb0zAmbBUFtKe6hCeI5pIZWFH8B6zrGOklNK
ajNNPg/diQTBFEeEWZbHp9jo1vUbbULEiNhmoHchrmFeSIiVTGJLJjV4wG+fE8nL
tLiE/Ie38IvQ60q+7CMkxtFfVHI+4BixDq+tw0cIlimaGKUB8muDlOkb6fvGtave
i3qs1uKqTtyECsm0xYJ9Q+/BDHANvPHvm1PRvoU/5mkK0qP50SkiwSM2SL14giaj
mPB6loPhE/tAtBSakC957dD2A3YPFAfWeHUjmhrYZ+tJEB1kLRW/u5Jb/L5T0Mq7
0ZoDYGbIU7mynkc2ZCnwjFuIQbJkTjzuF8lFjiIUwy4wdpMdsiw=
=VGnz
-----END PGP SIGNATURE-----

--5k33r6t7pdtm7qgm--
