From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [cbootimage PATCH v5 2/5] Add support to dump rsa related fields
 for t210
Date: Tue, 13 Oct 2015 00:56:18 +0000
Message-ID: <ab16c6505a7e4e62b726e6433dc585b8@HQMAIL103.nvidia.com>
References: <1444441574-17205-1-git-send-email-jimmzhang@nvidia.com>
 <1444441574-17205-3-git-send-email-jimmzhang@nvidia.com>
 <561C393E.2050707@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <561C393E.2050707-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Stephen Warren' <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Allen Martin <AMartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org



> -----Original Message-----
> From: Stephen Warren [mailto:swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org]
> Sent: Monday, October 12, 2015 3:51 PM
> To: Jimmy Zhang
> Cc: Allen Martin; Stephen Warren; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Subject: Re: [cbootimage PATCH v5 2/5] Add support to dump rsa related
> fields for t210
> 
> On 10/09/2015 07:46 PM, Jimmy Zhang wrote:
> > Add support to dump rsa pubkey, bct's rsa-pss signature and
> > bootloader's rsa-pss signature.
> 
> > diff --git a/src/bct_dump.c b/src/bct_dump.c
> 
> > +#define ARSE_RSA_PARAM_MAX_BYTES	256
> >   typedef union {
> >   	u_int32_t val;
> >   	u_int8_t uid[16];
> > +	u_int8_t rsa_param[ARSE_RSA_PARAM_MAX_BYTES];
> >   } param_types;
> 
> Shouldn't that be replaced by something that uses the new get_size()
> functionality now implemented in patch 1?

For this data structure, I guess we better stay with a MAX constant.

For display functions, ie

values[i].format(...)
bl_values[j].format(...)

There is no id token being passed in. To use get_size(),  all format_xxx function prototype need to be redefined (by adding in id token). 

I can submit a new patch if you agree my observations.
