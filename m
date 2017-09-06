From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 3/8] usb: chipidea: Add support for Tegra20/30/114/124
Date: Wed, 6 Sep 2017 19:36:50 +0300
Message-ID: <4e4d003e-c60e-43b1-6eee-0cd574a1862f@gmail.com>
References: <cover.1502879077.git.digetx@gmail.com>
 <2b091105e45234dca93051862e76e711acf482cc.1502879078.git.digetx@gmail.com>
 <d62d98ec-ef73-7bb2-720f-82155871613a@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d62d98ec-ef73-7bb2-720f-82155871613a-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Peter Chen <Peter.Chen-3arQi8VN3Tc@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06.09.2017 16:21, Jon Hunter wrote:
> 
> On 16/08/17 11:32, Dmitry Osipenko wrote:
>> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> All of these Tegra SoC generations have a ChipIdea UDC IP block that can
>> be used for device mode communication with a host. Implement rudimentary
>> support that doesn't allow switching between host and device modes.
>>
>> Tested-by: Michał Mirosław <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
>> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> [digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org: rebased patches and added DMA alignment quirk for Tegra20]
>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Acked-by: Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>
> 
> Currently, I am seeing that system suspend on Tegra30/114/124 is broken
> on -next (looks like it broke starting with next-20170823). Bisect shows
> that is broke with this series and reverting this patch of top of tree
> does workaround the problem.
> 
> Looking a bit deeper, it appears that the boards are hanging when the
> set_phcd() function is called in the tegra phy driver to disable the phy
> clock. This function is called by usb_phy_set_suspend() in the chipidea
> driver.

As been discussed on IRC, this issue is caused by entering LPM twice: first time
ChipIdea driver enters LPM and then Tegra's PHY does it too, touching registers
that seems shouldn't be touched after entering LPM. As Thierry suggested, one
possible and quick solution is to *not* set udc->data.usb_phy for Tegra30+.

-- 
Dmitry
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
