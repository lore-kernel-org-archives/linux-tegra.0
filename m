From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH flasher 1/2] Pre-calculate more in find_config_dir()
Date: Thu, 13 Jun 2013 20:55:11 +0200
Message-ID: <20130613185510.GF32574@mithrandir>
References: <1371143150-3935-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="65ImJOski3p8EhYV"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1371143150-3935-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--65ImJOski3p8EhYV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2013 at 11:05:49AM -0600, Stephen Warren wrote:
[...]
> diff --git a/tegra-uboot-flasher b/tegra-uboot-flasher
[...]
> @@ -80,11 +80,15 @@ def find_config_dir():
>          print 'Unknown config "%s"' % args.configname
>          sys.exit(1)
> =20
> -    global boardname, socname, out_board_dir
> +    global config, boardname, board, socname, soc, out_board_dir, bct

That'll be a bit ugly to put in a tuple, so maybe you should stick with
globals after all.

Thierry

--65ImJOski3p8EhYV
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJRuhWOAAoJEN0jrNd/PrOhbcsP/0h27Axh9ZPtXWkTcnjNE7a2
GWbtOjSE9t697Xpub4XcFbotxLKfS+w6QPTkeejwz1/Wrga/ldAVfdIVrJhD791y
fjl0RzZObuQPZVAw1en9oaJ18bAsV8smMUqcRDL9mCRBuh94k19VnXYeG11ytxj0
LLRXO3ZP/Txquxl1W220xl1fAhfV9traqF1LStyG1HhAOlH8nRDunEs3fmwdxUUk
rI/2C3XmmiIxqK0qsTZNbEFJaD2VFR5lxKNMn6Sl5cM9auWwpfZNHzHVs3aCBW55
tS0gGlekEjEywysXjzO4By0JELGtV3DoQ3FlMEP6h88q6db3UGX1cjQ6A0MJFOOc
F5olP6qamoGZboUjz2hndvgv3XoLKE+SdaZbJ1TLUj55vIOX9K27PQ5t22CSGhxc
LERMZZQ8i+Q90Mc6+6GeOXSdOxue9HwWyaM83fa2PNW1VF4fonS7FyDb4+4lFQB2
xg4p/6Ea4+ElwGC2E4KB9zclOVEYOpN9nuJ7YXl1cHNXjgLJjBFuj3+yYxu8yrTq
RXX7Vb8b8EhZ3yq6oxTpCWktYPPkyZd/L2sWnKLN05dSTNt5XAYO/5WW67uqlOu9
T4+OxvSVy4DHaWe2Epf6N/g+U09NxvpGna8TMoam/s9W5OHEftFb9BHBnsyzvzOf
qcITRQv8G9JgA0InwU+5
=W+iE
-----END PGP SIGNATURE-----

--65ImJOski3p8EhYV--
