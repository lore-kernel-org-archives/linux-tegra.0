Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AF845016;
	Thu, 27 Jun 2024 06:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719471502; cv=none; b=svl3X5ihbeoAZB0n8WiF3vgakidAGb+foMO6paHx7EH9D9UYOizk9CIczvTjSEoK1e1abZdOgMdHaHYS3bNO/33i5Ic80LZ9r79PS5QwebJE1/VrwIbBZl7KCQv/xFOVamrp0fiqTQzUdMs3QY78UAtm457DSsAlS211iNejHbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719471502; c=relaxed/simple;
	bh=3DkhIs3KmkLvGwvMSZCf0xN19lQ/NqHO2HipSv4we2E=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=L8WJY4Sz4X14klbmp6ahIReD90ddFTkn4tuA8sn8Sba92DclbARhU13UDd1XVdDd893y4wOJuNK5ToJC13jM3rE6CfnO2HhEh08PZRjV3R5m6BkZ7KJYLItZO4zsv7rGzVyKHzKVAfnbUXw2T7lqI6hfrAvuS4Kc4ycoM+8+qbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KO7hV5bq; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KO7hV5bq"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52cd6784aa4so7073109e87.3;
        Wed, 26 Jun 2024 23:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719471499; x=1720076299; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YNIlrh0o3BmVa7KGn3BlNKQKQ/vsv7AGkjBlD87kKPc=;
        b=KO7hV5bqzIgnzi4C8q00veLnH2Lb2MR2zlqqq0IvvXuk6Khx8QR2IfkYhRieDgIc4A
         aLpFxDv2VH8O2lFoPLFCYBPF31fImAwoqwA6LHdqikJ11eB6+LoFlhgM51T2YzzveXO5
         bK8l+/M1nAM+zAc83xJBahPUS4jnSGm60AzA0ijp7FoGBKb9zX2LAf3Xei38NKrI7rY8
         pyZ3rizq1segI4lb6JDOG4A5GGsAKYFiuAYuJY8UBVx6BOEvIUCYJ8kyiEQLN8C1jMZn
         iQZDPbrPyLmiHvGm6Y8I41pQlOjeubvV9NHGvkBe+fNrtOFce6nAGYp1OHrpy7WdThK/
         4iPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719471499; x=1720076299;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YNIlrh0o3BmVa7KGn3BlNKQKQ/vsv7AGkjBlD87kKPc=;
        b=pLSc59ZWOqQ6Z/QZJQbAQsRknM39TT6iZtWWQs2FXgaayr47IE71jA0mjNrl27+hym
         suJI8VCLjhDorTGUxAavEN5OVYMz7wMqg4WXLfOGmWC5fsdVsOukQWtjTW1vK7Km9vOU
         VDzm4AzVOK9KmSNZ8OrquE41g/wZUwiWCzYk71PkfLWrI2moO4RkQM1fCaHkTOhNcoQQ
         6m1mHp3SEqfu57nz7igx2g3ud2tdNZ/K4vohW0u1gIwvoJ7fN1Hmieu3FxMXWi4/b+51
         VVyxJhexCRy/yyiH5UvLPz3smbaoyEBC23GqrGK12USsB3RJt/sUiDCEWarQFAT9Tori
         B99A==
X-Forwarded-Encrypted: i=1; AJvYcCWt2zboBnqW6k1HIpEnHAxnh+IHROqicBSBuNSBJ5rO/aVjv0/EVfIESkY/UO68lGV8LUgJz6o8agHhzAUrsnXxfZBmwfBveiyxWGw0U0I53gDtEQPNWoLBCsQfxugnmSrxPSP1HC+zyRc=
X-Gm-Message-State: AOJu0YwCwvo+TbXsred6SXiNuRLrSTEKYstZR+O1vGaBr5ZtK7yK+MPD
	lIz8MACOnn20gfRVXaVgm8zz0srIv51BHEL4u4WdtWOH3IKwDBeO
X-Google-Smtp-Source: AGHT+IFC/bjGIL/8NWDtP1TJYmgVedL+vEsfhXN8+YyRJabS2/POCAHTTCF6DNNSr3v30AYUjOEA3w==
X-Received: by 2002:a05:6512:158f:b0:52c:d76a:867f with SMTP id 2adb3069b0e04-52ce17fcb9dmr9938547e87.0.1719471494560;
        Wed, 26 Jun 2024 23:58:14 -0700 (PDT)
Received: from localhost (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42564bc7b09sm11575715e9.47.2024.06.26.23.58.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 23:58:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=7f8dcabb5dc255d60cebfa8d6c3433af39369a68ea1696444b485afea980;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Thu, 27 Jun 2024 08:58:13 +0200
Message-Id: <D2ALRV4G5SZF.229WKTA9B95QN@gmail.com>
Cc: "Daniel Vetter" <daniel@ffwll.ch>, "David Airlie" <airlied@gmail.com>,
 "Jonathan Hunter" <jonathanh@nvidia.com>, "Mikko Perttunen"
 <mperttunen@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v2 3/8] drm/tegra: Call drm_atomic_helper_shutdown() at
 shutdown time
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Douglas Anderson" <dianders@chromium.org>,
 <dri-devel@lists.freedesktop.org>, "Maxime Ripard" <mripard@kernel.org>
X-Mailer: aerc 0.17.0-167-g7c5a1afbda60-dirty
References: <20240612222435.3188234-1-dianders@chromium.org>
 <20240612152336.v2.3.Ifb4450979b62976fd5a98847dade2e5b377d47c8@changeid>
In-Reply-To: <20240612152336.v2.3.Ifb4450979b62976fd5a98847dade2e5b377d47c8@changeid>

--7f8dcabb5dc255d60cebfa8d6c3433af39369a68ea1696444b485afea980
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Jun 13, 2024 at 12:23 AM CEST, Douglas Anderson wrote:
> Based on grepping through the source code this driver appears to be
> missing a call to drm_atomic_helper_shutdown() at system shutdown
> time. Among other things, this means that if a panel is in use that it
> won't be cleanly powered off at system shutdown time.
>
> The fact that we should call drm_atomic_helper_shutdown() in the case
> of OS shutdown/restart comes straight out of the kernel doc "driver
> instance overview" in drm_drv.c.
>
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> This commit is only compile-time tested.
>
> (no changes since v1)
>
>  drivers/gpu/drm/tegra/drm.c | 6 ++++++
>  1 file changed, 6 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--7f8dcabb5dc255d60cebfa8d6c3433af39369a68ea1696444b485afea980
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmZ9DYUACgkQ3SOs138+
s6FERw//WlQjtIszEzDkWeZFUGfNYgXGaeeQUylwV9ndafXASfuHpgYc8tePAZfa
yrchhtD+5LxEYKIKuUuIBkbWr50g/kQ+2+Xtf71w0NMefhYqiFNz1XnxMr5OKScU
HHa4+6qF9EDxuuEtAIT+WqQde0cA4unqzGb6yaLoBFNCoWThcbf1YqquRq1omnlp
mx3gtMnG6lS3Rv2CcnrdZQBhozGIj4sEebECSyZtKSsMI32J9l4fMP27qp8HKd7e
OYOkAVoDsk8V+qZu+Z5liNSMUaQ8OdfDiOoEN7Yjz8HlqDSChbdrxZjleRkYreeT
eA+vWUXKnDL3jpWouBkV6WyF08n1LgU6ExVNo/N7uaaZwri86mo/WrrE1DpIfVfl
rpGLIfdmxhgUKevei02C0vZIKHQcJW4mQsnlMk3nI1jaZNUQE/Dq+I9e7RZu9I4D
0fLJEWN53g5CQQCef5jkCQmig2GR3SD4+YVlHMwtaCRHGEnDV9uwaC6hQEVUjrlG
6RiX+hPhPq1VPsNUsUwLoW9H7lWF4ec+clXpeQ1m01yF8KnWGkCn5LrKZjY66yor
A5dqs6nVO1Ysbjiv5e21RZ6iX2eE+HlIjwihezDB66iNdPEKQS9BVI9gP0fO56eD
eopW9b9ItT4dSRbVRlDcfAt3q8mzVOG/H0bbToLDJgDYVOohII8=
=ykhp
-----END PGP SIGNATURE-----

--7f8dcabb5dc255d60cebfa8d6c3433af39369a68ea1696444b485afea980--
