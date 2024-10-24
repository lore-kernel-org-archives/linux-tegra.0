Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7051FE0E8;
	Thu, 24 Oct 2024 17:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729790834; cv=none; b=ItmYqLDxawJMxcSKPjgK2KYZFVgXve/L0fAvpPvo+EBDW4cWsVSKbNvZ/XBPlJxJA1vbpA/kJM73m5vct+SWgzlFpkoVGGpWoe9zAjpdzaf7sy5NYpWwivsIw37XzLG602UMf/mvyBR8zvSs3Nni/fV8vqNyWujxLYSzH9T1vSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729790834; c=relaxed/simple;
	bh=f3Wvv/aIA/alTMlwp/kkvbk+l5oMw+tEtlTxFgl29oM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GV3/Pr6TLctkn8mT2XDY53rbNKfaTFFuOWN121ycXN8p4hWU1QGiGokEniF5F0PqrNBu0hqgarE0R1nGpgFjXdHKdcf0kAFuHgD4K8qgwKOoofVDP3ycrHeAKvJqQnCuPFd+eBxIjx+kSu5iu0qf33XEwPTNwc7mSwkiM/Y95aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nEQZiPmD; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nEQZiPmD"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4315df7b43fso12650145e9.0;
        Thu, 24 Oct 2024 10:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729790830; x=1730395630; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6RF+0h3uJVvZLYuGZLW/jZ/HEsnjwutDdO799XJGlDs=;
        b=nEQZiPmDs5hv3TT4gGFsvBsbvebLooPyKfHM5wtr1eW9DbYNS6uc76h0cagjie/dYu
         UmPRmKJd7TV1je5LU8XIQeM0elZShDSWHo06/hFUWXhTtpUm2M84wpBXV+rNzqYe84g6
         rPZyHpScYEKKGKQR4Up8R+p4QJf1K/Uhd5JMjRf4n5flsQ/AWiDXUCshqTKhdNd6DhDc
         mxkxe2X2PL7PjVeJb4C+yK1dOHpnBTQYH3PQ3yZ31TiCg25ueqyi7dxCMlyTtw0harPs
         l8UxYuOikxDlAoFLJZamjBCmEquxau/lwn0/Y9hnGnVuF4eLu5oASlrzNi31vJWy4e8z
         EyJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729790830; x=1730395630;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6RF+0h3uJVvZLYuGZLW/jZ/HEsnjwutDdO799XJGlDs=;
        b=YAIBcwSQLclCB0TJYzKWppRnigPHnl9Mp1MNnMtDeev0Ns4NRSQGA+eQrVs36ByCVV
         i0LHXvdr2LOA+1RrYFUam2PD8LFRCevNXKdstBzRFPLVj0DpIP2qupTzglsOUEhgVmFw
         oMTitoS3xAJpw4S6eCnnbcYUseakXtAVid1vEkOqrpaAUD3OnwDxNnMP52cx1EbobkJV
         RCD8fL1CL8ihzsl5PtholbnwoJvi6Uh/6YsaFJG3q/iwIH2Ywe3OMSZO4cAvyPVhHz0A
         5+GgPIqzXi6SmxUvxr7V+JDcKPhyJ07uAMKdhnaYLORRNyYwOyZKP5tOLsNjX+MCJtLk
         l3dQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPz1zDtiEsnEEzL6obqdcuJ8v0VP6mzhSovxt8x/kntgWGogI3nw43wZHGj50MNPQI8wcBFyp6l9PbLLI=@vger.kernel.org, AJvYcCWwemo9ddaBFN0J2VLJ/ik7Jzlk6KGyxlxhgoSWHhlsvHdSO7wvWmknvDsvvxB3DDE1seljqHawmiD1ru4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTBmNRU8XPLPz70iA6ZgFQJGVKJEn7xcV3nxrb8kx1SezmzLA6
	JhysrofWR1GESFyzmI4at2Ve5upzC7WLbrJJ/ln28zV4xi7EcrKaMxXbI4zu
X-Google-Smtp-Source: AGHT+IHQ7I/9aI1UHxXx6X/2TOQl2Yy1ybsuEFl90rIKNP8aItf1olbwHtlsGOqqhIDJTGHDheR+WQ==
X-Received: by 2002:a05:600c:1552:b0:42c:b750:1a1e with SMTP id 5b1f17b1804b1-4318beb62e6mr24564425e9.0.1729790830026;
        Thu, 24 Oct 2024 10:27:10 -0700 (PDT)
Received: from orome (p200300e41f26ec00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f26:ec00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43186bfcfd0sm52020785e9.26.2024.10.24.10.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 10:27:09 -0700 (PDT)
Date: Thu, 24 Oct 2024 19:27:07 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Saravana Kannan <saravanak@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, JC Kuo <jckuo@nvidia.com>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	=?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>, kernel-team@android.com, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/3] drm: display: Set fwnode for aux bus devices
Message-ID: <sn3q2kloect5pdsyks2xwiiu7avhaovl62rn3wzhs4qpznwegq@zaq3o3fuc7i2>
References: <20241024061347.1771063-1-saravanak@google.com>
 <20241024061347.1771063-2-saravanak@google.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hfzjdm3gfakfovch"
Content-Disposition: inline
In-Reply-To: <20241024061347.1771063-2-saravanak@google.com>


--hfzjdm3gfakfovch
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/3] drm: display: Set fwnode for aux bus devices
MIME-Version: 1.0

On Wed, Oct 23, 2024 at 11:13:42PM -0700, Saravana Kannan wrote:
> fwnode needs to be set for a device for fw_devlink to be able to
> track/enforce its dependencies correctly. Without this, you'll see error
> messages like this when the supplier has probed and tries to make sure
> all its fwnode consumers are linked to it using device links:
>=20
> mediatek-drm-dp 1c500000.edp-tx: Failed to create device link (0x180) wit=
h backlight-lcd0
>=20
> Reported-by: "N=C3=ADcolas F. R. A. Prado" <nfraprado@collabora.com>
> Closes: https://lore.kernel.org/all/7b995947-4540-4b17-872e-e107adca4598@=
notapiano/
> Tested-by: "N=C3=ADcolas F. R. A. Prado" <nfraprado@collabora.com>
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> ---
>  drivers/gpu/drm/display/drm_dp_aux_bus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--hfzjdm3gfakfovch
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmcag2sACgkQ3SOs138+
s6Hj0hAAhMZxiCkgmHPpzOfFMLqQaRfXX70z+C/EbrTzA3OUMgMVTiRAMXm9USIS
SgjCLtThw+TN8T0NPDlAi/x53qr2/K1+ifxrgdjVcukCIcvH5xda17KWjl5lMbUy
OVUJP98lx/BCDvcsTH4HjWdNk52GLn99I31Ipkc8KXdndg/huxA9uYb5bdb5oSdB
S3l/6TUoLTnyb6e2PAg8G2UNwF0z8fOgPrm6bn1fPAHezUuZXYu7h+2tYidyzY0M
eh7RyFTL7Y+aX4jPJlHIKe/88qmAC2f8dKvpKuUe/FFbsjBkTIrSZK69Ynz5pXmF
K1sErSfkghxrbLGxjJMfQ1rU7Gy8vNwiP14Nbik2EFT+KAT6y1LCFCqpsv1fF3KB
tkzQYps46T3VBCljzQeZfV7/4ARml5DGv+Kv/CpiZV1lt2PKQTU+DHPoV8x4bzyG
GsW8JVuWqFjeSkPyf4APslY535lufQclLzS7yI6qalJ+30XDOixO4nJ3VUXawkHX
gJfEljNUTO5xEggz8QZ1wRSUVWV0Ik6PyYh/HneSiGCKn5D11kYTIv9ZX2d2bNBV
yb2OI9VOjn8/T7tfB6T36coLT1xNATeLQPX56+IQC0yw5NMfu7T55/S3amfn34rv
Wk3ki1ZLcI0tvP88rKMqTjGQSmuMDTJgPG2V41FZbUhDhfLy2Ls=
=i3zE
-----END PGP SIGNATURE-----

--hfzjdm3gfakfovch--
