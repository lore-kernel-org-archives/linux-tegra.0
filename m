From: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [tegrarcm PATCH 1/1] tegrarcm: Add odm production secure mode
 support
Date: Wed, 2 Apr 2014 11:15:40 -0700
Message-ID: <20140402181540.GA31248@nvidia.com>
References: <1396403868-14479-1-git-send-email-pchiu@nvidia.com>
 <533C43AE.1090502@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <533C43AE.1090502-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Apr 02, 2014 at 10:06:54AM -0700, Stephen Warren wrote:
> On 04/01/2014 07:57 PM, Penny Chiu wrote:
> > tegrarcm should work if the operating mode is ODM production
> > secure mode. Add the operating mode definition and description.
> 
> > diff --git a/src/main.c b/src/main.c
> 
> >  	if (info.op_mode != RCM_OP_MODE_DEVEL &&
> >  	    info.op_mode != RCM_OP_MODE_ODM_OPEN &&
> > +	    info.op_mode != RCM_OP_MODE_ODM_SECURE &&
> >  	    info.op_mode != RCM_OP_MODE_PRE_PRODUCTION)
> 
> Are there even more modes beyond those? I wonder if that check is even
> necessary any more, or whether tegrarcm should just try to communicate
> no matter what.

There are other modes, but they are all secure modes, and tegrarcm has
no support for encrypting RCM payloads today, so the proper thing to
do is fail if its not one of these modes.

> Still, any changes here can be addressed in a separate patch.
> 
> Acked-by:
> Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Allen, will you apply this or do you want me to?

Acked-by: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

I will apply.

-Allen

nvpublic
