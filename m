From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [Patch V3 11/18] usb: gadget: tegra-xudc: use phy_set_mode to
 set/unset device mode
Date: Tue, 28 Jan 2020 19:03:24 +0100
Message-ID: <20200128180324.GI2293590@ulmo>
References: <1577704195-2535-1-git-send-email-nkristam@nvidia.com>
 <1577704195-2535-12-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="byLs0wutDcxFdwtm"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1577704195-2535-12-git-send-email-nkristam@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nagarjuna Kristam <nkristam@nvidia.com>
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, kishon@ti.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--byLs0wutDcxFdwtm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 30, 2019 at 04:39:48PM +0530, Nagarjuna Kristam wrote:
> When device mode is set/uset, vbus override activity is done via

s/vbus/VBUS/

> exported functions from padctl driver. Use phy_set_mode instead.

Nit: phy_set_mode() to make it clearer that this is a function getting
called.

Thierry

--byLs0wutDcxFdwtm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4wd2wACgkQ3SOs138+
s6Gq7g/+Il1WuIahxBUiaNO+QsJjKN7QMFuayEBntEui5lNyGV9fIu0NhHznvi6m
KEX3m//OAllxiYLeXSepChA90p5sHS/jFojlEZZ9waoMf/d+W60+gc3V8Lbai9wp
ynceTr9jv3gzuF35ANHni73ohl8FU7VLVr84tpqaGxuiRk2pnReohZ8Bq4ifRG3W
pF2qcorXmAv2UwGd3PbPwqrnFzmjNd5h8lBOq8XMUgV+abLHlpugaUFFFA1TaWKU
Eejpj4yLnYQjzHuO5wn/i0nOGv0FqvAQiQdFFEasUVJHMOmXj4M6Wf5lD/Mke0/y
jlLCfBBEq2fhgnrErOQDYkSyDw/t4zCLuAOpN8ezPui+nvTga87IKV+wDWIzd9LR
d1qRP7Np0S9pY7c+YIzeIBWlW9zskLU31N4cO6mF87XLyENbiZhkR8OSFGakzocT
/O9fS0bwX9P86+/S3pVfAT17ahEULkhqPZSY8OcafJwg1NJhIeCkMKf3v3sW+0HH
bvMu+ShmG8AkPAt7rTOIezlx2tHfdBFMsyxF5fIWnnO7JC61EgDLGl3S3GWyJ0X/
Je1KUzhK4PdqJwkRvoSgATib8CrMfgy3UeRznUxHiaU6rlXfg+F1cQhKHHUhdA0G
aRfxLm/eskm/8CC6gHhUYDTExAF+W6HRhGyh9ME64P/yKFQO7wo=
=SwjF
-----END PGP SIGNATURE-----

--byLs0wutDcxFdwtm--
