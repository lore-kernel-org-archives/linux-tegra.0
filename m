From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH RESEND] ARM: tegra: set regulator full constraints
Date: Wed, 13 Nov 2013 13:13:06 -0700
Message-ID: <5283DD52.5050903@wwwdotorg.org>
References: <527737C5.5080901@nvidia.com> <20131104161828.GK2493@sirena.org.uk> <5278B4CB.9050305@nvidia.com> <20131106085100.GB11602@sirena.org.uk> <527A1C47.6050405@nvidia.com> <20131106110154.GG11602@sirena.org.uk> <5281C228.3000404@nvidia.com> <5282717C.3050502@wwwdotorg.org> <20131113122329.GC878@sirena.org.uk> <5283B6E3.9070206@wwwdotorg.org> <20131113190745.GD878@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131113190745.GD878-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11/13/2013 12:07 PM, Mark Brown wrote:
> On Wed, Nov 13, 2013 at 10:29:07AM -0700, Stephen Warren wrote:
> 
>> It seems slightly odd to tightly link the drivers/of and 
>> drivers/regulator code like that, but I guess with the
>> appropriate ifdefs it'll work out OK.
> 
> This isn't really regulator specific - it's something that applies
> in general to things implementing deferred probing - so we ought to
> have a generic "we know if devices can appear later or not" flag
> that subsystems can check.

I guess I misunderstand then, since given that modules exist, wouldn't
that flag always be true?

IIUC, the issue being discussed here isn't about deferred probe at
all. You always must defer probe if an object is specified as existing
yet the provider isn't available yet. The issue here is when a
regulator isn't specified as existing, yet something asks for that
regulator, should the regulator subsystem automatically provide a
dummy regulator instead, rather than erroring out.
