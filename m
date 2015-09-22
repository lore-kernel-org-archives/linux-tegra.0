From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [cbootimage PATCH v1 7/8] Add new command line option "--sign |
 -n" to sign binary image
Date: Tue, 22 Sep 2015 00:36:49 +0000
Message-ID: <513d88b603bc47408b93cb972723a411@HQMAIL103.nvidia.com>
References: <1441228760-26042-1-git-send-email-jimmzhang@nvidia.com>
 <1441228760-26042-8-git-send-email-jimmzhang@nvidia.com>
 <560080F8.9090008@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <560080F8.9090008-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Stephen Warren' <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Allen Martin <AMartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

I will test again. If openssl can do the work, there is no need for patch 3 to 7.

> -----Original Message-----
> From: Stephen Warren [mailto:swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org]
> Sent: Monday, September 21, 2015 3:13 PM
> To: Jimmy Zhang
> Cc: Allen Martin; Stephen Warren; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Subject: Re: [cbootimage PATCH v1 7/8] Add new command line option "--
> sign | -n" to sign binary image
> 
> On 09/02/2015 03:19 PM, Jimmy Zhang wrote:
> > This option allows cbootimage to run as signing utility.
> 
> This seems rather unrelated to cbootimage's purpose. Wouldn't it be better
> to build a separate signing utility to do all the crypto? Can't the "openssl"
> application do any of this already?
