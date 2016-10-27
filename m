From: Marc Dietrich <marvin24@gmx.de>
Subject: Re: [PATCH] drivers: staging: nvec: remove bogus reset command for
 PS/2 interface
Date: Thu, 27 Oct 2016 15:59:51 +0200
Message-ID: <5597933.jS9uVMUSFX@fb07-iapwap2>
References: <18470230.WG6Q7IXVVu@fb07-iapwap2>
 <1477576595-20285-1-git-send-email-fercerpav@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2361309289862772732=="
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1477576595-20285-1-git-send-email-fercerpav@gmail.com>
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
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-tegra@vger.kernel.org, ac100@lists.launchpad.net
List-Id: linux-tegra@vger.kernel.org

--===============2361309289862772732==
Content-Type: multipart/signed; boundary="nextPart4037326.RVdMIuuh7H"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart4037326.RVdMIuuh7H
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="ISO-8859-1"

Hi Paul,

thanks for finding the issue!

Am Donnerstag, 27. Oktober 2016, 16:55:14 CEST schrieb Paul Fertser:
> This command was sent behind serio's back and the answer to it was
> confusing atkbd probe function which lead to the elantech touchpad
> getting detected as a keyboard.
> 
> To prevent this from happening just let every party do its part of the
> job.
> 
> Signed-off-by: Paul Fertser <fercerpav@gmail.com>

Please send a complete patch in a new thread (or titled with V2) with the 
serio type change included.

Thanks,

Marc

> ---
>  drivers/staging/nvec/nvec_ps2.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/staging/nvec/nvec_ps2.c
> b/drivers/staging/nvec/nvec_ps2.c index c83eeb4..910e87b 100644
> --- a/drivers/staging/nvec/nvec_ps2.c
> +++ b/drivers/staging/nvec/nvec_ps2.c
> @@ -106,7 +106,6 @@ static int nvec_mouse_probe(struct platform_device
> *pdev) {
>  	struct nvec_chip *nvec = dev_get_drvdata(pdev->dev.parent);
>  	struct serio *ser_dev;
> -	char mouse_reset[] = { NVEC_PS2, SEND_COMMAND, PSMOUSE_RST, 3 };
> 
>  	ser_dev = devm_kzalloc(&pdev->dev, sizeof(struct serio), GFP_KERNEL);
>  	if (!ser_dev)
> @@ -127,9 +126,6 @@ static int nvec_mouse_probe(struct platform_device
> *pdev)
> 
>  	serio_register_port(ser_dev);
> 
> -	/* mouse reset */
> -	nvec_write_async(nvec, mouse_reset, sizeof(mouse_reset));
> -
>  	return 0;
>  }


--nextPart4037326.RVdMIuuh7H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEcBAABCAAGBQJYEghXAAoJEKyeR39HFBto23IH/iwqoDllvzf3m7JfuPY07xM8
J7zsBgHyOEGY5bRdcOmK2oQSkUt51kR2B4GUQevscYKhksQySctuViDjOPfCAYom
JI4XC1rwlr45hN+4TVeIZvzZoi5Ruoc8f2PVs9wfYaGRBBdxyHMgXPLyvT6iX3YF
rvMHcm8urKTaUqO3FkBWuoWEOLivNQzBPL5rw1HBpCLmGZ8gxDrRbH7Vz4ilJKxR
zSPvpFHKjGLwYiktz3YdNJzLjVCaPDnkEmM9K2nyio/zz2z02ccC34EEQa+/7Kvn
7LpJsEnqckPzZosxwS3KjzLIyuZmIaiIhs74qsZ8X88ppAHZC9tJUTlqpYoX3ec=
=tXDy
-----END PGP SIGNATURE-----

--nextPart4037326.RVdMIuuh7H--


--===============2361309289862772732==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devel mailing list
devel@linuxdriverproject.org
http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel

--===============2361309289862772732==--
