From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 RESEND 2/2] ASOC: tegra: fix AC97 clock handling
Date: Tue, 17 Dec 2013 15:33:54 -0700
Message-ID: <52B0D152.2060504@wwwdotorg.org>
References: <1387277564-4774-1-git-send-email-dev@lynxeye.de> <1387277564-4774-2-git-send-email-dev@lynxeye.de> <20131217140017.GI3185@sirena.org.uk> <1387291793.1783.3.camel@tellur> <20131217214352.GF28455@sirena.org.uk> <52B0CE33.7080605@wwwdotorg.org> <20131217222847.GK28455@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131217222847.GK28455-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 12/17/2013 03:28 PM, Mark Brown wrote:
> On Tue, Dec 17, 2013 at 03:20:35PM -0700, Stephen Warren wrote:
> 
>> The Tegra clocking architecture has a shared audio PLL that provides
>> clocks to the various IO controllers (I2S, AC'97, S/PDIF). In order to
>> allow multiple IO controllers to be in use at once, a single SW entity
>> has to manage the clocks, so that it can configure the audio PLL, rather
>> than having each individual IO controller attempt to assert ownership on
>> the shared resource. The centralized PLL management needs to switch the
>> PLL rate between 2 different values for 48-/44.1KHz-based audio for
>> example, and deny requests to switch if already-active audio is running
>> at the other rate.
> 
>> So yes, I think doing this all in the machine driver is the best thing.
> 
> How does doing this in the machine driver help here?  The machine driver
> isn't going to be any more coordinated with other machine drivers than
> the controller is.

There would only be one machine driver loaded at a time. It should
provide top-level control over all the audio paths in the Tegra audio
subsystem.
