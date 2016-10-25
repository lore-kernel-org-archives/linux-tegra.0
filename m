From: Marc Dietrich <marvin24@gmx.de>
Subject: Re: [PATCH] Revert "staging: nvec: ps2: change serio type to
 passthrough"
Date: Tue, 25 Oct 2016 14:24:52 +0200
Message-ID: <18470230.WG6Q7IXVVu@fb07-iapwap2>
References: <1477397482-31087-1-git-send-email-fercerpav@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7492738423537307783=="
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1477397482-31087-1-git-send-email-fercerpav@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Paul Fertser <fercerpav@gmail.com>
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, ac100@lists.launchpad.net
List-Id: linux-tegra@vger.kernel.org

--===============7492738423537307783==
Content-Type: multipart/signed; boundary="nextPart1502648.Ftb5dVdU55"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart1502648.Ftb5dVdU55
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="ISO-8859-1"

Hi Paul, Greg,

Am Dienstag, 25. Oktober 2016, 15:10:55 CEST schrieb Paul Fertser:
> This reverts commit 36b30d6138f4677514aca35ab76c20c1604baaad.
> 
> This is necessary to detect paz00 (ac100) touchpad properly as one
> speaking ETPS/2 protocol. Without it X.org's synaptics driver doesn't
> work as the touchpad is detected as an ImPS/2 mouse instead.
> 
> Commit ec6184b1c717b8768122e25fe6d312f609cc1bb4 changed the way
> auto-detection is performed on ports marked as pass through and made the
> issue apparent.
> 
> A pass through port is an additional PS/2 port used to connect a slave
> device to a master device that is using PS/2 to communicate with the
> host (so slave's PS/2 communication is tunneled over master's PS/2
> link). "Synaptics PS/2 TouchPad Interfacing Guide" describes such a
> setup (PS/2 PASS-THROUGH OPTION section).
> 
> Since paz00's embedded controller is not connected to a PS/2 port
> itself, the PS/2 interface it exposes is not a pass-through one.
> 
> Acked-by: Marc Dietrich <marvin24@gmx.de>
> Signed-off-by: Paul Fertser <fercerpav@gmail.com>

In fact I was a bit to fast to ack. Turns out I booted the wrong kernel. So 
please hold off this one, until some issues with this patch are fixed.

Marc


> ---
>  drivers/staging/nvec/nvec_ps2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/nvec/nvec_ps2.c
> b/drivers/staging/nvec/nvec_ps2.c index a324322..c83eeb4 100644
> --- a/drivers/staging/nvec/nvec_ps2.c
> +++ b/drivers/staging/nvec/nvec_ps2.c
> @@ -112,7 +112,7 @@ static int nvec_mouse_probe(struct platform_device
> *pdev) if (!ser_dev)
>  		return -ENOMEM;
> 
> -	ser_dev->id.type = SERIO_PS_PSTHRU;
> +	ser_dev->id.type = SERIO_8042;
>  	ser_dev->write = ps2_sendcommand;
>  	ser_dev->start = ps2_startstreaming;
>  	ser_dev->stop = ps2_stopstreaming;


--nextPart1502648.Ftb5dVdU55
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEcBAABCAAGBQJYD08UAAoJEKyeR39HFBtomGMH/2n01nWIrjmXtdhgfSnHLIZV
AUqkZSJpHMvcgdb9emLUvHZ1fLWLJnu9NqIqFGHI74xKf1icdpbLH0LlRJLDhURD
LnSL7nlNTdg6jPIJRMfycusKAMPzEy7v4zynS7EZGzwyswYv5P4L1zeu8h4IYpM2
/VWti3kJ9LIk6I3RNsvXTU6uZGMz0iSNrc1PCpxi6IMEnoRisyM/k9BdeQHLKDzT
DOuM2N+FvI5Cs3evWDNQXeO+BxGs6urNJgLxn9PdO2joQXG0ShfCSBgyN+dDNaEF
CZHWOhdCwQFhUicUN0zPre8jvhD3GgxuSGRa9LwWtlsR7keAsSX/H/HMTM0Ez4U=
=fgQd
-----END PGP SIGNATURE-----

--nextPart1502648.Ftb5dVdU55--


--===============7492738423537307783==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devel mailing list
devel@linuxdriverproject.org
http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel

--===============7492738423537307783==--
