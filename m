From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH v2 RESEND 2/2] ASOC: tegra: fix AC97 clock handling
Date: Tue, 17 Dec 2013 15:49:53 +0100
Message-ID: <1387291793.1783.3.camel@tellur>
References: <1387277564-4774-1-git-send-email-dev@lynxeye.de>
	 <1387277564-4774-2-git-send-email-dev@lynxeye.de>
	 <20131217140017.GI3185@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131217140017.GI3185-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Am Dienstag, den 17.12.2013, 14:00 +0000 schrieb Mark Brown:
> On Tue, Dec 17, 2013 at 11:52:44AM +0100, Lucas Stach wrote:
> > This corrects the Tegra AC97 clock handling to be in line with
> > the devicetree. Audio PLL is controlled by the machine driver, only
> > AC97 host controller clock remains to be independent.
> 
> I don't understand this commit message at all I'm afraid.  What does it
> mean to "be in line with the devicetree" and what is the purpose of this
> change?
> 
Clocks were added to the DT after the Tegra AC97 driver was initially
pushed upstream and the layout changed a bit in the process. Stephen
Warren convinced me that it's the right thing to let the Audio PLL be
controlled by the ASoC machine driver, rather than the AC97 host
controller driver.

So currently the host controller driver asks for clocks that aren't
there in the DT. This change corrects the clock handling so that the
host controller driver only ask for it's own clock, but the Audio PLL
handling is pushed into the machine driver.

Regards,
Lucas

> I should also have mentioned on the previous patch: please use subject
> lines matching the subsystem.  You've got "ASOC" not "ASoC".
