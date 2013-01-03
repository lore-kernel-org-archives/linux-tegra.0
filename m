From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 05/11] ARM: dt: tegra30: Add device node for APB MISC
Date: Thu, 03 Jan 2013 09:11:18 -0700
Message-ID: <50E5ADA6.1070904@wwwdotorg.org>
References: <1356619644-18565-1-git-send-email-pgaikwad@nvidia.com> <1356619644-18565-6-git-send-email-pgaikwad@nvidia.com> <50E4AE19.1060503@wwwdotorg.org> <50E520FC.4070805@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50E520FC.4070805-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 01/02/2013 11:11 PM, Prashant Gaikwad wrote:
> On Thursday 03 January 2013 03:30 AM, Stephen Warren wrote:
>> On 12/27/2012 07:47 AM, Prashant Gaikwad wrote:
>>> APB misc contains multiple registers required by different modules
>>> such as CAR.
>> I don't see a DT binding document that describes what
>> nvidia,tegra30-apbmisc means. Also, the register range for this new node
>> overlaps that for the pinmux node, so they can't both "request" their
>> register region. You may need multiple entries in the apbmisc reg
>> property to avoid this.
> 
> apbmisc reg for Tegra30 can be divided into following entries:
> 
> strap registers
> jtag configuration registers
> pull_up/pull_down control registers
> vclk control registers
> tvdac registers
> chip id revision registers
> pad control registers
> 
> This list is not same for Tegra20 and Tegra30.

OK. It sounds like we need a true APB MISC driver then, to abstract the
differences; the clock driver really shouldn't be touching the APB MISC
registers in all likelihood, unless a subset of the sections you mention
above are truly dedicated to clock functionality.

> OR
> 
> another way is to add chip id revision register region to CAR node as
> done for pinmux node and remove apb misc node.

The pinmux controller doesn't have a reg entry for the chip ID register.
I don't understand what you mean here.
