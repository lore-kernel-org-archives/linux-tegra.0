From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Conflicts between Tegra PWM tree and common clock patches
Date: Mon, 02 Jul 2012 13:38:04 -0600
Message-ID: <4FF1F89C.20907@wwwdotorg.org>
References: <4FF1DBC8.2000406@wwwdotorg.org> <20120702192454.GA1299@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120702192454.GA1299-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ARM kernel mailing list <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 07/02/2012 01:24 PM, Thierry Reding wrote:
> On Mon, Jul 02, 2012 at 11:35:04AM -0600, Stephen Warren wrote:
>> Thierry,
>> 
>> The following commits in your PWM tree conflict with some Tegra
>> clock driver re-structuring that's part of the common clock
>> conversion on Tegra.
>> 
>> df6da47 ARM: tegra: Provide clock for only one PWM controller 
>> 65e7385 ARM: tegra: Fix PWM clock programming
>> 
>> To alleviate this, could we either:
>> 
>> a) Remove those two commits from your tree and into the Tegra
>> tree. I think this won't cause any runtime issues, since Tegra
>> PWM is a feature we aren't using yet, so it's OK if the branch
>> it's made to work in is not the PWM branch.
>> 
>> b) If your branch is stable, I can merge it into the Tegra tree
>> in order to resolve the conflicts there. However, for this to
>> work, you need to 100% guarantee that the branch won't be rebased
>> between now and when you send Linus a pull request for 3.6.
> 
> I'd very much prefer a). Both patches touch only Tegra code anyway
> so there's no harm to take them through the Tegra tree. Both
> patches are also not dependent on the PWM framework in any way.

OK, I'll pick the patches into the Tegra tree as soon as fetching your
repo shows they aren't there.

Thanks!
