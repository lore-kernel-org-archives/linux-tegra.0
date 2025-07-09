Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5F728DB63;
	Wed,  9 Jul 2025 12:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752062948; cv=none; b=cyGUsu6pmBSlHe7LDYzUkWle5SlVcLVybO5XZ+D3AZ1r0UQxJtK2ScdPjkYvrZP6Avoa6R+OtORqvefEihVsDG3GaQe7aB0L58nNRAM2JVYefKPfgMXE6I4Nk3M5nna8uylhyQXfi9hQkifWxwq6OiBIUUYKw4AzutnYxOdKxG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752062948; c=relaxed/simple;
	bh=Zr8Lx/eamU0E2vDhDTvwLGDg2dgye+YwNm7VrBE7JgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LBlptQbZ3KqPDhlcLsT+qBhmO8/SY7Zy6lh0jAtgFhRKWBPc+/7LJZD91EqwP8pSNzMEgIG8r3fHGW1nxTqAxpHpubLSz1FvJbgqQpSr3ZUczsfWve60aan4nlss+odtu0TjVhb3j30VI7jNdxXrOKSBN1/IkWoGYlVVTS+kfnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J4nUumLy; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J4nUumLy"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-450cfb79177so30894935e9.0;
        Wed, 09 Jul 2025 05:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752062944; x=1752667744; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WogpijKLmZb8b7H9vHN/zDFQWfYUsldCd50PCZpTcBk=;
        b=J4nUumLyJOrWkdWuYDW2FeADoGJptEDmR04B59OXEDmRUfpRy0fct+g8cc7sPBoAB0
         JfF7u7jTnH1YPzQ33IyXkI9nYtKNpwKXoaZnLwUrG+N0Mk0hRN8oOeezzYV6t/ZX/bM/
         ti4LICZf+JriPaOKAYYHHJqTH5hSZuPL98ORdZ8kiodnOwIGqX2K2eVhNROt9Py50OVE
         vR4FiHl+CCvMJZRlXKdlVhdssRQwr9SCjdqQyJ5ovTWqhXJB9lPEOHSinchwBvcDv6pE
         yWu91U+YZpGgDVGXkFOi/AuLKG60cgpTcx/uPI5hFh7Nbnmo8jT/v57CPb5r2vj0pXcc
         nJQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752062944; x=1752667744;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WogpijKLmZb8b7H9vHN/zDFQWfYUsldCd50PCZpTcBk=;
        b=qTviFvGtIyEuR2zM3gHPMi1SjNiZvR4j/dbxh44KzIezFM/2tRbgapNTM8KiPFa1Ys
         xAhW/Q0TAyT3x5Q2nPuAy0jbBlwdhJR/oxxJZkIK+mYY+iQuy+hjEyHBItBFEvj2djdt
         SBhqReYxkFjjCVon+J4vpziDUrskX6d6zWcAHtw4KN8AygzUk4xf7dfvnIJHQ8Guz8rv
         axhH5LhaeJfVsVV9KlucCoX7cWdFeHR9SjlnJAm8CMYhN7YiW4MoR5jmphDsBnVbEjAh
         QuRsMAN9/ApQ5BYRcJwvZbpFrQ0lHSfZYIEAueJoQ9y/JtnWBrDVbDkiWMwJHdoZb57E
         SsmA==
X-Forwarded-Encrypted: i=1; AJvYcCUjB5v8n28ERM6PrflZFEnQqFcc44pi0rGjWd4qAUEwOT9LxJNntmNdVydmmeDkl7BmB5m9u57JzpU=@vger.kernel.org, AJvYcCV2zo+j1KojEYwfunxX4Ux7ZH3eOYuDhPxocgW42En9B07vXEAz9gwTautC82JRvN872qXFw3v6DwXe6m+i@vger.kernel.org, AJvYcCW/AQgK+felQ3cf1i6UsmKRWZ0TqP9FOM0E1txro/qbVjDvgrS92YdxbR9cwWqvTht6pZ9JXkHQcUuBF6g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyhSHLA6rR0zI3oglxKVD8TivRB15YJZas/AeI5nJVjrt5T6P4
	UuJlQkdpTHJkPScR4qJH/H52wQ55Xagh5+I3xPGfQOE/Z/zxjGv/eiAt3s/xNQ==
X-Gm-Gg: ASbGncs6HZZtCqtOvBx6JIJ46AUwu243WS1oe85pFcJjUW2GhTYas69Ol9v6v+lS+pe
	q4KaaLd1mvUFLZXqpx0nSBbBIYoEmdkx9tM66BuZ38xLCfJf5tzDWYyUi3UxBr7a5Ttm5HK923P
	YCuqZN2xqmpVjfwLTy6K4qJQubr9wheIKzJcEQsypdTJBAuICJn8DESorvn0tKllBzTLUB116JQ
	hLJSaj37gLuiGzqHucvxTf0MznWlk67xwsbyvsxSnhv4mAHO+1yrscjRNr+1cV2yBwsX8lBrtyq
	/hrjawj3WjsDY+PxHiW7mwKQYn4VamegtahIePUYfPBmWVN0Cuz4Af6hKXuCjaifJns0HdjSwId
	j7xXTORqE2XiMX+sXVJhaLiwuIPoSKgojv6Q6QJpxEH5Dgtb1
X-Google-Smtp-Source: AGHT+IEyrihNigjgbOFc6uagUwFk4KqRFFygWqYtqc+UwJnQyrJk9xWjPnaWT9y5hpj/20BJMfDS0A==
X-Received: by 2002:a05:600c:c87:b0:43c:fd27:a216 with SMTP id 5b1f17b1804b1-454d53cfe90mr19497315e9.23.1752062944100;
        Wed, 09 Jul 2025 05:09:04 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d507075fsm21771485e9.26.2025.07.09.05.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 05:09:02 -0700 (PDT)
Date: Wed, 9 Jul 2025 14:09:00 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mturquette@baylibre.com, 
	sboyd@kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: tegra: periph: Make tegra_clk_periph_ops static
Message-ID: <agey5uxdjtbq5d7zvwke2qsshp5s5wewkfd4of3olhlnmmwzny@4ef3s5dvikpi>
References: <cover.1752046270.git.xiaopei01@kylinos.cn>
 <bda59ad46afae6e7484edf8e2f7bf23ceafe51e9.1752046270.git.xiaopei01@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q2ee7eiv6gxkvong"
Content-Disposition: inline
In-Reply-To: <bda59ad46afae6e7484edf8e2f7bf23ceafe51e9.1752046270.git.xiaopei01@kylinos.cn>


--q2ee7eiv6gxkvong
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/2] clk: tegra: periph: Make tegra_clk_periph_ops static
MIME-Version: 1.0

On Wed, Jul 09, 2025 at 03:37:14PM +0800, Pei Xiao wrote:
> Reduce symbol visibility by converting tegra_clk_periph_ops to static.
> Removed the extern declaration from clk.h as the symbol is now locally
> scoped to clk-periph.c.
>=20
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
> ---
>  drivers/clk/tegra/clk-periph.c | 2 +-
>  drivers/clk/tegra/clk.h        | 1 -
>  2 files changed, 1 insertion(+), 2 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--q2ee7eiv6gxkvong
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhuW9wACgkQ3SOs138+
s6G2xxAAo9uDe4y6K3BL0CiKaEm6L2/NM8cEXYggE1dMt+stGBmFTHgtWfKntAtt
mpaSjQQhX95gOSz7OBO2Yn94TF8Ndji1NR351clIO+/p2x0QjuRNh7zw8fTsC2T6
ce2pH3V7mwoEUnFd6RlvcfP5Vry0z47VsuVHkeVxhjCqbZp+ff7BdrcdjdBeCU4e
jkKO/cKRN9d89W1LKhomuwpHTRvN80EaMlYYWcHnwEd94GkBdRu0M6ujTCIVzOS/
qAy0A6w06FqqnWP8ZywRKRILa673IAhXvBFgaYGpBON8twRW2lyaqQWBOd/IMcaW
NUDNJxw5DJ7/OHl8k7USfuQFJ2SMXcioYSri9tES3kyb0UNlBHb7O/oeuMD1EKEp
R12lB9XogYhX8vd53xz8B74ycUl36ZUclkiCahisHS7PIoiGioNHHZbCbxFNjK8D
NF1ZhwHCaTPVblUoHnUobkbT9NST7jHOSY7qHhBCRM4Lhhtsf2jNDlqT+J6A4XY6
Sr7G5pQVaz1USDC/5Pa4rmgCYGESkQdkoVp4e8knqbQ5erHGCRLKnTB29KjVgY5A
PaJgUxCJNsZ1L9nDaU+dKzVjk0xzS5kwvmnedniyvp0OjwRUIPFstsFdmlx6J22U
TY85vtcCN/T4pj6dIlWX9WQc6zS6WM9wtuHQnHBGxmFb5i94X6U=
=1e8M
-----END PGP SIGNATURE-----

--q2ee7eiv6gxkvong--
