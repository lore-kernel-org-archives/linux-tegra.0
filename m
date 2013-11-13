From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH RESEND] ARM: tegra: set regulator full constraints
Date: Wed, 13 Nov 2013 14:59:01 -0700
Message-ID: <5283F625.403@wwwdotorg.org>
References: <5278B4CB.9050305@nvidia.com> <20131106085100.GB11602@sirena.org.uk> <527A1C47.6050405@nvidia.com> <20131106110154.GG11602@sirena.org.uk> <5281C228.3000404@nvidia.com> <5282717C.3050502@wwwdotorg.org> <20131113122329.GC878@sirena.org.uk> <5283B6E3.9070206@wwwdotorg.org> <20131113190745.GD878@sirena.org.uk> <5283DD52.5050903@wwwdotorg.org> <20131113204923.GG878@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131113204923.GG878-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11/13/2013 01:49 PM, Mark Brown wrote:
> On Wed, Nov 13, 2013 at 01:13:06PM -0700, Stephen Warren wrote:
>> On 11/13/2013 12:07 PM, Mark Brown wrote:
> 
>>> This isn't really regulator specific - it's something that
>>> applies in general to things implementing deferred probing - so
>>> we ought to have a generic "we know if devices can appear later
>>> or not" flag that subsystems can check.
> 
>> I guess I misunderstand then, since given that modules exist,
>> wouldn't that flag always be true?
> 
> No, with DT you can say that if there is no DT binding configuring
> a given thing (clock, regulator, GPIO or whatever) then no amount
> of module loading will ever cause it to appear - this is what the
> flag in question controls.

But we do have a binding for regulators, so wouldn't that flag always
be true?

Perhaps you can suggest a name for the flag, and a specific set of
conditions when it will have specific values. That might help me
understand what you mean.

Are you confusing having a binding (schema definition) with having DT
content ("foo-supply" property)?
