Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7653B27B331
	for <linux-tegra@vger.kernel.org>; Fri, 14 Nov 2025 16:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763137181; cv=none; b=qM6QV5T8/T8/vLRjQzogEe7mc3yvpCe/A0sYmyXAYLAvXabG2svDqmuzlenrlcn4xS6CujId2Eqy0QL3eHSt4MvZa0GHV1SZjUCyhmKuonnkI2WxckcMmpZCL9+n4OlUmY8tf8noQbLJJHIIlBD2qq4izkNjSCQ5VPXDVOcknYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763137181; c=relaxed/simple;
	bh=mQze+vhTkcKXCt4oTSZfQbHuN6Q3hd3oqHMyYQzJx7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=plvdFd2O4Ck6rLNUzcw4037GV9WE+Xuc+VbiPzC08m6/m+jzBegop4NEHH8Hw2zw2cIK0+v00fBK+6HbeuAsw5kgmEogmKntLc3zbIAN8XPwMYF+TFODxdrCVYx8OPNkkowqSL2q7vVh9tc0KfrJRb769hLgAmhT2ZOOQR240EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GwIKL9Oq; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GwIKL9Oq"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4777a9aeedaso19882635e9.3
        for <linux-tegra@vger.kernel.org>; Fri, 14 Nov 2025 08:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763137178; x=1763741978; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mQze+vhTkcKXCt4oTSZfQbHuN6Q3hd3oqHMyYQzJx7E=;
        b=GwIKL9OqxiPWKjZyDGxw3O5oQ+vBy/a0hdkFyo4ojOl/q3cvCjukoW4vz52r5gbT4s
         iub/FU+pq6vMV1C+1YjCOFJJi+TaeMdw7t4ISH2cO2QPFE77M18g9hdpTatG5oCKdaQu
         K8+CrvtHc54XVG2qtUPTQVFlW8Yho49B/Iwy6Oi/4R7qAxZSAtfUr84ozxm5+4SvCZ1v
         0e34psQpPfqzUoiRICfmnjR8HgAZbN188WpyQ4q4q5dDLNSFRscBsLqhuJSahqnlDBvm
         ZMsuHwbhMufue/Z0d8IADf3ecOhtxMwB630b3hiNwjgkrMZQfK38aZJMGL0YNNnjAOkN
         SoKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763137178; x=1763741978;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mQze+vhTkcKXCt4oTSZfQbHuN6Q3hd3oqHMyYQzJx7E=;
        b=MscInQrAbOgG8UL6dzsJV6uJ//Z0T83+Dfr0xkVVnXPKf7gYXM+tvZHRuGFlD2uxFC
         jqugRBiIEZM0sHOjcA0lcjXGo+yNEvaind8ihUCb6EosrmYjUDz8bmgZ3Fd4PUgRoU+a
         iB9BVkfrxacluRqXyg01lGVJh5xTNgZn8cAYiL8sysyofAZDJ34n59w6cwuE5Fg+TrMs
         F8KaQBy6L0CMXuG8KwOw4XUi6mucB1TJbwXZpS9OJjaR9QaSK0j2mFXn007x+4zgPJVH
         iX5BHbnioYEinhShAttCEHBN3U3bVvrrua2MofnU919tGy+7YBRcbBY7JvuL8K7V8fBD
         Rjxg==
X-Forwarded-Encrypted: i=1; AJvYcCUP8kSMKGjW+60SSMQMGiLPYHW6uYuSgmnKfhzFekmg3J8rOe6VA1SjP0dc4Hq2iMQXxJHqbSEa7JMEcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTn23oHjFDLFiUV9aq0EBEiv5wPOzYHX5EP+4KtOpInrywCik3
	NTduxKiYQerhAhXWbhB998SQdHdz8sn+kohLjSiCW4V0UPvRLkW5oDmQ9/h2SA==
X-Gm-Gg: ASbGncuzanfdVmocMc7Afe+gT40L2eyGRMSMzy7s73skNP/zgIKuJ5THWTe+TmuLIUj
	P5731yNG1JI/E88nEbT61+nllWBEKPNXFFC8Skr+hu6+VacU28AwQyAGgM5wmo5IcgcnkOw/j+s
	s0efiop4rpngptZ6vmaNcuaJcXL2klm5cb95doLKigTnzPDb1Vjtnt1dU9LQt3u1Hu0WD/+ROwx
	ZtuWPJ9E6C285xyNTahIvjJD56ShEFflUVlt3UFGw671oktTkF6OTJKu4pWxuYxxe8iEGEeHqO2
	vgCbkRxfuN3qtcE3Z65yVCbk7mckwz2fAmnHnRfwt6Js3xTiNUeKxxa0AldYWmCxYgXqVHOmJq2
	oRaxb+XIQ5PDaNWdEnhp28eWJFZf76+SGCIE+nh/9yIpGIxnrlvQrfgcptUYGMiBUiVfL5w3vE9
	PaKch23luoLIOKE0MT7LAsJQTJVQV2sLffn9XXj4zuPaGeQik7iFucFkKO5PPm0qkcNcHaIZOUL
	A==
X-Google-Smtp-Source: AGHT+IEXpp9GhyDlSqXb1t3OSFc+IS43Dnqc2lcIdZ1aDVhbxs4d9LabUFXnM5UHvJ/h8mlVIf7NLw==
X-Received: by 2002:a05:600c:a05:b0:475:dc5c:3a89 with SMTP id 5b1f17b1804b1-4778fea881fmr41769625e9.34.1763137177535;
        Fri, 14 Nov 2025 08:19:37 -0800 (PST)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4779528bc65sm15542105e9.15.2025.11.14.08.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 08:19:36 -0800 (PST)
Date: Fri, 14 Nov 2025 17:19:34 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: webgeek1234@gmail.com
Cc: Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] soc: tegra: fuse: speedo-tegra210: Add soc speedo 2
Message-ID: <v2wyq35j3df46ntd226ipodagcklqhn5gh2fjqvvj4p2mdopgl@iztiog5of3bi>
References: <20251021-t210-actmon-p3-v5-1-e1ef5e93909d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mct7ffarnshrveke"
Content-Disposition: inline
In-Reply-To: <20251021-t210-actmon-p3-v5-1-e1ef5e93909d@gmail.com>


--mct7ffarnshrveke
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5] soc: tegra: fuse: speedo-tegra210: Add soc speedo 2
MIME-Version: 1.0

On Tue, Oct 21, 2025 at 10:11:15PM -0500, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
>=20
> The Jetson Nano series of modules only have 2 emc table entries,
> different from other soc sku's. As the emc driver uses the soc speedo to
> populate the emc opp tables, add a new speedo id to uniquely identify
> this.
>=20
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>

Applied, thanks.

Thierry

--mct7ffarnshrveke
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkXVpYACgkQ3SOs138+
s6Hc1Q//WwPsTnM3JDdIlwslSSoJsjW4Dw0k/5sr7nLNaNv0WAqITBp4aNh7NqlP
NB7M26BWZ6S3BrOpBQqPn3BqI09dgpsCkWcGC+yZY8qFGENKSxi2mNbwUC8D/lE9
+cIPqo2Jz55biEBX42neKlQxYjQS/PkFjBRZtlW5HzgjI+e/MmdZL2IJX39ILPhd
ULOTGLHBKod2dzHteidx/sk6cukhGLIoXaWaCa06cgvHSdEdz9L+iw6pdG8BH4bS
WN06C1dufycVuCEdzyUqWt8cFsaNX6WlPNxgmEIbPWtD7hGrEwOcwB4kxAQg4i0a
4FU6Z6d55cWnJREM6muviOhN3YK1LBOJeFC0692WcqVjnY6XRyxBnXnuCpzXyKnC
jhH/X39mXxQ4YmSD1L8000j2YlNHyEP60lAnL81BQI307YtAVJJpajvHuTNDF+yl
3RfDhohGe5h7W7eklWR8z7i4GyQDKxIR5KXcjytCWB3tuDTeXvKsDL/NMWhOsZdF
tBrvOAB3lMyjnVIcF28EQufj7SDmxiLTkZu66p7ZjBhE0nIxeLSHaVnLjrpNUfaL
vzxP0nHg0mPrVT/YNvyVwzjn2sWrOQBBIGiGYw073zNHe3Nc9W8hPqC5KZhOqdbu
TYxdfoBpfyPDBRwi8khkULp9JVykfsfumVqwBPUVMTmnF2fe99M=
=nLAc
-----END PGP SIGNATURE-----

--mct7ffarnshrveke--
