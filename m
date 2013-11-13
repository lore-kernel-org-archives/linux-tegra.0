From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH RESEND] ARM: tegra: set regulator full constraints
Date: Wed, 13 Nov 2013 16:41:23 -0700
Message-ID: <52840E23.5080105@wwwdotorg.org>
References: <527A1C47.6050405@nvidia.com> <20131106110154.GG11602@sirena.org.uk> <5281C228.3000404@nvidia.com> <5282717C.3050502@wwwdotorg.org> <20131113122329.GC878@sirena.org.uk> <5283B6E3.9070206@wwwdotorg.org> <20131113190745.GD878@sirena.org.uk> <5283DD52.5050903@wwwdotorg.org> <20131113204923.GG878@sirena.org.uk> <5283F625.403@wwwdotorg.org> <20131113222953.GA26614@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131113222953.GA26614-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11/13/2013 03:29 PM, Mark Brown wrote:
> On Wed, Nov 13, 2013 at 02:59:01PM -0700, Stephen Warren wrote:
>> On 11/13/2013 01:49 PM, Mark Brown wrote:
> 
>>> No, with DT you can say that if there is no DT binding configuring
>>> a given thing (clock, regulator, GPIO or whatever) then no amount
>>> of module loading will ever cause it to appear - this is what the
>>> flag in question controls.
> 
>> But we do have a binding for regulators, so wouldn't that flag always
>> be true?
> 
> In theory.  In practice people often add bindings for devices without
> including the regulators and then someone comes along and adds the
> regulators later, perhaps not even using a system with DT, and renders
> all existing DTs buggy.  This is generally miserable for everyone so
> it's better if we're liberal in what we accept.

But that's a per-binding issue. Earlier, you wrote:

>> The only issue you may have to watch out for is: When is
>> regulator_init() called (i.e. when does core_initcall happen) relative
>> to when driver probe()s can be called? If it's earlier, then
>> core_initcall is early enough I suspect.
> 
> What I said was to set this up when we hand the DT over to the DT code
> to be parsed so that we don't need to worry about any gaps like that,
> it seems like a more direct solution than worrying about initcall
> ordering.

That sounds like a system-global flag, not a per-device/binding flag.
Has the conversation shifted topics? And indeed, I've been talking about
the system-global has_full_constraints flag all along here.

>> Perhaps you can suggest a name for the flag, and a specific set of
>> conditions when it will have specific values. That might help me
>> understand what you mean.
> 
> Well, of_have_populated_dt() is essentially doing the same thing
> (probably, I don't know if it's set at quite the right time) - it's
> saying we have a DT.  We could even change the users to check that as
> well if it's doing the right thing.

But the regulator code already calls of_have_populated_dt() in order to
determine whether to set has_full_constraints = true; The only issue is
that it does it too late. If of_have_populated_dt() is the flag that the
code should key off, what's wrong with the suggestion I made yesterday
to simply move the existing code (that uses of_have_populated_dt()) to
an earlier location?
