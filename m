From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v6 08/10] ARM: dt: Add references to tegra_car clocks
Date: Wed, 13 Feb 2013 09:48:03 -0700
Message-ID: <511BC3C3.6070402@wwwdotorg.org>
References: <1360580700-10245-1-git-send-email-pdeschrijver@nvidia.com> <1360580700-10245-9-git-send-email-pdeschrijver@nvidia.com> <511A7AB5.4040607@wwwdotorg.org> <20130213113807.GE3073@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130213113807.GE3073-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 02/13/2013 04:38 AM, Peter De Schrijver wrote:
> On Tue, Feb 12, 2013 at 06:24:05PM +0100, Stephen Warren wrote:
>> On 02/11/2013 04:04 AM, Peter De Schrijver wrote:
>>> Add references to tegra_car clocks for the basic device nodes.
>>
>> In this patch, you also need to remove the "clock-frequency" properties
>> from tegra114-*.dts board files.
> 
> That would probably break bisectability no?

Oh right, I read the patch order backwards. You can fix this by moving
this patch to the end of the series.

> I think this needs to be done in a separate patch.

To avoid bisect issues, the clock-frequency property should be removed
in the same patch that adds the clocks property, or after it.

> Also, the UARTD enabling in init_table[] can then be removed.

You still need to initialize all the UART clocks in init_table[]. This
is required to make sure the clocks have the correct parent. Without
this explicit initialization, on Tegra30 at least, it was found that
UART C didn't work correctly for Bluetooth since the default parent was
something that wasn't generating the expected frequency.

Before removing the clock-frequency property, you also need to make sure
that init_table[] forces the UART clock on, otherwise since nothing will
clk_get()/enable() the UART clock, clk_disable_unused() will disable it.
After removing clock-frequency property, of_serial.c will
clk_get()/enable() the UART clock based on the clocks property, and
hence init_table[] doesn't need to force the UART clock on.
