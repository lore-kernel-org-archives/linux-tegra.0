From: Nicolas Dufresne <nicolas-dDhyB4GVkw9AFePFGvp55w@public.gmane.org>
Subject: Re: [PATCH v3 1/2] staging: Introduce NVIDIA Tegra20 video decoder
 driver
Date: Wed, 11 Oct 2017 16:47:18 -0400
Message-ID: <1507754838.19342.11.camel@ndufresne.ca>
References: <cover.1507752381.git.digetx@gmail.com>
         <3d432aa2617977a2b0a8621a1fc2f36f751133e1.1507752381.git.digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-hQ+YrLKtwEhINVxeVYTt"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3d432aa2617977a2b0a8621a1fc2f36f751133e1.1507752381.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--=-hQ+YrLKtwEhINVxeVYTt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 11 octobre 2017 =C3=A0 23:08 +0300, Dmitry Osipenko a =C3=A9cri=
t :
> diff --git a/drivers/staging/tegra-vde/TODO b/drivers/staging/tegra-
> vde/TODO
> new file mode 100644
> index 000000000000..e98bbc7b3c19
> --- /dev/null
> +++ b/drivers/staging/tegra-vde/TODO
> @@ -0,0 +1,5 @@
> +TODO:
> +       - Figure out how generic V4L2 API could be utilized by this
> driver,
> +         implement it.
> +

That is a very interesting effort, I think it's the first time someone
is proposing an upstream driver for a Tegra platform. When I look
tegra_vde_h264_decoder_ctx, it looks like the only thing that the HW is
not parsing is the media header (pps/sps). Is that correct ?

I wonder how acceptable it would be to parse this inside the driver. It
is no more complex then parsing an EDID. If that was possible, wrapping
this driver as a v4l2 mem2mem should be rather simple. As a side
effect, you'll automatically get some userspace working, notably
GStreamer and FFmpeg.

For the case even parsing the headers is too much from a kernel point
of view, then I think you should have a look at the following effort.
It's a proposal base on yet to be merged Request API. Hugues is also
propose a libv4l2 adapter that makes the driver looks like a normal
v4l2 m2m, hiding all the userspace parsing and table filling. This
though, is long term plan to integrate state-less or parser-less
encoders into linux-media. It seems rather overkill for state-full
driver that requires parsed headers like PPS/SPS.

https://lwn.net/Articles/720797/

regards,
Nicolas
--=-hQ+YrLKtwEhINVxeVYTt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCWd6DVwAKCRBxUwItrAao
HDQrAKDVFLfZTOGk1lK0E7rdaFkXPVUI1QCfasRs+MAVBvxhbQl6+N2IwHr2EkU=
=I5vO
-----END PGP SIGNATURE-----

--=-hQ+YrLKtwEhINVxeVYTt--
