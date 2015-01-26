From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH 1/2] i2c: tegra: Maintain CPU endianness
Date: Mon, 26 Jan 2015 17:03:39 +0100
Message-ID: <20150126160339.GD13494@katana>
References: <1421756555-20266-1-git-send-email-digetx@gmail.com>
 <20150122074001.GB427@ulmo>
 <CAAVeFuJHST9VOWXe_cZNvLmfGdamuU4HSgdZC6EoQvrsGFt+Fg@mail.gmail.com>
 <54C115D1.10206@gmail.com>
 <54C12010.8040504@gmail.com>
 <54C130EA.2050505@gmail.com>
 <20150123094552.GD3835@ulmo>
 <54C24C2B.1070907@gmail.com>
 <54C2601A.7000005@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SFyWQ0h3ruR435lw"
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54C2601A.7000005-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, Bob Mottram <bob.mottram-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--SFyWQ0h3ruR435lw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Gaahh! I'm sure it wasn't working before! I'll make more testing and send v3
> without "val = 0", if all will be fine.

Please either send V3 or explicitly say V2 is OK. No need to hurry, just
saying that I am waiting for updates here...


--SFyWQ0h3ruR435lw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUxmVbAAoJEBQN5MwUoCm2rLQP/0WMl+aUZlYeez5AuGegWpdJ
kaedZGnPVxHNj3haQE+YMC1G6FL6qnB1EnRRKsEwUuM/jFHTtWCKCfcYevpBzqal
7yOvGJt+5vGhcwnWB6epsCQvjQy58JeACkj7f6oLlYDj1fxJxxUYpcX4vttYlTc+
tboAM4WlU/QhiNNfvyNmCa1AGplBqNobbDpgHs2fpXP9o0GtjGHbfxRuCgqUHQ0G
oTeCHwzcPwwUonRAXBXkLG9qrxuwRaMpfO9VxXYOaiFfkh35E327X+r4rYTdtwpf
phcd4elOteJf8KFK2iVFegR79KYoky01Fq1ytMHyUALvufpsYZqBynv2GCzSYAfR
jTbM1zzrtAI2a5vreESugtvSYdFiVfYfWjmJqg/f3VirskU/vbuIww8mMproHSsC
3CU8aZGNhv9XD/kBLvStrtzmzh/po4HI+Do+z6Z9NiO56hfsiyvPWZHEIRNfcYbp
vWWKTuEdbVU50vkyIWEt0NyFl8WaCxaCa/YfzSrfEexqsI6JYaXmmLzF1KmN3Ga6
eO5KY7qVdbR13+TJLx9QhL3Q9GadQrTllkSvHiA7YD6b1HAfWRt4jpfePEXE23G5
bSR5K++VKWl/YnVCS/k4i0XfSiEUAn4cfb7hM8TAq391K7g7j1FgTSDtkzKnICiG
zgzJplhuujK2yBu7mcCf
=9K6z
-----END PGP SIGNATURE-----

--SFyWQ0h3ruR435lw--
