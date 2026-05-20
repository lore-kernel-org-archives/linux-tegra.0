Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FF33DA5B0
	for <linux-tegra@vger.kernel.org>; Wed, 20 May 2026 11:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779276850; cv=none; b=R7DE/XdIY5j8Dyj16V3jKugIoRn4jBypOvzbf0KRsTRUXxhu14TPwyE9JFTTlMMsbSmReMga4LRBkHk8pPzZRm0/IU/PHx077e+B4HALL/B3ooJYyYSIJQorjJ9jW4bJOT7Gpd3AaPxqQAUIu8D7hXMJEF9HyclJqxBIlXikc5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779276850; c=relaxed/simple;
	bh=mZf398tO0M7pGAFleQA1/zDCux+F0MFC2QT8L3t3rwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gsmizns4BWf5RSv5LCUnXCs7TnzfncPTFDZuK0DijhzzFbmL2Fi6t+8Yxm7EQ5ckj+7/19DctzMkFk0NtwuWq7JNK46UlMM8d5hpx1MQSGg7nq0DFHIbzJvz060xow2Ok0YrJNNsiSqlivp0nB95uOsSdoXNx7MjU2Ye8B3ZZ6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mGelq+eF; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mGelq+eF"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43d734223e4so3076276f8f.0
        for <linux-tegra@vger.kernel.org>; Wed, 20 May 2026 04:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779276847; x=1779881647; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mZf398tO0M7pGAFleQA1/zDCux+F0MFC2QT8L3t3rwk=;
        b=mGelq+eF10VeFQ4swjLpv6f1AzLthYvfWv8m53VQxEOgbkeNSsvQX5dqM5MHSS03X9
         dLK/z728gk02Dbmw8cXWf29NSbiXw4zsiZzPydWAc4gj1LtJFwSX2NnDRhbNATntUky6
         ETqhWkq7evR+BvT3PcXVDfDkCygD4qmuUF9MEMqZxxZ2Q0LGNhdhfRUQeRSZR6G2jE1r
         u0Qikq0UKNGemgFOh8FKlGOs9Q9npIHWtXCVVwXNLcb00VL1a4mFu3j05Hotik8yxZrW
         nRw038+Ct7YhGqOAigrfEL/IscyZOpdizaJ7+Ttnx+NJF+brSBZJbiNdATC8i50Kix+g
         k/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779276847; x=1779881647;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mZf398tO0M7pGAFleQA1/zDCux+F0MFC2QT8L3t3rwk=;
        b=VXAnT2XDd/CwjW69YPnid5Bsfvrs5aD9jA3Zxz4TBsMhgJLqHlJVJf1KccajeVhxiG
         MI4XBAO/8kdZKUccDkSSdeNxpNENQKJaK5ebNs+85qqdBNy4SLUkh2gdzwyBBo3erJH4
         G4rOpe5E/xSskN683c1Pqi4I4zsqQC72P6QYoD/89831cpuN6rpEQDHzoviv6GYoqaES
         NEJJiRdIQJYXEn25k/a7/gvD1ydHtkgD31Yyt1YcMkVUPlEJkAfa+UapQUmXyHfQk1wA
         2AZ15I5Rbat/doSO1UofOT5K3+QGcUDvIEy9OWj39Bcdu7j8cjTAlOswRM7r0P/qoKqn
         gYcg==
X-Forwarded-Encrypted: i=1; AFNElJ8bZLWG2GsFJfQSdnrjJu+UvlZ6r5PNB3mTOphBiFemdFaCJFV6drgxqlLl55lAw5PmoeSVVLr7Vvfsxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDaxhgOREYcdG5Qv8FegDWOZ10Ay5Ws3RcwWE3/VWRzCqQdMxf
	mWaoPjRbijacGVcVPGgOciPMWWL/Gbj14u/x18brhMFPvls/jfDGvrp7
X-Gm-Gg: Acq92OHwboEHCzZP+GmsFI1Ym+ProwveebxQSKyvVdvD1mszdGT/Hwr6x42uY2rdWTU
	Kl8P0ohGeJLp7c2Dp90zaRSFKQDIwDHSalH1/p5zQOG+J4v5QzoEKJZK4NGsnrx1Gffd1IBSLWB
	rBufinbyshqOt3UfxHaTRck2A35Tpvw6jq6SRpsR1ggrxgpEU/TwTW12yMxMrkPrsIQaS0W7zON
	D4iQipSNPJU24NWYidobqDJY09ayBPEGNDvldqRWyPFCBMQUiiwMj0dgJzbmlodMK4IXUFLH8SZ
	Gw32LDGGykU1hAiwTU5ia5AbFtkhe3MLDhXTuO+cxPMAFj7cA8vopXztCJoboyfu7at/8TQBHeO
	xHIeMjIbn5FBBAfusIreQxU+JR40BLniup/z18jGQE4/CxerHSHpiMRBB6R7DD3SW6YgEQ/l06Y
	27xfTsgmjevNYoRJdUwBkewPrlh/k+5kKcmkdrAkneCf8OJlOpWnjiq3w3N92jltz9u7EqYkU2X
	TZGH2BEeffxkqhkG5qSOMVh
X-Received: by 2002:a05:6000:1949:b0:45e:7792:6e6d with SMTP id ffacd0b85a97d-45e7792716cmr16972746f8f.13.1779276846874;
        Wed, 20 May 2026 04:34:06 -0700 (PDT)
Received: from orome (p200300e41f291e00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:1e00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe0f72sm56958318f8f.25.2026.05.20.04.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 04:34:04 -0700 (PDT)
Date: Wed, 20 May 2026 13:34:02 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: webgeek1234@gmail.com
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] spi: dt-bindings: tegra: Support IOMMU property for
 Tegra194 QSPI
Message-ID: <ag2bxqDmZsCuOfOJ@orome>
References: <20260515-tegra194-qspi-iommu-v1-0-57dfb63cd3d6@gmail.com>
 <20260515-tegra194-qspi-iommu-v1-1-57dfb63cd3d6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lkhs67mbj3gk5ko5"
Content-Disposition: inline
In-Reply-To: <20260515-tegra194-qspi-iommu-v1-1-57dfb63cd3d6@gmail.com>


--lkhs67mbj3gk5ko5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/3] spi: dt-bindings: tegra: Support IOMMU property for
 Tegra194 QSPI
MIME-Version: 1.0

On Fri, May 15, 2026 at 03:35:27PM -0500, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
>=20
> This is supported via an external dma controller

You say this yourself: it's supported via an external controller,
therefore the QSPI controller on Tegra194 (and earlier) does not need
the iommus property because it does not itself perform the DMA.

The GPC DMA has the iommus property, QSPI doesn't need it. This is
different on Tegra234 and later where the QSPI has a built-in DMA
controller and does not rely on GPC DMA any longer.

Thierry

--lkhs67mbj3gk5ko5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoNnCcACgkQ3SOs138+
s6Ee+A//TcqYANcnvRvUOXYnvdCKnAT1aTtAka+rNPvueTfMKdR+PtQxYe8Fx4/n
Yq0iOO4mkYCsMPRpemuE31RDDsUh3MRByyQcpBVa2MgCt0iqTRxV3N7E5hD3OnOv
yFUrnH+lmW7HhOL8m4dDkIr+frii+LMfQpFrIa4jrCJBLkg99gFKSESHlYWQQVt+
/dRje9aazDTmvbzOOSwP4l9RwbNeCLnfHD7ygqCO4nT2rlbWZBo6cURB54Kx/hIS
bS9CrCrYQMpe4HmkPtPGUmhY3enm+RjkNjCswejk2QA8v+gzPlsJwSSfQf6VmfXQ
rr+ZMgTH/agjidFQnWMOZPdyT4PnmHK2BmYkF6kNCWqv2SKNLl1yenGlWrJekzqa
+Ru8z4O2JJ1E6eX4/4tTzBcGVi5gTtHM78nAdGb864vUwAqxh5bFxv2PIb8BmBzo
qzDsJ/dwIQWCdRulC0eD3ZnY3ugVghNPlkufaAM4ix9DvfSpr+ZijpEgU2C5nL2p
oyQ4BaRxAbYi6XL4CwQWPJtuNRQEmN8M86y5t45Dj5i7GskDqrIQmVuI/n/ky4ip
rqC88oHfZ/jC5uOchcXYomZWZvt1GNhU+zDHwZoe0WScrz463Znfx4BLK845QM+H
35MHF4oR8Vpd5s48VinW5a93mbGtLMwWG7lKhsY5vh/W/nfY5kk=
=7UYw
-----END PGP SIGNATURE-----

--lkhs67mbj3gk5ko5--
