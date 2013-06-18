From: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/3] clk: tegra: T114: add DFLL DVCO reset control
Date: Tue, 18 Jun 2013 11:28:08 -0700
Message-ID: <20130618182808.9136.26244@quantum>
References: <20130607121505.21868.72360.stgit@dusk.lan>
 <20130607121901.21868.65416.stgit@dusk.lan> <51B21105.1080301@wwwdotorg.org>
 <alpine.DEB.2.02.1306071703050.7753@utopia.booyaka.com>
 <51B6D239.5030905@nvidia.com>
 <alpine.DEB.2.02.1306110944130.22645@utopia.booyaka.com>
 <20130616042256.7541.7096@quantum>
 <alpine.DEB.2.02.1306172019270.17176@utopia.booyaka.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.02.1306172019270.17176-rwI8Ez+7Ko+d5PgPZx9QOdBPR1lH4CV8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Aleksandr Frid <afrid-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Quoting Paul Walmsley (2013-06-17 13:22:48)
> Hi,
> 
> On Sat, 15 Jun 2013, Mike Turquette wrote:
> 
> > These patches appear fine to me but I did not see any Acks, nor could I
> > tell if a v2 was necessary based on the comments. Will there be another
> > version?
> 
> I'm not planning to do another version at this time.

Thanks for clarifying.  I couldn't tell based on the discussion.

Anyways I've taken these into clk-next now.  There is not maintainer for
that directory as you pointed out, so no need to wait for Acks.

Regards,
Mike

> 
> > If not an Acked-by or Reviewed-by would be cool.
> 
> Hmm, not sure who the right people would be.  Looks like the 
> drivers/clk/tegra directory is unmaintained, so not sure who could ack it?
> 
> Peter or Stephen, care to review these patches and send a Reviewed-by?
> 
> 
> - Paul
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
