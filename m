Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BE41F80CB;
	Thu, 24 Oct 2024 17:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729790850; cv=none; b=YKrshTpgMFRaAhViDL0u6DObmPqV99Mb48wmR/D/D55vJSe3tp2hUDQw7xxDz2lVBEulzv+izrNmHp+BPy3k16GMsjSrRGW5TgZFNWQl0piMIneZ4fdemrXRMXnkt0x4aSr07GiuoB0Pdnivzf82IW2PFZrwNDJ7nVzu0UvYBvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729790850; c=relaxed/simple;
	bh=asOyHebUZB9ZeEJ5/WmNdhE8zUHBjxb2H+EmK1jPdq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VlEY6cgTkUMYvBQohysJsaIX7n8ZNQvIxEMuUiXdyTVqfJEkJDSknYUeGCSOWI8rA/b67fRZYkP+NNJCq5Ju9F3Du/zar7s4947/QZU1J7a3npVADgg7OgVqdjPQcH3a6wEwIJG3ESbcktB27Vu9Y1rjy+hEYYv7A3PouD1qqAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dXQA+lZb; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dXQA+lZb"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-37d50fad249so852446f8f.1;
        Thu, 24 Oct 2024 10:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729790846; x=1730395646; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UaHpkghq9cuCMb2HJRZAym0CXgOFGdaTduY6J1n9ZMw=;
        b=dXQA+lZb1qqGiD+dlxYiZeXIzgCLcmv3fuNh7/QtMsTrWhYlFno/aYUcQCt6/XNMYa
         VYlFeoXizdAGqBICjPrUX/iBMqKUK9oPml4fn8jvlw+kD1vmhvUVp3VOMAlrPauXt6f4
         kOpoQgHTBMrQNfA9nS/7yiRJgCX7CQOodHlIDjxvylNbqII2ebYLuYWossvGBYN6oHNm
         mBbnOATfDE0dArLgLgMXysFLznOHrI/jk7xbpnD22sGHVQfptZ+50w7q4r6D/WNYTOaR
         5tJdmMXDxwdBw7Tuga2fIzyNkqo5MWiTiegYj0gAVUVVuY5q06yTi7FLh83r6yBBpgl1
         jbTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729790846; x=1730395646;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UaHpkghq9cuCMb2HJRZAym0CXgOFGdaTduY6J1n9ZMw=;
        b=lLb71BqFqGUWTEUhuPpVZ82vTum33dxAifxxOpwafNLDswd7EruPr25XtgntVybFn6
         dnTBk6Gq31GJRvzGTvOCMA5+UOHRSfHhVchwvvJd269cFyhqohaTIR9j/euzNZ5vX1Aq
         v7xuCzIDZ2XEtvVr2crt1y5D3kQ+BeVR45mcvFi0wJs8T1MOQBT0gbVdhLog8tULdsnR
         6+MxUgoKuBZYAtzss1tgAT5n4To6NEaUATrDbZ0wnsB49SWQqNG6NyALIe5UjCTA02Ik
         WgF2TU09lSofy3ovQss6KW95W8Lq6sMVwU/wUshWrTa4r4mReoFXdPiS/waLiCtCQnt6
         miIA==
X-Forwarded-Encrypted: i=1; AJvYcCWwljOpm4xcGX3tRwyBt04N9kck8N6EhZ5QGyXx6GEQIid4bYrdUb6v4kjGh0rB21wo3q0EDPpAKvlo9Po=@vger.kernel.org, AJvYcCXY5qPCTBIbmBlSdThGTdaJlmA4+57jvYXucXLqaTxdH673flCDi4VnYQ9S/Q09DDCN1B+PTCNTdqCqkPM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwR8KjsDUcb1eC0IjZJ2f6XBlh9Kw6QobD1jwtZX6a8zq0pyl8p
	gdsAJGOXKPRRTtBnsC+qPV0Xlp7fY8jTz/I6YiIaiAhR6zHRigtJ
X-Google-Smtp-Source: AGHT+IH9aeFR7EI/JBQU2YhJkoiZcmX9vYZf/rP1GuS53R5NLbNpUfaTaV9YEHJNgi6VOgAWwW1HsQ==
X-Received: by 2002:a05:6000:1faa:b0:37d:53dd:4dec with SMTP id ffacd0b85a97d-3803ac9725fmr2225519f8f.15.1729790844879;
        Thu, 24 Oct 2024 10:27:24 -0700 (PDT)
Received: from orome (p200300e41f26ec00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f26:ec00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b9413fsm11839544f8f.74.2024.10.24.10.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 10:27:24 -0700 (PDT)
Date: Thu, 24 Oct 2024 19:27:22 +0200
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
Subject: Re: [PATCH 2/3] phy: tegra: xusb: Set fwnode for xusb port devices
Message-ID: <h7lfhtsb4qmrtmcgkeykfwdqzwmby6jfspd6hguxyx3huilu3o@sfl5dqcsc45d>
References: <20241024061347.1771063-1-saravanak@google.com>
 <20241024061347.1771063-3-saravanak@google.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="twcjumikk4cgqnzo"
Content-Disposition: inline
In-Reply-To: <20241024061347.1771063-3-saravanak@google.com>


--twcjumikk4cgqnzo
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/3] phy: tegra: xusb: Set fwnode for xusb port devices
MIME-Version: 1.0

On Wed, Oct 23, 2024 at 11:13:43PM -0700, Saravana Kannan wrote:
> fwnode needs to be set for a device for fw_devlink to be able to
> track/enforce its dependencies correctly. Without this, you'll see error
> messages like this when the supplier has probed and tries to make sure
> all its fwnode consumers are linked to it using device links:
>=20
> tegra-xusb-padctl 3520000.padctl: Failed to create device link (0x180) wi=
th 1-0008
>=20
> Reported-by: Jon Hunter <jonathanh@nvidia.com>
> Closes: https://lore.kernel.org/all/20240910130019.35081-1-jonathanh@nvid=
ia.com/
> Tested-by: Jon Hunter <jonathanh@nvidia.com>
> Suggested-by: "N=C3=ADcolas F. R. A. Prado" <nfraprado@collabora.com>
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> ---
>  drivers/phy/tegra/xusb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--twcjumikk4cgqnzo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmcag3oACgkQ3SOs138+
s6E0jA/9Hrx9YAv2LNCLCxeOKL/DQUk66osQ3tcAQYkyXH1Lf8zsvymHrcUdbWBM
95AoBk6VHHrDM/3mW1riHBZy7wiSLA7ZH+nXiFscRZcisWchkrcSFd1Oy1LgRj2Y
N268oEbko8jjmyKx0yTojbbilbsZtXZkKsaVhxkBgAchQ8lYuAQg4nPRABMJB6F3
eZKMHGXBm6YQFOvV+Ahasj88hN+0WceHJNvzIQPXyWY2U6ixPpsup5J/uikzHqpI
rmlb5zqPUHtHtG/U/ku39cIgiiOBE73/OW1r0qM5ez+UiTYWukXAQyBSCjtoWBrm
JguDu8m/fS1Iqn+NmxlOBto5gRRABLwBb3PHWfW7XEuVk8ZdGpycBxQ0+ZOglfSC
PUn/XxgW99w/KbP6401Bomy+Qj9MXJap2cytyVNrMGda1xlwnAPFVPDZ6qNCxZRc
Bw1dD6hZeWOsKlFZcY9mBhn4D7nAalV/t+zKe9YdEe7zdkTv6CL4o79JjjIACdsh
GJjfZOlG7FsLE2D5KscHSf7vxRKG2xOcpQyc892MLa2tm4MngYKUGsIEPZJOsnHF
vkw+QmOdblNPJSILIH9uyAwwb3YDkivpKILxPTgMB2eywmWnxQaMh96hc97eipNh
H0hKPDvcuendN6+xsu5VM4VQSp5VdAbX+YumtsJ06Dhdqt4kdoY=
=GeOf
-----END PGP SIGNATURE-----

--twcjumikk4cgqnzo--
