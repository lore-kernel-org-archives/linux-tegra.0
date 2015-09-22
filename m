From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [cbootimage PATCH v1 6/8] Add new configuration keyword
 "ReSignBl"
Date: Tue, 22 Sep 2015 00:45:02 +0000
Message-ID: <8fffb905ee924c52b6f57b39ddffa43a@HQMAIL103.nvidia.com>
References: <1441228760-26042-1-git-send-email-jimmzhang@nvidia.com>
 <1441228760-26042-7-git-send-email-jimmzhang@nvidia.com>
 <5600804F.402@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5600804F.402-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Stephen Warren' <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Allen Martin <AMartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org



> -----Original Message-----
> From: Stephen Warren [mailto:swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org]
> Sent: Monday, September 21, 2015 3:10 PM
> To: Jimmy Zhang
> Cc: Allen Martin; Stephen Warren; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Subject: Re: [cbootimage PATCH v1 6/8] Add new configuration keyword
> "ReSignBl"
> 
> On 09/02/2015 03:19 PM, Jimmy Zhang wrote:
> > In case an image is updated after initial signing, use "ReSignBl"
> > to re-generate aes hash and pkc pss signatures if PkcKey is present.
> >
> > For example:
> >
> > Define re-sign.cfg as below:
> >     PkcKey = rsa_priv.pem, --save;
> >     ReSignBl;
> >
> > Run command below to re-sign image:
> >     $ cbootimage -s tegra210 --update re-sign.cfg image
> > image-re-signed
> 
> Is this to support the case where someone just dd's a new bootloader into an
> existing flash image? Why not just rebuild the flash image from scratch using
> existing features?

This is used in case certain blocks of bootloader are only reserved during initial build but filled up by another utility at later stage. 
  
