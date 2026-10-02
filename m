Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF000405F7
	for <linux-tegra@vger.kernel.org>; Fri,  2 Oct 2026 08:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790931126; cv=none; b=QgyBf7zNIhiGSixBAbG7jVeEsQvcvuV2pgavzKaJEe1uAclNLAZw6YDq4rlm48m7Zvk8/DxI+1c6O8nSnBU/Z9CAb8+TpjBwNqHcnTk5UiOe6JXGJt67bVUW0NZKsWqH+iumkXKtX7gRFIqOO7Dh4hJpkchl5rBGzeG2U1Ynz7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790931126; c=relaxed/simple;
	bh=DIVNiWfMxnfOIKoQN89pB/UWBJB/wMDmHrfQVePcqbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EC4w+wZ3KTL9qbro0mSxP7H6vODJ9sTqQkuX0oOwALFkMzUZ6CH5wGAZQtz+Plj37z2n54iRduExgid4FkZSCTtFN6t3rQFiuAVuPmgtLDzT88d9TXAZlGJOdPwN09aoQckqfuzOvqy3lWcLb5OtGEslCWiXeRiGUHYnH5vEchk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=RQtbQuJX; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="RQtbQuJX"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so56157985e9.2
        for <linux-tegra@vger.kernel.org>; Fri, 02 Oct 2026 01:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790931123; x=1791535923; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DIVNiWfMxnfOIKoQN89pB/UWBJB/wMDmHrfQVePcqbQ=;
        b=RQtbQuJXSBV0CiZlzBszaNn32zUzQsXq4EFZ9s8K1fwX2lvTNkCrMAXdq5QmYLNcCF
         tJdY17WxGeu+BPCuNn+YKJeZ4txUdv/i8ABnMpywG5VSNQ09HydZl/i2R+6f/cCuv7jm
         gjdaFyW6Cy2bHZhKmSOjz17Of6dinfCpm/dA/RgU89rceBYznSIxj2Uv1uh8zt/KR1Xm
         HCmRkJqFGJgKrS8YxylA6vdLqtByklFSfDmHyEvhVoc0iuGO3hjiIcTCC5YEvYk6PnRy
         BziYFBvv3Y939MT8s2xNd8Rk1EFB5Hu52awzz36Y7vYNE+DzlFTbH5MQOOM/GRc5ey4g
         C7vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790931123; x=1791535923;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DIVNiWfMxnfOIKoQN89pB/UWBJB/wMDmHrfQVePcqbQ=;
        b=p/zupJn6vwAVjWvDpJEYoDDGp2pVJ7MZOuCeVR1nUabYJAOKrrmvxnr64i9imkIjUy
         0mfohzK+BgLmKIwjjIg+yD67Nkm0EIeryIQOX24EphGx4IUJ817Is8Z6uJ5ZIGeO7lz8
         xn+kDqnTxcnyz/Pqd5JQL3HvMoE7JoS/8lKDmcHx/7fdINkmKvissw1NJi1/muq/k/0u
         C1tPBZu0FmUU03Otv+0Ro6uWWAf1mykIPP8EC2pjYzyTeDclvO2x01GpO+WbnrevZaCL
         Jikzd9CGIezXGShV94gzOVGpjC2BPqvXuzu/ytieDBhtBbKYQhg5eKaJN4uD+g1wFrRe
         7FiQ==
X-Forwarded-Encrypted: i=1; AKwUvByrXFy7iKHBnbHgz5/iRwUny2W5yWzgRiRz8LKx5nM4WswSucqkbzJQWgVCt/6PkzR7FIkkmG2I+SEy2A==@vger.kernel.org
X-Gm-Message-State: AFuF++lg+NckWemv7xR0TLK+eL0wuScJ2V8cXvxLTKUI/tshvI14PwtH
	BoOJInINybAgsuLKf1l2EE5pMVTO3HKfyIcoCgJ0yWkQDaAudt4v2pmFlAFVfdH16y54LG0usN5
	dXNh2
X-Gm-Gg: AYBFou1OilL2h8PLWDUjETsJZOD7dBlIKTBZGSMumCfJvl/vPHrpVCkaO6pqP0i1wCg
	xPlNPWjk6g4IxvwW4oiPR2l05xkY3rdiLrkUgTUvD27jItK3fNi9P1PGTQ5UdmbEGkrL1NcklXT
	4sZbHiTwKf29bbJHM3PhQ7f9Sw9JHZm8ZvwVNB+6t+VsVNizoLqA2FfMOItLifioB5TCf5rUzEO
	82wyPWMOby/WhXdRVD+KyggEbg8bpE5qGT6WiOHLx8ZCh9GyKzjybvWxIlSTNo9txWmmG+ZCWrB
	eteiz2nSOiSuy0eMRX8gWma/YI6Ug5C56UwTmA5Ubf2DYh9+y3n+vJi2407hR0VTEtHXgIpidQ/
	o1/exelwQ2801mWwYRSguZOolxjFHgTzh7xBVnApBGgenw1mG9CPdNHBMBRhv3v2EtXh91AqcPD
	e+w9EBLXcdo6DOq1YZ1pA9CWAnzYjz8X7Yh01fWdg7omO+MNUc8H7yJ2hTKVk/FBFiX17dyks=
X-Received: by 2002:a05:600c:6a04:b0:4a0:4f6:3dc5 with SMTP id 5b1f17b1804b1-4a027542255mr24825255e9.7.1790931122817;
        Fri, 02 Oct 2026 01:52:02 -0700 (PDT)
Received: from localhost ([194.213.108.11])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a0280bfafasm65232975e9.8.2026.10.02.01.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 01:52:01 -0700 (PDT)
Date: Fri, 2 Oct 2026 10:51:59 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-pwm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"Ola Chr. Vaage" <ola.christoffer.vage@scoutdi.com>
Subject: Re: [PATCH v2 3/3] pwm: tegra: Implement .get_state()
Message-ID: <ar9vT4FY3QxEvRZH@monoceros>
References: <cover.1789741839.git.u.kleine-koenig@baylibre.com>
 <b72b16cf704aa662a1b49805db284379d4fa4050.1789741839.git.u.kleine-koenig@baylibre.com>
 <arEAjOHU4rH5aGqb@orome>
 <arE932ZcHGB8RAN6@monoceros>
 <arJTSEfkILPQmqNV@orome>
 <arzcE4nVRTAK9C-X@monoceros>
 <arzjXtZj0hIf5iZU@orome>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qg3ayc2w423pjf6n"
Content-Disposition: inline
In-Reply-To: <arzjXtZj0hIf5iZU@orome>


--qg3ayc2w423pjf6n
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 3/3] pwm: tegra: Implement .get_state()
MIME-Version: 1.0

Hello Thierry,

On Wed, Sep 30, 2026 at 12:29:42PM +0200, Thierry Reding wrote:
> On Wed, Sep 30, 2026 at 11:54:03AM +0200, Uwe Kleine-K=F6nig wrote:
> > On Tue, Sep 22, 2026 at 12:07:26PM +0200, Thierry Reding wrote:
> > > On Mon, Sep 21, 2026 at 04:26:03PM +0200, Uwe Kleine-K=F6nig wrote:
> > > > As long as .apply() also hardcodes TEGRA_PWM_DEPTH, it's IMO fine t=
hat
> > > > .get_state() does so, too.
> > >=20
> > > Okay, fair enough.
> >=20
> > Is that an Ack then?
>=20
> I've been thinking about this some more and I don't know if it really
> makes sense to keep hard-coding TEGRA_PWM_DEPTH.

Full ack, ideally this implementation gap would be closed. Compared to
implementing .get_state() I don't feel confident to do that without
testing though. (Though I could make the driver return an error code if
the register setting doesn't match.)

> If only .apply() uses it, then it's mostly fine, I suppose, because we
> don't care what the current (or initial) state is/was. So we either
> don't use the device or we overwrite it with a custom set of values.

I don't agree here. If the TEGRA_PWM_DEPTH setting is different in
hardware than the driver assumes, I'd say .apply() being wrong is worse
than .get_state() being wrong. So I'd either go with .get_state() as it
is now, or rely on someone with hardware to correct the depth setting
first.

Best regards
Uwe

--qg3ayc2w423pjf6n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmq/cKwACgkQj4D7WH0S
/k4IkQf9E7DSmKZFIFIR/4nH83QY05qdjqp1cDV+Cim8WXIUyam/m2CsUXY32OT+
Oup6DSCgMewSZMEsR6H1yvCtiCuizscQG/RUaK+BYpGcBLbihvBD0+T/vCq8Oh04
hFAtyOFQc6FuzKtcJZ6iSryB1ATZN4eUCJtVuS8OUL2EISrUBVEPkL5eYmuVa5LH
y1n5gA8T7iAuLwc5cgsCA/uShVFtsLnt8ghXotNIQzGyqxNtIA57gcdQvgjY0cpg
QU2ZRoS9IxC2PszH9kw0aExfpT6/2ZD1/vYddzMQlTvLp4ooHUQnFZT+MQSfnhBo
3EFJpVbpZmwWBLfCLnsHEeSFSsC0uQ==
=iMZG
-----END PGP SIGNATURE-----

--qg3ayc2w423pjf6n--
