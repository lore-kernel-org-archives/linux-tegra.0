Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5F2524D7;
	Mon, 23 Sep 2024 11:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727089287; cv=none; b=TxiXnTtN/3unNSMBsJnHuyIYs/metLzsRoFr3nLPUFXWBL4/YAXIaJ99lPlEZqw4nmKONipcilgGjdiOXGnI+XWO4E+XbG8TMK9j45DO1/6AhbeIFDRx6T8r7FbzQXeeixVQrRJsUrvwUfdFUXGdDM3lFf+sNixDh7RRnFzp7S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727089287; c=relaxed/simple;
	bh=B7fJgQO+IwcIL4JDUyACIQ4RACsjWyG4aRKlf1A+7I4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=blkqP8nlD4JU3oykDYFLagT6J0Y+sZBY6CnjLEBkEfZ4Ltdr0AZ5ly8bs3wUCm+qgjoBrIJ+VUVrjH5T9U5k25zKBPiG+4rxvCJYCGXeLmDASjU0qXspXobGVsExe1m1fC7X2rhjeIV9jgiD7iJD+sWvSy3UNYTuhdTh/qm3uYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ggQMqa9v; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ggQMqa9v"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5c413cf5de5so5654268a12.0;
        Mon, 23 Sep 2024 04:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727089284; x=1727694084; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rTwjyJINn/UiyHVLTt4SQp0fQnAkFaFHMRg1gYcKq54=;
        b=ggQMqa9vM1jCVj4dc2Gi71je5mMPdxT1VZJQSUtEnYWXuBBiR7lvfwBN2knJVW6oBU
         IInkUYW0psfjIbCo2ckHWV61Yqt/R18kLmYwKGBjdhbs/AxeaHv9ScYDXU1HaVfrchXG
         o21F1k5MtIXIr/Gr575sEL7jRVMO/Lcmw+u0AoeWYP3RKqpZWjlSHGVe1Es8K3zTtpgh
         GCV8RCLxrSPks4EGNbS8sTPHPxGE5eqsC3cv6J2gEcs09lXoL0VO5Xvu+x4ANxxbln9D
         mVFujlp9gKsTx/hSdugu1cl05iciaxtSlOlYaxPmmc10s4AGXEy87n2MA+GdGgn8XDeI
         eReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727089284; x=1727694084;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rTwjyJINn/UiyHVLTt4SQp0fQnAkFaFHMRg1gYcKq54=;
        b=cLcg2hpjD6UHJWHOcAW5p2QN6SsIRb7TMiBYaeH6pCi1jiL9PRVUZUjtb9Da3R74Fv
         DzBjfdOwxPWzSMfFGB//rW9se2gdn+0ccKDT5x4hfPb+9yPZNarXJaTZ9g/x00YsxoAO
         bCR1jjYJLFZTXw37KILXLD1VNIZ91mJB/Jb5CjFkQ4CP0IV8Zl6BCx0eLbJVzyVaVgL6
         iRLDjUCbU5u9a68Gel5j6V05bcM1bWXzd8IYk6npA72/E9zBe6b6D459cOTf5s2enFV7
         l0VAUyrhMzNceXxu2nqvjAtfXQBai5wA0eZkz54MzqYU+3W8A5YUiGTiqgJIq5nb7nff
         84nw==
X-Forwarded-Encrypted: i=1; AJvYcCUUh3VaukbcgwUxWtGaaOZa0qrNBIqJ0w8S3yHj2Q/SpiV3k4/aA+wlc73WGs6Jau1NNIxn5gSXzRDP2XSE@vger.kernel.org, AJvYcCVu+PSTlzdsuxI/m8X3U7JPdv3n9PnL08wr8zmJWEbWmWSyrJ39AeDC/60xwMTKhVf/3slF0mckSSUDZig=@vger.kernel.org, AJvYcCWorDRJ7icqJZ9QlqMIdDP2dyKj9vjL3zZz0ojnFUsuGVFLDHBFmV14/oYEdUEYqE29F/6Bn1ndJczN@vger.kernel.org
X-Gm-Message-State: AOJu0YyeLByq0ut76VnTdKFQzIdAf3ZEJjD3o2il/SEQahbokPxxG4RD
	C7vzIJbUDtxc/sB/HAsJL3ij+Al/l6aacMh1nB99j3ebh+Bhn4q9
X-Google-Smtp-Source: AGHT+IHxMTVvUNTmfoksDdljADMNOLyh6BbAqWSEdaOlDI6rNFZYgiSbwTk4raDX/Zj/cptvuLggGA==
X-Received: by 2002:a17:907:2da9:b0:a8e:a578:2b63 with SMTP id a640c23a62f3a-a90d516727cmr1224056966b.55.1727089283729;
        Mon, 23 Sep 2024 04:01:23 -0700 (PDT)
Received: from orome (p200300e41f147300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f14:7300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90613303bfsm1195843466b.202.2024.09.23.04.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 04:01:23 -0700 (PDT)
Date: Mon, 23 Sep 2024 13:01:21 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: tegra: add wp-gpio to P2957 board
Message-ID: <goi3wqrbva565ejst25fwflgvp4d5vznmqlba4q6liylzdkwfk@hovwpzcnvf2q>
References: <20240815-tx1_sdmmc-v1-0-7856ac25a204@tecnico.ulisboa.pt>
 <172494536049.1302383.5328678787632525054.b4-ty@nvidia.com>
 <kbz72jma3bj7dnfnvdjo6m5yqrvjwkvz2gtt6bxpezkslwt3kh@a7wqzkssdfvf>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mc7zawmzeupknuyz"
Content-Disposition: inline
In-Reply-To: <kbz72jma3bj7dnfnvdjo6m5yqrvjwkvz2gtt6bxpezkslwt3kh@a7wqzkssdfvf>


--mc7zawmzeupknuyz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 30, 2024 at 11:20:45AM GMT, Diogo Ivo wrote:
> Hi Thierry,
>=20
> On Thu, Aug 29, 2024 at 05:31:23PM GMT, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> >=20
> > On Thu, 15 Aug 2024 16:50:38 +0100, Diogo Ivo wrote:
> > > Define the wp-gpio for the P2597 board.
> > >=20
> > > For this, patch 1 fixes the assignment of the vmmc supply's gpio that
> > > was incorrectly assigned to the wp-gpio of the external slot.
> > >=20
> > > Patch 2 adds the definition of the wp-gpio.
> > >=20
> > > [...]
> >=20
> > Applied, thanks!
>=20
> Thanks for picking up the patches! In my testing around SD/MMC I found th=
at
> currently UHS-I cards are broken on the P2597. When trying to use one
> the system shows somewhat erratic behaviour where it sometimes hangs and
> some other times it simply fails to read from the SD card. I have
> tracked the point at which this happens to be around
> tegra_sdhci_pad_autocalib() when switching to SDR104 mode, where there
> is the possibility of using specific offsets for this mode. Currently
> there are no values specified in tegra210.dtsi, so the 1.8V values are
> being used. However, when I tried specifying them as
>=20
> 	nvidia,pad-autocal-pull-up-offset-sdr104 =3D <0>;
> 	nvidia,pad-autocal-pull-down-offset-sdr104 =3D <0>;
>=20
> in the DT things started working fine. I did not send a patch with these
> values since I could not find what they should be on the X1 TRM, are
> there any recommended values for these parameters so that we can have
> this fixed?

Sorry for the late reply. Looking at the Tegra X1 TRM, section 32.7
"Programming Guidelines" (starting on page 2473), I see there are a
few subsections called "Run Auto-Calibration", which list recommended
values for the auto-calibration pull-down/-up offsets, depending on the
signaling mode (3.3V vs. 1.8V).

They are:

          3.3V    1.8V
          PD  PU  PD  PU
  SDMMC1  125  0  123 123
  SDMMC2  n/a n/a  5   5
  SDMMC3  125  0  123 123
  SDMMC4  n/a n/a  5   5

Now these aren't the ones you've been using, but it is what we have in
the Tegra210 DTSI file. Interestingly the TRM doesn't make those
specific to the mode (such as SDR104 and HS400 like the DT bindings
suggest they should be).

Also interestingly, on Tegra234 the recommended values in the TRM for
these fields is 0 (like you're using), irrespective of mode.

It's not entirely clear to me why we need these offsets during auto-
calibration, so 0 makes as much sense as any other value. The
documentation isn't very clear on what these values do, either. So I'd
be inclined to accept a patch such as yours based purely on the fact
that it makes things work.

Thierry

--mc7zawmzeupknuyz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmbxSn4ACgkQ3SOs138+
s6EHnQ//Y8alU8VqYitvTFckK7KuVqRhtMGfqmYlJx/t/uFB016HJbm4iMhMWiJp
B3LzYb2A2mDR2Y6MFceItdb0m3iuBDL9GORtEDVL6ILYRlrA8CVwJgjtfaPBU2pb
sbuxfD5GQLsQaMOc13IJrvtxfWYFyBny5T0N5+/GiuoeAYE7tjN6V84YcB8QBoiF
DcFJqzgPgiXG5uxt1jKTFUQMU6c6ezu5U+BrL1dvetx5SMmJBKUFs/9ESPJj+7qe
KXGRwfkTFOSAYlwvrX7d6K68YRmqAVb1uBNMB/b0+Z+qGvB2xA4A+7Gms6VXdipN
JeJdQAYwz978Ujc7GWXfvkgMVOJRp4HT+s27O/KfLkSsdLhJy+epbWC+q34mIyvO
5Bp7OPWKaCR2KCwR3POWXJZ35WJ3kxsF7uAoSofBHR9NG86zymGeVi3ZhrhhkQ2v
+/idbpNlg1oU+ySTkk7AGlJlc9v6j5+NRtR8en6AMApLQSu7aUG0CHl5Uc1L8+pX
JAFM71FllxW9ISMN+Z0WjYq22fXOPtyoxS/sz99ruU0QUL+L1m7zOUgZDkuZkreE
TqsQyrwPSTkK0wMgfMn7g5AXCiHRvuatGuLdUpGApfwGRn3+f1IW95bSF0O0cbBc
zf1qcU9EvMVBOIUjHS5Twnr6P3SeM88ky57075PQd2PmxpQxeCs=
=xzSm
-----END PGP SIGNATURE-----

--mc7zawmzeupknuyz--
