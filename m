From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RFC PATCH 3/3] clk: tegra: Implement Tegra124 shared/cbus clks
Date: Thu, 15 May 2014 14:20:21 -0600
Message-ID: <53752185.3090608@wwwdotorg.org>
References: <1399990023-30318-1-git-send-email-pdeschrijver@nvidia.com> <1399990023-30318-4-git-send-email-pdeschrijver@nvidia.com> <53725FED.7050303@wwwdotorg.org> <20140514142739.GA8612@ulmo> <20140515105200.GI15168@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140515105200.GI15168-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 05/15/2014 04:52 AM, Peter De Schrijver wrote:
> On Wed, May 14, 2014 at 04:27:40PM +0200, Thierry Reding wrote:
>> * PGP Signed by an unknown key
>>
>> On Tue, May 13, 2014 at 12:09:49PM -0600, Stephen Warren wrote:
>>> On 05/13/2014 08:06 AM, Peter De Schrijver wrote:
>>>> Add shared and cbus clocks to the Tegra124 clock implementation.
>>>
>>>> diff --git a/include/dt-bindings/clock/tegra124-car.h b/include/dt-bindings/clock/tegra124-car.h
>>>
>>>> +#define TEGRA124_CLK_C2BUS 401
>>>> +#define TEGRA124_CLK_C3BUS 402
>>>> +#define TEGRA124_CLK_GR3D_CBUS 403
>>>> +#define TEGRA124_CLK_GR2D_CBUS 404
>>> ...
>>>
>>> I worry about this a bit. IIUC, these clocks don't actually exist in HW,
>>> but are more a way of SW applying policy to the clock that do exist in
>>> HW. As such, I'm not convinced it's a good idea to expose these clock
>>> IDS to DT, since DT is supposed to represent the HW, and not be
>>> influenced by internal SW implementation details.
>>>
>>> Do any DTs actually need to used these new clock IDs? I don't think we
>>> could actually use these value in e.g. tegra124.dtsi's clocks
>>> properties, since these clocks don't exist in HW. Was it your intent to
>>> do that? If not, can't we just define these SW-internal clock IDs in the
>>> header inside the Tegra clock driver, so the values are invisible to DT?
>>
>> I'm beginning to wonder if abusing clocks in this way is really the best
>> solution. From what I understand there are two problems here that are
>> mostly orthogonal though they're implemented using similar techniques.
>>
>> The reason for introducing cbus clocks are still unclear to me. From the
>> cover letter of this patch series it seems like these should be
>> completely hidden from drivers and as such they don't belong in device
>> tree. Also if they are an implementation detail, why are they even
>> implemented as clocks? Perhaps an example use-case would help illustrate
>> the need for this.
> 
> We don't have a PLL per engine, hence we have to use a PLL as parent for
> several module clocks. However you can't change a PLLs rate with
> active clients. So for scaling the PLL clocking eg. VIC or MSENC, you need to
> change their parent to a different PLL, change the original PLL rate and change
> the parent back to the original PLL, all while ensuring you never exceed the
> maximum allowed clock at the current voltage. You also want to take into
> account if a module is clocked so you don't bother handling clocks which are
> disabled. (eg. if only the VIC clock is enabled, there is no point in changing
> the MSENC parent). All this is handled by the 'cbus' clock.

Presumably though we can handle this "cbus" concept entirely inside the
clock driver.

What happens right now is that when a DT node references a clock, the
driver gets a clock and then manipulates it directly. What if the clock
core was reworked a bit such that every single clock was a "cbus" clock.
clk_get() wouldn't return the raw clock object itself, but rather a
"clock client" object, which would forward requests on to the underlying
clk. If there's only 1 clk_get(), there's only 1 client, so all requests
get forwarded automatically. If there are n clk_get_requests(), the
clock object gets to implement the appropriate voting/... algorithm to
mediate the requests.

That way, we don't have to expose any of this logic in the device tree,
or hopefully/mostly even outside the HW clock's implementation.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
