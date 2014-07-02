From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [flasher PATCH 2/2] Wrap any env var settings in quotes
Date: Wed, 02 Jul 2014 12:46:01 -0600
Message-ID: <53B45369.8090506@wwwdotorg.org>
References: <1404322363-11580-1-git-send-email-swarren@wwwdotorg.org> <1404322363-11580-2-git-send-email-swarren@wwwdotorg.org> <53B45286.9050408@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53B45286.9050408-l3A5Bk7waGM@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 07/02/2014 12:42 PM, Andreas F=E4rber wrote:
> Hi,
>=20
> Am 02.07.2014 19:32, schrieb Stephen Warren:
>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> This allows run user to pass the following to the flashing script:
>=20
> Is "run user" a typo?

s/run/the/ !

>>     --env bootcmd 'usb start ; dhcp zImage'
>>
>> rather than having to manually escape the commands for U-Boot:
>>
>>     --env bootcmd 'usb start \; dhcp zImage'

>> diff --git a/tegra-uboot-flasher b/tegra-uboot-flasher

>>          if args.env:
>>              for (var, value) in args.env:
>> -                bootcmd +=3D 'setenv %s %s ; ' % (var, value)
>> +                bootcmd +=3D 'setenv %s \'%s\' ; ' % (var, value)
>=20
> Can't you just s/'/\\\'/g on value somehow, i.e. replace literal
> single-quote with an escaped backslash, escaped single-quote sequence=
?

I tried that manually at the command-line, and U-Boot's shell doesn't
seem to handle escaping quotes correctly. Escaped semicolons (which was
what I actually wanted to avoid writing manually) do work OK, but it's
simpler to just quote the whole thing rather than writing ever more
complicated parsers to quote certain characters or not based on whether
they're inside strings or not, etc. It'd be nice if U-Boot's setenv
could work like:

setenv -hex varname hex_encoded_value

=2E.. to completely avoid any quoting issues!
