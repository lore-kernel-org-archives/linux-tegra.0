From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [tegrarcm PATCH v1 3/4] Add option --signed
Date: Wed, 9 Mar 2016 21:01:44 +0000
Message-ID: <efdc080b4a0f4bd4a8a736d947417acd@HQMAIL103.nvidia.com>
References: <1457135087-967-1-git-send-email-jimmzhang@nvidia.com>
 <1457135087-967-4-git-send-email-jimmzhang@nvidia.com>
 <56DDE53D.4060206@wwwdotorg.org>
 <90950f4d7098476891feda7e5e803cfa@HQMAIL103.nvidia.com>
 <56E05D75.5050707@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56E05D75.5050707-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Allen Martin <AMartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org" <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org



> -----Original Message-----
> From: Stephen Warren [mailto:swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org]
> Sent: Wednesday, March 09, 2016 9:29 AM
> To: Jimmy Zhang
> Cc: Allen Martin; Stephen Warren; alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org; linux-
> tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Subject: Re: [tegrarcm PATCH v1 3/4] Add option --signed
> 
> On 03/08/2016 05:36 PM, Jimmy Zhang wrote:
> >
> >
> >> -----Original Message-----
> >> From: Stephen Warren [mailto:swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org]
> >> Sent: Monday, March 07, 2016 12:32 PM
> >> To: Jimmy Zhang
> >> Cc: Allen Martin; Stephen Warren; alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org;
> >> linux- tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> >> Subject: Re: [tegrarcm PATCH v1 3/4] Add option --signed
> >>
> >> On 03/04/2016 04:44 PM, Jimmy Zhang wrote:
> >>> This option allows user to specify and download signed rcm messages
> >>> and bootloader to device. This option must come along with option
> >>> "--
> >> miniloader".
> >>>
> >>> Example:
> >>> $ sudo ./tegrarcm --miniloader t124_ml_rcm.bin --signed --bct
> >>> test.bct --bootloader u-boo
> >>
> >> I won't review this patch in detail since I expect it will change
> >> quite a bit to implement 3 modes of operation:
> >>
> >
> > All three modes are in place.
> >
> >> a) Create signed files, don't interact with HW.
> >
> > This is patch 2/4. Command syntax:
> > $ sudo ./tegrarcm --ml_rcm <ml> --pkc <keyfile> --bootloader
> > <bootloader>
> >
> > User still needs to put device in recovery mode so that tegrarcm can detect
> and figure out what soc. Otherwise, we need to add one more parameter for
> soc.
> >
> >> b) Read signed files, send them to HW.
> >
> > This is patch 3/4. Command syntax:
> > $ sudo ./tegrarcm --miniloader <signed_ml> --signed --bct <bct>
> > --bootloader <bootloader> --loadaddr <addr>
> >
> >> c) Sign data on-the-fly, while sending it to HW.
> >
> > This is patch 1/4. Command syntax:
> > $ sudo ./tegrarcm --pkc <keyfile> --bct <bct> --bootloader
> > <bootloader> --loadaddr <addr>
> 
> OK. Updating the documentation would be useful to make this clear.
> 
> I don't like describing the file that contains signed data as a miniloader.
> Doesn't the file contain much more than the miniloader (IIUC, all the RCM
> messages need to be signed, so presumably we need to pre-calculate and
> store all RCM messages to avoid tegrarcm needing access to the PKC which is
> the whole point of this mode of operation)? I would like to see the --
> miniloader option reserved for the case where we allow the user to supply
> an alternative (plain unsigned, no header) miniloader binary instead of the
> built-in binary.
> 
> As I probably mentioned before, the naming of --ml_rcm isn't great.
> 
> I don't like the fact that the operational mode is derived from the set of
> command-line arguments. I'd like the default to be to interact with HW,
> perform signatures if required, and download data to the HW. I'd prefer the
> other modes to be explicitly requested so it's clear what the tool will do;
> perhaps something like:
> 
> download unsigned:
> tegrarcm --bootloader <bl> --loadaddr <addr>
> 
> download with auto-signing:
> tegrarcm --bootloader <bl> --loadaddr <addr> --pkc <pkc>
> 
> generate signed messages:
> tegrarcm --gen-signed-msgs --signed-msgs-file msgs.bin \
>      --bootloader <bl> --loadaddr <addr> --pkc <pkc>
> 
The signed messages include
a) query version rcm
b) download miniloader rcm
c) bl signature

During flashing, tegrarcm needs to down load these three blobs as independent binary to target at predefined flashing phase. Currently I use option "--ml_rcm" and "--bootloader" to derive filenames for these three blobs. If using one file for all, we have to come up a mechanism to pack them together during signing and unpack them when flashing. I agree with your command line parameter. But, I still prefer to create separate message files. For example, if I have a command as below:

 tegrarcm --gen-signed-msgs  --signed-msgs-file rel_1001.bin \
      --bootloader <bl> --loadaddr <addr> --pkc <pkc>

I prefer to actually create files 
a) rel_1001.bin.qry for signed query version rcm
b) rel_1001.bin.ml for signed download miniloader rcm
c) rel_1001.bin.bl for bootloader's 256 bytes rsa_pss signature

User should have doc to trace what key_file, bootloader (flasher) are used for rel_1001

> execute signed messages:
> tegrarcm --send-signed-msgs --signed-msg-file msgs.bin
> 
> It also seems useful for the "generate signed messages" mode of operation
> to work without access to any HW. If we have a separate factory (that
> programs HW) and signature server (that generates the signed message file
> for the factory to use), I don't see why the signature server system should
> need a Tegra device attached just to calculate the messages to send to the
> HW. Presumably this simply means passing a --soc option when using the --
> gen-signed-msgs flag? Or is there more needed beyond just the SoC type?

Yes, SoC type is the only thing needed for generating correct version of rcm messages.
