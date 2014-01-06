From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Unhandled LM90 irq 308 on Dalmore?
Date: Mon, 06 Jan 2014 12:13:12 -0700
Message-ID: <52CB0048.5040304@wwwdotorg.org>
References: <52B2C5AD.5080405@nvidia.com> <20131219114500.1b1ea0b7@endymion.delvare> <alpine.DEB.2.02.1312191423090.30198@tamien> <52B3B679.20206@nvidia.com> <52B46FD2.1030409@wwwdotorg.org> <52B52B64.5020304@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52B52B64.5020304-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jean Delvare <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, LM Sensors <lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 12/20/2013 10:47 PM, Paul Walmsley wrote:
> 
> On 12/20/2013 08:26 AM, Stephen Warren wrote:
...
>> Note that upstream Linux *only* supports Dalmore A04, and no other
>> version. If you have a different board revision, it's not expected to
>> work with upstream. IIRC, Eric Brower volunteered to track down the
>> correct board revision for people working on upstream.
> 
> Indeed, that's probably the problem, then
> 
> It would be good if this was documented somewhere in the upstream kernel
> tree.

I'll send a patch to document that in the DTS file.

> And even better if the kernel was able to read the Dalmore EEPROM
> and print out a warning upon kernel boot...

That would be painful, since it'd be board-specific code that isn't
really coupled with a specific piece of HW for which there's a driver.
I'd rather avoid that kind of thing.
