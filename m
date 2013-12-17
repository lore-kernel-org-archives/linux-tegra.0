From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 RESEND 2/2] ASOC: tegra: fix AC97 clock handling
Date: Tue, 17 Dec 2013 15:20:35 -0700
Message-ID: <52B0CE33.7080605@wwwdotorg.org>
References: <1387277564-4774-1-git-send-email-dev@lynxeye.de> <1387277564-4774-2-git-send-email-dev@lynxeye.de> <20131217140017.GI3185@sirena.org.uk> <1387291793.1783.3.camel@tellur> <20131217214352.GF28455@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131217214352.GF28455-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 12/17/2013 02:43 PM, Mark Brown wrote:
> On Tue, Dec 17, 2013 at 03:49:53PM +0100, Lucas Stach wrote:
>> Am Dienstag, den 17.12.2013, 14:00 +0000 schrieb Mark Brown:
> 
>>> I don't understand this commit message at all I'm afraid.  What does it
>>> mean to "be in line with the devicetree" and what is the purpose of this
>>> change?
> 
>> Clocks were added to the DT after the Tegra AC97 driver was initially
>> pushed upstream and the layout changed a bit in the process. Stephen
>> Warren convinced me that it's the right thing to let the Audio PLL be
>> controlled by the ASoC machine driver, rather than the AC97 host
>> controller driver.
> 
>> So currently the host controller driver asks for clocks that aren't
>> there in the DT. This change corrects the clock handling so that the
>> host controller driver only ask for it's own clock, but the Audio PLL
>> handling is pushed into the machine driver.
> 
> Are we sure this is the best thing to do here?  There is standard
> clocking behaviour specified in AC'97 so if the machine driver clocking
> control includes that it's not clear that we want to vary it.  In any
> case a clearer changelog explaining that the driver never worked due to
> these clocking changes would be good.

The Tegra clocking architecture has a shared audio PLL that provides
clocks to the various IO controllers (I2S, AC'97, S/PDIF). In order to
allow multiple IO controllers to be in use at once, a single SW entity
has to manage the clocks, so that it can configure the audio PLL, rather
than having each individual IO controller attempt to assert ownership on
the shared resource. The centralized PLL management needs to switch the
PLL rate between 2 different values for 48-/44.1KHz-based audio for
example, and deny requests to switch if already-active audio is running
at the other rate.

So yes, I think doing this all in the machine driver is the best thing.
