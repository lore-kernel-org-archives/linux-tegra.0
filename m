From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH v2 RESEND 2/2] ASOC: tegra: fix AC97 clock handling
Date: Wed, 18 Dec 2013 12:33:41 +0100
Message-ID: <1387366421.1783.2.camel@tellur>
References: <1387277564-4774-1-git-send-email-dev@lynxeye.de>
	 <1387277564-4774-2-git-send-email-dev@lynxeye.de>
	 <20131217140017.GI3185@sirena.org.uk> <1387291793.1783.3.camel@tellur>
	 <20131217214352.GF28455@sirena.org.uk> <52B0CE33.7080605@wwwdotorg.org>
	 <20131217222847.GK28455@sirena.org.uk> <52B0D152.2060504@wwwdotorg.org>
	 <20131217223957.GO28455@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131217223957.GO28455-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Am Dienstag, den 17.12.2013, 22:39 +0000 schrieb Mark Brown:
> On Tue, Dec 17, 2013 at 03:33:54PM -0700, Stephen Warren wrote:
> > On 12/17/2013 03:28 PM, Mark Brown wrote:
> 
> > > How does doing this in the machine driver help here?  The machine driver
> > > isn't going to be any more coordinated with other machine drivers than
> > > the controller is.
> 
> > There would only be one machine driver loaded at a time. It should
> > provide top-level control over all the audio paths in the Tegra audio
> > subsystem.
> 
> OK, so that's not how everyone else has done these isolated
> controllers...  to be honest I'm not convinced that this is something
> worth worrying about for AC'97 - the clocking is fixed in the spec
> unless you're being fancy and the chances of anyone being fancy are
> minimal these days.  It's probably more likely to make life miserable
> for people trying to get AC'97 working than anything else.
> 
Essentially the only Tegra machine driver using AC97 is providing a
fixed clock. It's just a convention for all Tegra sound drivers to do
the PLL handling in the machine driver, I'd say it just more confusing
to do it another way just for this one corner case.

> But like I say the big thing is a comprehensible changelog.

Ok, I'll resend with a better changelog.

Regards,
Lucas
