Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4D32E7BD9
	for <linux-tegra@vger.kernel.org>; Thu, 30 Oct 2025 19:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761852282; cv=none; b=oZ9G6zJ8pa1jAkMNA6OyuB2DYdGuvAuAyK9389Au7+uGcTHv7jsc1k/zo0z7Tdnv76kOcZy8EG2Aq7a7DPUMkXPuO1BPrXREBlLXb0fBdLpPlkkgOkWKm1yt5Kj3T/uKp4t3pwcMcItAVRbfvjwOpfVRnam8Dk+lg8qmwA3STVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761852282; c=relaxed/simple;
	bh=ElrXgu5/6xmif6tI7ecktlmvL8AO7hOZe+lhNKfz7Nk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nkt8iXcqs5gArsWAmrpF/4eEQo7pXuAT0dZedebyqay3DpnqkPeW8xeSyrReMg+C/hxK5ltiRKJmti+LMKmQmuBmvWU56w3rZKNjCvY3XCgOwYSUb1CtILOiH0VrMvFy4byCrd0oP/DS77QVav1nqL8fR/cSmJhUiFZQCLfhQ58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B7qfsxbO; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B7qfsxbO"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b6d5c59f2b6so366244866b.2
        for <linux-tegra@vger.kernel.org>; Thu, 30 Oct 2025 12:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761852279; x=1762457079; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qzCB8jIK8FF50evWPCp3i6KvsKUySMbzRnMGfOqE7VU=;
        b=B7qfsxbOlRmXNS+NAYWCKiuuUwDiaBm5u0bIsx05QP/t+SrapLrhI+MMw64W2AjFEJ
         6OGs6m3KougM3+imFScRH+fb6xgyefAlW4GiaQanIKfNGbNCkw7hXHOOsIWzQfet3l1j
         bm3YkYpdGYWcqmWRGSGcNYeWCaz2c5xxkydjQNxNUV42QNbjefqqn6MQWmYWLjlERFg1
         TdmSw0eCqRxR5hKN772dSZQxPH8ih98oELTY4gQLFmR2UCv3yHPAM6XFsne7tNChvSBr
         wdZry0KgIb5nlPVH3+c/MrDGmNNZDLI84f6JMuZ2TXG3nk0rn0+7iKVsFMmAZc5LyteB
         /bdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761852279; x=1762457079;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qzCB8jIK8FF50evWPCp3i6KvsKUySMbzRnMGfOqE7VU=;
        b=m3lS9vHJRybKgcUrJF/lHg/0hscuJTTrqegt9X6ut5QXfIfBeHUPlPqedXbCGVbp3D
         28/YfkxOFZ+3auylE1U/M23WjHA7u7ZyG/AUs9bQaiGrsx+05JHTeXd4E9iUF8vJCRiH
         7oJp8qL9VFLdUg9Xy3E7F+2K3PZhiVFdjf8TMtKA9Yr1xirRZlc8Nut9/Y8nVUCn1g6W
         brmbvCwq+NM9AmBiUJuElsVU2eC7ErdFLE209bbNXP9XlTHKoF+K+Kd+OSrgqkCcWVzF
         7BHUGXfgZ8VGmMODziPJvb+VsLWTaKqxerr5NQZ2m1hp1drWKB5PKggSNuZTJTjo8Oru
         94tw==
X-Forwarded-Encrypted: i=1; AJvYcCXAQN3xGRhvQaEGKAwSEw2U3bKbWWpAumo4b7d2zg7Wd9fE+wzYU2KEarzx5D1Yfi7YFiwsc02HZirZaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8MxUFQ28LvZXTzLKhYfxZVx4Z8khFkJ3ICeUf0KwQJd6olOtB
	YDygABjn/SxxVYqq6ZjQrtstvCvQL79vc2M+8X9ywklLwF0nJ4P3SAfZ
X-Gm-Gg: ASbGncvFqtHluvvxClWnfey0QVHIYVBiw/HSNr1pjMuhGcA2Dg4gWxubw5AEc45IfV2
	4BRQUBAjSjD6Fhof4G9MBJDxevDjEfxKiRXBlEdcQ/UWMZA+RLlO07KUz78TRpneWLSvzpgoo5+
	a1xR3VMQnCeT6hT8Cp0X80mF3+2N705KRrf0IyG3chCW3a54dgczrgxwvp/eKMWBZ8fS7R0v1FK
	qxghimleXf/o+6VSiqx2BtzKz3L5R8CAkMifH7jqAU1yPmC8eOgPaYqW2Nfn8CroQJMUuOqUk1k
	9xNT8hkaVkJ/MXmQk6PJdodqjVq+4GRDPWbS8fhgulDrzcPbYsDSz2cdKZ+igJJXU3xE2x9LpCP
	V5X7QFUHadEDxwn/5b1onBver834eQxEYC4kEz/X8YrQru0NipYbszcpp9XDZgJjbCjG+cfubLa
	jy13cnyq8cNrRazauHnczV5GlA/VgMSwe9EoswXdmN464bhkZpQ/+5JJ/ApWdIvxc9JcjVKHolL
	w==
X-Google-Smtp-Source: AGHT+IHAE2zfsvxg+WnKGQngg9O6/M2cc0o7OkY6Hhcq5Dlt181nXlixhzrIiYnYnVNrtbX+aXzOuA==
X-Received: by 2002:a17:906:fe41:b0:b3d:73e1:d809 with SMTP id a640c23a62f3a-b707061fd71mr80792866b.48.1761852278602;
        Thu, 30 Oct 2025 12:24:38 -0700 (PDT)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d85445e81sm1827260866b.64.2025.10.30.12.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 12:24:37 -0700 (PDT)
Date: Thu, 30 Oct 2025 20:24:35 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: "Sheetal ." <sheetal@nvidia.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sameer Pujar <spujar@nvidia.com>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH V2 4/4] arm64: tegra: Add tegra264 audio support
Message-ID: <zxcety2tqsv6p5p2rqaa3e4un44m2loo4zm5goeansuf5zdly6@jqeg2hm5rmcz>
References: <20250929105930.1767294-1-sheetal@nvidia.com>
 <20250929105930.1767294-5-sheetal@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="istw733rho4drg3w"
Content-Disposition: inline
In-Reply-To: <20250929105930.1767294-5-sheetal@nvidia.com>


--istw733rho4drg3w
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH V2 4/4] arm64: tegra: Add tegra264 audio support
MIME-Version: 1.0

On Mon, Sep 29, 2025 at 04:29:30PM +0530, Sheetal . wrote:
> From: sheetal <sheetal@nvidia.com>
>=20
> - Add the audio devices for the tegra264 SoC in the tegra264.dtsi file,
>   which includes sound, HDA and APE(Audio Processing Engine) subsystem
>   nodes.
>   APE subsystem includes,
>    - I/O interfaces such as I2S, DMIC and DSPK (all the available
>      instances).
>    - HW accelerators such as ASRC, OPE, MVC, SFC, AMX, ADX and Mixer (all
>      the available instances).
>    - ADMA controller and Interrupt controllers.
>=20
> - Enable the audio nodes in tegra264-p3971.dtsi platform DT file.
>=20
> Signed-off-by: sheetal <sheetal@nvidia.com>
> ---
>  .../arm64/boot/dts/nvidia/tegra264-p3971.dtsi |  106 +
>  arch/arm64/boot/dts/nvidia/tegra264.dtsi      | 3190 +++++++++++++++++
>  2 files changed, 3296 insertions(+)

Applied, thanks.

Thierry

--istw733rho4drg3w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkDu3MACgkQ3SOs138+
s6H7xg//eVts+nMHcP4RRSRZowrB9Hev9Ui98kXJyEnnlm0YVJ1AYLz7kUIHXMVk
gwdifz6s85sfO+nufj469hlCm877zZwW+gO2gTwF3t7hh0mZ6tRVT0qqgI9phsM9
IkBFhAlmqFZeznEUhYQ0RktdN1h0RW0nWhG7fzyUMLS9RltTMHCDgbl8ckXoTLBn
9i1coz/Zm3puDLiPDE/LsmASeYXhtaB5bbkNLlbdN7yrrWOSEJMXTFbllErAv37b
Ycaa7gyZJviyjOO0/245sg4QO+PHcPFdBbxtV4CaON96uSdlIWqAcQUZKUvAKPMO
4OJ2pKTo7VIMzvXmkcqpbPWySOrFj2sfLTb3jQX+W7KTv2R9n9HxkANbJ0rQn7+z
rr4xzQFVfsTd2LP6Mr84wStmyDdlXF9+kwVnH/F7tKT3ZAj3bL93Q77W1tPduHwz
qlRLtQgCVX0KuTb7Tezs1IXbxgaetulHzWRa8ayIYhb9gNf7gZi3C0PUSPP7BtWF
p7cMVV7yq0bqRZ2q+PanKUvNUzNS4zJJoAuMHGtXdR6pedUq+T3SHoqdmxmRo2bO
5gTYoHd18rOs2+43CqRmgfHmqm+Ei4k4pJSVmIIQMKGbzHvn2Y3uPgugI4GUPP2P
KxhijmcU+KzqlklSQ/xNrTdLYyoLiOWdCi/AFzSbRoc0TsfT+oU=
=sxTn
-----END PGP SIGNATURE-----

--istw733rho4drg3w--
