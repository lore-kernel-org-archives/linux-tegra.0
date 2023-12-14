Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DUBaWFlm"
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B026E93
	for <linux-tegra@vger.kernel.org>; Thu, 14 Dec 2023 09:23:45 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a1f8510883aso769928266b.3
        for <linux-tegra@vger.kernel.org>; Thu, 14 Dec 2023 09:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702574624; x=1703179424; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NjfgAmCHro8WpwTbdDICAMGVZxRX0DY8en3op8vtBmg=;
        b=DUBaWFlmqkb7pUzbv/N3kdZVEYc90GQvDrMXF/poIfqB+ZjD+UkLapqtvFWaROiN3U
         J4nJt+QQqe2Uiwqn8tYTUGPLJYhGMLLXmKvn+fX32vLP5JSYZD42S8C2z18vocPS5Cnx
         fT/lg3L8pRun58fGyI/E7y1IUrEwQ/7oG3iBiqtFzpv/CoMBmdwrgzLr8iwHMepb4GTR
         +cZm7dcM1GNH/t62i4LslirzhN0YdD+7fmH/Qdh9TEb4SmbtQ0RaedVFecld7Z5UcYkn
         dZtvt8zPZtyFVpxkx9GkPHlhfr6iySLOKcMrB0h4O582G/MfuwdOO4rRmaK9sSKWZxHt
         uCnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702574624; x=1703179424;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NjfgAmCHro8WpwTbdDICAMGVZxRX0DY8en3op8vtBmg=;
        b=mfqjk7qwdEz3VDLvQgU86fk3IWseKvm3+Z9T2QiWHJtLxpKqL95BUoLb0FkqZyDXiy
         YGekrE0FQ7I1NgGYERlvh4PAJhbqxPSK4etUVm5cfFef1GrEYljImcSWHB6exJOqBa5x
         D3h4P/PZtmFnJDBCgyOHKEeThwgWjwRbxOj/Dj+DbcXPwq/0Jqo+Mw1ZtMuPDrKgWisF
         9smE+9vPwlKs0apg9q64hbEGd228vTUnQfCPGQvLgySnG8nI6lSuPbKyzRtSZCUo5DDA
         K0B3frZthOURrvkduQmIq0fGH0i737tzAQ0YCRo2xHooNhAVr9MN3cin7z02eZuDxkv4
         Dw7w==
X-Gm-Message-State: AOJu0YwlIDhcMZoP54C264efvL9OI/ydFqgg0TwlJE9A7YVbUL2O7QtO
	XtRF7l/5vBgx+Nhq0UGB30w=
X-Google-Smtp-Source: AGHT+IFtbQpVVn4O3orT5ng99RxXEB37KZytm/DB87hmngzw/A4f5W/EwLa4VEQiP4pyUJOX5ku0pg==
X-Received: by 2002:a17:907:e8f:b0:a1f:5d99:fa8c with SMTP id ho15-20020a1709070e8f00b00a1f5d99fa8cmr3562053ejc.77.1702574623908;
        Thu, 14 Dec 2023 09:23:43 -0800 (PST)
Received: from orome.fritz.box (p200300e41f0fa600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:a600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ub26-20020a170907c81a00b00a1c96e987c4sm9747583ejc.101.2023.12.14.09.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 09:23:43 -0800 (PST)
Date: Thu, 14 Dec 2023 18:23:42 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/tegra: include drm/drm_edid.h only where needed
Message-ID: <ZXs6HtH0-qa4xgQr@orome.fritz.box>
References: <20231212142409.3826544-1-jani.nikula@intel.com>
 <20231213101951.3932273-1-jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nyW34cH9WClVZ6vc"
Content-Disposition: inline
In-Reply-To: <20231213101951.3932273-1-jani.nikula@intel.com>
User-Agent: Mutt/2.2.12 (2023-09-09)


--nyW34cH9WClVZ6vc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2023 at 12:19:51PM +0200, Jani Nikula wrote:
> Reduce the need for rebuilds when drm_edid.h is modified by including it
> only where needed.
>=20
> v2: Fix build (kernel test robot <lkp@intel.com>)
>=20
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/tegra/drm.h    | 2 +-
>  drivers/gpu/drm/tegra/output.c | 1 +
>  drivers/gpu/drm/tegra/sor.c    | 1 +
>  3 files changed, 3 insertions(+), 1 deletion(-)

Applied, thanks.

Thierry

--nyW34cH9WClVZ6vc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmV7Oh4ACgkQ3SOs138+
s6Gl5A/8DEwIypqGfhipLCj04MtME1RYd0WRLM08GUYZdzuiodYu1O1/JC+vYBFk
ABPOBWW7E7DCo+M+IEJ2itv/IVpafamwmyjALbKDuxeRjI+t+zsfLciTEvM/5AAw
peWUW8hwkpJIkPYizpoPeceU/LhbuC3L51pAJNY4RZg0OqjzMJU/wl6E6vflBL+x
N0KDqjzEXHJTDesGWYPtX9AnrSk6kxmZld2KnfQBL30h/s/sS144rqTj2rBvdKv1
/GR6qITkUFh775bywQgmIL2clsU+zwZIWdVdFXtJNDIdf19njkHMRCwiRrPFXBUu
9nGjGbeAwmbvVzd0/krnZFAglJH6gux8v1dh8053AhdqocFnbPUhkDWa0l6ZVwgs
J8ZNIuJWhBVe9sQdHzBx0k/8WaHkmLzGdvO47w8a+NeaOq3FXf4JKYrP4sMUf78e
HmefU/K3hfHpp4pKNtK0OfX+ucicWAkTAjrd0LoJvnPcol+pb2g287RUkWwn10Pb
blyRAfJGkP1WJjdC041BOSUMQ2rXcYSKtEHOV7ohNOsmzjHo5vOyPF+1utqLXzcd
29hfRCubfm71iidEbfGR/zjFdbhdNdlK9bPMz5VTmRDU50zRzRMTtrUXgNGUMh7P
nduzc3raj3dKbi2mXNPSZiTTb+ZZosQsslVFZqGFjmZp8Eo0v+g=
=/P37
-----END PGP SIGNATURE-----

--nyW34cH9WClVZ6vc--
