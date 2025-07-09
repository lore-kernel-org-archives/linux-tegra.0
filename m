Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A77D1C1F13;
	Wed,  9 Jul 2025 12:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752062892; cv=none; b=AbqKM5fHhM4iCO4Pmy4fxVEFI+gsQ0lNDrI1tiebj7GzaOjGqh8ruOdYhDmgqGeBwvlgFBGrGK5WIIOByncT8qpb+BU+X5FvAmLJDOWFO7gQZn4VUChRzhRUvu/lG/LhSGw9X9CRVidiFnIWQuJ7grQQDFAH4utCcwg9pv6NHaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752062892; c=relaxed/simple;
	bh=0TGwVBbfI4sy043o3QJVws4UO8A5MpgEz50iBrBsWKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MUh/5zAzIprN1as7SYEL2SB7bSSpo0AFmHwIhoLZJqn6CQwB+8PHTDdvx/AC2p+lLlm44xmRM1DFuK9Kixrm1fyS5oNmuVGjTOL14zUaggP333ZsunwzdDZwAxWX05eQPw/KRSECRnNa++O2CWJWcJkka2BgAMIIxsRq3Vox7+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cAxMDMb+; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cAxMDMb+"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a4f379662cso4765734f8f.0;
        Wed, 09 Jul 2025 05:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752062889; x=1752667689; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IjQPHZ9ynvxD2rS3Yf7vu4AQO0hXoaY1LtKjdEL+iyM=;
        b=cAxMDMb+sddrYzl7Na50BgJ3H9iVEXC+49VKj+pUC6Alb/h9pDKJYm77VqKbD47ye+
         /2Q5/ahrgJe0JJtvRkutPPxg5V6fh9kcmSjeN9Q8oxPxFyr5/ZpoHNgK7jrF99JybqE7
         qHJ1RD5DCkynzWX4RIVhTlQ/a3gvILNRuJ3xDnIW8nNwlDalJn0868fAxQr6VVYVg8uD
         qtBB6R8Y3j6uB2rM1Z7bq5NczWtrSecfx5IV+ggU8goZlMHZ2ZwAncTO+ppG2B+sb1IN
         lxbjbhb6SQ/oMYg+C5IPqb20KNfEVtBRGTNgFuwoFDVhz8LyUkYzwQGEnwX4iF7zdQmw
         mMng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752062889; x=1752667689;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IjQPHZ9ynvxD2rS3Yf7vu4AQO0hXoaY1LtKjdEL+iyM=;
        b=l0OJfZnJcU0/EhEV9zN8HdMRMe9vel2BVuzKrtx/OCBAAxLa50SBYpNovhMm7S1orp
         uVGH2njYNID+2Ekmn8BhYxNYl65z1OyU+EPY/ktuGfSRvs8zJ3T6VPsWEl1X7LKY5WaZ
         YSepUfy+R1YmZyQtDpUeud1Y/qlCh3alG21vwrFcqUqL9/GD/dBEix3/KSpdkJRNGD0D
         gcZyCFj47EtFiqDTGagJ/xvjAF+crKxo78G8XSTmi369eu9bluyQZLLg6MBwA32peFay
         4eVqDptTrkw/0CFrQ4bxCgnw4jIWJaNZ6yvvihnzmiACQTF8A0OA9Wjlv1ORQi4XG7oQ
         1vgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUW5xc8rfR1ZQniMHQg1LoRDrEsw9hHQKi8xTNR0D3SFNz4Py8LoFFwvcfuHeg6eWIU3O1gGL3NR7E=@vger.kernel.org, AJvYcCUemqk4R731VWpGicIhPIarxv54JPCvpj1J/5S89uw1WWecu8rBwYnWgFG/HI7i5fJXlUzR73XnW2PeZ0g=@vger.kernel.org, AJvYcCXF6OQ4qluHDBEGTlQin9CJB8mmWDw9W1/DD7ymjDKyFsm9HChcSWLcYAnbZUUQUEQfx8gGqYGNroEBaF7J@vger.kernel.org
X-Gm-Message-State: AOJu0YzGaCpSFzMXP3B9gOtZ0YvEDJ7uSTWXDsMrbY6DYBmhtroCoTYN
	UH5a3eNh8r2FIQnhLXPxuXcidG4fck+Owf4Kl7NeDC1oyeoCuEo9CQ74
X-Gm-Gg: ASbGncvvlqDJAX9WbBJ4qtRi39bFRQjiqIgd+133QHZH9PJen/aVIqrqtYuEMTE55x7
	tZH8NXM9pB9IutJthyHECcMpu+p0MphDJRXk5haSd2/TDGjBJSJIl2jQ91X8nzYRWO94CDFEass
	EQ2OxlzASoyooEwpFoVoqiQvWXs+BD68W2D/HjMf66AIIqrFFCCTU1P2y5eMIyYjQszBV72UWaf
	qn/Ndt6pGPddCDvGFHLADjYYcT3XJ/pu8mn5KBjx6agD9pyrHhOSx+Qttcx5o2UyXk6MMzYFxSz
	+yuntTKUxb2eQdzcb1e/sbCXr3KQeMoCZbb0oxyk8kbRcyS3n8wUlwm/4t9IhkJsoFbhdhxgRaG
	0lBZhjItlEDDhUygCQbuX7rdZFpLo1QG0m6kvovUJE2GI3GBV
X-Google-Smtp-Source: AGHT+IEA39s86i/v0pMayG6MQCNXniIC/f1IoHZeBXiCa548AvyVLpkQNHziiLzE25s483vSNV2Eiw==
X-Received: by 2002:a05:6000:40cb:b0:3a4:f038:af74 with SMTP id ffacd0b85a97d-3b5e45311b5mr1977474f8f.51.1752062888454;
        Wed, 09 Jul 2025 05:08:08 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b470caa1a2sm15396455f8f.42.2025.07.09.05.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 05:08:06 -0700 (PDT)
Date: Wed, 9 Jul 2025 14:08:04 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mturquette@baylibre.com, 
	sboyd@kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: tegra: periph: Fix error handling and resolve
 unsigned compare warning
Message-ID: <jwlemmk4el6chr7fkzratg2si3s7rls3itq6ki7nbh4ssv3f4w@dxv5xnagtryr>
References: <cover.1752046270.git.xiaopei01@kylinos.cn>
 <79c7f01e29876c612e90d6d0157fb1572ca8b3fb.1752046270.git.xiaopei01@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dwom3yesrtmpnusx"
Content-Disposition: inline
In-Reply-To: <79c7f01e29876c612e90d6d0157fb1572ca8b3fb.1752046270.git.xiaopei01@kylinos.cn>


--dwom3yesrtmpnusx
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] clk: tegra: periph: Fix error handling and resolve
 unsigned compare warning
MIME-Version: 1.0

On Wed, Jul 09, 2025 at 03:37:13PM +0800, Pei Xiao wrote:
> ./drivers/clk/tegra/clk-periph.c:59:5-9: WARNING:
> 	Unsigned expression compared with zero: rate < 0
>=20
> The unsigned long 'rate' variable caused:
> - Incorrect handling of negative errors
> - Compile warning: "Unsigned expression compared with zero"
>=20
> Fix by changing to long type and adding req->rate cast.
>=20
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
> ---
>  drivers/clk/tegra/clk-periph.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--dwom3yesrtmpnusx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhuW6QACgkQ3SOs138+
s6F5ew/+Kl2vGIaJ64fB7E6Xm2JjEiObyhSy9J7weUzAGKcRzIOGaZLJkU3hijLW
RSBiQ5X4miuf8d4l6xMxKay1zEIS1fwFktZ8hMxxO0AHLUjNF0GbL1iI3zVOEpJw
QlC9yIr8MIaIvlC/+5IkaTKVKbPdgZHQDZoqtFCuNW5dvlSE7Hi1net3t9UVuRk3
uDRKnfGqsacjP1JRjkLFz3z+QxpWQaJmZVNpPkxclpm7ecdGWxf6+LkbuY//aOgc
LBA1n3aeKe3YgHMZ/IWi+F9PDix+lrj3fveJKvYvJB5FrNhLauZa7b8na7nFpv1F
VPs3DtI9F/xQr47gDK03/y49etZr+QHIzFSxnzLnRFfPwn2skdUTsxzoz0VgDTa5
5SuGftvnWGC+8RokvKK6s0kBQrLqKc1qq9A8IHth8EPxiAKtHyb/XXzIRlRB2kX6
EGwvGwos1dq8tooO64hdiDpze8+Hl9RBd3m10CjDH5hLsc+MQ06CKV8cPu5nTgZw
1Xo5W23BnsieaQ+92lmm41UYEYh+SEow/XiwE0ze2I/gPXVdCLftQkpJs9LQMXX0
zMiKhTd1Sl9lQ9zmoZygdSC6ii6lsIo8yrSOeRJCmQEFtsgZZWIwSSJEdxs8nP5W
J7GXaF4nOriHIapiT2l3cRlWMdbrByhhFSkXUHAg4d2BmULY8Zo=
=FfhE
-----END PGP SIGNATURE-----

--dwom3yesrtmpnusx--
