From: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 4/6] usb: phy: tegra: Program new PHY parameters
Date: Fri, 2 Aug 2013 17:05:37 +0300
Message-ID: <51FBBCB1.9060906@nvidia.com>
References: <1375292522-7855-1-git-send-email-ttynkkynen@nvidia.com> <1375292522-7855-5-git-send-email-ttynkkynen@nvidia.com> <51FAD020.8090306@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51FAD020.8090306-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 08/02/2013 12:16 AM, Stephen Warren wrote:
> On 07/31/2013 11:42 AM, Tuomas Tynkkynen wrote:
>> The Tegra30 TRM recommends configuration of certain PHY parameters for
>> optimal quality. Program the following registers based on device tree
>> parameters:
>>
>> - UTMIP_XCVR_HSSLEW: HS slew rate control.
>> - UTMIP_HSSQUELCH_LEVEL: HS squelch detector level
>> - UTMIP_HSDISCON_LEVEL: HS disconnect detector level.
>>
>> These registers exist in Tegra20, but programming them hasn't been
>> necessary, so these parameters won't be set on Tegra20 to keep the
>> device trees backward compatible.
>>
>> Additionally, the UTMIP_XCVR_SETUP parameter can be set from fuses
>> instead of a software-programmed value, as the optimal value can
>> vary between invidual boards. The boolean property
>> nvidia,xcvr-setup-use-fuses can be used to enable this behaviour.
> 
>> diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c

> Those two chunks end up clearing some fields in the register now even on
> earlier chips, whereas before their values were maintained when doing
> the read/modify/write. Yet, the commit description says the new fields
> aren't changed on Tegra20. Do the changes above need to be guarded by if
> (requires_extra_tuning_parameters)?

Oops, you are right. I overlooked that some of those fields have non-zero reset values.
