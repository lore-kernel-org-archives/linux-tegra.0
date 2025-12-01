Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7B830AAA9
	for <linux-tegra@vger.kernel.org>; Mon,  1 Dec 2025 14:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764598318; cv=none; b=byehaG2XWgXla37OGLj9JgduQsStePkV6cydRwvW+wB7GJpfcQ1vCom3Z7xWyizLD4LGtGb+xP5QupipLpPspXRgpXe0Y0AYkOe85RUJUvi1YhBQk4KomtCSr4TbtNfH0SmbbidA4l+aZPd3aEXdR9B42lnUkhnvTgS6zxr3ZVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764598318; c=relaxed/simple;
	bh=BVJmf3Xuu3fw/WPzSDZ8T/wbnfKxhSBCsKNf/k4giqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TkjJx4U6E/kcmaTifJ7kcuKi60t5z40jtXI8lgaYBzd7hpWsfU40twBIiTslk9LRRq1Njka8MzKExk5xiqM9twJqSrW7D73XbKFG1Z+riFirhwuSAruo9H6GOMeP+aFM22iSxuN3QvVn5s1AHBZgwHlA/pMt63mLyCIx2/c31/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VbwrnzZE; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VbwrnzZE"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42e2e3c0dccso724034f8f.2
        for <linux-tegra@vger.kernel.org>; Mon, 01 Dec 2025 06:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764598316; x=1765203116; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lHAOpqQKKIfRCCbc3jkSqq0l7D4yj6gzTY5ZBvFB9Vk=;
        b=VbwrnzZEX16pcL/NqTF+tLJeNEjJiRFM+X06CXHk8a8FcQmqxEMNAyo6jMLHhpR7Ei
         glmvwlTrq3vJL8rljo4yNpWWcyL7JXqwzN+fthXFaBDpWsVaTA6khpf68ft/U4gAmEBn
         JhQ87ozczr2+rZX+irQoBjBgUeRoBJKWRUuDIow4CNLe6IABqeM/+8qnLK9UVwylsBlG
         quqFS31S3JdMHcvU8Sj24klFfIogWbe3KWf484gRXItA8q+P0a3Tknx0mpr2/qBBIRvh
         fjco5KXvBBVBL4ePhf4Kuj4RfrGDZIj7DMBc/G8ZUa/mGpxsd1YbsH23nRHWcVhHq9fE
         FBoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764598316; x=1765203116;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lHAOpqQKKIfRCCbc3jkSqq0l7D4yj6gzTY5ZBvFB9Vk=;
        b=ZcJTqcNb4OvK6+zdd07nmG0IxoQqB9vmRDhrZmx/WS+QkQIwtAIZy9S2/9HG3gQwj9
         6IxnCKrfTpnbDZS9gDf2OgjWe90xABHvBMBxNSBQVl0i15+aHLw3AZPusiufUgL1KRgY
         Kql1nad7NKiRkW5uhho+ZTkKKyh43tnh3H4PCpRkKyw0CYkx0mhUldF3gkIwHUfo3LvW
         a7ODTvtE49T0wIaQQeBOqPHAyMCVE4VJezpe3nOPSlWdhny7HtBn2UDJnEKcTYz8qlsS
         wzfm/IY3l7yN2QkOUia+LVfhNhxiGVi3aKRBLbR7LPTwJo1BUdyuCrdf+PGzu6rHtSJP
         GKlg==
X-Forwarded-Encrypted: i=1; AJvYcCUaOQVGqWskfJTJchmAKnMlcF0S+D06SpUJyAC8fd7wPYcqd1znte/1fERD2n75wS8XKA3ErgKqJ18t4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjgBtFnRe4QuRBZiDXhPt6aXGQEXXftgtdbWViRidrgU5dZhJo
	aAK3f9SIE7IMiSpfpLYLAY5pYLF5cLEYkcK4IBjITvIfCXU8fa/Ko93V+6TeRA==
X-Gm-Gg: ASbGncuubjzCq+FvCIJmeIebBtMObATtmifoYJ3xLJv5Y+GIh16Gf/mUfE6G+OLKx77
	81FPRw8HvdcmBOA7arDFP90bHw6Dvu45bO7Cml73Y5aaI/p3oSdC0uOiyeLbEMvs8NKof23FvLQ
	R/oSOhLZzX+1aQGF2YcUP8txqjEf5N4CwYY3zKg0HCR5FvZ86vt+GV3EHNhFVTk+Yor4RZamZl5
	UAH5UMQhTEYTQbk3h1oW/6c/ze2kIMyuFtmnuugh/fANXcD2w4WO4Gujhmq3mi4qT6zG3/satmu
	gKlHhjTgdTHSnjIu8NnrzKFJBM7fqHF8i4mi5XfMXzFoCPM/EdsqU4vbgcBPAYQf3YmDvmTs6bm
	wH7DfR7+bFWZmVhZHFaVxg7MJWxghcwjSOKMPo7KNskUSPDrthNCnnk50G1kwpCemeqOI8NLXTE
	OisBpzeShcA/89TA9NdxKJxGV3iWRAxjRQuy7r7Ph1SynSmeelav/uVmwiVgWF/E0sTQgLUb7/O
	jNsXJ+7N/03
X-Google-Smtp-Source: AGHT+IHEWXHNm4jgi3iEqgIv+q3HmZbNeQU4C1w3dyTpiZ7UGgjCSsuVYY08grV8BGGXUiZK0VrsYg==
X-Received: by 2002:a05:6000:2385:b0:42b:2e65:6576 with SMTP id ffacd0b85a97d-42cc1d51b47mr36718531f8f.50.1764598315408;
        Mon, 01 Dec 2025 06:11:55 -0800 (PST)
Received: from orome (p200300e41f07e000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f07:e000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca1a310sm27546394f8f.26.2025.12.01.06.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 06:11:54 -0800 (PST)
Date: Mon, 1 Dec 2025 15:11:52 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: Shubhi Garg <shgarg@nvidia.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-tegra@vger.kernel.org, linux-rtc@vger.kernel.org, 
	Jon Hunter <jonathanh@nvidia.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: drop unneeded file entry in NVIDIA VRS RTC
 DRIVER
Message-ID: <svixpfd43ntolkh7qflmlry5u6xsbffzyqcvvjx5ddnnhxoflc@wucgay3en4md>
References: <20251110073544.443816-1-lukas.bulwahn@redhat.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2fsv5t4iejnahkav"
Content-Disposition: inline
In-Reply-To: <20251110073544.443816-1-lukas.bulwahn@redhat.com>


--2fsv5t4iejnahkav
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] MAINTAINERS: drop unneeded file entry in NVIDIA VRS RTC
 DRIVER
MIME-Version: 1.0

On Mon, Nov 10, 2025 at 08:35:44AM +0100, Lukas Bulwahn wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
>=20
> Commit 9d6d6b06933c ("rtc: nvvrs: add NVIDIA VRS RTC device driver") adds
> the section NVIDIA VRS RTC DRIVER in MAINTAINERS, which refers to the
> non-existing file include/linux/rtc/rtc-nvidia-vrs10.h
>=20
> Note, with the changes of v6 to v7 of the patch series adding the driver,
> the content of this include file was moved into the driver file, and the
> include file was dropped from that patch. It was simply missed to adjust
> the section in MAINTAINERS that was newly added with that patch.
>=20
> Drop the file entry to this non-existing file accordingly now.
>=20
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--2fsv5t4iejnahkav
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmktoigACgkQ3SOs138+
s6HFuA//UXHErOTCDPmmtxQcXOB6bKl7xnjaUSYWgpNbxFW9X8mim+q8QUeylFwH
ZUw9gzo42SaWY+gJWKIBUhx4DBjNLHTU4ZOBsqpVhgS3qFbkFEzExdj4eQF7khH8
ambbPnXHOvfdorpaUPKJd3mMvbB5LjX+2HgRA8itb/bS9zBR64dqBSEwtQaLTBTk
MKRSLamu7YgJ6m+wXkLiPhuCHqIXgS0pGFoNqBU8/j/TrmuTo0C7XFAZAKG0Vz8a
hn6/Uv6K8yE1QLvjCF9iLa7AiZG0XCuR2vIUMto898TpSu6QjfW480MVLOf45U3G
7Xa6Yxhsn5bibBDeTBcEMisAIZTW8+g6XFmb15bQ5DJ5vAKDfBa63sEgzLfgSxlw
Pgbvbq6g9ICbO5kNpPiXL0La0yKnYMHYaHJmQyOkx0DLJqfZOnFTN2dY97EIT7Xp
fKPZMQgGI/Y6I5MC6zAP0+0eGXfnGtAFjJIFYw00RbprnXqQpQbh5ccG7dqYs9gd
m6CvnRk5TZ9eiV1YSH89ZEAqT8Rd8sz9M/32kNt2ygX4DBEV+vAdSN1uMTLclbDz
BHm0KyxU5i9YQmZXZIwQSd292ZWsDgUFxtFrUatbuqM+y3xYbZYLCDX+K9JDFyv7
Bu7Xl+EAQzQ17mgS1lyT7m75DWUWbRYm+w8vsLja4uLSDb2zldA=
=qhJ8
-----END PGP SIGNATURE-----

--2fsv5t4iejnahkav--
