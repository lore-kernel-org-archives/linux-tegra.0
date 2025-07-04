Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E027521ADB5
	for <linux-tegra@vger.kernel.org>; Fri,  4 Jul 2025 11:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751627840; cv=none; b=OAhUV04DkKattjtOj7DEpB3XULKwE9HIsFWpUD/vUZqP+3DT4+G90YktaZydY5U0HpERlVPtPw12nmWv173hoindi/1msfxdZn1Ql3SPX4o8gq7gw9aAOG7CHOSeji7QkWVj3IMsDEaQ7awZ5e9X1DQKWlngrMX1INQDWXONosE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751627840; c=relaxed/simple;
	bh=w+DEPLSn30cd+fUxLsP3bkMOPs3GGKy3pd93gjSg72Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DbNMPIa09cUMdOgGehQlcG7WaBDi1A57N88rpCJ5u4AYKMgy5nHDyTD45MUps9DLdHFAH1ptmabDwYiarSAAX7MebC5owQOVa9Hk9krdzhJ2MaHsbqR7XK6WcvaO3bwuZQ4AEf7fOiLnj+P/wNlQEYjJYnU+cRa8M+knQtCKtto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CNyLnHW0; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CNyLnHW0"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a4fb9c2436so416191f8f.1
        for <linux-tegra@vger.kernel.org>; Fri, 04 Jul 2025 04:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751627836; x=1752232636; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ekVHu3sJF4aRYNnS6FmYHLDgTrou30wcwPFOJfO0GRc=;
        b=CNyLnHW0n9yrnhueM2WlXSi7e/eCbb5Wi6CO2hyT0oENB3/SUkjqWG3VMjEPtuenYD
         1cjFg6HXyqQ9IGwJdpSaIenQPkZHVBj7TGFZbR7vXC4DPERwEavg3Zbd6mKUiAxINn0l
         T1VcQTnXrFCDfH9+t6tM5P/Z9A/rVwyp+hQ/udKHQnTg6sbAk7Yq3cdeC3KXvR51ue+h
         aM1XEm53mlGbeOuozk7OJvbRF4o00gNN8oNoGt2YcQz275R2PalhyGRGjtq7gzoxOJaM
         t56ZT7QCWdpzgeLCQcEgc6s9Iv/n+JujtIbIG/VGN74LHIgkQqLIPlL+o5rXLGcPYpPT
         FlsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751627836; x=1752232636;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ekVHu3sJF4aRYNnS6FmYHLDgTrou30wcwPFOJfO0GRc=;
        b=BvVlBO3DPnMhSwXiyOATPunYxHYv7owpKbxRmp+lootwF+I/jEgMhL3UMQCnxofmAn
         dlOLcpKwfbDQo74RRwI9j5l457QKLRgI9lRhgEGKlXofbQQXhRarYvL6B6NkUjQ8nbCs
         Owft+G5Yx/3reUK14fXkTKEpw7nAqY3FZPuZxiqetwpsMcOGWNqSXKusGmx8NQbm5Ubp
         Qz2Q7aLCNQEJwLAaxZOvC7wRLQxPKFYI+aTab8ztICnv7TDeTzhcs92hNPozHVE9H0U3
         3joUv3p48vZdTPR96V+eEYjOSxrPHQM8GaUls26u1ZHKM8REG1JiikLavu6RF4cIBILE
         0x8Q==
X-Forwarded-Encrypted: i=1; AJvYcCU9jMD2+ylsdTVYIRG31DmE9dlWJu+nmMk38SkrppcAHhFZixOLt99lEsi5NIL3jaeAi0XJYWesD0YYpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZB31lUyjKjDhU4jSGtecrowXkczEjDxHFzS2h2PiunP7cwwfm
	wieDzTdaweVSZvanjtySxvmY4L6TSk1DU9I/otyeuSnQ8WAXvjzxkUCT
X-Gm-Gg: ASbGncsJWh7xLpiSemVLzitqDVBRZlp/DMt4EZmi9rR2wm7Un17XY9eoPwz6EZVqmlS
	OiKhxq0PfYejqFPlVGw7/8nwEQeos4u0WwcI6FR4dYX+foaJewYkG2X6mluqH99vWR/0xYdHPEw
	nvDHO6fYfi1CyLJmzRiproQCkMxjMgSBzSFOd+H7KfU+B/arVhEp3Ux/wgZTcspQyZ7HpMnDGUr
	1/mmzWOQmZcb11Sd04MVqcVQX/3DT6wDhXe0gwvRJ8dzYGSvbw7Fp9I8nKjFshmD/aFZfPedr73
	hgL90b88Anoe6+vWDww9oL9lK99JAk80hQib9Yom6FZAr2CcAPsu+1JGjTPU+WZ++pTPw+fJQKQ
	LeSjYgJ94pDKCKPOMFWSqktuYkF4hIhIvfeBSSQLNVdY4BjhpLyxLZkbpobY=
X-Google-Smtp-Source: AGHT+IGGyh/Yt5Y3UHgIdm33BW/SbOT+O8qgc/PjC71c2UsAI+prdVZgL/wDHjNMSSsMO25CqGoTog==
X-Received: by 2002:a05:6000:25e7:b0:3a6:d403:6e75 with SMTP id ffacd0b85a97d-3b4964bc62amr1477843f8f.4.1751627836017;
        Fri, 04 Jul 2025 04:17:16 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030bc5asm2218847f8f.20.2025.07.04.04.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 04:17:14 -0700 (PDT)
Date: Fri, 4 Jul 2025 13:17:12 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: mperttunen@nvidia.com, jonathanh@nvidia.com, sumit.semwal@linaro.org, 
	christian.koenig@amd.com, simona@ffwll.ch, airlied@gmail.com, 
	dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 0/2] drm/tegra: Avoid using import_attach directly
Message-ID: <vdcsji5fol6aafs7igblfduo7ulyovutlkjujumrvjiab3xmbg@hqagmqfqgaim>
References: <20250619113100.70292-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zy7wo7q7wtarbeba"
Content-Disposition: inline
In-Reply-To: <20250619113100.70292-1-tzimmermann@suse.de>


--zy7wo7q7wtarbeba
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/2] drm/tegra: Avoid using import_attach directly
MIME-Version: 1.0

On Thu, Jun 19, 2025 at 01:26:59PM +0200, Thomas Zimmermann wrote:
> The field import_attach of struct drm_gem_object is often only
> required by PRIME code. In other places, replace its use with
> clearer alternatives.
>=20
> Thomas Zimmermann (2):
>   drm/tegra: Test for imported buffers with drm_gem_is_imported()
>   drm/tegra: Use dma_buf from GEM object instance
>=20
>  drivers/gpu/drm/tegra/gem.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

Thierry

--zy7wo7q7wtarbeba
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhnuDUACgkQ3SOs138+
s6FtVg//VNdil86QlTdjvZr9F+xMTcrzIaZOV477T9IyJHCEBiJwp6FFMgdg7wHa
tgmwaAaqqa7i8FVVH7wET0b2g/gZj+1o7+2CKfCB9OqBRDHNDBA6srY4AxdlDy+U
AhrH5N1+0qSCka4htZSA9BPrLNzuOXE8/ycL4GutHR5sm0JrMgZCDr1pohYGMgca
0iFqPI83tvBBDdZ04Ssqqo9P4/54rzML0Xk01VM1kCGBylpDLu9NlfgpMr12dhQK
TzxP1SjlyHMNxRNBmKRktu81HAOoVqGigd45FpUBmWJ4saiVV0On9Xqkf6EjzC6b
fjciEQZQb9nymf4H/ocfqoyGgkC7tecnc9FAWc06KNxdMuuCdh43+FW7PP3igHgT
tpsUGGU1NfMckdlBh3XgT2eeqvGabIF87pmDIkXmvOLdVfVNTSF1qZUMgSbntrC6
FDkCIzDNrOGciq4oSOJx0WWoHuAkLh2Bs6F8sXxpA22ky+6JMOvOuGypF68vkX19
qanbdcty7EjkRmjtuhwMGgZBJc72lpzNoln8y+U4bkDbZ05HQFGjTnkq2LSKdzxK
cymAaopV0hTC8pMDvcG8EnI6mTRDcdWH9N95CPsXwsZQt/MhwBGrmyFsE8Hg5OSS
GD7+cb84qNMD0JMVJx/8xqWqLfzadri/WjLnMhJSFNzfYdK8YHM=
=8rNN
-----END PGP SIGNATURE-----

--zy7wo7q7wtarbeba--
