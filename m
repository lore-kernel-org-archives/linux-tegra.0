From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [cbootimage PATCH v7 0/5] Add RSA signing support
Date: Mon, 19 Oct 2015 23:59:44 +0000
Message-ID: <4720b856192b4b60b88639f312612403@HQMAIL103.nvidia.com>
References: <1445295718-19146-1-git-send-email-jimmzhang@nvidia.com>
 <562580FF.5000908@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <562580FF.5000908-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Stephen Warren' <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Allen Martin <AMartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Thanks.

> -----Original Message-----
> From: Stephen Warren [mailto:swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org]
> Sent: Monday, October 19, 2015 4:47 PM
> To: Jimmy Zhang
> Cc: Allen Martin; Stephen Warren; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Subject: Re: [cbootimage PATCH v7 0/5] Add RSA signing support
> 
> On 10/19/2015 05:01 PM, Jimmy Zhang wrote:
> > V7:
> > 1 Redefine parameter "u_int8_t *in" as "const u_int8_t *in" for function
> >     reverse_byte_order()
> > 2 Clean up compiler warnings from nvbctlib_t210.c
> 
> I've applied this series, and pushed it and a new tag to github.
> 
> (I edited the commit descriptions to remove the changelog from them; it
> should go below the --- line)
