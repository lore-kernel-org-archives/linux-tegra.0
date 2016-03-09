From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [tegrarcm PATCH v1 3/4] Add option --signed
Date: Wed, 9 Mar 2016 00:36:04 +0000
Message-ID: <90950f4d7098476891feda7e5e803cfa@HQMAIL103.nvidia.com>
References: <1457135087-967-1-git-send-email-jimmzhang@nvidia.com>
 <1457135087-967-4-git-send-email-jimmzhang@nvidia.com>
 <56DDE53D.4060206@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56DDE53D.4060206-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Allen Martin <AMartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org" <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org



> -----Original Message-----
> From: Stephen Warren [mailto:swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org]
> Sent: Monday, March 07, 2016 12:32 PM
> To: Jimmy Zhang
> Cc: Allen Martin; Stephen Warren; alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org; linux-
> tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Subject: Re: [tegrarcm PATCH v1 3/4] Add option --signed
> 
> On 03/04/2016 04:44 PM, Jimmy Zhang wrote:
> > This option allows user to specify and download signed rcm messages
> > and bootloader to device. This option must come along with option "--
> miniloader".
> >
> > Example:
> > $ sudo ./tegrarcm --miniloader t124_ml_rcm.bin --signed --bct test.bct
> > --bootloader u-boo
> 
> I won't review this patch in detail since I expect it will change quite a bit to
> implement 3 modes of operation:
> 

All three modes are in place.

> a) Create signed files, don't interact with HW.

This is patch 2/4. Command syntax:
$ sudo ./tegrarcm --ml_rcm <ml> --pkc <keyfile> --bootloader <bootloader>

User still needs to put device in recovery mode so that tegrarcm can detect and figure out what soc. Otherwise, we need to add one more parameter for soc.

> b) Read signed files, send them to HW.

This is patch 3/4. Command syntax:
$ sudo ./tegrarcm --miniloader <signed_ml> --signed --bct <bct> --bootloader <bootloader> --loadaddr <addr> 

> c) Sign data on-the-fly, while sending it to HW.

This is patch 1/4. Command syntax:
$ sudo ./tegrarcm --pkc <keyfile> --bct <bct> --bootloader <bootloader> --loadaddr <addr>
