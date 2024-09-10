Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91169142911
	for <linux-tegra@vger.kernel.org>; Tue, 10 Sep 2024 07:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725954937; cv=none; b=PLlCNTqCNm1HN3dfGc1vFW5hDPN4g6nQ/grH7Pk5PjlA6i+Hpql8HVrHI6taex+UQu+3SkR9CloKq12/lGM+vBAMIEWB0JVNXorJwlWv9L6kmdBMJKeLqf7i6tw1T2k4vFmVsHvoD1225crdTuhf3Ycyk4xnDpdwrAFyIgqagOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725954937; c=relaxed/simple;
	bh=JIthjp3j8aL4qbNpjiZWv+xdaSgTUf5vb8G929qi4/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Re41LP+fA2ljoCYpfPNn0D5UmBXJRoVARwKIR91SD4Dle5VGKSwhL5Ss2ZWAIi73t1r3n7PYWLlo07l+dNcJSVmPBA0r8sF8PSkBhhaJ7GNTalN9gb7ecgU9+Nl5Y6ZL9tJlnSawSKzjKMUK4bhnyTPgRYTia/x8PlhM5IrphdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=eIU0qKkz; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="eIU0qKkz"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53653ee23adso5060613e87.3
        for <linux-tegra@vger.kernel.org>; Tue, 10 Sep 2024 00:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725954934; x=1726559734; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JIthjp3j8aL4qbNpjiZWv+xdaSgTUf5vb8G929qi4/Q=;
        b=eIU0qKkzs9qkZQpM3GGpJ8U2X+hRjyeSjGei1eWjL1c2ZVHs9syi0q9qzihRalBIal
         RXB5eenvUJrqO3acoUvPUFWm3/MqUYEtPE6tK5c0BSd/hLIDTJk5j3472WFphVax3J4O
         rHOW4K+31cg/pVYFvmqPNH6G72FDilafGBAbbqs0G87B1trc7O+18eay6xkxH6LhQd3J
         6KvyA+p+BMjqUGv7GxWnC1kGjUjCptnIjZ3iGAE/X6pLmEk1z4u9K45gAD5GH2IhLB7Q
         QPXNHR7Wx6fCS1py1Ox/LXRhnI7A/jDapGj0F6rTqdAxzF1XyQGXauokUmokNIvlR0fa
         ulqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725954934; x=1726559734;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JIthjp3j8aL4qbNpjiZWv+xdaSgTUf5vb8G929qi4/Q=;
        b=TrGpf2jNi8skdA+UmOq47mFLa2irz+9EKOZqYn2svCsRk9qf9OqvJiNwi+R7r8OvDS
         3Iu3ZpDfdnglRYlS98GK2p1QVFAjIhw55j1Ngzgj4fXrbKt2Dk2q1LVU33dTv7Bcnclc
         MK6uWMi0M/iK53L3UhWJXyWoaaWpWuF6bYDY2B8aEzGroIAO2h+/Xhvw8rA4oqxEcWR/
         YbXZDJQ+9nW+4Iwr5y13LCFw0x8GY2JSbxxLqsLJvtehjsRT4qPHDZka4euV462hL4Dt
         /Gr52CakjQ2C4fKnHXY3yk1mLhOwIyKzm7/KIjXlgDzdHge4gbt3QAVd59o6r+I6Qgpa
         9AqA==
X-Forwarded-Encrypted: i=1; AJvYcCXyi9BjOcC1P4K3Gyt4uGDyLnmsXvFnld7+XI4sGaYkKRQ2RKz9ld+ECIoJ9ghjYLxCJpNvxCcRU+LPHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKbKzbR85Z9NvRhEsFEy1/VGvIzh6ClKKMx+kf8kYZ9WO4dyeH
	Y74ENYid80JQhmy9XTzhBUl9C74jQV+m2spUNlZnbq2T30etiCnl73rzCzqBtmAscBkAo4cs3RN
	F2ZY=
X-Google-Smtp-Source: AGHT+IFEyg4hXTd/aMf8FnzJ2ovzAAepl6pWeFTEgYUTvGhRmQzbeiS72GwyVksONhwMqkvhRJ5WJw==
X-Received: by 2002:a05:6512:3d8d:b0:533:4c73:a244 with SMTP id 2adb3069b0e04-5365881d8e5mr6676905e87.61.1725954933207;
        Tue, 10 Sep 2024 00:55:33 -0700 (PDT)
Received: from localhost (p5dc68d3d.dip0.t-ipconnect.de. [93.198.141.61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42cb0642f99sm99016625e9.40.2024.09.10.00.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 00:55:32 -0700 (PDT)
Date: Tue, 10 Sep 2024 09:55:31 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Vladimir Zapolskiy <vz@mleia.com>, Heiko Stuebner <heiko@sntech.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] pwm: Switch back to struct platform_driver::remove()
Message-ID: <4cvlp3ydsxmnvyzuwxq2vwtzhnlfhviyktm7rwfrmrrpto4xxo@ee6rmxesaddf>
References: <20240909073125.382040-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rjxyuiyf5fjudrxc"
Content-Disposition: inline
In-Reply-To: <20240909073125.382040-2-u.kleine-koenig@baylibre.com>


--rjxyuiyf5fjudrxc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Sep 09, 2024 at 09:31:24AM +0200, Uwe Kleine-K=F6nig wrote:
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
>=20
> Convert all pwm drivers to use .remove(), with the eventual goal to drop
> struct platform_driver::remove_new(). As .remove() and .remove_new() have
> the same prototypes, conversion is done by just changing the structure
> member name in the driver initializer.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Applied to
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next

Best regards
Uwe

--rjxyuiyf5fjudrxc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmbf+3EACgkQj4D7WH0S
/k69rwf/eoehxH7n/R3kxTqadGHMf79sSoI+s8s50Gw2F49MzfvPn3prVQIDv9IR
KmKAxc0jNZ5bGFuloHmdDQG1JwP2jXRAJIQAMV3PWzikTXuRlOuK0pc8Vf6fk2Jg
qwv6XKabbMx4QKKFNiW0SRxy5UTji0L8eBO8TimT4VwhN7QC9DzaIxiNDpLQAdk1
u1dOmRds3mADzC8szfufbRIk+he3qlr1plmbkkhgpc4Z66NmGrlsopKJgYY+bdtG
GIXLrWs1lJzEI4OefiXreWufNz+800nWmYyAQKjmRd5+gQDuJJeZE3lCT+w0jtfV
cIKJ0Pv6kDk4oCEpgvBcGOh7M9F2iQ==
=JYKt
-----END PGP SIGNATURE-----

--rjxyuiyf5fjudrxc--
