From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RFC v2 1/8] video: tegra: Add nvhost driver
Date: Mon, 03 Dec 2012 12:20:30 -0700
Message-ID: <50BCFB7E.4020007@wwwdotorg.org>
References: <1353935954-13763-1-git-send-email-tbergstrom@nvidia.com> <1353935954-13763-2-git-send-email-tbergstrom@nvidia.com> <20121128212301.GA25531@avionic-0098.adnet.avionic-design.de> <50B73710.2040102@nvidia.com> <20121129114704.GB6150@avionic-0098.adnet.avionic-design.de> <50B874C7.5030208@nvidia.com> <20121130103850.GA28367@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121130103850.GA28367-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11/30/2012 03:38 AM, Thierry Reding wrote:
> On Fri, Nov 30, 2012 at 10:56:39AM +0200, Terje Bergstr=C3=B6m wrote:
>> On 29.11.2012 13:47, Thierry Reding wrote:
>>> On Thu, Nov 29, 2012 at 12:21:04PM +0200, Terje Bergstr=C3=B6m
>>> wrote:
>>>> Tegra20 and Tegra30 are compatible, but future chips are not.
>>>> I was hoping we would be ready in upstream kernel for future
>>>> chips.
>>>=20
>>> I think we should ignore that problem for now. Generally
>>> planning for any possible combination of incompatibilities
>>> leads to overgeneralized designs that require precisely these
>>> kinds of indirections.
>>>=20
>>> Once some documentation for Tegra 40 materializes we can start
>>> thinking about how to encapsulate the incompatible code.
>>=20
>> I think here our perspectives differ a lot. That is natural
>> considering the company I work for and company you work for, so
>> let's try to sync the perspective.
>>=20
>> In my reality, whatever is in market is old news and I barely
>> work on them anymore. Upstreaming activity is the exception. 90%
>> of my time is spent dealing with future chips which I know cannot
>> be handled without this split to logical and physical driver
>> parts.
>>=20
>> For you, Tegra2 and Tegra3 are the reality.
>=20
> To be fair, Tegra2 and Tegra3 are the reality for *everyone*
> *outside* NVIDIA.
>=20
> It's great that you spend most of your time working with future
> chips, but unless you submit the code for inclusion or review
> nobody upstream needs to be concerned about the implications. Most
> people don't have time to waste so we naturally try to keep the
> maintenance burden to a minimum.
>=20
> The above implies that when you submit code it shouldn't contain
> pieces that prepare for possible future extensions which may or may
> not be submitted (the exception being if such changes are part of a
> series where subsequent patches actually use them). The outcome is
> that the amount of cruft in the mainline kernel is kept to a
> minimum. And that's a very good thing.

I think there's room for letting Terje's complete knowledge of future
chips guide the design of the current code that's sent upstream.
Certainly we shouldn't add a ton of unnecessary abstraction layers
right now that aren't needed for Tegra20/30, but if there's some
decision that doesn't affect the bloat, opaqueness, ... of the current
code but one choice is better for future development without serious
negatives for the current code, it's pretty reasonable to make that
decision rather than the other.

(That all said, I haven't really followed the details of this
particular point, so I can't say how my comment applies to any
decisions being made right now - just that we shouldn't blanket reject
future knowledge when making decisions)

After all, making the right decision now will reduce the number/size
of patches later, and hence reduce code churn and reviewer load.
