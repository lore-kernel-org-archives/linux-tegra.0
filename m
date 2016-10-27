From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH v2 0/2] staging: nvec: ps2: fix touchpad operation
Date: Thu, 27 Oct 2016 17:46:22 +0200
Message-ID: <1703154.hSBNnSU4vG@fb07-iapwap2>
References: <1477578154-21199-1-git-send-email-fercerpav@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2103275.XHjjXjXxdJ"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477578154-21199-1-git-send-email-fercerpav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Fertser <fercerpav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, ac100-oU9gvf+ajcQ97yFScArB1dHuzzzSOjJt@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

--nextPart2103275.XHjjXjXxdJ
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="ISO-8859-1"

Am Donnerstag, 27. Oktober 2016, 17:22:07 CEST schrieb Paul Fertser:
> Status quo on Toshiba ac100 (paz00) is that the integrated elantech touchpad
> is detected as an ImPS/2 mouse and so it's kind of functional but advanced
> synaptics configuration isn't available.
> 
> When only serio type is changed it leads to atkbd misdetecting the touchpad
> as a keyboard. So first goes the commit that fixes this bug, then the serio
> type change.
> 
> Paul Fertser (2):
>   drivers: staging: nvec: remove bogus reset command for PS/2 interface
>   Revert "staging: nvec: ps2: change serio type to passthrough"
> 
>  drivers/staging/nvec/nvec_ps2.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)

Works fine now. Thanks!

The series is 

Acked-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>


--nextPart2103275.XHjjXjXxdJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEcBAABCAAGBQJYEiFOAAoJEKyeR39HFBtoov4H/0v7Z12B68gCMnL6SKFlVC2o
0WpmCUUgz1fo+2c0EhIvFkGcVknEz8fptRZ1RtQ8fzHO2vlQmG+xxKm6Tow1l3Xd
N3eDbkyeTXS4Qv5FE0XwZKWXNuUxfFJadH1qaelVrsGERv2+ynDCAhebFAzaDiVC
/NzGvmAxggcIOMVp/tCfteDhG/NIZ337PGVhecLdL6bdRkaJPDYH1bk38NiaX0ZI
6qO/HI0/xcozNusMyS8e6ma7TqNlMqHRf9+TIwzmTNrngNF/lLR8dBWXyU85KVG4
+FZOxj2fZKuwsTfN/vNmf5mebMS5oRBqzO6WoQVGFAxj/z4SyXUYqhCkK0Iia2g=
=gxSk
-----END PGP SIGNATURE-----

--nextPart2103275.XHjjXjXxdJ--
