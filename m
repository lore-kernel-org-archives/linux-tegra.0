From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [flasher PATCH 2/2] Wrap any env var settings in quotes
Date: Wed, 02 Jul 2014 20:42:14 +0200
Message-ID: <53B45286.9050408@suse.de>
References: <1404322363-11580-1-git-send-email-swarren@wwwdotorg.org> <1404322363-11580-2-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1404322363-11580-2-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

Am 02.07.2014 19:32, schrieb Stephen Warren:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> This allows run user to pass the following to the flashing script:

Is "run user" a typo?

>=20
>     --env bootcmd 'usb start ; dhcp zImage'
>=20
> rather than having to manually escape the commands for U-Boot:
>=20
>     --env bootcmd 'usb start \; dhcp zImage'
>=20
> (The quoting in both cases is for the shell invoking tegra-uboot-flas=
her,
> not for U-Boot's command-line. The removed escaping was to work aroun=
d
> the lack of quoting/escaping when passing the user's command to U-Boo=
t's
> setenv command during flashing.)
>=20
> This change will interact badly with the user wanting to use single
> quotes in environment variable values, but hopefully that's less like=
ly,
> and can be fixed later if needed.
>=20
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  tegra-uboot-flasher | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tegra-uboot-flasher b/tegra-uboot-flasher
> index c9adba607c69..ed2f2d91d336 100755
> --- a/tegra-uboot-flasher
> +++ b/tegra-uboot-flasher
> @@ -213,7 +213,7 @@ def func_flash():
>              bootcmd +=3D 'setenv board ' + boardname + config['dtbfn=
-extra'] + ' ; '
>          if args.env:
>              for (var, value) in args.env:
> -                bootcmd +=3D 'setenv %s %s ; ' % (var, value)
> +                bootcmd +=3D 'setenv %s \'%s\' ; ' % (var, value)

Can't you just s/'/\\\'/g on value somehow, i.e. replace literal
single-quote with an escaped backslash, escaped single-quote sequence?

Regards,
Andreas

>          bootcmd +=3D 'saveenv ; '
>          bootcmd +=3D 'echo >>> Flashing OK, rebooting... ; '
>          # To update the bootloader, reset.

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrn=
berg
