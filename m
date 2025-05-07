Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24B914A639
	for <linux-tegra@vger.kernel.org>; Wed,  7 May 2025 16:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746634203; cv=none; b=ln+rcGT5UgakUM0j8jbsNFQ1XhVN/fZVTe8Ou4uRVMJF5V6N4A35n+Bdq6mMR8+S89gqFrSHXu+leNNU4mic6HbhP4el6vKP4G1+Zk9lpQVeHEX4yctJOb+WCFBxzYmzq6VdwwioC23V35Gcx7RC2Capvcdn4P8KDbv2PAaRHCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746634203; c=relaxed/simple;
	bh=U6+QyvsBkiZCAwW1VP8ooKzfmUaVnTbeSc07ljjLits=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YnB82cc/y3rMuLeUv4eO6ulHzSd96O1Lp7byPbYh3q6goUogxcPpSr/Bp/r7TcgWohhFaXlnnGdmwlaRQI3hl0mQ7mM+zx9CFjkeuieKOCu5ehk0wdCajPCXKI5tcG2SGfPTDQU8aQy9UD7cM92ypGb3MERSaBbXXfX7JFsk6Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G9NMa+mi; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G9NMa+mi"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so341545e9.1
        for <linux-tegra@vger.kernel.org>; Wed, 07 May 2025 09:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746634200; x=1747239000; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6sdeDWT2RVHND3OpKFEExx6G89kQ5Uyxy9ilnbcLQog=;
        b=G9NMa+miLFqrdp9M7dHb9i5uM0gtBK4IXuK8YCeG4aFZRVSwxR+1jM46Sg3OqKrJf/
         NMRct/Ah3uxnJ5zBRaHHTRSX4m9te8d6NYQb2BGGXHXAXN6Bwn9/LoTWuO6n8s3bNNL9
         zVNK4x3bs2U0BvGkt2wl4kIi0/0iSZPCRUpixHPkiYcb7Ep0Ufmnc3MPvx3st7zr8bSB
         AOgHy1dWQkbjFDynkOpiPmgKbvrcSHsI62hrXYU1qrBjI6U8xjUeHi7UUNFgo0i7adqO
         OqE22paHJyxOzeev6o1XER646XOAtwU7cBUfX9THYofpxzu48JKdspzAsA9/LxWzSpua
         /MNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746634200; x=1747239000;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6sdeDWT2RVHND3OpKFEExx6G89kQ5Uyxy9ilnbcLQog=;
        b=ptWyWmtGHnwtUrPmqBbyPY/Kv7/Rzzoyw7ViM6JXe8q2DQ1q8Xmyy++FYhz4/buyWn
         WScCkZQ+Ko7KBnq26wI+seNi85TwtEnh8XaCDRgPxwuJ8EH315HkPXGwumrhWErc1xyA
         sum+RlKA0BJ1i+IduLEulS8wOpneujahy1fi4F3ubBA8lycs/lPl82/x/E0fNhmBBC6j
         V5kbRxthYP8umSaKTbPlO6bQJOCOc8PF8ZBpsSydlGn+qjcWK1QLlUABf+T1cc4jx3n+
         O+WT7C6NuOS0clSTY7T/rym+e+e0zQrgnhGvDSfs9t1p2rHMTJ+kS6m7tRprJ9iouOI7
         NK4w==
X-Forwarded-Encrypted: i=1; AJvYcCXGpexKBxmucWXSIScdhLDERIJUsY3delAja1Dlbk3620qBK3KMG8K9oB7AArNDmzC2f8T9151a2MIf8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBpz8iiPZKSiuoS8k5dVv+DKZuBs7wQeUUqAYXXndZlEJOHNc1
	shxHPRMVeRuaMpBW/TTPIPxcp+PbVgUveHHNrr7oTvnPK84Rtc2l
X-Gm-Gg: ASbGnctrAmy2R4EkghCEEv3uMijRu6LG7n7IzkreTlOwo0Ak+nFkl6O3cnYTBltvUka
	tFo+ta4aP0HY4s3TN+vT2Q+9eWiA28b75BRjoyTN993YDJyde3dlu1Ak6pwT4qpUxqqppNbTVex
	IoE8xrZn/SagJJvXtup1S7okU2dIlHjaLYwdFD07P/xveYz+6DEvQMoSptfpR/GE7AogLRcvl4b
	tVuqi8CyqSKWuGRblTh+mw/REW9wChVh59ezC1GLJjzVa+BUtk7ROZBAuHv0wJ9ahxj5hiJKQ9O
	OtUsIkhflk6+94WdU61Nmr/38ucN9W62Bi+NoFVDkVMOK5AiKeeuTero33IYbvvRZhyaCnUozjN
	Pt6yb5oxpQ0r3OvjZEP7Ue1mkWSk=
X-Google-Smtp-Source: AGHT+IGZ5cxayYN+VPQ5QBXlqfoxa/LdThi6w4Oeu7e/BRzEyeGhaKe+FBK0iyFm9ZSGmHRw9qczWQ==
X-Received: by 2002:a05:600c:cc4:b0:43d:cc9:b09d with SMTP id 5b1f17b1804b1-441d44dc029mr31091155e9.20.1746634199863;
        Wed, 07 May 2025 09:09:59 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a0b5b0d349sm2543095f8f.30.2025.05.07.09.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 09:09:58 -0700 (PDT)
Date: Wed, 7 May 2025 18:09:56 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: mperttunen@nvidia.com, airlied@gmail.com, daniel@ffwll.ch, 
	dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH -next v2] gpu: host1x: Use
 for_each_available_child_of_node_scoped()
Message-ID: <3tcwixvkxuk6yjubepzlh7kcyrvfhw6wqb4jzdbpowyfokrsmd@ltwfgluwzrqz>
References: <20240830073824.3539690-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cnrhbvhedw76ny6r"
Content-Disposition: inline
In-Reply-To: <20240830073824.3539690-1-ruanjinjie@huawei.com>


--cnrhbvhedw76ny6r
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH -next v2] gpu: host1x: Use
 for_each_available_child_of_node_scoped()
MIME-Version: 1.0

On Fri, Aug 30, 2024 at 03:38:24PM +0800, Jinjie Ruan wrote:
> Avoids the need for manual cleanup of_node_put() in early exits
> from the loop.
>=20
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
> v2:
> - Split out from the patch set.
> ---
>  drivers/gpu/host1x/bus.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)

Applied, thanks.

Thierry

--cnrhbvhedw76ny6r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmgbhdQACgkQ3SOs138+
s6FXiQ//eWNGJgEYk17XzTHp0ookSGIqVAJfm7AAHaBG9VwCAD1Cq3HJaDnAs52B
9A2rn0/Ws3WI2TIiZJtYMx5SCG9/ZMyCz6TZkECA2+08by0G+k5ve+62eW7JIMQ1
TCD+cvLN0ciJavV2+B379sxuB36FmzQuuJuRy3MaR2PzIjgER9OHtXFH5LDxTW74
I+TqzTOT7WDS8Fv35AcEdzfMOMHAzjdSWyD5n6ZU9OsM0xLsuqh8vFC7oygv6V44
awekczCFZMM5aDeIwYizdfG0n7hcSXkHb8u+0OhttQqJuvjnsRP/kyRTxld+B+lJ
iiWYbhlWi4Hi6v0CC41LoFOujrB99ayeFZFf3qs8e29z/wJm3OaCZQ6lsrEgb/hL
Z8JjjoA5T716hZ5O/C3bL3Mf2zSw6UTc+6iKaLn1NZJCFShrNAXetVkzYXpbG9xW
zx0wLjlp0vqT5y48/rAZ7WTsr+cq8u+6Pfx3+BXORyfr5fxYwlEdTgT6Z6tqQIVx
lx5qPwmrCkbbshL5zbkHtfAtgI3b3+YoNh2kEFwtNSwI4isc4pv1Nh/E+//nowmx
OEKfKUSbbMMf4mBzkw2n/iVNzuD5tgtVaVDI3Qh63BFf5QOd/kt/GpRR+lnKx7i+
aZrqzj8dJSWAFQRs+t5nFrXEJaPA2lLJP/rV6Kf1oU4B6PPwBPc=
=E2Ym
-----END PGP SIGNATURE-----

--cnrhbvhedw76ny6r--
