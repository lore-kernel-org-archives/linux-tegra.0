Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7653F074F;
	Tue, 24 Mar 2026 11:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774352910; cv=none; b=hyICMqJgOxXZWwlS4Z76HkqIvUu+magptFgse/xOQyYBzCVqwjhbDTJpFbhs+vZOTTFfxYYpyc0JX1IJdCFXhzghzRFpq2B39bELpIWEAPmKHvW6Z6rHlKFzhALVw5b4haUvCYxkafkP5r1aMDVkQLHCCYES3dFXrRGo/Scq+IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774352910; c=relaxed/simple;
	bh=6CXTjNHX0J4uF5Ojb5ZTtc7BYWwcUfE/5znpHFlnD7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EuPO0n+uXap7t0y3LUTLoMbKUtPv48rQ7BcHm7IUDnthPlPvpKumPREWxm28VbyEELgV9IFZW3F9Mq5I9KX8cM+vVIr8Kg3E1EadWrw93b0mUcf1PIExjjtcd2BrAg7HaKPZiAs7DVrbhvy7Y37BdVrn8T4SVmiKOnMDehqj3lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gsaRuY6e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gsaRuY6e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8EBFC19424;
	Tue, 24 Mar 2026 11:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774352910;
	bh=6CXTjNHX0J4uF5Ojb5ZTtc7BYWwcUfE/5znpHFlnD7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gsaRuY6eViu8X3g7+P8vdzfxU4G+qz03aiKEZuxnGTNsLVxiKXMSAswe4uAP4Voff
	 9Ya58a36gSb4qTTV2ALgFbdUiig5NcEiPClqZfMMpWh47cbVgEFlfyQE7SR/lhNk4d
	 jXzk2INfqyjbAPNNKbbjeeKw144hv7CcDnL7MbSF2wt5ImoiprqnaXr+p9eEJhMVbi
	 a1Fznmx7J3yfrSTOVsNjX+TwRExiB67lrRqxzPeABK3epFD8N4N4dMLlH/kC2Xc0hC
	 zWfjNxa/AqFXRF0eCkSus1j1bgH5+Aq6qAHRrRo1IliJcDMUYbKBG5kgQ3HLQn4g0s
	 f7Wv2zWveKrWw==
Date: Tue, 24 Mar 2026 12:48:27 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: Mathias Nyman <mathias.nyman@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, JC Kuo <jckuo@nvidia.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/6] usb: xhci: tegra: Remove redundant mutex when
 setting phy mode
Message-ID: <acJ50sQraVmy4zXs@orome>
References: <20260127-diogo-tegra_phy-v2-0-787b9eed3ed5@tecnico.ulisboa.pt>
 <20260127-diogo-tegra_phy-v2-2-787b9eed3ed5@tecnico.ulisboa.pt>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="geubzoieqitgmbmw"
Content-Disposition: inline
In-Reply-To: <20260127-diogo-tegra_phy-v2-2-787b9eed3ed5@tecnico.ulisboa.pt>


--geubzoieqitgmbmw
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/6] usb: xhci: tegra: Remove redundant mutex when
 setting phy mode
MIME-Version: 1.0

On Tue, Jan 27, 2026 at 03:11:48PM +0000, Diogo Ivo wrote:
> As the PHY subsystem already synchronizes concurrent accesses to a PHY
> instance with a core-internal mutex remove the driver specific mutex
> synchronization.
>=20
> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> ---
> v1->v2:
> - New patch
> ---
>  drivers/usb/host/xhci-tegra.c | 4 ----
>  1 file changed, 4 deletions(-)
>=20
> diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
> index 8b492871d21d..927861ca14f2 100644
> --- a/drivers/usb/host/xhci-tegra.c
> +++ b/drivers/usb/host/xhci-tegra.c
> @@ -1357,15 +1357,11 @@ static void tegra_xhci_id_work(struct work_struct=
 *work)
> =20
>  	dev_dbg(tegra->dev, "host mode %s\n", str_on_off(tegra->host_mode));
> =20
> -	mutex_lock(&tegra->lock);
> -
>  	if (tegra->host_mode)
>  		phy_set_mode_ext(phy, PHY_MODE_USB_OTG, USB_ROLE_HOST);
>  	else
>  		phy_set_mode_ext(phy, PHY_MODE_USB_OTG, USB_ROLE_NONE);
> =20
> -	mutex_unlock(&tegra->lock);
> -

It looks to me like the mutex here is trying to protect against
tegra->host_mode changing while we're setting a different mode. That
doesn't seem to be taken care of by the PHY internal mutex.

Thierry

--geubzoieqitgmbmw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmnCegsACgkQ3SOs138+
s6ESAQ/9EMcAUytgVdqWsJtOBxpPlq0tVZ2c5MSbDjInQhkZMWHEEqh4CS0S7gwO
524kejcplYr2DTbmr/wI0zjfWP7Aomr7HGRWiUUCVCYru/V9YLwXak5A0+OtKusq
i4aCxyzdzUcXYdXCxglPOBPW0nr3v/NGkG/fqvBEKAMiSfgWhXL3Y7BPsPw/g0o5
ro+f10rx1QlLR9V+2Zkie2CufCkpqChsutAgGM0o0b6FpT1H3ICTBFW0AJ6a8sv7
fMB4cba7XWBLC38BEfjKsRum62s5ImJklbTYahVZbkLp0cFIBaMQPZhAbkH937i4
ouJXF/2oew+Z9d3aN4eLhOMvoml0a9Ttthhx8S1QgJ+tF4uII9wrSlVnNsOU3wRc
ft3RaKEffEJJ8/796FF0x+kLPeqeIhE0GC8/O2LavsZLQJo6T55g1sG1hytkixM1
DsEaCG1qqe4yAthaW1Gge28uq5yd6k36cxOORwIhrP9usHKV1X6Z5IPbkziJ8XeJ
a+tSM/AD6m1oKMxPRJke7PkM04oc+cZzSPcmZ2abBocV2t/CLmd5TCgGPZ+er8aT
wOW0l0ERdomQMAGhMo8rJHN225YRE7fG3Hy5lhTux1mcAQsb4Y61QW8qxA1nCIqJ
d0tqu1GKLIwTGZEGG+fydMq7BAy+F3+duGopgY5IJ4bU1YGjsaU=
=eWzY
-----END PGP SIGNATURE-----

--geubzoieqitgmbmw--
