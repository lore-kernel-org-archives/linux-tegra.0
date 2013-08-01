From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 0/6] USB tree changes for Tegra30 and Tegra114 USB Host
 support
Date: Thu, 01 Aug 2013 10:22:19 -0600
Message-ID: <51FA8B3B.8070504@wwwdotorg.org>
References: <1375292522-7855-1-git-send-email-ttynkkynen@nvidia.com> <51F99C4C.6050508@wwwdotorg.org> <51FA5C5A.2080900@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51FA5C5A.2080900-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org" <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 08/01/2013 07:02 AM, Tuomas Tynkkynen wrote:
> On 08/01/2013 02:22 AM, Stephen Warren wrote:
>> On 07/31/2013 11:41 AM, Tuomas Tynkkynen wrote:
>>> Hi all,
>>>
>>> Here are the patches for the USB tree to enable USB Host support on Tegra30 and
>>> Tegra114. These are based on my and Mikko's cleanup patches that just got
>>> merged to Felipe's tree.
>>
>> This series works fine for me on Dalmore. However, on Beaver, I see the
>> following:
>>
>> [    2.428480] platform 7d008000.usb: Driver tegra-ehci requests probe
>> deferral
>>
>> ... which never seems to be resolved. You can take a look at my
>> linux-next_common branch to repro this. Does Beaver work for you?
>>
> 
> The clock driver patch is missing from your branch. Applying it should fix that.

Oh so it does. Sorry for forgetting about that patch. Given that, the
series,

Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

I'll also try to review/ack the patches ASAP.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
