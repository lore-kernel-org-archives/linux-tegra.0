From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [flasher PATCH V2 1/4] Add crc32 verification of the flash image
Date: Fri, 6 Dec 2013 20:56:38 +0100
Message-ID: <20131206195637.GB923@mithrandir>
References: <1386351334-25766-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CUfgB8w4ZwR/yMy5"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1386351334-25766-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--CUfgB8w4ZwR/yMy5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 06, 2013 at 10:35:33AM -0700, Stephen Warren wrote:
[...]
> diff --git a/tegra-uboot-flasher b/tegra-uboot-flasher
[...]
> @@ -125,6 +129,19 @@ def func_flash():
>      if args.debug:
>          print 'flash_img_size %d 0x%x' % (flash_img_size, flash_img_size)
> =20
> +    imgf =3D file(flash_img, 'rb')
> +    imgd =3D imgf.read()
> +    imgf.close()
> +    flash_img_crc32 =3D binascii.crc32(imgd)
> +    if args.debug:
> +        print 'flash_img_crc32 %x' % flash_img_crc32
> +    flash_img_crc32_bs =3D (
> +        ((flash_img_crc32 & 0xff) << 24) |
> +        ((flash_img_crc32 & 0xff00) << 8) |
> +        ((flash_img_crc32 & 0xff0000) >> 8) |
> +        ((flash_img_crc32 & 0xff000000) >> 24)
> +    )

I would've thought that Python actually supported byteswapping with some
function, but it seems not (or at least not trivially). One could do
something like this:

	a =3D array.array('I', [crc])
	a.byteswap()
	crc =3D a[0]

But with the array module you apparently can't force 32-bit values. 'I'
will be at least 2, but 4 on 32-bit and 64-bit systems, 'L' will be 64
bits on 64-bit systems and 32 bits on 32-bit systems it seems. You could
check a.itemsize to determine the right type code. I suppose we won't be
running on anything but 32- or 64-bit systems for a while, but it still
said there's no support for sized types there.

It could possibly be done with the struct module as well, but that would
likely end up much more verbose too, so:

Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--CUfgB8w4ZwR/yMy5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSoiv1AAoJEN0jrNd/PrOhNUoP/343u7WiwOL2hFWjUepHYrqy
ssu0huW0BVUmLRG2BtsGUjNOHwhhZMY6izQLV11YoeWAWh0TP9LLgGV8Sm32X+LF
0s8qxlaufnAoXaveOOKc6u0oU8FXlbHCaDDqqvuKIcD+M3xmHVklbvp6JchV2WQ+
VGeVPs4roPyEondkqrNMkdnKjYsIa4tJtDd8Si8BKGmlZLJMKkR221q9+I4XJBZ7
MS8eo4g+WoeZ26a9Sqx+MrNzxQY4nkthTvHxA9axUiyUWYhIp4jRYCX481ypoq+x
VotwljhBBWI0gagJxsGjbjvU13XCj6AbwW6v1dlOhwvde1BiLlTvfle6559JISK1
bThQ3DloZfxYWf1HqXJR7NVWaFhyQUKklLNKf3VXGsgDC4RdTlR/bOfxFRRScE0d
jxzjeBLg3KuOjAuyvYNl7heIaPeyip0RArHEWa6XKqlCPB+pANZ6WEiuH85smlay
VtI6qK3keBY2is87lFNo3hs9ZdfNOXSZ/m8zCv48vrJ/D0xZrRqJjy1eyZgT8KXv
S969yIMNh5Orka5BYDjkJsUlMbbjnTRKhi8HoeC7yYbBvz7Nwv5wU4boIMwdlW3J
4/F1RodwosPOjlRsqrEHQEgKpIKLUJDjJdEubSsUdP0c4joEnf8fsqYnheLgWxGM
vvSwZNsKFB5v2fHmFgsI
=n4Qw
-----END PGP SIGNATURE-----

--CUfgB8w4ZwR/yMy5--
